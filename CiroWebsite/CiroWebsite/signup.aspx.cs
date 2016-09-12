using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace CiroWebsite
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register(object sender, EventArgs e)
        {
            var server = new CiroService.Service1Client();
            var stat = server.register(new CiroService.JsonUser { fname = fname.Value, lname = lname.Value, email = email.Value, password = password.Value, usertype = 1 });
            if (!stat.ToLower().Equals("registered"))
            {
                error.Visible = true;
                MessageBox.Show("Used");
                return;
            }
            Response.Redirect("signin.aspx");
        }
    }
}