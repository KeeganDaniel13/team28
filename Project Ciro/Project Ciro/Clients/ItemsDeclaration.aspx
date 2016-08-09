<%@ Page Title="" Language="C#" MasterPageFile="~/Clients/Client.Master" AutoEventWireup="true" CodeBehind="ItemsDeclaration.aspx.cs" Inherits="Project_Ciro.Clients.testet" %>
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
        Item Declaration 
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Declare Items</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">    
      <div class="row">
        <div class="col-md-6">

          <div class="box box-danger">
            <div class="box-header">
              <h3 class="box-title">Declaration Information</h3>
            </div>
            <div class="box-body">
  <div class="form-group">
                <div class="form-group">
                  <label for="exampleInputEmail1">Name</label>
                  <input type="text" class="form-control" runat="server" id="txtname" placeholder="Enter Name">
                </div>
                   <div class="form-group">
                  <label for="exampleInputEmail1">Value Name</label>
                  <input type="text" class="form-control" runat="server" id="txtvalue" placeholder="Enter Value">
                </div>
             <div class="form-group">
                 <label for="exampleInputEmail1">Transfer Location</label>
               <a href="#popup1"><input type="text" class="form-control" onclick="popup1" runat="server" id="wareto"/></a>
                 <input type="text" runat="server" id="wareID" hidden/>
              </div>                            
                <div class="checkbox">
                  <label>
                    <input type="checkbox"> I Read & Agree With The <a href="#popup1">Terms & Conditions</a>
                  </label>
                </div>   
        <div class="box-footer">
                <button runat="server" onserverclick="save" type="button" class="btn btn-primary">Save</button>
              </div>  
              </div>
              <!-- /.form group -->

            </div>
            <!-- /.box-body -->
          </div>
        </div>
        <!-- /.col (left) -->
        <div class="col-md-6">
          <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">Saved Items</h3>
            </div>
            <div class="box-body">
             
                                  
      <div class="col-md-3" style="width:100%">        

          <div class="box box-solid">
            <div class="box-header with-border">

              <div class="box-tools" style="margin-top:-10%">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div  class="box-body no-padding">
              
               <table class="table table-hover">
                <tr>
                  <th style="width: 10px">#</th>
                  <th>Name</th>
                  <th>Value</th>                
                  <th>Transfer Location</th>
                </tr>
                   <tbody id="savedcontent">
                        <%saveditems(); %>
                   </tbody>
                  
              </table> 
                
            </div>
              <div class="box-footer">
                <button runat="server" onserverclick="declare" type="button" class="btn btn-primary">Declare</button>
              </div>  
          </div>
        </div>
    
               
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

    
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
                   <th>Location</th>
                  <th>Capacity</th>
                  <th style="width: 40px">%</th>
                </tr>  
                   <%ListWarehouses(); %>   
              </table>                                
                <br/>
                <a href="#" type="button" class="btn btn-primary">Accept</a>                
                <br/>
            </div>
              <br />
          </div>
       
</div>

     </div>

  <!-- /.content-wrapper -->

    <script type="text/javascript">
        function warehouseSelection(warehouseID, warehouseName) {            
            $('#<%=wareto.ClientID%>').val(warehouseName);
            $('#<%=wareID.ClientID%>').val(warehouseID);
     }

     function scrollup() {   
         $('html,body').animate({ scrollTop: 0 }, 'fast');
         
         
     }
</script>
</asp:Content>
