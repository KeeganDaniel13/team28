using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using CiroService.EFDatabase;
using CiroService.DAL;
using System.Windows.Forms;
using Newtonsoft.Json;
using CiroService.JsonObjects;
using System.Web.Http;
using System.Web;
using PayPal;
using MessagingToolkit.QRCode;
using MessagingToolkit.QRCode.Codec;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using PayPal.Api;
using PayPal.PayPalAPIInterfaceService;
using PayPal.PayPalAPIInterfaceService.Model;

namespace CiroService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {

        public string GetData()
        {
            var userAccess = new userController();
            List<UserDemo> users = new List<UserDemo>();
            List<user> userTable = userAccess.getTable().ToList<user>();
            foreach (user u in userTable)
            {
                users.Add(new UserDemo
                {
                    id = u.user_id,
                    Name = u.user_fname

                });
            }
            return JsonConvert.SerializeObject(users);
        }
    
        public JsonUser login(jsonLoginUser login)
        {
            var userAccess = new userController();
            IEnumerable<user> users = userAccess.getTable();
            var user = users.FirstOrDefault<user>(c => (c.user_fname.Equals(login.name) || c.user_email.Equals(login.name) ) && c.user_password.Equals(login.password));
            if (user == null)
            {
                return null ;
            }
            JsonUser inUser = new JsonUser();
            inUser.id = user.user_id;
            inUser.fname = user.user_fname;
            inUser.lname = user.user_sname;
            inUser.email = user.user_email;
            inUser.usertype = user.usertype_id;
            inUser.usertypename = user.usertype.usertype_name;
            return inUser;
        }

        //send all products that come from the bill of entry
        public IEnumerable<jsonProduct> clientProducts(JsonUser user)
        {
            var productsTable = new productController();
            var billtable = new billofentryController();
            
            List<billofentry> products = billtable.getTable().Where<billofentry>(p => p.billofentry_user == Convert.ToInt32(user.id)).ToList<billofentry>();
            if(products.Count == 0)
            {
                return null;
            }
            List<jsonProduct> sendProducts = new List<jsonProduct>();
            foreach (billofentry p in products)
            {
                sendProducts.Add(new jsonProduct { ID = p.product.product_id,Name = p.product.product_name,value = Convert.ToDecimal( p.product.product_price ),bill = p.billofentry_code, arrivalDate = Convert.ToDateTime(p.product.product_arrivalDate), quantity = Convert.ToInt32(p.product.product_quantity), currentLocation = p.product.product_location, size = Convert.ToInt32(p.product.product_size) });
            }
            return sendProducts;
        }

        public string register(JsonUser regUser)
        {

            var userstable = new userController();
            
            var check = userstable.getTable().FirstOrDefault<user>(c => c.user_email.Equals(regUser.email));
            
            if (check != null)
            {
                return "Email Already Registered";
            }
            
            user newUser = new user { user_fname = regUser.fname, user_email = regUser.email, user_sname = regUser.lname, user_password = regUser.password, usertype_id = 1, user_id = userstable.getTable().Count() };
    
            userstable.addRecord(newUser);
                     //emailTest email = new emailTest(newUser.user_fname + " " + newUser.user_sname, newUser.user_email, "Hello " + newUser.user_fname + ", Welcome to Ciro. You are now a member of our family, Enjoy!", "Registered to Ciro Solutions");
            return "Registered";
        }

        public string transeferRequest(jsonTRequest newRequest)
        {
            //Fix
            transferrequestsController trans = new transferrequestsController();
            transferrequest newTransfer = new transferrequest();
            warehousestockController stockTable = new warehousestockController();
            warehousestock warehouseID = stockTable.getTable().First<warehousestock>(c => c.warehousestock_product == newRequest.productID);
            warehouseController warehouseTable = new warehouseController();
            warehouse warehouseName = warehouseTable.getTable().First<warehouse>(c => c.warehouse_id == warehouseID.warehousestock_warehouse);

            newTransfer.transferrequest_verdict = "Pending";
            newTransfer.transferrequest_user = newRequest.userID;
            newTransfer.transferrequest_product = newRequest.productID;
            newTransfer.transferrequest_to = newRequest.endWarehouse;
            newTransfer.transferrequest_from =warehouseName.warehouse_location;
           // DateTime date = new DateTime();
           // newTransfer.= date.Year + date.Month + date.Day + newRequest.userID +newRequest.productID;
            trans.addRecord(newTransfer);
            return "Added";
        }

        public IEnumerable<TransferDetails> transferList()
        {
            transferlistController list = new transferlistController();
            List<TransferDetails> transferList = new List<TransferDetails>();
            var tempList = list.getTable();

            foreach(transferlist t in tempList)
            {
                var productAccess = new productController();
                var productExists = productAccess.getTable().FirstOrDefault<product>(p => p.product_id == t.transferlist_product);

                if(productExists == null)
                {
                    return null;
                }

                transferList.Add(new TransferDetails { productName = productExists.product_name ,currentLocation=t.transferlist_from,destination=t.transferlist_to});
            }
             return transferList;
            
        }
        
        //Add Method to update table of stock take 
        //Needs Test
        public string stockTake(stockTakeInfo stockTake)
        {

            //if item is on the tansferlist add it to the warehouse
            string message = "Failed";
            transferlistController tlistAccess = new transferlistController();
            var inList = tlistAccess.getTable().First<transferlist>(c => c.transferlist_product == stockTake.id);
            var productTable = new productController();
            var stockTable = new warehousestockController();
            var warehouseTable = new warehouseController();
            if (inList != null)
            {
                stockTable.addRecord(new warehousestock { warehousestock_product= stockTake.id, warehousestock_warehouse = warehouseTable.getTable().First<warehouse>(c => c.warehouse_location.Equals(stockTake.location)).warehouse_id, warehousestock_lastchecked = DateTime.Now });
                tlistAccess.deleteRecord(inList.transferlist_id);
                message = "Stock Recorded";

            }
            else
            {

                //needs imp for release request,transfer request denail/pending and/or approvement 
                //transfer request up
                var tRequestTable = new transferrequestsController();
                var tRequest = tRequestTable.getTable().First<transferrequest>(c => c.transferrequest_product == stockTake.id);
                var rRequestTable = new releaseRequestController();
                var rRequest = rRequestTable.getTable().First<releaserequest>(c => c.releaserequest_product == stockTake.id);
                if (tRequest != null && tRequest.transferrequest_verdict.Equals("Approved"))
                {
                    //add user that approved transfer
                    tlistAccess.addRecord(new transferlist { transferlist_product = stockTake.id, transferlist_from = stockTake.location, transferlist_to = tRequest.transferrequest_to });
                    tRequestTable.deleteRecord(tRequest.transferrequest_id);
                    stockTable.deleteRecord(stockTable.getTable().First<warehousestock>(c => c.warehousestock_product == stockTake.id).warehousestock_id);
                    message = "Move Item to loading dock for Transfer";
                }
                else if (rRequest != null && rRequest.releaserequest_verdict.Equals("Approved"))
                {
                    //add user that approved release
                    //add location_to for release request
                    tlistAccess.addRecord(new transferlist { transferlist_product = stockTake.id, transferlist_from = stockTake.location, transferlist_to = "owner "});
                    rRequestTable.deleteRecord(rRequest.releaserequest_id);
                    stockTable.deleteRecord(stockTable.getTable().First<warehousestock>(c => c.warehousestock_product == stockTake.id).warehousestock_id);
                    message = "Move Item to loading dock for Release";
                }
                else if (rRequest != null && rRequest.releaserequest_verdict.Equals("Declined"))
                {
                    rRequestTable.deleteRecord(rRequest.releaserequest_id);
                    var stock = stockTable.getTable().First<warehousestock>(c => c.warehousestock_product == stockTake.id);
                    stock.warehousestock_lastchecked = DateTime.Now;
                    stockTable.updateRecord(stock.warehousestock_id, stock);
                    message = "Stock updated";
                }
                else if (tRequest != null && tRequest.transferrequest_verdict.Equals("Declined"))
                {
                    tRequestTable.deleteRecord(tRequest.transferrequest_id);
                    var stock = stockTable.getTable().First<warehousestock>(c => c.warehousestock_product == stockTake.id);
                    stock.warehousestock_lastchecked = DateTime.Now;
                    stockTable.updateRecord(stock.warehousestock_id, stock);
                    message = "Stock updated";
                }
                else
                {
                    var stock = stockTable.getTable().First<warehousestock>(c => c.warehousestock_product == stockTake.id);
                    stock.warehousestock_lastchecked = DateTime.Now;
                    stockTable.updateRecord(stock.warehousestock_id, stock);
                    message = "Stock updated";
                }

            }
            return message;
        }

        //Make sure to generate qrcode for specfic product
        //Just double check with boolean
        //needs test with single and multiple produts varying of duty and non duty produts
        public void stockAdd(string origin, IEnumerable<jsonProduct> newProduct)
        {
            //Check if we have relation with country
            countryrelationController countryAccess = new countryrelationController();
            producttypeController pTypeAccess = new producttypeController();
            countryrelation country = null;
            try
            {
                country = countryAccess.getTable().FirstOrDefault<countryrelation>(c => c.countryrelation_name.ToLower().Equals(origin.ToLower()));
            }
            catch (ArgumentNullException x)
            { }
                
            
            
            int hscode,producttype;
            //add to table with hscode
            if(country != null)
            {
                //duty
                hscode = 1;
                producttype = 1;
            }
            else
            {
                //non duty
                hscode = 0;
                producttype = 2;
            }
            productController productAccess = new productController();
            billofentryController billAccess = new billofentryController();
            DateTime date = DateTime.Now;
            string origin2 = origin;
            string genCode = ""+hscode + date.Day  + date.Second + origin2.Substring(0,2);
            foreach (var p in newProduct)
            {
                
          
                //add products to product table
                productAccess.addRecord(new product { product_name=p.Name,product_size=p.size,product_quantity=p.quantity,product_price=p.value,product_location="In Transit",product_arrivalDate=date,product_hscode=hscode,product_producttype=producttype});
                //adding new product with bill of entry
                
                product addToBill = productAccess.getTable().First(c => c.product_name.Equals(p.Name) && c.product_hscode == hscode && c.product_arrivalDate==date);
                billAccess.addRecord(new billofentry {billofentry_origin=origin,billofentry_product=addToBill.product_id,billofentry_user=p.userID,billofentry_code=genCode });

                //add to transferlist
                transferlistController transferListkAccess = new transferlistController();
                transferListkAccess.addRecord(new transferlist { transferlist_to=p.transferLocation,transferlist_product=addToBill.product_id,transferlist_from=p.currentLocation});

                //create qrcode
                string path = "C:\\Users\\Tshenolo\\team28\\CiroService\\CiroService\\images\\";
                string qrcodeInfo = addToBill.product_id + "";
                QRCodeEncoder qrcodeMaker = new QRCodeEncoder();
                qrcodeMaker.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.H;
                qrcodeMaker.QRCodeScale = 10;

                Bitmap qrcode = qrcodeMaker.Encode(qrcodeInfo);
                qrcode.Save(path + qrcodeInfo+".jpg", ImageFormat.Jpeg);
            }


        }

        //need implemantation
        //Not Important Yet
        //displays all warehosue managers tasks for the day
        public IEnumerable<jsonTask> taskList(string id)
        {
            return null;
        }

        //Test With Andriod Streaming
        //Add Image upload imp
        public void addIncident(jsonIncident newIncident)
        {
            //Removed Image adding will implemement at a later stage once system is more cohisive
            productlogController incidentTable = new productlogController();
            IEnumerable<productlog> incidents = incidentTable.getTable();
            if(newIncident.image == null || newIncident.image.Equals(""))
            {
                incidentTable.addRecord(new productlog { productlog_type = newIncident.type, productlog_dateLogged = DateTime.Now, productlog_product = newIncident.productID, productlog_image = "",  productlog_dscription = newIncident.description, productlog_id = incidents.Count(),productlog_user= newIncident.userID });
            }
            else
            {   
                string path = "C:\\Users\\Tshenolo\\team28\\CiroService\\CiroService\\images\\incidents\\";
                byte[] newImage = Convert.FromBase64String(newIncident.image);
                MemoryStream memoStream = new MemoryStream(newImage, 0, newImage.Length);
                memoStream.Write(newImage,0,newImage.Length);
                string fileName = path + newIncident.productID + ".jpg";
                System.Drawing.Image saveImage = System.Drawing.Image.FromStream(memoStream);
                saveImage.Save(fileName);

                incidentTable.addRecord(new productlog {productlog_dateLogged = DateTime.Now, productlog_type = newIncident.type, productlog_product = newIncident.productID, productlog_image = fileName, productlog_dscription = newIncident.description , productlog_id = incidents.Count(), productlog_user = newIncident.userID });
            }
            return;
        }

        //return all warehpuse info for that specific warehouse
        public JsonWarehouse warehouseInfo(string id)
        {
            var warehouse = new warehouseController().getRecord(Convert.ToInt32(id));
            var warehouseType = new warehousetypeController().getRecord(Convert.ToInt32(warehouse.warehouse_warehousetype)).warehousetype_name;
            return new JsonWarehouse { id = warehouse.warehouse_id, location = warehouse.warehouse_location, name = warehouse.warehouse_name, size = Convert.ToInt32(warehouse.warehouse_size) };
        }

        //return list of warehouses
        public IEnumerable<JsonWarehouse> warehouses()
        {
            var warehouses = new warehouseController().getTable();
            List<JsonWarehouse> warehouseList = new List<JsonWarehouse>();
            foreach(var warehouse in warehouses)
            {
                var warehouseType = new warehousetypeController().getRecord(Convert.ToInt32(warehouse.warehouse_warehousetype)).warehousetype_name;
                warehouseList.Add(new JsonWarehouse { id = warehouse.warehouse_id, location = warehouse.warehouse_location, name = warehouse.warehouse_name, size = Convert.ToInt32(warehouse.warehouse_size)});
            }

            return warehouseList;
        }

        //needs implementation
        //get a list of stock scheduled for leaveing
        public IEnumerable<transferStock> stockleavingWarehouse(string location)
        {
            var transferlistAccess = new transferlistController();
            List<transferStock> items = new List<transferStock>();
            var list = transferlistAccess.getTable().Where(c => c.transferlist_from.Equals(location) || c.transferlist_to.Equals(location));
            if(list != null)
            {
                foreach(var t in list)
                {
                    if(t.transferlist_from.Equals(location))
                    { 
                        items.Add(new transferStock { productName= t.product.product_name,status="IN",location=t.transferlist_from,size=Convert.ToInt32(t.product.product_size),value=Convert.ToDecimal(t.product.product_price)});
                    }
                    else
                    { 
                        items.Add(new transferStock { productName = t.product.product_name, status = "OUT", location = t.transferlist_to, size = Convert.ToInt32(t.product.product_size), value = Convert.ToDecimal(t.product.product_price) });
                    }
                }
            }
            return items;
        }

        public string updateUser(string id, JsonUser updateUsr)
        {
            var userAccess = new userController();
            var userExists = userAccess.getTable().FirstOrDefault<user>(c => c.user_id == Convert.ToInt32(id));

            if(userExists == null)
            {
                return "User does not exist";
            }

            if (updateUsr.fname != null && updateUsr.fname != "")
            {
                userExists.user_fname = updateUsr.fname;
            }
            if(updateUsr.lname != null && updateUsr.lname != "")
            {
                userExists.user_sname = updateUsr.lname;
            }
            if(updateUsr.email != null && updateUsr.email != "")
            {
                userExists.user_email = updateUsr.email;
            }
            if(updateUsr.password != null && updateUsr.password != "")
            { 
                userExists.user_password = updateUsr.password;
            }
            userAccess.updateRecord(Convert.ToInt32(id), userExists);
            return "Updated";
        }

        public JsonProducts getPackageID(string id)
        {
            var package = new JsonObjects.JsonProducts();
            var getPackage = new productController();
            var detailPackage = getPackage.getRecord(Convert.ToInt32(id));
            if(detailPackage == null)
            {
                return null;
            }

            package.id = detailPackage.product_id;
            package.name = detailPackage.product_name;
            package.price = Convert.ToDouble(detailPackage.product_price);
            package.producttype = Convert.ToInt32(detailPackage.product_producttype);
            package.quantity = Convert.ToInt32(detailPackage.product_quantity);
            package.location = detailPackage.product_location;
            package.arrivalDate = Convert.ToDateTime(detailPackage.product_arrivalDate);
            return package;
        }

        public IEnumerable<JsonProducts> getPackageOwner(string id)
        {
            var billentryTable = new billofentryController();
            var productsTable = new productController();
            List<billofentry> entries = billentryTable.getTable().Where<billofentry>(c => c.billofentry_user == Convert.ToInt32(id)).ToList<billofentry>();
            
            if(entries.Count == 0)
            {
                return null;
            }

            List<product> products = new List<product>();

            foreach(billofentry e in entries)
            {
                products.Add(productsTable.getRecord(Convert.ToInt32(e.billofentry_product)));
            }
            
            List<JsonProducts> sendProducts = new List<JsonProducts>();
            foreach (product p in products)
            {
                sendProducts.Add(new JsonProducts { id = p.product_id, name = p.product_name, price = Convert.ToDouble(p.product_price), quantity = Convert.ToInt32(p.product_quantity), producttype = Convert.ToInt32(p.product_producttype), location = p.product_location, arrivalDate = Convert.ToDateTime(p.product_arrivalDate)});
            }
            return sendProducts;
        }

        public IEnumerable<JsonProducts> getPackageType(string type)
        {
            var productsTable = new productController();

            List<product> products = productsTable.getTable().Where<product>(p => p.product_producttype == Convert.ToInt32(type)).ToList<product>();
            if (products.Count == 0)
            {
                return null;
            }
            List<JsonProducts> sendProducts = new List<JsonProducts>();
            foreach (product p in products)
            {
                sendProducts.Add(new JsonProducts { id = p.product_id, name = p.product_name, price = Convert.ToDouble(p.product_price), quantity = Convert.ToInt32(p.product_quantity), producttype = Convert.ToInt32(p.product_producttype), location = p.product_location, arrivalDate = Convert.ToDateTime(p.product_arrivalDate)});
            }
            return sendProducts;
        }

        public string getPackageDate(string date)
        {
            throw new NotImplementedException();
        }

        public string getPackageDest(string dest)
        {
            throw new NotImplementedException();
        }

        public string getPackageLocation(string location)
        {
            throw new NotImplementedException();
        }

        public string addPackage(JsonProducts prod)
        {
            var productAccess = new productController();
            product pro = new product { product_name = prod.name, product_price = Convert.ToDecimal(prod.price), product_hscode = Convert.ToInt32(prod.hscode), product_size = Convert.ToInt32(prod.size), product_id = prod.id, product_quantity = prod.quantity, product_producttype = prod.producttype, product_location = prod.location, product_arrivalDate = prod.arrivalDate};
            productAccess.addRecord(pro);
            return "Package added.";
        }

        public string updatePackage(string id, JsonProducts prod)
        {
            var productAccess = new productController();
            var productExists = productAccess.getTable().FirstOrDefault<product>(c => c.product_id == Convert.ToInt32(id));

            if (productExists == null)
            {
                return "Package does not exist";
            }
            MessageBox.Show("Package exists check completed.", "Checklist", MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);

            if (prod.name != null && prod.name != "")
            {
                productExists.product_name = prod.name;
            }
            if (prod.price != 0)
            {
                productExists.product_price = Convert.ToDecimal(prod.price);
            }
            if (prod.quantity != 0)
            {
                productExists.product_quantity = prod.quantity;
            }
            if (prod.producttype != 0)
            {
                productExists.product_producttype = prod.producttype;
            }
            if (prod.location != null && prod.location != "")
            {
                productExists.product_location = prod.location;
            }
            if (prod.arrivalDate != null)
            {
                productExists.product_arrivalDate = prod.arrivalDate;
            }
            productAccess.updateRecord(Convert.ToInt32(id), productExists);
            return "Updated";
        }

        public string updatePackageWLocation(string id, string location)
        {
           /* var productAccess = new warehousestockController();
            var productExists = productAccess.getTable().FirstOrDefault<warehousestock>(c => c.warehousestock_id == Convert.ToInt32(id));

            if (productExists == null)
            {
                return "Package does not exist";
            }

            productExists.warehousestock_location = location;
            productAccess.updateRecord(Convert.ToInt32(id), productExists);*/
            return "Package location has been updated.";           
        }

        public string releaseRequest(JsonUser owner, jsonProduct product, string description)
        {
            var productAccess = new billofentryController();
            var productExists = productAccess.getTable().FirstOrDefault<billofentry>(c => c.billofentry_product == Convert.ToInt32(product.ID) && c.billofentry_user == Convert.ToInt32(owner.id));

            if(productExists == null)
            {
                return "No such package is Owned by user";
            }

            var request = new releaseRequestController();
            var requestExists = request.getTable().FirstOrDefault<releaserequest>(c => c.releaserequest_product == Convert.ToInt32(product.ID) && c.releaserequest_user == Convert.ToInt32(owner.id));

            if(requestExists == null)
            {
                request.addRecord(new releaserequest {releaserequest_verdict="Pending", releaserequest_product = Convert.ToInt32(product.ID), releaserequest_user = Convert.ToInt32(owner.id)});
                return "Request has been uploaded.";
            }
            else
            {
                return "Request has already been made.";
            }
        }

        public IEnumerable<JsonReleaseRequest> getRelease(JsonUser user)
        {
            var requestAccess = new releaseRequestController();
            List<releaserequest> requestExists = requestAccess.getTable().Where<releaserequest>(c => c.releaserequest_user == Convert.ToInt32(user.id)).ToList<releaserequest>();

            if (requestExists.Count() == 0)
            {
                return null;
            }

            List<JsonReleaseRequest> releaseRequestList = new List<JsonReleaseRequest>();
            foreach (releaserequest rq in requestExists)
            {
                releaseRequestList.Add(new JsonReleaseRequest  { user_id = Convert.ToInt32(rq.releaserequest_user), product_id = Convert.ToInt32(rq.releaserequest_product), verdict = rq.releaserequest_verdict});
            }

            return releaseRequestList;
        }

        //add changes for image
        public string addProductLog(string code, JsonProductLog productlog, JsonProducts prod)
        {
            var billAccess = new billofentryController();
            var billExists = billAccess.getTable().FirstOrDefault<billofentry>(c => c.billofentry_product == prod.id);
            if(billExists == null)
            {
                return "Product not found";
            }
            var userAccess = new userController();
            var userExists = userAccess.getTable().FirstOrDefault<user>(c => c.user_id == billExists.billofentry_user);
            var productlogAccess = new productlogController();
            productlog log = new productlog();
            DateTime date = DateTime.Now;
            log.productlog_dateLogged = date;
            log.productlog_product = Convert.ToInt32(billExists.billofentry_product);
            log.productlog_dateLogged = DateTime.Now;
            log.productlog_user = productlog.userID;
            if(code == "I9")
            {

                log.productlog_dscription = "Incident (@ " + DateTime.Now + "): " + productlog.description;
                log.productlog_type = 1;
                addIncident(new jsonIncident { productID = Convert.ToInt32(log.productlog_product), type = Convert.ToInt32(log.productlog_type), userID = Convert.ToInt32(log.productlog_user), description = log.productlog_dscription });
                //productlogAccess.addRecord(log);
                //emailTest email = new emailTest(userExists.user_fname + " " + userExists.user_sname, userExists.user_email, "We at Ciro would like to inform you about your package. The following log as been updated on the state of your package:" + System.Environment.NewLine + System.Environment.NewLine + log.productlog_dscription, "An Updated Log on your Package");
                return "I9 report added to log";
            }
            else if (code == "TR7")
            {
                log.productlog_dscription = "Transfer Request (@ " + DateTime.Now + "): " + productlog.description;
                log.productlog_type = 2;
                productlogAccess.addRecord(log);
                return "TR7 report added to log";
            }
            else if (code == "RR6")
            {

                log.productlog_dscription = "Release Request (@ " + DateTime.Now + "): " + productlog.description;
                log.productlog_type = 3;
                productlogAccess.addRecord(log);
                return "RR6 report added to log";
            }
            else if (code == "T2")
            {

                log.productlog_dscription = "Transfer (@ " + DateTime.Now + "): " + productlog.description;
                log.productlog_type = 4;
                productlogAccess.addRecord(log);
                return "T2 report added to log";
            }
            else if (code == "D3")
            {
                log.productlog_dscription = "Delivered (@ " + DateTime.Now + "): " + productlog.description;
                log.productlog_type = 5;
                productlogAccess.addRecord(log);
                //emailTest email = new emailTest(userExists.user_fname + " " + userExists.user_sname, userExists.user_email, "We at Ciro would like to inform you about your package. The following log as been updated on the state of your package:" + System.Environment.NewLine + System.Environment.NewLine + log.productlog_dscription, "Delivery of Package");
                return "D3 report added to log";
            }
            else
            {
                return "No such code";
            }
        }

        public IEnumerable<JsonProductLog> getProductLog(jsonProduct product)
        {
            var logAccess = new productlogController();
            IEnumerable<productlog> logExists = null;
            try
            {
                logExists = logAccess.getTable().Where(c =>c.productlog_product==product.ID);
            }
            catch (Exception x)
            { }
            

            if (logExists == null)
            {
                return null;
            }

            List<JsonProductLog> productLogList = new List<JsonProductLog>();
            foreach (productlog log in logExists)
            {
                MessageBox.Show(log.productlog_dateLogged.ToString());
                productLogList.Add(new JsonProductLog { product_id = Convert.ToInt32(log.productlog_product), description = log.productlog_dscription,date=DateTime.Parse(log.productlog_dateLogged.ToString())});
            }
            productLogList.OrderByDescending(c => c.date);
            return productLogList;
        }

        public IEnumerable<JsonWarehouse> getWarehouse()
        {
            var warehouseAccess = new warehouseController();
            List<warehouse> warehouseExists = warehouseAccess.getTable().ToList<warehouse>();

            if(warehouseExists.Count() == 0)
            {
                return null;
            }

            double total = 0;
            List<JsonWarehouse> warehouseList = new List<JsonWarehouse>();
            foreach(warehouse warehouses in warehouseExists)
            {
                IEnumerable<JsonInventory> warehouseStock = new List<JsonInventory>();
                warehouseStock = getWarehouseInventory(new JsonWarehouse { name = warehouses.warehouse_name });
                total = 0;
                foreach(JsonInventory s in warehouseStock)
                {
                    total += s.size;
                }
                int warehouseSize = Convert.ToInt32(warehouses.warehouse_size);
                double availabilityW = total / Convert.ToDouble(warehouseSize)*100;
                MessageBox.Show(""+availabilityW);
                warehouseList.Add(new JsonWarehouse { id = warehouses.warehouse_id, name = warehouses.warehouse_name, location = warehouses.warehouse_location, size = Convert.ToInt32(warehouses.warehouse_size), warehousetype = Convert.ToInt32(warehouses.warehouse_warehousetype),available=availabilityW ,user = Convert.ToInt32(warehouses.warehouse_user)});
            }
            return warehouseList;
        }

        public string approveTransfer(jsonProduct product, string verdict)
        {
            var requestAccess = new transferrequestsController();
            var requestExists = requestAccess.getTable().FirstOrDefault<transferrequest>(c => c.transferrequest_product == Convert.ToInt32(product.ID));

            if (requestExists == null)
            {
                return "No request found for this package";
            }

            requestExists.transferrequest_verdict = verdict;
            requestAccess.updateRecord(Convert.ToInt32(requestExists.transferrequest_id), requestExists);
            var result = "Transfer Request has been " + verdict;
            return result;
        }

        public string approveRequest(string verdict, JsonProducts prod)
        {
            var billAccess = new billofentryController();
            var billExists = billAccess.getTable().FirstOrDefault<billofentry>(c => c.billofentry_product == prod.id);

            var requestAccess = new releaseRequestController();
            var requestExists = requestAccess.getTable().FirstOrDefault<releaserequest>(c => c.releaserequest_product == Convert.ToInt32(billExists.billofentry_product));

            if(requestExists == null)
            {
                return "No request found for this package";
            }

            requestExists.releaserequest_verdict = verdict;
            requestAccess.updateRecord(Convert.ToInt32(prod.id), requestExists);

            var userAccess = new userController();
            var userExists = userAccess.getTable().FirstOrDefault<user>(c => c.user_id == billExists.billofentry_user);
            var result = "Release Request has been " + verdict;
            //emailTest email = new emailTest(userExists.user_fname + " " + userExists.user_sname, userExists.user_email, result, "Update on your request for a package release");
            return result;
        }

        public void paypal()
        {
            GetBalanceRequestType request = new GetBalanceRequestType();
            GetBalanceResponseType response = new GetBalanceResponseType();
            request.ReturnAllCurrencies="YES";

            GetBalanceReq wrapper = new GetBalanceReq();
            wrapper.GetBalanceRequest = request;
            PayPalAPIInterfaceServiceService service = new PayPalAPIInterfaceServiceService();

            response = service.GetBalance(wrapper);
            if (response != null)
            {
                string ack = "Get Balance Api Operation -";
                ack += response.Ack.ToString();
                if (response.Ack.ToString().Trim().ToUpper().Equals("SUCCESS"))
                {
                    var obj = response;
                    MessageBox.Show(response.Balance.value);
                }
            }


        }

        public string OwnershipRequest(JsonUser currentOwner, JsonUser newOwner, JsonProducts prod)
        {
            var ownershipAccess = new billofentryController();
            var ownershipExists = ownershipAccess.getTable().FirstOrDefault<billofentry>(o => o.billofentry_user == Convert.ToInt32(currentOwner.id) && o.billofentry_product == prod.id);
            if(ownershipExists == null)
            {
                return "Ownership of this product does not exist.";
            }

            var newOwnerAccess = new userController();
            var newOwnerExists = newOwnerAccess.getTable().FirstOrDefault<user>(u => u.user_id == Convert.ToInt32(newOwner.id));
            if(newOwnerExists == null)
            {
                return "New Owner does not Exist.";
            }

            var ownershipReqAccess = new ownershipRequestController();
            JsonOwnershipReq ownerReq = new JsonOwnershipReq();
            ownerReq.prevOwner = Convert.ToInt32(currentOwner.id);
            ownerReq.newOwner = Convert.ToInt32(newOwner.id);
            ownerReq.acceptance = "Pending";
            ownerReq.product = prod.id;

            ownershipReqAccess.addRecord(new ownershiprequest { ownershiprequest_owner = ownerReq.prevOwner, ownershiprequest_newowner = ownerReq.newOwner, ownershiprequest_product = ownerReq.product, ownershiprequest_acceptance = ownerReq.acceptance });
            return "Request has been sent";
        }

        public string approveOwnershipRequest(string verdict,JsonUser user, JsonProducts prod)
        {
            var ownerReqAccess = new ownershipRequestController();
            var ownerReqExists = ownerReqAccess.getTable().FirstOrDefault<ownershiprequest>(o => o.ownershiprequest_newowner == Convert.ToInt32(user.id) && o.ownershiprequest_product == prod.id);
            if(ownerReqExists == null)
            {
                return null;
            }

            JsonOwnershipReq ownerReq = new JsonOwnershipReq();
            ownerReq.acceptance = verdict;
            ownerReqExists.ownershiprequest_acceptance = ownerReq.acceptance;
            ownerReqAccess.updateRecord(ownerReqExists.ownershiprequest_id, ownerReqExists);
            if(verdict == "Accepted")
            {
                var billAccess = new billofentryController();
                var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_user == Convert.ToInt32(ownerReqExists.ownershiprequest_owner) && b.billofentry_product == Convert.ToInt32(prod.id));
                billExists.billofentry_user = Convert.ToInt32(ownerReqExists.ownershiprequest_newowner);
                billAccess.updateRecord(billExists.billofentry_id, billExists);
            }
            var userAccess = new userController();
            var ownerExists = userAccess.getTable().FirstOrDefault<user>(u => u.user_id == Convert.ToInt32(ownerReqExists.ownershiprequest_owner));
            var newOwnerExists = userAccess.getTable().FirstOrDefault<user>(u => u.user_id == Convert.ToInt32(ownerReqExists.ownershiprequest_newowner));
            //emailTest emailOwner = new emailTest(ownerExists.user_fname + " " + ownerExists.user_sname, ownerExists.user_email, "Dear Mr/Ms " + ownerExists.user_sname + System.Environment.NewLine + System.Environment.NewLine + "Mr/Ms " + ownerExists.user_sname + " has " + verdict + " your request to change the ownership of your package: " + System.Environment.NewLine + System.Environment.NewLine + "Product Number: " + prod.id + System.Environment.NewLine + "Product Name: " + prod.name, "Request to change Ownership");
            //emailTest emailNewOwner = new emailTest(newOwnerExists.user_fname + " " + newOwnerExists.user_sname, newOwnerExists.user_email, "Dear Mr/Ms " + newOwnerExists.user_sname + System.Environment.NewLine + System.Environment.NewLine + "You have " + verdict + " the request to change ownership of: " + System.Environment.NewLine + System.Environment.NewLine + "Product Number: " + prod.id + System.Environment.NewLine + "Product Name: " + prod.name, "Request to change Ownership");
            return "Ownership updated";
        }

        public IEnumerable<JsonOwnershipReq> getOwnershipRequest(JsonUser user)
        {
            var ownershipReqAccess = new ownershipRequestController();
            List<ownershiprequest> ownershipReqExists = ownershipReqAccess.getTable().Where<ownershiprequest>(o => o.ownershiprequest_owner == Convert.ToInt32(user.id) || o.ownershiprequest_newowner == Convert.ToInt32(user.id)).ToList<ownershiprequest>();
            if(ownershipReqExists.Count == 0)
            {
                return null;
            }

            List<JsonOwnershipReq> ownerReq = new List<JsonOwnershipReq>();
            foreach(ownershiprequest o in ownershipReqExists)
            {
                ownerReq.Add(new JsonOwnershipReq { id = o.ownershiprequest_id, prevOwner = Convert.ToInt32(o.ownershiprequest_owner), newOwner = Convert.ToInt32(o.ownershiprequest_newowner), product = Convert.ToInt32(o.ownershiprequest_product), acceptance = o.ownershiprequest_acceptance });
            }
            return ownerReq;
        }

        public IEnumerable<JsonUser> getTraderInStock(JsonWarehouse warehouses)
        {
            var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_name.ToLower() == warehouses.name.ToLower());

            if(warehouseExists == null)
            {
                return null;
            }

            var warehouseStockAccess = new warehousestockController();
            List<warehousestock> warehouseStockExists = warehouseStockAccess.getTable().Where<warehousestock>(s => s.warehousestock_warehouse == Convert.ToInt32(warehouseExists.warehouse_id)).ToList<warehousestock>();
            if(warehouseStockExists.Count == 0)
            {
                return null;
            }

            var billAccess = new billofentryController();
            List<billofentry> billExists = new List<billofentry>();

            foreach(warehousestock w in warehouseStockExists)
            {
                billExists = billAccess.getTable().Where<billofentry>(b => b.billofentry_product == w.warehousestock_product).ToList<billofentry>();
            }

            var traderAccess = new userController();
            List<user> traderExists = new List<user>();

            foreach(billofentry b in billExists)
            {
                traderExists = traderAccess.getTable().Where<user>(u => u.user_id == b.billofentry_user).ToList<user>();
            }

            List<JsonUser> traders = new List<JsonUser>();

            foreach(user u in traderExists)
            {
                traders.Add(new JsonUser { id = u.user_id, email = u.user_email, fname = u.user_fname, lname = u.user_sname, password = u.user_password });
            }

            return traders;
        }

        public void addWarehouse(JsonWarehouse warehouseAdd)
        {
            var warehouseAccess = new warehouseController();
            warehouse warehouses = new warehouse { warehouse_name = warehouseAdd.name, warehouse_size = warehouseAdd.size, warehouse_location = warehouseAdd.location, warehouse_user = warehouseAdd.user, warehouse_warehousetype = warehouseAdd.warehousetype };
            warehouseAccess.addRecord(warehouses);
        }

        public void addCountry(JsonCountry country)
        {
            var countryAccess = new countryrelationController();
            var countryExists = countryAccess.getTable().FirstOrDefault<countryrelation>(c => c.countryrelation_name == country.name);
            
            countryAccess.addRecord(new countryrelation { countryrelation_name = country.name });
        }

        public string addWarehouseMan(JsonUser user)
        {

            var userstable = new userController();

            var check = userstable.getTable().FirstOrDefault<user>(c => c.user_email.Equals(user.email));

            if (check != null)
            {
                return "Email Already Registered";
            }

            user newUser = new user { user_fname = user.fname, user_email = user.email, user_sname = user.lname, user_password = user.password, usertype_id = 3, user_id = userstable.getTable().Count() };

            userstable.addRecord(newUser);
            //emailTest email = new emailTest(newUser.user_fname + " " + newUser.user_sname, newUser.user_email, "Hello " + newUser.user_fname + ", Welcome to Ciro. You are now a member of our family, Enjoy!", "Registered to Ciro Solutions");
            return "Registered";
        }

        public IEnumerable<JsonInventory> getWarehouseInventory(JsonWarehouse warehouses)
        {
            var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_name.ToLower() == warehouses.name.ToLower());

            if(warehouseExists == null)
            {
                return null;
            }

            var warehouseStockAccess = new warehousestockController();
            List<warehousestock> warehouseStockExists = warehouseStockAccess.getTable().Where<warehousestock>(w => w.warehousestock_warehouse == warehouseExists.warehouse_id).ToList<warehousestock>();
            if(warehouseStockExists == null)
            {
                return null;
            }

            List<JsonInventory> inventory = new List<JsonInventory>();

            foreach(warehousestock w in warehouseStockExists)
            {
                var billAccess = new billofentryController();
                var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_product == w.warehousestock_product);
                inventory.Add(new JsonInventory { warehouseID = Convert.ToInt32(w.warehousestock_warehouse), productID = Convert.ToInt32(w.warehousestock_product), lastChecked = Convert.ToDateTime(w.warehousestock_lastchecked), size = Convert.ToInt32(w.product.product_size), quantity = Convert.ToInt32(w.product.product_quantity), arrivalDate = Convert.ToDateTime(w.product.product_arrivalDate), owner = Convert.ToInt32(billExists.billofentry_user), productType = Convert.ToInt32(w.product.product_producttype) });
            }
            return inventory;
        }

        public JsonWarehouse getWarehouseI(JsonWarehouse warehouses)
        {
            var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_name == warehouses.name || w.warehouse_id == warehouses.id);
            if(warehouseExists == null)
            {
                return null;
            }

            JsonWarehouse nWarehouse = new JsonWarehouse { id = warehouseExists.warehouse_id, name = warehouseExists.warehouse_name, location = warehouseExists.warehouse_location, size = Convert.ToInt32(warehouseExists.warehouse_size), user = Convert.ToInt32(warehouseExists.warehouse_user), warehousetype = Convert.ToInt32(warehouseExists.warehouse_warehousetype) };
            return nWarehouse;
        }

        public JsonUser getUser(JsonUser users)
        {
            var userAccess = new userController();
            var userExists = userAccess.getTable().FirstOrDefault<user>(u => u.user_email == users.email || u.user_id == users.id);

            if(userExists == null)
            {
                return null;
            }

            JsonUser nUser = new JsonUser { id = userExists.user_id, fname = userExists.user_fname, lname = userExists.user_sname, email = userExists.user_email, usertype = userExists.usertype_id };
            return nUser;
        }

        /*public string getPackageNotification(JsonUser user)
        {
            var userAccess = new userController();
            var userExists = userAccess.getTable().FirstOrDefault<user>(c => c.user_id == user.id);

            var productAccess = new productController();
           // IEnumerable<product> 
            List<product> prod = new List<product>();
            return "";
        }*/


        // public IEnumerable<product> listProduct()
        //{
        //  MessageBox.Show("Products");
        // var prod = new productController();
        //IEnumerable<product> products = prod.getTable();
        //return products;
        //}
        //public CompositeType GetDataUsingDataContract(CompositeType composite)
        //{
        //  if (composite == null)
        // {
        //    throw new ArgumentNullException("composite");
        //}
        // if (composite.BoolValue)
        //{
        ///    composite.StringValue += "Suffix";
        //}
        //return composite;
        // }

    }
}
