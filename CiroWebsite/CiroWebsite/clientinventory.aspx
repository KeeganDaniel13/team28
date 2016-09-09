<%@ Page Title="Depositor | Inventory" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="clientinventory.aspx.cs" Inherits="CiroWebsite.clientinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Warehoused Inventory</h2>
<table id="default-datatable" data-plugin="DataTable" class="table table-striped" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th>Package Name</th>
			<th>Package Location</th>
			<th>Unit</th>
			<th>Arrival Date</th>
			<th>ERD</th>     
			<th>Status</th>
            <th>Action</th>
		</tr>
	</thead>
								
	<tbody id="list" runat="server">
									
	</tbody>
</table>
</asp:Content>
