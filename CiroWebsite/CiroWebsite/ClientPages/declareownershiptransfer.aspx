<%@ Page Title="Ownership Transfer" Language="C#" MasterPageFile="Client.Master" AutoEventWireup="true" CodeBehind="declareownershiptransfer.aspx.cs" Inherits="CiroWebsite.ClientPages.declareownershiptransfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="../infinity/assets/myjs/mode.js"></script>  
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
			
			<button type="submit" runat="server" class="btn btn-info btn-sm">Select</button>
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
    
    <!-- Modal -->
            <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="text-danger fa fa-times"></i></button>
                    <h4 class="modal-title" id="myModalLabel"><i class="text-muted fa fa-shopping-cart"></i>Select Package</h4>
                  </div>
                  <div class="modal-body">
                    <table class="table table-hover">
                    <tr>
                      <th>Select</th>
                      <th style="width: 10px">#</th>
                      <th>Name</th>
                       <th>Location</th>
                      <th>Value</th>
                    </tr>  
                       <!--  ListPackages(); -->
                  </table>                                
                    <br/>
                   <!-- <a href="#" onclick="saveWarehouse(name)" type="button" class="btn btn-primary">Accept</a>                -->
                    <br/>

                  <div class="modal-footer">       
                      
                    <div class="text-right pull-right col-md-3">
                        Package Selected: <br/> 
                        <span class="h3 text-muted"><strong>(Name of package)</strong></span></span> 
                    </div>
                  
                </div>
              </div>
            </div>
            </div>
<!-- fim Modal-->

 
   <script>function bingo(id) {
    $(id).modal('show');
}</script>
</asp:Content>
