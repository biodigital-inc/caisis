<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryDiagnosticsLabTests" CodeFile="LiverSurgeryDiagnosticsLabTests.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.OtherLabTestsHtmlTable = "OtherLabTestsHtmlTable";
	
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

<a name="LiverSurgeryDiagnosticsLabTests" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Lab Tests"></asp:Label><br/>
<table width="250" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OtherLabTestsHtmlTable">
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
			    <euc:EformTextBox  style="width:80px;"  RecordId="1"  ID="LabDateText_1" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="1"  ID="LabDate_1"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
       <%--<td style="text-align: center;" class="ClinicalEformGridColumnOne"> 
                <euc:CaisisCheckBox Runat="server" ID="TodaysDate_1" /></td>--%>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_1" Value="Platelets" RecordId="1" /> Platelets </td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="1"  ID="LabResult_1"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="1"  ID="LabUnits_1"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="1"  ID="LabNotes_1"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  	<tr> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="2"  ID="LabDateText_2" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="2"  ID="LabDate_2"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
       <%--<td style="text-align: center;" class="ClinicalEformGridColumnOne"> 
                <euc:CaisisCheckBox Runat="server" ID="TodaysDate_2" /></td>--%>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_2" Value="AFP" RecordId="2" /> AFP</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="2"  ID="LabResult_2"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="2"  ID="LabUnits_2"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="2"  ID="LabNotes_2"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  	<tr> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="3"  ID="LabDateText_3" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="3"  ID="LabDate_3"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <%--<td style="text-align: center;" class="ClinicalEformGridColumnOne"> 
                <euc:CaisisCheckBox Runat="server" ID="TodaysDate_3" /></td>--%>
       <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_3" Value="CEA" RecordId="3" /> CEA</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="3"  ID="LabResult_3"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="3"  ID="LabUnits_3"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="3"  ID="LabNotes_3"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  	<tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="4"  ID="LabDateText_4" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="4"  ID="LabDate_4"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <%--<td style="text-align: center;" class="ClinicalEformGridColumnOne"> 
                <euc:CaisisCheckBox Runat="server" ID="TodaysDate_4" /></td>--%>        
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_4" Value="CA 19-9" RecordId="4" /> CA 19-9</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="4"  ID="LabResult_4"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="4"  ID="LabUnits_4"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="4"  ID="LabNotes_4"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  	<tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="5"  ID="LabDateText_5" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="5"  ID="LabDate_5"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <%--<td style="text-align: center;" class="ClinicalEformGridColumnOne"> 
                <euc:CaisisCheckBox Runat="server" ID="TodaysDate_5" /></td>--%>        
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_5" Value="Hepatitis B viral load" RecordId="5" /> Hepatitis B viral load</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="5"  ID="LabResult_5"   TABLE="LabTests" FIELD="LabResult"   Runat="server"  /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="5"  ID="LabUnits_5"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="5"  ID="LabNotes_5"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
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
			    <euc:EformTextBox  style="width:80px;"  RecordId="20"  ID="LabDateText_20" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="20"  ID="LabDate_20"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
          <%--<td style="text-align: center;" class="ClinicalEformGridColumnOne"> 
                <euc:CaisisCheckBox Runat="server" ID="TodaysDate_20" /></td>--%>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="20"  ID="LabTest_20"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="20"  ID="LabResult_20"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="20"  ID="LabUnits_20"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="20"  ID="LabNotes_20"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="21"  ID="LabDateText_21" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="21"  ID="LabDate_21"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
          <%--<td style="text-align: center;" class="ClinicalEformGridColumnOne"> 
                <euc:CaisisCheckBox Runat="server" ID="TodaysDate_21" /></td>--%>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="21"  ID="LabTest_21"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="21"  ID="LabResult_21"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="21"  ID="LabUnits_21"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
         <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="21"  ID="LabNotes_21"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
       <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="22"  ID="LabDateText_22" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="22"  ID="LabDate_22"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="22"  ID="LabTest_22"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="22"  ID="LabResult_22"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="22"  ID="LabUnits_22"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="22"  ID="LabNotes_22"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="35"  ID="LabDateText_35" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="35"  ID="LabDate_35"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="35"  ID="LabTest_35"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="35"  ID="LabResult_35"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="35"  ID="LabUnits_35"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="35"  ID="LabNotes_35"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon6"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="36"  ID="LabDateText_36" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="36"  ID="LabDate_36"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="36"  ID="LabTest_36"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="36"  ID="LabResult_36"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="36"  ID="LabUnits_36"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="36"  ID="LabNotes_36"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon7"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="37"  ID="LabDateText_37" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="37"  ID="LabDate_37"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="37"  ID="LabTest_37"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="37"  ID="LabResult_37"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="37"  ID="LabUnits_37"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="37"  ID="LabNotes_37"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon1"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="38"  ID="LabDateText_38" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="38"  ID="LabDate_38"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="38"  ID="LabTest_38"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="38"  ID="LabResult_38"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="38"  ID="LabUnits_38"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="38"  ID="LabNotes_38"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon2"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="39"  ID="LabDateText_39" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="39"  ID="LabDate_39"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="39"  ID="LabTest_39"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="39"  ID="LabResult_39"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="39"  ID="LabUnits_39"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="39"  ID="LabNotes_39"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon3"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="40"  ID="LabDateText_40" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="40"  ID="LabDate_40"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="40"  ID="LabTest_40"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="40"  ID="LabResult_40"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="40"  ID="LabUnits_40"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="40"  ID="LabNotes_40"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon4"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="41"  ID="LabDateText_41" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="41"  ID="LabDate_41"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="200px" style="width:80px;"  RecordId="41"  ID="LabTest_41"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,Liver" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="41"  ID="LabResult_41"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformSelect   style="width:80px;"  RecordId="41"  ID="LabUnits_41"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width:80px;"  RecordId="41"  ID="LabNotes_41"    TABLE="LabTests" Field="LabNotes"    Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon5"  runat="server" /></td>
  </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OtherLabTestsHtmlTable');" />
<br/><br/><br />

<script type="text/javascript">

    addAbsentEvent($('<%= LabDateText_1.ClientID %>'), $('<%= LabDate_1.ClientID %>'), $('<%= LabTest_1.ClientID %>'), $('<%= LabResult_1.ClientID %>'), $('<%= LabUnits_1.ClientID %>'), $('<%= LabNotes_1.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_2.ClientID %>'), $('<%= LabDate_2.ClientID %>'), $('<%= LabTest_2.ClientID %>'), $('<%= LabResult_2.ClientID %>'), $('<%= LabUnits_2.ClientID %>'), $('<%= LabNotes_2.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_3.ClientID %>'), $('<%= LabDate_3.ClientID %>'), $('<%= LabTest_3.ClientID %>'), $('<%= LabResult_3.ClientID %>'), $('<%= LabUnits_3.ClientID %>'), $('<%= LabNotes_3.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_4.ClientID %>'), $('<%= LabDate_4.ClientID %>'), $('<%= LabTest_4.ClientID %>'), $('<%= LabResult_4.ClientID %>'), $('<%= LabUnits_4.ClientID %>'), $('<%= LabNotes_4.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_5.ClientID %>'), $('<%= LabDate_5.ClientID %>'), $('<%= LabTest_5.ClientID %>'), $('<%= LabResult_5.ClientID %>'), $('<%= LabUnits_5.ClientID %>'), $('<%= LabNotes_5.ClientID %>'));

    addAbsentEvent($('<%= LabDateText_20.ClientID %>'), $('<%= LabDate_20.ClientID %>'), $('<%= LabTest_20.ClientID %>'), $('<%= LabResult_20.ClientID %>'), $('<%= LabUnits_20.ClientID %>'), $('<%= LabNotes_20.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_21.ClientID %>'), $('<%= LabDate_21.ClientID %>'), $('<%= LabTest_21.ClientID %>'), $('<%= LabResult_21.ClientID %>'), $('<%= LabUnits_21.ClientID %>'), $('<%= LabNotes_21.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_22.ClientID %>'), $('<%= LabDate_22.ClientID %>'), $('<%= LabTest_22.ClientID %>'), $('<%= LabResult_22.ClientID %>'), $('<%= LabUnits_22.ClientID %>'), $('<%= LabNotes_22.ClientID %>'));

    addAbsentEvent($('<%= LabDateText_35.ClientID %>'), $('<%= LabDate_35.ClientID %>'), $('<%= LabTest_35.ClientID %>'), $('<%= LabResult_35.ClientID %>'), $('<%= LabUnits_35.ClientID %>'), $('<%= LabNotes_35.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_36.ClientID %>'), $('<%= LabDate_36.ClientID %>'), $('<%= LabTest_36.ClientID %>'), $('<%= LabResult_36.ClientID %>'), $('<%= LabUnits_36.ClientID %>'), $('<%= LabNotes_36.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_37.ClientID %>'), $('<%= LabDate_37.ClientID %>'), $('<%= LabTest_37.ClientID %>'), $('<%= LabResult_37.ClientID %>'), $('<%= LabUnits_37.ClientID %>'), $('<%= LabNotes_37.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_38.ClientID %>'), $('<%= LabDate_38.ClientID %>'), $('<%= LabTest_38.ClientID %>'), $('<%= LabResult_38.ClientID %>'), $('<%= LabUnits_38.ClientID %>'), $('<%= LabNotes_38.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_39.ClientID %>'), $('<%= LabDate_39.ClientID %>'), $('<%= LabTest_39.ClientID %>'), $('<%= LabResult_39.ClientID %>'), $('<%= LabUnits_39.ClientID %>'), $('<%= LabNotes_39.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_40.ClientID %>'), $('<%= LabDate_40.ClientID %>'), $('<%= LabTest_40.ClientID %>'), $('<%= LabResult_40.ClientID %>'), $('<%= LabUnits_40.ClientID %>'), $('<%= LabNotes_40.ClientID %>'));
    addAbsentEvent($('<%= LabDateText_41.ClientID %>'), $('<%= LabDate_41.ClientID %>'), $('<%= LabTest_41.ClientID %>'), $('<%= LabResult_41.ClientID %>'), $('<%= LabUnits_41.ClientID %>'), $('<%= LabNotes_41.ClientID %>'));

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