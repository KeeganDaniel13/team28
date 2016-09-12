<%@ Page Title="" Language="C#" MasterPageFile="~/Customs.Master" AutoEventWireup="true" CodeBehind="release.aspx.cs" Inherits="CiroWebsite.release" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style>
   .floated {
  float:right;
  margin-right:10px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div align="center"><h3>Respond To Your Release Request's</h3></div>
    <br />
    <section class="app-content">
        <div class="row" id="releases" runat="server">
               <div class="col-md-3 col-sm-6">
				<div class="widget">
					<header class="widget-header" align="center">
						<h4 class="widget-title">Release</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body text-center">
						<div class="big-icon m-b-md watermark"><i class="fa fa-5x fa-exclamation-circle"></i></div>
						<h4 class="m-b-md">John Snow</h4>
						<p class="text-muted m-b-lg">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat officiis aperiam incidunt.</p>
						<a href="#" class="btn p-v-xl btn-info btn-xs btn-outline">View Request</a>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
                           <div class="col-md-3 col-sm-6">
				<div class="widget">
					<header class="widget-header" align="center">
						<h4 class="widget-title">Release</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body text-center">
						<div class="big-icon m-b-md watermark"><i class="fa fa-5x fa-exclamation-circle"></i></div>
						<h4 class="m-b-md">John Snow</h4>
						<p class="text-muted m-b-lg">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat officiis aperiam incidunt.</p>
						<a href="#" class="btn p-v-xl btn-info btn-xs btn-outline">View Request</a>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
            </div>
        </section>
</asp:Content>
