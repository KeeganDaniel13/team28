using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CiroWebsite
{
    public partial class addofficial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addOfficial(object sender,EventArgs e)
        {
            CiroSingleton.ServerCalls.register(new CiroService.JsonUser { fname =name.Value ,lname=surname.Value,email =name.Value+"@gmail",password =name.Value ,usertype =2});
        }
    }
}