<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.FrozenMargins" CodeFile="FrozenMargins.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="FrozenMargins" />

<span class="controlBoxTitle">Frozen Margins</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>Frozen Margins</strong>
				<euc:EformRadioButtonList LookupCode="BladderUrethraMarginFrozen" TABLE="NephrectomyProc" FIELD="ProcFrozenSections" id="ProcFrozenSections" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">

				</euc:EformRadioButtonList>

	</td>
</tr>
<tr>
	
	<td style="padding-top: 12px;">
		<strong>If positive, additional tissue removed</strong>&nbsp;&nbsp;

				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcAddTissue" LookupCode="YesNoUnknown" id="ProcAddTissue" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				</euc:EformRadioButtonList>

	</td>	
  </tr>
  
</table>
<br/><br/>








