<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StomaSurvey.ascx.cs" Inherits="Caisis.UI.Modules.Colorectal.PaperForms.StomaSurvey" %>
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
	table#GeneralPatientDataHTMLTable
	{
		width: 100%;
	}
	table#GeneralPatientDataHTMLTable td
	{
		padding: 10px 4px 2px 4px;
		vertical-align: top;
	}
	table#GeneralPatientDataHTMLTable td.labelCol
	{
		font-weight: bold;
		width: 130px;
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
		width: 35%;
	}
	
 </style>
<div id="PaperFormStart">

<div id="LastPageInForm" runat="server" align="left" class="NonBreakingPage">   <%-- align="left"  style="page-break-after:always;"--%>


  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td  class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span style="width: 70%;"><%= institutionName%></span><br/>
			<span style=" display: block; margin-top: 8px;">COLORECTAL-Q Survey Results</span><br/>            </td>
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
	  <table id="GeneralPatientDataHTMLTable" cellspacing="0" cellpadding="0">
  <tr>
    <td class="labelCol"><span >Disease Stage</span></td>
    <td style="width: 300px;"><asp:Label id="ColorectalStage" runat="server">None Listed</asp:Label></td>
    <td class="labelCol"><span >Radiation</span></td>
    <td><asp:Label runat="server" ID="RadiationLabel">No</asp:Label></td>
  </tr>
  <tr>
    <td class="labelCol">Procedures</td>
    <td><asp:Label runat="server" ID="ProceduresLabel">None Listed</asp:Label>
    
            <asp:Repeater ID="proctemp" runat="server">
			<HeaderTemplate><table class="temp" cellspacing="0" cellpadding="0"></HeaderTemplate>
	        <ItemTemplate>
				<tr>
				<td><%# DataBinder.Eval(Container.DataItem, "ProcDate")%>&nbsp;</td>
				<td><%# DataBinder.Eval(Container.DataItem, "procDisplayStr")%>&nbsp;</td>
				<td><%# DataBinder.Eval(Container.DataItem, "procDateDisplayString")%>&nbsp;</td>
				</tr>
			</ItemTemplate>
			<FooterTemplate></table></FooterTemplate>
	    </asp:Repeater>





    </td>
    <td class="labelCol"><span >Chemotherapy</span></td>
    <td><asp:Label runat="server" ID="ChemotherapyLabel">No</asp:Label></td>
  </tr>
 <!-- <tr>
    <td class="labelCol">Procedure # 2<br /><span style="font-weight: normal;">(If applicable)</span></td>
    <td><asp:Label runat="server" ID="ProceduresLabel2">None Listed</asp:Label></td>
  </tr>
  <tr>
    <td class="labelCol">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>-->
  <tr>
    <td class="labelCol">Procedure Details </td>
    <td style="padding-top: 7px; padding-left: 0px;">
			<table id="ColorectalDetailsHTMLTable" cellspacing="0" cellpadding="0">
			  <tr>
                <td class="labelCol">Level of Tumor <span style="display: none; font-size: 10px; font-weight: normal;">(distance in cm from<br />
                  the anal verge) </span></td>
			    <td><asp:Label runat="server" ID="LevelOfTumor">N/A</asp:Label></td>
			    </tr>
				<%--
			  <tr>
                <td class="labelCol">Tumor Location</td>
			    <td><asp:Label runat="server" ID="TumorLocation">N/A</asp:Label></td>
			    </tr> --%>
			  <tr>
                <td class="labelCol">Height of Anastomosis</td>
			    <td><asp:Label runat="server" ID="HeightOfAnastomosis">N/A</asp:Label></td>
			    </tr>
			  <tr>
                <td class="labelCol">Anatomy</td>
			    <td><asp:Label runat="server" ID="Anatomy">N/A</asp:Label></td>
			    </tr>
			  <tr>
                <td class="labelCol">Anastomosis</td>
			    <td><asp:Label runat="server" ID="Anastomosis">N/A</asp:Label></td>
			    </tr>
		  </table>	</td>
    <td class="labelCol">Time from Last Surgery</td>
    <td ><asp:Label runat="server" ID="TimeFromLastSurgery">N/A</asp:Label></td>
  </tr>
</table></td>
    </tr>
	
    <tr id="ChartTableRow" runat="server" visible="false">
      <td  class="FormOuterTableRow" style="vertical-align: top;">
      <asp:Repeater ID="charts_rpt" runat="server" OnItemDataBound="BuildChart">
      <ItemTemplate>
      <span id="ChartContainer" runat="server" class="ChartContainer">
<%--        <span style="font-size: 14px; font-weight: bold;"><%# (Container.DataItem) %></span><br />
--%>    
        <chart:CaisisChart  runat="server" ID="SurveyChart" Width="370" Height="350" CssClass="SurveyChart" RenderBase64="true">
              <Titles>
                  <asp:Title Name="MainTitle" ForeColor="Black"></asp:Title>
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
                      <AxisY Title="Total Score" TitleFont="8pt Arial Bold" IsStartedFromZero="true"
                          Minimum="0" Maximum="100" Interval="10">
                      </AxisY>
                  </asp:ChartArea>
              </ChartAreas>
          </chart:CaisisChart>
          <asp:Label ID="ChartNote" runat="server" />

        <table class="subscoresTable" cellspacing="0" cellpadding="0">
				<tr id="LastTotalScoreDisplayContainer" runat="server" visible="false">
				<td>Total&nbsp;</td>
				<td><asp:Label id="LastTotalScoreDisplay" runat="server" /></td>
				</tr>
        <asp:Repeater ID="SubScores" runat="server">
	        <ItemTemplate>
				<tr>
				<td><%# DataBinder.Eval(Container.DataItem, "SubItem")%>&nbsp;</td>
				<td><%# DataBinder.Eval(Container.DataItem, "PatientSubScore")%>&nbsp;/&nbsp;<%# DataBinder.Eval(Container.DataItem, "TotalSubScore")%></td>
				</tr>
			</ItemTemplate>
	    </asp:Repeater>
		</table>
		
      </span></ItemTemplate>
	    </asp:Repeater>
	  
	  
	  </td>
	  </tr>
	  <tr id="NoSurveyMsg" runat="server" visible="true"><td  class="FormOuterTableRow">
	  <table style="width: 100%;">
		<tr > 
			  <td style="padding: 4px; text-align: center; height: 600px;">
					<span class="blackBoldText" style="font-size: 18pt;" >There are no Stoma Surveys for this patient.</span>
			</td>
		</tr>
		</table>
	  </td></tr>
    <tr>
        <td height="14" align="center" valign="bottom" class="blackBoldText">Page
            <span id="PageNumber">1</span> of <span id="TotalPages">1</span></td>
    </tr>
  </table>    
</div>
<%--
<div id="LastPageInForm" runat="server" align="left"> 
  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td  class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span style="width: 70%;"><%= institutionName%></span><br/>
			<span style=" display: block; margin-top: 8px;">Stoma Survey Results</span><br/>            </td>
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
  <td  class="FormOuterTableRow" style="height: 900px; vertical-align: top; padding-top: 30px;">

              <asp:Label CssClass="reportSectionTitle" ID="LastSurveyTitle" runat="server" />
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
  </td>
</tr>
<tr class="FormOuterTableRow">
    <td height="14" align="center" valign="bottom" class="blackBoldText">Page
        <span id="PageNumber">2</span> of <span id="TotalPages">2</span></td>
</tr>
  </table>    
</div>--%>
</div>    