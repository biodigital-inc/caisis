<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ReviewOfSystems_ActiveSurveillance" CodeFile="ReviewOfSystems_ActiveSurveillance.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="ReviewOfSystems_ActiveSurveillance" /><span class="controlBoxTitle">Review of Systems</span><br />
<br />
Clinician Performing Review:<euc:EformRadioButtonList RepeatLayout="Flow" CellSpacing="4" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="ROS_Clinician" id="ROS_Clinician"  runat="server" >
			<asp:ListItem Value="RN">RN</asp:ListItem>
		    <asp:ListItem  Value="PA/NP">PA/NP</asp:ListItem>
			<asp:ListItem  Value="Fellow">Fellow</asp:ListItem>
			<asp:ListItem  Value="Attending">Attending</asp:ListItem>
</euc:EformRadioButtonList>

<span class="EFormPopupInstructionText">
<br/>
(Only one clinician needed; attending approval is <span style="font-weight: 900; font-size: 11px;">NOT</span> necessary for Review of Systems.)</span>
<br/>
<img src="../../Images/shim.gif" width="1" height="8" /><br/>
<table width="650" border="0" cellspacing="0" cellpadding="3" style="border: solid 1px #cccccc;" id="ReviewOfSystemsHtmlTable">
  <tr>
    <td colspan="2" class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/shim.gif" width="1" height="1" /></td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 2, 8);" /></td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 3, 8);" /></td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 4, 8);" /></td>
    <td colspan="2" class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/shim.gif" width="1" height="1" /></td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol">System</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;">Symptom</td>
    <td class="controlBoxDataGridHeaderFirstCol">Not<br />
      Present </td>
    <td class="controlBoxDataGridHeaderFirstCol">Present</td>
    <td class="controlBoxDataGridHeaderFirstCol">Not Done </td>
    <td class="controlBoxDataGridHeaderFirstCol">Disease<br />
      Related </td>
    <td width="40%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">Gen</td>
    <td class="ControlBoxLinedRowsShaded">Fatigue</td>
		<euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Fatigue" RecordId="1" GroupName="Fatigue" runat="server"
			Field1="ROS_System" Value1="Constitution"
			Field2="ROS_Symptom" Value2="Fatigue">
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FatigueNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FatigueAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FatigueNotDone" Value="Not Done" runat="server"/></td></euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="1" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_1"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_1"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td class="ControlBoxLinedRowsShaded">Fever</td>
    <td class="ControlBoxLinedRows" align="center">
	
	<euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Fever" RecordId="2" GroupName="Fever" runat="server"
			Field1="ROS_System" Value1="Constitution"
			Field2="ROS_Symptom" Value2="Fever">
	<euc:EformRadioButton ExpandClickableArea="false"  Id="FeverNormal" Value="Normal" runat="server"/>   </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton ExpandClickableArea="false" Id="FeverAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton ExpandClickableArea="false" Id="FeverNotDone" Value="Not Done" runat="server"/></euc:EformRadioButtonGroup></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="2" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_2"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_2"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">Skin</td>
    <td class="ControlBoxLinedRowsShaded">Wounds</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Wounds" RecordId="3" GroupName="Wounds" runat="server"
			Field1="ROS_System" Value1="Dermatology / Skin"
			Field2="ROS_Symptom" Value2="Wounds">
    <euc:EformRadioButton Id="WoundsNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="WoundsAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="WoundsNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="3" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_3"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_3"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td class="ControlBoxLinedRowsShaded">Breast Pain</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_BreastPain" RecordId="4" GroupName="BreastPain" runat="server"
			Field1="ROS_System" Value1="Dermatology / Skin"
			Field2="ROS_Symptom" Value2="Breast Pain">
    <euc:EformRadioButton Id="BreastPainNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="BreastPainAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="BreastPainNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="4" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_4"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_4"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">Resp</td>
    <td class="ControlBoxLinedRowsShaded">Cough</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Cough" RecordId="5" GroupName="Cough" runat="server"
			Field1="ROS_System" Value1="Pulmonary"
			Field2="ROS_Symptom" Value2="Cough">
    <euc:EformRadioButton Id="CoughNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="CoughAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="CoughNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="5" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_5"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_5"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td class="ControlBoxLinedRowsShaded">Dyspnea
      <euc:EformHidden RecordId="6" Runat="server" ID="ROS_Symptom_6" Table="EncReviewOfSystems" Field="ROS_Symptom" value="Dyspnea" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Dyspnea" RecordId="6" GroupName="Dyspnea" runat="server"
			Field1="ROS_System" Value1="Pulmonary"
			Field2="ROS_Symptom" Value2="Dyspnea">
    <euc:EformRadioButton Id="DyspneaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DyspneaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DyspneaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="6" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_6"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_6"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">CV</td>
    <td class="ControlBoxLinedRowsShaded">Edema
      <euc:EformHidden RecordId="7" Runat="server" ID="ROS_Symptom_7" Table="EncReviewOfSystems" Field="ROS_Symptom" value="Edema" /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Edema" RecordId="7" GroupName="Edema" runat="server"
			Field1="ROS_System" Value1="Cardiovascular (General)"
			Field2="ROS_Symptom" Value2="Edema">
    <euc:EformRadioButton Id="EdemaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="EdemaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="EdemaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="7" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_7"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_7"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td class="ControlBoxLinedRowsShaded">Chest Pain</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_ChestPain" RecordId="8" GroupName="ChestPain" runat="server"
			Field1="ROS_System" Value1="Cardiovascular (General)"
			Field2="ROS_Symptom" Value2="Chest Pain">
    <euc:EformRadioButton Id="ChestPainNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ChestPainAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ChestPainNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="8" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_8"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_8"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">GI</td>
    <td class="ControlBoxLinedRowsShaded">Dyspepsia</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Dyspepsia" RecordId="9" GroupName="Dyspepsia" runat="server"
			Field1="ROS_System" Value1="Gastrointestinal"
			Field2="ROS_Symptom" Value2="Dyspepsia">
    <euc:EformRadioButton Id="DyspepsiaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DyspepsiaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DyspepsiaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="9" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_9"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_9"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td height="30" class="ControlBoxLinedRowsShaded">Diarrhea</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Diarrhea" RecordId="10" GroupName="Diarrhea" runat="server"
			Field1="ROS_System" Value1="Gastrointestinal"
			Field2="ROS_Symptom" Value2="Diarrhea">
    <euc:EformRadioButton Id="DiarrheaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DiarrheaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DiarrheaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="10" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_10"/></td>
    
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_10"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="5" valign="top" class="ControlBoxLinedRowsShaded">GU</td>
    <td class="ControlBoxLinedRowsShaded">Obstruction</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Obstruction" RecordId="11" GroupName="Obstruction" runat="server"
			Field1="ROS_System" Value1="Genitourinary"
			Field2="ROS_Symptom" Value2="Obstruction">
    <euc:EformRadioButton Id="ObstructionNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ObstructionAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ObstructionNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="11" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_11"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_11"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td class="ControlBoxLinedRowsShaded">Hematuria</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Hematuria" RecordId="12" GroupName="Hematuria" runat="server"
			Field1="ROS_System" Value1="Genitourinary"
			Field2="ROS_Symptom" Value2="Hematuria">
    <euc:EformRadioButton Id="HematuriaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="HematuriaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="HematuriaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="12" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_12"/></td>
    
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_12"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td class="ControlBoxLinedRowsShaded">Dysuria</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Dysuria" RecordId="13" GroupName="Dysuria" runat="server"
			Field1="ROS_System" Value1="Genitourinary"
			Field2="ROS_Symptom" Value2="Dysuria">
    <euc:EformRadioButton Id="DysuriaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DysuriaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DysuriaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="13" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_13"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_13"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td class="ControlBoxLinedRowsShaded">Frequency	</td>

	
	<td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Frequency" RecordId="14" GroupName="Frequency" runat="server"
			Field1="ROS_System" Value1="Genitourinary"
			Field2="ROS_Symptom" Value2="Frequency">
	<euc:EformRadioButton Id="FrequencyNormal" Value="Normal" runat="server"/>				</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FrequencyAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FrequencyNotDone" Value="Not Done" runat="server"/>
		</euc:EformRadioButtonGroup></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="14" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_14"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_14"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td class="ControlBoxLinedRowsShaded">Penile Pain / Curvature / Length</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_PenilePainCurvatureLength" RecordId="15" GroupName="PenilePainCurvatureLength" runat="server"
			Field1="ROS_System" Value1="Genitourinary"
			Field2="ROS_Symptom" Value2="Penile Pain/Curvature/Length">
    <euc:EformRadioButton Id="PenilePainCurvatureLengthNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PenilePainCurvatureLengthAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PenilePainCurvatureLengthNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="15" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_15"/></td>
    
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_15"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">Psych</td>
    <td class="ControlBoxLinedRowsShaded">Depression</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Depression" RecordId="16" GroupName="Depression" runat="server"
			Field1="ROS_System" Value1="Psychiatric"
			Field2="ROS_Symptom" Value2="Depression">
    <euc:EformRadioButton Id="DepressionNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DepressionAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DepressionNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="16" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_16"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="16" ShowCalendar="False"  CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_16"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td class="ControlBoxLinedRowsShaded">Anxiety</td>
    <td class="ControlBoxLinedRows" align="Psychiatric"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Anxiety" RecordId="17" GroupName="Anxiety" runat="server"
			Field1="ROS_System" Value1="Neurology"
			Field2="ROS_Symptom" Value2="Anxiety">
    <euc:EformRadioButton Id="AnxietyNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AnxietyAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AnxietyNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="17" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_17"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_17"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">Neuro</td>
    <td class="ControlBoxLinedRowsShaded">Numbness / Tingling</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_NumbnessTingling" RecordId="18" GroupName="NumbnessTingling" runat="server"
			Field1="ROS_System" Value1="Neurology"
			Field2="ROS_Symptom" Value2="Numbness / Tingling">
    <euc:EformRadioButton Id="NumbnessTinglingNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NumbnessTinglingAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NumbnessTinglingNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="18" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_18"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_18"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td class="ControlBoxLinedRowsShaded">Headaches</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Headaches" RecordId="19" GroupName="Headaches" runat="server"
			Field1="ROS_System" Value1="Neurology"
			Field2="ROS_Symptom" Value2="Headaches">
    <euc:EformRadioButton Id="HeadachesNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="HeadachesAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="HeadachesNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="19" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_19"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_19"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded"><strong>Other:</strong></td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <%-- 
  <tr>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="19" LookupCode="BodySystem" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" ID="ROS_System_Other1" style="width: 50px;"/></td>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="19" LookupCode="ROS_Symptom" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_Other1" style="width: 130px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_OTHER1" RecordId="19" GroupName="OTHER1" runat="server">
        <span><euc:EformRadioButton Id="Other1Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other1Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other1NotDone" Value="Not Done" runat="server"/></span>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="19" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_Other1"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_Other1"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>--%>
    <tr>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="20" LookupCode="BodySystem" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" ID="ROS_System_Other2" style="width: 50px;"/></td>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="20" LookupCode="ROS_Symptom" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_Other2" style="width: 130px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Other2" RecordId="20" GroupName="Other2" runat="server">
        <span><euc:EformRadioButton Id="Other2Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other2Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other2NotDone" Value="Not Done" runat="server"/></span>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="20" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_Other2"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_Other2"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="21" LookupCode="BodySystem" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" ID="ROS_System_Other3" style="width: 50px;"/></td>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="21" LookupCode="ROS_Symptom" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_Other3" style="width: 130px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Other3" RecordId="21" GroupName="Other3" runat="server">
        <span><euc:EformRadioButton Id="Other3Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other3Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other3NotDone" Value="Not Done" runat="server"/></span>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="21" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_Other3"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="21" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_Other3"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="22" LookupCode="BodySystem" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" ID="ROS_System_Other4" style="width: 50px;"/></td>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="22" LookupCode="ROS_Symptom" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_Other4" style="width: 130px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Other4" RecordId="22" GroupName="Other4" runat="server">
        <span><euc:EformRadioButton Id="Other4Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other4Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other4NotDone" Value="Not Done" runat="server"/></span>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="22" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_Other4"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="22" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_Other4"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="23" LookupCode="BodySystem" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" ID="ROS_System_Other5" style="width: 50px;"/></td>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="23" LookupCode="ROS_Symptom" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_Other5" style="width: 130px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Other5" RecordId="23" GroupName="Other5" runat="server">
        <span><euc:EformRadioButton Id="Other5Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other5Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other5NotDone" Value="Not Done" runat="server"/></span>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="23" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_Other5"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="23" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_Other5"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<br/>
<br/>
<br/>
