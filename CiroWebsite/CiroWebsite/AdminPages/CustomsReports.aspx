<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="CustomsReports.aspx.cs" Inherits="CiroWebsite.CustomsReports" %>
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
              


   

    
       <div class="row">
      <div class="col-md-6" style="width:100%">
        <div class="widget">
          <header class="widget-header">
            <h4 class="widget-title">Countries Imported From %</h4>
          </header><!-- .widget-header -->
          <hr class="widget-separator">
          <div class="widget-body">
            <div data-plugin="chart" data-options="{
              tooltip : {
                trigger: 'axis'
              },
              legend: {
                data:['Most Imported From']
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
                  data : [<%getCountry(); %><%getCountryName(); %>]
                }
              ],
              series : [
                {
                  name:'Occupied Space',
                  type:'bar',
                  data:[<%getData();%>]
                }
              ]
            }" style="height:300px">
            </div>
          </div><!-- .widget-body -->
        </div><!-- .widget -->
      </div><!-- END column -->

        </div><!-- END row -->

            <div class="row">
        <div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-primary"><span class="counter" data-plugin="counterUp">R <%getOutstanding(); %></span></h3>
							<small class="text-color">Outstanding Tax on Imports</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-paperclip"></i></span>
					</div>
					<footer class="widget-footer bg-primary">
						<small>in Rands</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[4,3,5,2,1], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget -->
			</div><%getAverageTax(); %>
			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-primary"><span class="counter" data-plugin="counterUp">R <%getVAT();%></span></h3>
							<small class="text-color">Average VAT Charged </small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-paperclip"></i></span>
					</div>
					<footer class="widget-footer bg-primary">
						<small>in Rands</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[4,3,5,2,1], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget --></div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-primary"><span class="counter" data-plugin="counterUp">R <%getPenalty();%></span></h3>
							<small class="text-color">Average Penalties Charged on Goods</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-paperclip"></i></span>
					</div>
					<footer class="widget-footer bg-primary">
						<small>in Rands</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[4,3,5,2,1], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget --></div>
			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-primary"><span class="counter" data-plugin="counterUp">R <%getTotal();%></span></h3>
							<small class="text-color">Average Total Charged on Goods</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-paperclip"></i></span>
					</div>
					<footer class="widget-footer bg-primary">
						<small>in Rands</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[4,3,5,2,1], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget --></div>
			</div>

</asp:Content>
