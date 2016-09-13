<%@ Page Title="" Language="C#" MasterPageFile="~/Customs.Master" AutoEventWireup="true" CodeBehind="release.aspx.cs" Inherits="CiroWebsite.release" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style>
   .floated {
  float:right;
  margin-right:10px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div align="center"><h3>Respond To Your Release Request's</h3></div>
    <br />
    <section class="app-content">
        <div class="row" id="releases" runat="server">
               
            </div>
        </section>
</asp:Content>
