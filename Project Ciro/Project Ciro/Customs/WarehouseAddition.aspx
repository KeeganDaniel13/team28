<%@ Page Title="" Language="C#" MasterPageFile="Customs.Master" AutoEventWireup="true" CodeBehind="WarehouseAddition.aspx.cs" Inherits="Project_Ciro.Admin.WarehouseAddition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       Add Warehouse
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
                  <label>Name of Warehouse</label>
                  <input type="text" class="form-control" id="txtName" runat="server" placeholder="Name of Warehouse">
                </div>      
                  <div class="form-group">
                  <label>Location</label>
                  <input type="text" class="form-control" runat="server" id="txtLocation" placeholder="Location">
                </div>       
                   <div class="form-group">
                  <label>Warehouse Size</label>
                  <input type="text" class="form-control" runat="server" id="txtSize" placeholder="Size">
                </div>        
                   <div class="form-group">
                  <label>Warehouse Owner (User Number)</label>
                  <input type="text" class="form-control" runat="server" id="txtUser" placeholder="Owner">
                </div>                         
                  <label>Warehouse Type</label>
                 <div class="form-group">                
                  <select runat="server" id="scType" class="form-control">
                    <option>Select A Type</option>
                    <option>Ordinary Storage (OS)</option>
                    <option>Special Storage (SOS)</option>
                  </select>               
                </div>          
                <div class="box-footer">
                <button type="submit" runat="server" onserverclick="btnAdd" class="btn btn-primary">Add</button>
                <a href="Clientele.aspx"></a>
              </div>
            </form>
          </div>



       </div>
</asp:Content>
