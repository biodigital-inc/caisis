<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.LabTestPSA" CodeFile="LabTestPSA.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<br>

<a name="LabTestPSA" />
<table width="380" border="0" cellpadding="0" cellspacing="0" class="controlBox">
   
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td colspan="3" height="18" align="left" class="controlBoxTitle">PSA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </td>
          </tr>
          <tr>
				<td  class="controlBoxDataGridTitleColumn"></td>
				<td  class="controlBoxDataGridTitleColumn">Result</td>
				<td  class="controlBoxDataGridTitleColumn">Date</td>		
          </tr>
          <tr>
				<td  class="controlBoxDataGridTitleColumn" nowrap>
					<euc:EformCheckBox Text="PSA" TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest"/></td>
				<td>
					<euc:EformTextBox style="width:100"  LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult"/></td>
				<td>
					<euc:EformHidden TABLE="LabTests" FIELD="LabDate" Runat="server" ID="LabDate"/>
					<euc:EformTextBox style="width:100" 
						TABLE="LabTests" 
						FIELD="LabDateText" Runat="server" 
						ShowCalendar="True"
						CalcDate="True"
						ID="LabDateText"/></td>
		 </tr>
      </table>
       </td>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
</table>