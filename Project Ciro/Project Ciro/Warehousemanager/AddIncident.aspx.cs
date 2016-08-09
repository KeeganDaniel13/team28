using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Ciro.Warehousemanager
{
    public partial class AddIncident : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addincident(object sender, EventArgs e)
        {
            var serve = new CiroService.Service1Client();
            string ext = "";
            if(image.Value[0] == 'j')
            {
                ext = ".jpg";
            }

            if (image.Value[0] == 'p')
            {
                ext = ".png";
            }

            if (image.Value[0] == 'b')
            {
                ext = ".bmp";
            }

            CiroService.jsonIncident incident = new CiroService.jsonIncident {description = txtdescription.Value, image = image.Value + ext.ToString(),productID = int.Parse(package.Value)};
            serve.addIncident(incident);
        }
    }
}