<%@ Page Title="" Language="C#" MasterPageFile="~/client.Master" AutoEventWireup="true" CodeBehind="viewwarehouses.aspx.cs" Inherits="Project_Ciro.Customs.viewwarehouses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Font Awesome -->
    <link href="../bootstraps/gentellla/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
  
     <!-- Bootstrap -->
    <link href="../bootstraps/gentellla/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../bootstraps/client/bootstrap.min.css" rel="stylesheet"/>
  
   <style>
        .datacentral{ 
		margin:0 auto; 
		width: 80%; 
		display: block
		}

         .inlineTable {
            display: inline-block;
             width: 350px;
        }
        </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/>
    <div class="datacentral" style="margin-bottom:200px;" >
        <i class="fa fa-file-text fa-5x">Lanseria Bondage</i>
        <br/><br/><br/>
        <p>
            Once goods have landed in the Republic, the importer /owner may choose to delay the payment of duties. 
            Such goods are placed in a Customs controlled bonded warehouse for a specified period (at present no more than two years).
        </p>
         <div class="container-fluid">
         <div class="col-sm-3" style="float:right;">
             <h2>Side</h2>
    	<div class="panel panel-default">
         	<div class="panel-heading">Title</div>
         	<div class="panel-body">Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan. 
            Aliquam in felis sit amet augue.</div>
        </div>
         </div>
            </div>
        <table class="table inlineTable" style="width:400px">
                <tr>
                    <th colspan="5" >
                        <b>
                           <i class="fa fa-info"> <font size=4>    Warehouse Information</font></i></b>
                    </th>
					
                </tr>
                <tr>
                    <td colspan="5">
					
					
					<div style="float:right;">
                        Gauteng Pretoria<br/>
                        Special Warehouse (SOS)<br />
                        Status : Open<br/>
						Created on: <br/>
						<button>View warehouse</button>
						</div>
                    </td>
                </tr>
                
            </table>		
        <table class="table inlineTable" style="width:400px">
                <tr>
                    <th colspan="9">
                        <b>
                           <i class="fa fa-info"> <font size=4>     Warehouse Information</font></i></b>
                    </th>
					
                </tr>
                <tr>
                    <td colspan="5">
					
					
					<div style="float:right;">
                        Gauteng Pretoria<br/>
                        Special Warehouse (SOS)<br />
                        Status : Open<br/>
						Created on: <br/>
						<button>View warehouse</button>
						</div>
                    </td>
                </tr>
                
            </table>
         <div class="col-sm-11">
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
            <button type="button" class="btn btn-success">Success</button>
        </div>
       
        		
    </div>
 
    
</asp:Content>
