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
            string usertype = userType.getRecord(user.usertype_id).usertype_type;
            return new jsonLogin {id=user.user_id,email=user.user_fname+" " + user.user_sname, type=usertype};
        }

        public IEnumerable<jsonProduct> clientProducts(string id)
        {
            var productsTable = new productController();
            
            List<product> products = productsTable.getTable().Where<product>(p => p.user_id == Convert.ToInt32(id)).ToList<product>();
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
            warehousestock warehouseID = stockTable.getTable().First<warehousestock>(c => c.product_id_warehousestock == newRequest.productID);
            warehouseController warehouseTable = new warehouseController();
            warehouse warehouseName = warehouseTable.getTable().First<warehouse>(c => c.warehouse_id == warehouseID.warehouse_id_warehousestock);

            newTransfer.transferrequest_description = newRequest.description;
            newTransfer.user_id_transferrequest = newRequest.userID;
            newTransfer.package_id_transferrequest = newRequest.productID;
            newTransfer.transferrequest_to = newRequest.endWarehouse;
            newTransfer.transferrequest_from =warehouseName.warehouse_location;
            DateTime date = new DateTime();
            newTransfer.user_id_transferrequest = date.Year + date.Month + date.Day + newRequest.userID +newRequest.productID;
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
        //
        public string stockTake(stockTakeInfo stockTake)
        {

            //table access
            var productTable = new productController();
            var stockTable = new warehousestockController();
            var warehouseTable = new warehouseController();
            //list rep of tables
            IEnumerable <product> products = productTable.getTable();
            IEnumerable<warehousestock> stockInWarehouses =stockTable.getTable();
            IEnumerable<warehouse> warehouses = warehouseTable.getTable();

            product stock = products.First<product>(c => c.product_id == stockTake.id);
            warehouse warehouse = warehouses.First<warehouse>(c => c.warehouse_location.Equals(stockTake.location));
            warehousestock stockInWarehouse = stockInWarehouses.First<warehousestock>(c => c.product_id_warehousestock==stockTake.id);
            if(stockInWarehouse == null)
            {
                //Add new 
                stockTable.addRecord(new warehousestock {warehousestock_id=stockInWarehouses.Count(),product_id_warehousestock=stockTake.id});
                return "Added";
                //registerig first accpetance in warehouse
            }
            else
            {
                //update a table


            }
            
            
            //

          
            return "False";
        }

        public void stockAdd(jsonProduct newProduct)
        {
            //add item to product table
            productController pTable = new productController();
            int count = pTable.getTable().Count();
            pTable.addRecord(new product { product_id = count, product_name = newProduct.Name, producttype_id = newProduct.productType,product_quantity=1,product_price=newProduct.value });

            //Add Item to Transfer List
            transferlistController tTable = new transferlistController();
            count = tTable.getTable().Count();
            tTable.addRecord(new transferlist { transferlist_id=count,transferlist_description="New Product For Warehousing",transferlist_from= newProduct.currentLocation,transferlist_to=newProduct.transferLocation});


            //Generate QRCode and save
            string path = "C:\\Users\\Tshenolo\\team28\\CiroService\\CiroService\\images\\";
            string qrcodeInfo = "https://www.youtube.com/watch?v=IHbY3blOGwc";
            QRCodeEncoder qrcodeMaker = new QRCodeEncoder();
            qrcodeMaker.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.H;
            qrcodeMaker.QRCodeScale = 10;

            
            Bitmap qrcode = qrcodeMaker.Encode(qrcodeInfo);
            qrcode.Save(path+"new.jpg",ImageFormat.Jpeg);
            //


        }

        public IEnumerable<jsonTask> taskList(string id)
        {
            return null;
        }

        public void addIncident()
        {
            throw new NotImplementedException();
        }

        public warehouse warehouseInfo(string id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<warehouse> warehouses()
        {
            throw new NotImplementedException();
        }

        public void stockleavingWarehouse()
        {
            throw new NotImplementedException();
        }

        public string stockTake(string id)
        {
            throw new NotImplementedException();
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
