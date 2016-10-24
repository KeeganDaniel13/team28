using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class warehouserelease : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = (CiroService.JsonUser)Session["user"];
            var releaseRequest = CiroSingleton.ServerCalls.releaseWareHouse(new CiroService.JsonWarehouse { id = user.warehouseID });
            var body = "";
            foreach(var release in releaseRequest )
            {
                body += "<tr>";
                body += "<td>" + release.id + "</td>";
                body += "<td class='p-name'>";
                body += "<i class='fa zmdi-hc-sm fa-file-text-o fa-2x' aria-hidden='true'></i><a href='../ClientPages/productlog.aspx?id=" + release.productID + "'>" + release.name  ;
                body += "</a>";
                body += "</td>";
                body += "<td>" +release .owner +"</td>";
                body += "<td>";
                body += "<span class='badge badge-success'>"+release .status+"</span>";
                body += "</td>";
                body += "<td><div class='checkbox checkbox-circle checkbox-primary'><input type='checkbox' id='cb-circle-2' /><label for='cb-circle-2'></label></div>";
                body += "</td>";
                body += "<td><div class='checkbox checkbox-circle checkbox-primary'><input type='checkbox' id='cb-circle-2' /><label for='cb-circle-2'></label></div>";
                body += "</td>";
                body += "<td>";
                body += "<i>R "+release .invoiceTotal+"</i>"; //tax
                body += "</td>";
                body += "<td>";
                body += "<i>" + release.requested + "</i>";
                body += "</td>";
                
                body += "</tr>";
            }
            releaseTable.InnerHtml = body;
        }
    }
}