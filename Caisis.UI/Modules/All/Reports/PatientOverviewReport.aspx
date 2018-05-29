<%@ Page language="C#" Inherits="Caisis.UI.Modules.All.Reports.PatientOverviewReport" CodeFile="PatientOverviewReport.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<%@ Register TagPrefix="chart" Namespace="Caisis.UI.Core.Utilities" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Patient Overview Report</title>
    <link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
</head>
	<body class="reportContentBody" id="ReportContentBody" style="background-color: transparent;" runat="server">
	<form runat="server">
			<div style="margin: auto; width: 700px;">
				<table cellspacing="5">
					<tr>
						<td colspan="2" align="right"><span style="font-size: 12px;font-weight: bold; color: #8d282c;"><%= patientName%></span></td>
					</tr>
					<tr id="NarrativeTable" runat="server" visible="false">
						<td colspan="2" width="700">
						<span style="font-weight:bold;">Narrative</span>
							<table width="695" height="15" cellpadding="2" cellspacing="0" style="BORDER: gray 1px solid; BACKGROUND-COLOR: white">
								<tr>
									<td>
									<asp:Repeater ID="rptNarrator" runat="server">
										<ItemTemplate>
										<table>
											<tr>
												<td valign="top">
                                                    <span style="text-transform: uppercase; text-decoration: underline">
                                                        <%# Eval("EnteredTime", "{0:d}") %>
                                                        <%# Eval("NarratedBy") %>
                                                    </span>: <span>
                                                        <%# Eval("Narrative") %>
                                                    </span>
                                                </td>
												<td>&nbsp;</td>
											</tr>
										</table>
										</ItemTemplate>
									</asp:Repeater>	
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr id="NomogramTable" runat="server" visible="false">
                        <td colspan="2">
                            <span style="font-weight: bold;">Nomogram Scores</span>
                            <table width="695" height="15" cellpadding="2" cellspacing="0" style="border: gray 1px solid;
                                background-color: white">
                                <tr>
                                    <td width="60">
                                        PreRP 5:
                                    </td>
                                    <td>
                                        <asp:Label ID="preRP5Nomo" runat="server"></asp:Label>
                                    </td>
                                    <td width="65">
                                        Post 2 year:
                                    </td>
                                    <td>
                                        <asp:Label ID="postRP2yrNomo" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        PreRP 10:
                                    </td>
                                    <td>
                                        <asp:Label ID="preRP10Nomo" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        Post 5 year:
                                    </td>
                                    <td>
                                        <asp:Label ID="postRP5yrNomo" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        PreXRT:
                                    </td>
                                    <td>
                                        <asp:Label ID="preXRTNomo" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        Post 7 year:
                                    </td>
                                    <td>
                                        <asp:Label ID="postRP7yrNomo" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        PreBrachy:
                                    </td>
                                    <td>
                                        <asp:Label ID="preBrachyNomo" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        Post 10 year:
                                    </td>
                                    <td>
                                        <asp:Label ID="postRP10yrNomo" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
					</tr>
					<tr>
                        <td valign="top" colspan="<%= MedicationsTable.Visible ? 1 : 2  %>">
                            <span style="font-weight: bold;">History of Present Illness</span>
                            <table width="<%= MedicationsTable.Visible ? "340" : "695"  %>" height="15" cellpadding="2" cellspacing="0" style="border: gray 1px solid;
                                background-color: white">
                                <tr>
                                    <td>
                                        <asp:Repeater ID="rptHPI" runat="server">
                                            <ItemTemplate>
                                                <%# Eval("PatientHPI") %>
                                            </ItemTemplate>
                                            <SeparatorTemplate>
                                                ,
                                            </SeparatorTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                            </table>
                        </td>
						<td runat="server" id="MedicationsTable" valign="top">
						    <span style="font-weight:bold;">Medications</span>
                            <table width="340" height="15" cellpadding="2" cellspacing="0" style="border: gray 1px solid;
                                background-color: white">
                                <tr>
										<td>
											<asp:Repeater ID="rptMedications" runat="server">
												<ItemTemplate>
													<%# Eval("Medication") %>
												</ItemTemplate>
												<SeparatorTemplate>, </SeparatorTemplate>
											</asp:Repeater>
										</td>
									</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td valign="top"><span style="font-weight:bold;">Allergies</span>
                            <table width="340" height="15" cellpadding="2" cellspacing="0" style="border: gray 1px solid;
                                background-color: white">
                                <tr>
										<td>
											<asp:Repeater ID="rptAllergies" runat="server">
													<ItemTemplate>
														<%# Eval("Allergen") %>
													</ItemTemplate>
													<SeparatorTemplate>, </SeparatorTemplate>
											</asp:Repeater>
										</td>
									</tr>
							</table>
						</td>
						<td valign="top"><span style="font-weight:bold;">Comorbidities</span>
                            <table width="340" height="15" cellpadding="2" cellspacing="0" style="border: gray 1px solid;
                                background-color: white">
                                <tr>
										<td>
											<asp:Repeater ID="rptComorbidities" Runat="server">
												<ItemTemplate>
													<%# Eval("Comorbidity") %>
												</ItemTemplate>
											<SeparatorTemplate>, </SeparatorTemplate>
										</asp:Repeater>
										</td>
									</tr>
							</table>
						</td>
					</tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="LabChartLabel" runat="server" style="font-weight: bold;">Lab Graph</asp:Label>
                          
                            <asp:Panel ID="LabChartPanel" runat="server">
                                <iframe runat="server" id="LabChartFrame" src="../../../Plugins/PSAGraph/PatientChart.aspx?showHeader=false&height=300&width=590" width="680" height="320" style="border:0px" scrolling="no" marginheight="0" marginwidth="0" frameborder="0"></iframe>
                            </asp:Panel>
                        </td>
                    </tr>
					<tr>
						<td colspan="2"><span style="font-weight:bold; display: block; width: 250px; float: left;">Chronological History</span>
                            <asp:RadioButtonList runat="server" ID="ChronType" AutoPostBack="true" OnSelectedIndexChanged="BuildChronList"
                                RepeatDirection="Horizontal" RepeatLayout="Table" Style="float: right; display: block;
                                width: 200px;">
                                <asp:ListItem Text="List All" Value="ListAll" ></asp:ListItem>
                                <asp:ListItem Text="List Most Relevant" Value="ListCommon" Selected="True"></asp:ListItem>
                            </asp:RadioButtonList>
                            <table width="700" cellpadding="2" cellspacing="1" style="border: gray 1px solid; background-color: #cccccc">
                                <tr> 
										<td width="75" align="center" class="blackBoldText" bgcolor="#ffffff">Date</td>
										<td width="160" align="center" class="blackBoldText" bgcolor="#ffffff">Variable</td>
										<td width="300" align="center" class="blackBoldText" bgcolor="#ffffff">Value</td>
										<td width="100" align="center" class="blackBoldText" bgcolor="#ffffff">Quality</td>
									</tr>
									<asp:Repeater ID="rptChrono" runat="server">
										<ItemTemplate>
											<tr>
												<td bgcolor="#ffffff" align="left">&nbsp;<%# Eval("varDate") %></td>
												<td bgcolor="#ffffff" align="left">&nbsp;<img src="../../../Images/icon_<%# Eval("tableName") %>.png" border="0" title="<%# Eval("tableName") %>" width="11" height="11" align="absmiddle">&nbsp;&nbsp;<%# Eval("varName") %></td>
												<td bgcolor="#ffffff" align="left">&nbsp;<%# Eval("varValue") %></td>
												<td bgcolor="#ffffff" align="left">&nbsp;<%# Eval("Quality") %></td>
											</tr>
										</ItemTemplate>
									</asp:Repeater>
                                <tr style="border: 1px solid #e8e8e8;">
                                    <td colspan="4">&nbsp;</td>
									</tr>
									<% if(recordCount==0) {%>
									<tr> 
										<td bgcolor="#FFFFff" colspan="4" align="center">&nbsp;No relevant records for this patient</td>
									</tr>
									<% } %>
								</table>	
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">NOT AN OFFICIAL PART OF THE PATIENT MEDICAL RECORD</td>
						</tr>
				</table>
	</div>
	</form>
  </body>
</html>
