using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class warehouseview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["w"] != null)
            {
                var warehouses = (List<CiroService.JsonWarehouse>)Session["warehouses"];
                CiroService.JsonWarehouse warehouse = warehouses.First<CiroService.JsonWarehouse>(c => c.id == Convert.ToInt32(Request.QueryString["w"]));
                name.InnerHtml += warehouse.name;
                type.InnerHtml += ""+warehouse.warehousetype;
                loaction.InnerHtml += warehouse.location;
            }
            else
            { Response.Redirect(""); }
            
        }

}
}