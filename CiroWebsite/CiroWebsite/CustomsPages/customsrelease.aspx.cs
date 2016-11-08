using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class customsrelease : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var releaseRequests = CiroSingleton.ServerCalls.getReleaseRequests();
            var body = "";
            var mod = "";
            Session["releases"] = releaseRequests.ToList<CiroService.JsonReleaseRequest>();
            foreach (var request in releaseRequests)
            {
                if (request.verdict == "Pending")
                {

                    body += "<div class='col-md-12 forum-topic'>";
                    body += "<div class='col-md-1 column lpad'>";
                    body += "<i class='icon-bug'></i>";
                    body += "</div>";
                    body += "<div class='col-md-7 col-sm-8 column lpad'>";
                    body += "<span class='overflow-control'>";
                    body += "<a href='viewreleaseinfo2.aspx?info=" + request.product_id + "'>" + request.productInfo.name + "</a>";
                    body += "</span>";
                    body += "<span class='overflow-control'>";
                    body += "Description of the package";
                    body += "</span>";
                    body += "</div>";
                    body += "<div class='col-md-1 column lpad'>";
                    body += "<span class='center'>" + request.userInfo.email + "</span>";
                    body += "</div>";
                    body += "<div class='col-md-1 column lpad'>";
                    body += "<span class='center'>"+request.productInfo.arrivalDate+"</span>";
                    body += "</div>";
                    body += "<div class='col-md-2 col-sm-4 column lpad'>";
                    //body += "<span>";
                    //<!--<a href="#" data-toggle="modal" data-target="#composeModal" type="button" class="btn btn-outline mw-md btn-success">Proceed</a>-->
                    //body += "From:<a onclick='bingo(modal" + request.id + ")' href='#'>" + request.currentLocation + "</a>";
                    //body += "</span>";
                    //body += "<span>" + request.dateIssued + "</span>";
                    //body += "<span>To: <a href='#'> " + request.destination + "</a></span>";
                    body += "</div>";
                    body += "</div>";
                }
            }
            releases.InnerHtml += body;
        }
    }
}