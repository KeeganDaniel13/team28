<%@ Page Title="" Language="C#" MasterPageFile="~/ClientPages/Client.Master" AutoEventWireup="true" CodeBehind="AllTransfers.aspx.cs" Inherits="CiroWebsite.ClientPages.AllTransfers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" href="../event.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
    <div class="row">
    
        <div class="col-md-12 ">

            <div class="panel panel-default ">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">Transfers</h3>
                  </div>
                  <div class="col col-xs-6 text-right">
                    <button type="button" class="btn btn-xs btn-primary btn-create">Create New</button>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <th style="resize: both;width: 200px"><em class="fa fa-cog"></em></th>
                        <th class="hidden-xs">Date</th>
                        <th>Name</th>
                        <th>Package Description</th>
                    </tr> 
                  </thead>
                  <tbody>
                          <tr>
                            <td align="left">
                              <a class="btn btn-default"><em class="fa fa-pencil"></em></a>
                              <a class="btn btn-success"><em class="fa fa-check-circle-o "></em></a>
                              <a class="btn btn-danger"><em class="fa fa-ban "></em></a>
                            </td>
                            <td class="hidden-xs">1</td>
                            <td>John Doe</td>
                            <td>johndoe@example.com</td>
                          </tr>
                        </tbody>
                </table>
            
              </div>
            </div>

</div></div></div>
</asp:Content>
