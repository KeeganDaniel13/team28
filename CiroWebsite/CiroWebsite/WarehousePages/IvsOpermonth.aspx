<%@ Page Title="" Language="C#" MasterPageFile="~/WarehousePages/warehouse.Master" AutoEventWireup="true" CodeBehind="IvsOpermonth.aspx.cs" Inherits="CiroWebsite.WarehousePages.IvsOpermonth" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
      <div class="col-md-6" style="width:100%">
        <div class="widget">
          <header class="widget-header">
            <h4 class="widget-title">Incoming vs Outgoing Items per Month</h4>
          </header><!-- .widget-header -->
          <hr class="widget-separator">
          <div class="widget-body">
            <div data-plugin="chart" data-options="{
              tooltip : {
                trigger: 'axis'
              },
              legend: {
                data:['Rate', 'Out', 'In']
              },
              calculable : true,
              xAxis : [
                {
                  type : 'value'
                }
              ],
              yAxis : [
                {
                  type : 'category',
                  axisTick : {show: false},
                  data : [<%month(); %>]
                }
              ],
              series : [
                {
                  name:'Rate',
                  type:'bar',
                  itemStyle : { normal: {label : {show: true, position: 'inside'}}},
                  data:[<%mRate();%>]
                },
                {
                  name:'In',
                  type:'bar',
                  stack: 'Total',
                  barWidth : 5,
                  itemStyle: {normal: {
                      label : {show: true}
                  }},
                  data:[<%mincoming();%>]
                },
                {
                  name:'Out',
                  type:'bar',
                  stack: 'Total',
                  itemStyle: {normal: {
                      label : {show: true, position: 'left'}
                  }},
                  data:[<%mOutgoing();%>]
                }
              ]
            }" style="height:600px">
            </div>
          </div><!-- .widget-body -->
        </div><!-- .widget -->
      </div><!-- END column -->
</asp:Content>
