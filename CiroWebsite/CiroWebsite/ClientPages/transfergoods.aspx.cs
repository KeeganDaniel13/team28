using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace CiroWebsite
{
    public partial class transfergoods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["transfer"] != null)
            {
                Session["transferProduct"] = Request.QueryString["transfer"];
            }
            if (Request.QueryString["w"] != null)
            {
                Session["warehouse"] = Request.QueryString["w"];
                //Response.Redirect("transfergoods.aspx#step2");
                //Response.RedirectLocation = "step2";
               // Response.RedirectToRoute("#step2");
            }
            if (Request.QueryString["product"] != null)
            {
                var id = Convert.ToInt32(Request .QueryString["product"]);
                var transferList = (List<int>)Session["transfers"];
                if(transferList == null)
                {
                    transferList = new List<int>();
                }
                if(!transferList.Contains<int>(id))
                { transferList.Add(id); }
              
                Session["transfers"] = transferList;
                Response.Redirect("transfergoods.aspx");
            }

        }

        protected void saveInfo(object sender, EventArgs e)
        {
           Session["TransferInfo"] = new TransferForm {transferReason = changeReason.Value,date = DateTime.Now};
            completeRequest();
        }

        protected void completeRequest()
        {
            
            var ser = new CiroService.Service1Client();
            var transInfo = Session["TransferInfo"] as TransferForm;
            var productIDt = Convert.ToInt32(Session["transferProduct"]);
            var user = (CiroService.JsonUser)Session["user"];
            var warehouse = Convert.ToInt32(Session["warehouse"]);
            var transferIDs = (List<int>)Session["transfers"];
            List<CiroService.jsonTRequest> requests;
            if (transferIDs != null)
            {
                requests = new List<CiroService.jsonTRequest>();
                foreach(var i in transferIDs)
                {
                    requests.Add(new CiroService.jsonTRequest { userID = user.id, reason = transInfo.transferReason, endWarehouse = warehouse, productID = i ,date = transInfo .date});
                }
                CiroSingleton.ServerCalls.transeferRequest(requests.ToArray());
                Session["transfers"] = null;
            }
            
        }

        protected void listPackages()
        {
            var user = (CiroService.JsonUser)Session["user"];
            var packages = CiroSingleton.ServerCalls.clientProducts(new CiroService.JsonUser {id=user.id });
            //var packages = (List<CiroService.jsonProduct>)Session["currentItems"];
            try
            {
                string list = "";
                
                foreach(var package in packages)
                {
                    //string id = " id=" + package.ID.ToString();
                    //string name = " name='" + package.Name.ToString() + "'";
                    //string check = package.ID.ToString() + "c";
                    list += "<tr><td><a href='transfergoods.aspx?product="+package.ID+"'>Click</a></td><td>"+package.ID+"</td><td>" + package. Name+ "</td><td>"+package.currentLocation+"</td><td>"+package.value+"</td></tr>";
                    // list += "<tr><td><a href='#' " + id + name + " onclick = 'saveWarehouse(this.id, this.name)'>Click</a></td><td>" + v.id + "</td><td>" + v.name + "</td><td>" + v.location + "</td><td>" + progress + "</td><td>" + per + "</td></tr>";
                }
                Session["items"] = packages;
                Response.Write(list);
            }
            catch (Exception) { }
        }
        
        protected void listwarehouse()
        {
            var warehouses = new CiroService.Service1Client().warehouses();
            var body = "";
            var count = 1;

            foreach (var w in warehouses)
            {

                body += "<td>";
                body += "<table class='table' style='width:350px'>";
                body += "<tr><th colspan='5'><b>" + w.name + "</b></th></tr>";
                body += "<tr><td colspan='5'><img class='img-responsive' src='../infinity/assets/images/warehouse.jpg' alt='avatar'/><i class='fa fa-map-marker'></i>Location :" + w.location + "<br/>Type:" + w.warehousetype + "<br/> <ul class='list-inline pull-right'><li><a href='viewware.aspx' class='btn btn-info btn-xs'>View Warehouse</a></li><li><a href='transfergoods.aspx?w=" + w.id + "' class='btn btn-success btn-xs'>Select</a></li></ul></div></td></tr>";
               // body += "<tr><td colspan='5'><img class='img-responsive' src='../infinity/assets/images/warehouse.jpg' alt='avatar'/>Location :" + w.location + "<br/>Type:" + w.warehousetype + "<br/><a href='viewware.aspx' class='btn btn-outline mw-md rounded btn-success btn-xs'>View Warehose</a><br/><a href='transfergoods.aspx?w=" + w.id + "' class='btn btn-outline mw-md rounded btn-success btn-xs'>Select Warehouse</a></div></td></tr>";
               
                body += "</table>";
                body += "</td>";
                if (count % 3 == 0)
                {
                    body += "<tr></tr>";
                }
                count++;
            }
            Response.Write(body);   
        }


        //needs completion
        protected void displayTransferList()
        {
            var transferList = (List<int>)Session["transfers"];
            if(transferList!=null)
            {
                string body = "";
                foreach (var i in transferList)
                {
                    body += "<tr>";
                    body += "<td>Name</td>";
                    body += "<td>quantity</td>";
                    body += "<td>currentlocation</td>";
                    body += "<td>destination</td>";
                    body += "<td>transfer date</td>";
                    body += "</tr>";

                }
                Response.Write(body);
            }
            
        }

    }
}