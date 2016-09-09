using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace CiroWebsite
{
    public partial class messages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void listMessages()
        {
            var user = (CiroService .JsonUser) Session["user"];
            var messages = CiroSingleton.ServerCalls.getMessage(new CiroService.JsonUser { id = user.id, email = user.email });
            Session["messages"] = messages.ToList<CiroService.JsonMessage>();
            var body = "";
            foreach (var message in messages)
            {
                body += "<div class='mail-item'>";
                body += "<table class='mail-container'>";
                body += "<tr>";
                body += "<td class='mail-left'>";
                body += "<a href='#'><img src='../infinity/assets/images/208.jpg' alt='sender photo'/></a>";
                body += "</div>";
                body += "</td>";
                body += "<td class='mail-center'>";
                body += "<div class='mail-item-header'>";
                body += "<h4 class='mail-item-title'><a href='messageview.aspx?id=" + message.id + "' class='title-color'>" + message.subject + "</a></h4>";
                body += "<a href='#'><span class='label label-success'>client</span></a>";
                body += "<a href='#'><span class='label label-primary'>work</span></a>";
                body += "</div>";
                body += "<p class='mail-item-excerpt'>" + message.message.Substring(0, 10) + "..." + "</p>";
                body += "</td>";
                body += "<td class='mail-right'>";
                body += "<p class='mail-item-date'>" + message.date + "</p>";
                body += "<p class='mail-item-star starred'>";
                body += "<a href='#'><i class='zmdi zmdi-star'></i></a>";
                body += "</p>";
                body += "</td>";
                body += "</tr>";
                body += "</table>";
                body += "</div>";
            }
            Response.Write(body);
        }

        protected void sendMail(object sender, EventArgs e)
        {
            CiroSingleton.ServerCalls.sendMessage(new CiroService.JsonMessage { from = "customs@gmail", to = "customs@gmail", date = DateTime.Now, message = "Sent Your First Message" });
        }
    }
}