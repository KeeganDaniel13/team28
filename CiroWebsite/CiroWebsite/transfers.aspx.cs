using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace CiroWebsite
{
    public partial class transfers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = (CiroService.JsonUser)Session["user"];
            if (Request.QueryString["accept"] != null)
            {
               var ans= CiroSingleton.ServerCalls.approveTransfer(new CiroService.jsonProduct { ID = Convert.ToInt32(Request.QueryString["accept"]) ,userID=user.id}, "Approved","");
            }
            if (Request.QueryString["reject"] != null)
            {
                var ans= CiroSingleton.ServerCalls.approveTransfer(new CiroService.jsonProduct { ID = Convert.ToInt32(Request.QueryString["reject"]) ,userID=user .id}, "Rejected","");
            }

        }

        protected void listTransfers()
        {
            var transfers = CiroSingleton.ServerCalls.listTransferTRequests();
            Session["transfers"] = transfers.ToList<CiroService.TransferDetails>();
            try
            {
                var body = "";
                foreach (var transfer in transfers)
                {
                    body += "<div class='mail-item'>";
                    body += "<table class='mail-container'>";
                    body += "<tr>";
                    body += "<td class='mail-center'>";
                    body += "<div class='mail-item-header'>";
                    body += "<h4 class='mail-item-title'><a href='viewtransfer.aspx?id="+transfer.productid +"' class='title-color'>"+transfer.productName+"</a></h4>";
                    body += "<a href='#'><span class='label label-warning'>Transfer</span></a>";
                    body += "</div>";
                    body += "<p class='mail-item-excerpt'>To: "+transfer.destination+"</p>";
                    body += "</td>";
                    body += "<td class='mail-right'>";
                    body += "<p class='mail-item-date'>"+DateTime.Now+"</p>";
                    body += "<div class='floated'><a href='transfers.aspx?accept="+transfer.productid +"' class='btn btn-success btn-outline btn-xs'>Approve</a></div>";
                    body += "<div class='floated'><a href='transfers.aspx?reject="+ transfer.productid + "' class='btn btn-danger btn-outline btn-xs'>Reject</a></div>";
                    body += "</td></tr></table></div>";
                }
                Response.Write(body);
            }
            catch (Exception) { }
        }
    }
}