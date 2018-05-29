<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreatitisApacheIISurvey" CodeFile="PancreatitisApacheIISurvey.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="PancreatitisApacheIISurvey" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="APACHE II Score"></asp:Label><br/>

<div >
    <br />
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date:  </strong>
               <euc:EformTextBox  Width="100px" RecordId="5" Table="Surveys" Field="SurveyDateText" ID="SurveyDateText_5" runat="server"  ShowCalendar="true" CalcDate="true"/>
               <euc:EformHidden RecordId="5" Table="Surveys" Field="SurveyDate" ID="SurveyDate_5" runat="server"  />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" Table="Surveys" Field="SurveyType" ID="SurveyType_5" runat="server" /></td>                
                
        </tr>
    </table>
    <br />
</div>

<table border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="ApacheIIHtmlTable" > 

          <tr>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Item</td>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Result</td>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Total</td>
              <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes </td>
          </tr>

          <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_1" runat="server" Text="1" />.&nbsp;&nbsp;<asp:Label ID="Question_1" runat="server" Text="Age" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_1"  runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_1"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="200px" RecordId="1" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_1" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="<= 44" Text="<= 44" />
                    <asp:ListItem Value="45 - 54" Text="45 - 54" />
                    <asp:ListItem Value="55 - 64" Text="55 - 64" />
                    <asp:ListItem Value="65 - 74" Text="65 - 74" />
                    <asp:ListItem Value=">= 75" Text=">= 75" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="1" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_1" runat="server" ReadOnly="true" /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="1" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_1" runat="server" ShowTextEditor="true" /></td>
         </tr>
           <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_2" runat="server" Text="2" />.&nbsp;&nbsp;<asp:Label ID="Question_2" runat="server" Text="Hematocrit [Ht] (%)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_2"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_2"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="200px" RecordId="2" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_2" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="< 20" Text="< 20" />
                    <asp:ListItem Value="20 - 29.9" Text="20 - 29.9" />
                    <asp:ListItem Value="30 - 45.9" Text="30 - 45.9" />
                    <asp:ListItem Value="46 - 49.9" Text="46 - 49.9" />
                    <asp:ListItem Value="50 - 59.9" Text="50 - 59.9" />
                    <asp:ListItem Value=">= 60" Text=">= 60" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="2" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_2" runat="server" ReadOnly="true"  /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="2" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_2" runat="server" ShowTextEditor="true" /></td>
         </tr>
           <tr>
            <td valign="top" style="white-space: nowrap;">
                 <asp:Label ID="QuestionNum_3" runat="server" Text="3" />.&nbsp;&nbsp;<asp:Label ID="Question_3" runat="server" Text="W.B.C." />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_3"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_3"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="200px" RecordId="3" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_3" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="< 1000" Text="< 1000" />
                    <asp:ListItem Value="1000 - 2900" Text="1000 - 2900" />
                    <asp:ListItem Value="3000 - 14900" Text="3000 - 14900" />
                    <asp:ListItem Value="15000 - 19900" Text="15000 - 19900" />
                    <asp:ListItem Value="20000 - 39900" Text="20000 - 39900" />
                    <asp:ListItem Value=">= 40000" Text=">= 40000" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="3" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_3" runat="server" ReadOnly="true"   /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="3" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_3" runat="server" ShowTextEditor="true" /></td>
         </tr>
            <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_4" runat="server" Text="4" />.&nbsp;&nbsp;<asp:Label ID="Question_4" runat="server" Text="Temperature (°C)" />   
               <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_4"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_4"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="200px" RecordId="4" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_4" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="<= 29.9" Text="<= 29.9" />
                    <asp:ListItem Value="30 - 31.9" Text="30 - 31.9" />
                    <asp:ListItem Value="32 - 33.9" Text="32 - 33.9" />
                    <asp:ListItem Value="34 - 35.9" Text="34 - 35.9" />
                    <asp:ListItem Value="36 - 38.4" Text="36 - 38.4" />
                    <asp:ListItem Value="38.25 - 38.9" Text="38.25 - 38.9" />
                    <asp:ListItem Value="39 - 40.9" Text="39 - 40.9" />
                    <asp:ListItem Value=">= 41" Text=">= 41" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="4" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_4" runat="server" ReadOnly="true"  /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="4" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_4" runat="server" ShowTextEditor="true" /></td>
         </tr>
         <tr>
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_5" runat="server" Text="5" />.&nbsp;&nbsp;<asp:Label ID="Question_5" runat="server" Text="Mean Arterial Pressure [MAP] (mmHg)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_5"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_5"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="200px" RecordId="5" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_5" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="<= 49" Text="<= 49" />
                    <asp:ListItem Value="50 - 69" Text="50 - 69" />
                    <asp:ListItem Value="70 - 109" Text="70 - 109" />
                    <asp:ListItem Value="110 - 129" Text="110 - 129" />
                    <asp:ListItem Value="130 - 159" Text="130 - 159" />
                    <asp:ListItem Value=">= 160" Text=">= 160" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="5" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_5" ReadOnly="true"  runat="server"  /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="5" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_5" runat="server" ShowTextEditor="true" /></td>
         </tr>
         <tr  >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_6" runat="server" Text="6" />.&nbsp;&nbsp;<asp:Label ID="Question_6" runat="server" Text="Heart Rate" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="6" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_6"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="6" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_6"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="200px" RecordId="6" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_6" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="<= 39" Text="<= 39" />
                    <asp:ListItem Value="40 - 54" Text="40 - 54" />
                    <asp:ListItem Value="55 - 69" Text="55 - 69" />
                    <asp:ListItem Value="70 - 109" Text="70 - 109" />
                    <asp:ListItem Value="110 - 139" Text="110 - 139" />
                    <asp:ListItem Value="140 - 179" Text="140 - 179" />
                    <asp:ListItem Value=">= 180" Text=">= 180" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="6" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_6" ReadOnly="true"  runat="server"  /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="6" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_6" runat="server" ShowTextEditor="true" /></td>
         </tr>
         <tr  >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_7" runat="server" Text="7" />.&nbsp;&nbsp;<asp:Label ID="Question_7" runat="server" Text="Respiratory Rate" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="7" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_7"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="7" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_7"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="200px" RecordId="7" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_7" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="<= 5" Text="<= 5" />
                    <asp:ListItem Value="6 - 9" Text="6 - 9" />
                    <asp:ListItem Value="10 - 11" Text="10 - 11" />
                    <asp:ListItem Value="12 - 24" Text="12 - 24" />
                    <asp:ListItem Value="25 - 34" Text="25 - 34" />
                    <asp:ListItem Value="35 - 49" Text="35 - 49" />
                    <asp:ListItem Value=">= 50" Text=">= 50" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="7" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_7" ReadOnly="true"  runat="server" /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="7" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_7" runat="server" ShowTextEditor="true" /></td>
         </tr >
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_8" runat="server" Text="8" />.&nbsp;&nbsp;<asp:Label ID="Question_8" runat="server" Text="Serum Sodium (mmol/L)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="8" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_8"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="8" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_8"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="200px" RecordId="8" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_8" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="<= 110" Text="<= 110" />
                    <asp:ListItem Value="111 - 119" Text="111 - 119" />
                    <asp:ListItem Value="120 - 129" Text="120 - 129" />
                    <asp:ListItem Value="130 - 149" Text="130 - 149" />
                    <asp:ListItem Value="150 - 154" Text="150 - 154" />
                    <asp:ListItem Value="155 - 159" Text="155 - 159" />
                    <asp:ListItem Value="160- 179" Text="160- 179" />
                    <asp:ListItem Value=">= 180" Text=">= 180" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="8" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_8" ReadOnly="true"  runat="server"  /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="8" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_8" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_9" runat="server" Text="9" />.&nbsp;&nbsp;<asp:Label ID="Question_9" runat="server" Text="Serum Potassium (mmol/L)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="9" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_9"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="9" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_9"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="200px" RecordId="9" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_9" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="< 2.5" Text="< 2.5" />
                    <asp:ListItem Value="2.5 - 2.9" Text="2.5 - 2.9" />
                    <asp:ListItem Value="3 - 3.4" Text="3 - 3.4" />
                    <asp:ListItem Value="3.5 - 5.4" Text="3.5 - 5.4" />
                    <asp:ListItem Value="3.5 - 5.4" Text="3.5 - 5.4" />
                    <asp:ListItem Value="6 - 6.9" Text="6 - 6.9" />
                    <asp:ListItem Value=">= 7" Text=">= 7" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="9" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_9" ReadOnly="true"  runat="server"  /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="9" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_9" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_10" runat="server" Text="10" />.&nbsp;&nbsp;<asp:Label ID="Question_10" runat="server" Text="(A-a)O2 Gradient / PaO2 (mmHg)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="10" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_10"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="10" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_10"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="200px" RecordId="10" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_10" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Aa gradient < 200 AND FIO2 >= 0.5" Text="Aa gradient < 200 AND FIO2 >= 0.5" />
                    <asp:ListItem Value="Aa gradient 200 - 349 AND FIO2 >= 0.5" Text="Aa gradient 200 - 349 AND FIO2 >= 0.5" />
                    <asp:ListItem Value="Aa gradient 350 - 499 AND FIO2 >= 0.5" Text="Aa gradient 350 - 499 AND FIO2 >= 0.5" />
                    <asp:ListItem Value="Aa gradient >= 500 AND FIO2 >= 0.5" Text="Aa gradient >= 500 AND FIO2 >= 0.5" />
                    <asp:ListItem Value="Pa02 < 55 AND FIO2 < 0.5" Text="Pa02 < 55 AND FIO2 < 0.5" />
                    <asp:ListItem Value="Pa02 55 - 60 AND FIO2 < 0.5" Text="Pa02 55 - 60 AND FIO2 < 0.5" />
                    <asp:ListItem Value="Pa02 61 - 70 AND FIO2 < 0.5" Text="Pa02 61 - 70 AND FIO2 < 0.5" />
                    <asp:ListItem Value="Pa02 > 70 AND FIO2 < 0.5" Text="Pa02 > 70 AND FIO2 < 0.5" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="10" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_10" ReadOnly="true"  runat="server"  /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="10" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_10" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_11" runat="server" Text="11" />.&nbsp;&nbsp;<asp:Label ID="Question_11" runat="server" Text="Arterial pH" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="11" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_11"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="11" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_11"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="200px" RecordId="11" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_11" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="< 7.15" Text="< 7.15" />
                    <asp:ListItem Value="7.15 - 7.24" Text="7.15 - 7.24" />
                    <asp:ListItem Value="7.25 - 7.32" Text="7.25 - 7.32" />
                    <asp:ListItem Value="7.33 - 7.49" Text="7.33 - 7.49" />
                    <asp:ListItem Value="7.5 - 7.59" Text="7.5 - 7.59" />
                    <asp:ListItem Value="7.6 - 7.69" Text="7.6 - 7.69" />
                    <asp:ListItem Value=">= 7.7" Text=">= 7.7" />
                    <asp:ListItem Value="HCO3 < 15 AND No A.B.G.s" Text="HCO3 < 15 AND No A.B.G.s" />
                    <asp:ListItem Value="HCO3 15 - 17.9 AND No A.B.G.s" Text="HCO3 15 - 17.9 AND No A.B.G.s" />
                    <asp:ListItem Value="HCO3 18 - 21.9 AND No A.B.G.s" Text="HCO3 18 - 21.9 AND No A.B.G.s" />
                    <asp:ListItem Value="HCO3 22 - 31.9 AND No A.B.G.s" Text="HCO3 22 - 31.9 AND No A.B.G.s" />
                    <asp:ListItem Value="HCO3 32 - 40.9 AND No A.B.G.s" Text="HCO3 32 - 40.9 AND No A.B.G.s" />
                    <asp:ListItem Value="HCO3 41 - 51.9 AND No A.B.G.s" Text="HCO3 41 - 51.9 AND No A.B.G.s" />
                    <asp:ListItem Value="HCO3 >= 52 AND No A.B.G.s" Text="HCO3 >= 52 AND No A.B.G.s" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="11" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_11" ReadOnly="true"  runat="server"  /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="11" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_11" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_12" runat="server" Text="12" />.&nbsp;&nbsp;<asp:Label ID="Question_12" runat="server" Text="Serum Creatinine (mg/dl)" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="12" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_12"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="12" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_12"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="200px" RecordId="12" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_12" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="< 0.6 AND WITH Acute Renal Failure" Text="< 0.6 AND WITH Acute Renal Failure" />
                    <asp:ListItem Value="0.6 - 1.4 AND Acute Renal Failure" Text="0.6 - 1.4 AND Acute Renal Failure" />
                    <asp:ListItem Value="1.5 - 1.9 AND Acute Renal Failure" Text="1.5 - 1.9 AND Acute Renal Failure" />
                    <asp:ListItem Value="2.0 - 3.4 AND Acute Renal Failure" Text="2.0 - 3.4 AND Acute Renal Failure" />
                    <asp:ListItem Value=">= 3.5 AND Acute Renal Failure" Text=">= 3.5 AND Acute Renal Failure" />
                    <asp:ListItem Value="< 0.6 AND NO Acute Renal Failure" Text="< 0.6 AND NO Acute Renal Failure" />
                    <asp:ListItem Value="0.6 - 1.4 AND NO Acute Renal Failure" Text="0.6 - 1.4 AND NO Acute Renal Failure" />
                    <asp:ListItem Value="1.5 - 1.9 AND NO Acute Renal Failure" Text="1.5 - 1.9 AND NO Acute Renal Failure" />
                    <asp:ListItem Value="2.0 - 3.4 AND NO Acute Renal Failure" Text="2.0 - 3.4 AND NO Acute Renal Failure" />
                    <asp:ListItem Value=">= 3.5 AND NO Acute Renal Failure" Text=">= 3.5 AND NO Acute Renal Failure" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="12" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_12" ReadOnly="true"  runat="server"  /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="12" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_12" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="width: 200px">
                <asp:Label ID="QuestionNum_13" runat="server" Text="13" />.&nbsp;&nbsp;Chronic Organ Insufficiency<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Immuno-compromised<asp:Label style="display: none; " ID="Question_13" runat="server" Text="Chronic Organ Insufficiency / Immuno-compromised" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="13" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_13"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="13" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_13"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="200px" RecordId="13" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_13" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="No" Text="No" />
                    <asp:ListItem Value="Yes AND Non-operative" Text="Yes AND Non-operative" />
                    <asp:ListItem Value="Yes AND emergency postoperative" Text="Yes AND emergency postoperative" />
                    <asp:ListItem Value="Yes AND elective surgery postoperative" Text="Yes AND elective surgery postoperative" />
                    <asp:ListItem Value="N/A" Text="N/A" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="13" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_13" ReadOnly="true"  runat="server"  /> </td>
            <td align="left" valign="top" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="13" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_13" runat="server" ShowTextEditor="true" /></td>
         </tr>       
         <tr >
            <td valign="top" style="white-space: nowrap;">
                <asp:Label ID="QuestionNum_14" runat="server" Text="14" />.&nbsp;&nbsp;<asp:Label ID="Question_14" runat="server" Text="Glasgow Coma Score" />   
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="14" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_14"   runat="server" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="14" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_14"   runat="server" /></td>
            <td valign="top" style="white-space: nowrap;">
                <span style="white-space: nowrap; ">
                    <asp:Label ID="QuestionNum_15" runat="server" Text="14a" />.&nbsp;&nbsp;<asp:Label ID="Question_15" runat="server" Text="Eyes opening" />:<br />
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="15" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_15"   runat="server" />
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="15" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_15"   runat="server" />
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="15" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_15" runat="server"  />                   
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="15" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_15" runat="server"  />                   
                    <euc:EformDropDownList Width="200px" RecordId="15" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_15" runat="server" ShowEmptyListItem="true" >
                        <asp:ListItem Value="" Text="" />
                        <asp:ListItem Value="Spontaneous (4)" Text="Spontaneous (4)" />
                        <asp:ListItem Value="To loud voice (3)" Text="To loud voice (3)" />
                        <asp:ListItem Value="To pain (2)" Text="To pain (2)" />
                        <asp:ListItem Value="None (1)" Text="None (1)" />
                        <asp:ListItem Value="N/A" Text="N/A" />
                        <asp:ListItem Value="Unknown" Text="Unknown" />
                    </euc:EformDropDownList> 
                </span>
                <br /><br />
                <span style="white-space: nowrap; ">
                    <asp:Label ID="QuestionNum_16" runat="server" Text="14b" />.&nbsp;&nbsp;<asp:Label ID="Question_16" runat="server" Text="Verbal response" />:<br />    
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="16" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_16"   runat="server" />
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="16" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_16"   runat="server" />
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="16" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_16" runat="server"  />                   
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="16" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_16" runat="server"  />                   
                    <euc:EformDropDownList Width="200px" RecordId="16" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_16" runat="server" ShowEmptyListItem="true" >
                        <asp:ListItem Value="" Text="" />
                        <asp:ListItem Value="Oriented (5)" Text="Oriented (5)" />
                        <asp:ListItem Value="Confused, disoriented (4)" Text="Confused, disoriented (4)" />
                        <asp:ListItem Value="Inappropriate words (3)" Text="Inappropriate words (3)" />
                        <asp:ListItem Value="Incomprehensible sounds (2)" Text="Incomprehensible sounds (2)" />
                        <asp:ListItem Value="None (1)" Text="None (1)" />
                        <asp:ListItem Value="N/A" Text="N/A" />
                        <asp:ListItem Value="Unknown" Text="Unknown" />
                    </euc:EformDropDownList> 
                </span>
                <br /><br />
                <span style="white-space: nowrap; ">
                    <asp:Label ID="QuestionNum_17" runat="server" Text="14c" />.&nbsp;&nbsp;<asp:Label ID="Question_17" runat="server" Text="Motor response" />:<br />    
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="17" ParentRecordId="5" Table="SurveyItems" Field="SurveyItem" ID="SurveyItem_17"   runat="server" />
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="17" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNum" ID="SurveyItemNum_17"   runat="server" />
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="17" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_17" runat="server"  />                   
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="17" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_17" runat="server"  />                   
                    <euc:EformDropDownList Width="200px" RecordId="17" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_17" runat="server" ShowEmptyListItem="true" >
                        <asp:ListItem Value="" Text="" />
                        <asp:ListItem Value="Obeys (6)" Text="Obeys (6)" />
                        <asp:ListItem Value="Localizes (5)" Text="Localizes (5)" />
                        <asp:ListItem Value="Withdraws (flexion) (4)" Text="Withdraws (flexion) (4)" />
                        <asp:ListItem Value="Abnormal flexion posturing (3)" Text="Abnormal flexion posturing (3)" />
                        <asp:ListItem Value="Extension posturing (2)" Text="Extension posturing (2)" />
                        <asp:ListItem Value="None (1)" Text="None (1)" />
                        <asp:ListItem Value="N/A" Text="N/A" />
                        <asp:ListItem Value="Unknown" Text="Unknown" />
                    </euc:EformDropDownList> 
                </span>
                
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="14" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_14" runat="server" /></td>
            <td valign="bottom" style="white-space: nowrap;">
                <euc:EformTextBox Width="50px" RecordId="14" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemTotal" ID="SurveyItemTotal_14" ReadOnly="true"  runat="server"  /> </td>
            <td align="left" valign="bottom" style="white-space: nowrap;">
                <euc:EformTextBox Width="100px" RecordId="14" ParentRecordId="5" Table="SurveyItems" Field="SurveyItemNotes" ID="SurveyItemNotes_14" runat="server" ShowTextEditor="true" /></td>
         </tr>       

         <tr><td colspan="4" height="20px" align="center"><strong>______________________________________________________________________________________________</strong><br /></td></tr>
         
          <tr class="controlBoxDataGridFirstColumn" >
            <td valign="top" style="white-space: nowrap;" align="right" ><strong>Apache II Score **</strong></td>
            <td valign="top" style="white-space: nowrap;" colspan="2">
                <euc:EformTextBox Width="50px" RecordId="5" Table="Surveys" Field="SurveyTotal" ID="SurveyTotal_5" runat="server" ReadOnly="true"  ToolTip="Reference caluclator: http://www.sfar.org/scores2/apache22.html" /> 
                <euc:EformTextBox Width="180px" RecordId="5" Table="Surveys" Field="SurveyResult" ID="SurveyResult_5" runat="server" ReadOnly="true" ToolTip="Reference caluclator: http://www.sfar.org/scores2/apache22.html"  /> </td>
            <td valign="top" align="left" style=""><strong style="font-size: 8pt;" >** Scoring System referenced at www.sfar.org/scores2/apache22.html  </strong> </td>
          </tr>   

</table>


<br /><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_1.ClientID %>'),$('<%= SurveyItemNum_1.ClientID %>'),$('<%= SurveyItemResult_1.ClientID %>'),$('<%= SurveyItemTotal_1.ClientID %>'),$('<%= SurveyItemNotes_1.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_1.ClientID %>'),$('<%= Question_1.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_2.ClientID %>'),$('<%= SurveyItemNum_2.ClientID %>'),$('<%= SurveyItemResult_2.ClientID %>'),$('<%= SurveyItemTotal_2.ClientID %>'),$('<%= SurveyItemNotes_2.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_2.ClientID %>'),$('<%= Question_2.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_3.ClientID %>'),$('<%= SurveyItemNum_3.ClientID %>'),$('<%= SurveyItemResult_3.ClientID %>'),$('<%= SurveyItemTotal_3.ClientID %>'),$('<%= SurveyItemNotes_3.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_3.ClientID %>'),$('<%= Question_3.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_4.ClientID %>'),$('<%= SurveyItemNum_4.ClientID %>'),$('<%= SurveyItemResult_4.ClientID %>'),$('<%= SurveyItemTotal_4.ClientID %>'),$('<%= SurveyItemNotes_4.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_4.ClientID %>'),$('<%= Question_4.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_5.ClientID %>'),$('<%= SurveyItemNum_5.ClientID %>'),$('<%= SurveyItemResult_5.ClientID %>'),$('<%= SurveyItemTotal_5.ClientID %>'),$('<%= SurveyItemNotes_5.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_5.ClientID %>'),$('<%= Question_5.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_6.ClientID %>'),$('<%= SurveyItemNum_6.ClientID %>'),$('<%= SurveyItemResult_6.ClientID %>'),$('<%= SurveyItemTotal_6.ClientID %>'),$('<%= SurveyItemNotes_6.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_6.ClientID %>'),$('<%= Question_6.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_7.ClientID %>'),$('<%= SurveyItemNum_7.ClientID %>'),$('<%= SurveyItemResult_7.ClientID %>'),$('<%= SurveyItemTotal_7.ClientID %>'),$('<%= SurveyItemNotes_7.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_7.ClientID %>'),$('<%= Question_7.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_8.ClientID %>'),$('<%= SurveyItemNum_8.ClientID %>'),$('<%= SurveyItemResult_8.ClientID %>'),$('<%= SurveyItemTotal_8.ClientID %>'),$('<%= SurveyItemNotes_8.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_8.ClientID %>'),$('<%= Question_8.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_9.ClientID %>'),$('<%= SurveyItemNum_9.ClientID %>'),$('<%= SurveyItemResult_9.ClientID %>'),$('<%= SurveyItemTotal_9.ClientID %>'),$('<%= SurveyItemNotes_9.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_9.ClientID %>'),$('<%= Question_9.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_10.ClientID %>'),$('<%= SurveyItemNum_10.ClientID %>'),$('<%= SurveyItemResult_10.ClientID %>'),$('<%= SurveyItemTotal_10.ClientID %>'),$('<%= SurveyItemNotes_10.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_10.ClientID %>'),$('<%= Question_10.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_11.ClientID %>'),$('<%= SurveyItemNum_11.ClientID %>'),$('<%= SurveyItemResult_11.ClientID %>'),$('<%= SurveyItemTotal_11.ClientID %>'),$('<%= SurveyItemNotes_11.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_11.ClientID %>'),$('<%= Question_11.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_12.ClientID %>'),$('<%= SurveyItemNum_12.ClientID %>'),$('<%= SurveyItemResult_12.ClientID %>'),$('<%= SurveyItemTotal_12.ClientID %>'),$('<%= SurveyItemNotes_12.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_12.ClientID %>'),$('<%= Question_12.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_13.ClientID %>'),$('<%= SurveyItemNum_13.ClientID %>'),$('<%= SurveyItemResult_13.ClientID %>'),$('<%= SurveyItemTotal_13.ClientID %>'),$('<%= SurveyItemNotes_13.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_13.ClientID %>'),$('<%= Question_13.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_14.ClientID %>'),$('<%= SurveyItemNum_14.ClientID %>'),$('<%= SurveyItemResult_14.ClientID %>'),$('<%= SurveyItemTotal_14.ClientID %>'),$('<%= SurveyItemNotes_14.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_14.ClientID %>'),$('<%= Question_14.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_15.ClientID %>'),$('<%= SurveyItemNum_15.ClientID %>'),$('<%= SurveyItemResult_15.ClientID %>'),$('<%= SurveyItemTotal_15.ClientID %>'),$('<%= SurveyItemNotes_15.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_15.ClientID %>'),$('<%= Question_15.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_16.ClientID %>'),$('<%= SurveyItemNum_16.ClientID %>'),$('<%= SurveyItemResult_16.ClientID %>'),$('<%= SurveyItemTotal_16.ClientID %>'),$('<%= SurveyItemNotes_16.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_16.ClientID %>'),$('<%= Question_16.ClientID %>'));
    addAbsentEvent($('<%= SurveyDateText_5.ClientID %>'),$('<%= SurveyDate_5.ClientID %>'),$('<%= SurveyType_5.ClientID %>'),$('<%= SurveyItem_17.ClientID %>'),$('<%= SurveyItemNum_17.ClientID %>'),$('<%= SurveyItemResult_17.ClientID %>'),$('<%= SurveyItemTotal_17.ClientID %>'),$('<%= SurveyItemNotes_17.ClientID %>'),'APACHE II Score',$('<%= QuestionNum_17.ClientID %>'),$('<%= Question_17.ClientID %>'));

    function addAbsentEvent(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemTotal,surveyItemNotes,surveyTypeValue,questionNum,question)
    {  
        $(surveyDateText).addEvent('blur',curry(SetHiddenFields,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemTotal,surveyItemNotes,surveyTypeValue,questionNum,question));
        $(surveyItemResult).addEvent('blur',curry(SetHiddenFields,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemTotal,surveyItemNotes,surveyTypeValue,questionNum,question));
        $(surveyItemNotes).addEvent('blur',curry(SetHiddenFields,surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemTotal,surveyItemNotes,surveyTypeValue,questionNum,question));        
    }
   
    /* ]]> */
   
    function SetHiddenFields(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemTotal,surveyItemNotes,surveyTypeValue,questionNum,question)
    {                
        
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
        
        if (surveyItemResult.value == '')
            surveyItemTotal.value = '';          

              
        if (surveyType.value == 'APACHE II Score')
            SetHiddenFieldsApache(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemTotal,surveyItemNotes,surveyTypeValue,questionNum,question);       
   }
   
   function SetHiddenFieldsApache(surveyDateText,surveyDate,surveyType,surveyItem,surveyItemNum,surveyItemResult,surveyItemTotal,surveyItemNotes,surveyTypeValue,questionNum,question)
   {
        var subQuestion;
        var subQuestionResult;
        var subQuestionTotal;
        
        var sum = new Number("0");        
 
        // get Age
        subQuestion = document.getElementById('<%=  Question_1.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_1.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_1.ClientID  %>');

        if (subQuestion.innerHTML == 'Age' )
        {
            if (subQuestionResult.value == '<= 44')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '45 - 54')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '55 - 64')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '65 - 74')
                subQuestionTotal.value = '5';
            else if (subQuestionResult.value == '>= 75')
                subQuestionTotal.value = '6';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
   
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);
        }  
 
         // get Hematocrit [Ht] (%)
        subQuestion = document.getElementById('<%=  Question_2.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_2.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_2.ClientID  %>');

        if (subQuestion.innerHTML == 'Hematocrit [Ht] (%)' )
        {
            if (subQuestionResult.value == '< 20')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '20 - 29.9')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '30 - 45.9')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '46 - 49.9')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '50 - 59.9')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '>= 60')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);
        }  
       
         // get W.B.C
        subQuestion = document.getElementById('<%=  Question_3.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_3.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_3.ClientID  %>');

        if (subQuestion.innerHTML == 'W.B.C.' )
        {
            if (subQuestionResult.value == '< 1000')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '1000 - 2900')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '3000 - 14900')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '15000 - 19900')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '20000 - 39900')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '>= 40000')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);
        }  

         // get Temperature (°C)
        subQuestion = document.getElementById('<%=  Question_4.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_4.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_4.ClientID  %>');

        if (subQuestion.innerHTML == 'Temperature (°C)' )
        {
            if (subQuestionResult.value == '<= 29.9')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '30 - 31.9')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '32 - 33.9')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '34 - 35.9')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '36 - 38.4')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '38.25 - 38.9')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '39 - 40.9')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '>= 41')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);
        }  
        

         // get Mean Arterial Pressure [MAP] (mmHg)
        subQuestion = document.getElementById('<%=  Question_5.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_5.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_5.ClientID  %>');

        if (subQuestion.innerHTML == 'Mean Arterial Pressure [MAP] (mmHg)' )
        {
            if (subQuestionResult.value == '<= 49')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '50 - 69')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '70 - 109')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '110 - 129')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '130 - 159')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '>= 160')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);
        }  

         // get Heart Rate
        subQuestion = document.getElementById('<%=  Question_6.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_6.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_6.ClientID  %>');

        if (subQuestion.innerHTML == 'Heart Rate' )
        {
            if (subQuestionResult.value == '<= 39')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '40 - 54')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '55 - 69')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '70 - 109')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '110 - 139')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '140 - 179')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '>= 180')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);
        }  

         // get Respiratory Rate
        subQuestion = document.getElementById('<%=  Question_7.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_7.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_7.ClientID  %>');

        if (subQuestion.innerHTML == 'Respiratory Rate' )
        {
            if (subQuestionResult.value == '<= 5')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '6 - 9')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '10 - 11')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '12 - 24')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '25 - 34')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '35 - 49')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '>= 50')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);
        }  

         // get Serum Sodium (mmol/L)
        subQuestion = document.getElementById('<%=  Question_8.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_8.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_8.ClientID  %>');

        if (subQuestion.innerHTML == 'Serum Sodium (mmol/L)' )
        {
            if (subQuestionResult.value == '<= 110')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '111 - 119')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '120 - 129')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '130 - 149')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '150 - 154')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '155 - 159')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '160- 179')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '>= 180')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);
        }  


         // get Serum Potassium (mmol/L)
        subQuestion = document.getElementById('<%=  Question_9.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_9.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_9.ClientID  %>');

        if (subQuestion.innerHTML == 'Serum Potassium (mmol/L)')
        {
            if (subQuestionResult.value == '< 2.5')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '2.5 - 2.9')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '3 - 3.4')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '3.5 - 5.4')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '5.5 - 5.9')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '6 - 6.9')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '>= 7')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);
        }  
 
        // get (A-a)O2 Gradient / PaO2 (mmHg)
        subQuestion = document.getElementById('<%=  Question_10.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_10.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_10.ClientID  %>');

        if (subQuestion.innerHTML == '(A-a)O2 Gradient / PaO2 (mmHg)' )
        {
            if (subQuestionResult.value == 'Aa gradient < 200 AND FIO2 >= 0.5')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == 'Aa gradient 200 - 349 AND FIO2 >= 0.5')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == 'Aa gradient 350 - 499 AND FIO2 >= 0.5')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == 'Aa gradient >= 500 AND FIO2 >= 0.5')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == 'Pa02 < 55 AND FIO2 < 0.5')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == 'Pa02 55 - 60 AND FIO2 < 0.5')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == 'Pa02 61 - 70 AND FIO2 < 0.5')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == 'Pa02 > 70 AND FIO2 < 0.5')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);
        }  

        // get Arterial pH
        subQuestion = document.getElementById('<%=  Question_11.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_11.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_11.ClientID  %>');

        if (subQuestion.innerHTML == 'Arterial pH')
        {
            if (subQuestionResult.value == '< 7.15')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '7.15 - 7.24')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '7.25 - 7.32')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '7.33 - 7.49')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '7.5 - 7.59')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '7.6 - 7.69')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '>= 7.7')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == 'HCO3 < 15 AND No A.B.G.s')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == 'HCO3 15 - 17.9 AND No A.B.G.s')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == 'HCO3 18 - 21.9 AND No A.B.G.s')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == 'HCO3 22 - 31.9 AND No A.B.G.s')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == 'HCO3 32 - 40.9 AND No A.B.G.s')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == 'HCO3 41 - 51.9 AND No A.B.G.s')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == 'HCO3 >= 52 AND No A.B.G.s')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);
        }  

        // get Serum Creatinine (mg/dl)
        subQuestion = document.getElementById('<%=  Question_12.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_12.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_12.ClientID  %>');

        if (subQuestion.innerHTML == 'Serum Creatinine (mg/dl)')
        {
            if (subQuestionResult.value == '< 0.6 AND Acute Renal Failure')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '0.6 - 1.4 AND Acute Renal Failure')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '1.5 - 1.9 AND Acute Renal Failure')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '2.0 - 3.4 AND Acute Renal Failure')
                subQuestionTotal.value = '6';
            else if (subQuestionResult.value == '>= 3.5 AND Acute Renal Failure')
                subQuestionTotal.value = '8';
            else if (subQuestionResult.value == '< 0.6 AND NO Acute Renal Failure')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '0.6 - 1.4 AND NO Acute Renal Failure')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '1.5 - 1.9 AND NO Acute Renal Failure')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '2.0 - 3.4 AND NO Acute Renal Failure')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '>= 3.5 AND NO Acute Renal Failure')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);
        }  
 
        // get Chronic Organ Insufficiency / Immuno-compromised
        subQuestion = document.getElementById('<%=  Question_13.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_13.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_13.ClientID  %>');

        if (subQuestion.innerHTML == 'Chronic Organ Insufficiency / Immuno-compromised' )
        {
            if (subQuestionResult.value == 'Yes AND Non-operative')
                subQuestionTotal.value = '5';
            else if (subQuestionResult.value == 'Yes AND emergency postoperative')
                subQuestionTotal.value = '5';
            else if (subQuestionResult.value == 'Yes AND elective surgery postoperative')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);
        }  

 
         // get Eyes opening, Verbal response, and Motor response for Glasgow score
         var glasgowResultValue = new Number("0");  // sum of eyes,Verbal response and Motor response scores        
         
         // get Eyes opening
        subQuestion = document.getElementById('<%=  Question_15.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_15.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_15.ClientID  %>');

        if (subQuestion.innerHTML == 'Eyes opening' )
        {
            if (subQuestionResult.value == 'Spontaneous (4)')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == 'To loud voice (3)')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == 'To pain (2)')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == 'None (1)')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';

            if (!isNaN(parseInt(subQuestionTotal.value)))
                glasgowResultValue = glasgowResultValue + parseInt(subQuestionTotal.value);                
        }  
 
          // get Verbal response
        subQuestion = document.getElementById('<%=  Question_16.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_16.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_16.ClientID  %>');

        if (subQuestion.innerHTML == 'Verbal response' )
        {
            if (subQuestionResult.value == 'Oriented (5)')
                subQuestionTotal.value = '5';
            else if (subQuestionResult.value == 'Confused, disoriented (4)')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == 'Inappropriate words (3)')
                subQuestionTotal.value = '3';
             else if (subQuestionResult.value == 'Incomprehensible sounds (2)')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == 'None (1)')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                glasgowResultValue = glasgowResultValue + parseInt(subQuestionTotal.value);                
        }       

          // get Motor response
        subQuestion = document.getElementById('<%=  Question_17.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_17.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_17.ClientID  %>');

        if (subQuestion.innerHTML == 'Motor response' )
        {
            if (subQuestionResult.value == 'Obeys (6)')
                subQuestionTotal.value = '6';
            else if (subQuestionResult.value == 'Localizes (5)')
                subQuestionTotal.value = '5';
            else if (subQuestionResult.value == 'Withdraws (flexion) (4)')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == 'Abnormal flexion posturing (3)')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == 'Extension posturing (2)')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == 'None (1)')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
                
            if (!isNaN(parseInt(subQuestionTotal.value)))
                glasgowResultValue = glasgowResultValue + parseInt(subQuestionTotal.value);                
        }       
       
          // use Eyes opening, Verbal response, and Motor response scores for Glasgow score
        subQuestion = document.getElementById('<%=  Question_14.ClientID  %>');
        subQuestionResult = document.getElementById('<%=  SurveyItemResult_14.ClientID  %>');
        subQuestionTotal = document.getElementById('<%=  SurveyItemTotal_14.ClientID  %>');

        if (subQuestion.innerHTML == 'Glasgow Coma Score')
        {
            subQuestionResult.value = glasgowResultValue.toString();
       
            if (subQuestionResult.value == '15')
                subQuestionTotal.value = '0';
            else if (subQuestionResult.value == '14')
                subQuestionTotal.value = '1';
            else if (subQuestionResult.value == '13')
                subQuestionTotal.value = '2';
            else if (subQuestionResult.value == '12')
                subQuestionTotal.value = '3';
            else if (subQuestionResult.value == '11')
                subQuestionTotal.value = '4';
            else if (subQuestionResult.value == '10')
                subQuestionTotal.value = '5';
            else if (subQuestionResult.value == '9')
                subQuestionTotal.value = '6';
            else if (subQuestionResult.value == '8')
                subQuestionTotal.value = '7';
            else if (subQuestionResult.value == '7')
                subQuestionTotal.value = '8';
            else if (subQuestionResult.value == '6')
                subQuestionTotal.value = '9';
            else if (subQuestionResult.value == '5')
                subQuestionTotal.value = '10';
            else if (subQuestionResult.value == '4')
                subQuestionTotal.value = '11';
            else if (subQuestionResult.value == '3')
                subQuestionTotal.value = '12';
            else if (subQuestionResult.value == '')
                subQuestionTotal.value = '';
            else
                subQuestionTotal.value = '0';
        
            if (!isNaN(parseInt(subQuestionTotal.value)))
                sum = sum + parseInt(subQuestionTotal.value);                  
                         
        }       
       
        UpdateApacheAndDeathRate(sum);
   }
   
   function UpdateApacheAndDeathRate(sum)
   {
        var apacheTotal = document.getElementById('<%=  SurveyTotal_5.ClientID  %>');
        apacheTotal.value = sum;
        
        var deathRate = document.getElementById('<%=  SurveyResult_5.ClientID  %>');
        
        // Predicted death rate formula:
        //  Logit = -3.517 + (Apache II) * 0.146
        // Predicted Death rate = e^Logit / (1 + e^Logit)
        
        var apacheIntValue = new Number(sum);
        var temp = new Number("0");
        
        if (!isNaN(apacheIntValue))
        {
            temp = -3.514 + apacheIntValue * 0.146;     
            temp = Math.pow(Math.E,temp) / (1 + Math.pow(Math.E,temp)) * 100;
            deathRate.value = "Predicted death rate: " + temp.toFixed(2) + " %";	
        }
        
        
   }

         
</script>