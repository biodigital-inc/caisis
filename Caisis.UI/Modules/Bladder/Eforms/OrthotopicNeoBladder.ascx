<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.OrthotopicNeoBladder" CodeFile="OrthotopicNeoBladder.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<a name="OrthotopicNeoBladder" id="OrthotopicNeoBladder" />


<span class="controlBoxTitle">Orthotopic Neo-Bladder</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">
 <tr >
	<td colspan="2" style="padding-top: 20px; vertical-align: top;">
		
	    <euc:EformHidden id="ProcInstitution_1" runat="server" RecordId="11" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
        <euc:EformHidden id="ProcQuality_1" runat="server" RecordId="11" Table="Procedures" Field="ProcQuality" Value="STD" />
        <euc:EformHidden id="ProcDateText_1" Table="Procedures" Field="ProcDateText" RecordId="11" runat="server"/>
        <euc:EformHidden id="ProcDate_1" Table="Procedures" Field="ProcDate"  RecordId="11" runat="server"/>	
		
		
		<euc:EformCheckBox Table="Procedures" RecordId="11" Field="ProcName" id="ProcName" Value="Orthotopic Neo-Bladder"  EnableHiddenOnUIEvent="ProcInstitution_1,ProcQuality_1,ProcDateText_1,ProcDate_1"  runat="server" />&nbsp;&nbsp;<strong>Orthotopic Neo-Bladder performed</strong>
		
	
	</td>
</tr>
 <tr >
	<td style="padding-top: 12px; vertical-align: top; width: 130px;">
		
		<strong>Ileum Length</strong>
		
	
	</td>
	
	<td style="padding-top: 12px; vertical-align: top; width: 470px;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcTermIleumLength" id="ProcTermIleumLength_1" runat="server" ShowNumberPad="true" /> cm
	</td>
</tr>
<tr>
	
	<td style="padding-top: 12px; vertical-align: top;">
		
		<strong>Right Colon Length</strong>
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">	
	
	    <euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcR_ColonLength" id="ProcR_ColonLength" runat="server" ShowNumberPad="true" /> cm
	

	</td>	
</tr>
<tr>
	
	<td  style="padding-top: 12px; vertical-align: top;">
		
		<strong>Sigmoid Length</strong>
			</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcSigmoidLength" id="ProcSigmoidLength" runat="server" ShowNumberPad="true" /> cm
	

	</td>	
</tr>

 <tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong>Ureters Stented</strong> 
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformRadioButtonList Table="UrinaryDiversionProc" Field="ProcUreterStents" LookupCode="YesNoUnknown" id="ProcUreterStents" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr>  
 <tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong>Stents Externalized</strong> 
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformRadioButtonList Table="UrinaryDiversionProc" Field="ProcUreterStentExternalized" LookupCode="YesNoUnknown" id="ProcUreterStentExternalized_1" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr>  



 <tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong>Configuration</strong> 	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformRadioButtonList Table="UrinaryDiversionProc" Field="ProcNB_Configuration" LookupCode="OpNB_Configuration" id="ProcNB_Configuration" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr>  
<tr>
	
	<td  style="padding-top: 12px; vertical-align: top;">
		
		<strong>Number of Chimneys</strong>
			</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcNB_NumChimneys" id="ProcNB_NumChimneys" runat="server" ShowNumberPad="true" /> 
	

	</td>	
</tr>

<tr>
	
	<td  style="padding-top: 12px; vertical-align: top;">
		
		<strong>1st Chimney Length</strong>
			</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcNB_ChimneyLength1" id="ProcNB_ChimneyLength1" runat="server" ShowNumberPad="true" /> cm
	

	</td>	
</tr>
<tr>
	
	<td  style="padding-top: 12px; vertical-align: top;">
		
		<strong>2nd Chimney Length</strong>
			</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcNB_ChimneyLength2" id="ProcNB_ChimneyLength2" runat="server" ShowNumberPad="true" /> cm
	

	</td>	
</tr>
<tr>
	
	<td  style="padding-top: 12px; vertical-align: top;">
		
		<strong>Afferent Limb Length</strong>
			</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcNB_AfferentLimbLength" id="ProcNB_AfferentLimbLength" runat="server" ShowNumberPad="true" /> cm
	

	</td>	
</tr>
<tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong>Hautman Bladder Neck Tube:</strong> 
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformRadioButtonList Table="UrinaryDiversionProc" Field="ProcBladderNeckTube" LookupCode="YesNoUnknown" id="ProcBladderNeckTube" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr> 
<tr>
	
	<td  style="padding-top: 12px; vertical-align: top;">
		
		<strong>Bladder Neck Tube Length</strong>
			</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcBladderNeckTubeLength" id="ProcBladderNeckTubeLength" runat="server" ShowNumberPad="true" /> cm
	

	</td>	
</tr>

</table><br/><br/><br/>