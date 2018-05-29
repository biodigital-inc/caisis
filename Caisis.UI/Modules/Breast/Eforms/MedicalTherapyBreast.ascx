<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.MedicalTherapyBreast"
    CodeFile="MedicalTherapyBreast.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    function showHideBreastMedTx(breastMedTxPerformed_value,breastMedTxAEDtTxtId, breastMedTxAEDtTxtIdVal, breastMedTxAEDtId, breastMedTxAEDtIdVal, breastMedTxAETableId, breastMedTxAETableIdVal, breastMedTxAEFieldId, breastMedTxAEFieldIdVal, breastMedTxAEFieldValueId, breastMedTxAEFieldValueIdVal, breastMedTxAEReasonId, breastMedTxAEReasonIdVal, breastMedTxAEQltyId, breastMedTxAEQltyIdVal)
    {
      var breastMedTxDetailsRow = $('BreastMedTxDetails');
      if (breastMedTxPerformed_value == "Yes")
      {
        breastMedTxDetailsRow.style.display='block';
        
        //clears absent row data
        clearElementsInParentRow(document.getElementById('BreastMedTxAbsentRow'));      
      } 
      else if (breastMedTxPerformed_value == "No")
      {        
        breastMedTxDetailsRow.style.display='none';  
        
        //clears breastMedTx proc and path rows data
        clearElementsInParentRow(document.getElementById('BreastMedTxRow'));        
        
        document.getElementById(breastMedTxAEDtTxtId).value = breastMedTxAEDtTxtIdVal;
        document.getElementById(breastMedTxAEDtId).value = breastMedTxAEDtIdVal;
        document.getElementById(breastMedTxAETableId).value = breastMedTxAETableIdVal;        
        document.getElementById(breastMedTxAEFieldId).value = breastMedTxAEFieldIdVal;
        document.getElementById(breastMedTxAEFieldValueId).value = breastMedTxAEFieldValueIdVal;
        document.getElementById(breastMedTxAEReasonId).value = breastMedTxAEReasonIdVal;
        document.getElementById(breastMedTxAEQltyId).value = breastMedTxAEQltyIdVal;
      }
    }
</script>

<a name="MedicalTherapyBreast" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medical Therapies"></asp:Label><br />
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;"><strong>Medical Therapy Performed ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="MedTxDone" id="MedTxDone" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
	<td style="width:40%"></td>
  </tr>
 <tr id="BreastMedTxDetails" style="display: none;">
     <td style="padding: 0px;" colspan="3">
        <table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicalTherapyHtmlTable">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space: nowrap;">&nbsp;Date</td>
            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Type</td>
            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Agent</td>
            <td style="white-space: nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
        </tr>
        <asp:Repeater ID="MedicalTherapies" runat="server" OnItemDataBound="EFormRepeaterOnDataBound">
            <ItemTemplate>
                <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';"
                    onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxDate,MedTxType,MedTxAgent,MedTxQuality', 'MedicalTherapy');">
                    <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %></td>
                    <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxType") %></td>
                    <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %></td>
                    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11"
                            id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr id="BreastMedTxRow">
            <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Style="width: 80px;" RecordId="1" Table="MedicalTherapy" Field="MedTxDateText" ID="MedTxDateText_1" runat="server" 
                    ShowCalendar="True" CalcDate="True" class="InputText" />
                <euc:EformHidden RecordId="1" Table="MedicalTherapy" Field="MedTxDate" ID="MedTxDate_1" runat="server" />
            </td>
            <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="1" Table="MedicalTherapy" Field="MedTxType" ID="MedTxType_1" 
                    runat="server"/>CHEMO</td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Style="width: 170;" RecordId="1" Table="MedicalTherapy" Field="MedTxAgent" ID="MedTxAgent_1" 
                    LookupCode="MedTxAgent" runat="server" />
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="1" Table="MedicalTherapy" Field="MedTxQuality" ID="MedTxQuality_1" 
                    runat="server" />
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="1" Table="MedicalTherapy" Field="MedTxDisease" ID="MedTxDisease_1" 
                    runat="server" />
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="1" Table="MedicalTherapy" Field="MedTxIntent" ID="MedTxIntent_1" 
                    runat="server" />    
            </td>
            <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server" /></td>
        </tr>
    </table>
     </td>
 </tr>
 </table>
 <table>
    <tr id="BreastMedTxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_4"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="4" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_4"
                Runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="TableName" ID="TableName_4"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldName" ID="FieldName_4"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_4"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_4"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_4"
                runat="server"  style="width:1px;display:none;"/>
        </td>
    </tr>
</table><br/><br/>

<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls
    function addEvents(medTxDateTextID,medTxTypeID,medTxAgentID,medTxQualityID,medTxDiseaseID,medTxIntentID)
    { 
        $(medTxDateTextID).addEvent('blur',curry(SetHiddenFields,medTxDateTextID,medTxTypeID,medTxAgentID,medTxQualityID,medTxDiseaseID,    medTxIntentID));
        $(medTxAgentID).addEvent('blur',curry(SetHiddenFields,medTxDateTextID,medTxTypeID,medTxAgentID,medTxQualityID,medTxDiseaseID,medTxIntentID));
   }

    addEvents($('<%= MedTxDateText_1.ClientID %>'),$('<%= MedTxType_1.ClientID %>'),$('<%= MedTxAgent_1.ClientID %>'),$('<%= MedTxQuality_1.ClientID %>'),$('<%= MedTxDisease_1.ClientID %>'),$('<%= MedTxIntent_1.ClientID %>'));
 
    /* ]]> */
    
function SetHiddenFields(medTxDateTextID,medTxTypeID,medTxAgentID,medTxQualityID,medTxDiseaseID,medTxIntentID)
{
    if (medTxDateTextID.value != '' || medTxAgentID.value != '' )
    {
        medTxTypeID.value = 'CHEMO';
        medTxQualityID.value = 'STD';
        medTxDiseaseID.value = 'Breast Cancer';
        medTxIntentID.value = 'Neo-Adjuvant';
    }
    else
    {
        medTxTypeID.value = '';
        medTxQualityID.value = '';
        medTxDiseaseID.value = '';
        medTxIntentID.value = '';
    }
}
</script>

