<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ExampleRadiosAndCheckboxes" CodeFile="ExampleRadiosAndCheckboxes.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="ExampleRadiosAndCheckboxes" id="ExampleRadiosAndCheckboxes" />

<span class="controlBoxTitle">EformExtendedRadioButtonList</span><br/><br/>

<euc:EformExtendedRadioButtonList ShowOther="false" Table="NoTable" Field="ExtendedRadioButtonList" LookupCode="OpUreterAnast"  id="ExtendedRadioButtonList" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" />
<br/><br/><br/><br/>



<span class="controlBoxTitle">EformExtendedRadioButtonList</span> with ShowOther="True"<br/><br/>

<euc:EformExtendedRadioButtonList ShowOther="true" Table="NoTable" Field="ExtendedRadioButtonListWithOther" LookupCode="OpUreterAnast"  id="ExtendedRadioButtonListWithOther" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" />
<br/><br/><br/><br/>

<span class="controlBoxTitle">EformRadioButtonGroup /  EformRadioButton</span> (allows HTML markup between radios)<br/><br/>

<table width="650" border="0" cellspacing="0" cellpadding="3" style="border: solid 1px #cccccc;" id="ReviewOfSystemsHtmlTable">

  <tr>
    <td class="controlBoxDataGridHeaderFirstCol">System</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;">Symptom</td>
    <td class="controlBoxDataGridHeaderFirstCol">Not<br />
      Present </td>
    <td class="controlBoxDataGridHeaderFirstCol">Present</td>
    <td class="controlBoxDataGridHeaderFirstCol">Not Done </td>
  </tr>
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">Gen</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Fatigue</td>
    <td class="ControlBoxLinedRows" align="center">

		<euc:EformRadioButtonGroup Table="NoTable" Field="RadioButtonGroup" id="RadioButtonGroup"  GroupName="RadioButtonGroup" runat="server" >
			<euc:EformRadioButton Id="FatigueNormal" Value="Normal" runat="server" />	</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FatigueAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FatigueNotDone" Value="Not Done" runat="server"/>
		</euc:EformRadioButtonGroup>	</td>
  </tr>
  </table>
  
  <br/><br/><br/><br/>



<span class="controlBoxTitle">Simple EformCheckBox</span><br/><br/>

<euc:EformCheckBox  Text="YES" TABLE="NoTable" FIELD="CheckboxSimple" Runat="server" ID="CheckboxSimple" Value="YES" />

  <br/><br/><br/><br/>



<span class="controlBoxTitle">EformExtendedCheckBoxList</span><br/><br/>

<euc:EformExtendedCheckBoxList Table="NoTable" ShowOther="true" Field="ExtendedCheckBoxList"  LookupCode="OpUreterAnast" id="ExtendedCheckBoxList" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" />
