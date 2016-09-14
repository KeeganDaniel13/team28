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
        public string countryName = "'China', 'USA'";
        public string countryData = " ";
        protected void Page_Load(object sender, EventArgs e)
        {
        }

    }
}