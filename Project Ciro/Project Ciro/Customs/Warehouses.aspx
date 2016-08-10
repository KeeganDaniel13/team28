<%@ Page Title="" Language="C#" MasterPageFile="Customs.Master" AutoEventWireup="true" CodeBehind="Warehouses.aspx.cs" Inherits="Project_Ciro.Customs.warehouseoverview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>




      
.m span{display: none;list-style: none} .m {z-index:24;position:relative;display:inline-block}
.m:hover span{z-index:999;display:block;position:absolute;top:19px;left:1em;border:1px solid #000;background-color:#eee;color:#000;min-width:300px}


.button:hover {
  background: #06D85F;
}

.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 70px auto;
  padding: 5px;
  background: #fff;
  border-radius: 5px;
  width: 30%;
  position: relative;
  transition: all 5s ease-in-out;
  margin-top:12%;
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
  color: #06D85F;
}
.popup .content {
  max-height: 30%;
  overflow: auto;
}

@media screen and (max-width: 700px){
  .box{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
}

hr.style-one {
    border: 0;
    height: 1px;
    background: #333;
    background-image: linear-gradient(to right, #ccc, #333, #ccc);
}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Warehouses Overview
        <small></small>
      </h1>
        <br/>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Data tables</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">          
          <!-- /.box -->
          <div class="box">           
            <!-- /.box-header -->
            <div class="box-body">
                <br/>
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Name</th>
                  <th>User Number</th>
                  <th>Location</th>
                  <th>Size</th>
                  <th>Availability</th>
                    <th>Actions</th>
                </tr>
                </thead>
                 <tbody>  
                     <%getWarehouses(); %>
                     </tbody>
                  <tfoot>
                <tr>
                  <th>Name</th>
                  <th>User Number</th>
                  <th>Location</th>
                  <th>Size</th>
                  <th>Availability</th>
                    <th>Actions</th>
                </tr>
                </tfoot>
              </table>
                <br/>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
    
  <div id="popup2" class="overlay">
	<div class="popup" style="width:70%; height:20%">		
		<a class="close" href="#">&times;</a>
		<div class="content">
			 <div class="modal-footer">
                 <table id="nada" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Rendering engine</th>
                  <th>Browser</th>
                  <th>Platform(s)</th>
                  <th>Engine version</th>
                  <th>CSS grade</th>             
                </tr>
                </thead>
                <tbody>               
                <tr>
                    <td><input type="text" style="border:none;margin-left:0px" value="Sam L. Jacksn ?"/></td>            
                    <td>Watched Any Moive Ever ?</td>
                    <td>He's the black guy</td>
                    <td>Twnety One pilots</td>
                    <td>Are The Bomb</td>           
                    </tr>  
                    </tbody>
                     </table>                       
                 <button type="button" class="btn btn-block btn-info" style="width:10%">Change Details</button>
                 <a href="#" type="button" class="btn btn-block btn-danger" style="width:10%; margin-left:12%; margin-top:-3.2%">Cancel</a>
              </div>
		</div>
	</div>
</div>


  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.5
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

    <script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });


      //Date picker
    $('#datepicker').datepicker({
        autoclose: true
    });
  });
</script>
</asp:Content>
