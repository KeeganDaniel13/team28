<%@ Page Title="" Language="C#" MasterPageFile="~/Clients/Client.Master" AutoEventWireup="true" CodeBehind="ViewItemLog.aspx.cs" Inherits="Project_Ciro.Clients.ViewItemLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
       <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Product Log
        <small>#7261539</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">UI</a></li>
        <li class="active">Timeline</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- row -->
      <div class="row">
        <div class="col-md-12">
          <!-- The time line -->
          <ul class="timeline">              
               <li class="time-label">
                  <span class="bg-purple">
                    10 April. 2014
                  </span>
            </li>
            <!-- /.timeline-label -->
            <!-- timeline item -->
            <li>
              <i class="fa fa-box bg-red"></i>

              <div class="timeline-item">
                <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                <h3 class="timeline-header"><a href="#">Receival @ </a> 22 Baker Street Warehouse</h3>

                <div class="timeline-body">
                  Owner has requested transferral for pick up
                </div>
             <!--   <div class="timeline-footer">
                  <a class="btn btn-primary btn-xs">Read more</a>
                  <a class="btn btn-danger btn-xs">Delete</a>
                </div> -->
              </div>
            </li>
            <!-- END timeline item --> 
            <!-- timeline time label -->
            <li class="time-label">
                  <span class="bg-grey">
                    10 Feb. 2014
                  </span>
            </li>
            <!-- /.timeline-label -->
            <!-- timeline item -->
            <li>
              <i class="fa fa-box bg-blue"></i>

              <div class="timeline-item">
                <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                <h3 class="timeline-header"><a href="#">Transferral From </a>23 Jump Street Warehouse</h3>

                <div class="timeline-body">
                  Owner has requested transferral for pick up
                </div>
             <!--   <div class="timeline-footer">
                  <a class="btn btn-primary btn-xs">Read more</a>
                  <a class="btn btn-danger btn-xs">Delete</a>
                </div> -->
              </div>
            </li>
            <!-- END timeline item --> 
               <!-- timeline time label -->
            <li class="time-label">
                  <span class="bg-grey">
                    07 Jan. 2014
                  </span>
            </li>
            <!-- /.timeline-label -->
            <!-- timeline item -->
            <li>
              <i class="fa fa-box bg-red"></i>

              <div class="timeline-item">
                <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                <h3 class="timeline-header"><a href="#">Recieval @ </a> 23 Jump Street Warehouse</h3>

                <div class="timeline-body">
                 Warehouse storage capacity has reached its limit
                </div>
             <!--   <div class="timeline-footer">
                  <a class="btn btn-primary btn-xs">Read more</a>
                  <a class="btn btn-danger btn-xs">Delete</a>
                </div> -->
              </div>
            </li>
            <!-- END timeline item -->                  
               <!-- timeline time label -->
            <li class="time-label">
                  <span class="bg-grey">
                    12 Nov. 2013
                  </span>
            </li>
            <!-- /.timeline-label -->
            <!-- timeline item -->
            <li>
              <i class="fa fa-box bg-blue"></i>

              <div class="timeline-item">
                <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                <h3 class="timeline-header"><a href="#">Transferral From</a> Beacon Isle Warehouse</h3>

                <div class="timeline-body">                  
                  Package Pit Stop                   
                </div>
                
              </div>
            </li>
            <!-- END timeline item -->                                                   
            <li class="time-label">
                  <span class="bg-green">
                    24 Jan. 2012
                  </span>
            </li>
          </ul>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
</asp:Content>
