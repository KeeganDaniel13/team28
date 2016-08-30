<%@ Page Title="Ownership Transfer" Language="C#" MasterPageFile="~/ciro.Master" AutoEventWireup="true" CodeBehind="declareownershiptransfer.aspx.cs" Inherits="CiroWebsite.declareownershiptransfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row">
    <div class="col-md-4">
		<form>
			<div class="form-group">
				<input type="email" class="form-control" id="transferer" placeholder="Transferer Name" style="width: 300px;"><br/>
                <input type="text" class="form-control" id="lastname" placeholder="Last Name" style="width: 300px;"><br/>
                <input type="text" class="form-control" id="transferee" placeholder="Transferee Name" style="width: 300px;"><br/>
                <input type="text" class="form-control" id="transferee" placeholder="Transferee Email" style="width: 300px;"><br/>
                <div class='input-group date' id='datetimepicker2' data-plugin="datetimepicker">
					    <input type='text' class="form-control"/>
					    <span class="input-group-addon bg-info text-white">
						    <span class="fa fa-calendar"></span>
					    </span>
				    </div><br/>
                <label for="exampleInputFile">Reason for Transfer of Ownership</label>
				<textarea name="control-demo-5" id="control-demo-5" class="form-control" cols="30" rows="2" style="width: 300px;"></textarea><br/>
			<div class="checkbox checkbox-primary">
					<input type="checkbox" id="checkbox-demo-1"/>
					<label for="checkbox-demo-1">I Agree with all terms and conditions</label>
				</div>
            </div>
			
			<button type="submit" class="btn btn-primary btn-outline btn-sm">Proceed</button>
		</form>
	
	</div><!-- END column -->
    <div class="col-md-8">
				<table id="default-datatable" data-plugin="DataTable" class="table table-striped" cellspacing="0" width="100%">
       <thead>
		<tr>
			<th>Transferer</th>
			<th>Last Name</th>
			<th>Transferee</th>
			<th>Transferee Email</th>
            <th>DOT</th>
			<th>Reason</th>
            <th>Action</th>
		</tr>
	</thead>					
	<tbody>
		
									
	</tbody>
</table>
	</div><!-- END column -->
     </div>
</asp:Content>
