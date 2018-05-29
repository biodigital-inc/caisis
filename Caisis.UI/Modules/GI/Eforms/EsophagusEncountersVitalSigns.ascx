<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusEncountersVitalSigns" CodeFile="EsophagusEncountersVitalSigns.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="EsophagusEncountersVitalSigns" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Vital Signs"></asp:Label><br/>

<table width="650" border="0" cellspacing="0" cellpadding="6" style="border: solid 1px #cccccc;">
  <tr>
    <td width="50" align="right" class="ClinicalEformGridColumnOne"><strong>BP</strong></td>
    <td width="100" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;" RecordId="1" TABLE="Encounters" FIELD="EncSystolic" Runat="server" ID="EncSystolic" ShowNumberPad="false"  title="Systolic" /> <span style="font-size: 14px; font-weight: bold;">/</span> <euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="Encounters" FIELD="EncDiastolic" Runat="server" ID="EncDiastolic" ShowNumberPad="false" title="Diastolic" /></td>
    <td width="50" align="right" class="ClinicalEformGridColumnTwo"><strong>Pulse</strong></td>
    <td width="100" class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncPulse" Runat="server" ID="Pulse" ShowNumberPad="true"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnOne"><strong>Temp</strong></td>
    <td width="100" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncTemp" Runat="server" ID="Temp" ShowNumberPad="true"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnTwo"><strong>Resp</strong></td>
    <td width="100" class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncRespiration" Runat="server" ID="Resp" ShowNumberPad="true"/></td>
  </tr>
  <tr>
    <td align="right" class="ClinicalEformGridColumnTwo"><strong>Height<br />(cm)</strong></td>
    <td class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height" ShowNumberPad="true"/></td>
    <td align="right" class="ClinicalEformGridColumnOne"><strong>Weight<br />(kg)</strong></td>
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight" ShowNumberPad="true"/></td>
    <td align="right" class="ClinicalEformGridColumnTwo"><strong>BSA</strong></td>
    <td rowspan="2" valign="middle" class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA" ReadOnly="true"/></td>
    <td align="right" class="ClinicalEformGridColumnOne"><strong>BMI</strong></td>
    <td rowspan="2" valign="middle" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI" ReadOnly="true"/></td>
  </tr>
</table>
<br/>
<br/>
<br/>


<span class="controlBoxTitle">Weight History</span><br/>


<div  >
    <br />
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date:  </strong>
               <euc:EformTextBox Width="100px" RecordId="1" Table="Surveys" Field="SurveyDateText" ID="SurveyDateText_1" runat="server" ShowCalendar="true" CalcDate="true" />
               <euc:EformHidden RecordId="1" Table="Surveys" Field="SurveyDate" ID="SurveyDate_1" runat="server" /> 
   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" Table="Surveys" Field="SurveyType" ID="SurveyType_1" runat="server" /></td>
                
                
        </tr>
    </table>
    <br />
</div>
<table border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="WeightHistoryHtmlTable" > 

          <tr>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Item</td>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Result</td>
              <td class="controlBoxDataGridTitleColumn"></td>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes </td>
          </tr>
          <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_1" runat="server" Text="1" />.&nbsp;&nbsp;<asp:Label ID="Question_1" runat="server" Text="Weight prior to onset of Sx''s  (kg)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_1"  runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_1"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="1" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_1" runat="server" /> </td>
            <td valign="top" style="white-space: nowrap;"> 
                <euc:CaisisRadioButtonList style="white-space: nowrap;" ID="ResultNAUnknown_1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:CaisisRadioButtonList>
                </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="1" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_1" runat="server" ShowTextEditor="true" /></td>
         </tr>
           <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_2" runat="server" Text="2" />.&nbsp;&nbsp;<asp:Label ID="Question_2" runat="server" Text="Weight prior to neoadjuvant Tx (kg)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_2"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_2"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="2" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_2" runat="server" /></td>
            <td valign="top" style="white-space: nowrap;"> 
                <euc:CaisisRadioButtonList style="white-space: nowrap;" ID="ResultNAUnknown_2" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:CaisisRadioButtonList>
                </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="2" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_2" runat="server" ShowTextEditor="true" /></td>
         </tr>
           <tr>
            <td valign="top" style="white-space: nowrap;">
                 <asp:Label ID="QuestionNum_3" runat="server" Text="3" />.&nbsp;&nbsp;<asp:Label ID="Question_3" runat="server" Text="Weight prior to surgery  (kg)" />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_3"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_3"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="3" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_3" runat="server" /></td>
            <td valign="top" style="white-space: nowrap;"> 
                <euc:CaisisRadioButtonList style="white-space: nowrap;" ID="ResultNAUnknown_3" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:CaisisRadioButtonList>
                </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="3" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_3" runat="server" ShowTextEditor="true" /></td>
         </tr>
            <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_4" runat="server" Text="4" />.&nbsp;&nbsp;<asp:Label ID="Question_4" runat="server" Text="Weight on admission (kg)" />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_4"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_4"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="4" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_4" runat="server" /></td>
            <td valign="top" style="white-space: nowrap;"> 
                <euc:CaisisRadioButtonList style="white-space: nowrap;" ID="ResultNAUnknown_4" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:CaisisRadioButtonList>
                </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="4" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_4" runat="server" ShowTextEditor="true" /></td>
         </tr>
         <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_5" runat="server" Text="5" />.&nbsp;&nbsp;<asp:Label ID="Question_5" runat="server" Text="Duration of weight loss  (mos.)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_5"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_5"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="5" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_5" runat="server" /></td>
            <td valign="top" style="white-space: nowrap;"> 
                <euc:CaisisRadioButtonList style="white-space: nowrap;" ID="ResultNAUnknown_5" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:CaisisRadioButtonList>
                </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="5" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_5" runat="server" ShowTextEditor="true" /></td>
         </tr>
         <tr  >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_6" runat="server" Text="6" />.&nbsp;&nbsp;<asp:Label ID="Question_6" runat="server" Text="Weight at time of discharge (kg)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="6" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_6"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="6" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_6"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="6" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_6" runat="server" /></td>
            <td valign="top" style="white-space: nowrap;"> 
                <euc:CaisisRadioButtonList style="white-space: nowrap;" ID="ResultNAUnknown_6" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:CaisisRadioButtonList>
                </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="6" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_6" runat="server" ShowTextEditor="true" /></td>
         </tr>
         <tr  >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_7" runat="server" Text="7" />.&nbsp;&nbsp;<asp:Label ID="Question_7" runat="server" Text="Weight at 1 month f/u (kg)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="7" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_7"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="7" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_7"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="7" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_7" runat="server" /></td>
            <td valign="top" style="white-space: nowrap;"> 
                <euc:CaisisRadioButtonList style="white-space: nowrap;" ID="ResultNAUnknown_7" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:CaisisRadioButtonList>
                </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="7" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_7" runat="server" ShowTextEditor="true" /></td>
         </tr >
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_8" runat="server" Text="8" />.&nbsp;&nbsp;<asp:Label ID="Question_8" runat="server" Text="Weight at 3 month f/u (kg)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="8" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_8"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="8" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_8"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="8" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_8" runat="server" /></td>
             <td valign="top" style="white-space: nowrap;"> 
                <euc:CaisisRadioButtonList style="white-space: nowrap;" ID="ResultNAUnknown_8" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:CaisisRadioButtonList>
                </td>
           <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="8" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_8" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_9" runat="server" Text="9" />.&nbsp;&nbsp;<asp:Label ID="Question_9" runat="server" Text="Weight at 6 month f/u (kg)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="9" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_9"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="9" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_9"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="9" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_9" runat="server" /></td>
            <td valign="top" style="white-space: nowrap;"> 
                <euc:CaisisRadioButtonList style="white-space: nowrap;" ID="ResultNAUnknown_9" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:CaisisRadioButtonList>
                </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="9" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_9" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_10" runat="server" Text="10" />.&nbsp;&nbsp;<asp:Label ID="Question_10" runat="server" Text="Weight at 1 year f/u (kg)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="10" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_10"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="10" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_10"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="10" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_10" runat="server" /></td>
            <td valign="top" style="white-space: nowrap;"> 
                <euc:CaisisRadioButtonList style="white-space: nowrap;" ID="ResultNAUnknown_10" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:CaisisRadioButtonList>
                </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="10" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_10" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_11" runat="server" Text="11" />.&nbsp;&nbsp;<asp:Label ID="Question_11" runat="server" Text="Weight at 2 year f/u (kg)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="11" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_11"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="11" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_11"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="11" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_11" runat="server" /></td>
            <td valign="top" style="white-space: nowrap;"> 
                <euc:CaisisRadioButtonList style="white-space: nowrap;" ID="ResultNAUnknown_11" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:CaisisRadioButtonList>
                </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="11" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_11" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_12" runat="server" Text="12" />.&nbsp;&nbsp;<asp:Label ID="Question_12" runat="server" Text="Weight at 3 year f/u (kg)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="12" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_12"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="12" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_12"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="12" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_12" runat="server" /></td>
            <td valign="top" style="white-space: nowrap;"> 
                <euc:CaisisRadioButtonList style="white-space: nowrap;" ID="ResultNAUnknown_12" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:CaisisRadioButtonList>
                </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="12" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_12" runat="server" ShowTextEditor="true" /></td>
         </tr>       
        

</table>

<br /><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= SurveyDateText_1.ClientID %>'),$('<%= SurveyDate_1.ClientID %>'),$('<%= SurveyType_1.ClientID %>'),$('<%= SurveyItem_1.ClientID %>'),$('<%= SurveyItemNum_1.ClientID %>'),$('<%= SurveyItemResult_1.ClientID %>'),$('<%= SurveyItemNotes_1.ClientID %>'),'Weight History',$('<%= QuestionNum_1.ClientID %>'),$('<%= Question_1.ClientID %>'),$('<%= ResultNAUnknown_1.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_1.ClientID %>'),$('<%= SurveyDate_1.ClientID %>'),$('<%= SurveyType_1.ClientID %>'),$('<%= SurveyItem_2.ClientID %>'),$('<%= SurveyItemNum_2.ClientID %>'),$('<%= SurveyItemResult_2.ClientID %>'),$('<%= SurveyItemNotes_2.ClientID %>'),'Weight History',$('<%= QuestionNum_2.ClientID %>'),$('<%= Question_2.ClientID %>'),$('<%= ResultNAUnknown_2.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_1.ClientID %>'),$('<%= SurveyDate_1.ClientID %>'),$('<%= SurveyType_1.ClientID %>'),$('<%= SurveyItem_3.ClientID %>'),$('<%= SurveyItemNum_3.ClientID %>'),$('<%= SurveyItemResult_3.ClientID %>'),$('<%= SurveyItemNotes_3.ClientID %>'),'Weight History',$('<%= QuestionNum_3.ClientID %>'),$('<%= Question_3.ClientID %>'),$('<%= ResultNAUnknown_3.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_1.ClientID %>'),$('<%= SurveyDate_1.ClientID %>'),$('<%= SurveyType_1.ClientID %>'),$('<%= SurveyItem_4.ClientID %>'),$('<%= SurveyItemNum_4.ClientID %>'),$('<%= SurveyItemResult_4.ClientID %>'),$('<%= SurveyItemNotes_4.ClientID %>'),'Weight History',$('<%= QuestionNum_4.ClientID %>'),$('<%= Question_4.ClientID %>'),$('<%= ResultNAUnknown_4.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_1.ClientID %>'),$('<%= SurveyDate_1.ClientID %>'),$('<%= SurveyType_1.ClientID %>'),$('<%= SurveyItem_5.ClientID %>'),$('<%= SurveyItemNum_5.ClientID %>'),$('<%= SurveyItemResult_5.ClientID %>'),$('<%= SurveyItemNotes_5.ClientID %>'),'Weight History',$('<%= QuestionNum_5.ClientID %>'),$('<%= Question_5.ClientID %>'),$('<%= ResultNAUnknown_5.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_1.ClientID %>'),$('<%= SurveyDate_1.ClientID %>'),$('<%= SurveyType_1.ClientID %>'),$('<%= SurveyItem_6.ClientID %>'),$('<%= SurveyItemNum_6.ClientID %>'),$('<%= SurveyItemResult_6.ClientID %>'),$('<%= SurveyItemNotes_6.ClientID %>'),'Weight History',$('<%= QuestionNum_6.ClientID %>'),$('<%= Question_6.ClientID %>'),$('<%= ResultNAUnknown_6.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_1.ClientID %>'),$('<%= SurveyDate_1.ClientID %>'),$('<%= SurveyType_1.ClientID %>'),$('<%= SurveyItem_7.ClientID %>'),$('<%= SurveyItemNum_7.ClientID %>'),$('<%= SurveyItemResult_7.ClientID %>'),$('<%= SurveyItemNotes_7.ClientID %>'),'Weight History',$('<%= QuestionNum_7.ClientID %>'),$('<%= Question_7.ClientID %>'),$('<%= ResultNAUnknown_7.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_1.ClientID %>'),$('<%= SurveyDate_1.ClientID %>'),$('<%= SurveyType_1.ClientID %>'),$('<%= SurveyItem_8.ClientID %>'),$('<%= SurveyItemNum_8.ClientID %>'),$('<%= SurveyItemResult_8.ClientID %>'),$('<%= SurveyItemNotes_8.ClientID %>'),'Weight History',$('<%= QuestionNum_8.ClientID %>'),$('<%= Question_8.ClientID %>'),$('<%= ResultNAUnknown_8.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_1.ClientID %>'),$('<%= SurveyDate_1.ClientID %>'),$('<%= SurveyType_1.ClientID %>'),$('<%= SurveyItem_9.ClientID %>'),$('<%= SurveyItemNum_9.ClientID %>'),$('<%= SurveyItemResult_9.ClientID %>'),$('<%= SurveyItemNotes_9.ClientID %>'),'Weight History',$('<%= QuestionNum_9.ClientID %>'),$('<%= Question_9.ClientID %>'),$('<%= ResultNAUnknown_9.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_1.ClientID %>'),$('<%= SurveyDate_1.ClientID %>'),$('<%= SurveyType_1.ClientID %>'),$('<%= SurveyItem_10.ClientID %>'),$('<%= SurveyItemNum_10.ClientID %>'),$('<%= SurveyItemResult_10.ClientID %>'),$('<%= SurveyItemNotes_10.ClientID %>'),'Weight History',$('<%= QuestionNum_10.ClientID %>'),$('<%= Question_10.ClientID %>'),$('<%= ResultNAUnknown_10.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_1.ClientID %>'),$('<%= SurveyDate_1.ClientID %>'),$('<%= SurveyType_1.ClientID %>'),$('<%= SurveyItem_11.ClientID %>'),$('<%= SurveyItemNum_11.ClientID %>'),$('<%= SurveyItemResult_11.ClientID %>'),$('<%= SurveyItemNotes_11.ClientID %>'),'Weight History',$('<%= QuestionNum_11.ClientID %>'),$('<%= Question_11.ClientID %>'),$('<%= ResultNAUnknown_11.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_1.ClientID %>'),$('<%= SurveyDate_1.ClientID %>'),$('<%= SurveyType_1.ClientID %>'),$('<%= SurveyItem_12.ClientID %>'),$('<%= SurveyItemNum_12.ClientID %>'),$('<%= SurveyItemResult_12.ClientID %>'),$('<%= SurveyItemNotes_12.ClientID %>'),'Weight History',$('<%= QuestionNum_12.ClientID %>'),$('<%= Question_12.ClientID %>'),$('<%= ResultNAUnknown_12.ClientID %>'));

    function addAbsentEvent(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL)
    {  
        $(surveyItemResult).addEvent('blur',curry(ResetNaUnknownRBL,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL));
        var rbl = naOrUnknownRBL.getElementsByTagName('input');
        for (var j = 0; j < rbl.length; j++)
        {
            var rblRef = rbl[j];
            if (rblRef.type == 'radio')
                  $(rblRef).addEvent('click',curry(SetItemResult,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL));   
        } 
        // also set on load
        SetItemResult(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL);
        
        $(surveyDateText).addEvent('blur',curry(SetHiddenFields,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL));
        $(surveyItemResult).addEvent('blur',curry(SetHiddenFields,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL));
        $(surveyItemNotes).addEvent('blur',curry(SetHiddenFields,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL));   
        
        // if weight on admission is entered, populate for both vital signs and survey
        var admissionWeight = document.getElementById('<%= Weight.ClientID %>');
        $(admissionWeight).addEvent('blur',curry(SetAdmissionWeight,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL,admissionWeight));   
        $(surveyItemResult).addEvent('blur',curry(SetAdmissionWeight,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL,admissionWeight));   
        $(surveyItemNotes).addEvent('blur',curry(SetAdmissionWeight,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL,admissionWeight));        
    }
   
    /* ]]> */
   
    function SetHiddenFields(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL)
    {         
        var naOrUnknownValue = RetrieveRadioBtnListSelectedValues (naOrUnknownRBL,"FLOW");
              
        if (surveyDateText.value != '' || surveyItemResult.value != '' || surveyItemNotes.value != '')
        {
            surveyType.value = surveyTypeValue; 
            surveyItemNum.value = questionNum.innerHTML;
            surveyItem.value = question.innerHTML;            
        }
        else
        {
            surveyType.value = '';
            surveyItemNum.value = '';
            surveyItem.value = '';
        }
    }

    function SetAdmissionWeight(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL,admissionWeight)
    {        
        // if admission weight is set,
        // set survey admission weight
        if (admissionWeight.value != '' && question.innerHTML == 'Weight on admission (kg)' )
        {
            surveyItem.value = 'Weight on admission  (kg)'; 
            surveyItemResult.value = admissionWeight.value;        
        }
    }       
    
    function SetItemResult(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL)
    {         
        var naOrUnknownValue = RetrieveRadioBtnListSelectedValues (naOrUnknownRBL,"FLOW");
        
        if (naOrUnknownValue != '')
            surveyItemResult.value = naOrUnknownValue;            
        else if (surveyItemResult.value == 'N/A' || surveyItemResult.value == 'Unknown')
        {
            var rbl = naOrUnknownRBL.getElementsByTagName('input');
            for (var j = 0; j < rbl.length; j++)
            {
                var rblRef = rbl[j];
                if (rblRef.value == surveyItemResult.value)
                    rblRef.checked = true;
            }         
        }
    } 
    
    function ResetNaUnknownRBL(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemNotes,surveyTypeValue,questionNum,question,naOrUnknownRBL)
    {                 
        if (surveyItemResult.value != 'N/A' && surveyItemResult.value != 'Unknown')
        {
            var rbl = naOrUnknownRBL.getElementsByTagName('input');
            for (var j = 0; j < rbl.length; j++)
            {
                var rblRef = rbl[j];
                rblRef.checked = false;
            } 
        }
    } 

</script>