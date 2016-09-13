<%@ Page Title="Ciro" Language="C#" MasterPageFile="~/Customs.Master" AutoEventWireup="true" CodeBehind="warehouseview.aspx.cs" Inherits="CiroWebsite.warehouseview" %>
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
					<h4 class="m-0 m-t-xs">R120 - R250</h4>
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
										</div>B
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
