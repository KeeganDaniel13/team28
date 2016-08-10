using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Project_Ciro.Customs
{
    public partial class warehouseoverview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           /* var value = Request.QueryString.ToString();
            if(value == "true=")
            {
            }
            else
            {
            }*/
        }

        protected void getWarehouses()
        {
            var serviceConnection = new CiroService.Service1Client();
            List<CiroService.JsonWarehouse> warehouses = serviceConnection.getWarehouse().ToList<CiroService.JsonWarehouse>();

            string warehouseDisplay = "";
            foreach(CiroService.JsonWarehouse w in warehouses)
            {
                warehouseDisplay += "<tr><td><div contenteditable>" + w.name + "</div></td><td><div contenteditable>" + w.user + "</div></td><td><div contenteditable>" + w.location + "</div></td><td><div contenteditable>" + w.size + "</div></td><td><div class='progress progress-sm active'><div class='progress-bar progress-bar-success progress-bar-striped' role='progressbar' aria-valuenow='20' aria-valuemin='0' aria-valuemax='100' style='width: 20%'><span class='sr-only'>20</span></div></div></td><td><a class='btn btn-social-icon btn-dropbox'  href='Warehouses.aspx?true='true'><span title = 'Remove Warehouse'><i class='fa fa fa-trash'></i></span></a></td></tr>";
            }
            Response.Write(warehouseDisplay);
        }
    }
}