<%@ Page Title="" Language="C#" MasterPageFile="warehouse.Master" AutoEventWireup="true" CodeBehind="warehouserelease.aspx.cs" Inherits="CiroWebsite.warehouserelease" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="panel">
                  <header class="panel-heading">
                      Release 
                  </header>
                  <table class="table table-hover p-table">
                      <thead>
                      <tr>
                          <th>Release #</th>
                          <th>Product Name</th>
                          <th>Owner</th>
                          <th>Status</th>
                          <th>Invoiced</th>
						  <th>Paid</th>
                          <th>Total Tax</th>
                          <th>Created</th>

                      </tr>
                      </thead>
                      <tbody runat="server" id="releaseTable">
                      </tbody>
                  </table>
              </section>
</asp:Content>
