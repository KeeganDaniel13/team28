<%@ Page Title="" Language="C#" MasterPageFile="~/Customs/Customs.Master" AutoEventWireup="true" CodeBehind="AddCountryRelation.aspx.cs" Inherits="Project_Ciro.Customs.AddCountryRelation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       Add Country Relation
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
              <h4 class="box-title">Warehouse Information</h4>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Add Country Name</label>
                  <input type="text" runat="server" id="txtName" class="form-control" placeholder="Country">
                </div>         
                <div class="box-footer">
                <button type="submit" runat="server" onserverclick="btnAdd" class="btn btn-primary">Add</button>
                <a href="Clientele.aspx"></a>
              </div>
            </form>
          </div>



       </div>
</asp:Content>
