<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.EndoORProcedures" CodeFile="EndoORProcedures.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<script type="text/javascript" language="javascript">

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

function copyProcedureInputValues(OpNameInputElement, SourceField, TargetField)
{
	if (OpNameInputElement.type == "checkbox")
	{
		if (OpNameInputElement.checked)
		{
			document.getElementById(TargetField).value = document.getElementById(SourceField).value;
		}
		else
		{
			document.getElementById(TargetField).value = "";
		}
	}
	else
	{
		if (OpNameInputElement.value.length > 0)
		{
			document.getElementById(TargetField).value = document.getElementById(SourceField).value;
		}
		else
		{
			document.getElementById(TargetField).value = "";
		}	
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


tableArray.AdditionalProceduresHtmlTable = "AdditionalProceduresHtmlTable";


</script>

<a name="ProstatectomyAndAncillaryProcs" />

<!--Additional Procedures begin-->
<span class="controlBoxTitle">&nbsp;&nbsp;Procedures</span><br />
  <table width="700" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable" id="AdditionalProceduresHtmlTable"  style="margin-bottom: 0px; border: solid 1px #cccccc;">
    <tr> 
      <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
      <td   height="25" class="controlBoxDataGridHeaderFirstCol">Procedure</td>
      <td width="10" class="controlBoxDataGridHeader"><img src="../../../Images/shim.gif" width="10" height="1" /></td>
      <td   class="controlBoxDataGridHeader">Surgeon</td>
      <td   class="controlBoxDataGridHeader">Surgeon Type</td>
      <td width="10" class="controlBoxDataGridHeader"><img src="../../../Images/shim.gif" width="10" height="1" /></td>
      <td  class="controlBoxDataGridHeader">Assistant</td>
      <td   class="controlBoxDataGridHeader">Assistant Type</td>
      <td   class="controlBoxDataGridHeader">Side</td>
      <td class="controlBoxDataGridHeader">Notes</td>
      <td width="2" align="right" valign="top" class="controlBox">&nbsp;<img src="../../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn" >&nbsp;</td>
      <td height="35"  class="controlBoxDataGridFirstColumn">
	  
	  
	  <euc:EformCheckBox runat="server" Field="OpName" RecordId="1" Table="Procedures" id="OpName_1" Value="Cystoscopy" />
      Cystoscopy      </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox LookupCode="OpSurgeon" RefBy="CaseSurgeon" style="width:80;" Field="OpSurgeon" RecordId="1" Table="Procedures" runat="server" id="OpSurgeon_1" />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpSurgeonType" RecordId="1" Table="Procedures" id="OpSurgeonType_1" />      </td>
        <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:80;" Field="OpAssistant" RecordId="1" Table="Procedures" runat="server" id="OpAssistant_1"  />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpAssistantType" RecordId="1" Table="Procedures" id="OpAssistantType_1" />      </td>
        <td>
        <euc:EFormSelect style="width:80;" LookupCode="OpSide" runat="server"  Field="OpSide" RecordId="1" Table="Procedures" id="OpSide_1" />        </td>
        <td><euc:EformTextBox size="10" ID="OpNotes_1" RecordId="1" Table="Procedures" Field="OpNotes" runat="server"/></td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35"  class="controlBoxDataGridFirstColumn"><euc:EformCheckBox runat="server" Field="OpName" RecordId="2" Table="Procedures" id="OpName_2" Value="EUA" />
        EUA</td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:80;" Field="OpSurgeon" RecordId="2" Table="Procedures" runat="server" id="OpSurgeon_2"  />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpSurgeonType" RecordId="2" Table="Procedures" id="OpSurgeonType_2" />      </td>
       <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox RefBy="CaseSurgeon" style="width:80;" Field="OpAssistant" RecordId="2" Table="Procedures" runat="server" id="OpAssistant_2" />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpAssistantType" RecordId="2" Table="Procedures" id="OpAssistantType_2" />      </td>
        <td>
        <euc:EFormSelect style="width:80;" LookupCode="OpSide" runat="server"  Field="OpSide" RecordId="2" Table="Procedures" id="OpSide_2" />        </td>
        <td><euc:EformTextBox size="10" ID="OpNotes_2" RecordId="2" Table="Procedures" Field="OpNotes" runat="server"/></td>
       <td>&nbsp;</td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35"  class="controlBoxDataGridFirstColumn"><euc:EformCheckBox runat="server" Field="OpName" RecordId="3" Table="Procedures" id="OpName_3" Value="TUR-BT" />
        TUR-BT </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:80;" Field="OpSurgeon" RecordId="3" Table="Procedures" runat="server" id="OpSurgeon_3"  />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpSurgeonType" RecordId="3" Table="Procedures" id="OpSurgeonType_3" />      </td>
        <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox style="width:80;" RefBy="CaseSurgeon" Field="OpAssistant" RecordId="3" Table="Procedures" runat="server" id="OpAssistant_3" />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpAssistantType" RecordId="3" Table="Procedures" id="OpAssistantType_3" />      </td>
        <td>
        <euc:EFormSelect style="width:80;" LookupCode="OpSide" runat="server"  Field="OpSide" RecordId="3" Table="Procedures" id="OpSide_3" />        </td>
        <td><euc:EformTextBox size="10" ID="OpNotes_3" RecordId="3" Table="Procedures" Field="OpNotes" runat="server"/></td>
      <td>&nbsp;</td>
    </tr>     
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35" class="controlBoxDataGridFirstColumn">
      <euc:EformCheckBox runat="server" Field="OpName" RecordId="4" Table="Procedures" id="OpName_4" Value="Transurethral Biopsy" />
        Transurethral Biopsy </td>
      <td>&nbsp;</td>
      <td>	
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:80;" Field="OpSurgeon" RecordId="4" Table="Procedures" runat="server" id="OpSurgeon_4" />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpSurgeonType" RecordId="4" Table="Procedures" id="OpSurgeonType_4" />      </td>
        <td>&nbsp;</td>
      <td>	
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:80;"  Field="OpAssistant" RecordId="4" Table="Procedures" runat="server" id="OpAssistant_4" />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpAssistantType" RecordId="4" Table="Procedures" id="OpAssistantType_4" />      </td>
        
        <td>
        <euc:EFormSelect style="width:80;" LookupCode="OpSide" runat="server"  Field="OpSide" RecordId="4" Table="Procedures" id="OpSide_4" />        </td>
        <td><euc:EformTextBox size="10" ID="OpNotes_4" RecordId="4" Table="Procedures" Field="OpNotes" runat="server"/></td>
      <td>&nbsp;</td>
    </tr>
<tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn" >&nbsp;</td>
      <td height="35"  class="controlBoxDataGridFirstColumn">
      <euc:EformComboBox style="width:80;" LookupCode="ProcName" RefBy="OpName"  Field="OpName" RecordId="5" Table="Procedures" runat="server" id="OpName_5" />      </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:80;" Field="OpSurgeon" RecordId="5" Table="Procedures" runat="server" id="OpSurgeon_5" />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpSurgeonType" RecordId="5" Table="Procedures" id="OpSurgeonType_5" />      </td>
        <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:80;" Field="OpAssistant" RecordId="5" Table="Procedures" runat="server" id="OpAssistant_5"  />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpAssistantType" RecordId="5" Table="Procedures" id="OpAssistantType_5" />      </td>
        <td>
        <euc:EFormSelect style="width:80;" LookupCode="OpSide" runat="server"  Field="OpSide" RecordId="5" Table="Procedures" id="OpSide_5" />        </td>
        <td><euc:EformTextBox size="10" ID="OpNotes_5" RecordId="5" Table="Procedures" Field="OpNotes" runat="server"/></td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35" class="controlBoxDataGridFirstColumn">
      <euc:EformComboBox style="width:80;" Field="OpName" RefBy="OpName"  RecordId="6" Table="Procedures" runat="server" id="OpName_6" />      </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:80;" Field="OpSurgeon" RecordId="6" Table="Procedures" runat="server" id="OpSurgeon_6"  />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpSurgeonType" RecordId="6" Table="Procedures" id="OpSurgeonType_6" />      </td>
       <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox RefBy="CaseSurgeon" style="width:80;" Field="OpAssistant" RecordId="6" Table="Procedures" runat="server" id="OpAssistant_6" />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpAssistantType" RecordId="6" Table="Procedures" id="OpAssistantType_6" />      </td>
        <td>
        <euc:EFormSelect style="width:80;" LookupCode="OpSide" runat="server"  Field="OpSide" RecordId="6" Table="Procedures" id="OpSide_6" />        </td>
        <td><euc:EformTextBox size="10" ID="OpNotes_6" RecordId="6" Table="Procedures" Field="OpNotes" runat="server"/></td>
       <td>&nbsp;</td>
    </tr>
    <tr style="display: none;"> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35" class="controlBoxDataGridFirstColumn">
      <euc:EformComboBox LookupCode="ProcName" style="width:80;" Field="OpName" RefBy="OpName"  RecordId="7" Table="Procedures" runat="server" id="OpName_7" />      </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:80;" Field="OpSurgeon" RecordId="7" Table="Procedures" runat="server" id="OpSurgeon_7"  />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpSurgeonType" RecordId="7" Table="Procedures" id="OpSurgeonType_7" />      </td>
        <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox style="width:80;" RefBy="CaseSurgeon" Field="OpAssistant" RecordId="7" Table="Procedures" runat="server" id="OpAssistant_7" />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpAssistantType" RecordId="7" Table="Procedures" id="OpAssistantType_7" />      </td>
        <td>
        <euc:EFormSelect style="width:80;" LookupCode="OpSide" runat="server"  Field="OpSide" RecordId="7" Table="Procedures" id="OpSide_7" />        </td>
        <td><euc:EformTextBox size="10" ID="OpNotes_7" RecordId="7" Table="Procedures" Field="OpNotes" runat="server"/></td>
      <td>&nbsp;</td>
    </tr>
    <tr style="display: none;"> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35" class="controlBoxDataGridFirstColumn">
      <euc:EformComboBox LookupCode="ProcName" style="width:80;" Field="OpName" RefBy="OpName"  RecordId="8" Table="Procedures" runat="server" id="OpName_8" />      </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  RefBy="CaseSurgeon" style="width:80;" Field="OpSurgeon" RecordId="8" Table="Procedures" runat="server" id="OpSurgeon_8"  />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpSurgeonType" RecordId="8" Table="Procedures" id="OpSurgeonType_8" />      </td>
        <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox style="width:80;" RefBy="CaseSurgeon" Field="OpAssistant" RecordId="8" Table="Procedures" runat="server" id="OpAssistant_8" />	  </td>
      <td>
      <euc:EFormSelect style="width:80;" LookupCode="OpSurgeonType" runat="server"  Field="OpAssistantType" RecordId="8" Table="Procedures" id="OpAssistantType_8" />      </td>
        <td>
        <euc:EFormSelect style="width:80;" LookupCode="OpSide" runat="server"  Field="OpSide" RecordId="8" Table="Procedures" id="OpSide_8" />        </td>
        <td><euc:EformTextBox size="10" ID="OpNotes_8" RecordId="8" Table="Procedures" Field="OpNotes" runat="server"/></td>
      <td>&nbsp;</td>
    </tr>
	<tr> 
      <td valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td align="right" valign="bottom" class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
<!---
      <td align="center">&nbsp;</td>
-->
      <td>&nbsp;</td>
    </tr>
</table><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" onclick="return showFirstAdditionalRow(this,'AdditionalProceduresHtmlTable');" style="margin-left: 6px;" /><br/>
  <br/> <br/> <br/>