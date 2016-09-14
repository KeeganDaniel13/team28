using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace CiroWebsite
{
    public partial class declareownershiptransfer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["accpet"] != null)
            {
                try
                {
                    var user = (CiroService.JsonUser)Session["user"];
                    CiroSingleton.ServerCalls.approveOwnershipRequest("Accepted", new CiroService.JsonUser { id = user.id }, new CiroService.JsonProducts { id = Convert.ToInt32(Request.QueryString["accpet"]) });
                }
                catch (Exception)
                {

                }
                Response.Redirect("declareownershiptransfer.aspx");
            }
            if (Request.QueryString["reject"] != null)
            {
                try
                {
                    var user =(CiroService.JsonUser) Session["user"] ;
                    CiroSingleton.ServerCalls.approveOwnershipRequest("Rejected", new CiroService.JsonUser { id = user.id }, new CiroService.JsonProducts { id = Convert.ToInt32(Request.QueryString["reject"]) });
                }
                catch (Exception)
                {

                }
                Response.Redirect("declareownershiptransfer.aspx");
            }
        }

        protected void proceed(object sender, EventArgs e)
        {
            var userID = (CiroService .JsonUser )Session["user"] ;
            Session["changeUser"] = new ChangeUser { tranferer = userID.id, tranfereeName = transfereeName.Value, transfereeEmail = transfereeEmail.Value, reason = changeReason.Value };
            Response.Redirect("changeofownership.aspx");
        }

        protected void listRequests()
        {
            var user = (CiroService .JsonUser)Session["user"];
            try
            {
                var requests = CiroSingleton.ServerCalls.getUserOwnershipRequest(new CiroService.JsonUser { id = user.id });
                var body = "";
                foreach (var re in requests)
                {
                    body += "<tr><td><a href='productlog.aspx?id=" + re.product + "'>" + re.prodInfo.name + "</a></td><td>" + re.prevInfo.email + "</td><td>Add Origin</td><td>" + re.prodInfo.arrivalDate + "</td><td>Date of Request</td><td>Reason</td><td><a href='declareownershiptransfer.aspx?accpet=" + re.prodInfo.id + "' class='btn btn-success btn-xs'><i class='fa fa-thumbs-up'></i></button><a href='declareownershiptransfer.aspx?reject=" + re.prodInfo.id + "' class='btn btn-danger btn-xs'><i class='fa fa-thumbs-down'></i></button></td></tr>";
                }
                Response.Write(body);
            }
            catch (Exception) { }

        }
    }
}