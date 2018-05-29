<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ActiveSurveillanceSurvivorship.ascx.cs" Inherits="Caisis.UI.Modules.Prostate.PaperForms.ActiveSurveillanceSurvivorship" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>
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
					    <span style="font-size: 18px; font-weight: bold; color: #8d282c;">
					        <asp:Label ID="PatientDisplayNameLabel" runat="server">
					            <%= PatientDisplayName %>
					        </asp:Label>
					    </span>
				    </td>
				    <td>
					    <span style="font-size: 18px; font-weight: bold; color: #8d282c;">MRN:&nbsp;<asp:Label ID="PatientMRNLabel" runat="server"><%= PatientMRN %></asp:Label></span>
				    </td>
			    </tr>
			    <tr>
			        <td><span style="font-weight: bold;">
			                <asp:Label ID="PatientAgeLabel" runat="server">
			                    <%= 
			                        string.Format("{0} year{1}old, {2} month{3}since diagnosis",
                                                  PatientAge, 
			                                      HandlePlural(PatientAge),
                                                  MonthsSinceDiagnosis,
                                                  HandlePlural(MonthsSinceDiagnosis))
			                    %>
			                </asp:Label>
			            </span>
			        </td>
			        <td>
			            <span style="font-weight: bold;">Today's date:&nbsp;
			                <asp:Label ID="AppointmentDateLabel" runat="server">
			                    <%= DateTime.Now.ToLongDateString() %>
			                </asp:Label>
			            </span>
			        </td>
			    </tr>
			    <tr>
				    <td>
				        <span style="font-weight: bold;">Current PSA:&nbsp;
				            <asp:Label ID="CurrentPSALabel" runat="server">
				                <%= string.IsNullOrEmpty(CurrentPSA) ? "N/A" : CurrentPSA %>
                            </asp:Label>				        
				        </span>
				    </td>
				    <td>&nbsp;</td>
			    </tr>
		    </table>
    	  
	      </td>
        </tr>
	    <tr>
	        <td class="ReportOuterTableRow">
	            <table cellspacing="0">
	                <tr>
	                    <td style="padding-right:75px">
	                        <span class="reportSectionTitle"  style="font-weight: bold;">Most Recent Biopsy</span>
	                    </td>
	                    <td rowspan="2" style="padding: 4px 20px 4px 0px;">
	                        <asp:Label ID="GleasonScoreLabel" runat="server">
	                            <%= string.Format("Gleason {0} + {1}", BiopsyPrimaryGleason, BiopsySecondaryGleason) %>
	                        </asp:Label>
	                    </td>
	                    <td rowspan="2" style="padding: 4px 20px 4px 20px;">
	                        <asp:Label ID="BiopsyStageLabel" runat="server">
	                            <%= ClinTStage %>
	                        </asp:Label>
	                    </td>
	                    <td rowspan="2" style="padding: 4px 20px 4px 20px;">PSA Before Diagnosis:&nbsp;
	                        <asp:Label ID="PreDiagnosisPSALabel" runat="server">
	                            <%= string.IsNullOrEmpty(PreDiagnosisPSA) ? "N/A" : PreDiagnosisPSA %>
	                        </asp:Label>
	                    </td>
	                    <td>Pos. Cores:&nbsp;
	                        <asp:Label ID="PositiveCoresLabel" runat="server">
	                            <%= PositiveCores %>
	                        </asp:Label>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        <asp:Label ID="MostRecentBiopsyDateLabel" runat="server">
	                            <%= LastBiopsyDate.HasValue ? LastBiopsyDate.Value.ToString("MMMM d, yyyy") : "None" %>
	                        </asp:Label>
	                    </td>
	                    <td>Tot. Cores:&nbsp;
	                        <asp:Label ID="TotalCoresLabel" runat="server">
	                            <%= TotalCores %>
	                        </asp:Label>
	                    </td>
	                </tr>
	            </table>
	        </td>
	    </tr>
	    <tr id="PreviousBiopsiesTableRow" runat="server">
	        <td class="ReportOuterTableRow">
			    <table cellspacing="0">
			        <tr>
			            <td style="padding-right:100px">
			                <span class="reportSectionTitle" style="font-weight: bold;" >Previous Biopsy Dates:</span>
			            </td>
			            <td>
						    <asp:Repeater ID="PreviousBiopsiesRepeater" runat="server">
							    <ItemTemplate>
							        <span style="padding-right:10px"><%# Container.DataItem  %></span>
							    </ItemTemplate>
							    <SeparatorTemplate>;&nbsp;</SeparatorTemplate>
						    </asp:Repeater>
			            </td>
			        </tr>
			    </table>					
		    </td>
	    </tr>
	    <tr id="SurveyAnalysisTableRow" runat="server" >
		    <td class="ReportOuterTableRow">
			    <span class="reportSectionTitle"  style="font-weight: bold;">Surveys<span style="margin-left: 80px; font-size: smaller; font-weight: normal;"><asp:Label ID="LastSurveyDateLabel" Text="This patient has not previously completed an Active Surveillance Survivorship Survey." runat="server" /></span></span>
			    <table id="surveySectionTable" cellspacing="0"  width="100%" style="border-top: dotted 1px #666666;">
				    <tr>
					    <td>
						    <strong>Erectile Function</strong><br/><br/>
						    <ul>
							    <%--<li>Baseline Physician:<br /><asp:Label ID="BaselinePhysicianEFScore" Text="N/A" runat="server"></asp:Label></li>
							    <li>Baseline Patient:<br /><asp:Label ID="BaselinePatientEFScore" Text="N/A" runat="server"></asp:Label></li>--%>
							    <li id="CurrentPenetrationBullet" runat="server"><asp:Label ID="CurrentPenetrationStatus" runat="server" /></li>
							    <li>Injections: <asp:Label ID="CurrentInjectionStatus" runat="server" Text="None" /></li>
							    <li>Current Score: <asp:Label ID="CurrentEFScore" Text="N/A" runat="server"></asp:Label></li>
							    <%--<li id="EFPredictionBullet" runat="server"><asp:Label ID="EFPredictionLabel" Text="1Yr Prediction from month:" runat="server" /><br /> <asp:Label ID="EFPrediction" runat="server"></asp:Label></li>--%>
						    </ul>									
					    </td>
					    <td>
						    <chart:CaisisChart ID="EFChart" runat="server" BorderDashStyle="Solid" backcolor="#ffffff"
                                 Height="200px" Width="255px" >
					            <Legends>
                                    <asp:Legend Enabled="True" LegendStyle="Column" Alignment="Center" Docking="Bottom" Name="EFChart_Legend" >
                                    </asp:Legend>
                                </Legends>
                                <Series>
                                    <asp:Series Name="AS_Scores" ChartType="Line" Color="#C43E06" Legend="EFChart_Legend" LegendText="AS Survey Scores" MarkerSize="7"
                                        XValueMember="Years" YValueMembers="Score" IsValueShownAsLabel="true" LabelForeColor="#C43E06" MarkerStyle="Circle">
                                        <SmartLabelStyle Enabled="true" CalloutLineAnchorCapStyle="None" CalloutStyle="None" />
                                    </asp:Series>
                                </Series>
					            <Series>
                                    <asp:Series Name="QOL_Scores" ChartType="Line" Color="Blue" Legend="EFChart_Legend" LegendText="QOL Survey Scores" MarkerSize="7"
                                        XValueMember="Years" YValueMembers="Score" IsValueShownAsLabel="true" LabelForeColor="#C43E06" MarkerStyle="Triangle" >
                                        <SmartLabelStyle Enabled="true" CalloutLineAnchorCapStyle="None" CalloutStyle="None" />
                                    </asp:Series>
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
											    <asp:CustomLabel GridTicks="None" FromPosition="12" ToPosition="18" Text=" Mod" />
											    <asp:CustomLabel GridTicks="None" FromPosition="18" ToPosition="24" Text=" Inter" />
											    <asp:CustomLabel GridTicks="None" FromPosition="24" ToPosition="30" Text=" Good" />
										    </CustomLabels>
										    <StripLines>
											    <asp:StripLine IntervalOffset="0" StripWidth="12" BackColor="Transparent" BorderColor="#999999"/>
											    <asp:StripLine IntervalOffset="12" StripWidth="18" BackColor="Transparent" BorderColor="#999999"/>
											    <asp:StripLine IntervalOffset="18" StripWidth="24" BackColor="Transparent" BorderColor="#999999"/>
											    <asp:StripLine IntervalOffset="24" StripWidth="30" BackColor="Transparent" BorderColor="#999999"/>
										    </StripLines>
                                        </AxisY2>
                                        <AxisX Title="Years Since Diagnosis" Minimum="0" IsLabelAutoFit="false" Interval="1" IntervalAutoMode="VariableCount" >
										    <MajorGrid Enabled="false" />
										    <MinorGrid Enabled="false" />
										    <MajorTickMark Enabled="true" Interval="1" />
										    <%--<LabelStyle Interval="6" IsStaggered="false" />--%>
                                        </AxisX>
                                    </asp:ChartArea>
                                </ChartAreas>
                            </chart:CaisisChart>									
                        </td>
					    <td>
						    <strong>Urinary Function</strong><br/><br/>
						    <ul>
							    <%--<li>Baseline Physician:<br /> <asp:Label ID="BaselinePhysicianUFScore" Text="N/A" runat="server"></asp:Label></li>
							    <li>Baseline Patient:<br /><asp:Label ID="BaselinePatientUFScore" Text="N/A" runat="server"></asp:Label></li>--%>
							    <li id="PadStatusBullet" runat="server"><asp:Label ID="CurrentPadStatus" runat="server" /></li>
							    <li>Current Score: <asp:Label ID="CurrentUFScore" Text="N/A" runat="server"></asp:Label></li>
							    <%--<li id="UFPredictionBullet" runat="server"><asp:Label ID="UFPredictionLabel" Text="1Yr Prediction from month:" runat="server" /><br/> <asp:Label ID="UFPrediction" runat="server"></asp:Label></li>--%>
						    </ul>									
					    </td>
					    <td>
						    <chart:CaisisChart ID="UFChart" runat="server" BackColor="#ffffff" 
                                 Height="200px" Width="255px">
					            <Legends>
                                    <asp:Legend Enabled="True" LegendStyle="Column"  Alignment="Center" Docking="Bottom" Name="UFChart_Legend"  >
                                    </asp:Legend>
                                </Legends>
                                <Series>
                                    <asp:Series Name="AS_Scores" ChartType="Line" Color="#C43E06" Legend="UFChart_Legend" LegendText="AS Survey Scores" MarkerSize="7"
                                        XValueMember="Years" YValueMembers="Score" IsValueShownAsLabel="true" LabelForeColor="#C43E06" MarkerStyle="Circle">
                                        <SmartLabelStyle Enabled="true" CalloutLineAnchorCapStyle="None" CalloutStyle="None" />
                                    </asp:Series>
                                </Series>
					            <Series>
                                    <asp:Series Name="QOL_Scores" ChartType="Line" Color="Blue" Legend="UFChart_Legend" LegendText="QOL Survey Scores" MarkerSize="7"
                                        XValueMember="Years" YValueMembers="Score" IsValueShownAsLabel="true" LabelForeColor="#C43E06" MarkerStyle="Triangle">
                                        <SmartLabelStyle Enabled="true" CalloutLineAnchorCapStyle="None" CalloutStyle="None" />
                                    </asp:Series>
                                </Series>                                                                
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea2"  BackSecondaryColor="White" BackColor="AliceBlue" ShadowColor="Transparent" BackGradientStyle="TopBottom">
                                        <AxisY Title="Urinary Function" Minimum="0" Maximum="39" LabelAutoFitMinFontSize="10">
									        <MajorTickMark Enabled="false" />
									        <MinorTickMark Enabled="false" />
									        <MajorGrid Enabled="false" />
									        <MinorGrid Enabled="false" />
									        <CustomLabels>
										        <asp:CustomLabel GridTicks="GridLine" FromPosition="-2" ToPosition="2" Text="0" />
										        <asp:CustomLabel GridTicks="GridLine" FromPosition="17" ToPosition="21" Text="19" />
										        <asp:CustomLabel GridTicks="GridLine" FromPosition="29" ToPosition="33" Text="31" />
										        <asp:CustomLabel GridTicks="GridLine" FromPosition="37" ToPosition="41" Text="39" />
									        </CustomLabels>
                                        </AxisY>
                                        <AxisY2 Enabled="True" Minimum="0" Maximum="39" IsLabelAutoFit="false">
									        <MajorTickMark Enabled="false" />
									        <MinorTickMark Enabled="false" />
									        <MajorGrid Enabled="false" />
									        <MinorGrid Enabled="false" />
									        <CustomLabels>
										        <asp:CustomLabel GridTicks="None" FromPosition="0" ToPosition="19" Text=" Poor" />
										        <asp:CustomLabel GridTicks="None" FromPosition="19" ToPosition="31" Text=" Mod" />
										        <asp:CustomLabel GridTicks="None" FromPosition="31" ToPosition="39" Text=" Good" />
									        </CustomLabels>
									        <StripLines>
										        <asp:StripLine IntervalOffset="0" StripWidth="19" BackColor="Transparent" BorderColor="#999999"/>
										        <asp:StripLine IntervalOffset="19" StripWidth="12" BackColor="Transparent" BorderColor="#999999"/>
										        <asp:StripLine IntervalOffset="31" StripWidth="8" BackColor="Transparent" BorderColor="#999999"/>
									        </StripLines>
                                        </AxisY2>
                                        <AxisX Title="Years Since Diagnosis" Minimum="0" IsLabelAutoFit="false" Interval="1" IntervalAutoMode="VariableCount">
									        <MajorGrid Enabled="false" />
									        <MinorGrid Enabled="false" />
									        <MajorTickMark Enabled="true" Interval="1" />
									        <%--<LabelStyle Interval="3" IsStaggered="false" />--%>
                                        </AxisX>
                                    </asp:ChartArea>
                                </ChartAreas>
                            </chart:CaisisChart>
                        </td>
				    </tr>				   
				    <tr>
					    <td style="width:100%; border-top: dotted 1px #666666; padding-top:10px" colspan="4" >
					        <table cellpadding="0" cellspacing="0" width="100%" >
					            <tr>
					                <td style="width:50%;" >
						                <span style="font-weight:bold; padding-right:5px;">Quality of Life:</span>
                                        Current Score: <asp:Label ID="CurrentGeneralScore" Text="N/A" runat="server" />
                                    </td>
                                    <td style="width:50%;" >
						                <span style="font-weight:bold; padding-right:5px;">Anxiety:</span>
                                        <asp:Label ID="AnxietyValue" Text="No" runat="server" />
                                    </td>
			                    </tr>
					        </table>
					    </td>	
				    </tr>
			    </table>
		    </td>
	    </tr>
	    <tr id="LabTestsTableRow" runat="server">
	        <td class="ReportOuterTableRow">
	            <span class="reportSectionTitle"  style="font-weight: bold;">PSA Tests</span>
			    <table>
			        <tr>
			            <td style="padding-left: 75px;">
			                <chart:CaisisChart ID="PSAChart" runat="server" BackColor="#ffffff" Height="240px" Width="550px">
					            <Legends>
                                    <asp:Legend Enabled="True" LegendStyle="Row" Alignment="Center" Docking="Bottom" Name="PSAChart_Legend" >
                                    </asp:Legend>
                                </Legends>
					            <Series>
                                    <asp:Series Name="Actual" ChartType="Line" Color="#C43E06" Legend="PSAChart_Legend" LegendText="PSA Tests" MarkerSize="8"
                                        XValueMember="Months" YValueMembers="ngml" IsValueShownAsLabel="false" LabelForeColor="#C43E06" MarkerStyle="Circle">
                                        <SmartLabelStyle Enabled="true" CalloutLineAnchorCapStyle="None" CalloutStyle="None" />
                                    </asp:Series>
                                </Series>
					            <Series>
                                    <asp:Series Name="Biopsies" ChartType="Bubble" Color="Blue" Legend="PSAChart_Legend" LegendText="Biopsies" MarkerSize="20"
                                        XValueMember="Months" YValueMembers="ngml" IsValueShownAsLabel="false" LabelForeColor="#C43E06" MarkerStyle="Triangle">
                                        <SmartLabelStyle Enabled="true" CalloutLineAnchorCapStyle="None" CalloutStyle="None" />
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="PSAChartArea"  BackSecondaryColor="White" BackColor="AliceBlue" ShadowColor="Transparent" BackGradientStyle="TopBottom">
                                        <AxisX Title="Months Since Diagnosis" Minimum="0" IsLabelAutoFit="false" Interval="3" IntervalAutoMode="VariableCount">	    
                                        </AxisX>
                                        <AxisY Title="ng/ml"></AxisY>
                                    </asp:ChartArea>
                                </ChartAreas>
					        </chart:CaisisChart>
			            </td>
			        </tr>
			    </table>
	        </td>
	    </tr>
	    <tr> 
            <td height="14" align="center" valign="bottom" class="blackBoldText">Page <span id="Span1">1</span> of <span id="Span2">2</span></td>
        </tr>
      </table>
    </div>
    <div  id="LastPageInForm" runat="server" align="left" >
        <table id="reportTable2" runat="server" class="masterTable" border="0" cellspacing="0"
            cellpadding="0" style="width: 100%;">
            <tr>
                <td style="text-align: center;">
                    <font size="-2">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO
                        <%= institutionShortName%>
                        POLICY</font>
                </td>
            </tr>
            <tr>
                <td class="ReportOuterTableTopRow">
                    <table cellspacing="0" class="ReportHeader">
                        <tr>
                            <td>
                                <span style="font-size: 18px; font-weight: bold; color: #8d282c;">
                                    <%= PatientDisplayName %></span>
                            </td>
                            <td>
                                <span style="font-size: 18px; font-weight: bold; color: #8d282c;">MRN:&nbsp;<%= PatientMRN %></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span style="font-weight: bold;">
                                    <%= 
			                            string.Format("{0} year{1}old, {2} month{3}since diagnosis",
                                                      PatientAge, 
			                                          HandlePlural(PatientAge),
                                                      MonthsSinceDiagnosis,
                                                      HandlePlural(MonthsSinceDiagnosis))
			                        %>
			                    </span>
                            </td>
                            <td>
                                <span style="font-weight: bold;">Today's date:&nbsp;<%= DateTime.Now.ToLongDateString() %></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span style="font-weight: bold;">Current PSA:&nbsp;<%= string.IsNullOrEmpty(CurrentPSA) ? "N/A" : CurrentPSA %></span>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="SurveyResponsesTableRow" runat="server">
                <td class="ReportOuterTableRow">
                    <!-- survey item repeater: num, text, narrative response -->
                    <asp:Repeater ID="SurveyResponsesRepeater" runat="server">
                        <HeaderTemplate>
                            <span class="reportSectionTitle" style="font-weight: bold;">
                                Survey Responses from
                                <%= LastSurveyDate.Value.ToLongDateString() %>.</span>
                            <table class="surveyResponses" width="100%" cellpadding="3" cellspacing="0" style="border: gray 1px solid;
                                background-color: white; font-size: 10px;">
                                <tr>
                                    <th width="5%" align="left">
                                        #
                                    </th>
                                    <th width="68%" align="left">
                                        Question
                                    </th>
                                    <th width="27%" align="left">
                                        Response
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #f8f8f8;">
                                <td style="vertical-align: top;">
                                    <%# DataBinder.Eval(Container.DataItem, "QuestionNum") %>
                                </td>
                                <td style="padding-right: 20px; vertical-align: top;">
                                    <%# DataBinder.Eval(Container.DataItem, "QuestionText") %>
                                </td>
                                <td style="vertical-align: top;">
                                    <%# DataBinder.Eval(Container.DataItem, "QuestionResult") %>&nbsp;
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr>
                                <td style="vertical-align: top;">
                                    <%# DataBinder.Eval(Container.DataItem, "QuestionNum") %>
                                </td>
                                <td style="padding-right: 20px; vertical-align: top;">
                                    <%# DataBinder.Eval(Container.DataItem, "QuestionText") %>
                                </td>
                                <td style="vertical-align: top;">
                                    <%# DataBinder.Eval(Container.DataItem, "QuestionResult") %>&nbsp;
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td height="14" align="center" valign="bottom" class="blackBoldText">
                    Page <span id="PageNumber">2</span> of <span id="TotalPages">2</span>
                </td>
            </tr>
        </table>
        <table id="InvalidStatusErrorContainer" runat="server"  visible="false"  class="masterTable" border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
            <tr>
                <td style="text-align:center;"><font size="-2">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
            </tr>
            <tr>
                <td style="text-align:center;">DRAFT: FOR TESTING PURPOSES ONLY</td>
            </tr>
            <tr id="NotOnActiveSurveillanceMessage" runat="server" visible="false"> 
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
						    <td><span style="font-weight: bold;">This patient is not on active surveillance.</span></td>
						    <td>&nbsp;</td>
		                </tr>
		            </table>
	            </td>
            </tr>
	        <tr id="NoDiagnosisMessage" runat="server" visible="false"> 
              <td class="ReportOuterTableRow" style="height: 800px; text-align: center; vertical-align: middle; background-color: #f8f8f8; font-size: 18px;">

			        <span style="width: 500px;">An Active Surveillance Survivorship Report could not be generated: this patient has not been diagnosed.</span>

	          </td>
	        </tr>
        </table>
    </div>

</div>