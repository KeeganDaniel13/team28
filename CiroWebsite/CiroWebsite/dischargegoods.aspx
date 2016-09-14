<%@ Page Title="Discharge Goods | Ciro" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="dischargegoods.aspx.cs" Inherits="CiroWebsite.dischargegoods" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
       
  <a href="#" data-toggle="modal" data-target="#composeModal" type="button" class="btn btn-outline mw-md btn-success">Proceed</a>

               
  <div class="clearfix"></div>
    <!-- Compose modal -->
<div class="modal fade" id="composeModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Duty Payment</h4>
			</div>
			<div class="modal-body">
				 <div class="row">
        <div class="col-xs-12 col-md-8">
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
                <li class="active"><a><span class="badge pull-right" runat="server" id="val"><span></span>4200</span> Final Payment</a>
                </li>
            </ul>
            <br/>
            <button  runat="server" onserverclick="sumbitRelease" class="btn btn-success btn-lg btn-block" role="button">Pay</button>
        </div>
    </div>                               
                <br/>
               <!-- <a href="#" onclick="saveWarehouse(name)" type="button" class="btn btn-primary">Accept</a>                -->
                <br/>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
            
</asp:Content>
