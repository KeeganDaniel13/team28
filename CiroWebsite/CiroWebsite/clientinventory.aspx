<%@ Page Title="Depositor | Inventory" Language="C#" MasterPageFile="~/ciro.Master" AutoEventWireup="true" CodeBehind="clientinventory.aspx.cs" Inherits="CiroWebsite.clientinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
        .rss-feed {
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;
padding: 0.5em;
background-color: #0000d8;
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
font-family: 'Lato', sans-serif;
}

.live-search-box {
width: 20%;
display: block;
padding: 0.5em;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;
border: 1px solid #3498db;
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 4px;
}

.rss-feed ul {
list-style: none;
padding: 0;
margin: 1em 0 0.5em;
}

.rss-feed a {
text-decoration: none;
color: #fff;
}
.ckbox {
	position: relative;
}
.ckbox input[type="checkbox"] {
	opacity: 0;
}
.ckbox label {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
.ckbox label:before {
	content: '';
	top: 1px;
	left: 0;
	width: 18px;
	height: 18px;
	display: block;
	position: absolute;
	border-radius: 2px;
	border: 1px solid #bbb;
	background-color: #fff;
}
.ckbox input[type="checkbox"]:checked + label:before {
	border-color: #2BBCDE;
	background-color: #2BBCDE;
}
.ckbox input[type="checkbox"]:checked + label:after {
	top: 3px;
	left: 3.5px;
	content: '\e013';
	color: #fff;
	font-size: 11px;
	font-family: 'Glyphicons Halflings';
	position: absolute;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Warehoused Inventory</h2>
    <div class="rss-feed form-inline" >
    <input type="text" class="live-search-box" placeholder="Search.." />
       
</div>
<table id="default-datatable" data-plugin="DataTable" class="table table-striped" cellspacing="0" width="100%">
	<thead>
		<tr>
            <div class="ckbox">
				<input type="checkbox" id="checkbox1">
				<label for="checkbox1"></label>
			</div>
			<th>Package Name</th>
			<th>Package Location</th>
			<th>Unit</th>
			<th>Arrival Date</th>
			<th>ERD</th>
           
			<th>Status</th>
            <th>Action</th>
		</tr>
	</thead>
								
	<tbody>
		<tr>
			<td>Playstation 4</td>
			<td>Maseru Ridge</td>
			<td>Package(10 oct)</td>
			<td>011/04/25</td>
			<td>2011/04/25</td>
			<td><span class="badge badge-success">Transfered</span></td>
            <td >
                <button type="button" class="btn btn-outline mw-md rounded btn-info btn-xs mybtn">View Package</button>
                <button type="button" class="btn btn-outline mw-md rounded btn-info btn-xs">Request</button>
            </td>
		</tr>
		<tr>
			<td>Playstation 4</td>
			<td>Maseru Ridge</td>
			<td>Package(10 oct)</td>
			<td>011/04/25</td>
			<td>2011/04/25</td>
			<td><span class="badge badge-danger">Damaged</span></td>
            <td >
                <button width="30" type="button" class="btn btn-outline mw-md rounded btn-info btn-xs">View Package</button>
                <button width="30" type="button" class="btn btn-outline mw-md rounded btn-info btn-xs">Request</button>
            </td>
		</tr>
		<tr>
			<td>Playstation 4</td>
			<td>Maseru Ridge</td>
			<td>Package(10 oct)</td>
			<td>011/04/25</td>
			<td>2011/04/25</td>
			<td><span class="badge badge-warning">Requested</span></td>
            <td >
               <button width="30" type="button" class="btn btn-outline mw-md rounded btn-info btn-xs">View Package</button>
                <button width="30" type="button" class="btn btn-outline mw-md rounded btn-info btn-xs">Request</button>
            </td>
		</tr>
		<tr>
			<td>Playstation 4</td>
			<td>Maseru Ridge</td>
			<td>Package(10 oct)</td>
			<td>011/04/25</td>
			<td>2011/04/25</td>
			<td><span class="badge badge-success">Warehoused</span></td>
            <td >
                <button width="30" type="button" class="btn btn-outline mw-md rounded btn-info btn-xs">View Package</button>
                <button width="30" type="button" class="btn btn-outline mw-md rounded btn-info btn-xs">Request</button>
            </td>
		</tr>
		<tr>
			<td>Playstation 4</td>
			<td>Maseru Ridge</td>
			<td>Package(10 oct)</td>
			<td>011/04/25</td>
			<td>2011/04/25</td>
			<td><span class="badge badge-success">Transfered</span></td>
            <td >
         <button width="30" type="button" class="btn btn-outline mw-md rounded btn-info btn-xs">View Package</button>
                <button width="30" type="button" class="btn btn-outline mw-md rounded btn-info btn-xs">Request</button>
            </td>
		</tr>
		<tr>
			<td>Playstation 4</td>
			<td>Maseru Ridge</td>
			<td>Package(10 oct)</td>
			<td>011/04/25</td>
			<td>2011/04/25</td>
			<td><span class="badge badge-info">Moved</span></td>
            <td >
                 <button width="30" type="button" class="btn btn-outline mw-md rounded btn-info btn-xs">View Package</button>
                <button width="30" type="button" class="btn btn-outline mw-md rounded btn-info btn-xs">Request</button>
            </td>
		</tr>
									
	</tbody>
</table>
</asp:Content>
