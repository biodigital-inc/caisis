<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.PlannedType" CodeFile="PlannedType.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="PlannedType" />
<span class="controlBoxTitle">Type Planned (Converted from...)</span><br />

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >


				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcPlannedType" id="ProcPlannedType" LookupCode="OpTypeNephrectomy" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">
				</euc:EformRadioButtonList>



        
	</td>

  </tr>
</table>
<br/><br/><br/>
