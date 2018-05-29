<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bone.Eforms.HospitalizationOsteo" CodeFile="HospitalizationOsteo.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="HospitalizationOsteo" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Hospital Living Arrangments"></asp:Label><br/>
<table  width="600" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="HospitalizationBoneHtmlTable" > 


  <tr> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Admit Date</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Discharge Date</td> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Hospital</td> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Notes</td> 
  </tr>
  <tr > 
    <td height="28" ><euc:EformTextBox style="width:100px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospAdmitDateText" ID="HospAdmitDateText"  Runat="server"  TabIndex="1" ShowCalendar="true" CalcDate="true" />
 				     <euc:EformHidden                       RecordId="1"  TABLE="Hospitalizations" FIELD="HospAdmitDate"     ID="HospAdmitDate"     Runat="server"/></td>

    <td height="28" ><euc:EformTextBox style="width:100px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospDischargeDateText" ID="HospDischargeDateText"  Runat="server"  TabIndex="2" ShowCalendar="true" CalcDate="true" />
 				     <euc:EformHidden                       RecordId="1"  TABLE="Hospitalizations" FIELD="HospDischargeDate"     ID="HospDischargeDate"     Runat="server"/></td>
 
    <td height="28" ><euc:EformComboBox style="width:100px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospInstitution" ID="HospInstitution"  Runat="server"  TabIndex="3" LookupCode="Institution" /></td>
    <td height="28" ><euc:EformTextBox style="width:100px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospNotes" ID="HospNotes"  Runat="server"  TabIndex="6" ShowTextEditor="true" /></td>

  </tr>             

  <tr> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Living Arrangement (Pre)</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Living Arrangement (Post)</td> 
    <td width="20%" class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Ambulation (Pre)</td>
    <td width="20%" class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Ambulation (Post)</td>
  </tr>
 
   <tr > 
    <td height="28" ><euc:EformComboBox style="width:100px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospLivingArrangmentPre" ID="HospLivingArrangmentPre"  Runat="server"  TabIndex="4" LookupCode="HospLivingArrangment" /></td>

    <td height="28" ><euc:EformComboBox style="width:100px;" RecordID="1"  TABLE="Hospitalizations" FIELD="HospLivingArrangmentPost" ID="HospLivingArrangmentPost"  Runat="server"  TabIndex="5" LookupCode="HospLivingArrangment" /></td>

    <td>
        <euc:EformComboBox Width="100px" RecordId="1"  TABLE="Hospitalizations" FIELD="HospAmbulationPre" ID="HospAmbulationPre" LookupCode="HospAmbulation"   Runat="server" TabIndex="5"/> </td>
    <td>
        <euc:EformComboBox Width="100px" RecordId="1"  TABLE="Hospitalizations" FIELD="HospAmbulationPost" ID="HospAmbulationPost" LookupCode="HospAmbulation"   Runat="server" TabIndex="5" /> </td>

  </tr> 

</table>
<br /><br /><br />


