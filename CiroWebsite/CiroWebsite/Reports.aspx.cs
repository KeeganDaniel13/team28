using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace CiroWebsite
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void NumberOfPackages()
        {
            string Draw = "data-options={tooltip:{trigger:'axis'},legend:{data:['Number Of Packages']},calculable:true,grid:{x: 60},xAxis:[{type:'value',boundaryGap:[0,0.01]}],yAxis:[{type:'category',data:['Brasil','Indonesia','USA','India','China','World(M)']}],series: [{name:'Number Of Packages',type:'bar',data:[18203,23489,29034,104970,131744,630230]},]}";


            WebBrowser wb = new WebBrowser();

            //wb.Document.GetElementById("err").vi


            Response.Write("<div data-plugin='chart' '" + Draw + "' style='height: 300px'></div> ");
        }

        protected void BINGO()
        {
            Response.Write("200000, 140000, 750000, 630000, 20000, 550000");
        }
    }
}