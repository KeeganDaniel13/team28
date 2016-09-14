<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="AdminReports.aspx.cs" Inherits="CiroWebsite.AdminReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-primary"><span class="counter" data-plugin="counterUp">R <%getOutstanding(); %></span></h3>
							<small class="text-color">Outstanding Tax on Imports</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-paperclip"></i></span>
					</div>
					<footer class="widget-footer bg-primary">
						<small>in Rands</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[4,3,5,2,1], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget -->
			</div><%getAverageTax(); %>
			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-primary"><span class="counter" data-plugin="counterUp">R <%getVAT();%></span></h3>
							<small class="text-color">Average VAT Charged on Goods</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-paperclip"></i></span>
					</div>
					<footer class="widget-footer bg-primary">
						<small>in Rands</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[4,3,5,2,1], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget --></div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-primary"><span class="counter" data-plugin="counterUp">R <%getPenalty();%></span></h3>
							<small class="text-color">Average Penalties Charged on Goods</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-paperclip"></i></span>
					</div>
					<footer class="widget-footer bg-primary">
						<small>in Rands</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[4,3,5,2,1], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget --></div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-primary"><span class="counter" data-plugin="counterUp">R <%getTotal();%></span></h3>
							<small class="text-color">Average Total Charged on Goods</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-paperclip"></i></span>
					</div>
					<footer class="widget-footer bg-primary">
						<small>in Rands</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[4,3,5,2,1], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget --></div>
			</div>
</asp:Content>
