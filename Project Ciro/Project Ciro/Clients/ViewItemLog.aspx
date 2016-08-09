<%@ Page Title="" Language="C#" MasterPageFile="~/Clients/Client.Master" AutoEventWireup="true" CodeBehind="ViewItemLog.aspx.cs" Inherits="Project_Ciro.Clients.ViewItemLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        function tabs() {         
            return(window.location.hash.substr(1));
        }
      //  window.onload = tabs;
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Product Log
          <span></span>
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">UI</a></li>
        <li class="active">Timeline</li>
      </ol>
    </section>

    <section class="content">

      <div class="row">
        <div class="col-md-12">
          <ul class="timeline">        
              <%listlog(); %>            
            <li class="time-label">
                  <span class="bg-green">
                    24 Jan. 2012
                  </span>
            </li>
          </ul>
     </div>
      </div>
    </section>
  </div>
</asp:Content>
