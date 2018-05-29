<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.EncountersPedsNeuro" CodeFile="EncountersPedsNeuro.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<script language="javascript" type="text/javascript">
    tableArray.PedsNeuroEncountersTbl = "PedsNeuroEncountersTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="EncountersPedsNeuro" /><span class="controlBoxTitle">Encounters</span> <br/>
<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <span class="controlBoxTitle" style="font-size: 12px;">Previous Encounters</span><br/>
            <table border="0" width="950" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevPedsNeuroEncountersTbl">
                <tr id="NoPedsNeuroEncMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="9" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Encounters were recorded for this patient.
                    </td>
                </tr>
              <tr runat="server" id="PrevPedsNeuroEncRptHdr">
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Chief Complaint</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Presentation</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		            <td class="controlBoxDataGridHeaderFirstCol" valign="top">
                        <table border="0" cellpadding="2" cellspacing="0" class="ClinicalEformTable" width="100%">
                              <tr><td class="controlBoxDataGridHeaderFirstCol" align="center" colspan="4">Review of Systems</td></tr>
                              <tr runat="server" id="PrevPedsNeuroROSHdr">
                                <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" >System</td>
                                <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" >Symptom</td>
                                <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" >Result</td>
                                <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" >Notes</td>
                            </tr>  
                        </table>
                    </td>
              </tr>
  
              <asp:Repeater ID="PedsNeuroEncountersRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	            <ItemTemplate> 
		            <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Encounters', <%# Eval("EncounterId") %>, 'EncDateText,EncDate,EncType,EncChiefComplaint,EncPhysician,EncPresentation,EncStatus,EncInstitution,,EncQuality,EncNotes', 'Encounters');"> 
			            <td class="ClinicalEformPopulatedColumn"><%# Eval("EncDateText")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncType")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncChiefComplaint")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncPhysician")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncPresentation")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncStatus")%></td>                  
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncInstitution").ToString() == "Memorial Sloan Kettering Cancer Center" ? "MSKCC" : Eval("EncInstitution").ToString()%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncQuality")%></td>              
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncNotes")%></td>
			            <td valign="top">
	                        <table border="0" cellpadding="2" cellspacing="0" class="ClinicalEformTable" width="100%">   
	                             <asp:Repeater ID="PedsNeuroROSRpt" runat="server"> 
                                    <ItemTemplate>                   
	                                     <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('EncReviewOfSystems', <%# DataBinder.Eval(Container.DataItem, "EncReviewOfSystemId") %>, 'ROS_System,ROS_Symptom,ROS_Result,ROS_Notes','EncReviewOfSystems'); stopBubble(event);"> 
		                                    <td align="center" width="30%" class="ClinicalEformPopulatedColumn"><%# Eval("ROS_System")%></td>
		                                    <td align="center" width="30%" class="ClinicalEformPopulatedColumn"><%# Eval("ROS_Symptom")%></td>
		                                    <td align="center" width="20%" class="ClinicalEformPopulatedColumn"><%# Eval("ROS_Result")%></td>
		                                    <td align="center" width="20%" class="ClinicalEformPopulatedColumn"><%# Eval("ROS_Notes")%></td>
		                                 </tr>  
	                                  </ItemTemplate>
	                            </asp:Repeater>
	                        </table>
	                    </td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater>
              </table><br /><br />
              
  <span class="controlBoxTitle" style="font-size: 12px;">Add new Encounters</span><br/>            
  <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroEncountersTbl">
    <tr style="vertical-align: top" id="PedsNeuroEncTR1">
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Encounter 1</span><br />
            <table border="0" width="400" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroEncTbl1">
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Chief Complaint</td>
                </tr>  
                <tr>
                     <td style="text-align: center;"><euc:EformTextBox RecordId="1" ShowCalendar="True" CalcDate="True" Width="90px" 
                        TABLE="Encounters" FIELD="EncDateText" Runat="server" ID="EncDateText_1"/>
		                 <euc:EformHidden RecordId="1" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_1"/></td>
                    <td style="text-align: center;"><euc:EformDropDownList RecordId="1" Width="70px" TABLE="Encounters" FIELD="EncType" 
                        Runat="server" ID="EncType_1" LookupCode="EncType"/></td>
                    <td style="text-align: center;" colspan="2"><euc:EformTextBox RecordId="1" Width="180px" TABLE="Encounters" 
                        FIELD="EncChiefComplaint" Runat="server" ID="EncChiefComplaint_1"/></td>
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Fellow</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Presentation</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
                </tr>    
                <tr>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="1" TABLE="Encounters" FIELD="EncPhysician" Runat="server" 
                        ID="EncPhysician_1" Width="90px" LookupCode="ApptPhysician"/></td>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="1" TABLE="Encounters" FIELD="EncFellow" Runat="server" 
                        ID="EncFellow_1" Width="55px" LookupCode="Fellow"/></td>
                    <td style="text-align: center;"><euc:EformSelect RecordId="1" style=" width:80px" TABLE="Encounters" 
                        FIELD="EncPresentation" Runat="server" ID="EncPresentation_1" LookupCode="EncPresentation"/></td>   
                    <td style="text-align: center;"><euc:EformSelect RecordId="1" style=" width:70px" TABLE="Encounters" FIELD="EncStatus" 
                        Runat="server" ID="EncStatus_1" LookupCode="EncStatus"/></td> 
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Notes</td>
                </tr> 
                <tr>         
	                <td style="text-align: center;"><euc:EformComboBox RecordId="1" Width="90px" TABLE="Encounters" 
	                    FIELD="EncInstitution" Runat="server" ID="EncInstitution_1" LookupCode="Institution"/></td>
	                <td style="text-align: center;"><euc:EformDropDownList RecordId="1" TABLE="Encounters" FIELD="EncQuality" 
	                    Runat="server" ID="EncQuality_1" LookupCode="DataQuality" Width="70px"/></td>
	                <td colspan="2" style="text-align: center;"><euc:EformTextBox RecordId="1" Width="170px" TABLE="Encounters" 
	                    FIELD="EncNotes" Runat="server" ID="EncNotes_1" ShowTextEditor="true"/></td>
                </tr>   
            </table>
        </td>
        
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Review of Systems</span><br />
            <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroROSTbl1">
                <tr>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">System</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Symptom</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
                    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="1" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_1" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="1" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_1" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="1" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_1" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="1" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_1" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>            
                <tr>
                    <td><euc:EformSelect RecordId="2" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_2" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="2" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_2" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="2" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_2" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="2" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_2" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="3" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_3" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="3" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_3" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="3" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_3" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="3" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_3" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="4" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_4" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="4" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_4" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="4" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_4" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="4" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_4" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
            </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PedsNeuroEncTR1'));"  style="float: right; cursor: pointer;" /></td>
  </tr>
  
  <tr style="vertical-align: top; display:none;" id="PedsNeuroEncTR2">
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Encounter 2</span><br />
            <table border="0" width="400" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroEncTbl2">
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Chief Complaint</td>
                </tr>  
                <tr>
                     <td style="text-align: center;"><euc:EformTextBox RecordId="2" ShowCalendar="True" CalcDate="True" Width="90px" 
                        TABLE="Encounters" FIELD="EncDateText" Runat="server" ID="EncDateText_2"/>
		                 <euc:EformHidden RecordId="2" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_2"/></td>
                    <td style="text-align: center;"><euc:EformDropDownList RecordId="2" Width="70px" TABLE="Encounters" FIELD="EncType" 
                        Runat="server" ID="EncType_2" LookupCode="EncType"/></td>
                    <td style="text-align: center;" colspan="2"><euc:EformTextBox RecordId="2" Width="180px" TABLE="Encounters" 
                        FIELD="EncChiefComplaint" Runat="server" ID="EncChiefComplaint_2"/></td>
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Fellow</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Presentation</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
                </tr>    
                <tr>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="2" TABLE="Encounters" FIELD="EncPhysician" Runat="server" 
                        ID="EncPhysician_2" Width="90px" LookupCode="ApptPhysician"/></td>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="2" TABLE="Encounters" FIELD="EncFellow" Runat="server" 
                        ID="EncFellow_2" Width="55px" LookupCode="Fellow"/></td>
                    <td style="text-align: center;"><euc:EformSelect RecordId="2" style=" width:80px" TABLE="Encounters" 
                        FIELD="EncPresentation" Runat="server" ID="EncPresentation_2" LookupCode="EncPresentation"/></td>   
                    <td style="text-align: center;"><euc:EformSelect RecordId="2" style=" width:70px" TABLE="Encounters" FIELD="EncStatus" 
                        Runat="server" ID="EncStatus_2" LookupCode="EncStatus"/></td> 
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Notes</td>
                </tr> 
                <tr>         
	                <td style="text-align: center;"><euc:EformComboBox RecordId="2" Width="90px" TABLE="Encounters" 
	                    FIELD="EncInstitution" Runat="server" ID="EncInstitution_2" LookupCode="Institution"/></td>
	                <td style="text-align: center;"><euc:EformDropDownList RecordId="2" TABLE="Encounters" FIELD="EncQuality" 
	                    Runat="server" ID="EncQuality_2" LookupCode="DataQuality" Width="70px"/></td>
	                <td colspan="2" style="text-align: center;"><euc:EformTextBox RecordId="2" Width="170px" TABLE="Encounters" 
	                    FIELD="EncNotes" Runat="server" ID="EncNotes_2" ShowTextEditor="true"/></td>
                </tr>   
            </table>
        </td>
        
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Review of Systems</span><br />
            <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroROSTbl2">
                <tr>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">System</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Symptom</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
                    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="5" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_5" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="5" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_5" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="5" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_5" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="5" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_5" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>            
                <tr>
                    <td><euc:EformSelect RecordId="6" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_6" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="6" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_6" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="6" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_6" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="6" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_6" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="7" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_7" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="7" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_7" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="7" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_7" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="7" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_7" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="8" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_8" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="8" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_8" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="8" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_8" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="8" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_8" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
            </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PedsNeuroEncTR2'));"  style="float: right; cursor: pointer;" /></td>
  </tr>
  
  <tr style="vertical-align: top; display:none;" id="PedsNeuroEncTR3">
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Encounter 3</span><br />
            <table border="0" width="400" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroEncTbl3">
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Chief Complaint</td>
                </tr>  
                <tr>
                     <td style="text-align: center;"><euc:EformTextBox RecordId="3" ShowCalendar="True" CalcDate="True" Width="90px" 
                        TABLE="Encounters" FIELD="EncDateText" Runat="server" ID="EncDateText_3"/>
		                 <euc:EformHidden RecordId="3" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_3"/></td>
                     <td style="text-align: center;"><euc:EformDropDownList RecordId="3" Width="70px" TABLE="Encounters" FIELD="EncType" 
                        Runat="server" ID="EncType_3" LookupCode="EncType"/></td>
                     <td style="text-align: center;" colspan="3"><euc:EformTextBox RecordId="3" Width="180px" TABLE="Encounters" 
                        FIELD="EncChiefComplaint" Runat="server" ID="EncChiefComplaint_3"/></td>
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Fellow</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Presentation</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
                </tr>    
                <tr>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="3" TABLE="Encounters" FIELD="EncPhysician" Runat="server" 
                        ID="EncPhysician_3" Width="90px" LookupCode="ApptPhysician"/></td>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="3" TABLE="Encounters" FIELD="EncFellow" Runat="server" 
                        ID="EncFellow_3" Width="55px" LookupCode="Fellow"/></td>
                    <td style="text-align: center;"><euc:EformSelect RecordId="3" style=" width:80px" TABLE="Encounters" 
                        FIELD="EncPresentation" Runat="server" ID="EncPresentation_3" LookupCode="EncPresentation"/></td>   
                    <td style="text-align: center;"><euc:EformSelect RecordId="3" style=" width:70px" TABLE="Encounters" FIELD="EncStatus" 
                        Runat="server" ID="EncStatus_3" LookupCode="EncStatus"/></td> 
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Notes</td>
                </tr> 
                <tr>         
	                <td style="text-align: center;"><euc:EformComboBox RecordId="3" Width="90px" TABLE="Encounters" 
	                    FIELD="EncInstitution" Runat="server" ID="EncInstitution_3" LookupCode="Institution"/></td>
	                <td style="text-align: center;"><euc:EformDropDownList RecordId="3" TABLE="Encounters" FIELD="EncQuality" 
	                    Runat="server" ID="EncQuality_3" LookupCode="DataQuality" Width="70px"/></td>
	                <td colspan="3" style="text-align: center;"><euc:EformTextBox RecordId="3" Width="170px" TABLE="Encounters" 
	                    FIELD="EncNotes" Runat="server" ID="EncNotes_3" ShowTextEditor="true"/></td>
                </tr>   
            </table>
        </td>
        
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Review of Systems</span><br />
            <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroROSTbl3">
                <tr>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">System</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Symptom</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
                    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="9" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_9" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="9" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_9" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="9" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_9" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="9" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_9" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>            
                <tr>
                    <td><euc:EformSelect RecordId="10" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_10" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="10" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_10" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="10" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_10" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="10" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_10" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="11" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_11" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="11" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_11" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="11" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_11" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="11" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_11" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="12" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_12" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="12" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_12" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="12" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_12" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="12" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_12" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
            </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PedsNeuroEncTR3'));"  style="float: right; cursor: pointer;" /></td>
  </tr>
  
  <tr style="vertical-align: top; display:none;" id="PedsNeuroEncTR4">
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Encounter 4</span><br />
            <table border="0" width="400" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroEncTbl4">
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Chief Complaint</td>
                </tr>  
                <tr>
                     <td style="text-align: center;"><euc:EformTextBox RecordId="4" ShowCalendar="True" CalcDate="True" Width="90px" 
                        TABLE="Encounters" FIELD="EncDateText" Runat="server" ID="EncDateText_4"/>
		                 <euc:EformHidden RecordId="4" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_4"/></td>
                     <td style="text-align: center;"><euc:EformDropDownList RecordId="4" Width="70px" TABLE="Encounters" FIELD="EncType" 
                        Runat="server" ID="EncType_4" LookupCode="EncType"/></td>
                     <td style="text-align: center;" colspan="4"><euc:EformTextBox RecordId="4" Width="180px" TABLE="Encounters" 
                        FIELD="EncChiefComplaint" Runat="server" ID="EncChiefComplaint_4"/></td>
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Fellow</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Presentation</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
                </tr>    
                <tr>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="4" TABLE="Encounters" FIELD="EncPhysician" Runat="server" 
                        ID="EncPhysician_4" Width="90px" LookupCode="ApptPhysician"/></td>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="4" TABLE="Encounters" FIELD="EncFellow" Runat="server" 
                        ID="EncFellow_4" Width="55px" LookupCode="Fellow"/></td>
                    <td style="text-align: center;"><euc:EformSelect RecordId="4" style=" width:80px" TABLE="Encounters" 
                        FIELD="EncPresentation" Runat="server" ID="EncPresentation_4" LookupCode="EncPresentation"/></td>   
                    <td style="text-align: center;"><euc:EformSelect RecordId="4" style=" width:70px" TABLE="Encounters" FIELD="EncStatus" 
                        Runat="server" ID="EncStatus_4" LookupCode="EncStatus"/></td> 
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Notes</td>
                </tr> 
                <tr>         
	                <td style="text-align: center;"><euc:EformComboBox RecordId="4" Width="90px" TABLE="Encounters" 
	                    FIELD="EncInstitution" Runat="server" ID="EncInstitution_4" LookupCode="Institution"/></td>
	                <td style="text-align: center;"><euc:EformDropDownList RecordId="4" TABLE="Encounters" FIELD="EncQuality" 
	                    Runat="server" ID="EncQuality_4" LookupCode="DataQuality" Width="70px"/></td>
	                <td colspan="4" style="text-align: center;"><euc:EformTextBox RecordId="4" Width="170px" TABLE="Encounters" 
	                    FIELD="EncNotes" Runat="server" ID="EncNotes_4" ShowTextEditor="true"/></td>
                </tr>   
            </table>
        </td>
        
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Review of Systems</span><br />
            <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroROSTbl4">
                <tr>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">System</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Symptom</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
                    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="13" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_13" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="13" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_13" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="13" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_13" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="13" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_13" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>            
                <tr>
                    <td><euc:EformSelect RecordId="14" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_14" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="14" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_14" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="14" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_14" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="14" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_14" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="15" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_15" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="15" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_15" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="15" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_15" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="15" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_15" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="16" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_16" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="16" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_16" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="16" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_16" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="16" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_16" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
            </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PedsNeuroEncTR4'));"  style="float: right; cursor: pointer;" /></td>
  </tr>
  
  <tr style="vertical-align: top; display:none;" id="PedsNeuroEncTR5">
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Encounter 5</span><br />
            <table border="0" width="400" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroEncTbl5">
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Chief Complaint</td>
                </tr>  
                <tr>
                     <td style="text-align: center;"><euc:EformTextBox RecordId="5" ShowCalendar="True" CalcDate="True" Width="90px" 
                        TABLE="Encounters" FIELD="EncDateText" Runat="server" ID="EncDateText_5"/>
		                 <euc:EformHidden RecordId="5" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_5"/></td>
                     <td style="text-align: center;"><euc:EformDropDownList RecordId="5" Width="70px" TABLE="Encounters" FIELD="EncType" 
                        Runat="server" ID="EncType_5" LookupCode="EncType"/></td>
                     <td style="text-align: center;" colspan="5"><euc:EformTextBox RecordId="5" Width="180px" TABLE="Encounters" 
                        FIELD="EncChiefComplaint" Runat="server" ID="EncChiefComplaint_5"/></td>
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Fellow</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Presentation</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
                </tr>    
                <tr>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="5" TABLE="Encounters" FIELD="EncPhysician" Runat="server" 
                        ID="EncPhysician_5" Width="90px" LookupCode="ApptPhysician"/></td>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="5" TABLE="Encounters" FIELD="EncFellow" Runat="server" 
                        ID="EncFellow_5" Width="55px" LookupCode="Fellow"/></td>
                    <td style="text-align: center;"><euc:EformSelect RecordId="5" style=" width:80px" TABLE="Encounters" 
                        FIELD="EncPresentation" Runat="server" ID="EncPresentation_5" LookupCode="EncPresentation"/></td>   
                    <td style="text-align: center;"><euc:EformSelect RecordId="5" style=" width:70px" TABLE="Encounters" FIELD="EncStatus" 
                        Runat="server" ID="EncStatus_5" LookupCode="EncStatus"/></td> 
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Notes</td>
                </tr> 
                <tr>         
	                <td style="text-align: center;"><euc:EformComboBox RecordId="5" Width="90px" TABLE="Encounters" 
	                    FIELD="EncInstitution" Runat="server" ID="EncInstitution_5" LookupCode="Institution"/></td>
	                <td style="text-align: center;"><euc:EformDropDownList RecordId="5" TABLE="Encounters" FIELD="EncQuality" 
	                    Runat="server" ID="EncQuality_5" LookupCode="DataQuality" Width="70px"/></td>
	                <td colspan="5" style="text-align: center;"><euc:EformTextBox RecordId="5" Width="170px" TABLE="Encounters" 
	                    FIELD="EncNotes" Runat="server" ID="EncNotes_5" ShowTextEditor="true"/></td>
                </tr>   
            </table>
        </td>
        
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Review of Systems</span><br />
            <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroROSTbl5">
                <tr>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">System</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Symptom</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
                    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="17" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_17" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="17" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_17" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="17" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_17" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="17" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_17" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>            
                <tr>
                    <td><euc:EformSelect RecordId="18" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_18" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="18" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_18" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="18" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_18" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="18" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_18" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="19" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_19" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="19" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_19" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="19" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_19" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="19" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_19" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="20" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_20" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="20" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_20" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="20" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_20" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="20" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_20" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
            </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PedsNeuroEncTR5'));"  style="float: right; cursor: pointer;" /></td>
  </tr>
  
  <tr style="vertical-align: top; display:none;" id="PedsNeuroEncTR6">
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Encounter 6</span><br />
            <table border="0" width="400" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroEncTbl6">
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Chief Complaint</td>
                </tr>  
                <tr>
                     <td style="text-align: center;"><euc:EformTextBox RecordId="6" ShowCalendar="True" CalcDate="True" Width="90px" 
                        TABLE="Encounters" FIELD="EncDateText" Runat="server" ID="EncDateText_6"/>
		                 <euc:EformHidden RecordId="6" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_6"/></td>
                     <td style="text-align: center;"><euc:EformDropDownList RecordId="6" Width="70px" TABLE="Encounters" FIELD="EncType" 
                        Runat="server" ID="EncType_6" LookupCode="EncType"/></td>
                     <td style="text-align: center;" colspan="6"><euc:EformTextBox RecordId="6" Width="180px" TABLE="Encounters" 
                        FIELD="EncChiefComplaint" Runat="server" ID="EncChiefComplaint_6"/></td>
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Fellow</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Presentation</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
                </tr>    
                <tr>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="6" TABLE="Encounters" FIELD="EncPhysician" Runat="server" 
                        ID="EncPhysician_6" Width="90px" LookupCode="ApptPhysician"/></td>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="6" TABLE="Encounters" FIELD="EncFellow" Runat="server" 
                        ID="EncFellow_6" Width="55px" LookupCode="Fellow"/></td>
                    <td style="text-align: center;"><euc:EformSelect RecordId="6" style=" width:80px" TABLE="Encounters" 
                        FIELD="EncPresentation" Runat="server" ID="EncPresentation_6" LookupCode="EncPresentation"/></td>   
                    <td style="text-align: center;"><euc:EformSelect RecordId="6" style=" width:70px" TABLE="Encounters" FIELD="EncStatus" 
                        Runat="server" ID="EncStatus_6" LookupCode="EncStatus"/></td> 
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Notes</td>
                </tr> 
                <tr>         
	                <td style="text-align: center;"><euc:EformComboBox RecordId="6" Width="90px" TABLE="Encounters" 
	                    FIELD="EncInstitution" Runat="server" ID="EncInstitution_6" LookupCode="Institution"/></td>
	                <td style="text-align: center;"><euc:EformDropDownList RecordId="6" TABLE="Encounters" FIELD="EncQuality" 
	                    Runat="server" ID="EncQuality_6" LookupCode="DataQuality" Width="70px"/></td>
	                <td colspan="6" style="text-align: center;"><euc:EformTextBox RecordId="6" Width="170px" TABLE="Encounters" 
	                    FIELD="EncNotes" Runat="server" ID="EncNotes_6" ShowTextEditor="true"/></td>
                </tr>   
            </table>
        </td>
        
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Review of Systems</span><br />
            <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroROSTbl6">
                <tr>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">System</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Symptom</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
                    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="21" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_21" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="21" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_21" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="21" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_21" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="21" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_21" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>            
                <tr>
                    <td><euc:EformSelect RecordId="22" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_22" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="22" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_22" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="22" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_22" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="22" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_22" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="23" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_23" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="23" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_23" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="23" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_23" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="23" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_23" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="24" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_24" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="24" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_24" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="24" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_24" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="24" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_24" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon23" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
            </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PedsNeuroEncTR6'));"  style="float: right; cursor: pointer;" /></td>
  </tr>
  
  <tr style="vertical-align: top; display:none;" id="PedsNeuroEncTR7">
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Encounter 7</span><br />
            <table border="0" width="400" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroEncTbl7">
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Chief Complaint</td>
                </tr>  
                <tr>
                     <td style="text-align: center;"><euc:EformTextBox RecordId="7" ShowCalendar="True" CalcDate="True" Width="90px" 
                        TABLE="Encounters" FIELD="EncDateText" Runat="server" ID="EncDateText_7"/>
		                 <euc:EformHidden RecordId="7" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_7"/></td>
                     <td style="text-align: center;"><euc:EformDropDownList RecordId="7" Width="70px" TABLE="Encounters" FIELD="EncType" 
                        Runat="server" ID="EncType_7" LookupCode="EncType"/></td>
                     <td style="text-align: center;" colspan="7"><euc:EformTextBox RecordId="7" Width="180px" TABLE="Encounters" 
                        FIELD="EncChiefComplaint" Runat="server" ID="EncChiefComplaint_7"/></td>
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Fellow</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Presentation</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
                </tr>    
                <tr>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="7" TABLE="Encounters" FIELD="EncPhysician" Runat="server" 
                        ID="EncPhysician_7" Width="90px" LookupCode="ApptPhysician"/></td>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="7" TABLE="Encounters" FIELD="EncFellow" Runat="server" 
                        ID="EncFellow_7" Width="55px" LookupCode="Fellow"/></td>
                    <td style="text-align: center;"><euc:EformSelect RecordId="7" style=" width:80px" TABLE="Encounters" 
                        FIELD="EncPresentation" Runat="server" ID="EncPresentation_7" LookupCode="EncPresentation"/></td>   
                    <td style="text-align: center;"><euc:EformSelect RecordId="7" style=" width:70px" TABLE="Encounters" FIELD="EncStatus" 
                        Runat="server" ID="EncStatus_7" LookupCode="EncStatus"/></td> 
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Notes</td>
                </tr> 
                <tr>         
	                <td style="text-align: center;"><euc:EformComboBox RecordId="7" Width="90px" TABLE="Encounters" 
	                    FIELD="EncInstitution" Runat="server" ID="EncInstitution_7" LookupCode="Institution"/></td>
	                <td style="text-align: center;"><euc:EformDropDownList RecordId="7" TABLE="Encounters" FIELD="EncQuality" 
	                    Runat="server" ID="EncQuality_7" LookupCode="DataQuality" Width="70px"/></td>
	                <td colspan="7" style="text-align: center;"><euc:EformTextBox RecordId="7" Width="170px" TABLE="Encounters" 
	                    FIELD="EncNotes" Runat="server" ID="EncNotes_7" ShowTextEditor="true"/></td>
                </tr>   
            </table>
        </td>
        
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Review of Systems</span><br />
            <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroROSTbl7">
                <tr>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">System</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Symptom</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
                    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="25" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_25" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="25" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_25" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="25" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_25" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="25" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_25" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon24" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>            
                <tr>
                    <td><euc:EformSelect RecordId="26" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_26" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="26" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_26" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="26" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_26" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="26" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_26" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon25" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="27" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_27" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="27" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_27" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="27" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_27" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="27" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_27" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon26" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="28" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_28" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="28" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_28" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="28" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_28" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="28" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_28" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon27" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
            </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PedsNeuroEncTR7'));"  style="float: right; cursor: pointer;" /></td>
  </tr>
  
  <tr style="vertical-align: top; display:none;" id="PedsNeuroEncTR8">
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Encounter 8</span><br />
            <table border="0" width="400" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroEncTbl8">
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Chief Complaint</td>
                </tr>  
                <tr>
                     <td style="text-align: center;"><euc:EformTextBox RecordId="8" ShowCalendar="True" CalcDate="True" Width="90px" 
                        TABLE="Encounters" FIELD="EncDateText" Runat="server" ID="EncDateText_8"/>
		                 <euc:EformHidden RecordId="8" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_8"/></td>
                     <td style="text-align: center;"><euc:EformDropDownList RecordId="8" Width="70px" TABLE="Encounters" FIELD="EncType" 
                        Runat="server" ID="EncType_8" LookupCode="EncType"/></td>
                     <td style="text-align: center;" colspan="8"><euc:EformTextBox RecordId="8" Width="180px" TABLE="Encounters" 
                        FIELD="EncChiefComplaint" Runat="server" ID="EncChiefComplaint_8"/></td>
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Fellow</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Presentation</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
                </tr>    
                <tr>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="8" TABLE="Encounters" FIELD="EncPhysician" Runat="server" 
                        ID="EncPhysician_8" Width="90px" LookupCode="ApptPhysician"/></td>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="8" TABLE="Encounters" FIELD="EncFellow" Runat="server" 
                        ID="EncFellow_8" Width="55px" LookupCode="Fellow"/></td>
                    <td style="text-align: center;"><euc:EformSelect RecordId="8" style=" width:80px" TABLE="Encounters" 
                        FIELD="EncPresentation" Runat="server" ID="EncPresentation_8" LookupCode="EncPresentation"/></td>   
                    <td style="text-align: center;"><euc:EformSelect RecordId="8" style=" width:70px" TABLE="Encounters" FIELD="EncStatus" 
                        Runat="server" ID="EncStatus_8" LookupCode="EncStatus"/></td> 
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Notes</td>
                </tr> 
                <tr>         
	                <td style="text-align: center;"><euc:EformComboBox RecordId="8" Width="90px" TABLE="Encounters" 
	                    FIELD="EncInstitution" Runat="server" ID="EncInstitution_8" LookupCode="Institution"/></td>
	                <td style="text-align: center;"><euc:EformDropDownList RecordId="8" TABLE="Encounters" FIELD="EncQuality" 
	                    Runat="server" ID="EncQuality_8" LookupCode="DataQuality" Width="70px"/></td>
	                <td colspan="8" style="text-align: center;"><euc:EformTextBox RecordId="8" Width="170px" TABLE="Encounters" 
	                    FIELD="EncNotes" Runat="server" ID="EncNotes_8" ShowTextEditor="true"/></td>
                </tr>   
            </table>
        </td>
        
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Review of Systems</span><br />
            <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroROSTbl8">
                <tr>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">System</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Symptom</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
                    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="29" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_29" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="29" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_29" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="29" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_29" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="29" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_29" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon28" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>            
                <tr>
                    <td><euc:EformSelect RecordId="30" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_30" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="30" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_30" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="30" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_30" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="30" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_30" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon29" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="31" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_31" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="31" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_31" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="31" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_31" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="31" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_31" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon30" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="32" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_32" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="32" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_32" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="32" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_32" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="32" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_32" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon31" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
            </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PedsNeuroEncTR8'));"  style="float: right; cursor: pointer;" /></td>
  </tr>
  
  <tr style="vertical-align: top; display:none;" id="PedsNeuroEncTR9">
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Encounter 9</span><br />
            <table border="0" width="400" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroEncTbl9">
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Chief Complaint</td>
                </tr>  
                <tr>
                     <td style="text-align: center;"><euc:EformTextBox RecordId="9" ShowCalendar="True" CalcDate="True" Width="90px" 
                        TABLE="Encounters" FIELD="EncDateText" Runat="server" ID="EncDateText_9"/>
		                 <euc:EformHidden RecordId="9" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_9"/></td>
                     <td style="text-align: center;"><euc:EformDropDownList RecordId="9" Width="70px" TABLE="Encounters" FIELD="EncType" 
                        Runat="server" ID="EncType_9" LookupCode="EncType"/></td>
                     <td style="text-align: center;" colspan="9"><euc:EformTextBox RecordId="9" Width="180px" TABLE="Encounters" 
                        FIELD="EncChiefComplaint" Runat="server" ID="EncChiefComplaint_9"/></td>
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Fellow</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Presentation</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
                </tr>    
                <tr>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="9" TABLE="Encounters" FIELD="EncPhysician" Runat="server" 
                        ID="EncPhysician_9" Width="90px" LookupCode="ApptPhysician"/></td>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="9" TABLE="Encounters" FIELD="EncFellow" Runat="server" 
                        ID="EncFellow_9" Width="55px" LookupCode="Fellow"/></td>
                    <td style="text-align: center;"><euc:EformSelect RecordId="9" style=" width:80px" TABLE="Encounters" 
                        FIELD="EncPresentation" Runat="server" ID="EncPresentation_9" LookupCode="EncPresentation"/></td>   
                    <td style="text-align: center;"><euc:EformSelect RecordId="9" style=" width:70px" TABLE="Encounters" FIELD="EncStatus" 
                        Runat="server" ID="EncStatus_9" LookupCode="EncStatus"/></td> 
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Notes</td>
                </tr> 
                <tr>         
	                <td style="text-align: center;"><euc:EformComboBox RecordId="9" Width="90px" TABLE="Encounters" 
	                    FIELD="EncInstitution" Runat="server" ID="EncInstitution_9" LookupCode="Institution"/></td>
	                <td style="text-align: center;"><euc:EformDropDownList RecordId="9" TABLE="Encounters" FIELD="EncQuality" 
	                    Runat="server" ID="EncQuality_9" LookupCode="DataQuality" Width="70px"/></td>
	                <td colspan="9" style="text-align: center;"><euc:EformTextBox RecordId="9" Width="170px" TABLE="Encounters" 
	                    FIELD="EncNotes" Runat="server" ID="EncNotes_9" ShowTextEditor="true"/></td>
                </tr>   
            </table>
        </td>
        
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Review of Systems</span><br />
            <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroROSTbl7">
                <tr>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">System</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Symptom</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
                    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="33" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_33" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="33" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_33" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="33" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_33" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="33" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_33" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon32" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>            
                <tr>
                    <td><euc:EformSelect RecordId="34" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_34" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="34" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_34" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="34" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_34" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="34" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_34" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon33" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="35" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_35" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="35" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_35" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="35" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_35" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="35" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_35" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon34" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="36" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_36" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="36" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_36" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="36" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_36" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="36" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_36" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon35" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
            </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PedsNeuroEncTR9'));"  style="float: right; cursor: pointer;" /></td>
  </tr>
  
  <tr style="vertical-align: top; display:none;" id="PedsNeuroEncTR10">
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Encounter 10</span><br />
            <table border="0" width="400" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroEncTbl10">
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Chief Complaint</td>
                </tr>  
                <tr>
                     <td style="text-align: center;"><euc:EformTextBox RecordId="10" ShowCalendar="True" CalcDate="True" Width="90px" 
                        TABLE="Encounters" FIELD="EncDateText" Runat="server" ID="EncDateText_10"/>
		                 <euc:EformHidden RecordId="10" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_10"/></td>
                     <td style="text-align: center;"><euc:EformDropDownList RecordId="10" Width="70px" TABLE="Encounters" FIELD="EncType" 
                        Runat="server" ID="EncType_10" LookupCode="EncType"/></td>
                     <td style="text-align: center;" colspan="10"><euc:EformTextBox RecordId="10" Width="180px" TABLE="Encounters" 
                        FIELD="EncChiefComplaint" Runat="server" ID="EncChiefComplaint_10"/></td>
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Fellow</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Presentation</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
                </tr>    
                <tr>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="10" TABLE="Encounters" FIELD="EncPhysician" Runat="server" 
                        ID="EncPhysician_10" Width="90px" LookupCode="ApptPhysician"/></td>
                    <td style="text-align: center;"><euc:EformComboBox RecordId="10" TABLE="Encounters" FIELD="EncFellow" Runat="server" 
                        ID="EncFellow_10" Width="55px" LookupCode="Fellow"/></td>
                    <td style="text-align: center;"><euc:EformSelect RecordId="10" style=" width:80px" TABLE="Encounters" 
                        FIELD="EncPresentation" Runat="server" ID="EncPresentation_10" LookupCode="EncPresentation"/></td>   
                    <td style="text-align: center;"><euc:EformSelect RecordId="10" style=" width:70px" TABLE="Encounters" FIELD="EncStatus" 
                        Runat="server" ID="EncStatus_10" LookupCode="EncStatus"/></td> 
                </tr> 
                
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;" colspan="2">Notes</td>
                </tr> 
                <tr>         
	                <td style="text-align: center;"><euc:EformComboBox RecordId="10" Width="90px" TABLE="Encounters" 
	                    FIELD="EncInstitution" Runat="server" ID="EncInstitution_10" LookupCode="Institution"/></td>
	                <td style="text-align: center;"><euc:EformDropDownList RecordId="10" TABLE="Encounters" FIELD="EncQuality" 
	                    Runat="server" ID="EncQuality_10" LookupCode="DataQuality" Width="70px"/></td>
	                <td colspan="10" style="text-align: center;"><euc:EformTextBox RecordId="10" Width="170px" TABLE="Encounters" 
	                    FIELD="EncNotes" Runat="server" ID="EncNotes_10" ShowTextEditor="true"/></td>
                </tr>   
            </table>
        </td>
        
        <td style="vertical-align: top"><br />
        <span  class="controlBoxTitle">Review of Systems</span><br />
            <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="Table1">
                <tr>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">System</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Symptom</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
                    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="37" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_37" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="37" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_37" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="37" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_37" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="37" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_37" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon36" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>            
                <tr>
                    <td><euc:EformSelect RecordId="38" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_38" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="38" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_38" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="38" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_38" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="38" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_38" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon37" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="39" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_39" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="39" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_39" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="39" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_39" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="39" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_39" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon38" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
                <tr>
                    <td><euc:EformSelect RecordId="40" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                        ID="ROS_System_40" LookupCode="BodySystem"/></td>
                    <td><euc:EformComboBox RecordId="40" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" 
	                    ID="ROS_Symptom_40" LookupCode="ROS_Symptom"/></td>
	                <td><euc:EformSelect RecordId="40" style=" width:70px" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" 
                        ID="ROS_Result_40" LookupCode="Result"/></td>
                    <td><euc:EformTextBox RecordId="40" Width="70px" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" 
                        ID="ROS_Notes_40" ShowTextEditor="true"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon39" runat="server" ToolTip="Clear all fields" 
                        style="cursor:pointer;"/></td>
                </tr>
            </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PedsNeuroEncTR10'));"  style="float: right; cursor: pointer;" /></td>
  </tr>
  
  
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PedsNeuroEncountersTbl');" /><br />
        </td>
    </tr>
 </table><br /><br />