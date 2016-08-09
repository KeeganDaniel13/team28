using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;
namespace EFRest
{
    public partial class index : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            var client = new RestClient("localhost:50307");
            var request = new RestRequest(Method.GET);
            request.Resource = "api/user";
            request.RequestFormat = DataFormat.Json;
            var queryResult = client.ExecuteAsGet(request, "GET");
            form1.InnerText = request.ToString();
            form1.InnerText = queryResult.Content;
            
        }
    }
}