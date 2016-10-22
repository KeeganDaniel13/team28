using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace CiroWebsite
{
    public partial class dischargegoods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var declare = Convert.ToInt32(Session["declare"]);
            var server = new CiroService.Service1Client();
            string body = "";
<<<<<<< HEAD:CiroWebsite/CiroWebsite/dischargegoods.aspx.cs
            body += "<tr>";
            body += "<td>" + prod.name + "</td><td>" + prod.quantity + "</td><td>CalculateAccess</td><td>" + prod.bill + "</td><td>Exit date</td><td>" + prod.cosigner + "</td>" + "<td><a type='button' class='btn btn-danger'><i class='fa fa-minus-square-o'></i></a></td>";
            body += "</tr>";
            var list = Convert.ToInt32(Session["declare"]);
            var invoice = CiroSingleton.ServerCalls.getInvoice(new CiroService.JsonInvoice {}, new CiroService.jsonProduct { ID = list });
            Session["invoice"] = invoice;
            val.InnerHtml = (invoice.vat + invoice.penalty) + " ZAR";
=======
            try
            {
                var prod = server.getPackageID("" + declare);
                body += "<tr>";
                body += "<td>" + prod.name + "</td><td>" + prod.quantity + "</td><td>CalculateAccess</td><td>" + prod.bill + "</td><td>Exit date</td><td>" + prod.cosigner + "</td>" + "<td><a type='button' class='btn btn-danger'><i class='fa fa-minus-square-o'></i></a></td>";
                body += "</tr>";
                var list = Convert.ToInt32(Session["declare"]);
                var invoice = CiroSingleton.ServerCalls.getInvoice(new CiroService.JsonInvoice { id = 0 }, new CiroService.jsonProduct { ID = list });
                Session["invoice"] = invoice;
                val.InnerHtml = (invoice.vat + invoice.penalty) + " ZAR";
            }
            catch (Exception) { }
            
>>>>>>> 3caf1a1abd3c1d1b2946a44459156683331ac9d2:CiroWebsite/CiroWebsite/ClientPages/dischargegoods.aspx.cs
            Release.InnerHtml = body;
        }

        protected void sumbitRelease(object sender,EventArgs e)
        {
            try
            {
                var user = (CiroService.JsonUser)Session["user"];
                var list = Convert.ToInt32(Session["declare"]);
                var invoice = (CiroService.JsonInvoice)Session["invoice"];
                Session["declare"] = null;
                CiroSingleton.ServerCalls.payTax(new CiroService.JsonInvoice { id = invoice.id,paid = invoice .penalty +invoice.vat  });
                CiroSingleton.ServerCalls.releaseRequest(new CiroService.JsonUser { id = user.id }, new CiroService.jsonProduct { ID = list }, "");
            }
            catch (Exception ) { }

          
        }
    }
}