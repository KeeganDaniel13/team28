using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class warehouseoverview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void listWarehouses()
        {
            List<CiroService.JsonWarehouse > warehouses = (List<CiroService .JsonWarehouse>) CiroSingleton.ServerCalls.warehouses().ToList();
            Session["warehouses"] = warehouses;
            var body = "";
            var count = 1;
            foreach (var w in warehouses)
            {
                body += "<td>";
                body += "<table class='table' style='width:350px'>";
                body += "<tr><th colspan='5'><b>" + w.name + "</b></th></tr>";
                body += "<tr><td colspan='5'><img class='img-responsive' src='../infinity/assets/images/warehouse.jpg' alt='avatar'/>Location :" + w.location + "<br/>Type:" + w.warehousetype + "<br/><a href='warehouseview.aspx?w=" + w.id +"'class='btn btn-outline mw-md rounded btn-success btn-xs'>View Warehouse</a></div></td></tr>";
                body += "</table>";
                body += "</td>";
                if (count % 3 == 0)
                {
                    body += "<tr></tr>";
                }
                count++;

            }
            Response.Write(body);
        }
    }
}