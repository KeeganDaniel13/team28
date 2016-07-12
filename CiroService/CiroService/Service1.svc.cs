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
            string usertype = userType.getRecord(user.usertype_id).usertype_type;
            return JsonConvert.SerializeObject(new jsonLogin {id=user.user_id,email=user.user_fname+" " + user.user_sname, type=usertype});
        }

        public string clientProducts(string id)
        {
            var productsTable = new productController();
            
            List<product> products = productsTable.getTable().Where<product>(p => p.user_id == Convert.ToInt32(id)).ToList<product>();
            if(products.Count == 0)
            {
                return "NON";
            }
            List<jsonProduct> sendProducts = new List<jsonProduct>();
            foreach (product p in products)
            {
                sendProducts.Add(new jsonProduct { ID = p.product_id,Name = p.product_name,value = Convert.ToDecimal( p.product_price )});
            }
            return JsonConvert.SerializeObject(sendProducts);
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
