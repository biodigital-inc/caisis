<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateBiopsy" CodeFile="BiopsyOfProstateBiopsy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<script type="text/javascript">

function setUS_GuidedSystematicNum(cbox)
{
	var US_GuidedSystematicNum = $('<% = US_GuidedSystematicNum.ClientID %>');
	if (cbox.checked == true)
	{
		if (US_GuidedSystematicNum.value.length < 1) US_GuidedSystematicNum.value = '12';
	}
	else {  US_GuidedSystematicNum.value = ''; }
}

function setUS_GuidedSystematic(tbox)
{
	var US_GuidedSystematic = $('<% = US_GuidedSystematic.ClientID %>');
	if (tbox.value.length > 0)
	{
		US_GuidedSystematic.checked = true;
	}
}

</script>

<style type="text/css">
table#TRUSBiopsyProcFindingsHTMLTable
{
    margin-bottom: 0px;
    border: solid 1px #cccccc;
    border-collapse: collapse;
    border-spacing: 0px;
    background-color: #f2f2f2;
}
table#TRUSBiopsyProcFindingsHTMLTable td
{
    border: solid 1px #cccccc;
    padding: 4px 6px;
}
table#TRUSBiopsyProcFindingsHTMLTable th
{
    border: solid 1px #cccccc;
    padding: 4px 6px;
    font-weight: bold;
    text-align: center;
    color: #000000;
    font-size: 12px;
    background-color: #dddddd;
}
table#TRUSBiopsyProcFindingsHTMLTable td.noTopBottomBorder
{
    border-top: none;
	border-bottom: none;
}
table#TRUSBiopsyProcFindingsHTMLTable td.noBottomBorder
{
	border-bottom: none;
}
</style>
<span class="controlBoxTitle">&nbsp;Biopsy</span><br />
  <table id="TRUSBiopsyProcFindingsHTMLTable" class="ClinicalEformTable" >
    <tr>
      <th>&nbsp;</th>
      <th># Cores</th>
      <th>Side</th>
      <th>Laterality</th>
      <th>Subsite</th>
      <th>MRI Score</th>
      <th>&nbsp;</th>
    </tr>
    <tr> 
      <td><euc:EformCheckBox runat="server" Field="ProcFindDissection" Table="ProcedureFinding" RecordId="2" ParentRecordId="1" id="US_GuidedSystematic" Value="US Guided (Systematic)" onclick="setUS_GuidedSystematicNum(this);" />
      US guided (Systematic)      </td>
	   <td><euc:EformTextBox style="width: 50px;" ID="US_GuidedSystematicNum" Table="ProcedureFinding" RecordId="2" ParentRecordId="1" Field="ProcFinding" runat="server" onblur="setUS_GuidedSystematic(this);" /></td>
	   <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
	   <td>&nbsp;</td>
       <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td>
      <euc:EformCheckBox runat="server" Field="ProcFindDissection" Table="ProcedureFinding" RecordId="3" ParentRecordId="1" id="TZ_Biopsy" Value="2 TZ Biopsy" /> 2 TZ biopsy</td>
      <td>&nbsp;</td>
	   <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td>
      <euc:EformCheckBox runat="server" Field="ProcFindDissection" Table="ProcedureFinding" RecordId="4" ParentRecordId="1" id="SV_Biopsy" Value="2 SV Biopsy" /> 2 SV biopsy</td>
      <td>&nbsp;</td>
	   <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noBottomBorder">
      <euc:EformCheckBox runat="server" Field="ProcFindDissection" Table="ProcedureFinding" RecordId="5" ParentRecordId="1" id="MRI_Fusion_Guided" Value="MRI-Fusion Guided" /> MRI-Fusion Guided Biopsy</td>
      <td>
       <euc:EformTextBox style="width: 50px;" ID="MRI_Fusion_Guided_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="5" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="MRI_Fusion_Guided_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="5" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="MRI_Fusion_Guided_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="5" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="MRI_Fusion_Guided_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="5" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="MRI_Fusion_Guided_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="5" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noTopBottomBorder">&nbsp;</td>
      <td>
        <euc:EformTextBox style="width: 50px;" ID="MRI_Fusion_Guided2_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="6" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="MRI_Fusion_Guided2_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="6" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="MRI_Fusion_Guided2_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="6" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="MRI_Fusion_Guided2_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="6" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="MRI_Fusion_Guided2_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="6" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noTopBottomBorder">&nbsp;</td>
      <td>
       <euc:EformTextBox style="width: 50px;" ID="MRI_Fusion_Guided3_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="7" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="MRI_Fusion_Guided3_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="7" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="MRI_Fusion_Guided3_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="7" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="MRI_Fusion_Guided3_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="7" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="MRI_Fusion_Guided3_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="7" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noTopBottomBorder">&nbsp;</td>
      <td>
       <euc:EformTextBox style="width: 50px;" ID="MRI_Fusion_Guided4_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="8" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="MRI_Fusion_Guided4_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="8" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="MRI_Fusion_Guided4_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="8" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="MRI_Fusion_Guided4_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="8" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="MRI_Fusion_Guided4_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="8" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noTopBottomBorder">&nbsp;</td>
      <td>
       <euc:EformTextBox style="width: 50px;" ID="MRI_Fusion_Guided5_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="9" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="MRI_Fusion_Guided5_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="9" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="MRI_Fusion_Guided5_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="9" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="MRI_Fusion_Guided5_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="9" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="MRI_Fusion_Guided5_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="9" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
    
     <tr> 
      <td class="noBottomBorder">
      <euc:EformCheckBox runat="server" Field="ProcFindDissection" Table="ProcedureFinding" RecordId="10" ParentRecordId="1" ID="VisuallyTargeted" Value="Visually Targeted" /> Visually Targeted Biopsy</td>
      <td>
       <euc:EformTextBox style="width: 50px;" ID="VisuallyTargeted_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="10" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="VisuallyTargeted_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="10" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="VisuallyTargeted_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="10" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="VisuallyTargeted_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="10" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="VisuallyTargeted_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="10" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noTopBottomBorder">&nbsp;</td>
      <td>
        <euc:EformTextBox style="width: 50px;" ID="VisuallyTargeted2_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="11" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="VisuallyTargeted2_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="11" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="VisuallyTargeted2_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="11" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="VisuallyTargeted2_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="11" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="VisuallyTargeted2_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="11" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noTopBottomBorder">&nbsp;</td>
      <td>
        <euc:EformTextBox style="width: 50px;" ID="VisuallyTargeted3_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="12" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="VisuallyTargeted3_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="12" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="VisuallyTargeted3_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="12" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="VisuallyTargeted3_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="12" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="VisuallyTargeted3_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="12" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noTopBottomBorder">&nbsp;</td>
      <td>
        <euc:EformTextBox style="width: 50px;" ID="VisuallyTargeted4_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="13" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="VisuallyTargeted4_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="13" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="VisuallyTargeted4_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="13" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="VisuallyTargeted4_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="13" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="VisuallyTargeted4_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="13" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noTopBottomBorder">&nbsp;</td>
      <td>
        <euc:EformTextBox style="width: 50px;" ID="VisuallyTargeted5_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="14" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="VisuallyTargeted5_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="14" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="VisuallyTargeted5_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="14" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="VisuallyTargeted5_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="14" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="VisuallyTargeted5_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="14" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noBottomBorder">
      <euc:EformCheckBox runat="server" Field="ProcFindDissection" Table="ProcedureFinding" RecordId="15" ParentRecordId="1" ID="FingerGuided" Value="Finger Guided" /> Finger Guided Biopsy</td>
      <td>
       <euc:EformTextBox style="width: 50px;" ID="FingerGuided_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="15" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="FingerGuided_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="15" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="FingerGuided_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="15" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="FingerGuided_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="15" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="FingerGuided_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="15" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noTopBottomBorder">&nbsp;</td>
      <td>
        <euc:EformTextBox style="width: 50px;" ID="FingerGuided2_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="16" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="FingerGuided2_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="16" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="FingerGuided2_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="16" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="FingerGuided2_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="16" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="FingerGuided2_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="16" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noTopBottomBorder">&nbsp;</td>
      <td>
        <euc:EformTextBox style="width: 50px;" ID="FingerGuided3_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="17" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="FingerGuided3_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="17" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="FingerGuided3_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="17" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="FingerGuided3_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="17" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="FingerGuided3_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="17" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noTopBottomBorder">&nbsp;</td>
      <td>
        <euc:EformTextBox style="width: 50px;" ID="FingerGuided4_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="18" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="FingerGuided4_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="18" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="FingerGuided4_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="18" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="FingerGuided4_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="18" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="FingerGuided4_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="18" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
     <tr> 
      <td class="noTopBottomBorder">&nbsp;</td>
      <td>
        <euc:EformTextBox style="width: 50px;" ID="FingerGuided5_Cores" Field="ProcFinding" Table="ProcedureFinding" RecordId="19" ParentRecordId="1" runat="server"/></td>
      <td>
      <euc:EformDropDownList LookupCode="OpSide" style="width: 76px;" ID="FingerGuided5_Side" Field="ProcFindSide" Table="ProcedureFinding" RecordId="19" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="Laterality" style="width: 78px;" ID="FingerGuided5_Laterality" Field="ProcFindLaterality" Table="ProcedureFinding" RecordId="19" ParentRecordId="1" runat="server"/></td><td>
      <euc:EformDropDownList LookupCode="ProstateLevel" style="width: 80px;" ID="FingerGuided5_Subsite" Field="ProcFindSubsite" Table="ProcedureFinding" RecordId="19" ParentRecordId="1" runat="server"/>
      </td>
	  <td><euc:EformDropDownList LookupCode="MRIscore" style="width: 50px;" ID="FingerGuided5_MRIScore" Field="ProcFindScore" Table="ProcedureFinding" RecordId="19" ParentRecordId="1" runat="server"/></td>
	  <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    
</table>
<br/><br/>