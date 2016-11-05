using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace CiroWebsite
{
    public partial class Client : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                var user = Session["user"] as CiroService.JsonUser;
                welcome.InnerHtml = user.fname + ", " + user.lname;
                return;
            }
            Response.Redirect("../signin.aspx");
            
        }
    }
}