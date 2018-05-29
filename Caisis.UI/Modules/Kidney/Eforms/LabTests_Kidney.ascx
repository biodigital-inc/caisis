<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.LabTests_Kidney" CodeFile="LabTests_Kidney.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<style type="text/css">
    #LabTestsHtmlTable td
    {
        text-align: center;
    }
    tr.LastNeph td {font-weight: bold; color: #000000; padding: 6px 2px 6px 2px;}
</style>

<!-- example table array populator -->
<script type="text/javascript" language="javascript">
	tableArray.LabTestsHtmlTable = "LabTestsHtmlTable";
</script>
<script type="text/javascript">

var gfr_calcOK = <asp:Literal ID="gfr_calcOK" runat="server" />;
var gfr_k = <asp:Literal ID="gfr_k" runat="server" />;
var gfr_a = <asp:Literal ID="gfr_a" runat="server" />;
var gfr_age = <asp:Literal ID="gfr_age" runat="server" />;
var gfr_genderMod = <asp:Literal ID="gfr_genderMod" runat="server" />;
var gfr_raceMod = <asp:Literal ID="gfr_raceMod" runat="server" />;

function calcGFR(recordNumber)
{
    var labTestContainerTd = $('LabTestTypeTd_' + recordNumber);
    var labTestTextbox = labTestContainerTd.getElementsByTagName('input')[0];
    var LabTestResultContainerTd = $('LabTestResultTd_' + recordNumber);
    var labTestResultTextbox = LabTestResultContainerTd.getElementsByTagName('input')[0];
    var creatControlVal = labTestResultTextbox.value;
    var LabTestGFRTd = $('LabTestGFRTd_' + recordNumber);
    var labNotesTextbox = LabTestGFRTd.getElementsByTagName('input')[0];
     
    
    
    if (labTestTextbox.value.length > 0 && labTestTextbox.value.toUpperCase().indexOf('CREAT') == 0)
    {
        var targetSpan = $('GFR_' + recordNumber);
        var creat = parseInt(creatControlVal);
        if (typeof creat == "number") 
        {
            
            var gfr = '';
            if (gfr_calcOK)
            {
                var gfrCalc = (141) * (Math.pow((Math.min((creat / gfr_k), 1)), gfr_a)) * (Math.pow((Math.max((creat / gfr_k), 1)), -1.209)) * (Math.pow(0.993, gfr_age));
                gfrCalc = gfrCalc * gfr_genderMod * gfr_raceMod;
                
                // round to 2 decimal places
                gfrCalc = Math.round(gfrCalc*1000)/1000;
                
                gfr = gfrCalc.toString();
            
                        // eGFR = 141 * min(SCr/k,1)^a * max(SCr/k,1)^-1.209 * 0.993^Age x [1.018 if female] * [1.159 if black]
            }
            
            targetSpan.innerHTML = gfr;
            if (gfr.length > 0 && gfr.indexOf('N') < 0)
            {
                labNotesTextbox.value = 'GFR: ' + gfr;
            }
            else { labNotesTextbox.value = ''; }
        }
        else { labNotesTextbox.value = ''; }
    }
    else { labNotesTextbox.value = ''; }
}



</script>

<style type="text/css">
.GFRTd
{
    cursor: help;
}
</style>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="LabTests_Kidney" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Lab Tests"></asp:Label><br/>
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestsHtmlTable">
  <tr> 
            <td height="20" align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Date</td>
            <td align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Marker</td>
            <td align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Value</td>
            <td align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Units</td>
            <td align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">GFR</td>
            <td  align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Data Source</td>
            <td align="center"  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  	<asp:Repeater ID="labTests" runat="server" ><ItemTemplate>  
		<tr class="ClinicalEformPopulatedRow<%# (bool)DataBinder.Eval(Container.DataItem, "LastBeforeNeph") == true ? " LastNeph" : "" %>" onMouseOver="this.className='ClinicalEformHighlightedRow<%# (bool)DataBinder.Eval(Container.DataItem, "LastBeforeNeph") == true ? " LastNeph" : "" %>';" onMouseOut="this.className='ClinicalEformPopulatedRow<%# (bool)DataBinder.Eval(Container.DataItem, "LastBeforeNeph") == true ? " LastNeph" : "" %>';" onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'LabDateText,LabDate,LabType,LabResult,LabNotes', 'LabTests');"> 
      <td  width="16%" align="center" class="ClinicalEformPopulatedColumn"> 
        <%# DataBinder.Eval(Container.DataItem, "LabDateText") %></td>
      <td class="ClinicalEformPopulatedColumn" align="center"> 
        <%# DataBinder.Eval(Container.DataItem, "LabTest") %> <%# (bool)DataBinder.Eval(Container.DataItem, "LastBeforeNeph") == true ? "(Pre-Op)" : "" %></td>
      <td class="ClinicalEformPopulatedColumn" align="center"  > 
        <%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
      <td class="ClinicalEformPopulatedColumn" style="vertical-align: middle; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "LabUnits") %>&nbsp;</td>
      <td class="ClinicalEformPopulatedColumn" style="vertical-align: middle; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "GFR") %><span style="font-size: 9px; line-height: 10px; color: #444444; font-weight: bold;"><%# DataBinder.Eval(Container.DataItem, "GFRError") %></span>&nbsp;</td>
      <td class="ClinicalEformPopulatedColumn" align="center"> 
        <%# DataBinder.Eval(Container.DataItem, "LabQuality") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
    </tr>
	</ItemTemplate></asp:Repeater>

    <tr id="LabTestRow_1" onclick="calcGFR(1);" onmouseout="calcGFR(1);" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="1"  ID="LabDateText_1" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="1" Runat="server" ID="LabDate_1" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_1" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="1" Table="LabTests" Runat="server" id="LabTest_1" /></td>
        <td id="LabTestResultTd_1" ><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_1" onchange="calcGFR(1);" /></td>
        <td  ><euc:EformSelect RecordId="1" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_1" /></td>
        <td  id="LabTestGFRTd_1"><span id="GFR_1" style="display: none;"></span><euc:EformTextBox RecordId="1" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_1" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="1" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_1" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_2" onclick="calcGFR(2);" onmouseout="calcGFR(2);" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="2"  ID="LabDateText_2" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="2" Runat="server" ID="LabDate_2" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_2" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="2" Table="LabTests" Runat="server" id="LabTest_2" /></td>
        <td id="LabTestResultTd_2" ><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_2" onchange="calcGFR(2);" /></td>
        <td  ><euc:EformSelect RecordId="2" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_2" /></td>
        <td  id="LabTestGFRTd_2"><span id="GFR_2" style="display: none;"></span><euc:EformTextBox RecordId="2" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_2" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="2" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_2" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_3" onclick="calcGFR(3);" onmouseout="calcGFR(3);" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="3"  ID="LabDateText_3" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="3" Runat="server" ID="LabDate_3" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_3" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="3" Table="LabTests" Runat="server" id="LabTest_3" /></td>
        <td id="LabTestResultTd_3" ><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_3" onchange="calcGFR(3);" /></td>
        <td  ><euc:EformSelect RecordId="3" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_3" /></td>
        <td  id="LabTestGFRTd_3"><span id="GFR_3" style="display: none;"></span><euc:EformTextBox RecordId="3" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_3" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="3" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_3" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_4" onclick="calcGFR(4);" onmouseout="calcGFR(4);" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="4"  ID="LabDateText_4" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="4" Runat="server" ID="LabDate_4" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_4" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="4" Table="LabTests" Runat="server" id="LabTest_4" /></td>
        <td id="LabTestResultTd_4" ><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_4" onchange="calcGFR(4);" /></td>
        <td  ><euc:EformSelect RecordId="4" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_4" /></td>
        <td  id="LabTestGFRTd_4"><span id="GFR_4" style="display: none;"></span><euc:EformTextBox RecordId="4" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_4" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="4" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_4" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_5" onclick="calcGFR(5);" onmouseout="calcGFR(5);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="5"  ID="LabDateText_5" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="5" Runat="server" ID="LabDate_5" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_5" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="5" Table="LabTests" Runat="server" id="LabTest_5" /></td>
        <td id="LabTestResultTd_5" ><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_5" onchange="calcGFR(5);" /></td>
        <td  ><euc:EformSelect RecordId="5" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_5" /></td>
        <td  id="LabTestGFRTd_5"><span id="GFR_5" style="display: none;"></span><euc:EformTextBox RecordId="5" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_5" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="5" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_5" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_6" onclick="calcGFR(6);" onmouseout="calcGFR(6);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="6"  ID="LabDateText_6" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="6" Runat="server" ID="LabDate_6" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_6" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="6" Table="LabTests" Runat="server" id="LabTest_6" /></td>
        <td id="LabTestResultTd_6" ><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_6" onchange="calcGFR(6);" /></td>
        <td  ><euc:EformSelect RecordId="6" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_6" /></td>
        <td  id="LabTestGFRTd_6"><span id="GFR_6" style="display: none;"></span><euc:EformTextBox RecordId="6" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_6" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="6" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_6" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_7" onclick="calcGFR(7);" onmouseout="calcGFR(7);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="7"  ID="LabDateText_7" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="7" Runat="server" ID="LabDate_7" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_7" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="7" Table="LabTests" Runat="server" id="LabTest_7" /></td>
        <td id="LabTestResultTd_7" ><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_7" onchange="calcGFR(7);" /></td>
        <td  ><euc:EformSelect RecordId="7" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_7" /></td>
        <td  id="LabTestGFRTd_7"><span id="GFR_7" style="display: none;"></span><euc:EformTextBox RecordId="7" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_7" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="7" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_7" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_8" onclick="calcGFR(8);" onmouseout="calcGFR(8);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="8"  ID="LabDateText_8" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="8" Runat="server" ID="LabDate_8" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_8" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="8" Table="LabTests" Runat="server" id="LabTest_8" /></td>
        <td id="LabTestResultTd_8" ><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_8" onchange="calcGFR(8);" /></td>
        <td  ><euc:EformSelect RecordId="8" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_8" /></td>
        <td  id="LabTestGFRTd_8"><span id="GFR_8" style="display: none;"></span><euc:EformTextBox RecordId="8" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_8" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="8" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_8" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_9" onclick="calcGFR(9);" onmouseout="calcGFR(9);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="9"  ID="LabDateText_9" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="9" Runat="server" ID="LabDate_9" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_9" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="9" Table="LabTests" Runat="server" id="LabTest_9" /></td>
        <td id="LabTestResultTd_9" ><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_9" onchange="calcGFR(9);" /></td>
        <td  ><euc:EformSelect RecordId="9" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_9" /></td>
        <td  id="LabTestGFRTd_9"><span id="GFR_9" style="display: none;"></span><euc:EformTextBox RecordId="9" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_9" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="9" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_9" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_10" onclick="calcGFR(10);" onmouseout="calcGFR(10);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="10"  ID="LabDateText_10" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="10" Runat="server" ID="LabDate_10" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_10" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="10" Table="LabTests" Runat="server" id="LabTest_10" /></td>
        <td id="LabTestResultTd_10" ><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_10" onchange="calcGFR(10);" /></td>
        <td  ><euc:EformSelect RecordId="10" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_10" /></td>
        <td  id="LabTestGFRTd_10"><span id="GFR_10" style="display: none;"></span><euc:EformTextBox RecordId="10" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_10" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="10" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_10" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_11" onclick="calcGFR(11);" onmouseout="calcGFR(11);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="11"  ID="LabDateText_11" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="11" Runat="server" ID="LabDate_11" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_11" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="11" Table="LabTests" Runat="server" id="LabTest_11" /></td>
        <td id="LabTestResultTd_11" ><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_11" onchange="calcGFR(11);" /></td>
        <td  ><euc:EformSelect RecordId="11" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_11" /></td>
        <td  id="LabTestGFRTd_11"><span id="GFR_11" style="display: none;"></span><euc:EformTextBox RecordId="11" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_11" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="11" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_11" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_12" onclick="calcGFR(12);" onmouseout="calcGFR(12);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="12"  ID="LabDateText_12" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="12" Runat="server" ID="LabDate_12" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_12" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="12" Table="LabTests" Runat="server" id="LabTest_12" /></td>
        <td id="LabTestResultTd_12" ><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_12" onchange="calcGFR(12);" /></td>
        <td  ><euc:EformSelect RecordId="12" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_12" /></td>
        <td  id="LabTestGFRTd_12"><span id="GFR_12" style="display: none;"></span><euc:EformTextBox RecordId="12" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_12" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="12" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_12" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_13" onclick="calcGFR(13);" onmouseout="calcGFR(13);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="13"  ID="LabDateText_13" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="13" Runat="server" ID="LabDate_13" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_13" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="13" Table="LabTests" Runat="server" id="LabTest_13" /></td>
        <td id="LabTestResultTd_13" ><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_13" onchange="calcGFR(13);" /></td>
        <td  ><euc:EformSelect RecordId="13" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_13" /></td>
        <td  id="LabTestGFRTd_13"><span id="GFR_13" style="display: none;"></span><euc:EformTextBox RecordId="13" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_13" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="13" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_13" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_14" onclick="calcGFR(14);" onmouseout="calcGFR(14);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="14"  ID="LabDateText_14" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="14" Runat="server" ID="LabDate_14" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_14" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="14" Table="LabTests" Runat="server" id="LabTest_14" /></td>
        <td id="LabTestResultTd_14" ><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_14" onchange="calcGFR(14);" /></td>
        <td  ><euc:EformSelect RecordId="14" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_14" /></td>
        <td  id="LabTestGFRTd_14"><span id="GFR_14" style="display: none;"></span><euc:EformTextBox RecordId="14" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_14" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="14" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_14" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_15" onclick="calcGFR(15);" onmouseout="calcGFR(15);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="15"  ID="LabDateText_15" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="15" Runat="server" ID="LabDate_15" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_15" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="15" Table="LabTests" Runat="server" id="LabTest_15" /></td>
        <td id="LabTestResultTd_15" ><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_15" onchange="calcGFR(15);" /></td>
        <td  ><euc:EformSelect RecordId="15" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_15" /></td>
        <td  id="LabTestGFRTd_15"><span id="GFR_15" style="display: none;"></span><euc:EformTextBox RecordId="15" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_15" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="15" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_15" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_16" onclick="calcGFR(16);" onmouseout="calcGFR(16);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="16"  ID="LabDateText_16" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="16" Runat="server" ID="LabDate_16" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_16" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="16" Table="LabTests" Runat="server" id="LabTest_16" /></td>
        <td id="LabTestResultTd_16" ><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_16" onchange="calcGFR(16);" /></td>
        <td  ><euc:EformSelect RecordId="16" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_16" /></td>
        <td  id="LabTestGFRTd_16"><span id="GFR_16" style="display: none;"></span><euc:EformTextBox RecordId="16" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_16" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="16" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_16" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_17" onclick="calcGFR(17);" onmouseout="calcGFR(17);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="17"  ID="LabDateText_17" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="17" Runat="server" ID="LabDate_17" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_17" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="17" Table="LabTests" Runat="server" id="LabTest_17" /></td>
        <td id="LabTestResultTd_17" ><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_17" onchange="calcGFR(17);" /></td>
        <td  ><euc:EformSelect RecordId="17" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_17" /></td>
        <td  id="LabTestGFRTd_17"><span id="GFR_17" style="display: none;"></span><euc:EformTextBox RecordId="17" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_17" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="17" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_17" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_18" onclick="calcGFR(18);" onmouseout="calcGFR(18);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="18"  ID="LabDateText_18" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="18" Runat="server" ID="LabDate_18" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_18" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="18" Table="LabTests" Runat="server" id="LabTest_18" /></td>
        <td id="LabTestResultTd_18" ><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_18" onchange="calcGFR(18);" /></td>
        <td  ><euc:EformSelect RecordId="18" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_18" /></td>
        <td  id="LabTestGFRTd_18"><span id="GFR_18" style="display: none;"></span><euc:EformTextBox RecordId="18" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_18" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="18" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_18" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_19" onclick="calcGFR(19);" onmouseout="calcGFR(19);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="19"  ID="LabDateText_19" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="19" Runat="server" ID="LabDate_19" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_19" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="19" Table="LabTests" Runat="server" id="LabTest_19" /></td>
        <td id="LabTestResultTd_19" ><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_19" onchange="calcGFR(19);" /></td>
        <td  ><euc:EformSelect RecordId="19" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_19" /></td>
        <td  id="LabTestGFRTd_19"><span id="GFR_19" style="display: none;"></span><euc:EformTextBox RecordId="19" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_19" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="19" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_19" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr id="LabTestRow_20" onclick="calcGFR(20);" onmouseout="calcGFR(20);" style="display: none;" > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox Runat="server" RecordId="20"  ID="LabDateText_20" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			    <euc:EformHidden RecordId="20" Runat="server" ID="LabDate_20" Table="LabTests" Field="LabDate"/>
        </td>
	    <td id="LabTestTypeTd_20" ><euc:EformComboBox LookupCode="LabTest" style="width:60px;" Field="LabTest" RecordId="20" Table="LabTests" Runat="server" id="LabTest_20" /></td>
        <td id="LabTestResultTd_20" ><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_20" onchange="calcGFR(20);" /></td>
        <td  ><euc:EformSelect RecordId="20" LookupCode="LabUnits" DropDownWidth="80" DropDownHeight="auto" style="width:50px;" TABLE="LabTests" FIELD="LabUnits" Runat="server" ID="LabUnits_20" /></td>
        <td  id="LabTestGFRTd_20"><span id="GFR_20" style="display: none;"></span><euc:EformTextBox RecordId="20" style="width: 90px;" TABLE="LabTests" FIELD="LabNotes" Runat="server"  CssClass="GFRTd" title="Auto-calculated for CREAT records. (Patient must also have valid Gender and DOB recorded.)"  ID="LabNotes_20" ReadOnly="true" /></td>
        <td><euc:EformSelect RecordId="20" LookupCode="DataQuality" DropDownWidth="300" DropDownHeight="auto" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_20" style="width: 40px;"  /></td>	
        <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
	
	
	
	
	
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'LabTestsHtmlTable');" />
<br/><br/>
<br/>
