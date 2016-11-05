using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Isles()
        {
            var serve = new CiroService.Service1Client();
            var incidents = serve.IncidentsPerIsle("3");

            string list = "";

            foreach (CiroService.incidentsperisle r in incidents)
            {
                list += "'" + r.isle + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void incidents()
        {
            var serve = new CiroService.Service1Client();
            var incidents = serve.IncidentsPerIsle("3");

            string list = "";

            foreach (CiroService.incidentsperisle r in incidents)
            {
                list += "'" + r.incidents + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
    }
}