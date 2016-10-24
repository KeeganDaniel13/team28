using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite.WarehousePages
{
    public partial class CommonHeight : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void getCategories()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.PackageHeightCategories();

            string list = "";

            foreach (CiroService.PackageSizeCategory a in warehouses)
            {
                list += "'" + a.category + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void getheight()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.PackageHeightCategories();

            string list = "";

            foreach (CiroService.PackageSizeCategory a in warehouses)
            {
                list += " {value:" + a.count + ", name:'" + a.category + "'},";
            }

            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
    }
}