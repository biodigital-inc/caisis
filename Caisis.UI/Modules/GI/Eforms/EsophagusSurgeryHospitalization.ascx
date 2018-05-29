<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusSurgeryHospitalization" CodeFile="EsophagusSurgeryHospitalization.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.HospitalizationPancreasHtmlTable = "HospitalizationPancreasHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="EsophagusSurgeryHospitalization" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Hospitalization"></asp:Label><br/>
<table  width="500" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="HospitalizationPancreasHtmlTable" > 


  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Discharge Date</td> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Hospital</td> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Total ICU Stay (days)</td>
  </tr>
  <tr > 
    <td valign="top"><euc:EformTextBox Width="100px" RecordID="1"  TABLE="Hospitalizations" FIELD="HospDischargeDateText" ID="HospDischargeDateText_1"  Runat="server"  ShowCalendar="true" CalcDate="true" />
 				     <euc:EformHidden                       RecordId="1"  TABLE="Hospitalizations" FIELD="HospDischargeDate"     ID="HospDischargeDate_1"     Runat="server"/></td>
 
    <td valign="top"><euc:EformComboBox DropDownWidth="300px"  Width="100px" RecordID="1"  TABLE="Hospitalizations" FIELD="HospInstitution" ID="HospInstitution_1"  Runat="server"  LookupCode="Institution" /></td>
    <td valign="top"><euc:EformTextBox Width="100px" RecordID="1"  TABLE="Hospitalizations" FIELD="HospICUStay" ID="HospICUStay_1"  Runat="server"  /></td>
  </tr>             

  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Post-op RBC Transfused (units)</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Initial Discharge From ICU</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Re-admission to ICU</td>

                    
  </tr>
 
   <tr > 
     <td valign="top">
        <euc:EformTextBox  Width="100px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpRBC_PostOp" ID="OpRBC_PostOp_1" Runat="server" /> </td>
    <td >
        <euc:EformTextBox Width="100px" TABLE="NoTable" FIELD="InitalDischargeICUDateText_1" ID="InitalDischargeICUDateText_1"  Runat="server" ShowCalendar="true" /></td>       
    <td >
        <euc:EformDropDownList Width="100px" TABLE="NoTable" FIELD="ReadmissionICU_1" ID="ReadmissionICU_1"  Runat="server" LookupCode="YesNoUnknown"/></td>       


  </tr> 
  <tr> 
    <td colspan="3" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Notes</td> 
  </tr>
 
   <tr > 
    <td colspan="3" >
        <euc:EformTextBox Width="450px" TABLE="NoTable" FIELD="UserHospNotes_1" ID="UserHospNotes_1"  Runat="server"  ShowTextEditor="true" />
        
        <euc:EformTextBox Width="1px" style="display: none; " RecordID="1"  TABLE="Hospitalizations" FIELD="HospNotes" ID="HospNotes_1"  Runat="server"   /></td>
  </tr> 

</table>
<br /><br /><br />


<script type="text/javascript">
    /* <![CDATA[ */

    addEventHospitalization($('<%= HospDischargeDateText_1.ClientID %>'), $('<%= HospDischargeDate_1.ClientID %>'), $('<%= HospInstitution_1.ClientID %>'), $('<%= HospICUStay_1.ClientID %>'), $('<%= OpRBC_PostOp_1.ClientID %>'), $('<%= InitalDischargeICUDateText_1.ClientID %>'), $('<%= ReadmissionICU_1.ClientID %>'), $('<%= UserHospNotes_1.ClientID %>'), $('<%= HospNotes_1.ClientID %>'));


    function addEventHospitalization(hospDischargeDateTextID, hospDischargeDateID, hospInstitutionID, hospICUStayID, oprbcPostOpID, initialDischargeICUDateTextID, readmissionICUID, userHospNotesID, hospNotesID) {
       
        $(hospDischargeDateTextID).addEvent('blur', curry(SetHospFields, hospDischargeDateTextID, hospDischargeDateID, hospInstitutionID, hospICUStayID, oprbcPostOpID, initialDischargeICUDateTextID, readmissionICUID, userHospNotesID, hospNotesID));
        $(hospInstitutionID).addEvent('blur', curry(SetHospFields, hospDischargeDateTextID, hospDischargeDateID, hospInstitutionID, hospICUStayID, oprbcPostOpID, initialDischargeICUDateTextID, readmissionICUID, userHospNotesID, hospNotesID));
        $(hospICUStayID).addEvent('blur', curry(SetHospFields, hospDischargeDateTextID, hospDischargeDateID, hospInstitutionID, hospICUStayID, oprbcPostOpID, initialDischargeICUDateTextID, readmissionICUID, userHospNotesID, hospNotesID));
        $(oprbcPostOpID).addEvent('blur', curry(SetHospFields, hospDischargeDateTextID, hospDischargeDateID, hospInstitutionID, hospICUStayID, oprbcPostOpID, initialDischargeICUDateTextID, readmissionICUID, userHospNotesID, hospNotesID));
        $(initialDischargeICUDateTextID).addEvent('blur', curry(SetHospFields, hospDischargeDateTextID, hospDischargeDateID, hospInstitutionID, hospICUStayID, oprbcPostOpID, initialDischargeICUDateTextID, readmissionICUID, userHospNotesID, hospNotesID));
        $(readmissionICUID).addEvent('blur', curry(SetHospFields, hospDischargeDateTextID, hospDischargeDateID, hospInstitutionID, hospICUStayID, oprbcPostOpID, initialDischargeICUDateTextID, readmissionICUID, userHospNotesID, hospNotesID));
        $(userHospNotesID).addEvent('blur', curry(SetHospFields, hospDischargeDateTextID, hospDischargeDateID, hospInstitutionID, hospICUStayID, oprbcPostOpID, initialDischargeICUDateTextID, readmissionICUID, userHospNotesID, hospNotesID));
    }

    /* ]]> */

    function SetHospFields(hospDischargeDateTextID, hospDischargeDateID, hospInstitutionID, hospICUStayID, oprbcPostOpID, initialDischargeICUDateTextID, readmissionICUID, userHospNotesID, hospNotesID) {

        hospNotesID.value = '';

        if (initialDischargeICUDateTextID.value != '')
            hospNotesID.value = hospNotesID.value + 'Initial Discharge From ICU: ' + initialDischargeICUDateTextID.value + ' | ';
        if (readmissionICUID.value != '')
            hospNotesID.value = hospNotesID.value + 'Re-admission to ICU: ' + readmissionICUID.value + ' | ';
        if (userHospNotesID.value != '')
            hospNotesID.value = hospNotesID.value + 'Other notes: ' + userHospNotesID.value + ' | ';

    }
    
  </script>  
    
 