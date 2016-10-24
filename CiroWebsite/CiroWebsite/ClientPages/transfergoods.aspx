<%@ Page Title="Transfer Goods | Ciro" Language="C#" MasterPageFile="Client.Master" AutoEventWireup="true" CodeBehind="transfergoods.aspx.cs" Inherits="CiroWebsite.transfergoods" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="../infinity/css/inventory.css">
    <style>
        .wizard {
    margin: 20px auto;
    background: #fff;
}

    .wizard .nav-tabs {
        position: relative;
        margin: 40px auto;
        margin-bottom: 0;
        border-bottom-color: #e0e0e0;
    }

    .wizard > div.wizard-inner {
        position: relative;
    }

.connecting-line {
    height: 2px;
    background: #e0e0e0;
    position: absolute;
    width: 80%;
    margin: 0 auto;
    left: 0;
    right: 0;
    top: 50%;
    z-index: 1;
}

.wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
    color: #555555;
    cursor: default;
    border: 0;
    border-bottom-color: transparent;
}

span.round-tab {
    width: 70px;
    height: 70px;
    line-height: 70px;
    display: inline-block;
    border-radius: 100px;
    background: #fff;
    border: 2px solid #e0e0e0;
    z-index: 2;
    position: absolute;
    left: 0;
    text-align: center;
    font-size: 25px;
}
span.round-tab i{
    color:#555555;
}
.wizard li.active span.round-tab {
    background: #fff;
    border: 2px solid #5bc0de;
    
}
.wizard li.active span.round-tab i{
    color: #5bc0de;
}

span.round-tab:hover {
    color: #333;
    border: 2px solid #333;
}

.wizard .nav-tabs > li {
    width: 25%;
}

.wizard li:after {
    content: " ";
    position: absolute;
    left: 46%;
    opacity: 0;
    margin: 0 auto;
    bottom: 0px;
    border: 5px solid transparent;
    border-bottom-color: #5bc0de;
    transition: 0.1s ease-in-out;
}

.wizard li.active:after {
    content: " ";
    position: absolute;
    left: 46%;
    opacity: 1;
    margin: 0 auto;
    bottom: 0px;
    border: 10px solid transparent;
    border-bottom-color: #5bc0de;
}

.wizard .nav-tabs > li a {
    width: 70px;
    height: 70px;
    margin: 20px auto;
    border-radius: 100%;
    padding: 0;
}
.table
{
    border: 1px solid #ccc;
    border-collapse: collapse;
    width: 200px;
    margin: 10px;
  
}
.table th
{
    background-color: #F7F7F7;
    color: #333;
    font-weight: bold;

}
.table th, .table td
{
    padding: 5px;
    border: 1px solid #ccc;
}
.wizard .nav-tabs > li a:hover {
    background: transparent;
}

.wizard .tab-pane {
    position: relative;
    padding-top: 50px;
}

.wizard h3 {
    margin-top: 0;
}

@media( max-width : 585px ) {

    .wizard {
        width: 90%;
        height: auto !important;
    }

    span.round-tab {
        font-size: 16px;
        width: 50px;
        height: 50px;
        line-height: 50px;
    }

    .wizard .nav-tabs > li a {
        width: 50px;
        height: 50px;
        line-height: 50px;
    }

    .wizard li.active:after {
        content: " ";
        position: absolute;
        left: 35%;
    }
}
 .form-inline > * {
   margin:20px 50px;
}
 .success-alert{
    display: none;
}
    </style>
    <script>
        $(document).ready(function () {
            $('#btnsuccess').click(function () {
                $('.success-alert').show()
            })
        });
        $(document).ready(function () {
            //Initialize tooltips
            $('.nav-tabs > li a[title]').tooltip();

            //Wizard
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

                var $target = $(e.target);

                if ($target.parent().hasClass('disabled')) {
                    return false;
                }
            });

            $(".next-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                $active.next().removeClass('disabled');
                nextTab($active);

            });
            $(".prev-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                prevTab($active);

            });
        });

        function nextTab(elem) {
            $(elem).next().find('a[data-toggle="tab"]').click();
        }
        function prevTab(elem) {
            $(elem).prev().find('a[data-toggle="tab"]').click();
        }
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
	<section>
    <div class="wizard">
        <div class="wizard-inner">
            <div class="connecting-line"></div>
            <ul class="nav nav-tabs" role="tablist">

                <li role="presentation" class="active">
                    <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
                        <span class="round-tab">
                            <i class="fa fa-map-marker "></i>
                        </span>
                    </a>
                </li>

                <li role="presentation" class="disabled">
                    <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                        <span class="round-tab">
                            <i class="fa fa-plus"></i>
                        </span>
                    </a>
                </li>
                <li role="presentation" class="disabled">
                    <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                        <span class="round-tab">
                            <i class="fa fa-check-circle-o"></i>
                        </span>
                    </a>
                </li>

                <li role="presentation" class="disabled">
                    <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                        <span class="round-tab">
                            <i class="fa fa-check-circle-o"></i>
                        </span>
                    </a>
                </li>
            </ul>
        </div>

        <form role="form">
            <div class="tab-content">
                <div class="tab-pane active" role="tabpanel" id="step1">
                    <h3>Select A Warehouse</h3>
                   
                <table>
               <%listwarehouse(); %>
               </table>
  	
                    <ul class="list-inline pull-right">
                        <li><a type="button" class="btn btn-primary next-step">Save and continue</a></li>
                    </ul>
                </div>
                <div class="tab-pane" role="tabpanel" id="step3">
            
    <div class="col-sm-12 col-md-12">
	    <div class="panel panel-primary panel-custom inventory">
		    <div class="panel-heading">
			    <h4 class="panel-title">Confirm Transfer</h4>
		    </div>
		    <div class="panel-body">
			     <table id="acrylic" width="100%">
            <thead>
                <tr>
                    <th>Package Name</th>
			        <th>Unit(s)</th>
			        <th>Location</th> 
			        <th>Destination</th>
                    <th>Transfer Date</th>
                    
                </tr>
            </thead>
            <tbody id="transferProducts" runat="server"> 
                <%displayTransferComplete(); %>
            </tbody>
        </table>
		    </div>
	    </div>
    </div><!-- END column -->
                    <form>
			<div class="form-group">
                <label for="changeReason">Reason for Transfer</label>
               <textarea name="control-demo-5" runat="server" id="changeReason" class="form-control" cols="30" rows="2" style="width: 300px;"></textarea>
                </div>
		</form>
                    <ul class="list-inline pull-right">
                        <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                        <li><button  type="button" runat="server" onserverclick="saveInfo" class="btn btn-primary next-step">Save and continue</button></li>
                    </ul>
                </div>
                <div class="tab-pane" role="tabpanel" id="step2">
                    <h3>Add Items To Transfer</h3>

                    <div class="col-sm-12 col-md-12">
	    <div class="panel panel-primary panel-custom inventory">
		    <div class="panel-heading">
               
			    <h4 class="panel-title">Warehouse Transfer</h4>
                <!--Modal to add the items to onserverclick="bingo(model)" <a href="#" data-toggle="modal" data-target="#composeModal"> transferlist-->
                <a href="#" data-toggle="modal" data-target="#composeModal" type="button" class="pull-right"><i class="fa fa-plus "></i></a>
               
		    </div>
		    <div class="panel-body">
			     <table id="acrylic" width="100%">
            <thead>
                <tr>
                    <th>Package Name</th>
			        <th>Unit(s)</th>
			        <th>Current Location</th> 
			        <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>

                 <!--<tr>
                    <td>Carolina Biggleswade</td>
                    <td>23</td>
                    <td>65</td>
                    <td>Jockey</td>
                    <td>
                        <div class="row">
                        <button type="button" class="btn rounded btn-sm btn-danger">Release</button>
                         <button type="button" class="btn  btn-sm btn-success">Transfer</button>
                            </div>
                    </td> 
                </tr>-->
                 <%displayTransferList(); %>
            </tbody>
        </table>
		    </div>
	    </div>
    </div><!-- END column -->

        <ul class="list-inline pull-right">
            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
            <li><button type="button" class="btn btn-primary btn-info-full next-step">Save and continue</button></li>
        </ul>
        </div>
        <div class="tab-pane" role="tabpanel" id="complete">
            <div class="alert alert-success" role="alert">
								<strong>Success! </strong>
								<span>You successfully submitted your warehouse transfer request.</span>
								<a href="#" class="alert-link">view transfer</a>
							</div>
        </div>
        <div class="clearfix"></div>
            </div>
        </form>
    </div>
</section>
</div>

    <!-- Compose modal -->
<div class="modal fade" id="composeModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Select Product</h4>
			</div>
			<div class="modal-body">
				<table class="table table-hover">
                <tr>
                  <th>Select</th>
                  <th style="width: 10px">#</th>
                  <th>Name</th>
                   <th>Location</th>
                  <th>Value</th>
                </tr>  
                   <%listPackages(); %>   
              </table>                                
                <br/>
               <!-- <a href="#" onclick="saveWarehouse(name)" type="button" class="btn btn-primary">Accept</a>                -->
                <br/>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

    <!-- Modal -->
            <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="text-danger fa fa-times"></i></button>
                    <h4 class="modal-title" id="myModalLabel"><i class="text-muted fa fa-shopping-cart"></i>Select Package</h4>
                  </div>
                  <div class="modal-body">
                    <table class="table table-hover">
                    <tr>
                      <th>Select</th>
                      <th style="width: 10px">#</th>
                      <th>Name</th>
                       <th>Location</th>
                      <th>Value</th>
                    </tr>  
                       <!--  ListPackages(); -->
                  </table>                                
                    <br/>
                   <!-- <a href="#" onclick="saveWarehouse(name)" type="button" class="btn btn-primary">Accept</a>                -->
                    <br/>

                  <div class="modal-footer">       
                      
                    <div class="text-right pull-right col-md-3">
                        Package Selected: <br/> 
                        <span class="h3 text-muted"><strong>(Name of package)</strong></span></span> 
                    </div>
                  
                </div>
              </div>
            </div>
            </div>
<!-- fim Modal-->

 
   <script>function bingo(id) {
    $(id).modal('show');
}</script>
</asp:Content>
