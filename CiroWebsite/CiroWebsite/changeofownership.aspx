<%@ Page Title="Change Ownership | Ciro" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="changeofownership.aspx.cs" Inherits="CiroWebsite.changeofownership" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
      body{
          margin:-50px;
      }
 .form-inline > * {
   margin:20px 50px;
}

    </style>
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="row">
			
        <div class="col-md-12">
            
                    <form class="form-inline">
                         <div class="form-inline" >
						<div class="form-group ">
							<label  for="exampleInputEmail3">Cosignee </label><br />
							<input type="text" class="form-control" runat="server" id="cosignee" placeholder="Location of Goods" style="width: 300px;"/>
						</div>
						<div class="form-group ">
							<label  for="exampleInputEmail3">Name of Goods</label><br />
							<!--<input type="text" class="form-control" id="goodsContainer" placeholder="Name of Good(s)" style="width: 300px;">-->
                            <input type="text" class="form-control" runat="server" id="nameofgoods" placeholder="Package Name" style="width: 400px;"/>
						</div>
						</div>
                        <div class="form-inline" >
						<div class="form-group " >
							<label  for="exampleInputPassword3">Quantity</label><br />
							<input type="text" class="form-control" runat="server" id="quantity" placeholder="Country Of Orgin" style="width: 300px;"/>
                                                      
						</div>
						<div class="form-group ">
							<label  for="exampleInputPassword3">Country Name</label><br />
							<input type="text" class="form-control" runat="server" id="origincountry" placeholder="Country Of Orgin" style="width: 400px;"/>
						</div>
						</div>
                  
                         <div class="form-inline" >
						<div class="form-group ">
							<label  for="exampleInputEmail3">Package Location</label><br />
							<input type="email" class="form-control" runat="server" id="Locationgoods" placeholder="Location of Goods" style="width: 300px;"/>
						</div>
						<div class="form-group ">
							<label  for="exampleInputEmail3">Entry Number</label><br />
							<input type="email" class="form-control" runat="server" id="Destinationgoods" placeholder="Destination of Goods" style="width: 400px;"/>
						</div>
						</div>
                         <div class="form-inline" >
						<div class="form-group ">
							<label  for="exampleInputEmail3">Description of Goods</label><br />
							<textarea name="control-demo-5" runat="server" id="desc" class="form-control" cols="30" rows="3" style="width: 300px;"></textarea>
						</div>
							<div class="form-group ">
							<label  for="exampleInputEmail3">Kind of Package</label><br />
							<input type="text" class="form-control" runat="server" id="packagekind" placeholder="Type of Package" style="width: 400px;"/>
						</div>
						</div>
                        <div class="form-inline" >
						<div class="form-group ">
							<label  for="exampleInputEmail3">Reason for Transfer</label><br />
							<textarea name="control-demo-5" runat="server" id="reasontrans" class="form-control" cols="30" rows="3" style="width: 300px;"></textarea>
						</div>
                            <div class="form-group ">
							<label  for="exampleInputEmail3">Addition Information</label><br />
							<textarea name="control-demo-5" runat="server" id="additional" class="form-control" cols="30" rows="3" style="width: 300px;"></textarea>
						</div>
						</div>
					</form>
            <br />
             <ul class="list-inline ">
                <li><button runat="server" onserverclick="Approve" class="btn btn-success btn-sm">Submit</button></li>
             </ul>
        </div>
</div>
</asp:Content>
