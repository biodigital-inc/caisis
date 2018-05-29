<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.RefPhysiciansPedsNeuro" CodeFile="RefPhysiciansPedsNeuro.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.PedsNeuroRefPhyTable = "PedsNeuroRefPhyTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="RefPhysiciansPedsNeuro" /><span class="controlBoxTitle">Referring Physicians</span><br />  
<table width="650" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroRefPhyTable">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Physician</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Role</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Contact Status</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
  </tr>   
  <tr>
	<td style="text-align: center;">
	    <euc:EformDropDownList RecordId="1" runat="server" ID="PhysicianId_1" Table="PatientPhysicians" Field="PhysicianId" 
	        Width="125px" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'')" /></td>
	<td style="text-align: center;"><euc:EformDropDownList RecordId="1" runat="server" ID="PtPhRole_1" Table="PatientPhysicians" 
	    Field="PtPhRole" Width="100px" LookupCode="PtPhRole"/></td>      
	<td style="text-align: center;"><euc:EformSelect RecordId="1" runat="server" ID="PtPhContactStatus_1" Table="PatientPhysicians" 
	    Field="PtPhContactStatus" style="Width:100px" DropDownWidth="200px" LookupCode="PtPhContactStatus"/></td>
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="PtPhNotes_1" RecordId="1" Table="PatientPhysicians" 
	    Field="PtPhNotes" ShowTextEditor="true" Width="80px" /></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td style="text-align: center;">
	    <euc:EformDropDownList RecordId="2" runat="server" ID="PhysicianId_2" Table="PatientPhysicians" Field="PhysicianId" 
	        Width="125px" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'')" /></td>
	<td style="text-align: center;"><euc:EformDropDownList RecordId="2" runat="server" ID="PtPhRole_2" Table="PatientPhysicians" 
	    Field="PtPhRole" Width="100px" LookupCode="PtPhRole"/></td>      
	<td style="text-align: center;"><euc:EformSelect RecordId="2" runat="server" ID="PtPhContactStatus_2" Table="PatientPhysicians" 
	    Field="PtPhContactStatus" style="Width:100px" DropDownWidth="200px" LookupCode="PtPhContactStatus"/></td>
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="PtPhNotes_2" RecordId="2" Table="PatientPhysicians" 
	    Field="PtPhNotes" ShowTextEditor="true" Width="80px" /></td> 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td style="text-align: center;">
	    <euc:EformDropDownList RecordId="3" runat="server" ID="PhysicianId_3" Table="PatientPhysicians" Field="PhysicianId" 
	        Width="125px" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'')" /></td>
	<td style="text-align: center;"><euc:EformDropDownList RecordId="3" runat="server" ID="PtPhRole_3" Table="PatientPhysicians" 
	    Field="PtPhRole" Width="100px" LookupCode="PtPhRole"/></td>      
	<td style="text-align: center;"><euc:EformSelect RecordId="3" runat="server" ID="PtPhContactStatus_3" Table="PatientPhysicians" 
	    Field="PtPhContactStatus" style="Width:100px" DropDownWidth="200px" LookupCode="PtPhContactStatus"/></td>
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="PtPhNotes_3" RecordId="1" Table="PatientPhysicians" 
	    Field="PtPhNotes" ShowTextEditor="true" Width="80px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td style="text-align: center;">
	    <euc:EformDropDownList RecordId="4" runat="server" ID="PhysicianId_4" Table="PatientPhysicians" Field="PhysicianId" 
	        Width="125px" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'')" /></td>
	<td style="text-align: center;"><euc:EformDropDownList RecordId="4" runat="server" ID="PtPhRole_4" Table="PatientPhysicians" 
	    Field="PtPhRole" Width="100px" LookupCode="PtPhRole"/></td>      
	<td style="text-align: center;"><euc:EformSelect RecordId="4" runat="server" ID="PtPhContactStatus_4" Table="PatientPhysicians" 
	    Field="PtPhContactStatus" style="Width:100px" DropDownWidth="200px" LookupCode="PtPhContactStatus"/></td>
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="PtPhNotes_4" RecordId="4" Table="PatientPhysicians" 
	    Field="PtPhNotes" ShowTextEditor="true" Width="80px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td style="text-align: center;">
	    <euc:EformDropDownList RecordId="5" runat="server" ID="PhysicianId_5" Table="PatientPhysicians" Field="PhysicianId" 
	        Width="125px" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'')" /></td>
	<td style="text-align: center;"><euc:EformDropDownList RecordId="5" runat="server" ID="PtPhRole_5" Table="PatientPhysicians" 
	    Field="PtPhRole" Width="100px" LookupCode="PtPhRole"/></td>      
	<td style="text-align: center;"><euc:EformSelect RecordId="5" runat="server" ID="PtPhContactStatus_5" Table="PatientPhysicians" 
	    Field="PtPhContactStatus" style="Width:100px" DropDownWidth="200px" LookupCode="PtPhContactStatus"/></td>
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="PtPhNotes_5" RecordId="5" Table="PatientPhysicians" 
	    Field="PtPhNotes" ShowTextEditor="true" Width="80px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  
                onclick="return showFirstAdditionalRow(this,'PedsNeuroRefPhyTable');" /><br /><br /><br />