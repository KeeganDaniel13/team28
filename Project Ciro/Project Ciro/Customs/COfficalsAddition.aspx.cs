using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Ciro.Admin
{
    public partial class COfficalsAddition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd(object sender, EventArgs e)
        {
            var server = new CiroService.Service1Client();

            if(txtPassword.Value == txtConfirm.Value)
            {
                var user = server.register(new CiroService.JsonUser { fname = txtName.Value, lname = txtSurname.Value, email = txtEmail.Value, password = txtPassword.Value, usertype = 2 });
                Response.Redirect("Warehouses.aspx");
            }
        }

    }
}