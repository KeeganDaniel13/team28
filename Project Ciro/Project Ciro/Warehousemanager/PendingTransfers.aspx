<%@ Page Title="" Language="C#" MasterPageFile="~/Warehouse.Master" AutoEventWireup="true" CodeBehind="PendingTransfers.aspx.cs" Inherits="Project.PendingTransfers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>transfers</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                              <button class="btn btn-default" type="button">Go!</button>
                          </span>
                  </div>
                </div>
              </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="height:600px;">
                  <div class="x_title">                   
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
					<div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Outgoing Items</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false"> Incoming Items</a>
                          </li>                
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                            <!-- start recent activity -->
                           


                              <div class="table-responsive">                       
                      <table id="datatable1" class="table table-striped jambo_table bulk_action">
                          
                        <thead style="color:black; background-color:papayawhip">
                          <tr class="headings">                          
                            <th class="column-title">Item </th> 
                            <th class="column-title">To Wareshouse </th>                                                        
                            <th class="column-title">Reason </th>
                            <th class="column-title">Enroute</th>
                            <th class="column-title">Received </th>                                                                                                           
                          </tr>
                        </thead>

                        <tbody>
                      
                          <tr class="odd pointer">                           
                            <td class=" ">#1000039</td>
                            <td class=" ">Linkenpark Avenue </td>
                            <td class=" ">Storage</td>
                            <td class=" "><input type="checkbox" class="flat" /></td> 
                            <td class=" ">Yes</td>                                                          
                          </tr>      
                            <tr class="odd pointer">                            
                            <td class=" ">#567876</td>
                            <td class=" ">Sandton Park </td>
                            <td class=" ">Collection</td>
                            <td class=" "><input type="checkbox" class="flat" checked="checked"/></td>
                            <td class=" ">No</td>                                                           
                          </tr>      
                            <tr class="odd pointer">                           
                            <td class=" ">#456574565</td>
                            <td class=" ">Hollywood Hills </td>
                            <td class=" ">Storage</td>
                            <td class=" "><input type="checkbox" class="flat" checked="checked"/></td>
                            <td class=" ">No</td>                                                          
                          </tr>
                             <tr class="odd pointer">                           
                            <td class=" ">#1000039</td>
                            <td class=" ">Linkenpark Avenue </td>
                            <td class=" ">Storage</td>
                            <td class=" "><input type="checkbox" class="flat" /></td> 
                            <td class=" ">Yes</td>                                                          
                          </tr>      
                            <tr class="odd pointer">                            
                            <td class=" ">#567876</td>
                            <td class=" ">Sandton Park </td>
                            <td class=" ">Collection</td>
                            <td class=" "><input type="checkbox" class="flat" checked="checked"/></td>
                            <td class=" ">No</td>                                                           
                          </tr>      
                            <tr class="odd pointer">                           
                            <td class=" ">#456574565</td>
                            <td class=" ">Hollywood Hills </td>
                            <td class=" ">Storage</td>
                            <td class=" "><input type="checkbox" class="flat" checked="checked"/></td>
                            <td class=" ">No</td>                                                          
                          </tr>                                                                                     
                        </tbody>
                      </table>
                    </div>                    





                            <!-- end recent activity -->

                          </div>
                          <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">

                            <!-- start user projects -->
                           


                               <div class="table-responsive" style="width:100%">                       
                      <table id="datatable" class="table table-striped jambo_table bulk_action" style="width:100%">
                          
                        <thead style="color:black; background-color:papayawhip">
                          <tr class="headings">                           
                            <th class="column-title">Item </th> 
                            <th class="column-title">From Wareshouse </th>                                                        
                            <th class="column-title">Reason </th>
                            <th class="column-title">Enroute</th>
                            <th class="column-title">Received </th>                                                                                                           
                          </tr>
                        </thead>

                        <tbody>
                      
                          <tr class="odd pointer">                            
                            <td class=" ">#1000039</td>
                            <td class=" ">Linkenpark Avenue </td>
                            <td class=" ">Storage</td>
                            <td class=" ">Yes</td>
                            <td class=" "><input type="checkbox" class="flat" checked="checked"/></td>                               
                          </tr>      
                            <tr class="odd pointer">                            
                            <td class=" ">#567876</td>
                            <td class=" ">Willow Crest </td>
                            <td class=" ">Collection</td>
                            <td class=" ">Yes</td>
                            <td class=" "><input type="checkbox" class="flat"/></td>                               
                          </tr>      
                            <tr class="odd pointer">                            
                            <td class=" ">#456574565</td>
                            <td class=" ">Dullaware Peak </td>
                            <td class=" ">Storage</td>
                            <td class=" ">No</td>
                            <td class=" "><input type="checkbox" class="flat" checked="checked"/></td>                               
                          </tr>
                              <tr class="odd pointer">                            
                            <td class=" ">#1000039</td>
                            <td class=" ">Linkenpark Avenue </td>
                            <td class=" ">Storage</td>
                            <td class=" ">Yes</td>
                            <td class=" "><input type="checkbox" class="flat" checked="checked"/></td>                               
                          </tr>      
                            <tr class="odd pointer">                            
                            <td class=" ">#567876</td>
                            <td class=" ">Willow Crest </td>
                            <td class=" ">Collection</td>
                            <td class=" ">Yes</td>
                            <td class=" "><input type="checkbox" class="flat"/></td>                               
                          </tr>      
                            <tr class="odd pointer">                            
                            <td class=" ">#456574565</td>
                            <td class=" ">Dullaware Peak </td>
                            <td class=" ">Storage</td>
                            <td class=" ">No</td>
                            <td class=" "><input type="checkbox" class="flat" checked="checked"/></td>                               
                          </tr>                
                              <tr class="odd pointer">                            
                            <td class=" ">#1000039</td>
                            <td class=" ">Linkenpark Avenue </td>
                            <td class=" ">Storage</td>
                            <td class=" ">Yes</td>
                            <td class=" "><input type="checkbox" class="flat" checked="checked"/></td>                               
                          </tr>      
                            <tr class="odd pointer">                            
                            <td class=" ">#567876</td>
                            <td class=" ">Willow Crest </td>
                            <td class=" ">Collection</td>
                            <td class=" ">Yes</td>
                            <td class=" "><input type="checkbox" class="flat"/></td>                               
                          </tr>      
                            <tr class="odd pointer">                            
                            <td class=" ">#456574565</td>
                            <td class=" ">Dullaware Peak </td>
                            <td class=" ">Storage</td>
                            <td class=" ">No</td>
                            <td class=" "><input type="checkbox" class="flat" checked="checked"/></td>                               
                          </tr>                
                              <tr class="odd pointer">                            
                            <td class=" ">#1000039</td>
                            <td class=" ">Linkenpark Avenue </td>
                            <td class=" ">Storage</td>
                            <td class=" ">Yes</td>
                            <td class=" "><input type="checkbox" class="flat" checked="checked"/></td>                               
                          </tr>      
                            <tr class="odd pointer">                            
                            <td class=" ">#567876</td>
                            <td class=" ">Willow Crest </td>
                            <td class=" ">Collection</td>
                            <td class=" ">Yes</td>
                            <td class=" "><input type="checkbox" class="flat"/></td>                               
                          </tr>      
                            <tr class="odd pointer">                            
                            <td class=" ">#456574565</td>
                            <td class=" ">Dullaware Peak </td>
                            <td class=" ">Storage</td>
                            <td class=" ">No</td>
                            <td class=" "><input type="checkbox" class="flat" checked="checked"/></td>                               
                          </tr>                                        
                        </tbody>
                      </table>
                    </div>                                          
        </div>             
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
              </asp:Content>