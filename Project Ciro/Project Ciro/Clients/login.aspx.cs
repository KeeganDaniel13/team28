using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace Project_Ciro.Clients
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void loginButton(object sender, EventArgs e)
        {
            var client = new CiroService.Service1Client();
            var a = client.login(name.Value, name2.Value);
            MessageBox.Show(a);
        }

    }
}