<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.KidneyTumorLocation" CodeFile="KidneyTumorLocation.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="KidneyTumorLocation" />
<span class="controlBoxTitle">Tumor Location</span><br />

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
				<euc:EformExtendedCheckBoxList LookupCode="KidneyTumorLocation" TABLE="NephrectomyProc" ShowOther="true" FIELD="ProcTumorLocation" id="ProcTumorLocation" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">
				</euc:EformExtendedCheckBoxList>
	</td>

  </tr>
</table>
<br/><br/><br/>
