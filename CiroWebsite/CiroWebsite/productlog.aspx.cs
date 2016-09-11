using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace CiroWebsite
{
    public partial class productlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                var server = new CiroService.Service1Client();


                var pid = Convert.ToInt32(Request.QueryString["id"]);
                var logs = server.getProductLog(new CiroService.jsonProduct { ID = pid });
                try
                {
                    var body = "";
                    var count = 1;
                    foreach (var log in logs)
                    {
                        
                        if (count % 2 == 0)
                        {
                            body += "<li class='timeline-inverted'><div class='timeline-badge'><i class='";
                        }
                        else
                        {
                            body += "<li><div class='timeline-badge'><i class='";
                        }
                        if (log.logtypename.Equals("TR7"))
                        {
                            body += "fa fa-truck'></i></div><div class='timeline-panel'><div class='timeline-heading'><h4 class='timeline-title'>Transfer Request</h4>";
                        }
                        else if (log.logtypename.Equals("D3"))
                        {
                            body += "fa fa-gift'></i></div><div class='timeline-panel'><div class='timeline-heading'><h4 class='timeline-title'>Delivered</h4>";
                        }
                        else if (log.logtypename.Equals("RR6"))
                        {
                            body += "fa fa-check'></i></div><div class='timeline-panel'><div class='timeline-heading'><h4 class='timeline-title'>Release Request</h4>";
                        }
                        else if (log.logtypename.Equals("T2"))
                        {
                            body += "fa fa-check'></i></div><div class='timeline-panel'><div class='timeline-heading'><h4 class='timeline-title'>Transfered</h4>";
                        }
                        else if (log.logtypename.Equals("I9"))
                        {
                            body += "fa fa-warning'></i></div><div class='timeline-panel'><div class='timeline-heading'><h4 class='timeline-title'>Incident</h4>";
                        }
                        else if (log.logtypename.Equals("CO2"))
                        {
                            body += "fa fa-check'></i></div><div class='timeline-panel'><div class='timeline-heading'><h4 class='timeline-title'>Change of Ownership</h4>";
                        }
                        body += "<p><small class='text-muted'><i class='fa fa-time'></i>" + log.date + "</small></p></div>";
                        body += "<div class='timeline-body'><p>" + log.description + "</p></div>";
                        body += "</div>";
                        body += "</li>";
                        count++;
                    }
                    var details = server.getPackageID("" + pid);
                    detailsInfo.InnerHtml = "Name :" + details.name + "<br/>Location :" + details.location + "<br/>Value :R" + details.price + "<br/>Bill OF Entry :" + details.bill + "<br/>Arrival Date :" + details.arrivalDate;
                    logList.InnerHtml = body;
                }
                catch (Exception) { }
            }
        }
    }
}