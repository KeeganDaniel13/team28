<%@ Page Title="" Language="C#" MasterPageFile="Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_Ciro.Home.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-box" style="margin-top:4%">
  <div class="login-logo">
    <a href="TheHome.aspx"><b>CIRO</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body" style="box-shadow: 10px 10px 5px grey;" >
    <p class="login-box-msg">Sign in to start your session</p>

    <form method="post">
      <div class="form-group has-feedback">
        <input type="email" runat="server" id="txtemail" class="form-control" placeholder="Email or Username"/>
        <span class="glyphicon glyphicon-envelope form-control-feedback" style="margin-right:20px"></span>
           <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" runat="server" id="txtpass" class="form-control" placeholder="Password"/>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label style="margin-left:5px">
              <input type="checkbox"/> Remember Me
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" runat="server" onserverclick="btnLogin" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

   <!-- <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>
    <!-- /.social-auth-links -->

    <a href="#">I forgot my password</a><br/>
    <a href="register.aspx" class="text-center">Register a new membership</a>

  </div> 
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
</asp:Content>
