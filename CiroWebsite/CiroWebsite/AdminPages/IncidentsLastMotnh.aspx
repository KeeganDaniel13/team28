<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/admin.Master" AutoEventWireup="true" CodeBehind="IncidentsLastMotnh.aspx.cs" Inherits="CiroWebsite.AdminPages.IncidentsLastMotnh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
             <div class="col-md-6" style="width:100%">
        <div class="widget">
          <header class="widget-header">
            <h4 class="widget-title">Package Incidents Last Month</h4>
          </header><!-- .widget-header -->
          <hr class="widget-separator">
          <div class="widget-body">
            <div data-plugin="chart" data-options="{
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:['Incidents']
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        boundaryGap : false,
                        data : [<%getwarehousesrate(); %>]
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name:'Incidents',
                        type:'line',
                        smooth:true,
                        itemStyle: {normal: {areaStyle: {type: 'default'}}},
                        data:[<%getrateValues(); %>]
                    }
                ]
            }" style="height: 300px;">
            </div>
          </div><!-- .widget-body -->
        </div><!-- .widget -->
      
    </div>
</asp:Content>
