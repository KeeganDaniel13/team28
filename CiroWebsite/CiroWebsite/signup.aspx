<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="CiroWebsite.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Ciro | Sign Up</title>
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
<a href="signup.aspx">signup.aspx</a>
<body class="simple-page">
   <div id="back-to-home">
		<a href="index.aspx" class="btn btn-outline btn-default"><i class="fa fa-home animated zoomIn"></i></a>
	</div>
	<div class="simple-page-wrap">
		<div class="simple-page-logo animated swing">
			<a href="index.aspx">
				<span><i class="fa fa-gg"></i></span>
				<span>Ciro</span>
			</a>
		</div><!-- logo -->
		
<div class="simple-page-form animated flipInY" id="signup-form">
	<h4 class="form-title m-b-xl text-center">Sign Up For a new Account</h4>
	<form action="#" runat="server">
        <div class="form-group">
			<p id="error" runat="server" visible="false"  class="form-control alert-danger">Emailed Already Used</p>
		</div>
		<div class="form-group">
			<input id="fname" runat="server" type="text" class="form-control" placeholder="First Name"/>
		</div>
        <div class="form-group">
			<input id="lname" runat="server" type="text" class="form-control" placeholder="Last Name"/>
		</div>
		<div class="form-group">
			<input id="email" runat="server" type="email" class="form-control" placeholder="Email"/>
		</div>

		<div class="form-group">
			<input id="password" runat="server" type="password" class="form-control" placeholder="Password"/>
		</div>

		<div class="form-group m-b-xl">
			<div class="checkbox checkbox-primary">
				<input type="checkbox" id="keep_me_logged_in"/>
				<label for="keep_me_logged_in">Keep me signed in</label>
			</div>
		</div>
		<button type="submit" class="btn btn-primary" runat="server" onserverclick="register">SIGN UP</button>
	</form>
</div><!-- #login-form -->

<div class="simple-page-footer">
	<p>
		<small>Do you have an account ?</small>
		<a href="signin.aspx">SIGN IN</a>
	</p>
</div><!-- .simple-page-footer -->


	</div><!-- .simple-page-wrap -->
</body>
</html>
