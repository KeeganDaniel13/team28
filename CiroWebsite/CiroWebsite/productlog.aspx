<%@ Page Title="Product Log | Ciro" Language="C#" MasterPageFile="~/ciro.Master" AutoEventWireup="true" CodeBehind="productlog.aspx.cs" Inherits="CiroWebsite.productlog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link rel="stylesheet" href="infinity/css/style.css"/> <!-- Resource style -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
   <div class="page-header">
        <h1 id="timeline">Package Log</h1>
    </div>
			<div class="col-md-8 ">
              
			<ul class="timeline scrollable-container">
        <li>
          <div class="timeline-badge"><i class="fa fa-check"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
              <p><small class="text-muted"><i class="fa fa-time"></i> 11 hours ago via Twitter</small></p>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis. </p>
            </div>
          </div>
        </li>
        <li class="timeline-inverted">
          <div class="timeline-badge warning"><i class="fa fa-credit-card"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá </p>
            </div>
          </div>
        </li>
        <li>
          <div class="timeline-badge danger"><i class="fa fa-credit-card"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. </p>
            </div>
          </div>
        </li>
        <li class="timeline-inverted">
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. </p>
            </div>
          </div>
        </li>
        <li>
          <div class="timeline-badge info"><i class="fa fa-floppy-disk"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. </p>
              <hr>
              <div class="btn-group">
                <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-cog"></i> <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li><a href="#">Separated link</a></li>
                </ul>
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis..</p>
            </div>
          </div>
        </li>
        <li class="timeline-inverted">
          <div class="timeline-badge success"><i class="fa fa-thumbs-up"></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title">Mussum ipsum cacilds</h4>
            </div>
            <div class="timeline-body">
              <p>Mussum ipsum cacilds, vidis litro abertis.</p>
            </div>
          </div>
        </li>
    </ul>
                    </div>
			</div><!-- END column -->

			<div class="col-md-4">

					<div class="col-md-12 col-sm-6">
						<div class="list-group">
								<a href="#" class="list-group-item active">
									<h4 class="list-group-item-heading">Package Details</h4>
									
								</a>
								<a href="#" class="list-group-item">
									<h4 class="list-group-item-heading">Package Information</h4>
									<p>Here are just some of the fantastic reviews that we are very humbled to say our app</p>
								</a>
								<a href="#" class="list-group-item">
									<h4 class="list-group-item-heading">Report(s) On Package</h4>
									<p>Here are just some of the fantastic reviews that we are very humbled to say our app</p>
								</a>
							</div>
						</div><!-- .widget -->
					</div><!-- END column -->

</asp:Content>
