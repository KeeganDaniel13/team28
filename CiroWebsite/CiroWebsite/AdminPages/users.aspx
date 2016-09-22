<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="CiroWebsite.users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-md-2">
				<div class="app-action-panel" id="contacts-action-panel">
					<div class="action-panel-toggle" data-toggle="class" data-target="#contacts-action-panel" data-class="open">
						<i class="fa fa-chevron-right"></i>
						<i class="fa fa-chevron-left"></i>
					</div><!-- .action-panel-toggle -->
					<div class="m-b-lg">
						<a href="#" type="button" data-toggle="modal" data-target="#contactModal" class="btn action-panel-btn btn-success btn-block">Add C/Official</a>
					</div>
					<!-- contact category list -->
					<div id="categories-list" class="app-actions-list scrollable-container">
						<div class="list-group">
							<a href="#" class="list-group-item">
								<i class="fa fa-user text-color m-r-xs"></i>
								<span>Total Users</span>
								<span id="total" runat="server" class="pull-right">6</span>
							</a>
						</div><!-- .list-group -->

						<hr class="m-0 m-b-md" style="border-color: #ddd;">

						<div class="list-group">
							<a href="#" class="list-group-item">
								<div class="item-data">
									<span class="label-text">Warehouse</span>
									<span id="warehouseTotal" runat="server" class="pull-right hide-on-hover">7</span>
								</div>
								<div class="item-actions">
									<i class="item-action fa fa-edit" data-toggle="modal" data-target="#categoryModal"></i>
									<i class="item-action fa fa-trash" data-toggle="modal" data-target="#deleteItemModal"></i>
								</div>
							</a><!-- .list-group-item -->
							<a href="#" class="list-group-item">
								<div class="item-data">
									<span class="label-text">Officials</span>
									<span id="officalTotal" runat="server" class="pull-right hide-on-hover">5</span>
								</div>
								<div class="item-actions">
									<i class="item-action fa fa-edit" data-toggle="modal" data-target="#categoryModal"></i>
									<i class="item-action fa fa-trash" data-toggle="modal" data-target="#deleteItemModal"></i>
								</div>
							</a><!-- .list-group-item -->
							<a href="#" class="list-group-item">
								<div class="item-data">
									<span class="label-text">Clients</span>
									<span id="clientTotal" runat="server" class="pull-right hide-on-hover">17</span>
								</div>
								<div class="item-actions">
									<i class="item-action fa fa-edit" data-toggle="modal" data-target="#categoryModal"></i>
									<i class="item-action fa fa-trash" data-toggle="modal" data-target="#deleteItemModal"></i>
								</div>
							</a><!-- .list-group-item -->
							
							<a href="#" class="list-group-item text-color" data-toggle="modal" data-target="#categoryModal"><i class="fa fa-plus m-r-sm"></i> Add New Label</a>
						</div>
					</div><!-- #categories-list -->
					<div class="m-h-md">
					</div>
				</div><!-- .app-action-panel -->
			</div><!-- END column -->

			<div class="col-md-10">
				<div class="row">
					<div class="col-md-12">
				
					</div><!-- END column -->
				</div><!-- .row -->
				
				<div id="userslist" runat="server" class="row">

				</div><!-- #contacts-list -->
			</div><!-- END column -->
		</div><!-- .row -->
	</><!-- .app-content -->
</div><!-- .wrap -->

<!-- new contact Modal -->
<div id="contactModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Create Official</h4>
			</div>
			<form action="#" id="newContactForm">
				<div class="modal-body">
					<div class="form-group">
						<input type="text" id="contactName" runat="server" class="form-control" placeholder="Name"/>
					</div>
                    <div class="form-group">
						<input type="text" id="surname" runat="server" class="form-control" placeholder="Surname"/>
					</div>
					<div class="form-group">
						<input type="text" id="contactOccupation"  runat="server" class="form-control" placeholder="Occupation"/>
					</div>
					<div class="form-group">
						<input type="email" id="contactEmail" runat="server" class="form-control" placeholder="Email"/>
					</div>
				</div><!-- .modal-body -->
				<div class="modal-footer">
				<button type="button" runat="server" onserverclick="addOfficial" class="btn btn-success" data-dismiss="modal">Save</button>
				</div><!-- .modal-footer -->
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- new category Modal -->
<div id="categoryModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Create / update category</h4>
			</div>
			<form action="#" id="newCategoryForm">
				<div class="modal-body">
					<div class="form-group m-0">
						<input type="text" id="catLabel" class="form-control" placeholder="Label">
					</div>
				</div><!-- .modal-body -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-success" data-dismiss="modal">Save</button>
				</div><!-- .modal-footer -->
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- delete item Modal -->
<div id="deleteItemModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Delete item</h4>
			</div>
			<div class="modal-body">
				<h5>Do you really want to delete this item ?</h5>
			</div><!-- .modal-body -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Delete</button>
			</div><!-- .modal-footer -->
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</asp:Content>
