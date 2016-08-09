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
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                </div>
                <div class="form-group">
                  <label>Name</label>
                  <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter..">
                </div>      
                  <div class="form-group">
                  <label>Surname</label>
                  <input type="text" class="form-control" id="a1" placeholder="Enter ...">
                </div>       
                   <div class="form-group">
                  <label>Attribute D</label>
                  <input type="text" class="form-control" id="a6" placeholder="Enter ...">
                </div>        
                   <div class="form-group">
                  <label>Attribute E</label>
                  <input type="text" class="form-control" id="a2" placeholder="Enter ...">
                </div>                         
                  <label>Type Of Attribute F</label>
                 <div class="form-group">                
                  <select class="form-control">
                    <option>Select An ... type</option>
                    <option>option 2</option>
                    <option>option 3</option>
                    <option>option 4</option>
                    <option>option 5</option>
                  </select>               
                </div>          
                <div class="box-footer">
                <button type="submit" class="btn btn-primary">Add</button>
                <a href="Clientele.aspx"></a>
              </div>
            </form>
          </div>



       </div>
</asp:Content>
