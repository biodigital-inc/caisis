<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.ExcisionTechnique" CodeFile="ExcisionTechnique.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="ExcisionTechnique" />
<span class="controlBoxTitle">Excision Technique</span><br />

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >


				<euc:EformExtendedCheckBoxList LookupCode="KidneyExcisionTechnique" TABLE="NephrectomyProc" FIELD="ProcExcisionTechnique" id="ProcExcisionTechnique" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">

				</euc:EformExtendedCheckBoxList>



        
	</td>

  </tr>
</table>
<br/><br/>
