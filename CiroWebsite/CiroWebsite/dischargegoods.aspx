<%@ Page Title="Discharge Goods | Ciro" Language="C#" MasterPageFile="~/ciro.Master" AutoEventWireup="true" CodeBehind="dischargegoods.aspx.cs" Inherits="CiroWebsite.dischargegoods" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
  .form-inline > * {
   margin:20px 50px;
}

.panel-title {display: inline;font-weight: bold;}
.checkbox.pull-right { margin: 0; }
.pl-ziro { padding-left: 5px; }
    </style>
    <script>
        $(document).ready(function () {

            var navListItems = $('ul.setup-panel li a'),
                allWells = $('.setup-content');

            allWells.hide();

            navListItems.click(function (e) {
                e.preventDefault();
                var $target = $($(this).attr('href')),
                    $item = $(this).closest('li');

                if (!$item.hasClass('disabled')) {
                    navListItems.closest('li').removeClass('active');
                    $item.addClass('active');
                    allWells.hide();
                    $target.show();
                }
            });

            $('ul.setup-panel li.active a').trigger('click');

            // DEMO ONLY //
            $('#activate-step-2').on('click', function (e) {
                $('ul.setup-panel li:eq(1)').removeClass('disabled');
                $('ul.setup-panel li a[href="#step-2"]').trigger('click');
                $(this).remove();
            })

        });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Discharge Manager</h3>
    <div class="row form-group">
        <div class="col-xs-12">
            <ul class="nav nav-pills nav-justified thumbnail setup-panel">
                <li class="active"><a href="#step-1">
                    <h4 class="list-group-item-heading">Discharge</h4>
                    <p class="list-group-item-text">Goods that you chose to discharge for free circulation</p>
                </a></li>
                <li class="disabled"><a href="#step-2">
                    <h4 class="list-group-item-heading">Additional Information</h4>
                    <p class="list-group-item-text">Complete the following fields</p>
                </a></li>
                <li class="disabled"><a href="#step-3">
                    <h4 class="list-group-item-heading">Payment</h4>
                    <p class="list-group-item-text">Proceed with Payment Options</p>
                </a></li>
            </ul>
        </div>
	</div>
    <div class="row setup-content" id="step-1">
        <h3>Goods to be Discharged</h3>
  

      <table id="default-datatable" data-plugin="DataTable" class="table table-striped" cellspacing="0" width="100%">
       <thead>
		<tr>
			<th>Package Name</th>
			<th>Quantity</th>
			<th>Duty Access</th>
			<th>Bill</th>
            <th>Exit Date</th>
			<th>Cosigner</th>
            <th>Action</th>
		</tr>
	</thead>					
	<tbody runat="server" id="Release">
		
									
	</tbody>
</table>
            <button id="activate-step-2" class="btn btn-info btn-outline">Step 2</button>
           
    </div>
    <div class="row setup-content" id="step-2">

         <h3>Discharge Adminstrative Form</h3>
         
         <form class="form-inline">
            <div class="form-inline" >
			        <div class="form-group ">
				        <label  for="exampleInputEmail3">Identification Number</label><br />
				        <input type="text" class="form-control" id="idnumber"  style="width: 300px;">
			        </div>
			        <div class="form-group ">
				        <label  for="exampleInputPassword3">Cosignee Full Name</label><br />
				        <input type="text" class="form-control" id="fullname" style="width: 400px;">
			        </div>
			</div>
             <div class="form-inline">
					<div class="form-group">
						<label  for="exampleInputEmail3">Mode of Discharge</label><br />
						<select class="form-control" style="width: 300px;">
								<option>Non-free Circulation</option>
								<option>Free Circulation</option>
								<option>Re-export</option>
								
							</select>
					</div>
					<div class="form-group ">
						<label  for="exampleInputPassword3">Form of Transport</label><br />
						<select class="form-control" style="width: 400px;">
								<option>Delivery</option>
								<option>Own propulsion</option>
                                <option>Warehouse Storage</option>
							</select>
					</div>
					</div>
             </form>

        <button id="activate-step-3" class="btn btn-info btn-outline">Step 3</button>
                  </div>
    
    <div class="row setup-content" id="step-3">
         
        <div class="alert alert-success alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<strong>Congratulations </strong>
			<span>You successfully completed your discharge process, you can proceed with your payment.</span>
		</div>
        <div class="row">
        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Payment Details
                    </h3>
                    <div class="checkbox checkbox-circle checkbox-primary pull-right" >
                       
                            <input type="checkbox" id="cb-circle-2"checked>
                        <label for="cb-circle-2">Remember</label>
                    </div>
                </div>
                <div class="panel-body">
                    <form role="form">
                    <div class="form-group">
                        <label for="cardNumber">
                            CARD NUMBER</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="cardNumber" placeholder="Valid Card Number"
                                required autofocus />
                            <span class="input-group-addon"><span class="fa fa-lock"></span></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-7 col-md-7">
                            <div class="form-group">
                                <label for="expityMonth">
                                    EXPIRY DATE</label>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" id="expityMonth" placeholder="MM" required />
                                </div>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" id="expityYear" placeholder="YY" required /></div>
                            </div>
                        </div>
                        <div class="col-xs-5 col-md-5 pull-right">
                            <div class="form-group">
                                <label for="cvCode">
                                    CV CODE</label>
                                <input type="password" class="form-control" id="cvCode" placeholder="CV" required />
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a><span class="badge pull-right"><span class="fa fa-usd"></span>4200</span> Final Payment</a>
                </li>
            </ul>
            <br/>
            <button  runat="server" onserverclick="sumbitRelease" class="btn btn-success btn-lg btn-block" role="button">Pay</button>
        </div>
    </div>
</div>


</asp:Content>
