<%@ Page Title="" Language="C#" MasterPageFile="~/Warehousemanager/WarehouseManager.Master" AutoEventWireup="true" CodeBehind="ChangeOfOwnership.aspx.cs" Inherits="Project_Ciro.Warehousemanager.ChangeOfOwnership" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Ownership Changes
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Mailbox</li>
      </ol>
    </section>



    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3" style="width:100%">          

          <div class="box box-solid" >
            <div class="box-tools">
                </div>
          
      
          </div>
          <table style="width:100%">

                   <%listrequests(); %>

</table>
        </div>
     


          <br />

               
            <!--       <tr>
                       <td>
        <div class="col-md-3" style="width:100%">
          
          <div class="box box-danger direct-chat direct-chat-success">
            <div class="box-header with-border" >
              <h3 class="box-title" style="margin-left:40%">#531645</h3>
            </div>
            <div class="box-body">
           <div class="form-group" style="margin-left:2%;margin-right:2%">
                  <label for="exampleInputEmail1">User</label>
                  <input type="email" runat="server" class="form-control" id="newOwner" placeholder="Enter email">
                </div>
                 <div class="form-group">
                  <label for="exampleInputEmail1">Product</label>
                  <input type="email" runat="server" class="form-control" id="Email1" placeholder="Enter email">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Expiration Date</label>
                  <input type="email" runat="server" class="form-control" id="Email2" placeholder="Enter email">
                </div>
            </div>
           <div class="box-footer">
              <form action="#" method="post">
                <div class="input-group">
                  <button type="submit" class="btn btn-danger btn-flat" style="width:42%">Reject</button>
                      <span class="input-group-btn">
                        <button type="submit" class="btn btn-success btn-flat">Release</button>
                      </span>
                </div>
              </form>
            </div>
          </div>
        </div>
                       </td>     
                       </tr>               -->                                                           



      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

</asp:Content>