<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.IlealConduitDiversion" CodeFile="IlealConduitDiversion.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="IlealConduitDiversion" id="IlealConduitDiversion" />

<span class="controlBoxTitle">Ileal Conduit Diversion</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">
<tr >
	<td colspan="2" style="padding-top: 20px; vertical-align: top;">
		
	    <euc:EformHidden id="ProcInstitution_1" runat="server" RecordId="11" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
        <euc:EformHidden id="ProcQuality_1" runat="server" RecordId="11" Table="Procedures" Field="ProcQuality" Value="STD" />
        <euc:EformHidden id="ProcDateText_1" Table="Procedures" Field="ProcDateText" RecordId="11" runat="server"/>
        <euc:EformHidden id="ProcDate_1" Table="Procedures" Field="ProcDate"  RecordId="11" runat="server"/>	
		
		
		<euc:EformCheckBox Table="Procedures" RecordId="11" Field="ProcName" id="ProcName" Value="Ileal Conduit Diversion"  EnableHiddenOnUIEvent="ProcInstitution_1,ProcQuality_1,ProcDateText_1,ProcDate_1"  runat="server" />&nbsp;&nbsp;<strong>Ileal Conduit Diversion performed</strong>
		
	
	</td>
</tr>
 <tr >
	<td style="padding-top: 12px; vertical-align: top; width: 210px;">
		
		<strong>Ileum Length</strong>
		
	
	</td>
	
	<td style="padding-top: 12px; vertical-align: top; width: 440px;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcTermIleumLength" id="ProcTermIleumLength_2" runat="server" ShowNumberPad="true" /> cm
	</td>
</tr>

<tr>
	
	<td  style="padding-top: 12px; vertical-align: top;">
		
		<strong>Sigmoid Length</strong>
			</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcSigmoidLength" id="ProcSigmoidLength_2" runat="server" ShowNumberPad="true" /> cm
	

	</td>	
</tr>
<tr>
	
	<td style="padding-top: 12px; vertical-align: top;">
		
		<strong>Transverse Colon Length</strong>
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">	
	
	    <euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcTransColonLength" id="ProcTransColonLength" runat="server" ShowNumberPad="true" /> cm
	

	</td>	
</tr> 
<tr>
	
	<td style="padding-top: 12px; vertical-align: top;">
		
		<strong>Other Length</strong>
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">	
	
	    <euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcOtherSegmentLength" id="ProcOtherSegmentLength" runat="server" ShowNumberPad="true" /> cm
	

	</td>	
</tr> 
<tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong>Location of Stoma</strong> 
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformRadioButtonList Table="UrinaryDiversionProc" Field="ProcStomaLocation" LookupCode="OpStomaLocation" id="ProcStomaLocation" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr>  
<tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong>Type of Stoma</strong> 
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformRadioButtonList Table="UrinaryDiversionProc" Field="ProcStomaType" LookupCode="OpStomaType" id="ProcStomaType" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr> 
<tr>
	
	<td  style="padding-top: 12px; vertical-align: top;">
		
		<strong>Number of Fascial Sutures</strong>
			</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcNumFascialSutures" id="ProcNumFascialSutures" runat="server" ShowNumberPad="true" /> 
	

	</td>	
</tr>

<tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong>Left Ureteral Anastamosis Type</strong> 
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformExtendedRadioButtonList ShowOther="true" Table="UrinaryDiversionProc" Field="ProcL_UreterAnast" LookupCode="OpUreterAnast" id="ProcL_UreterAnast" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformExtendedRadioButtonList>

	</td>
</tr>
<tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong>Right Ureteral Anastamosis Type</strong> 
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformExtendedRadioButtonList ShowOther="true" Table="UrinaryDiversionProc" Field="ProcR_UreterAnast" LookupCode="OpUreterAnast"  id="ProcR_UreterAnast" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformExtendedRadioButtonList>

	</td>
</tr> 
 <tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong>Ureters Stented</strong> 
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformRadioButtonList Table="UrinaryDiversionProc" Field="ProcUreterStents" LookupCode="OpUreterStents" id="ProcUreterStents_2" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr>

<tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong>Everted Mucosa</strong> 
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformRadioButtonList Table="UrinaryDiversionProc" Field="ProcEvertedMucosa" LookupCode="OpEvertedMucosa" id="ProcEvertedMucosa" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr> 


</table><br /><br /><br />