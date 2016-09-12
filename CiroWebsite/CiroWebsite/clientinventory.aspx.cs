using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace CiroWebsite
{
    public partial class clientinventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var server = new CiroService.Service1Client();
            var user = (CiroService.JsonUser) Session["user"];


            var goods = server.clientProducts(new CiroService.JsonUser { id = Convert.ToInt32(user.id ) });
            //var goods = server.clientProducts(new CiroService.JsonUser { id = 1 });
            if (Request.QueryString["add"] != null)
            {
                var item = Convert.ToInt32(Request.QueryString["add"]);
                if (Session["declare"] != null)
                {
                    List<int> declare = Session["declare"] as List<int>;
                    if (declare.Contains(item))
                    { }
                    else
                    {
                        declare.Add(item);
                        Session["declare"] = declare;
                    }
                }
                else
                {
                    List<int> declare = new List<int>();
                    declare.Add(item);
                    Session["declare"] = declare;
                }
            }
            try
            {
                if (goods != null)
                {

                    string table = "";
                    foreach (var item in goods)
                    {
                        table += "<tr>";
                        table += "<td>" + item.Name + "</td>" + "<td>" + item.currentLocation + "</td>" + "<td>" + item.size + "</td>" + "<td>" + item.arrivalDate + "</td>" + "<td>" + item.arrivalDate + "</td>" + "<td>" + item.Name + "</td>";
                        table += "<td>";
                        table += "<a href='productlog.aspx?id=" + item.ID + "' type='button' class='btn btn-outline mw-md rounded btn-info btn-xs mybtn' runat='server' onserverclick=''>View Package</a>";
                        table += "<a href='clientinventory.aspx?add=" + item.ID + "' type='button' class='btn btn-outline mw-md rounded btn-info btn-xs mybtn' runat='server' onserverclick=''>Release Request</a>";
                        table += "<a href='transfergoods.aspx?transfer=" + item.ID + "' type='button' class='btn btn-outline mw-md rounded btn-info btn-xs'>Transfer Request</a>";
                        table += "</td>";
                        table += "</tr>";

                    }
                    list.InnerHtml += table;
                    return;
                }
            }
            catch (Exception ex)
            { }
        }


    }
}