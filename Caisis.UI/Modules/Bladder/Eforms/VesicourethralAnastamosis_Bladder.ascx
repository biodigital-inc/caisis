<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.VesicourethralAnastamosis_Bladder" CodeFile="VesicourethralAnastamosis_Bladder.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="VesicourethralAnastamosis_Bladder" id="VesicourethralAnastamosis_Bladder" />
<span class="controlBoxTitle">Vesicourethral Anastamosis</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>Number of Sutures</strong>
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="CystectomyProc" Field="ProcAnastNumSutures" id="ProcAnastNumSutures" runat="server" ShowNumberPad="true" /> 

	</td>
</tr>
<tr>
	
	<td style="padding-top: 12px;">
		
		<strong>Degree of Eversion</strong><br />
		<euc:EformRadioButtonList LookupCode="BladderNeckDegreeEversion" Table="CystectomyProc" Field="ProcBN_DegreeEversion" id="ProcBN_DegreeEversion" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>	
  </tr>
 <tr >
	<td style="padding-top:12px;">
	
		<strong>Suspension of Veinous Complex</strong><br />
		<euc:EformRadioButtonList Table="CystectomyProc" Field="ProcSuspVeinComplex" LookupCode="YesNoUnknown" id="ProcSuspVeinComplex" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>
		
	</td>
</tr>  
 <tr >
	<td style="padding-top:12px;">
	
		<strong>Quality of Bladder Sparing</strong><br />
		<euc:EformRadioButtonList Table="CystectomyProc" Field="ProcBladderSparingQuality" id="ProcBladderSparingQuality" LookupCode="OpQuality" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>
		
		
			</td>
</tr>  



 <tr >
	<td style="padding-top:12px;">
	
		<strong>Subjective Score of Urethral Stump</strong><br />
		<euc:EformRadioButtonList Table="CystectomyProc" Field="ProcUrethralStump" id="ProcUrethralStump" LookupCode="OpQuality" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>
	</td>
</tr>    
  
 <tr >
	<td style="padding-top:12px;">
		<strong>Bladder Closure</strong>
		<euc:EformTextBox CssClass="InputText" style="width: 280px;" Table="CystectomyProc" Field="ProcBladderClosure" id="ProcBladderClosure" runat="server" ShowNumberPad="false" /> 

	</td>
</tr>      
 <tr >
	<td style="padding-top:12px;">
	
<strong>Suture Notes</strong> <br />

<euc:EformTextArea TextMode="MultiLine" TABLE="CystectomyProc" FIELD="ProcAnastSutureNotes" Rows="12" style="width: 550px;" Runat="server" ID="ProcAnastSutureNotes"/>
 

	</td>
</tr>   

</table>
<br/><br/><br/>
