<%@ Page Title="" Language="C#" MasterPageFile="~/Customs/Customs.Master" AutoEventWireup="true" CodeBehind="AddWarehouseMan.aspx.cs" Inherits="Project_Ciro.Customs.AddWarehouseMan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       Add Warehouse Staff
        <small></small>
      </h1>
        <br/>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Data tables</li>
      </ol>
    </section>

       <div class="box box-primary">
            <div class="box-header with-border">
              <h4 class="box-title">Adding Warehouse Manager</h4>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">First Name of Manager</label>
                  <input type="text" runat="server" class="form-control" id="txtName" placeholder="First Name">
                </div>
                <div class="form-group">
                  <label>Surname</label>
                  <input type="text" runat="server" class="form-control" id="txtSurname" placeholder="Surname">
                </div>      
                  <div class="form-group">
                  <label>Email</label>
                  <input type="text" runat="server" class="form-control" id="txtEmail" placeholder="Email">
                </div>       
                   <div class="form-group">
                  <label>Password</label>
                  <input type="password" runat="server" class="form-control" id="txtPassword" placeholder="Password">
                </div>        
                   <div class="form-group">
                  <label>Confirm Password</label>
                  <input type="password" runat="server" class="form-control" id="txtConfirm" placeholder="Confirm Password">
                </div>   
                <div class="box-footer">
                <button type="submit" runat="server" onserverclick="btnAdd" class="btn btn-primary">Add</button>
                <a href="Clientele.aspx"></a>
              </div>
            </form>
          </div>



       </div>
</asp:Content>
