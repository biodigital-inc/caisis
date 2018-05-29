<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.DiseaseState_GU_2" CodeFile="DiseaseState_GU_2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="DiseaseState_GU_2" /><span class="controlBoxTitle">Disease State </span><br/>
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


<table border="0" cellspacing="0" cellpadding="16" class="eformLargePopulatedTable" >
  <tr id="LastStatusDisplayRow" runat="server" visible="false">
    <td colspan="2" style="padding-top: 10px; padding-bottom: 16px; font-weight: bold; border-bottom: solid 1px #dddddd;">
	
		<asp:Label ID="LastStatus" Runat="server" />
		
		
    </td>
    </tr>
    <tr>
    <td style="vertical-align: top;">
		<strong>Status:</strong>
        <euc:EformTextBox style="display: none;" id="StatusDisease" Table="Status" Field="StatusDisease" RecordId="1" Runat="server"/>
	  <euc:EformDropDownList onclick="setStatusFields();"  TABLE="Status" FIELD="Status" RecordId="1" id="Status" CellPadding="0" runat="server">
				<asp:ListItem Value=""> </asp:ListItem>
				<asp:ListItem Value="No Cancer DX">No Cancer DX</asp:ListItem>
				<asp:ListItem Value="Localized">Localized</asp:ListItem>
				<asp:ListItem Value="Rising PSA: Non-Castrate">Rising PSA: Non-Castrate</asp:ListItem>
				<asp:ListItem Value="Rising PSA: Castrate">Rising PSA: Castrate</asp:ListItem>
				<asp:ListItem Value="Clin Mets: Non-Castrate">Clin Mets: Non-Castrate</asp:ListItem>
				<asp:ListItem Value="Clin Mets: Castrate">Clin Mets: Castrate</asp:ListItem>
	  </euc:EformDropDownList>
    </td>
    <td style="vertical-align: top; padding-left: 40px;">
		<strong>Date:</strong> 
	  <euc:EformTextBox Runat="server" ID="StatusDateText" TABLE="Status" FIELD="StatusDateText" RecordId="1" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	  <euc:EformHidden Runat="server" ID="StatusDate" Table="Status" Field="StatusDate" RecordId="1" />
	</td>
  </tr>
</table>
<br/>
<br/>
<br/>
