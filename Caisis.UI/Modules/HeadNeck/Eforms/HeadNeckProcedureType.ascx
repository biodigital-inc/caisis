<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.HeadNeckProcedureType" CodeFile="HeadNeckProcedureType.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="HeadNeckProcedureType" id="HeadNeckProcedureType" /><span class="controlBoxTitle">Procedure Type</span>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
		
	<euc:EformRadioButtonList LookupCode="HeadNeckProcType" Table="HeadNeckProc" Field="ProcType" id="ProcType" RepeatLayout="Table" RepeatDirection="Vertical" CellSpacing="0" runat="server">
    </euc:EformRadioButtonList>
		
    </td >
</tr>   
</table>
<br/><br/><br/>
