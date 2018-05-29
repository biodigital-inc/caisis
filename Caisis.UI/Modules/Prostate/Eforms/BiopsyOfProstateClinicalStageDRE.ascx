<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateClinicalStageDRE" CodeFile="BiopsyOfProstateClinicalStageDRE.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.ClinicalStagesHtmlTable = "ClinicalStagesHtmlTable";
</script>
<script>
	// we need to customize showFirstAdditionalRow(...) for allergies
	function clinicalstages_showFirstAdditionalRow(linkReference, tableId) {
		var rowShown = false;
		var hideWidget = true;
		var table = document.getElementById(tableId);
		for (i = 0; i < table.rows.length; i++) {
			var row = table.rows[i];
			
			// skip rows with an id containing "_tr_"
			var rowId = row.id;
			if (rowId != null && rowId.indexOf('_tr_') != -1)
				continue;
				
			if (rowShown == false && row.style['display'] == 'none') {
				row.style['display'] = '';
				rowShown = true;
			} else if (rowShown == true && row.style['display'] == 'none') {
				hideWidget = false;
			}
		}
		
		if (hideWidget) {
			linkReference.style['display'] = 'none';
		}
		return false;
	}
	
	function modTaggedClinicalStages(mode)
	{
		var table = document.getElementById('ClinicalStagesHtmlTable');
		for (i = 0; i < table.rows.length; i++) {
			var row = table.rows[i];
			var rowId = row.id;
			if (rowId != null && rowId.indexOf('_tr_') != -1) {
				row.style.display = mode;
			}
		}
	}
	
	function showTaggedClinicalStages(linkRef)
	{
		modTaggedClinicalStages('block');
		linkRef.style.display = 'none';
		return false;
	}
	
	
	function toggleTaggedClinicalStages(cbox)
	{
		if (cbox.checked)
		{
//			modTaggedMedications('none');
			document.getElementById('clinicalstagesCheckboxMsg').innerHTML = '<strong>Loading...  Please wait.</strong>';
			document.dataForm.submit();  //need to submit to switch medication view without losing changes
		}
		else
		{
			//modTaggedAllergies('block');
			modTaggedClinicalStages('none');
		}
		
		return false;
	}
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="BiopsyOfProstateClinicalStageDRE" id="BiopsyOfProstateClinicalStageDRE"/>
<span class="controlBoxTitle">Clinical Stages</span>
<table border="0" width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ClinicalStagesHtmlTable">
  <tr> 
    <td width="15%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Disease</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Staging System</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol">Stage T</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr> 
  
  <asp:Repeater ID="clinicalstagesAll" runat="server" OnItemDataBound="DecorateClinicalStagesAll" >
	<ItemTemplate> 
		<tr id="_tr_" runat="server" class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageDisease") %></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageSystem") %></td>
		    <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageDateText") %></td>
		    <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageT") %></td>
		    <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageNotes") %></td>
		    <td class="ClinicalEformPopulatedColumn"><img align="left" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
</table>
<br/>

<a name="ClinicalStageDRE" />
<span class="controlBoxTitle" style="font-size: 12px;">Add Clinical Stage by DRE</span>
<table border="0" cellspacing="0" cellpadding="2" width="650" class="eformLargePopulatedTable">
   <tr >
	<td width="80%" style="padding-top: 20px;padding-bottom: 20px;">	
		<euc:EformRadioButtonList Table="ClinicalStages" Field="ClinStageT" id="ClinStageT" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="7" runat="server" EnableHiddenOnUIEvent="ClinStageDate,ClinStageDateText,ClinStageDisease,ClinStageSystem,ClinStageQuality,ClinStageDataSource" >	
		    <asp:ListItem  >T0</asp:ListItem>
		    <asp:ListItem  >T1c</asp:ListItem>
			<asp:ListItem  >T2a</asp:ListItem>
		    <asp:ListItem  >T2b</asp:ListItem>
			<asp:ListItem  >T2c</asp:ListItem>
			<asp:ListItem  >T3a</asp:ListItem>
			<asp:ListItem  >T3b</asp:ListItem>
			<asp:ListItem  >T3c</asp:ListItem>		
		</euc:EformRadioButtonList> 	
		<euc:EformHidden Table="ClinicalStages" Field="ClinStageQuality" id="ClinStageQuality" runat="server" Value="STD" />
        <euc:EformHidden Table="ClinicalStages" Field="ClinStageSystem " id="ClinStageSystem" runat="server" Value="UICC_02" />
        <euc:EformHidden Table="ClinicalStages" Field="ClinStageDisease" id="ClinStageDisease" runat="server" Value="Prostate" />
        <euc:EformHidden Table="ClinicalStages" Field="ClinStageDataSource" id="ClinStageDataSource" runat="server" Value="EForm" />
        <euc:EformHidden Runat="server" ID="ClinStageDate" Table="ClinicalStages" Field="ClinStageDate" />
        <euc:EformHidden Runat="server" ID="ClinStageDateText" Table="ClinicalStages" Field="ClinStageDateText" />
	</td>
  </tr>
 </table>
<br/><br/>