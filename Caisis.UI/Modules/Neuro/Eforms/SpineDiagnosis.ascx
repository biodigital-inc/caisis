<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.SpineDiagnosis"
    CodeFile="SpineDiagnosis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.SpinePrimDiagTbl = "SpinePrimDiagTbl";
    tableArray.SpineMetsDiagTbl = "SpineMetsDiagTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<table border="0" cellspacing="0" cellpadding="6" width="300" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <span class="controlBoxTitle" style="font-size: 12px;">Prior Diagnosis Details</span><br /><br />
            <div id="PDFormDiv" style="overflow-y: auto; overflow-x:auto; height: 250px; width:1250; border:solid 1px #cccccc; background-color:#dddddd;" 
                runat="server">
                <table><tr><td valign="top">
             <span class="controlBoxTitle" style="font-size: 12px;">Pathology</span><br />
             <table width="800" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="SpinePathRptTable">
                <tr id="NoSpinePathMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="8" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Pathologies were recorded for this patient.
                    </td>
                </tr>
                <asp:Repeater ID="SpinePathRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
                <HeaderTemplate>
                    <tr runat="server" id="PrevSpinePathRptHdr">  
                        <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Date</td> 
                        <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Histology</td>
                        <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Sec.<br />Histology</td>                       
                        <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Path#</td>
	                    <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Prim.<br />Disease</td>
	                    <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Institution</td>
	                    <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Notes</td>
	                    <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Data<br />Qlty</td>
                        <td class="controlBoxDataGridHeaderFirstCol" valign="top">
                            <table border="1" cellpadding="1" cellspacing="0" class="ClinicalEformTable" width="50">
                                  <tr><td class="controlBoxDataGridHeaderFirstCol" align="center">Path<br />Grade</td></tr>
                            </table>
                        </td>
	                    <td class="controlBoxDataGridHeaderFirstCol" valign="top">
                            <table border="1" cellpadding="1" cellspacing="0" class="ClinicalEformTable" width="300">
                                  <tr runat="server" id="PrevSpinePathTestsHdr">
                                    <td class="controlBoxDataGridTitleColumn" style="text-align:center; width:75px">Date</td>
                                    <td class="controlBoxDataGridTitleColumn" style="text-align:center; width:75px">Path<br />Test</td>
                                    <td class="controlBoxDataGridTitleColumn" style="text-align:center; width:75px">Result</td>
                                    <td class="controlBoxDataGridTitleColumn" style="text-align:center; width:75px">Notes</td>
                                </tr>  
                            </table>
                        </td>
                    </tr>
                </HeaderTemplate>
	            <ItemTemplate> 
		            <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Pathology', <%# Eval("PathologyId") %>, 'PathDateText,PathDate,PathNum,PathHistology,PathHistology2,PathDisease,PathInstitution,PathNotes,PathQuality', 'Pathology');"> 
		                <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("PathDateText")%></td>
		                <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("PathHistology")%></td>		    
			            <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("PathHistology2")%></td>	
		                <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("PathNum")%></td>		
			            <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("PathDisease")%></td>
			            <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("PathInstitution").ToString() == "Memorial Sloan Kettering Cancer Center" ? "MSKCC" : Eval("PathInstitution").ToString()%></td>
			            <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("PathNotes")%></td>
			            <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("PathQuality")%></td>
                        <td valign="top" align="left">
                            <table border="0" cellpadding="1" cellspacing="0" class="ClinicalEformTable" width="50"> 
                                <asp:Repeater ID="SpinePathGradeRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	                            <ItemTemplate> 
		                            <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('PathologyStageGrade', <%# Eval("PathologyStageGradeId") %>, 'PathGrade,PathStageDisease,PathQuality', 'PathologyStageGrade'); stopBubble(event);"> 
		                                <td class="ClinicalEformPopulatedColumn" style="text-align:center; width:50px"><%# Eval("PathGrade")%></td>
		                            </tr>      
	                            </ItemTemplate>
                              </asp:Repeater> 
                          </table>
                        </td>
			            <td valign="top" align="left">
                            <table border="0" cellpadding="1" cellspacing="0" class="ClinicalEformTable" width="300"> 
                                <asp:Repeater ID="SpinePathTestsRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	                            <ItemTemplate> 
		                            <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('PathTest', <%# Eval("PathTestId") %>, 'PathDateText,PathDate,PathTest,PathResult,PathNotes,PathQuality', 'PathTest'); stopBubble(event);"> 
		                                <td class="ClinicalEformPopulatedColumn" style="text-align:center; width:50px"><%# Eval("PathDateText")%></td>
		                                <td class="ClinicalEformPopulatedColumn" style="text-align:center; width:50px"><%# Eval("PathTest")%></td>		    
			                            <td class="ClinicalEformPopulatedColumn" style="text-align:center; width:50px"><%# Eval("PathResult")%></td>
			                            <td class="ClinicalEformPopulatedColumn" style="text-align:center; width:50px"><%# Eval("PathNotes")%></td>
		                            </tr>      
	                            </ItemTemplate>
                              </asp:Repeater> 
                          </table>
                        </td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater> 
            </table>
      </td>
      <td valign="top">
            <span class="controlBoxTitle" style="font-size: 12px;">Status (Initial Diagnosis Date)</span><br />
            <table width="270" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="SpineStatusRptTable">
                 <tr id="NoSpineStatusMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Statuses were recorded for this patient.
                    </td>
                </tr>
                <asp:Repeater ID="SpineStatusRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
                <HeaderTemplate>
                    <tr runat="server" id="PrevSpineStatusRptHdr">  
                        <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Date</td>
                        <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Disease</td>
                        <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Status</td>
	                    <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Notes</td>
	                    <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Qlty</td>
                    </tr>
                </HeaderTemplate>
	            <ItemTemplate> 
		            <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Status', <%# Eval("StatusId") %>, 'StatusDateText,StatusDate,StatusDisease,Status,StatusNotes,StatusQuality', 'Status');"> 
		                <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("StatusDateText")%></td>
		                <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("StatusDisease")%></td>		    
			            <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("Status")%></td>
			            <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("StatusNotes")%></td>
			            <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("StatusQuality")%></td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater> 
          </table>
      </td>
      </tr></table></div><br /><br />
        </td>
    </tr>

    <!-- Primary Dianosis grid-->
    <tr>
        <td class="controlBoxTitle" style="color: Maroon;">
            <asp:Label ID="PrimDiagnosis" runat="server" Text="Primary Diagnosis" Value="Primary Diagnosis" />
        </td>
    </tr>
    <tr id="PrimDiagDetails" runat="server">
        <td colspan="2">
            <span class="controlBoxTitle" style="font-size: 12px; width:900px;">Pathology</span><span class="controlBoxTitle" style="font-size: 12px;">Status(Diagnosis Details)</span>
            <table width="500" border="0" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="SpinePrimDiagTbl">
                <tr style="white-space: nowrap; vertical-align: top" id="SpinePrimDiagTr1" runat="server">
                    <td>
                        <table width="500" border="0" cellpadding="2" cellspacing="0" class="ClinicalEformTable">
                            <tr align="center" valign="middle">
                                <td class="controlBoxDataGridHeaderFirstCol">Date</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Histology</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Sec<br />Histology</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Path#</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Prim<br />Disease</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Specimen<br />Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Pathologist</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px;">Initial<br />Diag.Date</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Disease</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Status</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px">Notes</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px">Data<br />Qlty</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px">&nbsp;</td>
                            </tr>
                            <tr id="PathHTMLRow1" style="white-space: nowrap;">
                                <td><euc:EformTextBox Width="70px" Table="Pathology" RecordId="1" Field="PathDateText" ID="PathDateText_1" 
                                    runat="server" ShowCalendar="true" CalcDate="true" />
                                    <euc:EformHidden Table="Pathology" Field="PathDate" RecordId="1" ID="PathDate_1" runat="server" /></td>
                                <td><euc:EformComboBox Width="100px" Table="Pathology" Field="PathHistology" RecordId="1" ID="PathHistology_1" 
                                        LookupCode="PathHistology" runat="server" DropDownWidth="350px" /></td>
                                <td align="center"><euc:EformComboBox Width="60px" Table="Pathology" Field="PathHistology2" RecordId="1" 
                                    ID="PathHistology2_1" LookupCode="PathHistology" runat="server" DropDownWidth="350px" /></td>      
                                <td><euc:EformTextBox Table="Pathology" RecordId="1" Field="PathNum" ID="PathNum_1" runat="server" MaxLength="50" 
                                    Width="70px" /></td>
                                <td><euc:EformComboBox Table="Pathology" Field="PathDisease" RecordId="1" runat="server" ID="PathDisease_1" 
                                    Style="width: 70px" LookupCode="Disease,Disease,Spine" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformTextBox Width="70px"  TABLE="Pathology" RecordId="1" FIELD="PathSpecimenType" 
                                    ID="PathSpecimenType_1" Runat="server" /></td>
                                 <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="1" FIELD="Pathologist" 
                                    ID="Pathologist_1" Runat="server" LookupCode="Pathologist" /></td>
                                <td><euc:EformComboBox ID="PathInstitution_1" RecordId="1" Table="Pathology" Field="PathInstitution" 
                                    runat="server" Style="width: 80px;" LookupCode="Institution" /></td>
                                <td><euc:EformTextBox Table="Pathology" RecordId="1" Field="PathNotes" ID="PathNotes_1" runat="server" 
                                    ShowTextEditor="true" MaxLength="8000" Width="60px" /></td>
                                <td><euc:EformDropDownList Table="Pathology" RecordId="1" Field="PathQuality" ID="PathQuality_1" runat="server" 
                                    LookupCode="DataQuality" Style="width: 60px;" /></td>
                                <td colspan="6">
                                    <table class="ClinicalEformTable" style=" outline:gray solid 1px;">
                                        <tr>
                                            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" Style="width: 70px;" RecordId="1" Table="Status" 
                                                Field="StatusDateText" runat="server" ID="StatusDateText_1" />
                                                <euc:EformHidden RecordId="1" Table="Status" Field="StatusDate" runat="server" ID="StatusDate_1" /></td>
                                            <td><euc:EformComboBox RecordId="1" Table="Status" Field="StatusDisease" runat="server" ID="StatusDisease_1" 
                                                Style="width: 70px;" LookupCode="Disease,Disease,Spine" /></td>
                                            <td><euc:EformTextBox RecordId="1" Table="Status" Field="Status" runat="server" ID="Status_1" Style="width: 90px;" 
                                                ReadOnly="true" /></td>
                                            <td><euc:EformTextBox RecordId="1" Style="width: 60px;" ShowTextEditor="true" Table="Status" Field="StatusNotes" 
                                                runat="server" ID="StatusNotes_1" ReadOnly="true" /></td>
                                            <td><euc:EformDropDownList RecordId="1" Style="width: 60px;" Table="Status" Field="StatusQuality" runat="server" 
                                                ID="StatusQuality_1" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon31" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style=" height:20px; vertical-align:middle; text-align: center;">
                                <td class="controlBoxDataGridHeaderFirstCol">Path Grade</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Disease</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="controlBoxDataGridHeaderFirstCol">PathTest<br />Date</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Path Test</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Result</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                            </tr>
                            <tr id="PathStageHTMLRow1" valign="top" align="center">
                                <td><euc:EformComboBox Table="PathologyStageGrade" RecordId="1" Field="PathGrade" ID="PathGrade_1" 
                                    runat="server" Width="70px" LookupCode="PathGrade,Disease,Spine" DropDownWidth="200px" /></td>
                                <td><euc:EformComboBox Table="PathologyStageGrade" RecordId="1" Field="PathStageDisease" 
                                    ID="PathStageDisease_1" LookupCode="ClinStageDisease" runat="server" Width="100px" /></td>
                                <td><euc:EformDropDownList Table="PathologyStageGrade" RecordId="1" Field="PathQuality" runat="server" 
                                    ID="PathGradeQuality_1" Width="80px" LookupCode="DataQuality" /></td>     
                                <td class="controlBoxDataGridValueColumn" colspan="6">
                                    <table id="PathTestHTMLRow1" >
                                        <tr id="PathTestHTMLRow1_1">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="1" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_1" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="1"   ID="PathTestDate_1" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="1" FIELD="PathTest" 
                                                ID="PathTest_1" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="1" FIELD="PathResult" 
                                                ID="PathResult_1" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="1" FIELD="PathNotes" ID="PathTestNotes_1" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="1" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_1" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>  
                                        <tr id="PathTestHTMLRow1_2" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="2" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_2" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="2"   ID="PathTestDate_2" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="2" FIELD="PathTest" 
                                                ID="PathTest_2" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="2" FIELD="PathResult" 
                                                ID="PathResult_2" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="2" FIELD="PathNotes" ID="PathTestNotes_2" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="2" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_2" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr> 
                                        <tr id="PathTestHTMLRow1_3" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="3" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_3" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="3"   ID="PathTestDate_3" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="3" FIELD="PathTest" 
                                                ID="PathTest_3" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="3" FIELD="PathResult" 
                                                ID="PathResult_3" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="3" FIELD="PathNotes" ID="PathTestNotes_3" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="3" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_3" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow1_4" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="4" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_4" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="4"   ID="PathTestDate_4" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="4" FIELD="PathTest" 
                                                ID="PathTest_4" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="4" FIELD="PathResult" 
                                                ID="PathResult_4" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="4" FIELD="PathNotes" ID="PathTestNotes_4" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="4" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_4" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow1_5" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="5" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_5" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="5"   ID="PathTestDate_5" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="5" FIELD="PathTest" 
                                                ID="PathTest_5" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="5" FIELD="PathResult" 
                                                ID="PathResult_5" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="5" FIELD="PathNotes" ID="PathTestNotes_5" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="5" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_5" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow1_6" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="31" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_31" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="31"   ID="PathTestDate_31" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="31" FIELD="PathTest" 
                                                ID="PathTest_31" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="31" FIELD="PathResult" 
                                                ID="PathResult_31" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="31" FIELD="PathNotes" ID="PathTestNotes_31" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="31" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_31" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon39" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow1_7" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="32" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_32" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="32"   ID="PathTestDate_32" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="32" FIELD="PathTest" 
                                                ID="PathTest_32" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="32" FIELD="PathResult" 
                                                ID="PathResult_32" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="32" FIELD="PathNotes" ID="PathTestNotes_32" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="32" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_32" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon37" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow1_8" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="33" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_33" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="33"   ID="PathTestDate_33" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="33" FIELD="PathTest" 
                                                ID="PathTest_33" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="33" FIELD="PathResult" 
                                                ID="PathResult_33" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="33" FIELD="PathNotes" ID="PathTestNotes_33" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="33" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_33" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon38" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow1_9" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="34" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_34" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="34"   ID="PathTestDate_34" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="34" FIELD="PathTest" 
                                                ID="PathTest_34" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="34" FIELD="PathResult" 
                                                ID="PathResult_34" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="34" FIELD="PathNotes" ID="PathTestNotes_34" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="34" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_34" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon41" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow1_10" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="35" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_35" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="35"   ID="PathTestDate_35" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="35" FIELD="PathTest" 
                                                ID="PathTest_35" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="35" FIELD="PathResult" 
                                                ID="PathResult_35" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="35" FIELD="PathNotes" ID="PathTestNotes_35" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="35" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_35" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon40" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr ><td colspan="5" height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathTestHTMLRow1');" /></td></tr>
                                    </table>
                                </td>                           
                            </tr>                            
                            
                        </table><br />
                    </td>
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PathHTMLRow1'));clearInputFields($('PathStageHTMLRow1'));"  style="float: right; cursor: pointer;" /></td>
                </tr>
                
                <tr style="display: none; white-space: nowrap; vertical-align: top" id="SpinePrimDiagTr2" runat="server">
                    <td>
                        <table width="500" border="0" cellpadding="2" cellspacing="0" class="ClinicalEformTable">
                            <tr align="center" valign="middle">
                                <td class="controlBoxDataGridHeaderFirstCol">Date</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Histology</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Sec<br />Histology</td>                                
                                <td class="controlBoxDataGridHeaderFirstCol">Path#</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Prim<br />Disease</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Specimen<br />Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Pathologist</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px;">Initial<br />Diag.Date</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Disease</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Status</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px">Notes</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px">Data<br />Qlty</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px">&nbsp;</td>
                            </tr>
                            <tr id="PathHTMLRow2" style="white-space: nowrap;">
                                <td><euc:EformTextBox Width="70px" Table="Pathology" RecordId="2" Field="PathDateText" ID="PathDateText_2" runat="server" ShowCalendar="true" 
                                        CalcDate="true" />
                                    <euc:EformHidden Table="Pathology" Field="PathDate" RecordId="2" ID="PathDate_2" runat="server" /></td>
                                <td><euc:EformComboBox Width="100px" Table="Pathology" Field="PathHistology" RecordId="2" ID="PathHistology_2" 
                                        LookupCode="PathHistology" runat="server" DropDownWidth="350px" /></td>
                                <td align="center"><euc:EformComboBox Width="60px" Table="Pathology" Field="PathHistology2" RecordId="2" ID="PathHistology2_2" 
                                    LookupCode="PathHistology" runat="server" DropDownWidth="350px" /></td>
                                <td><euc:EformTextBox Table="Pathology" RecordId="2" Field="PathNum" ID="PathNum_2" runat="server" MaxLength="50" 
                                    Width="70px" /></td>
                                <td><euc:EformComboBox Table="Pathology" Field="PathDisease" RecordId="2" runat="server" ID="PathDisease_2" 
                                    Style="width: 70px" LookupCode="Disease,Disease,Spine" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformTextBox Width="70px"  TABLE="Pathology" RecordId="2" FIELD="PathSpecimenType" 
                                    ID="PathSpecimenType_2" Runat="server" /></td>
                                 <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="2" FIELD="Pathologist" 
                                    ID="Pathologist_2" Runat="server" LookupCode="Pathologist" /></td>
                                <td><euc:EformComboBox ID="PathInstitution_2" RecordId="2" Table="Pathology" Field="PathInstitution" runat="server" Style="width: 80px;" 
                                        LookupCode="Institution" /></td>
                                <td><euc:EformTextBox Table="Pathology" RecordId="2" Field="PathNotes" ID="PathNotes_2" runat="server" ShowTextEditor="true" MaxLength="8000" 
                                        Width="60px" /></td>
                                <td><euc:EformDropDownList Table="Pathology" RecordId="2" Field="PathQuality" ID="PathQuality_2" runat="server" LookupCode="DataQuality" 
                                        Style="width: 60px;" /></td>
                                <td colspan="6">
                                    <table class="ClinicalEformTable" style=" outline:gray solid 1px;">
                                        <tr>
                                            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" Style="width: 70px;" RecordId="2" Table="Status" 
                                                Field="StatusDateText" runat="server" ID="StatusDateText_2" />
                                                <euc:EformHidden RecordId="2" Table="Status" Field="StatusDate" runat="server" ID="StatusDate_2" /></td>
                                            <td><euc:EformComboBox RecordId="2" Table="Status" Field="StatusDisease" runat="server" ID="StatusDisease_2" 
                                                Style="width: 70px;" LookupCode="Disease,Disease,Spine" /></td>
                                            <td><euc:EformTextBox RecordId="2" Table="Status" Field="Status" runat="server" ID="Status_2" Style="width: 90px;" 
                                                ReadOnly="true" /></td>
                                            <td><euc:EformTextBox RecordId="2" Style="width: 60px;" ShowTextEditor="true" Table="Status" Field="StatusNotes" 
                                                runat="server" ID="StatusNotes_2"  ReadOnly="true" /></td>
                                            <td><euc:EformDropDownList RecordId="2" Style="width: 60px;" Table="Status" Field="StatusQuality" runat="server" 
                                                ID="StatusQuality_2" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon32" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                    </table></td>
                            </tr>
                            <tr style=" height:20px; vertical-align:middle; text-align: center;">
                                <td class="controlBoxDataGridHeaderFirstCol">Path Grade</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Disease</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="controlBoxDataGridHeaderFirstCol">PathTest<br />Date</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Path Test</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Result</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                            </tr>
                            <tr id="PathStageHTMLRow2" valign="top" align="center">
                                <td><euc:EformComboBox Table="PathologyStageGrade" RecordId="2" Field="PathGrade" ID="PathGrade_2" 
                                    runat="server" Width="70px" LookupCode="PathGrade,Disease,Spine" DropDownWidth="200px" /></td>
                                <td><euc:EformComboBox Table="PathologyStageGrade" RecordId="2" Field="PathStageDisease" 
                                    ID="PathStageDisease_2" LookupCode="ClinStageDisease" runat="server" Width="100px" /></td>
                                <td><euc:EformDropDownList Table="PathologyStageGrade" RecordId="2" Field="PathQuality" runat="server" 
                                    ID="PathGradeQuality_2" Width="80px" LookupCode="DataQuality" /></td>     
                                <td class="controlBoxDataGridValueColumn" colspan="6">
                                    <table id="PathTestHTMLRow2" >
                                        <tr id="PathTestHTMLRow2_1">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="6" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_6" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="6"   ID="PathTestDate_6" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="6" FIELD="PathTest" 
                                                ID="PathTest_6" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="6" FIELD="PathResult" 
                                                ID="PathResult_6" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="6" FIELD="PathNotes" ID="PathTestNotes_6" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="6" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_6" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>  
                                        <tr id="PathTestHTMLRow2_2" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="7" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_7" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="7"   ID="PathTestDate_7" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="7" FIELD="PathTest" 
                                                ID="PathTest_7" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="7" FIELD="PathResult" 
                                                ID="PathResult_7" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="7" FIELD="PathNotes" ID="PathTestNotes_7" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="7" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_7" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr> 
                                        <tr id="PathTestHTMLRow2_3" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="8" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_8" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="8"   ID="PathTestDate_8" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="8" FIELD="PathTest" 
                                                ID="PathTest_8" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="8" FIELD="PathResult" 
                                                ID="PathResult_8" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="8" FIELD="PathNotes" ID="PathTestNotes_8" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="8" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_8" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow2_4" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="9" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_9" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="9"   ID="PathTestDate_9" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="9" FIELD="PathTest" 
                                                ID="PathTest_9" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="9" FIELD="PathResult" 
                                                ID="PathResult_9" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="9" FIELD="PathNotes" ID="PathTestNotes_9" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="9" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_9" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow2_5" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="10" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_10" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="10"   ID="PathTestDate_10" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="10" FIELD="PathTest" 
                                                ID="PathTest_10" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="10" FIELD="PathResult" 
                                                ID="PathResult_10" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="10" FIELD="PathNotes" ID="PathTestNotes_10" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="10" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_10" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow2_6" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="36" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_36" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="36"   ID="PathTestDate_36" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="36" FIELD="PathTest" 
                                                ID="PathTest_36" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="36" FIELD="PathResult" 
                                                ID="PathResult_36" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="36" FIELD="PathNotes" ID="PathTestNotes_36" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="36" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_36" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon46" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow2_7" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="37" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_37" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="37"   ID="PathTestDate_37" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="37" FIELD="PathTest" 
                                                ID="PathTest_37" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="37" FIELD="PathResult" 
                                                ID="PathResult_37" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="37" FIELD="PathNotes" ID="PathTestNotes_37" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="37" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_37" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon42" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow2_8" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="38" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_38" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="38"   ID="PathTestDate_38" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="38" FIELD="PathTest" 
                                                ID="PathTest_38" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="38" FIELD="PathResult" 
                                                ID="PathResult_38" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="38" FIELD="PathNotes" ID="PathTestNotes_38" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="38" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_38" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon43" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow2_9" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="39" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_39" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="39"   ID="PathTestDate_39" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="39" FIELD="PathTest" 
                                                ID="PathTest_39" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="39" FIELD="PathResult" 
                                                ID="PathResult_39" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="39" FIELD="PathNotes" ID="PathTestNotes_39" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="39" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_39" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon44" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow2_10" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="40" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_40" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="40"   ID="PathTestDate_40" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="40" FIELD="PathTest" 
                                                ID="PathTest_40" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="40" FIELD="PathResult" 
                                                ID="PathResult_40" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="40" FIELD="PathNotes" ID="PathTestNotes_40" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="40" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_40" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon45" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr ><td colspan="5" height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathTestHTMLRow2');" /></td></tr>
                                    </table>
                                </td>                           
                            </tr>                            
                            
                        </table><br />
                    </td>                    
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PathHTMLRow2'));clearInputFields($('PathStageHTMLRow2'));"  style="float: right; cursor: pointer;" /></td>
                </tr>
                
                <tr style="display: none; white-space: nowrap; vertical-align: top" id="SpinePrimDiagTr3" runat="server">
                    <td>
                        <table width="500" border="0" cellpadding="2" cellspacing="0" class="ClinicalEformTable">
                            <tr align="center" valign="middle">
                                <td class="controlBoxDataGridHeaderFirstCol">Date</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Histology</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Sec<br />Histology</td>                                
                                <td class="controlBoxDataGridHeaderFirstCol">Path#</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Prim<br />Disease</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Specimen<br />Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Pathologist</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px;">Initial<br />Diag.Date</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Disease</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Status</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px">Notes</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px">Data<br />Qlty</td>
                                <td class="ClinicalEformPopulatedRow" style=" font:11px">&nbsp;</td>
                            </tr>
                            <tr id="PathHTMLRow3" style="white-space: nowrap;">
                                <td><euc:EformTextBox Width="70px" Table="Pathology" RecordId="3" Field="PathDateText" ID="PathDateText_3" runat="server" ShowCalendar="true" 
                                        CalcDate="true" />
                                    <euc:EformHidden Table="Pathology" Field="PathDate" RecordId="3" ID="PathDate_3" runat="server" /></td>
                                <td><euc:EformComboBox Width="100px" Table="Pathology" Field="PathHistology" RecordId="3" ID="PathHistology_3" 
                                        LookupCode="PathHistology" runat="server" DropDownWidth="350px" /></td>
                                <td align="center"><euc:EformComboBox Width="60px" Table="Pathology" Field="PathHistology2" RecordId="3" ID="PathHistology2_3" 
                                    LookupCode="PathHistology" runat="server" DropDownWidth="350px" /></td>
                                <td><euc:EformTextBox Table="Pathology" RecordId="3" Field="PathNum" ID="PathNum_3" runat="server" MaxLength="50" 
                                    Width="70px" /></td>
                                <td><euc:EformComboBox Table="Pathology" Field="PathDisease" RecordId="3" runat="server" ID="PathDisease_3" 
                                    Style="width: 70px" LookupCode="Disease,Disease,Spine" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformTextBox Width="70px"  TABLE="Pathology" RecordId="3" FIELD="PathSpecimenType" 
                                    ID="PathSpecimenType_3" Runat="server" /></td>
                                 <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="3" FIELD="Pathologist" 
                                    ID="Pathologist_3" Runat="server" LookupCode="Pathologist" /></td>
                                <td><euc:EformComboBox ID="PathInstitution_3" RecordId="3" Table="Pathology" Field="PathInstitution" runat="server" Style="width: 80px;" 
                                        LookupCode="Institution" /></td>
                                <td><euc:EformTextBox Table="Pathology" RecordId="3" Field="PathNotes" ID="PathNotes_3" runat="server" ShowTextEditor="true" MaxLength="8000" 
                                        Width="60px" /></td>
                                <td><euc:EformDropDownList Table="Pathology" RecordId="3" Field="PathQuality" ID="PathQuality_3" runat="server" LookupCode="DataQuality" 
                                        Style="width: 60px;" /></td>
                                <td colspan="6">
                                    <table class="ClinicalEformTable" style=" outline:gray solid 1px;">
                                        <tr>
                                            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" Style="width: 70px;" RecordId="3" Table="Status" 
                                                Field="StatusDateText" runat="server" ID="StatusDateText_3" />
                                                <euc:EformHidden RecordId="3" Table="Status" Field="StatusDate" runat="server" ID="StatusDate_3" /></td>
                                            <td><euc:EformComboBox RecordId="3" Table="Status" Field="StatusDisease" runat="server" ID="StatusDisease_3" 
                                                Style="width: 70px;" LookupCode="Disease,Disease,Spine" /></td>
                                            <td><euc:EformTextBox RecordId="3" Table="Status" Field="Status" runat="server" ID="Status_3" Style="width: 90px;" 
                                                ReadOnly="true" /></td>
                                            <td><euc:EformTextBox RecordId="3" Style="width: 60px;" ShowTextEditor="true" Table="Status" Field="StatusNotes" 
                                                runat="server" ID="StatusNotes_3"  ReadOnly="true" /></td>
                                            <td><euc:EformDropDownList RecordId="3" Style="width: 60px;" Table="Status" Field="StatusQuality" runat="server" 
                                                ID="StatusQuality_3" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon33" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr></table></td>
                            </tr>
                            <tr style=" height:20px; vertical-align:middle; text-align: center;">
                                <td class="controlBoxDataGridHeaderFirstCol">Path Grade</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Disease</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="controlBoxDataGridHeaderFirstCol">PathTest<br />Date</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Path Test</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Result</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                            </tr>
                            <tr id="PathStageHTMLRow3" valign="top" align="center">
                                <td><euc:EformComboBox Table="PathologyStageGrade" RecordId="3" Field="PathGrade" ID="PathGrade_3" 
                                    runat="server" Width="70px" LookupCode="PathGrade,Disease,Spine" DropDownWidth="200px" /></td>
                                <td><euc:EformComboBox Table="PathologyStageGrade" RecordId="3" Field="PathStageDisease" 
                                    ID="PathStageDisease_3" LookupCode="ClinStageDisease" runat="server" Width="100px" /></td>
                                <td><euc:EformDropDownList Table="PathologyStageGrade" RecordId="3" Field="PathQuality" runat="server" 
                                    ID="PathGradeQuality_3" Width="80px" LookupCode="DataQuality" /></td>     
                                <td class="controlBoxDataGridValueColumn" colspan="6">
                                    <table id="PathTestHTMLRow3" >
                                        <tr id="PathTestHTMLRow3_1">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="11" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_11" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="11"   ID="PathTestDate_11" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="11" FIELD="PathTest" 
                                                ID="PathTest_11" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="11" FIELD="PathResult" 
                                                ID="PathResult_11" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="11" FIELD="PathNotes" ID="PathTestNotes_11" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="11" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_11" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>  
                                        <tr id="PathTestHTMLRow3_2" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="12" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_12" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="12"   ID="PathTestDate_12" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="12" FIELD="PathTest" 
                                                ID="PathTest_12" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="12" FIELD="PathResult" 
                                                ID="PathResult_12" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="12" FIELD="PathNotes" ID="PathTestNotes_12" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="12" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_12" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr> 
                                        <tr id="PathTestHTMLRow3_3" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="13" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_13" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="13"   ID="PathTestDate_13" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="13" FIELD="PathTest" 
                                                ID="PathTest_13" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="13" FIELD="PathResult" 
                                                ID="PathResult_13" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="13" FIELD="PathNotes" ID="PathTestNotes_13" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="13" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_13" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow3_4" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="14" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_14" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="14"   ID="PathTestDate_14" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="14" FIELD="PathTest" 
                                                ID="PathTest_14" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="14" FIELD="PathResult" 
                                                ID="PathResult_14" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="14" FIELD="PathNotes" ID="PathTestNotes_14" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="14" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_14" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow3_5" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="15" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_15" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="15"   ID="PathTestDate_15" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="15" FIELD="PathTest" 
                                                ID="PathTest_15" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="15" FIELD="PathResult" 
                                                ID="PathResult_15" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="15" FIELD="PathNotes" ID="PathTestNotes_15" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="15" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_15" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow3_6" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="41" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_41" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="41"   ID="PathTestDate_41" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="41" FIELD="PathTest" 
                                                ID="PathTest_41" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="41" FIELD="PathResult" 
                                                ID="PathResult_41" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="41" FIELD="PathNotes" ID="PathTestNotes_41" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="41" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_41" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon52" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow3_7" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="42" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_42" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="42"   ID="PathTestDate_42" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="42" FIELD="PathTest" 
                                                ID="PathTest_42" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="42" FIELD="PathResult" 
                                                ID="PathResult_42" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="42" FIELD="PathNotes" ID="PathTestNotes_42" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="42" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_42" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon47" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow3_8" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="43" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_43" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="43"   ID="PathTestDate_43" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="43" FIELD="PathTest" 
                                                ID="PathTest_43" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="43" FIELD="PathResult" 
                                                ID="PathResult_43" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="43" FIELD="PathNotes" ID="PathTestNotes_43" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="43" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_43" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon48" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow3_9" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="44" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_44" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="44"   ID="PathTestDate_44" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="44" FIELD="PathTest" 
                                                ID="PathTest_44" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="44" FIELD="PathResult" 
                                                ID="PathResult_44" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="44" FIELD="PathNotes" ID="PathTestNotes_44" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="44" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_44" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon49" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow3_10" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="45" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_45" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="45"   ID="PathTestDate_45" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="45" FIELD="PathTest" 
                                                ID="PathTest_45" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="45" FIELD="PathResult" 
                                                ID="PathResult_45" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="45" FIELD="PathNotes" ID="PathTestNotes_45" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="45" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_45" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon50" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr ><td colspan="5" height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathTestHTMLRow3');" /></td></tr>
                                    </table>
                                </td>                           
                            </tr> 
                        </table>
                    </td>                    
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PathHTMLRow3'));clearInputFields($('PathStageHTMLRow3'));"  style="float: right; cursor: pointer;" /></td>
                </tr>
            </table>
            <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'SpinePrimDiagTbl');" /><br />
            <br />
        </td>
    </tr>
    <!-- Mets Diagnosis grid-->
    <tr>
        <td class="controlBoxTitle" style="color: Maroon;">
            <asp:Label ID="MetDiagnosis" runat="server" Text="Metastatic Diagnosis" Value="Metastatic Diagnosis" />
        </td>
    </tr>
    <tr id="MetsDiagDetails" runat="server">
        <td colspan="2">
            <span class="controlBoxTitle" style="font-size: 12px; width:900px;">Pathology</span><span class="controlBoxTitle" style="font-size: 12px;">Status(Diagnosis Details)</span>
            <table width="500" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="SpineMetsDiagTbl">                
                <tr style="white-space: nowrap; vertical-align: top" id="SpineMetsDiagTr1"  runat="server">
                    <td>
                        <table width="500" border="0" cellpadding="2" cellspacing="0" class="ClinicalEformTable">
                        <tr align="center" valign="middle">
                            <td class="controlBoxDataGridHeaderFirstCol">Date</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Histology</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Sec<br />Histology</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Path#</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Prim<br />Disease</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Specimen<br />Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Pathologist</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px;">Initial<br />Diag.Date</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Disease</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Status</td>
                            <td class="ClinicalEformPopulatedRow" id="statusPrimDiagnosisLbl4" runat="server" 
                                style="text-align: left; display: none;  font:11px;">Prim.Origin<br />to Spine</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Notes</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Data<br />Qlty</td>
                        </tr>
                        <tr id="PathHTMLRow4" style="white-space: nowrap;">
                                <td><euc:EformTextBox Width="70px" Table="Pathology" RecordId="4" Field="PathDateText" ID="PathDateText_4" runat="server" ShowCalendar="true" 
                                        CalcDate="true" />
                                    <euc:EformHidden Table="Pathology" Field="PathDate" RecordId="4" ID="PathDate_4" runat="server" /></td>
                                <td><euc:EformComboBox Width="100px" Table="Pathology" Field="PathHistology" RecordId="4" ID="PathHistology_4" 
                                        LookupCode="PathHistology" runat="server" DropDownWidth="350px" /></td>
                                <td><euc:EformComboBox Width="60px" Table="Pathology" Field="PathHistology2" RecordId="4" ID="PathHistology2_4" 
                                    LookupCode="PathHistology" runat="server" DropDownWidth="350px" /></td>
                                <td><euc:EformTextBox Table="Pathology" RecordId="4" Field="PathNum" ID="PathNum_4" runat="server" MaxLength="50" 
                                    Width="70px" /></td>
                                <td><euc:EformComboBox Table="Pathology" Field="PathDisease" RecordId="4" runat="server" ID="PathDisease_4" 
                                    Style="width: 70px" LookupCode="Disease,Disease,Spine" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformTextBox Width="70px"  TABLE="Pathology" RecordId="4" FIELD="PathSpecimenType" 
                                    ID="PathSpecimenType_4" Runat="server" /></td>
                                 <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="4" FIELD="Pathologist" 
                                    ID="Pathologist_4" Runat="server" LookupCode="Pathologist" /></td>
                                <td><euc:EformComboBox ID="PathInstitution_4" RecordId="4" Table="Pathology" Field="PathInstitution" runat="server" 
                                    Style="width: 80px;" LookupCode="Institution" /></td>
                                <td><euc:EformTextBox Table="Pathology" RecordId="4" Field="PathNotes" ID="PathNotes_4" runat="server" ShowTextEditor="true" MaxLength="8000" 
                                        Width="60px" /></td>
                                <td><euc:EformDropDownList Table="Pathology" RecordId="4" Field="PathQuality" ID="PathQuality_4" runat="server" LookupCode="DataQuality" 
                                        Style="width: 60px;" /></td>
                                <td colspan="7">
                                    <table class="ClinicalEformTable" style=" outline:gray solid 1px;">
                                        <tr>
                                            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" Style="width: 70px;" RecordId="4" Table="Status" 
                                                Field="StatusDateText" runat="server" ID="StatusDateText_4" />
                                                <euc:EformHidden RecordId="4" Table="Status" Field="StatusDate" runat="server" ID="StatusDate_4" /></td>
                                            <td><euc:EformComboBox RecordId="4" Table="Status" Field="StatusDisease" runat="server" ID="StatusDisease_4" 
                                                Style="width: 70px;" LookupCode="Disease,Disease,Spine" /></td>
                                            <td><euc:EformTextBox RecordId="4" Table="Status" Field="Status" runat="server" ID="Status_4" Style="width: 90px;" 
                                                ReadOnly="true" /></td>
                                            <td id="StatusPrimDiagnosisCol4" runat="server" style="display: none;">
                                                <euc:EformComboBox Table="NoTable" Field="StatusDiseaseOrigin4" runat="server" ID="StatusDiseaseOrigin4" 
                                                    Style="width: 70px" LookupCode="Disease,Disease,Spine" /></td>
                                            <td><euc:EformTextBox RecordId="4" Style="width: 60px;" ShowTextEditor="true" Table="Status" Field="StatusNotes" 
                                                runat="server" ID="StatusNotes_4" ReadOnly="true" /></td>
                                            <td><euc:EformDropDownList RecordId="4" Style="width: 60px;" Table="Status" Field="StatusQuality" runat="server" 
                                                ID="StatusQuality_4" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon34" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                       </tr></table></td>
                            </tr>
                            <tr style=" height:20px; vertical-align:middle; text-align: center;">
                                <td class="controlBoxDataGridHeaderFirstCol">Path Grade</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Disease</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="controlBoxDataGridHeaderFirstCol">PathTest<br />Date</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Path Test</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Result</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                            </tr>
                            <tr id="PathStageHTMLRow4" valign="top" align="center">
                                <td><euc:EformComboBox Table="PathologyStageGrade" RecordId="4" Field="PathGrade" ID="PathGrade_4" 
                                    runat="server" Width="70px" LookupCode="PathGrade,Disease,Spine" DropDownWidth="200px" /></td>
                                <td><euc:EformComboBox Table="PathologyStageGrade" RecordId="4" Field="PathStageDisease" 
                                    ID="PathStageDisease_4" LookupCode="ClinStageDisease" runat="server" Width="100px" /></td>
                                <td><euc:EformDropDownList Table="PathologyStageGrade" RecordId="4" Field="PathQuality" runat="server" 
                                    ID="PathGradeQuality_4" Width="80px" LookupCode="DataQuality" /></td>     
                                <td class="controlBoxDataGridValueColumn" colspan="6">
                                    <table id="PathTestHTMLRow4" >
                                        <tr id="PathTestHTMLRow4_1">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="16" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_16" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="16"   ID="PathTestDate_16" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="16" FIELD="PathTest" 
                                                ID="PathTest_16" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="16" FIELD="PathResult" 
                                                ID="PathResult_16" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="16" FIELD="PathNotes" ID="PathTestNotes_16" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="16" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_16" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>  
                                        <tr id="PathTestHTMLRow4_2" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="17" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_17" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="17"   ID="PathTestDate_17" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="17" FIELD="PathTest" 
                                                ID="PathTest_17" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="17" FIELD="PathResult" 
                                                ID="PathResult_17" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="17" FIELD="PathNotes" ID="PathTestNotes_17" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="17" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_17" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr> 
                                        <tr id="PathTestHTMLRow4_3" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="18" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_18" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="18"   ID="PathTestDate_18" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="18" FIELD="PathTest" 
                                                ID="PathTest_18" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="18" FIELD="PathResult" 
                                                ID="PathResult_18" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="18" FIELD="PathNotes" ID="PathTestNotes_18" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="18" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_18" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow4_4" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="19" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_19" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="19"   ID="PathTestDate_19" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="19" FIELD="PathTest" 
                                                ID="PathTest_19" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="19" FIELD="PathResult" 
                                                ID="PathResult_19" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="19" FIELD="PathNotes" ID="PathTestNotes_19" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="19" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_19" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow4_5" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="20" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_20" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="20"   ID="PathTestDate_20" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="20" FIELD="PathTest" 
                                                ID="PathTest_20" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="20" FIELD="PathResult" 
                                                ID="PathResult_20" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="20" FIELD="PathNotes" ID="PathTestNotes_20" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="20" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_20" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow4_6" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="46" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_46" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="46"   ID="PathTestDate_46" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="46" FIELD="PathTest" 
                                                ID="PathTest_46" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="46" FIELD="PathResult" 
                                                ID="PathResult_46" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="46" FIELD="PathNotes" ID="PathTestNotes_46" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="46" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_46" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon56" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow4_7" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="47" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_47" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="47"   ID="PathTestDate_47" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="47" FIELD="PathTest" 
                                                ID="PathTest_47" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="47" FIELD="PathResult" 
                                                ID="PathResult_47" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="47" FIELD="PathNotes" ID="PathTestNotes_47" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="47" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_47" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon51" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow4_8" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="48" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_48" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="48"   ID="PathTestDate_48" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="48" FIELD="PathTest" 
                                                ID="PathTest_48" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="48" FIELD="PathResult" 
                                                ID="PathResult_48" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="48" FIELD="PathNotes" ID="PathTestNotes_48" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="48" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_48" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon53" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow4_9" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="49" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_49" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="49"   ID="PathTestDate_49" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="49" FIELD="PathTest" 
                                                ID="PathTest_49" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="49" FIELD="PathResult" 
                                                ID="PathResult_49" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="49" FIELD="PathNotes" ID="PathTestNotes_49" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="49" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_49" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon54" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow4_10" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="50" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_50" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="50"   ID="PathTestDate_50" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="50" FIELD="PathTest" 
                                                ID="PathTest_50" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="50" FIELD="PathResult" 
                                                ID="PathResult_50" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="50" FIELD="PathNotes" ID="PathTestNotes_50" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="50" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_50" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon55" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr ><td colspan="5" height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathTestHTMLRow4');" /></td></tr>
                                    </table>
                                </td>                           
                            </tr>
                        </table><br />
                    </td>        
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PathHTMLRow4'));clearInputFields($('PathStageHTMLRow4'));"  style="float: right; cursor: pointer;" /></td>
                </tr>
                
                <tr style="display: none; white-space: nowrap; vertical-align: top" id="SpineMetsDiagTr2"  runat="server">
                    <td>
                        <table width="500" border="0" cellpadding="2" cellspacing="0" class="ClinicalEformTable">
                        <tr align="center" valign="middle">
                            <td class="controlBoxDataGridHeaderFirstCol">Date</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Histology</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Sec<br />Histology</td>                            
                            <td class="controlBoxDataGridHeaderFirstCol">Path#</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Prim<br />Disease</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Specimen<br />Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Pathologist</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px;">Initial<br />Diag.Date</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Disease</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Status</td>
                            <td class="ClinicalEformPopulatedRow" id="statusPrimDiagnosisLbl5" runat="server" 
                                style="text-align: left; display: none;  font:11px;">Prim.Origin<br />to Spine</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Notes</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Data<br />Qlty</td>
                        </tr>
                        <tr id="PathHTMLRow5" style="white-space: nowrap;">
                                <td><euc:EformTextBox Width="70px" Table="Pathology" RecordId="5" Field="PathDateText" ID="PathDateText_5" runat="server" ShowCalendar="true" 
                                        CalcDate="true" />
                                    <euc:EformHidden Table="Pathology" Field="PathDate" RecordId="5" ID="PathDate_5" runat="server" /></td>
                                <td><euc:EformComboBox Width="100px" Table="Pathology" Field="PathHistology" RecordId="5" ID="PathHistology_5" 
                                        LookupCode="PathHistology" runat="server" DropDownWidth="350px" /></td>
                                <td><euc:EformComboBox Width="60px" Table="Pathology" Field="PathHistology2" RecordId="5" ID="PathHistology2_5" 
                                    LookupCode="PathHistology" runat="server" DropDownWidth="350px" /></td>
                                <td><euc:EformTextBox Table="Pathology" RecordId="5" Field="PathNum" ID="PathNum_5" runat="server" MaxLength="50" 
                                    Width="70px" /></td>
                                <td><euc:EformComboBox Table="Pathology" Field="PathDisease" RecordId="5" runat="server" ID="PathDisease_5" 
                                    Style="width: 70px" LookupCode="Disease,Disease,Spine" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformTextBox Width="70px"  TABLE="Pathology" RecordId="5" FIELD="PathSpecimenType" 
                                    ID="PathSpecimenType_5" Runat="server" /></td>
                                 <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="5" FIELD="Pathologist" 
                                    ID="Pathologist_5" Runat="server" LookupCode="Pathologist" /></td>
                                <td><euc:EformComboBox ID="PathInstitution_5" RecordId="5" Table="Pathology" Field="PathInstitution" runat="server" Style="width: 80px;" 
                                        LookupCode="Institution" /></td>
                                <td><euc:EformTextBox Table="Pathology" RecordId="5" Field="PathNotes" ID="PathNotes_5" runat="server" ShowTextEditor="true" MaxLength="8000" 
                                        Width="60px" /></td>
                                <td><euc:EformDropDownList Table="Pathology" RecordId="5" Field="PathQuality" ID="PathQuality_5" runat="server" LookupCode="DataQuality" 
                                        Style="width: 60px;" /></td>
                                 <td colspan="7">
                                    <table class="ClinicalEformTable" style=" outline:gray solid 1px;">
                                        <tr>
                                            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" Style="width: 70px;" RecordId="5" Table="Status" 
                                                Field="StatusDateText" runat="server" ID="StatusDateText_5" />
                                                <euc:EformHidden RecordId="5" Table="Status" Field="StatusDate" runat="server" ID="StatusDate_5" /></td>
                                            <td><euc:EformComboBox RecordId="5" Table="Status" Field="StatusDisease" runat="server" ID="StatusDisease_5" 
                                                Style="width: 70px;" LookupCode="Disease,Disease,Spine" /></td>
                                            <td><euc:EformTextBox RecordId="5" Table="Status" Field="Status" runat="server" ID="Status_5" Style="width: 90px;" 
                                                ReadOnly="true" /></td>
                                            <td  id="StatusPrimDiagnosisCol5" runat="server" style="display: none;">
                                                <euc:EformComboBox Table="NoTable" Field="StatusDiseaseOrigin5" runat="server" ID="StatusDiseaseOrigin5" 
                                                    Style="width: 70px" LookupCode="Disease,Disease,Spine" /></td>
                                            <td><euc:EformTextBox RecordId="5" Style="width: 60px;" ShowTextEditor="true" Table="Status" Field="StatusNotes" 
                                                runat="server" ID="StatusNotes_5" ReadOnly="true" /></td>
                                            <td><euc:EformDropDownList RecordId="5" Style="width: 60px;" Table="Status" Field="StatusQuality" runat="server" 
                                                ID="StatusQuality_5" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon35" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr></table></td>
                            </tr>
                            <tr style=" height:20px; vertical-align:middle; text-align: center;">
                                <td class="controlBoxDataGridHeaderFirstCol">Path Grade</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Disease</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="controlBoxDataGridHeaderFirstCol">PathTest<br />Date</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Path Test</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Result</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                            </tr>
                            <tr id="PathStageHTMLRow5" valign="top" align="center">
                                <td><euc:EformComboBox Table="PathologyStageGrade" RecordId="5" Field="PathGrade" ID="PathGrade_5" 
                                    runat="server" Width="70px" LookupCode="PathGrade,Disease,Spine" DropDownWidth="200px" /></td>
                                <td><euc:EformComboBox Table="PathologyStageGrade" RecordId="5" Field="PathStageDisease" 
                                    ID="PathStageDisease_5" LookupCode="ClinStageDisease" runat="server" Width="100px" /></td>
                                <td><euc:EformDropDownList Table="PathologyStageGrade" RecordId="5" Field="PathQuality" runat="server" 
                                    ID="PathGradeQuality_5" Width="80px" LookupCode="DataQuality" /></td>     
                                <td class="controlBoxDataGridValueColumn" colspan="6">
                                    <table id="PathTestHTMLRow5" >
                                        <tr id="PathTestHTMLRow5_1">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="21" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_21" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="21"   ID="PathTestDate_21" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="21" FIELD="PathTest" 
                                                ID="PathTest_21" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="21" FIELD="PathResult" 
                                                ID="PathResult_21" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="21" FIELD="PathNotes" ID="PathTestNotes_21" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="21" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_21" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>  
                                        <tr id="PathTestHTMLRow5_2" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="22" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_22" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="22"   ID="PathTestDate_22" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="22" FIELD="PathTest" 
                                                ID="PathTest_22" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="22" FIELD="PathResult" 
                                                ID="PathResult_22" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="22" FIELD="PathNotes" ID="PathTestNotes_22" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="22" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_22" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr> 
                                        <tr id="PathTestHTMLRow5_3" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="23" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_23" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="23"   ID="PathTestDate_23" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="23" FIELD="PathTest" 
                                                ID="PathTest_23" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="23" FIELD="PathResult" 
                                                ID="PathResult_23" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="23" FIELD="PathNotes" ID="PathTestNotes_23" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="23" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_23" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon23" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow5_4" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="24" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_24" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="24"   ID="PathTestDate_24" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="24" FIELD="PathTest" 
                                                ID="PathTest_24" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="24" FIELD="PathResult" 
                                                ID="PathResult_24" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="24" FIELD="PathNotes" ID="PathTestNotes_24" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="24" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_24" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon24" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow5_5" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="25" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_25" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="25"   ID="PathTestDate_25" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="25" FIELD="PathTest" 
                                                ID="PathTest_25" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="25" FIELD="PathResult" 
                                                ID="PathResult_25" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="25" FIELD="PathNotes" ID="PathTestNotes_25" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="25" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_25" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon25" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow5_6" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="51" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_51" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="51"   ID="PathTestDate_51" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="51" FIELD="PathTest" 
                                                ID="PathTest_51" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="51" FIELD="PathResult" 
                                                ID="PathResult_51" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="51" FIELD="PathNotes" ID="PathTestNotes_51" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="51" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_51" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon61" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow5_7" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="52" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_52" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="52"   ID="PathTestDate_52" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="52" FIELD="PathTest" 
                                                ID="PathTest_52" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="52" FIELD="PathResult" 
                                                ID="PathResult_52" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="52" FIELD="PathNotes" ID="PathTestNotes_52" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="52" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_52" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon57" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow5_8" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="53" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_53" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="53"   ID="PathTestDate_53" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="53" FIELD="PathTest" 
                                                ID="PathTest_53" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="53" FIELD="PathResult" 
                                                ID="PathResult_53" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="53" FIELD="PathNotes" ID="PathTestNotes_53" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="53" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_53" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon58" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow5_9" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="54" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_54" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="54"   ID="PathTestDate_54" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="54" FIELD="PathTest" 
                                                ID="PathTest_54" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="54" FIELD="PathResult" 
                                                ID="PathResult_54" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="54" FIELD="PathNotes" ID="PathTestNotes_54" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="54" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_54" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon59" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow5_10" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="55" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_55" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="55"   ID="PathTestDate_55" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="55" FIELD="PathTest" 
                                                ID="PathTest_55" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="55" FIELD="PathResult" 
                                                ID="PathResult_55" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="55" FIELD="PathNotes" ID="PathTestNotes_55" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="55" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_55" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon60" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr ><td colspan="5" height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathTestHTMLRow5');" /></td></tr>
                                    </table>
                                </td>                           
                            </tr>
                        </table><br />
                    </td>      
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PathHTMLRow5'));clearInputFields($('PathStageHTMLRow5'));"  style="float: right; cursor: pointer;" /></td>
                </tr>
                
                <tr style="display: none; white-space: nowrap; vertical-align: top" id="SpineMetsDiagTr3"  runat="server">
                    <td>
                        <table width="500" border="0" cellpadding="2" cellspacing="0" class="ClinicalEformTable">
                        <tr align="center" valign="middle">
                            <td class="controlBoxDataGridHeaderFirstCol">Date</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Histology</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Sec<br />Histology</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Path#</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Prim<br />Disease</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Specimen<br />Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Pathologist</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px;">Initial<br />Diag.Date</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Disease</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Status</td>
                            <td class="ClinicalEformPopulatedRow" id="statusPrimDiagnosisLbl6" runat="server" 
                                style="text-align: left; display: none;  font:11px;">Prim.Origin<br />to Spine</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Notes</td>
                            <td class="ClinicalEformPopulatedRow" style=" font:11px; text-align:left;">Data<br />Qlty</td>
                        </tr>
                        <tr id="PathHTMLRow6" style="white-space: nowrap;">
                                <td><euc:EformTextBox Width="70px" Table="Pathology" RecordId="6" Field="PathDateText" ID="PathDateText_6" runat="server" ShowCalendar="true" 
                                        CalcDate="true" />
                                    <euc:EformHidden Table="Pathology" Field="PathDate" RecordId="6" ID="PathDate_6" runat="server" /></td>
                                <td><euc:EformComboBox Width="100px" Table="Pathology" Field="PathHistology" RecordId="6" ID="PathHistology_6" 
                                        LookupCode="PathHistology" runat="server" DropDownWidth="350px" /></td>
                                <td><euc:EformComboBox Width="60px" Table="Pathology" Field="PathHistology2" RecordId="6" ID="PathHistology2_6" 
                                    LookupCode="PathHistology" runat="server" DropDownWidth="350px" /></td>
                                <td><euc:EformTextBox Table="Pathology" RecordId="6" Field="PathNum" ID="PathNum_6" runat="server" MaxLength="50" 
                                    Width="70px" /></td>
                                <td><euc:EformComboBox Table="Pathology" Field="PathDisease" RecordId="6" runat="server" ID="PathDisease_6" 
                                    Style="width: 70px" LookupCode="Disease,Disease,Spine" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformTextBox Width="70px"  TABLE="Pathology" RecordId="6" FIELD="PathSpecimenType" 
                                    ID="PathSpecimenType_6" Runat="server" /></td>
                                 <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="6" FIELD="Pathologist" 
                                    ID="Pathologist_6" Runat="server" LookupCode="Pathologist" /></td>
                                <td><euc:EformComboBox ID="PathInstitution_6" RecordId="6" Table="Pathology" Field="PathInstitution" runat="server" Style="width: 80px;" 
                                        LookupCode="Institution" /></td>
                                <td><euc:EformTextBox Table="Pathology" RecordId="6" Field="PathNotes" ID="PathNotes_6" runat="server" ShowTextEditor="true" MaxLength="8000" 
                                        Width="60px" /></td>
                                <td><euc:EformDropDownList Table="Pathology" RecordId="6" Field="PathQuality" ID="PathQuality_6" runat="server" LookupCode="DataQuality" 
                                        Style="width: 60px;" /></td>
                                <td colspan="7">
                                    <table class="ClinicalEformTable" style=" outline:gray solid 1px;">
                                        <tr>
                                            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" Style="width: 70px;" RecordId="6" Table="Status" 
                                                Field="StatusDateText" runat="server" ID="StatusDateText_6" />
                                                <euc:EformHidden RecordId="6" Table="Status" Field="StatusDate" runat="server" ID="StatusDate_6" /></td>
                                            <td><euc:EformComboBox RecordId="6" Table="Status" Field="StatusDisease" runat="server" ID="StatusDisease_6" 
                                                Style="width: 70px;" LookupCode="Disease,Disease,Spine" /></td>
                                            <td><euc:EformTextBox RecordId="6" Table="Status" Field="Status" runat="server" ID="Status_6" Style="width: 90px;" 
                                                ReadOnly="true" /></td>
                                            <td  id="StatusPrimDiagnosisCol6" runat="server" style="display: none;">
                                                <euc:EformComboBox Table="NoTable" Field="StatusDiseaseOrigin6" runat="server" ID="StatusDiseaseOrigin6" 
                                                    Style="width: 70px" LookupCode="Disease,Disease,Spine" /></td>
                                            <td><euc:EformTextBox RecordId="6" Style="width: 60px;" ShowTextEditor="true" Table="Status" Field="StatusNotes" 
                                                runat="server" ID="StatusNotes_6" ReadOnly="true" /></td>
                                            <td><euc:EformDropDownList RecordId="6" Style="width: 60px;" Table="Status" Field="StatusQuality" runat="server" 
                                                ID="StatusQuality_6" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon36" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr></table></td>
                            </tr>
                            <tr style=" height:20px; vertical-align:middle; text-align: center;">
                                <td class="controlBoxDataGridHeaderFirstCol">Path Grade</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Disease</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="controlBoxDataGridHeaderFirstCol">PathTest<br />Date</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Path Test</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Result</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Data<br />Qlty</td>
                                <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                            </tr>
                            <tr id="PathStageHTMLRow6" valign="top" align="center">
                                <td><euc:EformComboBox Table="PathologyStageGrade" RecordId="6" Field="PathGrade" ID="PathGrade_6" 
                                    runat="server" Width="70px" LookupCode="PathGrade,Disease,Spine" DropDownWidth="200px" /></td>
                                <td><euc:EformComboBox Table="PathologyStageGrade" RecordId="6" Field="PathStageDisease" 
                                    ID="PathStageDisease_6" LookupCode="ClinStageDisease" runat="server" Width="100px" /></td>
                                <td><euc:EformDropDownList Table="PathologyStageGrade" RecordId="6" Field="PathQuality" runat="server" 
                                    ID="PathGradeQuality_6" Width="80px" LookupCode="DataQuality" /></td>     
                                <td class="controlBoxDataGridValueColumn" colspan="6">
                                    <table id="PathTestHTMLRow6" >
                                        <tr id="PathTestHTMLRow6_1">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="26" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_26" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="26"   ID="PathTestDate_26" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="26" FIELD="PathTest" 
                                                ID="PathTest_26" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="26" FIELD="PathResult" 
                                                ID="PathResult_26" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="26" FIELD="PathNotes" ID="PathTestNotes_26" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="26" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_26" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon26" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>  
                                        <tr id="PathTestHTMLRow6_2" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="27" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_27" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="27"   ID="PathTestDate_27" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="27" FIELD="PathTest" 
                                                ID="PathTest_27" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="27" FIELD="PathResult" 
                                                ID="PathResult_27" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="27" FIELD="PathNotes" ID="PathTestNotes_27" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="27" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_27" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon27" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr> 
                                        <tr id="PathTestHTMLRow6_3" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="28" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_28" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="28"   ID="PathTestDate_28" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="28" FIELD="PathTest" 
                                                ID="PathTest_28" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="28" FIELD="PathResult" 
                                                ID="PathResult_28" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="28" FIELD="PathNotes" ID="PathTestNotes_28" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="28" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_28" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon28" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow6_4" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="29" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_29" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="29"   ID="PathTestDate_29" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="29" FIELD="PathTest" 
                                                ID="PathTest_29" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="29" FIELD="PathResult" 
                                                ID="PathResult_29" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="29" FIELD="PathNotes" ID="PathTestNotes_29" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="29" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_29" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon29" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow6_5" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="30" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_30" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="30"   ID="PathTestDate_30" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="30" FIELD="PathTest" 
                                                ID="PathTest_30" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="30" FIELD="PathResult" 
                                                ID="PathResult_30" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="30" FIELD="PathNotes" ID="PathTestNotes_30" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="30" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_30" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon30" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow6_6" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="56" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_56" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="56"   ID="PathTestDate_56" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="56" FIELD="PathTest" 
                                                ID="PathTest_56" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="56" FIELD="PathResult" 
                                                ID="PathResult_56" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="56" FIELD="PathNotes" ID="PathTestNotes_56" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="56" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_56" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon66" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow6_7" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="57" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_57" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="57"   ID="PathTestDate_57" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="57" FIELD="PathTest" 
                                                ID="PathTest_57" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="57" FIELD="PathResult" 
                                                ID="PathResult_57" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="57" FIELD="PathNotes" ID="PathTestNotes_57" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="57" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_57" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon62" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow6_8" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="58" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_58" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="58"   ID="PathTestDate_58" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="58" FIELD="PathTest" 
                                                ID="PathTest_58" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="58" FIELD="PathResult" 
                                                ID="PathResult_58" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="58" FIELD="PathNotes" ID="PathTestNotes_58" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="58" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_58" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon63" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow6_9" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="59" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_59" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="59"   ID="PathTestDate_59" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="59" FIELD="PathTest" 
                                                ID="PathTest_59" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="59" FIELD="PathResult" 
                                                ID="PathResult_59" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="59" FIELD="PathNotes" ID="PathTestNotes_59" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="59" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_59" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon64" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr id="PathTestHTMLRow6_10" style="display:none;">
                                            <td><euc:EformTextBox  Width="70px" TABLE="PathTest" RecordId="60" FIELD="PathDateText" 
                                                Runat="server" ID="PathTestDateText_60" ShowCalendar="true" CalcDate="true"/>
	                                            <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="60"   ID="PathTestDate_60" Runat="server"/> </td>
	                                        <td><euc:EformComboBox Width="80px"  TABLE="PathTest" RecordId="60" FIELD="PathTest" 
                                                ID="PathTest_60" Runat="server" LookupCode="PathTest" /></td>
                                            <td><euc:EformComboBox Width="65px"  TABLE="PathTest" RecordId="60" FIELD="PathResult" 
                                                ID="PathResult_60" Runat="server" LookupCode="PathTestResult"/></td>
                                            <td><euc:EformTextBox  TABLE="PathTest" RecordId="60" FIELD="PathNotes" ID="PathTestNotes_60" 
                                                Runat="server" ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
                                            <td><euc:EformDropDownList  TABLE="PathTest" RecordId="60" FIELD="PathQuality" Runat="server" 
                                                ID="PathTestQuality_60" LookupCode="DataQuality" /></td>
                                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon65" runat="server" ToolTip="Clear all fields" 
                                                style="cursor:pointer;"/></td>
                                        </tr>
                                        <tr ><td colspan="5" height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathTestHTMLRow6');" /></td></tr>
                                    </table>
                                </td>                           
                            </tr>
                         
                        </table>
                    </td>      
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PathHTMLRow6'));clearInputFields($('PathStageHTMLRow6'));"  style="float: right; cursor: pointer;" /></td>
                </tr>
            </table>
            <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'SpineMetsDiagTbl');" /><br />
            <br />
        </td>
    </tr>
</table>

<script type="text/javascript">
    //update path dates, dataquality to Status
    function addDataEvents(pathDate, pathDateTxt, pathQlty, statusDate, statusDateTxt, status,statusQlty) 
    {
        $(pathDateTxt).addEvent('blur', curry(DataAutoPopulate, pathDate, pathDateTxt, pathQlty, statusDate, statusDateTxt, status, statusQlty));
        $(pathQlty).addEvent('blur', curry(DataAutoPopulate, pathDate, pathDateTxt, pathQlty, statusDate, statusDateTxt, status, statusQlty));
    }

    addDataEvents($('<%= PathDate_1.ClientID %>'), $('<%= PathDateText_1.ClientID %>'), $('<%= PathQuality_1.ClientID %>'), $('<%= StatusDate_1.ClientID %>'), $('<%= StatusDateText_1.ClientID %>'), $('<%= Status_1.ClientID %>'), $('<%= StatusQuality_1.ClientID %>'));
    addDataEvents($('<%= PathDate_2.ClientID %>'), $('<%= PathDateText_2.ClientID %>'), $('<%= PathQuality_2.ClientID %>'), $('<%= StatusDate_2.ClientID %>'), $('<%= StatusDateText_2.ClientID %>'), $('<%= Status_2.ClientID %>'), $('<%= StatusQuality_2.ClientID %>'));
    addDataEvents($('<%= PathDate_3.ClientID %>'), $('<%= PathDateText_3.ClientID %>'), $('<%= PathQuality_3.ClientID %>'), $('<%= StatusDate_3.ClientID %>'), $('<%= StatusDateText_3.ClientID %>'), $('<%= Status_3.ClientID %>'), $('<%= StatusQuality_3.ClientID %>'));

    addDataEvents($('<%= PathDate_4.ClientID %>'), $('<%= PathDateText_4.ClientID %>'), $('<%= PathQuality_4.ClientID %>'), $('<%= StatusDate_4.ClientID %>'), $('<%= StatusDateText_4.ClientID %>'), $('<%= Status_4.ClientID %>'), $('<%= StatusQuality_4.ClientID %>'));
    addDataEvents($('<%= PathDate_5.ClientID %>'), $('<%= PathDateText_5.ClientID %>'), $('<%= PathQuality_5.ClientID %>'), $('<%= StatusDate_5.ClientID %>'), $('<%= StatusDateText_5.ClientID %>'), $('<%= Status_5.ClientID %>'), $('<%= StatusQuality_5.ClientID %>'));
    addDataEvents($('<%= PathDate_6.ClientID %>'), $('<%= PathDateText_6.ClientID %>'), $('<%= PathQuality_6.ClientID %>'), $('<%= StatusDate_6.ClientID %>'), $('<%= StatusDateText_6.ClientID %>'), $('<%= Status_6.ClientID %>'), $('<%= StatusQuality_6.ClientID %>'));

    function DataAutoPopulate(pathDate, pathDateTxt, pathQlty, statusDate, statusDateTxt, status, statusQlty) 
    {
        if (pathDateTxt.value != '') 
        {
            statusDate.value = pathDate.value;
            statusDateTxt.value = pathDateTxt.value;
            status.value = 'Diagnosis Date';
        }
        else if (pathDateTxt.value == '') 
        {
            statusDate.value = '';
            statusDateTxt.value = '';
            status.value = '';
        }

        if (pathQlty.value != '' && statusDateTxt.value != '') 
        {
            statusQlty.value = pathQlty.value;
        }
        else if (pathQlty.value == '') 
        {
            statusQlty.value = '';
        }
    }

    //update primary path disease to Status
    //populate pathNotes and Status notes on multiple selections
    //1 - when path(prim) and StatusDisease(prim) not null then Diagnosed by Path; else if path(prim) is null then diagnosed by imaging
    function addPrimDiseaseEvents(primPath,primpathDisease,primstatusDateTxt,primstatusDisease,primStatus,primStatusNotes) 
    {
        $(primpathDisease).addEvent('blur', curry(PrimDiseaseAutoPopulate, primPath, primpathDisease, primstatusDateTxt, primstatusDisease, primStatus, primStatusNotes));
        $(primstatusDateTxt).addEvent('blur', curry(PrimDiseaseAutoPopulate, primPath, primpathDisease, primstatusDateTxt, primstatusDisease, primStatus, primStatusNotes));
    }

    addPrimDiseaseEvents($('<%= PathHistology_1.ClientID %>'), $('<%= PathDisease_1.ClientID %>'), $('<%= StatusDateText_1.ClientID %>'), $('<%= StatusDisease_1.ClientID %>'), $('<%= Status_1.ClientID %>'), $('<%= StatusNotes_1.ClientID %>'));
    addPrimDiseaseEvents($('<%= PathHistology_2.ClientID %>'), $('<%= PathDisease_2.ClientID %>'), $('<%= StatusDateText_2.ClientID %>'), $('<%= StatusDisease_2.ClientID %>'), $('<%= Status_2.ClientID %>'), $('<%= StatusNotes_2.ClientID %>'));
    addPrimDiseaseEvents($('<%= PathHistology_3.ClientID %>'), $('<%= PathDisease_3.ClientID %>'), $('<%= StatusDateText_3.ClientID %>'), $('<%= StatusDisease_3.ClientID %>'), $('<%= Status_3.ClientID %>'), $('<%= StatusNotes_3.ClientID %>'));

    function PrimDiseaseAutoPopulate(primPath, primpathDisease, primstatusDateTxt, primstatusDisease, primStatus, primStatusNotes) 
    {
        if (primpathDisease.value != '' && primstatusDateTxt.value != '') 
        {
            primstatusDisease.value = primpathDisease.value;
        }
        else if (primpathDisease.value == '') 
        {
            primstatusDisease.value = '';
        }

        if (primstatusDateTxt.value != '' && primPath.value != '') {
            primStatusNotes.value = 'OR, Primary';
        }
        else if (primstatusDateTxt.value != '' && primPath.value == '') {
            primStatus.value = 'Diagnosis Date';
            primStatusNotes.value = 'Imaging, Primary';
        }
        else if (primstatusDateTxt.value == '') {
            primStatus.value = '';
            primStatusNotes.value = '';
        }
    }

    //update mets path disease to Status disease origin
    //show path prim disease field (in mets) depending on status disease selection (in prim)
    //populate pathNotes and Status notes on multiple selections
    //2 - when StatusDisease(prim) not Spine, then show virtual field to select Disease in path(mets) and Status(mets) to select for Spine mets (other to Spine site) and update accordlying in Notes sections
    //3 - when StatusDisease(prim) is Spine, then option to add either Spine primary or mets (spine to other site) and accordingly in Notes sections
    function addMetsDiseaseEvents(metsPathDisease, metsStatusDateTxt, metsStatusDisease,metsStatusDisOrigin,metsStatusNotes) 
    {
        $(metsPathDisease).addEvent('blur', curry(metsDiseaseAutoPopulate, metsPathDisease, metsStatusDateTxt, metsStatusDisease, metsStatusDisOrigin, metsStatusNotes));

        $(metsStatusDateTxt).addEvent('blur', curry(metsDiseaseAutoPopulate, metsPathDisease, metsStatusDateTxt, metsStatusDisease, metsStatusDisOrigin, metsStatusNotes));
        $(metsStatusDisOrigin).addEvent('blur', curry(metsDiseaseAutoPopulate, metsPathDisease, metsStatusDateTxt, metsStatusDisease, metsStatusDisOrigin, metsStatusNotes));
    }

    addMetsDiseaseEvents($('<%= PathDisease_4.ClientID %>'), $('<%= StatusDateText_4.ClientID %>'), $('<%= StatusDisease_4.ClientID %>'), $('<%= StatusDiseaseOrigin4.ClientID %>'), $('<%= StatusNotes_4.ClientID %>'));
    addMetsDiseaseEvents($('<%= PathDisease_5.ClientID %>'), $('<%= StatusDateText_5.ClientID %>'), $('<%= StatusDisease_5.ClientID %>'), $('<%= StatusDiseaseOrigin5.ClientID %>'), $('<%= StatusNotes_5.ClientID %>'));
    addMetsDiseaseEvents($('<%= PathDisease_6.ClientID %>'), $('<%= StatusDateText_6.ClientID %>'), $('<%= StatusDisease_6.ClientID %>'), $('<%= StatusDiseaseOrigin6.ClientID %>'), $('<%= StatusNotes_6.ClientID %>'));

    function metsDiseaseAutoPopulate(metsPathDisease, metsStatusDateTxt, metsStatusDisease, metsStatusDisOrigin, metsStatusNotes)
    {
        if (metsPathDisease.value != '' && metsPathDisease.value != 'Spine' && metsStatusDateTxt.value != '') {
            metsStatusDisOrigin.value = metsPathDisease.value;
            metsStatusDisease.value = 'Spine';
            metsStatusNotes.value = 'OR, ' + metsStatusDisOrigin.value + ' origin';
        }
        else if (metsPathDisease.value == 'Spine' && metsStatusDateTxt.value != '') {
            metsStatusDisOrigin.value = '';
            metsStatusDisease.value = '';
            metsStatusNotes.value = 'OR, Spine Mets';
        }
        else if (metsPathDisease.value == '' && metsStatusDateTxt.value == '') {
            metsStatusDisOrigin.value = '';
            metsStatusDisease.value = '';
            metsStatusNotes.value = '';
        }

        if (metsPathDisease.value == '' && metsStatusDateTxt.value != '' && metsStatusDisOrigin.value !='') {
            metsStatusNotes.value = 'Imaging, ' + metsStatusDisOrigin.value + ' origin';
        }
        else if (metsPathDisease.value == '' && metsStatusDateTxt.value != '' && metsStatusDisOrigin.value == '') {
            metsStatusNotes.value = 'Imaging, Spine Mets';
        }
    }


    function showHideStatusOrigin(primStatusDisease, metsStatusDiseaseOriginLbl, metsStatusDiseaseOriginCol, metsStatusDiseaseOrigin) 
    {
        $(primStatusDisease).addEvent('blur', curry(showHidePopulates, primStatusDisease, metsStatusDiseaseOriginLbl, metsStatusDiseaseOriginCol, metsStatusDiseaseOrigin));
    }

    showHideStatusOrigin($('<%= StatusDisease_1.ClientID %>'), $('<%= statusPrimDiagnosisLbl4.ClientID %>'), $('<%= StatusPrimDiagnosisCol4.ClientID %>'), $('<%= StatusDiseaseOrigin4.ClientID %>'));
    showHideStatusOrigin($('<%= StatusDisease_2.ClientID %>'), $('<%= statusPrimDiagnosisLbl5.ClientID %>'), $('<%= StatusPrimDiagnosisCol5.ClientID %>'), $('<%= StatusDiseaseOrigin5.ClientID %>'))
    showHideStatusOrigin($('<%= StatusDisease_3.ClientID %>'), $('<%= statusPrimDiagnosisLbl6.ClientID %>'), $('<%= StatusPrimDiagnosisCol6.ClientID %>'), $('<%= StatusDiseaseOrigin6.ClientID %>'));

    function showHidePopulates(primStatusDisease, metsStatusDiseaseOriginLbl, metsStatusDiseaseOriginCol, metsStatusDiseaseOrigin) 
    {
        if (primStatusDisease.value != '' && primStatusDisease.value != 'Spine') {
            metsStatusDiseaseOriginLbl.style.display = 'block';
            metsStatusDiseaseOriginCol.style.display = 'block';

        }
        else if (primStatusDisease.value == '' || primStatusDisease.value == 'Spine') {
            metsStatusDiseaseOrigin.value = '';
            metsStatusDiseaseOriginLbl.style.display = 'none';
            metsStatusDiseaseOriginCol.style.display = 'none';
        }
    }
    
</script>