<%@ Page Title="Change Ownership | Ciro" Language="C#" MasterPageFile="~/ciro.Master" AutoEventWireup="true" CodeBehind="changeofownership.aspx.cs" Inherits="CiroWebsite.changeofownership" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
      body{
          margin:-50px;
      }
 .form-inline > * {
   margin:20px 50px;
}
 .success-alert{
    display: none;
}
    </style>
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="row">
			<div class="col-md-2">
				<div class="app-action-panel" id="support-action-panel">
					<div class="action-panel-toggle" data-toggle="class" data-target="#support-action-panel" data-class="open">
						<i class="fa fa-chevron-right"></i>
						<i class="fa fa-chevron-left"></i>
					</div><!-- .app-action-panel -->

					<div class="app-actions-list scrollable-container">
						<!-- mail category list -->
						<div class="list-group">
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-exclamation-triangle"></i>General</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-folder"></i>Payment</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-exclamation-circle"></i>Offers</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-trash"></i>Secuirty</a>
						</div><!-- .list-group -->

						<hr class="m-0 m-b-md" style="border-color: #ddd;">

						<div class="list-group">
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-envelope"></i>me@gmail.com</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-phone"></i>1451 1251 444</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-eye"></i>Mon-Fri:9:00-15:00</a>
						</div><!-- .list-group -->
					</div><!-- .app-actions-list -->
				</div><!-- .app-action-panel -->
			</div><!-- END column -->
        <div class="col-md-10">
            <div class="alert alert-warning alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<strong>Warning! </strong>
						<span>Better check yourself, you're not looking too good.</span>
					</div>
                    <form class="form-inline">
                        <div class="form-inline" >
						<div class="form-group " >
							<label  for="exampleInputEmail3">Name of Goods</label><br />
							<!--<input type="text" class="form-control" id="goodsContainer" placeholder="Name of Good(s)" style="width: 300px;">-->
                            <select class="form-control" onserverclick="fillInfo" data-plaugin="listGoods" id="goods" runat="server">
                               
                            </select>
                            <button onserverclick="fillInfo" class="btn" runat="server" id="Send">Select</button>
						</div>
						<div class="form-group ">
							<label  for="exampleInputPassword3">Origin</label><br />
							<input type="text" class="form-control" runat="server" id="origincountry" placeholder="Country Of Orgin" style="width: 400px;"/>
						</div>
						</div>
                  
                         <div class="form-inline" >
						<div class="form-group ">
							<label  for="exampleInputEmail3">Location of Goods</label><br />
							<input type="email" class="form-control" runat="server" id="Locationgoods" placeholder="Location of Goods" style="width: 300px;"/>
						</div>
						<div class="form-group ">
							<label  for="exampleInputEmail3">Destination of Goods</label><br />
							<input type="email" class="form-control" runat="server" id="Destinationgoods" placeholder="Destination of Goods" style="width: 400px;"/>
						</div>
						</div>
                         <div class="form-inline" >
						<div class="form-group ">
							<label  for="exampleInputEmail3">Description of Goods</label><br />
							<textarea name="control-demo-5" runat="server" id="desc" class="form-control" cols="30" rows="3" style="width: 300px;"></textarea>
						</div>
						<div class="form-group ">
							<label for="exampleInputFile">Bill Of Entry</label><br />
							<input type="file" id="exampleInputFile" class="form-control" style="width: 400px;"/>
						</div>
						</div>
                        <div class="form-inline" >
						<div class="form-group ">
							<label for="exampleInputFile">Reciept of Good(s)</label><br />
							<input type="file" id="exampleInputFile2" class="form-control" style="width: 300px;"/>
						</div>
						<div class="form-group ">
							<label for="exampleInputFile">Package Image</label><br />
							<input type="file" id="exampleInputFile3" class="form-control" style="width: 400px;"/>
						</div>
						</div>
					</form>
            <br />
           <button runat="server" onserverclick="Approve" >Approve</button>
        </div>
</div>
</asp:Content>
