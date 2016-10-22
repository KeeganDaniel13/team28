<%@ Page Title="" Language="C#" MasterPageFile="Client.Master" AutoEventWireup="true" CodeBehind="inventory.aspx.cs" Inherits="CiroWebsite.inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../infinity/css/inventory.css"/>
      <script src="../infinity/assets/myjs/mode.js"></script>    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="col-sm-12 col-md-12">
	    <div class="panel panel-primary inventory">
		    <div class="panel-heading">
			    <h4 class="panel-title">Inventory</h4>
		    </div>
		    <div class="panel-body">
			     <table id="acrylic" width="100%">
            <thead>
                <tr>
                    <th>Package Name</th>
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
		    </div>
	    </div>
    </div><!-- END column -->
  
    <div id="modalsHolder" runat="server">
        
        </div>


 
   <script>function bingo(id) {
    $(id).modal('show');
}</script>
</asp:Content>
