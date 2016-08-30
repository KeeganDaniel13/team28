<%@ Page Title="Declaration Of Goods" Language="C#" MasterPageFile="~/ciro.Master" AutoEventWireup="true" CodeBehind="declaregoods.aspx.cs" Inherits="CiroWebsite.declaregoods" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
         .form-inline > *{
            margin:1px 22px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<form >
        <div class="form-inline" style="margin:20px;" >
		<div class="form-group">
			<label for="exampleInputName2">Name</label>
			<input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail2">Email</label>
			<input type="email" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com">
		</div>

            </div>
        <div class="form-inline" style="margin:20px;">
		<div class="form-group">
			<label for="exampleInputName2">Name</label>
			<input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail2">Email</label>
			<input type="email" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com">
		</div>

            </div>
       
	</form>
     <input type="submit" runat="server" onserverclick="dothis" value="submit"  />
      
</asp:Content>
