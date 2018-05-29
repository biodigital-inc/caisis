<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.RenalHypothermia" CodeFile="RenalHypothermia.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="RenalHypothermia" id="RenalHypothermia" />
<span class="controlBoxTitle">Renal Hypothermia</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>Hypothermia</strong>&nbsp;&nbsp;
                <euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcHypothermia" LookupCode="YesNoUnknown" id="ProcHypothermia" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				</euc:EformRadioButtonList>		

	</td>
</tr>
<tr>
	
	<td style="padding-top: 12px;">
		<strong>Renal Hypothermia Type</strong>

                <euc:EformExtendedRadioButtonList LookupCode="KidneyHypothermia" ShowOther="true" TABLE="NephrectomyProc" FIELD="ProcRenalHypothermiaType" id="ProcRenalHypothermiaType" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">
				</euc:EformExtendedRadioButtonList>		

	</td>	
  </tr>

  
  
</table>
<br/><br/>
