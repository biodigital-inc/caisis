<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PSAAtDiagnosis" CodeFile="PSAAtDiagnosis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">
#PSAAtDiagnosisContainer table
{
    float: right;
}
#StatusContainer td
{
    vertical-align: top;
    padding-right: 12px;
}
</style>

<a name="PSAAtDiagnosis" id="PSAAtDiagnosis" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="PSA at Diagnosis"></asp:Label><br/>
<table id="PSAAtDiagnosisContainer" border="0" cellspacing="0" cellpadding="16" width="650" class="eformLargePopulatedTable" style="margin-bottom: 20px;">
 <tr >

	<td style="width: 40%;"><strong>Date</strong>&nbsp;&nbsp;
    <euc:EformTextBox Runat="server" RecordId="1"  ID="LabDateText" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   AppendToOnChange="setDefaultPSAAtDiagnosisFields();"  />
        <euc:EformHidden RecordId="1" Runat="server" ID="LabDate" Table="LabTests" Field="LabDate" />
	</td>
	<td><strong>Result</strong> (ng/ml)&nbsp;&nbsp;
		<euc:EformTextBox style="width: 60px;" id="LabResult" Table="LabTests" RecordId="1" Field="LabResult" Runat="server" ShowNumberPad="true"  AppendToOnChange="setDefaultPSAAtDiagnosisFields();" /> 
		<euc:EformTextBox style="display: none;" id="LabTest" Table="LabTests" RecordId="1" Field="LabTest" Runat="server" />
		<euc:EformTextBox style="display: none;" id="LabUnits" Table="LabTests" RecordId="1" Field="LabUnits" Runat="server" />

	</td>
  </tr>
</table>

<script type="text/javascript">
function setDefaultPSAAtDiagnosisFields()
{
    if ($('<% =LabResult.ClientID %>').value != '' || $('<% =LabDateText.ClientID %>').value != '')
    {
        $('<% =LabTest.ClientID %>').value = 'PSA';
        $('<% =LabUnits.ClientID %>').value = 'ng/ml';
        
    }
    else
    {
        $('<% =LabTest.ClientID %>').value = '';
        $('<% =LabUnits.ClientID %>').value = '';
    }
}
</script>
