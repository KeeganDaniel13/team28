using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class release : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var releaseRequests = CiroSingleton.ServerCalls.getReleaseRequests();
            var body = "";
            foreach (var request in releaseRequests)
            {
                body += "<div class='col-md-3 col-sm-6'>";
                body += "<div class='widget>";
                body += "<header class'widget-header' align='center'>";
                body += "<h4 class='widget-title'>Release Request</h4></header>";
                body += "<hr class='widget-separator'>";
                body += "<div class='widget-body text-center'>";
                body += "<div class='big-icon m-b-md watermark'><i class='fa fa-5x fa-exclamation-circle'></i></div>";
                body += "<h4 class='m-b-md'>" + request.userInfo.email + "</h4>";
                body += "<p class='text-muted m-b-lg'>" + request.productInfo.name + "<br/>" + request.productInfo.bill + "<br/>" + request.productInfo.arrivalDate + "</p><a class='btn p-v-xl btn-info btn-xs btn-outline' href='viewreleaseinfo.aspx?info=" + request.product_id + "'>View Request</a></div>";
                body += "</div>";
                body += "</div>";
            }


            releases.InnerHtml += body;
        }
    }
}