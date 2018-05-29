<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.MedicationsBreast"
    CodeFile="MedicationsBreast.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">

	tableArray.MedicationsBreastHtmlTable = "MedicationsBreastHtmlTable";

	function modTaggedMedications(mode)
	{
		var table = document.getElementById('MedicationsBreastHtmlTable');
		for (i = 0; i < table.rows.length; i++) {
			var row = table.rows[i];
			var rowId = row.id;
			if (rowId != null && rowId.indexOf('_tr_') != -1) {
				row.style.display = mode;
			}
		}
	}
	
	function showTaggedMedications(linkRef)
	{
		modTaggedMedications('block');
		linkRef.style.display = 'none';
		return false;
	}
	
	
	function toggleTaggedMedications(cbox)
	{
		if (cbox.checked)
		{
//			modTaggedMedications('none');
			document.getElementById('medicationCheckboxMsg').innerHTML = '<strong>Loading...  Please wait.</strong>';
			document.dataForm.submit();  //need to submit to switch medication view without losing changes
		}
		else
		{
			modTaggedMedications('block');
		}
		
		return false;
	}
	
	function showHideBreastMeds(breastMedsPerformed_value,breastMedsAEDtTxtId, breastMedsAEDtTxtIdVal, breastMedsAEDtId, breastMedsAEDtIdVal, breastMedsAETableId, breastMedsAETableIdVal, breastMedsAEFieldId, breastMedsAEFieldIdVal, breastMedsAEFieldValueId, breastMedsAEFieldValueIdVal, breastMedsAEReasonId, breastMedsAEReasonIdVal, breastMedsAEQltyId, breastMedsAEQltyIdVal)
    {
      var BreastMedsDetailsRow = $('BreastMedsDetails');
      if (breastMedsPerformed_value == "Yes")
      {
        BreastMedsDetailsRow.style.display='block';
        
        //clears absent row data
        clearElementsInParentRow(document.getElementById('BreastMedsAbsentRow'));      
      } 
      else if (breastMedsPerformed_value == "No")
      {        
        BreastMedsDetailsRow.style.display='none';  
        
        //clears breastMeds proc and path rows data
        clearElementsInParentRow(document.getElementById('BreastMedsRow1'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow2'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow3'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow4'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow5'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow6'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow7'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow8'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow9'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow10'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow11'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow12'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow13'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow14'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow15'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow16'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow17'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow18'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow19'));
        clearElementsInParentRow(document.getElementById('BreastMedsRow20'));
                
        
        document.getElementById(breastMedsAEDtTxtId).value = breastMedsAEDtTxtIdVal;
        document.getElementById(breastMedsAEDtId).value = breastMedsAEDtIdVal;
        document.getElementById(breastMedsAETableId).value = breastMedsAETableIdVal;        
        document.getElementById(breastMedsAEFieldId).value = breastMedsAEFieldIdVal;
        document.getElementById(breastMedsAEFieldValueId).value = breastMedsAEFieldValueIdVal;
        document.getElementById(breastMedsAEReasonId).value = breastMedsAEReasonIdVal;
        document.getElementById(breastMedsAEQltyId).value = breastMedsAEQltyIdVal;
      }
    }
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="MedicationsBreast" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medications"></asp:Label><br />
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;"><strong>Medications Taken ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="MedicationDone" id="MedicationDone" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
	<td style="width:40%"></td>
  </tr>
 <tr id="BreastMedsDetails" style="display: none;">
     <td style="padding: 0px;" colspan="3">
        <img src="../../Images/shim.gif" width="50" height="1" border="0"><input type="checkbox"
            checked onclick="toggleTaggedMedications(this);" />
        <span id="medicationCheckboxMsg">Show Current Medications Only</span>
        <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicationsBreastHtmlTable">
            <tr>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space: nowrap;">&nbsp;Date</td>
                <td style="text-align: center; white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Agent Type</td>
                <td style="text-align: center; white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Agent</td>
                <td style="text-align: center; white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Notes</td>
                <td style="text-align: left; white-space: nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
            <asp:Repeater ID="medicationsAll" runat="server" OnItemDataBound="DecorateMedicationsAll">
                <ItemTemplate>
                    <tr id="_tr_" runat="server" class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';"
                        onmouseout="this.className='ClinicalEformPopulatedRow';">
                        <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDateText")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedType")%>&nbsp;</td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Medication")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedNotes")%></td>
                        <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9"
                                height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr id="NoMedsMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable">
                <td colspan="12" class="ClinicalEformPopulatedColumn" align="center" height="40">
                    No medications have been recorded for this patient.
                </td>
            </tr>
            <tr id="BreastMedsRow1">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="1" Table="Medications" Field="MedDateText" ID="MedDateText_1" runat="server" 
                        ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="1" Table="Medications" Field="MedDate" ID="MedDate_1" runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="1" Table="Medications" Field="MedType" ID="MedType_1" 
                        runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="1" Table="Medications" Field="Medication" ID="Medication_1" 
                        runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="1" Table="Medications" Field="MedQuality" ID="MedQuality_1" 
                        runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px" RecordId="1" ID="MedNotes_1" ShowTextEditor="true" TABLE="Medications" Field="MedNotes" Runat="server"/></td>
                <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server" /></td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow2">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="2" Table="Medications" Field="MedDateText"
                        ID="MedDateText_2" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="2" Table="Medications" Field="MedDate" ID="MedDate_2"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="2" Table="Medications"
                        Field="MedType" ID="MedType_2" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="2" Table="Medications"
                        Field="Medication" ID="Medication_2" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="2" Table="Medications"
                        Field="MedQuality" ID="MedQuality_2" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="2"  ID="MedNotes_2"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_2" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow3">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="3" Table="Medications" Field="MedDateText"
                        ID="MedDateText_3" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="3" Table="Medications" Field="MedDate" ID="MedDate_3"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="3" Table="Medications"
                        Field="MedType" ID="MedType_3" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="3" Table="Medications"
                        Field="Medication" ID="Medication_3" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="3" Table="Medications"
                        Field="MedQuality" ID="MedQuality_3" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="3"  ID="MedNotes_3"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_3" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow4">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="4" Table="Medications" Field="MedDateText"
                        ID="MedDateText_4" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="4" Table="Medications" Field="MedDate" ID="MedDate_4"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="4" Table="Medications"
                        Field="MedType" ID="MedType_4" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="4" Table="Medications"
                        Field="Medication" ID="Medication_4" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="4" Table="Medications"
                        Field="MedQuality" ID="MedQuality_4" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="4"  ID="MedNotes_4" ShowTextEditor="true"   TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_4" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow5">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="5" Table="Medications" Field="MedDateText"
                        ID="MedDateText_5" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="5" Table="Medications" Field="MedDate" ID="MedDate_5"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="5" Table="Medications"
                        Field="MedType" ID="MedType_5" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="5" Table="Medications"
                        Field="Medication" ID="Medication_5" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="5" Table="Medications"
                        Field="MedQuality" ID="MedQuality_5" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="5"  ID="MedNotes_5"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_5" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow6">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="6" Table="Medications" Field="MedDateText"
                        ID="MedDateText_6" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="6" Table="Medications" Field="MedDate" ID="MedDate_6"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="6" Table="Medications"
                        Field="MedType" ID="MedType_6" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="6" Table="Medications"
                        Field="Medication" ID="Medication_6" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="6" Table="Medications"
                        Field="MedQuality" ID="MedQuality_6" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="6"  ID="MedNotes_6"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_6" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow7">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="7" Table="Medications" Field="MedDateText"
                        ID="MedDateText_7" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="7" Table="Medications" Field="MedDate" ID="MedDate_7"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="7" Table="Medications"
                        Field="MedType" ID="MedType_7" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="7" Table="Medications"
                        Field="Medication" ID="Medication_7" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="7" Table="Medications"
                        Field="MedQuality" ID="MedQuality_7" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="7"  ID="MedNotes_7"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_7" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow8">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="8" Table="Medications" Field="MedDateText"
                        ID="MedDateText_8" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="8" Table="Medications" Field="MedDate" ID="MedDate_8"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="8" Table="Medications"
                        Field="MedType" ID="MedType_8" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="8" Table="Medications"
                        Field="Medication" ID="Medication_8" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="8" Table="Medications"
                        Field="MedQuality" ID="MedQuality_8" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="8"  ID="MedNotes_8"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_8" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow9">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="9" Table="Medications" Field="MedDateText"
                        ID="MedDateText_9" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="9" Table="Medications" Field="MedDate" ID="MedDate_9"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="9" Table="Medications"
                        Field="MedType" ID="MedType_9" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="9" Table="Medications"
                        Field="Medication" ID="Medication_9" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="9" Table="Medications"
                        Field="MedQuality" ID="MedQuality_9" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="9"  ID="MedNotes_9"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_9" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow10">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="10" Table="Medications" Field="MedDateText"
                        ID="MedDateText_10" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="10" Table="Medications" Field="MedDate" ID="MedDate_10"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="10" Table="Medications"
                        Field="MedType" ID="MedType_10" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="10" Table="Medications"
                        Field="Medication" ID="Medication_10" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="10" Table="Medications"
                        Field="MedQuality" ID="MedQuality_10" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="10"  ID="MedNotes_10"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_10" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow11">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="11" Table="Medications" Field="MedDateText"
                        ID="MedDateText_11" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="11" Table="Medications" Field="MedDate" ID="MedDate_11"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="11" Table="Medications"
                        Field="MedType" ID="MedType_11" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="11" Table="Medications"
                        Field="Medication" ID="Medication_11" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="11" Table="Medications"
                        Field="MedQuality" ID="MedQuality_11" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="11"  ID="MedNotes_11"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_11" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow12">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="12" Table="Medications" Field="MedDateText"
                        ID="MedDateText_12" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="12" Table="Medications" Field="MedDate" ID="MedDate_12"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="12" Table="Medications"
                        Field="MedType" ID="MedType_12" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="12" Table="Medications"
                        Field="Medication" ID="Medication_12" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="12" Table="Medications"
                        Field="MedQuality" ID="MedQuality_12" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="12"  ID="MedNotes_12"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_12" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow13">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="13" Table="Medications" Field="MedDateText"
                        ID="MedDateText_13" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="13" Table="Medications" Field="MedDate" ID="MedDate_13"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="13" Table="Medications"
                        Field="MedType" ID="MedType_13" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="13" Table="Medications"
                        Field="Medication" ID="Medication_13" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="13" Table="Medications"
                        Field="MedQuality" ID="MedQuality_13" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="13"  ID="MedNotes_13"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_13" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow14">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="14" Table="Medications" Field="MedDateText"
                        ID="MedDateText_14" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="14" Table="Medications" Field="MedDate" ID="MedDate_14"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="14" Table="Medications"
                        Field="MedType" ID="MedType_14" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="14" Table="Medications"
                        Field="Medication" ID="Medication_14" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="14" Table="Medications"
                        Field="MedQuality" ID="MedQuality_14" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="14"  ID="MedNotes_14"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_14" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow15">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="15" Table="Medications" Field="MedDateText"
                        ID="MedDateText_15" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="15" Table="Medications" Field="MedDate" ID="MedDate_15"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="15" Table="Medications"
                        Field="MedType" ID="MedType_15" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="15" Table="Medications"
                        Field="Medication" ID="Medication_15" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="15" Table="Medications"
                        Field="MedQuality" ID="MedQuality_15" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="15"  ID="MedNotes_15"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_15" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow16">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="16" Table="Medications" Field="MedDateText"
                        ID="MedDateText_16" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="16" Table="Medications" Field="MedDate" ID="MedDate_16"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="16" Table="Medications"
                        Field="MedType" ID="MedType_16" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="16" Table="Medications"
                        Field="Medication" ID="Medication_16" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="16" Table="Medications"
                        Field="MedQuality" ID="MedQuality_16" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="16"  ID="MedNotes_16"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_16" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow17">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="17" Table="Medications" Field="MedDateText"
                        ID="MedDateText_17" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="17" Table="Medications" Field="MedDate" ID="MedDate_17"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="17" Table="Medications"
                        Field="MedType" ID="MedType_17" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="17" Table="Medications"
                        Field="Medication" ID="Medication_17" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="17" Table="Medications"
                        Field="MedQuality" ID="MedQuality_17" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="17"  ID="MedNotes_17"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_17" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow18">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="18" Table="Medications" Field="MedDateText"
                        ID="MedDateText_18" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="18" Table="Medications" Field="MedDate" ID="MedDate_18"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="18" Table="Medications"
                        Field="MedType" ID="MedType_18" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="18" Table="Medications"
                        Field="Medication" ID="Medication_18" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="18" Table="Medications"
                        Field="MedQuality" ID="MedQuality_18" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="18"  ID="MedNotes_18"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_18" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow19">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="19" Table="Medications" Field="MedDateText"
                        ID="MedDateText_19" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="19" Table="Medications" Field="MedDate" ID="MedDate_19"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="19" Table="Medications"
                        Field="MedType" ID="MedType_19" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="19" Table="Medications"
                        Field="Medication" ID="Medication_19" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="19" Table="Medications"
                        Field="MedQuality" ID="MedQuality_19" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="19"  ID="MedNotes_19"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_19" runat="server" />
                </td>
            </tr>
            <tr style="display: none;" id="BreastMedsRow20">
                <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                    <euc:EformTextBox Style="width: 80px;" RecordId="20" Table="Medications" Field="MedDateText"
                        ID="MedDateText_20" runat="server" ShowCalendar="True" CalcDate="True" />
                    <euc:EformHidden RecordId="20" Table="Medications" Field="MedDate" ID="MedDate_20"
                        runat="server" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="20" Table="Medications"
                        Field="MedType" ID="MedType_20" runat="server" LookupCode="MedType,Disease,Breast" />
                </td>
                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto" Style="width: 120px;" RecordId="20" Table="Medications"
                        Field="Medication" ID="Medication_20" runat="server" LookupCode="Medication" />
                    <euc:EformTextBox Width="1px" Style="display: none;" RecordId="20" Table="Medications"
                        Field="MedQuality" ID="MedQuality_20" runat="server" />
                </td>
                <td><euc:EformTextBox Width="100px"  RecordId="20"  ID="MedNotes_20"  ShowTextEditor="true"  TABLE="Medications" Field="MedNotes"  Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformDeleteIcon ID="EformDeleteIcon_20" runat="server" />
                </td>
            </tr>
        </table>
        <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
            border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'MedicationsBreastHtmlTable');" />
     </td>
 </tr>
 </table>
 <table>
    <tr id="BreastMedsAbsentRow">
        <td>
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_5"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="5" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_5"
                Runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="TableName" ID="TableName_5"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="FieldName" ID="FieldName_5"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_5"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_5"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_5"
                runat="server"  style="width:1px;display:none;"/>
        </td>
    </tr>
</table>

<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls
    function addEvents(medDateTextID,medTypeID,medicationID,medQualityID)
    { 
        $(medDateTextID).addEvent('blur',curry(SetHiddenFields,medDateTextID,medTypeID,medicationID,medQualityID));
        $(medTypeID).addEvent('blur',curry(SetHiddenFields,medDateTextID,medTypeID,medicationID,medQualityID));
        $(medicationID).addEvent('blur',curry(SetHiddenFields,medDateTextID,medTypeID,medicationID,medQualityID));
   }

    addEvents($('<%= MedDateText_1.ClientID %>'),$('<%= MedType_1.ClientID %>'),$('<%= Medication_1.ClientID %>'),$('<%= MedQuality_1.ClientID %>'));
    addEvents($('<%= MedDateText_2.ClientID %>'),$('<%= MedType_2.ClientID %>'),$('<%= Medication_2.ClientID %>'),$('<%= MedQuality_2.ClientID %>'));
    addEvents($('<%= MedDateText_3.ClientID %>'),$('<%= MedType_3.ClientID %>'),$('<%= Medication_3.ClientID %>'),$('<%= MedQuality_3.ClientID %>'));
    addEvents($('<%= MedDateText_4.ClientID %>'),$('<%= MedType_4.ClientID %>'),$('<%= Medication_4.ClientID %>'),$('<%= MedQuality_4.ClientID %>'));
    addEvents($('<%= MedDateText_5.ClientID %>'),$('<%= MedType_5.ClientID %>'),$('<%= Medication_5.ClientID %>'),$('<%= MedQuality_5.ClientID %>'));
    addEvents($('<%= MedDateText_6.ClientID %>'),$('<%= MedType_6.ClientID %>'),$('<%= Medication_6.ClientID %>'),$('<%= MedQuality_6.ClientID %>'));
    addEvents($('<%= MedDateText_7.ClientID %>'),$('<%= MedType_7.ClientID %>'),$('<%= Medication_7.ClientID %>'),$('<%= MedQuality_7.ClientID %>'));
    addEvents($('<%= MedDateText_8.ClientID %>'),$('<%= MedType_8.ClientID %>'),$('<%= Medication_8.ClientID %>'),$('<%= MedQuality_8.ClientID %>'));
    addEvents($('<%= MedDateText_9.ClientID %>'),$('<%= MedType_9.ClientID %>'),$('<%= Medication_9.ClientID %>'),$('<%= MedQuality_9.ClientID %>'));
    addEvents($('<%= MedDateText_10.ClientID %>'),$('<%= MedType_10.ClientID %>'),$('<%= Medication_10.ClientID %>'),$('<%= MedQuality_10.ClientID %>'));
    addEvents($('<%= MedDateText_11.ClientID %>'),$('<%= MedType_11.ClientID %>'),$('<%= Medication_11.ClientID %>'),$('<%= MedQuality_11.ClientID %>'));
    addEvents($('<%= MedDateText_12.ClientID %>'),$('<%= MedType_12.ClientID %>'),$('<%= Medication_12.ClientID %>'),$('<%= MedQuality_12.ClientID %>'));
    addEvents($('<%= MedDateText_13.ClientID %>'),$('<%= MedType_13.ClientID %>'),$('<%= Medication_13.ClientID %>'),$('<%= MedQuality_13.ClientID %>'));
    addEvents($('<%= MedDateText_14.ClientID %>'),$('<%= MedType_14.ClientID %>'),$('<%= Medication_14.ClientID %>'),$('<%= MedQuality_14.ClientID %>'));
    addEvents($('<%= MedDateText_15.ClientID %>'),$('<%= MedType_15.ClientID %>'),$('<%= Medication_15.ClientID %>'),$('<%= MedQuality_15.ClientID %>'));
    addEvents($('<%= MedDateText_16.ClientID %>'),$('<%= MedType_16.ClientID %>'),$('<%= Medication_16.ClientID %>'),$('<%= MedQuality_16.ClientID %>'));
    addEvents($('<%= MedDateText_17.ClientID %>'),$('<%= MedType_17.ClientID %>'),$('<%= Medication_17.ClientID %>'),$('<%= MedQuality_17.ClientID %>'));
    addEvents($('<%= MedDateText_18.ClientID %>'),$('<%= MedType_18.ClientID %>'),$('<%= Medication_18.ClientID %>'),$('<%= MedQuality_18.ClientID %>'));
    addEvents($('<%= MedDateText_19.ClientID %>'),$('<%= MedType_19.ClientID %>'),$('<%= Medication_19.ClientID %>'),$('<%= MedQuality_19.ClientID %>'));
    addEvents($('<%= MedDateText_20.ClientID %>'),$('<%= MedType_20.ClientID %>'),$('<%= Medication_20.ClientID %>'),$('<%= MedQuality_20.ClientID %>'));
 
    /* ]]> */
    
function SetHiddenFields(medDateTextID,medTypeID,medicationID,medQualityID)
{
  
    if (medDateTextID.value != '' || medTypeID.value != '' || medicationID.value != '')
    {
        medQualityID.value = 'STD';
        
    }
    else
    {
        medQualityID.value = '';    
    }
}
</script>

