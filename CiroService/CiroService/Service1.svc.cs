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
    
        public string login(jsonLoginUser login)
        {
            var userAccess = new userController();
            IEnumerable<user> users = userAccess.getTable();
            var user = users.FirstOrDefault<user>(c => (c.user_fname.Equals(login.name) || c.user_email.Equals(login.password) ) && c.user_password.Equals(login.password));
            if (user == null)
            {
                return "False";
            }
            var userType = new usertypeController();
            string usertype = userType.getRecord(user.usertype_id).usertype_name;
            emailTest email = new emailTest(user.user_fname + " " + user.user_sname, user.user_email, "Hello " + user.user_fname + ", Welcome back to Ciro. If you have any queries or comment please email us your concerns.", "Signed in to Ciro Solutions");
            return JsonConvert.SerializeObject(new jsonLogin {id=user.user_id,email=user.user_fname+" " + user.user_sname, type=usertype});
        }

        public string register(JsonUser regUser)
        {
            var userstable = new userController();
            
            var check = userstable.getTable().FirstOrDefault<user>(c => c.user_email.Equals(regUser.email));
            
            if (check != null)
            {
                return "Email Already Registered";
            }
            
            user newUser = new user { user_fname = regUser.fname, user_email = regUser.email, user_sname = regUser.lname, user_password = regUser.password, usertype_id = 2, user_id = userstable.getTable().Count() };
    
            userstable.addRecord(newUser);
            emailTest email = new emailTest(newUser.user_fname + " " + newUser.user_sname, newUser.user_email, "Hello " + newUser.user_fname + ", Welcome to Ciro. You are now a member of our family, Enjoy!", "Registered to Ciro Solutions");
            return "Registered";
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

            List<product> products = null;

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
            MessageBox.Show("method");
            var productAccess = new productController();
            MessageBox.Show("addp");
            product pro = new product { product_name = prod.name, product_price = Convert.ToDecimal(prod.price), product_id = prod.id, product_quantity = prod.quantity, product_producttype = prod.producttype, product_location = prod.location, product_arrivalDate = prod.arrivalDate};
            MessageBox.Show("controller");
            productAccess.addRecord(pro);
            MessageBox.Show("adddb");
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

        public string releaseRequest(string uID, string pID, string description)
        {
            var productAccess = new billofentryController();
            var productExists = productAccess.getTable().FirstOrDefault<billofentry>(c => c.billofentry_product == Convert.ToInt32(pID) && c.billofentry_user == Convert.ToInt32(uID));

            if(productExists == null)
            {
                return "No such package is Owned by user";
            }

            var request = new releaseRequestController();
            var requestExists = request.getTable().FirstOrDefault<releaserequest>(c => c.releaserequest_product == Convert.ToInt32(pID) && c.releaserequest_user == Convert.ToInt32(uID));

            if(requestExists == null)
            {
                request.addRecord(new releaserequest { releaserequest_product = Convert.ToInt32(pID), releaserequest_user = Convert.ToInt32(uID)});
                return "Request has been uploaded.";
            }
            else
            {
                return "Request has already been made.";
            }
        }

        public IEnumerable<JsonReleaseRequest> getRelease(string id)
        {
            var requestAccess = new releaseRequestController();
            List<releaserequest> requestExists = requestAccess.getTable().Where<releaserequest>(c => c.releaserequest_user == Convert.ToInt32(id)).ToList<releaserequest>();

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
        public string addProductLog(string code, string description, JsonProducts prod)
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
            log.productlog_product = Convert.ToInt32(billExists.billofentry_product);
            if(code == "I9")
            {
                log.productlog_description = "Incident (@ " + DateTime.Now + "): " + description;
                productlogAccess.addRecord(log);
                emailTest email = new emailTest(userExists.user_fname + " " + userExists.user_sname, userExists.user_email, "We at Ciro would like to inform you about your package. The following log as been updated on the state of your package:" + System.Environment.NewLine + System.Environment.NewLine + log.productlog_description, "An Updated Log on your Package");
                return "I9 report added to log";
            }
            else if (code == "TR7")
            {
                log.productlog_description = "Transfer Request (@ " + DateTime.Now + "): " + description;
                productlogAccess.addRecord(log);
                return "TR7 report added to log";
            }
            else if (code == "RR6")
            {
                log.productlog_description = "Release Request (@ " + DateTime.Now + "): " + description;
                productlogAccess.addRecord(log);
                return "RR6 report added to log";
            }
            else if (code == "T2")
            {
                log.productlog_description = "Transfer (@ " + DateTime.Now + "): " + description;
                productlogAccess.addRecord(log);
                return "T2 report added to log";
            }
            else if (code == "D3")
            {
                log.productlog_description = "Delivered (@ " + DateTime.Now + "): " + description;
                productlogAccess.addRecord(log);
                emailTest email = new emailTest(userExists.user_fname + " " + userExists.user_sname, userExists.user_email, "We at Ciro would like to inform you about your package. The following log as been updated on the state of your package:" + System.Environment.NewLine + System.Environment.NewLine + log.productlog_description, "Delivery of Package");
                return "D3 report added to log";
            }
            else
            {
                return "No such code";
            }
        }

        public IEnumerable<JsonProductLog> getProductLog(string id)
        {
            var logAccess = new productlogController();
            List<productlog> logExists = logAccess.getTable().Where<productlog>(c => c.productlog_product == Convert.ToInt32(id)).ToList<productlog>();

            if (logExists.Count() == 0)
            {
                return null;
            }

            List<JsonProductLog> productLogList = new List<JsonProductLog>();
            foreach (productlog log in logExists)
            {
                productLogList.Add(new JsonProductLog { product_id = Convert.ToInt32(log.productlog_product), description = log.productlog_description});
            }

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

            List<JsonWarehouse> warehouseList = new List<JsonWarehouse>();
            foreach(warehouse warehouses in warehouseExists)
            {
                warehouseList.Add(new JsonWarehouse { id = warehouses.warehouse_id, name = warehouses.warehouse_name, location = warehouses.warehouse_location, size = Convert.ToInt32(warehouses.warehouse_size), type_id = Convert.ToInt32(warehouses.warehouse_warehousetype) });
            }
            return warehouseList;
        }

        public string approveTransfer(string id, string verdict)
        {
            var requestAccess = new transferrequestsController();
            var requestExists = requestAccess.getTable().FirstOrDefault<transferrequest>(c => c.transferrequest_product == Convert.ToInt32(id));

            if (requestExists == null)
            {
                return "No request found for this package";
            }

            requestExists.transferrequest_verdict = verdict;
            requestAccess.updateRecord(Convert.ToInt32(id), requestExists);
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
            emailTest email = new emailTest(userExists.user_fname + " " + userExists.user_sname, userExists.user_email, result, "Update on your request for a package release");
            return result;
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
