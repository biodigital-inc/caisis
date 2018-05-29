<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BreastSurgeryClinicalSummary.ascx.cs"
    Inherits="Caisis.UI.Modules.Breast.PaperForms.BreastSurgeryClinicalSummary" %>
<%@ Register TagPrefix="chart" Namespace="Caisis.UI.Core.Utilities" %>
<%@ Register TagPrefix="chart" TagName="ProcessOfCareChart" Src="~/Modules/Breast/Reports/BreastQProcessOfCareChart.ascx" %>
<%@ Register TagPrefix="chart" TagName="ScaleChart" Src="~/Modules/Breast/Reports/BreastQScaleChart.ascx" %>
<div id="PaperFormStart">

<div align="left"  style="page-break-after:always;"><%--<div id="LastPageInForm" runat="server" align="left">  --%>
  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td  class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span style="width: 70%;"><%= institutionName%></span><br/>
			<span style=" display: block; margin-top: 8px;">BreastQ Survey Results</span><br/>            </td>
            <td width="50%" align="center" valign="bottom">
				<table  width="340" border="0" cellspacing="1" cellpadding="0" >
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient 
                    Identification</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" style="table-layout: fixed;" >
          <tr> 
            <td class="blackBoldText" style="width: 50%;"><img src="../../Images/shim.gif" border="0" width="4" height="15">Date: <% =apptClinicDate %></td>
			<td class="blackBoldText">Physician: <% =apptPhysicianName %></td>
          </tr>
        </table></td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow" style="border-bottom: none;">
          <table id="ProcedureDetails" width="100%" style="width: 100%;">
              <tr>
                  <td colspan="1">
                      <strong style="white-space: nowrap;">Procedures:</strong>
                  </td>
                  <td colspan="2">
                      <asp:Label runat="server" ID="ProceduresLabel"></asp:Label>
                  </td>
                  <td colspan="1">
                      <strong>Radiation:</strong>
                  </td>
                  <td colspan="2">
                      <asp:Label runat="server" ID="RadiationLabel"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td colspan="1">
                      <strong>Complications:</strong>
                  </td>
                  <td colspan="2">
                      <asp:Label runat="server" ID="ToxicityLabel"></asp:Label>
                  </td>
                  <td colspan="1">
                      <strong>Chemotherapy:</strong>
                  </td>
                  <td colspan="2">
                      <asp:Label runat="server" ID="ChemotherapyLabel"></asp:Label>
                  </td>
              </tr>
          </table>
          <hr />
	  	<table class="breastQGraphRow" cellspacing="0" width="100%">
          <tr> 
              <asp:Repeater runat="server" ID="ScalesRptr" OnItemDataBound="BuildScaleChart">
                  <ItemTemplate>
                      <td style="text-align: center;">
                          <!-- BreastQ Scale Chart -->
                          <chart:CaisisChart  runat="server" ID="BreastQChart" Width="370" Height="400" CssClass="breastQChart" RenderBase64="true">
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
                                          <LabelStyle Angle="-45" Enabled="true" Font="Arial, 8pt, style=Bold" />
                                      </AxisX>
                                      <AxisY Title="Total BQ Score" TitleFont="Arial, 10pt, style=Bold" IsStartedFromZero="true"
                                          Minimum="0" Maximum="100" Interval="10">
                                          <LabelStyle Font="Arial, 8pt, style=Bold" />
                                      </AxisY>
                                  </asp:ChartArea>
                              </ChartAreas>
                          </chart:CaisisChart>
                          <!-- debug -->
                          <asp:Repeater runat="server" ID="BreastQChart_Data">
                              <HeaderTemplate>
                                  <table style="width: 100%;">
                                      <thead>
                                          <tr>
                                              <th>
                                                  Survey
                                              </th>
                                              <th>
                                                  Date
                                              </th>
                                              <th>
                                                  Score
                                              </th>
                                          </tr>
                                      </thead>
                                      <tbody>
                              </HeaderTemplate>
                              <ItemTemplate>
                                  <tr>
                                      <td>
                                          <%# Eval("SurveyType") %>
                                      </td>
                                       <td>
                                          <%# Eval("SurveyDateText") %>
                                      </td>
                                      <td>
                                          <%# Eval("ScaleScore") %>
                                      </td>
                                  </tr>
                              </ItemTemplate>
                              <FooterTemplate>
                                  </tbody></table>
                              </FooterTemplate>
                          </asp:Repeater>
                      </td>
                      <asp:Literal ID="NewTableRow" runat="server" Visible="false"></tr></table></td></tr><tr><td class="FormOuterTableRow" style="border-bottom: none;"><table class="breastQGraphRow" cellspacing="0" width="100%"><tr></asp:Literal>
                  </ItemTemplate>
                  <FooterTemplate>
                      <tr>
                          <td colspan="2" style="text-align: center;">
                              <!-- Specialized Scale Chart -->
                              <h3 runat="server" id="ProcessOfCareLabel" style="text-align: center;" visible="false">
                                  Process Of Care: Not Applicable
                              </h3>
                              <chart:ProcessOfCareChart runat="server" ID="ProcessOfCareChart" Width="780" Height="400" CssClass="breastQChart" RenderBase64="true" />
                          </td>
                      </tr>
                  </FooterTemplate>
              </asp:Repeater>
<tr id="NoSurveyMsg" runat="server" visible="true"> 
      <td style="padding: 4px; text-align: center; height: 500px;">
			<span class="blackBoldText" style="font-size: 18pt;" >There is no BreastQ for this patient.</span>
	</td>
</tr>
</tr></tr></table></td></tr>	
	<tr> 
      <td class="FormOuterTableRow" style="padding: 4px; vertical-align: top; border-top: solid 1px #000000; height: 150px;">
			<span class="blackBoldText" >Comments</span>
	</td>
	</tr>
    <tr>
        <td height="14" align="center" valign="bottom" class="blackBoldText" style="border-top: solid 1px #000000;">
            Page <span id="PageNumber">1</span> of <span id="TotalPages">1</span>
        </td>
    </tr>
  </table>    
</div>
</div>