<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.TumorSide" CodeFile="TumorSide.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="TumorSide" id="TumorSide" /><span class="controlBoxTitle">Tumor Side</span>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
		
	<euc:EformRadioButtonList Table="ProcedureFinding" Field="ProcFindSide" LookupCode="NodeSide" id="ProcFindSide" RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="10" runat="server">
    </euc:EformRadioButtonList>
		
		
</tr>   
</table>
<br/><br/><br/>
