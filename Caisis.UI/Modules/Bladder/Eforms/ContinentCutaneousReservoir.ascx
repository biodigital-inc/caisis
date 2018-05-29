<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.ContinentCutaneousReservoir" CodeFile="ContinentCutaneousReservoir.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" >

function showUrinaryDiversionType(UDTypeNode)
{
    if (UDTypeNode.nodeName == 'TABLE')
    {
	    for (i = 0; i < UDTypeNode.rows.length; i++)
	    {
		    theRow = UDTypeNode.rows[i];
	        for (j = 0; j < theRow.cells.length; j++)
	        {
	            theCell = theRow.cells[j];
		        if (theCell.hasChildNodes())
		        {
			        for (k = 0; k < theCell.childNodes.length; k++) 
			        {
			            if (theCell.childNodes[k].nodeName == 'INPUT')
			            {
	
			                if((theCell.childNodes[k].type == 'radio' || theCell.childNodes[k].type == 'RADIO') && theCell.childNodes[k].checked)
			                {
			                    showUrinaryDiversionSection(theCell.childNodes[k].value);
			                }
			            }
			        }
			    }
				        
		    }
		}
    }
}

function showContMechType(ContMechTypeContainerNode)
{
    if (ContMechTypeContainerNode.nodeName == 'TABLE')
    {
	    for (i = 0; i < ContMechTypeContainerNode.rows.length; i++)
	    {
		    theRow = ContMechTypeContainerNode.rows[i];
	        for (j = 0; j < theRow.cells.length; j++)
	        {
	            theCell = theRow.cells[j];
		        if (theCell.hasChildNodes())
		        {
			        for (k = 0; k < theCell.childNodes.length; k++) 
			        {
			            if (theCell.childNodes[k].nodeName == 'INPUT')
			            {
	
			                if((theCell.childNodes[k].type == 'radio' || theCell.childNodes[k].type == 'RADIO') && theCell.childNodes[k].checked)
			                {
			                    setContMechLabels(theCell.childNodes[k].value);
			                }
			            }
			        }
			    }
				        
		    }
		}
    }

}

function setContMechLabels(ContMechType)
{
    if (ContMechType.toUpperCase().indexOf('TAPERED ILEAL SEGMENT') > -1)
    {
        document.getElementById('ContMechSubTypeLabel').innerHTML = 'Tapered Ileal Segment';
        document.getElementById('ContMechLength').innerHTML = 'Length of Efferent Limb';
    }
    else if (ContMechType.toUpperCase().indexOf('APPENDIX') > -1)
    {
        document.getElementById('ContMechSubTypeLabel').innerHTML = 'Appendix Type';
        document.getElementById('ContMechLength').innerHTML = ' Length of Tunnel';
    }    
    else if (ContMechType.toUpperCase().indexOf('VALVE') > -1)
    {
        document.getElementById('ContMechSubTypeLabel').innerHTML = 'Ileal Valve Type';
        document.getElementById('ContMechLength').innerHTML = ' Length of Valve';
    }
    else if (ContMechType.toUpperCase().indexOf('MONTI TUBE') > -1)
    {
        document.getElementById('ContMechSubTypeLabel').innerHTML = 'Monti Tube Type';
        document.getElementById('ContMechLength').innerHTML = ' Length of Tunnel';
    }    
}

</script>

<a name="ContinentCutaneousReservoir" id="ContinentCutaneousReservoir" />
<span class="controlBoxTitle">Continent Cutaneous Reservoir</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">

 <tr >
	<td colspan="2" style="padding-top: 20px; vertical-align: top;">
		
	    <euc:EformHidden id="ProcInstitution_1" runat="server" RecordId="11" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
        <euc:EformHidden id="ProcQuality_1" runat="server" RecordId="11" Table="Procedures" Field="ProcQuality" Value="STD" />
        <euc:EformHidden id="ProcDateText_1" Table="Procedures" Field="ProcDateText" RecordId="11" runat="server"/>
        <euc:EformHidden id="ProcDate_1" Table="Procedures" Field="ProcDate"  RecordId="11" runat="server"/>	
		
		
		<euc:EformCheckBox Table="Procedures" RecordId="11" Field="ProcName" id="ProcName" Value="Continent Cutaneous Reservoir"  EnableHiddenOnUIEvent="ProcInstitution_1,ProcQuality_1,ProcDateText_1,ProcDate_1"  runat="server" />&nbsp;&nbsp;<strong>Continent Cutaneous Reservoir performed</strong>
		
	
	</td>
</tr>
 <tr >
	<td style="padding-top: 12px; vertical-align: top; width: 190px;">
		
		<strong>Right Colon Length</strong>
	</td>
	
	<td style="padding-top: 12px; vertical-align: top; width:410px;">	
	
	    <euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcR_ColonLength" id="ProcR_ColonLength_2" runat="server" ShowNumberPad="true" /> cm
	
</td>
</tr>
<tr>
	
	<td style="padding-top: 12px; vertical-align: top;">
		
		<strong>Transverse Colon Length</strong>
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">	
	
	    <euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcTransColonLength" id="ProcTransColonLength_2" runat="server" ShowNumberPad="true" /> cm
	

	</td>	
</tr>

<tr>
	
	<td  style="padding-top: 12px; vertical-align: top;">
		
		<strong>Sigmoid Length</strong>
			</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcSigmoidLength" id="ProcSigmoidLength_3" runat="server" ShowNumberPad="true" /> cm
	

	</td>	
</tr>
 
<tr>
	
	<td style="padding-top: 12px; vertical-align: top;">
		
		<strong>Terminal Ileum Length</strong>
		
	
	</td>
	
	<td style="padding-top: 12px; vertical-align: top; width: 440px;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcTermIleumLength" id="ProcTermIleumLength_3" runat="server" ShowNumberPad="true" /> cm


	</td>	
</tr>
 
<tr>
	
	<td style="padding-top: 12px; vertical-align: top;">
		
		<strong>Ileal Based Only</strong>
		
	
	</td>
	
	<td style="padding-top: 12px; vertical-align: top; width: 440px;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcIlealBasedLength" id="ProcIlealBasedLength" runat="server" ShowNumberPad="true" /> cm


	</td>	
</tr> 
<tr>
	
	<td style="padding-top: 12px; vertical-align: top;">
		
		<strong>Appendix Length</strong>
		
	
	</td>
	
	<td style="padding-top: 12px; vertical-align: top; width: 440px;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcAppendixLength" id="ProcAppendixLength" runat="server" ShowNumberPad="true" /> cm


	</td>	
</tr> 

 
<tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong>Continent Mechanism to Skin</strong> 
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformRadioButtonList Table="UrinaryDiversionProc" Field="ProcContMech" LookupCode="OpContMech" id="ProcContMech" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" onclick="showContMechType(this);">
		</euc:EformRadioButtonList>

	</td>
</tr>  
<tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong><span id="ContMechSubTypeLabel">Cont Mech Subtype</span></strong> 
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformExtendedRadioButtonList ShowOther="true" Table="UrinaryDiversionProc" Field="ProcContMechSubtype" LookupCode="OpContMechSubtype" id="ProcContMechSubtype" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformExtendedRadioButtonList>

	</td>
</tr>



<tr >
	
	<td  style="padding-top: 12px; vertical-align: top;">
		
		<strong><span id="ContMechLength">Cont Mech Length</span></strong>
			</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcContMechLength" id="ProcContMechLength" runat="server" ShowNumberPad="true" /> cm
	

	</td>	
</tr>

<tr >
	
	<td  style="padding-top: 12px; vertical-align: top;">
		
		<strong>Left Ureter Anastamosis</strong>
			</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformExtendedCheckBoxList LookupCode="OpUreterAnast" Table="UrinaryDiversionProc" Field="ProcL_UreterAnast" id="ProcL_UreterAnast" runat="server">
		</euc:EformExtendedCheckBoxList>
	

	</td>	
</tr>
<tr >
	
	<td  style="padding-top: 12px; vertical-align: top;">
		
		<strong>Right Ureter Anastamosis</strong>
			</td>
	
	<td style="padding-top: 12px; vertical-align: top; white-space: nowrap;">
		<euc:EformExtendedCheckBoxList  LookupCode="OpUreterAnast" Table="UrinaryDiversionProc" Field="ProcR_UreterAnast" id="ProcR_UreterAnast" runat="server">
		</euc:EformExtendedCheckBoxList>
	

	</td>	
</tr>
<tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong>Location of Stoma</strong> 
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformRadioButtonList Table="UrinaryDiversionProc" Field="ProcStomaLocation" LookupCode="OpStomaLocation" id="ProcStomaLocation_2" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr>  
 <tr >
	<td  style="padding-top: 12px; vertical-align: top;">
	
<strong>Are Stents Externalized?</strong> 
	</td>
	
	<td style="padding-top: 12px; vertical-align: top;">
		<euc:EformRadioButtonList Table="UrinaryDiversionProc" Field="ProcUreterStentExternalized" LookupCode="OpUreterStentExternalized" id="ProcUreterStentExternalized" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>
</tr>

</table><br /><br /><br />


<script type="text/javascript" >
showContMechType(document.getElementById('<asp:Literal ID="ContMechTypeContainerNodeID" runat="server" />'));

</script>

