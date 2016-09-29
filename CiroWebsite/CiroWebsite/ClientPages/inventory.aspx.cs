using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class inventory : System.Web.UI.Page
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
                    string modals = "";
                    string table = "";
                    foreach (var item in goods)
                    {
                        //adding items to the inventory table
                        table += "<tr>";
                        table += "<td  onclick='bingo(modal"+item.ID+")'>" + item.Name + "</td>" + "<td>" + item.quantity + "</td>" + "<td>" + item.arrivalDate + "</td>" + "<td>" + item.arrivalDate + "</td>" + "<td>";
                        table += "<td>";
                        table += "<ul class='list-inline'>";
                        table += "<li><a href='inventory.aspx?add=" + item.ID + "' type='button'  class='btn rounded btn-sm btn-danger' runat='server' onserverclick=''>Release</a></li>";
                        table += "<li><a href='transfergoods.aspx?transfer=" + item.ID + "' type='button' class='btn  btn-sm btn-success'>Transfer</a></li>";
                        table += "</ul>";
                        table += "</td>";
                        table += "</tr>";

                        //adding the different modals for each item
                        modals += "<div class='modal fade' id='modal"+item.ID+"' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>";
                        modals += "<div class='modal-dialog'><div class='modal-content'><div class='modal-header'>";
                        modals += "<button type='button' class='close' data-dismiss='modal' aria-hidden='true'><i class='text-danger fa fa-times'></i></button>";
                        modals += "<h4 class='modal-title' id='myModalLabel'><i class='text-muted fa fa-shopping-cart'></i> "+item.Name+"</h4>";
                        modals += "</div>";
                        modals += "<div class='modal-body'>";
                        modals += "<table class='pull-left col-md-6 '>";
                        modals += "<tbody>";
                        modals += "<tr>";
                        modals += "<td class='h6'><strong>HS Code</strong></td>";
                        modals += "<td> </td>";
                        modals += "<td class='h5'>" + item.bill + "</td>";
                        modals += "</tr>";
                        modals += "<tr><td class='h6'><strong>Arrival Date</strong></td><td> </td><td class='h5'>"+item.arrivalDate+"</td></tr>";
                        modals += "<tr><td class='h6'><strong>Insured</strong></td><td> </td><td class='h5'>Implement</td></tr>";
                        modals += "<tr><td class='h6'><strong>Width</strong></td><td> </td><td class='h5'>"+item.width+ "</td></tr>";
                        modals += "<tr><td class='h6'><strong>Height</strong></td><td> </td><td class='h5'>"+item.height+"</td></tr>";
                        modals += "<tr><td class='btn-mais-info text-primary'><i class='open_info fa fa-plus-square-o'></i><i class='open_info hide fa fa-minus-square-o'></i> Description (Implement)</td><td> </td><td class='h5'></td></tr>";
                        modals += "</tbody></table>";
                        modals += "<div class='col-md-6'><img src='../infinity/assets/images/11.jpg' alt='teste' class='img-thumbnail'></div>";
                        modals += "<div class='clearfix'></div><p class='open_info hide'>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p></div>";
                        modals += "<div class='modal-footer'><div class='text-right pull-right col-md-3'>Value: <br/> <span class='h3 text-muted'><strong>R"+item.value+"</strong></span></span></div>";
                        modals += "<div class='text-right pull-right col-md-3'><a type='button' href='productlog.aspx?id="+item.ID+ "' class='btn btn-sm btn-success'>Package Log</a></div></div></div></div></div>";
                    }
                    //l.InnerHtml += table;
                    list.InnerHtml += table;
                    modalsHolder.InnerHtml = modals;

                }
            }
            catch (Exception)
            { }
        }
    }
}