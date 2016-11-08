using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite.WarehousePages
{
    public partial class Incidents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = (CiroService.JsonUser)Session["user"];
            var incidents = CiroSingleton.ServerCalls.getWarehouseIncident(Convert.ToString(user.warehouseID));


            var body = "";
            if (incidents != null)
            {
                foreach (var i in incidents)
                {
                    body += "<tr>";
                    body += "<td>" + i.prodName + "</td>";
                    body += "<td>" + i.description + "</td>";
                    body += "<td>" + i.userName + "</td>";
                    body += "<td>" + i.dateLogged + "</td>";
                    body += "</tr>";
                }
            }
            else
            {
                body += "<tr>";
                body += "<td>No Data stored.</td></tr>";
            }
      
           getIncident.InnerHtml = body;
        }
    }
}