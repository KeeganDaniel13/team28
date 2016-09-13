using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class Warehouse_Reports : System.Web.UI.Page
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

        protected void getlenght()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.PackageLengthCategories();

            string list = "";

            foreach (CiroService.PackageSizeCategory a in warehouses)
            {
                list += " {value:" + a.count + ", name:'" + a.category + "'},";
            }

            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
        protected void getwidth()
        {
            var serve = new CiroService.Service1Client();
            var warehouses = serve.PackagewidthCategories();

            string list = "";

            foreach (CiroService.PackageSizeCategory a in warehouses)
            {
                list += " {value:" + a.count + ", name:'" + a.category + "'},";
            }

            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void getMonths()
        {
            var serve = new CiroService.Service1Client();
            //   CiroService.jsonLoginUser user = (CiroService.jsonLoginUser)Session["User"];
            //   var warehouses = serve.PackagesPerMonth(user.name);
            var warehouses = serve.PackagesPerMonth("Warehouse");

            string list = "";

            foreach (CiroService.PackagePerMonth a in warehouses)
            {
                list += "'" + a.month + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void getMonthValues()
        {
            var serve = new CiroService.Service1Client();
           // CiroService.jsonLoginUser user = (CiroService.jsonLoginUser)Session["User"];
            // var warehouses = serve.PackagesPerMonth(user.name);
             var warehouses = serve.PackagesPerMonth("Warehouse");


            string list = "";

            foreach (CiroService.PackagePerMonth a in warehouses)
            {
                list += "'" + a.packages + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
    }
}