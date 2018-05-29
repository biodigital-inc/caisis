<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ExampleDeleteButton" CodeFile="ExampleDeleteButton.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="ExampleDeleteButton" id="ExampleDeleteButton" />

<span class="controlBoxTitle">EformDeleteIcon</span> (clears all inputs in same table row)<br/><br/>



<table width="650" border="0" cellspacing="0" cellpadding="3" style="border: solid 1px #cccccc;" id="ReviewOfSystemsHtmlTable">

  <tr>
    <td class="controlBoxDataGridHeaderFirstCol">System</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;">Symptom</td>
    <td class="controlBoxDataGridHeaderFirstCol">Not<br />
      Present </td>
    <td class="controlBoxDataGridHeaderFirstCol">Present</td>
    <td class="controlBoxDataGridHeaderFirstCol">Not Done </td>
    <td class="controlBoxDataGridHeaderFirstCol">Delete</td>
  </tr>
  <tr>
    <td   valign="top" class="ControlBoxLinedRowsShaded">
    
    <euc:EformTextBox Runat="server" ID="TextboxSimple" Table="NoTable" FIELD="TextboxSimple" style="width:100px;"  ShowCalendar="false" CalcDate="false" class="InputText"  />

    
    </td>
    <td valign="top" class="ControlBoxLinedRowsShaded">
    
    <euc:EformCheckBox  Text="YES" TABLE="NoTable" FIELD="CheckboxSimple" Runat="server" ID="CheckboxSimple" Value="YES" />

    
    </td>
    <td class="ControlBoxLinedRows" align="center">

		<euc:EformRadioButtonGroup Table="NoTable" Field="RadioButtonGroup" id="RadioButtonGroup"  GroupName="RadioButtonGroup" runat="server">
			<euc:EformRadioButton Id="FatigueNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FatigueAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FatigueNotDone" Value="Not Done" runat="server"/>
		</euc:EformRadioButtonGroup>	</td>
	<td align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  </table>