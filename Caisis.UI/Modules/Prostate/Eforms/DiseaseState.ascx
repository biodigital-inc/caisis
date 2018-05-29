<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.DiseaseState" CodeFile="DiseaseState.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="DiseaseState" /><span class="controlBoxTitle">Disease State </span><br>
<script type="text/javascript">
function setStatusFields()
{
    var EncDateText = $('<% =EncDateText.ClientID %>');
    var EncDate = $('<% =EncDate.ClientID %>');
    var StatusDateText = $('<% =StatusDateText.ClientID %>');
    var StatusDate = $('<% =StatusDate.ClientID %>');
    
    if (StatusDateText.value == '')
    {
        if (EncDateText.value != '') StatusDateText.value = EncDateText.value;
        if (EncDate.value != '') StatusDate.value = EncDate.value;
    }
    
    var StatusDisease = $('<% =StatusDisease.ClientID %>');
    StatusDisease.value = 'Prostate Cancer';
    
}
</script>


<euc:EformTextBox style="display: none;" id="EncDateText" Table="Encounters" Field="EncDateText" Runat="server"/>
<euc:EformTextBox style="display: none;" id="EncDate" Table="Encounters" Field="EncDate" Runat="server"/>


<table width="650" border="0" cellspacing="0" cellpadding="5" class="eformLargePopulatedTable" >
  <tr>
    <td nowrap>
	
		<asp:Label ID="LastStatus" Runat="server" /><br/>
		<strong>Status:</strong>
        <euc:EformTextBox style="display: none;" id="StatusDisease" Table="Status" Field="StatusDisease" Runat="server"/>
<%--	  <euc:EformHidden Runat="server" ID="StatusDisease" Table="Status" Field="StatusDisease" Value="Prostate Cancer" />
--%>		
	  <euc:EformRadioButtonList onclick="setStatusFields();" RepeatLayout="Flow"  RepeatDirection="Horizontal" TABLE="Status" FIELD="Status" id="Status" CellPadding="0" runat="server">
				<asp:ListItem Value="No Recurrence">Stable</asp:ListItem>
				<asp:ListItem Value="Active Surveillance">Active Surveillance</asp:ListItem>
				<asp:ListItem Value="No Evidence of Disease">NED</asp:ListItem>
				<asp:ListItem Value="Biochemical Recurrence">BCR</asp:ListItem>
				<asp:ListItem Value="Local Recurrence">LCR</asp:ListItem>
				<asp:ListItem Value="Distant Metastasis">Mets</asp:ListItem>
				

	  </euc:EformRadioButtonList>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<strong>Date:</strong> 
	  <euc:EformTextBox Runat="server" ID="StatusDateText" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
		<euc:EformHidden Runat="server" ID="StatusDate" Table="Status" Field="StatusDate" />
	
	</td>
  </tr>
</table>
<br/>
<br/>
<br/>
