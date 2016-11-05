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
            var user = (CiroService.JsonUser)Session["user"];
            var goods = CiroSingleton.ServerCalls.getWarehouseInventory(new CiroService.JsonWarehouse { id = user.warehouseID});
            var body = "";
            if (goods != null)
            {
                foreach (var stock in goods)
                {
                    body += "<tr>";
                    body += "<td class='p-name'>";
                    body += "<a href='../ClientPages/productlog.aspx?id=" + stock.productID + "'>" + stock.product.name + "</a>";
                    body += "</td>";
                    body += "<td>" + stock.owner.email + "</td>";
                    body += "<td>" + stock.productTypeName + "</td>";
                    if(stock.prodLocation.isle == 0 && stock.prodLocation.row == 0 && stock.prodLocation.col == 0)
                    {
                        body += "<td>Good not stored yet</td>";
                        body += "<td>Good not stored yet</td>";
                        body += "<td>Good not stored yet</td>";
                    }
                    else
                    {
                        body += "<td>" + stock.prodLocation.isle + "</td>";
                        body += "<td>" + stock.prodLocation.row + "</td>";
                        body += "<td>" + stock.prodLocation.col + "</td>";
                    }
                    body += "<td><span class='label label-primary'>Active</span></td>";
                    body += "<td><small>" + stock.lastChecked + "</small></td>";
                    body += "</tr>";
                }
            }
            else
            {
                body += "<tr><td>No Data to Show.</td></tr>";
            }
            warehouseStock.InnerHtml = body;
        }

    }
}