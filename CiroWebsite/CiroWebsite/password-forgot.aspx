<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="password-forgot.aspx.cs" Inherits="CiroWebsite.password_forgot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
	<title>Ciro | Forgot Password</title>
	<meta name="description" content="Admin, Dashboard, Bootstrap" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" sizes="196x196" href="../infinity/assets/images/logo.png">
	
	<link rel="stylesheet" href="../infinity/libs/bower/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../infinity/libs/bower/material-design-iconic-font/dist/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="../infinity/libs/bower/animate.css/animate.min.css">

	<link rel="stylesheet" href="../infinity/assets/css/bootstrap.css">
	<link rel="stylesheet" href="../infinity/assets/css/app.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900,300">
</head>
<body class="simple-page">
   <div id="back-to-home">
		<a href="index-2.html" class="btn btn-outline btn-default"><i class="fa fa-home animated zoomIn"></i></a>
	</div>
	<div class="simple-page-wrap">
		<div class="simple-page-logo animated swing">
			<a href="index-2.html">
				<span><i class="fa fa-gg"></i></span>
				<span>Ciro</span>
			</a>
		</div><!-- logo -->
		<div class="simple-page-form animated flipInY" id="reset-password-form">
	<h4 class="form-title m-b-xl text-center">Forgot Your Password ?</h4>

	<form action="#" runat="server">
		<div class="form-group">
			<input id="reset-password-email" type="email" class="form-control" placeholder="email">
		</div>
		<input type="submit" class="btn btn-primary" value="RESET YOUR PASSWORD">
	</form>
</div><!-- #reset-password-form -->

	</div><!-- .simple-page-wrap -->
</body>
</html>
