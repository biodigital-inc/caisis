<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.ColorectalPathStage" CodeFile="ColorectalPathStage.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="ColorectalPathStage" id="ColorectalPathStage" />
<span class="controlBoxTitle">Pathologic TNM Staging (If resected)</span><br/>

<euc:EformHidden Table="PathologyStageGrade" RecordId="3"  Field="PathStageDisease" id="PathStageDisease" runat="server" Value="Colorectal" />

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>Path T Stage </strong>
		
		<euc:EformRadioButtonList LookupCode="StagePath_Colorectal_02_T" Table="PathologyStageGrade" RecordId="3" Field="PathStageT" id="PathStageT" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="7" runat="server" EnableHiddenOnUIEvent="PathStageDisease" />		

	</td>
</tr>
<tr>
	
	<td style="padding-top: 18px;">
		
		<strong>Path N Stage </strong>
		
		<euc:EformRadioButtonList LookupCode="StagePath_Colorectal_02_N" Table="PathologyStageGrade" RecordId="3" Field="PathStageN" id="PathStageN" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="7" runat="server" EnableHiddenOnUIEvent="PathStageDisease" />		

	</td>	
  </tr>
 <tr >
	<td style="padding-top:18px;">
		<strong>Path M Stage </strong>
		
		<euc:EformRadioButtonList LookupCode="StagePath_Colorectal_02_M" Table="PathologyStageGrade" RecordId="3" Field="PathStageM" id="PathStageM" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="7" runat="server" EnableHiddenOnUIEvent="PathStageDisease" />		
	</td>
</tr>  


</table>
<br/><br/><br/>
