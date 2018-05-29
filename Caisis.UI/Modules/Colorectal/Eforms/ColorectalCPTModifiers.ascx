<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.ColorectalCPTModifiers" CodeFile="ColorectalCPTModifiers.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="ColorectalCPTModifiers" />
<span class="controlBoxTitle">CPT Modifiers</span><br />

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >


				<euc:EformExtendedCheckboxList LookupCode="CPT_Modifiers" ShowOther="true" TABLE="Procedures" RecordId="1" FIELD="ProcCPT_Modifier" id="ProcCPT_Modifier" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">
				</euc:EformExtendedCheckboxList>



        
	</td>

  </tr>
</table>
<br/><br/>