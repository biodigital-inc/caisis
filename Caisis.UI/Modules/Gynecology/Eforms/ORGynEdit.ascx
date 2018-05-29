<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.ORGynEdit" CodeFile="ORGynEdit.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript">
    //procedure tables    
    tableArray.GynProcHtmlTbl2 = "GynProcHtmlTbl2";
    
    //pathology tables   
    tableArray.GynPathFindingsTable2 = "GynPathFindingsTable2";



</script>
<%--
    
    var addProcToExistingORContainerTableIDs = ['ProceduresTable6','ProceduresTable7','ProceduresTable8','ProceduresTable9','ProceduresTable10','ProceduresTable11','ProceduresTable12','ProceduresTable13','ProceduresTable14','ProceduresTable15','ProceduresTable16','ProceduresTable17'];
    
    function getGYNEditProcInputs(ProcNum)
    {
        var containerTable = document.getElementById(addProcToExistingORContainerTableIDs[ProcNum]);
        
        var containerTableInputs = containerTable.getElementsByTagName('input');
        
        var GYNEditProcInputs = null;
        
        // a nominal check of type to verify that the inputs are in correct order: Primary, DateText, Date, ProcName
        if (containerTableInputs.length > 3 && containerTableInputs[0].type == 'checkbox' && containerTableInputs[1].type == 'text' && containerTableInputs[2].type == 'hidden' && containerTableInputs[3].type == 'text')
        {
             GYNEditProcInputs = [containerTableInputs[0],containerTableInputs[1],containerTableInputs[2],containerTableInputs[3]];
        }
        
        return GYNEditProcInputs;
        
    }
    
    function defaultGYNEditProcVals(ProcNum)
    {
        if (ProcNum > 0)
        {
            var currentProcInputs = getGYNEditProcInputs(ProcNum);
            var prevProcInputs = getGYNEditProcInputs(ProcNum-1);
            
            if (currentProcInputs != null && prevProcInputs != null && currentProcInputs[3].value.length > 0 && (currentProcInputs[1].value.length == 0 && currentProcInputs[2].value.length == 0))
            {
                currentProcInputs[0].checked = prevProcInputs[0].checked;
                currentProcInputs[1].value = prevProcInputs[1].value;
                currentProcInputs[2].value = prevProcInputs[2].value;
            }
            
        }
    }
 --%>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ORGyn" /><span class="controlBoxTitle">Operating Room Details</span> <br/>
<table border="0" cellspacing="0" cellpadding="5" width="750" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <span class="controlBoxTitle" style="font-size: 12px;">Previous OR Details</span><br/>
            <table width="750" cellpadding="11" cellspacing="0" class="ClinicalEformTable" id="PrevORTbl">
                <tr id="NoGynORMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="12" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Operating Room Details were recorded for this patient.
                    </td>
                </tr>
                <tr runat="server" id="PrevGynORRptHdr"> 
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Date</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">&nbsp;&nbsp;&nbsp;&nbsp;Institution&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">Service&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">Admit&nbsp;<br />Status&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">Admit&nbsp;<br />Date&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">Discharge&nbsp;<br />Date&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">Est Blood&nbsp;<br />Loss (cc)&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">Pre-op&nbsp;<br />Summary&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">Post-op&nbsp;<br />Summary&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Quality&nbsp;</td>
                    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                  </tr>  
  
                  <asp:Repeater ID="GynORRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	                <ItemTemplate>                   
		                <tr class="ClinicalEformPopulatedRow2" onclick="LoadDataEntryForm('OperatingRoomDetails', <%# DataBinder.Eval(Container.DataItem, "OperatingRoomDetailId") %>, 'OpDateText,OpDate,OpInstitution,OpService,OpCaseSurgeon,OpAdmitStatus,OpAdmitDateText,OpAdmitDate,OpDischargeDateText,OpDischargeDate,OpEstBloodLoss,OpPreOpSummary,OpPostOpSummary,OpDataSource,OpQuality','OperatingRoomDetails');"> 
			                <td class=""><%# DataBinder.Eval(Container.DataItem, "OpDateText")%>&nbsp;</td>
			                <td align="center" class=""><%# Eval("OpInstitution").ToString() == "Memorial Sloan Kettering Cancer Center" ? "MSKCC" : Eval("OpInstitution").ToString()%>&nbsp;</td>
			                <td align="center" class=""><%# Eval("OpService")%>&nbsp;</td>
			                <td align="center" class=""><%# Eval("OpCaseSurgeon")%>&nbsp;</td>
			                <td align="center" class=""><%# Eval("OpAdmitStatus")%>&nbsp;</td>
			                <td align="center" class=""><%# Eval("OpAdmitDateText")%>&nbsp;</td>
			                <td align="center" class=""><%# Eval("OpDischargeDateText")%>&nbsp;</td>
			                <td align="center" class=""><%# Eval("OpEstBloodLoss")%>&nbsp;</td>
			                <td align="center" class=""><%# Eval("OpPreOpSummary")%>&nbsp;</td>
			                <td align="center" class=""><%# Eval("OpPostOpSummary")%>&nbsp;</td>
			                <td align="center" class=""><%# Eval("OpDataSource")%>&nbsp;</td>
			                <td align="center" class=""><%# Eval("OpQuality")%>&nbsp;</td>
			                <td class=""><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		                </tr>      
	                </ItemTemplate>
                  </asp:Repeater>
                  
                  <tr><td style=" height:40px"></td></tr> 
                  
                    <tr id="AssoProcYesNoTR" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td style="white-space:nowrap; font-size:small;" colspan="5">
                        <strong>Would you like to add Procedures and Pathology associated with above OR?</strong></td>
                    <td style="text-align:left;" colspan="6"><euc:EformRadioButtonList ID="AssoProcYesNo" runat="server" 
                        RepeatLayout="Table" RepeatDirection="Horizontal" Table="NoTable" Field="AssoProcYesNo">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </euc:EformRadioButtonList></td>
                   </tr>
                                     
                </table><br />        
        
<%--Start of previous Procs and New procs for existing OR record --%>        
<table border="0" cellspacing="0" cellpadding="5" width="750" class="eformXLargePopulatedTable" id="ExistingORProcsTbl" 
            runat="server" style="display:none;">
    <tr >
        <td>
            <span class="controlBoxTitle">Previous Procedures</span> <br/><br />
            <table width="750" cellpadding="12" cellspacing="0" class="ClinicalEformTable" id="PrevProcTbl2"> 
                <asp:Repeater ID="GynProcRpt2" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	                <HeaderTemplate>
	                 <tr runat="server" id="PrevGynprocRptHdr2"> 
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary<br />Proc</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">&nbsp;&nbsp;&nbsp;&nbsp;Institution&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Quality</td>
                            <td class="controlBoxDataGridHeaderFirstCol" valign="top">
                                <table>
                                      <tr><td class="controlBoxDataGridHeaderFirstCol" align="center" colspan="3">Assistants</td></tr>
                                      <tr runat="server" id="PrevGynProcAsstsRptHdr2">
                                        <td class="controlBoxDataGridHeaderFirstCol" align="center">Name&nbsp;</td>
                                        <td class="controlBoxDataGridHeaderFirstCol" align="center">Type&nbsp;</td>
                                        <td class="controlBoxDataGridHeaderFirstCol" align="center">Credit&nbsp;</td>
                                    </tr>  
                                </table>
                            </td>
                        </tr>   
	                </HeaderTemplate>
	                
	                <ItemTemplate>                                
		                <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Procedures', <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'ProcPrimary,ProcDateText,ProcDate,ProcName,ProcSide,ProcCPT_Code,ProcCPT_Description,ProcInstitution,ProcService,ProcSurgeon,ProcSurgeonType,ProcQuality,ProcDataSource','Procedures','ProcedureAssistants');"> 
			                <td align="center" valign="top" class="ClinicalEformPopulatedColumn"><%# Eval("ProcPrimary")%>&nbsp;</td>
			                <td align="center" valign="top" class="ClinicalEformPopulatedColumn"><%# Eval("ProcDateText")%>&nbsp;</td>
			                <td align="center" valign="top" class="ClinicalEformPopulatedColumn"><%# Eval("ProcName")%>&nbsp;</td>
			                <td align="center" valign="top" class="ClinicalEformPopulatedColumn"><%# Eval("ProcCPT_Code")%>&nbsp;</td>
			                <td align="center" valign="top" class="ClinicalEformPopulatedColumn"><%# Eval("ProcCPT_Description")%>&nbsp;</td>
			                <td align="center" valign="top" class="ClinicalEformPopulatedColumn"><%# Eval("ProcInstitution").ToString() == "Memorial Sloan Kettering Cancer Center" ? "MSKCC" : Eval("ProcInstitution").ToString()%>&nbsp;</td>
			                <td align="center" valign="top" class="ClinicalEformPopulatedColumn"><%# Eval("ProcService")%>&nbsp;</td>
			                <td align="center" valign="top" class="ClinicalEformPopulatedColumn"><%# Eval("ProcSurgeon")%>&nbsp;</td>
			                <td align="center" valign="top" class="ClinicalEformPopulatedColumn"><%# Eval("ProcSurgeonType")%>&nbsp;</td>
			                <td align="center" valign="top" class="ClinicalEformPopulatedColumn"><%# Eval("ProcDataSource")%>&nbsp;</td>
			                <td align="center" valign="top" class="ClinicalEformPopulatedColumn"><%# Eval("ProcQuality")%>&nbsp;</td>
			                
		                    <td valign="top" class="ClinicalEformPopulatedColumn">
		                        <table>   
		                             <asp:Repeater ID="GynProcAsstRpt2" runat="server"> 
	                                    <ItemTemplate>                   
		                                     <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('ProcedureAssistants', <%# DataBinder.Eval(Container.DataItem, "ProcedureAssistantId") %>, 'ProcAssistant,ProcAssistantType,ProcAccreditation','ProcedureAssistants'); stopBubble(event);"> 
			                                    <td align="center" width="50" ><%# Eval("ProcedureAssistant")%>&nbsp;</td>
			                                    <td align="center" width="40" ><%# Eval("ProcedureAssistantType")%>&nbsp;</td>
			                                    <td align="center" width="30" ><%# Eval("ProcAccreditation")%>&nbsp;</td>
			                                 </tr>  
		                                  </ItemTemplate>
		                            </asp:Repeater>
		                        </table>&nbsp;
		                    </td>
		                </tr>		                 
	                </ItemTemplate>
                  </asp:Repeater>
                  
                  <tr id="NoGynProcMsgTr2" runat="server" class="ClinicalEformPopulatedRowNonClickable" visible="false">
                    <td colspan="12" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Proceduress were recorded for this patient.
                    </td>
                </tr>
                </table><br /><br />
                
                <!-- Add New Procedures -->
                <span class="controlBoxTitle">Add New Procedures</span><br/><br />
                <table width="750" cellpadding="2" cellspacing="0" class="eformLargePopulatedTable" id="GynProcHtmlTbl2">
                <!-- 1st Procedure -->                
                <tr style="vertical-align: top" id="ExistORProcsTr1">
                <td style="vertical-align: top"><br />
                    <span class="controlBoxTitle">Procedure 1</span> <br/>
                    <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable6">
                        <tr>                            
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">During<br />Operation On</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                        </tr>
                        
                        <tr id="ExistORProcTr1">
                            <td align="center"><euc:EformDropDownList  RecordId="6" TABLE="Procedures" 
                                FIELD="OperatingRoomDetailId" Runat="server" ID="OperatingRoomDetailId_6" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="120px" /></td>
                            <td align="center"><euc:EformCheckBox  RecordId="6" TABLE="Procedures" FIELD="ProcPrimary" 
                                Runat="server" ID="ProcPrimary_6" Value="1" /></td>
                            <td align="center"><euc:EformTextBox   Width="90px" RecordId="6" TABLE="Procedures" 
                                FIELD="ProcDateText" ID="ProcDateText_6" Runat="server" ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden  RecordId="6" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_6" 
	                                Runat="server"/></td>
	                        <td colspan="2" align="center" ><euc:EformComboBox  Width="200px" RecordId="6" TABLE="Procedures" 
	                            FIELD="ProcName" ID="ProcName_6" LookupCode="ProcName,Disease,Gynecology" 
	                            Runat="server" DropDownWidth="300px" /></td>
                        </tr>
                        
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                        </tr>
                        
                        <tr id="ExistORProcTr2">
                            <td align="center"><euc:EformDropDownList  Style="width: 100px" RecordId="6" Table="Procedures" 
                                Field="ProcSide" ID="ProcSide_6" LookupCode="OpSide"  runat="server"/></td>
	                        <td align="center"><euc:EformTextBox  Width="70px" ID="ProcCPT_Code_6" RecordId="6" 
	                            Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                            <td  align="center"><euc:EformTextBox  Width="90px" ID="ProcCPT_Description_6" RecordId="6" 
                                Table="Procedures" Field="ProcCPT_Description" runat="server" ShowTextEditor="true" /></td>
                            <td align="center"><euc:EformComboBox  id="ProcSurgeon_6" RecordId="6" Table="Procedures" 
                                Field="ProcSurgeon" runat="server" Width="90px" LookupCode="Physician" 
                                DropDownWidth="300px" /></td>                        
                            <td align="center"><euc:EformDropDownList  style="width:90px" RecordId="6"  TABLE="Procedures" 
                                FIELD="ProcSurgeonType" ID="ProcSurgeonType_6" LookupCode="PhysicianLevel" 
                                Runat="server" DropDownWidth="200px" DropDownHeight="auto"/> </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                        </tr> 
                        
                        <tr id="ExistORProcTr3">                       
                            <td colspan="2" align="center"><euc:EformComboBox  id="ProcInstitution_6" RecordId="6" Table="Procedures" 
                                Field="ProcInstitution" runat="server" Width="180px" LookupCode="Institution" 
                                DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformComboBox  id="ProcService_6" RecordId="6" Table="Procedures" 
                                Field="ProcService" runat="server" Width="90px" LookupCode="PhSpecialty" 
                                DropDownWidth="200px" /></td> 
                            <td align="center"><euc:EformDropDownList  id="ProcDataSource_6" RecordId="6" Table="Procedures" 
                                Field="ProcDataSource" runat="server" LookupCode="DataSource" style="width:90px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                            <td align="center"><euc:EformDropDownList  id="ProcQuality_6" RecordId="6" Table="Procedures" 
                                Field="ProcQuality" runat="server" LookupCode="DataQuality" style="width:90px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                        </tr>                        
                    </table>
                </td>
                
                <td style="vertical-align:top" >
                    <br /><span style="font-weight: bold;">Assistants</span><br />
                    <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                        id="ProcAsstsTable6">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                          </tr> 
                          
                          <tr id="ExistORProcAsstsTr1">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_21" RecordId="21" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="21" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_21" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="21" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_21" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon42" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr2">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_22" RecordId="22" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="22" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_22" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="22" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_22" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon43" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr3">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_23" RecordId="23" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="23" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_23" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="23" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_23" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon44" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr4">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_24" RecordId="24" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="24" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_24" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="24" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_24" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon45" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                        </table>
                    </td>
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ExistORProcsTr1'));"  style="float: right; cursor: pointer;" /></td>
                </tr>
                <!-- END of 1st Procedure -->
                   
                <!-- 2nd Procedure -->
                <tr style="display:none;"  id="ExistORProcsTr2">
                <td style="vertical-align: top"><br />
                    <span class="controlBoxTitle">Procedure 2</span> <br/>
                    <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable7">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">During<br />Operation On</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                          </tr>
                        
                        <tr id="ExistORProcTr4">
                              <td align="center"><euc:EformDropDownList RecordId="7" TABLE="Procedures" 
                                FIELD="OperatingRoomDetailId" Runat="server" ID="OperatingRoomDetailId_7" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="120px" /></td>
            
                            <td align="center"><euc:EformCheckBox RecordId="7" TABLE="Procedures" FIELD="ProcPrimary" 
                                Runat="server" ID="ProcPrimary_7" Value="1" /></td>
                            <td align="center"><euc:EformTextBox  Width="80px" RecordId="7" TABLE="Procedures" 
                                FIELD="ProcDateText" ID="ProcDateText_7" Runat="server" ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden  RecordId="7" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_7" 
	                                Runat="server"/></td>
	                        <td colspan="2" align="center" ><euc:EformComboBox Width="200px" RecordId="7" TABLE="Procedures" 
	                            FIELD="ProcName" ID="ProcName_7" LookupCode="ProcName,Disease,Gynecology" 
	                            Runat="server" DropDownWidth="300px" /></td>
                                      </tr>
                        
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                        </tr>
                        
                        <tr id="ExistORProcTr5">
                            <td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="7" Table="Procedures" 
                                Field="ProcSide" ID="ProcSide_7" LookupCode="OpSide"  runat="server"/></td>
	                        <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Code_7" RecordId="7" 
	                            Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                            <td  align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_7" RecordId="7" 
                                Table="Procedures" Field="ProcCPT_Description" runat="server" ShowTextEditor="true" /></td>
                            <td align="center"><euc:EformComboBox id="ProcSurgeon_7" RecordId="7" Table="Procedures" 
                                Field="ProcSurgeon" runat="server" Width="90px" LookupCode="Physician" 
                                DropDownWidth="300px" /></td>                        
                            <td align="center"><euc:EformDropDownList style="width:100px" RecordId="7"  TABLE="Procedures" 
                                FIELD="ProcSurgeonType" ID="ProcSurgeonType_7" LookupCode="PhysicianLevel" 
                                Runat="server" DropDownWidth="200px" DropDownHeight="auto"/> </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                        </tr> 
                        
                        <tr id="ExistORProcTr6">                       
                            <td colspan="2" align="center"><euc:EformComboBox id="ProcInstitution_7" RecordId="7" Table="Procedures" 
                                Field="ProcInstitution" runat="server" Width="160px" LookupCode="Institution" 
                                DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformComboBox id="ProcService_7" RecordId="7" Table="Procedures" 
                                Field="ProcService" runat="server" Width="90px" LookupCode="PhSpecialty" 
                                DropDownWidth="200px" /></td> 
                            <td align="center"><euc:EformDropDownList id="ProcDataSource_7" RecordId="7" Table="Procedures" 
                                Field="ProcDataSource" runat="server" LookupCode="DataSource" style="width:90px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                            <td align="center"><euc:EformDropDownList id="ProcQuality_7" RecordId="7" Table="Procedures" 
                                Field="ProcQuality" runat="server" LookupCode="DataQuality" style="width:100px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                        </tr>                        
                    </table>
                </td>
                    
                    <td>
                    <br /><span style="font-weight: bold;">Assistants</span><br />
                    <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                        id="ProcAsstsTable7">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                          </tr> 
                          
                          <tr id="ExistORProcAsstsTr5">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_25" RecordId="25" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="25" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_25" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="25" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_25" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon47" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr6">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_26" RecordId="26" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="26" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_26" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="26" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_26" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon48" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr7">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_27" RecordId="27" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="27" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_27" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="27" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_27" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon49" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr8">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_28" RecordId="28" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="28" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_28" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="28" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_28" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon50" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                        </table>
                    </td><td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ExistORProcsTr2'));"  style="float: right; cursor: pointer;" /></td>
                </tr>
                <!-- END of 2nd Procedure -->
                
                <!-- 3rd Procedure -->                
                <tr style="display:none;" id="ExistORProcsTr3">
                <td style="vertical-align: top"><br />
                    <span class="controlBoxTitle">Procedure 3</span> <br/>
                    <table border="0" width="500" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable8">
                        <tr> 
                             <td class="controlBoxDataGridHeaderFirstCol" align="center">During<br />Operation On</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                           
                        </tr>
                        
                        <tr id="ExistORProcTr7">
                            
                            <td align="center"><euc:EformDropDownList RecordId="8" TABLE="Procedures" 
                                FIELD="OperatingRoomDetailId" Runat="server" ID="OperatingRoomDetailId_8" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="120px" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="8" TABLE="Procedures" FIELD="ProcPrimary" 
                                Runat="server" ID="ProcPrimary_8" Value="1" /></td>
                            <td align="center"><euc:EformTextBox  Width="80px" RecordId="8" TABLE="Procedures" 
                                FIELD="ProcDateText" ID="ProcDateText_8" Runat="server" ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden  RecordId="8" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_8" 
	                                Runat="server"/></td>
	                        <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="8" TABLE="Procedures" 
	                            FIELD="ProcName" ID="ProcName_8" LookupCode="ProcName,Disease,Gynecology" 
	                            Runat="server" DropDownWidth="300px" /></td>
                        
                        </tr>
                        
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                        </tr>
                        
                        <tr id="ExistORProcTr8">
                            <td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="8" Table="Procedures" 
                                Field="ProcSide" ID="ProcSide_8" LookupCode="OpSide"  runat="server"/></td>
	                        <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Code_8" RecordId="8" 
	                            Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                            <td  align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_8" RecordId="8" 
                                Table="Procedures" Field="ProcCPT_Description" runat="server" ShowTextEditor="true" /></td>
                            <td align="center"><euc:EformComboBox id="ProcSurgeon_8" RecordId="8" Table="Procedures" 
                                Field="ProcSurgeon" runat="server" Width="90px" LookupCode="Physician" 
                                DropDownWidth="300px" /></td>                        
                            <td align="center"><euc:EformDropDownList style="width:100px" RecordId="8"  TABLE="Procedures" 
                                FIELD="ProcSurgeonType" ID="ProcSurgeonType_8" LookupCode="PhysicianLevel" 
                                Runat="server" DropDownWidth="200px" DropDownHeight="auto"/> </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                        </tr> 
                        
                        <tr id="ExistORProcTr9">                       
                            <td colspan="2" align="center"><euc:EformComboBox id="ProcInstitution_8" RecordId="8" Table="Procedures" 
                                Field="ProcInstitution" runat="server" Width="160px" LookupCode="Institution" 
                                DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformComboBox id="ProcService_8" RecordId="8" Table="Procedures" 
                                Field="ProcService" runat="server" Width="90px" LookupCode="PhSpecialty" 
                                DropDownWidth="200px" /></td> 
                            <td align="center"><euc:EformDropDownList id="ProcDataSource_8" RecordId="8" Table="Procedures" 
                                Field="ProcDataSource" runat="server" LookupCode="DataSource" style="width:90px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                            <td align="center"><euc:EformDropDownList id="ProcQuality_8" RecordId="8" Table="Procedures" 
                                Field="ProcQuality" runat="server" LookupCode="DataQuality" style="width:100px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                        </tr>                         
                    </table>
                </td>
                    
                    <td>
                    <br /><span style="font-weight: bold;">Assistants</span><br />
                    <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                        id="ProcAsstsTable8">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                          </tr>  
                          
                          <tr id="ExistORProcAsstsTr9">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_29" RecordId="29" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="29" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_29" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="29" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_29" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon51" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr10">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_30" RecordId="30" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="30" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_30" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="30" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_30" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon52" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr11">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_31" RecordId="31" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="31" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_31" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="31" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_31" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon53" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr12">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_32" RecordId="32" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="32" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_32" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="32" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_32" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon54" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                        </table>
                    </td>                         
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ExistORProcsTr3'));"  style="float: right; cursor: pointer;" /></td>             
                </tr>
                <!-- END od 3rd Procedure -->
                
                <!-- 4th Procedure -->                
                <tr style="display:none;" id="ExistORProcsTr4">
                <td style="vertical-align: top"><br />
                    <span class="controlBoxTitle">Procedure 4</span> <br/>
                    <table border="0" width="500" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable9">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">During<br />Operation On</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                        </tr>
                        
                        <tr id="ExistORProcTr10">
                            <td align="center"><euc:EformDropDownList RecordId="9" TABLE="Procedures" 
                                FIELD="OperatingRoomDetailId" Runat="server" ID="OperatingRoomDetailId_9" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="120px" /></td>
                      
                            <td align="center"><euc:EformCheckBox RecordId="9" TABLE="Procedures" FIELD="ProcPrimary" 
                                Runat="server" ID="ProcPrimary_9" Value="1" /></td>
                            <td align="center"><euc:EformTextBox  Width="80px" RecordId="9" TABLE="Procedures" 
                                FIELD="ProcDateText" ID="ProcDateText_9" Runat="server" ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden  RecordId="9" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_9" 
	                                Runat="server"/></td>
	                        <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="9" TABLE="Procedures" 
	                            FIELD="ProcName" ID="ProcName_9" LookupCode="ProcName,Disease,Gynecology" 
	                            Runat="server" DropDownWidth="300px" /></td>
                        </tr>
                        
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                        </tr>
                        
                        <tr id="ExistORProcTr11">
                            <td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="9" Table="Procedures" 
                                Field="ProcSide" ID="ProcSide_9" LookupCode="OpSide"  runat="server"/></td>
	                        <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Code_9" RecordId="9" 
	                            Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                            <td  align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_9" RecordId="9" 
                                Table="Procedures" Field="ProcCPT_Description" runat="server" ShowTextEditor="true" /></td>
                            <td align="center"><euc:EformComboBox id="ProcSurgeon_9" RecordId="9" Table="Procedures" 
                                Field="ProcSurgeon" runat="server" Width="90px" LookupCode="Physician" 
                                DropDownWidth="300px" /></td>                        
                            <td align="center"><euc:EformDropDownList style="width:100px" RecordId="9"  TABLE="Procedures" 
                                FIELD="ProcSurgeonType" ID="ProcSurgeonType_9" LookupCode="PhysicianLevel" 
                                Runat="server" DropDownWidth="200px" DropDownHeight="auto"/> </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                        </tr> 
                        
                        <tr id="ExistORProcTr12">                       
                            <td colspan="2" align="center"><euc:EformComboBox id="ProcInstitution_9" RecordId="9" Table="Procedures" 
                                Field="ProcInstitution" runat="server" Width="160px" LookupCode="Institution" 
                                DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformComboBox id="ProcService_9" RecordId="9" Table="Procedures" 
                                Field="ProcService" runat="server" Width="90px" LookupCode="PhSpecialty" 
                                DropDownWidth="200px" /></td> 
                            <td align="center"><euc:EformDropDownList id="ProcDataSource_9" RecordId="9" Table="Procedures" 
                                Field="ProcDataSource" runat="server" LookupCode="DataSource" style="width:90px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                            <td align="center"><euc:EformDropDownList id="ProcQuality_9" RecordId="9" Table="Procedures" 
                                Field="ProcQuality" runat="server" LookupCode="DataQuality" style="width:100px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                        </tr>                         
                    </table>
                </td>
                    
                    <td>
                    <br /><span style="font-weight: bold;">Assistants</span><br />
                    <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                        id="ProcAsstsTable9">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                          </tr> 
                          
                          <tr id="ExistORProcAsstsTr13">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_33" RecordId="33" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="33" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_33" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="33" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_33" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon55" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr14">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_34" RecordId="34" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="34" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_34" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="34" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_34" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon56" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr15">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_35" RecordId="35" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="35" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_35" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="35" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_35" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon57" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr16">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_36" RecordId="36" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="36" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_36" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="36" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_36" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon58" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                        </table>
                    </td>                                           
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ExistORProcsTr4'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 4th Procedure -->
                
                <!-- 5th Procedure -->                
                <tr style="display:none;" id="ExistORProcsTr5">
                <td style="vertical-align: top"><br />
                    <span class="controlBoxTitle">Procedure 5</span> <br/>
                    <table border="0" width="500" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable10">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">During<br />Operation On</td> 
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                         </tr>
                        
                        <tr id="ExistORProcTr13">
                             <td align="center"><euc:EformDropDownList RecordId="10" TABLE="Procedures" 
                                FIELD="OperatingRoomDetailId" Runat="server" ID="OperatingRoomDetailId_10" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="120px" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="10" TABLE="Procedures" FIELD="ProcPrimary" 
                                Runat="server" ID="ProcPrimary_10" Value="1" /></td>
                            <td align="center"><euc:EformTextBox  Width="80px" RecordId="10" TABLE="Procedures" 
                                FIELD="ProcDateText" ID="ProcDateText_10" Runat="server" ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden  RecordId="10" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_10" 
	                                Runat="server"/></td>
	                        <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="10" TABLE="Procedures" 
	                            FIELD="ProcName" ID="ProcName_10" LookupCode="ProcName,Disease,Gynecology" 
	                            Runat="server" DropDownWidth="300px" /></td>   
                        </tr>
                        
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                        </tr>
                        
                        <tr id="ExistORProcTr14">
                            <td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="10" Table="Procedures" 
                                Field="ProcSide" ID="ProcSide_10" LookupCode="OpSide"  runat="server"/></td>
	                        <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Code_10" RecordId="10" 
	                            Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                            <td  align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_10" RecordId="10" 
                                Table="Procedures" Field="ProcCPT_Description" runat="server" ShowTextEditor="true" /></td>
                            <td align="center"><euc:EformComboBox id="ProcSurgeon_10" RecordId="10" Table="Procedures" 
                                Field="ProcSurgeon" runat="server" Width="90px" LookupCode="Physician" 
                                DropDownWidth="300px" /></td>                        
                            <td align="center"><euc:EformDropDownList style="width:100px" RecordId="10"  TABLE="Procedures" 
                                FIELD="ProcSurgeonType" ID="ProcSurgeonType_10" LookupCode="PhysicianLevel" 
                                Runat="server" DropDownWidth="200px" DropDownHeight="auto"/> </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                        </tr> 
                        
                        <tr id="ExistORProcTr15">                       
                            <td colspan="2" align="center"><euc:EformComboBox id="ProcInstitution_10" RecordId="10" Table="Procedures" 
                                Field="ProcInstitution" runat="server" Width="160px" LookupCode="Institution" 
                                DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformComboBox id="ProcService_10" RecordId="10" Table="Procedures" 
                                Field="ProcService" runat="server" Width="90px" LookupCode="PhSpecialty" 
                                DropDownWidth="200px" /></td> 
                            <td align="center"><euc:EformDropDownList id="ProcDataSource_10" RecordId="10" Table="Procedures" 
                                Field="ProcDataSource" runat="server" LookupCode="DataSource" style="width:90px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                            <td align="center"><euc:EformDropDownList id="ProcQuality_10" RecordId="10" Table="Procedures" 
                                Field="ProcQuality" runat="server" LookupCode="DataQuality" style="width:100px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                        </tr>                        
                    </table>
                </td>
                    
                    <td>                    
                    <br /><span style="font-weight: bold;">Assistants</span><br />
                    <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                        id="ProcAsstsTable10">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                          </tr> 
                          
                          <tr id="ExistORProcAsstsTr17">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_37" RecordId="37" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="37" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_37" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="37" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_37" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon59" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr18">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_38" RecordId="38" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="38" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_38" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="38" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_38" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon60" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr19">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_39" RecordId="39" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="39" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_39" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="39" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_39" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon61" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr20">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_40" RecordId="40" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="40" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_40" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="40" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_40" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon62" runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                        </table>
                    </td>                                            
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ExistORProcsTr5'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 5th Procedure --> 
                
                <!-- 6th Procedure -->                
                <tr style="display:none;" id="ExistORProcsTr6">
                <td style="vertical-align: top"><br />
                    <span class="controlBoxTitle">Procedure 6</span> <br/>
                    <table border="0" width="500" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable11">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">During<br />Operation On</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                         </tr>
                        
                        <tr id="ExistORProcTr16">
                            <td align="center"><euc:EformDropDownList RecordId="11" TABLE="Procedures" 
                                FIELD="OperatingRoomDetailId" Runat="server" ID="OperatingRoomDetailId_11" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="120px" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="11" TABLE="Procedures" FIELD="ProcPrimary" 
                                Runat="server" ID="ProcPrimary_11" Value="1" /></td>
                            <td align="center"><euc:EformTextBox  Width="80px" RecordId="11" TABLE="Procedures" 
                                FIELD="ProcDateText" ID="ProcDateText_11" Runat="server" ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden  RecordId="11" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_11" 
	                                Runat="server"/></td>
	                        <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="11" TABLE="Procedures" 
	                            FIELD="ProcName" ID="ProcName_11" LookupCode="ProcName,Disease,Gynecology" 
	                            Runat="server" DropDownWidth="300px" /></td>         
                        </tr>
                        
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                        </tr>
                        
                        <tr id="ExistORProcTr17">
                            <td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="11" Table="Procedures" 
                                Field="ProcSide" ID="ProcSide_11" LookupCode="OpSide"  runat="server"/></td>
	                        <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Code_11" RecordId="11" 
	                            Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                            <td  align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_11" RecordId="11" 
                                Table="Procedures" Field="ProcCPT_Description" runat="server" ShowTextEditor="true" /></td>
                            <td align="center"><euc:EformComboBox id="ProcSurgeon_11" RecordId="11" Table="Procedures" 
                                Field="ProcSurgeon" runat="server" Width="90px" LookupCode="Physician" 
                                DropDownWidth="300px" /></td>                        
                            <td align="center"><euc:EformDropDownList style="width:100px" RecordId="11"  TABLE="Procedures" 
                                FIELD="ProcSurgeonType" ID="ProcSurgeonType_11" LookupCode="PhysicianLevel" 
                                Runat="server" DropDownWidth="200px" DropDownHeight="auto"/> </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                        </tr> 
                        
                        <tr id="ExistORProcTr18">                       
                            <td colspan="2" align="center"><euc:EformComboBox id="ProcInstitution_11" RecordId="11" Table="Procedures" 
                                Field="ProcInstitution" runat="server" Width="160px" LookupCode="Institution" 
                                DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformComboBox id="ProcService_11" RecordId="11" Table="Procedures" 
                                Field="ProcService" runat="server" Width="90px" LookupCode="PhSpecialty" 
                                DropDownWidth="200px" /></td> 
                            <td align="center"><euc:EformDropDownList id="ProcDataSource_11" RecordId="11" Table="Procedures" 
                                Field="ProcDataSource" runat="server" LookupCode="DataSource" style="width:90px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                            <td align="center"><euc:EformDropDownList id="ProcQuality_11" RecordId="11" Table="Procedures" 
                                Field="ProcQuality" runat="server" LookupCode="DataQuality" style="width:100px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                        </tr>                        
                    </table>
                </td>
                    
                    <td>                    
                    <br /><span style="font-weight: bold;">Assistants</span><br />
                    <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                        id="ProcAsstsTable11">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                          </tr> 
                          
                          <tr id="ExistORProcAsstsTr21">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_41" RecordId="41" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="41" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_41" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="41" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_41" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr22">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_42" RecordId="42" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="42" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_42" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="42" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_42" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr23">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_43" RecordId="43" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="43" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_43" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="43" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_43" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr24">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_44" RecordId="44" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="44" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_44" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="44" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_44" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                        </table>
                    </td>                                            
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ExistORProcsTr6'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 6th Procedure -->   
                
                <!-- 7th Procedure -->                
                <tr style="display:none;" id="ExistORProcsTr7">
                <td style="vertical-align: top"><br />
                    <span class="controlBoxTitle">Procedure 7</span> <br/>
                    <table border="0" width="500" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable12">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">During<br />Operation On</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                           </tr>
                        
                        <tr id="ExistORProcTr19">
                            <td align="center"><euc:EformDropDownList RecordId="12" TABLE="Procedures" 
                                FIELD="OperatingRoomDetailId" Runat="server" ID="OperatingRoomDetailId_12" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="120px" /></td>
                 
                            <td align="center"><euc:EformCheckBox RecordId="12" TABLE="Procedures" FIELD="ProcPrimary" 
                                Runat="server" ID="ProcPrimary_12" Value="1" /></td>
                            <td align="center"><euc:EformTextBox  Width="80px" RecordId="12" TABLE="Procedures" 
                                FIELD="ProcDateText" ID="ProcDateText_12" Runat="server" ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden  RecordId="12" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_12" 
	                                Runat="server"/></td>
	                        <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="12" TABLE="Procedures" 
	                            FIELD="ProcName" ID="ProcName_12" LookupCode="ProcName,Disease,Gynecology" 
	                            Runat="server" DropDownWidth="300px" /></td>
                               </tr>
                        
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                        </tr>
                        
                        <tr id="ExistORProcTr20">
                            <td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="12" Table="Procedures" 
                                Field="ProcSide" ID="ProcSide_12" LookupCode="OpSide"  runat="server"/></td>
	                        <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Code_12" RecordId="12" 
	                            Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                            <td  align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_12" RecordId="12" 
                                Table="Procedures" Field="ProcCPT_Description" runat="server" ShowTextEditor="true" /></td>
                            <td align="center"><euc:EformComboBox id="ProcSurgeon_12" RecordId="12" Table="Procedures" 
                                Field="ProcSurgeon" runat="server" Width="90px" LookupCode="Physician" 
                                DropDownWidth="300px" /></td>                        
                            <td align="center"><euc:EformDropDownList style="width:100px" RecordId="12"  TABLE="Procedures" 
                                FIELD="ProcSurgeonType" ID="ProcSurgeonType_12" LookupCode="PhysicianLevel" 
                                Runat="server" DropDownWidth="200px" DropDownHeight="auto"/> </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                        </tr> 
                        
                        <tr id="ExistORProcTr21">                       
                            <td colspan="2" align="center"><euc:EformComboBox id="ProcInstitution_12" RecordId="12" Table="Procedures" 
                                Field="ProcInstitution" runat="server" Width="160px" LookupCode="Institution" 
                                DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformComboBox id="ProcService_12" RecordId="12" Table="Procedures" 
                                Field="ProcService" runat="server" Width="90px" LookupCode="PhSpecialty" 
                                DropDownWidth="200px" /></td> 
                            <td align="center"><euc:EformDropDownList id="ProcDataSource_12" RecordId="12" Table="Procedures" 
                                Field="ProcDataSource" runat="server" LookupCode="DataSource" style="width:90px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                            <td align="center"><euc:EformDropDownList id="ProcQuality_12" RecordId="12" Table="Procedures" 
                                Field="ProcQuality" runat="server" LookupCode="DataQuality" style="width:100px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                        </tr>                        
                    </table>
                </td>
                    
                    <td>                    
                    <br /><span style="font-weight: bold;">Assistants</span><br />
                    <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                        id="ProcAsstsTable12">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                          </tr> 
                          
                          <tr id="ExistORProcAsstsTr25">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_45" RecordId="45" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="45" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_45" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="45" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_45" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr26">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_46" RecordId="46" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="46" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_46" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="46" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_46" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr27">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_47" RecordId="47" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="47" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_47" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="47" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_47" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr28">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_48" RecordId="48" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="48" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_48" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="48" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_48" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                        </table>
                    </td>                                            
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ExistORProcsTr7'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 7th Procedure -->   
                
                <!-- 8th Procedure -->                
                <tr style="display:none;" id="ExistORProcsTr8">
                <td style="vertical-align: top"><br />
                    <span class="controlBoxTitle">Procedure 8</span> <br/>
                    <table border="0" width="500" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable13">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">During<br />Operation On</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                          </tr>
                        
                        <tr id="ExistORProcTr22">
                             <td align="center"><euc:EformDropDownList RecordId="13" TABLE="Procedures" 
                                FIELD="OperatingRoomDetailId" Runat="server" ID="OperatingRoomDetailId_13" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="120px" /></td>
                      
                            <td align="center"><euc:EformCheckBox RecordId="13" TABLE="Procedures" FIELD="ProcPrimary" 
                                Runat="server" ID="ProcPrimary_13" Value="1" /></td>
                            <td align="center"><euc:EformTextBox  Width="80px" RecordId="13" TABLE="Procedures" 
                                FIELD="ProcDateText" ID="ProcDateText_13" Runat="server" ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden  RecordId="13" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_13" 
	                                Runat="server"/></td>
	                        <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="13" TABLE="Procedures" 
	                            FIELD="ProcName" ID="ProcName_13" LookupCode="ProcName,Disease,Gynecology" 
	                            Runat="server" DropDownWidth="300px" /></td>
                        </tr>
                        
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                        </tr>
                        
                        <tr id="ExistORProcTr23">
                            <td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="13" Table="Procedures" 
                                Field="ProcSide" ID="ProcSide_13" LookupCode="OpSide"  runat="server"/></td>
	                        <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Code_13" RecordId="13" 
	                            Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                            <td  align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_13" RecordId="13" 
                                Table="Procedures" Field="ProcCPT_Description" runat="server" ShowTextEditor="true" /></td>
                            <td align="center"><euc:EformComboBox id="ProcSurgeon_13" RecordId="13" Table="Procedures" 
                                Field="ProcSurgeon" runat="server" Width="90px" LookupCode="Physician" 
                                DropDownWidth="300px" /></td>                        
                            <td align="center"><euc:EformDropDownList style="width:100px" RecordId="13"  TABLE="Procedures" 
                                FIELD="ProcSurgeonType" ID="ProcSurgeonType_13" LookupCode="PhysicianLevel" 
                                Runat="server" DropDownWidth="200px" DropDownHeight="auto"/> </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                        </tr> 
                        
                        <tr id="ExistORProcTr24">                       
                            <td colspan="2" align="center"><euc:EformComboBox id="ProcInstitution_13" RecordId="13" Table="Procedures" 
                                Field="ProcInstitution" runat="server" Width="160px" LookupCode="Institution" 
                                DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformComboBox id="ProcService_13" RecordId="13" Table="Procedures" 
                                Field="ProcService" runat="server" Width="90px" LookupCode="PhSpecialty" 
                                DropDownWidth="200px" /></td> 
                            <td align="center"><euc:EformDropDownList id="ProcDataSource_13" RecordId="13" Table="Procedures" 
                                Field="ProcDataSource" runat="server" LookupCode="DataSource" style="width:90px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                            <td align="center"><euc:EformDropDownList id="ProcQuality_13" RecordId="13" Table="Procedures" 
                                Field="ProcQuality" runat="server" LookupCode="DataQuality" style="width:100px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                        </tr>                        
                    </table>
                </td>
                    
                    <td>                    
                    <br /><span style="font-weight: bold;">Assistants</span><br />
                    <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                        id="ProcAsstsTable13">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                          </tr> 
                          
                          <tr id="ExistORProcAsstsTr29">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_49" RecordId="49" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="49" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_49" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="49" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_49" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr30">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_50" RecordId="50" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="50" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_50" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="50" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_50" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr31">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_51" RecordId="51" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="51" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_51" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="51" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_51" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr32">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_52" RecordId="52" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="52" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_52" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="52" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_52" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                        </table>
                    </td>                                            
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ExistORProcsTr8'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 8th Procedure -->   
                
                <!-- 9th Procedure -->                
                <tr style="display:none;" id="ExistORProcsTr9">
                <td style="vertical-align: top"><br />
                    <span class="controlBoxTitle">Procedure 9</span> <br/>
                    <table border="0" width="500" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable14">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">During<br />Operation On</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                          </tr>
                        
                        <tr id="ExistORProcTr25">
                            <td align="center"><euc:EformDropDownList RecordId="14" TABLE="Procedures" 
                                FIELD="OperatingRoomDetailId" Runat="server" ID="OperatingRoomDetailId_14" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="120px" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="14" TABLE="Procedures" FIELD="ProcPrimary" 
                                Runat="server" ID="ProcPrimary_14" Value="1" /></td>
                            <td align="center"><euc:EformTextBox  Width="80px" RecordId="14" TABLE="Procedures" 
                                FIELD="ProcDateText" ID="ProcDateText_14" Runat="server" ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden  RecordId="14" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_14" 
	                                Runat="server"/></td>
	                        <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="14" TABLE="Procedures" 
	                            FIELD="ProcName" ID="ProcName_14" LookupCode="ProcName,Disease,Gynecology" 
	                            Runat="server" DropDownWidth="300px" /></td>
                         
                        </tr>
                        
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                        </tr>
                        
                        <tr id="ExistORProcTr26">
                            <td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="14" Table="Procedures" 
                                Field="ProcSide" ID="ProcSide_14" LookupCode="OpSide"  runat="server"/></td>
	                        <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Code_14" RecordId="14" 
	                            Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                            <td  align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_14" RecordId="14" 
                                Table="Procedures" Field="ProcCPT_Description" runat="server" ShowTextEditor="true" /></td>
                            <td align="center"><euc:EformComboBox id="ProcSurgeon_14" RecordId="14" Table="Procedures" 
                                Field="ProcSurgeon" runat="server" Width="90px" LookupCode="Physician" 
                                DropDownWidth="300px" /></td>                        
                            <td align="center"><euc:EformDropDownList style="width:100px" RecordId="14"  TABLE="Procedures" 
                                FIELD="ProcSurgeonType" ID="ProcSurgeonType_14" LookupCode="PhysicianLevel" 
                                Runat="server" DropDownWidth="200px" DropDownHeight="auto"/> </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                        </tr> 
                        
                        <tr id="ExistORProcTr27">                       
                            <td colspan="2" align="center"><euc:EformComboBox id="ProcInstitution_14" RecordId="14" Table="Procedures" 
                                Field="ProcInstitution" runat="server" Width="160px" LookupCode="Institution" 
                                DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformComboBox id="ProcService_14" RecordId="14" Table="Procedures" 
                                Field="ProcService" runat="server" Width="90px" LookupCode="PhSpecialty" 
                                DropDownWidth="200px" /></td> 
                            <td align="center"><euc:EformDropDownList id="ProcDataSource_14" RecordId="14" Table="Procedures" 
                                Field="ProcDataSource" runat="server" LookupCode="DataSource" style="width:90px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                            <td align="center"><euc:EformDropDownList id="ProcQuality_14" RecordId="14" Table="Procedures" 
                                Field="ProcQuality" runat="server" LookupCode="DataQuality" style="width:100px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                        </tr>                        
                    </table>
                </td>
                    
                    <td>                    
                    <br /><span style="font-weight: bold;">Assistants</span><br />
                    <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                        id="ProcAsstsTable14">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                          </tr> 
                          
                          <tr id="ExistORProcAsstsTr33">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_53" RecordId="53" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="53" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_53" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="53" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_53" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr34">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_54" RecordId="54" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="54" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_54" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="54" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_54" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr35">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_55" RecordId="55" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="55" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_55" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="55" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_55" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr36">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_56" RecordId="56" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="56" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_56" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="56" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_56" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                        </table>
                    </td>                                            
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ExistORProcsTr9'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 9th Procedure -->    
                
                <!-- 10th Procedure -->                
                <tr style="display:none;" id="ExistORProcsTr10">
                <td style="vertical-align: top"><br />
                    <span class="controlBoxTitle">Procedure 10</span> <br/>
                    <table border="0" width="500" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable15">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">During<br />Operation On</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                         </tr>
                        
                        <tr id="ExistORProcTr28">
                            <td align="center"><euc:EformDropDownList RecordId="15" TABLE="Procedures" 
                                FIELD="OperatingRoomDetailId" Runat="server" ID="OperatingRoomDetailId_15" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="120px" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="15" TABLE="Procedures" FIELD="ProcPrimary" 
                                Runat="server" ID="ProcPrimary_15" Value="1" /></td>
                            <td align="center"><euc:EformTextBox  Width="80px" RecordId="15" TABLE="Procedures" 
                                FIELD="ProcDateText" ID="ProcDateText_15" Runat="server" ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden  RecordId="15" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_15" 
	                                Runat="server"/></td>
	                        <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="15" TABLE="Procedures" 
	                            FIELD="ProcName" ID="ProcName_15" LookupCode="ProcName,Disease,Gynecology" 
	                            Runat="server" DropDownWidth="300px" /></td>
                          
                        </tr>
                        
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                        </tr>
                        
                        <tr id="ExistORProcTr29">
                            <td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="15" Table="Procedures" 
                                Field="ProcSide" ID="ProcSide_15" LookupCode="OpSide"  runat="server"/></td>
	                        <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Code_15" RecordId="15" 
	                            Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                            <td  align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_15" RecordId="15" 
                                Table="Procedures" Field="ProcCPT_Description" runat="server" ShowTextEditor="true" /></td>
                            <td align="center"><euc:EformComboBox id="ProcSurgeon_15" RecordId="15" Table="Procedures" 
                                Field="ProcSurgeon" runat="server" Width="90px" LookupCode="Physician" 
                                DropDownWidth="300px" /></td>                        
                            <td align="center"><euc:EformDropDownList style="width:100px" RecordId="15"  TABLE="Procedures" 
                                FIELD="ProcSurgeonType" ID="ProcSurgeonType_15" LookupCode="PhysicianLevel" 
                                Runat="server" DropDownWidth="200px" DropDownHeight="auto"/> </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                        </tr> 
                        
                        <tr id="ExistORProcTr30">                       
                            <td colspan="2" align="center"><euc:EformComboBox id="ProcInstitution_15" RecordId="15" Table="Procedures" 
                                Field="ProcInstitution" runat="server" Width="160px" LookupCode="Institution" 
                                DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformComboBox id="ProcService_15" RecordId="15" Table="Procedures" 
                                Field="ProcService" runat="server" Width="90px" LookupCode="PhSpecialty" 
                                DropDownWidth="200px" /></td> 
                            <td align="center"><euc:EformDropDownList id="ProcDataSource_15" RecordId="15" Table="Procedures" 
                                Field="ProcDataSource" runat="server" LookupCode="DataSource" style="width:90px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                            <td align="center"><euc:EformDropDownList id="ProcQuality_15" RecordId="15" Table="Procedures" 
                                Field="ProcQuality" runat="server" LookupCode="DataQuality" style="width:100px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                        </tr>                        
                    </table>
                </td>
                    
                    <td>                    
                    <br /><span style="font-weight: bold;">Assistants</span><br />
                    <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                        id="ProcAsstsTable15">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                          </tr> 
                          
                          <tr id="ExistORProcAsstsTr37">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_57" RecordId="57" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="57" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_57" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="57" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_57" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr38">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_58" RecordId="58" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="58" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_58" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="58" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_58" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr39">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_59" RecordId="59" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="59" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_59" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="59" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_59" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr40">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_60" RecordId="60" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="60" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_60" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="60" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_60" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                        </table>
                    </td>                                            
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ExistORProcsTr10'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 10th Procedure -->    
                
                
                  <!-- 11th Procedure -->                
                <tr style="display:none;" id="ExistORProcsTr11">
                <td style="vertical-align: top"><br />
                    <span class="controlBoxTitle">Procedure 11</span> <br/>
                    <table border="0" width="500" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable16">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">During<br />Operation On</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                         </tr>
                        
                        <tr id="ExistORProcTr31">
                            <td align="center"><euc:EformDropDownList RecordId="26" TABLE="Procedures" 
                                FIELD="OperatingRoomDetailId" Runat="server" ID="OperatingRoomDetailId_26" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="120px" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="26" TABLE="Procedures" FIELD="ProcPrimary" 
                                Runat="server" ID="ProcPrimary_26" Value="1" /></td>
                            <td align="center"><euc:EformTextBox  Width="80px" RecordId="26" TABLE="Procedures" 
                                FIELD="ProcDateText" ID="ProcDateText_26" Runat="server" ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden  RecordId="26" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_26" 
	                                Runat="server"/></td>
	                        <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="26" TABLE="Procedures" 
	                            FIELD="ProcName" ID="ProcName_26" LookupCode="ProcName,Disease,Gynecology" 
	                            Runat="server" DropDownWidth="300px" /></td>
                          
                        </tr>
                        
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                        </tr>
                        
                        <tr id="ExistORProcTr32">
                            <td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="26" Table="Procedures" 
                                Field="ProcSide" ID="ProcSide_26" LookupCode="OpSide"  runat="server"/></td>
	                        <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Code_26" RecordId="26" 
	                            Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                            <td  align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_26" RecordId="26" 
                                Table="Procedures" Field="ProcCPT_Description" runat="server" ShowTextEditor="true" /></td>
                            <td align="center"><euc:EformComboBox id="ProcSurgeon_26" RecordId="26" Table="Procedures" 
                                Field="ProcSurgeon" runat="server" Width="90px" LookupCode="Physician" 
                                DropDownWidth="300px" /></td>                        
                            <td align="center"><euc:EformDropDownList style="width:100px" RecordId="26"  TABLE="Procedures" 
                                FIELD="ProcSurgeonType" ID="ProcSurgeonType_26" LookupCode="PhysicianLevel" 
                                Runat="server" DropDownWidth="200px" DropDownHeight="auto"/> </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                        </tr> 
                        
                        <tr id="ExistORProcTr33">                       
                            <td colspan="2" align="center"><euc:EformComboBox id="ProcInstitution_26" RecordId="26" Table="Procedures" 
                                Field="ProcInstitution" runat="server" Width="160px" LookupCode="Institution" 
                                DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformComboBox id="ProcService_26" RecordId="26" Table="Procedures" 
                                Field="ProcService" runat="server" Width="90px" LookupCode="PhSpecialty" 
                                DropDownWidth="200px" /></td> 
                            <td align="center"><euc:EformDropDownList id="ProcDataSource_26" RecordId="26" Table="Procedures" 
                                Field="ProcDataSource" runat="server" LookupCode="DataSource" style="width:90px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                            <td align="center"><euc:EformDropDownList id="ProcQuality_26" RecordId="26" Table="Procedures" 
                                Field="ProcQuality" runat="server" LookupCode="DataQuality" style="width:100px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                        </tr>                        
                    </table>
                </td>
                    
                    <td>                    
                    <br /><span style="font-weight: bold;">Assistants</span><br />
                    <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                        id="ProcAsstsTable16">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                          </tr> 
                          
                          <tr id="ExistORProcAsstsTr41">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_97" RecordId="97" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="97" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_97" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="97" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_97" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr42">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_98" RecordId="98" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="98" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_98" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="98" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_98" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr43">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_99" RecordId="99" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="99" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_99" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="99" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_99" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr44">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_100" RecordId="100" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="100" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_100" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="100" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_100" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                        </table>
                    </td>                                            
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ExistORProcsTr11'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 11th Procedure -->  
                
                <!-- 12th Procedure -->                
                <tr style="display:none;" id="ExistORProcsTr12">
                <td style="vertical-align: top"><br />
                    <span class="controlBoxTitle">Procedure 12</span> <br/>
                    <table border="0" width="500" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable17">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">During<br />Operation On</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                         </tr>
                        
                        <tr id="ExistORProcTr34">
                            <td align="center"><euc:EformDropDownList RecordId="27" TABLE="Procedures" 
                                FIELD="OperatingRoomDetailId" Runat="server" ID="OperatingRoomDetailId_27" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="120px" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="27" TABLE="Procedures" FIELD="ProcPrimary" 
                                Runat="server" ID="ProcPrimary_27" Value="1" /></td>
                            <td align="center"><euc:EformTextBox  Width="80px" RecordId="27" TABLE="Procedures" 
                                FIELD="ProcDateText" ID="ProcDateText_27" Runat="server" ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden  RecordId="27" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_27" 
	                                Runat="server"/></td>
	                        <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="27" TABLE="Procedures" 
	                            FIELD="ProcName" ID="ProcName_27" LookupCode="ProcName,Disease,Gynecology" 
	                            Runat="server" DropDownWidth="300px" /></td>
                          
                        </tr>
                        
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                        </tr>
                        
                        <tr id="ExistORProcTr35">
                            <td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="27" Table="Procedures" 
                                Field="ProcSide" ID="ProcSide_27" LookupCode="OpSide"  runat="server"/></td>
	                        <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Code_27" RecordId="27" 
	                            Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                            <td  align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_27" RecordId="27" 
                                Table="Procedures" Field="ProcCPT_Description" runat="server" ShowTextEditor="true" /></td>
                            <td align="center"><euc:EformComboBox id="ProcSurgeon_27" RecordId="27" Table="Procedures" 
                                Field="ProcSurgeon" runat="server" Width="90px" LookupCode="Physician" 
                                DropDownWidth="300px" /></td>                        
                            <td align="center"><euc:EformDropDownList style="width:100px" RecordId="27"  TABLE="Procedures" 
                                FIELD="ProcSurgeonType" ID="ProcSurgeonType_27" LookupCode="PhysicianLevel" 
                                Runat="server" DropDownWidth="200px" DropDownHeight="auto"/> </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Institution</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                        </tr> 
                        
                        <tr id="ExistORProcTr36">                       
                            <td colspan="2" align="center"><euc:EformComboBox id="ProcInstitution_27" RecordId="27" Table="Procedures" 
                                Field="ProcInstitution" runat="server" Width="160px" LookupCode="Institution" 
                                DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformComboBox id="ProcService_27" RecordId="27" Table="Procedures" 
                                Field="ProcService" runat="server" Width="90px" LookupCode="PhSpecialty" 
                                DropDownWidth="200px" /></td> 
                            <td align="center"><euc:EformDropDownList id="ProcDataSource_27" RecordId="27" Table="Procedures" 
                                Field="ProcDataSource" runat="server" LookupCode="DataSource" style="width:90px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                            <td align="center"><euc:EformDropDownList id="ProcQuality_27" RecordId="27" Table="Procedures" 
                                Field="ProcQuality" runat="server" LookupCode="DataQuality" style="width:100px" 
                                DropDownWidth="200px" DropDownHeight="auto"/></td>
                        </tr>                        
                    </table>
                </td>
                    
                    <td>                    
                    <br /><span style="font-weight: bold;">Assistants</span><br />
                    <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                        id="ProcAsstsTable17">
                        <tr> 
                            <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                          </tr> 
                          
                          <tr id="ExistORProcAsstsTr45">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_101" RecordId="101" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="101" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_101" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="101" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_101" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr46">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_102" RecordId="102" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="102" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_102" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="102" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_102" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr47">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_103" RecordId="103" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="103" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_103" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="103" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_103" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                          <tr id="ExistORProcAsstsTr48">
                            <td align="center"><euc:EformComboBox ID="ProcAssistant_104" RecordId="104" 
                                Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                LookupCode="Physician" DropDownWidth="300px" /></td>
                            <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="104" 
                                Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_104" 
                                LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                DropDownWidth="200px" DropDownHeight="auto" /></td>
                            <td align="center"><euc:EformCheckBox RecordId="104" Table="ProcedureAssistants" 
                                Field="ProcAccreditation" runat="server" ID="ProcAccreditation_104" Value="1"/></td>
                            <td align="center"><euc:EformDeleteIcon runat="server" 
                                ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                          </tr>
                        </table>
                    </td>                                            
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ExistORProcsTr12'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 12th Procedure -->   
                
                </table>
                <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" 
            onclick="return showFirstAdditionalRow(this,'GynProcHtmlTbl2');" /><br /><br />
        </td></tr></table><br /><br />
<%--End of previous Procs and New procs for New OR record --%>


<%-- Start of previous path and New path for existing OR record --%>
<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable" id="ExistingORPathTbl" runat="server" style="display:;"><%-- none --%>
    <tr >
        <td>
            <span class="controlBoxTitle">Previous Pathologies</span><br/><br />
            <table width="750" cellpadding="12" cellspacing="0" class="ClinicalEformTable" id="PrevPathTbl2">
                <tr id="NoGynPathologyMsgTr2" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="7" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Pathologies were recorded for this patient.                    </td>
                </tr>
                <tr runat="server" id="PrevGynPathologyRptHdr2">
                  <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">During Operation On </td> 
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Date&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side&nbsp;</td>  
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">SubSite&nbsp;</td> 
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Histology&nbsp;</td>                   
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Secondary&nbsp;<br />Histology&nbsp;</td> 
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;Institution&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data&nbsp;<br />Source&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Quality&nbsp;</td>
                    <td class="controlBoxDataGridHeaderFirstCol">
                        <table>
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center" colspan="4">Path Findings</td>
                            </tr>
                            <tr runat="server" id="PrevGynPathFindingsRptHdr2">
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side&nbsp;</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Site&nbsp;</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Subsite&nbsp;</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Histology&nbsp;</td>
                            </tr>  
                        </table>                    </td>
                  </tr> 
  
                  <asp:Repeater ID="GynPathologyRpt2" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	                <ItemTemplate>                   
		                <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Pathology', <%# DataBinder.Eval(Container.DataItem, "PathologyId") %>, 'OperatingRoomDetailId,PathDateText,PathDate,PathSite,PathSubsite,PathHistology,PathHistology2,PathResult,PathInstitution,PathDataSource,PathQuality','Pathology');" valign="top">
		                  <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "OpDateText")%></td> 
			                <td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "PathDateText")%>&nbsp;</td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("PathSide")%>&nbsp;</td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("PathSite")%>&nbsp;</td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("PathSubsite")%>&nbsp;</td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("PathHistology")%>&nbsp;</td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("PathHistology2")%>&nbsp;</td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("PathResult")%>&nbsp;</td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("PathInstitution").ToString() == "Memorial Sloan Kettering Cancer Center" ? "MSKCC" : Eval("PathInstitution").ToString()%>&nbsp;</td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("PathDataSource")%>&nbsp;</td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("PathQuality")%>&nbsp;</td>
			                <td>
		                        <table>   
		                             <asp:Repeater ID="GynPathFindingsRpt2" runat="server"> 
	                                    <ItemTemplate>                   
		                                     <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('PathologyFinding', <%# DataBinder.Eval(Container.DataItem, "PathologyFindingId") %>, 'PathFindSide,PathFindSite,PathFindSubsite,PathFindHistology','PathologyFinding'); stopBubble(event);"> 
			                                    <td align="center" width="50" class="ClinicalEformPopulatedColumn"><%# Eval("PathFindSide")%>&nbsp;</td>
			                                    <td align="center" width="40" class="ClinicalEformPopulatedColumn"><%# Eval("PathFindSite")%>&nbsp;</td>
			                                    <td align="center" width="30" class="ClinicalEformPopulatedColumn"><%# Eval("PathFindSubsite")%>&nbsp;</td>
			                                    <td align="center" width="30" class="ClinicalEformPopulatedColumn"><%# Eval("PathFindHistology")%>&nbsp;</td>
			                                 </tr>  
		                                  </ItemTemplate>
		                            </asp:Repeater>
		                        </table>		                    </td>
		                </tr>      
	                </ItemTemplate>
                  </asp:Repeater>
                </table>
            <br /><br />

            <span class="controlBoxTitle">Add new Pathology</span><br/><br />  
            <table width="650" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="GynPathologyTbl2">
              <tr id="PathHdrRow2" runat="server">                 
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">During<br />Operation On</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Date</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>  
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">SubSite</td> 
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Histology</td>                   
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Secondary<br />Histology</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data<br />Source</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Quality</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
              </tr>
  
              <tr id="ExistORPathTr">	
                <td align="center"><euc:EformDropDownList RecordId="2" TABLE="Pathology" FIELD="OperatingRoomDetailId" 
                    Runat="server" ID="OperatingRoomDetailId_2" LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" 
                    Width="120px" /></td>
                <td align="center"><euc:EformTextBox  Width="80px" TABLE="Pathology" RecordId="2" FIELD="PathDateText" 
                    ID="PathDateText_2" Runat="server" ShowCalendar="true" CalcDate="true"/>
	            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="2"   ID="PathDate_2" Runat="server"/></td>
                <td align="center"><euc:EFormComboBox RecordId="2"  TABLE="Pathology" FIELD="PathSide" 
	                ID="PathSide_2" LookupCode="OpSide" Runat="server" Style="width:70px" DropDownWidth="150px" 
	                DropDownHeight="auto"/></td>
	            <td align="center"><euc:EFormComboBox RecordId="2"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_2" 
	                LookupCode="DxTarget" Runat="server" Style="width:70px" DropDownWidth="200px" /></td>
	            <td align="center"><euc:EFormComboBox RecordId="2"  TABLE="Pathology" FIELD="PathSubsite" 
	                ID="PathSubsite_2" LookupCode="BxSubSite" Runat="server" Style="width:70px" DropDownWidth="200px"/></td>
	            
	            
	            <td align="center"><euc:EformComboBox Width="80px" TABLE="Pathology" FIELD="PathHistology" RecordId="2" 
	                ID="PathHistology_2" LookupCode="PathHistology" Runat="server" DropDownWidth="350px"/></td>
                <td align="center"><euc:EformComboBox Width="80px" TABLE="Pathology" FIELD="PathHistology2" RecordId="2" 
                    ID="PathHistology2_2" LookupCode="PathHistology" Runat="server" DropDownWidth="350px"/></td>
	          
                <td align="center"><euc:EformDropDownList RecordId="2"  TABLE="Pathology" FIELD="PathResult" ID="PathResult_2" 
                    LookupCode="BxResult,Disease,Gynecology" Runat="server" Style="width:70px" DropDownWidth="200px"/></td>
                <td align="center"><euc:EformComboBox id="PathInstitution_2" RecordId="2" Table="Pathology" Field="PathInstitution" 
                    runat="server" Width="100px" LookupCode="Institution" /></td>
                <td align="center"><euc:EformDropDownList  TABLE="Pathology" RecordId="2" FIELD="PathDataSource" ID="PathDataSource_2" 
                    Runat="server" LookupCode="DataSource" Style="width:70px" DropDownWidth="200px"/></td>
                <td align="center"><euc:EformDropDownList  TABLE="Pathology" RecordId="2" FIELD="PathQuality" ID="PathQuality_2" 
                    Runat="server" LookupCode="DataQuality" Style="width:60px" DropDownWidth="200px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon32" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr><td style="height:10px"></td></tr>
              
              <tr>
                <td colspan="10">
                    <span style="font-weight: bold;">Pathology Findings</span> <br/>
                    <table width="350" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="GynPathFindingsTable2">
                        <tr runat="server" id="Tr2"> 
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Site</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Subsite</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Histology</td>
                            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                      </tr> 
                          
                          <tr id="ExistORPathFindingsTr1">
                            <td align="center"><euc:EFormComboBox id="PathFindSide_6" RecordId="6" Table="PathologyFinding" 
                                Field="PathFindSide" runat="server" style="width:80px" LookupCode="FindSide" DropDownWidth="150px" 
                                DropDownHeight="auto" /></td>                                 
                            <td align="center"><euc:EFormComboBox style="width:100px" RecordId="6"  TABLE="PathologyFinding" 
                                FIELD="PathFindSite" ID="PathFindSite_6" LookupCode="DxTarget" Runat="server" DropDownWidth="300px" 
                                DropDownHeight="130px" /></td>
                            <td align="center"><euc:EFormComboBox RecordId="6" TABLE="PathologyFinding" FIELD="PathFindSubsite" 
                                Runat="server" ID="PathFindSubsite_6" LookupCode="DxTarget" DropDownWidth="300px" 
                                DropDownHeight="130px" /></td>
                            <td align="center"><euc:EformComboBox RecordId="6" TABLE="PathologyFinding" FIELD="PathFindHistology" 
                                Runat="server" ID="PathFindHistology_6" LookupCode="PathHistology" DropDownWidth="300px" 
                                DropDownHeight="130px"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon33" runat="server" ToolTip="Clear all fields" 
                                style="cursor:pointer;"/></td>
                          </tr>
                          
                          <tr style="display:none;" id="ExistORPathFindingsTr2">
                            <td align="center"><euc:EFormComboBox id="PathFindSide_7" RecordId="7" Table="PathologyFinding" 
                                Field="PathFindSide" runat="server" style="width:80px" LookupCode="FindSide" DropDownWidth="150px" 
                                DropDownHeight="auto" /></td>                                 
                            <td align="center"><euc:EFormComboBox style="width:100px" RecordId="7"  TABLE="PathologyFinding" 
                                FIELD="PathFindSite" ID="PathFindSite_7" LookupCode="DxTarget" Runat="server" DropDownWidth="300px" 
                                DropDownHeight="130px"/> </td>
                            <td align="center"><euc:EFormComboBox RecordId="7" TABLE="PathologyFinding" FIELD="PathFindSubsite" 
                                Runat="server" ID="PathFindSubsite_7" LookupCode="DxTarget" DropDownWidth="300px" 
                                DropDownHeight="130px"/></td>
                            <td align="center"><euc:EformComboBox RecordId="7" TABLE="PathologyFinding" FIELD="PathFindHistology" 
                                Runat="server" ID="PathFindHistology_7" LookupCode="PathHistology" DropDownWidth="300px" 
                                DropDownHeight="130px"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon34" runat="server" ToolTip="Clear all fields" 
                                style="cursor:pointer;"/></td>
                          </tr>
                          <tr style="display:none;" id="ExistORPathFindingsTr3">
                            <td align="center"><euc:EFormComboBox id="PathFindSide_8" RecordId="8" Table="PathologyFinding" 
                                Field="PathFindSide" runat="server" style="width:80px" LookupCode="FindSide" DropDownWidth="150px" 
                                DropDownHeight="auto" /></td>                                 
                                <td align="center"><euc:EFormComboBox style="width:100px" RecordId="8"  TABLE="PathologyFinding" 
                                FIELD="PathFindSite" ID="PathFindSite_8" LookupCode="DxTarget" Runat="server" DropDownWidth="300px" 
                                DropDownHeight="130px"/> </td>
                            <td align="center"><euc:EFormComboBox RecordId="8" TABLE="PathologyFinding" FIELD="PathFindSubsite" 
                                Runat="server" ID="PathFindSubsite_8" LookupCode="DxTarget" DropDownWidth="300px" 
                                DropDownHeight="130px"/></td>
                            <td align="center"><euc:EformComboBox RecordId="8" TABLE="PathologyFinding" FIELD="PathFindHistology" 
                                Runat="server" ID="PathFindHistology_8" LookupCode="PathHistology" DropDownWidth="300px" 
                                DropDownHeight="130px"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon35" runat="server" ToolTip="Clear all fields" 
                                style="cursor:pointer;"/></td>
                          </tr>
                          <tr style="display:none;" id="ExistORPathFindingsTr4">
                            <td align="center"><euc:EFormComboBox id="PathFindSide_9" RecordId="9" Table="PathologyFinding" 
                                Field="PathFindSide" runat="server" style="width:80px" LookupCode="FindSide" DropDownWidth="150px" 
                                DropDownHeight="auto" /></td>                                 
                                <td align="center"><euc:EFormComboBox style="width:100px" RecordId="9"  TABLE="PathologyFinding" 
                                FIELD="PathFindSite" ID="PathFindSite_9" LookupCode="DxTarget" Runat="server" DropDownWidth="300px" 
                                DropDownHeight="130px"/> </td>
                            <td align="center"><euc:EFormComboBox RecordId="9" TABLE="PathologyFinding" FIELD="PathFindSubsite" 
                                Runat="server" ID="PathFindSubsite_9" LookupCode="DxTarget" DropDownWidth="300px" 
                                DropDownHeight="130px"/></td>
                            <td align="center"><euc:EformComboBox RecordId="9" TABLE="PathologyFinding" FIELD="PathFindHistology" 
                                Runat="server" ID="PathFindHistology_9" LookupCode="PathHistology" DropDownWidth="300px" 
                                DropDownHeight="130px"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon36" runat="server" ToolTip="Clear all fields" 
                                style="cursor:pointer;"/></td>
                          </tr>
                          <tr style="display:none;" id="ExistORPathFindingsTr5">
                            <td align="center"><euc:EFormComboBox id="PathFindSide_10" RecordId="10" Table="PathologyFinding" 
                                Field="PathFindSide" runat="server" style="width:80px" LookupCode="FindSide" DropDownWidth="150px" 
                                DropDownHeight="auto" /></td>                                 
                                <td align="center"><euc:EFormComboBox style="width:100px" RecordId="10"  TABLE="PathologyFinding" 
                                FIELD="PathFindSite" ID="PathFindSite_10" LookupCode="DxTarget" Runat="server" DropDownWidth="300px" 
                                DropDownHeight="130px"/> </td>
                            <td align="center"><euc:EFormComboBox RecordId="10" TABLE="PathologyFinding" FIELD="PathFindSubsite" 
                                Runat="server" ID="PathFindSubsite_10" LookupCode="DxTarget" DropDownWidth="300px" 
                                DropDownHeight="130px"/></td>
                            <td align="center"><euc:EformComboBox RecordId="10" TABLE="PathologyFinding" FIELD="PathFindHistology" 
                                Runat="server" ID="PathFindHistology_10" LookupCode="PathHistology" DropDownWidth="300px" 
                                DropDownHeight="130px"/></td>
                            <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon37" runat="server" ToolTip="Clear all fields" 
                                style="cursor:pointer;"/></td>
                          </tr>
                          
                          
                  </table>
                  <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" 
                    align="left" onclick="return showFirstAdditionalRow(this,'GynPathFindingsTable2');" /><br /><br />
                </td>
              </tr>
              
              
            </table>
        </td>
    </tr>
</table><br /><br />
<%--End of previous path and New path for existing OR record --%> 

</td></tr></table><br /><br />



<script type="text/javascript">
    
    //Adds events to procedure controls
    function addGynProcEvents1(GynProcName,GynProcInst,GynProcService,GynProcQlty,GynProcSource)
    { 
        $(GynProcName).addEvent('blur',curry(GynProcAutoPopulates1,GynProcName,GynProcInst,GynProcService,GynProcQlty,GynProcSource));
    }
    
    addGynProcEvents1($('<%= ProcName_6.ClientID %>'),$('<%= ProcInstitution_6.ClientID %>'),$('<%= ProcService_6.ClientID %>'),$('<%= ProcQuality_6.ClientID %>'),$('<%= ProcDataSource_6.ClientID %>'));
    
    function GynProcAutoPopulates1(GynProcName,GynProcInst,GynProcService,GynProcQlty,GynProcSource)
    {
        if (GynProcName.value != '')
        {
            GynProcInst.value = 'Memorial Sloan Kettering Cancer Center';
            GynProcService.value = 'Gynecology';
            GynProcSource.value = 'Medical Record';
            GynProcQlty.value = 'STD';
        }
        else
        { 
            GynProcInst.value = '';
            GynProcService.value = '';
            GynProcSource.value = '';
            GynProcQlty.value = '';
        }
    }
   
    
    //updates  first proc record values (for existing OR) to all other procedures only if procname is not null and values exists
    function addGynProcEvents2_1(GynProcInst1_1,GynProcService1_1,GynprocSurgeon1_1,GynProcSurgType1_1,GynProcQlty1_1,GynProcSource1_1,GynORId1_1,GynPrimary1_1,GynDateText1_1,GynDate1_1,GynProcName2_1,GynProcInst2_1,GynProcService2_1,GynprocSurgeon2_1,GynProcSurgType2_1,GynProcQlty2_1,GynProcSource2_1,GynORId2_1,GynPrimary2_1,GynDateText2_1,GynDate2_1)
    { 
        $(GynProcName2_1).addEvent('blur',curry(GynProcAutoPopulates2_1,GynProcInst1_1,GynProcService1_1,GynprocSurgeon1_1,GynProcSurgType1_1,GynProcQlty1_1,GynProcSource1_1,GynORId1_1,GynPrimary1_1,GynDateText1_1,GynDate1_1,GynProcName2_1,GynProcInst2_1,GynProcService2_1,GynprocSurgeon2_1,GynProcSurgType2_1,GynProcQlty2_1,GynProcSource2_1,GynORId2_1,GynPrimary2_1,GynDateText2_1,GynDate2_1));
        $(GynProcInst1_1).addEvent('blur',curry(GynProcAutoPopulates2_1,GynProcInst1_1,GynProcService1_1,GynprocSurgeon1_1,GynProcSurgType1_1,GynProcQlty1_1,GynProcSource1_1,GynORId1_1,GynPrimary1_1,GynDateText1_1,GynDate1_1,GynProcName2_1,GynProcInst2_1,GynProcService2_1,GynprocSurgeon2_1,GynProcSurgType2_1,GynProcQlty2_1,GynProcSource2_1,GynORId2_1,GynPrimary2_1,GynDateText2_1,GynDate2_1));
        $(GynProcService1_1).addEvent('blur',curry(GynProcAutoPopulates2_1,GynProcInst1_1,GynProcService1_1,GynprocSurgeon1_1,GynProcSurgType1_1,GynProcQlty1_1,GynProcSource1_1,GynORId1_1,GynPrimary1_1,GynDateText1_1,GynDate1_1,GynProcName2_1,GynProcInst2_1,GynProcService2_1,GynprocSurgeon2_1,GynProcSurgType2_1,GynProcQlty2_1,GynProcSource2_1,GynORId2_1,GynPrimary2_1,GynDateText2_1,GynDate2_1));
        $(GynprocSurgeon1_1).addEvent('blur',curry(GynProcAutoPopulates2_1,GynProcInst1_1,GynProcService1_1,GynprocSurgeon1_1,GynProcSurgType1_1,GynProcQlty1_1,GynProcSource1_1,GynORId1_1,GynPrimary1_1,GynDateText1_1,GynDate1_1,GynProcName2_1,GynProcInst2_1,GynProcService2_1,GynprocSurgeon2_1,GynProcSurgType2_1,GynProcQlty2_1,GynProcSource2_1,GynORId2_1,GynPrimary2_1,GynDateText2_1,GynDate2_1));
        $(GynProcSurgType1_1).addEvent('blur',curry(GynProcAutoPopulates2_1,GynProcInst1_1,GynProcService1_1,GynprocSurgeon1_1,GynProcSurgType1_1,GynProcQlty1_1,GynProcSource1_1,GynORId1_1,GynPrimary1_1,GynDateText1_1,GynDate1_1,GynProcName2_1,GynProcInst2_1,GynProcService2_1,GynprocSurgeon2_1,GynProcSurgType2_1,GynProcQlty2_1,GynProcSource2_1,GynORId2_1,GynPrimary2_1,GynDateText2_1,GynDate2_1));
        $(GynProcQlty1_1).addEvent('blur',curry(GynProcAutoPopulates2_1,GynProcInst1_1,GynProcService1_1,GynprocSurgeon1_1,GynProcSurgType1_1,GynProcQlty1_1,GynProcSource1_1,GynORId1_1,GynPrimary1_1,GynDateText1_1,GynDate1_1,GynProcName2_1,GynProcInst2_1,GynProcService2_1,GynprocSurgeon2_1,GynProcSurgType2_1,GynProcQlty2_1,GynProcSource2_1,GynORId2_1,GynPrimary2_1,GynDateText2_1,GynDate2_1));
        $(GynProcSource1_1).addEvent('blur',curry(GynProcAutoPopulates2_1,GynProcInst1_1,GynProcService1_1,GynprocSurgeon1_1,GynProcSurgType1_1,GynProcQlty1_1,GynProcSource1_1,GynORId1_1,GynPrimary1_1,GynDateText1_1,GynDate1_1,GynProcName2_1,GynProcInst2_1,GynProcService2_1,GynprocSurgeon2_1,GynProcSurgType2_1,GynProcQlty2_1,GynProcSource2_1,GynORId2_1,GynPrimary2_1,GynDateText2_1,GynDate2_1));
        $(GynORId1_1).addEvent('blur',curry(GynProcAutoPopulates2_1,GynProcInst1_1,GynProcService1_1,GynprocSurgeon1_1,GynProcSurgType1_1,GynProcQlty1_1,GynProcSource1_1,GynORId1_1,GynPrimary1_1,GynDateText1_1,GynDate1_1,GynProcName2_1,GynProcInst2_1,GynProcService2_1,GynprocSurgeon2_1,GynProcSurgType2_1,GynProcQlty2_1,GynProcSource2_1,GynORId2_1,GynPrimary2_1,GynDateText2_1,GynDate2_1));
    }

    addGynProcEvents2_1($('<%= ProcInstitution_6.ClientID %>'),$('<%= ProcService_6.ClientID %>'),$('<%= ProcSurgeon_6.ClientID %>'),$('<%= ProcSurgeonType_6.ClientID %>'),$('<%= ProcQuality_6.ClientID %>'),$('<%= ProcDataSource_6.ClientID %>'),$('<%= OperatingRoomDetailId_6.ClientID %>'),$('<%= ProcPrimary_6.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'),$('<%= ProcName_7.ClientID %>'),$('<%= ProcInstitution_7.ClientID %>'),$('<%= ProcService_7.ClientID %>'),$('<%= ProcSurgeon_7.ClientID %>'),$('<%= ProcSurgeonType_7.ClientID %>'),$('<%= ProcQuality_7.ClientID %>'),$('<%= ProcDataSource_7.ClientID %>'),$('<%= OperatingRoomDetailId_7.ClientID %>'),$('<%= ProcPrimary_7.ClientID %>'),$('<%= ProcDateText_7.ClientID %>'),$('<%= ProcDate_7.ClientID %>'));
    addGynProcEvents2_1($('<%= ProcInstitution_6.ClientID %>'),$('<%= ProcService_6.ClientID %>'),$('<%= ProcSurgeon_6.ClientID %>'),$('<%= ProcSurgeonType_6.ClientID %>'),$('<%= ProcQuality_6.ClientID %>'),$('<%= ProcDataSource_6.ClientID %>'),$('<%= OperatingRoomDetailId_6.ClientID %>'),$('<%= ProcPrimary_6.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'),$('<%= ProcName_8.ClientID %>'),$('<%= ProcInstitution_8.ClientID %>'),$('<%= ProcService_8.ClientID %>'),$('<%= ProcSurgeon_8.ClientID %>'),$('<%= ProcSurgeonType_8.ClientID %>'),$('<%= ProcQuality_8.ClientID %>'),$('<%= ProcDataSource_8.ClientID %>'),$('<%= OperatingRoomDetailId_8.ClientID %>'),$('<%= ProcPrimary_8.ClientID %>'),$('<%= ProcDateText_8.ClientID %>'),$('<%= ProcDate_8.ClientID %>'));
    addGynProcEvents2_1($('<%= ProcInstitution_6.ClientID %>'),$('<%= ProcService_6.ClientID %>'),$('<%= ProcSurgeon_6.ClientID %>'),$('<%= ProcSurgeonType_6.ClientID %>'),$('<%= ProcQuality_6.ClientID %>'),$('<%= ProcDataSource_6.ClientID %>'),$('<%= OperatingRoomDetailId_6.ClientID %>'),$('<%= ProcPrimary_6.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'),$('<%= ProcName_9.ClientID %>'),$('<%= ProcInstitution_9.ClientID %>'),$('<%= ProcService_9.ClientID %>'),$('<%= ProcSurgeon_9.ClientID %>'),$('<%= ProcSurgeonType_9.ClientID %>'),$('<%= ProcQuality_9.ClientID %>'),$('<%= ProcDataSource_9.ClientID %>'),$('<%= OperatingRoomDetailId_9.ClientID %>'),$('<%= ProcPrimary_9.ClientID %>'),$('<%= ProcDateText_9.ClientID %>'),$('<%= ProcDate_9.ClientID %>'));
    addGynProcEvents2_1($('<%= ProcInstitution_6.ClientID %>'),$('<%= ProcService_6.ClientID %>'),$('<%= ProcSurgeon_6.ClientID %>'),$('<%= ProcSurgeonType_6.ClientID %>'),$('<%= ProcQuality_6.ClientID %>'),$('<%= ProcDataSource_6.ClientID %>'),$('<%= OperatingRoomDetailId_6.ClientID %>'),$('<%= ProcPrimary_6.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'),$('<%= ProcName_10.ClientID %>'),$('<%= ProcInstitution_10.ClientID %>'),$('<%= ProcService_10.ClientID %>'),$('<%= ProcSurgeon_10.ClientID %>'),$('<%= ProcSurgeonType_10.ClientID %>'),$('<%= ProcQuality_10.ClientID %>'),$('<%= ProcDataSource_10.ClientID %>'),$('<%= OperatingRoomDetailId_10.ClientID %>'),$('<%= ProcPrimary_10.ClientID %>'),$('<%= ProcDateText_10.ClientID %>'),$('<%= ProcDate_10.ClientID %>'));
    addGynProcEvents2_1($('<%= ProcInstitution_6.ClientID %>'),$('<%= ProcService_6.ClientID %>'),$('<%= ProcSurgeon_6.ClientID %>'),$('<%= ProcSurgeonType_6.ClientID %>'),$('<%= ProcQuality_6.ClientID %>'),$('<%= ProcDataSource_6.ClientID %>'),$('<%= OperatingRoomDetailId_6.ClientID %>'),$('<%= ProcPrimary_6.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'),$('<%= ProcName_11.ClientID %>'),$('<%= ProcInstitution_11.ClientID %>'),$('<%= ProcService_11.ClientID %>'),$('<%= ProcSurgeon_11.ClientID %>'),$('<%= ProcSurgeonType_11.ClientID %>'),$('<%= ProcQuality_11.ClientID %>'),$('<%= ProcDataSource_11.ClientID %>'),$('<%= OperatingRoomDetailId_11.ClientID %>'),$('<%= ProcPrimary_11.ClientID %>'),$('<%= ProcDateText_11.ClientID %>'),$('<%= ProcDate_11.ClientID %>'));
    addGynProcEvents2_1($('<%= ProcInstitution_6.ClientID %>'),$('<%= ProcService_6.ClientID %>'),$('<%= ProcSurgeon_6.ClientID %>'),$('<%= ProcSurgeonType_6.ClientID %>'),$('<%= ProcQuality_6.ClientID %>'),$('<%= ProcDataSource_6.ClientID %>'),$('<%= OperatingRoomDetailId_6.ClientID %>'),$('<%= ProcPrimary_6.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'),$('<%= ProcName_12.ClientID %>'),$('<%= ProcInstitution_12.ClientID %>'),$('<%= ProcService_12.ClientID %>'),$('<%= ProcSurgeon_12.ClientID %>'),$('<%= ProcSurgeonType_12.ClientID %>'),$('<%= ProcQuality_12.ClientID %>'),$('<%= ProcDataSource_12.ClientID %>'),$('<%= OperatingRoomDetailId_12.ClientID %>'),$('<%= ProcPrimary_12.ClientID %>'),$('<%= ProcDateText_12.ClientID %>'),$('<%= ProcDate_12.ClientID %>'));
    addGynProcEvents2_1($('<%= ProcInstitution_6.ClientID %>'),$('<%= ProcService_6.ClientID %>'),$('<%= ProcSurgeon_6.ClientID %>'),$('<%= ProcSurgeonType_6.ClientID %>'),$('<%= ProcQuality_6.ClientID %>'),$('<%= ProcDataSource_6.ClientID %>'),$('<%= OperatingRoomDetailId_6.ClientID %>'),$('<%= ProcPrimary_6.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'),$('<%= ProcName_13.ClientID %>'),$('<%= ProcInstitution_13.ClientID %>'),$('<%= ProcService_13.ClientID %>'),$('<%= ProcSurgeon_13.ClientID %>'),$('<%= ProcSurgeonType_13.ClientID %>'),$('<%= ProcQuality_13.ClientID %>'),$('<%= ProcDataSource_13.ClientID %>'),$('<%= OperatingRoomDetailId_13.ClientID %>'),$('<%= ProcPrimary_13.ClientID %>'),$('<%= ProcDateText_13.ClientID %>'),$('<%= ProcDate_13.ClientID %>'));
    addGynProcEvents2_1($('<%= ProcInstitution_6.ClientID %>'),$('<%= ProcService_6.ClientID %>'),$('<%= ProcSurgeon_6.ClientID %>'),$('<%= ProcSurgeonType_6.ClientID %>'),$('<%= ProcQuality_6.ClientID %>'),$('<%= ProcDataSource_6.ClientID %>'),$('<%= OperatingRoomDetailId_6.ClientID %>'),$('<%= ProcPrimary_6.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'),$('<%= ProcName_14.ClientID %>'),$('<%= ProcInstitution_14.ClientID %>'),$('<%= ProcService_14.ClientID %>'),$('<%= ProcSurgeon_14.ClientID %>'),$('<%= ProcSurgeonType_14.ClientID %>'),$('<%= ProcQuality_14.ClientID %>'),$('<%= ProcDataSource_14.ClientID %>'),$('<%= OperatingRoomDetailId_14.ClientID %>'),$('<%= ProcPrimary_14.ClientID %>'),$('<%= ProcDateText_14.ClientID %>'),$('<%= ProcDate_14.ClientID %>'));
    addGynProcEvents2_1($('<%= ProcInstitution_6.ClientID %>'),$('<%= ProcService_6.ClientID %>'),$('<%= ProcSurgeon_6.ClientID %>'),$('<%= ProcSurgeonType_6.ClientID %>'),$('<%= ProcQuality_6.ClientID %>'),$('<%= ProcDataSource_6.ClientID %>'),$('<%= OperatingRoomDetailId_6.ClientID %>'),$('<%= ProcPrimary_6.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'),$('<%= ProcName_15.ClientID %>'),$('<%= ProcInstitution_15.ClientID %>'),$('<%= ProcService_15.ClientID %>'),$('<%= ProcSurgeon_15.ClientID %>'),$('<%= ProcSurgeonType_15.ClientID %>'),$('<%= ProcQuality_15.ClientID %>'),$('<%= ProcDataSource_15.ClientID %>'),$('<%= OperatingRoomDetailId_15.ClientID %>'),$('<%= ProcPrimary_15.ClientID %>'),$('<%= ProcDateText_15.ClientID %>'),$('<%= ProcDate_15.ClientID %>'));
    addGynProcEvents2_1($('<%= ProcInstitution_6.ClientID %>'), $('<%= ProcService_6.ClientID %>'), $('<%= ProcSurgeon_6.ClientID %>'), $('<%= ProcSurgeonType_6.ClientID %>'), $('<%= ProcQuality_6.ClientID %>'), $('<%= ProcDataSource_6.ClientID %>'), $('<%= OperatingRoomDetailId_6.ClientID %>'),$('<%= ProcPrimary_6.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'), $('<%= ProcName_26.ClientID %>'), $('<%= ProcInstitution_26.ClientID %>'), $('<%= ProcService_26.ClientID %>'), $('<%= ProcSurgeon_26.ClientID %>'), $('<%= ProcSurgeonType_26.ClientID %>'), $('<%= ProcQuality_26.ClientID %>'), $('<%= ProcDataSource_26.ClientID %>'), $('<%= OperatingRoomDetailId_26.ClientID %>'),$('<%= ProcPrimary_26.ClientID %>'),$('<%= ProcDateText_26.ClientID %>'),$('<%= ProcDate_26.ClientID %>'));
    addGynProcEvents2_1($('<%= ProcInstitution_6.ClientID %>'), $('<%= ProcService_6.ClientID %>'), $('<%= ProcSurgeon_6.ClientID %>'), $('<%= ProcSurgeonType_6.ClientID %>'), $('<%= ProcQuality_6.ClientID %>'), $('<%= ProcDataSource_6.ClientID %>'), $('<%= OperatingRoomDetailId_6.ClientID %>'),$('<%= ProcPrimary_6.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'), $('<%= ProcName_27.ClientID %>'), $('<%= ProcInstitution_27.ClientID %>'), $('<%= ProcService_27.ClientID %>'), $('<%= ProcSurgeon_27.ClientID %>'), $('<%= ProcSurgeonType_27.ClientID %>'), $('<%= ProcQuality_27.ClientID %>'), $('<%= ProcDataSource_27.ClientID %>'), $('<%= OperatingRoomDetailId_27.ClientID %>'),$('<%= ProcPrimary_27.ClientID %>'),$('<%= ProcDateText_27.ClientID %>'),$('<%= ProcDate_27.ClientID %>'));
    
    function GynProcAutoPopulates2_1(GynProcInst1_1,GynProcService1_1,GynprocSurgeon1_1,GynProcSurgType1_1,GynProcQlty1_1,GynProcSource1_1,GynORId1_1,GynPrimary1_1,GynDateText1_1,GynDate1_1,GynProcName2_1,GynProcInst2_1,GynProcService2_1,GynprocSurgeon2_1,GynProcSurgType2_1,GynProcQlty2_1,GynProcSource2_1,GynORId2_1,GynPrimary2_1,GynDateText2_1,GynDate2_1)
    {
        if (GynProcName2_1.value != '')
        {
            if(GynProcInst1_1.value != '' || GynProcService1_1.value != '' || GynprocSurgeon1_1.value != '' || GynProcSurgType1_1.value != '' || GynProcQlty1_1.value != '' || GynProcSource1_1.value != '' || GynORId1_1.value != '')
            {
                GynProcInst2_1.value = GynProcInst1_1.value;
                GynProcService2_1.value = GynProcService1_1.value;
                GynprocSurgeon2_1.value = GynprocSurgeon1_1.value;
                GynProcSurgType2_1.value = GynProcSurgType1_1.value;
                GynProcSource2_1.value = GynProcSource1_1.value;
                GynProcQlty2_1.value = GynProcQlty1_1.value;
                GynORId2_1.value = GynORId1_1.value;
                
                GynPrimary2_1.checked = GynPrimary1_1.checked;
                GynDateText2_1.value = GynDateText1_1.value;
                GynDate2_1.value = GynDate1_1.value;
                
            }
        }
        else
        { 
            GynProcInst2_1.value = '';
            GynProcService2_1.value = '';
            GynprocSurgeon2_1.value = '';
            GynProcSurgType2_1.value = '';
            GynProcSource2_1.value = '';
            GynProcQlty2_1.value = '';
            GynORId2_1.value = '';
                
            GynPrimary2_1.checked = false;
            GynDateText2_1.value = '';
            GynDate2_1.value = '';
        }
    }
    
    
    //updates first proc assistant values to all other procedures only if procname is not null and values exists
    function addGynProcAsstEvents(ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4)
    { 
        //change values on procname change
        $(GynProcName2).addEvent('blur',curry(GynProcAsstAutoPopulates,ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4));
        
        //change values on Asst name change        
        $(ProcAsst1_1).addEvent('blur',curry(GynProcAsstAutoPopulates,ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4));
        $(ProcAsst1_2).addEvent('blur',curry(GynProcAsstAutoPopulates,ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4));
        $(ProcAsst1_3).addEvent('blur',curry(GynProcAsstAutoPopulates,ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4));
        $(ProcAsst1_4).addEvent('blur',curry(GynProcAsstAutoPopulates,ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4));
        
        //change values on Asst type change
        $(ProcAsstType1_1).addEvent('blur',curry(GynProcAsstAutoPopulates,ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4));
        $(ProcAsstType1_2).addEvent('blur',curry(GynProcAsstAutoPopulates,ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4));
        $(ProcAsstType1_3).addEvent('blur',curry(GynProcAsstAutoPopulates,ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4));
        $(ProcAsstType1_4).addEvent('blur',curry(GynProcAsstAutoPopulates,ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4));
        
        //change values on Asst accreditation change
        $(ProcAsstAccr1_1).addEvent('click',curry(GynProcAsstAutoPopulates,ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4));
        $(ProcAsstAccr1_2).addEvent('click',curry(GynProcAsstAutoPopulates,ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4));
        $(ProcAsstAccr1_3).addEvent('click',curry(GynProcAsstAutoPopulates,ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4));
        $(ProcAsstAccr1_4).addEvent('click',curry(GynProcAsstAutoPopulates,ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4));
        
    }
    
    
     addGynProcAsstEvents($('<%= ProcAssistant_21.ClientID %>'),$('<%= ProcAssistantType_21.ClientID %>'),$('<%= ProcAccreditation_21.ClientID %>'),$('<%= ProcAssistant_22.ClientID %>'),$('<%= ProcAssistantType_22.ClientID %>'),$('<%= ProcAccreditation_22.ClientID %>'),$('<%= ProcAssistant_23.ClientID %>'),$('<%= ProcAssistantType_23.ClientID %>'),$('<%= ProcAccreditation_23.ClientID %>'),$('<%= ProcAssistant_24.ClientID %>'),$('<%= ProcAssistantType_24.ClientID %>'),$('<%= ProcAccreditation_24.ClientID %>'), $('<%= ProcName_7.ClientID %>'), $('<%= ProcAssistant_25.ClientID %>'),$('<%= ProcAssistantType_25.ClientID %>'),$('<%= ProcAccreditation_25.ClientID %>'),$('<%= ProcAssistant_26.ClientID %>'),$('<%= ProcAssistantType_26.ClientID %>'),$('<%= ProcAccreditation_26.ClientID %>'),$('<%= ProcAssistant_27.ClientID %>'),$('<%= ProcAssistantType_27.ClientID %>'),$('<%= ProcAccreditation_27.ClientID %>'),$('<%= ProcAssistant_28.ClientID %>'),$('<%= ProcAssistantType_28.ClientID %>'),$('<%= ProcAccreditation_28.ClientID %>'));
     addGynProcAsstEvents($('<%= ProcAssistant_21.ClientID %>'),$('<%= ProcAssistantType_21.ClientID %>'),$('<%= ProcAccreditation_21.ClientID %>'),$('<%= ProcAssistant_22.ClientID %>'),$('<%= ProcAssistantType_22.ClientID %>'),$('<%= ProcAccreditation_22.ClientID %>'),$('<%= ProcAssistant_23.ClientID %>'),$('<%= ProcAssistantType_23.ClientID %>'),$('<%= ProcAccreditation_23.ClientID %>'),$('<%= ProcAssistant_24.ClientID %>'),$('<%= ProcAssistantType_24.ClientID %>'),$('<%= ProcAccreditation_24.ClientID %>'), $('<%= ProcName_8.ClientID %>'), $('<%= ProcAssistant_29.ClientID %>'),$('<%= ProcAssistantType_29.ClientID %>'),$('<%= ProcAccreditation_29.ClientID %>'),$('<%= ProcAssistant_30.ClientID %>'),$('<%= ProcAssistantType_30.ClientID %>'),$('<%= ProcAccreditation_30.ClientID %>'),$('<%= ProcAssistant_31.ClientID %>'),$('<%= ProcAssistantType_31.ClientID %>'),$('<%= ProcAccreditation_31.ClientID %>'),$('<%= ProcAssistant_32.ClientID %>'),$('<%= ProcAssistantType_32.ClientID %>'),$('<%= ProcAccreditation_32.ClientID %>'));
     addGynProcAsstEvents($('<%= ProcAssistant_21.ClientID %>'),$('<%= ProcAssistantType_21.ClientID %>'),$('<%= ProcAccreditation_21.ClientID %>'),$('<%= ProcAssistant_22.ClientID %>'),$('<%= ProcAssistantType_22.ClientID %>'),$('<%= ProcAccreditation_22.ClientID %>'),$('<%= ProcAssistant_23.ClientID %>'),$('<%= ProcAssistantType_23.ClientID %>'),$('<%= ProcAccreditation_23.ClientID %>'),$('<%= ProcAssistant_24.ClientID %>'),$('<%= ProcAssistantType_24.ClientID %>'),$('<%= ProcAccreditation_24.ClientID %>'), $('<%= ProcName_9.ClientID %>'), $('<%= ProcAssistant_33.ClientID %>'),$('<%= ProcAssistantType_33.ClientID %>'),$('<%= ProcAccreditation_33.ClientID %>'),$('<%= ProcAssistant_34.ClientID %>'),$('<%= ProcAssistantType_34.ClientID %>'),$('<%= ProcAccreditation_34.ClientID %>'),$('<%= ProcAssistant_35.ClientID %>'),$('<%= ProcAssistantType_35.ClientID %>'),$('<%= ProcAccreditation_35.ClientID %>'),$('<%= ProcAssistant_36.ClientID %>'),$('<%= ProcAssistantType_36.ClientID %>'),$('<%= ProcAccreditation_36.ClientID %>'));
     addGynProcAsstEvents($('<%= ProcAssistant_21.ClientID %>'),$('<%= ProcAssistantType_21.ClientID %>'),$('<%= ProcAccreditation_21.ClientID %>'),$('<%= ProcAssistant_22.ClientID %>'),$('<%= ProcAssistantType_22.ClientID %>'),$('<%= ProcAccreditation_22.ClientID %>'),$('<%= ProcAssistant_23.ClientID %>'),$('<%= ProcAssistantType_23.ClientID %>'),$('<%= ProcAccreditation_23.ClientID %>'),$('<%= ProcAssistant_24.ClientID %>'),$('<%= ProcAssistantType_24.ClientID %>'),$('<%= ProcAccreditation_24.ClientID %>'), $('<%= ProcName_10.ClientID %>'), $('<%= ProcAssistant_37.ClientID %>'),$('<%= ProcAssistantType_37.ClientID %>'),$('<%= ProcAccreditation_37.ClientID %>'),$('<%= ProcAssistant_38.ClientID %>'),$('<%= ProcAssistantType_38.ClientID %>'),$('<%= ProcAccreditation_38.ClientID %>'),$('<%= ProcAssistant_39.ClientID %>'),$('<%= ProcAssistantType_39.ClientID %>'),$('<%= ProcAccreditation_39.ClientID %>'),$('<%= ProcAssistant_40.ClientID %>'),$('<%= ProcAssistantType_40.ClientID %>'),$('<%= ProcAccreditation_40.ClientID %>'));
     addGynProcAsstEvents($('<%= ProcAssistant_21.ClientID %>'),$('<%= ProcAssistantType_21.ClientID %>'),$('<%= ProcAccreditation_21.ClientID %>'),$('<%= ProcAssistant_22.ClientID %>'),$('<%= ProcAssistantType_22.ClientID %>'),$('<%= ProcAccreditation_22.ClientID %>'),$('<%= ProcAssistant_23.ClientID %>'),$('<%= ProcAssistantType_23.ClientID %>'),$('<%= ProcAccreditation_23.ClientID %>'),$('<%= ProcAssistant_24.ClientID %>'),$('<%= ProcAssistantType_24.ClientID %>'),$('<%= ProcAccreditation_24.ClientID %>'), $('<%= ProcName_11.ClientID %>'), $('<%= ProcAssistant_41.ClientID %>'),$('<%= ProcAssistantType_41.ClientID %>'),$('<%= ProcAccreditation_41.ClientID %>'),$('<%= ProcAssistant_42.ClientID %>'),$('<%= ProcAssistantType_42.ClientID %>'),$('<%= ProcAccreditation_42.ClientID %>'),$('<%= ProcAssistant_43.ClientID %>'),$('<%= ProcAssistantType_43.ClientID %>'),$('<%= ProcAccreditation_43.ClientID %>'),$('<%= ProcAssistant_44.ClientID %>'),$('<%= ProcAssistantType_44.ClientID %>'),$('<%= ProcAccreditation_44.ClientID %>'));
     addGynProcAsstEvents($('<%= ProcAssistant_21.ClientID %>'),$('<%= ProcAssistantType_21.ClientID %>'),$('<%= ProcAccreditation_21.ClientID %>'),$('<%= ProcAssistant_22.ClientID %>'),$('<%= ProcAssistantType_22.ClientID %>'),$('<%= ProcAccreditation_22.ClientID %>'),$('<%= ProcAssistant_23.ClientID %>'),$('<%= ProcAssistantType_23.ClientID %>'),$('<%= ProcAccreditation_23.ClientID %>'),$('<%= ProcAssistant_24.ClientID %>'),$('<%= ProcAssistantType_24.ClientID %>'),$('<%= ProcAccreditation_24.ClientID %>'), $('<%= ProcName_12.ClientID %>'), $('<%= ProcAssistant_45.ClientID %>'),$('<%= ProcAssistantType_45.ClientID %>'),$('<%= ProcAccreditation_45.ClientID %>'),$('<%= ProcAssistant_46.ClientID %>'),$('<%= ProcAssistantType_46.ClientID %>'),$('<%= ProcAccreditation_46.ClientID %>'),$('<%= ProcAssistant_47.ClientID %>'),$('<%= ProcAssistantType_47.ClientID %>'),$('<%= ProcAccreditation_47.ClientID %>'),$('<%= ProcAssistant_48.ClientID %>'),$('<%= ProcAssistantType_48.ClientID %>'),$('<%= ProcAccreditation_48.ClientID %>'));
     addGynProcAsstEvents($('<%= ProcAssistant_21.ClientID %>'),$('<%= ProcAssistantType_21.ClientID %>'),$('<%= ProcAccreditation_21.ClientID %>'),$('<%= ProcAssistant_22.ClientID %>'),$('<%= ProcAssistantType_22.ClientID %>'),$('<%= ProcAccreditation_22.ClientID %>'),$('<%= ProcAssistant_23.ClientID %>'),$('<%= ProcAssistantType_23.ClientID %>'),$('<%= ProcAccreditation_23.ClientID %>'),$('<%= ProcAssistant_24.ClientID %>'),$('<%= ProcAssistantType_24.ClientID %>'),$('<%= ProcAccreditation_24.ClientID %>'), $('<%= ProcName_13.ClientID %>'), $('<%= ProcAssistant_49.ClientID %>'),$('<%= ProcAssistantType_49.ClientID %>'),$('<%= ProcAccreditation_49.ClientID %>'),$('<%= ProcAssistant_50.ClientID %>'),$('<%= ProcAssistantType_50.ClientID %>'),$('<%= ProcAccreditation_50.ClientID %>'),$('<%= ProcAssistant_51.ClientID %>'),$('<%= ProcAssistantType_51.ClientID %>'),$('<%= ProcAccreditation_51.ClientID %>'),$('<%= ProcAssistant_52.ClientID %>'),$('<%= ProcAssistantType_52.ClientID %>'),$('<%= ProcAccreditation_52.ClientID %>'));
     addGynProcAsstEvents($('<%= ProcAssistant_21.ClientID %>'),$('<%= ProcAssistantType_21.ClientID %>'),$('<%= ProcAccreditation_21.ClientID %>'),$('<%= ProcAssistant_22.ClientID %>'),$('<%= ProcAssistantType_22.ClientID %>'),$('<%= ProcAccreditation_22.ClientID %>'),$('<%= ProcAssistant_23.ClientID %>'),$('<%= ProcAssistantType_23.ClientID %>'),$('<%= ProcAccreditation_23.ClientID %>'),$('<%= ProcAssistant_24.ClientID %>'),$('<%= ProcAssistantType_24.ClientID %>'),$('<%= ProcAccreditation_24.ClientID %>'), $('<%= ProcName_14.ClientID %>'), $('<%= ProcAssistant_53.ClientID %>'),$('<%= ProcAssistantType_53.ClientID %>'),$('<%= ProcAccreditation_53.ClientID %>'),$('<%= ProcAssistant_54.ClientID %>'),$('<%= ProcAssistantType_54.ClientID %>'),$('<%= ProcAccreditation_54.ClientID %>'),$('<%= ProcAssistant_55.ClientID %>'),$('<%= ProcAssistantType_55.ClientID %>'),$('<%= ProcAccreditation_55.ClientID %>'),$('<%= ProcAssistant_56.ClientID %>'),$('<%= ProcAssistantType_56.ClientID %>'),$('<%= ProcAccreditation_56.ClientID %>'));
     addGynProcAsstEvents($('<%= ProcAssistant_21.ClientID %>'),$('<%= ProcAssistantType_21.ClientID %>'),$('<%= ProcAccreditation_21.ClientID %>'),$('<%= ProcAssistant_22.ClientID %>'),$('<%= ProcAssistantType_22.ClientID %>'),$('<%= ProcAccreditation_22.ClientID %>'),$('<%= ProcAssistant_23.ClientID %>'),$('<%= ProcAssistantType_23.ClientID %>'),$('<%= ProcAccreditation_23.ClientID %>'),$('<%= ProcAssistant_24.ClientID %>'),$('<%= ProcAssistantType_24.ClientID %>'),$('<%= ProcAccreditation_24.ClientID %>'), $('<%= ProcName_15.ClientID %>'), $('<%= ProcAssistant_57.ClientID %>'),$('<%= ProcAssistantType_57.ClientID %>'),$('<%= ProcAccreditation_57.ClientID %>'),$('<%= ProcAssistant_58.ClientID %>'),$('<%= ProcAssistantType_58.ClientID %>'),$('<%= ProcAccreditation_58.ClientID %>'),$('<%= ProcAssistant_59.ClientID %>'),$('<%= ProcAssistantType_59.ClientID %>'),$('<%= ProcAccreditation_59.ClientID %>'),$('<%= ProcAssistant_60.ClientID %>'),$('<%= ProcAssistantType_60.ClientID %>'),$('<%= ProcAccreditation_60.ClientID %>'));
     addGynProcAsstEvents($('<%= ProcAssistant_21.ClientID %>'), $('<%= ProcAssistantType_21.ClientID %>'), $('<%= ProcAccreditation_21.ClientID %>'), $('<%= ProcAssistant_22.ClientID %>'), $('<%= ProcAssistantType_22.ClientID %>'), $('<%= ProcAccreditation_22.ClientID %>'), $('<%= ProcAssistant_23.ClientID %>'), $('<%= ProcAssistantType_23.ClientID %>'), $('<%= ProcAccreditation_23.ClientID %>'), $('<%= ProcAssistant_24.ClientID %>'), $('<%= ProcAssistantType_24.ClientID %>'), $('<%= ProcAccreditation_24.ClientID %>'), $('<%= ProcName_26.ClientID %>'), $('<%= ProcAssistant_97.ClientID %>'), $('<%= ProcAssistantType_97.ClientID %>'), $('<%= ProcAccreditation_97.ClientID %>'), $('<%= ProcAssistant_98.ClientID %>'), $('<%= ProcAssistantType_98.ClientID %>'), $('<%= ProcAccreditation_98.ClientID %>'), $('<%= ProcAssistant_99.ClientID %>'), $('<%= ProcAssistantType_99.ClientID %>'), $('<%= ProcAccreditation_99.ClientID %>'), $('<%= ProcAssistant_100.ClientID %>'), $('<%= ProcAssistantType_100.ClientID %>'), $('<%= ProcAccreditation_100.ClientID %>'));
     addGynProcAsstEvents($('<%= ProcAssistant_21.ClientID %>'), $('<%= ProcAssistantType_21.ClientID %>'), $('<%= ProcAccreditation_21.ClientID %>'), $('<%= ProcAssistant_22.ClientID %>'), $('<%= ProcAssistantType_22.ClientID %>'), $('<%= ProcAccreditation_22.ClientID %>'), $('<%= ProcAssistant_23.ClientID %>'), $('<%= ProcAssistantType_23.ClientID %>'), $('<%= ProcAccreditation_23.ClientID %>'), $('<%= ProcAssistant_24.ClientID %>'), $('<%= ProcAssistantType_24.ClientID %>'), $('<%= ProcAccreditation_24.ClientID %>'), $('<%= ProcName_27.ClientID %>'), $('<%= ProcAssistant_101.ClientID %>'), $('<%= ProcAssistantType_101.ClientID %>'), $('<%= ProcAccreditation_101.ClientID %>'), $('<%= ProcAssistant_102.ClientID %>'), $('<%= ProcAssistantType_102.ClientID %>'), $('<%= ProcAccreditation_102.ClientID %>'), $('<%= ProcAssistant_103.ClientID %>'), $('<%= ProcAssistantType_103.ClientID %>'), $('<%= ProcAccreditation_103.ClientID %>'), $('<%= ProcAssistant_104.ClientID %>'), $('<%= ProcAssistantType_104.ClientID %>'), $('<%= ProcAccreditation_104.ClientID %>'));
    
    function GynProcAsstAutoPopulates(ProcAsst1_1,ProcAsstType1_1,ProcAsstAccr1_1, ProcAsst1_2,ProcAsstType1_2,ProcAsstAccr1_2, ProcAsst1_3,ProcAsstType1_3,ProcAsstAccr1_3, ProcAsst1_4,ProcAsstType1_4,ProcAsstAccr1_4, GynProcName2, ProcAsst2_1,ProcAsstType2_1,ProcAsstAccr2_1, ProcAsst2_2,ProcAsstType2_2,ProcAsstAccr2_2, ProcAsst2_3,ProcAsstType2_3,ProcAsstAccr2_3, ProcAsst2_4,ProcAsstType2_4,ProcAsstAccr2_4)
    {
        if (GynProcName2.value != '')
        {
            if(ProcAsst1_1.value != '')
            {
                ProcAsst2_1.value = ProcAsst1_1.value;
                ProcAsstType2_1.value = ProcAsstType1_1.value;
                if(ProcAsstAccr1_1.checked)
                {
                    ProcAsstAccr2_1.checked=true;
                }
            }
            else
            {
                ProcAsstType1_1.value = '';
                ProcAsstAccr1_1.checked=false; 
                ProcAsst2_1.value = '';
                ProcAsstType2_1.value = '';
                ProcAsstAccr2_1.checked=false;   
            }
            
            if(ProcAsst1_2.value != '')
            {                
                ProcAsst2_2.value = ProcAsst1_2.value;
                ProcAsstType2_2.value = ProcAsstType1_2.value;
                if(ProcAsstAccr1_2.checked)
                {
                    ProcAsstAccr2_2.checked=true;
                }
            }
            else
            {
                ProcAsstType1_2.value = '';
                ProcAsstAccr1_2.checked=false;
                ProcAsst2_2.value = '';
                ProcAsstType2_2.value = '';
                ProcAsstAccr2_2.checked=false;
            }
            
            if(ProcAsst1_3.value != '')
            {                
                ProcAsst2_3.value = ProcAsst1_3.value;
                ProcAsstType2_3.value = ProcAsstType1_3.value;
                if(ProcAsstAccr1_3.checked)
                {
                    ProcAsstAccr2_3.checked=true;
                }
            }
            else
            {
                ProcAsstType1_3.value = '';
                ProcAsstAccr1_3.checked=false;  
                ProcAsst2_3.value = '';
                ProcAsstType2_3.value = '';
                ProcAsstAccr2_3.checked=false;                
            }
            
            if(ProcAsst1_4.value != '')
            {                
                ProcAsst2_4.value = ProcAsst1_4.value;
                ProcAsstType2_4.value = ProcAsstType1_4.value;
                if(ProcAsstAccr1_4.checked)
                {
                    ProcAsstAccr2_4.checked=true;
                }
            }
            else
            {
                ProcAsstType1_4.value = '';
                ProcAsstAccr1_4.checked=false;  
                ProcAsst2_4.value = '';
                ProcAsstType2_4.value = '';
                ProcAsstAccr2_4.checked=false;
            }
        }
        else
        { 
            ProcAsst2_1.value = '';
            ProcAsstType2_1.value = '';
            ProcAsstAccr2_1.checked=false;
            
            ProcAsst2_2.value = '';
            ProcAsstType2_2.value = '';
            ProcAsstAccr2_2.checked=false;
            
            ProcAsst2_3.value = '';
            ProcAsstType2_3.value = '';
            ProcAsstAccr2_3.checked=false;
            
            ProcAsst2_4.value = '';
            ProcAsstType2_4.value = '';
            ProcAsstAccr2_4.checked=false;
        }
    }
    
    
    //Adds events to path controls
    function addGynPathEvents(GynPathDt,GynPath,GynPathInst,GynPathSource,GynPathQlty)
    { 
        $(GynPathDt).addEvent('blur',curry(GynPathAutoPopulates,GynPathDt,GynPath,GynPathInst,GynPathSource,GynPathQlty));
        $(GynPath).addEvent('blur',curry(GynPathAutoPopulates,GynPathDt,GynPath,GynPathInst,GynPathSource,GynPathQlty));
    }
    
    addGynPathEvents($('<%= PathDateText_2.ClientID %>'),$('<%= PathHistology_2.ClientID %>'),$('<%= PathInstitution_2.ClientID %>'),$('<%= PathDataSource_2.ClientID %>'),$('<%= PathQuality_2.ClientID %>'));
    
    
    function GynPathAutoPopulates(GynPathDt,GynPath,GynPathInst,GynPathSource,GynPathQlty)
    {
        if (GynPathDt.value != '' || GynPath.value != '')
        {
            GynPathInst.value = 'Memorial Sloan Kettering Cancer Center';
            GynPathSource.value = 'Medical Record';
            GynPathQlty.value = 'STD';
        }
        else
        { 
            GynPathInst.value = '';
            GynPathSource.value = '';
            GynPathQlty.value = '';
        }
    }
    
    
    
    
    //add click events to controls to show/ hide
    addAssoProcEvent($('<%= AssoProcYesNoTR.ClientID %>'));
    
    function addAssoProcEvent(AssoProcYesNoID)
    {  
        $(AssoProcYesNoID).addEvent('click',curry(AssoProcHxYesNo,AssoProcYesNoID));

        // check on load as well
        AssoProcHxYesNo(AssoProcYesNoID);
    }
   
    function AssoProcHxYesNo(AssoProcYesNoID)
    {
       var AssoProcYesNoRef = AssoProcYesNoID.getElementsByTagName('input');
       
       for (var i = 0; i < AssoProcYesNoRef.length; i++) 
        if (AssoProcYesNoRef[i].checked) 
        {  
            AssoProcHxRadioClick(AssoProcYesNoRef[i].value);
        }
    }
    
    function AssoProcHxRadioClick(AssoProcoption_value)
    {
      if (AssoProcoption_value == "Yes")
      {       
        //shows procs/Path grids to add new records for existing OR records    
        $('<%= ExistingORProcsTbl.ClientID %>').style.display='block';
        $('<%= ExistingORPathTbl.ClientID %>').style.display='block';
      } 
      else if (AssoProcoption_value == "No")
      {   
        //hides procs/Path grids to add new records for existing OR records    
        $('<%= ExistingORProcsTbl.ClientID %>').style.display='none';
        $('<%= ExistingORPathTbl.ClientID %>').style.display='none';
        
        
        //clears all data
        for(var k=1;k<=30;k++)
        {
            clearElementsInParentRow($('ExistORProcTr'+k));
        }
        
        for(var l=1;l<=40;l++)
        {
            clearElementsInParentRow($('ExistORProcAsstsTr'+l));
        }
        
        clearElementsInParentRow($('ExistORPathTr'));
        for(var m=1;m<=5;m++)
        {
            clearElementsInParentRow($('ExistORPathFindingsTr'+m));
        }
        
      }
    }
</script>