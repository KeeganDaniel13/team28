<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="MostCommonCountries.aspx.cs" Inherits="CiroWebsite.CustomsReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <div class="row">       
      <div class="col-md-12">
        <div class="widget">
          <header class="widget-header">
            <h4 class="widget-title">Imported Items Origin</h4>
          </header><!-- .widget-header -->
          <hr class="widget-separator">
          <div class="widget-body">
            <div data-plugin="chart" data-options="{
              title : {
                  text: 'Countries Imported From',
                  subtext: '...',
                  sublink : 'http://esa.un.org/wpp/Excel-Data/population.htm',
                  x:'center',
                  y:'top'
              },
              tooltip : {
                  trigger: 'item',
                  formatter : function (params) {
                      var value = (params.value + '').split('.');
                      value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,')
                              + '.' + value[1];
                      return params.seriesName + '<br/>' + params.name + ' : ' + value;
                  }
              },
              dataRange: {
                  min: 0,
                  max: 10,
                  text:['High','Low'],
                  realtime: false,
                  calculable : true,
                  color: ['orangered','yellow','lightskyblue']
              },
              series : [
                  {
                      name: 'Goods Imported',
                      type: 'map',
                      mapType: 'world',
                      roam: true,
                      mapLocation: {
                          y : 60
                      },
                      itemStyle:{
                          emphasis:{label:{show:true}}
                      },
                      data:[
                          <%getCountryName(); %>
                      ]
                  }
              ]
            }" style="height: 500px;">
            </div>
          </div><!-- .widget-body -->
        </div><!-- .widget -->
      </div><!-- END column -->
</asp:Content>
