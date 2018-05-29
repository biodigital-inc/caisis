<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.RegionalLymphNodes" CodeFile="RegionalLymphNodes.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<script type="text/javascript" >

var CentralCompartmentNodeIdArray = [<asp:Literal ID="CentralCompartmentNodeClientIds" runat="server" />];
var LateralNeckNodeIdArray = [<asp:Literal ID="LateralNeckNodeClientIds" runat="server" />];
var CentralCompartmentNoneId = '<asp:Literal ID="CentralCompartmentNoneId" runat="server" />';
var LateralNeckNoneId = '<asp:Literal ID="LateralNeckNoneId" runat="server" />';


function uncheckNoneBoxIfNecessary(checkbox,checkboxNoneId)
{
	//if (checkbox.checked) document.getElementById(checkboxNoneId).checked = false;
	
}

function uncheckNodes(nodeIdArray)
{
	for (i=0;i<nodeIdArray.length;i++)
	{
		document.getElementById(nodeIdArray[i]).checked = false;
	}
}

function showCheckChildControl(indicatorCheckBox)
{
    if (!indicatorCheckBox)
        return;
        
    if (indicatorCheckBox.id.indexOf('CentralCompartment')>-1)
	{
	    document.getElementById('CentralCompartmentTable').style.display = indicatorCheckBox.checked ? 'block' : 'none';
	}
	else
	{
	    document.getElementById('LateralNeckNodeTable').style.display = indicatorCheckBox.checked ? 'block' : 'none';
	}
}

function uncheckIfNecessary(indicatorCheckbox)
{
	if (!indicatorCheckbox.checked)
	{
		if (indicatorCheckbox.id.indexOf('CentralCompartment')>-1)
		{
			uncheckNodes(CentralCompartmentNodeIdArray);
			disableAllHiddenFieldsInTable('CentralCompartmentTable');
		}
		else
		{
			uncheckNodes(LateralNeckNodeIdArray);
			disableAllHiddenFieldsInTable('LateralNeckNodeTable');
		}
	}
}

function disableAllHiddenFieldsInTable(tableId)
{
		
		var numInputs = document.getElementById(tableId).getElementsByTagName('input').length;

		for (i=0;i<numInputs;i++) 
		{
			if (document.getElementById(tableId).getElementsByTagName('input')[i].getAttribute('type').toUpperCase().indexOf('HIDDEN')>-1)
			{
				document.getElementById(tableId).getElementsByTagName('input')[i].disabled = true;
			}
		}
}

</script>


<a name="RegionalLymphNodes" id="RegionalLymphNodes" />

<table  cellspacing="0" width="638" class="eformLargePopulatedTable" >
<tr><td style="padding: 8px;">


<span class="controlBoxTitle">Palpable Central Compartment Nodes</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<euc:EformCheckBox Table="NoTable" Field="CentralCompartmentNodes" id="PalpableCentralCompartmentNodesNone" runat="server" Value="Not Abnormal" Text="Yes" AppendToOnChange="showCheckChildControl(this); uncheckIfNecessary(this);"  />
<table  cellspacing="0" id="CentralCompartmentTable" style="display:none; width: 100%;" >
    <tr><td><table style="margin-top: 10px; margin-bottom: 20px; margin-left: 16px; width: 100%;">

        <tr >
          <td style="width: 30%; ">
		      <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="11" Field="ProcFinding" id="ProcFinding_RLN_2" runat="server" Value="Palpable Nodes" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="11" Field="ProcFindSide" id="ProcFindSide_RLN_2" runat="server" Value="Left" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="11" Field="ProcFindSite" id="ProcFindSite_RLN_2" runat="server" Value="Thyroid" />
              <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="11" Field="ProcFindSubsite" id="ProcFindSubsite_RLN_2" runat="server" Value="Perithyroid" Text="Left Perithyroid" EnableHiddenOnUIEvent="ProcFinding_RLN_2,ProcFindSide_RLN_2,ProcFindSite_RLN_2" AppendToOnChange="uncheckNoneBoxIfNecessary(this,CentralCompartmentNoneId);" />			</td>
            <td style="width: 30%; "   >
			<td  style="width: 40%;">
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="12" Field="ProcFinding" id="ProcFinding_RLN_1" runat="server" Value="Palpable Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="12" Field="ProcFindSide" id="ProcFindSide_RLN_1" runat="server" Value="Right" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="12" Field="ProcFindSite" id="ProcFindSite_RLN_1" runat="server" Value="Thyroid" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="12" Field="ProcFindSubsite" id="ProcFindSubsite_RLN_1" runat="server" Value="Perithyroid" Text="Right Perithyroid" EnableHiddenOnUIEvent="ProcFinding_RLN_1,ProcFindSide_RLN_1,ProcFindSite_RLN_1" AppendToOnChange="uncheckNoneBoxIfNecessary(this,CentralCompartmentNoneId);"  />			</td>
		</tr>		
		
		<tr>
		  <td style="width: 30%; "  >
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="13" Field="ProcFinding" id="ProcFinding_RLN_5" runat="server" Value="Palpable Nodes" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="13" Field="ProcFindSide" id="ProcFindSide_RLN_5" runat="server" Value="Left" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="13" Field="ProcFindSite" id="ProcFindSite_RLN_5" runat="server" Value="Thyroid" />
              <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="13" Field="ProcFindSubsite" id="ProcFindSubsite_RLN_5" runat="server" Value="Paratracheal" Text="Left Paratracheal" EnableHiddenOnUIEvent="ProcFinding_RLN_5,ProcFindSide_RLN_5,ProcFindSite_RLN_5" AppendToOnChange="uncheckNoneBoxIfNecessary(this,CentralCompartmentNoneId);"  />		    </td>
            <td style="width: 30%; "   >
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="17" Field="ProcFinding" id="ProcFinding_RLN_3" runat="server" Value="Palpable Nodes" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="17" Field="ProcFindSide" id="ProcFindSide_RLN_3" runat="server" Value="Central" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="17" Field="ProcFindSite" id="ProcFindSite_RLN_3" runat="server" Value="Thyroid" />
              <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="17" Field="ProcFindSubsite" id="ProcFindSubsite_RLN_3" runat="server" Value="Central Compartment" Text="Central Compartment" EnableHiddenOnUIEvent="ProcFinding_RLN_3,ProcFindSide_RLN_3,ProcFindSite_RLN_3" AppendToOnChange="uncheckNoneBoxIfNecessary(this,CentralCompartmentNoneId);"  />		    		    </td>
		    <td style="width: 40%; white-space:nowrap "   >
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="14" Field="ProcFinding" id="ProcFinding_RLN_4" runat="server" Value="Palpable Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="14" Field="ProcFindSide" id="ProcFindSide_RLN_4" runat="server" Value="Right" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="14" Field="ProcFindSite" id="ProcFindSite_RLN_4" runat="server" Value="Thyroid" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="14" Field="ProcFindSubsite" id="ProcFindSubsite_RLN_4" runat="server" Value="Paratracheal" Text="Right Paratracheal" EnableHiddenOnUIEvent="ProcFinding_RLN_4,ProcFindSide_RLN_4,ProcFindSite_RLN_4" AppendToOnChange="uncheckNoneBoxIfNecessary(this,CentralCompartmentNoneId);"  />		    </td>
		</tr>
		<tr>
		  <td style="width: 30%; white-space:nowrap "  >
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="15" Field="ProcFinding" id="ProcFinding_RLN_7" runat="server" Value="Palpable Nodes" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="15" Field="ProcFindSide" id="ProcFindSide_RLN_7" runat="server" Value="Left" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="15" Field="ProcFindSite" id="ProcFindSite_RLN_7" runat="server" Value="Thyroid" />
              <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="15" Field="ProcFindSubsite" id="ProcFindSubsite_RLN_7" runat="server" Value="Superior Mediastinum" Text="Left Superior Mediastinum" EnableHiddenOnUIEvent="ProcFinding_RLN_7,ProcFindSide_RLN_7,ProcFindSite_RLN_7" AppendToOnChange="uncheckNoneBoxIfNecessary(this,CentralCompartmentNoneId);"  />		    </td>
            <td style="width: 30%; white-space:nowrap ">
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="18" Field="ProcFinding" id="ProcFinding_RLN_8" runat="server" Value="Palpable Nodes" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="18" Field="ProcFindSide" id="ProcFindSide_RLN_8" runat="server" Value="Central" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="18" Field="ProcFindSite" id="ProcFindSite_RLN_8" runat="server" Value="Thyroid" />
              <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="18" Field="ProcFindSubsite" id="ProcFindSubsite_RLN_8" runat="server" Value="Superior Mediastinum" Text="Central Superior Mediastinum" EnableHiddenOnUIEvent="ProcFinding_RLN_8,ProcFindSide_RLN_8,ProcFindSite_RLN_8" AppendToOnChange="uncheckNoneBoxIfNecessary(this,CentralCompartmentNoneId);"  />		    		    </td>
              
		    <td style="width: 40%; " >
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="16" Field="ProcFinding" id="ProcFinding_RLN_6" runat="server" Value="Palpable Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="16" Field="ProcFindSide" id="ProcFindSide_RLN_6" runat="server" Value="Right" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="16" Field="ProcFindSite" id="ProcFindSite_RLN_6" runat="server" Value="Thyroid" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="16" Field="ProcFindSubsite" id="ProcFindSubsite_RLN_6" runat="server" Value="Superior Mediastinum" Text="Right Superior Mediastinum" EnableHiddenOnUIEvent="ProcFinding_RLN_6,ProcFindSide_RLN_6,ProcFindSite_RLN_6" AppendToOnChange="uncheckNoneBoxIfNecessary(this,CentralCompartmentNoneId);"  />		    </td>
		</tr>
		  
	    </table></td></tr>
</table>
</td></tr>
</table>




<br/><br/><br/>

<table  cellspacing="0" width="638" class="eformLargePopulatedTable" >
<tr><td style="padding: 8px;">

<span class="controlBoxTitle">Palpable Lateral Neck Nodes</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<euc:EformCheckBox Table="NoTable" Field="LateralNeckNodes" id="PalpableLateralNeckNodesNone" runat="server" Value="Not Abnormal" Text="Yes" AppendToOnChange="showCheckChildControl(this); uncheckIfNecessary(this);"  />

<table  cellspacing="0"   id="LateralNeckNodeTable" style="display:none; width: 50%;" >
    <tr><td>
	<euc:EformHidden Table="Procedures" RecordId="2" Field="ProcName" id="ProcName_NN" runat="server" Value="Lymph Node Dissection" />
	<euc:EformHidden Table="Procedures" RecordId="2" Field="ProcSite" id="ProcSite_NN" runat="server" Value="Neck" />
    <table style="margin-top: 10px; margin-bottom: 20px; margin-left: 16px; width: 100%">
        <tr >
          <td style="width: 50%; ">
		      <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="1" Field="ProcFinding" id="ProcFinding_NN_1" runat="server" Value="Palpable Nodes" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="1" Field="ProcFindSide" id="ProcFindSide_NN_1" runat="server" Value="Left" />
              <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="1" Field="ProcFindSite" id="ProcFindSite_NN_1" runat="server" Value="Level I" Text="Left I" EnableHiddenOnUIEvent="ProcName_NN,ProcSite_NN,ProcFinding_NN_1,ProcFindSide_NN_1"  AppendToOnChange="uncheckNoneBoxIfNecessary(this,LateralNeckNoneId);" />			</td>
			<td  style="width: 50%;">
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="2" Field="ProcFinding" id="ProcFinding_NN_2" runat="server" Value="Palpable Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="2" Field="ProcFindSide" id="ProcFindSide_NN_2" runat="server" Value="Right" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="2" Field="ProcFindSite" id="ProcFindSite_NN_2" runat="server" Value="Level I" Text="Right I" EnableHiddenOnUIEvent="ProcName_NN,ProcSite_NN,ProcFinding_NN_2,ProcFindSide_NN_2"  AppendToOnChange="uncheckNoneBoxIfNecessary(this,LateralNeckNoneId);"/>			</td>
		</tr>
        <tr >
          <td >
		      <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="3" Field="ProcFinding" id="ProcFinding_NN_3" runat="server" Value="Palpable Nodes" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="3" Field="ProcFindSide" id="ProcFindSide_NN_3" runat="server" Value="Left" />
              <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="3" Field="ProcFindSite" id="ProcFindSite_NN_3" runat="server" Value="Level II" Text="Left II" EnableHiddenOnUIEvent="ProcName_NN,ProcSite_NN,ProcFinding_NN_3,ProcFindSide_NN_3"  AppendToOnChange="uncheckNoneBoxIfNecessary(this,LateralNeckNoneId);"/>			</td>
			<td >
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="4" Field="ProcFinding" id="ProcFinding_NN_4" runat="server" Value="Palpable Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="4" Field="ProcFindSide" id="ProcFindSide_NN_4" runat="server" Value="Right" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="4" Field="ProcFindSite" id="ProcFindSite_NN_4" runat="server" Value="Level II" Text="Right II" EnableHiddenOnUIEvent="ProcName_NN,ProcSite_NN,ProcFinding_NN_4,ProcFindSide_NN_4"  AppendToOnChange="uncheckNoneBoxIfNecessary(this,LateralNeckNoneId);"/>			</td>
		</tr>
        <tr >
          <td >
		      <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="5" Field="ProcFinding" id="ProcFinding_NN_5" runat="server" Value="Palpable Nodes" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="5" Field="ProcFindSide" id="ProcFindSide_NN_5" runat="server" Value="Left" />
              <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="5" Field="ProcFindSite" id="ProcFindSite_NN_5" runat="server" Value="Level III" Text="Left III" EnableHiddenOnUIEvent="ProcName_NN,ProcSite_NN,ProcFinding_NN_5,ProcFindSide_NN_5"  AppendToOnChange="uncheckNoneBoxIfNecessary(this,LateralNeckNoneId);"/>			</td>
			<td >
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="6" Field="ProcFinding" id="ProcFinding_NN_6" runat="server" Value="Palpable Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="6" Field="ProcFindSide" id="ProcFindSide_NN_6" runat="server" Value="Right" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="6" Field="ProcFindSite" id="ProcFindSite_NN_6" runat="server" Value="Level III" Text="Right III" EnableHiddenOnUIEvent="ProcName_NN,ProcSite_NN,ProcFinding_NN_6,ProcFindSide_NN_6"  AppendToOnChange="uncheckNoneBoxIfNecessary(this,LateralNeckNoneId);"/>			</td>
		</tr>	
        <tr >
          <td >
		      <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="7" Field="ProcFinding" id="ProcFinding_NN_7" runat="server" Value="Palpable Nodes" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="7" Field="ProcFindSide" id="ProcFindSide_NN_7" runat="server" Value="Left" />
              <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="7" Field="ProcFindSite" id="ProcFindSite_NN_7" runat="server" Value="Level IV" Text="Left IV" EnableHiddenOnUIEvent="ProcName_NN,ProcSite_NN,ProcFinding_NN_7,ProcFindSide_NN_7"  AppendToOnChange="uncheckNoneBoxIfNecessary(this,LateralNeckNoneId);"/>			</td>
			<td >
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="8" Field="ProcFinding" id="ProcFinding_NN_8" runat="server" Value="Palpable Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="8" Field="ProcFindSide" id="ProcFindSide_NN_8" runat="server" Value="Right" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="8" Field="ProcFindSite" id="ProcFindSite_NN_8" runat="server" Value="Level IV" Text="Right IV" EnableHiddenOnUIEvent="ProcName_NN,ProcSite_NN,ProcFinding_NN_8,ProcFindSide_NN_8"  AppendToOnChange="uncheckNoneBoxIfNecessary(this,LateralNeckNoneId);"/>			</td>
		</tr>			
        <tr >
          <td >
		      <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="9" Field="ProcFinding" id="ProcFinding_NN_9" runat="server" Value="Palpable Nodes" />
			  <euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="9" Field="ProcFindSide" id="ProcFindSide_NN_9" runat="server" Value="Left" />
              <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="9" Field="ProcFindSite" id="ProcFindSite_NN_9" runat="server" Value="Level V" Text="Left V" EnableHiddenOnUIEvent="ProcName_NN,ProcSite_NN,ProcFinding_NN_9,ProcFindSide_NN_9"  AppendToOnChange="uncheckNoneBoxIfNecessary(this,LateralNeckNoneId);" />			</td>
			<td >
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="10" Field="ProcFinding" id="ProcFinding_NN_10" runat="server" Value="Palpable Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="2"  RecordId="10" Field="ProcFindSide" id="ProcFindSide_NN_10" runat="server" Value="Right" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="2"  RecordId="10" Field="ProcFindSite" id="ProcFindSite_NN_10" runat="server" Value="Level V" Text="Right V" EnableHiddenOnUIEvent="ProcName_NN,ProcSite_NN,ProcFinding_NN_10,ProcFindSide_NN_10"  AppendToOnChange="uncheckNoneBoxIfNecessary(this,LateralNeckNoneId);"/>			</td>
		</tr>			
 	</table>
	</td></tr>
</table>
</td></tr>
</table>
<br /><br /><br />

<script type="text/javascript">

showCheckChildControl(document.getElementById('<% =PalpableCentralCompartmentNodesNone.ClientID %>'));
showCheckChildControl(document.getElementById('<% =PalpableLateralNeckNodesNone.ClientID %>'));

</script>