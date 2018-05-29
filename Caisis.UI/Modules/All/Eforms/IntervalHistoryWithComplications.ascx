<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.IntervalHistoryWithComplications" CodeFile="IntervalHistoryWithComplications.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<style type="text/css">
table#ComplicationDetailsTable
{
    border: solid 1px #cccccc;
}

table#ComplicationDetailsTable td
{
    padding: 2px 4px 2px 4px;
}
</style>

<a name="IntervalHistoryWithComplications" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Interval History"></asp:Label><euc:EformCheckBox runat="server" Table="NoTable" Field="ComplicationsPresent" id="ComplicationsPresent" Value="true" onclick="showHideComplications(this);" style="margin-left: 40px;" />Complication<br/>

<table border="0" cellspacing="0" cellpadding="16" width="600" id="IntervalHistoryTable">
  
  <tr>
    <td class="eformLargePopulatedTable"><euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="IntervalHistory" Rows="4"  style="width: 560px;"  Runat="server" ID="IntervalHistory"/></td>
  </tr>
  
  <tr style="display: none;" id="ComplicationDetailsTableRow">
    <td class="eformLargePopulatedTable" style="padding-top: 20px;">
    <strong>Complication Details</strong>
   <%-- <euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="ComplicationDetails" Rows="4"  style="width: 560px;"  Runat="server" ID="ComplicationDetails"/> --%>
    
    
    <table  id="ComplicationDetailsTable" cellspacing="0">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol">Date</td>
            <td class="controlBoxDataGridHeaderFirstCol">Complication</td>
            <td class="controlBoxDataGridHeaderFirstCol">Grade</td>
            <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <euc:EformTextBox RecordId="1" TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_1" Runat="server" Width="82px" ShowCalendar="True" CalcDate="True" />
	            <euc:EformHidden  RecordId="1" TABLE="Toxicities" FIELD="ToxDate" ID="ToxDate_1" Runat="server" />
	        </td>
            <td><euc:EformComboBox LookupCode="ToxName_Complication" RecordId="1" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_1" style="width: 140px;"/></td>
            <td><euc:EformComboBox LookupCode="ToxGrade" RecordId="1" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" ID="ToxGrade_1" style="width: 40px;" DropDownWidth="100" DropDownHeight="auto" /></td>
            <td><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_1"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
        </tr>
        <tr>
            <td>
                <euc:EformTextBox RecordId="2" TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_2" Runat="server" Width="82px" ShowCalendar="True" CalcDate="True" />
	            <euc:EformHidden  RecordId="2" TABLE="Toxicities" FIELD="ToxDate" ID="ToxDate_2" Runat="server" />
	        </td>
            <td><euc:EformComboBox LookupCode="ToxName_Complication" RecordId="2" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_2" style="width: 140px;"/></td>
            <td><euc:EformComboBox LookupCode="ToxGrade" RecordId="2" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" ID="ToxGrade_2" style="width: 40px;" DropDownWidth="100" DropDownHeight="auto" /></td>
            <td><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_2"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
        </tr>
        <tr>
            <td>
                <euc:EformTextBox RecordId="3" TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_3" Runat="server" Width="82px" ShowCalendar="True" CalcDate="True" />
	            <euc:EformHidden  RecordId="3" TABLE="Toxicities" FIELD="ToxDate" ID="ToxDate_3" Runat="server" />
	        </td>
            <td><euc:EformComboBox LookupCode="ToxName_Complication" RecordId="3" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_3" style="width: 140px;"/></td>
            <td><euc:EformComboBox LookupCode="ToxGrade" RecordId="3" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" ID="ToxGrade_3" style="width: 40px;" DropDownWidth="100" DropDownHeight="auto" /></td>
            <td><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_3"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td>
                <euc:EformTextBox RecordId="4" TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_4" Runat="server" Width="82px" ShowCalendar="True" CalcDate="True" />
	            <euc:EformHidden  RecordId="4" TABLE="Toxicities" FIELD="ToxDate" ID="ToxDate_4" Runat="server" />
	        </td>
            <td><euc:EformComboBox LookupCode="ToxName_Complication" RecordId="4" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_4" style="width: 140px;"/></td>
            <td><euc:EformComboBox LookupCode="ToxGrade" RecordId="4" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" ID="ToxGrade_4" style="width: 40px;" DropDownWidth="100" DropDownHeight="auto" /></td>
            <td><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_4"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td>
                <euc:EformTextBox RecordId="5" TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_5" Runat="server" Width="82px" ShowCalendar="True" CalcDate="True" />
	            <euc:EformHidden  RecordId="5" TABLE="Toxicities" FIELD="ToxDate" ID="ToxDate_5" Runat="server" />
	        </td>
            <td><euc:EformComboBox LookupCode="ToxName_Complication" RecordId="5" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_5" style="width: 140px;"/></td>
            <td><euc:EformComboBox LookupCode="ToxGrade" RecordId="5" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" ID="ToxGrade_5" style="width: 40px;" DropDownWidth="100" DropDownHeight="auto" /></td>
            <td><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_5"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td>
                <euc:EformTextBox RecordId="6" TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_6" Runat="server" Width="82px" ShowCalendar="True" CalcDate="True" />
	            <euc:EformHidden  RecordId="6" TABLE="Toxicities" FIELD="ToxDate" ID="ToxDate_6" Runat="server" />
	        </td>
            <td><euc:EformComboBox LookupCode="ToxName_Complication" RecordId="6" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_6" style="width: 140px;"/></td>
            <td><euc:EformComboBox LookupCode="ToxGrade" RecordId="6" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" ID="ToxGrade_6" style="width: 40px;" DropDownWidth="100" DropDownHeight="auto" /></td>
            <td><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_6"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td>
                <euc:EformTextBox RecordId="7" TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_7" Runat="server" Width="82px" ShowCalendar="True" CalcDate="True" />
	            <euc:EformHidden  RecordId="7" TABLE="Toxicities" FIELD="ToxDate" ID="ToxDate_7" Runat="server" />
	        </td>
            <td><euc:EformComboBox LookupCode="ToxName_Complication" RecordId="7" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_7" style="width: 140px;"/></td>
            <td><euc:EformComboBox LookupCode="ToxGrade" RecordId="7" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" ID="ToxGrade_7" style="width: 40px;" DropDownWidth="100" DropDownHeight="auto" /></td>
            <td><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_7"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td>
                <euc:EformTextBox RecordId="8" TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_8" Runat="server" Width="82px" ShowCalendar="True" CalcDate="True" />
	            <euc:EformHidden  RecordId="8" TABLE="Toxicities" FIELD="ToxDate" ID="ToxDate_8" Runat="server" />
	        </td>
            <td><euc:EformComboBox LookupCode="ToxName_Complication" RecordId="8" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_8" style="width: 140px;"/></td>
            <td><euc:EformComboBox LookupCode="ToxGrade" RecordId="8" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" ID="ToxGrade_8" style="width: 40px;" DropDownWidth="100" DropDownHeight="auto" /></td>
            <td><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_8"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
        </tr>
    
    
    </table>
    

    
    
    
    
    
    
    
    
    
    
    
    </td>
  </tr>
</table>
<script type="text/javascript" >

var ComplicationDetailsTableRow = $('ComplicationDetailsTableRow');
var ComplicationsPresentCB = $('<% = ComplicationsPresent.ClientID %>');

function showHideComplications(toggle)
{
    if (toggle.checked)
    {
        ComplicationDetailsTableRow.style.display = '';
    }
    else
    {
        ComplicationDetailsTableRow.style.display = 'none';
        clearElementsInParentRow(document.getElementById('ComplicationDetailsTableRow'));      
    }
}
function initialComplicationsView()
{
    if (ComplicationsPresentCB.checked)
    {
        ComplicationDetailsTableRow.style.display = '';
    }
}
initialComplicationsView();
</script>
<br/>
<br/>
<br/>
