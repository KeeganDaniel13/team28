<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/admin.Master" AutoEventWireup="true" CodeBehind="IncomingvsOutgoingItems.aspx.cs" Inherits="CiroWebsite.AdminPages.IncomingvsOutgoingItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <div class="col-md-6" style="width:100%">
        <div class="widget">
          <header class="widget-header">
            <h4 class="widget-title">Incoming vs Outgoing Items</h4>
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
                  data : [<%warehouse(); %>]
                }
              ],
              series : [
                {
                  name:'Rate',
                  type:'bar',
                  itemStyle : { normal: {label : {show: true, position: 'inside'}}},
                  data:[<%Rate();%>]
                },
                {
                  name:'In',
                  type:'bar',
                  stack: 'Total',
                  barWidth : 5,
                  itemStyle: {normal: {
                      label : {show: true}
                  }},
                  data:[<%incoming();%>]
                },
                {
                  name:'Out',
                  type:'bar',
                  stack: 'Total',
                  itemStyle: {normal: {
                      label : {show: true, position: 'left'}
                  }},
                  data:[<%Outgoing();%>]
                }
              ]
            }" style="height:300px">
            </div>
          </div><!-- .widget-body -->
        </div><!-- .widget -->
      </div><!-- END column -->
</asp:Content>
