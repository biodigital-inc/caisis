<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.SurgCCsRvwHospitalization" CodeFile="SurgCCsRvwHospitalization.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.SurgCCsRvwHospitalizationHtmlTable = "SurgCCsRvwHospitalizationHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="SurgCCsRvwHospitalization" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Hospitalization"></asp:Label><br/>
<table  width="325" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="SurgCCsRvwHospitalizationHtmlTable" > 


  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;ICU Stay (days)</td> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Length Of Stay (days)</td> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Hospital</td> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;Post-op RBC Transfused (units)</td>
    <td height="28" class="controlBoxDataGridHeaderFirstCol"  ></td>
  </tr>
  <tr > 
    <td style="white-space: nowrap;">
        <euc:EformTextBox style="width:80px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospICUStay" ID="HospICUStay"  Runat="server"  TabIndex="2"  /></td>

    <td style="white-space: nowrap;">
        <euc:EformTextBox  Width="80px" TABLE="NoTable" FIELD="LengthOfStay" ID="LengthOfStay" Runat="server"   />
        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="1" TABLE="Hospitalizations" FIELD="HospNotes" ID="HospNotes" Runat="server"  /> </td>        
 
    <td style="white-space: nowrap;" ><euc:EformComboBox DropDownWidth="auto"  style="width:100px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospInstitution" ID="HospInstitution"  Runat="server"  TabIndex="3" LookupCode="Institution" /></td>

     <td style="white-space: nowrap;" >
        <euc:EformTextBox  style="width:100px;" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpRBC_PostOp" ID="OpRBC_PostOp" Runat="server" TabIndex="10" /> </td>

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




