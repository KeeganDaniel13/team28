<%@ Page Title="" Language="C#" MasterPageFile="~/Customs.Master" AutoEventWireup="true" CodeBehind="warehouseoverview.aspx.cs" Inherits="CiroWebsite.warehouseoverview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
		label { width: 200px; float: left; margin: 0 10px 0 0; }
		.table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
            width: 200px;
        }
        .table th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
        }
        .table th, .table td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
		.search input {
		 

		  background: #fcfcfc;
		  border: 1px solid #aaa;
		  border-radius: 5px;
		  box-shadow: 0 0 3px #ccc, 0 10px 15px #ebebeb inset;
		}
		.search input { text-indent: 32px;}
		.search .fa-search { 
		  position: absolute;
		  top: 10px;
		  left: 10px;
		}
		
		#datacentral{ 
		margin:0 auto; 
		width: 50%; 
		display: block
		}
}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contain" style="margin-bottom:200px;">

<div class="datacentral">
    
 <div class="datacentral">
  <div class="container" >
	<div class="row">

            <div class="panel panel-default">
                <div class="panel-body">
                    <form>
					  <label for="company">
						<span>Select Region</span>
						<input type="text" id="company" />
					  </label>
					  <label for="contact">
						<span>Warehouse Type</span>
						<input type="text" id="contact" />
					  </label>
					   <label for="contact">
						<span>Warehouse Status</span>
						<input type="text" id="contact" />
					  </label>
					  <div style="float:right;" class="search">
					  <label>
					  <span>Search by Name</span>
					   <span class="fa fa-search" aria-hidden="true"></span>
					  <input type="text"  placeholder="Search" class=" has-feedback-left">
                      
					  </label>
					   </div>
					</form>


                </div>
            </div>
        </div>  
	<table class="table" style="width:350px">
            <%listWarehouses(); %>    
			   
     </table>		
        
	</div>
</div>
       
   </div>
        </div>
</asp:Content>
