using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Project_Ciro.Home
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin(object sender, EventArgs e)
        {
            var serv = new CiroService.Service1Client();
            var user = serv.login(new CiroService.jsonLoginUser { name = txtemail.Value, password = txtpass.Value });

            if(user == null)
            {
            }
            else
            {
                Session["ID"] = user.id;
                
                if(user.usertype == 1)
                {
                    Response.Redirect("../clients/ClientItems.aspx");
                }
                else if(user.usertype == 2)
                {
                    Response.Redirect("../Customs/Warehouses.aspx");
                }
            }
        }
    }
}