<%@ Page Title="" Language="C#" MasterPageFile="Customs/Customs.Master" AutoEventWireup="true" CodeBehind="approvetranfers.aspx.cs" Inherits="Project_Ciro.Customs.approvetranfers" %>
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
  bottom: 0%;
  left: 0%;
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
  <div class="content-wrapper" >
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1 style="margin-left:20px">
          <%fuck(); %>
          <input type="text" id="err" runat="server"/>
        Requested Transferrals <a href="#" type="submit" id="lifesucks" runat="server" onserverclick="test" class="btn btn-primary">Accept</a>  <a href="#" id="flippy" onclick="myFunction(this.id)">Update software</a>
        <small></small>
      </h1>    
      <div class="col-md-3" style=" margin-top:20px">        

          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Warehouses</h3>

              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body no-padding">
              
               <table class="table table-hover">
                <tr>
                  <th style="width: 10px">#</th>
                  <th>Warehouse</th>
                  <th>Capacity</th>
                  <th style="width: 40px">%</th>
                </tr>
                <tr>
                  <td>1.</td>
                  <td>Update software</td>
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
                  <td><span class="badge bg-light-green">30%</span></td>
                </tr>
                <tr>
                  <td>4.</td>
                  <td>Fix and squish bugs</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-danger" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">90%</span></td>
                </tr>
                      <tr>
                  <td>1.</td>
                  <td>Update software</td>
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
                  <td><span class="badge bg-light-green">30%</span></td>
                </tr>
                <tr>
                  <td>4.</td>
                  <td>Fix and squish bugs</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-danger" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">90%</span></td>
                </tr>
                    <tr>
                  <td>1.</td>
                  <td>Update software</td>
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
                <tr>
                  <td>4.</td>
                  <td>Fix and squish bugs</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-danger" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">90%</span></td>
                </tr>
                      <tr>
                  <td>1.</td>
                  <td>Update software</td>
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
                <tr>
                  <td>4.</td>
                  <td>Fix and squish bugs</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-danger" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">90%</span></td>
                </tr>
              </table> </div>
          </div>
        </div>
    </section>

    <!-- Main content -->
    <section class="content" style="margin-left:26%; margin-top:0px">
      <div class="row">
        <div class="col-xs-12" >                          
            <!-- /.box-header -->
            
             
             <div class="col-md-9" style="width:100%">
          <div class="nav-tabs-custom" style="width:100%">          
            <div class="tab-content">           
    <section class="content" style="width:100%">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-body">
                <br/>
        <div class="col-md-9" style="width:100%">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Requests</h3>
            </div>
            <div class="box-body no-padding">         
              <div class="table-responsive mailbox-messages"> <table class="table table-condensed">
                <tr>
                  <th>Origin</th>                 
                  <th>Transferral Date</th>
                  <th>Release Requested</th>
                  <th>Reason</th>
                    <th>Options</th>
                </tr>
                     <tr>                 
                  <td>John Doe</td>
                  <td>11-7-2014</td>
                  <td>yes</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                  <td> <a href="#popup" type="submit" class="btn btn-info" onclick="scrollup()">Transfer</a> 
                      <button type="submit" class="btn btn-danger" style="margin-left:60%; margin-top:-45%">Deny</button></td>
                </tr>
                <tr>                  
                  <td>Alexander Pierce</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                
                  <td>Bob Doe</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                 
                  <td>Mike Doe</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>         
                <tr>                
                  <td>John Doe</td>
                  <td>11-7-2014</td>
                  <td>yes</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                 
                  <td>Alexander Pierce</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                
                  <td>Bob Doe</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                
                  <td>Mike Doe</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                     <tr>                 
                  <td>John Doe</td>
                  <td>11-7-2014</td>
                  <td>yes</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                  <td> <a href="#popup" type="submit" class="btn btn-info" onclick="scrollup()">Transfer</a> 
                      <button type="submit" class="btn btn-danger" style="margin-left:60%; margin-top:-45%">Deny</button></td>
                </tr>
                <tr>                  
                  <td>Alexander Pierce</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                
                  <td>Bob Doe</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                 
                  <td>Mike Doe</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>         
                <tr>                
                  <td>John Doe</td>
                  <td>11-7-2014</td>
                  <td>yes</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                 
                  <td>Alexander Pierce</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                
                  <td>Bob Doe</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                
                  <td>Mike Doe</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                 
                  <td>John Doe</td>
                  <td>11-7-2014</td>
                  <td>yes</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                  <td> <a href="#popup" type="submit" class="btn btn-info" onclick="scrollup()">Transfer</a> 
                      <button type="submit" class="btn btn-danger" style="margin-left:60%; margin-top:-45%">Deny</button></td>
                </tr>
                <tr>                  
                  <td>Alexander Pierce</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                
                  <td>Bob Doe</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                 
                  <td>Mike Doe</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>         
                <tr>                
                  <td>John Doe</td>
                  <td>11-7-2014</td>
                  <td>yes</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                 
                  <td>Alexander Pierce</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                
                  <td>Bob Doe</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>                
                  <td>Mike Doe</td>
                  <td>11-7-2014</td>
                  <td>no</td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
              </table>           
              </div>
            </div>
          </div>
        </div>


                <br/>
            </div>
          </div>
        </div>
      </div>
    </section>
           </div> 
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
                <br/>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


     <div id="popup" class="overlay" >
         <div class="popup1" style="width:19.2%; height:90%; margin-left:15.6%; margin-top:6.7%">		
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Select A Warehouse</h3>

              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body no-padding">
              
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
                <tr>
                  <td>4.</td>
                  <td>Fix and squish bugs</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-danger" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">90%</span></td>
                </tr>
                      <tr>
                  <td>1.</td>
                  <td>Update software</td>
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
                <tr>
                  <td>4.</td>
                  <td>Fix and squish bugs</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-danger" style="width: 90%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">90%</span></td>
                    
                </tr>
              </table> 
                <a href="#"></a>
            </div>
          </div>


             
       
</div>

     </div><footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.5
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

 <script type="text/javascript">
     function myFunction(peter) {

    //     alert("running");
         var count = "I DEFEATED YOU!";
         $('#<%=err.ClientID%>').val(peter);
    
     }

     function scrollup() {   
         $('html,body').animate({ scrollTop: 0 }, 'fast');
         
         
     }
</script>


   

</asp:Content>
