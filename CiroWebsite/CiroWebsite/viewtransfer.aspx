﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Customs.Master" AutoEventWireup="true" CodeBehind="viewtransfer.aspx.cs" Inherits="CiroWebsite.viewtransfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="app-content">
        <div class="row">
			<div class="col-md-3">
				<div class="app-action-panel" id="mailview-action-panel">
					<div class="action-panel-toggle" data-toggle="class" data-target="#mailview-action-panel" data-class="open">
						<i class="fa fa-chevron-right"></i>
						<i class="fa fa-chevron-left"></i>
					</div><!-- .app-action-panel -->

					<div class="app-actions-list scrollable-container">
						<!-- mail category list -->
						<div class="list-group">
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-envelope"></i>Package Log</a>
						<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-envelope"></i>Approve Transfer</a>
		
						</div><!-- .list-group -->

						<hr class="m-0 m-b-md" style="border-color: #ddd;">

						<!-- mail label list -->
						<div class="list-group">
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-envelope"></i>me@gmail.com</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-phone"></i>Warehouse Name</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-eye"></i>Location</a>
						</div><!-- .list-group -->
					</div><!-- .app-actions-list -->
				</div><!-- .app-action-panel -->
			</div><!-- END column -->

			<div class="col-md-9">
				<!-- toolbar -->
				<div class="row">
					<div class="col-md-12">
					</div>
				</div><!-- END toolbar -->
				
				<div class="mail-view">
					
					<div class="divid"></div>
					<div class="media">
						<div class="media-left">
							<div class="avatar avatar-lg avatar-circle">
								<img class="img-responsive" src="../infinity/assets/images/001.jpg" alt="avatar"/>
							</div><!-- .avatar -->
						</div>

						<div class="media-body">
							<div class="m-b-sm">
								<h4 class="m-0 inline-block m-r-lg">
									<a href="#" class="title-color">Package Transfer</a>
								</h4>
								<a href="#"><span class="label label-success">Transfer</span></a>
							</div>
							<p><b>From: </b>chuck@mulatto.com</p>
						</div>
					</div>
					<div class="divid"></div>

					<div class="row">
						<div class="col-md-12">
                            <table id="default-datatable" data-plugin="DataTable" class="table table-striped" cellspacing="0" width="100%">
       <thead>
		<tr>
			<th>Transferer</th>
            <th>Goods Transfered</th>
			<th>Good Current Location</th>
			<th>Destination</th>
            <th>DOT</th>
            <th>Action</th>
		</tr>
	</thead>					
	<tbody runat="server" id="transferD">
									
	</tbody>
</table>
							<div class="m-h-lg lh-xl">
                                <h3>Reason for Transfer</h3>
								<p>Put the reason for transfer here</p>
								
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default new-message">
							<div class="panel-heading">
								<input type="text" placeholder="envatomarket@envato.com">
							</div>								
							<div class="panel-body p-0">
								<textarea name="new_message_body" id="new-message-body"></textarea>
							</div>
							<div class="panel-footer">
								<button type="button" class="btn btn-primary btn-outline ">Submit</button>
								<button type="button" class="btn btn-default pull-right" data-dismiss="modal"><i class="fa fa-trash"></i></button>
							</div>
						</div>
					</div>
				</div>
			</div><!-- END column -->
		</div><!-- .row -->
	</section><!-- .app-content -->

</asp:Content>
