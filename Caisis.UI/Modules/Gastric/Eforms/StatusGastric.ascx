<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.StatusGastric" CodeFile="StatusGastric.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="StatusGastric" /><span class="controlBoxTitle">Status</span><br/>

<table width="650" border="0" cellspacing="0" cellpadding="16" class="eformXLargePopulatedTable" >
  <tr>
    <td>
	
		<asp:Label ID="LastStatus" Runat="server" /><br/>
		<strong>Status</strong>
		
		
	  <euc:EformRadioButtonList onclick="setStatusDate();setStatusDisease();" RecordId="1" RepeatLayout="Table" LookupCode="Status,Disease,Gastric" ShowOther="true"  RepeatDirection="Vertical" RepeatColumns="3" TABLE="Status" FIELD="Status" id="Status" CellPadding="0" runat="server" >
	  </euc:EformRadioButtonList>

<br /><br />
		<strong>Disease</strong> 
		<euc:EformComboBox   DropDownWidth="500" style="width: 200px;" LookupCode="Disease" id="StatusDisease" RecordId="1" Table="Status" Field="StatusDisease" runat="server"/>



<br /><br /><br />
		<strong>Date</strong> 
	  <euc:EformTextBox Runat="server" ID="StatusDateText" RecordId="1" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
		<euc:EformHidden Runat="server" ID="StatusDate" Table="Status" Field="StatusDate" />

		<strong style="margin-left: 50px;">Physician</strong> 
		<euc:EformComboBox   DropDownWidth="300" LookupDistinct="Appointments;ApptPhysician;ApptPhysician" id="StatusPhysician" Table="Status" Field="StatusPhysician" runat="server"/>
		
<br /><br /><br />

	  <strong>Notes</strong><br/><euc:EformTextArea TextMode="MultiLine" Table="Status" Field="StatusNotes" RecordId="1" Rows="4" style="width: 600px;" Id="StatusNotes" Runat="server"></euc:EformTextArea>
<br /><br />

<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td style="width: 55%;">
            <strong>Data Source</strong><br/>
        <euc:EformRadioButtonList  RecordId="1" RepeatLayout="Table" ShowOther="true"  RepeatDirection="Vertical" RepeatColumns="2" TABLE="Status" FIELD="StatusDataSource" id="StatusDataSource" CellPadding="0" runat="server" >
            <asp:ListItem  Value="Medical Record" Text="Medical Record"  />
            <asp:ListItem  Value="Local Physician" Text="Local Physician"  />
            <asp:ListItem  Value="Patient" Text="Patient"  />
            <asp:ListItem  Value="Patient Family" Text="Patient Family"  />
            <asp:ListItem  Value="SSDI" Text="SSDI"  />
	  </euc:EformRadioButtonList>
    </td>
    <td style="vertical-align: top;">
    <strong>Data Quality</strong>&nbsp;&nbsp;<euc:EformSelect RecordId="1" LookupCode="DataQuality" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_1" style="width: 35px;" DropDownWidth="230" DropDownHeight="auto" />

    </td>
  </tr>
</table>

	  
	</td>
  </tr>
</table>
<br/>
<br/>
<br/>

<script type="text/javascript">
function setStatusDisease()
{
    var diseaseField = $('<% = StatusDisease.ClientID %>');
    var stausContainer = $('<% = Status.ClientID %>');
    
    var statusVal = getSelectedRadioButtonValGastricStatus(stausContainer);
    if (statusVal.length > 0) diseaseField.value = 'Gastric Cancer-Adenocarcinoma';
}
function getSelectedRadioButtonValGastricStatus(container)
{
	var selectedVal = '';
	var containerInputs = container.getElementsByTagName('input');
	
	for (var j=0;j<containerInputs.length;j++)
	{
		if (containerInputs[j].type == 'radio' && containerInputs[j].checked == true)
		{
			if (containerInputs[j].value.length > 0)
			{ 
				selectedVal =  containerInputs[j].value;
				break;
			}
		}
		else if (containerInputs[j].type == 'text' && containerInputs[j].value.length > 0)
		{
			selectedVal =  containerInputs[j].value;
		}
	}
	
	return selectedVal;

}
</script>
