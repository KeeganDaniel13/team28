using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user =(CiroService.JsonUser) Session["user"];
            name.InnerHtml = user.fname + " " + user.lname;
            title.InnerHtml = user.usertypename;
        }
    }
}