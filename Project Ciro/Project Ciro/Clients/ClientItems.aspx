<%@ Page Title="" Language="C#" MasterPageFile="client.Master" AutoEventWireup="true" CodeBehind="ClientItems.aspx.cs" Inherits="Project_Ciro.Clients.ClientItems" %>
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
  padding: 50px;
  background: #fff;
  border-radius: 5px;
  width: 20%;
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
       Your Items
        <small></small>
      </h1>
        <br/>
      <ol class="breadcrumb">
        <li><a href="Home.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><a href="#">Tables</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content"style="width:90%">
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
                  <th>Product</th>
                  <th>Price</th>
                  <th>Quantity</th>
                  <th>Size</th>
                  <th>Location</th>
                  <th>Arrival</th>
                    <th></th>
                </tr>
                </thead>
                 <tbody>               
          <%ListClientItems();%>
                     </tbody>
                  <tfoot>
                <tr>
                  <th>Product</th>
                  <th>Price</th>
                  <th>Quantity</th>
                  <th>Size</th>
                  <th>Location</th>
                  <th>Arrival</th>
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



      <div id="popup1" class="overlay" >
         <div class="popup1" style="width:30%; margin-left:40%; margin-top:5%">		
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Select A Warehouse</h3>

              <div class="box-tools">
                <a href="#" type="button" class="btn btn-box-tool" ><i class="fa fa-close"></i>
                </a>
              </div>
            </div>
            <div class="box-body no-padding" style=" margin-left:2%;margin-right:2%">
              
               <table class="table table-hover">
                <tr>
                  <th style="width: 10px">#</th>
                  <th>Warehouse</th>
                  <th>Capacity</th>
                  <th style="width: 40px">%</th>
                </tr>
                <tr>
                  <td>1.</td>
                  <td><a href="#" id="flippy" onclick="myFunction(this.id)">Update software</a></td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-success" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-green">55%</span></td>
                </tr>
                <tr>
                  <td>2.</td>
                  <td><a href="#" id="dickpick" onclick="myFunction(this.id)">Clean database</a></td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-yellow">70%</span></td>
                </tr>
                <tr>
                  <td>3.</td>
                  <td><a href="#" id="flippy" onclick="myFunction(this.id)">Cron job running</a></td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 30%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-light-green">30%</span></td>
                </tr>
                <tr>
                  <td>4.</td>
                  <td><a href="#" id="flippy" onclick="myFunction(this.id)">Fix and squish bugs</a></td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-danger" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">90%</span></td>
                </tr>
                      <tr>
                  <td>1.</td>
                  <td><a href="#" id="flippy" onclick="myFunction(this.id)">Update software</a></td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-success" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-green">55%</span></td>
                </tr>
                <tr>
                  <td>2.</td>
                  <td><a href="#" id="flippy" onclick="myFunction(this.id)">Clean database</a></td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-yellow">70%</span></td>
                </tr>
                <tr>
                  <td>3.</td>
                  <td><a href="#" id="flippy" onclick="myFunction(this.id)">Cron job running</a></td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 30%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-light-green">30%</span></td>
                </tr>
                <tr>
                  <td>4.</td>
                  <td><a href="#" id="flippy" onclick="myFunction(this.id)">Fix and squish bugs</a></td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-danger" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">90%</span></td>
                </tr>
                    <tr>
                  <td>1.</td>
                  <td><a href="#" id="flippy" onclick="myFunction(this.id)">Update software</a></td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-success" style="width: 55%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-green">55%</span></td>
                </tr>
                <tr>
                  <td>2.</td>
                  <td>Clean database</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-yellow">70%</span></td>
                </tr>
                <tr>
                  <td>3.</td>
                  <td>Cron job running</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 30%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-green">30%</span></td>
                </tr>               
              </table> 
                <a href="#"></a>
            </div>
          </div>
       
</div>

     </div>

    
    
      <div id="ownership" class="overlay" >
         <div class="popup1" style="width:30%; margin-left:40%; margin-top:5%">		
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Change Of Ownership</h3>                
              <div class="box-tools">
                <a href="#" type="button" class="btn btn-box-tool" ><i class="fa fa-close"></i>
                </a>
              </div>
            </div>
              <br/>
            <div class="box-body no-padding" style="margin-left:2%;margin-right:2%">
             <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" class="form-control" id="Email" placeholder="Enter email">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Name</label>
                  <input type="email" class="form-control" id="Name" placeholder="Enter Name">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Surname</label>
                  <input type="email" class="form-control" id="Surname" placeholder="Enter Surname">
                </div>
                <a href="#" type="submit" class="btn btn-primary">Accept</a>  
                <br/>              
            </div>
              <br />
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

  });
</script>
</asp:Content>