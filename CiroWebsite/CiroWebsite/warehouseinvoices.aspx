<%@ Page Title="" Language="C#" MasterPageFile="~/warehouse.Master" AutoEventWireup="true" CodeBehind="warehouseinvoices.aspx.cs" Inherits="CiroWebsite.warehouseinvoices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="panel">
                  <header class="panel-heading">
                      Invoices
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
                          <th>Invoice #</th>
                          <th>Release #</th>
                          <th>Owner</th>
                          <th>Paid</th>
                          <th>Total Duty Due</th>
						  <th>Issued At</th>
                           <th>Last Updated</th>
                           <th>Action</th>

                      </tr>
                      </thead>
                      <tbody>
                      <tr>
                          <td class="p-name">
                              <a href="">SO001</a>
                          </td>
                          <td >
                             SO001
                          </td>
                          <td>
                              Ashton Cox
                          </td>
                          <td>
                            <div class="checkbox checkbox-circle checkbox-primary">
								<input type="checkbox" checked/>
                                <label for="cb-circle-2"></label>
							</div>
                          </td>
                          <td>
                             <i>R5,700.00</i>
                          </td>
                          <td>
                              <i> 27.11.2014</i>
                          </td>
                            <td>
                              <i> 27.11.2014</i>
                          </td>
                          <td>
                              <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                              <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                              <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                          </td>
                      </tr>
                      
                      
                      <tr>
                          <td class="p-name">
                              <a href="">SO002</a>
                          </td>
                          <td >
                             SO002
                          </td>
                          <td>
                              Garreth Martin
                          </td>
                          <td>
                              <div class="checkbox checkbox-circle checkbox-primary">
								<input type="checkbox" id="cb-circle-2" />
                                  <label for="cb-circle-2"></label>
							</div>
                          </td>
                          <td>
                             <i>R1,450.00</i>
                          </td>
                          <td>
                              <i> 27.11.2014</i>
                          </td>
                            <td>
                              <i> 27.11.2014</i>
                          </td>
                          <td>
                              <a href="project_details.html" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                              <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                              <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                          </td>
                      </tr>
                      
                     
                      </tbody>
                  </table>
              </section>
</asp:Content>
