<%@ Page Title="" Language="C#" MasterPageFile="warehouse.Master" AutoEventWireup="true" CodeBehind="wareMessage.aspx.cs" Inherits="CiroWebsite.wareMessage" %>
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
							
						</div><!-- .list-group -->

						<hr class="m-0 m-b-md" style="border-color: #ddd;"/>

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
							<a href="wareMessages.aspx" class="btn btn-default"><i class="fa fa-arrow-left"></i></a>
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
						<input name="mail_from_field" id="from" runat="server" type="text" class="form-control" placeholder="from">
					</div>
					<div class="form-group">
						<input name="mail_to_field" id="to" runat="server" type="text" class="form-control" placeholder="to">
					</div>
					<div class="form-group">
						<input name="mail_subject_field" id="subject" runat="server" type="text" class="form-control" placeholder="subject">
					</div>
					<textarea name="mail_body_field" id="body" runat="server" cols="30" rows="5" class="form-control" placeholder="content"></textarea>
				</form>
			</div>
			<div class="modal-footer">
                <button type="button" runat="server" onserverclick="sendMail" data-dismiss="modal" class="btn btn-primary">Send <i class="fa fa-send"></i></button>
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

