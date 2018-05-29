<%@ Control Language="C#" AutoEventWireup="true" CodeFile="KidneyClinicalSummary.ascx.cs" Inherits="Caisis.UI.Modules.Kidney.PaperForms.KidneyClinicalSummary" %>
<%@ Register TagPrefix="chart" Namespace="Caisis.UI.Core.Utilities" %>
<style type="text/css">
    .SurveyChart
    {
        display: inline-block;
        margin: 10px 20px 10px 20px;
    }
    tr.breastQGraphRow
    {
		border: none;
        width: 100%;
		table-layout: fixed;
    }
    tr.breastQGraphRow td
    {
		width: 50%;
		padding: 0px;
    }
    #ProcedureDetails
    {
        table-layout: fixed;
        font-size: 12px;
    }
    #ProcedureDetails td
    {
        vertical-align: top;
    }
	table#KidneyClinicalSummaryGeneralPatientDataHTMLTable
	{
		width: 100%;
	}
	table#KidneyClinicalSummaryGeneralPatientDataHTMLTable td
	{
		padding: 6px 4px 6px 4px;
		vertical-align: top;
	}
	table#KidneyClinicalSummaryGeneralPatientDataHTMLTable td.labelCol
	{
		font-weight: bold;
		width: 140px;
		padding-right: 10px;
		
	}
	table.ColorectalChartsTable
	{
	    width: 100%;
	    table-layout: fixed;
	}
	table.ColorectalChartsTable td
	{
	    width: 50%;
	    text-align: center;
		vertical-align: top;
	    padding: 40px 10px;
	}
	table.ColorectalChartsTable span.chartTitle
	{
	    display: block;
	    text-align: center;
	    font-size: 14px;
	    font-weight: bold;
	    color: #000000;
	}
	table.subscoresTable
	{
		margin-left: 120px;
	}
	table.subscoresTable td
	{
		width: auto;
	    text-align: left;
		vertical-align: top;
	    padding: 0px 10px;
		font-weight: bold;
	}
	
	span.ChartContainer
	{
	    display: inline-block;
	    width: 49%;
		vertical-align: top;
	 /*   border: solid 1px #333333; */
	}
	
	
	table#ColorectalDetailsHTMLTable td
	{
			padding: 3px 0px 3px 4px;
	}
	
	table#ColorectalDetailsHTMLTable td.labelCol
	{
		width: auto;
	}
	
	
	table#LabTestsHtmlTable
	{
	    border: solid 1px #cccccc;
	    border-collapse: collapse;
	}
	table#LabTestsHtmlTable td
	{
	    border: solid 1px #cccccc;
	    
	}
	span.KidneyClinicalSummarySectionTitle
	{
		display: block;
		font-weight: bold;
	}
	table#SurveyInnerContainer 
	{
		width: 100%;
	}
	table#SurveyInnerContainer td
	{
		font-weight: bold;
		padding: 7px 0px 7px 0px;
	}
	table#SurveyInnerContainer span
	{
		margin-left: 10px;
		font-weight: normal;
	}
	table#SurveyInnerContainer span.SurveyResultHelpText
	{
		margin-left: 10px;
		font-weight: normal;
		font-size: 75%;
	}
	
	
	
	
	td.ProcDateColumn
	{
	    white-space: nowrap;
	    vertical-align: top;
	}
	td.ProcNameColumn
	{
	    white-space: nowrap;
	    vertical-align: top;
	}
	td.ProcDetailsColumn
	{
	    padding: 24px;
	    vertical-align: top;
	}
 </style>
<div id="PaperFormStart">

<div id="LastPageInForm" runat="server" align="left">   <%-- align="left"  style="page-break-after:always;"--%>
  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td  class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span style="width: 70%;"><%= institutionName%></span><br/>
			<span style=" display: block; margin-top: 8px;">Kidney Clinical Summary</span><br/>            </td>
            <td width="50%" align="center" valign="bottom">
				<table  width="340" border="0" cellspacing="1" cellpadding="0" >
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel%>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN%>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB%>                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel%>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName%>, <% =patientFirstName%> <% =patientMiddleName%>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel%>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1%>
                    <% =patientAddress2%>
                    <% =patientCity%>
                    <% =patientState%>
                    <% =patientPostalCode%>                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" style="table-layout: fixed;" >
          <tr> 
            <td class="blackBoldText" style="width: 50%;"><img src="../../Images/shim.gif" border="0" width="4" height="15">Date: <% =apptClinicDate%></td>
			<td class="blackBoldText">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName%></span></td>
          </tr>
        </table></td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow" >
	  <table id="KidneyClinicalSummaryGeneralPatientDataHTMLTable" cellspacing="0" cellpadding="0">

  <tr>
    <td class="labelCol">Age</td>
    <td style="width: auto;"><asp:Label ID="PatientAgeLabel" runat="server" /></td>
  </tr>	  
  <tr>
    <td class="labelCol">Time Since Surgery </td>
    <td ><span class="labelCol" style="width: auto;">
      <asp:Label runat="server" ID="TimeFromLastSurgery">N/A</asp:Label>
    </span></td>
  </tr>
  <tr>
    <td class="labelCol">Risk Factors</td>
    <td >      <asp:Label runat="server" ID="RiskFactorsLabel">None</asp:Label>    </td>
  </tr>
  <tr>
    <td class="labelCol"><span >Pathology</span></td>
    <td ><asp:Label ID="PathologyLabel" runat="server">None Listed</asp:Label></td>
    </tr>
  <tr>
    <td class="labelCol">Active Protocols </td>
    <td><asp:Label runat="server" ID="ProtocolsLabel">None Listed</asp:Label></td>
    </tr>
  <tr>
    <td class="labelCol">Surgery Type  </td>
    <td><asp:Label runat="server" ID="NoProceduresLabel">None Listed</asp:Label>
    
    <asp:Repeater ID="ProceduresRpt" runat="server"> 
    <HeaderTemplate>
    <table cellspacing="0">
    </HeaderTemplate>
                  <ItemTemplate>
                  <tr>
                  <td class="ProcDateColumn"><%# DataBinder.Eval(Container.DataItem, "ProcDateText")%></td>
				  <td class="ProcNameColumn"><%# DataBinder.Eval(Container.DataItem, "ProcName")%></td>
				  <td class="ProcDetailsColumn"><%# (DataBinder.Eval(Container.DataItem, "ProcApproach").ToString().Length > 0 || DataBinder.Eval(Container.DataItem, "ProcHypothermia").ToString().Length > 0 || DataBinder.Eval(Container.DataItem, "ProcPartialClampDuration").ToString().Length > 0 || DataBinder.Eval(Container.DataItem, "ProcPercKidneySpared").ToString().Length > 0 || DataBinder.Eval(Container.DataItem, "ProcApproach").ToString().Length > 0) ? "(" : ""%>
				  <span><%# DataBinder.Eval(Container.DataItem, "ProcApproach").ToString().Length > 0 ? "Approach:" + DataBinder.Eval(Container.DataItem, "ProcApproach") + "," : ""%>&nbsp;</span>
				  <span><%# DataBinder.Eval(Container.DataItem, "ProcHypothermia").ToString().Length > 0 ? "Renal Hypothermia:" + DataBinder.Eval(Container.DataItem, "ProcHypothermia") + "," : ""%>&nbsp;</span>
				  <span><%# DataBinder.Eval(Container.DataItem, "ProcPartialClampDuration").ToString().Length > 0 ? "Ischemia Time:" + DataBinder.Eval(Container.DataItem, "ProcPartialClampDuration") + "," : ""%>&nbsp;</span>
				  <span><%# DataBinder.Eval(Container.DataItem, "ProcPercKidneySpared").ToString().Length > 0 ? "Estimated Kidney Spared:" + DataBinder.Eval(Container.DataItem, "ProcPercKidneySpared") : ""%></span>
				  <%# (DataBinder.Eval(Container.DataItem, "ProcApproach").ToString().Length > 0 || DataBinder.Eval(Container.DataItem, "ProcHypothermia").ToString().Length > 0 || DataBinder.Eval(Container.DataItem, "ProcPartialClampDuration").ToString().Length > 0 || DataBinder.Eval(Container.DataItem, "ProcPercKidneySpared").ToString().Length > 0 || DataBinder.Eval(Container.DataItem, "ProcApproach").ToString().Length > 0) ? ")" : ""%>
				  </td>
                  </tr>
				  </ItemTemplate>
				  <FooterTemplate></table></FooterTemplate>
                </asp:Repeater>
    
    </td>
    </tr>
  <tr>
    <td class="labelCol">Complications</td>
    <td><asp:Label runat="server" ID="ComplicationsLabel">None Listed</asp:Label></td>
    </tr>
</table></td>
    </tr>
	<tr id="SurveyContainer" runat="server" visible="false" ><td class="FormOuterTableRow" style="vertical-align: top; padding: 4px 0px 0px 4px;">
	<span class="KidneyClinicalSummarySectionTitle" style="display: inline;">Survey</span>
	<asp:Label runat="server" ID="MostRecentSurveyLabel" CssClass="KidneyClinicalSummarySectionTitle" style="display: inline;" />
<asp:Label CssClass="KidneyClinicalSummarySectionTitle" style="display: inline; font-weight: normal; margin-left: 40px;" ID="LastSurveyTitle" runat="server" />

<table id="SurveyInnerContainer" cellspacing="0" >
<tr>
<td style="vertical-align: top; padding: 14px 0px 0px 0px;">
<table cellspacing="0">
<tr><td>Current Pain Score: <asp:Label ID="PainLabel" runat="server">N/A</asp:Label><span class="SurveyResultHelpText">(Lower is better)</span></td></tr>
<tr><td>Current Fatigue Score: <asp:Label ID="FatigueLabel" runat="server">N/A</asp:Label><span class="SurveyResultHelpText">(Lower is better)</span></td></tr>
<tr><td>Current Activity Levels: <asp:Label ID="ActivityLabel" runat="server">N/A</asp:Label></td></tr>
<tr><td>Bowel Function: <asp:Label ID="BowelFunctionLabel" runat="server">N/A</asp:Label></td></tr>
<tr><td>Quality of Life Score: <asp:Label ID="QOLLabel" runat="server">N/A</asp:Label><span class="SurveyResultHelpText">(Higher is better)</span></td></tr>
<tr><td>Anxiety with Cancer: <asp:Label ID="AnxietyLabel" runat="server">N/A</asp:Label></td></tr>
<tr><td>Complications Reported Since Last Survey: <asp:Label ID="ComplicationsSinceLastSurveyLabel" runat="server">N/A</asp:Label></td></tr>
</table>
</td>
<td>

        <chart:CaisisChart  runat="server" ID="SurveyChart" Width="370" Height="350" CssClass="SurveyChart" RenderBase64="true">
              <Titles>
                  <asp:Title Name="MainTitle" ForeColor="Black" Text="" />
              </Titles>
              <Legends>
                    <asp:Legend Docking="Bottom" Alignment="Center" />
              </Legends>
              <ChartAreas>
                  <asp:ChartArea Name="MainArea">
                      <AxisX Title="Months Since Surgery" LineWidth="0" IsLabelAutoFit="false" Enabled="True" Minimum="0">
                          <MajorGrid Enabled="false" />
                          <MinorGrid Enabled="false" />
                          <MajorTickMark Enabled="false" />
                          <%-- Set angle of labels (vertical labels) --%>
                          <LabelStyle Angle="0" Enabled="true" />
                          
                      </AxisX>
                      <AxisY Title="Score" TitleFont="8pt Arial Bold" IsStartedFromZero="true"
                          Minimum="0" Maximum="10" Interval="1">
                      </AxisY>
                  </asp:ChartArea>
              </ChartAreas>
          </chart:CaisisChart>
          <asp:Label ID="ChartNote" runat="server" />
</td>
</tr>
</table>
              <asp:Repeater ID="SurveyResponsesRepeater" runat="server">
                  <HeaderTemplate>
                      <table class="surveyResponses" width="100%" cellpadding="3" cellspacing="0" style="border: gray 1px solid;
                          background-color: white; font-size: 10px;">
                          <tr>
                              <th  style="width: 9%; text-align: left;"  >
                                  #
                              </th>
                              <th  style="width: 68%; text-align: left;" >
                                  Question
                              </th>
                              <th style="width: 23%; text-align: center;">
                                  Response
                              </th>
                          </tr>
                  </HeaderTemplate>
                  <ItemTemplate>
                      <tr style="background-color: #f8f8f8;">
                          <td style="vertical-align: top;">
                              <%# DataBinder.Eval(Container.DataItem, "SurveyItemNum")%>
                          </td>
                          <td style="padding-right: 20px; vertical-align: top;">
                              <%# DataBinder.Eval(Container.DataItem, "SurveyItem")%>
                          </td>
                          <td style="vertical-align: top; text-align: center;">
                              <%# DataBinder.Eval(Container.DataItem, "SurveyItemResult")%>&nbsp;
                          </td>
                      </tr>
                  </ItemTemplate>
                  <FooterTemplate>
                      </table>
                  </FooterTemplate>
              </asp:Repeater>
	</td></tr>

	  <tr id="NoSurveyMsg" runat="server" visible="true"><td  class="FormOuterTableRow">
	  <table style="width: 100%;">
		<tr > 
			  <td style="padding: 4px; text-align: center; height: 300px;">
					<span class="blackBoldText" style="font-size: 18pt;" >There are no kidney surveys for this patient.</span>
			</td>
		</tr>
		</table>
	  </td></tr>
<%-- 
	<tr><td id="NomogramContainer" class="FormOuterTableRow" style="height: 50px; padding: 4px;">
	<span class="KidneyClinicalSummarySectionTitle" style="display: inline; margin-right: 30px;">Nomogram Scores</span>
	<asp:Label id="NomogramResult" runat="server">Risk of recurrence at 5 years given patient is currently recurrence free: </asp:Label>
	</td>
	</tr>
--%>
	<tr><td class="FormOuterTableRow" style="padding: 0px;">
<table cellpadding="5" cellspacing="0"  id="LabTestsHtmlTable" style="display: none;">
  <tr> 
            <td height="20" align="center" valign="middle" >Date</td>
            <td align="center" valign="middle" >Marker</td>
            <td align="center" valign="middle" >Value</td>
            <td align="center" valign="middle" >Units</td>
            <td align="center" valign="middle" >GFR</td>
            <td  align="center" valign="middle" >Data Source</td>
  </tr>
  
  
  	<asp:Repeater ID="labTests" runat="server" ><ItemTemplate>  
		<tr > 
      <td  width="16%" align="center" > 
        <%# DataBinder.Eval(Container.DataItem, "LabDateText") %></td>
      <td  align="center"> 
        <%# DataBinder.Eval(Container.DataItem, "LabTest") %> <%# (bool)DataBinder.Eval(Container.DataItem, "LastBeforeNeph") == true ? "(Pre-Op)" : "" %></td>
      <td  align="center"  > 
        <%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
      <td  style="vertical-align: middle; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "LabUnits") %>&nbsp;</td>
      <td  style="vertical-align: middle; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "GFR") %><span style="font-size: 9px; line-height: 10px; color: #444444; font-weight: bold;"><%# DataBinder.Eval(Container.DataItem, "GFRError") %></span>&nbsp;</td>
      <td  align="center"> 
        <%# DataBinder.Eval(Container.DataItem, "LabQuality") %>&nbsp;</td>
    </tr>
	</ItemTemplate></asp:Repeater>
	</table>

<table cellpadding="4" cellspacing="0">
<tr><td>

	<span class="KidneyClinicalSummarySectionTitle">eGFR (CKD-EPI) Tests<asp:Label ID="NoLabsMsg" runat="server"> - None Listed</asp:Label></span>
<!-- originally 500 wide -->
<chart:CaisisChart  runat="server" ID="GFRChart" Width="740" Height="250" CssClass="SurveyChart" RenderBase64="true" Visible="false">
    <Titles>
        <asp:Title Name="MainTitle" ForeColor="Black">
        </asp:Title>
    </Titles>
    <ChartAreas>
        <asp:ChartArea Name="MainArea">
            <AxisX Title="" LineWidth="0" IsLabelAutoFit="false" Enabled="True">
                <MajorGrid Enabled="false" />
                <MinorGrid Enabled="false" />
                <MajorTickMark Enabled="false" />
                <%-- Set angle of labels (vertical labels) --%>
                <LabelStyle Angle="-90" Enabled="true" />
            </AxisX>
            <AxisY Title="eFGR (CKD-EPI)" TitleFont="8pt Arial Bold" IsStartedFromZero="true" Minimum="0" Enabled="True" >
                <MajorTickMark Enabled="false" />
                <LabelStyle Enabled="false" />
                <MajorGrid Enabled="false" />
                <MinorGrid Enabled="false" />
                <MajorTickMark Enabled="false" />
            </AxisY>
        </asp:ChartArea>
    </ChartAreas>
</chart:CaisisChart>
</td>
<%-- 
<td style="vertical-align: top; padding-left: 15px;">
	<span class="KidneyClinicalSummarySectionTitle" style="margin-bottom: 10px;">Renal Scan Results</span>
	<span>None Recorded</span>
</td>--%>
</tr>
</table>

	
	</td></tr>
	
    <tr>
        <td height="14" align="center" valign="bottom" class="blackBoldText">Page
            <span id="PageNumber">1</span> of <span id="TotalPages">1</span></td>
    </tr>
  </table>    
</div>
</div>    