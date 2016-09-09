using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Ciro.Customs
{
    public partial class Customs : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           /* if(Session["ID"] == null)
            {
                Response.Redirect("../Main/Login.aspx");
            }
            else if (Session["ID"].Equals(1))
            {
                Response.Redirect("../client/ClientItems.aspx");
            }
            else if (Session["ID"].Equals(3))
            {
                Response.Redirect("../Warehousemanager/WarehouseItems.aspx");
            }
            else { }*/
        }
    }
}