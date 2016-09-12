using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class ciro : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }



        protected void loadNav()
        {
            var user = (CiroService.JsonUser)Session["user"];
            if (user.usertypename.Equals("cusotms"))
            {
                loadCustoms();
            }
                    
        }
        private void loadCustoms()
        {
            //var body = "<ul>";
            var body = "<li class='nav-item dropdown'>";
            body += "<a href='customs.aspx' id='' class=''>";
            body += "Home";
            body += "</a>";
            body += "</li>";
            //body += "</ul>";
            Response.Write(body);
        }
    }
}