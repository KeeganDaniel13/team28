<%@ Page Title="" Language="C#" MasterPageFile="~/Customs.Master" AutoEventWireup="true" CodeBehind="CustomsReports.aspx.cs" Inherits="CiroWebsite.CustomsReports" %>
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


    <div class="row">
        

        
      <div class="col-md-6" style="width:100%">
        <div class="widget">
          <header class="widget-header">
            <h4 class="widget-title">Total Incidents</h4>
          </header><!-- .widget-header -->
          <hr class="widget-separator">
          <div class="widget-body">
            <div data-plugin="chart" data-options="{
                tooltip : {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c} ({d}%)'
                },
                legend: {
                    x : 'center',
                    y : 'top',
                    data:[<%getwarehouses(); %>]
                },
                calculable : true,
                series : [
                    {
                        name:'Incidents',
                        type:'pie',
                        radius : [20, 110],
                        center : ['50%', 200],
                        roseType : 'radius',
                        label: {
                            normal: {
                                show: false
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        lableLine: {
                            normal: {
                                show: false
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        data:[
                         <%getIncidents(); %>
                        ]
                    }
                ]
            }" style="height: 300px;">
            </div>
          </div><!-- .widget-body -->
        </div><!-- .widget -->
      </div><!-- END column -->
</div>



    <div class="row">
          <div class="col-md-6" style="width:100%">
        <div class="widget">
          <header class="widget-header">
            <h4 class="widget-title">Most Common Release Location</h4>
          </header><!-- .widget-header -->
          <hr class="widget-separator">
          <div class="widget-body">
            <div data-plugin="chart" data-options="{
              tooltip : {
                trigger: 'axis'
              },
              legend: {
                data:['Number Of Releases']
              },
              calculable : true,
              xAxis : [
                {
                  type : 'category',
                  data : [<%getwarehouses(); %>]
                }
              ],
              yAxis : [
                {
                  type : 'value'
                }
              ],
              series : [
                {
                  name:'Number Of Releases',
                  type:'bar',
                  data:[<%getReleases(); %>],
                  markPoint : {
                    data : [
                      {type : 'max', name: 'Max'},
                      {type : 'min', name: 'Min'}
                    ]
                  },
                  markLine : {
                    data : [
                      {type : 'average', name: 'Average'}
                    ]
                  }
                }             
              ]
            }" style="height:300px">
            </div>
          </div><!-- .widget-body -->
        </div><!-- .widget -->
      </div><!-- END column -->

    </div>



        <div class="row">
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
               <div class="row">  <div class="col-md-6">
        <div class="widget">
          <header class="widget-header">
            <h4 class="widget-title">Horizontal Stacked Bars</h4>
          </header><!-- .widget-header -->
          <hr class="widget-separator">
          <div class="widget-body">
            <div data-plugin="chart" data-options="{
              tooltip : {
                trigger: 'axis',
                axisPointer : {
                  type : 'shadow'
                }
              },
              legend: {
                data: ['Interview', 'Marketing','Advertising','Video Ads','Search Engine']
              },
              grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
              },
              xAxis:{
                type: 'value'
              },
              yAxis: {
                type: 'category',
                data: ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday']
              },
              series: [
                {
                  name: 'Interview',
                  type: 'bar',
                  stack: 'Total',
                  label: {
                    normal: {
                      show: true,
                      position: 'insideRight'
                    }
                  },
                  data: [320, 302, 301, 334, 390, 330, 320]
                },
                {
                  name: 'Marketing',
                  type: 'bar',
                  stack: 'Total',
                  label: {
                    normal: {
                      show: true,
                      position: 'insideRight'
                    }
                  },
                  data: [120, 132, 101, 134, 90, 230, 210]
                },
                {
                  name: 'Advertising',
                  type: 'bar',
                  stack: 'Total',
                  label: {
                    normal: {
                      show: true,
                      position: 'insideRight'
                    }
                  },
                  data: [220, 182, 191, 234, 290, 330, 310]
                },
                {
                  name: 'Video Ads',
                  type: 'bar',
                  stack: 'Total',
                  label: {
                    normal: {
                      show: true,
                      position: 'insideRight'
                    }
                  },
                  data: [150, 212, 201, 154, 190, 330, 410]
                },
                {
                  name: 'Search Eengine',
                  type: 'bar',
                  stack: 'Total',
                  label: {
                    normal: {
                      show: true,
                      position: 'insideRight'
                    }
                  },
                  data: [820, 832, 901, 934, 1290, 1330, 1320]
                }
              ]
            }" style="height:300px">
            </div>
          </div><!-- .widget-body -->
        </div><!-- .widget -->
      </div><!-- END column -->

   
        </div><!-- END row -->
        </div>

</asp:Content>
