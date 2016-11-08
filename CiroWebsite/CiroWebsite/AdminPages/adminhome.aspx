<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/admin.Master" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="CiroWebsite.AdminPages.adminhome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <section class="app-content">
    <div class="row">
	    <div class="col-md-7">
		    <div class="widget">
			    <div class="widget-body">
				    <div data-plugin="plot" data-options="
					    [
						    {
							    label: 'Foo',
							    data: [[1, 3.6], [2, 3.5], [3, 6], [4, 4], [5, 4.3], [6, 3.5], [7, 3.6]],
							    color: 'rgb(103, 157, 198)'
						    },
						    {
							    label: 'Bar',
							    data: [[1, 3], [2, 2.6], [3, 3.2], [4, 3], [5, 3.5], [6, 3], [7, 3.5]],
							    color: 'rgb(57, 128, 181)'
						    },
						    {
							    label: 'Baz',
							    data: [[1, 2], [2, 1.6], [3, 2.4], [4, 2.1], [5, 1.7], [6, 1.5], [7, 1.7]],
							    color: 'rgb(11, 98, 164)'
						    }
					    ],
					    {
						    series: {
							    shadowSize: 0,
							    lines: { fill: 1}
						    },

						    xaxis: { show: true },
						    yaxis: { min: 0, max: 12 },
						    grid: { show: true, hoverable: true, borderWidth: 0, color: '#cccccc'},
						    tooltip: true,
						    tooltipOpts: { content: 'X: %x.0, Y: %y.2',  defaultTheme: false, shifts: { x: 0, y: -40 } }
					    }" style="height: 320px;width: 100%;">
				    </div>
			    </div><!-- .widget-body -->
		    </div><!-- .widget -->
	    </div><!-- END column -->
	    <div class="col-md-5">
		    <div class="widget">
			    <header class="widget-header">
				    <h4 class="widget-title">Records</h4>
			    </header><!-- .widget-header -->
			    <hr class="widget-separator">
			    <div class="widget-body row">
				    <div class="col-xs-4">
					    <div class="text-center p-h-md" style="border-right: 2px solid #eee">
						    <h2 class="fz-xl fw-400 m-0" data-plugin="counterUp">26</h2>
					    </div>
				    </div><!-- END column -->
				    <div class="col-xs-4">
					    <div class="text-center p-h-md" style="border-right: 2px solid #eee">
						    <h2 class="fz-xl fw-400 m-0" data-plugin="counterUp">75</h2>
					    </div>
				    </div><!-- END column -->
				    <div class="col-xs-4">
					    <div class="text-center p-h-md">
						    <h2 class="fz-xl fw-400 m-0" data-plugin="counterUp">32</h2>
					    </div>
				    </div><!-- END column -->
			    </div><!-- .widget-body -->
		    </div><!-- .widget -->

		    <div class="widget">
			    <header class="widget-header">
				    <h4 class="widget-title">Connect Point</h4>
			    </header><!-- .widget-header -->
			    <hr class="widget-separator">
			    <div class="widget-body">
				    <div class="media">
					    <div class="media-left">
						    <div class="icon icon-circle m-0 m-r-md b-0 primary text-white" style="width: 90px; height: 90px; line-height: 90px;">
							    <i class="fa fa-2x fa-internet-explorer"></i>
						    </div>
					    </div>
					    <div class="media-body p-b-md p-t-xs">
						    <p class="m-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nesciunt quaerat repellendus est, voluptate cupiditate, iusto!</p>
					    </div>
				    </div><!-- .media -->
			    </div><!-- .widget-body -->
		    </div><!-- .widget -->
	    </div><!-- END column -->
    </div><!-- .row -->

    <div class="row">
	    <div class="col-md-6 col-sm-6">
		    <div class="widget">
			    <header class="widget-header">
				    <h4 class="widget-title">Warehouses</h4>
			    </header>
			    <hr class="widget-separator"/>
			    <div class="widget-body">
				    <div class="streamline m-l-lg">
					    <div class="sl-item p-b-md">
						    <div class="sl-avatar avatar avatar-sm avatar-circle">
							    <img class="img-responsive" src="../assets/images/221.jpg" alt="avatar"/>
						    </div><!-- .avatar -->
						    <div class="sl-content m-l-xl">
							    <h5 class="m-t-0"><a href="javascript:void(0)" class="m-r-xs theme-color">John Doe</a><small class="text-muted fz-sm">last month</small></h5>
							    <p>John has just started working on the project</p>
						    </div>
					    </div><!-- .sl-item -->

					    <div class="sl-item p-b-md">
						    <div class="sl-avatar avatar avatar-sm avatar-circle">
							    <img class="img-responsive" src="../assets/images/214.jpg" alt="avatar"/>
						    </div><!-- .avatar -->
						    <div class="sl-content m-l-xl">
							    <h5 class="m-t-0"><a href="javascript:void(0)" class="m-r-xs theme-color">Jane Doe</a><small class="text-muted fz-sm">last month</small></h5>
							    <p>Jane sent you invitation to attend the party</p>
						    </div>
					    </div><!-- .sl-item -->

					    <div class="sl-item p-b-md">
						    <div class="sl-avatar avatar avatar-sm avatar-circle">
							    <img class="img-responsive" src="../assets/images/217.jpg" alt="avatar"/>
						    </div><!-- .avatar -->
						    <div class="sl-content m-l-xl">
							    <h5 class="m-t-0"><a href="javascript:void(0)" class="m-r-xs theme-color">Sally Mala</a><small class="text-muted fz-sm">last month</small></h5>
							    <p>Sally added you to her circles</p>
						    </div>
					    </div><!-- .sl-item -->

					    <div class="sl-item p-b-md">
						    <div class="sl-avatar avatar avatar-sm avatar-circle">
							    <img class="img-responsive" src="../assets/images/211.jpg" alt="avatar"/>
						    </div><!-- .avatar -->
						    <div class="sl-content m-l-xl">
							    <h5 class="m-t-0"><a href="javascript:void(0)" class="m-r-xs theme-color">Sara Adams</a><small class="text-muted fz-sm">last month</small></h5>
							    <p>Sara has finished her task</p>
						    </div>
					    </div><!-- .sl-item -->
					    <div class="sl-item p-b-md">
						    <div class="sl-avatar avatar avatar-sm avatar-circle">
							    <img class="img-responsive" src="../assets/images/214.jpg" alt="avatar"/>
						    </div><!-- .avatar -->
						    <div class="sl-content m-l-xl">
							    <h5 class="m-t-0"><a href="javascript:void(0)" class="m-r-xs theme-color">Sandy Doe</a><small class="text-muted fz-sm">last month</small></h5>
							    <p>Sara has finished her task</p>
						    </div>
					    </div><!-- .sl-item -->
				    </div><!-- .streamline -->
			    </div>
		    </div><!-- .widget -->
	    </div><!-- END column -->

<div class="col-md-6">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Stacked Bar Chart</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div data-plugin="plot" data-options="
							[
								{
									label: 'Foo',
									data: [[0, 29], [1, 21], [2, 13], [3, 29], [4, 25], [5, 22], [6, 14], [7, 12], [8, 1]],
									color: '#16a085',
									bars: { fillColor: '#16a085' }
								},
								{
									label: 'Baz',
									data: [[0, 21], [1, 11], [2, 6], [3, 13], [4, 9], [5, 5], [6, 20], [7, 23], [8, 27]],
									color: '#1abc9c',
									bars: { fillColor: '#1abc9c' }
								}
							],
							{
								series: {
									stack: 1,
									bars: { show: true, barWidth: 0.6, align: 'center' }
								},
								legend: { show: false },
								grid:{ show: true, borderWidth: 0, color: '#eeeeee', hoverable: true },
								tooltip: true,
								tooltipOpts: { content: 'X: %x.0, Y: %y.2',  defaultTheme: false, shifts: { x: 0, y: -40 } }
							}" style="height: 300px;width: 100%;">
						</div>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
    </div><!-- .row-->

    <div class="row">
	    <div class="col-md-12">
		    <div class="widget">
			    <header class="widget-header">
				    <h4 class="widget-title">New Users</h4>
			    </header>
			    <hr class="widget-separator"/>
			    <div class="widget-body">
				    <div class="table-responsive">							
					    <table class="table no-cellborder">
						    <thead>
							    <tr>
								    <th>Service Name</th>
								    <th>Customer Name</th>
								    <th>Priority</th>
								    <th>Total Cost</th>
								    <th>Current Stage</th>
								    <th>Delivery Date</th>
							    </tr>
						    </thead>
						    <tbody>
							    <tr>
								    <td class="text-info">Firm Website</td>
								    <td>John Doe</td>
								    <td>High</td>
								    <td>120$</td>
								    <td><span class="label label-info">Initiation</span></td>
								    <td>06/03/2016</td>
							    </tr>
							    <tr>
								    <td class="text-success">Security Test</td>
								    <td>Jane Doe</td>
								    <td>High</td>
								    <td>2500$</td>
								    <td><span class="label label-success">System Analysis</span></td>
								    <td>05/15/2016</td>
							    </tr>
							    <tr>
								    <td class="text-warning">Branches Linking</td>
								    <td>Diana Aid</td>
								    <td>Normal</td>
								    <td>1500$</td>
								    <td><span class="label label-warning">System Design</span></td>
								    <td>05/26/2016</td>
							    </tr>
							    <tr>
								    <td class="text-purple">Resources Optimization</td>
								    <td>Sara Adams</td>
								    <td>Low</td>
								    <td>1300$</td>
								    <td><span class="label label-purple">Specification</span></td>
								    <td>06/02/2016</td>
							    </tr>
							    <tr>
								    <td class="text-pink">Office Automation</td>
								    <td>Ibrahim Ali</td>
								    <td>Normal</td>
								    <td>7200$</td>
								    <td><span class="label label-pink">Implementation</span></td>
								    <td>06/13/2016</td>
							    </tr>
							    <tr>
								    <td class="text-danger">System Recovery</td>
								    <td>Smith Adams</td>
								    <td>Normal</td>
								    <td>1000$</td>
								    <td><span class="label label-danger">Maintenance</span></td>
								    <td>06/02/2016</td>
							    </tr>
						    </tbody>
					    </table>
				    </div>
			    </div>
		    </div><!-- .widget -->
	    </div><!-- END column -->
    </div><!-- .row-->
	</section><!-- .app-content -->
</asp:Content>
