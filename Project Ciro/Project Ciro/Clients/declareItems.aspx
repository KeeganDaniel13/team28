<%@ Page Title="" Language="C#" MasterPageFile="client.Master" AutoEventWireup="true" CodeBehind="declareItems.aspx.cs" Inherits="Project_Ciro.Clients.declarewarehouse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>

.button:hover {
  background: #06D85F;
}

.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 70px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 30%;
  position: relative;
  transition: all 5s ease-in-out;
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
  color: #06D85F;
}
.popup .content {
  max-height: 30%;
  overflow: auto;
}

@media screen and (max-width: 700px){
  .box{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
}

hr.style-one {
    border: 0;
    height: 1px;
    background: #333;
    background-image: linear-gradient(to right, #ccc, #333, #ccc);
}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       Declare Items
        <small></small>
      </h1>
        <br/>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Data tables</li>
      </ol>
    </section>

       <div class="box box-primary">
            <div class="box-header with-border">
              <h4 class="box-title">Declaration Information</h4>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                </div>
                <div class="form-group">
                  <label>Name</label>
                  <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter..">
                </div>      
                  <div class="form-group">
                  <label>Federeal Tax ID</label>
                  <input type="text" class="form-control" id="a1" placeholder="Enter ...">
                </div>       
                   <div class="form-group">
                  <label>Company Name</label>
                  <input type="text" class="form-control" id="a6" placeholder="Enter ...">
                </div>        
                   <div class="form-group">
                  <label>Accounts Payable Contact</label>
                  <input type="text" class="form-control" id="a2" placeholder="Enter ...">
                </div>       
                   <div class="form-group">
                  <label>Form Of Ownership</label>
                  <input type="text" class="form-control" id="a3" placeholder="Enter ...">
                </div>       
                   <div class="form-group">
                  <label>Authorised personnel</label>
                  <input type="text" class="form-control" id="a4" placeholder="Enter ...">
                </div>                         
                  <label>Type Of Storage</label>
                 <div class="form-group">                
                  <select class="form-control">
                    <option>Select An Storage Type</Option>
                    <option>option 2</option>
                    <option>option 3</option>
                    <option>option 4</option>
                    <option>option 5</option>
                  </select>               
                </div>          
                  <div class="form-group">
                  <label>Reason for Storage</label>
                  <textarea class="form-control" rows="3" placeholder="Place Reason Here..."></textarea>   
                  </div>     
                <div class="checkbox">
                  <label>
                    <input type="checkbox"> I Read & Agree With The <a href="#popup1">Terms & Conditions</a>
                  </label>
                </div>     
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
          </div>



       </div>

      <div id="popup1" class="overlay">
	<div class="popup">
		<h4 style="margin-left:35%">Terms & Conditions</h4>
        <hr />
		<a class="close" href="#">&times;</a>
		<div class="content">
			 <div class="modal-footer">
               <img style="height:300px; width:400px" src="../bootstraps/adminlte/dist/img/bazinga.jpg">
                 <br/>
                 <br />
                  <a href="#" type="button" class="btn btn-block btn-danger" style="width:100%">LMAO!!!!!</a>
              </div>
		</div>
	</div>
</div>
 
</asp:Content>
