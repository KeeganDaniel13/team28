using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Windows.Forms;



namespace CiroWebsite
{
    public partial class declaregoods : System.Web.UI.Page
    {
        List<CiroService.jsonProduct> declaredItems = new List<CiroService.jsonProduct>();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<CiroService.jsonProduct> declared = Session["declared"] as List<CiroService.jsonProduct>;
            if (Request.QueryString["id"] != null)
            {
               
               /* if (declared != null)
                {
                    declaredItems = new List<CiroService.jsonProduct>();
                    foreach (CiroService.jsonProduct item in declared)
                    {
                        declaredItems.Add(item);
                    }
                }*/
            }
            if (declared != null)
            {
                declaredItems = null;
                declaredItems = new List<CiroService.jsonProduct>();
                foreach (CiroService.jsonProduct item in declared)
                {
                    declaredItems.Add(item);
                }
            }
        }

        protected void SaveItem(object sender, EventArgs e)
        {
            var user = (CiroService.JsonUser)Session["user"];
            int insure = 0;
            if(select.Value .ToLower()=="yes")
            {
                insure = 1;
            }
            declaredItems.Add(new CiroService.jsonProduct { userID = user.id ,Name = productName.Value, value = Convert.ToDecimal(productValue.Value), transferLocation = WarehouseName.Value, ID = declaredItems.Count() + 1, size = 1, quantity = Convert.ToInt32(quantity .Value ),insured =insure,description=reason.Value });
            Session["declared"] = declaredItems;
            WarehouseName.Value = "";
            productValue.Value = "";
            productName.Value = "";
        }

        protected void listItems()
        {
            var table = "";
            int count = 1;
            foreach (var item in declaredItems)
            {
                table += "<tr><td>" + count + "</td><td>" + item.Name + "</td><td>" + item.value + "</td><td>" + item.transferLocation + "</td><td><a href=\"declaregoods.aspx?id=" + item.ID + "\">Click</a></td></tr>";
                count++;
            }
            Response.Write(table);
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
            int count = 1;

            foreach (var v in warehouses)
            {
                string id = " id=" + v.id.ToString();
                string name = " name='" + v.name.ToString() + "'";
                string check = v.id.ToString() + "c";
                list += "<tr><td><a href='#' " + id + name + " onclick = 'saveWarehouse(this.id, this.name)'>Click</a></td><td>" + v.id + "</td><td>" + v.name + "</td><td>" + v.location + "</td><td>" + progress + "</td><td>" + per + "</td></tr>";
            }
            count++;
            Response.Write(list);
        }

        protected void declareItems(object sender, EventArgs e)
        {
            var server = new CiroService.Service1Client();
            CiroService.jsonProduct[] items = new CiroService.jsonProduct[declaredItems.Count()];
            int i = 0;
            foreach (CiroService.jsonProduct p in declaredItems)
            {
                items[i] = p;
                i++;

            }
            server.stockAdd(country.Value, items);
            declaredItems = null;
            Response.Redirect("inventory.aspx");
        }
    }
}