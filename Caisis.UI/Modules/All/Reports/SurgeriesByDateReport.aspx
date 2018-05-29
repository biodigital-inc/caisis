<%@ Page language="C#" Inherits="Caisis.UI.Modules.All.Reports.SurgeriesByDateReport" CodeFile="SurgeriesByDateReport.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Surgeries By Date Report</title>
    <link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
</head>
  <body id="ReportContentBody" runat="server" class="reportContentBody">
	    <form id="Form1" method="post" runat="server">
        <table width="100%" height="90%" cellpadding="1" cellspacing="0" border="0" >
		<tr>
		<td align="center"><div style="width:550" align="left">Available here are the numbers of surgeries (Prostatectomies, Cystectomies, Nephrectomies, Orchiectomies, and RPLNDs) performed at this institution in a given year.</div>
		</td>
		</tr>
		<tr>
			<td align="middle" valign="top">
									<%= resultMessage%>
								<table cellspacing="0" cellpadding="1" border="0">
								<tr>
								<td><asp:Label ID="SelectYearLabel" Runat="server"><strong>Please Select a Year:</strong></asp:Label>&nbsp;&nbsp;
								<asp:DropDownList runat="server" ID="year" AppendDataBoundItems="true" AutoPostBack="true"
                                    OnSelectedIndexChanged="SetReportOnChange">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                    <asp:ListItem Text="All" Value="All"></asp:ListItem>
                                </asp:DropDownList>
								</td>
								</tr>
								<tr>
								<td>
                                    <table cellspacing="0" cellpadding="4" border="0" style="border-right: #cccccc 1px solid;
                                        border-top: #cccccc 1px solid; border-left: #cccccc 1px solid; border-bottom: #cccccc 1px solid">
                                        <asp:Repeater ID="reportResults" runat="server">
													<ItemTemplate>
														<tr>
															<td width="50" bgcolor="ffffff"><% if(displayDate != false){%> <%# ((System.Data.DataRowView)Container.DataItem)["SurgeryYear"]%><%}%></td>
															<td width="175" bgcolor="ffffff"><%# ((System.Data.DataRowView)Container.DataItem)["SurgeryType"]%></td>
															<td width="75" align="center" bgcolor="ffffff"><%# ((System.Data.DataRowView)Container.DataItem)["SurgeryCount"]%></td>
														</tr>
													</ItemTemplate>
													<AlternatingItemTemplate>
														<tr>
															<td width="50" class="dataGridItemRowB"><% if(displayDate != false){%> <%# ((System.Data.DataRowView)Container.DataItem)["SurgeryYear"]%><%}%></td>
															<td width="175" class="dataGridItemRowB"><%# ((System.Data.DataRowView)Container.DataItem)["SurgeryType"]%></td>
															<td width="75" align="center" class="dataGridItemRowB"><%# ((System.Data.DataRowView)Container.DataItem)["SurgeryCount"]%></td>
														</tr>
													</AlternatingItemTemplate>
										</asp:Repeater>
									</table>
									</td></tr>
									</table>
				</td>
				</tr>
								
	 </table>
     </form>
	  </body>
</html>
