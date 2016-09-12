<%@ Page Title="Product Log | Ciro" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="productlog.aspx.cs" Inherits="CiroWebsite.productlog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link rel="stylesheet" href="infinity/css/style.css"/> <!-- Resource style -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="page-header">
        <h1 id="timeline">Package Log</h1>
    </div>
			<div class="col-md-8">
	<ul class="timeline" runat="server" id="logList">
        <li>oidhgiosdhgoishdgrd iesohfishbfisdhgiosdgihsdvbds giodshgijsgb sj<br /> </li>
        <li>oidhgiosdhgoishdgrd iesohfishbfisdhgiosdgihsdvbds giodshgijsgb sj<br /> </li>
        <li>oidhgiosdhgoishdgrd iesohfishbfisdhgiosdgihsdvbds giodshgijsgb sj<br /> </li>
        <li>oidhgiosdhgoishdgrd iesohfishbfisdhgiosdgihsdvbds giodshgijsgb sj<br /> </li>

    </ul>
</div><!-- END column -->

			<div class="col-md-4">

					<div class="col-md-12 col-sm-6">
						<div class="list-group">
								<a href="#" class="list-group-item active">
									<h4 class="list-group-item-heading">Package Details</h4>
								</a>
								<div  class="list-group-item">
									<h4 class="list-group-item-heading">Package Information</h4>
									<p runat="server" id="detailsInfo"></p>
								</div>
							</div>
						</div><!-- .widget -->
					</div><!-- END column -->
                </div>
              
       
</asp:Content>
