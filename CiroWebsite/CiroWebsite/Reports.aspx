<%@ Page Title="" Language="C#" MasterPageFile="~/ciro.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="CiroWebsite.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
      <div class="col-md-6">
        <div class="widget">
          <header class="widget-header">
            <h4 class="widget-title">Horizontal Bars</h4>
          </header><!-- .widget-header -->
          <hr class="widget-separator">
          <div class="widget-body">
           <div data-plugin="chart" data-options="{tooltip : {trigger: 'axis'},legend: {data:['Number Of Packages']},calculable : true,grid : {x: 60},xAxis : [{type : 'value',boundaryGap : [0, 0.01]}],yAxis : [{type : 'category',data : ['Brasil','Indonesia','USA','India','China','World(M)']}],series : [{name:'Number Of Packages',type:'bar',data:[<%BINGO(); %>]},]}" style="height:300px"></div>
          </div><!-- .widget-body -->
        </div><!-- .widget -->
      </div><!-- END column -->
        </div><!--END row-->

</asp:Content>
