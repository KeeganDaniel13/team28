// ***********************************************************************
// Assembly         : CiroService
// Author           : Owner
// Created          : 09-09-2016
//
// Last Modified By : Owner
// Last Modified On : 10-15-2016
// ***********************************************************************
// <copyright file="Service1.svc.cs" company="">
//     Copyright ©  2016
// </copyright>
// <summary></summary>
// ***********************************************************************
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
    /// <summary>
    /// Class Service1.
    /// </summary>
    /// <seealso cref="CiroService.IService1" />
    public class Service1 : IService1
    {


        public List<JsonInventory> items(string id)
        {
            var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_id == Convert.ToInt32(id));
            if (warehouseExists == null)
            {
                return null;
            }

            var warehouseStockAccess = new warehousestockController();
            List<warehousestock> warehouseStockExists = warehouseStockAccess.getTable().Where<warehousestock>(w => w.warehousestock_warehouse == warehouseExists.warehouse_id).ToList<warehousestock>();
            if (warehouseStockExists == null)
            {
                return null;
            }

            List<JsonInventory> inventory = new List<JsonInventory>();

            foreach (warehousestock w in warehouseStockExists)
            {
                var billAccess = new billofentryController();
                var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_product == w.warehousestock_product);
                inventory.Add(new JsonInventory { warehouseID = Convert.ToInt32(w.warehousestock_warehouse), product = new JsonProducts { name = billExists.product.product_name }, lastChecked = Convert.ToDateTime(w.warehousestock_lastchecked), size = Convert.ToInt32(w.product.product_size), quantity = Convert.ToInt32(w.product.product_quantity), arrivalDate = Convert.ToDateTime(w.product.product_arrivalDate), owner = new JsonUser { fname = billExists.user.user_fname, lname = billExists.user.user_sname, email = billExists.user.user_email } });
            }
            return inventory;
        }

        /// <summary>
        /// Gets the users.
        /// </summary>
        /// <returns>IEnumerable&lt;JsonUser&gt;.</returns>
        public IEnumerable<JsonUser> GetUsers()
        {
            var userAccess = new userController();
            List<JsonUser> users = new List<JsonUser>();
            List<user> userTable = userAccess.getTable().ToList<user>();
            foreach (user u in userTable)
            {
                users.Add(new JsonUser
                {
                    id = u.user_id,
                    fname = u.user_fname,
                    email = u.user_email,
                    usertypename = u.usertype.usertype_name
                });
            }
            return users;
        }

        /// <summary>
        /// Gets the data.
        /// </summary>
        /// <returns>System.String.</returns>
        public string GetData(string id)
        {
            /*var userAccess = new userController();
            List<UserDemo> users = new List<UserDemo>();
            List<user> userTable = userAccess.getTable().ToList<user>();
            foreach (user u in userTable)
            {
                users.Add(new UserDemo
                {
                    id = u.user_id,
                    Name = u.user_fname

                });
            }*/
            var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_id == Convert.ToInt32(id));
            if (warehouseExists == null)
            {
                return null;
            }

            var warehouseStockAccess = new warehousestockController();
            List<warehousestock> warehouseStockExists = warehouseStockAccess.getTable().Where<warehousestock>(w => w.warehousestock_warehouse == warehouseExists.warehouse_id).ToList<warehousestock>();
            if (warehouseStockExists == null)
            {
                return null;
            }

            List<JsonInventory> inventory = new List<JsonInventory>();

            foreach (warehousestock w in warehouseStockExists)
            {
                var billAccess = new billofentryController();
                var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_product == w.warehousestock_product);
                inventory.Add(new JsonInventory { warehouseID = Convert.ToInt32(w.warehousestock_warehouse), product = new JsonProducts { name = billExists.product.product_name }, lastChecked = Convert.ToDateTime(w.warehousestock_lastchecked), size = Convert.ToInt32(w.product.product_size), quantity = Convert.ToInt32(w.product.product_quantity), arrivalDate = Convert.ToDateTime(w.product.product_arrivalDate), owner = new JsonUser { fname = billExists.user.user_fname, lname = billExists.user.user_sname, email = billExists.user.user_email } });
            }
            return JsonConvert.SerializeObject(inventory);

            //return JsonConvert.SerializeObject(users);
        }

        /// <summary>
        /// Logins the specified login.
        /// </summary>
        /// <param name="login">The login.</param>
        /// <returns>JsonUser.</returns>
        public JsonUser login(jsonLoginUser login)
        {
            var userAccess = new userController();
            IEnumerable<user> users = userAccess.getTable();
            
            var user = users.FirstOrDefault<user>(c => (c.user_fname.Equals(login.name) || c.user_email.Equals(login.name)) && c.user_password.Equals(login.password));
            if (user == null)
            {
                return null;
            }
            JsonUser inUser = new JsonUser();
            inUser.id = user.user_id;
            inUser.fname = user.user_fname;
            inUser.lname = user.user_sname;
            inUser.email = user.user_email;
            inUser.usertype = Convert.ToInt32( user.usertype_id);
            inUser.usertypename = user.usertype.usertype_name;
            inUser.warehouseID = 0;
            inUser.warehouseName = "";
            if (user.usertype.usertype_name.ToLower() == "warehouse")
            {
                var warehouse = user.warehouses.First<warehouse>(c => c.warehouse_user == user.user_id);
                inUser.warehouseID = warehouse.warehouse_id;
                inUser.warehouseName = warehouse.warehouse_name;
            }
            return inUser;
        }

        //send all products that come from the bill of entry
        /// <summary>
        /// Clients the products.
        /// </summary>
        /// <param name="user">The user.</param>
        /// <returns>IEnumerable&lt;jsonProduct&gt;.</returns>
        public IEnumerable<jsonProduct> clientProducts(JsonUser user)
        {
            var productsTable = new productController();
            var billtable = new billofentryController();

            List<billofentry> products = billtable.getTable().Where<billofentry>(p => p.billofentry_user == Convert.ToInt32(user.id)).ToList<billofentry>();
            if (products.Count == 0)
            {
                return null;
            }
            List<jsonProduct> sendProducts = new List<jsonProduct>();
            foreach (billofentry p in products)
            {
                if(p.product .product_expirationDate!= null)
                {
                    sendProducts.Add(new jsonProduct { ID = p.product.product_id, Name = p.product.product_name, value = Convert.ToDecimal(p.product.product_price), bill = p.billofentry_code, arrivalDate = Convert.ToDateTime(p.product.product_arrivalDate), quantity = Convert.ToInt32(p.product.product_quantity), currentLocation = p.product.product_location, size = Convert.ToInt32(p.product.product_size), description = p.product.product_description, origin = p.billofentry_origin, expDate = Convert.ToDateTime(p.product.product_expirationDate) });
                }
                else
                {
                    sendProducts.Add(new jsonProduct { ID = p.product.product_id, Name = p.product.product_name, value = Convert.ToDecimal(p.product.product_price), bill = p.billofentry_code, arrivalDate = Convert.ToDateTime(p.product.product_arrivalDate), quantity = Convert.ToInt32(p.product.product_quantity), currentLocation = p.product.product_location, size = Convert.ToInt32(p.product.product_size), description = p.product.product_description, origin = p.billofentry_origin, expDate = Convert.ToDateTime(p.product.product_arrivalDate).AddYears(2) });
                }
            }
            return sendProducts;
        }

        /// <summary>
        /// Registers the specified reg user.
        /// </summary>
        /// <param name="regUser">The reg user.</param>
        /// <returns>System.String.</returns>
        public string register(JsonUser regUser)
        {

            var userstable = new userController();

            var check = userstable.getTable().FirstOrDefault<user>(c => c.user_email.Equals(regUser.email));

            if (check != null)
            {
                return "Email Already Registered";
            }

            user newUser = new user { user_fname = regUser.fname, user_email = regUser.email, user_sname = regUser.lname, user_password = regUser.password, usertype_id = regUser.usertype, user_id = userstable.getTable().Count() };

            userstable.addRecord(newUser);
            //emailTest email = new emailTest(newUser.user_fname + " " + newUser.user_sname, newUser.user_email, "Hello " + newUser.user_fname + ", Welcome to Ciro. You are now a member of our family, Enjoy!", "Registered to Ciro Solutions");
            return "Registered";
        }

        /// <summary>
        /// Lists the transfer t requests.
        /// </summary>
        /// <returns>IEnumerable&lt;TransferDetails&gt;.</returns>
        public IEnumerable<TransferDetails> listTransferTRequests()
        {
            try

            {
                var tRequest = new transferrequestsController().getTable().Where(c => c.transferrequest_verdict == "Pending");
                var productinfo = new productController();
                var userInfo = new userController();
                var transfers = new List<TransferDetails>();
                foreach (var requets in tRequest)
                {
                    var prod = productinfo.getRecord(Convert.ToInt32(requets.transferrequest_product));
                    var use = userInfo.getRecord(Convert.ToInt32(requets.transferrequest_user));
                    transfers.Add(new TransferDetails { productid = Convert.ToInt32(requets.transferrequest_product), currentLocation = requets.transferrequest_from, transferName = use.user_fname, productName = prod.product_name, destination = requets.transferrequest_to });
                }
                return transfers;

            }
            catch (Exception e) { }
            return null;

        }

        /// <summary>
        /// Transefers the request.
        /// </summary>
        /// <param name="newRequests">The new requests.</param>
        /// <returns>System.String.</returns>
        public string transeferRequest(IEnumerable<jsonTRequest> newRequests)
        {
                    //Fix
                    transferrequestsController trans = new transferrequestsController();
                    transferrequest newTransfer = new transferrequest();
                    //warehousestockController stockTable = new warehousestockController();
                    //warehousestock warehouseID = stockTable.getTable().First<warehousestock>(c => c.warehousestock_product == newRequest.productID);
                    warehouseController warehouseTable = new warehouseController();
                    foreach (var newRequest in newRequests)
                    {
                        warehouse warehouseName = warehouseTable.getRecord(newRequest.endWarehouse);

                        if (warehouseName == null)
                        {
                            return "Warehouse does not exist.";
                        }

                        var productAccess = new productController();
                        var productExists = productAccess.getTable().FirstOrDefault<product>(p => p.product_id == newRequest.productID);

                        if (productExists == null)
                        {
                            return "Product does not exist.";
                        }

                        var userAccess = new userController();
                        var userExists = userAccess.getTable().FirstOrDefault<user>(u => u.user_id == newRequest.userID);

                        if (userExists == null)
                        {
                            return "User does not exist";
                        }

                        newTransfer.transferrequest_verdict = "Pending";
                        newTransfer.transferrequest_user = newRequest.userID;
                        newTransfer.transferrequest_product = newRequest.productID;
                        newTransfer.transferrequest_to = warehouseName.warehouse_location;
                        newTransfer.transferrequest_from = productExists.product_location;
                        newTransfer.transferrequest_description = newRequest.description;
                        newTransfer.transferrequest_requestDate  = newRequest.date;
                        newTransfer.transferrequest_reason = newRequest.reason;
                        // DateTime date = new DateTime();
                        // newTransfer.= date.Year + date.Month + date.Day + newRequest.userID +newRequest.productID;
                        try
                        {
                            trans.addRecord(newTransfer);
                        }

                        catch (Exception e)
                        {
                            MessageBox.Show(e.ToString());
                        }

                        addProductLog("TR7", new JsonProductLog { product_id = newRequest.productID, userID = newRequest.userID, description = "Owner: " + userExists.user_fname + " " + userExists.user_sname + System.Environment.NewLine + "Owner has Requested a Transfer of product on:" + System.Environment.NewLine + "Product ID: " + newRequest.productID + System.Environment.NewLine + "From: " + productExists.product_location + System.Environment.NewLine + "To: " + warehouseName.warehouse_location + System.Environment.NewLine + newRequest.description });
                    }
                    return "Added";
            
        }

        /// <summary>
        /// Transfers the list.
        /// </summary>
        /// <returns>IEnumerable&lt;TransferDetails&gt;.</returns>
        public IEnumerable<TransferDetails> transferList()
        {
            transferlistController list = new transferlistController();
            List<TransferDetails> transferList = new List<TransferDetails>();
            var tempList = list.getTable();

            foreach (transferlist t in tempList)
            {
                var productAccess = new productController();
                var productExists = productAccess.getTable().FirstOrDefault<product>(p => p.product_id == t.transferlist_product);

                if (productExists == null)
                {
                    return null;
                }

                transferList.Add(new TransferDetails { productName = productExists.product_name, currentLocation = t.transferlist_from, destination = t.transferlist_to });
            }
            return transferList;
        }

        //Add Method to update table of stock take 
        //Needs Test
        /// <summary>
        /// Stocks the take.
        /// </summary>
        /// <param name="stockTake">The stock take.</param>
        /// <returns>System.String.</returns>
        public string stockTake(stockTakeInfo stockTake)
        {

            //if item is on the tansferlist add it to the warehouse
            string message = "Failed";
            transferlistController tlistAccess = new transferlistController();
            transferlist inList = null;
            try
            {
                inList = tlistAccess.getTable().First<transferlist>(c => c.transferlist_product == stockTake.id);
            }
            catch (Exception) { }
            var productTable = new productController();
            var stockTable = new warehousestockController();
            var warehouseTable = new warehouseController();
            if (inList != null)
            {
                stockTable.addRecord(new warehousestock { warehousestock_product = stockTake.id, warehousestock_warehouse = warehouseTable.getTable().First<warehouse>(c => c.warehouse_location.Equals(stockTake.location)).warehouse_id, warehousestock_lastchecked = DateTime.Now });
                tlistAccess.deleteRecord(inList.transferlist_id);
                if (stockTake.image != null || !stockTake.image.Equals(""))
                {
                    //string path = "C:\\Users\\Tshenolo\\team28\\CiroService\\CiroService\\images\\incidents\\";
                    //string path = "C:\\Users\\Chuck\\team28\\CiroService\\CiroService\\incidents";
                    string path = System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath + "incidents\\";
                    byte[] newImage = Convert.FromBase64String(stockTake.image);
                    MemoryStream memoStream = new MemoryStream(newImage, 0, newImage.Length);
                    memoStream.Write(newImage, 0, newImage.Length);
                    string fileName = path + stockTake.id+DateTime.Now + ".jpg";
                    System.Drawing.Image saveImage = System.Drawing.Image.FromStream(memoStream);
                    saveImage.Save(fileName);
                    productTable.updateRecord(stockTake.id, new product { product_image = fileName });
                }
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
                    tlistAccess.addRecord(new transferlist { transferlist_product = stockTake.id, transferlist_from = stockTake.location, transferlist_to = "owner " });
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
        //Make sure to generate qrcode for specfic product
        //Just double check with boolean
        //needs test with single and multiple produts varying of duty and non duty produts
        /// <summary>
        /// Stocks the add.
        /// </summary>
        /// <param name="origin">The origin.</param>
        /// <param name="newProduct">The new product.</param>
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



            int hscode, producttype;
            //add to table with hscode
            if (country != null)
            {
                //duty
                hscode = 825;
                producttype = 1;
            }
            else
            {
                //non duty
                hscode = 825;
                producttype = 2;
            }
            productController productAccess = new productController();
            billofentryController billAccess = new billofentryController();
            DateTime date = DateTime.Now;
            string origin2 = origin;
            string genCode = "" + hscode + date.Day + date.Second + origin2.Substring(0, 2);
            DateTime ExpirationDate = date.AddYears(2);
            foreach (var p in newProduct)
            {

                //add products to product table
                productAccess.addRecord(new product { product_name = p.Name, product_size = p.size, product_quantity = p.quantity, product_price = p.value, product_location = "In Transit", product_arrivalDate = date, product_hscode = hscode, product_producttype = producttype, product_expirationDate = ExpirationDate,product_Insured=p.insured ,product_description =p.description});
                //adding new product with bill of entry

                product addToBill = productAccess.getTable().First(c => c.product_name.Equals(p.Name) && c.product_hscode == hscode && c.product_arrivalDate == date);
                billAccess.addRecord(new billofentry { billofentry_origin = origin, billofentry_product = addToBill.product_id, billofentry_user = p.userID, billofentry_code = genCode });

                var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_code == genCode && b.billofentry_product == addToBill.product_id && b.billofentry_user == p.userID);

                addTax(new JsonProducts { id = Convert.ToInt32(billExists.billofentry_product) }, new JsonBillofEntry { id = billExists.billofentry_id });

                //add to transferlist

                transferlistController transferListkAccess = new transferlistController();
                transferListkAccess.addRecord(new transferlist { transferlist_to = p.transferLocation, transferlist_product = addToBill.product_id, transferlist_from = p.currentLocation });

               //Change to store on any hosted project releative to current hosted location
                string path = System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath + "\\images\\";
                string qrcodeInfo = addToBill.product_id + "";
                QRCodeEncoder qrcodeMaker = new QRCodeEncoder();
                qrcodeMaker.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.H;
                qrcodeMaker.QRCodeScale = 10;
                
                Bitmap qrcode = qrcodeMaker.Encode(qrcodeInfo);
                qrcode.Save(path + qrcodeInfo + " .jpg", ImageFormat.Jpeg);
                
            }
        }



        //need implemantation
        //Not Important Yet
        //displays all warehosue managers tasks for the day
        /// <summary>
        /// Tasks the list.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>IEnumerable&lt;jsonTask&gt;.</returns>
        public IEnumerable<JsonTask> taskList(string id)
        {
            return null;
        }

        //Test With Andriod Streaming
        //Add Image upload imp
        /// <summary>
        /// Adds the incident.
        /// </summary>
        /// <param name="newIncident">The new incident.</param>
        public void addIncident(jsonIncident newIncident)
        {
            
            //Removed Image adding will implemement at a later stage once system is more cohisive
            productlogController incidentTable = new productlogController();
            IEnumerable<productlog> incidents = incidentTable.getTable();
            if (newIncident.image == null || newIncident.image.Equals(""))
            {
                incidentTable.addRecord(new productlog { productlog_type = newIncident.type, productlog_dateLogged = DateTime.Now, productlog_product = newIncident.productID, productlog_warehouse = newIncident.warehouse, productlog_image = "", productlog_description = newIncident.description, productlog_id = incidents.Count(), productlog_user = newIncident.userID });
            }
            else
            {
                //string path = "C:\\Program Files\\Git\\team28\\CiroService\\CiroService\\images\\incidents\\";
                //string path = "C:\\Users\\Chuck\\team28\\CiroService\\CiroService";
                //string path = "C:\\Users\\Chuck\\team28\\CiroService\\CiroService";
                string path = System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath + "\\images\\incidents\\";
                byte[] newImage = Convert.FromBase64String(newIncident.image);
                MemoryStream memoStream = new MemoryStream(newImage, 0, newImage.Length);
                memoStream.Write(newImage, 0, newImage.Length);
                string fileName = path + incidents.Count()+1 + ".jpg";
                System.Drawing.Image saveImage = System.Drawing.Image.FromStream(memoStream);
                saveImage.Save(fileName);
                incidentTable.addRecord(new productlog { productlog_dateLogged = DateTime.Now, productlog_type = newIncident.type, productlog_warehouse = newIncident.warehouse, productlog_product = newIncident.productID, productlog_image = fileName, productlog_description = newIncident.description, productlog_id = incidents.Count(), productlog_user = newIncident.userID });
            }
            return;
                    
        }

        //return all warehpuse info for that specific warehouse
        /// <summary>
        /// Warehouses the information.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>JsonWarehouse.</returns>
        public JsonWarehouse warehouseInfo(string id)
        {
            var warehouse = new warehouseController().getRecord(Convert.ToInt32(id));
            var warehouseType = new warehousetypeController().getRecord(Convert.ToInt32(warehouse.warehouse_warehousetype)).warehousetype_name;
            return new JsonWarehouse { id = warehouse.warehouse_id, location = warehouse.warehouse_location, name = warehouse.warehouse_name, size = Convert.ToInt32(warehouse.warehouse_size) };
        }

        //return list of warehouses
        /// <summary>
        /// Warehouseses this instance.
        /// </summary>
        /// <returns>IEnumerable&lt;JsonWarehouse&gt;.</returns>
        public IEnumerable<JsonWarehouse> warehouses()
        {
            var warehouses = new warehouseController().getTable();
            List<JsonWarehouse> warehouseList = new List<JsonWarehouse>();
            foreach (var warehouse in warehouses)
            {
                var warehouseType = new warehousetypeController().getRecord(Convert.ToInt32(warehouse.warehouse_warehousetype)).warehousetype_name;
                warehouseList.Add(new JsonWarehouse { id = warehouse.warehouse_id, location = warehouse.warehouse_location, name = warehouse.warehouse_name, size = Convert.ToInt32(warehouse.warehouse_size),descrption =warehouse .warehouse_description });
            }

            return warehouseList;
        }

        //needs implementation
        //get a list of stock scheduled for leaveing
        /// <summary>
        /// Stockleavings the warehouse.
        /// </summary>
        /// <param name="location">The location.</param>
        /// <returns>IEnumerable&lt;transferStock&gt;.</returns>
        public IEnumerable<transferStock> stockleavingWarehouse(string location)
        {
            var transferlistAccess = new transferlistController();
            List<transferStock> items = new List<transferStock>();
            var list = transferlistAccess.getTable().Where(c => c.transferlist_from.Equals(location) || c.transferlist_to.Equals(location));
            if (list != null)
            {
                foreach (var t in list)
                {
                    if (t.transferlist_from.Equals(location))
                    {
                        items.Add(new transferStock { productName = t.product.product_name, status = "IN", location = t.transferlist_from, size = Convert.ToInt32(t.product.product_size), value = Convert.ToDecimal(t.product.product_price) });
                    }
                    else
                    {
                        items.Add(new transferStock { productName = t.product.product_name, status = "OUT", location = t.transferlist_to, size = Convert.ToInt32(t.product.product_size), value = Convert.ToDecimal(t.product.product_price) });
                    }
                }
            }
            return items;
        }

        /// <summary>
        /// Updates the user.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="updateUsr">The update usr.</param>
        /// <returns>System.String.</returns>
        public string updateUser(string id, JsonUser updateUsr)
        {
            var userAccess = new userController();
            var userExists = userAccess.getTable().FirstOrDefault<user>(c => c.user_id == Convert.ToInt32(id));

            if (userExists == null)
            {
                return "User does not exist";
            }

            if (updateUsr.fname != null && updateUsr.fname != "")
            {
                userExists.user_fname = updateUsr.fname;
            }
            if (updateUsr.lname != null && updateUsr.lname != "")
            {
                userExists.user_sname = updateUsr.lname;
            }
            if (updateUsr.email != null && updateUsr.email != "")
            {
                userExists.user_email = updateUsr.email;
            }
            if (updateUsr.password != null && updateUsr.password != "")
            {
                userExists.user_password = updateUsr.password;
            }
            userAccess.updateRecord(Convert.ToInt32(id), userExists);
            return "Updated";
        }

        /// <summary>
        /// Gets the package identifier.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>JsonProducts.</returns>
        public JsonProducts getPackageID(string id)
        {
            var package = new JsonObjects.JsonProducts();
            var getPackage = new productController();
            var detailPackage = getPackage.getRecord(Convert.ToInt32(id));
            if (detailPackage == null)
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
            package.bill = detailPackage.billofentries.First<billofentry>(c => c.billofentry_product == detailPackage.product_id).billofentry_code;
            //var warehouseid = detailPackage.warehousestocks.First<warehousestock>(c => Convert.ToInt32(c.warehousestock_product) == detailPackage.product_id);
            //package.cosigner =""+ detailPackage.warehousestocks.First<warehousestock>(c => c.warehousestock_product == detailPackage.product_id).warehouse.warehouse_user.Value ;
            try
            {
                var warehousestocks = new warehousestockController().getTable().First<warehousestock>(c => c.warehousestock_product == detailPackage.product_id).warehousestock_warehouse;
                package.cosigner = "" + new userController().getRecord(Convert.ToInt32(new warehouseController().getRecord(Convert.ToInt32(warehousestocks)).warehouse_user)).user_fname;
            }

            catch (Exception)
            {
                package.cosigner = "Not In Warehouse";
            }
            
            //package.tax = new invoiceController().getRecord();
            return package;

        }

        /// <summary>
        /// Gets the package owner.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns>IEnumerable&lt;JsonProducts&gt;.</returns>
        public IEnumerable<JsonProducts> getPackageOwner(string id)
        {
            var billentryTable = new billofentryController();
            var productsTable = new productController();
            List<billofentry> entries = billentryTable.getTable().Where<billofentry>(c => c.billofentry_user == Convert.ToInt32(id)).ToList<billofentry>();

            if (entries.Count == 0)
            {
                return null;
            }

            List<product> products = new List<product>();

            foreach (billofentry e in entries)
            {
                products.Add(productsTable.getRecord(Convert.ToInt32(e.billofentry_product)));
            }

            List<JsonProducts> sendProducts = new List<JsonProducts>();
            foreach (product p in products)
            {
                sendProducts.Add(new JsonProducts { id = p.product_id, name = p.product_name, price = Convert.ToDouble(p.product_price), quantity = Convert.ToInt32(p.product_quantity), producttype = Convert.ToInt32(p.product_producttype), location = p.product_location, arrivalDate = Convert.ToDateTime(p.product_arrivalDate) });
            }
            return sendProducts;
        }

        /// <summary>
        /// Gets the type of the package.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <returns>IEnumerable&lt;JsonProducts&gt;.</returns>
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
                sendProducts.Add(new JsonProducts { id = p.product_id, name = p.product_name, price = Convert.ToDouble(p.product_price), quantity = Convert.ToInt32(p.product_quantity), producttype = Convert.ToInt32(p.product_producttype), location = p.product_location, arrivalDate = Convert.ToDateTime(p.product_arrivalDate) });
            }
            return sendProducts;
        }

        /// <summary>
        /// Gets the package date.
        /// </summary>
        /// <param name="date">The date.</param>
        /// <returns>System.String.</returns>
        /// <exception cref="NotImplementedException"></exception>
        public string getPackageDate(string date)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Gets the package dest.
        /// </summary>
        /// <param name="dest">The dest.</param>
        /// <returns>System.String.</returns>
        /// <exception cref="NotImplementedException"></exception>
        public string getPackageDest(string dest)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Gets the package location.
        /// </summary>
        /// <param name="location">The location.</param>
        /// <returns>System.String.</returns>
        /// <exception cref="NotImplementedException"></exception>
        public string getPackageLocation(string location)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Adds the package.
        /// </summary>
        /// <param name="prod">The product.</param>
        /// <returns>System.String.</returns>
        public string addPackage(JsonProducts prod)
        {
            var productAccess = new productController();
            product pro = new product { product_name = prod.name, product_price = Convert.ToDecimal(prod.price), product_hscode = Convert.ToInt32(prod.hscode), product_size = Convert.ToInt32(prod.size), product_quantity = prod.quantity, product_producttype = prod.producttype, product_location = prod.location, product_arrivalDate = prod.arrivalDate };
            productAccess.addRecord(pro);
            return "Package added.";
        }

        /// <summary>
        /// Updates the package.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="prod">The product.</param>
        /// <returns>System.String.</returns>
        public string updatePackage(string id, JsonProducts prod)
        {
            var productAccess = new productController();
            var productExists = productAccess.getTable().FirstOrDefault<product>(c => c.product_id == Convert.ToInt32(id));

            if (productExists == null)
            {
                return "Package does not exist";
            }
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

        /// <summary>
        /// Updates the package w location.
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <param name="location">The location.</param>
        /// <returns>System.String.</returns>
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

        /// <summary>
        /// Releases the request.
        /// </summary>
        /// <param name="owner">The owner.</param>
        /// <param name="product">The product.</param>
        /// <param name="description">The description.</param>
        /// <returns>System.String.</returns>
        public string releaseRequest(JsonUser owner, jsonProduct product, string description)
        {
            var productAccess = new billofentryController();
            var productExists = productAccess.getTable().FirstOrDefault<billofentry>(c => c.billofentry_product == Convert.ToInt32(product.ID) && c.billofentry_user == Convert.ToInt32(owner.id));

            if (productExists == null)
            {
                return "No such package is Owned by user";
            }

            var request = new releaseRequestController();
            var requestExists = request.getTable().FirstOrDefault<releaserequest>(c => c.releaserequest_product == Convert.ToInt32(product.ID) && c.releaserequest_user == Convert.ToInt32(owner.id));

            if (requestExists == null)
            {
                request.addRecord(new releaserequest { releaserequest_verdict = "Pending", releaserequest_product = Convert.ToInt32(product.ID), releaserequest_user = Convert.ToInt32(owner.id) });
                addProductLog("RR6", new JsonProductLog { product_id = product.ID, userID = owner.id, description = "Owner: " + productExists.user.user_fname + " " + productExists.user.user_sname + System.Environment.NewLine + "Owner has Requested a Release of product on:" + System.Environment.NewLine + "Product ID: " + product.ID + System.Environment.NewLine + description });
                return "Request has been uploaded.";
            }
            else
            {
                return "Request has already been made.";
            }
        }

        /// <summary>
        /// Gets the release.
        /// </summary>
        /// <param name="user">The user.</param>
        /// <returns>IEnumerable&lt;JsonReleaseRequest&gt;.</returns>
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
                releaseRequestList.Add(new JsonReleaseRequest { user_id = Convert.ToInt32(rq.releaserequest_user), product_id = Convert.ToInt32(rq.releaserequest_product), verdict = rq.releaserequest_verdict });
            }

            return releaseRequestList;
        }

        /// <summary>
        /// Gets the release requests.
        /// </summary>
        /// <returns>IEnumerable&lt;JsonReleaseRequest&gt;.</returns>
        public IEnumerable<JsonReleaseRequest> getReleaseRequests()
        {
            var requestAccess = new releaseRequestController();
            List<releaserequest> requestExists = requestAccess.getTable().ToList<releaserequest>();

            if (requestExists.Count() == 0)
            {
                return null;
            }

            List<JsonReleaseRequest> releaseRequestList = new List<JsonReleaseRequest>();
            foreach (releaserequest rq in requestExists)
            {

                releaseRequestList.Add(new JsonReleaseRequest { user_id = Convert.ToInt32(rq.releaserequest_user), product_id = Convert.ToInt32(rq.releaserequest_product), verdict = rq.releaserequest_verdict, userInfo = new JsonUser { email = rq.user.user_email }, productInfo = new JsonProducts { bill = rq.product.billofentries.First<billofentry>(c => c.billofentry_product == Convert.ToInt32(rq.releaserequest_product)).billofentry_code, arrivalDate = (DateTime)rq.product.product_arrivalDate, name = rq.product.product_name } });
            }

            return releaseRequestList;
        }

        //add changes for image
        /// <summary>
        /// Adds the product log.
        /// </summary>
        /// <param name="code">The code.</param>
        /// <param name="productlog">The productlog.</param>
        /// <returns>System.String.</returns>
        public string addProductLog(string code, JsonProductLog productlog)
        {
               var billAccess = new billofentryController();
                  var billExists = billAccess.getTable().FirstOrDefault<billofentry>(c => c.billofentry_product == productlog.product_id);
                  if (billExists == null)
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
                  if (code == "I9")
                  {

                      log.productlog_description = "Incident (@ " + DateTime.Now + "): " + productlog.description;
                      log.productlog_type = 1;
                      addIncident(new jsonIncident { productID = Convert.ToInt32(log.productlog_product), type = Convert.ToInt32(log.productlog_type), userID = Convert.ToInt32(log.productlog_user), description = log.productlog_description });
                      //productlogAccess.addRecord(log);
                      //emailTest email = new emailTest(userExists.user_fname + " " + userExists.user_sname, userExists.user_email, "We at Ciro would like to inform you about your package. The following log as been updated on the state of your package:" + System.Environment.NewLine + System.Environment.NewLine + log.productlog_description, "An Updated Log on your Package");
                      return "I9 report added to log";
                  }
                  else if (code == "TR7")
                  {
                      log.productlog_description = "Transfer Request (@ " + DateTime.Now + "): " + productlog.description;
                      log.productlog_type = 2;
                      productlogAccess.addRecord(log);
                      return "TR7 report added to log";
                  }
                  else if (code == "RR6")
                  {

                      log.productlog_description = "Release Request (@ " + DateTime.Now + "): " + productlog.description;
                      log.productlog_type = 3;
                      productlogAccess.addRecord(log);
                      return "RR6 report added to log";
                  }
                  else if (code == "T2")
                  {

                      log.productlog_description = "Transfer (@ " + DateTime.Now + "): " + productlog.description;
                      log.productlog_type = 4;
                      productlogAccess.addRecord(log);
                      return "T2 report added to log";
                  }
                  else if (code == "D3")
                  {
                      log.productlog_description = "Delivered (@ " + DateTime.Now + "): " + productlog.description;
                      log.productlog_type = 5;
                      productlogAccess.addRecord(log);
                      //emailTest email = new emailTest(userExists.user_fname + " " + userExists.user_sname, userExists.user_email, "We at Ciro would like to inform you about your package. The following log as been updated on the state of your package:" + System.Environment.NewLine + System.Environment.NewLine + log.productlog_description, "Delivery of Package");
                      return "D3 report added to log";
                  }
                  else if (code == "CO2")
                  {
                      log.productlog_description = "Ownership Change (@ " + DateTime.Now + "): " + productlog.description;
                      log.productlog_type = 6;
                      productlogAccess.addRecord(log);
                      return "CO2 report added to log";
                  }
                  else
                  {
                      return "No such code";
                  }
        }

        /// <summary>
        /// Gets the product log.
        /// </summary>
        /// <param name="product">The product.</param>
        /// <returns>IEnumerable&lt;JsonProductLog&gt;.</returns>
        public IEnumerable<JsonProductLog> getProductLog(jsonProduct product)
        {

                   var logAccess = new productlogController();
                   var logTypes = new productlogtypeController();
                   IEnumerable<productlog> logExists = null;
                   try
                   {
                       logExists = logAccess.getTable().Where(c => c.productlog_product == product.ID);
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
                       productLogList.Add(new JsonProductLog { product_id = Convert.ToInt32(log.productlog_product), description = log.productlog_description, date = DateTime.Parse(log.productlog_dateLogged.ToString()),logtypename = logTypes.getTable().First<productlogtype>(c => c.productlogtype_id == log.productlog_type).productlogtype_name});
                   }
                   productLogList.OrderByDescending(c => c.date);
                   return productLogList; 
        }

        /// <summary>
        /// Gets the warehouse.
        /// </summary>
        /// <returns>IEnumerable&lt;JsonWarehouse&gt;.</returns>
        public IEnumerable<JsonWarehouse> getWarehouse()
        {
            var warehouseAccess = new warehouseController();
            List<warehouse> warehouseExists = warehouseAccess.getTable().ToList<warehouse>();

            if (warehouseExists.Count() == 0)
            {
                return null;
            }

            double total = 0;
            List<JsonWarehouse> warehouseList = new List<JsonWarehouse>();
            foreach (warehouse warehouses in warehouseExists)
            {
                IEnumerable<JsonInventory> warehouseStock = new List<JsonInventory>();
                warehouseStock = getWarehouseInventory(new JsonWarehouse { name = warehouses.warehouse_name });
                total = 0;
                foreach (JsonInventory s in warehouseStock)
                {
                    total += s.size;
                }
                int warehouseSize = Convert.ToInt32(warehouses.warehouse_size);
                double availabilityW = total / Convert.ToDouble(warehouseSize) * 100;
                warehouseList.Add(new JsonWarehouse { descrption = warehouses.warehouse_description/*, id = warehouses.warehouse_id, name = warehouses.warehouse_name, location = warehouses.warehouse_location, size = Convert.ToInt32(warehouses.warehouse_size), warehousetype = Convert.ToInt32(warehouses.warehouse_warehousetype), available = availabilityW, user = Convert.ToInt32(warehouses.warehouse_user)*/ });
            }
            return warehouseList;
        }

        /// <summary>
        /// Approves the transfer.
        /// </summary>
        /// <param name="product">The product.</param>
        /// <param name="verdict">The verdict.</param>
        /// <param name="description">The description.</param>
        /// <returns>System.String.</returns>
        public string approveTransfer(jsonProduct product, string verdict, string description)
        {
            var requestAccess = new transferrequestsController();
            var requestExists = requestAccess.getTable().FirstOrDefault<transferrequest>(c => c.transferrequest_product == product.ID);

            if (requestExists == null)
            {
                return "No request found for this package";
            }

            var userAccess = new userController();
            var userExists = userAccess.getTable().FirstOrDefault<user>(u => u.user_id == product.userID);

            if (userExists == null)
            {
                return "User does not exist";
            }

            requestExists.transferrequest_verdict = verdict;
            requestExists.transferrequest_approvalDate = DateTime.Now;
            requestAccess.updateRecord(Convert.ToInt32(requestExists.transferrequest_id), requestExists);
            addProductLog("TR7", new JsonProductLog { product_id = product.ID, userID = userExists.user_id, description = userExists.user_fname + " " + userExists.user_sname + " has " + verdict + " the Request to Transfer the product." + System.Environment.NewLine + "Product ID: " + product.ID + System.Environment.NewLine + "Reason: " + description });
            var result = "Transfer Request has been " + verdict;
            return result;
        }

        /// <summary>
        /// Approves the request.
        /// </summary>
        /// <param name="verdict">The verdict.</param>
        /// <param name="prod">The product.</param>
        /// <param name="description">The description.</param>
        /// <returns>System.String.</returns>
        public string approveRequest(string verdict, JsonProducts prod, string description)
        {
            var billAccess = new billofentryController();
            var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_product == prod.id);
            var requestAccess = new releaseRequestController();
            var requestExists = requestAccess.getTable().FirstOrDefault<releaserequest>(r => r.releaserequest_product == Convert.ToInt32(billExists.billofentry_product));

            if (requestExists == null)
            {
                return "No request found for this package";
            }
            requestExists.releaserequest_verdict = verdict;
            requestExists.releaserequest_approvalDate = DateTime.Now;
            requestAccess.updateRecord(requestExists.releaserequest_id, requestExists);
            var userAccess = new userController();
            var userExists = userAccess.getTable().FirstOrDefault<user>(u => u.user_id == prod.userid);

            if (userExists == null)
            {
                return "User does not exist.";
            }
            var result = "Release Request has been " + verdict;
            addProductLog("RR6", new JsonProductLog { product_id = prod.id, userID = userExists.user_id, description = userExists.user_fname + " " + userExists.user_sname + " has " + verdict + " the Request to Release the product." + System.Environment.NewLine + "Product ID: " + prod.id + System.Environment.NewLine + "Reason: " + description });
            //emailTest email = new emailTest(userExists.user_fname + " " + userExists.user_sname, userExists.user_email, result, "Update on your request for a package release");
            return result;
        }

        /// <summary>
        /// Paypals this instance.
        /// </summary>
        public void paypal()
        {
            var test = new PayPal.Account();
            GetBalanceRequestType request = new GetBalanceRequestType();
            GetBalanceResponseType response = new GetBalanceResponseType();
            request.ReturnAllCurrencies = "YES";

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
                }
            }


        }

        /// <summary>
        /// Ownerships the request.
        /// </summary>
        /// <param name="currentOwner">The current owner.</param>
        /// <param name="newOwner">The new owner.</param>
        /// <param name="prod">The product.</param>
        /// <returns>System.String.</returns>
        public string OwnershipRequest(JsonUser currentOwner, JsonUser newOwner, JsonProducts prod)
        {
            var ownershipAccess = new billofentryController();
            var ownershipExists = ownershipAccess.getTable().FirstOrDefault<billofentry>(o => o.billofentry_user == Convert.ToInt32(currentOwner.id) && o.billofentry_product == prod.id);
            if (ownershipExists == null)
            {
                return "Ownership of this product does not exist.";
            }

            var newOwnerAccess = new userController();
            var newOwnerExists = newOwnerAccess.getTable().FirstOrDefault<user>(u => u.user_email == newOwner.email);
            if (newOwnerExists == null)
            {
                return "New Owner does not Exist.";
            }

            var ownershipReqAccess = new ownershipRequestController();
            var ownershipReqExists = ownershipReqAccess.getTable().FirstOrDefault<ownershiprequest>(o => o.ownershiprequest_owner == currentOwner.id && o.ownershiprequest_newowner == newOwnerExists.user_id && o.ownershiprequest_product == prod.id);

            if (ownershipReqExists != null)
            {
                return "Ownership Request has already been sent";
            }

            JsonOwnershipReq ownerReq = new JsonOwnershipReq();
            ownerReq.prevOwner = Convert.ToInt32(currentOwner.id);
            ownerReq.newOwner = Convert.ToInt32(newOwnerExists.user_id);
            ownerReq.acceptance = "Pending";
            ownerReq.product = prod.id;

            ownershipReqAccess.addRecord(new ownershiprequest { ownershiprequest_owner = ownerReq.prevOwner, ownershiprequest_newowner = ownerReq.newOwner, ownershiprequest_product = ownerReq.product, ownershiprequest_acceptance = ownerReq.acceptance });
            addProductLog("CO2", new JsonProductLog { userID = currentOwner.id, product_id = prod.id, description = "A Change of Ownership has been made from owner to " + newOwnerExists.user_fname + " " + newOwnerExists.user_sname });
            return "Request has been sent";
        }

        /// <summary>
        /// Approves the ownership request.
        /// </summary>
        /// <param name="verdict">The verdict.</param>
        /// <param name="user">The user.</param>
        /// <param name="prod">The product.</param>
        /// <returns>System.String.</returns>
        public string approveOwnershipRequest(string verdict, JsonUser user, JsonProducts prod)
        {
            var ownerReqAccess = new ownershipRequestController();
            var ownerReqExists = ownerReqAccess.getTable().FirstOrDefault<ownershiprequest>(o => o.ownershiprequest_newowner == Convert.ToInt32(user.id) && o.ownershiprequest_product == prod.id);
            if (ownerReqExists == null)
            {
                return null;
            }

            JsonOwnershipReq ownerReq = new JsonOwnershipReq();
            ownerReq.acceptance = verdict;
            ownerReqExists.ownershiprequest_acceptance = ownerReq.acceptance;
            ownerReqAccess.updateRecord(ownerReqExists.ownershiprequest_id, ownerReqExists);
            if (verdict == "Accepted")
            {
                var billAccess = new billofentryController();
                var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_user == Convert.ToInt32(ownerReqExists.ownershiprequest_owner) && b.billofentry_product == Convert.ToInt32(prod.id));
                billExists.billofentry_user = Convert.ToInt32(ownerReqExists.ownershiprequest_newowner);
                billAccess.updateRecord(billExists.billofentry_id, billExists);
            }
            var userAccess = new userController();
            var userExists = userAccess.getTable().FirstOrDefault<user>(u => u.user_id == user.id);

            if (userExists == null)
            {
                return null;
            }

            addProductLog("CO2", new JsonProductLog { userID = userExists.user_id, product_id = prod.id, description = "The change of Ownership has been " + verdict + " by " + userExists.user_fname + " " + userExists.user_sname });
            //var ownerExists = userAccess.getTable().FirstOrDefault<user>(u => u.user_id == Convert.ToInt32(ownerReqExists.ownershiprequest_owner));
            //var newOwnerExists = userAccess.getTable().FirstOrDefault<user>(u => u.user_id == Convert.ToInt32(ownerReqExists.ownershiprequest_newowner));
            //emailTest emailOwner = new emailTest(ownerExists.user_fname + " " + ownerExists.user_sname, ownerExists.user_email, "Dear Mr/Ms " + ownerExists.user_sname + System.Environment.NewLine + System.Environment.NewLine + "Mr/Ms " + ownerExists.user_sname + " has " + verdict + " your request to change the ownership of your package: " + System.Environment.NewLine + System.Environment.NewLine + "Product Number: " + prod.id + System.Environment.NewLine + "Product Name: " + prod.name, "Request to change Ownership");
            //emailTest emailNewOwner = new emailTest(newOwnerExists.user_fname + " " + newOwnerExists.user_sname, newOwnerExists.user_email, "Dear Mr/Ms " + newOwnerExists.user_sname + System.Environment.NewLine + System.Environment.NewLine + "You have " + verdict + " the request to change ownership of: " + System.Environment.NewLine + System.Environment.NewLine + "Product Number: " + prod.id + System.Environment.NewLine + "Product Name: " + prod.name, "Request to change Ownership");
            return "Ownership updated";
        }

        /// <summary>
        /// Gets the user ownership request.
        /// </summary>
        /// <param name="user">The user.</param>
        /// <returns>IEnumerable&lt;JsonOwnershipReq&gt;.</returns>
        public IEnumerable<JsonOwnershipReq> getUserOwnershipRequest(JsonUser user)
        {
            var ownershipReqAccess = new ownershipRequestController();
            List<ownershiprequest> ownershipReqExists = ownershipReqAccess.getTable().Where<ownershiprequest>(o => o.ownershiprequest_newowner == Convert.ToInt32(user.id) && o.ownershiprequest_acceptance == "Pending").ToList<ownershiprequest>();
            if (ownershipReqExists.Count == 0)
            {
                return null;
            }

            List<JsonOwnershipReq> ownerReq = new List<JsonOwnershipReq>();
            foreach (ownershiprequest o in ownershipReqExists)
            {
                JsonUser newOwner = new JsonUser { email = o.user.user_email, id = o.user.user_id };
                JsonUser prevOwner = new JsonUser { email = o.user1.user_email, id = o.user1.user_id };
                JsonProducts prod = new JsonProducts { id = o.product.product_id, location = o.product.product_location, arrivalDate = (DateTime)o.product.product_arrivalDate, name = o.product.product_name };
                ownerReq.Add(new JsonOwnershipReq { newOwnerInfo = newOwner, prevInfo = prevOwner, prodInfo = prod, id = o.ownershiprequest_id, prevOwner = Convert.ToInt32(o.ownershiprequest_owner), newOwner = Convert.ToInt32(o.ownershiprequest_newowner), product = Convert.ToInt32(o.ownershiprequest_product), acceptance = o.ownershiprequest_acceptance });
            }
            return ownerReq;
        }

        /// <summary>
        /// Gets the ownership request.
        /// </summary>
        /// <param name="user">The user.</param>
        /// <returns>IEnumerable&lt;JsonOwnershipReq&gt;.</returns>
        public IEnumerable<JsonOwnershipReq> getOwnershipRequest(JsonUser user)
        {
            var ownershipReqAccess = new ownershipRequestController();
            List<ownershiprequest> ownershipReqExists = ownershipReqAccess.getTable().Where<ownershiprequest>(o => o.ownershiprequest_owner == Convert.ToInt32(user.id) || o.ownershiprequest_newowner == Convert.ToInt32(user.id)).ToList<ownershiprequest>();
            if (ownershipReqExists.Count == 0)
            {
                return null;
            }

            List<JsonOwnershipReq> ownerReq = new List<JsonOwnershipReq>();
            foreach (ownershiprequest o in ownershipReqExists)
            {
                JsonUser newOwner = new JsonUser { email = o.user1.user_email, id = o.user1.user_id };
                JsonUser prevOwner = new JsonUser { email = o.user.user_email, id = o.user.user_id };
                JsonProducts prod = new JsonProducts { id = o.product.product_id, location = o.product.product_location, arrivalDate = (DateTime)o.product.product_arrivalDate, name = o.product.product_name };
                ownerReq.Add(new JsonOwnershipReq { newOwnerInfo = newOwner, prevInfo = prevOwner, prodInfo = prod, id = o.ownershiprequest_id, prevOwner = Convert.ToInt32(o.ownershiprequest_owner), newOwner = Convert.ToInt32(o.ownershiprequest_newowner), product = Convert.ToInt32(o.ownershiprequest_product), acceptance = o.ownershiprequest_acceptance });
            }
            return ownerReq;
        }

        /// <summary>
        /// Gets the trader in stock.
        /// </summary>
        /// <param name="warehouses">The warehouses.</param>
        /// <returns>IEnumerable&lt;JsonUser&gt;.</returns>
        public IEnumerable<JsonUser> getTraderInStock(JsonWarehouse warehouses)
        {
            var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_name.ToLower() == warehouses.name.ToLower());

            if (warehouseExists == null)
            {
                return null;
            }

            var warehouseStockAccess = new warehousestockController();
            List<warehousestock> warehouseStockExists = warehouseStockAccess.getTable().Where<warehousestock>(s => s.warehousestock_warehouse  == Convert.ToInt32(warehouseExists.warehouse_id)).ToList<warehousestock>();
            if (warehouseStockExists.Count == 0)
            {
                return null;
            }

            var billAccess = new billofentryController();
            List<billofentry> billExists = new List<billofentry>();

            foreach (warehousestock w in warehouseStockExists)
            {
                billExists = billAccess.getTable().Where<billofentry>(b => b.billofentry_product == w.warehousestock_product).ToList<billofentry>();
            }

            var traderAccess = new userController();
            List<user> traderExists = new List<user>();

            foreach (billofentry b in billExists)
            {
                traderExists = traderAccess.getTable().Where<user>(u => u.user_id == b.billofentry_user).ToList<user>();
            }

            List<JsonUser> traders = new List<JsonUser>();

            foreach (user u in traderExists)
            {
                traders.Add(new JsonUser { id = u.user_id, email = u.user_email, fname = u.user_fname, lname = u.user_sname });
            }

            return traders;
        }

        /// <summary>
        /// Adds the warehouse.
        /// </summary>
        /// <param name="warehouseAdd">The warehouse add.</param>
        public void addWarehouse(JsonWarehouse warehouseAdd)
        {
            var warehouseAccess = new warehouseController();
            warehouse warehouses = new warehouse { warehouse_name = warehouseAdd.name, warehouse_size = warehouseAdd.size, warehouse_location = warehouseAdd.location, warehouse_user = warehouseAdd.user, warehouse_warehousetype = warehouseAdd.warehousetype };
            warehouseAccess.addRecord(warehouses);
        }

        /// <summary>
        /// Adds the country.
        /// </summary>
        /// <param name="country">The country.</param>
        public void addCountry(JsonCountry country)
        {
            var countryAccess = new countryrelationController();
            var countryExists = countryAccess.getTable().FirstOrDefault<countryrelation>(c => c.countryrelation_name == country.name);

            countryAccess.addRecord(new countryrelation { countryrelation_name = country.name });
        }

        /// <summary>
        /// Adds the warehouse man.
        /// </summary>
        /// <param name="user">The user.</param>
        /// <returns>System.String.</returns>
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

        /// <summary>
        /// Gets the warehouse inventory.
        /// </summary>
        /// <param name="id">The warehouses.</param>
        /// <returns>IEnumerable&lt;JsonInventory&gt;.</returns>
        public IEnumerable<JsonProductInfo> WarehouseInventory(string id)
        {
            var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_id == Convert.ToInt32(id));
            if (warehouseExists == null)
            {
                return null;
            }

            var warehouseStockAccess = new warehousestockController();
            List<warehousestock> warehouseStockExists = warehouseStockAccess.getTable().Where<warehousestock>(w => w.warehousestock_warehouse == warehouseExists.warehouse_id).ToList<warehousestock>();
            if (warehouseStockExists == null)
            {
                return null;
            }

            List<JsonProductInfo> inventory = new List<JsonProductInfo>();

            foreach (warehousestock w in warehouseStockExists)
            {
                var billAccess = new billofentryController();
                var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_product == w.warehousestock_product);
                var product = new productController().getTable().First<product>(p => p.product_id == billExists.billofentry_product);
                inventory.Add(new JsonProductInfo {name=product.product_name,date=(DateTime)product .product_arrivalDate,id=product.product_id });
            }
            return inventory;
            /*var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_name.ToLower() == warehouses.name.ToLower() || w.warehouse_id == warehouses.id);

            if (warehouseExists == null)
            {
                return null;
            }

            var warehouseStockAccess = new warehousestockController();
            List<warehousestock> warehouseStockExists = warehouseStockAccess.getTable().Where<warehousestock>(w => w.warehousestock_warehouse == warehouseExists.warehouse_id).ToList<warehousestock>();
            if (warehouseStockExists == null)
            {
                return null;
            }

            List<JsonInventory> inventory = new List<JsonInventory>();

            foreach (warehousestock w in warehouseStockExists)
            {
                var billAccess = new billofentryController();
                var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_product == w.warehousestock_product);
                inventory.Add(new JsonInventory { warehouseID = Convert.ToInt32(w.warehousestock_warehouse), product = new JsonProducts { name=billExists .product .product_name}, lastChecked = Convert.ToDateTime(w.warehousestock_lastchecked), size = Convert.ToInt32(w.product.product_size), quantity = Convert.ToInt32(w.product.product_quantity), arrivalDate = Convert.ToDateTime(w.product.product_arrivalDate), owner =new JsonUser {fname =billExists.user.user_fname,lname=billExists.user.user_sname ,email=billExists.user.user_email}});
            add
            return inventory;*/
        }

        /// <summary>
        /// Gets the warehouse inventory.
        /// </summary>
        /// <param name="warehouses">The warehouses.</param>
        /// <returns>IEnumerable&lt;JsonInventory&gt;.</returns>
        public IEnumerable<JsonInventory> getWarehouseInventory(JsonWarehouse warehouses)
        {
            var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_id == warehouses.id);
            if (warehouseExists == null)
            {
                return null;
            }

            var warehouseStockAccess = new warehousestockController();
            List<warehousestock> warehouseStockExists = warehouseStockAccess.getTable().Where<warehousestock>(w => w.warehousestock_warehouse == warehouseExists.warehouse_id).ToList<warehousestock>();
            if (warehouseStockExists == null)
            {
                return null;
            }

            List<JsonInventory> inventory = new List<JsonInventory>();

            foreach (warehousestock w in warehouseStockExists)
            {
                
                var billAccess = new billofentryController();
                
                var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_product == w.warehousestock_product);

                //var productThis = new productController().getRecord();

                var locationAccess = new LocationController();
                
                var locationExists = locationAccess.getTable().FirstOrDefault<location>(l => l.location_product == w.warehousestock_product);
                
                if(locationExists == null)
                {
                    inventory.Add(new JsonInventory {productID = (int)w.warehousestock_product, warehouseID = Convert.ToInt32(w.warehousestock_warehouse), prodLocation = new jsonlocation { isle = 0, row = 0, col = 0 }, productTypeName = w.product.producttype.producttype_name, product = new JsonProducts {name =w.product .product_name }, lastChecked = Convert.ToDateTime(w.warehousestock_lastchecked), size = Convert.ToInt32(w.product.product_size), quantity = Convert.ToInt32(w.product.product_quantity), arrivalDate = Convert.ToDateTime(w.product.product_arrivalDate), owner = new JsonUser { fname =billExists.user.user_fname, lname = billExists.user.user_sname, email =billExists.user.user_email} });

                }
                else
                {   
                    inventory.Add(new JsonInventory { productID = (int)w.warehousestock_product, warehouseID = Convert.ToInt32(w.warehousestock_warehouse), prodLocation = new jsonlocation { isle = (int)locationExists.location_isle, row = (int)locationExists.location_row, col = (int)locationExists.location_column }, productTypeName = w.product.producttype.producttype_name, product = new JsonProducts { name = billExists.product.product_name }, lastChecked = Convert.ToDateTime(w.warehousestock_lastchecked), size = Convert.ToInt32(w.product.product_size), quantity = Convert.ToInt32(w.product.product_quantity), arrivalDate = Convert.ToDateTime(w.product.product_arrivalDate), owner = new JsonUser { fname = billExists.user.user_fname, lname = billExists.user.user_sname, email = billExists.user.user_email } });
                }
                

            }
            return inventory;
            /*var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_name.ToLower() == warehouses.name.ToLower() || w.warehouse_id == warehouses.id);

            if (warehouseExists == null)
            {
                return null;
            }

            var warehouseStockAccess = new warehousestockController();
            List<warehousestock> warehouseStockExists = warehouseStockAccess.getTable().Where<warehousestock>(w => w.warehousestock_warehouse == warehouseExists.warehouse_id).ToList<warehousestock>();
            if (warehouseStockExists == null)
            {
                return null;
            }

            List<JsonInventory> inventory = new List<JsonInventory>();

            foreach (warehousestock w in warehouseStockExists)
            {
                var billAccess = new billofentryController();
                var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_product == w.warehousestock_product);
                inventory.Add(new JsonInventory { warehouseID = Convert.ToInt32(w.warehousestock_warehouse), product = new JsonProducts { name=billExists .product .product_name}, lastChecked = Convert.ToDateTime(w.warehousestock_lastchecked), size = Convert.ToInt32(w.product.product_size), quantity = Convert.ToInt32(w.product.product_quantity), arrivalDate = Convert.ToDateTime(w.product.product_arrivalDate), owner =new JsonUser {fname =billExists.user.user_fname,lname=billExists.user.user_sname ,email=billExists.user.user_email}});
            }
            return inventory;*/
        }

        /// <summary>
        /// Gets the warehouse i.
        /// </summary>
        /// <param name="warehouses">The warehouses.</param>
        /// <returns>JsonWarehouse.</returns>
        public JsonWarehouse getWarehouseI(JsonWarehouse warehouses)
        {
            var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_name == warehouses.name || w.warehouse_id == warehouses.id);
            if (warehouseExists == null)
            {
                return null;
            }

            JsonWarehouse nWarehouse = new JsonWarehouse { id = warehouseExists.warehouse_id, name = warehouseExists.warehouse_name, location = warehouseExists.warehouse_location, size = Convert.ToInt32(warehouseExists.warehouse_size), user = Convert.ToInt32(warehouseExists.warehouse_user), warehousetype = Convert.ToInt32(warehouseExists.warehouse_warehousetype) };
            return nWarehouse;
        }

        /// <summary>
        /// Gets the user.
        /// </summary>
        /// <param name="users">The users.</param>
        /// <returns>JsonUser.</returns>
        public JsonUser getUser(JsonUser users)
        {
            var userAccess = new userController();
            var userExists = userAccess.getTable().FirstOrDefault<user>(u => u.user_email == users.email || u.user_id == users.id);

            if (userExists == null)
            {
                return null;
            }

            JsonUser nUser = new JsonUser { id = userExists.user_id, fname = userExists.user_fname, lname = userExists.user_sname, email = userExists.user_email, usertype = Convert.ToInt32(userExists.usertype_id ), usertypename = userExists.usertype.usertype_name};
            return nUser;
        }

        /// <summary>
        /// Gets the bill.
        /// </summary>
        /// <param name="bill">The bill.</param>
        /// <returns>IEnumerable&lt;JsonBillofEntry&gt;.</returns>
        public IEnumerable<JsonBillofEntry> getBill(JsonBillofEntry bill)
        {
            var billAccess = new billofentryController();
            List<billofentry> billExists = billAccess.getTable().Where<billofentry>(b => b.billofentry_code == bill.billCode || b.billofentry_product == bill.product || b.billofentry_user == bill.user).ToList<billofentry>();

            if (billExists.Count == 0)
            {
                return null;
            }

            List<JsonBillofEntry> billofentries = new List<JsonBillofEntry>();

            foreach (billofentry b in billExists)
            {
                billofentries.Add(new JsonBillofEntry { id = b.billofentry_id, billCode = b.billofentry_code, productName = b.product.product_name, ownerEmail = b.user.user_email, user = Convert.ToInt32(b.billofentry_user), product = Convert.ToInt32(b.billofentry_product), origin = b.billofentry_origin });
            }

            return billofentries;
        }

        /// <summary>
        /// Adds the invoice.
        /// </summary>
        /// <param name="bill">The bill.</param>
        /// <param name="product">The product.</param>
        /// <returns>System.String.</returns>
        public string addInvoice(JsonBillofEntry bill, JsonProducts product)
        {
            char[] valueNo = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
            char[] valueAlph = new char[] { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
            Random rand = new Random();
            string invoiceNo = valueAlph.ElementAt(rand.Next(0, valueAlph.Length - 1)).ToString() + valueAlph.ElementAt(rand.Next(0, valueAlph.Length - 1)).ToString() + valueNo.ElementAt(rand.Next(0, valueNo.Length - 1)).ToString() + valueNo.ElementAt(rand.Next(0, valueNo.Length - 1)).ToString() + valueAlph.ElementAt(rand.Next(0, valueAlph.Length - 1)).ToString() + valueAlph.ElementAt(rand.Next(0, valueAlph.Length - 1)).ToString();
            MessageBox.Show(invoiceNo);
            return "";
        }

        /// <summary>
        /// Adds the tax.
        /// </summary>
        /// <param name="products">The products.</param>
        /// <param name="_bill">The bill.</param>
        /// <returns>System.String.</returns>
        public string addTax(JsonProducts products, JsonBillofEntry _bill)
        {
            double addedVAT = 0.0;
            double addedPenalty = 0.0;

            var productAccess = new productController();
            var productExists = productAccess.getTable().FirstOrDefault<product>(p => p.product_id == Convert.ToInt32(products.id));
            if (productExists == null)
            {
                return "No Product";
            }

            var billAccess = new billofentryController();

            var countryAccess = new countryrelationController();
            var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_id == _bill.id);

            if (billExists == null)
            {
                return "Error, no bill of entry exists";
            }

            var countryExists = countryAccess.getTable().FirstOrDefault<countryrelation>(c => c.countryrelation_name.ToLower() == billExists.billofentry_origin.ToLower());
            addedVAT = Convert.ToDouble(productExists.product_price) * 0.14;
            if (countryExists == null)
            {
                addedPenalty = Convert.ToDouble(productExists.product_price) * Convert.ToDouble(productExists.hscode.hscode_percentage);
            }
            DateTime date = DateTime.Now;
            int count = billAccess.getTable().Where<billofentry>(b => b.billofentry_user == billExists.billofentry_user).Count();


            string invoiceNo = "" + date.Day + date.Month + date.Year + billExists.billofentry_user + count;
            var invoiceAccess = new invoiceController();
            invoice _invoice = new invoice { invoice_id = invoiceNo, invoice_vat = Convert.ToDecimal(addedVAT), invoice_penalty = Convert.ToDecimal(addedPenalty), invoice_paid = 0 };

            invoiceAccess.addRecord(_invoice);
            billExists.billofentry_invoice = invoiceNo;
            billAccess.updateRecord(billExists.billofentry_id, billExists);
            //billAccess.addRecord(new billofentry { billofentry_origin = _bill.origin, billofentry_product = productExists.product_id, billofentry_user = _bill.user, billofentry_code = _bill.billCode, billofentry_invoice = Convert.ToInt32(invoiceNo) });

            return "Tax Added to product.";
        }

        /// <summary>
        /// Gets the invoice.
        /// </summary>
        /// <param name="invoiceNum">The invoice number.</param>
        /// <param name="products">The products.</param>
        /// <returns>JsonInvoice.</returns>
        public JsonInvoice getInvoice(JsonInvoice invoiceNum, jsonProduct products)
        {
            var billAccess = new billofentryController();
            var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_product == products.ID /*|| b.billofentry_invoice == invoiceNum.id*/);
            if (billExists == null)
            {
                return null;
            }

            JsonInvoice newInvoice = new JsonInvoice { id = billExists.invoice.invoice_id, vat = Convert.ToDouble(billExists.invoice.invoice_vat), penalty = Convert.ToDouble(billExists.invoice.invoice_penalty), paid = Convert.ToDouble(billExists.invoice.invoice_paid) };

            return newInvoice;
        }

        /// <summary>
        /// Gets the message.
        /// </summary>
        /// <param name="users">The users.</param>
        /// <returns>IEnumerable&lt;JsonMessage&gt;.</returns>
        public IEnumerable<JsonMessage> getMessage(JsonUser users)
        {
            var userAccess = new userController();
            var userExists = userAccess.getTable().FirstOrDefault<user>(u => u.user_email == users.email);

            if (userExists == null)
            {
                return null;
            }

            var messageAccess = new messageController();
            List<message> messageExists = messageAccess.getTable().Where<message>(m => m.message_to == userExists.user_id).ToList<message>();

            if (messageExists.Count() == 0)
            {
                return null;
            }

            List<JsonMessage> newMessage = new List<JsonMessage>();

            foreach (message m in messageExists)
            {
                var userFrom = userAccess.getTable().FirstOrDefault<user>(u => u.user_id == Convert.ToInt32(m.message_from));
                var userTo = userAccess.getTable().FirstOrDefault<user>(u => u.user_id == Convert.ToInt32(m.message_to));
                newMessage.Add(new JsonMessage { id = m.message_id, subject = m.message_subject, convo_id = Convert.ToInt32(m.message_convoid), from = userFrom.user_email, to = userTo.user_email, message = m.message_message, stamp = Convert.ToDateTime(m.message_stamp) });
            }

            return newMessage;
        }

        /// <summary>
        /// Sends the message.
        /// </summary>
        /// <param name="messages">The messages.</param>
        /// <returns>System.String.</returns>
        public string sendMessage(JsonMessage messages)
        {
            var userAccess = new userController();
            var userFrom = userAccess.getTable().FirstOrDefault<user>(u => u.user_email == messages.from);
            var userTo = userAccess.getTable().FirstOrDefault<user>(u => u.user_email == messages.to);

            var messageAccess = new messageController();
            var messageConvoExists = messageAccess.getTable().FirstOrDefault<message>(m => (m.message_from == userFrom.user_id && m.message_to == userTo.user_id) || (m.message_from == userTo.user_id && m.message_to == userFrom.user_id));


            message newMessage;


            if (messageConvoExists == null)
            {
                newMessage = new message { message_subject = messages.subject, message_convoid = Convert.ToInt32("" + userFrom.user_id + userTo.user_id), message_from = userFrom.user_id, message_to = userTo.user_id, message_stamp = DateTime.Today, message_message = messages.message };
                messageAccess.addRecord(newMessage);
                return "Message has been sent";
            }


            newMessage = new message { message_subject = messages.subject, message_convoid = messageConvoExists.message_convoid, message_from = userFrom.user_id, message_to = userTo.user_id, message_stamp = DateTime.Today, message_message = messages.message };
            messageAccess.addRecord(newMessage);
            return "Message has been sent";
        }

        /// <summary>
        /// Pays the tax.
        /// </summary>
        /// <param name="invoices">The invoices.</param>
        /// <returns>System.String.</returns>
        public string payTax(JsonInvoice invoices)
        {
            var invoiceAccess = new invoiceController();
            var invoiceExists = invoiceAccess.getTable().FirstOrDefault<invoice>(i => i.invoice_id == invoices.id);

            if (invoiceExists == null)
            {
                return "Invoice does not exist.";
            }

            var value = invoiceExists.invoice_paid;
            value += Convert.ToDecimal(invoices.paid);
            invoiceExists.invoice_paid = value;
            invoiceAccess.updateRecord(invoiceExists.invoice_id, invoiceExists);
            return "Payment has been made.";
        }

        /// <summary>
        /// Addlocations the specified loca.
        /// </summary>
        /// <param name="loca">The loca.</param>
        /// <returns>System.String.</returns>
        public string addlocation(jsonlocation loca)
        {
            var locationaccess = new LocationController();
            location loc = new location { location_isle = loca.isle, location_row = loca.row, location_column = loca.col, location_size = loca.size, location_product = loca.product, location_warehouse = loca.warehouse, location_height = loca.height, location_length = loca.length, location_width = loca.width };
            locationaccess.addRecord(loc);

            var section = updateSection(new JsonWarehouse { id = loca.warehouse });

            if(section == "Section Error")
            {
                return "Allocating Section Error";
            }

            return "location added.";
        }

        /// <summary>
        /// Vacatelocations the specified package identifier.
        /// </summary>
        /// <param name="packageID">The package identifier.</param>
        public void vacatelocation(string packageID)
        {
            var locationaccess = new LocationController();
            var loc = locationaccess.getTable().FirstOrDefault<location>(l => l.location_product == Convert.ToInt32(int.Parse(packageID)));

            loc.location_product = null;

            locationaccess.updateRecord(loc.location_id, loc);
        }

        /// <summary>
        /// Occupylocations the specified product identifier.
        /// </summary>
        /// <param name="productID">The product identifier.</param>
        public void occupylocation(string productID)
        {
            var locationaccess = new LocationController();
            var loca = locationaccess.getTable().FirstOrDefault<location>(l => l.location_reserve == Convert.ToInt32(productID));
            loca.location_product = int.Parse(productID);
            loca.location_reserve = null;

            locationaccess.updateRecord(loca.location_id, loca);
        }

        /// <summary>
        /// Gets the package in warehouse.
        /// </summary>
        /// <param name="packageID">The package identifier.</param>
        /// <returns>jsonlocation.</returns>
        public jsonlocation getPackageInWarehouse(string packageID)
        {
            var loc = new jsonlocation();
            var getlocation = new LocationController();
            var locdetails = getlocation.getTable().FirstOrDefault<location>(l => l.location_product == int.Parse(packageID));

            loc.ID = locdetails.location_id;
            loc.isle = Convert.ToInt32(locdetails.location_isle);
            loc.row = Convert.ToInt32(locdetails.location_row);
            loc.col = Convert.ToInt32(locdetails.location_column);
            loc.size = Convert.ToInt32(locdetails.location_size);
            loc.warehouse = Convert.ToInt32(locdetails.location_warehouse);
            loc.product = Convert.ToInt32(locdetails.location_product);


            //MessageBox.Show("Isle : " + loc.isle + "  Column : " + loc.col + "  Row : " + loc.row);

            return loc;
        }

        /// <summary>
        /// Gets the warehouse locations.
        /// </summary>
        /// <param name="warehouseID">The warehouse identifier.</param>
        /// <returns>IEnumerable&lt;jsonlocation&gt;.</returns>
        public IEnumerable<jsonlocation> getWarehouseLocations(string warehouseID)
        {
            var warehouseaccess = new warehouseController();
            var warehouseExists = warehouseaccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_id == int.Parse(warehouseID));

            if (warehouseExists == null)
            {
                return null;
            }


            var locationaccess = new LocationController();
            List<location> locationlist = locationaccess.getTable().Where<location>(l => l.location_warehouse == int.Parse(warehouseID)).ToList<location>();

            if (locationlist == null)
            {
                return null;
            }

            List<jsonlocation> locations = new List<jsonlocation>();

            foreach (location l in locationlist)
            {
                locations.Add(new jsonlocation { ID = l.location_id, col = Convert.ToInt32(l.location_column), isle = Convert.ToInt32(l.location_isle), product = Convert.ToInt32(l.location_product), row = Convert.ToInt32(l.location_row), size = Convert.ToInt32(l.location_size), warehouse = Convert.ToInt32(l.location_warehouse)/*, section = l.location_section*/ });
            }
            return locations;
        }

        //Will return to reservelocation function
        /// <summary>
        /// Findavailablelocations the specified w.
        /// </summary>
        /// <param name="w">The w.</param>
        /// <param name="p">The p.</param>
        /// <returns>jsonlocation.</returns>
        public jsonlocation findavailablelocation(JsonWarehouse w, jsonProduct p)
        {
            var locationaccess = new LocationController();
            List<location> locationlist = locationaccess.getTable().Where<location>(l => l.location_warehouse == w.id && l.location_product == null && l.location_reserve == null && l.location_height > p.height && l.location_width > p.width && l.location_length > p.length).ToList<location>();

            if (locationlist == null || locationlist.Count == 0)
            {
                return null;
            }

            jsonlocation best = new jsonlocation { ID = locationlist[0].location_id, col = Convert.ToInt32(locationlist[0].location_column), isle = Convert.ToInt32(locationlist[0].location_isle), row = Convert.ToInt32(locationlist[0].location_row), height = Convert.ToInt32(locationlist[0].location_height), length = Convert.ToInt32(locationlist[0].location_length), width = Convert.ToInt32(locationlist[0].location_width) };

            foreach (location loc in locationlist)
            {
                if ((loc.location_length < best.length && loc.location_height < best.height) || (loc.location_width < best.width && loc.location_height < best.height) || (loc.location_length < best.length && loc.location_width < best.width))
                {
                    best.ID = loc.location_id;
                    best.isle = Convert.ToInt32(loc.location_isle);
                    best.row = Convert.ToInt32(loc.location_row);
                    best.col = Convert.ToInt32(loc.location_column);
                    best.height = Convert.ToInt32(loc.location_height);
                    best.length = Convert.ToInt32(loc.location_length);
                    best.width = Convert.ToInt32(loc.location_width);
                }
            }
            return best;
        }

        //don't use
        /// <summary>
        /// Findlocations the specified w.
        /// </summary>
        /// <param name="w">The w.</param>
        /// <param name="p">The p.</param>
        /// <returns>System.String.</returns>
        public string findlocation(JsonWarehouse w, jsonProduct p)
        {
            var loc = findavailablelocation(w, p);
            string inst = null;

            if (loc != null)
            {
                inst = "Location Open At Isle : " + loc.isle + " Row : " + loc.row + " Column : " + loc.col;
                return inst;
            }

            if (loc == null)
            {
                var locationaccess = new LocationController();
                List<location> locationfits = locationaccess.getTable().Where<location>(l => l.location_warehouse == w.id && l.location_height > p.height && l.location_width > p.width && l.location_length > p.length).ToList<location>();

                if (locationfits.Count == 0)

                {
                    return "Package Does Not Fit In Any Locations In The Warehouse";
                }

                for (int i = 0; i < locationfits.Count; i++)
                {
                    jsonlocation loc2 = findavailablelocation(w, new jsonProduct { length = Convert.ToInt32(locationfits[i].product.product_length), height = Convert.ToInt32(locationfits[i].product.product_height), width = Convert.ToInt32(locationfits[i].product.product_width) });
                    if (loc2 == null)
                    {
                        i = locationfits.Count;
                    }
                    else
                    {
                        inst = "Move Package ID = " + locationfits[i].location_id + ", To Isle : " + loc2.isle + ", Row : " + loc2.row + " Column : " + loc2.col;
                        inst += " \nNow Move The New Package To Isle : " + locationfits[i].location_isle + ", Row : " + locationfits[i].location_row + ", Column : " + locationfits[i].location_column;
                        return inst;
                    }
                }
            }
            return "No Location Available For This Package Yet";
        }

        //warehouse size vs capacity -for customs
        /// <summary>
        /// Warehouses the availability graph.
        /// </summary>
        /// <returns>IEnumerable&lt;jsonWarehouseAvailabilty&gt;.</returns>
        public IEnumerable<jsonWarehouseAvailabilty> WarehouseAvailabilityGraph()
        {
            var warehouseaccess = new warehouseController();
            var warehouses = warehouseaccess.getTable();
            var packageaccess = new productController();
            List<jsonWarehouseAvailabilty> warehouse = new List<jsonWarehouseAvailabilty>();

            foreach (warehouse w in warehouses)
            {
                var packages = packageaccess.getTable().Where<product>(p => p.product_location == w.warehouse_location);
                warehouse.Add(new jsonWarehouseAvailabilty { warehouse = w.warehouse_name, size = Convert.ToInt32(w.warehouse_size), capacity = packages.Count() });
            }
            return warehouse;
        }

        //size categories for lenght - for warehouses
        /// <summary>
        /// Packages the length categories.
        /// </summary>
        /// <returns>IEnumerable&lt;PackageSizeCategory&gt;.</returns>
        public IEnumerable<PackageSizeCategory> PackageLengthCategories()
        {
            var Packageaccess = new productController();
            var products = Packageaccess.getTable();
            int count1 = 0;
            int count2 = 0;
            int count3 = 0;
            int cat1 = 0;
            int cat2 = 60;
            int cat3 = 120;

            foreach (product p in products)
            {
                if (p.product_length < cat2)
                {
                    count1++;
                }
                else if (p.product_length < cat3)
                {
                    count2++;
                }
                else if (p.product_length > cat3)
                {
                    count3++;
                }
            }
            List<PackageSizeCategory> categories = new List<PackageSizeCategory>();
            categories.Add(new PackageSizeCategory { category = "Less Than 60cm", count = Convert.ToInt32(count1) });
            categories.Add(new PackageSizeCategory { category = "Less Than 120cm", count = Convert.ToInt32(count2) });
            categories.Add(new PackageSizeCategory { category = "Greater Than 120cm", count = Convert.ToInt32(count3) });
            return categories;
        }

        //size categories for Height - for warehouses
        /// <summary>
        /// Packages the height categories.
        /// </summary>
        /// <returns>IEnumerable&lt;PackageSizeCategory&gt;.</returns>
        public IEnumerable<PackageSizeCategory> PackageHeightCategories()
        {
            var Packageaccess = new productController();
            var products = Packageaccess.getTable();
            int count1 = 0;
            int count2 = 0;
            int count3 = 0;
            int cat1 = 0;
            int cat2 = 60;
            int cat3 = 120;

            foreach (product p in products)
            {
                if (p.product_height < cat2)
                {
                    count1++;
                }
                else if (p.product_height < cat3)
                {
                    count2++;
                }
                else if (p.product_height > cat3)
                {
                    count3++;
                }
            }
            List<PackageSizeCategory> categories = new List<PackageSizeCategory>();
            categories.Add(new PackageSizeCategory { category = "Less Than 60cm", count = Convert.ToInt32(count1) });
            categories.Add(new PackageSizeCategory { category = "Less Than 120cm", count = Convert.ToInt32(count2) });
            categories.Add(new PackageSizeCategory { category = "Greater Than 120cm", count = Convert.ToInt32(count3) });
            return categories;
        }

        //size categories for width - for warehouses
        /// <summary>
        /// Packagewidthes the categories.
        /// </summary>
        /// <returns>IEnumerable&lt;PackageSizeCategory&gt;.</returns>
        public IEnumerable<PackageSizeCategory> PackagewidthCategories()
        {
            var Packageaccess = new productController();
            var products = Packageaccess.getTable();
            int count1 = 0;
            int count2 = 0;
            int count3 = 0;
            int cat1 = 0;
            int cat2 = 60;
            int cat3 = 120;

            foreach (product p in products)
            {
                if (p.product_width < cat2)
                {
                    count1++;
                }
                else if (p.product_width < cat3)
                {
                    count2++;
                }
                else if (p.product_width > cat3)
                {
                    count3++;
                }
            }
            List<PackageSizeCategory> categories = new List<PackageSizeCategory>();
            categories.Add(new PackageSizeCategory { category = "Less Than 60cm", count = Convert.ToInt32(count1) });
            categories.Add(new PackageSizeCategory { category = "Less Than 120cm", count = Convert.ToInt32(count2) });
            categories.Add(new PackageSizeCategory { category = "Greater Than 120cm", count = Convert.ToInt32(count3) });
            return categories;
        }
        //warehouses incidents comparisons
        /// <summary>
        /// Warehouses the incidents.
        /// </summary>
        /// <returns>IEnumerable&lt;WarehouseIncidentsGraph&gt;.</returns>
        public IEnumerable<WarehouseIncidentsGraph> WarehouseIncidents()
        {
            productlogController logaccess = new productlogController();
            warehouseController warehouseaccess = new warehouseController();
            var warehouses = warehouseaccess.getTable();
            var log = logaccess.getTable();
            List<WarehouseIncidentsGraph> incidents = new List<WarehouseIncidentsGraph>();


            foreach (warehouse w in warehouses)
            {
                int counter = 0;
                foreach (productlog l in log)
                {
                    if (l.productlog_type == 1 && l.productlog_warehouse == w.warehouse_name)
                    {
                        counter++;
                    }
                }
                incidents.Add(new WarehouseIncidentsGraph { warehouse = w.warehouse_name, incidents = Convert.ToInt32(counter) });
            }
            return incidents;
        }

        //Most common release destination
        /// <summary>
        /// Warehouses the releases.
        /// </summary>
        /// <returns>IEnumerable&lt;WarehouseReleasescs&gt;.</returns>
        public IEnumerable<WarehouseReleasescs> WarehouseReleases()
        {
            productlogController logaccess = new productlogController();
            warehouseController warehouseaccess = new warehouseController();
            var warehouses = warehouseaccess.getTable();
            var log = logaccess.getTable();
            List<WarehouseReleasescs> releases = new List<WarehouseReleasescs>();

            foreach (warehouse w in warehouses)
            {
                int counter = 0;
                foreach (productlog l in log)
                {
                    if (l.productlog_type == 7 && l.productlog_warehouse == w.warehouse_name)
                    {
                        counter++;
                    }
                }
                releases.Add(new WarehouseReleasescs { warehouse = w.warehouse_name, releases = Convert.ToInt32(counter) });
            }
            return releases;
        }

        //number of packages coming in for each month use line graph
        /// <summary>
        /// Packageses the per month.
        /// </summary>
        /// <param name="name">The name.</param>
        /// <returns>IEnumerable&lt;PackagePerMonth&gt;.</returns>
        public IEnumerable<PackagePerMonth> PackagesPerMonth(string name)
        {

            productController productaccess = new productController();
            warehouseController warehouseaccess = new warehouseController();
            userController useraccess = new userController();
            var tuser = useraccess.getTable().Where<user>(u => u.user_fname == name || u.user_email == name);
            user actu = null;
            foreach (user w in tuser)
            {
                actu = w;
                break;
            }

            var ware = warehouseaccess.getTable().Where<warehouse>(w => w.warehouse_user == actu.user_id);
            warehouse actware = null;
            foreach (warehouse w in ware)
            {
                actware = w;
                break;
            }

            var products = productaccess.getTable().Where<product>(p => p.product_location == actware.warehouse_location);
            List<PackagePerMonth> monthly = new List<PackagePerMonth>();


            for (int k = 1; k <= 12; k++)
            {
                int count = 0;
                DateTime dtmon = new DateTime(1772, k, 24);
                foreach (product p in products)
                {
                    DateTime dtprod = (DateTime)p.product_arrivalDate;
                    if (dtprod.Month == k)
                    {
                        count++;
                    }
                }
                monthly.Add(new PackagePerMonth { month = dtmon.ToString("MMMM"), packages = count });
            }
            return monthly;
        }

        /// <summary>
        /// Storages the rate.
        /// </summary>
        /// <param name="warehouseID">The warehouse identifier.</param>
        /// <returns>IEnumerable&lt;WarehouseStorageRate&gt;.</returns>
        public IEnumerable<WarehouseStorageRate> StorageRate(string warehouseID)
        {
            productlogController logaccess = new productlogController();
            warehouseController warehouseaccess = new warehouseController();
            var warehouse = warehouseaccess.getRecord(int.Parse(warehouseID));
            var log = logaccess.getTable().Where<productlog>(p => p.productlog_warehouse == warehouse.warehouse_name);
            List<WarehouseStorageRate> rates = new List<WarehouseStorageRate>();

            for (int k = 1; k <= 12; k++)
            {
                DateTime dtmon = new DateTime(2016, k, 24);
                int countin = 0;
                int countout = 0;
                foreach (productlog p in log)
                {
                    DateTime dtprod = (DateTime)p.productlog_dateLogged;
                    if (dtprod.Month == k)
                    {
                        if (p.productlog_type == 4 || p.productlog_type == 7)
                        {
                            countout++;
                        }
                        if (p.productlog_type == 5)
                        {
                            countin++;
                        }
                    }
                }
                rates.Add(new WarehouseStorageRate { incoming = countin, outgoing = countout, month = dtmon.ToString("MMMM") });
            }
            return rates;
        }

        /// <summary>
        /// Incidentses the last month.
        /// </summary>
        /// <param name="name">The name.</param>
        /// <returns>IEnumerable&lt;OutgoingRate&gt;.</returns>
        public IEnumerable<OutgoingRate> IncidentsLastMonth(string name)
        {
            warehouseController warehouseaccess = new warehouseController();
            productlogController logaccess = new productlogController();
            var warehouses = warehouseaccess.getTable();
            List<OutgoingRate> or = new List<OutgoingRate>();
            DateTime now = DateTime.Now;

            foreach (warehouse w in warehouses)
            {
                //MessageBox.Show(now.AddMonths(1).Month.ToString());
                var outgoing = logaccess.getTable().Where<productlog>(p => p.productlog_warehouse == w.warehouse_name && (p.productlog_type == 1 && ((DateTime)p.productlog_dateLogged).AddMonths(1).Month.Equals(now.Month)));
                or.Add(new OutgoingRate { warehouse = w.warehouse_name, leaving = outgoing.Count<productlog>() });
            }
            return or;
        }

        /// <summary>
        /// Releases the ware house.
        /// </summary>
        /// <param name="warehouse">The warehouse.</param>
        /// <returns>IEnumerable&lt;ReleaseProduct&gt;.</returns>
        public IEnumerable<ReleaseProduct> releaseWareHouse(JsonWarehouse warehouse)
        {
            var warehouseStock = new warehousestockController().getTable().Where<warehousestock>(w => w.warehousestock_warehouse == warehouse.id);
            List<ReleaseProduct> items = new List<ReleaseProduct>();

            var requestList = new releaseRequestController().getTable();
            foreach (var item in warehouseStock)
            {
                try
                {
                    var release = requestList.First<releaserequest>(c => c.releaserequest_product == item.warehousestock_product);
                    if (release != null)
                    {
                        var billAccess = new billofentryController();
                        var billExists = billAccess.getTable().FirstOrDefault<billofentry>(b => b.billofentry_product == item.warehousestock_product);
                        var invoiceAccess = new invoiceController();
                        var invoiceExists = invoiceAccess.getTable().FirstOrDefault<invoice>(i => i.invoice_id == billExists.billofentry_invoice);
                        items.Add(new ReleaseProduct { id = release.releaserequest_id, invoiceTotal = Convert.ToDouble(invoiceExists.invoice_penalty + invoiceExists.invoice_vat), requested = DateTime.Now, owner = release.user.user_email, status = release.releaserequest_verdict, name = release.product.product_name, productID = (int)item.warehousestock_product });
                    }
                }
                catch (Exception) { }
            }

            return items;
        }

        /// <summary>
        /// Transfers the ware house.
        /// </summary>
        /// <param name="warehouse">The warehouse.</param>
        /// <returns>IEnumerable&lt;TransferDetails&gt;.</returns>
        public IEnumerable<TransferDetails> transferWareHouse(JsonWarehouse warehouse)
        {
            var warehouseName = new warehouseController().getTable().First<warehouse>(w => w.warehouse_id == warehouse.id).warehouse_location;
            var transferList = new transferlistController().getTable();
            var transfer = transferList.Where<transferlist>(c => c.transferlist_to == warehouseName || c.transferlist_from == warehouseName);
            
            List<TransferDetails> items = new List<TransferDetails>();
            foreach(var i in transfer)
            {
                //var transferAccess = new transferrequestsController();
                //var transferExists = transferAccess.getTable().FirstOrDefault<transferrequest>(t => t.transferrequest_product == i.transferlist_product);
                var product = new productController().getTable().First<product>(p => p.product_id == i.transferlist_product);
                items.Add(new TransferDetails {id = i.transferlist_id,/* dateIssued = (DateTime)transferExists.transferrequest_requestDate,*/ currentLocation = i.transferlist_from, destination = i.transferlist_to ,productName = product.product_name, productid = product.product_id });
            }
            /*var stock = warehouseStock.First<warehousestock>().warehouse .warehouse_location;
            
            MessageBox.Show(warehouseStock.Count() + "");
            var transferList = new transferrequestsController().getTable();
            
            foreach (var item in warehouseStock)
            {
                
                try
                {
                    var transfer = transferList.First<transferrequest>(c => c.transferrequest_to == stock || c.transferrequest_from == stock);
                    if(transfer.transferrequest_from == stock)
                    {
                        MessageBox.Show("Leaving here");
                    }
                    else if (transfer.transferrequest_to == stock)
                    {
                        MessageBox.Show("Coming here");
                    }


                    // if (release != null)
                    //{
                    //  items.Add(new TransferDetails ());
                    //}
                }
                catch (Exception e) { MessageBox.Show(e.ToString()); }
            }*/

            return items;
            
        }

        /// <summary>
        /// Gets the country p.
        /// </summary>
        /// <returns>IEnumerable&lt;JsonCountryPercentage&gt;.</returns>
        public IEnumerable<JsonCountryPercentage> getCountryP()
        {
            var countryAccess = new billofentryController();
            billofentry bill = new billofentry();
            var total = countryAccess.getTable().Count();
            List<string> countries = countryAccess.getTable().Select(b => b.billofentry_origin).Distinct().ToList<string>();
            List<JsonCountryPercentage> cp = new List<JsonCountryPercentage>();
            foreach (var o in countries)
            {
                var count = countryAccess.getTable().Where<billofentry>(b => b.billofentry_origin == o).Count();
                cp.Add(new JsonCountryPercentage { name = o, percentage = (Convert.ToDouble(count)) });
            }
            return cp;
        }

        /// <summary>
        /// Gets the outstanding tax.
        /// </summary>
        /// <returns>System.Double.</returns>
        public double getOutstandingTax()
        {
            double outstandingTax = 0.00;

            var taxAccess = new invoiceController();
            double vatCharges = Convert.ToDouble(taxAccess.getTable().Select(t => t.invoice_vat).Sum());
            double penaltyCharges = Convert.ToDouble(taxAccess.getTable().Select(t => t.invoice_penalty).Sum());
            double paidTax = Convert.ToDouble(taxAccess.getTable().Select(t => t.invoice_paid).Sum());
            outstandingTax = (vatCharges + penaltyCharges) - paidTax;
            return outstandingTax;
        }

        /// <summary>
        /// Gets the average tax.
        /// </summary>
        /// <returns>JsonTax.</returns>
        public JsonTax getAverageTax()
        {
            var taxAccess = new invoiceController();
            double averageVAT = Convert.ToDouble(taxAccess.getTable().Select(t => t.invoice_vat).Average());
            double averagePenalty = Convert.ToDouble(taxAccess.getTable().Select(t => t.invoice_penalty).Average());
            double averageTotal = averageVAT + averagePenalty;

            JsonTax tax = new JsonTax { vat = averageVAT, penalty = averagePenalty, total = averageTotal };

            return tax;
        }
        
        public string updateSection(JsonWarehouse _warehouse)
        {
            var locationAccess = new LocationController();
            List<location> locationExists = locationAccess.getTable().Where<location>(s => s.location_warehouse == _warehouse.id).ToList<location>();

            if(locationExists.Count() == 0 || locationExists == null)
            {
                return "Section Error";
            }

            double isleCount = locationExists.Select(i => i.location_isle).Distinct().Count();

            char[] section = new char[] { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

            int count = 0;
            int r = 0;

            return "Section Updated";
        }

        public string addTask(JsonTask _task)
        {
            var taskAccess = new warehousetaskController();
            taskAccess.addRecord(new warehousetask { warehousetask_employee = _task.employee, warehousetask_section = _task.section, warehousetask_type = _task.type, warehousetask_description = _task.description, warehousetask_timestamp = _task.timestamp, warehousetask_warehouse = _task.warehouse });
            return "Task added";
        }

        public IEnumerable<JsonTask> getTasks(JsonUser _user)
        {
            var taskAccess = new warehousetaskController();
            List<warehousetask> tasksExists = taskAccess.getTable().Where<warehousetask>(t => t.warehousetask_employee == _user.id).ToList<warehousetask>();

            if(tasksExists == null || tasksExists.Count == 0)
            {
                return null;
            }

            List<JsonTask> tasks = new List<JsonTask>();

            foreach(warehousetask t in tasksExists)
            {
                if(t.warehousetask_endtime == null)
                {
                    tasks.Add(new JsonTask { employee = (int)t.warehousetask_employee, section = t.warehousetask_section, description = t.warehousetask_description, timestamp = (DateTime)t.warehousetask_timestamp, type = t.warehousetask_type });
                }
            }
            return tasks;
        }

        public string completeTask(JsonTask _task)
        {
            var userAccess = new userController();
            var userExists = userAccess.getTable().FirstOrDefault<user>(u => u.user_id == _task.employee);

            if(userExists == null)
            {
                return "Employee does not exist.";
            }

            var employeeAccess = new warehouseemployeeController();
            var employeeExists = employeeAccess.getTable().FirstOrDefault<warehouseemployee>(e => e.warehouseemployee_employee == userExists.user_id);

            if(employeeExists == null)
            {
                return "Employe does not exist.";
            }

            var taskAccess = new warehousetaskController();
            var taskExists = taskAccess.getTable().FirstOrDefault<warehousetask>(t => t.warehousetask_id == _task.id && t.warehousetask_employee == employeeExists.warehouseemployee_employee && t.warehousetask_warehouse == employeeExists.warehouseemployee_warehouse);

            if(taskExists == null)
            {
                return "Error, task does not exist.";
            }

            DateTime date = DateTime.Now;
            taskExists.warehousetask_endtime = date;

            taskAccess.updateRecord(taskExists.warehousetask_id, taskExists);
            return "Task has been completed.";
        }

        public IEnumerable<IEnumerable<jsonlocation>> getWarehouseSection(JsonWarehouse _warehouse)
        {
            throw new NotImplementedException();
        }

        public string addEmployee(JsonUser _user, JsonWarehouse _warehouse)
        {

            var userAccess = new userController();

            var check = userAccess.getTable().FirstOrDefault<user>(c => c.user_email.Equals(_user.email));

            if (check != null)
            {
                return "Email Already Registered";
            }

            user newUser = new user { user_fname = _user.fname, user_email = _user.email, user_sname = _user.lname, user_password = _user.password, usertype_id = 5 };

            userAccess.addRecord(newUser);

            var userExists = userAccess.getTable().FirstOrDefault<user>(u => u.user_email == newUser.user_email);

            if(userExists == null)
            {
                return "User failed to add.";
            }

            var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_id == _warehouse.id);

            if(warehouseExists == null)
            {
                return "Warehouse does not exist.";
            }

            var employeeAccess = new warehouseemployeeController();
            employeeAccess.addRecord(new warehouseemployee { warehouseemployee_employee = userExists.user_id, warehouseemployee_warehouse = warehouseExists.warehouse_id });
            return "Employee has been added to the warehouse.";
        }

        public IEnumerable<JsonTask> getWarehouseTask(JsonWarehouse _warehouse)
        {
            var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_id == _warehouse.id);

            if(warehouseExists == null)
            {
                return null;
            }

            var taskAccess = new warehousetaskController();
            List<warehousetask> tasksExists = taskAccess.getTable().Where<warehousetask>(t => t.warehousetask_warehouse == warehouseExists.warehouse_id).ToList<warehousetask>();

            if(tasksExists.Count == 0 || tasksExists == null)
            {
                return null;
            }

            List<JsonTask> tasks = new List<JsonTask>();

            foreach(warehousetask t in tasksExists)
            {
                if(t.warehousetask_endtime == null)
                {
                    tasks.Add(new JsonTask { employee = (int)t.warehousetask_employee, section = t.warehousetask_section, description = t.warehousetask_description, type = t.warehousetask_type, timestamp = (DateTime)t.warehousetask_timestamp });
                }
            }
            return tasks;
        }

        public IEnumerable<JsonUser> getEmployees(JsonWarehouse _warehouse)
        {
            var warehouseAccess = new warehouseController();
            var warehouseExists = warehouseAccess.getTable().FirstOrDefault<warehouse>(w => w.warehouse_id == _warehouse.id);

            if(warehouseExists == null)
            {
                return null;
            }

            var employeeAccess = new warehouseemployeeController();
            List<warehouseemployee> employeesExists = employeeAccess.getTable().Where<warehouseemployee>(e => e.warehouseemployee_warehouse == warehouseExists.warehouse_id).ToList<warehouseemployee>();

            if(employeesExists.Count() == 0 || employeesExists == null)
            {
                return null;
            }

            var userAccess = new userController();
            List<user> userExists = new List<user>();

            foreach(warehouseemployee e in employeesExists)
            {
                userExists.Add(userAccess.getTable().FirstOrDefault<user>(u => u.user_id == e.warehouseemployee_employee));
            }

            List<JsonUser> employee = new List<JsonUser>();

            foreach(user u in userExists)
            {
                employee.Add(new JsonUser { id = u.user_id, fname = u.user_fname, lname = u.user_sname, email = u.user_email });
            }

            return employee;
        }

        /// <summary>
        /// Reservelocations the specified jloc.
        /// </summary>
        /// <param name="jloc">The jloc.</param>
        /// <param name="packageid">The packageid.</param>
        public void Reservelocation(jsonlocation jloc, string packageid)
        {
            var locationaccess = new LocationController();
            var loca = locationaccess.getTable().First<location>(l => l.location_id == jloc.ID);
            loca.location_reserve = int.Parse(packageid);

            locationaccess.updateRecord(loca.location_id, loca);
        }

        //overall rate at which the warehouse is filling up
        /// <summary>
        /// Storages the rates.
        /// </summary>
        /// <returns>IEnumerable&lt;WarehousesStorageRates&gt;.</returns>
        public IEnumerable<WarehousesStorageRates> StorageRates()
        {
            warehouseController warehouseaccess = new warehouseController();
            productlogController logaccess = new productlogController();
            var warehouses = warehouseaccess.getTable();
            var log = logaccess.getTable();
            List<WarehousesStorageRates> rates = new List<WarehousesStorageRates>();

            foreach (warehouse w in warehouses)
            {
                int countin = 0;
                int countout = 0;
                foreach (productlog p in log)
                {
                    if (p.productlog_warehouse == w.warehouse_name && p.productlog_type == 5)
                    {
                        countin++;
                    }
                    if (p.productlog_warehouse == w.warehouse_name && (p.productlog_type == 4 || p.productlog_type == 7))
                    {
                        countout++;
                    }
                }
                rates.Add(new WarehousesStorageRates { warehouse = w.warehouse_name, incoming = countin, outgoing = countout });
            }
            return rates;
        }


        /// <summary>
        /// Storages the filled by.
        /// </summary>
        /// <returns>IEnumerable&lt;StorageFilledBy&gt;.</returns>
        public IEnumerable<StorageFilledBy> StorageFilledBy()
        {
            warehouseController warehouseaccess = new warehouseController();
            productlogController logaccess = new productlogController();
            productController productaccess = new productController();

            List<StorageFilledBy> storages = new List<StorageFilledBy>();

            var warehouses = warehouseaccess.getTable();
            var log = logaccess.getTable();

            foreach (warehouse w in warehouses)
            {
                int countin = 0;
                int countout = 0;
                double capacity = productaccess.getTable().Where<product>(p => p.product_location == w.warehouse_location).ToList<product>().Count();

                foreach (productlog p in log)
                {
                    if (p.productlog_warehouse == w.warehouse_name && p.productlog_type == 5)
                    {
                        countin++;
                    }
                    if (p.productlog_warehouse == w.warehouse_name && (p.productlog_type == 4 || p.productlog_type == 7))
                    {
                        countout++;
                    }
                }
                DateTime est = (DateTime)w.warehouse_established;
                var rate = countin - countout;
                var difference = DateTime.Now.Subtract(est).TotalDays;
                var dailyrate = (rate / difference);
                var size = w.warehouse_size;
                int DaysTilFull = 0;

                if (dailyrate > 0)
                {
                    while (capacity < size)
                    {
                        capacity += dailyrate;
                        DaysTilFull++;
                    }
                }
                if (dailyrate <= 0)
                {
                    DaysTilFull = -1;
                }

                storages.Add(new JsonObjects.StorageFilledBy { warehouse = w.warehouse_name, DaysTilFull = DaysTilFull });
            }
            return storages;
        }

        /// <summary>
        /// finds the number of incidents last month per isle.
        /// </summary>
        /// <param name="warehouseID">The warehouse identifier.</param>
        /// <returns>Number of incidents per isle</returns>
        public IEnumerable<incidentsperisle> IncidentsPerIsle(string warehouseID)
        {
            /*productlogController logaccess = new productlogController();
            warehouseController warehouseaccess = new warehouseController();            
            
            List<incidentsperisle> ipi = new List<incidentsperisle>();

            var warehouse = warehouseaccess.getRecord((Convert.ToInt32(warehouseID)));
            var log = logaccess.getTable().Where<productlog>(p => p.productlog_warehouse == warehouse.warehouse_name);
            DateTime now = DateTime.Now;
            var prev = now.AddMonths(-1).Month;
                for (int k = 1; k <= warehouse.warehouse_isles; k++)
                {
                    int counter = 0;
                    foreach (productlog p in log)
                    {
                      DateTime when = (DateTime)p.productlog_dateLogged;
                      if(p.productlog_incidentisle == k && when.Month == prev && (when.Year == now.Year || (when.Year == (now.Year - 1) && now.Month == 1)))
                      {
                            counter++;
                      }
                    }
                    ipi.Add(new incidentsperisle { isle = k, incidents = counter });
            }
           
            return ipi;*/
            return null;
        }

        public IEnumerable<ReleasesPerMonth> releasespermonth(string warehouseID)
        {
            productlogController logaccess = new productlogController();
            warehouseController warehouseaccess = new warehouseController();
            var warehouse = warehouseaccess.getRecord(Convert.ToInt32(warehouseID));
            List<ReleasesPerMonth> rpm = new List<ReleasesPerMonth>();

            var log = logaccess.getTable().Where<productlog>(p => p.productlog_warehouse == warehouse.warehouse_name && p.productlog_type == 7);
            DateTime now = DateTime.Now;

            for (int k = 1; k <= 12; k++)
            {
                now.AddMonths(-k);
                int counter = 0;
                foreach (productlog p in log)                    
                {
                  //  MessageBox.Show(p.productlog_type.ToString());
                    if(((DateTime)p.productlog_dateLogged).Month == now.AddMonths(-k).Month  && ((DateTime)p.productlog_dateLogged).Year == now.Year)
                    {
                        counter++;
                    }          
                }
                DateTime m = new DateTime(2016, now.AddMonths(-k).Month, 01);
                rpm.Add(new ReleasesPerMonth { month = m.ToString("MMMM"), releases = counter });
            }
            return rpm;
        }

        /// <summary>
        /// Customsdashes this instance.
        /// </summary>
        /// <returns>System.String.</returns>
        public int customsdasha()
        {
            productController paccess = new productController();
            var pacakgestoday = paccess.getTable().Where<product>(p => ((DateTime)p.product_arrivalDate).Month == DateTime.Now.Month && ((DateTime)p.product_arrivalDate).Day == DateTime.Now.Day && ((DateTime)p.product_arrivalDate).Year == DateTime.Now.Year).Count<product>();
            return pacakgestoday;
        }

        public int customsdashb()
        {
            productController paccess = new productController();
            var pacakgestoday = paccess.getTable().Count<product>();
            return pacakgestoday;
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
