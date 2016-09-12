<%@ Page Title="" Language="C#" MasterPageFile="~/Customs.Master" AutoEventWireup="true" CodeBehind="transfers.aspx.cs" Inherits="CiroWebsite.transfers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
   .floated {
  float:right;
  margin-right:10px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center"><h3>Respond To Your Transfer Requests</h3></div>

    <div class="row">
        <div class="table-responsive">
					<table runat="server" class="table mail-list">
						<tr>
							<td>
								<%listTransfers(); %>
							</td>
						</tr>
					</table>
				</div>
			</div><!-- END column -->
</asp:Content>
