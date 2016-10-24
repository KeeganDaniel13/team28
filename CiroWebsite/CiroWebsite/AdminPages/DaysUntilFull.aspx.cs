using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite.AdminPages
{
    public partial class DaysUntilFull : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void days()
        {
            var serve = new CiroService.Service1Client();
            var days = serve.StorageFilledBy();

            string list = "";

            foreach (CiroService.StorageFilledBy d in days)
            {
                if (d.DaysTilFull != -1)
                {
                    list += "'" + d.DaysTilFull + "',";
                }
                else
                {
                    list += "'" + 0 + "',";
                }
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
        protected void warehouse()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRates();

            string list = "";

            foreach (CiroService.WarehousesStorageRates r in rates)
            {
                list += "'" + r.warehouse + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
    }
}