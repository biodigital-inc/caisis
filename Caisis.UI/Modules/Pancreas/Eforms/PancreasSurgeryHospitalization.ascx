<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasSurgeryHospitalization" CodeFile="PancreasSurgeryHospitalization.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.HospitalizationPancreasHtmlTable = "HospitalizationPancreasHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="PancreasSurgeryHospitalization" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Hospitalization"></asp:Label><br/>
<table  width="500" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="HospitalizationPancreasHtmlTable" > 


  <tr> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Discharge Date</td> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Hospital</td> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Total ICU Stay (days)</td>
  </tr>
  <tr > 
    <td height="28" ><euc:EformTextBox style="width:100px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospDischargeDateText" ID="HospDischargeDateText"  Runat="server"  TabIndex="2" ShowCalendar="true" CalcDate="true" />
 				     <euc:EformHidden                       RecordId="1"  TABLE="Hospitalizations" FIELD="HospDischargeDate"     ID="HospDischargeDate"     Runat="server"/></td>
 
    <td height="28" ><euc:EformComboBox DropDownWidth="400px"  style="width:100px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospInstitution" ID="HospInstitution"  Runat="server"  TabIndex="3" LookupCode="Institution" /></td>
    <td height="28" ><euc:EformTextBox style="width:100px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospICUStay" ID="HospICUStay"  Runat="server"  TabIndex="4" /></td>
  </tr>             

  <tr> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Post-op RBC Transfused (units)</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Notes</td> 
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
  </tr>
 
   <tr > 
     <td>
        <euc:EformTextBox  Width="100px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpRBC_PostOp" ID="OpRBC_PostOp" Runat="server" TabIndex="10" /> </td>

    <td height="28" ><euc:EformTextBox style="width:100px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospNotes" ID="HospNotes"  Runat="server"  TabIndex="6" ShowTextEditor="true" /></td>
    <td></td>
  </tr> 

</table>
<br /><br /><br />


