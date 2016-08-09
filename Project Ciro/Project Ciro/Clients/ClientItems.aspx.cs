using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Ciro.Clients
{
    public partial class ClientItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
          protected void ListClientItems()
      {
          var serve = new CiroService.Service1Client();
          List<CiroService.jsonProduct> json = serve.clientProducts(Session["ID"].ToString()).ToList<CiroService.jsonProduct>();
          string tablecontents = "";
          foreach (CiroService.jsonProduct v in json)
          {
              tablecontents += "<tr><td>"+ v.Name + "</td><td>" + v.value + "</td><td>" + v.quantity + "</td><td>" + v.size + "</td><td>" + v.currentLocation + "</td><td>" + v.arrivalDate + "</tr>";
          }
          Response.Write(tablecontents); 
      }
    }
}