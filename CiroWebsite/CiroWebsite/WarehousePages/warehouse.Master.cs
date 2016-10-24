using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class warehouse : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user =(CiroService .JsonUser) Session["user"];
            if(user == null || user.usertypename != "warehouse")
            {
                Session["user"] = null;
                Response.Redirect("../signin.aspx");
            }
            else
            {
                name.InnerHtml = user.fname + " " + user.lname;
                title.InnerHtml = user.usertypename;
            }
        }

        protected void signout(object sender,EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("../signin.aspx");
        }
    }
}