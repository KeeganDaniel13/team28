using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class viewware : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["w"] != null)
            {
                var warehouses = (List<CiroService.JsonWarehouse>)Session["warehouses"];
                CiroService.JsonWarehouse warehouse = warehouses.First<CiroService.JsonWarehouse>(c => c.id == Convert.ToInt32(Request.QueryString["w"]));
                description.InnerHtml = warehouse.descrption;
                imgDiv.InnerHtml = "<img src='../infinity/assets/images/11.jpg' alt='img'>";
                wName.InnerHtml += warehouse.name;
                //type.InnerHtml += "" + warehouse.warehousetype;
                loc.InnerHtml += warehouse.location;
            }
            else
            { Response.Redirect("/viewware.aspx"); }
        }
    }
}