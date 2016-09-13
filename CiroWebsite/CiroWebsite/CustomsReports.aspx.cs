using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace CiroWebsite
{
    public partial class CustomsReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void getwarehouses()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.WarehouseAvailabilityGraph();

            string list = "";

            foreach(CiroService.jsonWarehouseAvailabilty a in warehouses)
            {
                list += "'"  + a.warehouse + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void getsizeused()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.WarehouseAvailabilityGraph();

            string list = "";

            foreach (CiroService.jsonWarehouseAvailabilty a in warehouses)
            {
                list += "'" + a.size + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
        protected void getCapacity()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.WarehouseAvailabilityGraph();

            string list = "";

            foreach (CiroService.jsonWarehouseAvailabilty a in warehouses)
            {
                list += "'" + a.capacity + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void getIncidents()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.WarehouseIncidents();

            string list = "";

            foreach (CiroService.WarehouseIncidentsGraph a in warehouses)
            {
                list += " {value:" + a.incidents + ", name:'" + a.warehouse + "'},";
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

        protected void getwarehousesrate()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.IncidentsLastMonth("");

            string list = "";

            foreach (CiroService.OutgoingRate a in warehouses)
            {
                list += "'" + a.warehouse + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
        protected void getrateValues()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.IncidentsLastMonth("");


            string list = "";

            foreach (CiroService.OutgoingRate a in warehouses)
            {
                list += "'" + a.leaving + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
    }
}