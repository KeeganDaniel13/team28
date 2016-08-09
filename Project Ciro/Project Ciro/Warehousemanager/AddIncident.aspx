<%@ Page Title="" Language="C#" MasterPageFile="~/Warehousemanager/WarehouseManager.Master" AutoEventWireup="true" CodeBehind="AddIncident.aspx.cs" Inherits="Project_Ciro.Warehousemanager.AddIncident" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       Add Incident
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
              <h4 class="box-title">Incident Information</h4>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Package Code</label>
                  <input type="text" class="form-control" runat="server" id="package" placeholder="Enter package Code Here">
                </div>
                <div class="form-group">
                  <label>Image</label>
                  <input type="text" class="form-control" runat ="server" id="image" placeholder="Enter Image Name Here">
                </div>      
                  <div class="form-group">     
                  <label>Select The Image Format</label>           
                  <select id="imgFormat" runat="server" class="form-control">
                    <option></option>
                    <option>JPEG (*.jpg, *.jpeg, *.jpe, *.jfif)</option>
                    <option>PNG (*.png)</option>
                    <option>BITMAP (*.bmp, *.dib)</option>
                  </select>               
                </div>       
                  <div class="form-group">
                  <label>Incident Description</label>
                  <textarea runat="server" id="txtdescription" class="form-control" rows="3" placeholder="Enter Description Here"></textarea>
                </div>       
                                    
                <div class="box-footer">
                <button type="submit" runat="server" onserverclick="addincident" class="btn btn-primary">Add</button>
                <a href="Clientele.aspx"></a>
              </div>
            </form>
          </div>



       </div>
</asp:Content>
