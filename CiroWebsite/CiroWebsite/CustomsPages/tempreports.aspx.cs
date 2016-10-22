using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite.CustomsPages
{
    public partial class tempreports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Storage Rate For Admin=======================================================================================================

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

        protected void incoming()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRates();

            string list = "";

            foreach (CiroService.WarehousesStorageRates r in rates)
            {
                list += "'" + r.incoming + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void Outgoing()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRates();

            string list = "";

            foreach (CiroService.WarehousesStorageRates r in rates)
            {
                list += "'-" + r.outgoing + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
        protected void Rate()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRates();

            string list = "";

            foreach (CiroService.WarehousesStorageRates r in rates)
            {
                list += "'" + (r.incoming - r.outgoing) + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
        //Storage Rate For Admin=======================================================================================================

        protected void days()
        {
          /*  var serve = new CiroService.Service1Client();
            var days = serve.StorageFilledBy();

            string list = "";

            foreach (CiroService.StorageFilledBy d in days)
            {
                list += "'" + d.DaysTilFull + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);*/
        }

        //storage rate for warehouse===================================================================================================
        protected void mRate()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRate("3");

            string list = "";

            foreach (CiroService.WarehouseStorageRate r in rates)
            {
                list += "'" + (r.incoming - r.outgoing) + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void mincoming()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRate("3");

            string list = "";

            foreach (CiroService.WarehouseStorageRate r in rates)
            {
                list += "'" + r.incoming + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void mOutgoing()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRate("3");

            string list = "";

            foreach (CiroService.WarehouseStorageRate r in rates)
            {
                list += "'-" + r.outgoing + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }

        protected void month()
        {
            var serve = new CiroService.Service1Client();
            var rates = serve.StorageRate("3");

            string list = "";

            foreach (CiroService.WarehouseStorageRate r in rates)
            {
                list += "'" + r.month + "',";
            }
            list = list.Remove(list.Length - 1);
            Response.Write(list);
        }
    }
}