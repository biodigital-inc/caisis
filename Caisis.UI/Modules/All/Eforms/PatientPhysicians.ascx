<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PatientPhysicians" CodeFile="PatientPhysicians.ascx.cs" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<br>

<a name="PatientPhysicians" />
<table width="380" border="0" cellpadding="0" cellspacing="0" class="controlBox">
   
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td colspan="3" height="18" align="left" class="controlBoxTitle">Physicians&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </td>
          </tr>
          <tr>
				<td  class="controlBoxDataGridTitleColumn">Physician</td>
				<td  class="controlBoxDataGridTitleColumn">Role</td>
				<td  class="controlBoxDataGridTitleColumn"></td>
          </tr>
          <tr>
			 <td>
				<euc:EformSelect LookupCode="PtPhoneType"  RecordId="1" TABLE="PatientPhysicians" FIELD="PhysicianId" Runat="server" ID="PhysicianId_1"/></td>
			<td>
				<euc:EformTextBox RecordId="1" style="width:100;" TABLE="PatientPhysicians" FIELD="PtPhRole" Runat="server" ID="PtPhRole_1"/></td>
			<td>
				<euc:EformHidden RecordId="1" TABLE="PatientPhysicians" FIELD="PatientId" Runat="server" ID="PatientId_1"/></td>
          </tr>
          
          <tr>
			 <td>
				<euc:EformSelect LookupCode="PtPhoneType"  RecordId="1" TABLE="PatientPhysicians" FIELD="PhysicianId" Runat="server" ID="PhysicianId_2"/></td>
			<td>
				<euc:EformTextBox RecordId="1" style="width:100;" TABLE="PatientPhysicians" FIELD="PtPhRole" Runat="server" ID="PtPhRole_2"/></td>
			<td>
				<euc:EformHidden RecordId="1" TABLE="PatientPhysicians" FIELD="PatientId" Runat="server" ID="PatientId_2"/></td>
          </tr>
          
            <tr>
			 <td>
				<euc:EformSelect LookupCode="PtPhoneType"  RecordId="1" TABLE="PatientPhysicians" FIELD="PhysicianId" Runat="server" ID="PhysicianId_3"/></td>
			<td>
				<euc:EformTextBox RecordId="1" style="width:100;" TABLE="PatientPhysicians" FIELD="PtPhRole" Runat="server" ID="PtPhRole_3"/></td>
			<td>
				<euc:EformHidden RecordId="1" TABLE="PatientPhysicians" FIELD="PatientId" Runat="server" ID="PatientId_3"/></td>
          </tr>
          
        </table>
       </td>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
</table>