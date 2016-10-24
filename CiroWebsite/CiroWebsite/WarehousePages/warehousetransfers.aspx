<%@ Page Title="" Language="C#" MasterPageFile="warehouse.Master" AutoEventWireup="true" CodeBehind="warehousetransfers.aspx.cs" Inherits="CiroWebsite.warehousetransfers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="panel">
                  <header class="panel-heading">
                      Transfers 
                  </header>
                  <table class="table table-hover p-table">
                      <thead>
                      <tr>
                          <th>Transfer #</th>
                          <th>Product Name</th>
                          <th>Transfer From</th>
                          <th>Transfer To</th>
                          <th>Date Issued</th>
                      </tr>
                      </thead>
                      <tbody runat="server" id="transferTable">
                      </tbody>
                  </table>
              </section>
</asp:Content>
