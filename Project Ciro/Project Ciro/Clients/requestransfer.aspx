<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="requestransfer.aspx.cs" Inherits="Project_Ciro.Clients.requestransfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../bootstraps/gentellla//vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        .contact-form {
    margin-top:30px;
}
        h3{
              font-family: "Montserrat", arial, sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
<div class="container">


<h3>Request Transfer</h3>
<hr/>
<div class="">

<div class="col-sm-8 contact-form">
<form id="contact" method="post" class="form" role="form">
<div class="row">
<div class="col-xs-6 col-md-6 form-group">
<label>Name</label>
<input class="form-control" id="name" name="name" placeholder="Name" type="text" required autofocus />
</div>
<div class="col-xs-8 col-md-6 form-group">
    <label>Last Name</label>
<input class="form-control" id="email" name="email" placeholder="Last Name" type="email" required style="width:400px" />
</div>
</div>
<div class="row">
<div class="col-xs-6 col-md-6 form-group">
<label>Name</label>
<input class="form-control" id="name" name="name" placeholder="Name" type="text" required autofocus />
</div>
<div class="col-xs-6 col-md-6 form-group">
    <label>Mail</label>
<input class="form-control" id="email" name="email" placeholder="Email" type="email" required style="width:400px" />
</div>
</div>
    <div class="row">
<div class="col-xs-6 col-md-6 form-group">
<label>Name</label>
<input class="form-control" id="name" name="name" placeholder="Name" type="text" required autofocus />
</div>
<div class="col-xs-6 col-md-6 form-group">
    <label>Mail</label>
<input class="form-control" id="email" name="email" placeholder="Email" type="email" required style="width:400px"/>
</div>
</div>
<textarea class="form-control" id="message" name="message" placeholder="Reason for transfer" rows="5"></textarea>
<br />

<div class="col-xs-12 col-md-12 form-group">
<button class="btn btn-info pull-left" type="submit">Request Transfer</button>
</form>
</div>
</div>
</div>
</asp:Content>
