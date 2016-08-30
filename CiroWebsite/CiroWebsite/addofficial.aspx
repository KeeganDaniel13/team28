
<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="addofficial.aspx.cs" Inherits="CiroWebsite.addofficial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
				<div class="panel panel-default new-message">						
					<form action="#">
						<div class="panel-body">
							<div class="form-group m-b-0">
								<div class="row">
									<div class="col-sm-6">
										<input type="text" class="form-control m-b-lg" placeholder="Name">
									</div>
									<div class="col-sm-6">
										<input type="text" class="form-control m-b-lg" placeholder="Last Name">
									</div>
								</div>
							</div><!-- .form-group -->
							<div class="form-group m-b-0">
								<div class="row">
									<div class="col-sm-6">
										<input type="text" class="form-control m-b-lg" placeholder="Position Held">
									</div>
									<div class="col-sm-6">
										<input type="text" class="form-control m-b-lg" placeholder="blah blah">
									</div>
								</div>
							</div><!-- .form-group -->

							<div class="form-group m-b-0">
								<div class="row">
									<div class="col-sm-6">
										<input type="text" class="form-control m-b-lg" placeholder="Whatever">
									</div>
									<div class="col-sm-6">
										<input type="text" class="form-control m-b-lg" placeholder="Tired of thinking ">
									</div>
								</div>
							</div><!-- .form-group -->
							
						</div><!-- .panel-body -->

						<div class="panel-footer clearfix">
							<div class="pull-right">
								
								<button type="button" class="btn btn-success btn-outline ">Register Official</button>
							</div>
						</div><!-- .panel-footer -->
					</form>
				</div><!-- .panel -->
			</div><!-- END column -->
</asp:Content>
