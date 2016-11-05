<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/admin.Master" AutoEventWireup="true" CodeBehind="WarehouseSpaceVSCapacity.aspx.cs" Inherits="CiroWebsite.AdminPages.WarehouseSpaceVSCapacity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row">
      <div class="col-md-6" style="width:100%">
        <div class="widget">
          <header class="widget-header">
            <h4 class="widget-title">Warehouses Space vs Capacity</h4>
          </header><!-- .widget-header -->
          <hr class="widget-separator">
          <div class="widget-body">
            <div data-plugin="chart" data-options="{
              tooltip : {
                trigger: 'axis'
              },
              legend: {
                data:['Occupied Space', 'Total Space']
              },
              calculable : true,
              grid : {
                x: 120
              },
              xAxis : [
                {
                  type : 'value',
                  boundaryGap : [0, 0.01]
                }
              ],
              yAxis : [
                {
                  type : 'category',
                  data : [<%getwarehouses(); %>]
                }
              ],
              series : [
                {
                  name:'Occupied Space',
                  type:'bar',
                  data:[<%getCapacity(); %>]
                },
                {
                  name:'Total Space',
                  type:'bar',
                  data:[<%getsizeused(); %>]
                }
              ]
            }" style="height:300px">
            </div>
          </div><!-- .widget-body -->
        </div><!-- .widget -->
      </div><!-- END column -->

        </div><!-- END row -->


</asp:Content>
