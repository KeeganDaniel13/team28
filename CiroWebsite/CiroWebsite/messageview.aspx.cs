using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class messageview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var messages = (List<CiroService.JsonMessage>)Session["messages"];
            CiroService.JsonMessage message = messages.First(c => c.id == Convert.ToInt32(Request.QueryString["id"]));
            var body = "< div class='mail-view'>";
            body += "<h4 class='m-0'>" + message.subject + "</h4>";
            body += "<div class='divid'></div>";
            body += "<div class='media'>";
            body += "<div class='media-left'>";
            body += "<div class='avatar avatar-lg avatar-circle'>";
            body += "<img class='img-responsive' src='../infinity/assets/images/001.jpg' alt='avatar'/>";
            body += "</div>";
            body += "</div>";
            body += "<div class='media-body'>";
            body += "<div class='m-b-sm'>";
            body += "<h4 class='m-0 inline-block m-r-lg'>";
            body += "<a href='#' class='title-color'>Envato Market</a>";
            body += "</h4>";
            body += "<a href='#'><span class='label label-success'>New</span></a>";
            body += "</div>";
            body += "<p><b>From: </b>" + message.from + "</p>";
            body += "</div>";
            body += "</div>";
            body += "<div class='divid'></div>";
            body += "<div class='row'>";
            body += "<div class='col-md-12'>";
            body += "<div class='m-h-lg lh-xl'>";
            body += "<p>" + message.message + "</p>";
            body += "<p>Browse our site and see for yourself why you need Ooooh.</p>";
            body += "</div></div></div></div>";
            body += "<div class='row'>";
            body += "<div class='col-md-12'>";
            body += "<div class='panel panel-default new-message'>";
            body += "<div class='panel-heading'>";
            body += "<input type = 'text' placeholder='envatomarket@envato.com'>";
            body += "</div>";
            body += "<div class='panel-body p-0'>";
            body += "<textarea name = 'new_message_body' id='new-message-body'>We are excited to launch our new company and product Ooooh.After being featured in too many magazines to mention and having created an online stir, we know that Ooooh is going to be big. You may have seen us in the Dinosaurs’ Den where we were we told that we didn’t need them because we were already doing it so well ourselves, so that’s what we have continued to do. We also hope to win Startup Fictional Business of the Year this Year.</textarea>";
            body += "</div>";
            body += "<div class='panel-footer'>";
            body += "<button type = 'button' class='btn btn-primary btn-outline btn-sm'>Forward</button>";
            body += "<button type = 'button' class='btn btn-default pull-right' data-dismiss='modal'><i class='fa fa-trash'></i></button>";
            body += "</div></div></div></div></div></div>";
            messageDetails.InnerHtml += body;
        }

    }
}