<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryDiagnosticsLabTestsPostOp" CodeFile="LiverSurgeryDiagnosticsLabTestsPostOp.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.DiagnosticsLabTestsPostOp_LiverHtmlTable = "DiagnosticsLabTestsPostOp_LiverHtmlTable";
	
		function SetDate(cbox, dateTextFieldId, date, cbox2)
    {
	    if (cbox.checked == true)
	    {
		    document.getElementById(dateTextFieldId).value = date;
	    }
	    else
	    {
		    document.getElementById(dateTextFieldId).value = '';
		    cbox2.checked = false;
	    }
	    document.getElementById(cbox2).checked = cbox.checked;
	    document.getElementById(dateTextFieldId).focus();
	    document.getElementById(dateTextFieldId).blur();
    	
    }
    
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="LiverSurgeryDiagnosticsLabTestsPostOp" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Post-op Lab Tests"></asp:Label><br/>
<table width="250" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsLabTestsPostOp_LiverHtmlTable">
	<tr> 
		<td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
        <%--<td width="10%" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" >Check if New Today</td>--%>
		<td class="controlBoxDataGridHeaderFirstCol">Test</td>
		<td class="controlBoxDataGridHeaderFirstCol">Result</td>
		<td class="controlBoxDataGridHeaderFirstCol">Units</td>
		<td class="controlBoxDataGridHeaderFirstCol">Notes</td>
		<td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	</tr>
	<asp:Repeater ID="LabTestsHx" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	    <HeaderTemplate>
		    <tr  ><td align="center" colspan="6"><i> <asp:Literal ID="MostRecentMsg" Runat="server" Visible="false" Text="most recent 10" /></i></td></tr>	    
	    </HeaderTemplate>	    
		<ItemTemplate> 
			<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabNotes', 'BiochemicalMarkers');"> 
				<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabUnits") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabNotes") %>&nbsp;</td>
				<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="OtherLockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
			</tr>      
		</ItemTemplate>
	</asp:Repeater>
	
	
  
	<tr> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="23"  ID="LabDateText_23" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="23"  ID="LabDate_23"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
       <%--<td style="text-align: center;" class="ClinicalEformGridColumnOne"> 
                <euc:CaisisCheckBox Runat="server" ID="TodaysDate_23" /></td>--%>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_23" Value="Peak INR" RecordId="23" /> Peak INR </td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="23"  ID="LabResult_23"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="23"  ID="LabUnits_23"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="23"  ID="LabNotes_23"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  	<tr> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="24"  ID="LabDateText_24" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="24"  ID="LabDate_24"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
       <%--<td style="text-align: center;" class="ClinicalEformGridColumnOne"> 
                <euc:CaisisCheckBox Runat="server" ID="TodaysDate_24" /></td>--%>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_24" Value="Peak Total Bilirubin" RecordId="24" /> Peak Total Bilirubin</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="24"  ID="LabResult_24"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="24"  ID="LabUnits_24"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="24"  ID="LabNotes_24"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
   <tr> 
		<td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Other</td>
        <%--<td width="10%" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" ></td>--%>
		<td width="23%" class="controlBoxDataGridHeaderFirstCol"></td>
		<td width="20%" class="controlBoxDataGridHeaderFirstCol"></td>
		<td width="8%" class="controlBoxDataGridHeaderFirstCol"></td>
		<td width="15%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	</tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="25"  ID="LabDateText_25" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="25"  ID="LabDate_25"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
          <%--<td style="text-align: center;" class="ClinicalEformGridColumnOne"> 
                <euc:CaisisCheckBox Runat="server" ID="TodaysDate_25" /></td>--%>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="25"  ID="LabTest_25"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,@DiseaseView" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="25"  ID="LabResult_25"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="25"  ID="LabUnits_25"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="25"  ID="LabNotes_25"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="26"  ID="LabDateText_26" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="26"  ID="LabDate_26"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
          <%--<td style="text-align: center;" class="ClinicalEformGridColumnOne"> 
                <euc:CaisisCheckBox Runat="server" ID="TodaysDate_26" /></td>--%>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="26"  ID="LabTest_26"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,@DiseaseView" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="26"  ID="LabResult_26"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="26"  ID="LabUnits_26"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="26"  ID="LabNotes_26"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="27"  ID="LabDateText_27" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="27"  ID="LabDate_27"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
          <%--<td style="text-align: center;" class="ClinicalEformGridColumnOne"> 
                <euc:CaisisCheckBox Runat="server" ID="TodaysDate_27" /></td>--%>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="27"  ID="LabTest_27"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,@DiseaseView" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="27"  ID="LabResult_27"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="27"  ID="LabUnits_27"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="27"  ID="LabNotes_27"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="28"  ID="LabDateText_28" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="28"  ID="LabDate_28"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="28"  ID="LabTest_28"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="28"  ID="LabResult_28"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="28"  ID="LabUnits_28"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="28"  ID="LabNotes_28"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon28"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="29"  ID="LabDateText_29" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="29"  ID="LabDate_29"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="29"  ID="LabTest_29"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="29"  ID="LabResult_29"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="29"  ID="LabUnits_29"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="29"  ID="LabNotes_29"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon6"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="30"  ID="LabDateText_30" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="30"  ID="LabDate_30"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="30"  ID="LabTest_30"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="30"  ID="LabResult_30"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="30"  ID="LabUnits_30"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="30"  ID="LabNotes_30"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon1"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="31"  ID="LabDateText_31" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="31"  ID="LabDate_31"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="31"  ID="LabTest_31"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="31"  ID="LabResult_31"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="31"  ID="LabUnits_31"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="31"  ID="LabNotes_31"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon2"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="32"  ID="LabDateText_32" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="32"  ID="LabDate_32"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="32"  ID="LabTest_32"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="32"  ID="LabResult_32"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="32"  ID="LabUnits_32"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="32"  ID="LabNotes_32"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon3"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="33"  ID="LabDateText_33" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="33"  ID="LabDate_33"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="33"  ID="LabTest_33"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="33"  ID="LabResult_33"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="33"  ID="LabUnits_33"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="33"  ID="LabNotes_33"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon4"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="34"  ID="LabDateText_34" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="34"  ID="LabDate_34"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="34"  ID="LabTest_34"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="34"  ID="LabResult_34"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="34"  ID="LabUnits_34"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="34"  ID="LabNotes_34"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon5"  runat="server" /></td>
  </tr></table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DiagnosticsLabTestsPostOp_LiverHtmlTable');" />
<br/><br/><br />


<script type="text/javascript">

    addAbsentEvent($('<%= LabDateText_23.ClientID %>'), $('<%= LabDate_23.ClientID %>'), $('<%= LabTest_23.ClientID %>'), $('<%= LabResult_23.ClientID %>'), $('<%= LabUnits_23.ClientID %>'), $('<%= LabNotes_23.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_24.ClientID %>'), $('<%= LabDate_24.ClientID %>'), $('<%= LabTest_24.ClientID %>'), $('<%= LabResult_24.ClientID %>'), $('<%= LabUnits_24.ClientID %>'), $('<%= LabNotes_24.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_25.ClientID %>'), $('<%= LabDate_25.ClientID %>'), $('<%= LabTest_25.ClientID %>'), $('<%= LabResult_25.ClientID %>'), $('<%= LabUnits_25.ClientID %>'), $('<%= LabNotes_25.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_26.ClientID %>'), $('<%= LabDate_26.ClientID %>'), $('<%= LabTest_26.ClientID %>'), $('<%= LabResult_26.ClientID %>'), $('<%= LabUnits_26.ClientID %>'), $('<%= LabNotes_26.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_27.ClientID %>'), $('<%= LabDate_27.ClientID %>'), $('<%= LabTest_27.ClientID %>'), $('<%= LabResult_27.ClientID %>'), $('<%= LabUnits_27.ClientID %>'), $('<%= LabNotes_27.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_28.ClientID %>'), $('<%= LabDate_28.ClientID %>'), $('<%= LabTest_28.ClientID %>'), $('<%= LabResult_28.ClientID %>'), $('<%= LabUnits_28.ClientID %>'), $('<%= LabNotes_28.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_29.ClientID %>'), $('<%= LabDate_29.ClientID %>'), $('<%= LabTest_29.ClientID %>'), $('<%= LabResult_29.ClientID %>'), $('<%= LabUnits_29.ClientID %>'), $('<%= LabNotes_29.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_30.ClientID %>'), $('<%= LabDate_30.ClientID %>'), $('<%= LabTest_30.ClientID %>'), $('<%= LabResult_30.ClientID %>'), $('<%= LabUnits_30.ClientID %>'), $('<%= LabNotes_30.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_31.ClientID %>'), $('<%= LabDate_31.ClientID %>'), $('<%= LabTest_31.ClientID %>'), $('<%= LabResult_31.ClientID %>'), $('<%= LabUnits_31.ClientID %>'), $('<%= LabNotes_31.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_32.ClientID %>'), $('<%= LabDate_32.ClientID %>'), $('<%= LabTest_32.ClientID %>'), $('<%= LabResult_32.ClientID %>'), $('<%= LabUnits_32.ClientID %>'), $('<%= LabNotes_32.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_33.ClientID %>'), $('<%= LabDate_33.ClientID %>'), $('<%= LabTest_33.ClientID %>'), $('<%= LabResult_33.ClientID %>'), $('<%= LabUnits_33.ClientID %>'), $('<%= LabNotes_33.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_34.ClientID %>'), $('<%= LabDate_34.ClientID %>'), $('<%= LabTest_34.ClientID %>'), $('<%= LabResult_34.ClientID %>'), $('<%= LabUnits_34.ClientID %>'), $('<%= LabNotes_34.ClientID %>'));

    function addAbsentEvent(labDateText, labDate, labTest, labResult, labUnits, labNotes) {
        
        $(labDateText).addEvent('blur', curry(SetHiddenFields, labDateText, labDate, labTest, labResult, labUnits, labNotes));
        $(labResult).addEvent('blur', curry(SetHiddenFields, labDateText, labDate, labTest, labResult, labUnits, labNotes));
        $(labUnits).addEvent('blur', curry(SetHiddenFields, labDateText, labDate, labTest, labResult, labUnits, labNotes));
        $(labNotes).addEvent('blur', curry(SetHiddenFields, labDateText, labDate, labTest, labResult, labUnits, labNotes));

    }

    function SetHiddenFields(labDateText, labDate, labTest, labResult, labUnits, labNotes) {
        if (labDateText.value != '' || labResult.value != '' || labUnits.value != '' || labNotes.value != '')
            if (labTest.type == 'checkbox')
                labTest.checked = true;
    }
    
</script>