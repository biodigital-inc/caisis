<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.CompleteResection" CodeFile="CompleteResection.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="CompleteResection" />
<span class="controlBoxTitle">Complete Resection?</span><br />

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >


				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcCompleteResection" LookupCode="YesNoUnknown" id="ProcCompleteResection" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">
				</euc:EformRadioButtonList>



        
	</td>

  </tr>
</table>
<br/><br/>
