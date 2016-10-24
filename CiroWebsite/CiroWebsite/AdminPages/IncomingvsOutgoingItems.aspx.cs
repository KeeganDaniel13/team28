using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite.AdminPages
{
    public partial class IncomingvsOutgoingItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void warehouse()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRates();

            string list = "";

            foreach (CiroService.WarehousesStorageRates r in rates)
            {
                list += "'" + r.warehouse + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void incoming()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRates();

            string list = "";

            foreach (CiroService.WarehousesStorageRates r in rates)
            {
                list += "'" + r.incoming + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void Outgoing()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRates();

            string list = "";

            foreach (CiroService.WarehousesStorageRates r in rates)
            {
                list += "'-" + r.outgoing + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
        protected void Rate()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRates();

            string list = "";

            foreach (CiroService.WarehousesStorageRates r in rates)
            {
                list += "'" + (r.incoming - r.outgoing) + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
    }
}