using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Project_Ciro.Customs
{
    public partial class approvetranfers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void fuck()
        {
            Response.Write("<a href = '#' id= 'biggy' onclick='myFunction(this.id)' > Update shit </a>");
        }

        protected void test(object sender, EventArgs e)
        {           
            // MessageBox.Show(err.Value);
            // MessageBox.Show(Session["pleasework"].ToString());
        }
    }
}