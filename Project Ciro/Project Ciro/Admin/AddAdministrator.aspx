<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="AddAdministrator.aspx.cs" Inherits="Project_Ciro.Admin.AddAdministrator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <!-- page content -->
        <div class="right_col" role="main">

          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>													
													Administration Addition 
												</h3>
              </div>

   
            </div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                   <!-- <h2>Form validation <small>sub title</small></h2> -->
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <form class="form-horizontal form-label-left" novalidate="novalidate">

                  <!--    <p>For alternative validation library <code>parsleyJS</code> check out in the <a href="form.html">form page</a> -->
               
                      <span class="section">Admin Info</span>                     
                      <div class="item form-group">
                          <br />
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Name <span class="required">*</span>                             
                        </label>    
                          <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" required="required" class="form-control col-md-7 col-xs-12"/>
                        </div>                                              
                           <br/>
                      </div>
                         <div class="item form-group">
                          <br />
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Surname <span class="required">*</span>                             
                        </label>    
                          <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" required="required" class="form-control col-md-7 col-xs-12"/>
                        </div>                                              
                           <br/>
                      </div>
                      <div class="item form-group">
                           <br>
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Type <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                         <select class="form-control">
                            <option>Choose Option</option>
                            <option>Option 1</option>
                             <option>Option 2</option>
                             <option>Option 3</option>
                             <option>Option 4</option>
                           
                          </select>
                        </div>
                           <br/> <br/>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Attribute 1<span class="required">*</span>
                        </label>
                          </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" required="required" class="form-control col-md-7 col-xs-12"/>
                        </div>
                           <br/> <br/>
                         <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Attribute 2<span class="required">*</span>
                        </label>
                          </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <input type="text" required="required" class="form-control col-md-7 col-xs-12"/>
                        </div>
                           <br/> <br/>
                         <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Attribute 3<span class="required">*</span>
                        </label>
                          </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <input type="text" required="required" class="form-control col-md-7 col-xs-12"/>
                        </div>
                           <br/> <br/>
                         
                          
                          <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Attribute 4<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <input type="text" required="required" class="form-control col-md-7 col-xs-12"/>
                        </div>
                           <br/> <br/>
                      </div>                                                                                                
                          <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Attribute 5<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="number" placeholder="0" id="number" name="number" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12"/>
                        </div>
                           <br/> <br/>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">Additional Information <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <textarea id="textarea" required="required" name="textarea" class="form-control col-md-7 col-xs-12"></textarea>
                        </div>
                           <br/> <br/>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                           <button id="send" style="width:100%" type="submit" class="btn btn-success">Add Administrator</button>
                          <button type="submit" style="width:100%" class="btn btn-danger">Cancel</button>

                          
                        </div>
                      </div>
                           <footer>
          <div class="pull-right" style="margin-top:20%">
          <p style="text-align:center">This is a Pro Lazarus Production</p>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->          
                    </form>
                  </div>
                </div>
              </div>                 
            </div>                                
          </div>
        </div>
        <!-- /page content -->
</asp:Content>
