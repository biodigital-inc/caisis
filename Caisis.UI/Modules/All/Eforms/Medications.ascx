<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Medications" CodeFile="Medications.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="Medications" />
<table width="500" border="0" cellpadding="0" cellspacing="0" class="controlBox">
   
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td colspan="3" height="18" align="left" class="controlBoxTitle">Medications&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </td>
          </tr>
          <tr>
				<td  class="controlBoxDataGridTitleColumn">Medication</td>
				<td  class="controlBoxDataGridTitleColumn">Type</td>
				<td  class="controlBoxDataGridTitleColumn">Start Date</td>
				<td  class="controlBoxDataGridTitleColumn">Stop Date</td>
          </tr>
          <tr>
			 <td>
				<euc:EformSelect RecordId="1" LookupCode="Medication" TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_1"/></td>
			<td>
				<euc:EformTextBox RecordId="1" style="width:100;" TABLE="Medications" FIELD="MedType" Runat="server" ID="MedType_1"/></td>
			<td>
				<euc:EformHidden RecordId="1"  TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_1"/>
				<euc:EformTextBox RecordId="1" ShowCalendar="True" CalcDate="True" style="width:100;" TABLE="Medications" FIELD="MedDateText" Runat="server" ID="MedDateText_1"/></td>
			<td>
				<euc:EformHidden RecordId="1"  TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_1"/>
				<euc:EformTextBox RecordId="1" ShowCalendar="True" CalcDate="True" style="width:100;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_1"/></td>
          </tr>
          
         <tr>
			 <td>
				<euc:EformSelect RecordId="2" LookupCode="Medication" TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_2"/></td>
			<td>
				<euc:EformTextBox RecordId="2" style="width:100;" TABLE="Medications" FIELD="MedType" Runat="server" ID="MedType_2"/></td>
			<td>
				<euc:EformHidden RecordId="2"  TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_2"/>
				<euc:EformTextBox RecordId="2" ShowCalendar="True" CalcDate="True" style="width:100;" TABLE="Medications" FIELD="MedDateText" Runat="server" ID="MedDateText_2"/></td>
			<td>
				<euc:EformHidden RecordId="2"  TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_2"/>
				<euc:EformTextBox RecordId="2" ShowCalendar="True" CalcDate="True" style="width:100;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_2"/></td>
          </tr>
          
          <tr>
			 <td>
				<euc:EformSelect RecordId="3" LookupCode="Medication" TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_3"/></td>
			<td>
				<euc:EformTextBox RecordId="3" style="width:100;" TABLE="Medications" FIELD="MedType" Runat="server" ID="MedType_3"/></td>
			<td>
				<euc:EformHidden RecordId="3"  TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_3"/>
				<euc:EformTextBox RecordId="3" ShowCalendar="True" CalcDate="True" style="width:100;" TABLE="Medications" FIELD="MedDateText" Runat="server" ID="MedDateText_3"/></td>
			<td>
				<euc:EformHidden RecordId="3"  TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_3"/>
				<euc:EformTextBox RecordId="3" ShowCalendar="True" CalcDate="True" style="width:100;" TABLE="Medications" FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_3"/></td>
          </tr>
          
        </table>
       </td>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
</table>

<br>