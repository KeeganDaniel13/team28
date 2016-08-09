using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Ciro.Customs
{
    public partial class AddCountryRelation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd(object sender, EventArgs e)
        {
            var serviceConnection = new CiroService.Service1Client();
            serviceConnection.addCountry(new CiroService.JsonCountry { name = txtName.Value });
        }
    }
}