<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Allergies" CodeFile="Allergies.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.AllergiesHtmlTable = "AllergiesHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Allergies" /><span class="controlBoxTitle">Allergies</span><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="AllergiesHtmlTable">
  <tr> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Allergen</td>
    <td class="controlBoxDataGridHeaderFirstCol">Reaction</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td width="40%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="allergies" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Allergies', <%# DataBinder.Eval(Container.DataItem, "AllergyId") %>, 'Allergen,AllergyResponse', 'Allergies');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Allergen") %></td>
		  <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Allergen"  RefBy="Allergen" Style="width:160px;" FIELD="Allergen" RecordId="1"  TABLE="Allergies" runat="server" ID="Allergen_1"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="AllergyResponse"  RecordId="1" style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="2" Table="Allergies" Runat="server" id="Allergen_2"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="AllergyResponse"  RecordId="2" style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="3" Table="Allergies" Runat="server" id="Allergen_3"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="AllergyResponse"  RecordId="3" style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="4" Table="Allergies" Runat="server" id="Allergen_4"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="AllergyResponse"  RecordId="4"  style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="5" Table="Allergies" Runat="server" id="Allergen_5"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="AllergyResponse"  RecordId="5" style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="6" Table="Allergies" Runat="server" id="Allergen_6"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="AllergyResponse"  RecordId="6" style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="7" Table="Allergies" Runat="server" id="Allergen_7"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="AllergyResponse"  RecordId="7"  style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Allergen" RefBy="Allergen" style="width:160px;" Field="Allergen" RecordId="8" Table="Allergies" Runat="server" id="Allergen_8"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="AllergyResponse"  RecordId="8"  style="width:160px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'AllergiesHtmlTable');" />
<br/>
<br/><br/>
