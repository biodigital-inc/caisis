<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.DiseaseState_Kidney" CodeFile="DiseaseState_Kidney.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="DiseaseState_Kidney" /><span class="controlBoxTitle">Disease State</span>

<span style="margin-left: 40px;">Change?&nbsp;&nbsp;</span><euc:EformRadioButtonList RepeatLayout="Flow"  RepeatDirection="Horizontal" TABLE="NoTable" FIELD="DiseaseState_Change" id="DiseaseState_Change"  runat="server" Uncheckable="true" >
			<asp:ListItem Value="Yes">Yes</asp:ListItem>
		    <asp:ListItem  Value="No">No</asp:ListItem>
</euc:EformRadioButtonList>


<br/>
<table width="650" border="0" cellspacing="0" cellpadding="5" class="eformLargePopulatedTable" >
  <tr>
    <td style="white-space: nowrap; width: 48%; vertical-align: top;">
	<asp:Repeater ID="StatusRpt" runat="server">
	<HeaderTemplate><table cellspacing="0" style="margin-top: 8px; margin-bottom: 20px; background-color: #e8e8e8; border: solid 1px #cccccc;"></HeaderTemplate>
	<ItemTemplate><tr  class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Status', <%# Eval("StatusId") %>, 'StatusDateText,StatusDate,Status,StatusDisease,StatusNotes','DiseaseState_Kidney');">
	                <td style="padding: 5px;"><%# Eval("StatusDateText") %></td>
	                <td style="padding: 5px;"><%# Eval("Status") %></td>
	</tr>
	</ItemTemplate>
	<FooterTemplate></table></FooterTemplate>
</asp:Repeater>
    <span id="StatusMsg" runat="server"  style="padding: 14px; display: block; width: 120px; background-color: #e8e8e8; border: solid 1px #cccccc;">No prior kidney status has<br />been recorded for this patient.</span>
	</td>
<td>
		<strong>Status:</strong>
        <euc:EformTextBox style="display: none;" id="StatusDisease" Table="Status" Field="StatusDisease" Runat="server"/>
<%--	  <euc:EformHidden Runat="server" ID="StatusDisease" Table="Status" Field="StatusDisease" Value="Prostate Cancer" />
--%>		
	  <euc:EformRadioButtonList onclick="showMetsSite();" RepeatLayout="Table" RepeatDirection="Vertical" TABLE="Status" FIELD="Status" id="Status" CellPadding="0" runat="server">
				<asp:ListItem Value="No Cancer Diagnosis">No Cancer Diagnosis</asp:ListItem>
				<asp:ListItem Value="No Evidence of Disease">NED</asp:ListItem>
				<asp:ListItem Value="Local Recurrence">Local Recurrence</asp:ListItem>
				<asp:ListItem Value="Contralateral Recurrence">Contralateral Recurrence</asp:ListItem>
				<asp:ListItem Value="Mets">Mets</asp:ListItem>
	  </euc:EformRadioButtonList>
	  
	  
	  <span id="MetsSiteContainer" style="padding-left: 22px;">
	  Site: 
	  <euc:EformTextBox id="StatusNotes" Table="Status" Field="StatusNotes" Runat="server" style="width: 100px;" />
	  </span>
	  
	  
	</td>
<td style="vertical-align: top;">

		<strong>Date:</strong> 
	  <euc:EformTextBox Runat="server" ID="StatusDateText" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
		<euc:EformHidden Runat="server" ID="StatusDate" Table="Status" Field="StatusDate" />
	
	</td>
  </tr>
</table>
<script type="text/javascript">
function showMetsSite()
{
    var MetsSiteContainer =  $('MetsSiteContainer');
    var MetsSiteField =  $('<% = StatusNotes.ClientID %>');
    var selectedStatus = RetrieveRadioBtnListSelectedValues($('<% = Status.ClientID %>'), "TABLE");
    if (selectedStatus == 'Mets')
    {
//        MetsSiteContainer.style.display = 'block';
          enableAllElementsContainedInNode(MetsSiteContainer); 
          MetsSiteField.focus();
    }
    else
    {
//        MetsSiteContainer.style.display = 'none';
        clearAndDisableAllElementsContainedInNode(MetsSiteContainer); 
    }
    
}
showMetsSite();
</script>
<br/>
<br/>
<br/>
