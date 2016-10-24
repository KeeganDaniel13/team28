using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite.AdminPages
{
    public partial class IncidentsLastMotnh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void getwarehousesrate()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.WarehouseIncidents();

            string list = "";

            foreach (CiroService.WarehouseIncidentsGraph a in warehouses)
            {
                list += "'" + a.warehouse + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
        protected void getrateValues()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.WarehouseIncidents();

            string list = "";

            foreach (CiroService.WarehouseIncidentsGraph a in warehouses)
            {
                list += "'" + a.incidents + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
    }
}