<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.Ischemia" CodeFile="Ischemia.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="Ischemia" />
<span class="controlBoxTitle">Ischemia</span><br />

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >


				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcPartialIschemia" LookupCode="YesNoUnknown" id="ProcPartialIschemia" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">
				</euc:EformRadioButtonList>



        
	</td>

  </tr>
</table>
<br/><br/>
