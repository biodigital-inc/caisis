<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Encounter" CodeFile="Encounter.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="Encounter" /><span class="controlBoxTitle">Social History</span>
<table width="500" border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
  <tr>
		<td  class="controlBoxDataGridTitleColumn">Date</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">KPS</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
  </tr>
  <tr>
	 <td><euc:EformHidden TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate"/>
		<euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:100;" TABLE="Encounters" FIELD="EncDateText" Runat="server" ID="EncDateText"/></td>

	<td>
		<euc:EformTextBox style="width:100;" ShowNumberPad="True" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="EncKPS"/></td>
	<td>
		<euc:EformTextBox style="width:240;" TABLE="Encounters" FIELD="EncNotes" Runat="server" ID="EncNotes"/></td>
  </tr>
  
</table><br>