<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.NephrectomyAndAncillaryProcs" CodeFile="NephrectomyAndAncillaryProcs.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">

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



var attendingArray = [<asp:Repeater ID="AttendingArray" runat="server" ><ItemTemplate>"<%# DataBinder.Eval(Container.DataItem, "LkpCode") %>"</ItemTemplate><SeparatorTemplate>,</SeparatorTemplate></asp:Repeater>];

var fellowArray = [<asp:Repeater ID="FellowArray" runat="server" ><ItemTemplate>"<%# DataBinder.Eval(Container.DataItem, "LkpCode") %>"</ItemTemplate><SeparatorTemplate>,</SeparatorTemplate></asp:Repeater>];


var procedureSurgeonsArray = new Array();
<asp:Literal ID="ProcedureSurgeonsJSArray" runat="Server" />



function executePageEventOnComboClick(selVal, inputFieldName)
{




	if (inputFieldName.indexOf('OpSurgeon') > -1 || inputFieldName.indexOf('OpAssistant') > -1 || inputFieldName.indexOf('NeuralStimulationSurgeon') > -1 || inputFieldName.indexOf('NeuralStimulationAssistant') > -1 )
	{   
		var PhysicianType = '';

		for (var i = 0; i < fellowArray.length; i++)
		{
			if (fellowArray[i] == selVal)
			{
				PhysicianType = 'Fellow';
			}
		}
		 
		
		if (PhysicianType.length < 1)
		{
			for (var i = 0; i < attendingArray.length; i++)
			{
				if (attendingArray[i] == selVal)
				{
					PhysicianType = 'Attending';
				}
			}
		}

		setPhysicianType(PhysicianType, inputFieldName);
	}
	else if (inputFieldName.indexOf('OpName') > -1)
	{
		CopyProcPhysiciansTriggeredByCombo(inputFieldName);
	}
}


function CopyProcPhysiciansTriggeredByCombo(inputId)
{

	for (var k = 1; k < procedureSurgeonsArray.length; k++)
	{
		if(procedureSurgeonsArray[k][0] == inputId)
		{
			var OpNameInputElement = document.getElementById(inputId);
			copyProcedureInputValues(OpNameInputElement, procedureSurgeonsArray[0][1], procedureSurgeonsArray[k][1])
			copyProcedureInputValues(OpNameInputElement, procedureSurgeonsArray[0][2], procedureSurgeonsArray[k][2])
			copyProcedureInputValues(OpNameInputElement, procedureSurgeonsArray[0][3], procedureSurgeonsArray[k][3])
			copyProcedureInputValues(OpNameInputElement, procedureSurgeonsArray[0][4], procedureSurgeonsArray[k][4])
		}
	}
}	



function setPhysicianType(PhysicianType, inputFieldName)
{


	var currentInput = document.getElementById(inputFieldName);

	var nextCell = currentInput.parentNode.nextSibling;
	if(nextCell.nodeName != "TD") { nextCell = nextCell.nextSibling; }
	
	// walk through 
	if (nextCell.hasChildNodes()) {
	   
		for (j = 0; j < nextCell.childNodes.length; j++) {
			node = nextCell.childNodes[j];
			if (node.nodeName == 'INPUT') { 
				type = node.getAttribute('type');
				if (type == 'text') 
				{
					node.value = PhysicianType;
	//				alert(node.value + ' = ' + PhysicianType);
				}
			}
		}
	}

	
	
}

</script>
<style type="text/css">td {white-space: nowrap;}</style>
<a name="ProstatectomyAndAncillaryProcs" />
<span class="controlBoxTitle">&nbsp;&nbsp;Nephrectomy</span><br />
  <table width="700" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable">
    <tr> 
      <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="2" height="2" /></td>
      <td  width="145" height="25" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">Type</td>
      <td   class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px;" >Side</td>
      <td width="10" class="controlBoxDataGridHeader"><img src="../../Images/shim.gif" width="10" height="1" /></td>
      <td   class="controlBoxDataGridHeader" style="text-align: center;font-size:10px;" >Surgeon</td>
      <td   class="controlBoxDataGridHeader" style="font-size:10px;">Surgeon Type</td>
      <td width="10" class="controlBoxDataGridHeader"><img src="../../Images/shim.gif" width="10" height="1" /></td>
      <td   class="controlBoxDataGridHeader"  style="text-align: center; font-size:10px;">Assistant</td>
      <td   class="controlBoxDataGridHeader" style="font-size:10px;">Assistant Type</td>
      <td class="controlBoxDataGridHeader" style="font-size:10px;">Notes</td>
      <td width="2" align="right" valign="top" class="controlBox">&nbsp;<img src="../../Images/shim.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn">
        <euc:EformSelect RecordId="1" Table="Procedures" Field="ProcName" id="ProcName_1" LookupCode="OpTypeNephrectomy"  DropDownHeight="auto" DropDownWidth="auto" runat="server"  EnableHiddenOnUIEvent="ProcInstitution_1,ProcQuality_1,ProcDate_1,ProcDateText_1">
</euc:EformSelect>
        
        
      <euc:EformHidden id="ProcInstitution_1" runat="server" RecordId="1" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
      <euc:EformHidden id="ProcQuality_1" runat="server" RecordId="1" Table="Procedures" Field="ProcQuality" Value="STD" />
      <euc:EformHidden id="ProcDateText_1" Table="Procedures" Field="ProcDateText" RecordId="1" runat="server"/>
        <euc:EformHidden id="ProcDate_1" Table="Procedures" Field="ProcDate"  RecordId="1" runat="server"/>
      </td>
      <td class="controlBoxDataGridFirstColumn" style="padding-right:3px;"><euc:EFormSelect DropDownHeight="auto" DropDownWidth="auto"  style="width:56px;" LookupCode="OpSide" runat="server"  Field="ProcSide" RecordId="1" Table="Procedures" id="OpSide_1" />
      </td>
      <td>&nbsp;</td>
      <td><euc:EformComboBox Style="width:80" RecordId="1" LookupCode="OpSurgeon" DropDownWidth="200" ID="OpSurgeon" TABLE="Procedures" FIELD="ProcSurgeon" runat="server"  /></td>
      <td style="padding-left: 8px;"><euc:EFormSelect DropDownHeight="auto"  style="width:62" RecordId="1" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server" ID="OpSurgeonType" TABLE="Procedures" FIELD="ProcSurgeonType"/></td>
        <td>&nbsp;</td>
      <td><euc:EformComboBox Style="width:80" RecordId="1" LookupCode="OpSurgeon" DropDownWidth="200" ID="OpAssistant" TABLE="Procedures" FIELD="ProcAssistant" runat="server"/></td>
      <td style="padding-left: 8px;"><euc:EFormSelect DropDownHeight="auto"  style="width:62" RecordId="1" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server" ID="OpAssistantType" TABLE="Procedures" FIELD="ProcAssistantType"/></td>
      <td align="center"><euc:EformTextBox style="width: 50px;" ShowTextEditor="true" RecordId="1" ID="OpNotes" Table="Procedures" Field="ProcNotes" runat="server"/></td>
      <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
</table>

<br/><br/>
<!--Additional Procedures begin-->
<span class="controlBoxTitle">&nbsp;&nbsp;Ancillary Procedures</span><br />
  <table width="700" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable" id="AdditionalProceduresHtmlTable"  style="margin-bottom: 0px; border: solid 1px #cccccc;">
    <tr> 
      <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
      <td   height="25" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">Procedure</td>
      <td width="10" class="controlBoxDataGridHeader" style="font-size:10px;"><img src="../../Images/shim.gif" width="10" height="1" /></td>
      <td   class="controlBoxDataGridHeader" style="font-size:10px;">Surgeon</td>
      <td   class="controlBoxDataGridHeader" style="font-size:10px;">Surgeon Type</td>
      <td width="10" class="controlBoxDataGridHeader"><img src="../../Images/shim.gif" width="10" height="1" /></td>
      <td  class="controlBoxDataGridHeader" style="font-size:10px;">Assistant</td>
      <td   class="controlBoxDataGridHeader" style="font-size:10px;">Assistant Type</td>
      <td   class="controlBoxDataGridHeader" style="font-size:10px;">Side</td>
      <td class="controlBoxDataGridHeader" style="font-size:10px;">Notes</td>
      <td width="2" align="right" valign="top" class="controlBox">&nbsp;<img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35"  class="controlBoxDataGridFirstColumn">
      <euc:EformHidden id="ProcInstitution_2" runat="server" RecordId="2" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
      <euc:EformHidden id="ProcQuality_2" runat="server" RecordId="2" Table="Procedures" Field="ProcQuality" Value="STD" />
      <euc:EformHidden id="ProcDateText_2" Table="Procedures" Field="ProcDateText" RecordId="2" runat="server"/>
		    <euc:EformHidden id="ProcDate_2" Table="Procedures" Field="ProcDate"  RecordId="2" runat="server"/>
      <euc:EformCheckBox runat="server" Field="ProcName" RecordId="2" Table="Procedures" id="OpName_2" Value="Fat Excision" EnableHiddenOnUIEvent="ProcInstitution_2,ProcQuality_2,ProcDate_2,ProcDateText_2" /> Fat Excision
   
   </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  runat="server"  LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;" Field="ProcSurgeon" RecordId="2" Table="Procedures" id="OpSurgeon_2"  />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcSurgeonType" RecordId="2" Table="Procedures" id="OpSurgeonType_2" />      </td>
       <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  runat="server" LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;" Field="ProcAssistant" RecordId="2" Table="Procedures" id="OpAssistant_2" />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcAssistantType" RecordId="2" Table="Procedures" id="OpAssistantType_2" />      </td>
        <td>
        <euc:EFormSelect DropDownHeight="auto"  style="width:56px;" LookupCode="OpSide" DropDownWidth="auto" runat="server"  Field="ProcSide" RecordId="2" Table="Procedures" id="OpSide_2" />        </td>
        <td><euc:EformTextBox  style="width: 50px;" ShowTextEditor="true" ID="OpNotes_2" RecordId="2" Table="Procedures" Field="ProcNotes" runat="server"/></td>
       <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35"  class="controlBoxDataGridFirstColumn">
      <euc:EformHidden id="ProcInstitution_3" runat="server" RecordId="3" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
      <euc:EformHidden id="ProcQuality_3" runat="server" RecordId="3" Table="Procedures" Field="ProcQuality" Value="STD" />
      <euc:EformHidden id="ProcDateText_3" Table="Procedures" Field="ProcDateText" RecordId="3" runat="server"/>
		    <euc:EformHidden id="ProcDate_3" Table="Procedures" Field="ProcDate"  RecordId="3" runat="server"/>
      <euc:EformCheckBox runat="server" Field="ProcName" RecordId="3" Table="Procedures" id="OpName_3" Value="Margin Excision"   EnableHiddenOnUIEvent="ProcInstitution_3,ProcQuality_3,ProcDate_3,ProcDateText_3"/> Margin Excision
       </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  runat="server"  LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;" Field="ProcSurgeon" RecordId="3" Table="Procedures" id="OpSurgeon_3"  />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcSurgeonType" RecordId="3" Table="Procedures" id="OpSurgeonType_3" />      </td>
       <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  runat="server" LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;" Field="ProcAssistant" RecordId="3" Table="Procedures" id="OpAssistant_3" />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcAssistantType" RecordId="3" Table="Procedures" id="OpAssistantType_3" />      </td>
        <td>
        <euc:EFormSelect DropDownHeight="auto"  style="width:56px;" LookupCode="OpSide" DropDownWidth="auto" runat="server"  Field="ProcSide" RecordId="3" Table="Procedures" id="OpSide_3" />        </td>
        <td><euc:EformTextBox  style="width: 50px;" ShowTextEditor="true" ID="OpNotes_3" RecordId="3" Table="Procedures" Field="ProcNotes" runat="server"/></td>
       <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35"  class="controlBoxDataGridFirstColumn">
      <euc:EformHidden id="ProcInstitution_4" runat="server" RecordId="4" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
      <euc:EformHidden id="ProcQuality_4" runat="server" RecordId="4" Table="Procedures" Field="ProcQuality" Value="STD" />
      <euc:EformHidden id="ProcDateText_4" Table="Procedures" Field="ProcDateText" RecordId="4" runat="server"/>
		    <euc:EformHidden id="ProcDate_4" Table="Procedures" Field="ProcDate"  RecordId="4" runat="server"/>
      <euc:EformCheckBox runat="server" Field="ProcName" RecordId="4" Table="Procedures" id="OpName_4" Value="RLND"  EnableHiddenOnUIEvent="ProcInstitution_4,ProcQuality_4,ProcDate_4,ProcDateText_4" /> RLND
       </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  runat="server"  LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;" Field="ProcSurgeon" RecordId="4" Table="Procedures" id="OpSurgeon_4"   />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcSurgeonType" RecordId="4" Table="Procedures" id="OpSurgeonType_4" />      </td>
        <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  runat="server" style="width:80px;" LookupCode="OpSurgeon" DropDownWidth="200" Field="ProcAssistant" RecordId="4" Table="Procedures" id="OpAssistant_4" />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcAssistantType" RecordId="4" Table="Procedures" id="OpAssistantType_4" />      </td>
        <td>
        <euc:EFormSelect DropDownHeight="auto"  style="width:56px;" LookupCode="OpSide" DropDownWidth="auto" runat="server"  Field="ProcSide" RecordId="4" Table="Procedures" id="OpSide_4" />        </td>
        <td><euc:EformTextBox  style="width: 50px;" ShowTextEditor="true" ID="OpNotes_4" RecordId="4" Table="Procedures" Field="ProcNotes" runat="server"/></td>
      <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>     
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35"  class="controlBoxDataGridFirstColumn">
      <euc:EformHidden id="ProcInstitution_5" runat="server" RecordId="5" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
      <euc:EformHidden id="ProcQuality_5" runat="server" RecordId="5" Table="Procedures" Field="ProcQuality" Value="STD" />
      <euc:EformHidden id="ProcDateText_5" Table="Procedures" Field="ProcDateText" RecordId="5" runat="server"/>
		    <euc:EformHidden id="ProcDate_5" Table="Procedures" Field="ProcDate"  RecordId="5" runat="server"/>
      <euc:EformCheckBox runat="server" Field="ProcName" RecordId="5" Table="Procedures" id="OpName_5" Value="Adrenalectomy"  EnableHiddenOnUIEvent="ProcInstitution_5,ProcQuality_5,ProcDate_5,ProcDateText_5" /> Adrenalectomy
       </td>
        <td>&nbsp;</td>
      <td>	
	   <euc:EformComboBox  runat="server" LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;" Field="ProcSurgeon" RecordId="5" Table="Procedures" id="OpSurgeon_5"  />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcSurgeonType" RecordId="5" Table="Procedures" id="OpSurgeonType_5" />      </td>
        <td>&nbsp;</td>
      <td>	
	   <euc:EformComboBox   runat="server"  LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;"  Field="ProcAssistant" RecordId="5" Table="Procedures" id="OpAssistant_5" />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcAssistantType" RecordId="5" Table="Procedures" id="OpAssistantType_5" />      </td>
        
        <td>
        <euc:EFormSelect DropDownHeight="auto"  style="width:56px;" LookupCode="OpSide" DropDownWidth="auto" runat="server"  Field="ProcSide" RecordId="5" Table="Procedures" id="OpSide_5" />        </td>
        <td><euc:EformTextBox  style="width: 50px;" ShowTextEditor="true" ID="OpNotes_5" RecordId="5" Table="Procedures" Field="ProcNotes" runat="server"/></td>
      <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr>
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35"  class="controlBoxDataGridFirstColumn" style="white-space: normal;">
      <euc:EformHidden id="ProcInstitution_6" runat="server" RecordId="6" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
      <euc:EformHidden id="ProcQuality_6" runat="server" RecordId="6" Table="Procedures" Field="ProcQuality" Value="STD" />
      <euc:EformHidden id="ProcDateText_6" Table="Procedures" Field="ProcDateText" RecordId="6" runat="server"/>
		    <euc:EformHidden id="ProcDate_6" Table="Procedures" Field="ProcDate"  RecordId="6" runat="server"/>
      <euc:EformCheckBox runat="server" Field="ProcName" RecordId="6" Table="Procedures" id="OpName_6" Value="Rib Excision / Resection"  EnableHiddenOnUIEvent="ProcInstitution_6,ProcQuality_6,ProcDate_6,ProcDateText_6" /> Rib Excision /<br /><span style="margin-left: 25px;">Resection</span>
       
        
        </td>
      <td>&nbsp;</td>
      <td><euc:EformComboBox  runat="server" LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;" Field="ProcSurgeon" RecordId="6" Table="Procedures" id="OpSurgeon_6"  />      </td>
      <td><euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcSurgeonType" RecordId="6" Table="Procedures" id="OpSurgeonType_6" />      </td>
      <td>&nbsp;</td>
      <td><euc:EformComboBox   runat="server"  LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;"  Field="ProcAssistant" RecordId="6" Table="Procedures" id="OpAssistant_6" />      </td>
      <td><euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcAssistantType" RecordId="6" Table="Procedures" id="OpAssistantType_6" />      </td>
      <td><euc:EFormSelect DropDownHeight="auto"  style="width:56px;" LookupCode="OpSide" DropDownWidth="auto" runat="server"  Field="ProcSide" RecordId="6" Table="Procedures" id="OpSide_6" />      </td>
      <td><euc:EformTextBox  style="width: 50px;" ShowTextEditor="true" ID="OpNotes_6" RecordId="6" Table="Procedures" Field="ProcNotes" runat="server"/></td>
      <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr>
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35"  class="controlBoxDataGridFirstColumn" style="white-space: normal;">
      <euc:EformHidden id="ProcInstitution_7" runat="server" RecordId="7" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
      <euc:EformHidden id="ProcQuality_7" runat="server" RecordId="7" Table="Procedures" Field="ProcQuality" Value="STD" />
            <euc:EformHidden id="ProcDateText_7" Table="Procedures" Field="ProcDateText" RecordId="7" runat="server"/>
		    <euc:EformHidden id="ProcDate_7" Table="Procedures" Field="ProcDate"  RecordId="7" runat="server"/>
      <euc:EformCheckBox runat="server" Field="ProcName" RecordId="7" Table="Procedures" id="OpName_7" Value="Renal Vein Thrombectomy"  EnableHiddenOnUIEvent="ProcInstitution_7,ProcQuality_7,ProcDate_7,ProcDateText_7" /> Renal Vein<br /><span style="margin-left: 25px;">Thrombectomy</span> 
        </td>
      <td>&nbsp;</td>
      <td>
      <euc:EformComboBox  runat="server" LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;" Field="ProcSurgeon" RecordId="7" Table="Procedures" id="OpSurgeon_7"  />
      </td>
      <td><euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcSurgeonType" RecordId="7" Table="Procedures" id="OpSurgeonType_7" />
      </td>
      <td>&nbsp;</td>
      <td><euc:EformComboBox   runat="server"  LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;"  Field="ProcAssistant" RecordId="7" Table="Procedures" id="OpAssistant_7" />
      </td>
      <td><euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcAssistantType" RecordId="7" Table="Procedures" id="OpAssistantType_7" />
      </td>
      <td><euc:EFormSelect DropDownHeight="auto"  style="width:56px;" LookupCode="OpSide" DropDownWidth="auto" runat="server"  Field="ProcSide" RecordId="7" Table="Procedures" id="OpSide_7" />
      </td>
      <td><euc:EformTextBox  style="width: 50px;" ShowTextEditor="true" ID="OpNotes_7" RecordId="7" Table="Procedures" Field="ProcNotes" runat="server"/></td>
      <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr > 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35" class="controlBoxDataGridFirstColumn">
          <euc:EformComboBox runat="server"  LookupCode="ProcName" style="width:110px;" Field="ProcName" RefBy="OpName"  RecordId="8" Table="Procedures" MaxLength="50" id="OpName_8"  EnableHiddenOnUIEvent="ProcInstitution_8,ProcQuality_8,ProcDate_8,ProcDateText_8" />
       
      </td>
      <td>&nbsp;</td>
      <td>
      <euc:EformHidden id="ProcInstitution_8" runat="server" RecordId="8" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
      <euc:EformHidden id="ProcQuality_8" runat="server" RecordId="8" Table="Procedures" Field="ProcQuality" Value="STD" />
      <euc:EformHidden id="ProcDateText_8" Table="Procedures" Field="ProcDateText" RecordId="8" runat="server"/>
		    <euc:EformHidden id="ProcDate_8" Table="Procedures" Field="ProcDate"  RecordId="8" runat="server"/>
	   <euc:EformComboBox  runat="server"  LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;" Field="ProcSurgeon" RecordId="8" Table="Procedures" id="OpSurgeon_8" />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcSurgeonType" RecordId="8" Table="Procedures" id="OpSurgeonType_8" />      </td>
        <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  runat="server" style="width:80px;" LookupCode="OpSurgeon" DropDownWidth="200" Field="ProcAssistant" RecordId="8" Table="Procedures" id="OpAssistant_8" />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcAssistantType" RecordId="8" Table="Procedures" id="OpAssistantType_8" />      </td>
        <td>
        <euc:EFormSelect DropDownHeight="auto"  style="width:56px;" LookupCode="OpSide" DropDownWidth="auto" runat="server"  Field="ProcSide" RecordId="8" Table="Procedures" id="OpSide_8" />        </td>
        <td><euc:EformTextBox  style="width: 50px;" ShowTextEditor="true" ID="OpNotes_8" RecordId="8" Table="Procedures" Field="ProcNotes" runat="server"/></td>
      <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr style="display: none;"> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35" class="controlBoxDataGridFirstColumn">
      <euc:EformHidden id="ProcInstitution_9" runat="server" RecordId="9" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
      <euc:EformHidden id="ProcQuality_9" runat="server" RecordId="9" Table="Procedures" Field="ProcQuality" Value="STD" />
      <euc:EformHidden id="ProcDateText_9" Table="Procedures" Field="ProcDateText" RecordId="9" runat="server"/>
		    <euc:EformHidden id="ProcDate_9" Table="Procedures" Field="ProcDate"  RecordId="9" runat="server"/>
      <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:110px;" Field="ProcName" RefBy="OpName"  RecordId="9" Table="Procedures" MaxLength="50" id="OpName_9"  EnableHiddenOnUIEvent="ProcInstitution_9,ProcQuality_9,ProcDate_9,ProcDateText_9" />
       </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  runat="server"  LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;" Field="ProcSurgeon" RecordId="9" Table="Procedures" id="OpSurgeon_9"  />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcSurgeonType" RecordId="9" Table="Procedures" id="OpSurgeonType_9" />      </td>
        <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  runat="server" style="width:80px;" LookupCode="OpSurgeon" DropDownWidth="200" Field="ProcAssistant" RecordId="9" Table="Procedures" id="OpAssistant_9" />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcAssistantType" RecordId="9" Table="Procedures" id="OpAssistantType_9" />      </td>
        <td>
        <euc:EFormSelect DropDownHeight="auto"  style="width:56px;" LookupCode="OpSide" DropDownWidth="auto" runat="server"  Field="ProcSide" RecordId="9" Table="Procedures" id="OpSide_9" />        </td>
        <td><euc:EformTextBox   style="width: 50px;" ShowTextEditor="true" ID="OpNotes_9" RecordId="9" Table="Procedures" Field="ProcNotes" runat="server"/></td>
      <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr style="display: none;"> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
      <td height="35" class="controlBoxDataGridFirstColumn">
      <euc:EformHidden id="ProcInstitution_10" runat="server" RecordId="10" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
      <euc:EformHidden id="ProcQuality_10" runat="server" RecordId="10" Table="Procedures" Field="ProcQuality" Value="STD" />
      <euc:EformHidden id="ProcDateText_10" Table="Procedures" Field="ProcDateText" RecordId="10" runat="server"/>
		    <euc:EformHidden id="ProcDate_10" Table="Procedures" Field="ProcDate"  RecordId="10" runat="server"/>
      <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:110px;" Field="ProcName" RefBy="OpName"  RecordId="10" Table="Procedures" MaxLength="50" id="OpName_10"  EnableHiddenOnUIEvent="ProcInstitution_10,ProcQuality_10,ProcDate_10,ProcDateText_10" />
     </td>
      <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  runat="server"  LookupCode="OpSurgeon" DropDownWidth="200" style="width:80px;" Field="ProcSurgeon" RecordId="10" Table="Procedures" id="OpSurgeon_10"  />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcSurgeonType" RecordId="10" Table="Procedures" id="OpSurgeonType_10" />      </td>
        <td>&nbsp;</td>
      <td>
	   <euc:EformComboBox  runat="server" style="width:80px;" LookupCode="OpSurgeon" DropDownWidth="200" Field="ProcAssistant" RecordId="10" Table="Procedures" id="OpAssistant_10" />	  </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"  style="width:62px;" LookupCode="OpSurgeonType" DropDownWidth="82"  runat="server"  Field="ProcAssistantType" RecordId="10" Table="Procedures" id="OpAssistantType_10" />      </td>
        <td>
        <euc:EFormSelect DropDownHeight="auto"  style="width:56px;" LookupCode="OpSide" DropDownWidth="auto" runat="server"  Field="ProcSide" RecordId="10" Table="Procedures" id="OpSide_10" />        </td>
        <td><euc:EformTextBox  style="width: 50px;" ShowTextEditor="true" ID="OpNotes_10" RecordId="10" Table="Procedures" Field="ProcNotes" runat="server"/></td>
      <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>	<tr> 
      <td valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="2" height="2" /></td>
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
</table>
  <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" onclick="return showFirstAdditionalRow(this,'AdditionalProceduresHtmlTable');" style="margin-left: 6px;" /><br/>
  <br/><br/><br/>