<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.UrinaryFunctionSurvey" CodeFile="UrinaryFunctionSurvey.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Allergies" /><span class="controlBoxTitle">Allergies</span><br/>
<table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
  <tr> 
    <td width="40%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Allergen</td>
    <td class="controlBoxDataGridHeaderFirstCol">Reaction</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="allergies" runat="server"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Allergies', this);"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Allergen") %></td>
		  <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformComboBox  RefBy="Allergen" style="width:100;" Field="Allergen" RecordId="1" Table="Allergies" Runat="server" id="Allergen_1"  /></td>
    <td align="center" valign="baseline"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:120px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_1"/>&nbsp;</td>
    <td><img src="../../Images/EFormDeleteRow.gif" width="22" height="14"></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformComboBox  RefBy="Allergen" style="width:100;" Field="Allergen" RecordId="2" Table="Allergies" Runat="server" id="Allergen_2"  /></td>
    <td align="center" valign="baseline"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:120px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_2"/>&nbsp;</td>
    <td><img src="../../Images/EFormDeleteRow.gif" width="22" height="14"></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformComboBox  RefBy="Allergen" style="width:100;" Field="Allergen" RecordId="3" Table="Allergies" Runat="server" id="Allergen_3"  /></td>
    <td align="center" valign="baseline"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:120px;" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" ID="AllergyResponse_3"/>&nbsp;</td>
    <td><img src="../../Images/EFormDeleteRow.gif" width="22" height="14"></td>
  </tr>
</table>
<br/>
<br/>
<br/>
