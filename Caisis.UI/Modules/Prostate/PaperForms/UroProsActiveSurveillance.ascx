<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.PaperForms.UroProsActiveSurveillance" CodeFile="UroProsActiveSurveillance.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>

<div id="BatchPageBreak" runat="server" visible="false" style="page-break-after: always; font-size: 1px; line-height: 1px;">&nbsp;</div>
<style type="text/css">
.EFormTable {	padding:0px 0px 0px 0px;

	width:100%;
}
.EFormTableRow {	background-color: #ffffff;
}

table#ProstateBiopsyScores
{
	width: 100%;
}
table#ProstateBiopsyScores td
{
	padding: 13px 4px;
	text-align: left;
	width: 30%;
}
span.ActiveSurveillanceNotes
{
	color: #666666;
	font-size: smaller;
	display: block;
	padding-left: 10px;
}
span.ActiveSurveillanceNotes span.noteTitle
{
	font-weight: bold;
}
span.ActiveSurveillanceNotes table
{
	border: solid 1px #666666;
	border-collapse: collapse;
	
}
span.ActiveSurveillanceNotes table td
{
	color: #666666;
	font-size: smaller;
	text-align: left;
	font-weight: normal;
	padding: 2px 15px;
}
span.ActiveSurveillanceNotes table td.labelCol { border-left: solid 1px #666666; }

table.PaperFormDataTable
{
    border: solid 1px #666666;
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
}
table.PaperFormDataTable td
{
    border: solid 1px #666666;
    padding: 1px;
    text-align: center;
}

table.PageBreakable
{
    table-layout: fixed;
}
table.PaperFormDataTable tr:last-child td
{
    border-bottom: none;
}

table#IPSSTable
{
    border-collapse: collapse;
    width: 100%;
}
table#IPSSTable th
{
    border: solid 1px #666666;
    font-size: smaller;
    padding: 2px 3px;
}
table#IPSSTable td
{
    border: solid 1px #666666;
    padding: 2px 3px;
    text-align: center;
    font-size: smaller;
    font-weight: bold;
}
table.ActiveSurveillancePSATable
{
    
}
table.ActiveSurveillancePSATable td { border-bottom: none; }
table.ActiveSurveillancePSATable td:nth-child(1) { width: 15%; padding: 5px 1px; }
table.ActiveSurveillancePSATable td:nth-child(2) { width: 12%; }
table.ActiveSurveillancePSATable td:nth-child(3) { width: 13%; }
table.ActiveSurveillancePSATable td:nth-child(4) { width: 9%; }
table.ActiveSurveillancePSATable td:nth-child(5) { width: 9%; }
table.ActiveSurveillancePSATable td:nth-child(6) { width: 9%; }
table.ActiveSurveillancePSATable td:nth-child(7) { width: 9%; }
table.ActiveSurveillancePSATable td:nth-child(8) { width: 8%; }
table.ActiveSurveillancePSATable td:nth-child(9) { width: 8%; }
table.ActiveSurveillancePSATable td:nth-child(10) { width: 8%; }


      span.ProstateQOLAnswer
      {
        text-decoration: underline;
        width: 20px;
        display: inline-block;
      }
</style>






<div id="PaperFormStart">

<div align="left"  style="page-break-after:always;">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN%></div>
		<div  class="VerticalBarCodeDocType">*U54*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType%></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate%></div>

	</div>
</div>


  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
              Urology Prostate Active Surveillance</span><br/>            </td>
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
                  <td colspan="1" align="left"><strong><% =patientLastName  %><% = ((patientLastName.Length > 0 && patientFirstName.Length > 0) ? ", " : "")%><% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
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
                    <% =patientPostalCode%></td>
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
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Date: 
              <% =apptClinicDate%>
              <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: 
              <span class="AppointmentPhysicianLabel"><% =apptPhysicianName%></span>            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td align="left" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">Referring&nbsp;M.D.: 
              <asp:Repeater ID="ReferringMD" Runat="server" > 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "phFirstName")%>
                  <%# DataBinder.Eval(Container.DataItem, "phLastName")%>
                  ( 
                  <%# DataBinder.Eval(Container.DataItem, "phInstitution")%>
                  )</ItemTemplate>
                <SeparatorTemplate>, </SeparatorTemplate>
              </asp:Repeater> <asp:Label ID="blankReferrringMD" Runat="server"></asp:Label>            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td height="50" align="left" valign="top" class="blackBoldText" style="padding: 2px 0px 0px 4px;">Chief Complaint
			<span style="margin-left: 30px; font-size: 12px; font-weight: normal;"><input type="checkbox" name="ActiveSurveillance_ChiefComplaint" style="vertical-align: middle;" />Active Surveillance</span></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="110" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">HPI</span><br/> 
        <table cellpadding="4" cellspacing="0" border="0">
          <tr> 
            <td class="HPIText" valign="top"> <asp:Repeater ID="hpi" Runat="server" OnItemDataBound="hpiItemDataBound"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "patientHPI")%>
                  <br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> <asp:Repeater ID="HpiProstatectomies" Runat="server" OnItemDataBound="HpiProstatectomiesItemDataBound"> 
                <ItemTemplate> <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ProcName")%>
                  </strong> on 
                  <%# DataBinder.Eval(Container.DataItem, "ProcDateText")%>
                  <asp:Label ID="CaseSurgeonLabel" Runat="server">by 
                    <%# DataBinder.Eval(Container.DataItem, "ProcSurgeon")%>                  </asp:Label>
                  <br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> <asp:Label ID="PreTxPot" Runat="server" />
              
              <asp:Repeater ID="hpiProtocols" Runat="server" OnItemDataBound="appendToHpiItemDataBound"> 
                <ItemTemplate> Protocol 
                  <%# DataBinder.Eval(Container.DataItem, "ProtocolNum")%>  <%# DataBinder.Eval(Container.DataItem, "ProtocolNotes")%> 
                  <%# DataBinder.Eval(Container.DataItem, "PtProtocolStatus")%>
                  <br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater>
              
              <asp:Repeater ID="hpiBiopsies" runat="server" > 
                <ItemTemplate> Biopsy:&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ProcDateText")%>
                  &nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ProcName")%>
                  &nbsp;&nbsp;Result:&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathResult")%>
                  &nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathQuality")%>
                  <br/>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> 
              
              
         <asp:Label ID="NVB_Left" Runat="server" /> <asp:Label ID="NVB_Right" Runat="server" />            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="FormOuterTableTopRow" valign="bottom"  style="padding: 2px;"><table cellspacing="0" cellpadding="0" style="width: 100%;">
          <tr>
            <td style="width: 250px; padding: 15px 4px 4px 4px;">Dx Date: <asp:Label ID="DxDateLabel" runat="server">___________________</asp:Label></td>
            <td style="padding: 15px 4px 4px 4px;">Active Surveillance Date: <asp:Label ID="ASDateLabel" runat="server">___________________</asp:Label></td>
          </tr>
      </table></td>
      </tr>
    <tr>
      <td class="FormOuterTableTopRow" style="padding: 2px 4px; height: 60px; vertical-align: top;">
      <span  class="blackBoldText" style="display: block; margin-bottom: 5px;">Interval History</span>

      </td>
      </tr>
    <tr> 
      <td class="FormOuterTableRow"> <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Biopsy History</span>
		
		<style type="text/css">
		
		img.first-msk 
		{
		    width: 6px;
		    height: 9px;
		    border: none;
		    margin-right: 3px;
		    display: none; 
		}
		
		
		tr.local-institution img.first-msk
		{
		    display: inline; 
		}
		tr.local-institution td
		{
		    font-weight: bold;
		}
		table.BiopsyCoresPopDataTable
		{
		    width: 100%;
		    border-collapse: collapse;
		    table-layout: fixed;
		}
		table.BiopsyCoresPopDataTable td
		{
		    text-align: center;
		    border: solid 1px #666666;
		    padding: 1px;
		}
		table.BiopsyCoresPopDataTable th
		{
		    text-align: center;
		    border: solid 1px #666666;
		    padding: 1px;
		    font-weight: bold;
		}
		.inputFieldFlat
		{
		    border: solid 1px #666666;
		    text-align: center;
		}
		</style>
		
		<br/> 
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td style="width: 13%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Date</td>
            <td style="width: 15%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Type</td>
            <td style="width: 22%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Result</td>
            <td style="width: 10%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Data Source </td>
            <td style="width: 40%; border-top: solid 1px #000000; text-align: center; vertical-align: middle;" class="FormInsideTableTopCell">Comments</td>
          </tr>
		  </table>
	    </td>
	  </tr>
		  
		      <asp:Repeater ID="Biopsies" runat="server"  OnItemDataBound="BiopsiesOnDataBound" > 
				<ItemTemplate>
    <tr id="BiopsyPopDataRow" runat="server"> 
      <td class="FormOuterTableRow">

		<table style="width: 100%; border-spacing: 0; border: none;" cellpadding="0" cellspacing="0">
          <tr> 
						<td height="26" align="center" class="FormInsideTableRegCell" style="width: 13%; border-top: solid 1px #000000; text-align: center; border-bottom: none;"><img src="../../Images/FormImages/WidgetRight.png" class="first-msk" /><%# DataBinder.Eval(Container.DataItem, "ProcDateText")%>&nbsp;</td>
						<td align="center" class="FormInsideTableRegCell" style="width: 15%; border-top: solid 1px #000000; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "ProcName")%>&nbsp;</td>
						<td class="FormInsideTableRegCell" style="width: 22%; padding-left: 5px; border-top: solid 1px #000000;"><asp:Literal ID="ResultField" Runat="server" />&nbsp;</td>
						<td class="FormInsideTableRegCell" style="width: 10%; padding-left: 5px; border-top: solid 1px #000000; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathQuality")%>&nbsp;</td>
						<td class="FormInnerRowBottomBorder" style="width: 40%; padding-left: 5px; border-top: solid 1px #000000;"><asp:Literal ID="CommentsField" Runat="server" />&nbsp;</td>
			    </tr>
					  
					  <tr id="CoresContainer" runat="server" visible="false">
					  <td class="FormInsideTableRegCell" style="padding: 0px 0px 0px 0px; border-bottom: none;">&nbsp;</td>
            <td colspan="4" style="padding: 0px 0px 0px 0px; border: none; ">
                <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" style="">
                          <tr> 
                            <td align="center" valign="middle" class="FormInsideTableRegCell" style="width: 43%; padding: 8px 0px 4px 0px;"><strong>Gleason Grade</strong> 
                               &nbsp;&nbsp;<input type="text" name="BxGG1" size="2" maxlength="48" class="inputFieldFlat" value="<%# DataBinder.Eval(Container.DataItem, "PathGG1") %>"> &nbsp;<strong>+</strong>&nbsp; <input type="text" name="BxGG2" size="2" maxlength="48" class="inputFieldFlat" value="<%# DataBinder.Eval(Container.DataItem, "PathGG2") %>"> 
                              &nbsp; <strong>=</strong>&nbsp; <input type="text" name="BxGGS" size="2" maxlength="48" class="inputFieldFlat" value="<%# DataBinder.Eval(Container.DataItem, "PathGGS") %>"></td>
                            <td align="center" valign="middle" class="FormInsideTableRegCell" style="padding: 8px 0px 4px 0px;"><strong>Cores</strong> &nbsp;&nbsp;Positive: 
                              <input type="text" name="BxPosCores" size="3" maxlength="48" class="inputFieldFlat" value="<%# DataBinder.Eval(Container.DataItem, "PathPosCores") %>"> 
                              &nbsp;&nbsp;Total: 
                              <input type="text" name="BxNumCores" size="3" maxlength="48" class="inputFieldFlat" value="<%# DataBinder.Eval(Container.DataItem, "PathNumCores") %>"></td>
                          </tr>
                    </table>
          <table class="BiopsyCoresPopDataTable" cellspacing="0" style="width: 100%; border-collapse: collapse;" >
                            <tr> 
                              <th align="center">Side</th>
                              <th align="center">Laterality</th>
                              <th align="center">Level / Zone</th>
                              <th width="7%" align="center">Pos Cores</th>
                              <th width="7%" align="center">Total Cores </th>
                              <th width="7%" align="center">GG1</th>
                              <th width="7%" align="center">GG2</th>
                              <th width="7%" align="center">GGS</th>
                              <th width="7%" align="center">%Ca</th>
                              <th width="7%" align="center">mmCa</th>
                              <th width="8%" align="center">mmCore</th>
                      </tr>
					        <asp:Repeater ID="Cores" runat="server"  > 
				            <ItemTemplate> 
                            <tr> 
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreSide")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreLaterality")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreLevel")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreNumCores")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreNumTotalCores")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreGG1")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreGG2")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreGGS")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCorePercCancer")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreMaxCancerLength")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreLength")%>&nbsp;</td>
                              </tr>
				            </ItemTemplate>
			              </asp:Repeater>
				    </table>
				        </td>
					  </tr>
		  </table>
		  </td>
		</tr>
				</ItemTemplate>
			  </asp:Repeater>
<tr id="BlankBiopsyRecord" runat="server" ><td class="FormOuterTableRow"><table cellspacing="0" style="width: 100%; border-spacing: 0; table-layout: fixed;">
          <tr > 
            <td height="25"  style="width: 13%; border-top: solid 1px #000000; text-align: center; border-bottom: none;" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
            <td  style="width: 15%; border-top: solid 1px #000000; text-align: center;" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell"  style="width: 22%; border-top: solid 1px #000000;">&nbsp;</td>
            <td class="FormInsideTableRegCell" style="width: 10%; border-top: solid 1px #000000;">&nbsp;</td>
            <td class="FormInnerRowBottomBorder" style="width: 40%; border-top: solid 1px #000000;">&nbsp;</td>
          </tr>
		  <tr id="BiopsyCoresBlankDataTable" runat="server" > 
		  	<td class="FormInsideTableRegCell">&nbsp;</td>
            <td colspan="4">
			<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="center" valign="middle" class="FormInsideTableRegCell" style="width: 43%; padding: 8px 0px 4px 0px;"><strong>Gleason Grade</strong> 
               &nbsp;&nbsp;<input type="text" name="BxGG1" size="2" maxlength="48" class="inputFieldFlat"> &nbsp;<strong>+</strong>&nbsp; <input type="text" name="BxGG2" size="2" maxlength="48" class="inputFieldFlat"> 
              &nbsp; <strong>=</strong>&nbsp; <input type="text" name="BxGGS" size="2" maxlength="48" class="inputFieldFlat"></td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" style="padding: 8px 0px 4px 0px;"><strong>Cores</strong> &nbsp;&nbsp;Positive: 
              <input type="text" name="BxPosCores" size="3" maxlength="48" class="inputFieldFlat"> 
              &nbsp;&nbsp;Total: 
              <input type="text" name="BxNumCores" size="3" maxlength="48" class="inputFieldFlat"></td>
          </tr>
          <tr> 
            <td colspan="5"> <table align="center" style="width: 100%;" cellpadding="0" cellspacing="0">
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">Side</td>
                  <td align="center" class="FormInsideTableRegCell">Laterality</td>
                  <td align="center" class="FormInsideTableRegCell">Level</td>
                  <td width="7%" align="center" class="FormInsideTableRegCell">Pos Cores</td>
                  <td width="7%" align="center" class="FormInsideTableRegCell">Total Cores </td>
                  <td width="7%" align="center" class="FormInsideTableRegCell">GG1</td>
                  <td width="7%" align="center" class="FormInsideTableRegCell">GG2</td>
                  <td width="7%" align="center" class="FormInsideTableRegCell">GGS</td>
                  <td width="7%" align="center" class="FormInsideTableRegCell">%Ca</td>
                  <td width="7%" align="center" class="FormInsideTableRegCell">mmCa</td>
                  <td width="8%" align="center" class="FormInsideTableRegCell">mmCore</td>
                  <td width="6%" align="center" class="FormInsideTableRegCell">PNI</td>
                  <td width="7%" align="center" class="FormInsideTableRegCell">ASAP</td>
                  <td width="7%" align="center" class="FormInsideTableRegCell">HG PIN </td>
                  </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">Lateral</td>
                  <td align="center" class="FormInsideTableRegCell">A</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">Lateral</td>
                  <td align="center" class="FormInsideTableRegCell">M</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">Lateral</td>
                  <td align="center" class="FormInsideTableRegCell">B</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">Medial</td>
                  <td align="center" class="FormInsideTableRegCell">A</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">Medial</td>
                  <td align="center" class="FormInsideTableRegCell">M</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">Medial</td>
                  <td align="center" class="FormInsideTableRegCell">B</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">TZ</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr><tr>
                  <td align="center" class="FormInsideTableRegCell">Right</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">Lateral</td>
                  <td align="center" class="FormInsideTableRegCell">A</td> 
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">Lateral</td>
                  <td align="center" class="FormInsideTableRegCell">M</td> 
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">Lateral</td>
                  <td align="center" class="FormInsideTableRegCell">B</td> 
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">Medial</td>
                  <td align="center" class="FormInsideTableRegCell">A</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">Medial</td>
                  <td align="center" class="FormInsideTableRegCell">M</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                <tr>
                  <td align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">Medial</td>
                  <td align="center" class="FormInsideTableRegCell">B</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
                <tr> 
                  <td align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">TZ</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr><tr> 
                  <td align="center" class="FormInsideTableRegCell">Left</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  </tr>
              </table>             </td>
          </tr>
        </table>			</td>
		  </tr>
        </table>		</td>
    </tr>
	


    <tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Biochemical Markers/Lab Tests</span> 
			  <table width="100%" border="0" cellpadding="1" cellspacing="0" class="PaperFormDataTable PageBreakable ActiveSurveillancePSATable">
                <tr > 
                  <td  >Date</td>
                  <td  >PSA</td>
                  <td  >PSA Density</td>
                  <td  >Prolaris Score</td>
                  <td  >Prolaris AUA</td>
                  <td  >Oncotype GPS</td>
                  <td  >Oncotype Path</td>
                  <td  >PCA3</td>
                  <td  >PHI</td>
                  <td  >4K</td>
                </tr>
                </table>
</td>
    </tr>
<asp:Repeater ID="labTests" Runat="server"> 
<ItemTemplate>
	<tr> 
      <td class="FormOuterTableRow" style="border-bottom: none;">
			  <table width="100%" border="0" cellpadding="1" cellspacing="0" class="PaperFormDataTable PageBreakable ActiveSurveillancePSATable">
                    <tr> 
                      <td ><%# DataBinder.Eval(Container.DataItem, "LabDateText")%></td>
                      <td ><%# DataBinder.Eval(Container.DataItem, "PSA")%>&nbsp;</td>
                      <td ><%# DataBinder.Eval(Container.DataItem, "PSADT")%></td>
                      <td ><%# DataBinder.Eval(Container.DataItem, "Prolaris Score")%>&nbsp;</td>
                      <td ><%# DataBinder.Eval(Container.DataItem, "Prolaris AUA")%>&nbsp;</td>
                      <td ><%# DataBinder.Eval(Container.DataItem, "Oncotype GPS")%>&nbsp;</td>
                      <td ><%# DataBinder.Eval(Container.DataItem, "Oncotype Path")%>&nbsp;</td>
                      <td ><%# DataBinder.Eval(Container.DataItem, "UPCA3")%>&nbsp;</td>
                      <td ><%# DataBinder.Eval(Container.DataItem, "PHI")%>&nbsp;</td>
                      <td ><%# DataBinder.Eval(Container.DataItem, "4K")%>&nbsp;</td>
					  </tr>
              </table>
</td>
    </tr>
</ItemTemplate>
</asp:Repeater>
	<tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText" style="margin-left: 4px;">MRI History</span>
      <table class="PaperFormDataTable" cellspacing="0" cellpadding="0" border="0">
                  <tr >
                    <td style="width: 15%;">Date</td>
                    <td style="width: 15%;">Side</td>
                    <td style="width: 25%;">Site</td>
                    <td style="width: 45%;">Probability</td>
<%--                    <td style="width: 10%;">SVI</td>
                    <td style="width: 10%;">ECE</td>
                    <td style="width: 10%;">LNI</td>
--%>                  </tr>


<asp:Repeater ID="images" Runat="server" > <%--OnItemDataBound="AddExtentionAndInvasion" --%>
<ItemTemplate>
                  <tr >
                    <td style="height: 24px;" ><%# DataBinder.Eval(Container.DataItem, "DxDateText")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "ImgFindSide")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "ImgFindSubsite")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "ImgFindResult")%>&nbsp;</td>
<%--                    <td ><asp:Label ID="SVI" runat="server" />&nbsp;</td>
                    <td ><asp:Label ID="ECE" runat="server" />&nbsp;</td>
                    <td ><asp:Label ID="LNI" runat="server" />&nbsp;</td>
--%>                  </tr>
</ItemTemplate>
</asp:Repeater>

              </table>
			  <%-- 
			  <span class="ActiveSurveillanceNotes" >
			  <span class="noteTitle">Impression Key</span>
			  <table cellpadding="1" cellspacing="0">
			  <tr>
			  <td class="labelCol">Consistent with</td>
			  <td>&gt;90%</td>
			  <td class="labelCol">Possible / Possibly</td>
			  <td>~50%</td>
			  <td class="labelCol">Unlikely</td>
			  <td>&lt;10%</td>
			  </tr>
			  <tr>
			  <td class="labelCol">Suspicious for / Probable / Probably</td>
			  <td>~75%</td>
			  <td class="labelCol">Less Likely</td>
			  <td>~25%</td>
			  <td class="labelCol">&nbsp;</td>
			  <td>&nbsp;</td>
			  </tr>
			  </table>
			  </span>--%>	  
</td>
	</tr>

    <tr> 
      <td valign="top" class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td > 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText" style="margin-left: 4px;">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
                    <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes">
                    NKA&nbsp;&nbsp; 
                    <input name="DateLastGnRH3" type="checkbox" id="DateLastGnRH3" value="yes">
                    Unchanged Since Last Visit</span></td>
                </tr>
                <tr align="center"> 
                  <td width="40%" class="FormInsideTableRegCell">Allergen</td>
                  <td class="FormInsideTableRegCell">Reaction</td>
                </tr>
                <asp:Repeater ID="allergies" Runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td class="FormInsideTableRegCell" style="height:25px;">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "Allergen")%>                      </td>
                      <td class="FormInnerRowBottomBorder">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "AllergyResponse")%>                      </td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
          </tr>
        </table></td>
    </tr>
    
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td style="height: 100px; vertical-align: top; padding: 4px;"><span  class="blackBoldText" style="display: block; margin-bottom: 5px;">Medical &amp; Surgical History/Comorbidities</span>
              <asp:Repeater ID="comorbidities" Runat="server"> 
                <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "ComorbDateText")%> - <strong><%# DataBinder.Eval(Container.DataItem, "Comorbidity")%></strong></ItemTemplate>
                <SeparatorTemplate><br /></SeparatorTemplate>
              </asp:Repeater> </td>
          </tr>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU47<img src="../../Images/shim.gif" border="0" width="45" height="1">U54<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/17/2014<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:02/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">1</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>
<div align="left" style="page-break-after:always;">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN%></div>
		<div  class="VerticalBarCodeDocType">*U54*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType%></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate%></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
              Urology Prostate Active Surveillance</span></td>
            <td width="50%" align="center" valign="bottom"> <table  width="340" border="0" cellspacing="1" cellpadding="0" >
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
                  <td colspan="1" align="left"><strong><% =patientLastName  %><% = ((patientLastName.Length > 0 && patientFirstName.Length > 0) ? ", " : "")%><% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
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
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient 
                    Identification</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate%>
        </span></td>
    </tr>

    <tr> 
      <td valign="top" class="FormOuterTableRow">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr valign="top"> 
            <td width="49%" class="FormInnerRowRightBorder"><span class="blackBoldText">Family History:</span><img src="../../Images/shim.gif" border="0" width="50" height="1"><input type="checkbox" name="famHxProstateCancerYes2" runat="server" ID="famHxProstateCancerYes2"/>No known family history of ca<br/> 
			  <table width="98%" border="0" cellspacing="0" cellpadding="0" id="BlankFamilyHistoryTable" runat="server">
				<tr> 
				  <td><img src="../../Images/shim.gif" border="0" width="72" height="1"></td>
				  <td><img src="../../Images/shim.gif" border="0" width="25" height="1"></td>
				  <td><img src="../../Images/shim.gif" border="0" width="25" height="1"></td>
				  <td><img src="../../Images/shim.gif" border="0" width="40" height="1"></td>
				  <td><img src="../../Images/shim.gif" border="0" width="150" height="1"></td>
				</tr>
				<tr> 
				  <td>&nbsp;</td>
				  <td align="center">Y</td>
				  <td align="center">N</td>
				  <td>&nbsp;</td>
				  <td>&nbsp;</td>
				</tr>
				<tr> 
				  <td>Prostate Ca</td>
				  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
				  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
				  <td align="right">If Y:&nbsp;</td>
				  <td>Number 1&deg; relatives:&nbsp;&nbsp;_______</td>
				</tr>
				<tr> 
				  <td colspan="3">&nbsp;</td>
				  <td>&nbsp;</td>
				  <td>Number other relatives:&nbsp;_______</td>
				</tr>
				<tr>
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr> 
				  <td colspan="2">Side of Family</td>
				  <td colspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;Maternal<img src="../../Images/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;&nbsp;Paternal</td>
				</tr>
				<tr> 
				  <td><img src="../../Images/shim.gif" border="0" width="10" height="15"></td>
				  <td align="center" valign="bottom">Y</td>
				  <td align="center" valign="bottom">N</td>
				  <td>&nbsp;</td>
				  <td>&nbsp;</td>
				</tr>
				<tr valign="top"> 
				  <td>Other Ca</td>
				  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
				  <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
				  <td align="right">List:&nbsp;</td>
				  <td>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Breast</td>
							<td align="left"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Testis</td>
						</tr>
						<tr>
							<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Bladder</td>
							<td align="left" valign="top" rowspan="2"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Other:</td>
						</tr>
						<tr>
							<td><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">Kidney</td>
						</tr>
					</table>				  </td>
				</tr>
                <tr> 
                  <td colspan="5">
				  	<table width="312" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td><img src="../../Images/shim.gif" border="0" width="40" height="8"></td>
                        <td><img src="../../Images/shim.gif" border="0" width="50" height="1"></td>
                        <td><img src="../../Images/shim.gif" border="0" width="50" height="1"></td>
                        <td><img src="../../Images/shim.gif" border="0" width="50" height="1"></td>
                        <td><img src="../../Images/shim.gif" border="0" width="122" height="8"></td>
                      </tr>
                      <tr> 
                        <td>&nbsp;</td>
                        <td align="center">Alive</td>
                        <td align="center">Dead</td>
                        <td align="center">Age</td>
                        <td align="center">Cause of Death</td>
                      </tr>
                      <tr> 
                        <td>Mother</td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center">______</td>
                        <td align="center">________________</td>
                      </tr>
                      <tr> 
                        <td>Father</td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center">______</td>
                        <td align="center">________________</td>
                      </tr>
                      <tr> 
                        <td>Other</td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
                        <td align="center">______</td>
                        <td align="center">________________</td>
                      </tr>
                    </table>					</td>
                </tr>
              </table>
              <br/> <asp:Repeater ID="familyHistory" Runat="server"> <%-- OnItemCreated="FamilyHistoryItemCreated"--%> 
                <ItemTemplate> <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "FamMemNum") %>
                  <%# DataBinder.Eval(Container.DataItem, "FamMemRelation") %>
                  <asp:Label ID="FamMemSide" Runat="server">( 
                    <%# DataBinder.Eval(Container.DataItem, "FamMemSide") %>
                    )</asp:Label>
                  </strong> 
                  <asp:Label ID="FamMemDiagnosis" Runat="server" >with 
                    <%# DataBinder.Eval(Container.DataItem, "FamMemDiagnosis") %>                  </asp:Label>
                  <br/>
                </ItemTemplate>
              </asp:Repeater>			</td>
            <td width="51%"><p><span class="blackBoldText">Social History:</span><br/>
                <img src="../../Images/shim.gif" width="5" height="9" hspace="0" vspace="0" border="0"><br/>
                Occupation: 
                <asp:Label ID="socHxOccupation" Runat="server" /><br/>
                <img src="../../Images/shim.gif" width="5" height="9" hspace="0" vspace="0" border="0"><br/>
                Marital Status: 
                <asp:Label ID="socHxMaritalStatus" Runat="server" /><img src="../../Images/shim.gif" border="0" width="70" height="1">Children: 
                <asp:Label ID="socHxChildren" Runat="server" /><br/>
                <img src="../../Images/shim.gif" border="0" width="1" height="8"><br/>
                <span style="width: 100px; display: inline-block;">Tobacco Use:</span><input type="checkbox" name="Digitized222222"> None<br/>
                <span style="width: 100px; display: inline-block;">&nbsp;</span><asp:Label ID="socHxTobaccoType" Runat="server"><input type="checkbox" name="Digitized2222"> Cigarettes <img src="../../Images/shim.gif" border="0" width="10" height="8"> <input type="checkbox" name="Digitized22222"> Cigar<img src="../../Images/shim.gif" border="0" width="10" height="1"> <input type="checkbox" name="Digitized22223"> Pipe</asp:Label><br/>
                <span style="width: 100px; display: inline-block;">&nbsp;</span><input type="checkbox"  id="socHxTobaccoPacksPerDayCheckBox" runat="server" NAME="socHxTobaccoPacksPerDayCheckBox"/> <asp:Label ID="socHxTobaccoPacksPerDay" Runat="server">______</asp:Label> packs/day for <asp:Label ID="socHxTobaccoYears" Runat="server">______</asp:Label> years<br/><br/>
                <span style="width: 100px; display: inline-block;">&nbsp;</span><input type="checkbox" id="socHxTobaccoQuitYearCheckbox" runat="server" NAME="socHxTobaccoQuitYearCheckbox"/> Quit Year: <asp:Label ID="socHxTobaccoQuitYear" Runat="server">______</asp:Label><br/><br/>
                Alcohol Use: 
                <asp:Label ID="socHxAlcohol" Runat="server" /><br/>
                <br/>
                Carcinogen Exposure: 
                <asp:Label ID="socHxCarcinogen" Runat="server" /><br/>
              </p></td>
          </tr>
        </table>		</td>
    </tr>
	
    <tr> 
      <td class="FormOuterTableRow"> <img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Review of Systems</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician 
        Performing Review: 
        <input type="checkbox" name="PA22" value="Yes">
        RN&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="PA3" value="Yes">
        PA/NP&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Fellow3" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending3" value="Yes">
        Attending</span> 
        <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" >
          <!-- <tr>
						<td colspan="5" align="left" valign="top" class="blackBoldText"><img src="../../images/shim.gif" border="0" width="8" height="0">Review of Systems<br/></td>
						<td colspan="1" align="left" valign="top"></td>
					</tr> -->
          <tr> 
            <td align="center" class="FormInsideTableTopCell"><strong>System</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Not<br/>
              Present</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Present</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Disease<br/>
              Related</strong></td>
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr>
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Gen&nbsp;</td>
            <td height="20" align="left" class="FormInsideTableRegCell">Fatigue</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="20" align="left" class="FormInsideTableRegCell">Fever</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Skin&nbsp;</td>
            <td height="20" align="left" class="FormInsideTableRegCell">Wounds</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr>
            <td height="20" align="left" class="FormInsideTableRegCell">Breast 
              Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp&nbsp;</td>
            <td height="20" align="left" class="FormInsideTableRegCell">Cough</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell">Dyspnea</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">CV&nbsp;</td>
            <td height="20" align="left" class="FormInsideTableRegCell"> Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell">Chest 
              Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">GI&nbsp;</td>
            <td height="20" align="left" class="FormInsideTableRegCell">Dyspepsia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell">Diarrhea</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">GU&nbsp;</td>
            <td height="20" align="left" class="FormInsideTableRegCell">Obstruction</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="5" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell">Hematuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell">Dysuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell">Frequency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell">Penile 
              Pain/Curvature/Length</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Psych&nbsp;</td>
            <td height="20" align="left" class="FormInsideTableRegCell">Depression</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell">Anxiety</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Neuro&nbsp;</td>
            <td height="20" align="left" class="FormInsideTableRegCell">Numbness/Tingling</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="2" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell">Headaches</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">Other:<br/> 
              <img src="../../Images/shim.gif" border="0" width="0" height="6"></td>
            <td height="20" align="left" valign="top" class="FormInnerRowRightBorder">&nbsp;</td>
            <td align="center" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="left" valign="top" class="FormInnerRowRightBorder">&nbsp;</td>
            <td valign="top">&nbsp;</td>
            <td align="left" valign="top">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td colspan="4" class="FormInnerRowBottomBorder"><strong>Prostate QOL Survey</strong></td>
    </tr>
  <tr>
    <td class="FormInnerRowRightBorder blackBoldTextSmall">Sexual</td>
    <td class="FormInnerRowRightBorder blackBoldTextSmall">Urinary</td>
    <td class="FormInnerRowRightBorder blackBoldTextSmall">Bowel</td>
    <td class="blackBoldTextSmall">General</td>
  </tr>
  <tr>
    <td height="35" valign="top" class="FormInnerRowRightBorder" style="padding-top:11px;"><span class="smallGrayText" style="color: #000000;">Q1:____&nbsp;Q2:____&nbsp;&nbsp;Q3:____&nbsp;&nbsp;Q4:____&nbsp;Q5:____&nbsp;&nbsp;Q6:____&nbsp;&nbsp;Q7:____<br />
      <!--<asp:Label ID="LastUrinaryQOLScores" Runat="server" />--><asp:Label ID="UrinaryQOL" Runat="server" CssClass="blackBoldTextSmall" />
    </span></td>
    <td valign="top" class="FormInnerRowRightBorder" style="padding-top:11px;"><span class="smallGrayText" style="color: #000000;">Q1:____&nbsp;Q2:____&nbsp;&nbsp;Q3:____&nbsp;&nbsp;Q4:____&nbsp;Q5:____</span><br />
      <!--<asp:Label ID="LastSexualQOLScores" CssClass="blackBoldTextSmall"  Runat="server" />--><asp:Label CssClass="blackBoldTextSmall" ID="SexualQOL" Runat="server" /></td>
    <td valign="top" class="FormInnerRowRightBorder" style="padding-top:11px;"><span class="smallGrayText" style="color: #000000;">Q1:____&nbsp;Q2:____</span></td>
    <td valign="top" style="padding-top:11px;"><span class="smallGrayText" style="color: #000000;">Q1:____</span></td>
  </tr>
</table>	  </td>
    </tr>
<%--     <tr> 
      <td class="FormOuterTableRow"> <table width="100%" align="center" border="0" cellpadding="2" cellspacing="0" >
          
          <tr> 
            <td width="300" class="FormInsideTableRegCell" colspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">1.</span>&nbsp;Continence:<img src="../../Images/shim.gif" width="10" height="0"> 
              <input name="textfield4" type="text" class="inputFieldFlat" size="5"><br/><asp:Label ID="LastCont" Runat="server" CssClass="blackBoldTextSmall"/></td>
            <td align="left" valign="top" rowspan="5"> <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" >
              <tr> 
                <td><p class="smallGrayText">1 - Continence(no pads)<br/>
                  2 - Mild SUI(leaks only during heavy actvty)<br/>
                  3 - Moderate SUI(leaks with moderate actvty)<br/>
                  4 - Severe SUI<br/>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(leaks during nl actvty, dry 
                  at night and at rest)<br/>
                  5 - Total incont(continuous leakage of urine at rest)</p></td>
                  </tr>
              </table>
                <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" >
                  <tr> 
                    <td height="61" valign="top" nowrap class="smallGrayText">NONE<br/>
                      AUS - Sphincter<br/>
                      OU - Optical urethrotomy<br/>
                    BIO - Biofeedback</td>
                    <td valign="top" nowrap class="smallGrayText">MED - Medications 
                      only<br/>
                      DIL - Urethral dilation<br/>
                      COL - Collagen injection<br/>
                    URO - Urodynamics</td>
                  </tr>
              </table></td>
          </tr>
          <tr> 
            <td colspan="2"  class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">2.</span>&nbsp;Date 
              Mild Incontinence Achieved (#2): 
              <input name="ContLv2Textbox" id="ContLv2Textbox" runat="server" type="text" class="inputFieldFlat" size="10" /> </td>
            </tr>
          <tr> 
            <td colspan="2" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">3.</span>&nbsp;Date 
              Total Contin. Achieved (#1): 
              <input name="ContLv1Textbox" id="ContLv1Textbox" runat="server" type="text" class="inputFieldFlat" size="10" /> </td>
            </tr>
          <tr> 
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">4.</span>&nbsp;TX 
              for Incontinence: 
              <input name="textfield" type="text" class="inputFieldFlat" size="10"></td>
            <td align="left" class="FormInsideTableRegCell">Tx Date: <input name="textfield" type="text" class="inputFieldFlat" size="10"></td>
          </tr>
          <tr> 
            <td ><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">5.</span>&nbsp;TX 
              for Stricture:<img src="../../Images/shim.gif" border="0" width="20" height="1"> 
              <input name="textfield" type="text" class="inputFieldFlat" size="10"></td>
            <td class="FormInnerRowRightBorder">Tx Date: <input name="textfield" type="text" class="inputFieldFlat" size="10"></td>
          </tr>
          <tr id="LastIncontTxTableRow" runat="server"> 
            <td class="FormInnerRowRightBorder" colspan="2"><img src="../../Images/shim.gif" border="0" width="20" height="1"> 
              <asp:Label ID="LastIncontTx" Runat="server" CssClass="blackBoldTextSmall" /></td>
            <td align="left" valign="top">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table width="100%" align="center" border="0" cellpadding="2" cellspacing="0" >
          <tr> 
            <td colspan="2" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Erectile 
              Function</span><br/><asp:Label CssClass="FormPopulatedSmallerText" ID="LastPot" Runat="server" />
              <br />
              <span class="smallGrayText"><img src="../../Images/shim.gif" border="0" width="4" height="0" /><span class="blackBoldText">6.</span>&nbsp;On PDE-5?
<input type="checkbox" name="Yes2">Yes&nbsp;<input type="checkbox" name="Yes22">No<br/>
              </span></td>
            <td rowspan="7" valign="top" class="FormInnerRowRightBorder"><br />
                <br />
                <br />
			  Current Erectile Function Codes <br/>
              1-Normal, full erections <br/>
              2-Full, but recently diminished <br/>
              3-Partial, satis. for intercourse <br/>
              4-Partial, unsatis. for intercourse<br/>
              5-Impotent</span></td>
            <td width="38%"  rowspan="7" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">13.</span>&nbsp;TX 
              for Erectile Dysfunction (that apply):<br/> <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" >
                <tr> 
                  <td class="FormInsideTableTopLeftCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableTopCell">Start Date</td>
                  <td align="center" class="FormInsideTableTopCell">Stop Date</td>
                </tr>
                <asp:Repeater ID="QolTherapy" runat="server" > 
                  <ItemTemplate> 
                    <tr id="QolTherapyRow" runat="server"> 
                      <td class="FormInsideTableLeftCell">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "QOL_Therapy")%>                      </td>
                      <td class="FormInsideTableRegCell">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "QOL_TxDateText")%>                      </td>
                      <td class="FormInnerRowBottomBorder">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "QOL_TxStopDateText")%>                      </td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">Oral Agents&nbsp;(ex: Viagra)</td>
                  <td class="FormInsideTableRegCell">&nbsp;<img src="../../Images/shim.gif" width="60" height="1"></td>
                  <td class="FormInnerRowBottomBorder">&nbsp;<img src="../../Images/shim.gif" width="60" height="1"></td>
                </tr>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">Topical Agents</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">Vacuum Erection Device</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">Intracorp. Injection</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">MUSE</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">Penile Prosthesis</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
              </table>			</td>
          </tr>
          <tr> 
            <td nowrap class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">7.</span>&nbsp;Current Erectile Function:</td>
            <td align="left" class="FormInsideTableRegCell"><input type="text" name="CurrentErectileFunctionTextbox" runat="server" id="CurrentErectileFunctionTextbox" class="inputFieldFlat" size="10"></td>
          </tr>
		  <tr> 
            <td nowrap class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">8.</span>&nbsp;Date 
              #3 Achieved On:</td>
            <td align="left" class="FormInsideTableRegCell"> <input type="text" name="potLv3Textbox" runat="server" id="potLv3Textbox" class="inputFieldFlat" size="10"></td>
          </tr>
          <tr> 
            <td nowrap class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">9.</span>&nbsp;Date 
              #2 Achieved On:</td>
            <td class="FormInsideTableRegCell"> <input type="text" name="potLv2Textbox" runat="server" id="potLv2Textbox" class="inputFieldFlat" size="10"></td>
          </tr>
          <tr> 
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">10.</span>&nbsp;Date 
              #1 Achieved On: </td>
            <td align="left" class="FormInsideTableRegCell"> <input type="text" name="potLv1Textbox" runat="server" id="potLv1Textbox" class="inputFieldFlat" size="10"></td>
          </tr>
          <tr> 
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">% Best erection w/ PO meds:</td>
            <td align="left" class="FormInsideTableRegCell" nowrap><input type="text" name="textfield242" class="inputFieldFlat" size="10">%</td>
          </tr>
          <tr> 
            <td class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">% Best erection w/o meds:</td>
            <td align="left" class="FormInsideTableRegCell" nowrap><input type="text" name="textfield243" class="inputFieldFlat" size="10">%</td>
          </tr>
        </table></td>
    </tr>
--%>
<tr><td class="FormOuterTableRow">
<table style="table-layout: fixed; width: 100%;" cellspacing="0" cellpadding="0" >
<tr>
<td style="width: 24%; border-right: solid 1px #000000; vertical-align: top; padding: 0 0 0 0;"><span class="blackBoldText" style="display: block; padding: 7px 4px 4px 4px;">IPSS</span>
<table id="IPSSTable" cellspacing="0" >
<tr><th>Question</th><th>Score (1-5)</th></tr>
<tr><td>1</td><td>&nbsp;</td></tr>
<tr><td>2</td><td>&nbsp;</td></tr>
<tr><td>3</td><td>&nbsp;</td></tr>
<tr><td>4</td><td>&nbsp;</td></tr>
<tr><td>5</td><td>&nbsp;</td></tr>
<tr><td>6</td><td>&nbsp;</td></tr>
<tr><td>7</td><td>&nbsp;</td></tr>
<tr><td>Total</td><td>&nbsp;</td></tr>
</table>
</td>
<td style="vertical-align: top; width: 76%;">
<span class="blackBoldText" style="display: block; padding: 7px 4px 4px 4px;">TX for Erectile Dysfunction (that apply):</span>
<table style="width: 100%;" align="center" border="0" cellpadding="0" cellspacing="0" >
                <tr> 
                  <td class="FormInsideTableTopLeftCell">&nbsp;</td>
                  <td align="center" class="FormInsideTableTopCell">Start Date</td>
                  <td align="center" class="FormInsideTableTopCell">Stop Date</td>
                </tr>
                <asp:Repeater ID="QolTherapy" runat="server" > 
                  <%--- OnItemDataBound="QolTherapyItemDataBound" ---%>
                  <ItemTemplate> 
                    <tr id="QolTherapyRow" runat="server">
                      <td height="26" class="FormInsideTableLeftCell">&nbsp; <%# DataBinder.Eval(Container.DataItem, "QOL_Therapy")%></td>
                      <td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "QOL_TxDateText")%></td>
                      <td class="FormInnerRowBottomBorder" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "QOL_TxStopDateText")%></td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">&nbsp; Oral Agents&nbsp;(ex: Viagra)</td>
                  <td class="FormInsideTableRegCell">&nbsp;<img src="../../Images/shim.gif" width="60" height="1"></td>
                  <td class="FormInnerRowBottomBorder">&nbsp;<img src="../../Images/shim.gif" width="60" height="1"></td>
                </tr>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">&nbsp; Topical Agents</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="26" class="FormInsideTableLeftCell">&nbsp; Vacuum Erection Device</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="27" class="FormInsideTableLeftCell">&nbsp; Intracorp. Injection</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="27" class="FormInsideTableLeftCell">&nbsp; MUSE</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="27" class="FormInsideTableLeftCell">&nbsp; Penile Prosthesis</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
              </table>
</td></tr></table>
</td></tr>
    <tr > 
      <td height="44" valign="bottom" class="FormOuterTableRow">&nbsp; <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes"> 
        <span class="blackBoldText"> PFSH and ROS performed by:  _____________________________<img src="../../Images/shim.gif" border="0" width="40" height="1" />Date: ___/____/____ <span class="blackBoldText" style="white-space:nowrap;"><img src="../../Images/shim.gif" border="0" width="15" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></span></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU47<img src="../../Images/shim.gif" border="0" width="45" height="1">U54<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/17/2014<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:02/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">2</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>
<div align="left" style="page-break-after:always;">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN%></div>
		<div  class="VerticalBarCodeDocType">*U54*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType%></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate%></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
              Urology Prostate Active Surveillance</span></td>
            <td width="50%" align="center" valign="bottom"> <table  width="340" border="0" cellspacing="1" cellpadding="0" >
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
                  <td colspan="1" align="left"><strong><% =patientLastName  %><% = ((patientLastName.Length > 0 && patientFirstName.Length > 0) ? ", " : "")%><% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
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
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient 
                    Identification</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate%>
        </span></td>
    </tr>
	
	<tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText">Vital Signs</span></td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BP:</td>
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Pulse:</td>
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Temp:</td>
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp:</td>
          </tr>
          <tr> 
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">KPS:</td>
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Height:</td>
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Weight:</td>
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BSA:</td>
          </tr>
        </table></td>
    </tr>
    <%-- 
    <tr> 
      <td class="FormOuterTableRow"> <img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Exam</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician 
        Performing Initial Exam: 
        <input type="checkbox" name="NP2" value="Yes">
        PA / NP&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Fellow2" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending2" value="Yes">
        Attending</span> <table align="center" border="0" width="100%" cellpadding="1" cellspacing="0" >
          <tr> 
            <td align="center" class="FormInsideTableTopCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal 
              Findings</strong><strong></strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td align="center" class="FormInsideTableTopCell"><strong>Attnd<br/>
              Performed</strong></td>
            <td width="50%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Gen</td>
            <td height="20" align="left" class="FormInsideTableRegCell">Vital Signs Verified</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Abdomen&nbsp;</td>
            <td height="20" align="left" class="FormInsideTableRegCell">Well Healed Incision</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell"> No Masses or Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell"> No Palpable Hernia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">G/U</td>
            <td height="20" align="left" class="FormInsideTableRegCell">Testes w/o Tenderness 
              or Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell"> No Palpable Penile 
              Plaque or Fibrosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell">Empty Prostatic Fossa</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell">No Rectal Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="5" align="left" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">CV</td>
            <td height="20" align="left" class="FormInsideTableRegCell"> No Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" align="left" class="FormInsideTableRegCell">No Calf Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInnerRowRightBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">Other&nbsp;</td>
            <td height="20" align="left" class="FormInnerRowRightBorder">&nbsp;</td>
            <td align="center" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center">&nbsp;</td>
          </tr>
        </table></td>
    </tr>--%>
    
    <tr> 
      <td class="FormOuterTableRow">
<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="11%" valign="top"><span class="blackBoldText">Exam</span></td>
            <td colspan="5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="30%"><span class="smallGrayText"><strong>Clinician 
                    Performing Initial Exam:</strong></span></td>
                  <td width="12%"><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle"> 
                    <strong>NP / PA</strong></span></td>
                  <td><span class="smallGrayText">Attending must repeat and document 
                    findings.&nbsp;</span></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle"> 
                    <strong>Fellow</strong></span></td>
                  <td><span class="smallGrayText">Attending must repeat and document 
                    <span style="font-weight: bold; text-decoration: underline;">critical</span> findings.</span></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle"> 
                    <strong>Attending</strong></span> </td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr > 
            <td align="center" class="FormInsideTableTopCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal 
              Findings</strong><strong></strong></td>
            <td width="6%" align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td width="6%" align="center" class="FormInsideTableTopCell"><strong>Attnd<br/>
              Performed</strong></td>
            <td width="41%" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Gen</td>
            <td width="30%" align="left" class="FormInnerRowBottomBorder">Well Developed/Well Nourished</td>
            <td width="6%" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td width="240" rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">No Acute Distress</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Alert &amp; Oriented</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Eyes&nbsp;</td>
            <td align="left" class="FormInnerRowBottomBorder">No Scleral Icterus</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">ENT&nbsp;</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Mucositis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Mucous Membrane 
              Moist</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Thrush</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Nodes</td>
            <td align="left" class="FormInnerRowBottomBorder"> Supraclavicular</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> Axillary</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp.</td>
            <td align="left" class="FormInnerRowBottomBorder">Clear to Percussion<br/>
              and Auscultation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">C/V</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Edema</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Regular Rate &amp; 
              Rhythm</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Murmurs</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Abdomen</td>
            <td align="left" class="FormInnerRowBottomBorder">Soft Non-tender</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="5" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> Normal Bowel Sounds</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Hepatosplenomegaly</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">No Ascites</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">No Hernia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Back</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Spinal Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No CVA Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">GU<br/> 
              <img src="../../Images/shim.gif" border="0" width="4" height="0">Male</td>
            <td align="left" class="FormInnerRowBottomBorder">Testes w/o Tenderness 
              or Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="5" align="left" valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">No Palpable Penile Plaque or Fibrosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr>
            <td align="left" class="FormInnerRowBottomBorder">Normal Scrotum/Testis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Normal Phallus/Urethra </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Digital Rectal Exam</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">M/S</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Clubbing or Cyanosis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="4" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Cord</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Calf Tenderness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Leg Swelling</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Neuro</td>
            <td align="left" class="FormInnerRowBottomBorder"> Normal Motor Function</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> Normal Sensation</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder">Cran Nerve II-XII 
              Intact</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Skin</td>
            <td align="left" class="FormInnerRowBottomBorder"> No Rash or Ulcers</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="2" align="center" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInnerRowBottomBorder"> No Nodules</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td height="16" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Other<br/></td>
            <td colspan="5" align="left">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr><td class="FormOuterTableRow">

    <style type="text/css">
    table.DREHistoryTable
    {
        border-spacing: 0;
        table-layout: fixed;
    }
                table.DREHistoryTable td:first-child { width: 15%; }
                table.DREHistoryTable td:nth-child(2) { width: 25%; }
                table.DREHistoryTable td:nth-child(3) { width: 60%; }
    </style>

    <span class="blackBoldText">Rectal Exam</span>
        <table class="PaperFormDataTable DREHistoryTable" cellspacing="0" id="DREHistoryTable" >
        <tr>
        <td style="width: 15%;" >Date</td>
        <td style="width: 25%;" >2002 Clinical Stage</td>
        <td style="width: 60%;">Findings</td>
        </tr>
        </table>
    </td></tr>
    <asp:Repeater ID="DREHistory" runat="server" OnItemDataBound="DREHistoryItemDataBound">
    <ItemTemplate>
    <tr><td class="FormOuterTableRow">
        <table class="PaperFormDataTable DREHistoryTable" cellspacing="0" >
        <tr > 
        <td style="width: 15%;" ><%# DataBinder.Eval(Container.DataItem, "EncDateText")%>&nbsp;</td>
        <td style="width: 25%;" ><asp:Literal ID="ClinicalStageVals" runat="server" />&nbsp;</td>
        <td style="width: 60%; padding: 0px;" >
        
                <asp:Repeater ID="DREFindings" runat="server">
                <%---  ---%>
                <HeaderTemplate>
                    <table class="PaperFormDataTable" cellspacing="0" style=" table-layout: fixed;" >
                    <tr>
                    <th style="width: 20%;" >Side</th>
                    <th style="width: 20%;" >Laterality</th>
                    <th style="width: 20%;" >Level</th>
                    <th style="width: 20%;" >Result</th>
                    <th style="width: 20%;" >ECE</th>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate> 
                    <tr > 
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindSide")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindLaterality")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindLevel")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindResult")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindExtension")%>&nbsp;</td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate></table></FooterTemplate>
                </asp:Repeater>
        </td>
        </tr>
        </table>
        </td></tr>
    </ItemTemplate>
    </asp:Repeater>
    <tr><td class="FormOuterTableRow">
        <table class="PaperFormDataTable DREHistoryTable" cellspacing="0" >
        <tr>
        <td style="width: 15%; text-align: center; vertical-align: top; padding: 20px;" >/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</td>
        <td style="width: 25%; text-align: center; vertical-align: top; padding: 20px;" ><strong>T____</strong>
				  	  <strong style="margin-left: 10px;">N____</strong>
					  <strong style="margin-left: 10px;">M____</strong></td>
        <td style="width: 60%; padding: 0 0; border: none;">
        
            <table width="100%" border="0" cellspacing="0" cellpadding="4">
                <tr > 
                  <td style="width: 60%; border: none;"> <table width="210" border="0" cellspacing="0" cellpadding="0">
                      <tr align="center"> 
                        <td class="FormInsideTableTopLeftCell" style="font-size: smaller;">Side</td>
                        <td class="FormInsideTableTopCell" style="font-size: smaller;">Level</td>
                        <td class="FormInsideTableTopCell" style="font-size: smaller;">Cancer<br />(1-5)</td>
                        <td class="FormInsideTableTopCell" style="font-size: smaller;">ECE<br />(1-5)</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Left</td>
                        <td align="center" class="FormInsideTableRegCell">SV</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Left</td>
                        <td align="center" class="FormInsideTableRegCell">B</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Left</td>
                        <td align="center" class="FormInsideTableRegCell">M</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Left</td>
                        <td align="center" class="FormInsideTableRegCell">A</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Right</td>
                        <td align="center" class="FormInsideTableRegCell">SV</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Right</td>
                        <td align="center" class="FormInsideTableRegCell">B</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Right</td>
                        <td align="center" class="FormInsideTableRegCell">M</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td align="center" class="FormInsideTableLeftCell">Right</td>
                        <td align="center" class="FormInsideTableRegCell">A</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                        <td class="FormInsideTableRegCell">&nbsp;</td>
                      </tr>
                    </table></td>
                    <td style="border: none;"><img src="../../Images/ProstateImageURONVWeb.gif" width="251" height="125"></td>
                </tr>
                <tr > 
                  <td style="border: none; text-align: left; padding: 4px 20px;" colspan="2" ><!--<strong>CODES</strong><br />--><span class="smallGrayText" style="font-size: smaller;">
                  <span style="width: 60px;">Cancer:</span>1. Definitely No Ca&nbsp;&nbsp;&nbsp;&nbsp;2. Probably No Ca&nbsp;&nbsp;&nbsp;&nbsp;3. Possible Ca<br />
                  <span style="width: 60px;">&nbsp;</span>4. Probably Ca&nbsp;&nbsp;&nbsp;&nbsp;5. 
                    Definitely Ca<br/>
                    <span style="width: 60px;">ECE:</span>1. Definitely No ECE&nbsp;&nbsp;&nbsp;&nbsp;2. Probably No ECE&nbsp;&nbsp;&nbsp;&nbsp;3. Possible ECE<br />
                    <span style="width: 60px;">&nbsp;</span>4. Probably ECE&nbsp;&nbsp;&nbsp;&nbsp;5. Definitely ECE</span></td>
                </tr>
              </table>
        </td>
        </tr>
    </table>
    </td></tr>

    <tr> 
      <td class="FormOuterTableRow" style="padding: 12px 4px 4px 4px;">
              <span class="blackBoldText" style="display: inline-block; width: 120px;">Disease State</span><input type="checkbox" name="NED2">
              Stable<img src="../../Images/shim.gif" border="0" width="20" height="1">
              <input type="checkbox" name="DiseaseProgression">
              Disease Progression<img src="../../Images/shim.gif" border="0" width="20" height="1"> 
              <input type="checkbox" name="Mets">
              Mets<img src="../../Images/shim.gif" border="0" width="20" height="1">Date: __________________
        <asp:Label ID="LastStatus" Runat="server" Visible="false" style="display: block; padding: 10px 0 0 120px;" />
        </td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU47<img src="../../Images/shim.gif" border="0" width="45" height="1">U54<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/17/2014<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:02/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">3</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>


<div align="left" style="page-break-after:always;"  > <%-- id="LastPageInForm" runat="server" align="left"  --%>

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN%></div>
		<div  class="VerticalBarCodeDocType">*U54*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType%></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate%></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableTopRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br/>
              Urology Prostate Active Surveillance</span></td>
            <td width="50%" align="center" valign="bottom"> <table  width="340" border="0" cellspacing="1" cellpadding="0" >
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
                  <td colspan="1" align="left"><strong><% =patientLastName  %><% = ((patientLastName.Length > 0 && patientFirstName.Length > 0) ? ", " : "")%><% =patientFirstName  %> <% =patientMiddleName  %></strong></td>
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
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient 
                    Identification</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate%>
        </span></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr>
            <td colspan="3" class="blackBoldText">Impression &amp; Plan </td>
          </tr>
          <tr>
            <td align="center" class="FormInsideTableTopCell"><strong>Diagnoses/Problem List</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Plan 
              &amp; Referrals</strong></td>
          </tr>
          <tr>
            <td width="50%" height="84" valign="top" class="FormInsideTableRegCell">1.</td>
            <td width="28%" class="FormInsideTableRegCell">&nbsp;</td>
            <td valign="top" class="FormInnerRowBottomBorder"><input type="checkbox" name="GNRH22" value="Yes" />
              Sexual Med Consult<br />
              <input type="checkbox" name="GNRH23" value="Yes" />
              Rad Tx Consult<br />
              <input type="checkbox" name="GNRH24" value="Yes" />
              Med Oncology Consult<br />
              <input type="checkbox" name="surgicalConsult" value="Yes" />
              Surgical Consult</td>
          </tr>
          <tr>
            <td height="84" valign="top" class="FormInsideTableRegCell">2.</td>
            <td colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
          <tr>
            <td height="84" valign="top" class="FormInsideTableRegCell">3.</td>
            <td colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
            </tr>
          <tr>
            <td height="84" valign="top" class="FormInsideTableRegCell">4.</td>
            <td colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <!--<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">4.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">5.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">6.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
 					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">7.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">8.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">9.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">10.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr> -->
      </table></td>
      </tr>
	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="TreatmentRisksDiscussed" style="vertical-align: middle;" /> Risks, benefits, and rationale of treatment plan discussed in detail. All questions answered.
		</td>
	</tr>
	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="informedConsent" style="vertical-align: middle;" /> The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.		</td>
	</tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth" align="center" border="0" cellpadding="4" cellspacing="0">
          <tr>
            <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText">Disposition</span></td>
          </tr>
          <tr>
            <td width="69%" align="center" class="FormInnerRowRightBorder"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="20%" height="26">Prescriptions:</td>
                  <td width="20%" align="left">No<img src="../../Images/shim.gif" border="0" width="22" height="1" />Yes:</td>
                  <td>Refill &nbsp;&nbsp;or &nbsp;&nbsp;New</td>
                </tr>
                <tr>
                  <td height="26" colspan="3">Rx: __________________________________________________________</td>
                </tr>
                <tr>
                  <td height="26" colspan="3">Rx: __________________________________________________________</td>
                </tr>
            </table></td>
            <td width="31%" align="center"><span>Protocol #: ________</span> <br />
                <table align="left" width="100%">
                  <tr>
                    <td>Considered:</td>
                    <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
                  </tr>
                  <tr>
                    <td>Consent Obtained:</td>
                    <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
                  </tr>
                  <tr>
                    <td>Registered:</td>
                    <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
                  </tr>
                </table>
              <br />
                <br /></td>
          </tr>
      </table></td>
      </tr>
    <tr>
      <td valign="top" class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" valign="top" class="FormInnerRowRightBorder"> <input type="checkbox" name="50% of Time22"> 
              &#8805; 50% of attending time was spent in counseling <br/> <img src="../../Images/shim.gif" border="0" width="1" height="15"> 
              If so, mark total attending time in minutes &amp; describe on right:<br/> 
              <img src="../../Images/shim.gif" border="0" width="30" height="12"> 
              <input type="checkbox" name="15-24 (3)22">
              15-24 (3)&nbsp;&nbsp;&nbsp; 
              <input type="checkbox" name="25-39 (4)22">
              25-39 (4)&nbsp;&nbsp;&nbsp; 
              <input type="checkbox" name="40+ (5)22">
              40+ (5)</td>
            <td width="50%" height="100" valign="top"><img src="../../Images/shim.gif" border="0" width="1" height="11">Describe 
              Counseling or Dictate Note:<br/> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="26" align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td height="26" align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td height="26" align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td height="26" align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" class="FormInnerRowBottomBorder" style="line-height:20px;">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" height="32" class="FormInnerRowRightBorder">Circle 
              Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1">1<img src="../../Images/shim.gif" border="0" width="22" height="1">2<img src="../../Images/shim.gif" border="0" width="22" height="1">3<img src="../../Images/shim.gif" border="0" width="22" height="1">4<img src="../../Images/shim.gif" border="0" width="22" height="1">5            </td>
            <td rowspan="2" align="right" valign="top">Copy to:</td>
            <td width="43%" rowspan="2" valign="top"><input name="fellow222" type="checkbox" id="fellow223" />
referring M.D.: ________________________<br />
<input name="fellow2222" type="checkbox" id="fellow2222" />
other: _______________________________</td>
          </tr>
          <tr> 
            <td height="32" class="FormInnerRowRightBorder">Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1">Fellow/ 
              Resident<img src="../../Images/shim.gif" border="0" width="30" height="1">Attending</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td colspan="2"><span class="blackBoldText">Signatures</span></td>
            <td>&nbsp;</td>
            <td class="blackBoldText">&nbsp;</td>
          </tr>
          <tr>
            <td align="right"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Fellow: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr>
            <td align="right"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />NP/PA: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText" style="white-space:nowrap;">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr class="pageWidth">
            <td height="40" align="right" valign="bottom" style="padding-bottom: 0px; padding-top: 13px;"><span class="blackBoldText">Attending&nbsp;<br />
              Addendum:</span></td>
            <td colspan="3"  class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
          </tr>
          <tr class="pageWidth">
            <td>&nbsp;</td>
            <td colspan="3"  class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4"><table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr>
				  <td style="vertical-align: top;padding-top: 6px;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
                  <td style="vertical-align: top;">I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.</td>
                </tr>
                <tr>
                  <td colspan="2" style="padding-top: 20px; text-align: center;"><span class="blackBoldText"> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
      </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU47<img src="../../Images/shim.gif" border="0" width="45" height="1">U54<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/17/2014<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:02/03/15<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">4</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>

</div>

<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder id="QOLReportHolder" runat="server"></asp:PlaceHolder>
