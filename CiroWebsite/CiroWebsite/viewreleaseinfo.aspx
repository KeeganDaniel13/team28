<%@ Page Title="" Language="C#" MasterPageFile="~/Customs.Master" AutoEventWireup="true" CodeBehind="viewreleaseinfo.aspx.cs" Inherits="CiroWebsite.viewreleaseinfo" %>
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
							<h5 class="media-heading title-color" id="name" runat="server"></h5>
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
                    <div class="list-group" runat="server" id ="log">
						<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-envelope"></i>View Payments</a>
						</div><!-- .list-group -->
                    </div>
                </div>
            <div class="col-md-8">
             
			    <div class="panel panel-default">
                <div class="panel-heading bg-white">
					<h4 class="panel-title">Release Information</h4>
				</div>
        <table id="default-datatable" data-plugin="DataTable" class="table table-striped" cellspacing="0" width="100%">
       <thead>
		<tr>
			<th>Package Name</th>
			<th>Quantity</th>
			<th>Duty Access</th>
			<th>Bill</th>
            <th>Exit Date</th>
			<th>Cosigner</th>
            <th>Action</th>
		</tr>
	</thead>					
	<tbody runat="server" id="releaseInfo">
								
	</tbody>
</table>
             </div>
                 </div>
        </div>
            </div>
    </section>
</asp:Content>
