<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="declarewarehouse.aspx.cs" Inherits="Project_Ciro.Clients.declarewarehouse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
            form {
    /* Just to center the form on the page */
        

    width: 400px;
    /* To see the outline of the form */
  
   
}

form div + div {
    margin-top: 1em;
}
label {
    /* To make sure that all labels have the same size and are properly aligned */
    display: inline-block;
    width: 300px;
    text-align: left;
}
input, textarea {
    /* To make sure that all text fields have the same font settings
       By default, textareas have a monospace font */
    font: 1em sans-serif;

    /* To give the same size to all text field */
    width: 300px;
    -moz-box-sizing: border-box;
    box-sizing: border-box;

    /* To harmonize the look & feel of text field border */
    border: 1px solid #999;
}
input:focus, textarea:focus {
    /* To give a little highlight on active elements */
    border-color: #000;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <form action="/my-handling-form-page" method="post">
    <div class="col-md-6" >
   
    <div style="display:inline-block; width:100px; float:left;" >
        <label for="name">Name:</label>
        <input type="text" id="name" name="user_name" />
   
        <label for="mail">E-mail:</label>
        <input type="email" id="mail" name="user_mail" />
    
         <label for="mail">Federal Tax ID</label>
        <input type="email" id="mail" name="user_mail" />

        <label for="mail">Company Name</label>
        <input type="email" id="mail" name="user_mail" />

        <label for="mail">Form of ownership</label>
        <input type="email" id="mail" name="user_mail" />

         <label for="mail">Accounts Payable conatct</label>
        <input type="email" id="mail" name="user_mail" />

         <label for="mail">Authorized persons to access storage</label>
        <input type="email" id="mail" name="user_mail" />

         <label for="mail">Type of Storage</label>
        <input type="email" id="mail" name="user_mail" />

        <label for="msg">Reason for storage:</label>
        <textarea id="msg" name="user_message"></textarea>
    </div>
    </div>
  <div class="col-md-6" >
   
    <div class="inlines" style="display:inline-block; width:50%; float:left;">
        <label for="name">Name:</label>
        <input type="text" id="name" name="user_name" />
   
        <label for="mail">E-mail:</label>
        <input type="email" id="mail" name="user_mail" />
    
         <label for="mail">Federal Tax ID</label>
        <input type="email" id="mail" name="user_mail" />

        <label for="mail">Company Name</label>
        <input type="email" id="mail" name="user_mail" />

        <label for="mail">Form of ownership</label>
        <input type="email" id="mail" name="user_mail" />

         <label for="mail">Accounts Payable conatct</label>
        <input type="email" id="mail" name="user_mail" />

         <label for="mail">Authorized persons to access storage</label>
        <input type="email" id="mail" name="user_mail" />

         <label for="mail">Type of Storage</label>
        <input type="email" id="mail" name="user_mail" />

        <label for="msg">Reason for storage:</label>
        <textarea id="msg" name="user_message"></textarea>
    </div>
    </div>
    <div class="button">
        <button type="submit">Submit </button>
    </div>
</form>
 
</asp:Content>
