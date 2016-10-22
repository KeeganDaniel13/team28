<%@ Page Title="" Language="C#" MasterPageFile="Customs.Master" AutoEventWireup="true" CodeBehind="warehouseoverview.aspx.cs" Inherits="CiroWebsite.warehouseoverview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
.table
{
    border: 1px solid #ccc;
    border-collapse: collapse;
    width: 200px;
    margin: 10px;
  
}
.table th
{
    background-color: #F7F7F7;
    color: #333;
    font-weight: bold;

}
.table th, .table td
{
    padding: 5px;
    border: 1px solid #ccc;
}

	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contain" style="margin-bottom:200px;">

        <div class="datacentral">
          <div class="container" >
            <form role="form">
	        <table >
                    <%listWarehouses(); %>    
             </table>		
             
	        </div>
            </form>

       
   </div>
        </div>
</asp:Content>
