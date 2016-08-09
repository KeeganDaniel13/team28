using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Project_Ciro.Clients
{
    public partial class ClientItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ListClientItems()
        {
            var serve = new CiroService.Service1Client();

            var json = serve.clientProducts("1");
            string tablecontents = "";
        
            {
                foreach (var v in json)
                {
                    var prodid = " id=" + v.ID.ToString();
                    tablecontents += "<tr><td>" + v.Name + "</td><td>" + v.value + "</td><td>ADD HERE</td><td>" + v.currentLocation + "<td>ADD HERE</td>";
                    tablecontents += "<td><div class='btn-group'><button type = 'button' class='btn btn-info dropdown-toggle' data-toggle='dropdown' style'background-color:#4F8CC9; border-color:#4F8CC9'><span class='caret'></span></button><ul class='dropdown-menu'><li><a href = '#popup1'><span " + prodid + " onclick=transfer(this.id)>Transfer Item</span></a></li><li><a href = '#ownership' ><span " + prodid + " onclick=changeOwnership(this.id)>Change Ownership</span></a></li><li><a href = '#release' ><span " + prodid + " onclick=release(this.id)>Request Release</span></a></li><li><a href = 'ViewItemLog.aspx?id=" + v.ID + "' > Item Log</a></li></ul></div></td></tr>";
                }
            }
            Response.Write(tablecontents);
        }

        protected void ListWarehouses()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.warehouses();

            string list = "";
            string progress = "";
            string per = "";

            //default
            progress = "<div class='progress progress-xs'><div class='progress-bar progress-bar-success' style='width: 55%'></div></div>";
            per = "<span class='badge bg-green'>55%</span>";

            foreach (var v in warehouses)
            {
                string id = " id=" + v.id.ToString();
                string check = v.id.ToString() +"c";                
                list += "<tr><td><a href='#' " + id + " onclick = 'warehouseSelection(this.id)'><input type='checkbox'></a></td><td>" + v.name + "</td><td>" + v.location + "</td><td>" + progress + "</td><td>" + per + "</td></tr>";
            }
            Response.Write(list);
        }

        protected void requesttransfer(object sender, EventArgs e)
        {         
            var serve = new CiroService.Service1Client();
            CiroService.jsonTRequest request = new CiroService.jsonTRequest { description = txtdescription.Value, endWarehouse = wareto.Value, productID = int.Parse(transferid.Value), userID = 1};

            MessageBox.Show(serve.transeferRequest(request));           
        }

        protected void changeOwnership(object sender, EventArgs e)
        {
            var serve = new CiroService.Service1Client();
            //serve.OwnershipRequest(Session["user"], serve.getuseridbyemail(newOwner.Value), serve.getPackageID(pidcoa.Value));
        }

        protected void releasepackage(object sender, EventArgs e)
        {
            var serve = new CiroService.Service1Client();
        }
    }
}