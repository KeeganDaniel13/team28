using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Ciro.Customs
{
    public partial class releaserequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void listrequests()
        {
            //var serve = new CiroService.Service1Client();
            // var requests = serve.get
            string trstart = "<tr>";

            for (int k = 0; k < 10; k++)
            {

                if (k != 0 && k % 4 == 0)
                {
                    trstart = "</tr><tr>";

                }
                if (k == 0)
                {
                    trstart = "</tr><tr>";
                }
                if (k % 4 != 0)
                {
                    trstart = "";
                }
                Response.Write(trstart + "<td><div class='col-md-3' style='width:100%;overflow-x:hidden'><div class='box box-danger direct-chat direct-chat-success'><div class='box-header with-border' ></div><div class='box-body'><div class='form-group' style='margin-left:5%;margin-right:5%'><label for='exampleInputEmail1'>User</label><input type = 'email' runat='server' class='form-control' id='newOwner' disabled></div><div class='form-group' style='margin-left:5%;margin-right:5%'><label for='exampleInputEmail1'>Product</label><input type = 'email' runat='server' class='form-control' id='Email1' disabled></div><div class='form-group' style='margin-left:5%;margin-right:5%'><label for='exampleInputEmail1'>Expiration Date</label><input type = 'email' runat= 'server' class='form-control' disabled></div></div><div class='box-footer'><form action = '#' method='post'><div class='input-group'><button type = 'submit' class='btn btn-danger btn-flat'>Reject</button><span class='input-group-btn'><button type = 'submit' class='btn btn-success btn-flat'>Release</button></span></div></form></div></div></div></td>");
            }
        }
    }
}