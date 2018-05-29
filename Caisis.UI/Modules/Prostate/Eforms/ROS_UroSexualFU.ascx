<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ROS_UroSexualFU" CodeFile="ROS_UroSexualFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />

<a name="ROS_UroSexualFU" /><span class="controlBoxTitle">Review of Systems</span><br /><br />
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
    <td class="controlBoxDataGridHeaderFirstCol">System</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;">Symptom</td>
    <td class="controlBoxDataGridHeaderFirstCol">Not<br />Present </td>
    <td class="controlBoxDataGridHeaderFirstCol">Present</td>
    <td class="controlBoxDataGridHeaderFirstCol">Not Done </td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/shim.gif" width="1" height="1" /></td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 2, 7);" /></td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 3, 7);" /></td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 4, 7);" /></td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/shim.gif" width="1" height="1" /></td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">General</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Fever</td>
    <td class="ControlBoxLinedRows" align="center">

		<euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Fever" RecordId="1" GroupName="Fever" runat="server"
			Field1="ROS_System" Value1="Constitution"
			Field2="ROS_Symptom" Value2="Fever">
			<euc:EformRadioButton Id="FeverNormal" Value="Normal" runat="server"/>	</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FeverAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FeverNotDone" Value="Not Done" runat="server"/>
		</euc:EformRadioButtonGroup>	</td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_1"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Weight Loss</td>
    <td class="ControlBoxLinedRows" align="center">
	
	<euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_WeightLoss" RecordId="2" GroupName="WeightLoss" runat="server"
			Field1="ROS_System" Value1="Constitution"
			Field2="ROS_Symptom" Value2="Weight Loss">
			<euc:EformRadioButton ExpandClickableArea="false"  Id="WeightLossNormal" Value="Normal" runat="server"/>   </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton ExpandClickableArea="false" Id="WeightLossAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton ExpandClickableArea="false" Id="WeightLossNotDone" Value="Not Done" runat="server"/>
		</euc:EformRadioButtonGroup>		</td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_2"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">Neuro</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Headaches</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Headaches" RecordId="3" GroupName="Headaches" runat="server"
			Field1="ROS_System" Value1="Neurology"
			Field2="ROS_Symptom" Value2="Headaches">
        <euc:EformRadioButton Id="HeadachesNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="HeadachesAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="HeadachesNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_3"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Focal Weakness</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_FocalWeakness" RecordId="4" GroupName="FocalWeakness" runat="server"
			Field1="ROS_System" Value1="Neurology"
			Field2="ROS_Symptom" Value2="Focal Weakness">
        <euc:EformRadioButton Id="FocalWeaknessNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FocalWeaknessAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FocalWeaknessNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_4"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Eyes</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Visual Problems</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_VisualProblems" RecordId="5" GroupName="VisualProblems" runat="server"
			Field1="ROS_System" Value1="Ocular/Visual"
			Field2="ROS_Symptom" Value2="Visual Problems">
        <euc:EformRadioButton Id="VisualProblemsNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="VisualProblemsAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="VisualProblemsNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_5"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">CV</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Angina</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Angina" RecordId="6" GroupName="Angina" runat="server"
			Field1="ROS_System" Value1="Cardiovascular (General)"
			Field2="ROS_Symptom" Value2="Angina">
        <euc:EformRadioButton Id="AnginaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AnginaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AnginaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_6"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Palpitations</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Palpitations" RecordId="7" GroupName="Palpitations" runat="server"
			Field1="ROS_System" Value1="Cardiovascular (General)"
			Field2="ROS_Symptom" Value2="Palpitations">
        <euc:EformRadioButton Id="PalpitationsNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PalpitationsAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="PalpitationsNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_7"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="3" valign="top" class="ControlBoxLinedRowsShaded">Respiratory</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Cough</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Cough" RecordId="8" GroupName="Cough" runat="server"
			Field1="ROS_System" Value1="Pulmonary"
			Field2="ROS_Symptom" Value2="Cough">
        <euc:EformRadioButton Id="CoughNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="CoughAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="CoughNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_8"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Shortness of Breath</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_ShortnessofBreath" RecordId="9" GroupName="ShortnessofBreath" runat="server"
			Field1="ROS_System" Value1="Pulmonary"
			Field2="ROS_Symptom" Value2="Shortness of Breath">
        <euc:EformRadioButton Id="ShortnessofBreathNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ShortnessofBreathAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ShortnessofBreathNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_9"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>
  </tr>
  <tr>
    <td height="30" valign="top" class="ControlBoxLinedRowsShaded">Hemoptysis</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Hemoptysis" RecordId="10" GroupName="Hemoptysis" runat="server"
			Field1="ROS_System" Value1="Pulmonary"
			Field2="ROS_Symptom" Value2="Hemoptysis">
        <euc:EformRadioButton Id="HemoptysisNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="HemoptysisAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="HemoptysisNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_10"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="4" valign="top" class="ControlBoxLinedRowsShaded">GI</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Nausea</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Nausea" RecordId="11" GroupName="Nausea" runat="server"
			Field1="ROS_System" Value1="Gastrointestinal"
			Field2="ROS_Symptom" Value2="Nausea">
        <euc:EformRadioButton Id="NauseaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NauseaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NauseaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_11"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Vomiting</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Vomiting" RecordId="12" GroupName="Vomiting" runat="server"
			Field1="ROS_System" Value1="Gastrointestinal"
			Field2="ROS_Symptom" Value2="Vomiting">
        <euc:EformRadioButton Id="VomitingNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="VomitingAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="VomitingNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_12"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Abdominal Pain</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_AbdominalPain" RecordId="13" GroupName="AbdominalPain" runat="server"
			Field1="ROS_System" Value1="Gastrointestinal"
			Field2="ROS_Symptom" Value2="Abdominal Pain">
        <euc:EformRadioButton Id="AbdominalPainNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AbdominalPainAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AbdominalPainNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_13"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Rectal Bleeding</td>
	<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_RectalBleeding" RecordId="14" GroupName="RectalBleeding" runat="server"
			Field1="ROS_System" Value1="Gastrointestinal"
			Field2="ROS_Symptom" Value2="Rectal Bleeding">
			<euc:EformRadioButton Id="RectalBleedingNormal" Value="Normal" runat="server"/>				</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="RectalBleedingAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="RectalBleedingNotDone" Value="Not Done" runat="server"/>
		</euc:EformRadioButtonGroup></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_14"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="3" valign="top" class="ControlBoxLinedRowsShaded">GU</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Dysuria</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Dysuria" RecordId="15" GroupName="Dysuria" runat="server"
			Field1="ROS_System" Value1="Genitourinary"
			Field2="ROS_Symptom" Value2="Dysuria">
        <euc:EformRadioButton Id="DysuriaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DysuriaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DysuriaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_15"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Frequency</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Frequency" RecordId="16" GroupName="Frequency" runat="server"
			Field1="ROS_System" Value1="Genitourinary"
			Field2="ROS_Symptom" Value2="Frequency">
        <euc:EformRadioButton Id="FrequencyNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FrequencyAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="FrequencyNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="16" ShowCalendar="False"  CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_16"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Incontinence</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Incontinence" RecordId="17" GroupName="Incontinence" runat="server"
			Field1="ROS_System" Value1="Genitourinary"
			Field2="ROS_Symptom" Value2="Incontinence">
        <euc:EformRadioButton Id="IncontinenceNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="IncontinenceAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="IncontinenceNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_17"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">MS</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Joint Pain</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_JointPain" RecordId="18" GroupName="JointPain" runat="server"
			Field1="ROS_System" Value1="Musculoskeletal"
			Field2="ROS_Symptom" Value2="Joint Pain">
        <euc:EformRadioButton Id="JointPainNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="JointPainAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="JointPainNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_18"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Psych</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Anxiety / Depression</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_AnxietyDepression" RecordId="24" GroupName="AnxietyDepression" runat="server"
			Field1="ROS_System" Value1="Psychiatric"
			Field2="ROS_Symptom" Value2="Anxiety / Depression">
        <euc:EformRadioButton Id="AnxietyDepressionNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AnxietyDepressionAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AnxietyDepressionNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="24" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_24"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon24" runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="2" valign="top" class="ControlBoxLinedRowsShaded">Heme</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Anemia</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Anemia" RecordId="25" GroupName="Anemia" runat="server"
			Field1="ROS_System" Value1="Hemorrhage"
			Field2="ROS_Symptom" Value2="Anemia">
        <euc:EformRadioButton Id="AnemiaNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AnemiaAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AnemiaNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="25" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_25"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon25" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Adenopathy</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Adenopathy" RecordId="26" GroupName="Adenopathy" runat="server"
			Field1="ROS_System" Value1="Hemorrhage"
			Field2="ROS_Symptom" Value2="Adenopathy">
        <euc:EformRadioButton Id="AdenopathyNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AdenopathyAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AdenopathyNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="26" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_26"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon26" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Skin</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Rash</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Rash" RecordId="27" GroupName="Rash" runat="server"
			Field1="ROS_System" Value1="Dermatology / Skin"
			Field2="ROS_Symptom" Value2="Rash">
        <euc:EformRadioButton Id="RashNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="RashAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="RashNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="27" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_27"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon27" runat="server"/></td>
  </tr>
  <tr>
    <td rowspan="3" valign="top" class="ControlBoxLinedRowsShaded">Endo</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Heat/Cold Intolerance</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_HeatColdIntolerance" RecordId="28" GroupName="HeatColdIntolerance" runat="server"
			Field1="ROS_System" Value1="Endocrine"
			Field2="ROS_Symptom" Value2="Heat/Cold Intolerance">
        <euc:EformRadioButton Id="HeatColdIntoleranceNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="HeatColdIntoleranceAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="HeatColdIntoleranceNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="28" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_28"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon28" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Thirst</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Thirst" RecordId="29" GroupName="Thirst" runat="server"
			Field1="ROS_System" Value1="Endocrine"
			Field2="ROS_Symptom" Value2="Thirst">
        <euc:EformRadioButton Id="ThirstNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ThirstAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ThirstNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="28" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_29"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon29" runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">Hot Flashes</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_HotFlashes" RecordId="30" GroupName="HotFlashes" runat="server"
			Field1="ROS_System" Value1="Endocrine"
			Field2="ROS_Symptom" Value2="Hot Flashes">
        <euc:EformRadioButton Id="HotFlashesNormal" Value="Normal" runat="server"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="HotFlashesAbnormal" Value="Abnormal" runat="server"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="HotFlashesNotDone" Value="Not Done" runat="server"/>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="30" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_30"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon30" runat="server"/></td>
  </tr>
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded"><strong>Other:</strong></td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="19" LookupCode="BodySystem" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" ID="ROS_System_Other1" style="width: 50px;"/></td>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="19" LookupCode="ROS_Symptom" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_Other1" style="width: 130px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_OTHER1" RecordId="19" GroupName="OTHER1" runat="server">
        <span><euc:EformRadioButton Id="Other1Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other1Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other1NotDone" Value="Not Done" runat="server"/></span>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_Other1"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server"/></td>
  </tr>
    <tr>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="20" LookupCode="BodySystem" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" ID="ROS_System_Other2" style="width: 50px;"/></td>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="20" LookupCode="ROS_Symptom" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_Other2" style="width: 130px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Other2" RecordId="20" GroupName="Other2" runat="server">
        <span><euc:EformRadioButton Id="Other2Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other2Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other2NotDone" Value="Not Done" runat="server"/></span>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_Other2"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server"/></td>
  </tr>
  <tr>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="21" LookupCode="BodySystem" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" ID="ROS_System_Other3" style="width: 50px;"/></td>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="21" LookupCode="ROS_Symptom" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_Other3" style="width: 130px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Other3" RecordId="21" GroupName="Other3" runat="server">
        <span><euc:EformRadioButton Id="Other3Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other3Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other3NotDone" Value="Not Done" runat="server"/></span>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="21" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_Other3"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server"/></td>
  </tr>
  <tr>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="22" LookupCode="BodySystem" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" ID="ROS_System_Other4" style="width: 50px;"/></td>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="22" LookupCode="ROS_Symptom" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_Other4" style="width: 130px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Other4" RecordId="22" GroupName="Other4" runat="server">
        <span><euc:EformRadioButton Id="Other4Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other4Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other4NotDone" Value="Not Done" runat="server"/></span>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="22" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_Other4"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server"/></td>
  </tr>
  <tr>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="23" LookupCode="BodySystem" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" ID="ROS_System_Other5" style="width: 50px;"/></td>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="23" LookupCode="ROS_Symptom" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_Other5" style="width: 130px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Other5" RecordId="23" GroupName="Other5" runat="server">
        <span><euc:EformRadioButton Id="Other5Normal" Value="Normal" runat="server"/></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other5Abnormal" Value="Abnormal" runat="server"/></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><euc:EformRadioButton Id="Other5NotDone" Value="Not Done" runat="server"/></span>
        </euc:EformRadioButtonGroup>    </td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="23" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_Other5"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon23" runat="server"/></td>
  </tr>
</table>
<br/>
<br/>
<br/>
