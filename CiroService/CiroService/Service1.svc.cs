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
using MessagingToolkit.QRCode;
using MessagingToolkit.QRCode.Codec;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;


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
    
        public jsonLogin login(jsonLoginUser login)
        {
            var userAccess = new userController();
            IEnumerable<user> users = userAccess.getTable();
            var user = users.FirstOrDefault<user>(c => (c.user_fname.Equals(login.name) || c.user_email.Equals(login.name) ) && c.user_password.Equals(login.password));
            if (user == null)
            {
                return null ;
            }
            var userType = new usertypeController();
            string usertype = userType.getRecord(Convert.ToInt32(user.usertype_id)).usertype_name;
            return new jsonLogin {id=user.user_id,email=user.user_fname+" " + user.user_sname, type=usertype};
        }

        //send all products that come from the bill of entry
        public IEnumerable<jsonProduct> clientProducts(string id)
        {
            var productsTable = new productController();
            
            List<product> products = productsTable.getTable().Where<product>(p => 1 == Convert.ToInt32(id)).ToList<product>();
            if(products.Count == 0)
            {
                return null;
            }
            List<jsonProduct> sendProducts = new List<jsonProduct>();
            foreach (product p in products)
            {
                sendProducts.Add(new jsonProduct { ID = p.product_id,Name = p.product_name,value = Convert.ToDecimal( p.product_price )});
            }
            return sendProducts;
        }

        public string register(RegisterUser regUser)
        {
            
            var userstable = new userController();
            
            var check = userstable.getTable().FirstOrDefault<user>(c => c.user_email.Equals(regUser.email));
            
            if (check != null)
            {
                return "Email Already Registered";
            }
            
            user newUser = new user { user_fname = regUser.fname, user_email = regUser.email, user_sname = regUser.lname, user_password = regUser.password, usertype_id = 2, user_id = userstable.getTable().Count() };
    
            userstable.addRecord(newUser);
            return "Registered";
        }
       
        public string transeferRequest(jsonTRequest newRequest)
        {
            transferrequestsController trans = new transferrequestsController();
            transferrequest newTransfer = new transferrequest();
            warehousestockController stockTable = new warehousestockController();
            warehousestock warehouseID = stockTable.getTable().First<warehousestock>(c => c.warehousestock_product_id == newRequest.productID);
            warehouseController warehouseTable = new warehouseController();
            warehouse warehouseName = warehouseTable.getTable().First<warehouse>(c => c.warehouse_id == warehouseID.warehousestock_warehouse_id);

            newTransfer.transferrequest_verdict = newRequest.description;
            newTransfer.transferrequest_user_id = newRequest.userID;
            newTransfer.transferrequest_product_id = newRequest.productID;
            newTransfer.transferrequest_to = newRequest.endWarehouse;
            newTransfer.transferrequest_from =warehouseName.warehouse_location;
            DateTime date = new DateTime();
            newTransfer.transferrequest_user_id = date.Year + date.Month + date.Day + newRequest.userID +newRequest.productID;
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
                transferList.Add(new TransferDetails { productName = t.product.product_name,currentLocation=t.transferlist_from,destination=t.transferlist_to});
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
            var inList = tlistAccess.getTable().First<transferlist>(c => c.transferlist_product_id == stockTake.id);
            var productTable = new productController();
            var stockTable = new warehousestockController();
            var warehouseTable = new warehouseController();
            if (inList != null)
            {
                stockTable.addRecord(new warehousestock { warehousestock_product_id = stockTake.id, warehousestock_warehouse_id = warehouseTable.getTable().First<warehouse>(c => c.warehouse_location.Equals(stockTake.location)).warehouse_id, warehousestock_lastchecked = DateTime.Now });
                tlistAccess.deleteRecord(inList.transferlist_id);
                message = "Stock Recorded";

            }
            else
            {

                //needs imp for release request,transfer request denail/pending and/or approvement 
                //transfer request up
                var tRequestTable = new transferrequestsController();
                var tRequest = tRequestTable.getTable().First<transferrequest>(c => c.transferrequest_product_id == stockTake.id);
                var rRequestTable = new releaseRequestController();
                var rRequest = rRequestTable.getTable().First<releaserequest>(c => c.releaserequest_product_id == stockTake.id);
                if (tRequest != null && tRequest.transferrequest_verdict.Equals("Approved"))
                {
                    //add user that approved transfer
                    tlistAccess.addRecord(new transferlist { transferlist_product_id = stockTake.id, transferlist_from = stockTake.location, transferlist_to = tRequest.transferrequest_to, transferlist_user_id = 1 });
                    tRequestTable.deleteRecord(tRequest.transferrequest_id);
                    stockTable.deleteRecord(stockTable.getTable().First<warehousestock>(c => c.warehousestock_product_id == stockTake.id).warehousestock_id);
                    message = "Move Item to loading dock for Transfer";
                }
                else if (rRequest != null && rRequest.releaserequest_verdict.Equals("Approved"))
                {
                    //add user that approved release
                    //add location_to for release request
                    tlistAccess.addRecord(new transferlist { transferlist_product_id = stockTake.id, transferlist_from = stockTake.location, transferlist_to = "owner ", transferlist_user_id = 1 });
                    rRequestTable.deleteRecord(rRequest.releaserequest_id);
                    stockTable.deleteRecord(stockTable.getTable().First<warehousestock>(c => c.warehousestock_product_id == stockTake.id).warehousestock_id);
                    message = "Move Item to loading dock for Release";
                }
                else if (rRequest != null && rRequest.releaserequest_verdict.Equals("Declined"))
                {
                    rRequestTable.deleteRecord(rRequest.releaserequest_id);
                    var stock = stockTable.getTable().First<warehousestock>(c => c.warehousestock_product_id == stockTake.id);
                    stock.warehousestock_lastchecked = DateTime.Now;
                    stockTable.updateRecord(stock.warehousestock_id, stock);
                    message = "Stock updated";
                }
                else if (tRequest != null && tRequest.transferrequest_verdict.Equals("Declined"))
                {
                    tRequestTable.deleteRecord(tRequest.transferrequest_id);
                    var stock = stockTable.getTable().First<warehousestock>(c => c.warehousestock_product_id == stockTake.id);
                    stock.warehousestock_lastchecked = DateTime.Now;
                    stockTable.updateRecord(stock.warehousestock_id, stock);
                    message = "Stock updated";
                }
                else
                {
                    var stock = stockTable.getTable().First<warehousestock>(c => c.warehousestock_product_id == stockTake.id);
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
            countryRelationController countryAccess = new countryRelationController();
            producttypeController pTypeAccess = new producttypeController();
            var country = countryAccess.getTable().First<countryrelation>(c => c.countryrelation_name.ToLower().Equals(origin.ToLower()));
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
            foreach (var p in newProduct)
            {
                DateTime date = DateTime.Now;
                //add products to product table
                productAccess.addRecord(new product { product_name=p.Name,product_price=p.value,product_location=p.currentLocation,product_arrivalDate=date,product_hscode_id=hscode,product_producttype_id=producttype});
                //adding new product with bill of entry
                string genCode = p.Name + p.productType + date.Date;
                product addToBill = productAccess.getTable().First(c => c.product_name.Equals(p.Name) && c.product_hscode_id == hscode && c.product_arrivalDate==date);
                billAccess.addRecord(new billofentry {billofentry_origin=origin,billofentry_product_id=addToBill.product_id,billofentry_user_id=p.userID,billofentry_code=genCode });

                //add to transferlist
                transferlistController transferListkAccess = new transferlistController();
                transferListkAccess.addRecord(new transferlist { transferlist_to=p.transferLocation,transferlist_product_id=addToBill.product_id,transferlist_user_id=p.userID,transferlist_from=p.currentLocation});

                //create qrcode
                string path = "C:\\Users\\Tshenolo\\team28\\CiroService\\CiroService\\images\\";
                string qrcodeInfo = addToBill.product_id + "";
                QRCodeEncoder qrcodeMaker = new QRCodeEncoder();
                qrcodeMaker.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.H;
                qrcodeMaker.QRCodeScale = 10;

                Bitmap qrcode = qrcodeMaker.Encode(qrcodeInfo);
                qrcode.Save(path + "new.jpg", ImageFormat.Jpeg);
            }

            //Updates needed
            //add item to product table
            //productController pTable = new productController();
            //int count = pTable.getTable().Count();
            //pTable.addRecord(new product { product_id = count, product_name = newProduct.Name, product_producttype_id = newProduct.productType,product_quantity=1,product_price=newProduct.value,product_arrivalDate=DateTime.Now });

            ////Add Item to Transfer List
            //transferlistController tTable = new transferlistController();
            //count = tTable.getTable().Count();
            //tTable.addRecord(new transferlist { transferlist_id=count,transferlist_from= newProduct.currentLocation,transferlist_to=newProduct.transferLocation});


            //Generate QRCode and save
            //string path = "C:\\Users\\Tshenolo\\team28\\CiroService\\CiroService\\images\\";
            //string qrcodeInfo = count+"";
            //QRCodeEncoder qrcodeMaker = new QRCodeEncoder();
            //qrcodeMaker.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.H;
            //qrcodeMaker.QRCodeScale = 10;


            //Bitmap qrcode = qrcodeMaker.Encode(qrcodeInfo);
            //qrcode.Save(path+"new.jpg",ImageFormat.Jpeg);
            //


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
                incidentTable.addRecord(new productlog { productlog_product_id = newIncident.productID, productlog_image = "",  productlog_description = newIncident.description, productlog_id = incidents.Count(),productlog_user_id=2 });
            }
            else
            {   
                string path = "C:\\Users\\Tshenolo\\team28\\CiroService\\CiroService\\images\\incidents\\";
                byte[] newImage = Convert.FromBase64String(newIncident.image);
                MemoryStream memoStream = new MemoryStream(newImage, 0, newImage.Length);
                memoStream.Write(newImage,0,newImage.Length);
                string fileName = path + newIncident.productID + ".jpg";
                Image saveImage = Image.FromStream(memoStream);
                saveImage.Save(fileName);
                incidentTable.addRecord(new productlog { productlog_product_id = newIncident.productID, productlog_image = fileName, productlog_description = "", productlog_id = incidents.Count(), productlog_user_id = 2 });
            }
            

           return;
            
        }

 
        //return all warehpuse info for that specific warehouse
        public jsonWarehouse warehouseInfo(string id)
        {
            var warehouse = new warehouseController().getRecord(Convert.ToInt32(id));
            var warehouseType = new warehousetypeController().getRecord(Convert.ToInt32(warehouse.warehouse_warehousetype_id)).warehousetype_name;
            return new jsonWarehouse { id = warehouse.warehouse_id, location = warehouse.warehouse_location, name = warehouse.warehouse_name, size = Convert.ToInt32(warehouse.warehouse_size), type = warehouseType };
        }

        //return list of warehouses
        public IEnumerable<jsonWarehouse> warehouses()
        {
            var warehouses = new warehouseController().getTable();
            List<jsonWarehouse> warehouseList = new List<jsonWarehouse>();
            foreach(var warehouse in warehouses)
            {
                var warehouseType = new warehousetypeController().getRecord(Convert.ToInt32(warehouse.warehouse_warehousetype_id)).warehousetype_name;
                warehouseList.Add(new jsonWarehouse { id = warehouse.warehouse_id, location = warehouse.warehouse_location, name = warehouse.warehouse_name, size = Convert.ToInt32(warehouse.warehouse_size), type = warehouseType });
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
