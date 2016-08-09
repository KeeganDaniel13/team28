using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Project_Ciro.Clients
{
    public partial class testet : System.Web.UI.Page
    {
        private int counter= 1;
        private List<CiroService.jsonProduct> prods = new List<CiroService.jsonProduct>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {

                List<CiroService.jsonProduct> d = Session["list"] as List<CiroService.jsonProduct>;

                if(d != null)
                {
                    foreach(CiroService.jsonProduct f in d)
                    {
                        prods.Add(f);                
                    }              
                }
            }           
        }

        protected void save(object sender, EventArgs e)
        {
            
            CiroService.jsonProduct prod = new CiroService.jsonProduct { Name = txtname.Value, value = Decimal.Parse(txtvalue.Value), userID = 1, transferLocation = wareto.Value };
            prods.Add(prod);

            Session["list"] = prods;

            txtname.Value = "";
            txtvalue.Value = "";
            wareto.Value = "";                  
        }

        

        protected void saveditems()
        {
            var body = "";
            foreach(CiroService.jsonProduct p in prods)
            {
                body += "<tr><td>" + counter + "</td><td>" + p.Name + "</td><td>" + p.value + "</td><td>" + p.transferLocation + "</td></tr>";
                counter++;
                Session["counter"] = counter;
            }
            Response.Write(body);
        }

        protected void declare(object sender, EventArgs e)
        {
            var serv = new CiroService.Service1Client();           
            CiroService.jsonProduct[] items = new CiroService.jsonProduct[int.Parse(Session["counter"].ToString())];
            int i = 0;
            foreach (CiroService.jsonProduct p in prods)
            {                
                items[i] = p;            
                i++;
                
            }            
                serv.stockAdd("Japan", items);
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
                string name = " name=" + v.name.ToString();
                string check = v.id.ToString() + "c";
                list += "<tr><td><a href='#' " + id + name + " onclick = 'warehouseSelection(this.id, this.name)'><input type='checkbox'></a></td><td>" + count + "</td><td>" + v.name + "</td><td>" + v.location + "</td><td>" + progress + "</td><td>" + per + "</td></tr>";
            }
            count++;
            Response.Write(list);
        }
    }
}