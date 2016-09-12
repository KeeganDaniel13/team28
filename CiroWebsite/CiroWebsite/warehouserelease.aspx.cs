﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class warehouserelease : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = (CiroService.JsonUser)Session["user"];
            var releaseRequest = CiroSingleton.ServerCalls.releaseWareHouse(new CiroService.JsonWarehouse { id = user.warehouseID });
            var body = "";
            foreach(var release in releaseRequest )
            {
                body += "";
            }
            releaseTable.InnerHtml = body;
        }
    }
}