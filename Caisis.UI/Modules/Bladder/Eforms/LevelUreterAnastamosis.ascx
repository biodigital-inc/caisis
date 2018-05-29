<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.LevelUreterAnastamosis" CodeFile="LevelUreterAnastamosis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="LevelUreterAnastamosis" id="LevelUreterAnastamosis" />
<span class="controlBoxTitle">Level of Ureter Anastamosis</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px; border-bottom: solid 1px #dfdfdf;">
	<table style="width: 100%" cellpadding="0" cellspacing="0" >
	
	<tr>
	<td style="width: 44%"><strong>Left Ureter Anastamosis Type</strong><br />
		<euc:EformRadioButtonList LookupCode="BladderUreterAnastamosis" Table="CystectomyProc" Field="ProcL_UreterAnast" id="ProcL_UreterAnast" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList></td>
	<td>
		<strong>Right Ureter Anastamosis Type</strong><br />
		<euc:EformRadioButtonList LookupCode="BladderUreterAnastamosis"  Table="CystectomyProc" Field="ProcR_UreterAnast" id="ProcR_UreterAnast" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>
</td>
	</tr>
	</table>
	
	
	
	
		
		

	</td>
</tr>

 <tr >
	<td style="padding-top:20px; border-bottom: solid 1px #e2e2e2;">
	
		<table style="width: 100%" cellpadding="0" cellspacing="0" >
	
	<tr>
	<td style="width: 44%"><strong>Lateral Pedicles</strong> <br />

        <euc:EformCheckBox Table="CystectomyProc" Field="ProcLateralPedicleClips" id="ProcLateralPedicleClips" Value="True" Text="Clips" runat="server" /><br />
        <euc:EformCheckBox Table="CystectomyProc" Field="ProcLateralPedicleStaples" id="ProcLateralPedicleStaples" Value="True" Text="Staples" runat="server" /><br />
        <euc:EformCheckBox Table="CystectomyProc" Field="ProcLateralPedicleTies" id="ProcLateralPedicleTies" Value="True" Text="Ties" runat="server" />
</td>
	<td>
<strong>Posterior Pedicles</strong> <br />

        <euc:EformCheckBox Table="CystectomyProc" Field="ProcPosteriorPedicleClips" id="ProcPosteriorPedicleClips" Value="True" Text="Clips" runat="server" /><br />
        <euc:EformCheckBox Table="CystectomyProc" Field="ProcPosteriorPedicleStaples" id="ProcPosteriorPedicleStaples" Value="True" Text="Staples" runat="server" /><br />
        <euc:EformCheckBox Table="CystectomyProc" Field="ProcPosteriorPedicleTies" id="ProcPosteriorPedicleTies" Value="True" Text="Ties" runat="server" />
</td>
	</tr>
	</table>
	
	
	
	
	
	
	
	</td>
</tr>  




 <tr >
	<td style="padding-top:20px; border-bottom: solid 1px #e7e7e7;">
	
<strong>Hypogastric Artery Ligated</strong> <br />
		<euc:EformRadioButtonList LookupCode="OpSide" Table="CystectomyProc" Field="ProcHypogastricArteryLigation" id="ProcHypogastricArteryLigation" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr>    
  

 <tr >
	<td style="padding-top:20px; border-bottom: solid 1px #e9e9e9;">
	
	
	
		<table style="width: 100%" cellpadding="0" cellspacing="0" >
	
	<tr>
	<td style="width: 28%; vertical-align: top;"><strong>Vagina</strong> <br />
		<euc:EformRadioButtonList Table="CystectomyProc" Field="ProcVaginaResection" id="ProcVaginaResection" LookupCode="VaginalResection" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList></td>
	<td style="width: 33%"><strong>Vagina Resection</strong> <br />

        <euc:EformCheckBox Table="CystectomyProc" Field="ProcVaginaResectionAnterior" id="EformCheckBox1" Value="True" Text="Anterior Wall" runat="server" /><br />
		<euc:EformRadioButtonList Table="CystectomyProc" Field="ProcVaginaResectionLateral" id="EformRadioButtonList1" LookupCode="OpVagResectionLat" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList></td>	<td>
<strong>Vagina Reconstruction</strong> <br />

		<euc:EFormExtendedRadioButtonList ShowOther="True"  OtherFieldStyle="border: solid 1px #cccccc;" Table="CystectomyProc" Field="ProcVaginaReconstruction" LookupCode="VaginalReconstruction" id="ProcVaginaReconstruction" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
		</euc:EFormExtendedRadioButtonList>

</td>
	</tr>
	</table>
	
	
	
	
	
	
	


	</td>
</tr>   

 <tr >
	<td style="padding-top:20px; border-bottom: solid 1px #ebebeb;">
	
	
		<table style="width: 100%" cellpadding="0" cellspacing="0" >
	
	<tr>
	<td style="width: 29%"><strong>Rectal Resection</strong> <br />

		<euc:EformRadioButtonList LookupCode="BladderRectum" Table="CystectomyProc" Field="ProcRectum" id="ProcRectum" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList></td>
	<td>
<strong>Rectal Injury</strong> <br /> 

		<euc:EformRadioButtonList Table="CystectomyProc" Field="ProcRectalInjury" LookupCode="YesNoUnknown" id="ProcRectalInjury" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

</td>
	</tr>
	</table>
	
	</td>
</tr>   

 <tr >
	<td style="padding-top:20px; border-bottom: solid 1px #ebebeb;">
<strong>Colon Resection</strong> <br />

		<euc:EformRadioButtonList LookupCode="BladderRectum" Table="CystectomyProc" Field="ProcColon" id="ProcColon" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr>   
 <tr >
	<td style="padding-top:12px;">
<strong>Small Bowel Resection</strong> <br />

		<euc:EformRadioButtonList LookupCode="BladderRectum" Table="CystectomyProc" Field="ProcSmallBowel" id="ProcSmallBowel" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr>   







</table>
<br/><br/><br/>
