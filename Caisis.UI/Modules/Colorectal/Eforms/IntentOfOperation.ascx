<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.IntentOfOperation" CodeFile="IntentOfOperation.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" language="javascript">
    function clearProcDetails()
    {
        clearLists($('<%= ProcIntent.ClientID %>'));
        clearLists($('<%= ProcTumorObstruction.ClientID %>'));
        clearLists($('<%= ProcPerforation.ClientID %>'));
        clearElementsInParentRow($('NeoAdjTR'));
        clearLists($('<%= RadTxNotes.ClientID %>'));
        clearLists($('<%= MedTxNotes.ClientID %>'));
        clearElementsInParentRow($('SyncResTR'));
        clearLists($('<%= ProcDiseaseExtent.ClientID %>'));
        clearElementsInParentRow($('typeTR'));
        clearLists($('<%= ResectProcCompleteResection.ClientID %>'));
        clearElementsInParentRow($('BrachyTR'));
        clearElementsInParentRow($('NotesTR'));
        
        clearElementsInParentRow($('LowerAnalVergeTR'));
        clearLists($('<%= ProcRectalLocation.ClientID %>'));
        clearLists($('<%= ProcRectalExamPreOp.ClientID %>'));
        clearElementsInParentRow($('PreOpERTR'));        
        clearLists($('<%= ClinStageT.ClientID %>'));
        clearLists($('<%= ClinStageN.ClientID %>'));
        clearLists($('<%= ProcAPR_PreOp.ClientID %>'));
        clearLists($('<%= ProcAPR_IntraOp.ClientID %>'));
        
        clearLists($('<%= ProcAnast.ClientID %>'));
        clearLists($('<%= ProcAnatomy.ClientID %>'));
        clearLists($('<%= ProcSplenicFlexure.ClientID %>'));
        clearLists($('<%= ProcProximalTransection.ClientID %>'));
        clearLists($('<%= ProcArteryLigation.ClientID %>'));
        clearLists($('<%= ProcIntraSphinctericDissection.ClientID %>'));
        clearElementsInParentRow($('AnastamosisTR1'));
        clearElementsInParentRow($('AnastamosisTR2'));
        
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
    
    function clearRadTx()
    {
        clearInputFields($('radTxTd'));
        $('<% =RadTxIndication.ClientID %>').disabled = true;
        $('<% =RadTxIntent.ClientID %>').disabled = true;
    }
    
    function clearMedTx()
    {
        clearInputFields($('medTxTd'));
        $('<% =MedTxIndication.ClientID %>').disabled = true;
        $('<% =MedTxIntent.ClientID %>').disabled = true;
    }
    
    function clearPreOpUS()
    {
        clearInputFields($('PreOpERUltrasoundTable'));
        $('<% =DxType.ClientID %>').disabled = true;
        $('<% =DxTarget.ClientID %>').disabled = true;
        $('<% =DxDateText.ClientID %>').disabled = true;
        $('<% =DxDate.ClientID %>').disabled = true;
        $('<% =ClinStageDisease.ClientID %>').disabled = true;
        $('<% =ClinStageSystem.ClientID %>').disabled = true;
        $('<% =ClinStageDataQuality.ClientID %>').disabled = true;
        $('<% =ClinStageNotes.ClientID %>').disabled = true;
        $('<% =ClinStageDateText.ClientID %>').disabled = true;
        $('<% =ClinStageDate.ClientID %>').disabled = true;
    }
</script>

<a name="IntentOfOperation" id="IntentOfOperation" />
<table id="ProceedtoEndMsgTbl" style="display:none;" runat="server" width="600" >
    <tr>
        <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40" style="font-size:14px; font-weight:bold; padding-top:50px;">Please proceed to the end to Approve the Eform.
        <euc:EformTextBox ID="primProcOtherVal" Table="Procedures" Field="ProcName" RecordId="1" runat="server" style="display:none;width:1px;" />
        <euc:EformTextBox ID="PSMCompleteResection" TABLE="ColorectalProc" FIELD="ProcCompleteResection" RecordId="1" Runat="server" 
            style="display:none;width:1px;" />
        <euc:EformTextBox ID="ResectionRadioTxt" runat="server" Table="NoTable" Field="ResectionRadio" style="display:none;width:1px;"/>
        </td>
    </tr>
</table>


<span class="controlBoxTitle"><asp:Label ID="PrimProcDetailsHdr1" runat="server" Text="Extent of Disease" style="display:none;" /></span>
<table border="0" cellspacing="0" cellpadding="4" width="600" class="eformLargePopulatedTable" id="PrimProcDetailsTbl1" style="display:none;" runat="server">
    <tr>
        <td>
            <table border="0" cellspacing="0" cellpadding="4" width="600" class="ClinicalEformTable" >
                 <tr >
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;border-right:solid 1px white;" >Intent of Operation<img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ProcIntentTd'));"  style="cursor: pointer; margin-left: 20px; vertical-align: middle;" /></td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" >Tumor Obstruction<img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('TumorObstructionTd'));"  style="cursor: pointer; margin-left: 20px; vertical-align: middle;" /></td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; border-left:solid 1px white; font-size: 10px;" >Clinical Perforation<img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ClinicalPerfTd'));"  style="cursor: pointer; margin-left: 4px;  vertical-align: middle;" /></td>
                 </tr>
                 <tr>
                    <td id="ProcIntentTd" class="ClinicalEformGridColumnOne" style="text-align: center;"><euc:EformExtendedRadioButtonList ShowOther="true" Table="ColorectalProc" 
                        Field="ProcIntent" LookupCode="ColorectalIntent" id="ProcIntent" RepeatLayout="Flow" RepeatDirection="Horizontal" Cellspacing="0" 
                        runat="server" /></td>
                    <td id="TumorObstructionTd" style="text-align: center;"><euc:EformRadioButtonList Table="ColorectalProc" Field="ProcTumorObstruction" LookupCode="TumorObstruction" 
                        id="ProcTumorObstruction" RepeatLayout="Flow" RepeatDirection="Horizontal" Cellspacing="0" runat="server" /></td>
                    <td id="ClinicalPerfTd" class="ClinicalEformGridColumnOne" style="text-align: center;"><euc:EformRadioButtonList TABLE="ColorectalProc" FIELD="ProcPerforation" 
                        LookupCode="YesNoUnknown" id="ProcPerforation" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" /></td>
                  </tr>
                </table><br/>

            <table>
                <tr>
                    <td valign="top">
                        <span class="controlBoxTitle" style="font-size:12px;">Neo-Adjuvant Therapy</span><br/>
                        
                        
                        
                        <table id="NeoAdjTable" border="0" cellspacing="0" cellpadding="4" width="375" class="eformLargePopulatedTable">
                            <tr id="NeoAdjTR" >
                                <td id="radTxTd">
                                    <euc:EformHidden Table="RadiationTherapy" Field="RadTxIndication" id="RadTxIndication" Value="Colon Cancer" runat="server" />
                                    <euc:EformHidden Table="RadiationTherapy" Field="RadTxIntent" id="RadTxIntent" Value="Neo-Adjuvant" runat="server" />
                                    <euc:EformCheckBox Table="RadiationTherapy" Field="RadTxType" id="RadTxType" Value="Radiation Therapy, Unspecified" runat="server" 
                                        EnableHiddenOnUIEvent="RadTxIntent,RadTxIndication" />  <strong>Radiation</strong><br />
                                    Clinical Response to therapy:<br />
                                    <euc:EformRadioButtonList LookupCode="ColorectalNeoAdjuvantResponse" Table="RadiationTherapy" Field="RadTxNotes" id="RadTxNotes" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" />
                                    <img src="../../Images/Button_X_Clear.png" onclick="clearLists($('<%= RadTxNotes.ClientID %>'));" style="cursor: pointer; margin-left: 9px;" />
                                </td>
                                <td id="medTxTd">
                                    <euc:EformHidden Table="MedicalTherapy" Field="MedTxIndication" id="MedTxIndication" Value="Colon Cancer" runat="server" />
                                    <euc:EformHidden Table="MedicalTherapy" Field="MedTxIntent" id="MedTxIntent" Value="Neo-Adjuvant" runat="server" />
                                    <euc:EformCheckBox Table="MedicalTherapy" Field="MedTxType" id="MedTxType" Value="Chemo" runat="server" 
                                        EnableHiddenOnUIEvent="MedTxIntent,MedTxIndication" />  <strong>Chemotherapy</strong><br />
                                    Clinical Response to therapy:<br />
                                    <euc:EformRadioButtonList LookupCode="ColorectalNeoAdjuvantResponse"  Table="MedicalTherapy" Field="MedTxNotes" id="MedTxNotes" 
                                        RepeatLayout="Table" RepeatDirection="Vertical" runat="server" />
                                    <img src="../../Images/Button_X_Clear.png" onclick="clearLists($('<%= MedTxNotes.ClientID %>'));" style="cursor: pointer; margin-left: 9px;" />
                                </td>
                            </tr>
                        </table><br/>
                    </td>
                    
                    <td valign="top">
                        <span class="controlBoxTitle" style="font-size:12px;">Synchronous Resection</span><br/>
                       <table border="0" cellspacing="0" cellpadding="4" width="300" class="eformLargePopulatedTable">
                            <tr id="SyncResTR" >
                                <td >
                                    <euc:EformCheckBox Table="ColorectalProc" Field="ProcSynchResectionLiver" id="ProcSynchResectionLiver" Value="True" 
                                        runat="server" />  Liver<br />
                                    <euc:EformCheckBox Table="ColorectalProc" Field="ProcSynchResectionLung" id="ProcSynchResectionLung" Value="True" 
                                        runat="server" />  Lung<br />
                                    <euc:EformCheckBox Table="ColorectalProc" Field="ProcSynchResectionRetroperitonealNodal" 
                                        id="ProcSynchResectionRetroperitonealNodal" Value="True" runat="server" />  Retroperitoneal nodal<br />	
                                    <euc:EformCheckBox Table="ColorectalProc" Field="ProcSynchResectionOvary" id="ProcSynchResectionOvary" Value="True" 
                                        runat="server" />  Ovary<br />
                                    <euc:EformCheckBox Table="ColorectalProc" Field="ProcSynchResectionPeritoneal" id="ProcSynchResectionPeritoneal" 
                                        Value="True" runat="server" />  Peritoneal<br />        
                                    Other: <euc:EformTextBox Table="ColorectalProc" Field="ProcSynchResectionOther" id="ProcSynchResectionOther" 
                                        runat="server"/><br /><br />
                                </td>
                            </tr>
                       </table><br/> 
                    </td>
                </tr>
            </table>

            <table>
                <tr>
                    <td valign="top">
                        <span class="controlBoxTitle" style="font-size:12px;">Disease Extent</span><br/>
                        <table border="0" cellspacing="0" cellpadding="0" width="375" class="eformLargePopulatedTable">
                         <tr >
                            <td style="vertical-align: top;">
                                <table border="0" cellspacing="0" cellpadding="4" width="100%" class="eformLargePopulatedTable">
                                 <tr >
                                    <td >        		
                                        <euc:EformRadioButtonList LookupCode="ColorectalDiseaseExtent" Table="ColorectalProc" 
                                            Field="ProcDiseaseExtent" id="ProcDiseaseExtent" RepeatLayout="Table" RepeatDirection="Vertical" 
                                            runat="server" />
                                        <img src="../../Images/Button_X_Clear.png" onclick="clearLists($('<%= ProcDiseaseExtent.ClientID %>'));" style="cursor: pointer; margin-left: 7px;" />
                                    </td>
                                  </tr>
                                </table>
                            </td>
                            <td style="width: 1%;"></td>
                            <td style="vertical-align: top;"><br/>
                                <table border="0" cellspacing="0" cellpadding="4" width="100%"  class="eformLargePopulatedTable">
                                 <tr >
                                    <td >
	                                    <span class="controlBoxTitle">Site</span>&nbsp;&nbsp;
                                        <euc:EformComboBox Style="width:80" RecordId="1" LookupCode="DxTarget" DropDownWidth="340" ID="OpSurgeon" TABLE="Procedures" 
                                            FIELD="ProcSite" runat="server"  />
                                    </td>
                                  </tr>
                                  <tr id="typeTR">
                                    <td >
	                                    <span class="controlBoxTitle">Type</span>&nbsp;&nbsp;
                                        <euc:EformSelect Style="width:80" LookupCode="ColorectalPathType" DropDownWidth="120" DropDownHeight="auto" ID="ProcPathType" 
                                            TABLE="ColorectalProc" FIELD="ProcPathType" runat="server"  />
                                    </td>
                                  </tr>
                                </table>
                </td>
            </tr>
            </table><br/>
                    </td>
                    
                    <td valign="top">
                        <table id="SurgAssessDiv" runat="server" style="display:none;">
                            <tr>
                                <td>
                                    <span class="controlBoxTitle" style="font-size:12px;">Surgeon's Assessment</span><br />
                                   <table border="0" cellspacing="0" cellpadding="4" width="300" class="eformLargePopulatedTable">
                                     <tr >
                                        <td >
                                            <euc:EformRadioButtonList TABLE="ColorectalProc" FIELD="ProcCompleteResection" 
                                                LookupCode="ColorectalCompleteResection" id="ResectProcCompleteResection" CellSpacing="0" 
                                                RepeatLayout="Table" RepeatDirection="Vertical" runat="server" />
                                                <img src="../../Images/Button_X_Clear.png" onclick="clearLists($('<%= ResectProcCompleteResection.ClientID %>'));" style="cursor: pointer; margin-left: 7px;" />
                                        </td>
                                      </tr>
                                   </table><br/>
                                </td>
                            </tr>                           
                       </table> 
                    </td>
                </tr>
            </table>

            <table>
                <tr>
                    <td valign="top">
                        <table border="0" cellspacing="0" cellpadding="4" width="375" class="eformLargePopulatedTable">
                             <tr id="BrachyTR" >
                                <td height="50px" >
                                    <span class="controlBoxTitle" style="font-size:12px;">Brachytherapy (IORT)</span>&nbsp;&nbsp;&nbsp;
                                    <euc:EformCheckBox Table="BrachyTherapy" Field="BrachyNotes" id="BrachyNotes" Value="IORT" runat="server" />  Yes
                                </td>
                              </tr>
                            </table><br/>
                    </td>
                    
                    <td valign="top">            
                        <table border="0" cellspacing="0" cellpadding="4" width="300" class="eformLargePopulatedTable">
                            <tr id=NotesTR >
                                <td >
                                    <span class="controlBoxTitle" style="font-size:12px;">Notes</span>
                                    <euc:EformTextArea TextMode="MultiLine" TABLE="Procedures" RecordId="1" FIELD="ProcNotes" Rows="12" style="width: 250px;" 
                                        Runat="server" ID="ProcNotes" ShowTextEditor="true"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table><br /><br />



<span class="controlBoxTitle"><asp:Label ID="PrimProcDetailsHdr2" runat="server" Text="Rectal Cancer" style="display:none;" /></span>
<table border="0" cellspacing="0" cellpadding="4" width="600" class="eformLargePopulatedTable" id="PrimProcDetailsTbl2" runat="server" style="display:none;">
    <tr>
        <td>
            <table border="0" cellspacing="0" cellpadding="4" width="600" class="eformLargePopulatedTable">
             <tr id="LowerAnalVergeTR" >
	            <td style=" font-size:13px">		
                    <span class="controlBoxTitle" style="font-size:12px;">Lower Edge From Anal Verge</span>&nbsp;&nbsp;
		            <euc:EformTextBox CssClass="InputText" Table="ColorectalProc" Field="ProcTumorAnalVerge" id="ProcTumorAnalVerge" runat="server" /> cm
	            </td>
              </tr>
            </table><br/>

            <table>
                <tr>
                    <td valign="top">
                        <span class="controlBoxTitle" style="font-size:12px;">Location by Thirds</span><br/>
                        <table border="0" cellspacing="0" cellpadding="4" width="300" class="eformLargePopulatedTable">
                         <tr >
	                        <td ><euc:EformRadioButtonList Table="ColorectalProc" Field="ProcRectalLocation" LookupCode="ColorectalLocation" 
		                            id="ProcRectalLocation" RepeatLayout="Table" RepeatDirection="Vertical" Cellspacing="0" runat="server" />
                                 <img src="../../Images/Button_X_Clear.png" onclick="clearLists($('<%= ProcRectalLocation.ClientID %>'));" style="cursor: pointer; margin-left: 7px;" />
	                        </td>
                          </tr>
                        </table><br/>
                    </td>
                    
                    <td>
                        <span class="controlBoxTitle" style="font-size:12px;">Pre-Op Rectal Exam</span><br/>
                        <table border="0" cellspacing="0" cellpadding="4" width="300" class="eformLargePopulatedTable">
                         <tr >
	                        <td ><euc:EformRadioButtonList Table="ColorectalProc" Field="ProcRectalExamPreOp" LookupCode="ColorectalPreopRectal" 
		                            id="ProcRectalExamPreOp" RepeatLayout="Table" RepeatDirection="Vertical" Cellspacing="0" runat="server" />
		                            <img src="../../Images/Button_X_Clear.png" onclick="clearLists($('<%= ProcRectalExamPreOp.ClientID %>'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
	                        </td>
                          </tr>
                        </table>
                    </td>
                </tr>
            </table>
<br/><br/>

            <span class="controlBoxTitle" style="font-size:12px;">Pre-Op ER Ultrasound</span>
            <img src="../../Images/Button_X_Clear.png" onclick="clearPreOpUS();" style="cursor: pointer; margin-left: 30px;" />

            <br/>
            <table id="PreOpERUltrasoundTable" border="0" cellspacing="0" cellpadding="4" width="600" class="eformLargePopulatedTable">
                <tr >
	                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;border-right:solid 1px white;">T Stage</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">N Stage</td>	    		
                </tr>
                <tr id="PreOpERTR">
		            <td class="ClinicalEformGridColumnOne">
		               <euc:EformHidden Table="Diagnostics" Field="DxType" id="DxType" runat="server" Value="Ultrasound" />
                       <euc:EformHidden Table="Diagnostics" Field="DxTarget " id="DxTarget" runat="server" Value="Rectum" />
		               <euc:EformHidden Table="Diagnostics" Field="DxDateText" id="DxDateText" runat="server" />
		               <euc:EformHidden Table="Diagnostics" Field="DxDate" id="DxDate" runat="server" />
		               
		               
		               <euc:EformHidden Table="ClinicalStages" Field="ClinStageDisease" id="ClinStageDisease" runat="server" Value="Colorectal" />
		               <euc:EformHidden Table="ClinicalStages" Field="ClinStageSystem" id="ClinStageSystem" runat="server" Value="UICC_02" />
		               <euc:EformHidden Table="ClinicalStages" Field="ClinStageQuality" id="ClinStageDataQuality" runat="server" Value="STD" />
		               <euc:EformHidden Table="ClinicalStages" Field="ClinStageNotes" id="ClinStageNotes" runat="server" Value="Pre-Op ER Ultrasound" />
		               <euc:EformHidden Table="ClinicalStages" Field="ClinStageDateText" id="ClinStageDateText" runat="server" />
		               <euc:EformHidden Table="ClinicalStages" Field="ClinStageDate" id="ClinStageDate" runat="server" />
		               
		               <euc:EformTextBox Table="OperatingRoomDetails" Field="OpDateText" id="OpDateText" runat="server" style="display: none;" />
		               <euc:EformTextBox Table="OperatingRoomDetails" Field="OpDate" id="OpDate" runat="server" style="display: none;" />
		               
		               <euc:EformExtendedRadioButtonList Uncheckable="true" LookupCode="StageClin_Colorectal_02_T" Table="ClinicalStages" Field="ClinStageT" id="ClinStageT" 
		                RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="0" runat="server" EnableHiddenOnUIEvent="DxType,DxTarget,DxDateText,DxDate,ClinStageDisease,ClinStageSystem,ClinStageDataQuality,ClinStageNotes,ClinStageDateText,ClinStageDate">
		                    <asp:ListItem Value="Unknown" Text="Unknown" />
		                </euc:EformExtendedRadioButtonList>		
	                </td>
	                <td style="background-color:White;"><euc:EformExtendedRadioButtonList LookupCode="StageClin_Colorectal_02_N" Table="ClinicalStages" Field="ClinStageN" 
	                    id="ClinStageN" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="0" runat="server" EnableHiddenOnUIEvent="DxType,DxTarget,DxDateText,DxDate,ClinStageDisease,ClinStageSystem,ClinStageDataQuality,ClinStageNotes,ClinStageDateText,ClinStageDate">
		                    <asp:ListItem Value="Unknown" Text="Unknown" />
		                 </euc:EformExtendedRadioButtonList>
	                </td>	
                </tr>
             </table><br/><br />
 

            <table>
                <tr>
                    <td valign="top">
                        <span class="controlBoxTitle" style=" font-size:12px">Pre-Op Anterior Peritoneal Reflection</span><br/>
                        <table border="0" cellspacing="0" cellpadding="4" width="300" class="eformLargePopulatedTable">
                         <tr >
	                        <td ><euc:EformRadioButtonList Table="ColorectalProc" Field="ProcAPR_PreOp" LookupCode="ColorectalAPR_Assessment" id="ProcAPR_PreOp" 
	                            RepeatLayout="Table" RepeatDirection="Horizontal" Cellspacing="0" runat="server"/>       
	                        </td>
	                        <td><img src="../../Images/EFormDeleteRow.gif" onclick="clearLists($('<%= ProcAPR_PreOp.ClientID %>'));"  style="cursor: pointer; margin-left: 20px; vertical-align: middle;" /></td>
                          </tr>
                        </table><br/>
                    </td>
                    
                    <td valign="top">
                        <span class="controlBoxTitle" style=" font-size:12px">IntraOp Anterior Peritoneal Reflection</span><br/>
                        <table border="0" cellspacing="0" cellpadding="4" width="300" class="eformLargePopulatedTable">
                         <tr >
	                        <td >		
		                        <euc:EformRadioButtonList Table="ColorectalProc" Field="ProcAPR_IntraOp" id="ProcAPR_IntraOp" LookupCode="ColorectalAPR_Assessment" RepeatLayout="Table" RepeatDirection="Horizontal" Cellspacing="0" runat="server" />        
	                        </td>
	                        <td><img src="../../Images/EFormDeleteRow.gif" onclick="clearLists($('<%= ProcAPR_IntraOp.ClientID %>'));"  style="cursor: pointer; margin-left: 20px; vertical-align: middle;" /></td>
                          </tr>
                        </table><br/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table><br /><br />



<span class="controlBoxTitle"><asp:Label ID="PrimProcDetailsHdr3" runat="server" Text="Lower Anterior Resection" style="display:none;" /></span>
<table border="0" cellspacing="0" cellpadding="4" width="700" class="eformLargePopulatedTable" id="PrimProcDetailsTbl3" runat="server" style="display:none;">
    <tr>
        <td>
            <table>
                <tr>
                    <td valign="top">
                        <span class="controlBoxTitle" style="font-size:12px;">Anastamosis</span><br/>
                        <table border="0" cellspacing="0" cellpadding="4" width="200" class="eformLargePopulatedTable">
                         <tr >
	                        <td >		
		                        <euc:EformRadioButtonList Table="ColorectalProc" Field="ProcAnast" LookupCode="ColorectalAnastomosis" id="ProcAnast" 
		                            RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" />
		                        <img src="../../Images/Button_X_Clear.png" onclick="clearLists($('<%= ProcAnast.ClientID %>'));" style="cursor: pointer; margin-left: 7px;" />
		                            
		                            <br /><br /><br />        
	                        </td>
                          </tr>
                        </table><br/>
                    </td>
                    
                    <td valign="top">
                        <span class="controlBoxTitle" style="font-size:12px;">Anatomy</span><br/>
                        <table border="0" cellspacing="0" cellpadding="4" width="200" class="eformLargePopulatedTable">
                         <tr >
	                        <td >
		                        <euc:EformRadioButtonList Table="ColorectalProc" Field="ProcAnatomy" LookupCode="ColorectalAnatomy" id="ProcAnatomy" 
		                            RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" />
		                             <img src="../../Images/Button_X_Clear.png" onclick="clearLists($('<%= ProcAnatomy.ClientID %>'));" style="cursor: pointer; margin-left: 7px;" />        
	                        </td>
                          </tr>
                        </table>
                       
                        <br/>    
                    </td>
                    
                    <td valign="top">
                        <span class="controlBoxTitle" style="font-size:12px;">Splenic Flexure</span><br/>
                        <table border="0" cellspacing="0" cellpadding="4" width="200" class="eformLargePopulatedTable">
                         <tr >
	                        <td >
		                        <euc:EformRadioButtonList Table="ColorectalProc" Field="ProcSplenicFlexure" LookupCode="ColorectalSplenicFlexure" 
		                            id="ProcSplenicFlexure" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" CellPadding="0" />
		                            <img src="../../Images/Button_X_Clear.png" onclick="clearLists($('<%= ProcSplenicFlexure.ClientID %>'));" style="cursor: pointer; margin-left: 7px;" />
		                            <br />        
	                        </td>
                          </tr>
                        </table><br/>            
                    </td>
                </tr>
            </table>

            <table>
                <tr>
                    <td valign="top">
                        <span class="controlBoxTitle" style="font-size:12px;">Proximal Transection</span><br/>
                        <table border="0" cellspacing="0" cellpadding="4" width="250" class="eformLargePopulatedTable">
                         <tr >
	                        <td >		
		                        <euc:EformRadioButtonList Table="ColorectalProc" Field="ProcProximalTransection" LookupCode="ColorectalProximalTransection" 
		                            id="ProcProximalTransection" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" />    
		                            <img src="../../Images/Button_X_Clear.png" onclick="clearLists($('<%= ProcProximalTransection.ClientID %>'));" style="cursor: pointer; margin-left: 7px;" />    
	                        </td>
                          </tr>
                        </table><br/>            
                    </td>
                    
                    <td valign="top">
                        <span class="controlBoxTitle" style="font-size:12px;">Arterial Ligation</span><br />
                        <table border="0" cellspacing="0" cellpadding="4" width="200" class="eformLargePopulatedTable">
                         <tr >
	                        <td >
		                        <euc:EformRadioButtonList TABLE="ColorectalProc" FIELD="ProcArteryLigation" LookupCode="ColorectalArterialLigation" id="ProcArteryLigation" 
		                            CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" />
		                            <img src="../../Images/Button_X_Clear.png" onclick="clearLists($('<%= ProcArteryLigation.ClientID %>'));" style="cursor: pointer; margin-left: 7px;" />    
	                        </td>
                          </tr>
                        </table><br/>            
                    </td>
                    
                    <td valign="top">
                        <span class="controlBoxTitle" style="font-size:12px;">Intersphincteric Dissection</span><br />
                        <table border="0" cellspacing="0" cellpadding="4" width="150" class="eformLargePopulatedTable">
                         <tr >
	                        <td >
		                        <euc:EformRadioButtonList TABLE="ColorectalProc" FIELD="ProcIntraSphinctericDissection" LookupCode="ColorectalSphinctericDissection" 
		                            id="ProcIntraSphinctericDissection" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" />
		                            <img src="../../Images/Button_X_Clear.png" onclick="clearLists($('<%= ProcIntraSphinctericDissection.ClientID %>'));" style="cursor: pointer; margin-left: 7px;" />    
	                        </td>
                          </tr>
                        </table><br/>                
                    </td>
                </tr>
            </table><br />

            <table border="0" cellspacing="0" cellpadding="4" width="600" class="ClinicalEformTable">
             <tr >
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;border-right:solid 1px white;font-size:13px;" >Anastamosis From Anal Verge<br />(cm)</td>
	            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:13px;" >Pouch Size<br />(cm)</td>
	            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;border-left:solid 1px white;font-size:13px;" >Coloplasty Size<br />(cm)</td>
             </tr>
             <tr id="AnastamosisTR1">
                <td class="ClinicalEformGridColumnOne" style="text-align: center;"><euc:EformTextBox CssClass="InputText" Table="ColorectalProc" 
                    Field="ProcAnastAnalVergeDist" id="ProcAnastAnalVergeDist" runat="server"/></td>
                <td style="text-align: center;"><euc:EformTextBox CssClass="InputText" Table="ColorectalProc" Field="ProcPouchSize" id="ProcPouchSize" 
                    runat="server" /></td>
                <td class="ClinicalEformGridColumnOne" style="text-align: center;"><euc:EformTextBox CssClass="InputText" Table="ColorectalProc" 
                    Field="ProcColoplastySize" id="ProcColoplastySize" runat="server" /></td>
              </tr>
            </table><br/><br />

            <table border="0" cellspacing="0" cellpadding="4" width="600" class="eformLargePopulatedTable">
                <tr id="AnastamosisTR2">
                    <td valign="top">
                        <span class="controlBoxTitle" style="font-size:12px;">Mucosectomy</span>&nbsp;&nbsp;
		                <euc:EformCheckBox Table="ColorectalProc" Field="ProcMucosectomy" id="ProcMucosectomy" Value="True" runat="server" />  Performed        
                    </td>
                    <td width="1%" style="background-color:White;"></td>
                    <td valign="top">
                        <span class="controlBoxTitle" style=" font-size:12px;">Temporary Colostomy Ileostomy</span>&nbsp;&nbsp;
		                <euc:EformCheckBox Table="ColorectalProc" Field="ProcColostomyIleostomy" id="ProcColostomyIleostomy" Value="True"   
		                    runat="server" /> Performed
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<script type="text/javascript">

function setClinStageDates()
{
    
    if ($('<% =OpDateText.ClientID %>').value.length > 0)
    {
        $('<% =ClinStageDateText.ClientID %>').value = $('<% =OpDateText.ClientID %>').value;
        $('<% =ClinStageDate.ClientID %>').value = $('<% =OpDate.ClientID %>').value;
        $('<% =DxDateText.ClientID %>').value = $('<% =OpDateText.ClientID %>').value;
        $('<% =DxDate.ClientID %>').value = $('<% =OpDate.ClientID %>').value;
    }
    if ($('<% =ClinStageDateText.ClientID %>').disabled == true ) $('<% =ClinStageDate.ClientID %>').disabled = true;
    if ($('<% =DxDateText.ClientID %>').disabled == true ) $('<% =DxDate.ClientID %>').disabled = true;
    
}
setClinStageDates();
</script>