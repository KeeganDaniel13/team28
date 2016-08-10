<%@ Page Title="" Language="C#" MasterPageFile="Customs.Master" AutoEventWireup="true" CodeBehind="COfficalsAddition.aspx.cs" Inherits="Project_Ciro.Admin.COfficalsAddition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       Add Customs Official
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
              <h4 class="box-title">Customs Official Information</h4>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form">
              <div class="box-body">
                <div class="form-group">
                  <label>First Name of Officer</label>
                  <input type="text" class="form-control" id="txtName" runat="server" placeholder="Name of Officer">
                </div>      
                  <div class="form-group">
                  <label>Surname</label>
                  <input type="text" class="form-control" runat="server" id="txtSurname" placeholder="Surname">
                </div>       
                   <div class="form-group">
                  <label>Email</label>
                  <input type="text" class="form-control" runat="server" id="txtEmail" placeholder="Email">
                </div>        
                   <div class="form-group">
                  <label>Password</label>
                  <input type="password" class="form-control" runat="server" id="txtPassword" placeholder="Password">
                </div>        
                   <div class="form-group">
                  <label>Confirm Password</label>
                  <input type="password" class="form-control" runat="server" id="txtConfirm" placeholder="Confirm Password">
                </div>   
                <div class="box-footer">
                <button type="submit" runat="server" onserverclick="btnAdd" class="btn btn-primary">Add</button>
                <a href="Clientele.aspx"></a>
              </div>
            </form>
          </div>



       </div>
</asp:Content>
