using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Ciro.Admin
{
    public partial class WarehouseAddition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAdd(object sender, EventArgs e)
        {
            var serverConnection = new CiroService.Service1Client();
            if (scType.Value == "Select A Type")
            {
            }
            else
            {
                if (scType.Value == "Ordinary Storage (OS)")
                {
                    int type = 1;
                    serverConnection.addWarehouse(new CiroService.JsonWarehouse { name = txtName.Value, location = txtLocation.Value, size = Convert.ToInt32(txtSize.Value), user = Convert.ToInt32(txtUser.Value), warehousetype = type });
                }
                else if (scType.Value == "Special Storage (SOS)")
                {
                    int type = 2;
                    serverConnection.addWarehouse(new CiroService.JsonWarehouse { name = txtName.Value, location = txtLocation.Value, size = Convert.ToInt32(txtSize.Value), user = Convert.ToInt32(txtUser.Value), warehousetype = type }); 
                }
                Response.Redirect("Warehouses.aspx");
            }
        }
    }
}