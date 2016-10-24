using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class customs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void customsa()
        {
            var serve = new CiroService.Service1Client();
            var content = serve.customsdasha();

            Response.Write(content);
        }

        protected void customsb()
        {
            var serve = new CiroService.Service1Client();
            var content = serve.customsdashb();

            Response.Write(content);
        }
    }
}