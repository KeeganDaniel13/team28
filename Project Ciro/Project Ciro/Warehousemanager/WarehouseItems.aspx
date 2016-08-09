<%@ Page Title="" Language="C#" MasterPageFile="WarehouseManager.Master" AutoEventWireup="true" CodeBehind="WarehouseItems.aspx.cs" Inherits="Project_Ciro.WarehouseItems" %>
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
        Warehouse Items
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
                  <th>Package</th>
                  <th>Last Checked</th>
                  <th>Platform(s)</th>
                  <th>Engine version</th>
                  <th>CSS grade</th>
                  <th></th>
                </tr>
                </thead>
                 <tbody>               
                <tr>
                  <td><div contenteditable>Presto</div></td>
                  <td><div contenteditable>Presto</div></td>
                    <td><div contenteditable>Presto</div></td>
                    <td><div contenteditable>Presto</div></td>
                    <td><div contenteditable>Presto</div></td>
                    <td>                                                                            
                         <a href="#popup1" class="btn btn-social-icon btn-dropbox"><span title="Save Editting"><i class="fa fa-save"></i></span></a>                    
                    </td>
                </tr>
                     </tbody>
                  <tfoot>
                <tr>
                  <th>Rendering engine</th>
                  <th>Browser</th>
                  <th>Platform(s)</th>
                  <th>Engine version</th>
                  <th>CSS grade</th>
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


  <div id="popup1" class="overlay">
	<div class="popup">
		<h4 style="margin-left:35%">Transfer Details</h4>
        <hr />
		<a class="close" href="#">&times;</a>
		<div class="content">
			 <div class="modal-footer">
                 <!-- Date -->
              <div class="form-group">
                <label style="margin-right:60%">Transferral Before:</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control pull-right" id="datepicker">
                </div>
                  <div class="form-group">
                      <br />
                  <label style="margin-right:57%">Reason For Transfer :</label>
                  <textarea class="form-control" rows="3" placeholder="Place Reason Here..."></textarea>
                </div>               
              </div>
                 <br />
                 <button type="button" class="btn btn-block btn-info" style="width:100%">Send Request</button>
                 <a href="#" type="button" class="btn btn-block btn-danger" style="width:100%">Cancel</a>
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
