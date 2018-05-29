<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PostOpPrediction" CodeFile="PostOpPrediction.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>




      <!-- BEGIN Protocol 09-051 Questions -->
      <div id="Protocol_09_051" runat="server" visible="false" style="padding-left: 8px;">
          <span class="controlBoxTitle">Protocol 09-051</span>

        <table id="FamilyHistoryTable" border="0" cellspacing="0" cellpadding="6" width="600" class="eformLargePopulatedTable">
        <tr >

	        <td style="padding-top: 16px; padding-left: 16px; vertical-align: top;">
		        <strong>Suturing of lateral pelvic fascia during suspension of the DVC</strong>

		    <euc:EformHidden id="SurveyDateText_2" Table="Surveys" Field="SurveyDateText" RecordId="2" runat="server"/>
		    <euc:EformHidden id="SurveyDate_2" Table="Surveys" Field="SurveyDate"  RecordId="2" runat="server"/>


                <euc:EformHidden id="SurveyType2" runat="server" RecordId="2" Table="Surveys" Field="SurveyType" Value="Protocol 09-051" />
                <euc:EformHidden id="SurveyItem_Protocol_09_051_1" runat="server"  Table="SurveyItems" RecordId="1" ParentRecordId="2" Field="SurveyItem" Value="Lateral pelvic fascia during suspension" />
		        <euc:EformRadioButtonList TABLE="SurveyItems" RecordId="1" ParentRecordId="2" FIELD="SurveyItemResult" LookupCode="YesNoUnknown" id="SurveyItemResult_Protocol_09_051_1" RepeatLayout="Flow" CellSpacing="4" RepeatDirection="Horizontal"  runat="server"  EnableHiddenOnUIEvent="SurveyType2,SurveyItem_Protocol_09_051_1,SurveyDateText_2,SurveyDate_2" />

            </td>
        </tr>
        
                <tr >

	        <td style="padding-top: 22px; padding-left: 16px; vertical-align: top; padding-bottom: 14px;">
		        <strong>Irrigation of the Foley catheter</strong>

                <euc:EformHidden id="SurveyItem_Protocol_09_051_2" runat="server"  Table="SurveyItems" RecordId="2" ParentRecordId="2" Field="SurveyItem" Value="Irrigation of the Foley catheter" />
		        <euc:EformRadioButtonList TABLE="SurveyItems" RecordId="2" ParentRecordId="2" FIELD="SurveyItemResult" LookupCode="YesNoUnknown" id="SurveyItemResult_Protocol_09_051_2" RepeatLayout="Flow" CellSpacing="0" RepeatDirection="Horizontal"  runat="server"  EnableHiddenOnUIEvent="SurveyType2,SurveyItem_Protocol_09_051_2,SurveyDateText_2,SurveyDate_2" />

            </td>
        </tr>
        </table>
          <br/><br/><br/>
      </div>
      <!-- END Protocol 09-051 Questions -->




    <!-- BEGIN PostOp Prediction -->

<a name="PostOpPrediction" />
<span class="controlBoxTitle">&nbsp;&nbsp;PostOp Prediction</span><br />
  <table width="520" border="0" cellpadding="0" cellspacing="0" class="controlBox">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="516">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td><table width="516" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="100" height="18" align="right" class="controlBoxFieldTitle">Continence</td>
            <td>
       		    <euc:EformHidden id="SurveyDateText_1" Table="Surveys" Field="SurveyDateText" RecordId="1" runat="server"/>
		        <euc:EformHidden id="SurveyDate_1" Table="Surveys" Field="SurveyDate"  RecordId="1" runat="server"/>

              <euc:EformHidden id="SurveyType" runat="server" RecordId="1" Table="Surveys" Field="SurveyType" Value="PostOp Predictions" />
              <euc:EformHidden id="SurveyItem_Continence" runat="server"  Table="SurveyItems" RecordId="1" ParentRecordId="1" Field="SurveyItem" Value="Continence" />
              <euc:EformTextBox TABLE="SurveyItems" RecordId="1" ParentRecordId="1" FIELD="SurveyItemResult" ShowNumberPad="true" class="InputText" id="SurveyItemResult_Continence" size="6" runat="server" EnableHiddenOnUIEvent="SurveyType,SurveyItem_Continence,SurveyDateText_1,SurveyDate_1"/>
              &nbsp;&nbsp;(0-100%, 0%= Incontinent, 100%= Continent)</td>
          </tr>
          <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">Potency</td>
            <td>
              <euc:EformHidden id="SurveyItem_Potency" RecordId="2" ParentRecordId="1" runat="server"  Table="SurveyItems" Field="SurveyItem" Value="Potency" />
              <euc:EformTextBox TABLE="SurveyItems" RecordId="2" ParentRecordId="1" FIELD="SurveyItemResult" ShowNumberPad="true" class="InputText" id="SurveyItemResult_Potency" size="6" runat="server" EnableHiddenOnUIEvent="SurveyType,SurveyItem_Potency,SurveyDateText_1,SurveyDate_1"/>

              &nbsp;&nbsp;(0-100%, 0%= Impotent, 100%= Potent)</td>
          </tr>
          <%-- 
          <tr>
			<td width="100" height="18" align="right" class="controlBoxFieldTitle">T Stage</td>
			<td>
				<euc:EformHidden id="OpClinStageSystem" Table="ProstatectomyProc" Field="ProcStageSystem" Value="UICC_02" runat="server"/>
				<euc:EformSelect id="OpClinStageT" EnableHiddenOnUIEvent="OpClinStageSystem" Table="ProstatectomyProc" Field="ProcStageT" LookupCode="ProstateClinStageT_02" runat="server"/>
			</td>
          </tr>--%>
        </table></td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
  </table>  
      <!-- END PostOp Prediction -->
      
      

      