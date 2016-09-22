<%@ Page Title="Transfer Goods | Ciro" Language="C#" MasterPageFile="Client.Master" AutoEventWireup="true" CodeBehind="transfergoods.aspx.cs" Inherits="CiroWebsite.transfergoods" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
<h2>Transfer Manager</h2>
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
                            <i class="fa fa-exchange"></i>
                        </span>
                    </a>
                </li>
                <li role="presentation" class="disabled">
                    <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                        <span class="round-tab">
                            <i class="glyphicon glyphicon-pencil"></i>
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
                    <h3>Transfer Ownership Document</h3>
                    <p>If you wish to transfer your ownership to another partner complete the following</p>
                <table>
               <%listwarehouse(); %>
               </table>
  	
                    <ul class="list-inline pull-right">
                        <li><a type="button" class="btn btn-primary next-step">Save and continue</a></li>
                    </ul>
                </div>
                <div class="tab-pane" role="tabpanel" id="step2">
                    <h3>Single Adminstrative Document</h3>
                    <p>To be completed for transfer process</p>
                    <div class="alert alert-warning alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<strong>Warning! </strong>
						<span>Better check yourself, you're not looking too good.</span>
					</div>
                    <form class="form-inline">
                        <div class="form-inline" >
						<div class="form-group ">
							<label  for="exampleInputEmail3">Container</label><br />
							<input runat="server" type="text" class="form-control" id="goodsContainer" placeholder="Enter Container 0 or 1" style="width: 300px;">
						</div>
						<div class="form-group ">
							<label  for="exampleInputPassword3">Origin</label><br />
							<input runat="server"  type="text" class="form-control" id="origincountry" placeholder="Country Of Orgin" style="width: 400px;">
						</div>
						</div>
                        <div class="form-inline" >
						<div class="form-group">
							<label  for="exampleInputEmail3">Mode Of Transport</label><br/>
							
							<select class="form-control" runat="server" id="transport" style="width: 300px;">
								<option>Air Transport</option>
								<option>Sea Transport</option>
								<option>Powered Road Vehicle</option>
								<option>Post Office Mail</option>
								<option>Own propulsion</option>
							</select>
						
						</div>
						<div class="form-group">
							<label  for="exampleInputPassword3">Net Mass(kg)</label><br/>
							<input type="text" runat="server" class="form-control" id="mass" placeholder="Enter Mass of the package" style="width: 400px;">
						</div>
						</div>
                         <div class="form-inline" >
						<div class="form-group ">
							<label  for="exampleInputEmail3">Procedure</label><br />
							<input runat="server" type="email" class="form-control" id="Proceduregoods" placeholder="Enter Procedure of Goods" style="width: 300px;">
						</div>
						<div class="form-group ">
							<label  for="exampleInputPassword3">Estimated Release Date</label><br />
									<div class='input-group date' id='datetimepicker2' data-plugin="datetimepicker">
										<input type='text' class="form-control" style="width: 400px;"/>
										<span class="input-group-addon bg-info text-white">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
						</div>
						</div>
                         <div class="form-inline" >
						<div class="form-group ">
							<label  for="exampleInputEmail3">Package Description</label><br />
							<textarea name="control-demo-5" runat="server" id="description" class="form-control" cols="30" rows="3" style="width: 300px;"></textarea>
						</div>
						<div class="form-group ">
							<label for="exampleInputFile">Package Documentation</label><br />
							<input type="file" id="exampleInputFile" class="form-control" style="width: 400px;">
						</div>
						</div>
                        <div class="form-inline" >
						<div class="form-group ">
							<label  for="exampleInputEmail3">Reason for Transfer</label><br />
							<textarea name="control-demo-5" id="reason" runat="server" class="form-control" cols="30" rows="3" style="width: 300px;"></textarea>
						</div>
						<div class="form-group ">
							<label for="exampleInputFile">Package Image</label><br />
							<input type="file" id="exampleInputFile" class="form-control" style="width: 400px;">
						</div>
						</div>
					</form>
                    <ul class="list-inline pull-right">
                        <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                        <li><button type="button" runat="server" onserverclick="saveInfo" class="btn btn-primary next-step">Save and continue</button></li>
                    </ul>
                </div>
                <div class="tab-pane" role="tabpanel" id="step3">
                    <h3>Verify Transfer</h3>

                    <div class="alert alert-warning alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<strong>Warning </strong>
						<span>Without verifying your transfer, your package may be transfered incorrectly</span>
					</div>


                    <ul class="list-inline pull-right">
                        <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                        <li><button type="button" class="btn btn-default next-step">Skip</button></li>
                        <li><button type="button" class="btn btn-primary btn-info-full next-step">Save and continue</button></li>
                    </ul>
                </div>
                <div class="tab-pane" role="tabpanel" id="complete">
                    <h3>Successfully Request Your Transfer</h3>
                     <div class="alert alert-success alert-dismissable success-alert" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Success! message sent successfully.
                        </div>
                    <ul class="list-inline pull-right">
                        <li><button id="btnsuccess" runat="server" onserverclick="completeRequest" type="button" class="btn btn-outline mw-md btn-success ">Submit Transfer</button></li>
                  
                    </ul>
                    
                </div>
                <div class="clearfix"></div>
            </div>
        </form>
    </div>
</section>
</div>

</asp:Content>
