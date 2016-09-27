using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {
            var server = new CiroService.Service1Client();
            var user = server.login(new CiroService.jsonLoginUser { name = email.Value, password = pass.Value });

            if (user == null)
            {
                wrong.Visible = true;
            }
            else
            {
                Session["user"] = user;
                if (user.usertypename.ToLower().Equals("client"))
                {
                    Response.Redirect("inventory.aspx");
                }
                else if (user.usertypename.ToLower().Equals("custom"))
                {
                    
                    Response.Redirect("customs.aspx");
                }
                else if(user.usertypename.ToLower ().Equals("admin"))
                {
                    Response.Redirect("CustomsReports.aspx");
                }
                else
                {
                    Response.Redirect("warehouseinventory.aspx");
                }
            }
        }
    }
}