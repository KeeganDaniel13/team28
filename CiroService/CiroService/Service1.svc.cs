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

namespace CiroService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        public string GetData()
        {
            MessageBox.Show("Data");
            var userAccess = new userController();
            UserDemo[] user = new UserDemo[2];
            user[0] = new UserDemo();
            user[1] = new UserDemo();
            user[0].Name = userAccess.getRecord(1).user_fname;
            user[0].id = userAccess.getRecord(1).user_id;
            user[1].Name = userAccess.getRecord(2).user_fname;
            user[1].id = userAccess.getRecord(2).user_id;
            return JsonConvert.SerializeObject(user);
        }

        public string login(string name,string password)
        {
            MessageBox.Show("Login");
            var userAccess = new userController();
            IEnumerable<user> users = userAccess.getTable();
            var user = users.FirstOrDefault<user>(c => c.user_fname.Contains(name) && c.user_password.Contains(password));
            if (user != null)
            {
                return "user exists";
            }
            return "user doesn't exist";
        }

        public IEnumerable<product> listProduct()
        {
            MessageBox.Show("Products");
            var prod = new productController();
            IEnumerable<product> products = prod.getTable();
            return products;
        }
        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }
    }
}
