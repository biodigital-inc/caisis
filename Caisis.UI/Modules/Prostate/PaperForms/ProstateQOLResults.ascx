<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProstateQOLResults.ascx.cs" Inherits="Caisis.UI.Modules.Prostate.PaperForms.ProstateQOLResults" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>
<%@ Register TagPrefix="chart" Namespace="Caisis.UI.Core.Utilities" %>
<style type="text/css">
#surveySectionTable
{
	vertical-align: top;
	padding: 10px 10px 10px 0px;
	/*border-bottom: dotted 1px #666666;*/
	font-size: 11pt;
}
#surveySectionTable
{
}
ul
{
	margin-top: 0px;
	margin-bottom: 10px;
	list-style-position: inside;
	list-style-type: square;
	margin-left: 0;
	padding-left: 1.2em;
	text-indent: -1.5em;
}
.ReportHeader
{
	width: 100%;
}
.ReportHeader td
{
	padding: 3px 0px 2px 0px
}
.ReportOuterTableRow
{
	padding: 10px 10px 8px 10px;
	border: solid 1px #000000;
	border-right: solid 2px #000000;
	border-top: none;
	background-color: #ffffff;
}

.ReportOuterTableTopRow
{
	padding: 0px 10px 0px 10px;
	border: solid 1px #000000;
	border-right: solid 2px #000000;
	background-color: #ffffff;
}

.reportSectionTitle
{
	font-size: 14px;
	font-weight: bold;
	display: block;
	margin-bottom: 8px;
}
/* override form style */
.surveyResponses td,th
{
	font-size: 10pt;
	border-bottom: solid 1px #999999;
}
/* override form style */
td
{
	font-size:10pt;
}
</style>

<div id="PaperFormStart">

<div id="FirstPage" runat="server" align="left"  style="page-break-after:always;">
  <table id="reportTable" runat="server"  class="masterTable" border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
  <tr>
  <td style="text-align:center;"><font size="-2">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td  class="ReportOuterTableTopRow">
	  
	  
		  <table class="ReportHeader" cellspacing="0" >
		  <tr>
						<td>
							<span style="font-size: 18px; font-weight: bold; color: #8d282c;"><asp:Label ID="PatientDisplayNameLabel" runat="server" /></span>
							
						</td>
						<td>
							<span style="font-size: 18px; font-weight: bold; color: #8d282c;">MRN:&nbsp;<asp:Label ID="PatientMRNLabel" runat="server" /></span>
						</td>
					</tr>
					<tr>
					   <td><span style="font-weight: bold;"><asp:Label ID="PatientAgeLabel" runat="server" /></span></td>
					    <td><span style="font-weight: bold;">Today's date:&nbsp;<asp:Label ID="AppointmentDateLabel" runat="server" /></span></td>
					</tr>
					<tr>
						<td><span style="font-weight: bold;">Current PSA:&nbsp;<asp:Label ID="CurrentPSALabel" runat="server" Text="N/A" /></span></td>
						<td><span style="font-weight: bold;">Surgery:&nbsp;<asp:Label ID="RPTypeDateLabel" runat="server" /></span></td>
					</tr>

		</table>
	  
	  </td>
    </tr>
	<tr> 
      <td class="ReportOuterTableRow">
	  
		<table cellspacing="0">
			<tr>
			    <td style="padding-right:75px">
			        <span class="reportSectionTitle"  style="font-weight: bold;">Pathology</span>
			    </td>
				<td style="padding: 4px 20px 4px 0px;"><asp:Label ID="GleasonScoreLabel" runat="server" /></td>
				<td  style="padding: 4px 20px 4px 20px;"><asp:Label ID="PathologicalStageLabel" runat="server" /></td>
				<td  style="padding: 4px 20px 4px 20px;">PSA Before Surgery:&nbsp;<asp:Label ID="PreSurgeryPSALabel" runat="server" Text="N/A" /></td>
			</tr>
		</table>
	  </td>
	</tr>
	<tr id="AlertTableRow" runat="server">
		<td class="ReportOuterTableRow">
			<table cellspacing="0">
			    <tr>
			        <td style="padding-right:100px">
			            <span class="reportSectionTitle" style="font-weight: bold;" >Alerts</span>
			        </td>
			        <td>
			            <ul>
								<asp:Repeater ID="AlertRepeater" runat="server">
									<ItemTemplate>
									<li><%# Container.DataItem  %></li>
									</ItemTemplate>
								</asp:Repeater>
					    </ul>
			        </td>
			    </tr>
			
			</table>
			
							
						</td>
					</tr>
						<tr id="SurveyAnalysisTableRow" runat="server" >
						<td class="ReportOuterTableRow">
							<span class="reportSectionTitle"  style="font-weight: bold;">Surveys<span style="margin-left: 80px; font-size: smaller; font-weight: normal;"><asp:Label ID="LastSurveyDateLabel" Text="This patient has not previously completed a Prostate QOL Survey." runat="server" /></span></span>
							<table border="0" id="surveySectionTable" cellspacing="0"  width="100%" style="border-top: dotted 1px #666666;">
								<tr>
									<td style="width:200px">
										<strong>Erectile Function</strong><br/><br/>
										<ul>
											<li>Baseline Physician:<br /><asp:Label ID="BaselinePhysicianEFScore" Text="N/A" runat="server"></asp:Label></li>
											<li>Baseline Patient:<br /><asp:Label ID="BaselinePatientEFScore" Text="N/A" runat="server"></asp:Label></li>
											<li id="CurrentPenetrationBullet" runat="server"><asp:Label ID="CurrentPenetrationStatus" runat="server" /></li>
											<li>Injections: <asp:Label ID="CurrentInjectionStatus" runat="server" Text="None" /></li>
											<li>Current Score: <asp:Label ID="CurrentEFScore" Text="N/A" runat="server"></asp:Label></li>
											<li id="EFPredictionBullet" runat="server"><asp:Label ID="EFPredictionLabel" Text="1Yr Prediction from month:" runat="server" /><br /> <asp:Label ID="EFPrediction" runat="server"></asp:Label></li>
										</ul>									
									</td>
									<td style="width:550px; text-align:right">
										<chart:CaisisChart ID="EFChart" runat="server" BorderDashStyle="Solid" backcolor="#ffffff"
                                                             Height="240px" Width="550px" >
                                                             <Legends>
                                                                 <asp:Legend Enabled="True" Docking="Top" Alignment="Center"  Name="Legend1">                                                                 </asp:Legend>
                                                             </Legends>
                                                            <Series>
                                                                <asp:Series Name="Actual" ChartType="Line" Color="#C43E06" Legend="Legend1" 
                                                                    XValueMember="Months" YValueMembers="Score" IsValueShownAsLabel="true" LabelForeColor="#C43E06" MarkerStyle="Circle" MarkerSize="5">
                                                                    <SmartLabelStyle Enabled="true" CalloutLineAnchorCapStyle="None" CalloutStyle="None" />
                                                                </asp:Series>
                                                                <%-- todo: make this dynamic, e.g. AddCustomSeries(chart, sequence of tuples) --%>
                                                                <%--<asp:Series Name="Experimental" ChartType="Line" Color="Blue" IsValueShownAsLabel="true" LabelForeColor="Blue" MarkerStyle="Square">
                                                                    <Points>
                                                                        <asp:DataPoint XValue="3" YValues="10" />
                                                                        <asp:DataPoint XValue="6" YValues="15" />
                                                                        <asp:DataPoint XValue="9" YValues="20" />
                                                                    </Points>
                                                                </asp:Series>--%>
                                                            </Series>
                                                            <ChartAreas>
                                                                <asp:ChartArea Name="ChartArea1" BackSecondaryColor="White" BackColor="AliceBlue" ShadowColor="Transparent" BackGradientStyle="TopBottom">
                                                                    <AxisY Title="Erectile Function" Minimum="0" Maximum="30" LabelAutoFitMinFontSize="8" LabelAutoFitStyle="DecreaseFont">
																		<MajorTickMark Enabled="false" />
																		<MinorTickMark Enabled="false" />
																		<MajorGrid Enabled="false" />
																		<MinorGrid Enabled="false" />
																		<CustomLabels>
																			<asp:CustomLabel GridTicks="GridLine" FromPosition="-2" ToPosition="2" Text="0"  />
																			<asp:CustomLabel GridTicks="GridLine" FromPosition="10" ToPosition="14" Text="12" />
																			<asp:CustomLabel GridTicks="GridLine" FromPosition="16" ToPosition="20" Text="18" />
																			<asp:CustomLabel GridTicks="GridLine" FromPosition="22" ToPosition="26" Text="24" />
																			<asp:CustomLabel GridTicks="GridLine" FromPosition="28" ToPosition="32" Text="30" />
																		</CustomLabels>
                                                                    </AxisY>
                                                                    <AxisY2 Enabled="True" Minimum="0" Maximum="30" IsLabelAutoFit="false">
																		<MajorTickMark Enabled="false" />
																		<MinorTickMark Enabled="false" />
																		<MajorGrid Enabled="false" />
																		<MinorGrid Enabled="false" />
																		<CustomLabels>
																			<asp:CustomLabel GridTicks="None" FromPosition="0" ToPosition="12" Text=" Poor" />
																			<asp:CustomLabel GridTicks="None" FromPosition="12" ToPosition="18" Text=" Moderate" />
																			<asp:CustomLabel GridTicks="None" FromPosition="18" ToPosition="24" Text=" Intermediate" />
																			<asp:CustomLabel GridTicks="None" FromPosition="24" ToPosition="30" Text=" Good" />
																		</CustomLabels>
																		<StripLines>
																			<asp:StripLine IntervalOffset="0" StripWidth="12" BackColor="Transparent" BorderColor="#999999"/>
																			<asp:StripLine IntervalOffset="12" StripWidth="18" BackColor="Transparent" BorderColor="#999999"/>
																			<asp:StripLine IntervalOffset="18" StripWidth="24" BackColor="Transparent" BorderColor="#999999"/>
																			<asp:StripLine IntervalOffset="24" StripWidth="30" BackColor="Transparent" BorderColor="#999999"/>
																		</StripLines>
                                                                    </AxisY2>
                                                                    <AxisX Title="Months Since Surgery" Minimum="0" IsLabelAutoFit="false" Interval="3" IntervalAutoMode="VariableCount" >
																		<MajorGrid Enabled="false" />
																		<MinorGrid Enabled="false" />
																		<MajorTickMark Enabled="true" Interval="3" />
																		<%--<LabelStyle Interval="6" IsStaggered="false" />--%>
                                                                    </AxisX>
                                                                </asp:ChartArea>
                                                            </ChartAreas>
                                                        </chart:CaisisChart>									</td>
								</tr>
								<tr >
									<td style="width:200px; border-top: dotted 1px #666666;">
										<strong>Urinary Function</strong><br/><br/>
										<ul>
											<li>Baseline Physician:<br /> <asp:Label ID="BaselinePhysicianUFScore" Text="N/A" runat="server"></asp:Label></li>
											<li>Baseline Patient:<br /><asp:Label ID="BaselinePatientUFScore" Text="N/A" runat="server"></asp:Label></li>
											<li id="PadStatusBullet" runat="server"><asp:Label ID="CurrentPadStatus" runat="server" /></li>
											<li>Current Score: <asp:Label ID="CurrentUFScore" Text="N/A" runat="server"></asp:Label></li>
											<li id="UFPredictionBullet" runat="server"><asp:Label ID="UFPredictionLabel" Text="1Yr Prediction from month:" runat="server" /><br/> <asp:Label ID="UFPrediction" runat="server"></asp:Label></li>
										</ul>									
									</td>
									<td style="width:550px; text-align:right; border-top: dotted 1px #666666;">
										<chart:CaisisChart ID="UFChart" runat="server" BackColor="#ffffff" 
                                                             Height="240px" Width="550px">
                                                             <Legends>
                                                                 <asp:Legend Enabled="True" LegendStyle="Row" Alignment="Center" Docking="Top" Name="Legend1">                                                                 </asp:Legend>
                                                             </Legends>
                                                            <Series>
                                                                <asp:Series Name="Actual" ChartType="Line" Color="#C43E06" Legend="Legend1" 
                                                                    XValueMember="Months" YValueMembers="Score" IsValueShownAsLabel="true" LabelForeColor="#C43E06" MarkerStyle="Circle" MarkerSize="4">
                                                                    <SmartLabelStyle Enabled="true" CalloutLineAnchorCapStyle="None" CalloutStyle="None" />
                                                                </asp:Series>
                                                            </Series>
                                                            <ChartAreas>
                                                                <asp:ChartArea Name="ChartArea2"  BackSecondaryColor="White" BackColor="AliceBlue" ShadowColor="Transparent" BackGradientStyle="TopBottom">
                                                                    <AxisY Title="Urinary Function" Minimum="0" Maximum="21" LabelAutoFitMinFontSize="10">
																		<MajorTickMark Enabled="false" />
																		<MinorTickMark Enabled="false" />
																		<MajorGrid Enabled="false" />
																		<MinorGrid Enabled="false" />
																		<CustomLabels>
																			<asp:CustomLabel GridTicks="GridLine" FromPosition="-1" ToPosition="1" Text="0" />
																			<asp:CustomLabel GridTicks="GridLine" FromPosition="9" ToPosition="11" Text="10" />
																			<asp:CustomLabel GridTicks="GridLine" FromPosition="15" ToPosition="17" Text="16" />
																			<asp:CustomLabel GridTicks="GridLine" FromPosition="20" ToPosition="22" Text="21" />
																		</CustomLabels>
                                                                    </AxisY>
                                                                    <AxisY2 Enabled="True" Minimum="0" Maximum="21" IsLabelAutoFit="false">
																		<MajorTickMark Enabled="false" />
																		<MinorTickMark Enabled="false" />
																		<MajorGrid Enabled="false" />
																		<MinorGrid Enabled="false" />
																		<CustomLabels>
																			<asp:CustomLabel GridTicks="None" FromPosition="0" ToPosition="10" Text=" Poor" />
																			<asp:CustomLabel GridTicks="None" FromPosition="10" ToPosition="16" Text=" Moderate" />
																			<asp:CustomLabel GridTicks="None" FromPosition="16" ToPosition="21" Text=" Good" />
																		</CustomLabels>
																		<StripLines>
																			<asp:StripLine IntervalOffset="0" StripWidth="10" BackColor="Transparent" BorderColor="#999999"/>
																			<asp:StripLine IntervalOffset="10" StripWidth="6" BackColor="Transparent" BorderColor="#999999"/>
																			<asp:StripLine IntervalOffset="16" StripWidth="5" BackColor="Transparent" BorderColor="#999999"/>
																		</StripLines>
                                                                    </AxisY2>
                                                                    <AxisX Title="Months Since Surgery" Minimum="0" IsLabelAutoFit="false" Interval="3" IntervalAutoMode="VariableCount">
																		<MajorGrid Enabled="false" />
																		<MinorGrid Enabled="false" />
																		<MajorTickMark Enabled="true" Interval="3" />
																		<%--<LabelStyle Interval="3" IsStaggered="false" />--%>
                                                                    </AxisX>
                                                                </asp:ChartArea>
                                                            </ChartAreas>
                                                        </chart:CaisisChart>
                                                       </td>
								</tr>
								<tr>
									<td style="width:100%; border-top: dotted 1px #666666; padding-top:10px" colspan="2" >
									    <table cellpadding="0" cellspacing="0" width="100%" >
									        <tr>
									            <td style="width:50%;">
										            <span style="font-weight:bold; padding-right:5px;">Bowel Function:</span>
										                <asp:Label ID="CurrentBFScore" Text="N/A" runat="server" /></td>	   
									            <td style="width:50%;" >
										            <span style="font-weight:bold; padding-right:5px;">Quality of Life:</span>
				                                         Current Score: <asp:Label ID="CurrentGeneralScore" Text="N/A" runat="server" /></td>
							                </tr>
									    </table>
									</td>
										
								</tr>
							</table>

						</td>
					</tr>
						<tr id="NomogramTableRow" runat="server">
						<td class="ReportOuterTableRow">
							<!-- nomogram scores -->
							<!-- pre 5,10 --><!-- post 2,5,7,10 -->
							<%--<table cellpadding="2" style="border: gray 1px solid; background-color: white;" width="100%">
								<tr>
									<td width="20%">&nbsp;</td>
									<td width="40%">PreRP 5 Yr: <asp:Label ID="Pre5Result" runat="server" /></td>
									<td width="40%">PostRP 2 Yr: <asp:Label ID="Post2Result" runat="server" /></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>PreRP 10 Yr: <asp:Label ID="Pre10Result" runat="server" /></td>
									<td>PostRP 5 Yr: <asp:Label ID="Post5Result" runat="server" /></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>PostRP 7 Yr: <asp:Label ID="Post7Result" runat="server" /></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>PostRP 10 Yr: <asp:Label ID="Post10Result" runat="server" /></td>
								</tr>
							</table>--%>
							<table cellspacing="0">
							<tr>
							    <td>
						            <span class="reportSectionTitle"  style="font-weight: bold; padding-right:20px;">Nomogram Scores</span>
							    </td>
								<td style="padding: 4px 10px 4px 0px;">
											<span style="font-weight: bold;">PreRP</span><br />
											<span>5 Yr: </span><asp:Label ID="Pre5Result" runat="server" />&nbsp;&nbsp;&nbsp;
											<%--<span>10 Yr: </span><asp:Label ID="Pre10Result" runat="server" />--%>
								</td>
								<td style="padding: 4px 10px 4px 0px;">
											<span style="font-weight: bold;">PostRP</span><br />
											<span>5 Yr: </span><asp:Label ID="Post5Result" runat="server" />&nbsp;&nbsp;&nbsp;
								</td>
								<td  style="padding: 4px 10px 4px 10px;">

											<span style="font-weight: bold;">Current</span><br />
											<span id="Show2Yr" runat="server">2 Yr: </span><asp:Label ID="Current2Result" runat="server" />
											<span id="Show5Yr" runat="server">5 Yr: </span><asp:Label ID="Current5Result" runat="server" />
											<span id="Show7Yr" runat="server">7 Yr: </span><asp:Label ID="Current7Result" runat="server" />
											<span id="Show10Yr" runat="server">10 Yr: </span><asp:Label ID="Current10Result" runat="server" />
								</td>
							</tr>
							</table>
						</td>
					</tr>
					
					
					<tr> 
      <td class="ReportOuterTableRow" style="padding: 0px 0px 0px 0px;"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td colspan="2" valign="top" class="blackBoldText" style="padding: 30px 4px 3px 4px;">Biochemical 
              Markers / Lab Tests <span style="margin-left: 20px; font-size: 12px; color: #333333; font-weight: normal;"><asp:Literal id="LabTestHeaderNote" runat="server" Visible="false">(Last 3 PSA Values)</asp:Literal></span></td>
          </tr>
          <tr > 
            <td valign="top"><table width="100%" border="0" cellpadding="1" cellspacing="0" >
                <asp:Repeater ID="labTests" Runat="server">
				  <HeaderTemplate>
				  <tr > 
                  <td style="text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Date</td>
                  <td style="text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Marker</td>
                  <td style="text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Value</td>
                  <td style="text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Data Source</td>
                   </tr>
				  </HeaderTemplate>
                  <ItemTemplate> 
                    <tr> 
                      <td style="padding:5px 0px 5px 0px; text-align: center;" class="FormInsideTableRegCell"> <%# DataBinder.Eval(Container.DataItem, "LabDateText") %></td>
                      <td style="padding:5px 0px 5px 0px; text-align: center;" class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "LabTest") %></td>
                      <td style="padding:5px 0px 5px 0px; text-align: center;" class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "LabResult") %><%# DataBinder.Eval(Container.DataItem, "LabUnits") %></td>
                      <td style="padding:5px 0px 5px 0px; text-align: center;" class="FormInsideTableRegCell"><%# DataBinder.Eval(Container.DataItem, "LabQuality") %></td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
				<tr id="NoLabTestMessage" runat="server" visible="false">
					<td style="text-align: center; font-size: 13px; font-weight: bold; padding: 10px 0px 10px 0px;">No PSA values have been recorded for this patient.</td>
				</tr>
				<tbody id="PSABlankRows" runat="server" visible="false">
                    <tr> 
                      <td height="27" align="center" class="FormInsideTableRegCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height="27" align="center" class="FormInsideTableRegCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height="27" align="center" class="FormInsideTableRegCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell">&nbsp;</td>
                      <td class="FormInsideTableRegCell">&nbsp;</td>
                    </tr>
				</tbody>
              </table></td>
          </tr>
        </table></td>
    </tr>					
					
					
					<tr> 
      <td class="FormOuterTableRow" style="border: 0px 2px 0px 0px;">
	  
	  <style type="text/css" media="all">
	  table#ProblemPlanPopulatedTable
	  {
	  	border: solid 1px #333333;
		border-collapse: collapse;
	  }
	  
	  table#ProblemPlanPopulatedTable td
	  {
	  	border-top: solid 1px #333333;
	  	border-right: solid 1px #333333;
	  }
	  table#ProblemPlanPopulatedTable td.problemFillerCell
	  {
	  	border-top: none;
	  }
	  </style>
	  
	  
	  <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0" id="ProblemPlanPopulatedTable">
          <tr>
            <td colspan="3" class="blackBoldText" style="padding: 30px 4px 3px 4px;">Impression &amp; Plan <span style="font-size: 12px; margin-left: 20px;"><asp:Literal ID="ProblemPlanNote" runat="server"></asp:Literal></span></td>
          </tr>
          <tr>
            <td style="width: 50%; text-align: center; font-weight: bold;" >Diagnoses / Problem List</td>
            <td style="width: 50%; text-align: center; font-weight: bold;" >Plan &amp; Referrals</td>
          </tr>
		  
          <asp:Repeater ID="RptProblems" Runat="server"> 
            <ItemTemplate> 
          <tr>
            <td <%# DataBinder.Eval(Container.DataItem, "ProblemDisplayName").ToString().Length < 1 ? "class=\"problemFillerCell\"" : "" %>><%# DataBinder.Eval(Container.DataItem, "ProblemDisplayName") %>&nbsp;</td>
            <td ><%# DataBinder.Eval(Container.DataItem, "PlanName") %>&nbsp;</td>
            </tr>
            </ItemTemplate>
          </asp:Repeater>
		  
		  
		  <tbody id="noProblemPlans" runat="server" >
          <tr>
            <td style="height: 40px;" >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td style="height: 40px;" >&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
		  </tbody>
      </table>
	  
	  </td>
    </tr>
					

	<tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">Page <span id="PageNumber">1</span> of <span id="TotalPages">2</span></td>
    </tr>
  </table>
</div>
<div  id="LastPageInForm" runat="server" align="left" >
  <table id="reportTable2" runat="server"  class="masterTable" border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
  <tr>
  <td style="text-align:center;"><font size="-2">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td  class="ReportOuterTableTopRow">
	  
	  
		  <table cellspacing="0" class="ReportHeader" >
		  <tr>
						<td>
							<span style="font-size: 18px; font-weight: bold; color: #8d282c;"><% =PatientDisplayNameLabel.Text %></span>
							
						</td>
						<td>
							<span style="font-size: 18px; font-weight: bold; color: #8d282c;">MRN:&nbsp;<% =PatientMRNLabel.Text %></span>
						</td>
					</tr>
					<tr>
					    <td><span style="font-weight: bold;"><% =PatientAgeLabel.Text %></span></td>
					    <td><span style="font-weight: bold;">Today's date:&nbsp;<% =AppointmentDateLabel.Text %></span></td>
					</tr>
					<tr>
						<td><span style="font-weight: bold;">Current PSA:&nbsp;<% =CurrentPSALabel.Text %></span></td>
						<td><span style="font-weight: bold;">Surgery:&nbsp;<% = RPTypeDateLabel.Text %></span></td>
					</tr>
		</table>
	  
	  </td>
    </tr>
				<tr id="SurveyResponsesTableRow" runat="server">
						<td  class="ReportOuterTableRow">
							<!-- survey item repeater: num, text, narrative response -->
							<asp:Repeater ID="SurveyResponsesRepeater" runat="server">
								<HeaderTemplate>
									<span class="reportSectionTitle" style="font-weight: bold;"><% if (LastSurveyIsBaseline) { %>Baseline<% } else { %>Recent<% } %> Survey Responses from <%= LastSurveyDate.Value.ToLongDateString() %>.</span>
									<table class="surveyResponses" width="100%" cellpadding="3" cellspacing="0" style="border: gray 1px solid; background-color: white; font-size: 10px;">
										<tr>
											<th width="5%" align="left">#</th>
											<th width="68%" align="left">Question</th>
											<th width="27%" align="left">Response</th>
										</tr>
								</HeaderTemplate>
								
								<ItemTemplate>
										<tr style="background-color: #f8f8f8;" >
											<td style="vertical-align:top;"><%# DataBinder.Eval(Container.DataItem, "QuestionNum") %></td>
											<td style="padding-right: 20px; vertical-align:top;"><%# DataBinder.Eval(Container.DataItem, "QuestionText") %></td>
											<td style="vertical-align:top;"><%# DataBinder.Eval(Container.DataItem, "QuestionResult") %>&nbsp;</td>
										</tr>
								</ItemTemplate>
								
								<AlternatingItemTemplate>
										<tr>
											<td style="vertical-align:top;"><%# DataBinder.Eval(Container.DataItem, "QuestionNum") %></td>
											<td style="padding-right: 20px; vertical-align:top;"><%# DataBinder.Eval(Container.DataItem, "QuestionText") %></td>
											<td style="vertical-align:top;"><%# DataBinder.Eval(Container.DataItem, "QuestionResult") %>&nbsp;</td>
										</tr>
								</AlternatingItemTemplate>
								
								<FooterTemplate>
									</table>
								</FooterTemplate>
							</asp:Repeater>
						</td>
					</tr>
					
					

    					
						<tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">Page <span id="PageNumber">2</span> of <span id="TotalPages">2</span></td>
    </tr>
</table>
<table id="NoRPErrorContainer" runat="server"  visible="false"  class="masterTable" border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
  <tr>
  <td style="text-align:center;"><font size="-2">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
  <tr>
  <td style="text-align:center;">DRAFT: FOR TESTING PURPOSES ONLY</td>
  </tr>
    <tr> 
      <td  class="ReportOuterTableTopRow" style="background-color: #f8f8f8;">
	  
	  
		  <table cellspacing="0" class="ReportHeader" >
		  <tr>
						<td>
							<span style="font-size: 18px; font-weight: bold; color: #8d282c;"><asp:Label ID="ErrorPatientName" runat="server" /></span>
							
						</td>
						<td>
							<span style="font-size: 18px; font-weight: bold; color: #8d282c;">MRN:&nbsp;<asp:Label ID="ErrorPatientMRN" runat="server" /></span>
						</td>
					</tr>
					<tr>
					    <td><span style="font-weight: bold;">Today's date:&nbsp;<asp:Label ID="ErrorTodaysDate" runat="server" /></span></td>
					</tr>
					<tr>
						<td><span style="font-weight: bold;">This patient did not have an RP.</span></td>
						<td>&nbsp;</td>
		</tr>
		
		</table>
	  
	  </td>
    </tr>
	<tr> 
      <td class="ReportOuterTableRow" style="height: 800px; text-align: center; vertical-align: middle; background-color: #f8f8f8; font-size: 18px;">

			<span style="width: 500px;">A Prostate QOL Report could not be generated: no radical prostatectomy has been recorded for this patient.</span>

	  </td>
	</tr>
</table>
</div>


</div>
