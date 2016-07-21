<%@ Page Title="" Language="C#" MasterPageFile="~/Warehouse.Master" AutoEventWireup="true" CodeBehind="TransferHistory.aspx.cs" Inherits="Project.TransferHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">





      <div class="col-md-12 col-sm-12 col-xs-12">
     <!-- page content -->
        <div class="right_col" role="main">

          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3 style="color:black">
                     Transfer History <small style="color:black">#321058 </small>
                  </h3>
                  
                    
                 
              </div>

   
            </div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                   <!-- <h2>Form validation <small>sub title</small></h2> -->
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                   
                     

                                    <div class="title_left">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for..." style="width:30%;margin-left:70%"/>
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>







                         <div class="clearfix"></div>
                <div class="x_panel">
                  <div class="x_title">
                   <!-- <h2>Table design <small>Custom design</small></h2>-->
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>

                  <div class="x_content">                   

                    <div class="table-responsive">
                        <h4 style="color:black">
                      Transfer 3
                  </h4>
                      <table class="table table-striped jambo_table bulk_action">
                          
                        <thead style="color:black; background-color:papayawhip">
                          <tr class="headings">
                            <th>
                              <input type="checkbox" id="check-all" class="flat"/>
                            </th>
                            <th class="column-title">Current Location </th>
                              <th class="column-title">Storage Duration  </th>
                            <th class="column-title">Transfer Location</th>
                            <th class="column-title">Transfer Date </th>
                            <th class="column-title">Total Storage Duration </th>
                            <th class="column-title">Transfer Accepted</th>
                            <th class="column-title">Priority </th>                                                                                                            
                          </tr>
                        </thead>

                        <tbody>
                      
                          <tr class="odd pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records"/>
                            </td>
                            <td class=" ">121000039</td>
                            <td class=" ">35 Days </td>
                            <td class=" ">May 26, 2014 11:30:12 PM</td>
                            <td class=" ">121000208 <i class="error fa fa-long-arrow-down"></i></td>
                            <td class=" ">John Blank L</td>
                            <td class=" ">Paid</td>
                            <td class="a-right a-right ">$741.20</td>    
                          </tr>                        
                        </tbody>
                      </table>
                    </div>
                     





                        <div class="x_content">                   

                    <div class="table-responsive">
                        <h4 style="color:black">
                      Transfer 2
                  </h4>
                      <table class="table table-striped jambo_table bulk_action">
                          
                        <thead style="color:black; background-color:papayawhip">
                          <tr class="headings">
                            <th>
                              <input type="checkbox" id="check-all" class="flat"/>
                            </th>
                            <th class="column-title">Current Location </th>
                            <th class="column-title">Storage Duration </th>
                            <th class="column-title">Transfer Location</th>
                            <th class="column-title">Transfer Date </th>
                             <th class="column-title">Total Storage Duration </th>
                            <th class="column-title">Transfer Accepted</th>
                            <th class="column-title">Priority </th>                                                                                                            
                          </tr>
                        </thead>

                        <tbody>
                      
                          <tr class="odd pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records"/>
                            </td>
                            <td class=" ">121000039</td>
                            <td class=" ">35 Days </td>
                            <td class=" ">May 26, 2014 11:30:12 PM</td>
                            <td class=" ">121000208 <i class="error fa fa-long-arrow-down"></i></td>
                            <td class=" ">John Blank L</td>
                            <td class=" ">Paid</td>
                            <td class="a-right a-right ">$741.20</td>    
                          </tr>                        
                        </tbody>
                      </table>
                    </div>

                      
                       


                             <div class="x_content">                   

                    <div class="table-responsive">
                        <h4 style="color:black">
                      Transfer 1
                  </h4>
                      <table class="table table-striped jambo_table bulk_action">
                          
                        <thead style="color:black; background-color:papayawhip">
                          <tr class="headings">
                            <th>
                              <input type="checkbox" id="check-all" class="flat"/>
                            </th>
                            <th class="column-title">Current Location </th>
                             <th class="column-title">Storage Duration  </th>
                            <th class="column-title">Transfer Location</th>
                            <th class="column-title">Transfer Date </th>
                            <th class="column-title">Total Storage Duration </th>
                            <th class="column-title">Transfer Accepted</th>
                            <th class="column-title">Priority </th>                                                                                                            
                          </tr>
                        </thead>

                        <tbody>
                      
                          <tr class="odd pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records"/>
                            </td>
                            <td class=" ">121000039</td>
                            <td class=" ">35 Days </td>
                            <td class=" ">May 26, 2014 11:30:12 PM</td>
                            <td class=" ">121000208 <i class="error fa fa-long-arrow-down"></i></td>
                            <td class=" ">John Blank L</td>
                            <td class=" ">Paid</td>
                            <td class="a-right a-right ">$741.20</td>    
                          </tr>                        
                        </tbody>
                      </table>
                    </div>
<div>                                   
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
                    <footer>
          <div class="pull-right" style="margin-top:20%">
          <p style="text-align:center">This is a Pro Lazarus Production</p>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
          </div>     
        </div>
    
        <!-- /page content -->











</asp:Content>
