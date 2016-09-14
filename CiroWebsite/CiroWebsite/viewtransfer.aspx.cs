using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class viewtransfer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["id"] != null)
            {
                var transfers = (List<CiroService.TransferDetails>)Session["transfers"];
                var transfer = transfers.First<CiroService.TransferDetails>(c => c.productid == Convert.ToInt32(Request.QueryString["id"]));
                var body = "<td>"+transfer.transferName+"</td>";
                body += "<td>" + transfer.productName + "</td>";
                body += "<td>" + transfer.currentLocation + "</td>";
                body += "<td>" + transfer.destination + "</td>";
                body += "<td>" + DateTime.Now + "</td>";
                body += "<td>";
                body += "<div class='floated'><a href='transfers.aspx?accept=" + transfer.productid + "' class='btn btn-success btn-outline btn-xs'>Approve</a></div>";
                body += "<div class='floated'><a href='transfers.aspx?reject=" + transfer.productid + "' class='btn btn-danger btn-outline btn-xs'>Reject</a></div>";
                body += "</td>";
                transferD.InnerHtml = body;
            }
            else
            {
                Response.Redirect("transfers.aspx");
            }
        }
    }
}