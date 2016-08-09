using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Project_Ciro.Clients
{
    public partial class ViewItemLog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void listlog()
        {
            var serv = new CiroService.Service1Client();
           
            var log = serv.getProductLog(Request.QueryString["id"].ToString());
            string logitems = "";
            string logcolour = "";
            string logtype = "";
            
            //default for testing
            logcolour = "red";
            logtype = "Incident";         

            foreach (CiroService.JsonProductLog l in log)
            {
                //  if statements on product log type
                logitems += "<li class='time-label'><span class='bg-grey'>10 April. 2014</span></li><li><i class='fa fa-box bg-" + logcolour + "'></i><div class='timeline-item'><span class='time'><i class='fa fa-clock-o'></i> 12:05</span><h3 class='timeline-header'><a href = '#' > " + logtype + " </a></h3><div class='timeline-body'>" + l.description + "</div></div></li>";
            }
            Response.Write(logitems);
         //   MessageBox.Show(Request.Url.OriginalString.IndexOf("#").ToString());
        }
    }
}