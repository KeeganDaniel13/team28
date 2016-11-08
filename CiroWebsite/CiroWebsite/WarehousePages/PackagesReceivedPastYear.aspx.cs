using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite.WarehousePages
{
    public partial class PackagesReceivedPastYear : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void getMonths()
        {
            var serve = new CiroService.Service1Client();
            CiroService.JsonUser user = (CiroService.JsonUser)Session["User"];
            var warehouses = serve.releasespermonth((user.warehouseID).ToString());

            string list = "";

            foreach (CiroService.ReleasesPerMonth a in warehouses)
            {
                list += "'" + a.month + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);        
        }

        protected void getreleases()
        {
            var serve = new CiroService.Service1Client();
            CiroService.JsonUser user = (CiroService.JsonUser)Session["User"];
            var warehouses = serve.releasespermonth((user.warehouseID).ToString());

            string list = "";

            foreach(CiroService.ReleasesPerMonth a in warehouses)
            {
                list += "'" + a.releases + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
    }
}