<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.ThyroidOperativeDetails" CodeFile="ThyroidOperativeDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<script type="text/javascript">

function setDefaultNA(varParent, varChild)
{
    varNumInputsInTotalTD = document.getElementById(varParent).getElementsByTagName('input').length;
	var isTotal = false;
	
	for (i=0;i<varNumInputsInTotalTD;i++) 
	{
	
		if (document.getElementById(varParent).getElementsByTagName('input')[i].getAttribute('type') && document.getElementById(varParent).getElementsByTagName('input')[i].getAttribute('type').toUpperCase().indexOf('RADIO')>-1 && document.getElementById(varParent).getElementsByTagName('input')[i].checked)
		{
			if (document.getElementById(varParent).getElementsByTagName('input')[i].value.toUpperCase().indexOf('NONE')>-1)
			{
				isTotal = true;
			}
			else // something other than None is checked
			{
				isTotal = false;
			}
		}
	}
	
	varNumInputsInSubtotalTD = document.getElementById(varChild).getElementsByTagName('input').length;

	for (j=0;j<varNumInputsInSubtotalTD;j++) 
	{
		if (document.getElementById(varChild).getElementsByTagName('input')[j].getAttribute('type') && document.getElementById(varChild).getElementsByTagName('input')[j].getAttribute('type').toUpperCase().indexOf('RADIO')>-1)
		{
		    if (document.getElementById(varChild).getElementsByTagName('input')[j].value.toUpperCase().indexOf('NOT APPLICABLE')>-1)
		    {
			    document.getElementById(varChild).getElementsByTagName('input')[j].checked = isTotal;
			}
			
		}
	}
}
function setTotalThyroidectomy()
{
	varNumInputsInTotalTD = document.getElementById('TotalThyroidectomyTD').getElementsByTagName('input').length;
	var isTotal = false;
	
	for (i=0;i<varNumInputsInTotalTD;i++) 
	{
	
		if (document.getElementById('TotalThyroidectomyTD').getElementsByTagName('input')[i].getAttribute('type') && document.getElementById('TotalThyroidectomyTD').getElementsByTagName('input')[i].getAttribute('type').toUpperCase().indexOf('RADIO')>-1 && document.getElementById('TotalThyroidectomyTD').getElementsByTagName('input')[i].checked)
		{
			if (document.getElementById('TotalThyroidectomyTD').getElementsByTagName('input')[i].value.toUpperCase().indexOf('YES')>-1)
			{
				isTotal = true;
			}
			else // something other than yes is checked
			{
				isTotal = false;
			}
		}
	}
	
	varNumInputsInSubtotalTD = document.getElementById('SubtotalExtentTD').getElementsByTagName('input').length;
		
		for (j=0;j<varNumInputsInSubtotalTD;j++) 
		{
			if (document.getElementById('SubtotalExtentTD').getElementsByTagName('input')[j].getAttribute('type') && document.getElementById('SubtotalExtentTD').getElementsByTagName('input')[j].getAttribute('type').toUpperCase().indexOf('CHECK')>-1)
			{
			
				document.getElementById('SubtotalExtentTD').getElementsByTagName('input')[j].checked = isTotal;
				
			}
		}
	
}


</script>



<a name="ThyroidOperativeDetails" id="ThyroidOperativeDetails" />
<span class="controlBoxTitle">Operative Procedure</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td colspan="2" style="padding-top: 20px;" id="TotalThyroidectomyTD" onclick="setTotalThyroidectomy();">
		
		<euc:EformHidden  Runat="server" ID="ProcName_Thyroidectomy" Table="Procedures" RecordId="1" Field="ProcName" Value="Thyroidectomy" />
		<euc:EformHidden id="ProcInstitution_1" runat="server" RecordId="1" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
          <euc:EformHidden id="ProcQuality_1" runat="server" RecordId="1" Table="Procedures" Field="ProcQuality" Value="STD" />
          <euc:EformHidden id="ProcDateText_1" Table="Procedures" Field="ProcDateText" RecordId="1" runat="server"/>
        <euc:EformHidden id="ProcDate_1" Table="Procedures" Field="ProcDate"  RecordId="1" runat="server"/>
        
		<strong>Total Thyroidectomy</strong>
		<euc:EformRadioButtonList Table="ThyroidProc" Field="ProcTotalThyroidectomy" LookupCode="YesNoUnknown" id="ProcTotalThyroidectomy" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server" EnableHiddenOnUIEvent="ProcName_Thyroidectomy,ProcInstitution_1,ProcQuality_1,ProcDateText_1,ProcDate_1">
		</euc:EformRadioButtonList>	</td>
  </tr>
<tr>
	
	<td colspan="2" style="padding-top: 12px;" id="SubtotalExtentTD">
		
		<strong>Extent of Subtotal Thyroid Surgery</strong><br />
         <euc:EformCheckBox Table="ThyroidProc" Field="ProcR_Lobe" id="ProcR_Lobe" runat="server" Value="Yes" Text="Right Lobe"  EnableHiddenOnUIEvent="ProcName_Thyroidectomy" /><br/>
         <euc:EformCheckBox Table="ThyroidProc" Field="ProcL_Lobe" id="ProcL_Lobe" runat="server" Value="Yes" Text="Left Lobe"  EnableHiddenOnUIEvent="ProcName_Thyroidectomy" /><br/>
         <euc:EformCheckBox Table="ThyroidProc" Field="ProcIsthmus" id="ProcIsthmus" runat="server" Value="Yes" Text="Isthmus"  EnableHiddenOnUIEvent="ProcName_Thyroidectomy" />	</td>	
  </tr>
  <tr >
   <td colspan="2" style="padding-top:12px;">
   
       <strong>Resection of Strap Muscles</strong>
       <euc:EformRadioButtonList Table="ThyroidProc" Field="ProcStrapMuscle" LookupCode="YesNoUnknown" id="ProcStrapMuscle" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server">
		 </euc:EformRadioButtonList>
   
   </td>
 </tr>
 <tr >
   <td style="padding-top:12px;"><strong>Managment of Parathyroid Gland</strong><br />
   		<span style="font-size: 11px; font-weight: 900; line-height: 24px;">Left-Superior</span>
       <euc:EformRadioButtonList Table="ThyroidProc" Field="ProcL_SuperiorParathyroid" LookupCode="ThyroidManagement" id="ProcL_SuperiorParathyroid" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
       </euc:EformRadioButtonList>   </td>
    <td style="padding-top:12px; padding-left: 0px;">
	
		<strong></strong><br />
		<span style="font-size: 11px; font-weight: 900; line-height: 24px;">Right-Superior</span>
		<euc:EformRadioButtonList Table="ThyroidProc" Field="ProcR_SuperiorParathyroid" LookupCode="ThyroidManagement" id="ProcR_SuperiorParathyroid" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>	</td>
 </tr>  
 <tr >
   <td style="padding-top:4px;"><span style="font-size: 11px; font-weight: 900;">Left-Inferior</span><br/>
       <euc:EformRadioButtonList Table="ThyroidProc" Field="ProcL_InferiorParathyroid" LookupCode="ThyroidManagement" id="ProcL_InferiorParathyroid" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
       </euc:EformRadioButtonList>   </td>
    <td style="padding-top:4px; padding-left: 0px;">
	
		<span style="font-size: 11px; font-weight: 900;">Right-Inferior</span><br/>
		<euc:EformRadioButtonList Table="ThyroidProc" Field="ProcR_InferiorParathyroid" LookupCode="ThyroidManagement" id="ProcR_InferiorParathyroid" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>	</td>
 </tr>
 <tr >
   <td style="padding-top:12px;">
   
    <strong>Sacrifice Recurrent Laryngeal Nerve</strong><br />
    <span style="font-size: 11px; font-weight: 900;">Left</span><br/>
       <euc:EformRadioButtonList Table="ThyroidProc" Field="ProcLaryngealNerveLeft" LookupCode="ThyroidLaryngealNerve" id="ProcLaryngealNerveLeft" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		 </euc:EformRadioButtonList>
   
   </td>
   <td style="padding-top:12px;">
   
    <strong></strong><br />
    <span style="font-size: 11px; font-weight: 900; line-height: 24px;">Right</span>
       <euc:EformRadioButtonList Table="ThyroidProc" Field="ProcLaryngealNerveRight" LookupCode="ThyroidLaryngealNerve" id="ProcLaryngealNerveRight" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		 </euc:EformRadioButtonList>
   
   </td>
 </tr>
 <tr >
   <td style="padding-top: 16px; vertical-align:top;" id="ManagementTracheaTD" onclick="setDefaultNA('ManagementTracheaTD', 'ReconstructionTracheaTD');">
   		<strong>Management of Trachea</strong><br />
       <euc:EformRadioButtonList Table="ThyroidProc" Field="ProcTracheaMgmt" LookupCode="ThyroidTracheaManagement" id="ProcTracheaMgmt" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
       </euc:EformRadioButtonList>	   </td>
   <td style="padding-top: 16px; padding-left: 0px; vertical-align:top;" id="ReconstructionTracheaTD">
   
      		<strong>Reconstruction of Trachea</strong><br />
       <euc:EformRadioButtonList Table="ThyroidProc" Field="ProcTracheaReconstruct" LookupCode="ThyroidTracheaReconstruction" id="ProcTracheaReconstruct" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
       </euc:EformRadioButtonList>   </td>
 </tr>

 <tr >
   <td colspan="2" style="padding-top:12px;">
   
         <strong>Tracheostomy</strong>
       <euc:EformRadioButtonList Table="ThyroidProc" Field="ProcTracheostomy" LookupCode="ThyroidTracheostomy" id="ProcTracheostomy" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server">
       </euc:EformRadioButtonList>   </td>
  </tr>
 <tr >
   <td colspan="2" style="padding-top:12px;"><strong>Management of Larynx</strong><br />
       <euc:EformRadioButtonList Table="ThyroidProc" Field="ProcLarynxMgmt" LookupCode="ThyroidLarynxManagement" id="ProcLarynxMgmt" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
       </euc:EformRadioButtonList>   </td>
 </tr>
 <tr >
   <td  style="padding-top:16px; vertical-align:top;" id="ManagementEsophagusTD" onclick="setDefaultNA('ManagementEsophagusTD', 'ReconstructionEsophagusTD');">
   
         <strong>Management of Esophagus/Pharynx</strong><br />
       <euc:EformRadioButtonList Table="ThyroidProc" Field="ProcEsophagusPharynxMgmt" LookupCode="ThyroidEsophagusManagement" id="ProcEsophagusPharynxMgmt" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
       </euc:EformRadioButtonList>   </td>
	      <td style="padding-top: 16px; padding-left: 0px; vertical-align:top;" id="ReconstructionEsophagusTD">
   
      		<strong>Reconstruction of Esophagus/Pharynx</strong><br />
       <euc:EformExtendedRadioButtonList ShowOther="True" Table="ThyroidProc" Field="ProcEsophagusPharynxReconstruct" LookupCode="ThyroidEsophagusReconstruction" id="ProcEsophagusPharynxReconstruct" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
       </euc:EformExtendedRadioButtonList>   </td>
	   
  </tr>
 <tr >
   <td colspan="2" style="padding-top:12px;">
   
          <strong>Drain</strong><br />
       <euc:EformRadioButtonList Table="ThyroidProc" Field="ProcDrain" LookupCode="ThyroidDrains" id="ProcDrain" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		 </euc:EformRadioButtonList>
   
   </td>
 </tr>


</table>
<br/><br/><br/>
