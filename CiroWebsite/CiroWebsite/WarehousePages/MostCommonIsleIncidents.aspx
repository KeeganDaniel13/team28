<%@ Page Title="" Language="C#" MasterPageFile="~/WarehousePages/warehouse.Master" AutoEventWireup="true" CodeBehind="MostCommonIsleIncidents.aspx.cs" Inherits="CiroWebsite.WarehousePages.SuggestedSizes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   

<section id="posts-landing">
      <div class="col-md-6" style="width:100%">
        <div class="widget">
          <header class="widget-header">
            <h4 onclick="pic()" class="widget-title">Incidents Per Isle Last Month</h4>             
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
              grid : {
                x: 60
              },
              xAxis : [
                {
                 name:'Incidents',
                  type : 'value',
                  boundaryGap : [0, 0.01]
                }
              ],
              yAxis : [
                {
                 name:'Isle',
                  type : 'category',
                  data : [<%Isles(); %>]
                }
              ],
              series : [
                {
                  name:'Incidents',
                  type:'bar',
                  data:[<%incidents(); %>]
                },              
              ]
            }" style="height:300px">
            </div>
          </div><!-- .widget-body -->
        </div><!-- .widget -->
      </div><!-- END column -->
    </section>


        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type='text/javascript' src="../jspdf.debug.js"></script>
<script>
$(document).ready(function() {
$('#download').click(function () {
var pdf = new jsPDF('p', 'pt', 'letter')
, source = $('#posts-landing')[0]
, specialElementHandlers = {
    '#bypassme': function(element, renderer){      
        return true
    }
}

margins = {
    top: 60,
    bottom: 60,
    left: 40,
    width: 522
  };
  // all coords and widths are in jsPDF instance's declared units
  // 'inches' in this case
pdf.fromHTML(
    source // HTML string or DOM elem ref.
    , margins.left // x coord
    , margins.top // y coord
    , {
        'width': margins.width // max width of content on PDF
        , 'elementHandlers': specialElementHandlers
    },
    function (dispose) {
      // dispose: object with X, Y of the last line add to the PDF
      //          this allow the insertion of new lines after html
        pdf.save('Downloaded.pdf');
      },
    margins
  )
});

    });
</script>
</asp:Content>
