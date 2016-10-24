using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class warehousetransfers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = (CiroService.JsonUser)Session["user"];
            var transfers = CiroSingleton.ServerCalls.transferWareHouse(new CiroService.JsonWarehouse { id = user.warehouseID });
            var body = "";
            foreach (var t in transfers)
            {
                body += "<tr>";
                body += "<td>" + t.id + "</td>";
                body += "<td class='p-name'>";
                body += "<i class='fa zmdi-hc-sm fa-file-text-o fa-2x' aria-hidden='true'></i><a href='../ClientPages/productlog.aspx?id=" + t.productid + "'>" + t.productName;
                body += "</a>";
                body += "<td>" + t.currentLocation +"</td>";
                body += "<td>" + t.destination +"</td>";
                body += "<td>" + t.dateIssued +"</td>";
                body += "</tr>";
            }
            transferTable.InnerHtml = body;
        }
    }
}