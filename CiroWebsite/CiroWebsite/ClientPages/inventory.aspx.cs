using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class editor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var server = new CiroService.Service1Client();
            var user = (CiroService.JsonUser)Session["user"];

            var goods = server.clientProducts(new CiroService.JsonUser { id = Convert.ToInt32(user.id) });
            //var goods = server.clientProducts(new CiroService.JsonUser { id = 1 });
            if (Request.QueryString["add"] != null)
            {
                var item = Convert.ToInt32(Request.QueryString["add"]);
                Session["declare"] = item;
            }
            try
            {
                if (goods != null)
                {

                    string table = "";
                    foreach (var item in goods)
                    {
                        table += "<tr>";
                        table += "<td  onclick='bingo(modal)'>" + item.Name + "</td>" + "<td>" + item.quantity + "</td>" + "<td>" + item.arrivalDate + "</td>" + "<td>" + item.arrivalDate + "</td>" + "<td>";
                        table += "<td>";
                        table += "<ul class='list-inline'>";
                        table += "<li><a href='inventory.aspx?add=" + item.ID + "' type='button'  class='btn rounded btn-sm btn-danger' runat='server' onserverclick=''>Release</a></li>";
                        table += "<li><a href='transfergoods.aspx?transfer=" + item.ID + "' type='button' class='btn  btn-sm btn-success'>Transfer</a></li>";
                        table += "</ul>";
                        table += "</td>";
                        table += "</tr>";

                    }
                    list.InnerHtml += table;

                }
            }
            catch (Exception)
            { }
        }
    }
}