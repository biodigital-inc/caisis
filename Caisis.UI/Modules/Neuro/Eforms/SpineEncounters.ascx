<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.SpineEncounters" CodeFile="SpineEncounters.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.EncROSTable = "EncROSTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="SpineEncounters" /><span class="controlBoxTitle">Encounters</span> <br/>
<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevSpineEncountersTable">
                <tr id="NoSpineEncMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="10" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Encounters were recorded for this patient.
                    </td>
                </tr>
             </table>
             
             <div id="PDFormDiv" style="overflow-y: auto; overflow-x:auto; height: 200px; width:875; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
             <table width="875" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="SpineEncRptTable">  
              <asp:Repeater ID="SpineEncountersRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
                <HeaderTemplate>
                  <tr runat="server" id="PrevSpineEncRptHdr">
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;width:50px;">Date</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;width:20px;">Visit Type</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;width:80px;">Physician</td>	 	
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;width:30px;">ECOG Score</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;width:100px;">Notes</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;width:30px;">Data Qlty</td>
		            <td class="controlBoxDataGridHeaderFirstCol" valign="top">
                        <table border="1" cellpadding="1" cellspacing="0" class="ClinicalEformTable" width="375">
                              <tr><td class="controlBoxDataGridHeaderFirstCol" align="center" colspan="5">Review of Systems</td></tr>
                              <tr runat="server" id="PrevSpineROSHdr">
                                <td  class="controlBoxDataGridHeaderFirstCol" style="text-align:center;width:75px;" >System</td>
                                <td  class="controlBoxDataGridHeaderFirstCol" style="text-align:center;width:75px;" >Symptom</td>
                                <td  class="controlBoxDataGridHeaderFirstCol" style="text-align:center;width:75px;" >Related To</td>
                                <td  class="controlBoxDataGridHeaderFirstCol" style="text-align:center;width:75px;" >Presenting</td>
                                <td  class="controlBoxDataGridHeaderFirstCol" style="text-align:center;width:75px;" >Notes</td>
                            </tr>  
                        </table>
                    </td>
                 </tr>
                </HeaderTemplate>
	            <ItemTemplate> 
		            <tr  valign="top" class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Encounters', <%# Eval("EncounterId")%>, 'EncDateText,EncDate,EncType,EncPhysician,EncECOG_Score,EncNotes,EncQuality', 'Encounters');"> 
		                <td class="ClinicalEformPopulatedColumn" style="width:60px;text-align:center;"><%# Eval("EncDateText")%></td>
		                <td class="ClinicalEformPopulatedColumn" style="width:20px;;text-align:center;"><%# Eval("EncType")%></td>
		                <td class="ClinicalEformPopulatedColumn" style="width:100px;;text-align:center;"><%# Eval("EncPhysician")%></td>
		                <td class="ClinicalEformPopulatedColumn" style="width:30px;;text-align:center;"><%# Eval("EncECOG_Score")%></td>
		                <td class="ClinicalEformPopulatedColumn" style="width:150px;text-align:center;"><%# Eval("EncNotes")%></td>
		                <td class="ClinicalEformPopulatedColumn" style="width:40px;text-align:center;"><%# Eval("EncQuality")%></td>
			            <td valign="top" align="left">
	                        <table border="0" cellpadding="1" cellspacing="0" class="ClinicalEformTable" width="375">   
	                             <asp:Repeater ID="SpineROSRpt" runat="server"> 
                                    <ItemTemplate>                   
	                                     <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('EncReviewOfSystems', <%# DataBinder.Eval(Container.DataItem, "EncReviewOfSystemId") %>, 'ROS_System,ROS_Symptom,ROS_RelatedTo,ROS_Presenting,ROS_Notes','EncReviewOfSystems'); stopBubble(event);"> 
		                                    <td align="center" class="ClinicalEformPopulatedColumn" style="width:75px;"><%# Eval("ROS_System")%></td>
		                                    <td align="center" class="ClinicalEformPopulatedColumn" style="width:75px;"><%# Eval("ROS_Symptom")%></td>
		                                    <td align="center" class="ClinicalEformPopulatedColumn" style="width:75px;"><%# Eval("ROS_RelatedTo")%></td>
		                                    <td align="center" class="ClinicalEformPopulatedColumn" style="width:75px;"><%# Eval("ROS_Presenting")%></td>
		                                    <td align="center" class="ClinicalEformPopulatedColumn" style="width:75px;"><%# Eval("ROS_Notes")%></td>
		                                 </tr>  
	                                  </ItemTemplate>
	                            </asp:Repeater>
	                        </table>
	                    </td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater>
              </table></div><br /><br />
              
                
              <table border="0" cellpadding="0" cellspacing="0"  class="eformLargePopulatedTable">
                <tr>
                    <td>         
                        <table width="875" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SpineEncountersTable">
                <tr runat="server" id="SpineEncHdr">
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Visit Type</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>		            
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">MRC Scale</td>	            
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">MRC Muscle<br />Group</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">ECOG Score</td>		            
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">ASIA Score</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td> 
		            <td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
              </tr>
              <tr style="white-space:nowrap; vertical-align:top; height:50px;">
	             <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Encounters" FIELD="EncDateText" 
	                Runat="server" ID="EncDateText_1"/>
		                <euc:EformHidden RecordId="1" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_1"/>
	                </td>
                <td align="center"><euc:EformDropDownList RecordId="1" Width="70px" TABLE="Encounters" FIELD="EncType" Runat="server" ID="EncType_1" 
                    LookupCode="EncType,Disease,Spine"/></td>
                <td align="center"><euc:EformComboBox RecordId="1" TABLE="Encounters" FIELD="EncPhysician" Runat="server" ID="EncPhysician_1" Width="100px" 
                    LookupCode="ApptPhysician,Disease,Spine" DropDownWidth="200px"/></td>                
                <td align="center"><euc:EformSelect RecordId="2" Style="width:50px" TABLE="Surveys" FIELD="SurveyResult" Runat="server" ID="SurveyResult_2" 
                    LookupCode="MRCScale" DropDownWidth="275px"/>
                    <euc:EformTextBox RecordId="2" TABLE="Surveys" FIELD="SurveyDateText" Runat="server" ID="SurveyDateText_2" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="2" TABLE="Surveys" FIELD="SurveyDate" Runat="server" ID="SurveyDate_2" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="2" TABLE="Surveys" FIELD="SurveyType" Runat="server" ID="SurveyType_2" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="2" TABLE="Surveys" FIELD="SurveyQuality" Runat="server" ID="SurveyQuality_2" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                </td>
                <td align="center"><euc:EformTextBox RecordId="2" TABLE="Surveys" FIELD="SurveyNotes" Runat="server" ID="SurveyNotes_2" Width="80px" /></td>
	            <td align="center"><euc:EformComboBox RecordId="1" TABLE="Encounters" FIELD="EncECOG_Score" Runat="server" 
	                ID="EncECOG_Score_1" Width="50px" LookupCode="ECOGScore" DropDownWidth="300px"/></td>
	            <td align="center"><euc:EformSelect RecordId="1" Style="width:50px" TABLE="Surveys" FIELD="SurveyResult" 
	                Runat="server" ID="SurveyResult_1" LookupCode="ASIAScore" DropDownWidth="325px"/>
                    <euc:EformTextBox RecordId="1" TABLE="Surveys" FIELD="SurveyDateText" Runat="server" ID="SurveyDateText_1" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="1" TABLE="Surveys" FIELD="SurveyDate" Runat="server" ID="SurveyDate_1" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="1" TABLE="Surveys" FIELD="SurveyType" Runat="server" ID="SurveyType_1" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="1" TABLE="Surveys" FIELD="SurveyQuality" Runat="server" ID="SurveyQuality_1" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                </td>
                <td align="center"><euc:EformTextBox RecordId="1" TABLE="Encounters" FIELD="EncNotes" Runat="server" 
                                ID="EncNotes_1" ShowTextEditor="true" Width="80px" MaxLength="1000"/></td>
	            <td align="center"><euc:EformDropDownList RecordId="1" TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality_1" 
	                LookupCode="DataQuality"/></td>
	            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>

              <tr runat="server">
                <td  colspan="4" class="controlBoxDataGridTitleColumn" style="text-align: left;">Spinal Instability Neoplastic Score (SINS)</td>
                <td  colspan="4" class="controlBoxDataGridTitleColumn" style="text-align: left;">Result&nbsp;&nbsp;&nbsp;<euc:EformTextBox RecordId="3" 
                    Style="width:70px" TABLE="Surveys" FIELD="SurveyResult" Runat="server" ID="SurveyResult_3" ReadOnly="true" />
                    <euc:EformTextBox RecordId="3" TABLE="Surveys" FIELD="SurveyDateText" Runat="server" ID="SurveyDateText_3" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="3" TABLE="Surveys" FIELD="SurveyDate" Runat="server" ID="SurveyDate_3" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="3" TABLE="Surveys" FIELD="SurveyType" Runat="server" ID="SurveyType_3" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="3" TABLE="Surveys" FIELD="SurveyQuality" Runat="server" ID="SurveyQuality_3" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    </td>
                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr><td align="left" colspan="9" style=" font-weight:600;">1 Location</td></tr>
              <tr><td align="left" colspan="8"><euc:EformRadioButtonList Table="NoTable" RecordId="1"  FIELD="SINSLocation" ID="SINSLocation"
                    runat="server" ShowOther="false" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="0">
                        <asp:ListItem Value="3">Junctional (occiput-C2, C7-T2, T11-L1, L5-S1) (3)</asp:ListItem>
                        <asp:ListItem Value="2">Mobile spine (C3-C6, L2-L4) (2)</asp:ListItem>
                        <asp:ListItem Value="1">Semirigid (T3-T10) (1)</asp:ListItem>
                        <asp:ListItem Value="0">Rigid (S2-S5) (0)</asp:ListItem>
                    </euc:EformRadioButtonList>
                    <euc:EformTextBox RecordId="1" TABLE="SurveyItems" FIELD="SurveyItemNum" Runat="server" ID="SurveyItemNum_1" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="1" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_1" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="1" TABLE="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_1" Runat="server" 
                        style="display:none; width:1px;" />
                </td>
                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td></tr>

              <tr><td align="left" colspan="9" style=" font-weight:600;">2 Pain Relief with Recumbence and/or Pain with Movement/Loading</td></tr>
              <tr><td align="left" colspan="8"><euc:EformRadioButtonList Table="NoTable" RecordId="1"  FIELD="SINSPainRelief" ID="SINSPainRelief" 
                    runat="server" ShowOther="false" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="0">
                        <asp:ListItem Value="3">Yes (3)</asp:ListItem>
                        <asp:ListItem Value="1">Occasional pain but not mechanical (1)</asp:ListItem>
                        <asp:ListItem Value="0">Pain-free lesion (0)</asp:ListItem>
                    </euc:EformRadioButtonList>
                    <euc:EformTextBox RecordId="2" TABLE="SurveyItems" FIELD="SurveyItemNum" Runat="server" ID="SurveyItemNum_2" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="2" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_2" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="2" TABLE="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_2" Runat="server" 
                        style="display:none; width:1px;" />
                </td>
                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td></tr>

              <tr><td align="left" colspan="9" style=" font-weight:600;">3 Bone lesion</td></tr>
              <tr><td align="left" colspan="8"><euc:EformRadioButtonList Table="NoTable" RecordId="1" FIELD="SINSBoneLesion" ID="SINSBoneLesion" 
                    runat="server" ShowOther="false" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="0">
                        <asp:ListItem Value="2">Lytic (2)</asp:ListItem>
                        <asp:ListItem Value="1">Mixed (lytic/blastic) (1)</asp:ListItem>
                        <asp:ListItem Value="0">Blastic (0)</asp:ListItem>
                    </euc:EformRadioButtonList>
                    <euc:EformTextBox RecordId="3" TABLE="SurveyItems" FIELD="SurveyItemNum" Runat="server" ID="SurveyItemNum_3" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="3" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_3" 
                        style="display:none; width:1px;"></euc:EformTextBox>                    
                    <euc:EformTextBox RecordId="3" TABLE="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_3" Runat="server" 
                        style="display:none; width:1px;" />
                </td>
                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td></tr>

              <tr><td align="left" colspan="9" style=" font-weight:600;">4 Radiographic spinal alignment</td></tr>
              <tr><td align="left" colspan="8"><euc:EformRadioButtonList Table="NoTable" RecordId="1" FIELD="SINSRxSpinalAlign"  ID="SINSRxSpinalAlign"  
                    runat="server" ShowOther="false" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="0">
                        <asp:ListItem Value="4">Subluxation/translation present (4)</asp:ListItem>
                        <asp:ListItem Value="2">De novo deformity (kyphosis/scoliosis) (2)</asp:ListItem>
                        <asp:ListItem Value="0">Normal alignment (0)</asp:ListItem>
                    </euc:EformRadioButtonList>
                    <euc:EformTextBox RecordId="4" TABLE="SurveyItems" FIELD="SurveyItemNum" Runat="server" ID="SurveyItemNum_4" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="4" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_4" 
                        style="display:none; width:1px;"></euc:EformTextBox>                    
                    <euc:EformTextBox RecordId="4" TABLE="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_4" Runat="server" 
                        style="display:none; width:1px;" />
                </td>
                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td></tr>

              <tr><td align="left" colspan="9" style=" font-weight:600;">5 Vertebral body collapse</td></tr>
              <tr><td align="left" colspan="8"><euc:EformRadioButtonList Table="NoTable" RecordId="1"  FIELD="SINSVertCollapse" ID="SINSVertCollapse" 
                    runat="server" ShowOther="false" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="0">
                        <asp:ListItem Value="3">> 50% collapse (3)</asp:ListItem>
                        <asp:ListItem Value="2">< 50% collapse (2)</asp:ListItem>
                        <asp:ListItem Value="1">No collapse with > 50% body involved (1)</asp:ListItem>
                        <asp:ListItem Value="0">None of the above (0)</asp:ListItem>
                    </euc:EformRadioButtonList>
                    <euc:EformTextBox RecordId="5" TABLE="SurveyItems" FIELD="SurveyItemNum" Runat="server" ID="SurveyItemNum_5" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="5" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_5" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="5" TABLE="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_5" Runat="server" 
                        style="display:none; width:1px;" />
                </td>
                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td></tr>

              <tr><td align="left" colspan="9" style=" font-weight:600;">6 Posterolateral involvement of spinal elements (Facet, Pedicle,
or Costovertebral Joint Fracture or Replacement With Tumor</td></tr>
              <tr><td align="left" colspan="8"><euc:EformRadioButtonList Table="NoTable" RecordId="1" FIELD="SINSPosterolateral" ID="SINSPosterolateral" 
                    runat="server" ShowOther="false" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="0">
                        <asp:ListItem Value="3">Bilateral (3)</asp:ListItem>
                        <asp:ListItem Value="1">Unilateral (1)</asp:ListItem>
                        <asp:ListItem Value="0">None of the above (0)</asp:ListItem>
                    </euc:EformRadioButtonList>
                    <euc:EformTextBox RecordId="6" TABLE="SurveyItems" FIELD="SurveyItemNum" Runat="server" ID="SurveyItemNum_6" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="6" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_6" 
                        style="display:none; width:1px;"></euc:EformTextBox>
                    <euc:EformTextBox RecordId="6" TABLE="SurveyItems"  Field="SurveyItemResult" id="SurveyItemResult_6" Runat="server" 
                        style="display:none; width:1px;" />
                </td>
                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td></tr>

            </table><br />
            
                        <span class="controlBoxTitle" style="padding-left:30px;font-size: 12px;">Review Of Systems</span> <br/>
                        <table border="0" cellpadding="0" cellspacing="0" style="padding-left:30px;">
                            <tr>
                                <td>
                                  <table width="300" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" 
                                    id="EncROSTable">
                                    <tr>
                                        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" >System</td>
                                        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" >Symptom</td>
                                        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" >Pain Location</td>
                                        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" >Related To</td>
                                        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" >Presenting</td>
                                        <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                                    </tr>
                                    <tr id="EncROSHTMLRow1" style="white-space:nowrap;">
                                        <td><euc:EformSelect RecordId="1" style=" width:100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_System" Runat="server" ID="ROS_System_1" LookupCode="BodySystem" 
                                            DropDownWidth="250px" /></td>
                                        <td><euc:EformSelect RecordId="1" Width="100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_1" 
                                            LookupCode="ROS_Symptom" DropDownWidth="250px" /></td>
                                        <td><euc:EformExtendedCheckBoxList RecordId="1"  TABLE="EncReviewOfSystems" FIELD="ROS_Notes" ID="ROS_Notes_1" 
                                            LookupCode="PainLocationSpine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="Vertical" 
                                            RepeatLayout="Table" DropDownHeight="auto" DropDownWidth="auto" /></td>
	                                    <td><euc:EformSelect RecordId="1" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_1" 
	                                        LookupCode="RelatedTo"/></td>
	                                    <td><euc:EformSelect RecordId="1" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_Presenting" Runat="server" ID="ROS_Presenting_1" 
	                                        LookupCode="ROS_Presenting"/></td>
                                        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" 
                                            ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                                    </tr>
                                    <tr id="EncROSHTMLRow2" style="DISPLAY: none">
                                        <td><euc:EformSelect RecordId="2" style=" width:100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_System" Runat="server" ID="ROS_System_2" LookupCode="BodySystem"                                                   DropDownWidth="250px" /></td>
                                        <td><euc:EformSelect RecordId="2" Width="100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_2" 
                                            LookupCode="ROS_Symptom" DropDownWidth="250px" /></td>
                                        <td><euc:EformExtendedCheckBoxList RecordId="2" Table="EncReviewOfSystems" Field="ROS_Notes" ID="ROS_Notes_2" 
                                            LookupCode="PainLocationSpine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="Vertical" 
                                            RepeatLayout="Table" DropDownHeight="auto" DropDownWidth="auto" /></td>
	                                    <td><euc:EformSelect RecordId="2" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_2" 
	                                        LookupCode="RelatedTo"/></td>
	                                    <td><euc:EformSelect RecordId="2" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_Presenting" Runat="server" ID="ROS_Presenting_2" 
	                                        LookupCode="ROS_Presenting"/></td>
                                        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" 
                                            ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                                    </tr>
                                    <tr id="EncROSHTMLRow3" style="DISPLAY: none">
                                        <td><euc:EformSelect RecordId="3" style=" width:100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_System" Runat="server" ID="ROS_System_3" LookupCode="BodySystem"                                                   DropDownWidth="250px" /></td>
                                        <td><euc:EformSelect RecordId="3" Width="100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_3" 
                                            LookupCode="ROS_Symptom" DropDownWidth="250px" /></td>
                                        <td><euc:EformExtendedCheckBoxList RecordId="3" Table="EncReviewOfSystems" Field="ROS_Notes" ID="ROS_Notes_3" 
                                            LookupCode="PainLocationSpine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="Vertical" 
                                            RepeatLayout="Table" DropDownHeight="auto" DropDownWidth="auto" /> </td>
	                                    <td><euc:EformSelect RecordId="3" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_3" 
	                                        LookupCode="RelatedTo"/></td>
	                                    <td><euc:EformSelect RecordId="3" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_Presenting" Runat="server" ID="ROS_Presenting_3" 
	                                        LookupCode="ROS_Presenting"/></td>
                                        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" 
                                            ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                                    </tr>
                                    <tr id="EncROSHTMLRow4" style="DISPLAY: none">
                                        <td><euc:EformSelect RecordId="4" style=" width:100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_System" Runat="server" ID="ROS_System_4" LookupCode="BodySystem"                                                   DropDownWidth="250px" /></td>
                                        <td><euc:EformSelect RecordId="4" Width="100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_4" 
                                            LookupCode="ROS_Symptom" DropDownWidth="250px" /></td>
	                                    <td><euc:EformExtendedCheckBoxList RecordId="4" Table="EncReviewOfSystems" Field="ROS_Notes" ID="ROS_Notes_4" 
                                            LookupCode="PainLocationSpine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="Vertical" 
                                            RepeatLayout="Table" DropDownHeight="auto" DropDownWidth="auto" /> </td>
	                                    <td><euc:EformSelect RecordId="4" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_4" 
	                                        LookupCode="RelatedTo"/></td>
	                                    <td><euc:EformSelect RecordId="4" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_Presenting" Runat="server" ID="ROS_Presenting_4" 
	                                        LookupCode="ROS_Presenting"/></td>
                                        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" 
                                            ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                                    </tr>
                                    <tr id="EncROSHTMLRow5" style="DISPLAY: none">
                                        <td><euc:EformSelect RecordId="5" style=" width:100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_System" Runat="server" ID="ROS_System_5" LookupCode="BodySystem"                                                   DropDownWidth="250px" /></td>
                                        <td><euc:EformSelect RecordId="5" Width="100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_5" 
                                            LookupCode="ROS_Symptom" DropDownWidth="250px" /></td>
	                                    <td><euc:EformExtendedCheckBoxList RecordId="5" Table="EncReviewOfSystems" Field="ROS_Notes" ID="ROS_Notes_5" 
                                            LookupCode="PainLocationSpine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="Vertical" 
                                            RepeatLayout="Table" DropDownHeight="auto" DropDownWidth="auto" /> </td>
	                                    <td><euc:EformSelect RecordId="5" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_5" 
	                                        LookupCode="RelatedTo"/></td>
	                                    <td><euc:EformSelect RecordId="5" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_Presenting" Runat="server" ID="ROS_Presenting_5" 
	                                        LookupCode="ROS_Presenting"/></td>
                                        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" 
                                            ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                                    </tr>
                                    <tr id="EncROSHTMLRow6" style="DISPLAY: none">
                                        <td><euc:EformSelect RecordId="6" style=" width:100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_System" Runat="server" ID="ROS_System_6" LookupCode="BodySystem"                                                   DropDownWidth="250px" /></td>
                                        <td><euc:EformSelect RecordId="6" Width="100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_6" 
                                            LookupCode="ROS_Symptom" DropDownWidth="250px" /></td>
	                                    <td><euc:EformExtendedCheckBoxList RecordId="6" Table="EncReviewOfSystems" Field="ROS_Notes" ID="ROS_Notes_6" 
                                            LookupCode="PainLocationSpine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="Vertical" 
                                            RepeatLayout="Table" DropDownHeight="auto" DropDownWidth="auto" /> </td>
	                                    <td><euc:EformSelect RecordId="6" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_6" 
	                                        LookupCode="RelatedTo"/></td>
	                                    <td><euc:EformSelect RecordId="6" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_Presenting" Runat="server" ID="ROS_Presenting_6" 
	                                        LookupCode="ROS_Presenting"/></td>
                                        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" 
                                            ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                                    </tr>
                                    <tr id="EncROSHTMLRow7" style="DISPLAY: none">
                                        <td><euc:EformSelect RecordId="7" style=" width:100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_System" Runat="server" ID="ROS_System_7" LookupCode="BodySystem"                                                   DropDownWidth="250px" /></td>
                                        <td><euc:EformSelect RecordId="7" Width="100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_7" 
                                            LookupCode="ROS_Symptom" DropDownWidth="250px" /></td>
	                                    <td><euc:EformExtendedCheckBoxList RecordId="7" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" ID="ROS_Notes_7" 
                                            LookupCode="PainLocationSpine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="Vertical" 
                                            RepeatLayout="Table" DropDownHeight="auto" DropDownWidth="auto" /> </td>
	                                    <td><euc:EformSelect RecordId="7" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_7" 
	                                        LookupCode="RelatedTo"/></td>
	                                    <td><euc:EformSelect RecordId="7" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_Presenting" Runat="server" ID="ROS_Presenting_7" 
	                                        LookupCode="ROS_Presenting"/></td>
                                        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" 
                                            ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                                    </tr>
                                    <tr id="EncROSHTMLRow8" style="DISPLAY: none">
                                        <td><euc:EformSelect RecordId="8" style=" width:100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_System" Runat="server" ID="ROS_System_8" LookupCode="BodySystem"                                                   DropDownWidth="250px" /></td>
                                        <td><euc:EformSelect RecordId="8" Width="100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_8" 
                                            LookupCode="ROS_Symptom" DropDownWidth="250px" /></td>
	                                    <td><euc:EformExtendedCheckBoxList RecordId="8" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" ID="ROS_Notes_8" 
                                            LookupCode="PainLocationSpine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="Vertical" 
                                            RepeatLayout="Table" DropDownHeight="auto" DropDownWidth="auto" /> </td>
	                                    <td><euc:EformSelect RecordId="8" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_8" 
	                                        LookupCode="RelatedTo"/></td>
	                                    <td><euc:EformSelect RecordId="8" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_Presenting" Runat="server" ID="ROS_Presenting_8" 
	                                        LookupCode="ROS_Presenting"/></td>
                                        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" 
                                            ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                                    </tr>
                                    <tr id="EncROSHTMLRow9" style="DISPLAY: none">
                                        <td><euc:EformSelect RecordId="9" style=" width:100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_System" Runat="server" ID="ROS_System_9" LookupCode="BodySystem"                                                   DropDownWidth="250px" /></td>
                                        <td><euc:EformSelect RecordId="9" Width="100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_9" 
                                            LookupCode="ROS_Symptom" DropDownWidth="250px" /></td>
	                                    <td><euc:EformExtendedCheckBoxList RecordId="9" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" ID="ROS_Notes_9" 
                                            LookupCode="PainLocationSpine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="Vertical" 
                                            RepeatLayout="Table" DropDownHeight="auto" DropDownWidth="auto" /> </td>
	                                    <td><euc:EformSelect RecordId="9" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_9" 
	                                        LookupCode="RelatedTo"/></td>
	                                    <td><euc:EformSelect RecordId="9" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_Presenting" Runat="server" ID="ROS_Presenting_9" 
	                                        LookupCode="ROS_Presenting"/></td>
                                        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" 
                                            ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                                    </tr>
                                    <tr id="EncROSHTMLRow10" style="DISPLAY: none">
                                        <td><euc:EformSelect RecordId="10" style=" width:100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_System" Runat="server" ID="ROS_System_10" LookupCode="BodySystem"                                                   DropDownWidth="250px" /></td>
                                        <td><euc:EformSelect RecordId="10" Width="100px" TABLE="EncReviewOfSystems" 
                                            FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_10" 
                                            LookupCode="ROS_Symptom" DropDownWidth="250px" /></td>
	                                    <td><euc:EformExtendedCheckBoxList RecordId="10" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" ID="ROS_Notes_10" 
                                            LookupCode="PainLocationSpine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="Vertical" 
                                            RepeatLayout="Table" DropDownHeight="auto" DropDownWidth="auto" /> </td>
	                                    <td><euc:EformSelect RecordId="10" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_10" 
	                                        LookupCode="RelatedTo"/></td>
	                                    <td><euc:EformSelect RecordId="10" style=" width:70px" TABLE="EncReviewOfSystems" 
	                                        FIELD="ROS_Presenting" Runat="server" ID="ROS_Presenting_10" 
	                                        LookupCode="ROS_Presenting"/></td>
                                        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" 
                                            ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                                    </tr>
                                  </table>
                                  <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'EncROSTable');" /><br />
                                </td>
                              </tr>
                          </table><br />
                    </td>
                </tr>
               </table>
           </td>
       </tr>
   </table><br /><br />


<script type="text/javascript">
    //add events for Enc
    function addEncEvents(EncDateText, EncDate, EncQuality, ASIADateText, ASIADate, ASIAType, ASIAResult, ASIAQuality, MRCDateText, MRCDate, MRCType, MRCResult, MRCQuality) {
        $(EncDateText).addEvent('blur', curry(EncAutoPopulates, EncDateText, EncDate, EncQuality, ASIADateText, ASIADate, ASIAType, ASIAResult, ASIAQuality, MRCDateText, MRCDate, MRCType, MRCResult, MRCQuality));
        $(ASIAResult).addEvent('blur', curry(EncAutoPopulates, EncDateText, EncDate, EncQuality, ASIADateText, ASIADate, ASIAType, ASIAResult, ASIAQuality, MRCDateText, MRCDate, MRCType, MRCResult, MRCQuality));
        $(MRCResult).addEvent('blur', curry(EncAutoPopulates, EncDateText, EncDate, EncQuality, ASIADateText, ASIADate, ASIAType, ASIAResult, ASIAQuality, MRCDateText, MRCDate, MRCType, MRCResult, MRCQuality));
    }

    addEncEvents($('<%= EncDateText_1.ClientID %>'), $('<%= EncDate_1.ClientID %>'), $('<%= EncQuality_1.ClientID %>'), $('<%= SurveyDateText_1.ClientID %>'), $('<%= SurveyDate_1.ClientID %>'), $('<%= SurveyType_1.ClientID %>'), $('<%= SurveyResult_1.ClientID %>'), $('<%= SurveyQuality_1.ClientID %>'), $('<%= SurveyDateText_2.ClientID %>'), $('<%= SurveyDate_2.ClientID %>'), $('<%= SurveyType_2.ClientID %>'), $('<%= SurveyResult_2.ClientID %>'), $('<%= SurveyQuality_2.ClientID %>'));

    function EncAutoPopulates(EncDateText, EncDate, EncQuality, ASIADateText, ASIADate, ASIAType, ASIAResult, ASIAQuality, MRCDateText, MRCDate, MRCType, MRCResult, MRCQuality) {
        if (EncDateText.value != '') {
            EncQuality.value = 'STD';
        }
        else if (EncDateText.value == '') {
            EncQuality.value = '';
        }

        if (EncDateText.value != '' && ASIAResult.value != '') {
            ASIADateText.value = EncDateText.value;
            ASIADate.value = EncDate.value;
            ASIAType.value = 'ASIA Score';
            ASIAQuality.value = EncQuality.value;
        }
        else if (ASIAResult.value == '') {
            ASIADateText.value = '';
            ASIADate.value = '';
            ASIAType.value = '';
            ASIAQuality.value = '';
        }

        if (EncDateText.value != '' && MRCResult.value != '') {
            MRCDateText.value = EncDateText.value;
            MRCDate.value = EncDate.value;
            MRCType.value = 'MRC Muscle Strength Scale';
            MRCQuality.value = EncQuality.value;
        }
        else if (MRCResult.value == '') {
            MRCDateText.value = '';
            MRCDate.value = '';
            MRCType.value = '';
            MRCQuality.value = '';
        }
    }



    //add events for SINS Score
    function addSINSEvents(EncDateText, EncDate, EncQuality, SINSDateText, SINSDate, SINSType, SINSResult, SINSQuality, SINSLoc, SINSPain, SINSBone, SINSRxSpinal, SINSVert, SINSPost, ItemResult1, ItemResult2, ItemResult3, ItemResult4, ItemResult5, ItemResult6) {
        $(SINSLoc).addEvent('click', curry(SINSAutoPopulates, EncDateText, EncDate, EncQuality, SINSDateText, SINSDate, SINSType, SINSResult, SINSQuality, SINSLoc, SINSPain, SINSBone, SINSRxSpinal, SINSVert, SINSPost, ItemResult1, ItemResult2, ItemResult3, ItemResult4, ItemResult5, ItemResult6));
        $(SINSPain).addEvent('click', curry(SINSAutoPopulates, EncDateText, EncDate, EncQuality, SINSDateText, SINSDate, SINSType, SINSResult, SINSQuality, SINSLoc, SINSPain, SINSBone, SINSRxSpinal, SINSVert, SINSPost, ItemResult1, ItemResult2, ItemResult3, ItemResult4, ItemResult5, ItemResult6));
        $(SINSBone).addEvent('click', curry(SINSAutoPopulates, EncDateText, EncDate, EncQuality, SINSDateText, SINSDate, SINSType, SINSResult, SINSQuality, SINSLoc, SINSPain, SINSBone, SINSRxSpinal, SINSVert, SINSPost, ItemResult1, ItemResult2, ItemResult3, ItemResult4, ItemResult5, ItemResult6));
        $(SINSRxSpinal).addEvent('click', curry(SINSAutoPopulates, EncDateText, EncDate, EncQuality, SINSDateText, SINSDate, SINSType, SINSResult, SINSQuality, SINSLoc, SINSPain, SINSBone, SINSRxSpinal, SINSVert, SINSPost, ItemResult1, ItemResult2, ItemResult3, ItemResult4, ItemResult5, ItemResult6));
        $(SINSVert).addEvent('click', curry(SINSAutoPopulates, EncDateText, EncDate, EncQuality, SINSDateText, SINSDate, SINSType, SINSResult, SINSQuality, SINSLoc, SINSPain, SINSBone, SINSRxSpinal, SINSVert, SINSPost, ItemResult1, ItemResult2, ItemResult3, ItemResult4, ItemResult5, ItemResult6));
        $(SINSPost).addEvent('click', curry(SINSAutoPopulates, EncDateText, EncDate, EncQuality, SINSDateText, SINSDate, SINSType, SINSResult, SINSQuality, SINSLoc, SINSPain, SINSBone, SINSRxSpinal, SINSVert, SINSPost, ItemResult1, ItemResult2, ItemResult3, ItemResult4, ItemResult5, ItemResult6));
        $(EncDateText).addEvent('blur', curry(SINSAutoPopulates, EncDateText, EncDate, EncQuality, SINSDateText, SINSDate, SINSType, SINSResult, SINSQuality, SINSLoc, SINSPain, SINSBone, SINSRxSpinal, SINSVert, SINSPost, ItemResult1, ItemResult2, ItemResult3, ItemResult4, ItemResult5, ItemResult6));
        $(SINSResult).addEvent('blur', curry(SINSAutoPopulates, EncDateText, EncDate, EncQuality, SINSDateText, SINSDate, SINSType, SINSResult, SINSQuality, SINSLoc, SINSPain, SINSBone, SINSRxSpinal, SINSVert, SINSPost, ItemResult1, ItemResult2, ItemResult3, ItemResult4, ItemResult5, ItemResult6));

    }

    addSINSEvents($('<%= EncDateText_1.ClientID %>'), $('<%= EncDate_1.ClientID %>'), $('<%= EncQuality_1.ClientID %>'), $('<%= SurveyDateText_3.ClientID %>'), $('<%= SurveyDate_3.ClientID %>'), $('<%= SurveyType_3.ClientID %>'), $('<%= SurveyResult_3.ClientID %>'), $('<%= SurveyQuality_3.ClientID %>'), $('<%= SINSLocation.ClientID %>'), $('<%= SINSPainRelief.ClientID %>'), $('<%= SINSBoneLesion.ClientID %>'), $('<%= SINSRxSpinalAlign.ClientID %>'), $('<%= SINSVertCollapse.ClientID %>'), $('<%= SINSPosterolateral.ClientID %>'), $('<%= SurveyItemResult_1.ClientID %>'), $('<%= SurveyItemResult_2.ClientID %>'), $('<%= SurveyItemResult_3.ClientID %>'), $('<%= SurveyItemResult_4.ClientID %>'), $('<%= SurveyItemResult_5.ClientID %>'), $('<%= SurveyItemResult_6.ClientID %>'));

    function SINSAutoPopulates(EncDateText, EncDate, EncQuality, SINSDateText, SINSDate, SINSType, SINSResult, SINSQuality, SINSLoc, SINSPain, SINSBone, SINSRxSpinal, SINSVert, SINSPost, ItemResult1, ItemResult2, ItemResult3, ItemResult4, ItemResult5, ItemResult6) {
        if (EncDateText.value != '' && (ItemResult1.value != '' || ItemResult2.value != '' || ItemResult3.value != '' || ItemResult4.value != '' || ItemResult5.value != '' || ItemResult6.value != '')) {
            SINSDateText.value = EncDateText.value;
            SINSDate.value = EncDate.value;
            SINSType.value = 'Spinal Instability Neoplastic Score';
            SINSQuality.value = EncQuality.value;
            SINSResult.value = +ItemResult1.value + +ItemResult2.value + +ItemResult3.value + +ItemResult4.value + +ItemResult5.value + +ItemResult6.value
        }
        else if (ItemResult1.value == '' && ItemResult2.value == '' && ItemResult3.value == '' && ItemResult4.value == '' && ItemResult5.value == '' && ItemResult6.value == '') {
            SINSDateText.value = '';
            SINSDate.value = '';
            SINSType.value = '';
            SINSQuality.value = '';
            SINSResult.value = '';
        }
    }

    //Adds SINS events   
    addSINSEvent_Item1($('<%= EncDateText_1.ClientID %>'), $('<%= SurveyItemResult_1.ClientID %>'), $('<%= SurveyItem_1.ClientID %>'), $('<%= SurveyItemNum_1.ClientID %>'), $('<%= SINSLocation.ClientID %>'));

    function addSINSEvent_Item1(EncDateText, SurveyItemResult1, SurveyItem1, SurveyItemNum1, SINSLocation) 
    {
        $(SINSLocation).addEvent('click', curry(SINSLocationSelected, EncDateText, SurveyItemResult1, SurveyItem1, SurveyItemNum1, SINSLocation));

        // check on load as well
        SINSLocationSelected(EncDateText, SurveyItemResult1, SurveyItem1, SurveyItemNum1, SINSLocation);
    }

    function SINSLocationSelected(EncDateText, SurveyItemResult1, SurveyItem1, SurveyItemNum1, SINSLocation) 
    {
        var SINSLocationRef = SINSLocation.getElementsByTagName('input');

        for (var i = 0; i < SINSLocationRef.length; i++)
            if (SINSLocationRef[i].checked) 
            {
                SINSLocationRadioClick(SINSLocationRef[i].value, EncDateText, SurveyItemResult1, SurveyItem1, SurveyItemNum1, SINSLocation);
            }
    }

    function SINSLocationRadioClick(SINSLocation_value, EncDateText, SurveyItemResult1, SurveyItem1, SurveyItemNum1, SINSLocation) 
    {
        if (EncDateText.value != '' && SINSLocation_value != "") 
        {
            SurveyItem1.value = 'Location';
            SurveyItemNum1.value = '1';
            SurveyItemResult1.value = SINSLocation_value;

        }
        else if (SINSLocation_value == "") 
        {
            SurveyItem1.value = '';
            SurveyItemNum1.value = '';
            SurveyItemResult1.value = '';
        }
    }

    addSINSEvent_Item2($('<%= EncDateText_1.ClientID %>'), $('<%= SurveyItemResult_2.ClientID %>'), $('<%= SurveyItem_2.ClientID %>'), $('<%= SurveyItemNum_2.ClientID %>'), $('<%= SINSPainRelief.ClientID %>'));

    function addSINSEvent_Item2(EncDateText, SurveyItemResult2, SurveyItem2, SurveyItemNum2, SINSPainRelief) {
        $(SINSPainRelief).addEvent('click', curry(SINSPainReliefSelected, EncDateText, SurveyItemResult2, SurveyItem2, SurveyItemNum2, SINSPainRelief));

        // check on load as well
        SINSPainReliefSelected(EncDateText, SurveyItemResult2, SurveyItem2, SurveyItemNum2, SINSPainRelief);
    }

    function SINSPainReliefSelected(EncDateText, SurveyItemResult2, SurveyItem2, SurveyItemNum2, SINSPainRelief) {
        var SINSPainReliefRef = SINSPainRelief.getElementsByTagName('input');

        for (var i = 0; i < SINSPainReliefRef.length; i++)
            if (SINSPainReliefRef[i].checked) {
                SINSPainReliefRadioClick(SINSPainReliefRef[i].value, EncDateText, SurveyItemResult2, SurveyItem2, SurveyItemNum2, SINSPainRelief);
            }
    }

    function SINSPainReliefRadioClick(SINSPainRelief_value, EncDateText, SurveyItemResult2, SurveyItem2, SurveyItemNum2, SINSPainRelief) {
        if (EncDateText.value != '' && SINSPainRelief_value != "") 
        {
            SurveyItem2.value = 'Pain Relief with Recumbence and/or Pain with Movement/Loading';
            SurveyItemNum2.value = '2';
            SurveyItemResult2.value = SINSPainRelief_value;

        }
        else if (SINSPainRelief_value == "") 
        {
            SurveyItem2.value = '';
            SurveyItemNum2.value = '';
            SurveyItemResult2.value = '';
        }
    }

    addSINSEvent_Item3($('<%= EncDateText_1.ClientID %>'), $('<%= SurveyItemResult_3.ClientID %>'), $('<%= SurveyItem_3.ClientID %>'), $('<%= SurveyItemNum_3.ClientID %>'), $('<%= SINSBoneLesion.ClientID %>'));

    function addSINSEvent_Item3(EncDateText, SurveyItemResult3, SurveyItem3, SurveyItemNum3, SINSBoneLesion) {
        $(SINSBoneLesion).addEvent('click', curry(SINSBoneLesionSelected, EncDateText, SurveyItemResult3, SurveyItem3, SurveyItemNum3, SINSBoneLesion));

        // check on load as well
        SINSBoneLesionSelected(EncDateText, SurveyItemResult3, SurveyItem3, SurveyItemNum3, SINSBoneLesion);
    }

    function SINSBoneLesionSelected(EncDateText, SurveyItemResult3, SurveyItem3, SurveyItemNum3, SINSBoneLesion) {
        var SINSBoneLesionRef = SINSBoneLesion.getElementsByTagName('input');

        for (var i = 0; i < SINSBoneLesionRef.length; i++)
            if (SINSBoneLesionRef[i].checked) {
                SINSBoneLesionRadioClick(SINSBoneLesionRef[i].value, EncDateText, SurveyItemResult3, SurveyItem3, SurveyItemNum3, SINSBoneLesion);
            }
    }

    function SINSBoneLesionRadioClick(SINSBoneLesion_value, EncDateText, SurveyItemResult3, SurveyItem3, SurveyItemNum3, SINSBoneLesion) {
        if (EncDateText.value != '' && SINSBoneLesion_value != "") 
        {
            SurveyItem3.value = 'Bone lesion';
            SurveyItemNum3.value = '3';
            SurveyItemResult3.value = SINSBoneLesion_value;

        }
        else if (SINSBoneLesion_value == "") 
        {
            SurveyItem3.value = '';
            SurveyItemNum3.value = '';
            SurveyItemResult3.value = '';
        }
    }

    addSINSEvent_Item4($('<%= EncDateText_1.ClientID %>'), $('<%= SurveyItemResult_4.ClientID %>'), $('<%= SurveyItem_4.ClientID %>'), $('<%= SurveyItemNum_4.ClientID %>'), $('<%= SINSRxSpinalAlign.ClientID %>'));

    function addSINSEvent_Item4(EncDateText, SurveyItemResult4, SurveyItem4, SurveyItemNum4, SINSRxSpinalAlign) {
        $(SINSRxSpinalAlign).addEvent('click', curry(SINSRxSpinalAlignSelected, EncDateText, SurveyItemResult4, SurveyItem4, SurveyItemNum4, SINSRxSpinalAlign));

        // check on load as well
        SINSRxSpinalAlignSelected(EncDateText, SurveyItemResult4, SurveyItem4, SurveyItemNum4, SINSRxSpinalAlign);
    }

    function SINSRxSpinalAlignSelected(EncDateText, SurveyItemResult4, SurveyItem4, SurveyItemNum4, SINSRxSpinalAlign) {
        var SINSRxSpinalAlignRef = SINSRxSpinalAlign.getElementsByTagName('input');

        for (var i = 0; i < SINSRxSpinalAlignRef.length; i++)
            if (SINSRxSpinalAlignRef[i].checked) {
                SINSRxSpinalAlignRadioClick(SINSRxSpinalAlignRef[i].value, EncDateText, SurveyItemResult4, SurveyItem4, SurveyItemNum4, SINSRxSpinalAlign);
            }
    }

    function SINSRxSpinalAlignRadioClick(SINSRxSpinalAlign_value, EncDateText, SurveyItemResult4, SurveyItem4, SurveyItemNum4, SINSRxSpinalAlign) {
        if (EncDateText.value != '' && SINSRxSpinalAlign_value != "") 
        {
            SurveyItem4.value = 'Radiographic spinal alignment';
            SurveyItemNum4.value = '4';
            SurveyItemResult4.value = SINSRxSpinalAlign_value;

        }
        else if (SINSRxSpinalAlign_value == "") 
        {
            SurveyItem4.value = '';
            SurveyItemNum4.value = '';
            SurveyItemResult4.value = '';
        }
    }

    addSINSEvent_Item5($('<%= EncDateText_1.ClientID %>'), $('<%= SurveyItemResult_5.ClientID %>'), $('<%= SurveyItem_5.ClientID %>'), $('<%= SurveyItemNum_5.ClientID %>'), $('<%= SINSVertCollapse.ClientID %>'));

    function addSINSEvent_Item5(EncDateText, SurveyItemResult5, SurveyItem5, SurveyItemNum5, SINSVertCollapse) {
        $(SINSVertCollapse).addEvent('click', curry(SINSVertCollapseSelected, EncDateText, SurveyItemResult5, SurveyItem5, SurveyItemNum5, SINSVertCollapse));

        // check on load as well
        SINSVertCollapseSelected(EncDateText, SurveyItemResult5, SurveyItem5, SurveyItemNum5, SINSVertCollapse);
    }

    function SINSVertCollapseSelected(EncDateText, SurveyItemResult5, SurveyItem5, SurveyItemNum5, SINSVertCollapse) {
        var SINSVertCollapseRef = SINSVertCollapse.getElementsByTagName('input');

        for (var i = 0; i < SINSVertCollapseRef.length; i++)
            if (SINSVertCollapseRef[i].checked) {
                SINSVertCollapseRadioClick(SINSVertCollapseRef[i].value, EncDateText, SurveyItemResult5, SurveyItem5, SurveyItemNum5, SINSVertCollapse);
            }
    }

    function SINSVertCollapseRadioClick(SINSVertCollapse_value, EncDateText, SurveyItemResult5, SurveyItem5, SurveyItemNum5, SINSVertCollapse) {
        if (EncDateText.value != '' && SINSVertCollapse_value != "") 
        {
            SurveyItem5.value = 'Vertebral body collapse';
            SurveyItemNum5.value = '5';
            SurveyItemResult5.value = SINSVertCollapse_value;

        }
        else if (SINSVertCollapse_value == "") 
        {
            SurveyItem5.value = '';
            SurveyItemNum5.value = '';
            SurveyItemResult5.value = '';
        }
    }

    addSINSEvent_Item6($('<%= EncDateText_1.ClientID %>'), $('<%= SurveyItemResult_6.ClientID %>'), $('<%= SurveyItem_6.ClientID %>'), $('<%= SurveyItemNum_6.ClientID %>'), $('<%= SINSPosterolateral.ClientID %>'));

    function addSINSEvent_Item6(EncDateText, SurveyItemResult6, SurveyItem6, SurveyItemNum6, SINSPosterolateral) {
        $(SINSPosterolateral).addEvent('click', curry(SINSPosterolateralSelected, EncDateText, SurveyItemResult6, SurveyItem6, SurveyItemNum6, SINSPosterolateral));

        // check on load as well
        SINSPosterolateralSelected(EncDateText, SurveyItemResult6, SurveyItem6, SurveyItemNum6, SINSPosterolateral);
    }

    function SINSPosterolateralSelected(EncDateText, SurveyItemResult6, SurveyItem6, SurveyItemNum6, SINSPosterolateral) {
        var SINSPosterolateralRef = SINSPosterolateral.getElementsByTagName('input');

        for (var i = 0; i < SINSPosterolateralRef.length; i++)
            if (SINSPosterolateralRef[i].checked) {
                SINSPosterolateralRadioClick(SINSPosterolateralRef[i].value, EncDateText, SurveyItemResult6, SurveyItem6, SurveyItemNum6, SINSPosterolateral);
            }
    }

    function SINSPosterolateralRadioClick(SINSPosterolateral_value, EncDateText, SurveyItemResult6, SurveyItem6, SurveyItemNum6, SINSPosterolateral) {
        if (EncDateText.value != '' && SINSPosterolateral_value != "") 
        {
            SurveyItem6.value = 'Posterolateral involvement of spinal elements (Facet, Pedicle, or Costovertebral Joint Fracture or Replacement With Tumor';
            SurveyItemNum6.value = '6';
            SurveyItemResult6.value = SINSPosterolateral_value;

        }
        else if (SINSPosterolateral_value == "") 
        {
            SurveyItem6.value = '';
            SurveyItemNum6.value = '';
            SurveyItemResult6.value = '';
        }
    }
</script>