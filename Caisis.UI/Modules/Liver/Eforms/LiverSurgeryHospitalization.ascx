<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryHospitalization" CodeFile="LiverSurgeryHospitalization.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.HospitalizationLiverHtmlTable = "HospitalizationLiverHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="LiverSurgeryHospitalization" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Hospitalization"></asp:Label><br/>
<table  width="325" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="HospitalizationLiverHtmlTable" > 


  <tr> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Discharge Date</td> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;ICU Stay (days)</td> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Length Of Stay (days)</td> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Hospital</td> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; DISPLAY: none;" >&nbsp;Post-op RBC Transfused (units)</td>
    <td height="28" class="controlBoxDataGridHeaderFirstCol"  ></td>
  </tr>
  <tr > 
    <td height="28" ><euc:EformTextBox style="width:100px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospDischargeDateText" ID="HospDischargeDateText"  Runat="server" ShowCalendar="true" CalcDate="true" />
 				     <euc:EformHidden                       RecordId="1"  TABLE="Hospitalizations" FIELD="HospDischargeDate"     ID="HospDischargeDate"     Runat="server"/></td>

    <td style="white-space: nowrap;">
        <euc:EformTextBox style="width:80px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospICUStay" ID="HospICUStay"  Runat="server"   /></td>

    <td style="white-space: nowrap;">
        <euc:EformTextBox  Width="80px" TABLE="NoTable" FIELD="LengthOfStay" ID="LengthOfStay" Runat="server"   />
        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="1" TABLE="Hospitalizations" FIELD="HospNotes" ID="HospNotes" Runat="server"  /> </td>        
 
    <td style="white-space: nowrap;" ><euc:EformComboBox DropDownWidth="auto"  style="width:100px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospInstitution" ID="HospInstitution"  Runat="server"  LookupCode="Institution" /></td>

     <td style="DISPLAY: none; white-space: nowrap;" >
        <euc:EformTextBox  style="width:100px;" RecordId="40"  TABLE="OperatingRoomDetails" FIELD="OpRBC_PostOp" ID="OpRBC_PostOp" Runat="server"  /> </td>

  </tr>             

</table>
<br /><br /><br />
<script type="text/javascript">
    /* <![CDATA[ */

    addEvent($('<%= HospICUStay.ClientID %>'),$('<%= LengthOfStay.ClientID %>'),$('<%= HospNotes.ClientID %>'),$('<%= HospInstitution.ClientID %>'),$('<%= OpRBC_PostOp.ClientID %>'));

    function addEvent(hospICUStayID,lengthOfStayID,hospNotesID,hospInstitutionID,opRBCPostOpID)
    {  
        $(hospICUStayID).addEvent('blur',curry(SetHiddenFields,hospICUStayID,lengthOfStayID,hospNotesID,hospInstitutionID,opRBCPostOpID));
        $(lengthOfStayID).addEvent('blur',curry(SetHiddenFields,hospICUStayID,lengthOfStayID,hospNotesID,hospInstitutionID,opRBCPostOpID));
        $(hospInstitutionID).addEvent('blur',curry(SetHiddenFields,hospICUStayID,lengthOfStayID,hospNotesID,hospInstitutionID,opRBCPostOpID));
        $(opRBCPostOpID).addEvent('blur',curry(SetHiddenFields,hospICUStayID,lengthOfStayID,hospNotesID,hospInstitutionID,opRBCPostOpID));
       
   }
   
    /* ]]> */
    
 	function SetHiddenFields(hospICUStayID,lengthOfStayID,hospNotesID,hospInstitutionID,opRBCPostOpID)
	{ 
	    if (hospICUStayID.value != '' || lengthOfStayID.value != '' || hospInstitutionID.value != '' || opRBCPostOpID.value != '')
	    {
            hospNotesID.value = '';
            if (lengthOfStayID.value != '')            
                hospNotesID.value = "Length Of Stay (days): " + lengthOfStayID.value + " || ";
	    }
	    else
	    {
            hospNotesID.value = '';
	    }
	}  
	
</script>




