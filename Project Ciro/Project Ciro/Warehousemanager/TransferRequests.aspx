<%@ Page Title="" Language="C#" MasterPageFile="~/warehousemanager/WarehouseManager.Master" AutoEventWireup="true" CodeBehind="TransferRequests.aspx.cs" Inherits="Project_Ciro.Customs.TransferRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Transfer Requests
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Mailbox</li>
      </ol>
    </section>

      <br/>


    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3" style="width:100%">          

          <div class="box box-solid" >
            <div class="box-tools">
                </div>
          
          <div class="box box-solid" >
            <div class="box-header with-border">
              <h3 class="box-title">Package Status</h3>

              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <ul style="white-space:nowrap";>
                <li style="display:inline"><a href="#" style="color:black"><i class="fa fa-circle text-red" style="color:black"></i>Unpaid</a></li>           
                <li style="display:inline; margin-left: 35%"><a href="#" style="color:black"><i class="fa fa-circle text-yellow "></i> Unchecked</a></li>
                  <li style="display:inline;margin-left: 35%"> <a href="#" style="color:black"><i class="fa fa-circle text-green"></i> Paid</a></li>
              </ul>


                

            </div>

            <!-- /.box-body -->
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