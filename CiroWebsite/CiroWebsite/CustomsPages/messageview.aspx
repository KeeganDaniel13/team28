<%@ Page Title="" Language="C#" MasterPageFile="Customs.Master" AutoEventWireup="true" CodeBehind="messageview.aspx.cs" Inherits="CiroWebsite.messageview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section runat="server" id="messageDetails" class="app-content">
		<div class="row">
			<div class="col-md-2">
				<div class="app-action-panel" id="mailview-action-panel">
					<div class="action-panel-toggle" data-toggle="class" data-target="#mailview-action-panel" data-class="open">
						<i class="fa fa-chevron-right"></i>
						<i class="fa fa-chevron-left"></i>
					</div><!-- .app-action-panel -->

					<div class="m-b-lg">
						<a href="#" type="button" data-toggle="modal" data-target="#composeModal" class="btn action-panel-btn btn-default btn-block">Compose</a>
					</div>
                    
					<div class="app-actions-list scrollable-container">
						<!-- mail category list -->
						<div class="list-group">
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-envelope"></i>Inbox</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-star"></i>Starred</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-bookmark"></i>Important</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-paper-plane"></i>Sent</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-folder"></i>All Mail</a>
							
						</div><!-- .list-group -->

						<hr class="m-0 m-b-md" style="border-color: #ddd;">

						<!-- mail label list -->
						<div class="list-group">
							<h4>Labels</h4>
							<a href="#" class="list-group-item">
								<i class="m-r-sm fa fa-circle text-warning"></i>
								<span>Personal</span>
								<div class="item-actions">
									<i class="item-action fa fa-edit" data-toggle="modal" data-target="#labelModal"></i>
									<i class="item-action fa fa-trash" data-toggle="modal" data-target="#deleteItemModal"></i>
								</div>
							</a>
							<a href="#" class="list-group-item">
								<i class="m-r-sm fa fa-circle text-primary"></i>
								<span>Work</span>
								<div class="item-actions">
									<i class="item-action fa fa-edit" data-toggle="modal" data-target="#labelModal"></i>
									<i class="item-action fa fa-trash" data-toggle="modal" data-target="#deleteItemModal"></i>
								</div>
							</a>
							<a href="#" class="list-group-item">
								<i class="m-r-sm fa fa-circle text-danger"></i>
								<span>Business</span>
								<div class="item-actions">
									<i class="item-action fa fa-edit" data-toggle="modal" data-target="#labelModal"></i>
									<i class="item-action fa fa-trash" data-toggle="modal" data-target="#deleteItemModal"></i>
								</div>
							</a>
							<a href="#" class="list-group-item">
								<i class="m-r-sm fa fa-circle text-success"></i>
								<span>Clients</span>
								<div class="item-actions">
									<i class="item-action fa fa-edit" data-toggle="modal" data-target="#labelModal"></i>
									<i class="item-action fa fa-trash" data-toggle="modal" data-target="#deleteItemModal"></i>
								</div>
							</a>
							<a href="#" class="list-group-item text-color" data-toggle="modal" data-target="#labelModal"><i class="fa fa-plus m-r-sm"></i> Add New Label</a>
						</div><!-- .list-group -->
					</div><!-- .app-actions-list -->
				</div><!-- .app-action-panel -->
			</div><!-- END column -->

			<div class="col-md-10">
				<!-- toolbar -->
				<div class="row">
					<div class="col-md-12">
						<div class="mail-toolbar m-b-md">								
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Reply <span class="caret"></span></button>
								<ul class="dropdown-menu">
									<li><a href="#">forward</a></li>
									<li><a href="#">save</a></li>
								</ul>
							</div>

							<div class="btn-group" role="group">
								<a href="#" class="btn btn-default"><i class="fa fa-trash"></i></a>
								<a href="#" class="btn btn-default"><i class="fa fa-exclamation-circle"></i></a>
							</div>
							<a href="#" class="btn btn-default"><i class="fa fa-arrow-left"></i></a>
						</div>
					</div>
				</div><!-- END toolbar -->
				<!--message content-->
	</section><!-- .app-content -->
</div><!-- .wrap -->


<!-- Compose modal -->
<div class="modal fade" id="composeModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">New Message</h4>
			</div>
			<div class="modal-body">
				<form action="#">
					<div class="form-group">
						<input name="mail_from_field" runat="server" id="from" type="text" class="form-control" placeholder="from">
					</div>
					<div class="form-group">
						<input name="mail_to_field" id="mail_to_field" type="text" class="form-control" placeholder="to">
					</div>
					<div class="form-group">
						<input name="mail_subject_field" id="mail_subject_field" type="text" class="form-control" placeholder="subject">
					</div>
					<textarea name="mail_body_field" id="mail_body_field" cols="30" rows="5" class="form-control" placeholder="content"></textarea>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-danger"><i class="fa fa-trash"></i></button>
				<button type="button" data-dismiss="modal" class="btn btn-success"><i class="fa fa-save"></i></button>
				<button type="button" data-dismiss="modal" class="btn btn-primary">Send <i class="fa fa-send"></i></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- new label Modal -->
<div id="labelModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Create / update label</h4>
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
