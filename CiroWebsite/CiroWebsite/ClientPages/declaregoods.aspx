<%@ Page Title="Declaration Of Goods" Language="C#" MasterPageFile="Client.Master" AutoEventWireup="true" CodeBehind="declaregoods.aspx.cs" Inherits="CiroWebsite.declaregoods" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
         .form-inline > *{
            margin:1px 22px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<form>
        <div class="col-md-6">
				
					<header class="widget-header">
						<h4 class="widget-title">Declaration Information</h4>
					</header>
					
										
                          <form>
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">Product name</label>
								<div class="col-sm-9">
									<input type="text" runat="server" class="form-control" id="productName" placeholder="Product name"/>
								</div>
							</div>
                              <br />
                             <div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">Quantity</label>
								<div class="col-sm-9">
									<input type="text" runat="server" class="form-control" id="quantity" placeholder="Quantity"/>
								</div>
							</div>
                              <br/>
							<div class="form-group">
								<label for="value" class="col-sm-3 control-label">Product Value</label>
								<div class="col-sm-9">
									<input type="text" runat="server" class="form-control" id="productValue" placeholder="Product Value"/>
								</div>
							</div>
                              <br/>
							<div class="form-group">
								<label for="Warehouse" class="col-sm-3 control-label">Select Warehouse</label>
						<div class="col-sm-9"">
						<a href="#" data-toggle="modal" data-target="#composeModal">
                                   <input type="text" runat="server" class="form-control" id="WarehouseName" placeholder="Warehouse"/></a>
					        </div> 
							</div>
                            <div>
                                <label for="insuredBox" class="col-sm-3 control-label">Is The Product Insured</label>
								<div class="col-sm-9">
								</div> 
                              </div>	
                              <div>
                                <label for="reasonInput" class="col-sm-3 control-label">Reason For Importation</label>
								<div class="col-sm-9">
									<textarea id="reason" runat="server" rows="4" cols="50"></textarea>
								</div> 
                              </div>
                                  <br /><br /><br /><br /><br /><br /><br /><br />   

							<button type="submit"  class="btn btn-primary btn-xs btn-outline" onserverclick="SaveItem" runat="server" style="margin-left:-23%">Add Package</button>
                              
						</form>						
					</div>
			
                <div class="col-md-6">
				<div class="widget">
                    <div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">Country Origin</label>
								<div class="col-sm-9">
									<input type="text" runat="server" class="form-control" id="country" placeholder="Country Origin"/>
								</div>
							</div>
					<header class="widget-header">
						<h4 class="widget-title">Saved Items</h4>
					</header>
					<hr class="widget-separator">
					<div class="widget-body">												
					<table class="table table-striped">
						<tr>
                            <th>#</th><th>Product Name</th>
                            <th>Value</th>
                            <th>Warehouse</th>
                            <th>Remove</th>		
                        </tr>
                        <% listItems(); %>
					</table>

							<br/>
							<button type="submit"  class="btn btn-primary btn-xs btn-outline" onserverclick="declareItems" runat="server">Store Packages</button>
				
					</div>
				</div>
			</div>
		
</form>
<!-- Compose modal -->
<div class="modal fade" id="composeModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Warehouse</h4>
			</div>
			<div class="modal-body">
				<table class="table table-hover">
                <tr>
                  <th>Select</th>
                  <th style="width: 10px">#</th>
                  <th>Warehouse</th>
                   <th>Location</th>
                  <th>Capacity</th>
                  <th style="width: 40px">%</th>
                </tr>  
                   <%ListWarehouses(); %>   
              </table>                                
                <br/>
               <!-- <a href="#" onclick="saveWarehouse(name)" type="button" class="btn btn-primary">Accept</a>                -->
                <br/>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
    <script type="text/javascript">
        function saveWarehouse(id, name)
        {
            $('#<%=WarehouseName.ClientID%>').val(name);
        }
        function remove(id)
        {
            alert(id);
        }
    </script>
</asp:Content>
