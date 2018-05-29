<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.OutcomesStatusDiagnosis" CodeFile="OutcomesStatusDiagnosis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="OutcomesStatusDiagnosis" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Date of Diagnosis"></asp:Label><br/>

<table width="400" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="DiagnosisDateHtmlTable" >
  <tr>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Date</td>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Disease Type</td>
  </tr>
<tr id="Diagnosis_Date_StatusRow_21" runat="server" >
    <td class="ClinicalEformPopulatedColumn" valign="top" ><asp:Label ID="Diagnosis_Date_DateLabel_21" Runat="server" />
	
		  <euc:EformTextBox Width="1px" style="display: none;" id="Diagnosis_Date_Status_21" runat="server" RecordId="21" Table="Status" FIELD="Status" />
		  <euc:EformTextBox Width="1px" style="display: none;" id="Diagnosis_Date_StatusDate_21" runat="server" RecordId="21" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="21"  FIELD="StatusDateText" Runat="server" ID="Diagnosis_Date_StatusDateText_21" />	</td>

    <td valign="top" >
        <euc:EformExtendedCheckBoxList style="width:80px; white-space: nowrap;" RecordId="21" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_21" LookupCode="Disease,Diagnosis,DiseaseType" Runat="server" ShowOther="true" RepeatDirection="Vertical" >
        </euc:EformExtendedCheckBoxList></td>

</tr>


</table>
<br/><br/><br />

<script type="text/javascript">

    addEvents1($('<%= Diagnosis_Date_Status_21.ClientID %>'), $('<%= Diagnosis_Date_StatusDateText_21.ClientID %>'),$('<%= Diagnosis_Date_StatusDate_21.ClientID %>'),$('<%= StatusDisease_21.ClientID %>'));

    function addEvents1(statusID,dateTextID,dateID,diseaseID)
    { 
        $(dateTextID).addEvent('blur',curry(SetHiddenFields,statusID,dateTextID,dateID,diseaseID));
        $(diseaseID).addEvent('click',curry(SetHiddenFields,statusID,dateTextID,dateID,diseaseID));

    }

    function SetHiddenFields (statusID,dateTextID,dateID,diseaseID)
    {
         diseaseIDRef = diseaseID.getElementsByTagName('input');

        statusID.value = '';
        
        for (var i = 0; i < diseaseIDRef.length; i ++) {
            if (diseaseIDRef[i].checked)
                statusID.value = "Diagnosis Date";
         }
         
         if (dateTextID.value != '')
         {
            dateID.value = dateTextID.value;
            statusID.value = "Diagnosis Date";
         }
         else   
            dateID.value = dateTextID.value;
            
    }


</script>  		   