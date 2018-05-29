<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.AllergiesWithNKAAndUnchanged" CodeFile="AllergiesWithNKAAndUnchanged.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.AllergiesHtmlTable = "AllergiesHtmlTable";
	
	function toggleAllergyView()
	{
	    var Allergies_NKA = $('<% = Allergies_NKA.ClientID %>');
	    var Allergies_UnchangedSinceLastVisit = $('<% = Allergies_UnchangedSinceLastVisit.ClientID %>');
	    var AllergiesDataEntryRows = jQuery('#AllergiesHtmlTable .AllergiesDataEntryRow');
	    var AllergiesNoDataEntryRow = jQuery('#AllergiesHtmlTable #AllergiesNoDataEntryRow');
	 
	    var showDataEntryFields = true;
	    if (Allergies_NKA.checked || Allergies_UnchangedSinceLastVisit.checked) showDataEntryFields = false;
	 
	    
        for (var i = 0; i < AllergiesDataEntryRows.length; i++)
        {   
            var currentRow = jQuery(AllergiesDataEntryRows[i]);
            if (!showDataEntryFields)
            {
                currentRow.addClass('hidden');
                clearAllElementsContainedInNode(AllergiesDataEntryRows[i]);
            }
            else { currentRow.removeClass('hidden'); }
        }
        
        AllergiesNoDataEntryRow[0].className = showDataEntryFields ? 'hidden' : '';
        $('AllergiesAddRowButton').style.display = showDataEntryFields ? '' : 'none';
        
	}
	
</script>


<style type="text/css">
#readOnlyMeds
{
    position: absolute;
    z-index: 100;
    margin-left: 400px;
    border: solid 1px #aaaaaa;
    border-collapse: collapse;
    -moz-border-radius: 5px;
    border-radius: 5px;
    margin-top: 9px;
    
    -moz-box-shadow: 0 0 3px 3px #aaa;
    -webkit-box-shadow: 0 0 3px 5px #aaa;
    box-shadow: 0 0 3px 3px #aaa;
}
    
#ReadOnlyMedsHtmlTable
{
    border-collapse: collapse;
}
#ReadOnlyMedsHtmlTable td
{
    border-bottom: solid 1px #dddddd;
    border-collapse: collapse;
    background-color: #ffffff;
    color: #333333;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	line-height:  normal;
	font-weight: normal;
	max-width: 200px;
	text-indent: -16px;
	padding-left: 19px;
}
#ReadOnlyMedsHtmlTable th
{
    text-align: left;
    background-color: #8d2a2c;
    color: #ffffff;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	line-height:  normal;
	font-weight: bold;
	padding: 2px;
}
#AllergiesHtmlTable
{
    width: 400px;
}
#AllergiesHtmlTable tr.AllergiesDataEntryRow
{
}
#AllergiesHtmlTable tr.hidden
{
    display: none;
}



</style>



<a name="AllergiesWithNKAAndUnchanged" /><%--<div id="readOnlyMeds">
<table cellspacing="0"  cellpadding="0" id="ReadOnlyMedsHtmlTable">
  <tr> 
    <th id="readOnlyMedsTitle" runat="server">Current Medications</th>
    <th id="noReadOnlyMedsTitle" runat="server" visible="false">Current Medications: None Listed</th>
  </tr>
  <asp:Repeater ID="medicationsAll" runat="server"  > 
	<ItemTemplate> 
		<tr > 
			<td ><%# DataBinder.Eval(Container.DataItem, "MedDateText") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "Medication") %>, <%# DataBinder.Eval(Container.DataItem, "MedDose") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedUnits") %>, <%# DataBinder.Eval(Container.DataItem, "MedSchedule") %></td>
        </tr>
	</ItemTemplate>
  </asp:Repeater>
</table>
</div>--%>

<span class="controlBoxTitle">Allergies</span>

<euc:EformCheckBox runat="server" Table="NoTable" Field="Allergies_NKA" id="Allergies_NKA" Value="true" onclick="toggleAllergyView();" style="margin-left: 40px;" />NKA<euc:EformCheckBox runat="server" Table="NoTable" Field="Allergies_UnchangedSinceLastVisit" id="Allergies_UnchangedSinceLastVisit" Value="true" onclick="toggleAllergyView();" style="margin-left: 40px;" />Unchanged Since Last Visit
<br/>






<table cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="AllergiesHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Allergen</td>
    <td class="controlBoxDataGridHeaderFirstCol">Reaction</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
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
  
  
  

  <tr class="AllergiesDataEntryRow" >
    <td  class="ClinicalEformGridColumnOne"><euc:EformComboBox   LookupCode="Allergen"  RefBy="Allergen" style="width:160px;" DropDownWidth="160" FIELD="Allergen" RecordId="1"  TABLE="Allergies" runat="server" ID="Allergen_1"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox   LookupCode="AllergyResponse"  RecordId="1" style="width:160px;" DropDownWidth="160" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="AllergiesDataEntryRow" > 
    <td  class="ClinicalEformGridColumnOne"><euc:EformComboBox   LookupCode="Allergen" RefBy="Allergen" style="width:160px;" DropDownWidth="160" Field="Allergen" RecordId="2" Table="Allergies" Runat="server" id="Allergen_2"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox   LookupCode="AllergyResponse"  RecordId="2" style="width:160px;" DropDownWidth="160" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="AllergiesDataEntryRow" style="display: none;"> 
    <td  class="ClinicalEformGridColumnOne"><euc:EformComboBox   LookupCode="Allergen" RefBy="Allergen" style="width:160px;" DropDownWidth="160" Field="Allergen" RecordId="3" Table="Allergies" Runat="server" id="Allergen_3"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox   LookupCode="AllergyResponse"  RecordId="3" style="width:160px;" DropDownWidth="160" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="AllergiesDataEntryRow" style="display: none;"> 
    <td  class="ClinicalEformGridColumnOne"><euc:EformComboBox   LookupCode="Allergen" RefBy="Allergen" style="width:160px;" DropDownWidth="160" Field="Allergen" RecordId="4" Table="Allergies" Runat="server" id="Allergen_4"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox   LookupCode="AllergyResponse"  RecordId="4"  style="width:160px;" DropDownWidth="160" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="AllergiesDataEntryRow" style="display: none;"> 
    <td  class="ClinicalEformGridColumnOne"><euc:EformComboBox   LookupCode="Allergen" RefBy="Allergen" style="width:160px;" DropDownWidth="160" Field="Allergen" RecordId="5" Table="Allergies" Runat="server" id="Allergen_5"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox   LookupCode="AllergyResponse"  RecordId="5" style="width:160px;" DropDownWidth="160" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="AllergiesDataEntryRow" style="display: none;"> 
    <td  class="ClinicalEformGridColumnOne"><euc:EformComboBox   LookupCode="Allergen" RefBy="Allergen" style="width:160px;" DropDownWidth="160" Field="Allergen" RecordId="6" Table="Allergies" Runat="server" id="Allergen_6"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox   LookupCode="AllergyResponse"  RecordId="6" style="width:160px;" DropDownWidth="160" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="AllergiesDataEntryRow" style="display: none;"> 
    <td  class="ClinicalEformGridColumnOne"><euc:EformComboBox   LookupCode="Allergen" RefBy="Allergen" style="width:160px;" DropDownWidth="160" Field="Allergen" RecordId="7" Table="Allergies" Runat="server" id="Allergen_7"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox   LookupCode="AllergyResponse"  RecordId="7"  style="width:160px;" DropDownWidth="160" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="AllergiesDataEntryRow" style="display: none;"> 
    <td  class="ClinicalEformGridColumnOne"><euc:EformComboBox   LookupCode="Allergen" RefBy="Allergen" style="width:160px;" DropDownWidth="160" Field="Allergen" RecordId="8" Table="Allergies" Runat="server" id="Allergen_8"  /></td>
    <td style="white-space:nowrap; vertical-align:baseline;"><euc:EformComboBox   LookupCode="AllergyResponse"  RecordId="8"  style="width:160px;" DropDownWidth="160" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr id="AllergiesNoDataEntryRow"> 
    <td  colspan="4" class="ClinicalEformGridColumnOne" style="text-align: center; padding: 20px;">No New Allergies</td>
  </tr>
</table>
<img id="AllergiesAddRowButton" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'AllergiesHtmlTable');" />

<script type="text/javascript">

toggleAllergyView();
</script>
<br/>
<br/><br/>
