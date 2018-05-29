<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateAllergies" CodeFile="BiopsyOfProstateAllergies.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.AllergiesHtmlTable = "AllergiesHtmlTable";
</script>
<script>
	// we need to customize showFirstAdditionalRow(...) for allergies
	function allergies_showFirstAdditionalRow(linkReference, tableId) {
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
	
	function modTaggedAllergies(mode)
	{
		var table = document.getElementById('AllergiesHtmlTable');
		for (i = 0; i < table.rows.length; i++) {
			var row = table.rows[i];
			var rowId = row.id;
			if (rowId != null && rowId.indexOf('_tr_') != -1) {
				row.style.display = mode;
			}
		}
	}
	
	function showTaggedAllergies(linkRef)
	{
		modTaggedAllergies('block');
		linkRef.style.display = 'none';
		return false;
	}
	
	
	function toggleTaggedAllergies(cbox)
	{
		if (cbox.checked)
		{
//			modTaggedMedications('none');
			document.getElementById('allergiesCheckboxMsg').innerHTML = '<strong>Loading...  Please wait.</strong>';
			document.dataForm.submit();  //need to submit to switch medication view without losing changes
		}
		else
		{
			//modTaggedAllergies('block');
			modTaggedAllergies('none');
		}
		
		return false;
	}
</script>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="BiopsyOfProstateAllergies" id="BiopsyOfProstateAllergies" />
<span class="controlBoxTitle">Allergies</span>
<table width="450" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px; margin-bottom:5px;">

  <tr>
    <td style="padding-right:20px;"><euc:EformCheckbox TABLE="Allergies" FIELD="Allergen" Runat="server" ID="Allergen_9" RecordId="9" Value="NKA" />&nbsp;NKA &nbsp;</td>
    <td style="padding-right:20px;"><euc:EformCheckbox TABLE="NoTable" FIELD="AllergiesUnchanged" Runat="server" ID="AllergiesUnchangedSinceLastVisit" Value="Allergies unchanged since last visit" />&nbsp;Unchanged since last visit &nbsp;</td>
    <td align="right"><input type="checkbox" checked="checked" onclick="toggleTaggedAllergies(this);" />
        <span id = "allergiesCheckBoxMsg">Show Current Allergies</span></td>
  </tr>
</table>

<table border="0" width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="AllergiesHtmlTable">
  <tr> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Allergen</td>
    <td class="controlBoxDataGridHeaderFirstCol">Reaction</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="allergiesAll" runat="server" OnItemDataBound="DecorateAllergiesAll" >
	<ItemTemplate> 
		<tr id="_tr_" runat="server" class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Allergen") %></td>
		    <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %></td>
		    <td class="ClinicalEformPopulatedColumn"><img align="left" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  

  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox LookupCode="Allergen"  RefBy="Allergen" Style="width:160px;" FIELD="Allergen" RecordId="1"  TABLE="Allergies" runat="server" ID="Allergen_1"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox LookupCode="AllergyResponse"  RecordId="1" style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="2" Table="Allergies" Runat="server" id="Allergen_2"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox LookupCode="AllergyResponse"  RecordId="2" style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="3" Table="Allergies" Runat="server" id="Allergen_3"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox LookupCode="AllergyResponse"  RecordId="3" style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="4" Table="Allergies" Runat="server" id="Allergen_4"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox LookupCode="AllergyResponse"  RecordId="4"  style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="5" Table="Allergies" Runat="server" id="Allergen_5"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox LookupCode="AllergyResponse"  RecordId="5" style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="6" Table="Allergies" Runat="server" id="Allergen_6"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox LookupCode="AllergyResponse"  RecordId="6" style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="7" Table="Allergies" Runat="server" id="Allergen_7"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox LookupCode="AllergyResponse"  RecordId="7"  style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="8" Table="Allergies" Runat="server" id="Allergen_8"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox LookupCode="AllergyResponse"  RecordId="8"  style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return allergies_showFirstAdditionalRow(this,'AllergiesHtmlTable');" />
<br/>
<br/><br/>
