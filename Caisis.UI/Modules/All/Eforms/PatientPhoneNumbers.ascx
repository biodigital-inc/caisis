<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PatientPhoneNumbers" CodeFile="PatientPhoneNumbers.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="PatientPhoneNumbers" />
<table width="380" border="0" cellpadding="0" cellspacing="0" class="controlBox">
   
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td colspan="3" height="18" align="left" class="controlBoxTitle">Phone Numbers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </td>
          </tr>
          <tr>
				<td  class="controlBoxDataGridTitleColumn">Type</td>
				<td  class="controlBoxDataGridTitleColumn">Number</td>
				<td  class="controlBoxDataGridTitleColumn">Extension</td>
          </tr>
          <tr>
			 <td>
				<euc:EformSelect RecordId="1" LookupCode="PtPhoneType"   TABLE="PatientPhoneNumbers" FIELD="PtPhoneType" Runat="server" ID="PtPhoneType_1"/></td>
			<td>
				<euc:EformTextBox RecordId="1" style="width:100;" TABLE="PatientPhoneNumbers" FIELD="PtPhoneNumber" Runat="server" ID="PtPhoneNumber_1"/></td>
			<td>
				<euc:EformTextBox RecordId="1" style="width:40;" TABLE="PatientPhoneNumbers" FIELD="PtPhoneExtension" Runat="server" ID="PtPhoneExtension_1"/></td>
          </tr>
          
           <tr>
			 <td>
				<euc:EformSelect RecordId="2" LookupCode="PtPhoneType"  TABLE="PatientPhoneNumbers" FIELD="PtPhoneType" Runat="server" ID="PtPhoneType_2"/></td>
			<td>
				<euc:EformTextBox RecordId="2" style="width:100;" TABLE="PatientPhoneNumbers" FIELD="PtPhoneNumber" Runat="server" ID="PtPhoneNumber_2"/></td>
			<td>
				<euc:EformTextBox RecordId="2" style="width:40;" TABLE="PatientPhoneNumbers" FIELD="PtPhoneExtension" Runat="server" ID="PtPhoneExtension_2"/></td>
          </tr>
          
           <tr>
			 <td>
				<euc:EformSelect RecordId="3"  LookupCode="PtPhoneType" TABLE="PatientPhoneNumbers" FIELD="PtPhoneType" Runat="server" ID="PtPhoneType_3"/></td>
			<td>
				<euc:EformTextBox RecordId="3" style="width:100;" TABLE="PatientPhoneNumbers" FIELD="PtPhoneNumber" Runat="server" ID="PtPhoneNumber_3"/></td>
			<td>
				<euc:EformTextBox RecordId="3" style="width:40;" TABLE="PatientPhoneNumbers" FIELD="PtPhoneExtension" Runat="server" ID="PtPhoneExtension_3"/></td>
          </tr>
          
        </table>
       </td>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
</table>