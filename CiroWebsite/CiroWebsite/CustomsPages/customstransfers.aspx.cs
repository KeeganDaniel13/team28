using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace CiroWebsite
{
    public partial class customstransfers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = (CiroService.JsonUser)Session["user"];
            if (Request.QueryString["accept"] != null)
            {
                var ans = CiroSingleton.ServerCalls.approveTransfer(new CiroService.jsonProduct { ID = Convert.ToInt32(Request.QueryString["accept"]), userID = user.id }, "Approved", "");
            }
            if (Request.QueryString["reject"] != null)
            {
                var ans = CiroSingleton.ServerCalls.approveTransfer(new CiroService.jsonProduct { ID = Convert.ToInt32(Request.QueryString["reject"]), userID = user.id }, "Rejected", "");
            }
            var transfers = CiroSingleton.ServerCalls.listTransferTRequests();
            Session["transfers"] = transfers.ToList<CiroService.TransferDetails>();
            string mod = "";
            string body = "";


            try
            {
                foreach (var transfer in transfers)
                {
                    mod += "<div class='modal fade' id='modal" + transfer.id + "' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>";
                    mod += "<div class='modal-dialog'><div class='modal-content'><div class='modal-header'>";
                    mod += "<button type='button' class='close' data-dismiss='modal' aria-hidden='true'><i class='text-danger fa fa-times'></i></button>";
                    mod += "<h4 class='modal-title' id='myModalLabel'>Package Release</h4>";
                    mod += "</div>";
                    mod += "<div class='modal-body'>";
                    mod += "<h5>Are you going to release the transfer or decline the package</h5>";
                    mod += "<div class='modal-footer'><div class='text-right pull-right col-md-3'><a href='customstransfers.aspx?reject=" + transfer.productid + "' type='button' class='btn btn-danger' data-dismiss='modal'>Decline</a></div>";
                    mod += "<div class='text-right col-md-3'><a href='customstransfers.aspx?accept=" + transfer.productid + "' type='button' class='btn btn-success' data-dismiss='modal'>Accept</a></div></div></div></div></div>";


                   /* mod += "<div id='modal" + transfer.productid + "' class='modal fade' tabindex='-1' role='dialog'>";
                    mod += "<div class='modal-dialog'>";
                    mod += "<div class='modal-content'>";
                    mod += "<div class='modal-header'>";
                    mod += "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
                    mod += "<h4 class='modal-title'>Package Release</h4>";
                    mod += "</div>";
                    mod += "<div class='modal-modals'>";
                    mod += "<h5>Are you going to release the transfer or decline the package</h5>";
                    mod += "</div>";
                    mod += "<div class='modal-footer'>";
                    mod += "<a href='transfers.aspx?accept=" + transfer.productid + "' type='button' class='btn btn-success' data-dismiss='modal'>Accept</a>";
                    mod += "<a href='transfers.aspx?reject=" + transfer.productid + "' type='button' class='btn btn-danger' data-dismiss='modal'>Decline</a>";
                    mod += "</div>";
                    mod += "</div>";
                    mod += "</div>";
                    mod += "</div>";*/

                    body += "<div class='col-md-12 forum-topic'>";
                    body += "<div class='col-md-1 column lpad'>";
                    body += "<i class='icon-bug'></i>";
                    body += "</div>";
                    body += "<div class='col-md-7 col-sm-8 column lpad'>";
                    body += "<span class='overflow-control'>";
                    body += "<a href='viewtransfer.aspx?id=" + transfer.productid + "'>" + transfer.productName + "</a>";
                    body += "</span>";
                    body += "<span class='overflow-control'>";
                    body += "Description of the package";
                    body += "</span>";
                    body += "</div>";
                    body += "<div class='col-md-1 column lpad'>";
                    body += "<span class='center'>" + transfer.transferName + "</span>";
                    body += "</div>";
                    body += "<div class='col-md-1 column lpad'>";
                    body += "<span class='center'>285</span>";
                    body += "</div>";
                    body += "<div class='col-md-2 col-sm-4 column lpad'>";
                    body += "<span>";
                    //<!--<a href="#" data-toggle="modal" data-target="#composeModal" type="button" class="btn btn-outline mw-md btn-success">Proceed</a>-->
                    body += "From:<a onclick='bingo(modal" + transfer.id + ")' href='#'>" + transfer.currentLocation + "</a>";
                    body += "</span>";
                    body += "<span>" + transfer.dateIssued + "</span>";
                    body += "<span>To: <a href='#'> " + transfer.destination + "</a></span>";
                    body += "</div>";
                    body += "</div>";
                }

                info.InnerHtml += body;
                modalInfo.InnerHtml += mod;
            }
            catch (Exception c) { }
        }

        protected void listTransfers()
        {
            var transfers = CiroSingleton.ServerCalls.listTransferTRequests();
            Session["transfers"] = transfers.ToList<CiroService.TransferDetails>();
            try
            {
                var body = "";
                var modals = "";
                foreach (var transfer in transfers)
                {

                    //models
                    modals += "<div id='modal"+transfer.productid+"' class='modal fade' tabindex='-1' role='dialog'>";
                    modals += "<div class='modal-dialog'>";
                    modals += "<div class='modal-content'>";
                    modals += "<div class='modal-header'>";
                    modals += "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
                    modals += "<h4 class='modal-title'>Package Release</h4>";
                    modals += "</div>";
                    modals += "<div class='modal-modals'>";
                    modals += "<h5>Are you going to release the transfer or decline the package</h5>";
                    modals += "</div>";
                    modals += "<div class='modal-footer'>";
                    modals += "<a href='transfers.aspx?accept=" + transfer.productid + "' type='button' class='btn btn-success' data-dismiss='modal'>Accept</a>";
                    modals += "<a href='transfers.aspx?reject=" + transfer.productid + "' type='button' class='btn btn-danger' data-dismiss='modal'>Decline</a>";
                    modals += "</div>";
                    modals += "</div>";
                    modals += "</div>";
                    modals += "</div>";
                    
                    //modals 
                    body += "<div class='col-md-12 forum-topic'>";
                    body += "<div class='col-md-1 column lpad'>";
                    body += "<i class='icon-bug'></i>";
                    body += "</div>";
                    body += "<div class='col-md-7 col-sm-8 column lpad'>";
                    body += "<span class='overflow-control'>";
                    body += "<a href='viewtransfer.aspx?id=" + transfer.productid + "'>"+transfer .productName+"</a>";
                    body += "</span>";
                    body += "<span class='overflow-control'>";
                    body += "Description of the package";
                    body += "</span>";
                    body += "</div>";
                    body += "<div class='col-md-1 column lpad'>";
                    body += "<span class='center'>" + transfer.transferName + "</span>";
                    body += "</div>";
                    body += "<div class='col-md-1 column lpad'>";
                    body += "<span class='center'>285</span>";
                    body += "</div>";
                    body += "<div class='col-md-2 col-sm-4 column lpad'>";
                    body += "<span>";
                    //<!--<a href="#" data-toggle="modal" data-target="#composeModal" type="button" class="btn btn-outline mw-md btn-success">Proceed</a>-->
                    body += "From:<a onclick='bingo(modal" + transfer.id + ")' href='#'>" + transfer.currentLocation + "</a>";
                    body += "</span>";
                    body += "<span>"+transfer .dateIssued+"</span>";
                    body += "<span>To: <a href='#'> " + transfer.destination + "</a></span>";
                    body += "</div>";
                    body += "</div>";
                }
                //info.InnerHtml += body;
                Response.Write(body);
               
            }
            catch (Exception) { }
        }

        protected void displayModals()
        {
             var modals =(List<CiroService .TransferDetails> ) Session["transfers"];
            string mod = "";
            foreach (var transfer in modals)
            {
                //models
                /*mod += "<div id='modal" + transfer.productid + "' class='modal fade' tabindex='-1' role='dialog'>";
                mod += "<div class='modal-dialog'>";
                mod += "<div class='modal-content'>";
                mod += "<div class='modal-header'>";
                mod += "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
                mod += "<h4 class='modal-title'>Package Release</h4>";
                mod += "</div>";
                mod += "<div class='modal-modals'>";
                mod += "<h5>Are you going to release the transfer or decline the package</h5>";
                mod += "</div>";
                mod += "<div class='modal-footer'>";
                mod += "<a href='transfers.aspx?accept=" + transfer.productid + "' type='button' class='btn btn-success' data-dismiss='modal'>Accept</a>";
                mod += "<a href='transfers.aspx?reject=" + transfer.productid + "' type='button' class='btn btn-danger' data-dismiss='modal>Decline</a>";
                mod += "</div>";
                mod += "</div>";
                mod += "</div>";
                mod += "</div>";*/


                mod += "<div class='modal fade' id='modal" + transfer.id + "' tabindex='-1' role='dialog' aria-labelledby='myModalLabel'>";
                mod += "<div class='modal-dialog'><div class='modal-content'><div class='modal-header'>";
                mod += "<button type='button' class='close' data-dismiss='modal' aria-hidden='true'><i class='text-danger fa fa-times'></i></button>";
                mod += "<h4 class='modal-title' id='myModalLabel'><i class='text-muted fa fa-shopping-cart'></i> " + transfer.id + "</h4>";
                mod += "</div>";
                mod += "<div class='modal-body'>";
                mod += "<table class='pull-left col-md-6 '>";
                mod += "<tbody>";
                mod += "<tr>";
                mod += "<td class='h6'><strong>HS Code</strong></td>";
                mod += "<td> </td>";
                mod += "<td class='h5'>" + transfer.id + "</td>";
                mod += "</tr>";
                mod += "<tr><td class='h6'><strong>Arrival Date</strong></td><td> </td><td class='h5'>" + transfer.id + "</td></tr>";
                mod += "<tr><td class='h6'><strong>Insured</strong></td><td> </td><td class='h5'>Implement</td></tr>";
                mod += "<tr><td class='h6'><strong>Width</strong></td><td> </td><td class='h5'>" + transfer.id + "</td></tr>";
                mod += "<tr><td class='h6'><strong>Height</strong></td><td> </td><td class='h5'>" + transfer.id + "</td></tr>";
                mod += "<tr><td class='btn-mais-info text-primary'><i class='open_info fa fa-plus-square-o'></i><i class='open_info hide fa fa-minus-square-o'></i> Description</td><td></td><td class='h5'></td></tr>";
                mod += "</tbody></table>";
                mod += "<div class='col-md-6'><img src='../infinity/assets/images/11.jpg' alt='teste' class='img-thumbnail'></div>";
                mod += "<div class='clearfix'></div><p class='open_info hide'>" + transfer.id + "</p></div>";
                mod += "<div class='modal-footer'><div class='text-right pull-right col-md-3'>Value: <br/> <span class='h3 text-muted'><strong>R" + transfer.id + "</strong></span></span></div>";
                mod += "<div class='text-right pull-right col-md-3'><a type='button' href='productlog.aspx?id=" + transfer.id + "' class='btn btn-sm btn-success'>Package Log</a></div></div></div></div></div>";
            }
            Response.Write(mod);
        }
    }
}