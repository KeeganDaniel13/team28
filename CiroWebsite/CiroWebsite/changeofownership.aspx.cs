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
            /*
            if (!IsPostBack)
            {
                var user =(CiroService .JsonUser)(Session["user"]);
                //var server = new CiroService.Service1Client();
                ownedProducts = CiroSingleton.ServerCalls.clientProducts(new CiroService.JsonUser { id = user.id }).ToList<CiroService.jsonProduct>();
                Session["userList"] = ownedProducts;
                foreach (var prod in ownedProducts)
                {
                    goods.Items.Add(new ListItem(prod.Name + "-" + prod.bill/*+"-" add Country , "" + prod.ID));
                }
            }
            */
        }
        /*
        protected void fillInfo(object sender, EventArgs e)
        {

            var fillGoods = (List<CiroService.jsonProduct>)Session["userList"];
            var good = fillGoods.First<CiroService.jsonProduct>(c => c.ID == Convert.ToInt32(goods.Value));
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

        }
        */
        protected void Approve(object sender, EventArgs e)
        {

            var toUser = (ChangeUser)Session["changeUser"];
            var changeItem = (CiroService.jsonProduct)Session["changeItem"];
            CiroSingleton.ServerCalls.OwnershipRequest(new CiroService.JsonUser { id = toUser.tranferer }, new CiroService.JsonUser { email = toUser.transfereeEmail }, new CiroService.JsonProducts { id = changeItem.ID });
        }
    }
}