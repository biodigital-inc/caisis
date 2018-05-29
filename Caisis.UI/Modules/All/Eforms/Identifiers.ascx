<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Identifiers" CodeFile="Identifiers.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<br>

<a name="Identifiers" />
<table width="380" border="0" cellpadding="0" cellspacing="0" class="controlBox">
   
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td colspan="3" height="18" align="left" class="controlBoxTitle">Identifiers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </td>
          </tr>
          <tr>
				<td  class="controlBoxDataGridTitleColumn">Type</td>
				<td  class="controlBoxDataGridTitleColumn">Identifier</td>
          </tr>
          <tr>
			 <td>
				<euc:EformSelect LookupCode="IdType"  RecordId="1" TABLE="Identifiers" FIELD="IdType" Runat="server" ID="IdType_1"/></td>
			<td>
				<euc:EformTextBox RecordId="1" style="width:120;" TABLE="Identifiers" FIELD="Identifier" Runat="server" ID="Identifier_1"/></td>
		  </tr>
          
          <tr>
			 <td>
				<euc:EformSelect LookupCode="IdType"  RecordId="2" TABLE="Identifiers" FIELD="IdType" Runat="server" ID="IdType_2"/></td>
			<td>
				<euc:EformTextBox RecordId="2" style="width:120;" TABLE="Identifiers" FIELD="Identifier" Runat="server" ID="Identifier_2"/></td>
		  </tr>
          
          <tr>
			 <td>
				<euc:EformSelect LookupCode="IdType"  RecordId="3" TABLE="Identifiers" FIELD="IdType" Runat="server" ID="IdType_3"/></td>
			<td>
				<euc:EformTextBox RecordId="3" style="width:120;" TABLE="Identifiers" FIELD="Identifier" Runat="server" ID="Identifier_3"/></td>
		  </tr>
          
          
        </table>
       </td>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
</table>