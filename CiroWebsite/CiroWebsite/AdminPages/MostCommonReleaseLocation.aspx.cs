using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite.AdminPages
{
    public partial class MostCommonReleaseLocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void getwarehouses()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.WarehouseAvailabilityGraph();

            string list = "";

            foreach (CiroService.jsonWarehouseAvailabilty a in warehouses)
            {
                list += "'" + a.warehouse + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
        protected void getReleases()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.WarehouseReleases();

            string list = "";

            foreach (CiroService.WarehouseReleasescs a in warehouses)
            {
                list += "'" + a.releases + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
    }
}