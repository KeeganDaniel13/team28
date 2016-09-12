<%@ Page Title="" Language="C#" MasterPageFile="~/warehouse.Master" AutoEventWireup="true" CodeBehind="warehouserelease.aspx.cs" Inherits="CiroWebsite.warehouserelease" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="panel">
                  <header class="panel-heading">
                      Release 
                  </header>
                  <div class="panel-body">
                      <div class="row">
                          <div class="col-md-4">
                              <div class="input-group"><input type="text" placeholder="Search Here" class="input-sm form-control"> <span class="input-group-btn">
                              <button type="button" class="btn btn-sm btn-success"> Go!</button> </span></div>
                          </div>
                      </div>
                  </div>
                  <table class="table table-hover p-table">
                      <thead>
                      <tr>
                          <th>Release #</th>
                          <th>Owner</th>
                          <th>Status</th>
                          <th>Invoiced</th>
						  <th>Paid</th>
                          <th>Total</th>
                          <th>Created</th>
                          <th>Action</th>

                      </tr>
                      </thead>

                      <tbody runat="server" id="releaseTable">

                      <tr>
                          <td class="p-name">
                              <i class="fa zmdi-hc-sm fa-file-text-o fa-2x" aria-hidden="true"></i><a href="">  S001
                                  </a>
                          </td>
                          <td >
                               Ashton Cox
                          </td>
                          <td>
                             <span class="badge badge-primary">Finalized</span>
                          </td>
                          <td>
                            <div class="checkbox checkbox-circle checkbox-primary">
								<input type="checkbox" checked/>
                                <label for="cb-circle-2"></label>
							</div>
                          </td>
                          <td>
                             <div class="checkbox checkbox-circle checkbox-primary">
								<input type="checkbox" id="cb-circle-2" />
                                  <label for="cb-circle-2"></label>
							</div>
                          </td>
                          <td>
                              <i> R2,700.00</i>
                          </td>
                            <td>
                              <i> 27.11.2014</i>
                          </td>
                          <td>
                              <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                              <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                          </td>
                      </tr>
                      
                      
                      <tr>
                          <td class="p-name">
                             <i class="fa zmdi-hc-sm fa-file-text-o fa-2x" aria-hidden="true"></i><a href="">  S002
                                  </a>
                          </td>
                          <td >
                             Garreth Matrin
                          </td>
                          <td>
                              <span class="badge badge-success">Active</span>
                          </td>
                          <td>
                              <div class="checkbox checkbox-circle checkbox-primary">
								<input type="checkbox" id="cb-circle-2" />
                                  <label for="cb-circle-2"></label>
							</div>
                          </td>
                          <td>
                            <div class="checkbox checkbox-circle checkbox-primary">
								<input type="checkbox" id="cb-circle-2" />
                                  <label for="cb-circle-2"></label>
							</div>
                          </td>
                          <td>
                              <i> R1,350.00</i>
                          </td>
                            <td>
                              <i> 27.11.2014</i>
                          </td>
                          <td>
                              <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                              <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                          </td>
                      </tr>
                      
                     
                      </tbody>
                  </table>
              </section>
</asp:Content>
