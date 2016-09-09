using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class warehouseinventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var goods = CiroSingleton.ServerCalls.getWarehouseInventory(new CiroService.JsonWarehouse { id = 1});
            var body = "";
            foreach (var stock in goods)
            {
                body += "<tr>";
                body += "<td class='p-name'>";
                body += "<a href=''>" + stock.product.name + "</a>";
                body += "</td>";
                body += "<td>" + stock.owner.email + "</td>";
                body += "<td>type ?</td>";
                body += "<td><span class='label label-success'>3</span><i>Variants</i></td>";
                body += "<td><span class='label label-primary'>Active</span></td>";
                body += "<td><small>" + stock.lastChecked + "</small></td>";
                body += "<td>";
                body += "<a href='project_details.html' class='btn btn-primary btn-xs'><i class='fa fa-folder'></i> View </a><a href='#' class='btn btn-info btn-xs'><i class='fa fa-pencil'></i> Edit</a>";
                body += "</td>";
                body += "</tr>";
            }
            warehouseStock.InnerHtml = body;
        }

    }
}