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
            foreach(var warehouse in warehouses)
            {
                body += "<tr>";
                body += "<th colspan='5'>";
                body += "<b>" + warehouse.name + " </b>";
                body += "</th>";
                body += "</tr>";
                body += "<tr>";
                body += "<td colspan='5'>";
                body += "<img class='img-responsive' src='../infinity/assets/images/warehouse.jpg' alt='avatar'/>";
                body += "<div style='float:right;'>";
                body += warehouse.warehousetype +"<br/>";
                body += warehouse.location + "<br/>";
                body += warehouse.size + "<br/>";
                body += warehouse.available + "<br/>";
                body += "<a href='warehouseview.aspx?id="+warehouse.id+"'>View Warehouse</a>";
                body += "</div><td/><tr/>";

            }
            Response.Write(body);
        }
    }
}