<%@ Page Title="" Language="C#" MasterPageFile="~/ciro.Master" AutoEventWireup="true" CodeBehind="transfers.aspx.cs" Inherits="CiroWebsite.transfers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
   .floated {
  float:right;
  margin-right:10px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center"><h3>Respond To Your Transfer Requests</h3></div>

    <div class="row">
        <div class="table-responsive">
					<table class="table mail-list">
						<tr>
							<td>
								<!-- a single mail -->
								<div class="mail-item">
									<table class="mail-container">
										<tr>
											<td class="mail-left">
												<div class="avatar avatar-lg avatar-circle">
													<a href="#"><img src="../infinity/assets/images/208.jpg" alt="sender photo"></a>
												</div>
											</td>
											<td class="mail-center">
												<div class="mail-item-header">
													<h4 class="mail-item-title"><a href="mail-view.html" class="title-color">John Doe</a></h4>
													<a href="#"><span class="label label-warning">Transfer</span></a>
												</div>
												<p class="mail-item-excerpt">Welcome To your dashboard. here you can manage and coordinate any activities</p>
											</td>
											<td class="mail-right">
												<p class="mail-item-date">2 hours ago</p>
                                                
												<div class="floated"><button type="submit" class="btn btn-success btn-outline btn-xs ">Approve</button></div>
                                                <div class="floated"><button type="submit" class="btn btn-danger btn-outline btn-xs ">Reject</button></div>
                                             
											</td>
										</tr>
									</table>
								</div><!-- END mail-item -->

								<!-- a single mail -->
								<div class="mail-item">
									<table class="mail-container">
										<tr>
											<td class="mail-left">
												<div class="avatar avatar-lg avatar-circle">
													<a href="#"><img src="../infinity/assets/images/209.jpg" alt="sender photo"></a>
												</div>
											</td>
											<td class="mail-center">
												<div class="mail-item-header">
													<h4 class="mail-item-title"><a href="mail-view.html" class="title-color">Sam Smith</a></h4>
													<a href="#"><span class="label label-warning">Transfer</span></a>
												</div>
												<p class="mail-item-excerpt">A login activity detected from unusual location. please check this mail</p>
											</td>
											<td class="mail-right">
												<p class="mail-item-date">1 minute ago</p>
												<div class="floated"><button type="submit" class="btn btn-success btn-outline btn-xs ">Approve</button></div>
                                                <div class="floated"><button type="submit" class="btn btn-danger btn-outline btn-xs ">Reject</button></div>
                                             
											</td>
										</tr>
									</table>
								</div><!-- END mail-item -->
                                <!-- a single mail -->
								<div class="mail-item">
									<table class="mail-container">
										<tr>
											<td class="mail-left">
												<div class="avatar avatar-lg avatar-circle">
													<a href="#"><img src="../infinity/assets/images/209.jpg" alt="sender photo"></a>
												</div>
											</td>
											<td class="mail-center">
												<div class="mail-item-header">
													<h4 class="mail-item-title"><a href="mail-view.html" class="title-color">Aluna George</a></h4>
													<a href="#"><span class="label label-warning">Transfer</span></a>
												</div>
												<p class="mail-item-excerpt">A login activity detected from unusual location. please check this mail</p>
											</td>
											<td class="mail-right">
												<p class="mail-item-date">1 minute ago</p>
												<div class="floated"><button type="submit" class="btn btn-success btn-outline btn-xs ">Approve</button></div>
                                                <div class="floated"><button type="submit" class="btn btn-danger btn-outline btn-xs ">Reject</button></div>
                                             
											</td>
										</tr>
									</table>
								</div><!-- END mail-item -->
                                <!-- a single mail -->
								<div class="mail-item">
									<table class="mail-container">
										<tr>
											<td class="mail-left">
												<div class="avatar avatar-lg avatar-circle">
													<a href="#"><img src="../infinity/assets/images/209.jpg" alt="sender photo"></a>
												</div>
											</td>
											<td class="mail-center">
												<div class="mail-item-header">
													<h4 class="mail-item-title"><a href="mail-view.html" class="title-color">Damine Marley</a></h4>
													<a href="#"><span class="label label-warning">Transfer</span></a>
												</div>
												<p class="mail-item-excerpt">A login activity detected from unusual location. please check this mail</p>
											</td>
											<td class="mail-right">
												<p class="mail-item-date">1 minute ago</p>
												<div class="floated"><button type="submit" class="btn btn-success btn-outline btn-xs ">Approve</button></div>
                                                <div class="floated"><button type="submit" class="btn btn-danger btn-outline btn-xs ">Reject</button></div>
                                             
											</td>
										</tr>
									</table>
								</div><!-- END mail-item -->
								<!-- a single mail -->
								<div class="mail-item">
									<table class="mail-container">
										<tr>
											<td class="mail-left">
												<div class="avatar avatar-lg avatar-circle">
													<a href="#"><img src="../infinity/assets/images/210.jpg" alt="sender photo"></a>
												</div>
											</td>
											<td class="mail-center">
												<div class="mail-item-header">
													<h4 class="mail-item-title"><a href="mail-view.html" class="title-color">Joey Ocean</a></h4>
													<a href="#"><span class="label label-warning">Transfer</span></a>
												</div>
												<p class="mail-item-excerpt">Lorem ipsum. ipsum dolor sit amet, consectetur adipisicing elit. Eveniet, accusamus</p>
											</td>
											<td class="mail-right">
												<p class="mail-item-date">2 hours ago</p>
												<div class="floated"><button type="submit" class="btn btn-success btn-outline btn-xs ">Approve</button></div>
                                                <div class="floated"><button type="submit" class="btn btn-danger btn-outline btn-xs ">Reject</button></div>
                                             
											</td>
										</tr>
									</table>
								</div><!-- END mail-item -->

								
							</td>
						</tr>
					</table>
				</div>
			</div><!-- END column -->
</asp:Content>
