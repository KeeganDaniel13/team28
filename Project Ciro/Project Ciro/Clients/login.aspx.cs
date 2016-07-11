using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Net;
using System.IO;
namespace Project_Ciro.Clients
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {     
        }

        protected void loginButton(object sender, EventArgs e)
        {
          
            if(name.Value == "" || password.Value == "")
            {
                MessageBox.Show("Empty TextBoxes");
                return;
            }
            var serve = new CiroService.Service1Client();
            MessageBox.Show(serve.login(name.Value,password.Value));
            //string url = string.Format("http://localhost:50983/Service1.svc/login/{0}/{1}",name.Value,password.Value);// "kmalendegmail.com/chuck";
            //var  serCon =(HttpWebRequest) WebRequest.Create(url) ;
            // WebProxy myProxy = new WebProxy("10.200.254.1:3128", true);
            //myProxy.Credentials = new NetworkCredential("201321651","poloko06");
            //serCon.Method="GET";
            //serCon.ContentType = "application/json";
            // Stream objStream = serCon.GetResponse().GetResponseStream();
            // StreamReader objReader = new StreamReader(objStream);
            //string rline = "";
            //string response = "";
            // while (rline != null)
            // {
            // rline = objReader.ReadLine();
            // if (rline != null)
            //{
            // response += rline;
            //}
            //}
            //MessageBox.Show(response);
        }

    }
}