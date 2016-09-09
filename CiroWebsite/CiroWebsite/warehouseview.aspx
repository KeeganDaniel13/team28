<%@ Page Title="Ciro" Language="C#" MasterPageFile="~/warehouse.Master" AutoEventWireup="true" CodeBehind="warehouseview.aspx.cs" Inherits="CiroWebsite.warehouseview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="profile-header">
	<div class="profile-cover">
		<div class="cover-user m-b-lg">
			<div>
				<span class="cover-icon"><i class="fa fa-star-half-o"></i></span>
			</div>
			<div>
				<div class="avatar avatar-xl avatar-circle">
					<a href="javascript:void(0)">
						<img class="img-responsive" src="../infinity/assets/images/warehouse.jpg" alt="avatar"/>
					</a>
				</div><!-- .avatar -->
			</div>
			<div>
				<span class="cover-icon"><i class="fa fa-envelope-o"></i></span>
			</div>
		</div>
		<div class="text-center">
			<h2 class="profile-info-name m-b-lg"><a href="javascript:void(0)" runat="server" id="name" class="title-color"></a></h2>
			<div>
				<a href="javascript:void(0)" id="type" runat="server" class="m-r-xl theme-color"><i class="fa fa-bolt m-r-xs"></i></a>
				<a href="javascript:void(0)" id="loaction" runat="server" class="theme-color"><i class="fa fa-map-marker m-r-xs"></i></a>
			</div>
		</div>
	</div><!-- .profile-cover -->
    <div class="promo-footer">
		<div class="row no-gutter">
			<div class="col-sm-2 col-sm-offset-3 col-xs-6 promo-tab">
				<div class="text-center">
					<small>Maximum Warehouse Size</small>
					<h4 class="m-0 m-t-xs">+2 years</h4>
				</div>
			</div>
			<div class="col-sm-2 col-xs-6 promo-tab">
				<div class="text-center">
					<small>Warehouse Monthly Rates</small>
					<h4 class="m-0 m-t-xs">12$ - 25$</h4>
				</div>
			</div>
			<div class="col-sm-2 col-xs-12 promo-tab">
				<div class="text-center">
					<small>Reviews</small>
					<div class="m-t-xs">
						<i class="text-primary fa fa-star"></i>
						<i class="text-primary fa fa-star"></i>
						<i class="text-primary fa fa-star"></i>
						<i class="text-primary fa fa-star"></i>
						<i class="text-primary fa fa-star-o"></i>
					</div>
				</div>
			</div>
		</div>
	</div><!-- .promo-footer -->
    <br/>
</div><!-- .profile-header -->
    <div class="row">
			<div class="col-md-8">
				<div id="profile-tabs" class="nav-tabs-horizontal white m-b-lg">
					<!-- tabs list -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#profile-stream" aria-controls="stream" role="tab" data-toggle="tab">Stream</a></li>
						<li role="presentation"><a href="#profile-friends" aria-controls="friends" role="tab" data-toggle="tab">Employees</a></li>
					</ul><!-- .nav-tabs -->

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane in active fade" id="profile-stream">
							<div class="media stream-post">
								<div class="media-left">
									<div class="avatar avatar-lg avatar-circle">
										<img src="../infinity/assets/images/221.jpg" alt="">
									</div>
								</div>
								<div class="media-body">
									<h4 class="media-heading m-t-xs">
										<a href="javascript:void(0)">John Doe</a>
										<small class="text-muted">posted an update</small>
									</h4>
									<small class="media-meta">Active 14 minute ago</small>
									<div class="stream-body m-t-xl">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae neque incidunt cumque, dolore eveniet porro asperiores itaque! Eligendi minus cupiditate molestiae praesentium, facilis, neque saepe, soluta sapiente aliquid modi sunt.</p>
									</div>
								</div>
							</div><!-- .stream-post -->

							<div class="media stream-post">
								<div class="media-left">
									<div class="avatar avatar-lg avatar-circle">
										<img src="../infinity/assets/images/101.jpg" alt="">
									</div>
								</div>
								<div class="media-body">
									<h4 class="media-heading m-t-xs">
										<a href="javascript:void(0)">Adam Khaury</a>
										<small class="text-muted">posted an update</small>
									</h4>
									<small class="media-meta">Active 25 minutes ago</small>
									<div class="stream-body m-t-xl">
										<a href="../assets/images/original/102.jpg" data-lightbox="feed-img-1">
											<img class="stream-img" src="../infinity/assets/images/102.jpg" alt="">
										</a>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae neque incidunt cumque, dolore eveniet porro asperiores itaque! Eligendi minus cupiditate molestiae praesentium, facilis, neque saepe, soluta sapiente aliquid modi sunt.</p>
									</div>
								</div>
							</div><!-- .stream-post -->

							<div class="media stream-post">
								<div class="media-left">
									<div class="avatar avatar-lg avatar-circle">
										<img src="../infinity/assets/images/204.jpg" alt="">
									</div>
								</div>
								<div class="media-body">
									<h4 class="media-heading m-t-xs">
										<a href="javascript:void(0)">Dani Smith</a>
										<small class="text-muted">has birthday</small>
									</h4>
									<small class="media-meta">Active now</small>
									<div class="stream-body m-t-xl">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae neque incidunt cumque, dolore eveniet porro asperiores itaque! Eligendi minus cupiditate molestiae praesentium, facilis, neque saepe, soluta sapiente aliquid modi sunt.</p>
									</div>
								</div>
							</div><!-- .stream-post -->
						</div><!-- .tab-pane -->

						<div role="tabpanel" class="tab-pane fade p-md" id="profile-friends">
							<div class="row">
								<div class="col-md-6 col-sm-6">
									<div class="user-card">
										<div class="media">
											<div class="media-left">
												<div class="avatar avatar-lg avatar-circle">
													<a href="javascript:void(0)"><img src="../infinity/assets/images/221.jpg" alt=""></a>
													<i class="status status-online"></i>
												</div>
											</div>
											<div class="media-body">
												<h5 class="media-heading"><a href="javascript:void(0)" class="title-color">John Doe</a></h5>
												<small class="media-meta">Web Developer</small>
											</div>
										</div>
									</div><!-- search-result -->
								</div><!-- END column -->

								<div class="col-md-6 col-sm-6">
									<div class="user-card">
										<div class="media">
											<div class="media-left">
												<div class="avatar avatar-lg avatar-circle">
													<a href="javascript:void(0)"><img src="../infinity/assets/images/210.jpg" alt=""></a>
													<i class="status status-offline"></i>
												</div>
											</div>
											<div class="media-body">
												<h5 class="media-heading"><a href="javascript:void(0)" class="title-color">Ibraham Said</a></h5>
												<small class="media-meta">Web Designer</small>
											</div>
										</div>
									</div><!-- search-result -->
								</div><!-- END column -->

								<div class="col-md-6 col-sm-6">
									<div class="user-card">
										<div class="media">
											<div class="media-left">
												<div class="avatar avatar-lg avatar-circle">
													<a href="javascript:void(0)"><img src="../infinity/assets/images/211.jpg" alt=""></a>
													<i class="status status-away"></i>
												</div>
											</div>
											<div class="media-body">
												<h5 class="media-heading"><a href="javascript:void(0)" class="title-color">Sally Adams</a></h5>
												<small class="media-meta">Graphical Designer</small>
											</div>
										</div>
									</div><!-- search-result -->
								</div><!-- END column -->

								<div class="col-md-6 col-sm-6">
									<div class="user-card">
										<div class="media">
											<div class="media-left">
												<div class="avatar avatar-lg avatar-circle">
													<a href="javascript:void(0)"><img src="../infinity/assets/images/212.jpg" alt=""></a>
													<i class="status status-offline"></i>
												</div>
											</div>
											<div class="media-body">
												<h5 class="media-heading"><a href="javascript:void(0)" class="title-color">Jeffery Way</a></h5>
												<small class="media-meta">Software Engineer</small>
											</div>
										</div>
									</div><!-- search-result -->
								</div><!-- END column -->

								<div class="col-md-6 col-sm-6">
									<div class="user-card">
										<div class="media">
											<div class="media-left">
												<div class="avatar avatar-lg avatar-circle">
													<a href="javascript:void(0)"><img src="../infinity/assets/images/213.jpg" alt=""></a>
													<i class="status status-away"></i>
												</div>
											</div>
											<div class="media-body">
												<h5 class="media-heading"><a href="javascript:void(0)" class="title-color">Adam Smith</a></h5>
												<small class="media-meta">UI Designer</small>
											</div>
										</div>
									</div><!-- search-result -->
								</div><!-- END column -->

								<div class="col-md-6 col-sm-6">
									<div class="user-card">
										<div class="media">
											<div class="media-left">
												<div class="avatar avatar-lg avatar-circle">
													<a href="javascript:void(0)"><img src="../infinity/assets/images/214.jpg" alt=""></a>
													<i class="status status-online"></i>
												</div>
											</div>
											<div class="media-body">
												<h5 class="media-heading"><a href="javascript:void(0)" class="title-color">Sandy Matt</a></h5>
												<small class="media-meta">Lawyer</small>
											</div>
										</div>
									</div><!-- search-result -->
								</div><!-- END column -->

								<div class="col-md-6 col-sm-6">
									<div class="user-card">
										<div class="media">
											<div class="media-left">
												<div class="avatar avatar-lg avatar-circle">
													<a href="javascript:void(0)"><img src="../infinity/assets/images/217.jpg" alt=""></a>
													<i class="status status-offline"></i>
												</div>
											</div>
											<div class="media-body">
												<h5 class="media-heading"><a href="javascript:void(0)" class="title-color">Sara Adams</a></h5>
												<small class="media-meta">Actress</small>
											</div>
										</div>
									</div><!-- search-result -->
								</div><!-- END column -->

								<div class="col-md-6 col-sm-6">
									<div class="user-card">
										<div class="media">
											<div class="media-left">
												<div class="avatar avatar-lg avatar-circle">
													<a href="javascript:void(0)"><img src="../infinity/assets/images/218.jpg" alt=""></a>
													<i class="status status-offline"></i>
												</div>
											</div>
											<div class="media-body">
												<h5 class="media-heading"><a href="javascript:void(0)" class="title-color">John Doe</a></h5>
												<small class="media-meta">Factional Character</small>
											</div>
										</div>
									</div><!-- search-result -->
								</div><!-- END column -->
							</div><!-- .row -->
						</div><!-- .tab-pane -->
					</div><!-- .tab-content -->
				</div><!-- #profile-components -->
			</div><!-- END column -->

        <div class="col-md-4">
				<div class="row">
					<div class="col-md-12 col-sm-6">
						<div class="widget who-to-follow-widget">
							<div class="widget-header p-h-lg p-v-md">
								<h4 class="widget-title">Other Warehouses</h4>
							</div>
							<hr class="widget-separator m-0">
							<div class="media-group">
								<div class="media-group-item b-0 p-h-sm">
									<div class="media">
										<div class="media-left">
											<div class="avatar avatar-md avatar-circle">
												<img src="../infinity/assets/images/warehouse.jpg" alt="">
												<i class="status status-online"></i>
											</div>
										</div>
										<div class="media-body">
											<h5 class="media-heading"><a href="javascript:void(0)">Mpumalanga Ridge</a></h5>
											<small class="media-meta">Storage Manufacturer Warehouse</small>
                                            <button type="button" class="btn btn-outline mw-md rounded btn-primary btn-xs">View Warehouse</button>
										</div>
									</div>
								</div><!-- .media-group-item -->

								<div class="media-group-item b-0 p-h-sm">
									<div class="media">
										<div class="media-left">
											<div class="avatar avatar-md avatar-circle">
												<img src="../infinity/assets/images/warehouse.jpg" alt="">
												<i class="status status-offline"></i>
											</div>
										</div>
										<div class="media-body">
											<h5 class="media-heading"><a href="javascript:void(0)">Maseru Bridge</a></h5>
											<small class="media-meta">Special Storage Warehouse</small>
                                            <button type="button" class="btn btn-outline mw-md rounded btn-primary btn-xs">View Warehouse</button>
										</div>
									</div>
								</div><!-- .media-group-item -->

								<div class="media-group-item b-0 p-h-sm">
									<div class="media">
										<div class="media-left">
											<div class="avatar avatar-md avatar-circle">
												<img src="../infinity/assets/images/warehouse.jpg" alt="">
												<i class="status status-offline"></i>
											</div>
										</div>
										<div class="media-body">
											<h5 class="media-heading"><a href="javascript:void(0)">Jekskie Bush Ridge</a></h5>
											<small class="media-meta">Storage Warehouse</small>
                                            <button type="button" class="btn btn-outline mw-md rounded btn-primary btn-xs">View Warehouse</button>
										</div>
									</div>
								</div><!-- .media-group-item -->
							</div>
						</div><!-- .widget -->
					</div><!-- END column -->
            </div>

</asp:Content>
