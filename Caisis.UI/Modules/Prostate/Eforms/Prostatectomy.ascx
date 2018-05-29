<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.Prostatectomy" CodeFile="Prostatectomy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<script language="javascript">

var neuralStimIsChecked = <asp:Literal ID="CheckboxChecked" Runat="server" >false</asp:Literal>;


function switchCheck()
{
	if (neuralStimIsChecked)
	{
		neuralStimIsChecked = false;
	}
	else
	{
		neuralStimIsChecked = true;
	}
}

function copyEFormInputValues(SourceField, TargetField)
{
	if (neuralStimIsChecked)
	{
		document.getElementById(TargetField).value = "";
	}
	else
	{
		document.getElementById(TargetField).value = document.getElementById(SourceField).value;
	}
}

function enableAddProcRow(inputArray)
{
	for (i = 0; i < inputArray.length; i++)
	{
		var el = document.getElementById(inputArray[i]);
		el.disabled = false;
		if (el.nextSibling.tagName == 'IMG')
		{
			el.nextSibling.setAttribute('class','pdFormFieldButtonOn');
			el.nextSibling.disabled = false;
		}
		el.removeAttribute('onclick');
	}
}

function disableAddProcRow(inputArray)
{
	for (i = 0; i < inputArray.length; i++)
	{
		var el = document.getElementById(inputArray[i]);
		el.disabled = true;
		if (el.nextSibling.tagName == 'IMG')
		{
			el.nextSibling.setAttribute('class','pdFormFieldButtonOff');
			el.nextSibling.disabled = true;
		}
		
		if (el.selectedindex != null)
		{
			el.selectedindex = 0;
		}
		else
		{
			el.value = '';
		}
	}
}

function checkEnableRow(procInput, inputArray)
{
	if (procInput.value != null && procInput.value != '')
	{
		enableAddProcRow(inputArray);
	}
	else
	{
		disableAddProcRow(inputArray);
	}
}
</script>

<a name="ProstatectomyAndAncillaryProcs" />
<span class="controlBoxTitle">&nbsp;&nbsp;Primary Procedures</span><br />
  <table width="650" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable">
    <tr> 
      <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="200" height="25" class="controlBoxDataGridHeaderFirstCol">Procedure</td>
      <td width="20" class="controlBoxDataGridHeader"><img src="../../../Images/shim.gif" width="20" height="1" /></td>
      <td   class="controlBoxDataGridHeader" style="text-align: left;">Surgeon</td>
      <td width="2" align="right" valign="top" class="controlBox">&nbsp;<img src="../../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"><strong>Prostatectomy:</strong>&nbsp;&nbsp;<euc:EFormSelect LookupCode="OpTypeProstatectomy" runat=server ID="OpType" TABLE="ProcProstatectomiesOp" FIELD="OpType" /></td>
      <td>&nbsp;</td>
      <td><euc:EformComboBox Style="width:100" LookupCode="OpSurgeon" RefBy="CaseSurgeon" ID="OpSurgeon" TABLE="ProcProstatectomiesOp" FIELD="OpSurgeon" runat="server"/></td>
      <td>&nbsp;</td>
    </tr>
<!--Neural Stimulation begin-->
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn">
      <input type="checkbox" id="NeuralStimCheckbox" runat="server" /><strong>Neural Stimulation</strong></td>
      <td>&nbsp;</td>
      <td>	
      <euc:EformComboBox Style="width:100" RefBy="CaseSurgeon" ID="NeuralStimulationSurgeon" TABLE="NoTable" FIELD="NeuralStimulationSurgeon" runat="server"/>	  </td>
      <td>&nbsp;</td>
    </tr>
</table> 
  <br/><br/>
<!--Additional Procedures begin-->
<span class="controlBoxTitle">&nbsp;&nbsp;Additional Procedures</span><br />
  <table width="650" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable">
    <tr> 
      <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
      <td   height="25" class="controlBoxDataGridHeaderFirstCol">Procedure</td>
      <td width="10" class="controlBoxDataGridHeader"><img src="../../../Images/shim.gif" width="10" height="1" /></td>
      <td   class="controlBoxDataGridHeader">Surgeon</td>
      <td   class="controlBoxDataGridHeader">Side</td>
      <td width="2" align="right" valign="top" class="controlBox">&nbsp;<img src="../../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn" >&nbsp;</td>
      <td height="35"  class="controlBoxDataGridFirstColumn">
      <euc:EformComboBox style="width:100;" LookupCode="ProcName" RefBy="OpName"  Field="OpName" RecordId="1" Table="Procedures" runat=server id="OpName_1" />      </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:100;" Field="OpSurgeon" RecordId="1" Table="Procedures" runat=server id="OpSurgeon_1" />	  </td>
      <td align="center">
        <euc:EFormSelect LookupCode="OpSide" runat=server  Field="OpSide" RecordId="1" Table="Procedures" runat=server id="OpSide_1" />        </td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35" class="controlBoxDataGridFirstColumn">
      <euc:EformComboBox style="width:100;" Field="OpName" RefBy="OpName"  RecordId="2" Table="Procedures" runat=server id="OpName_2" />      </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:100;" Field="OpSurgeon" RecordId="2" Table="Procedures" runat=server id="OpSurgeon_2"  />	  </td>
      <td align="center">
        <euc:EFormSelect LookupCode="OpSide" runat=server  Field="OpSide" RecordId="2" Table="Procedures" runat=server id="OpSide_2" />        </td>
       <td>&nbsp;</td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35" class="controlBoxDataGridFirstColumn">
      <euc:EformComboBox LookupCode="ProcName" style="width:100;" Field="OpName" RefBy="OpName"  RecordId="3" Table="Procedures" runat=server id="OpName_3" />      </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:100;" Field="OpSurgeon" RecordId="3" Table="Procedures" runat=server id="OpSurgeon_3"  />	  </td>
      <td align="center">
        <euc:EFormSelect  LookupCode="OpSide" runat=server  Field="OpSide" RecordId="3" Table="Procedures" runat=server id="OpSide_3" />        </td>
      <td>&nbsp;</td>
    </tr>     
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35" class="controlBoxDataGridFirstColumn">
      <euc:EformComboBox style="width:100;" Field="OpName" RefBy="OpName"  RecordId="4" Table="Procedures" runat=server id="OpName_4" />      </td>
      <td>&nbsp;</td>
      <td>	
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:100;" Field="OpSurgeon" RecordId="4" Table="Procedures" runat=server id="OpSurgeon_4" />	  </td>
      <td align="center">
        <euc:EFormSelect LookupCode="OpSide" runat=server  Field="OpSide" RecordId="4" Table="Procedures" runat=server id="OpSide_4" />        </td>
      <td>&nbsp;</td>
    </tr>     
    <tr> 
      <td valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td align="right" valign="bottom" class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <!---
      <td align="center">&nbsp;</td>
-->
    </tr>
</table> 
  <br/><br/>