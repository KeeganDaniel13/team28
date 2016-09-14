<%@ Page Title="" Language="C#" MasterPageFile="~/Customs.Master" AutoEventWireup="true" CodeBehind="viewtransfer.aspx.cs" Inherits="CiroWebsite.viewtransfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="app-content">
        <div class="row">
			
            			<div class="col-md-3">
            
            <div class="user-card contact-item p-md">
					<div class="media">
						<div class="media-left">
							<div class="avatar avatar-xl avatar-circle">
								<img src="../infinity/assets/images/101.jpg" alt="contact image">
                                <i class="status status-online"></i>
							</div>
						</div>
						<div class="media-body">
							<h5 class="media-heading title-color" id="H1" runat="server"></h5>
							<div class="contact-links m-t-sm">
								<a href="javascript:void(0)" class="icon icon-circle icon-sm m-b-0" data-toggle="tooltip" title="Phone" data-placement="top"><i class="fa fa-phone"></i></a>
								<a href="javascript:void(0)" class="icon icon-circle icon-sm m-b-0" data-toggle="tooltip" title="Mobile" data-placement="top"><i class="fa fa-mobile"></i></a>
								<a href="mailto:example@rathemes.com" class="icon icon-circle icon-sm m-b-0" data-toggle="tooltip" title="example@rathemes.com" data-placement="top"><i class="fa fa-envelope-o"></i></a>
								<a href="javascript:void(0)" class="icon icon-circle icon-sm m-b-0" data-toggle="tooltip" title="rathemes" data-placement="top"><i class="fa fa-skype"></i></a>
							</div>
						</div>
					</div>
					<div class="contact-item-actions">
						<a href="javascript:void(0)" class="btn btn-success" data-toggle="modal" data-target="#contactModal"><i class="fa fa-pencil"></i></a>
						<a href="javascript:void(0)" class="btn btn-danger" data-toggle="modal" data-target="#deleteItemModal"><i class="fa fa-trash"></i></a>
					</div><!-- .contact-item-actions -->
				</div><!-- user-card -->
                <div class="app-actions-list">
                    <div class="list-group">
						<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-product-hunt"></i>Package Log</a>
						<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-money"></i>View Payments</a>
		
						</div><!-- .list-group -->
                    </div>
                </div>

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
							<p runat="server" id="name"><b>From: </b></p>
						</div>
					</div>
					<div class="divid"></div>

					<div class="row">
						<div class="col-md-12">
                            <table id="default-datatable" data-plugin="DataTable" class="table table-striped" cellspacing="0" width="100%">
       <thead>
		<tr>
			<th>Transferer</th>
            <th>Good Transfered</th>
			<th>Current Location</th>
			<th>Destination</th>
            <th>DOT</th>
            <th>Action</th>
		</tr>
	</thead>					
	<tbody runat="server" id="transferD">
									
	</tbody>
</table>
							<!--<div class="m-h-lg lh-xl">
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
