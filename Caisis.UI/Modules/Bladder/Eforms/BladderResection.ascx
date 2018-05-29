<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.BladderResection" CodeFile="BladderResection.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="BladderResection" id="BladderResection" />
<span class="controlBoxTitle">Completeness of Bladder Resection</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>Was All of Tumor Resected?</strong>&nbsp;&nbsp;
		<euc:EformRadioButtonList Table="CystectomyProc" Field="ProcCompleteResection" LookupCode="YesNoUnknown" id="ProcCompleteResection" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr>
<tr>
	
	<td style="padding-top: 12px;">
		
		<strong>If not, provide area of incomplete gross resection:</strong> <br />
        <euc:EformCheckBox Table="CystectomyProc" Field="ProcIncompletePelvicFloor" id="ProcIncompletePelvicFloor" Value="True" Text="Pelvic Floor" runat="server" /><br />
        <euc:EformCheckBox Table="CystectomyProc" Field="ProcIncompleteSideWall" id="ProcIncompleteSideWall" Value="True" Text="Side Wall" runat="server" /><br />
        <euc:EformCheckBox Table="CystectomyProc" Field="ProcIncompleteRectum" id="ProcIncompleteRectum" Value="True" Text="Rectum" runat="server" />


	</td>	
  </tr>
 <tr >
	<td style="padding-top:12px;">
	
<strong>Confirmed by Frozen Section:</strong> <br />
		<euc:EformRadioButtonList Table="CystectomyProc" Field="ProcBladderMarginFrozen" id="ProcBladderMarginFrozen" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
			
				<asp:ListItem  >No</asp:ListItem>
				<asp:ListItem Value="Negative">Yes, Negative</asp:ListItem>
				<asp:ListItem Value="Postive">Yes, Postive</asp:ListItem>
				
		</euc:EformRadioButtonList>

	</td>
</tr>  
 <tr >
	<td style="padding-top:12px;">
	
<strong>Gross Evidence of Extravesicle Disease</strong> <br />
		<euc:EformExtendedCheckBoxList LookupCode="BladderEVD" Table="CystectomyProc" Field="ProcGrossEVD" id="ProcGrossEVD" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformExtendedCheckBoxList>

	</td>
</tr>    
  
  
  
  
  
</table>
<br/><br/>