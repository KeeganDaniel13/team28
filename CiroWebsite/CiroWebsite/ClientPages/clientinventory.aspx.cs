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
            Session["currentItems"] = goods.ToList<CiroService.jsonProduct>();
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
                        table += "<td  onclick='bingo(modal)'>" + item.Name + "</td>" + "<td>" + item.currentLocation + "</td>" + "<td>" + item.size + "</td>" + "<td>" + item.arrivalDate + "</td>" + "<td>" + item.arrivalDate + "</td>" + "<td>" + item.Name + "</td>";
                        table += "<td>";
                        table += "<a href='clientinventory.aspx?add=" + item.ID + "' type='button'  class='btn rounded btn-sm btn-danger' runat='server' onserverclick=''>Release</a>";
                        table += "<a href='transfergoods.aspx?transfer=" + item.ID + "' type='button' class='btn  btn-sm btn-success'>Transfer</a>";
                        table += "</td>";
                        table += "</tr>";

                    }
                    //list.InnerHtml += table;
                    
                }
            }
            catch (Exception)
            { }
        }

        //private string 
    }
}