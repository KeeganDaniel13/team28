<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Project_Ciro.Clients.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style>
        * {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  font-weight: 300;
}

.wrapper {
  background: #fff;
  overflow: hidden;
}

form {
  padding: 20px 0;
  position: relative;
  z-index: 2;
}
form input {
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  outline: 0;
  border: 1px solid rgba(0, 0, 0, 0.4);
  background-color: rgba(255, 255, 255, 0.2);
  width: 400px;
  border-radius: 5px;
  padding: 10px 15px;
  margin: 0 auto 10px auto;
  display: block;
  text-align: center;
  font-size: 18px;
  color: white;
  -webkit-transition-duration: 0.25s;
          transition-duration: 0.25s;
  font-weight: 300;
}
form input:hover {
  background-color: rgba(255, 255, 255, 0.4);
}
form input:focus {
  background-color: white;
  width: 300px;
  color: #000;
}
form button {
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  outline: 0;
  background-color: #00CCFF;
  border: 0;
  padding: 10px 15px;
  color: #FFF;
  border-radius: 3px;
  width: 400px;
  margin: 0 auto 10px auto;
  display: block;
  cursor: pointer;
  font-size: 18px;
  -webkit-transition-duration: 0.25s;
          transition-duration: 0.25s;
}
.heading{
    border: 2px solid rgba(0, 0, 0, 0.4);
    margin: 0 auto 10px auto;
  display: inline;
}
form button:hover {
  background-color: #005eff;
}
    </style>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="wrapper">
	<div class="container">
	
            		<h1 class="heading">CIRO</h1>
	

		<form class="form">
			<input type="text" runat="server" id="name" placeholder="Username">
			<input type="password" runat="server" id="password" placeholder="Password">
			<button type="submit" runat="server" onServerClick="loginButton">Log in</button>
            <hr />
            <button type="submit" id="signup-button"  style="background-color:#dbd7d7">Sign up</button>
		</form>
	</div>
         </div>


</asp:Content>
