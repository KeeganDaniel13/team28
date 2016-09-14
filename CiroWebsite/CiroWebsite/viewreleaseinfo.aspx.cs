﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace CiroWebsite
{
    public partial class viewreleaseinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = (CiroService.JsonUser)Session["user"];
            if(Request.QueryString["accept"] != null)
            {
                CiroSingleton.ServerCalls.approveRequest("Accepted",new CiroService.JsonProducts { id = Convert.ToInt32(Request.QueryString ["accept"]),userid=user.id},"");
            }
            if (Request.QueryString["reject"] != null)
            {
                CiroSingleton.ServerCalls.approveRequest("Rejected", new CiroService.JsonProducts { id = Convert.ToInt32(Request.QueryString["reject"]), userid = user.id },"");
            }
            if (Request.QueryString["info"] != null)
            {
                var requests = Session["releases"] as List<CiroService.JsonReleaseRequest>;
                var request = requests.First<CiroService.JsonReleaseRequest>(c => c.product_id == Convert.ToInt32(Request.QueryString["info"]));
                name.InnerHtml = request.userInfo.email;
                var body = "<td>"+request .productInfo .name+"</td>";
                body += "<td>"+request .productInfo .quantity+"</td>";
                body += "<td>" + "Tax" + "</td>";
                body += "<td>" +request .productInfo .bill  +"</td>";
                body += "<td>" +request .productInfo .arrivalDate +"</td>";
                body += "<td>" + request .productInfo .cosigner+"</td>";
                body += "<td><a class='btn btn-success' href='viewreleaseinfo.aspx?accept="+request.product_id + "'><i class='fa fa-check-circle-o'></i></a><a class='btn btn-danger' href='viewreleaseinfo.aspx?reject=" + request.product_id + "'><i class='fa fa-times '></i></a></td>";
                releaseInfo.InnerHtml = body;
            }
            else
            {
                Response.Redirect("release.aspx");
            }
        }

    }
}