<%@ Page Title="Customs" Language="C#" MasterPageFile="Customs.Master" AutoEventWireup="true" CodeBehind="customs.aspx.cs" Inherits="CiroWebsite.customs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="row">
        <div class="col-md-6 col-sm-6">
				<div class="widget p-md clearfix">
					<div class="pull-left">
						<h3 class="widget-title">Welcome Customs Official</h3>
						<small class="text-color">Number of Goods Today</small>
					</div>
					<span class="pull-right fz-lg fw-500 counter" data-plugin="counterUp"><%customsa();%></span>
				</div><!-- .widget -->
			</div>

			<div class="col-md-6 col-sm-6">
				<div class="widget p-md clearfix">
					<div class="pull-left">
						<h3 class="widget-title">Total Goods</h3>
						<small class="text-color">Currently Stored</small>
					</div>
					<span class="pull-right fz-lg fw-500 counter" data-plugin="counterUp"><%customsb();%></span>
				</div><!-- .widget -->
			</div>
    </div>
    <div class="row">
			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-primary"><span class="counter" data-plugin="counterUp">66.136</span>k</h3>
							<small class="text-color">Total loads</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-paperclip"></i></span>
					</div>
					<footer class="widget-footer bg-primary">
						<small>% charge</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[4,3,5,2,1], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget -->
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-danger"><span class="counter" data-plugin="counterUp">3.490</span>k</h3>
							<small class="text-color">Total Pending</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-ban"></i></span>
					</div>
					<footer class="widget-footer bg-danger">
						<small>% charge</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[1,2,3,5,4], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget -->
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-success"><span class="counter" data-plugin="counterUp">8.378</span>k</h3>
							<small class="text-color">Case Close</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-unlock-alt"></i></span>
					</div>
					<footer class="widget-footer bg-success">
						<small>% charge</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[2,4,3,4,3], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget -->
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-warning"><span class="counter" data-plugin="counterUp">3.490</span>k</h3>
							<small class="text-color">Total Pending</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-file-text-o"></i></span>
					</div>
					<footer class="widget-footer bg-warning">
						<small>% charge</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[5,4,3,5,2],{ type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget -->
			</div>
		</div><!-- .row -->
    
    <div class="row">
			<div class="col-md-6 col-sm-6">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Release Requests</h4>
					</header>
					<hr class="widget-separator" />
					<div class="widget-body">
						<div class="streamline">
							<div class="sl-item sl-primary">
								<div class="sl-content">
									<small class="text-muted">23 mins ago</small>
									<p></p>
								</div>
							</div><!-- .sl-item -->

							<div class="sl-item sl-danger">
								<div class="sl-content">
									<small class="text-muted">23 mins ago</small>
									<p>Jane sent you invitation to attend the party</p>
								</div>
							</div><!-- .sl-item -->

							<div class="sl-item sl-success">
								<div class="sl-content">
									<small class="text-muted">23 mins ago</small>
									<p>Sally added you to her circles</p>
								</div>
							</div><!-- .sl-item -->

							<div class="sl-item sl-warning">
								<div class="sl-content">
									<small class="text-muted">23 mins ago</small>
									<p>Sara has finished her task</p>
								</div>
							</div><!-- .sl-item -->
						</div><!-- .streamline -->
					</div>
                    <footer class="widget-footer">
						<a href="javascript:void(0)" class="btn btn-sm btn-primary btn-outline btn-sm pull-right">View Requests</a>
					</footer>
				</div><!-- .widget -->
			</div>
        <div class="col-md-6 col-sm-6">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Warehouse Transfers</h4>
					</header>
					<hr class="widget-separator" />
					<div class="widget-body">
						<div class="streamline">
							<div class="sl-item sl-primary">
								<div class="sl-content">
									<small class="text-muted">23 mins ago</small>
									<p>John has just started working on the project</p>
								</div>
							</div><!-- .sl-item -->

							<div class="sl-item sl-danger">
								<div class="sl-content">
									<small class="text-muted">23 mins ago</small>
									<p>Jane sent you invitation to attend the party</p>
								</div>
							</div><!-- .sl-item -->

							<div class="sl-item sl-success">
								<div class="sl-content">
									<small class="text-muted">23 mins ago</small>
									<p>Sally added you to her circles</p>
								</div>
							</div><!-- .sl-item -->

							<div class="sl-item sl-warning">
								<div class="sl-content">
									<small class="text-muted">23 mins ago</small>
									<p>Sara has finished her task</p>
								</div>
							</div><!-- .sl-item -->
						</div><!-- .streamline -->
					</div>
                    <footer class="widget-footer">
						
						<a href="javascript:void(0)" class="btn btn-sm btn-primary btn-outline btn-sm pull-right">View Transfers</a>
					</footer>
				</div><!-- .widget -->
			</div>
        </div>
    <div class="row">
			<div class="col-md-8">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Ownership Changes</h4>
					</header>
					<hr class="widget-separator"/>
					<div class="widget-body">
						<div class="table-responsive">							
							<table class="table no-cellborder">
								<thead>
									<tr><th>Status</th><th>Transferer</th><th>Transferee</th><th>DOT</th><th>Type</th><th>Last Action</th></tr>
								</thead>
								<tbody>
									<tr><td class="text-primary">Accepeted</td><td>Denise Ann</td><td>Denise Ann</td><td>01/20/2015</td><td><span class="badge badge-success">Sold</span></td><td><span class="table-icon fa fa-exclamation"></span> 11/9/2015</td></tr>
									<tr><td class="text-primary">Accepeted</td><td>Denise Ann</td><td>Denise Ann</td><td>01/20/2015</td><td><span class="badge badge-warning">Exchange</span></td><td><span class="table-icon fa fa-exchange"></span> 11/9/2015</td></tr>
									<tr><td class="text-danger">Rejected</td><td>Denise Ann</td><td>Denise Ann</td><td>01/20/2015</td><td><span class="badge badge-danger">Misownership</span></td><td><span class="table-icon fa fa-envelope"></span> 11/9/2015</td></tr>
									<tr><td class="text-danger">Rejected</td><td>Denise Ann</td><td>Denise Ann</td><td>01/20/2015</td><td><span class="badge badge-success">Sold</span></td><td><span class="table-icon fa fa-exchange"></span> 11/9/2015</td></tr>
								</tbody>
							</table>
						</div>
					</div>
                    <footer class="widget-footer">
						<a href="javascript:void(0)" class="btn btn-sm btn-primary btn-outline btn-sm pull-right">View Transfers</a>
					</footer>
				</div><!-- .widget -->
			</div><!-- END column -->
        <div class="col-md-4 col-sm-4">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Inbox</h4>
					</header>
					<hr class="widget-separator"/>
					<div class="widget-body">
						<div class="media-group feeds-group">

							<div class="media-group-item">
								<div class="media">
									<div class="media-left">
										<div class="avatar avatar-sm avatar-circle">
											<img src="../infinity/assets/images/217.jpg" alt="">
										</div>
									</div>
									<div class="media-body">
										<h5><a href="javascript:void(0)" class="text-color">Some of the fantastic things people have had to say about Ooooh</a></h5>
										<small class="text-muted">2 days ago</small>
									</div>
								</div>
							</div><!-- .media-group-item -->

							<div class="media-group-item">
								<div class="media">
									<div class="media-left">
										<div class="avatar avatar-sm avatar-circle">
											<img src="../infinity/assets/images/218.jpg" alt="">
										</div>
									</div>
									<div class="media-body">
										<h5><a href="javascript:void(0)" class="text-color">Here are just some of the magazine reviews we have had</a></h5>
										<small class="text-muted">1 day ago</small>
									</div>
								</div>
							</div><!-- .media-group-item -->

							<div class="media-group-item">
								<div class="media">
									<div class="media-left">
										<div class="avatar avatar-sm avatar-circle">
											<img src="../infinity/assets/images/219.jpg" alt="">
										</div>
									</div>
									<div class="media-body">
										<h5><a href="javascript:void(0)" class="text-color">Lorem ipsum dolor amet, consectetur adipisicing elit.</a></h5>
										<small class="text-muted">2 days ago</small>
									</div>
								</div>
							</div><!-- .media-group-item -->
							
						</div>
					</div>
                    <footer class="widget-footer">
						<a href="javascript:void(0)" class="btn btn-sm btn-primary btn-outline btn-sm pull-right">Inbox</a>
					</footer>
				</div><!-- .widget -->
			</div>
        </div>
</asp:Content>
