<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.UrethraMargin" CodeFile="UrethraMargin.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="UrethraMargin" id="UrethraMargin" />
<span class="controlBoxTitle">Urethra Margin</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>Urethrectomy</strong>&nbsp;&nbsp;
		<euc:EformRadioButtonList Table="CystectomyProc" Field="ProcUrethrectomy" id="ProcUrethrectomy" LookupCode="YesNoUnknown" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr>
<tr>
	
	<td style="padding-top: 12px;">
		
		<strong>Frozen Section</strong> <br />
		<euc:EformRadioButtonList LookupCode="BladderUrethraMarginFrozen" ShowOther="true" Table="CystectomyProc" Field="ProcUrethraMarginFrozen" id="ProcUrethraMarginFrozen" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>


	</td>	
  </tr>
<tr>
	
	<td style="padding-top: 12px;">
		
		<strong>Performed</strong>&nbsp;&nbsp;
		<euc:EformRadioButtonList Table="CystectomyProc" Field="ProcUrethraMargin" id="ProcUrethraMargin" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server">
			
				<asp:ListItem  >En Bloc</asp:ListItem>
				<asp:ListItem  >Separate Procedure</asp:ListItem>
		</euc:EformRadioButtonList>
	</td>	
  </tr>  
  
 <tr >
	<td style="padding-top:12px;">
	
<strong>Left Ureter Margin - Frozen Section</strong> <br />
		<euc:EformExtendedRadioButtonList ShowOther="true" Table="CystectomyProc" Field="ProcL_UreterMarginFrozen" id="ProcL_UreterMarginFrozen" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
			
				<asp:ListItem>No</asp:ListItem>
				<asp:ListItem Value="Negative"  >Yes, Negative</asp:ListItem>
				<asp:ListItem  Value="Positive" >Yes, Positive</asp:ListItem>
				
		</euc:EformExtendedRadioButtonList>

	</td>
</tr>  
 <tr >
	<td style="padding-top:12px;">
	
<strong>Right Ureter Margin - Frozen Section</strong> <br />
		<euc:EformExtendedRadioButtonList ShowOther="true" Table="CystectomyProc" Field="ProcR_UreterMarginFrozen" id="ProcR_UreterMarginFrozen" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
			
				<asp:ListItem>No</asp:ListItem>
				<asp:ListItem Value="Negative"  >Yes, Negative</asp:ListItem>
				<asp:ListItem  Value="Positive" >Yes, Positive</asp:ListItem>
				
		</euc:EformExtendedRadioButtonList>

	</td>
</tr>   
  
  
  
  
  
</table>
<br/><br/><br/>
