using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace CiroWebsite
{
    public partial class users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var users = CiroSingleton.ServerCalls.GetUsers();
            int warehouse = 0;
            int client = 0;
            int customs = 0;
            var body = "";
            foreach(var u in users)
            {

                body += "<div class='col-sm-6'>";
                body += "<div class='user-card contact-item p-md'>";
                body += "<div class='media'>";
                body += "<div class='media-left'>";
                body += "<div class='avatar avatar-xl avatar-circle'>";
                body += "<img src='../infinity/assets/images/212.jpg' alt='contact image'>";
                body += "</div>";
                body += "</div>";
                body += "<div class='media-body'>";
                body += "<h5 class='media-heading title-color'>" + u.fname + " " +u.lname +"</h5>";
                body += "<small class='media-meta'>"+u.usertype+"</small>";
                body += "<div class='contact-links m-t-sm'>";
                body += "<a href='javascript:void(0)' class='icon icon-circle icon-sm m-b-0' data-toggle='tooltip' title='Phone' data-placement='top'><i class='fa fa-phone'></i></a>";
                body += "<a href='javascript:void(0)' class='icon icon-circle icon-sm m-b-0' data-toggle='tooltip' title='Mobile' data-placement='top'><i class='fa fa-mobile'></i></a>";
                body += "</div>";
                body += "</div>";
                body += "</div>";
                body += "<div class='contact-item-actions'>";
                body += "<a href='javascript:void(0)' class='btn btn-success' data-toggle='modal' data-target='#contactModal'><i class='fa fa-pencil'></i></a>";
                body += "<a href='javascript:void(0)' class='btn btn-danger' data-toggle='modal' data-target='#deleteItemModal'><i class='fa fa-trash'></i></a>";
                body += "</div>";
                body += "</div>";
                body += "</div>";
                if (u.usertypename.ToLower().Equals("client"))
                {
                    client++;
                }
                else if (u.usertypename.ToLower().Equals("custom"))
                {
                    customs++;
                }
                else
                {
                    warehouse++;
                }
            }
            total.InnerHtml =""+ (warehouse + customs + client);
            clientTotal.InnerHtml = "" + client;
            warehouseTotal.InnerHtml  = "" + warehouse;
            officalTotal.InnerHtml = "" + customs;
            userslist.InnerHtml = body;
            
        }

        protected void addOfficial(object sender,EventArgs e)
        {
            CiroSingleton.ServerCalls.register(new CiroService.JsonUser { fname = contactName.Value, lname = surname.Value, email = contactName.Value + "@gmail", password = contactName .Value, usertype = 2 });
        }
    }
}