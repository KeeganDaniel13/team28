<%@ Page Title="" Language="C#" MasterPageFile="~/warehouse.Master" AutoEventWireup="true" CodeBehind="warehouserelease.aspx.cs" Inherits="CiroWebsite.warehouserelease" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="panel">
                  <header class="panel-heading">
                      Release 
                  </header>
                  <div class="panel-body">
                      <div class="row">
                          <div class="col-md-4">
                              <div class="input-group"><input type="text" placeholder="Search Here" class="input-sm form-control"> <span class="input-group-btn">
                              <button type="button" class="btn btn-sm btn-success"> Go!</button> </span></div>
                          </div>
                      </div>
                  </div>
                  <table class="table table-hover p-table">
                      <thead>
                      <tr>
                          <th>Release #</th>
                          <th>Owner</th>
                          <th>Status</th>
                          <th>Invoiced</th>
						  <th>Paid</th>
                          <th>Total</th>
                          <th>Created</th>
                          <th>Action</th>

                      </tr>
                      </thead>

                      <tbody runat="server" id="releaseTable">
                     
                      </tbody>
                  </table>
              </section>
</asp:Content>
