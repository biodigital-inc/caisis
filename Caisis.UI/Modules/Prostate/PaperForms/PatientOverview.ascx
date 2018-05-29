<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.PatientOverview" CodeFile="PatientOverview.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Caisis: Reports</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta content="NOINDEX" name="ROBOTS">
		<meta http-equiv="PRAGMAS" content="NO-CACHE">
		<meta http-equiv="EXPIRES" content="0">
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
	<link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css">
  </head>
	<body  class="reportContentBody" bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" id="ReportContentBody" runat="server">
	<table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td align="middle">
				<table cellspacing="5">
					<tr>
						<td colspan="2" align="right"><span style="font-size: 12px;font-weight: bold; color: #8d282c;"><%= patientName%></span></td>
					</tr>
					<tr>
						<td colspan="2" width="700"><span style="font-weight:bold;">Narrative</span>
							<table width="695" height="15" cellpadding="2" cellspacing="0" style="BORDER: gray 1px solid; BACKGROUND-COLOR: white">
								<tr>
									<td>
									<asp:Repeater ID="rptNarrator" runat="server">
										<ItemTemplate>
										<table>
											<tr>
												<td valign="top"><span style="TEXT-TRANSFORM: uppercase; TEXT-DECORATION: underline"><%# DataBinder.Eval(Container.DataItem, "NarratedBy") %></span><br><span><%# DataBinder.Eval(Container.DataItem, "Narrative") %></span></td>
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
					<tr>
						<td colspan="2"><span style="font-weight:bold;">History of Present Illness</span>
							<table width="695"  height="15" cellpadding="4" cellspacing="2"  style="BORDER: gray 1px solid; BACKGROUND-COLOR: white">
								<tr>
									<td>
										<asp:Repeater ID="rptHPI" runat="server">
											<ItemTemplate>
											<%# DataBinder.Eval(Container.DataItem, "PatientHPI") %>
											</ItemTemplate>
											<SeparatorTemplate>, </SeparatorTemplate>
										</asp:Repeater>									
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td valign="top"><span style="font-weight:bold;">Nomogram Scores</span>
						<table width="340"  height="15" cellpadding="2" cellspacing="0" style="BORDER: gray 1px solid; BACKGROUND-COLOR: white">
							<tr>
								<td width="60">PreRP 5:</td>
								<td><asp:Label ID="preRP5Nomo" Runat="server"></asp:Label></td>
								<td width="65">Post 2 year:</td>
								<td><asp:Label ID="postRP2yrNomo" Runat="server"></asp:Label></td>
							</tr>
							<tr>
								<td>PreRP 10:</td>
								<td><asp:Label ID="preRP10Nomo" Runat="server"></asp:Label></td>
								<td>Post 5 year:</td>
								<td><asp:Label ID="postRP5yrNomo" Runat="server"></asp:Label></td>
							</tr>
							<tr>
								<td>PreXRT:</td>
								<td><asp:Label ID="preXRTNomo" Runat="server"></asp:Label></td>
								<td>Post 7 year:</td>
								<td><asp:Label ID="postRP7yrNomo" Runat="server"></asp:Label></td>
							</tr>
							<tr>
							    <td>PreBrachy:</td>
								<td><asp:Label ID="preBrachyNomo" Runat="server"></asp:Label></td>
							    <td>Post 10 year:</td>
								<td><asp:Label ID="postRP10yrNomo" Runat="server"></asp:Label></td>
							</tr>
							</table>
						</td>
						<td valign="top"><span style="font-weight:bold;">Medications</span>
							<table width="340" height="15" cellpadding="2" cellspacing="0" style="BORDER: gray 1px solid; BACKGROUND-COLOR: white">
									<tr>
										<td>
											<asp:Repeater ID="rptMedications" runat="server">
												<ItemTemplate>
													<%# DataBinder.Eval(Container.DataItem, "Medication") %>
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
							<table width="340" height="15" cellpadding="2" cellspacing="0" style="BORDER: gray 1px solid; BACKGROUND-COLOR: white">
									<tr>
										<td>
											<asp:Repeater ID="rptAllergies" runat="server">
													<ItemTemplate>
														<%# DataBinder.Eval(Container.DataItem, "Allergen") %>
													</ItemTemplate>
													<SeparatorTemplate>, </SeparatorTemplate>
											</asp:Repeater>
										</td>
									</tr>
							</table>
						</td>
						<td valign="top"><span style="font-weight:bold;">Comorbidities</span>
							<table width="340"  height="15" cellpadding="2" cellspacing="0" style="BORDER: gray 1px solid; BACKGROUND-COLOR: white">
									<tr>
										<td>
											<asp:Repeater ID="rptComorbidities" Runat="server">
												<ItemTemplate>
													<%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>
												</ItemTemplate>
											<SeparatorTemplate>, </SeparatorTemplate>
										</asp:Repeater>
										</td>
									</tr>
							</table>
						</td>
					</tr>
					<tr>
					    <td colspan="2"><span style="font-weight:bold;">PSA Graph</span>
                            <table width="700" >
                               <tr>
                                <td>
                                      <asp:chart id="Chart1" runat="server" Height="300px" Width="675px" ImageLocation="~/TempImages/ChartPic_#SEQ(300,3)" ImageType="Png" BorderDashStyle="Solid"  BackGradientStyle="DiagonalLeft" backcolor="#5996AF" enableviewstate="True" viewstatecontent="All">
							<legends>
								<asp:legend Enabled="False" IsTextAutoFit="True" Name="Default" BackColor="#D0E1E9" BorderColor="#DDEAF0" Docking="Bottom" Font="Arial, 11px, style=Bold"  ></asp:legend>
							</legends>
				 			<borderskin skinstyle="Emboss" ></borderskin>
							<series>
							    <asp:Series  BorderWidth="3" XValueType="DateTime" Name="Series1"  BorderColor="180, 26, 59, 105" Color="220, 65, 140, 240" ShadowOffset="2" YValueType="Double"></asp:Series>
							</series>
							<chartareas>
								<asp:chartarea Name="ChartArea1" BorderColor="64, 64, 64, 64" BorderDashStyle="Solid" BackSecondaryColor="White" BackColor="AliceBlue" ShadowColor="Transparent" BackGradientStyle="TopBottom">
									<axisy2 enabled="False"></axisy2>
									<axisx2 enabled="False"></axisx2>
									<area3dstyle Rotation="10" perspective="10" Inclination="15" IsRightAngleAxes="False" wallwidth="0" IsClustered="False"></area3dstyle>
									<axisy linecolor="64, 64, 64, 64" IsLabelAutoFit="False" ArrowStyle="None"  >
										<labelstyle font="Arial, 8.25pt, style=Bold" />
										<majorgrid linecolor="64, 64, 64, 64" />
									</axisy>
									<axisx linecolor="64, 64, 64, 64" IsLabelAutoFit="False" ArrowStyle="None">
										<labelstyle font="Arial, 8.25pt, style=Bold" IsStaggered="false" />
										<majorgrid linecolor="64, 64, 64, 64" />
									</axisx>
								</asp:chartarea>
							</chartareas>
						</asp:chart>
                                </td>
                               </tr>
					        </table>
					    
					    </td>
					</tr>
					<tr>
						<td colspan="2"><span style="font-weight:bold;">Chronological History (most relevant items)</span>
							<table width="700" cellpadding="2" cellspacing="1"  style="BORDER: gray 1px solid; BACKGROUND-COLOR: #cccccc">
								<tr> 
										<td width="75" align="center" class="blackBoldText" bgcolor="#ffffff">Date</td>
										<td width="160" align="center" class="blackBoldText" bgcolor="#ffffff">Variable</td>
										<td width="300" align="center" class="blackBoldText" bgcolor="#ffffff">Value</td>
										<td width="100" align="center" class="blackBoldText" bgcolor="#ffffff">Quality</td>
									</tr>
									<asp:Repeater ID="rptChrono" runat="server">
										<ItemTemplate>
											<tr>
												<td bgcolor="#ffffff" align="left">&nbsp;<%# DataBinder.Eval(Container.DataItem, "varDate") %></td>
												<td bgcolor="#ffffff" align="left">&nbsp;<img src="../../Images/icon_<%# DataBinder.Eval(Container.DataItem, "tableName") %>.png" border="0" title="<%# DataBinder.Eval(Container.DataItem, "tableName") %>" width="11" height="11" align="absmiddle">&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "varName") %></td>
												<td bgcolor="#ffffff" align="left">&nbsp;<%# DataBinder.Eval(Container.DataItem, "varValue") %></td>
												<td bgcolor="#ffffff" align="left">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Quality") %></td>
											</tr>
										</ItemTemplate>
									</asp:Repeater>
									<tr bgcolor="#E8E8E8" > 
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
			</td>
		</tr>
    </table>
  </body>
</html>
