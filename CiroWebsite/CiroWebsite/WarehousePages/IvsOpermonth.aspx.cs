using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite.WarehousePages
{
    public partial class IvsOpermonth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void mRate()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRate("3");

            string list = "";

            foreach (CiroService.WarehouseStorageRate r in rates)
            {
                list += "'" + (r.incoming - r.outgoing) + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void mincoming()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRate("3");

            string list = "";

            foreach (CiroService.WarehouseStorageRate r in rates)
            {
                list += "'" + r.incoming + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void mOutgoing()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRate("3");

            string list = "";

            foreach (CiroService.WarehouseStorageRate r in rates)
            {
                list += "'-" + r.outgoing + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void month()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRate("3");

            string list = "";

            foreach (CiroService.WarehouseStorageRate r in rates)
            {
                list += "'" + r.month + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
    }
}