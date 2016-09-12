<%@ Page Title="Ownership Transfer" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="declareownershiptransfer.aspx.cs" Inherits="CiroWebsite.declareownershiptransfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row">
    <div class="col-md-4">
		<form>
			<div class="form-group">
                <input type="text" class="form-control" runat="server" id="transfereeEmail" placeholder="Transferee Email" style="width: 300px;"><br/>
                <input type="text" class="form-control" runat="server" id="transfereeName" placeholder="Transferee Name" style="width: 300px;"><br/>
                <div class='input-group date' id='datetimepicker2' data-plugin="datetimepicker">
					    <input type='text' class="form-control"/>
					    <span class="input-group-addon bg-info text-white">
						    <span class="fa fa-calendar"></span>
					    </span>
				    </div><br/>
                <label for="exampleInputFile">Reason for Transfer of Ownership</label>
				<textarea name="control-demo-5" runat="server" id="changeReason" class="form-control" cols="30" rows="2" style="width: 300px;"></textarea><br/>
			<div class="checkbox checkbox-primary">
					<input type="checkbox" id="checkbox-demo-1"/>
					<label for="checkbox-demo-1">I Agree with all terms and conditions</label>
				</div>
            </div>
			
			<button type="submit" runat="server" onserverclick="proceed" class="btn btn-primary btn-outline btn-sm">Proceed</button>
		</form>
	
	</div><!-- END column -->
    <div class="col-md-8">
	<table id="default-datatable" data-plugin="DataTable" class="table table-striped" cellspacing="0" width="100%">
       <thead>
		<tr>
            <th>Product Name</th>
			<th>Transferer</th>
			<th>Origin</th>
            <th>DOA</th>
            <th>DOT</th>
			<th>Reason</th>
            <th>Action</th>
		</tr>
	</thead>					
	<tbody>
        <% listRequests(); %>							
	</tbody>
</table>
	</div><!-- END column -->
     </div>
</asp:Content>
