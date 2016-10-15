<%@ Page Title="" Language="C#" MasterPageFile="~/ClientPages/Client.Master" AutoEventWireup="true" CodeBehind="ApproveTransfers.aspx.cs" Inherits="CiroWebsite.ClientPages.ApproveTransfers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
  @font-face {
  font-family: "europa";
  font-style: normal;
  font-weight: 400;
  src: url("data:font/opentype;base64,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");
}

body {text-rendering: optimizeLegibility;
  font-family: 'open sans';
  margin: 0;
}

header {height:80px;background:#2b5875; margin: 0 0 4em;}

.wrapper {margin: 5%;}

.list-header {margin:2em 0;font-family: 'europa'; color:#3c3d41; text-transform:uppercase;font-weight:100; letter-spacing:1px; font-size: .8em; text-align:center;}
.list-header h1 {margin:0;font-weight:100;letter-spacing:4px;}

.list-flex {
  display: flex;
  clear: both;
}

.list-column-label {
  width: 33.3333%;
  float: left;
  text-align: center;
  color: #b0b0b0;
  text-transform: uppercase;
  font-family: 'europa';
  font-weight: 600;
  letter-spacing: 1px;
}
.list-date-toggle h3 {text-align: center;
  color: #b0b0b0;
  text-transform: uppercase;
  font-family: 'europa';
  font-weight: 600;
  letter-spacing: 1px; font-size:.8em; margin:2em 0 0;}

.date-toggle {margin: 1em 0 0;}

.list-column-label h2 {
  font-size: 1em;
}

.list-column {
  padding: 1% 2%;
  width:33.333%;
  border: 1px solid #e5e5e5;
  box-sizing: border-box;
}

.rescheduled {background:#f4f4f4 !important; border: 2px solid #e5e5e5 !important;}

.list-block {
  background: #fff5d5;
  border: 2px solid #ffe07f;
  padding: 1em .8em .5em;
  font-size: .8em;
  margin: 1em .5em;
}

.list-time {
  width: 60%;
  float: left;
  color: #8d8e91;
  font-weight: bold;
}

.list-type {
  text-align: right;
  width: 40%;
  float: right;
  color: #8d8e91;
  hyphens:auto;
}

.list-name {
  line-height: 1.8em;
  clear: both;
  color: #8d8e91;
}

.list-state {
  color: #3c3d41;
  float: right;
}

.list-available {
  padding: 0 0 .3em;
  margin: 1em 0 .5em;
  border: 2px solid #5bdd67;
  background: #dfffd5;
}

.list-available h3 {
  margin: 0;
  font-size: .8em;
  color: #8d8e91;
  text-align: right;
  padding: .5em;
}

.clearfix {
  clear: both;
}


.cmn-toggle {
  position: absolute;
  margin-left: -9999px;
  visibility: hidden;
}
.cmn-toggle + label {
  display: block;
  position: relative;
  cursor: pointer;
  outline: none;
  user-select: none;
}

input.cmn-toggle-round-flat + label {
  padding: 2px;
  width: 40px;
  height: 20px;
  background-color: #dddddd;
  border-radius: 30px;
  transition: background 0.4s;
}
input.cmn-toggle-round-flat + label:before,
input.cmn-toggle-round-flat + label:after {
  display: block;
  position: absolute;
  content: "";
}
input.cmn-toggle-round-flat + label:before {
  top: 2px;
  left: 2px;
  bottom: 1px;
  right: 1px;
  background-color: #e5e5e5;
  border-radius: 30px;
  transition: background 0.4s;
}
input.cmn-toggle-round-flat + label:after {
  top: 4px;
  left: 4px;
  bottom: 4px;
  width: 16px;
  background-color: #f4f4f4;
  border-radius: 26px;
  transition: margin 0.4s, background 0.4s;
}
input.cmn-toggle-round-flat:checked + label {
  background-color: #dddddd;
}
input.cmn-toggle-round-flat:checked + label:after {
  margin-left: 20px;
  background-color: #2b5875;
}
.hide-days {display:none;}
.show-days {display:none;}

.toggle-label {font-size:.7em; color:#8d8e91; margin:1.8em 1em 0;}
.toggle-label-static {font-size:.7em; color:#8d8e91; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="wrapper">
<div class="list-header"><h1>Tuesday</h1><div class="view-date">January 1, 2015</div>
  
  </div>
  <div class="switch">
  <input id="cmn-toggle-4" class="cmn-toggle cmn-toggle-round-flat" type="checkbox" checked>
    <label for="cmn-toggle-4"></label><span class="toggle-label-static">Toggle List View</span>
</div>
<div class="list-column-label">
  <h2>Today</h2></div>
<div class="list-column-label">
  <h2>Past Unresolved</h2></div>
<div class="list-column-label">
  <h2>Tomorrow</h2></div>
<div class="list-flex">
  <div class="list-column">
    <div class="list-available">
      <h3>Location Name A<br />9:00 AM - 5:00 PM</h3>
      <div class="list-block">

        <div class="list-time">9:00 AM - 9:30 AM</div>
        <div class="list-type">Membership Tour</div>
        <div class="list-name">Alan Gardner</div>
        <div class="list-state">Completed</div>
        <div class="clearfix"></div>
      </div>
      <div class="list-block">

        <div class="list-time">10:30 AM - 11:30 AM</div>
        <div class="list-type">Massage</div>
        <div class="list-name">Naomi Jones</div>
        <div class="list-state">Completed</div>
        <div class="clearfix"></div>
      </div>
      <div class="rescheduled list-block">

        <div class="list-time">1:00 PM - 2:00 PM</div>
        <div class="list-type">Massage</div>
        <div class="list-name">Carol Miller</div>
        <div class="list-state">Rescheduled</div>
        <div class="clearfix"></div>
      </div>
      <div class="list-block">

        <div class="list-time">2:00 PM - 3:30 PM</div>
        <div class="list-type">Tennis 90 Minutes</div>
        <div class="list-name">John Smith</div>
        <div class="list-state">Unresolved</div>
        <div class="clearfix"></div>
      </div>
      <div class="list-block">

        <div class="list-time">2:00 PM - 3:30 PM</div>
        <div class="list-type">Tennis 90 Minutes</div>
        <div class="list-name">John Smith</div>
        <div class="list-state">Unresolved</div>
        <div class="clearfix"></div>
      </div>
    </div>
  </div>
  <div class="list-column">
    <div class="list-flex" style="float:right;">
      <span class="toggle-label">Hide Days</span><span class="toggle-label" style="display:none;">Show Days</span>
<div class="switch date-toggle">
 
  <input id="cmn-toggle-1" class="cmn-toggle cmn-toggle-round-flat" type="checkbox" checked>
  <label for="cmn-toggle-1"></label>
      </div></div>
    <div class="clearfix"></div>
    <div class="list-date-toggle"><h3>Yesterday</h3></div>
    <div class="list-block">

      <div class="list-time">2:00 PM - 3:30 PM</div>
      <div class="list-type">Tennis 90 Minutes</div>
      <div class="list-name">John Smith</div>
      <div class="list-state">Unresolved</div>
      <div class="clearfix"></div>
    </div>
    <div class="list-block">

      <div class="list-time">2:00 PM - 3:30 PM</div>
      <div class="list-type">Tennis 90 Minutes</div>
      <div class="list-name">John Smith</div>
      <div class="list-state">Unresolved</div>
      <div class="clearfix"></div>
    </div>
    
        <div class="list-date-toggle"><h3>December 30, 2014</h3></div>
    <div class="list-block">

      <div class="list-time">2:00 PM - 3:30 PM</div>
      <div class="list-type">Tennis 90 Minutes</div>
      <div class="list-name">John Smith</div>
      <div class="list-state">Unresolved</div>
      <div class="clearfix"></div>
    </div>
        <div class="list-date-toggle"><h3>December 28, 2014</h3></div>
    <div class="list-block">

      <div class="list-time">2:00 PM - 3:30 PM</div>
      <div class="list-type">Tennis 90 Minutes</div>
      <div class="list-name">John Smith</div>
      <div class="list-state">Unresolved</div>
      <div class="clearfix"></div>
    </div>
    <div class="list-block">

      <div class="list-time">2:00 PM - 3:30 PM</div>
      <div class="list-type">Tennis 90 Minutes</div>
      <div class="list-name">John Smith</div>
      <div class="list-state">Unresolved</div>
      <div class="clearfix"></div>
    </div>
  </div>
  <div class="list-column">
    <div class="list-available">
      <h3>Location Name A<br />10:00 AM - 4:00 PM</h3>
      <div class="list-block">

        <div class="list-time">2:00 PM - 3:30 PM</div>
        <div class="list-type">Tennis 90 Minutes</div>
        <div class="list-name">John Smith</div>
        <div class="list-state">Unresolved</div>
        <div class="clearfix"></div>
      </div>
      <div class="list-block">

        <div class="list-time">2:00 PM - 3:00 PM</div>
        <div class="list-type">Massage</div>
        <div class="list-name">Carol Miller</div>
        <div class="list-state">Unresolved</div>
        <div class="clearfix"></div>
      </div>
      <div class="list-block">

        <div class="list-time">2:00 PM - 3:30 PM</div>
        <div class="list-type">Tennis 90 Minutes</div>
        <div class="list-name">John Smith</div>
        <div class="list-state">Unresolved</div>
        <div class="clearfix"></div>
      </div>
      <div class="list-block">

        <div class="list-time">2:00 PM - 3:30 PM</div>
        <div class="list-type">Tennis 90 Minutes</div>
        <div class="list-name">John Smith</div>
        <div class="list-state">Unresolved</div>
        <div class="clearfix"></div>
      </div>
    </div>

  </div>
</div>
</div>
</div>
</asp:Content>
  