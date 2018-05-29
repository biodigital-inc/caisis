<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.AdditionalResectionColorectal" CodeFile="AdditionalResectionColorectal.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    function additionalDates()
	 {
	    var procDt = $('<%= ProcDateText_4.ClientID %>').value;
	    if(procDt != '')
	    {
	        $('<%= PathDateText_4.ClientID %>').value = procDt;
	        $('<%= PathDate_4.ClientID %>').value = $('<%= ProcDate_4.ClientID %>').value;	        
	    }
	    else
	    {
	        $('<%= PathDateText_4.ClientID %>').value = '';
	        $('<%= PathDate_4.ClientID %>').value = '';
	    }
	 }
	 
	 function additionalInst()
	 {
	    var procInst = $('<%= ProcInstitution_4.ClientID %>').value;
	    if(procInst != '')
	    {
	        $('<%= PathInstitution_4.ClientID %>').value = procInst;        
	    }
	    else
	    {
	        $('<%= PathInstitution_4.ClientID %>').value = '';
	    }
	 }
	 
	 function additionalQlty()
	 {
	    var procQlty = $('<%= ProcQuality_4.ClientID %>').value;
	    if(procQlty != '')
	    {
	        $('<%= PathQuality_4.ClientID %>').value = procQlty;        
	    }
	    else
	    {
	        $('<%= PathQuality_4.ClientID %>').value = '';
	    }
	 }
	 
	 function clearPathStageT_4()
	 {
	    clearInputFields($('PathStageT_4Td'));
        $('<% = PathStageDisease_4.ClientID %>').disabled = true;
	 }
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="AdditionalResectionColorectal" /><span class="controlBoxTitle">Additional Resection</span> <br/>

<table width="650" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="OtherResectionsTbl">
    <tr>
        <td>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OtherProcTbl">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Site</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Institution</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Quality</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>  
              <tr>
                <td><euc:EformTextBox  Width="80px" RecordId="4"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_4" Runat="server" ShowCalendar="true" CalcDate="true"  AppendToOnChange="UpdateAssociatedDate(this); additionalDates();" />
	            <euc:EformHidden  RecordId="4"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_4"     Runat="server"/></td>
	            <td align="center"><euc:EformComboBox Width="70px" RecordId="4"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_4" 
	                LookupCode="ProcName" Runat="server"/></td>
	            <td align="center"><euc:EformComboBox Width="70px" RecordId="4"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_4" 
	                LookupCode="Physician" Runat="server"/></td>
	            <td align="center"><euc:EformSelect style="width:70px;" RecordId="4"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_4" 
	                LookupCode="DxTarget" Runat="server"/></td> 
	            <td align="center">
	                <euc:EformDropDownList RecordId="4" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_4" Runat="server" 
	                    onblur="additionalInst();">
                        <asp:ListItem Value="" Text=""></asp:ListItem>
                        <asp:ListItem Value="MSKCC" Text="MSKCC"></asp:ListItem>
                        <asp:ListItem Value="Outside" Text="Outside"></asp:ListItem>
                    </euc:EformDropDownList></td>   
	            <td align="center">
	                <euc:EformDropDownList Table="Procedures"  RecordId="4" Field="ProcQuality" id="ProcQuality_4" runat="server" 
	                    onblur="additionalQlty();" >
                        <asp:ListItem Value="" Text=""></asp:ListItem>
                        <asp:ListItem Value="STD" Text="MSKCC"></asp:ListItem>
                        <asp:ListItem Value="OUT" Text="Outside"></asp:ListItem>
                    </euc:EformDropDownList></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
            </table><br />

            <span class="controlBoxDataGridHeader">Pathology</span> <br/>
            <table width="650" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OtherPrimPathTbl">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Histology</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Path #</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Site</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Result</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr> 
              <tr>
                <td><euc:EformTextBox RecordId="4" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_4" Runat="server" Width="80px" 
                    ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden  RecordId="4" TABLE="Pathology" FIELD="PathDate" ID="PathDate_4" Runat="server" /></td>
                <td align="center"><euc:EformComboBox Field="PathHistology" Table="Pathology" RecordId="4" id="PathHistology_4" runat="server" 
                    LookupCode="ColorectalPathHistology" DropDownWidth="300px" /></td>
	            <td align="center"><euc:EformTextBox Runat="server" ID="PathNum_4" Table="Pathology" RecordId="4" FIELD="PathNum" Width="80"/></td>
	            <td align="center"><euc:EformDropDownList Field="PathSite" Table="Pathology" RecordId="4" id="PathSite_4" runat="server" 
	                Width="95" LookupCode="ColorectalPathSite" /></td>
                <td align="center"><euc:EformDropDownList Table="Pathology" RecordId="4" Field="PathResult" id="PathResult_4" runat="server" 
                                        Width="90">
                                        <asp:ListItem Value="" Text=""  />
                                        <asp:ListItem Value="Malignant" Text="Malignant"  />
                                        <asp:ListItem Value="Premalignant" Text="Premalignant"  />
                                        <asp:ListItem Value="Non neoplastic" Text="Non neoplastic"  />
                                        <asp:ListItem Value="Unknown" Text="Unknown"  />
                                      </euc:EformDropDownList>
                      <euc:EformTextBox Table="Pathology" RecordId="4" Field="PathQuality" id="PathQuality_4" runat="server" 
                         style="display:none;width:1px;"/>
                    <euc:EformTextBox Table="Pathology" RecordId="4" Field="PathInstitution" id="PathInstitution_4" runat="server" 
                         style="display:none;width:1px;"/></td>  
                <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>  
              </tr>
           </table><br />
           
           <span class="controlBoxDataGridHeader">Colorectal Pathology</span> <br/>
            <table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OtherPrimColoPathTbl">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; padding-right:30px;">Disease Extent</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">ICD Code</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr> 
              <tr> 
                <td><euc:EformExtendedCheckBoxList Table="ColorectalPath" RecordId="3" Field="PathDiseaseExtent" LookupCode="ColorectalDiseaseExtent"
                     id="PathDiseaseExtent_3" RepeatLayout="Table" RepeatDirection="Horizontal" RepeatColumns="2" runat="server"/></td>
                <td align="center" valign="top"><euc:EformTextBox Runat="server" ID="PathICD9_Code_3" Table="ColorectalPath" RecordId="3" 
                    FIELD="PathICD9_Code" Width="100px"/></td>
                <td valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr> 
           </table><br />
           
           <span class="controlBoxDataGridHeader">Colorectal Pathology Findings</span> <br/>
            <table width="650" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="OtherPrimColoPathFindTbl">
                <tr>
                    <td>
                    <table>
                      <tr> 
                        <td style="font-weight:bold; font-size:12px">Configuration</td>
                        <td align="left"><euc:EformSelect Table="ColorectalPathFinding" RecordId="4" Field="PathFindConfiguration" 
                            id="PathFindConfiguration_4" runat="server" LookupCode="PolypGrossConfig,Disease,Colorectal" 
                            style="width:85px;" DropDownWidth="250px" DropDownHeight="auto" /></td>
                        <td style="font-weight:bold;font-size:12px">Tumor Max Dim (cm)</td>
                        <td align="left"><euc:EformTextBox Runat="server" ID="PathFindTumorMaxDim_4" Table="ColorectalPathFinding" RecordId="4" 
                            FIELD="PathFindTumorMaxDim" style="width:80px;"  ShowNumberPad="true" class="InputText" /></td>
                        
                        <td style="font-weight:bold;font-size:12px" >Grade</td>
                        <td align="left"><euc:EformSelect Table="ColorectalPathFinding"  RecordId="4" Field="PathFindGrade" 
                            LookupCode="ColorectalGrade" id="PathFindGrade_4" runat="server" style="width:85px;" DropDownHeight="auto"/></td>    
                      </tr>
                      <tr><td></td></tr>
                      <tr>      
                        <td style="font-weight:bold;font-size:12px">Proximal Margin</td>
                        <td align="left"><euc:EformDropDownList Table="ColorectalPathFinding"  RecordId="4" Field="PathFindProximalMargin" 
                            id="PathFindProximalMargin_4" runat="server" Width="100px">
                                <asp:ListItem Text="" Value="" />
                                <asp:ListItem Text="Uninvolved" Value="Uninvolved" />
                                <asp:ListItem Text="Close (<2mm/1hpf)" Value="Close (<2mm/1hpf)" />
                                <asp:ListItem Text="Involved/Positive" Value="Involved/Positive" />
                                <asp:ListItem Text="Not Evaluated" Value="Not Evaluated" />
                                <asp:ListItem Text="Non applicable" Value="Non applicable" />                        
                              </euc:EformDropDownList></td>
                        <td style="font-weight:bold;font-size:12px">Lateral Margin</td>
                        <td align="left"><euc:EformDropDownList Table="ColorectalPathFinding"  RecordId="4" Field="PathFindLateralMargin" 
                            id="PathFindLateralMargin_4" runat="server" Width="100px"  >
                                <asp:ListItem Text="" Value="" />
                                <asp:ListItem Text="Uninvolved" Value="Uninvolved" />
                                <asp:ListItem Text="Involved, Dysplasia" Value="Involved, Dysplasia" />
                                <asp:ListItem Text="Involved, Malignancy" Value="Involved, Malignancy" />
                                <asp:ListItem Text="Close (<2m 1hpf)" Value="Close (<2m 1hpf)" />
                                <asp:ListItem Text="Not Evaluated / Unknown" Value="Not Evaluated / Unknown" />
                           </euc:EformDropDownList></td>
                        <td style="font-weight:bold;font-size:12px">Distal Margin</td>
                        <td align="left"><euc:EformDropDownList Table="ColorectalPathFinding"  RecordId="4" Field="PathFindDistalMargin" 
                            id="PathFindDistalMargin_4" runat="server" Width="100px" >
                                <asp:ListItem Text="" Value="" />
                                <asp:ListItem Text="Uninvolved" Value="Uninvolved" />
                                <asp:ListItem Text="Involved, Dysplasia" Value="Involved, Dysplasia" />
                                <asp:ListItem Text="Involved, Malignancy" Value="Involved, Malignancy" />
                                <asp:ListItem Text="Close (<2m 1hpf)" Value="Close (<2m 1hpf)" />
                                <asp:ListItem Text="Not Evaluated / Unknown" Value="Not Evaluated / Unknown" />
                           </euc:EformDropDownList></td>   
                      </tr>
                      <tr><td></td></tr>
                      <tr>      
                        <td style="font-weight:bold;font-size:12px">Lymphovascular Inv</td>
                        <td align="left"><euc:EformDropDownList Table="ColorectalPathFinding"  RecordId="4" Field="PathFindVascularInv" 
                            LookupCode="ColorectalInvasion"  id="PathFindVascularInv_4" runat="server" Width="100px" /></td>
                        <td style="font-weight:bold;font-size:12px">Perineural Inv</td>
                        <td align="left"><euc:EformDropDownList Table="ColorectalPathFinding"  RecordId="4" Field="PathFindPerineuralInv" 
                            LookupCode="ColorectalInvasion"  id="PathFindPerineuralInv_4" runat="server" Width="100px" /></td>
                      </tr>
                      </table><br />
                        <table>
                        <tr valign="top"> 
                         <td style="font-weight:bold;font-size:12px">Polyps Away from Cancer</td>
                         <td align="left" ><euc:EformTextBox Table="ColorectalPathFinding" RecordId="4" FIELD="PathFindPolypAwayNum" 
                            Runat="server" ID="PathFindPolypAwayNum_4" style="width:60px;"  ShowNumberPad="true" class="InputText"  /></td>
                        </tr>
                  </table>
                    <table>  
                    <tr valign="top"> 
                     <td style="font-weight:bold;font-size:12px; padding-top: 14px;" colspan="2">Polyp Type Away from Cancer</td>
                    </tr>
                    <tr valign="top">  
                    <td style="font-weight:bold;" id="PathFindPolypAwayType_4Td"><euc:EformExtendedRadioButtonList ShowOther="true" Table="ColorectalPathFinding" 
                        LookupCode="ColorectalPolypType" RecordId="4" Field="PathFindPolypAwayType" id="PathFindPolypAwayType_4" 
                        RepeatLayout="Table" RepeatDirection="Horizontal" RepeatColumns="4" CellPadding="0" runat="server"  /></td> 
                    <td style="vertical-align: top; padding-top: 9px; padding-left: 7px;"><img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('PathFindPolypAwayType_4Td'));"  style="cursor: pointer; margin-left: 20px; vertical-align: middle;" /></td>
                  </tr>
                  </table><br />
                    <table>
                    <tr valign="top">
                        <td style="font-weight:bold;font-size:12px" colspan="2">Polyp Pre-Existing</td>
                        <td ><euc:EformDropDownList  Table="ColorectalPathFinding"  RecordId="4" Field="PathFindPolypPreExisting" 
                            LookupCode="YesNoUnknown" id="PathFindPolypPreExisting_4" runat="server"  /></td>                
                        <td style="font-weight:bold;font-size:12px; padding-left: 20px;" colspan="2"># of Pre-Existing Polyps</td>
                        <td style="font-weight:bold;font-size:12px" ><euc:EformTextBox Runat="server" ID="PathFindPolypPreExistingNum_4" 
                            Table="ColorectalPathFinding" RecordId="4" FIELD="PathFindPolypPreExistingNum" style="width:60px;" ShowNumberPad="true" 
                            class="InputText"  /></td>
                    </tr>    
                  </table>
                    <table>              
                    <tr>
                        <td  colspan="2" style="font-weight:bold;font-size:12px; padding-top: 14px;" valign="top">Pre-Existing Polyp Type</td>
                    </tr>
                    <tr>
                        <td style="font-weight:bold;" id="PathFindPolypPreExistingType_4Td"><euc:EformExtendedRadioButtonList ShowOther="true" Table="ColorectalPathFinding" 
                        LookupCode="ColorectalPolypType" RecordId="4" Field="PathFindPolypPreExistingType" id="PathFindPolypPreExistingType_4" 
                        RepeatLayout="Table" RepeatDirection="Horizontal" RepeatColumns="4" CellPadding="0" runat="server"  /></td>
                    <td style="vertical-align: top; padding-top: 9px; padding-left: 7px;"><img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('PathFindPolypPreExistingType_4Td'));"  style="cursor: pointer; margin-left: 20px; vertical-align: middle;" /></td>
                  </tr>
                  </table>
                </td>
                </tr>               
            </table><br />
           
           <span class="controlBoxDataGridHeader">Pathology Node Findings</span> <br/>
            <table width="350" cellpadding="0" cellspacing="0" class="ClinicalEformTable" id="OtherPrimNodeFindTbl">
                <tr style=" padding-top:10px;">
	                <td style="width: 30%">&nbsp;</td>
	                <td style="width: 29%">
    	            <strong style="font-size: smaller;"># Positive Nodes</strong>
	                </td>
	                <td style="width: 6%">&nbsp;</td>
	                <td style="width: 35%">
    	            <strong style="font-size: smaller;">Total # Nodes</strong>
	                </td>
	            </tr>
	            <tr style="padding-bottom:10px;">
	                <td><strong>Lymph Nodes</strong></td>
	                <td>
    	            <euc:EformTextBox Runat="server" ID="PathFindPosNodes_2" Table="NodePathFinding" RecordId="2"  FIELD="PathFindPosNodes"  
    	                style="width:70px;"  ShowNumberPad="true" class="InputText"  /> 
	                </td>
	                <td style="font-weight: bold; font-size: larger;">/</td>
	                <td>
    	            <euc:EformTextBox Runat="server" ID="PathFindNumNodes_2" Table="NodePathFinding" RecordId="2"  FIELD="PathFindNumNodes"  
    	                style="width:70px;"  ShowNumberPad="true" class="InputText"  /> 
	                </td>
	            </tr>
            </table><br />
            
            <span><strong>Notes for this Resection</strong></span> <br/>
            <table width="550" cellpadding="0" cellspacing="0" border="0" id="OtherPrimNotesTbl">
                <tr>
                    <td><euc:EformTextArea Table="Pathology"  RecordId='4' FIELD="PathNotes" style="width: 550px;" Runat="server" ID="ProcNotes_4" 
                    ShowTextEditor="true" Height="50px"/></td>
                </tr>
            </table><br />
            
            <span class="controlBoxDataGridHeader">Pathologic TNM Staging (If resected)</span> <br/>
            <table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OtherPrimPathStageTbl">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; width:40%">T Stage<img src="../../Images/EFormDeleteRow.gif" onclick="clearPathStageT_4();"  style="cursor: pointer; margin-left: 10px; vertical-align: middle;" /></td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; width:30%">N Stage<img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PathStageN_4Td'));"  style="cursor: pointer; margin-left: 10px; vertical-align: middle;" /></td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; width:30%">M Stage<img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PathStageM_4Td'));"  style="cursor: pointer; margin-left: 10px; vertical-align: middle;" /></td>
              </tr> 
              <tr> 
                <td width="40%" class="ClinicalEformGridColumnOne" id="PathStageT_4Td"><euc:EformHidden Table="PathologyStageGrade" RecordId="4" 
                    Field="PathStageDisease" id="PathStageDisease_4" runat="server" Value="Colorectal" />
                    <euc:EformRadioButtonList LookupCode="StagePath_Colorectal_02_T" Table="PathologyStageGrade" RecordId="4" Field="PathStageT" 
		                id="PathStageT_4" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="0" runat="server" 
		                EnableHiddenOnUIEvent="PathStageDisease_4" /></td>
                <td width="30%" id="PathStageN_4Td"><euc:EformRadioButtonList LookupCode="StagePath_Colorectal_02_N" Table="PathologyStageGrade" RecordId="4" 
                    Field="PathStageN" id="PathStageN_4" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="0" runat="server" 
	                EnableHiddenOnUIEvent="PathStageDisease_4" /></td>
                <td width="30%" class="ClinicalEformGridColumnOne" id="PathStageM_4Td"><euc:EformRadioButtonList LookupCode="StagePath_Colorectal_02_M" 
                    Table="PathologyStageGrade" RecordId="4" Field="PathStageM" id="PathStageM_4" RepeatLayout="Table" RepeatDirection="Horizontal" 
                    CellPadding="0" runat="server" EnableHiddenOnUIEvent="PathStageDisease_4" /></td>
              </tr> 
           </table>    
        </td>
    </tr>
</table>