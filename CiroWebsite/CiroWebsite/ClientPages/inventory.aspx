<%@ Page Title="" Language="C#" MasterPageFile="Client.Master" AutoEventWireup="true" CodeBehind="inventory.aspx.cs" Inherits="CiroWebsite.editor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../infinity/css/inventory.css">
      <script src="../infinity/assets/myjs/mode.js"></script>    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="col-sm-12 col-md-12">
	    <div class="panel panel-primary inventory">
		    <div class="panel-heading">
			    <h4 class="panel-title">Inventory</h4>
		    </div>
		    <div class="panel-body">
			     <table id="acrylic" width="100%">
            <thead>
                <tr>
                    <th>Package Name</th>
			        <th>Unit</th>
			        <th>Arrival Date</th>
			        <th>ERD</th>     
			        <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="list" runat="server">
                <tr>
                    <td>Carolina Biggleswade</td>
                    <td>23</td>
                    <td>65</td>
                    <td>Jockey</td>
                     <td>23</td>
                   
                    <td> 
                        <div class="row">
                        <button type="button" class="btn rounded btn-sm btn-danger">Release</button>
                         <button type="button" class="btn  btn-sm btn-success">Transfer</button>
                            </div>
                    </td>
                    
                </tr>
                 <tr>
                    <td>Carolina Biggleswade</td>
                    <td>23</td>
                    <td>65</td>
                    <td>Jockey</td>
                      <td>23</td>
                    <td>
                        <div class="row">
                        <button type="button" class="btn rounded btn-sm btn-danger">Release</button>
                         <button type="button" class="btn  btn-sm btn-success">Transfer</button>
                            </div>
                    </td>
                   
                </tr>
               
                
            </tbody>
        </table>
		    </div>
	    </div>
    </div><!-- END column -->
  
    <!-- Modal -->
            <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="text-danger fa fa-times"></i></button>
                    <h4 class="modal-title" id="myModalLabel"><i class="text-muted fa fa-shopping-cart"></i> Green Lambo</h4>
                  </div>
                  <div class="modal-body">
                  
                    <table class="pull-left col-md-6 ">
                         <tbody>
                             <tr >
                                 <td class="h6"><strong>HS Code</strong></td>
                                 <td> </td>
                                 <td class="h5">02051</td>
                             </tr>
                             
                             <tr>
                                 <td class="h6"><strong>Arrival Date</strong></td>
                                 <td> </td>
                                 <td class="h5">19.05.2016</td>
                             </tr>
                             
                             <tr>
                                 <td class="h6"><strong>Insured</strong></td>
                                 <td> </td>
                                 <td class="h5">Yes</td>
                             </tr>
                             
                             <tr>
                                 <td class="h6"><strong>Width</strong></td>
                                 <td> </td>
                                 <td class="h5">20cm</td>
                             </tr>
                             
                             <tr>
                                 <td class="h6"><strong>Height</strong></td>
                                 <td> </td>
                                 <td class="h5">032165</td>
                             </tr>
                             
                             
                             <tr>
                                 <td class="btn-mais-info text-primary">
                                     <i class="open_info fa fa-plus-square-o"></i>
                                     <i class="open_info hide fa fa-minus-square-o"></i> Description
                                 </td>
                                 <td> </td>
                                 <td class="h5"></td>
                             </tr> 

                         </tbody>
                    </table>
                             
                         
                    <div class="col-md-6"> 
                        <img src="../infinity/assets/images/11.jpg" alt="teste" class="img-thumbnail">  
                    </div>
                    
                    <div class="clearfix"></div>
                   <p class="open_info hide">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                  </div>
                    
                  <div class="modal-footer">       
                      
                    <div class="text-right pull-right col-md-3">
                        Value: <br/> 
                        <span class="h3 text-muted"><strong>R900000</strong></span></span> 
                    </div>
                    <div class="text-right pull-right col-md-3">
                      <a type="button" class="btn   btn-sm btn-success">Package Log</a>
                    </div>
                     
                </div>
              </div>
            </div>
            </div>
<!-- fim Modal-->

 
   <script>function bingo(id) {
    $(id).modal('show');
}</script>
</asp:Content>
