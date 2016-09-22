<%@ Page Title="Ownership Transfer" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="declareownershiptransfer.aspx.cs" Inherits="CiroWebsite.declareownershiptransfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row">
    <div class="col-md-4">
		<form>
			<div class="form-group">
                <input type="text" class="form-control" runat="server" id="transfereeEmail" placeholder="Cosignee Email" style="width: 300px;"><br/>
                <input type="text" class="form-control" runat="server" id="transfereeName" placeholder="Cosignee Name" style="width: 300px;"><br/>

			<div class="checkbox checkbox-primary">
					<input type="checkbox" id="checkbox-demo-1"/>
					<label for="checkbox-demo-1">I Agree with all terms and conditions</label>
				</div>
            </div>
			
			<button type="submit" runat="server" onserverclick="proceed" class="btn btn-info btn-sm">Select</button>
		</form>
	
	</div><!-- END column -->
    <div class="col-md-8">
	<table id="default-datatable" data-plugin="DataTable" class="table table-striped" cellspacing="0" width="100%">
       <thead>
		<tr>
            <th>Product Name</th>
			<th>Cosignee</th>
            <th>Entry Number</th>
			<th>Location</th>
            <th>Arrival Date</th>
            <th>Action</th>
		</tr>
	</thead>					
	<tbody>
       <!--  listRequests(); -->					
	</tbody>
</table>
        <br/>
         <ul class="list-inline pull-right">
            <li><button type="button" class="btn btn-success btn-sm">Proceed</button></li>
        </ul>
	</div><!-- END column -->

     </div>
</asp:Content>
