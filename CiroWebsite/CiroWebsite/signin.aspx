﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="CiroWebsite.signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="UTF-8"/>
	<title>Ciro | Sign In</title>
	<meta name="description" content="Admin, Dashboard, Bootstrap" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="shortcut icon" sizes="196x196" href="../infinity/assets/images/logo.png"/>
	
	<link rel="stylesheet" href="../infinity/libs/bower/fontawesome/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="../infinity/libs/bower/material-design-iconic-font/dist/css/material-design-iconic-font.min.css"/>
	<link rel="stylesheet" href="../infinity/libs/bower/animate.css/animate.min.css"/>
    
	<link rel="stylesheet" href="../infinity/assets/css/bootstrap.css"/>
	<link rel="stylesheet" href="../infinity/assets/css/app.css"/>
	<!--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900,300">-->
</head>
<body class="simple-page">
    <div id="back-to-home">
		<a href="index.aspx" class="btn btn-outline btn-default"><i class="fa fa-home animated zoomIn"></i></a>
	</div>
	<div class="simple-page-wrap">
		<div class="simple-page-logo animated swing">
			<a href="index-2.html">
				<span><i class="fa fa-gg"></i></span>
				<span>CIRO</span>
			</a>
		</div><!-- logo -->
		<div class="simple-page-form animated flipInY" id="login-form">
	<h4 class="form-title m-b-xl text-center">Sign In With Your Ciro Account</h4>
	<form action="#" runat="server">
        <div class="form-group">
			<p id="wrong" runat="server" visible="false"  class="form-control alert-danger">Incorrect Email or Password</p>
		</div>

		<div class="form-group">
			<input id="email" runat="server" type="input" class="form-control" placeholder="Email"/>
		</div>

		<div class="form-group">
			<input id="pass" runat="server" type="password" class="form-control" placeholder="Password"/>
		</div>

		<div class="form-group m-b-xl">
			<div class="checkbox checkbox-primary">
				<input type="checkbox" id="keep_me_logged_in"/>
				<label for="keep_me_logged_in">Keep me signed in</label>
			</div>
		</div>
		<button type="submit" class="btn btn-primary"  runat="server" onserverclick="login" >SIGN IN</button>
	</form> 
</div><!-- #login-form -->

<div class="simple-page-footer">
	<p><a href="password-forget.aspx">FORGOT YOUR PASSWORD ?</a></p>
	<p>
		<small>Don't have an account ?</small>
		<a href="signup.aspx">CREATE AN ACCOUNT</a>
	</p>
</div><!-- .simple-page-footer -->


	</div><!-- .simple-page-wrap -->
</body>
</html>

