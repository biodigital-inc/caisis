<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Surveys_IPSS_IIEF_Potency" CodeFile="Surveys_IPSS_IIEF_Potency.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="Surveys_IPSS_IIEF_Potency" />
<table width="500" border="0" cellpadding="0" cellspacing="0" class="controlBox">
   
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td colspan="3" height="18" align="left" class="controlBoxTitle">Surveys&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </td>
          </tr>
          <tr>
				<td  class="controlBoxDataGridTitleColumn"></td>
				<td  class="controlBoxDataGridTitleColumn">Result</td>
				<td  class="controlBoxDataGridTitleColumn">Total</td>
				<td  class="controlBoxDataGridTitleColumn">Date</td>
          </tr>
          
          <tr>
			 <td class="controlBoxDataGridTitleColumn">
				<euc:EformCheckbox Text="IPSS" RecordId="1" TABLE="Surveys" FIELD="SurveyType" Runat="server" ID="SurveyType_1"/>&nbsp;&nbsp;</td>
			<td>
				<euc:EformTextBox RecordId="1" style="width:100;" TABLE="Surveys" FIELD="SurveyResult" ShowNumberPad="True" Runat="server" ID="SurveyResult_1"/></td>
			<td>
				<euc:EformTextBox RecordId="1" style="width:100;" TABLE="Surveys" FIELD="SurveyTotal" ShowNumberPad="True" Runat="server" ID="SurveyTotal_1"/></td>
			<td>
				<euc:EformHidden RecordId="1"  TABLE="Surveys" FIELD="SurveyDate" Runat="server" ID="SurveyDate_1"/>
				<euc:EformTextBox RecordId="1" ShowCalendar="True" CalcDate="True" style="width:100;" TABLE="Surveys" FIELD="SurveyDateText" Runat="server" ID="SurveyDateText_1"/></td>
          </tr>
          
          <tr>
			 <td class="controlBoxDataGridTitleColumn">
				<euc:EformCheckbox Text="IEFF" RecordId="2" TABLE="Surveys" FIELD="SurveyType" Runat="server" ID="SurveyType_2"/>&nbsp;&nbsp;</td>
			<td>
				<euc:EformTextBox RecordId="2" style="width:100;" TABLE="Surveys" FIELD="SurveyResult" ShowNumberPad="True" Runat="server" ID="SurveyResult_2"/></td>
			<td>
				<euc:EformTextBox RecordId="2" style="width:100;" TABLE="Surveys" FIELD="SurveyTotal" ShowNumberPad="True" Runat="server" ID="SurveyTotal_2"/></td>
			<td>
				<euc:EformHidden RecordId="2"  TABLE="Surveys" FIELD="SurveyDate" Runat="server" ID="SurveyDate_2"/>
				<euc:EformTextBox RecordId="2" ShowCalendar="True" CalcDate="True" style="width:100;" TABLE="Surveys" FIELD="SurveyDateText" Runat="server" ID="SurveyDateText_2"/></td>
          </tr>
          
          <tr>
			 <td class="controlBoxDataGridTitleColumn">
				<euc:EformCheckbox Text="Sexual Function" RecordId="3" TABLE="Surveys" FIELD="SurveyType" Runat="server" ID="SurveyType_3"/>&nbsp;&nbsp;</td>
			<td>
				<euc:EformTextBox RecordId="3" style="width:100;" TABLE="Surveys" FIELD="SurveyResult" ShowNumberPad="True" Runat="server" ID="SurveyResult_3"/></td>
			<td>
				<euc:EformTextBox RecordId="3" style="width:100;" TABLE="Surveys" FIELD="SurveyTotal" ShowNumberPad="True" Runat="server" ID="SurveyTotal_3"/></td>
			<td>
				<euc:EformHidden RecordId="3"  TABLE="Surveys" FIELD="SurveyDate" Runat="server" ID="SurveyDate_3"/>
				<euc:EformTextBox RecordId="3" ShowCalendar="True" CalcDate="True" style="width:100;" TABLE="Surveys" FIELD="SurveyDateText" Runat="server" ID="SurveyDateText_3"/></td>
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