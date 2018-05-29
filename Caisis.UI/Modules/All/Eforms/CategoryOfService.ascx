<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.CategoryOfService" CodeFile="CategoryOfService.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">

table.CategoryOfServiceTable1
{ 
    width: 200px;
}
table.CategoryOfServiceTable1 td
{ 
    height: 120px;
    vertical-align: top;
    padding: 10px 0px 10px 0px;
    font-weight: bold;
    border-bottom: solid 1px #cccccc;
}
table.CategoryOfServiceTable2
{ 

}
table.CategoryOfServiceTable2 td
{ 
    height: 120px;
    vertical-align: top;
    padding: 10px 10px 10px 10px;
    border-bottom: solid 1px #cccccc;
}
table.CategoryOfServiceTable2 ul
{ 
    margin-top: 6px;
    margin-left: 0px;
}
table.CategoryOfServiceTable2 li
{ 
    margin-left: 18px;
}
span.cptCode
{
    display: block;
    color: #666666;
    font-size: 11px;
    font-weight: normal;
}



</style>

<script type="text/javascript">

</script>

<a name="CategoryOfService"  />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Category of Service" /><br/>
<table border="0" cellspacing="0"  width="700"  class="eformLargePopulatedTable" id="CategoryOfServiceOuterTable" >
  <tr>
    <td style="padding: 0px 0px 0px 0px;">
        <table border="0" cellspacing="0"  class="CategoryOfServiceTable1" >
           <euc:EformRadioButtonGroup Table="NoTable" Field="CategoryOfService" id="CategoryOfServiceField" GroupName="CategoryOfService_Group" runat="server">
              <tr>
                <td style="height: 145px;"><euc:EformRadioButton Id="CategoryOfService_NewPatientEncounter" Value="New Patient Encounter (CPT 99201-99205)" runat="server"/></td>
                <td><label for="<% = CategoryOfService_NewPatientEncounter.ClientID %>">New Patient Encounter<span class="cptCode">(CPT 99201-99205)</span></label></td>
              </tr>
              <tr>
                <td><euc:EformRadioButton Id="CategoryOfService_OfficeConsultation" Value="Office Consultation (CPT 99241- 99245)" runat="server"/></td>
                <td><label for="<% = CategoryOfService_OfficeConsultation.ClientID %>">Office Consultation<span class="cptCode">(CPT 99241- 99245)</span></label></td>
              </tr>
              <tr>
                <td><euc:EformRadioButton Id="CategoryOfService_EstablishedPatientVisit" Value="Established Patient Visit (CPT 99212-99215)" runat="server"/></td>
                <td><label for="<% = CategoryOfService_EstablishedPatientVisit.ClientID %>">Established Patient Visit<span class="cptCode">(CPT 99212-99215)</span></label></td>
              </tr>
	        </euc:EformRadioButtonGroup>
        </table>
    </td>
    <td style="padding: 0px 0px 0px 0px;">
        <table border="0" cellspacing="0"  class="CategoryOfServiceTable2">
              <tr>
                <td style="height: 145px;">Use for patients who have not been see by anyone in your billing group in the last 3 years AND
                     <ul>
                        <li>Are self referred (includes those referred by friend or patient)</li>
                        <li>Do not have physician asking for your advice/opinion (see PIF sheet or PAS info)</li>
                        <li>Are referred solely for management and/or treatment of aspect of care</li>
                     </ul>
                </td>
              </tr>
              <tr>
                <td>Office Consultation is requested 
                <%-- by <euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:140px;"  TABLE="NoTable" FIELD="OfficeConsultationRequestedBy" Runat="server" ID="OfficeConsultationRequestedBy"/> MD/PA/NP--%>
                    for my advice &amp; opinion <br />regarding this patient’s <euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:180px;"  TABLE="NoTable" FIELD="OfficeConsultationRequestedReason" Runat="server" ID="OfficeConsultationRequestedReason"/><br />
                    <span style="display: block; font-size: 1px; line-height: 20px;">&nbsp;</span>
                    <span style="width: 120px; font-weight: bold;">Requesting M.D.:</span><euc:EformComboBox LookupDistinct="Appointments;ApptPhysician;ApptPhysician" DropDownWidth="350" ShowCalendar="False" CalcDate="False" style="width:200px;"  TABLE="NoTable" FIELD="RequestingMD_Inside" Runat="server" ID="RequestingMD_Inside" /> (MSKCC)<br />
                    <span style="width: 120px;">&nbsp;</span><euc:EformComboBox LookupDistinct="Physicians;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'');COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'')" DropDownWidth="350" ShowCalendar="False" CalcDate="False" style="width:200px;"  TABLE="NoTable" FIELD="RequestingMD_Outside" Runat="server" ID="RequestingMD_Outside"/> (Non-MSKCC) 
                </td>
              </tr>
              <tr>
                <td>Use for patients who
                    <ul>
                    <li>Are seeing you for the first time for management or treatment (Not a consult) and have been seen
                    by someone else in your billing group in the last 3 years</li>
                    <li>Are seeing you for follow-up care/visits</li>
                    </ul>
                 </td>
              </tr>
        </table>
	</td>
  </tr>
</table>
<br/><br/><br/>