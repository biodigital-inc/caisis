<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.AppendixProcedure" CodeFile="AppendixProcedure.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" language="javascript">
    function DebulkingYesNo(Debulking_value)
    {
      if (Debulking_value == "Yes")
      {
        // shows Resection Yes/No table
        $('ResectionYesNoTbl').style.display='block';
        
        //hides all resection procedures - Primary and Ancillary lists
        PrimaryProceduresListTable.style.display='none';
        AncillaryProceduresListTable.style.display='none';
      } 
      else if (Debulking_value == "No")
      { 
        // hides Resection Yes/No table
        $('ResectionYesNoTbl').style.display='none';
        
        // hides PSM subform
        $('PSMProcedureTable').style.display='none';
        
        //shows all resection procedures - Primary and Ancillary lists
        PrimaryProceduresListTable.style.display='block';
        AncillaryProceduresListTable.style.display='block';
        
        //clear ResectionYesNo selections if any selected
        clearLists($('<%= ResectionRadio.ClientID %>'));
        
        //clears PSM subform field values
        clearElementsInParentRow($('PSMProcedureRow1'));
        clearLists($('<%=ProcSite_82.ClientID %>'));
        
        clearElementsInParentRow($('PSMProcedureRow2'));
        clearElementsInParentRow($('PSMProcedureRow3'));
        clearElementsInParentRow($('PSMProcedureRow4'));
        
        clearElementsInParentRow($('PSMProcedureRow5'));        
        clearLists($('<%=SurveyItemResult_1.ClientID %>')); 
        clearLists($('<%=SurveyItemResult_2.ClientID %>'));
        clearElementsInParentRow($('PSMProcedureRow6'));        
        clearLists($('<%=SurveyItemResult_3.ClientID %>')); 
        clearLists($('<%=SurveyItemResult_4.ClientID %>'));
        clearElementsInParentRow($('PSMProcedureRow7'));        
        clearLists($('<%=SurveyItemResult_5.ClientID %>')); 
        clearLists($('<%=SurveyItemResult_6.ClientID %>'));
        clearElementsInParentRow($('PSMProcedureRow8'));        
        clearLists($('<%=SurveyItemResult_7.ClientID %>')); 
        clearLists($('<%=SurveyItemResult_8.ClientID %>'));
        clearElementsInParentRow($('PSMProcedureRow9'));        
        clearLists($('<%=SurveyItemResult_9.ClientID %>')); 
        clearLists($('<%=SurveyItemResult_10.ClientID %>'));
        clearElementsInParentRow($('PSMProcedureRow10'));        
        clearLists($('<%=SurveyItemResult_11.ClientID %>')); 
        clearLists($('<%=SurveyItemResult_12.ClientID %>'));
        clearElementsInParentRow($('PSMProcedureRow11'));        
        clearLists($('<%=SurveyItemResult_13.ClientID %>')); 
        clearLists($('<%=SurveyItemResult_14.ClientID %>'));
        clearElementsInParentRow($('PSMProcedureRow12'));        
        clearLists($('<%=SurveyItemResult_15.ClientID %>')); 
        clearLists($('<%=SurveyItemResult_16.ClientID %>'));
        clearElementsInParentRow($('PSMProcedureRow13'));        
        clearLists($('<%=SurveyItemResult_17.ClientID %>')); 
        clearLists($('<%=SurveyItemResult_18.ClientID %>'));
        clearElementsInParentRow($('PSMProcedureRow14'));        
        clearLists($('<%=SurveyItemResult_19.ClientID %>')); 
        clearLists($('<%=SurveyItemResult_20.ClientID %>'));
        clearElementsInParentRow($('PSMProcedureRow15'));        
        clearLists($('<%=SurveyItemResult_21.ClientID %>')); 
        clearLists($('<%=SurveyItemResult_22.ClientID %>'));
        clearElementsInParentRow($('PSMProcedureRow16'));        
        clearLists($('<%=SurveyItemResult_23.ClientID %>')); 
        clearLists($('<%=SurveyItemResult_24.ClientID %>'));
        clearElementsInParentRow($('PSMProcedureRow17'));        
        clearLists($('<%=SurveyItemResult_25.ClientID %>')); 
        clearLists($('<%=SurveyItemResult_26.ClientID %>'));
        
        clearLists($('<%= PlaceIPPort.ClientID %>'));
        clearElementsInParentRow($('IpPortTr')); 
        
        clearLists($('<%= HIPEC.ClientID %>'));
        clearElementsInParentRow($('HipecTR'));
        clearElementsInParentRow($('MedTxAbsentRow'));
      }
    }   
    
    function ResectionYesNo(Resection_value)
    {
        if (Resection_value == "Yes")
      {
        // shows PSM subform
        $('PSMProcedureTable').style.display='block';
        
        //shows all resection procedures - Primary and Ancillary lists
        PrimaryProceduresListTable.style.display='block';
        AncillaryProceduresListTable.style.display='block';
        
      } 
      else if (Resection_value == "No")
      {
        // shows PSM subform
        $('PSMProcedureTable').style.display='block';
        
        //hides all resection procedures - Primary and Ancillary lists
        PrimaryProceduresListTable.style.display='none';
        AncillaryProceduresListTable.style.display='none';
        
        //clears all fields entered in Resection Proc subforms
        clearLists(ProcApproach);
        clearElementsInParentRow(PrimaryProcedureListRow1);
        clearElementsInParentRow(PrimaryProcedureListRow2);
        
        clearElementsInParentRow(AncillaryProceduresListRow1);
        clearElementsInParentRow(AncillaryProceduresListRow2);
        clearElementsInParentRow(AncillaryProceduresListRow3);
        clearElementsInParentRow(AncillaryProceduresListRow4);
        clearElementsInParentRow(AncillaryProceduresListRow5);
        clearElementsInParentRow(AncillaryProceduresListRow6);
        clearElementsInParentRow(AncillaryProceduresListRow7);
        clearElementsInParentRow(AncillaryProceduresListRow8);
        clearElementsInParentRow(AncillaryProceduresListRow9);
      }
    }
    
    //used to clear all radio or checkbox lists
    function clearLists(surveyItemResult)
    {
        var SurveyItemRes = surveyItemResult;
        var SurveyItemRes_Radio = SurveyItemRes.getElementsByTagName("input"); 
        for (var i=0;i<SurveyItemRes_Radio.length;i++) 
        { 
           if(SurveyItemRes_Radio[i].checked)
           {
                SurveyItemRes_Radio[i].checked = false;
           }
        } 
    }


    function updateProcDetails(siteli_value,procDtTxtId,procdateId,procName,shortdate,date,proc,procprim,procprimflag,procInst,procInstVal,procQlty,procQltyVal)
    {
      if (siteli_value != '' || siteli_value == '') //for all list values and also if checked "Other"
      {
        document.getElementById(procDtTxtId).value = shortdate;
        document.getElementById(procdateId).value = date;
        document.getElementById(procName).value = proc;
        document.getElementById(procprim).value = procprimflag;
        document.getElementById(procInst).value = procInstVal;
        document.getElementById(procQlty).value = procQltyVal;
      }
    }
    
    function IPPortDoneRadio(option_value,dateTextFieldId, shortdate,dateFieldId,date,proc,procvalue)
    {
      if (option_value == "Yes")
      {
        document.getElementById(dateTextFieldId).value = shortdate;
        document.getElementById(dateFieldId).value = date;
        document.getElementById(proc).value = procvalue;
      } 
      else if (option_value == "No")
      { 
        //clears all rows data
        clearElementsInParentRow(document.getElementById('IpPortTr'));
      }
    }
    
    function hipecRadio(hipec_value,meddateTextId,medshortdate,meddateId,meddate,medtype,medtypevalue,medqlty,medqltyvalue, AbsEvntDateTxtId,AbsEvntDateId,AbsEvntTableId,AbsEvntFieldId,AbsEvntFieldValueId,AbsEvntReasonId,AbsEvntQltyId,AbsEvntTable,AbsEvntField,AbsEvntFieldValue,AbsEvntReason,AbsEvntQlty)
    {
      if (hipec_value == "Yes")
      {
        //clears absent event data
        clearElementsInParentRow(document.getElementById('MedTxAbsentRow'));
        
        
        $('HipecTbl').style.display='block';
        
        //updates MedTx data
        if(medshortdate!='')
        {
            document.getElementById(meddateTextId).value = medshortdate;
            document.getElementById(meddateId).value = meddate;
            document.getElementById(medtype).value = medtypevalue;
            document.getElementById(medqlty).value = medqltyvalue;
        }        
      } 
      else if (hipec_value == "No")
      { 
        //clears MedTx data
        clearElementsInParentRow(document.getElementById('HipecTR'));
        
        //updates absentEvent data
        document.getElementById(AbsEvntDateTxtId).value = medshortdate;
        document.getElementById(AbsEvntDateId).value = meddate;
        document.getElementById(AbsEvntTableId).value = AbsEvntTable;        
        document.getElementById(AbsEvntFieldId).value = AbsEvntField;
        document.getElementById(AbsEvntFieldValueId).value = AbsEvntFieldValue;
        document.getElementById(AbsEvntReasonId).value = AbsEvntReason;
        document.getElementById(AbsEvntQltyId).value = AbsEvntQlty;
        
        $('HipecTbl').style.display='none';
      }
    }
</script>

<a name="AppendixProcedure" />
<table id="DebilkingYesNoTbl">
    <tr>
        <td><span class="controlBoxTitle">Is this case a Debulking ?</span></td>
        <td>
            <euc:EformRadioButtonList ID="DebulkingRadio" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="15"
                Table="NoTable" Field="DebulkingRadio">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<table id="ResectionYesNoTbl" style="display:none;">
    <tr>
        <td><span class="controlBoxTitle">Was a synchronous resection performed as well ?</span></td>
        <td>
            <euc:EformRadioButtonList ID="ResectionRadio" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="15"
                Table="NoTable" Field="ResectionRadio">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table><br />


<table id="PSMProcedureTable" style="display:none;">
    <tr>
        <td>
            <span class="controlBoxTitle">Peritoneal Surface Malignancy</span>
            <table border="0" cellspacing="0" cellpadding="10" width="650" class="eformLargePopulatedTable" style="margin-bottom: 20px;">
                <tr>
                    <td>
                        <table>
                            <tr  id="PSMProcedureRow1">
	                            <td >
	                                <span class="controlBoxTitle" style="font-size:12px;">Primary Disease</span>
	                                <euc:EformTextBox id="ProcDateText_82" Table="Procedures" Field="ProcDateText" RecordId="82" runat="server" 
	                                    style="display:none;width:1px;"/>
                                    <euc:EformTextBox id="ProcDate_82" Table="Procedures" Field="ProcDate"  RecordId="82" runat="server" 
                                        style="display:none;width:1px;"/>
                                    <euc:EformTextBox RecordId="82" Table="Procedures" Field="ProcName" id="ProcName_82" runat="server" 
                                        style="display:none;width:1px;"/>
                                    <euc:EformTextBox RecordId="82" Table="Procedures" Field="ProcPrimary" id="ProcPrimary_82" runat="server" 
                                        style="display:none;width:1px;" />
                                    <euc:EformTextBox RecordId="82" Table="Procedures" Field="ProcInstitution" id="ProcInstitution_82" runat="server" 
                                        style="display:none;width:1px;" />
                                    <euc:EformTextBox RecordId="82" Table="Procedures" Field="ProcQuality" id="ProcQuality_82" runat="server" 
                                        style="display:none;width:1px;"/>
                                </td>
                                <td>
                                    <euc:EformExtendedCheckBoxList RecordId="82"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_82" runat="server" 
                                        ShowOther="true" RepeatLayout="Table" RepeatDirection="Horizontal" LookupCode="DxTarget,Disease,Colorectal" /></td>
                             </tr>
                        </table><br />
                        
                        <table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProcHtmlTable">
                          <tr> 
                            <%--<td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Disease Extent</td>--%>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Operative Intent</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Complete Cytoreduction</td>
                            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                          </tr>                          
                          <tr  id="PSMProcedureRow2">
                            <%--<td><euc:EformDropDownList ParentRecordId="82" RecordId="1"  TABLE="ColorectalProc" FIELD="ProcDiseaseExtent" 
                                ID="ProcDiseaseExtent_1" Runat="server" LookupCode="ColorectalDiseaseExtent"  /></td>--%>
                            <td align="center"><euc:EformDropDownList RecordId="1"  TABLE="ColorectalProc" FIELD="ProcIntent" ID="ProcIntent_1" 
                                Runat="server" LookupCode="ColorectalProcIntent" /></td>
                            <td align="center"><euc:EformDropDownList RecordId="1"  TABLE="ColorectalProc" FIELD="ProcCompleteResection" 
                                ID="ProcCompleteResection_1" Runat="server">
                                    <asp:ListItem Value="" Text=""></asp:ListItem>
                                    <asp:ListItem Value="CCR-0 (no residual disease)" Text="CCR-0 (no residual disease)"></asp:ListItem>
                                    <asp:ListItem Value="CCR-1 (<2.5 mm)" Text="CCR-1 (<2.5 mm)"></asp:ListItem>
                                    <asp:ListItem Value="CCR-2 (2.5-25 mm)" Text="CCR-2 (2.5-25 mm)"></asp:ListItem>
                                    <asp:ListItem Value="CCR-3 (>25 mm)" Text="CCR-3 (>25 mm)"></asp:ListItem>
                                </euc:EformDropDownList></td>
                          </tr>
                        </table><br /><br />
                        
                        <span class="controlBoxTitle">Diagnosis</span>
                        <table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="EncHtmlTbl">
                          <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Date</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Presentation</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Chief Complaint</td>
                          </tr>                          
                          <tr  id="PSMProcedureRow3">
                            <td><euc:EformTextBox id="EncDateText" Table="Encounters" Field="EncDateText" runat="server" Width="80px" ShowCalendar="true" 
                                CalcDate="True"/>
                                <euc:EformHidden id="EncDate" Table="Encounters" Field="EncDate"  runat="server"/></td>
                            <td align="center"><euc:EformDropDownList TABLE="Encounters" FIELD="EncPresentation" ID="EncPresentation" Runat="server" 
                                LookupCode="EncPresentation,Disease,Colorectal" Width="100px" /></td>
                            <td align="center"><euc:EformTextBox TABLE="Encounters" FIELD="EncChiefComplaint" ID="EncChiefComplaint" Runat="server" Width="180px" />
                                <euc:EformTextBox TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality" style="display:none;width:1px;" /></td>
                          </tr>
                          <tr><td style="height:15px;"></td></tr>
                          <tr  id="PSMProcedureRow4">
                            <td colspan="3"><span class="controlBoxTitle"  style="background-color:#DFE3E6; font-size:12px;">Pre-op Symptoms</span><br />
                                <euc:EformTextBox RecordId="1" Table="EncReviewOfSystems" Field="ROS_System" id="ROS_System_1" runat="server" 
                                    style="display:none;width:1px;"/>
                                <euc:EformTextBox RecordId="2" Table="EncReviewOfSystems" Field="ROS_System" id="ROS_System_2" runat="server" 
                                    style="display:none;width:1px;"/>
                                <euc:EformTextBox RecordId="3" Table="EncReviewOfSystems" Field="ROS_System" id="ROS_System_3" runat="server" 
                                    style="display:none;width:1px;"/>
                                <euc:EformTextBox RecordId="4" Table="EncReviewOfSystems" Field="ROS_System" id="ROS_System_4" runat="server" 
                                    style="display:none;width:1px;"/>
                                <euc:EformTextBox RecordId="5" Table="EncReviewOfSystems" Field="ROS_System" id="ROS_System_5" runat="server" 
                                    style="display:none;width:1px;"/>
                                <euc:EformTextBox RecordId="6" Table="EncReviewOfSystems" Field="ROS_System" id="ROS_System_6" runat="server" 
                                    style="display:none;width:1px;"/>
                                <euc:EformTextBox RecordId="7" Table="EncReviewOfSystems" Field="ROS_System" id="ROS_System_7" runat="server" 
                                    style="display:none;width:1px;"/>
                                <euc:EformTextBox RecordId="8" Table="EncReviewOfSystems" Field="ROS_System" id="ROS_System_8" runat="server" 
                                    style="display:none;width:1px;"/>
                                <euc:EformTextBox RecordId="9" Table="EncReviewOfSystems" Field="ROS_System" id="ROS_System_9" runat="server" 
                                    style="display:none;width:1px;"/>
                                
                                <euc:EformCheckBox RecordId="1" Table="EncReviewOfSystems" Field="ROS_Symptom" id="ROS_Symptom_1" Value="Gastric Outlet Obstruction" runat="server" EnableHiddenOnUIEvent="ROS_System_1" />Gastric Outlet Obstruction<br/>
                                <euc:EformCheckBox RecordId="2" Table="EncReviewOfSystems" Field="ROS_Symptom" id="ROS_Symptom_2" Value="Small Bowel Obstruction" runat="server" EnableHiddenOnUIEvent="ROS_System_2" />Small Bowel Obstruction<br/>
                                <euc:EformCheckBox RecordId="3" Table="EncReviewOfSystems" Field="ROS_Symptom" id="ROS_Symptom_3" Value="Increasing Abdominal Girth" runat="server" EnableHiddenOnUIEvent="ROS_System_3" />Increasing Abdominal Girth<br/>
                                <euc:EformCheckBox RecordId="4" Table="EncReviewOfSystems" Field="ROS_Symptom" id="ROS_Symptom_4" Value="Nausea/Vomiting/Early satiety" runat="server" EnableHiddenOnUIEvent="ROS_System_4" />Nausea/Vomiting/Early satiety<br/>
                                <euc:EformCheckBox RecordId="5" Table="EncReviewOfSystems" Field="ROS_Symptom" id="ROS_Symptom_5" Value="Weight loss" runat="server" EnableHiddenOnUIEvent="ROS_System_5" />Weight loss<br/>
                                <euc:EformCheckBox RecordId="6" Table="EncReviewOfSystems" Field="ROS_Symptom" id="ROS_Symptom_6" Value="Hernia" runat="server" EnableHiddenOnUIEvent="ROS_System_6" />Hernia<br/>
                                <euc:EformCheckBox RecordId="7" Table="EncReviewOfSystems" Field="ROS_Symptom" id="ROS_Symptom_7" Value="Abdominal Pain" runat="server" EnableHiddenOnUIEvent="ROS_System_7" />Abdominal Pain<br/>
                                <euc:EformCheckBox RecordId="8" Table="EncReviewOfSystems" Field="ROS_Symptom" id="ROS_Symptom_8" Value="None" runat="server" EnableHiddenOnUIEvent="ROS_System_8" />None<br/>
                                <euc:EformCheckBox Table="NoTable" Field="ROS_Symptom" id="ROS_Symptom" Value="Other" runat="server" />Other
                                <euc:EformTextBox RecordId="9" Table="EncReviewOfSystems" Field="ROS_Symptom" id="ROS_Symptom_9" runat="server" Width="200px" /><br/>
                                
                            </td>
                          </tr>
                        </table><br /><br />
                        
                        <table border="0" cellspacing="0" cellpadding="0" width="600">
                            <tr >
	                            <td style="vertical-align:top;">
                                    <span class="controlBoxTitle">Peritoneal Carcinomatosis Index</span>
                                    <table id="PCIScoreTbl" cellspacing="0" cellpadding="3" width="450" style="background-color:#DFE3E6;border:solid 1px #cccccc;">
                                        <tr>
                                            <td></td>
                                            <td align="center" class="controlBoxDataGridHeaderFirstCol" 
                                                style="border-right-color:Gray; border-right-width:1px; border-right-style:solid;"><strong>Pre</strong></td>
                                            <td align="center" class="controlBoxDataGridHeaderFirstCol"><strong>Post</strong></td>
                                            <td align="center" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td><euc:EformTextBox Table="Surveys" Field="SurveyDateText" id="SurveyDateText" runat="server" 
	                                                style="display:none; width:1px;"/>
	                                            <euc:EformTextBox Table="Surveys" Field="SurveyDate" id="SurveyDate" runat="server" 
	                                                style="display:none; width:1px;"/>
	                                            <euc:EformTextBox Table="Surveys" Field="SurveyType" id="SurveyType" runat="server" 
	                                                style="display:none; width:1px;"/>
	                                            <euc:EformTextBox Table="Surveys" Field="SurveyQuality" id="SurveyQuality" runat="server" 
	                                                style="display:none; width:1px;"/>
		                                        </td>
                                            <td align="left" style="font-size:10px;border-right-color:Gray; border-right-width:1px; border-right-style:solid; 
                                                padding-right:10px;" class="controlBoxDataGridHeaderFirstCol">
                                                <strong>0</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>1</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>2</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>3</strong></td>
                                            
                                            <td align="left" style="font-size:10px;padding-right:10px;" class="controlBoxDataGridHeaderFirstCol">
                                                <strong>0</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>1</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>2</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>3</strong></td>
                                            <td align="left" style="font-size:10px;padding-right:10px;" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                                        </tr>
                            
                                        <tr style=" background-color:White;" id="PSMProcedureRow5">
	                                        <td style="padding-top: 5px; padding-left: 10px; font-weight: 800;text-align:left;" 
	                                            class="controlBoxDataGridHeaderFirstCol">
	                                            <euc:EformTextBox Table="SurveyItems" RecordId="1" Field="SurveyItem" id="SurveyItem_1" runat="server" 
		                                            style="display:none; width:1px;"/>0 - Central/Omentum</td>	
	                                        <td style="padding-top: 5px; text-align:center;border-right-color:Gray; border-right-width:1px; border-right-style:solid;">
	                                        <euc:EformRadioButtonList Table="SurveyItems" RecordId="1"  Field="SurveyItemResult" id="SurveyItemResult_1" 
	                                            runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                                <asp:ListItem Value="0" Text="" />
                                                <asp:ListItem Value="1" Text="" />
                                                <asp:ListItem Value="2" Text="" />
                                                <asp:ListItem Value="3" Text="" />
	                                        </euc:EformRadioButtonList>
	                                        </td>
                        	                
	                                        <td style="padding-top:5px;text-align:center;">
	                                        <euc:EformTextBox Table="SurveyItems" RecordId="2" Field="SurveyItem" id="SurveyItem_2" runat="server" 
	                                            style="display:none; width:1px;"/>
	                                        <euc:EformRadioButtonList Table="SurveyItems" RecordId="2"  Field="SurveyItemResult" id="SurveyItemResult_2" 
	                                            runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                                <asp:ListItem Value="0" Text="" />
                                                <asp:ListItem Value="1" Text="" />
                                                <asp:ListItem Value="2" Text="" />
                                                <asp:ListItem Value="3" Text="" />
	                                        </euc:EformRadioButtonList>
	                                        </td>
	                                        <td style="padding-top:5px;text-align:center;"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PSMProcedureRow5'));"  style="float: right; cursor: pointer;" /></td>
                                        </tr>
                                        
                                        <tr id="PSMProcedureRow6">
	                                        <td style="padding-top: 5px; padding-left: 10px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
		                                        <euc:EformTextBox Table="SurveyItems" RecordId="3" Field="SurveyItem" id="SurveyItem_3" runat="server" 
		                                            style="display:none; width:1px;"/>1 - Right Upper</td>    
	                                        <td style="padding-top: 5px; text-align:center;border-right-color:Gray; border-right-width:1px; border-right-style:solid;">
	                                        <euc:EformRadioButtonList Table="SurveyItems" RecordId="3"  Field="SurveyItemResult" id="SurveyItemResult_3" 
	                                            runat="server" RepeatDirection="Horizontal" CellPadding="3">   
	                                            <asp:ListItem Value="0" Text="" />
                                                <asp:ListItem Value="1" Text="" />
                                                <asp:ListItem Value="2" Text="" />
                                                <asp:ListItem Value="3" Text="" />                     
	                                        </euc:EformRadioButtonList>
	                                        </td>
                        	                
	                                        <td style="padding-top: 5px; text-align:center;">
	                                        <euc:EformTextBox Table="SurveyItems" RecordId="4" Field="SurveyItem" id="SurveyItem_4" runat="server" 
	                                            style="display:none; width:1px;"/>
	                                        <euc:EformRadioButtonList Table="SurveyItems" RecordId="4"  Field="SurveyItemResult" id="SurveyItemResult_4" 
	                                            runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                                <asp:ListItem Value="0" Text="" />
                                                <asp:ListItem Value="1" Text="" />
                                                <asp:ListItem Value="2" Text="" />
                                                <asp:ListItem Value="3" Text="" /> 
	                                        </euc:EformRadioButtonList>
	                                        </td>
	                                        <td style="padding-top:5px;text-align:center;"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PSMProcedureRow6'));"  style="float: right; cursor: pointer;" /></td>
                                        </tr>
                                        
                                        <tr  style=" background-color:White;" id="PSMProcedureRow7">
	                                        <td style="padding-top: 5px; padding-left: 10px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
		                                        <euc:EformTextBox Table="SurveyItems" RecordId="5" Field="SurveyItem" id="SurveyItem_5" runat="server" 
		                                            style="display:none; width:1px;"/>2 – Epigastrium  </td>	
	                                        <td style="padding-top: 5px; text-align:center;border-right-color:Gray; border-right-width:1px; border-right-style:solid;">
	                                        <euc:EformRadioButtonList Table="SurveyItems" RecordId="5"  Field="SurveyItemResult" id="SurveyItemResult_5" 
	                                            runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                                <asp:ListItem Value="0" Text="" />
                                                <asp:ListItem Value="1" Text="" />
                                                <asp:ListItem Value="2" Text="" />
                                                <asp:ListItem Value="3" Text="" /> 
	                                        </euc:EformRadioButtonList>
	                                        </td>
                        	                
	                                        <td style="padding-top: 5px; text-align:center;">
	                                        <euc:EformTextBox Table="SurveyItems" RecordId="6" Field="SurveyItem" id="SurveyItem_6" runat="server" 
	                                            style="display:none; width:1px;"/>
	                                        <euc:EformRadioButtonList Table="SurveyItems" RecordId="6"  Field="SurveyItemResult" id="SurveyItemResult_6" 
	                                           runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                                <asp:ListItem Value="0" Text="" />
                                                <asp:ListItem Value="1" Text="" />
                                                <asp:ListItem Value="2" Text="" />
                                                <asp:ListItem Value="3" Text="" />
	                                        </euc:EformRadioButtonList>
	                                        </td>
	                                        <td style="padding-top:5px;text-align:center;"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PSMProcedureRow7'));"  style="float: right; cursor: pointer;" /></td>
                                        </tr>
                                        
                                        <tr id="PSMProcedureRow8">
	                                        <td style="padding-top: 5px; padding-left: 10px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
		                                        <euc:EformTextBox Table="SurveyItems" RecordId="7" Field="SurveyItem" id="SurveyItem_7" runat="server" 
		                                            style="display:none; width:1px;"/>3 - Left Upper </td>	
	                                        <td style="padding-top: 5px; text-align:center;border-right-color:Gray; border-right-width:1px; border-right-style:solid;">
	                                        <euc:EformRadioButtonList Table="SurveyItems" RecordId="7"  Field="SurveyItemResult" id="SurveyItemResult_7" 
	                                            runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                                <asp:ListItem Value="0" Text="" />
                                                <asp:ListItem Value="1" Text="" />
                                                <asp:ListItem Value="2" Text="" />
                                                <asp:ListItem Value="3" Text="" />
	                                        </euc:EformRadioButtonList>
	                                        </td>
                        	                
	                                        <td style="padding-top: 5px; text-align:center;">
	                                        <euc:EformTextBox Table="SurveyItems" RecordId="8" Field="SurveyItem" id="SurveyItem_8" runat="server" 
	                                            style="display:none; width:1px;"/>
	                                        <euc:EformRadioButtonList Table="SurveyItems" RecordId="8"  Field="SurveyItemResult" id="SurveyItemResult_8" 
	                                            runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                                <asp:ListItem Value="0" Text="" />
                                                <asp:ListItem Value="1" Text="" />
                                                <asp:ListItem Value="2" Text="" />
                                                <asp:ListItem Value="3" Text="" />
	                                        </euc:EformRadioButtonList>
	                                        </td>
	                                        <td style="padding-top:5px;text-align:center;"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PSMProcedureRow8'));"  style="float: right; cursor: pointer;" /></td>
                                        </tr>
                                        
                                        <tr  style=" background-color:White;" id="PSMProcedureRow9">
	                            <td style="padding-top: 5px; padding-left: 10px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
		                            <euc:EformTextBox Table="SurveyItems" RecordId="9" Field="SurveyItem" id="SurveyItem_9" runat="server" 
		                                style="display:none; width:1px;"/>4 - Left Flank </td>	
	                            <td style="padding-top: 5px; text-align:center;border-right-color:Gray; border-right-width:1px; border-right-style:solid;">
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="9"  Field="SurveyItemResult" id="SurveyItemResult_9" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
            	                
	                            <td style="padding-top: 5px; text-align:center;">
	                            <euc:EformTextBox Table="SurveyItems" RecordId="10" Field="SurveyItem" id="SurveyItem_10" runat="server" 
	                                style="display:none; width:1px;"/>
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="10"  Field="SurveyItemResult" id="SurveyItemResult_10" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                   <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
	                            <td style="padding-top:5px;text-align:center;"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PSMProcedureRow9'));"  style="float: right; cursor: pointer;" /></td>
                            </tr>
                            
                                        <tr id="PSMProcedureRow10">
	                            <td style="padding-top: 5px; padding-left: 10px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
		                            <euc:EformTextBox Table="SurveyItems" RecordId="11" Field="SurveyItem" id="SurveyItem_11" runat="server" 
		                                style="display:none; width:1px;"/>5 - Left Lower </td>	
	                            <td style="padding-top: 5px; text-align:center;border-right-color:Gray; border-right-width:1px; border-right-style:solid;">
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="11"  Field="SurveyItemResult" id="SurveyItemResult_11" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
            	                
	                            <td style="padding-top: 5px; text-align:center;">
	                            <euc:EformTextBox Table="SurveyItems" RecordId="12" Field="SurveyItem" id="SurveyItem_12" runat="server" 
	                                style="display:none; width:1px;"/>
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="12"  Field="SurveyItemResult" id="SurveyItemResult_12" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                   <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
	                            <td style="padding-top:5px;text-align:center;"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PSMProcedureRow10'));"  style="float: right; cursor: pointer;" /></td>
                            </tr>
                            
                                        <tr style=" background-color:White;" id="PSMProcedureRow11">
	                            <td style="padding-top: 5px; padding-left: 10px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
		                            <euc:EformTextBox Table="SurveyItems" RecordId="13" Field="SurveyItem" id="SurveyItem_13" runat="server" 
		                                style="display:none; width:1px;"/>6 – Pelvis </td>	
	                            <td style="padding-top: 5px; text-align:center;border-right-color:Gray; border-right-width:1px; border-right-style:solid;">
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="13"  Field="SurveyItemResult" id="SurveyItemResult_13" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
            	                
	                            <td style="padding-top: 5px; text-align:center;">
	                            <euc:EformTextBox Table="SurveyItems" RecordId="14" Field="SurveyItem" id="SurveyItem_14" runat="server" 
	                                style="display:none; width:1px;"/>
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="14"  Field="SurveyItemResult" id="SurveyItemResult_14" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
	                            <td style="padding-top:5px;text-align:center;"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PSMProcedureRow11'));"  style="float: right; cursor: pointer;" /></td>
                            </tr>
                            
                                        <tr id="PSMProcedureRow12">
	                            <td style="padding-top: 5px; padding-left: 10px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
		                            <euc:EformTextBox Table="SurveyItems" RecordId="15" Field="SurveyItem" id="SurveyItem_15" runat="server" 
		                                style="display:none; width:1px;"/>7 - Right Lower </td>	
	                            <td style="padding-top: 5px; text-align:center;border-right-color:Gray; border-right-width:1px; border-right-style:solid;">
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="15"  Field="SurveyItemResult" id="SurveyItemResult_15" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
            	                
	                            <td style="padding-top: 5px; text-align:center;">
	                            <euc:EformTextBox Table="SurveyItems" RecordId="16" Field="SurveyItem" id="SurveyItem_16" runat="server" 
	                                style="display:none; width:1px;"/>
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="16"  Field="SurveyItemResult" id="SurveyItemResult_16" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                   <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
	                            <td style="padding-top:5px;text-align:center;"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PSMProcedureRow12'));"  style="float: right; cursor: pointer;" /></td>
                            </tr>
                            
                                        <tr style=" background-color:White;" id="PSMProcedureRow13">
	                            <td style="padding-top: 5px; padding-left: 10px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
		                            <euc:EformTextBox Table="SurveyItems" RecordId="17" Field="SurveyItem" id="SurveyItem_17" runat="server" 
		                                style="display:none; width:1px;"/>8 - Right Flank </td>	
	                            <td style="padding-top: 5px; text-align:center;border-right-color:Gray; border-right-width:1px; border-right-style:solid;">
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="17"  Field="SurveyItemResult" id="SurveyItemResult_17" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                   <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
            	                
	                            <td style="padding-top: 5px; text-align:center;">
	                            <euc:EformTextBox Table="SurveyItems" RecordId="18" Field="SurveyItem" id="SurveyItem_18" runat="server" 
	                                style="display:none; width:1px;"/>
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="18"  Field="SurveyItemResult" id="SurveyItemResult_18" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
	                            <td style="padding-top:5px;text-align:center;"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PSMProcedureRow13'));"  style="float: right; cursor: pointer;" /></td>
                            </tr>
                            
                                        <tr id="PSMProcedureRow14">
	                            <td style="padding-top: 5px; padding-left: 10px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
		                            <euc:EformTextBox Table="SurveyItems" RecordId="19" Field="SurveyItem" id="SurveyItem_19" runat="server" 
		                                style="display:none; width:1px;"/>9 - Upper Jejunum </td>	
	                            <td style="padding-top: 5px; text-align:center;border-right-color:Gray; border-right-width:1px; border-right-style:solid;">
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="19"  Field="SurveyItemResult" id="SurveyItemResult_19" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
            	                
	                            <td style="padding-top: 5px; text-align:center;">
	                            <euc:EformTextBox Table="SurveyItems" RecordId="20" Field="SurveyItem" id="SurveyItem_20" runat="server" 
	                                style="display:none; width:1px;"/>
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="20"  Field="SurveyItemResult" id="SurveyItemResult_20" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
	                            <td style="padding-top:5px;text-align:center;"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PSMProcedureRow14'));"  style="float: right; cursor: pointer;" /></td>
                            </tr>
                            
                                        <tr style=" background-color:White;" id="PSMProcedureRow15">
	                            <td style="padding-top: 5px; padding-left: 10px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
		                            <euc:EformTextBox Table="SurveyItems" RecordId="21" Field="SurveyItem" id="SurveyItem_21" runat="server" 
		                                style="display:none; width:1px;"/>10 - Lower Jejunum </td>	
	                            <td style="padding-top: 5px; text-align:center;border-right-color:Gray; border-right-width:1px; border-right-style:solid;">
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="21"  Field="SurveyItemResult" id="SurveyItemResult_21" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
            	                
	                            <td style="padding-top: 5px; text-align:center;">
	                            <euc:EformTextBox Table="SurveyItems" RecordId="22" Field="SurveyItem" id="SurveyItem_22" runat="server" 
	                                style="display:none; width:1px;"/>
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="22"  Field="SurveyItemResult" id="SurveyItemResult_22" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                   <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
	                            <td style="padding-top:5px;text-align:center;"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PSMProcedureRow15'));"  style="float: right; cursor: pointer;" /></td>
                            </tr>
                            
                                        <tr id="PSMProcedureRow16">
	                            <td style="padding-top: 5px; padding-left: 10px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
		                            <euc:EformTextBox Table="SurveyItems" RecordId="23" Field="SurveyItem" id="SurveyItem_23" runat="server" 
		                                style="display:none; width:1px;"/>11 - Upper Ileum </td>	
	                            <td style="padding-top: 5px; text-align:center;border-right-color:Gray; border-right-width:1px; border-right-style:solid;">
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="23"  Field="SurveyItemResult" id="SurveyItemResult_23" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
            	                
	                            <td style="padding-top: 5px; text-align:center;">
	                            <euc:EformTextBox Table="SurveyItems" RecordId="24" Field="SurveyItem" id="SurveyItem_24" runat="server" 
	                                style="display:none; width:1px;"/>
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="24"  Field="SurveyItemResult" id="SurveyItemResult_24" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
	                            <td style="padding-top:5px;text-align:center;"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PSMProcedureRow16'));"  style="float: right; cursor: pointer;" /></td>
                            </tr>
                            
                                        <tr style=" background-color:White;" id="PSMProcedureRow17">
	                            <td style="padding-top: 5px; padding-left: 10px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
		                            <euc:EformTextBox Table="SurveyItems" RecordId="25" Field="SurveyItem" id="SurveyItem_25" runat="server" 
		                                style="display:none; width:1px;"/>12 - Lower Ileum </td>	
	                            <td style="padding-top: 5px; text-align:center;border-right-color:Gray; border-right-width:1px; border-right-style:solid;">
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="25"  Field="SurveyItemResult" id="SurveyItemResult_25" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
	                            </td>
            	                
	                            <td style="padding-top: 5px; text-align:center;">
	                            <euc:EformTextBox Table="SurveyItems" RecordId="26" Field="SurveyItem" id="SurveyItem_26" runat="server" 
	                                style="display:none; width:1px;"/>
	                            <euc:EformRadioButtonList Table="SurveyItems" RecordId="26"  Field="SurveyItemResult" id="SurveyItemResult_26" 
	                                runat="server" RepeatDirection="Horizontal" CellPadding="3">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="" />
                                    <asp:ListItem Value="2" Text="" />
                                    <asp:ListItem Value="3" Text="" />
	                            </euc:EformRadioButtonList>
            	                
                                    <euc:EformTextBox Table="SurveyItems" RecordId="27" Field="SurveyItem" id="SurveyItem_27" runat="server" 
	                                    style="display:none; width:1px;"/>
	                                <euc:EformTextBox Table="SurveyItems" RecordId="27" Field="SurveyItemResult" id="SurveyItemResult_27" runat="server"
	                                    style="display:none; width:1px;"/>
                                    <euc:EformTextBox Table="SurveyItems" RecordId="28" Field="SurveyItem" id="SurveyItem_28" runat="server" 
	                                    style="display:none; width:1px;"/>
	                                <euc:EformTextBox Table="SurveyItems" RecordId="28"  Field="SurveyItemResult" id="SurveyItemResult_28"  runat="server"
	                                    style="display:none; width:1px;"/>
                               </td>
                               <td style="padding-top:5px;text-align:center;"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PSMProcedureRow17'));"  style="float: right; cursor: pointer;" /></td>
                            </tr>
                                    </table><br />
                                </td>
                                <td style=" width:25px;"></td>
                                <td style="vertical-align:top; padding-top:15px;">
                                    <table  style="vertical-align:top;" class="ClinicalEformTable">
                                        <tr style=" background-color:#DFE3E6;">
                                            <td><span style="font-weight:bold;">PCI Criteria</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><span>0 - No Tumor</span><br />
                                                <span>1 - <5.0 mm</span><br />
                                                <span>2 - 5.0mm, <5.0 cm</span><br />
                                                <span>3 - ≥5 cm</span></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        
                        <table>
                            <tr>
                                <td><span class="controlBoxTitle" style="font-size:12px;">Placement of IP port ?</span></td>
                                <td id="PlacementofIPPortTd">
                                    <euc:EformRadioButtonList ID="PlaceIPPort" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="15"
                                        Table="NoTable" Field="PlaceIPPort">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </euc:EformRadioButtonList></td>
	                            <td><img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('PlacementofIPPortTd'));" style="float: right; cursor: pointer;" /></td>
                            </tr>
                            <tr id="IpPortTr">
                                <td>
                                    <euc:EformTextBox RecordId="83" id="ProcDateText_83" Table="Procedures" Field="ProcDateText" runat="server" 
                                        style="display:none;width:1px;"/>
                                    <euc:EformTextBox RecordId="83" id="ProcDate_83" Table="Procedures" Field="ProcDate"  runat="server" 
                                        style="display:none;width:1px;"/>
                                    <euc:EformTextBox RecordId="83" Table="Procedures" Field="ProcName" id="ProcName_83" runat="server" 
                                        style="display:none;width:1px;"/>
                                </td>
                            </tr>
                        </table>
                        
                        <table>
                            <tr>
                                <td><span class="controlBoxTitle" style="font-size:12px;">HIPEC ?</span></td>
                                <td id="HIPECYesNoTd">
                                    <euc:EformRadioButtonList ID="HIPEC" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="15"
                                        Table="NoTable" Field="HIPEC">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </euc:EformRadioButtonList></td>
                                <td><img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('HIPECYesNoTd'));clearInputFields($('HipecTbl'));clearInputFields($('MedTxAbsentRow'));" style="float: right; cursor: pointer;" /></td>
                            </tr>
                        </table>
                        <table width="500" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="HipecTbl" style="display:none;">
                            <tr> 
                                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Date</td>
                                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Agent</td>
                                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Type</td>
                            </tr>
                            <tr id="HipecTR">
                                <td><euc:EformTextBox RecordId="1" id="MedTxDateText_1" Table="MedicalTherapy" Field="MedTxDateText" runat="server" 
                                        Width="100px" ShowCalendar="true"/>
                                    <euc:EformTextBox RecordId="1" id="MedTxDate_1" Table="MedicalTherapy" Field="MedTxDate"  runat="server" 
                                        style="display:none;width:1px;"/></td>
                                <td align="center"><euc:EformComboBox RecordId="1" id="MedTxAgent_1" Table="MedicalTherapy" Field="MedTxAgent" runat="server" 
                                        LookupCode="ColorectalMedTxAgent" DropDownHeight="auto" /></td>
                                 <td align="center"><euc:EformTextBox RecordId="1" id="MedTxType_1" Table="MedicalTherapy" Field="MedTxType"  runat="server" 
                                        Width="100px"/>
                                     <euc:EformTextBox RecordId="1" id="MedTxQuality_1" Table="MedicalTherapy" Field="MedTxQuality" runat="server" 
                                        style="display:none;width:1px;"/></td> 
                            </tr>
                        </table>
                        
                        <table  style="display:none;">
                            <tr id="MedTxAbsentRow">
                                <td>
                                    <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_1"
                                        runat="server" Width="1px" Style="display: none;" />
                                    <euc:EformTextBox RecordId="1" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_1"
                                        Runat="server" Width="1px" Style="display: none;" />
                                    <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="TableName" ID="TableName_1"
                                        runat="server" Width="1px" Style="display: none;" />
                                    <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldName" ID="FieldName_1"
                                        runat="server" Width="1px" Style="display: none;" />
                                    <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_1"
                                        runat="server" Width="1px" Style="display: none;" />
                                    <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_1"
                                        runat="server" Width="1px" Style="display: none;" />
                                    <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_1"
                                        runat="server" Width="1px" Style="display: none;" />
                                </td>
                            </tr>
                      </table>
                    </td>
                </tr> 
            </table>
        </td>
    </tr>
</table><br />


<script type="text/javascript">
    //this PSM ProcPrimary will be used to flag primary procedure from PrimaryProcedures list if this is not performed
    var PSMProcPrimary = $('<%=ProcPrimary_82.ClientID %>');

    //Adds events to controls
    function addEncEvents(EncDt,EncPrestn,EncCmplt,EncQlty)
    { 
        $(EncDt).addEvent('blur',curry(EncAutoPopulates,EncDt,EncPrestn,EncCmplt,EncQlty));
        $(EncPrestn).addEvent('blur',curry(EncAutoPopulates,EncDt,EncPrestn,EncCmplt,EncQlty));
    }
 
    addEncEvents($('<%= EncDateText.ClientID %>'),$('<%= EncPresentation.ClientID %>'),$('<%= EncChiefComplaint.ClientID %>'),$('<%= EncQuality.ClientID %>'));


    function EncAutoPopulates(EncDt,EncPrestn,EncCmplt,EncQlty)
    {
       if (EncDt.value != '' || EncPrestn.value != '')
        {
           EncCmplt.value = 'Peritoneal Surface Malignancy';
           EncQlty.value = 'STD';
        }
        else
        {
            EncCmplt.value = '';
            EncQlty.value = '';
        }
    }
    
    //Adds events to controls
    function addMedTxEvents(medtxDt,medtxagent,medtxType,medtxQlty)
    { 
        $(medtxDt).addEvent('blur',curry(HipecAutoPopulates,medtxDt,medtxagent,medtxType,medtxQlty));
    }
 
    addMedTxEvents($('<%= MedTxDateText_1.ClientID %>'),$('<%= MedTxAgent_1.ClientID %>'),$('<%= MedTxType_1.ClientID %>'),$('<%= MedTxQuality_1.ClientID %>'));


    function HipecAutoPopulates(medtxDt,medtxagent,medtxType,medtxQlty)
    {
       if (medtxDt.value != '' || medtxagent != '')
        {
           medtxType.value = 'CHEMO';
           medtxQlty.value = 'STD';
        }
        else
        {
            medtxType.value = '';
            medtxQlty.value = '';
        }
    }
    
    //Adds events to controls
    function addROSEvts(ROSSymp,ROSSys)
    { 
        $(ROSSymp).addEvent('click',curry(ROSPopulates,ROSSymp,ROSSys));
    }
 
    addROSEvts($('<%= ROS_Symptom_1.ClientID %>'),$('<%= ROS_System_1.ClientID %>'));
    addROSEvts($('<%= ROS_Symptom_2.ClientID %>'),$('<%= ROS_System_2.ClientID %>'));
    addROSEvts($('<%= ROS_Symptom_3.ClientID %>'),$('<%= ROS_System_3.ClientID %>'));
    addROSEvts($('<%= ROS_Symptom_4.ClientID %>'),$('<%= ROS_System_4.ClientID %>'));
    addROSEvts($('<%= ROS_Symptom_5.ClientID %>'),$('<%= ROS_System_5.ClientID %>'));
    addROSEvts($('<%= ROS_Symptom_6.ClientID %>'),$('<%= ROS_System_6.ClientID %>'));
    addROSEvts($('<%= ROS_Symptom_7.ClientID %>'),$('<%= ROS_System_7.ClientID %>'));
    addROSEvts($('<%= ROS_Symptom_8.ClientID %>'),$('<%= ROS_System_8.ClientID %>'));

    function ROSPopulates(ROSSymp,ROSSys)
    {
       if (ROSSymp.value != '')
        {
           ROSSys.value = 'Colorectal';
        }
        else
        {
            ROSSys.value = '';
        }
    }  
    
    function addROSEvents(ROSSymptom,ROSSystem)
    { 
        $(ROSSymptom).addEvent('blur',curry(ROSAutoPopulates,ROSSymptom,ROSSystem));
    }
 
    addROSEvents($('<%= ROS_Symptom_9.ClientID %>'),$('<%= ROS_System_9.ClientID %>'));

    function ROSAutoPopulates(ROSSymptom,ROSSystem)
    {
       if (ROSSymptom.value != '')
        {
           ROSSystem.value = 'Colorectal';
        }
        else
        {
            ROSSystem.value = '';
        }
    }  
    
    //Adds events to Survey controls
    function addSurveyEvents(item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult)
    { 
        $(Res1).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res3).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res5).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res7).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res9).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res11).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res13).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res15).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res17).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res19).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res21).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res23).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res25).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res2).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res4).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res6).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res8).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res10).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res12).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res14).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res16).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res18).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res20).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res22).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res24).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
        $(Res26).addEvent('click',curry(surveyAutoPopulates,item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult));
    }
 
    addSurveyEvents($('<%= SurveyItem_1.ClientID %>'),$('<%= SurveyItemResult_1.ClientID %>'),$('<%= SurveyItem_3.ClientID %>'),$('<%= SurveyItemResult_3.ClientID %>'),$('<%= SurveyItem_5.ClientID %>'),$('<%= SurveyItemResult_5.ClientID %>'),$('<%= SurveyItem_7.ClientID %>'),$('<%= SurveyItemResult_7.ClientID %>'),$('<%= SurveyItem_9.ClientID %>'),$('<%= SurveyItemResult_9.ClientID %>'),$('<%= SurveyItem_11.ClientID %>'),$('<%= SurveyItemResult_11.ClientID %>'),$('<%= SurveyItem_13.ClientID %>'),$('<%= SurveyItemResult_13.ClientID %>'),$('<%= SurveyItem_15.ClientID %>'),$('<%= SurveyItemResult_15.ClientID %>'),$('<%= SurveyItem_17.ClientID %>'),$('<%= SurveyItemResult_17.ClientID %>'),$('<%= SurveyItem_19.ClientID %>'),$('<%= SurveyItemResult_19.ClientID %>'),$('<%= SurveyItem_21.ClientID %>'),$('<%= SurveyItemResult_21.ClientID %>'),$('<%= SurveyItem_23.ClientID %>'),$('<%= SurveyItemResult_23.ClientID %>'),$('<%= SurveyItem_25.ClientID %>'),$('<%= SurveyItemResult_25.ClientID %>'),$('<%= SurveyDateText.ClientID %>'),$('<%= SurveyDate.ClientID %>'),$('<%= SurveyType.ClientID %>'),$('<%= SurveyQuality.ClientID %>'),$('<%= SurveyItem_27.ClientID %>'),$('<%= SurveyItemResult_27.ClientID %>'),$('<%= SurveyItem_2.ClientID %>'),$('<%= SurveyItemResult_2.ClientID %>'),$('<%= SurveyItem_4.ClientID %>'),$('<%= SurveyItemResult_4.ClientID %>'),$('<%= SurveyItem_6.ClientID %>'),$('<%= SurveyItemResult_6.ClientID %>'),$('<%= SurveyItem_8.ClientID %>'),$('<%= SurveyItemResult_8.ClientID %>'),$('<%= SurveyItem_10.ClientID %>'),$('<%= SurveyItemResult_10.ClientID %>'),$('<%= SurveyItem_12.ClientID %>'),$('<%= SurveyItemResult_12.ClientID %>'),$('<%= SurveyItem_14.ClientID %>'),$('<%= SurveyItemResult_14.ClientID %>'),$('<%= SurveyItem_16.ClientID %>'),$('<%= SurveyItemResult_16.ClientID %>'),$('<%= SurveyItem_18.ClientID %>'),$('<%= SurveyItemResult_18.ClientID %>'),$('<%= SurveyItem_20.ClientID %>'),$('<%= SurveyItemResult_20.ClientID %>'),$('<%= SurveyItem_22.ClientID %>'),$('<%= SurveyItemResult_22.ClientID %>'),$('<%= SurveyItem_24.ClientID %>'),$('<%= SurveyItemResult_24.ClientID %>'),$('<%= SurveyItem_26.ClientID %>'),$('<%= SurveyItemResult_26.ClientID %>'),$('<%= SurveyItem_28.ClientID %>'),$('<%= SurveyItemResult_28.ClientID %>'));

    function surveyAutoPopulates(item1,Res1,item3,Res3,item5,Res5,item7,Res7,item9,Res9,item11,Res11,item13,Res13,item15,Res15,item17,Res17,item19,Res19,item21,Res21,item23,Res23,item25,Res25,DateTxt,Date,Type,Qlty,preTotItem,preTotResult,item2,Res2,item4,Res4,item6,Res6,item8,Res8,item10,Res10,item12,Res12,item14,Res14,item16,Res16,item18,Res18,item20,Res20,item22,Res22,item24,Res24,item26,Res26,PostTotItem,PostTotResult)
    {
       var pre_sum = 0;
       var radio1 = Res1.getElementsByTagName("input"); 
        for (var i=0;i<radio1.length;i++) 
        { 
           if(radio1[i].checked)
           {
                pre_sum += parseInt(radio1[i].value);
                item1.value = 'Pre: 0 - Central/Omentum';
           }
        }
        var radio3 = Res3.getElementsByTagName("input"); 
        for (var i=0;i<radio3.length;i++) 
        { 
           if(radio3[i].checked)
           {
                pre_sum += parseInt(radio3[i].value);
                item3.value = 'Pre: 1 - Right Upper';
           }
        }
        var radio5 = Res5.getElementsByTagName("input"); 
        for (var i=0;i<radio5.length;i++) 
        { 
           if(radio5[i].checked)
           {
                pre_sum += parseInt(radio5[i].value);
                item5.value = 'Pre: 2 – Epigastrium';
           }
        }
        var radio7 = Res7.getElementsByTagName("input"); 
        for (var i=0;i<radio7.length;i++) 
        { 
           if(radio7[i].checked)
           {
                pre_sum += parseInt(radio7[i].value);
                item7.value = 'Pre: 3 - Left Upper';
           }
        }
        var radio9 = Res9.getElementsByTagName("input"); 
        for (var i=0;i<radio9.length;i++) 
        { 
           if(radio9[i].checked)
           {
                pre_sum += parseInt(radio9[i].value);
                item9.value = 'Pre: 4 - Left Flank';
           }
        }
        var radio11 = Res11.getElementsByTagName("input"); 
        for (var i=0;i<radio11.length;i++) 
        { 
           if(radio11[i].checked)
           {
                pre_sum += parseInt(radio11[i].value);
                item11.value = 'Pre: 5 - Left Lower';
           }
        }
        var radio13 = Res13.getElementsByTagName("input"); 
        for (var i=0;i<radio13.length;i++) 
        { 
           if(radio13[i].checked)
           {
                pre_sum += parseInt(radio13[i].value);
                item13.value = 'Pre: 6 – Pelvis';
           }
        }
        var radio15 = Res15.getElementsByTagName("input"); 
        for (var i=0;i<radio15.length;i++) 
        { 
           if(radio15[i].checked)
           {
                pre_sum += parseInt(radio15[i].value);
                item15.value = 'Pre: 7 - Right Lower';
           }
        }
        var radio17 = Res17.getElementsByTagName("input"); 
        for (var i=0;i<radio17.length;i++) 
        { 
           if(radio17[i].checked)
           {
                pre_sum += parseInt(radio17[i].value);
                item17.value = 'Pre: 8 - Right Flank';
           }
        }
        var radio19 = Res19.getElementsByTagName("input"); 
        for (var i=0;i<radio19.length;i++) 
        { 
           if(radio19[i].checked)
           {
                pre_sum += parseInt(radio19[i].value);
                item19.value = 'Pre: 9 - Upper Jejunum';
           }
        }
        var radio21 = Res21.getElementsByTagName("input"); 
        for (var i=0;i<radio21.length;i++) 
        { 
           if(radio21[i].checked)
           {
                pre_sum += parseInt(radio21[i].value);
                item21.value = 'Pre: 10 - Lower Jejunum';
           }
        }
        var radio23 = Res23.getElementsByTagName("input"); 
        for (var i=0;i<radio23.length;i++) 
        { 
           if(radio23[i].checked)
           {
                pre_sum += parseInt(radio23[i].value);
                item23.value = 'Pre: 11 - Upper Ileum';
           }
        }
        var radio25 = Res25.getElementsByTagName("input"); 
        for (var i=0;i<radio25.length;i++) 
        { 
           if(radio25[i].checked)
           {
                pre_sum += parseInt(radio25[i].value);
                item25.value = 'Pre: 12 - Lower Ileum';
           }
        }
        
       var post_sum = 0;
       var radio2 = Res2.getElementsByTagName("input"); 
        for (var i=0;i<radio2.length;i++) 
        { 
           if(radio2[i].checked)
           {
                post_sum += parseInt(radio2[i].value);
                item2.value = 'Post: 0 - Central/Omentum';
           }
        }
        var radio4 = Res4.getElementsByTagName("input"); 
        for (var i=0;i<radio4.length;i++) 
        { 
           if(radio4[i].checked)
           {
                post_sum += parseInt(radio4[i].value);
                item4.value = 'Post: 1 - Right Upper';
           }
        }
        var radio6 = Res6.getElementsByTagName("input"); 
        for (var i=0;i<radio6.length;i++) 
        { 
           if(radio6[i].checked)
           {
                post_sum += parseInt(radio6[i].value);
                item6.value = 'Post: 2 – Epigastrium';
           }
        }
        var radio8 = Res8.getElementsByTagName("input"); 
        for (var i=0;i<radio8.length;i++) 
        { 
           if(radio8[i].checked)
           {
                post_sum += parseInt(radio8[i].value);
                item8.value = 'Post: 3 - Left Upper';
           }
        }
        var radio10 = Res10.getElementsByTagName("input"); 
        for (var i=0;i<radio10.length;i++) 
        { 
           if(radio10[i].checked)
           {
                post_sum += parseInt(radio10[i].value);
                item10.value = 'Post: 4 - Left Flank';
           }
        }
        var radio12 = Res12.getElementsByTagName("input"); 
        for (var i=0;i<radio12.length;i++) 
        { 
           if(radio12[i].checked)
           {
                post_sum += parseInt(radio12[i].value);
                item12.value = 'Post: 5 - Left Lower';
           }
        }
        var radio14 = Res14.getElementsByTagName("input"); 
        for (var i=0;i<radio14.length;i++) 
        { 
           if(radio14[i].checked)
           {
                post_sum += parseInt(radio14[i].value);
                item14.value = 'Post: 6 – Pelvis';
           }
        }
        var radio16 = Res16.getElementsByTagName("input"); 
        for (var i=0;i<radio16.length;i++) 
        { 
           if(radio16[i].checked)
           {
                post_sum += parseInt(radio16[i].value);
                item16.value = 'Post: 7 - Right Lower';
           }
        }
        var radio18 = Res18.getElementsByTagName("input"); 
        for (var i=0;i<radio18.length;i++) 
        { 
           if(radio18[i].checked)
           {
                post_sum += parseInt(radio18[i].value);
                item18.value = 'Post: 8 - Right Flank';
           }
        }
        var radio20 = Res20.getElementsByTagName("input"); 
        for (var i=0;i<radio20.length;i++) 
        { 
           if(radio20[i].checked)
           {
                post_sum += parseInt(radio20[i].value);
                item20.value = 'Post: 9 - Upper Jejunum';
           }
        }
        var radio22 = Res22.getElementsByTagName("input"); 
        for (var i=0;i<radio22.length;i++) 
        { 
           if(radio22[i].checked)
           {
                post_sum += parseInt(radio22[i].value);
                item22.value = 'Post: 10 - Lower Jejunum';
           }
        }
        var radio24 = Res24.getElementsByTagName("input"); 
        for (var i=0;i<radio24.length;i++) 
        { 
           if(radio24[i].checked)
           {
                post_sum += parseInt(radio24[i].value);
                item24.value = 'Post: 11 - Upper Ileum';
           }
        }
        var radio26 = Res26.getElementsByTagName("input"); 
        for (var i=0;i<radio26.length;i++) 
        { 
           if(radio26[i].checked)
           {
                post_sum += parseInt(radio26[i].value);
                item26.value = 'Post: 12 - Lower Ileum';
           }
        } 
        
        DateTxt.value = $('<%= ProcDateText_82.ClientID %>').value;
        Date.value = $('<%= ProcDate_82.ClientID %>').value;
        Type.value = 'Colorectal PCI Score';
        Qlty.value = 'STD';
        
        
        //Dr.Nash wanted to show Totals even if the value is zero
//        if(pre_sum != '')
//        {
            preTotItem.value = 'Pre: Total';
            preTotResult.value = pre_sum;
//        }
//        
//        if(post_sum != '')
//        {
            PostTotItem.value = 'Post: Total';
            PostTotResult.value = post_sum;
//        }
    }
</script>