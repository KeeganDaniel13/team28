using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace CiroWebsite
{
    public partial class changeofownership : System.Web.UI.Page
    {
        List<CiroService.jsonProduct> ownedProducts;
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if(Request.QueryString["product"]!=null)
            {
                var id = Convert.ToInt32(Request.QueryString["product"]);
                fillInfo(id);
            }
            if (!IsPostBack)
            {
                var user =(CiroService .JsonUser)(Session["user"]);
                //var server = new CiroService.Service1Client();
                ownedProducts = CiroSingleton.ServerCalls.clientProducts(new CiroService.JsonUser { id = user.id }).ToList<CiroService.jsonProduct>();
                Session["userList"] = ownedProducts;
                foreach (var prod in ownedProducts)
                {
                    //goods.Items.Add(new ListItem(prod.Name + "-" + prod.bill/*+"-" add Country , "" + prod.ID));
                }
            }
            
        }
        
        protected void fillInfo(int var)
        {

            var fillGoods = (List<CiroService.jsonProduct>)Session["userList"];
            var good = fillGoods.First<CiroService.jsonProduct>(c => c.ID == Convert.ToInt32(var));
            var toUser = (ChangeUser)Session["changeUser"];
            Session["changeItem"] = good;
            origincountry.Value = "Get Country Origin from database";
            Locationgoods.Value = good.currentLocation;
            if (good.transferLocation != "" || good.transferLocation != null)
            {
                Destinationgoods.Value = good.transferLocation;
            }
            else
            {
                Destinationgoods.Value = "Not Scheduled for transfer";
            }
            cosignee.Value = toUser.tranfereeName;
            origincountry.Value = good.origin;
            quantity.Value = good.quantity+"";
            bill.Value = good.bill;

        }
        protected void listPackages()
        {
            var user = (CiroService.JsonUser)Session["user"];
            var packages = CiroSingleton.ServerCalls.clientProducts(new CiroService.JsonUser { id = user.id });
            var packagesInfo = (List<CiroService.jsonProduct>)Session["packagesInfo"];
            try
            {
                string list = "";

                foreach (var package in packages)
                {
                    //string id = " id=" + package.ID.ToString();
                    //string name = " name='" + package.Name.ToString() + "'";
                    //string check = package.ID.ToString() + "c";
                    list += "<tr><td><a href='changeofownership.aspx?product=" + package.ID + "'>Click</a></td><td>" + package.ID + "</td><td>" + package.Name + "</td><td>" + package.currentLocation + "</td><td>" + package.value + "</td></tr>";
                    // list += "<tr><td><a href='#' " + id + name + " onclick = 'saveWarehouse(this.id, this.name)'>Click</a></td><td>" + v.id + "</td><td>" + v.name + "</td><td>" + v.location + "</td><td>" + progress + "</td><td>" + per + "</td></tr>";
                }
                Session["items"] = packages;
                Response.Write(list);
            }
            catch (Exception) { }
        }
        protected void Approve(object sender, EventArgs e)
        {

            var toUser = (ChangeUser)Session["changeUser"];
            var changeItem = (CiroService.jsonProduct)Session["changeItem"];
            MessageBox.Show(CiroSingleton.ServerCalls.OwnershipRequest(new CiroService.JsonUser { id = toUser.tranferer }, new CiroService.JsonUser { email = toUser.transfereeEmail }, new CiroService.JsonProducts { id = changeItem.ID }));
        }
    }
}