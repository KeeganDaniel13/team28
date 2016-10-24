<%@ Page Title="" Language="C#" MasterPageFile="~/WarehousePages/warehouse.Master" AutoEventWireup="true" CodeBehind="PackagesReceivedPastYear.aspx.cs" Inherits="CiroWebsite.WarehousePages.PackagesReceivedPastYear" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
         <div class="col-md-6" style="width:100%">
        <div class="widget">
          <header class="widget-header">
            <h4 class="widget-title"><a onclick="save()"> Total Packages Released / Month</h4></a>
          </header><!-- .widget-header -->
          <hr class="widget-separator">
          <div class="widget-body">
            <div id="saveme" data-plugin="chart" data-options="{
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:['Packages Recieved']
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        boundaryGap : false,
                        data : [<%getMonths();%>]
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name:'Packages Recieved',
                        type:'line',
                        smooth:true,
                        itemStyle: {normal: {areaStyle: {type: 'default'}}},
                        data:[<%getreleases(); %>]
                    }
                ]
            }" style="height: 300px;">
            </div>
          </div><!-- .widget-body -->
        </div><!-- .widget -->
      
    </div>

        </div>
    <script type="text/javascript" src="../canvas-to-blob.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

     //       alert("pand...panda....panda....panda")
            $("#saveme").get(0).toBlob(function (blob) {
                saveAs(blob, "chart.png")
            });
        });
    </script>

</asp:Content>
