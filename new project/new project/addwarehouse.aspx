<%@ Page Title="" Language="C#" MasterPageFile="~/manager.Master" AutoEventWireup="true" CodeBehind="addwarehouse.aspx.cs" Inherits="new_project.addwarehouse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <div class="container body">
      <div class="main_container">
          <!-- page content -->
        
        <div class="right_col" role="main">
                <div class="col-md-4 left-margin">
                    <br/>
                  <form class="form-horizontal form-label-left">
                    <div class="form-group">
                      <label>Warehouse Name</label>
                      <input type="email" class="form-control" placeholder="Name of Warehouse">
                    </div>
                    <div class="form-group">
                      <label>Warehouse Description</label>
                      <textarea id="message"  class="form-control" name="message" data-parsley-trigger="keyup"
                           data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-validation-threshold="10"></textarea>
                 
                    <div class="form-group">
                         <label for="heard">Warehouse Location</label>
                          <select id="heard" class="form-control" required="">
                            <option value="">Johannesburg</option>
                            <option value="press">Pretoria</option>
                            <option value="net">Lanseria</option>
                            <option value="mouth">Rand Airport</option>
                          </select>
                    </div>
                    <div class="form-group">
                        <label>Warehouse Type</label>
                        <select id="type" class="form-control" required="">
                        <option value="">Choose a type...</option>
                        <option value="press">Type A</option>
                        <option value="net">Type B</option>
                        <option value="mouth">Type C</option>
                        </select>
                       </div>
                       
                          <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6" style="float:left;">
                          <button type="submit" class="btn btn-success" data-toggle="modal" data-target=".bs-example-modal-lg">Add Warehouse</button>
                            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                              <div class="modal-content">

                                <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                  </button>
                                  <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                </div>
                                <div class="modal-body">
                                  <h4>Text in a modal</h4>
                                  <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                  <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                  <button type="button" class="btn btn-primary">Confirm warehouse</button>
                                </div>

                              </div>
                            </div>
                             </div>
                        </div>
                      </div>
                    
                  </form>
                </div>
                </div>
          </div>
            </div>
    </asp:Content>
