<%@ Page Title="View Goods" Language="C#" MasterPageFile="~/ciro.Master" AutoEventWireup="true" CodeBehind="viewpackage.aspx.cs" Inherits="CiroWebsite.viewpackage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="datacentral" style="margin-bottom:200px;" >
        <i class="fa fa-file-text fa-4x"><span>   Package Name</span></i>
        <br/><br/><br/>
        <p>
            Once goods have landed in the Republic, the importer /owner may choose to delay the payment of duties. 
            Such goods are placed in a Customs controlled bonded warehouse for a specified period (at present no more than two years).
        </p>
         
        
         <div class="col-sm-4">
    	<div class="panel panel-default">
         	<div class="panel-heading">Warehouse Documents</div>
         	<div class="panel-body">Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan. 
            Aliquam in felis sit amet augue.</div>
        </div>
         </div><br/>
        <div>
        <label>
                <input type="checkbox" value=""> I agree with all terms and conditions of CIRO
            </label>
            <br/>
            <button type="button" class="btn btn-info btn-outline btn-sm">Success</button>
        </div>
       
        		
    </div>

</asp:Content>
