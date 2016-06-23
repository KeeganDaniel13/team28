<%@ Page Title="Relationships" Language="C#" MasterPageFile="~/warehousemanager.Master" AutoEventWireup="true" CodeBehind="relationships.aspx.cs" Inherits="Project.relationships" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header row">
		<h1>
			
			<small>
				Relationships &amp; Clients  
			</small>
		</h1>
        <div class="row" style="float: right">
           
             <button class="btn btn-white  btn-bold">
		<i class="ace-icon fa  fa-arrow-circle-o-down bigger-120 "></i>
		Import Relationships
	</button>
            <button class="btn btn-white  btn-bold">
		<i class="ace-icon fa  fa-arrow-circle-o-down bigger-120 "></i>
		Export Relationships
	</button>
					</div>
        
	</div><!-- /.page-header -->

   <div >
										<div class="widget-box transparent">
											<div class="widget-header">
											

												<div class="widget-toolbar no-border">
													<ul class="nav nav-tabs" id="myTab2">
														<li class="active">
															<a data-toggle="tab" href="#home2">Show Active</a>
														</li>

														<li>
															<a data-toggle="tab" href="#profile2">Show All</a>
														</li>

														<li>
															<a data-toggle="tab" href="#info2">Add Filter</a>
														</li>
													</ul>
												</div>
											</div>

											<div class="widget-body">
												<div class="widget-main padding-12 no-padding-left no-padding-right">
													<div class="tab-content padding-4">
														<div id="home2" class="tab-pane in active">
															<div class="scrollable-horizontal" data-size="800">
																<b>Horizontal Scroll</b>
																table 1
															</div>
														</div>

														<div id="profile2" class="tab-pane">
															<div class="scrollable" data-size="100" data-position="left">
																<b>Scroll on Left</b>
																table 2
															</div>
														</div>

														<div id="info2" class="tab-pane">
															<div class="scrollable" data-size="100">
																<b>Scroll # 3</b>
																table 3
															</div>
														</div>
													</div>
												</div>
									</div>
								</div><!-- PAGE CONTENT ENDS -->
    
</asp:Content>
