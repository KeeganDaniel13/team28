using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class AdminReports : System.Web.UI.Page
    {
        public double chargedVAT;
        public double chargedPenalty;
        public double chargedTotal;
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
    }
}