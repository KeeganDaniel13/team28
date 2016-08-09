using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Ciro.Home
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister(object sender, EventArgs e)
        {
            var serv = new CiroService.Service1Client();
            if(txtpass.Value == txtconfirm.Value)
            {
                var user = serv.register(new CiroService.JsonUser { email = txtemail.Value, password = txtpass.Value, lname = txtsurname.Value, fname=txtfirst.Value, id=0 });
                Response.Redirect("Login.aspx");
            }
            

        }
    }
}