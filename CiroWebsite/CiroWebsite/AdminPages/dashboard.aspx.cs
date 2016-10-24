using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace CiroWebsite
{
    public partial class dashboard : System.Web.UI.Page
    {
        public double chargedVAT;
        public double chargedPenalty;
        public double chargedTotal;
        public string countryName;
        public string countryData;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void getOutstanding()
        {
            var service = new CiroService.Service1Client();
            double outstandingTax = 0.00;
            outstandingTax = service.getOutstandingTax();
            Response.Write(outstandingTax);
        }

        protected void getAverageTax()
        {            
            var service = new CiroService.Service1Client();
            CiroService.JsonTax averageTax = service.getAverageTax();
            chargedVAT = averageTax.vat;
            chargedPenalty = averageTax.penalty;
            chargedTotal = averageTax.total;
        }

        protected void getVAT()
        {
            Response.Write(chargedVAT.ToString("#.##"));
        }

        protected void getPenalty()
        {
            Response.Write(chargedPenalty.ToString("#.##"));
        }

        protected void getTotal()
        {
            Response.Write(chargedTotal.ToString("#.##"));
        }

        protected void getCountry()
        {
            var service = new CiroService.Service1Client();
            List<CiroService.JsonCountryPercentage> cp = new List<CiroService.JsonCountryPercentage>();
            var countryP = service.getCountryP();
            foreach (CiroService.JsonCountryPercentage c in countryP)
            {
                cp.Add(new CiroService.JsonCountryPercentage { name = c.name, percentage = c.percentage });
            }

            for (int i = 0; i < cp.Count(); i++)
            {
                countryName += "{name : '" + cp[i].name + "',value : " + cp[i].percentage + ".00},";
                countryData += "'" + Math.Round(cp[i].percentage) + "',";
            }

            countryName = countryName.Remove(countryName.Length - 1);
            countryData = countryData.Remove(countryData.Length - 1);
        }
        //      {name : 'Saudi Arabia', value : 28397.812},
        protected void getCountryName()
        {
            getCountry();
            Response.Write(countryName);
        }

        protected void getData()
        {
            Response.Write(countryData);
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
    }
}