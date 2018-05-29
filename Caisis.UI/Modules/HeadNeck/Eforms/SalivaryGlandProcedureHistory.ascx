<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandProcedureHistory" CodeFile="SalivaryGlandProcedureHistory.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
    tableArray.SalivaryGlandProcedureHistoryHtmlTable = "SalivaryGlandProcedureHistoryHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="SalivaryGlandProcedureHistory" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Previous Surgical Procedures"></asp:Label><br/>
<table  width="750" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="SalivaryGlandProcedureHistoryHtmlTable" > 
   
	    <tr>
  			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >Primary </td>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >Date</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Primary Histology (Pathology)</td>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Procedure</td>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Side</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Site</td>  
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Sub Site</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Data Quality</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
       </tr>
       
           <asp:Repeater ID="rptSurgicalHistory" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 
	<ItemTemplate> 
	    
       <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Procedures', <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'ProcDateText,ProcName,ProcSide,ProcSite,ProcSubsite,ProcQuality', 'Procedures');"> 
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;">&nbsp;<asp:Literal ID="ResultField" Runat="server" /></td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcDateText")%></td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathHistology")%></td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcName")%></td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcSide")%></td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcSite")%></td>             
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcSubsite")%></td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcQuality")%></td>
            <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
        </tr>      

    
	</ItemTemplate>
  </asp:Repeater>   
  
    <tr id="NoProcedureHistoryMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="9" class="ClinicalEformPopulatedColumn" align="center" height="40"> No prior procedures have been recorded for this patient.</td>
   </tr>
        
       <tr>
        <td style="white-space: nowrap;">
             <euc:EformCheckBox Width="20px" RecordId="11" ParentRecordId="11"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_11" Runat="server" Value="1" /> </td>
        <td style="white-space: nowrap;">
            <euc:EformTextBox  Width="80px" RecordId="11"  ParentRecordId="11" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_11" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  EnableHiddenOnUIEvent="PathDateText_11,PathDate_11,PathSide_11,PathSite_11,PathSubsite_11,PathQuality_11"/>
		    <euc:EformHidden                RecordId="11"  ParentRecordId="11" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_11"     Runat="server"/>
		    
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="11" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_11" Runat="server"  />  		    
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="11" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_11" Runat="server"  />  		    
           	<euc:EformTextBox Width="1px" style="display: none;"  RecordId="11" TABLE="OperatingRoomDetails" FIELD="OpQuality" ID="OpQuality_11"  Runat="server"  />  
		    </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="11"  ParentRecordId="11" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_11"   LookupCode="PathHistology"   Runat="server"  /> 
           
            <euc:EformTextBox Width="1px" style="display: none;"  RecordId="11"   ParentRecordId="11" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_11" Runat="server" />
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="11"   ParentRecordId="11" TABLE="Pathology" FIELD="PathDate"     ID="PathDate_11"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="11"   ParentRecordId="11" TABLE="Pathology" FIELD="PathSide"     ID="PathSide_11"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="11"   ParentRecordId="11" TABLE="Pathology" FIELD="PathSite"     ID="PathSite_11"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="11"   ParentRecordId="11" TABLE="Pathology" FIELD="PathSubsite"     ID="PathSubsite_11"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="11"   ParentRecordId="11" TABLE="Pathology" FIELD="PathSpecimenType"     ID="PathSpecimenType_11"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="11"   ParentRecordId="11" TABLE="Pathology" FIELD="PathQuality"     ID="PathQuality_11"     Runat="server"/>
         </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="11"  ParentRecordId="11" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_11"     LookupCode="ProcName" Runat="server" TabIndex="2"   EnableHiddenOnUIEvent="PathDateText_11,PathDate_11,PathSide_11,PathSite_11,PathSubsite_11,PathQuality_11"/> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="11"  ParentRecordId="11" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_11" LookupCode="OpSide"  Runat="server" TabIndex="6"  EnableHiddenOnUIEvent="PathDateText_11,PathDate_11,PathSide_11,PathSite_11,PathSubsite_11,PathQuality_11"/> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="11"  ParentRecordId="11" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_11" LookupCode="DxTarget"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_11,PathDate_11,PathSide_11,PathSite_11,PathSubsite_11,PathQuality_11" /> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="11"  ParentRecordId="11" TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_11" LookupCode="DxTarget"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_11,PathDate_11,PathSide_11,PathSite_11,PathSubsite_11,PathQuality_11"  /> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox DropDownWidth="250px" Width="80px" RecordId="11"  ParentRecordId="11" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_11" LookupCode="DataQuality"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_11,PathDate_11,PathSide_11,PathSite_11,PathSubsite_11,PathQuality_11"  /> </td>
        <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_11" runat="server"/></td>
     </tr>

       <tr style="DISPLAY: none;">
        <td style="white-space: nowrap;">
             <euc:EformCheckBox Width="20px" RecordId="12" ParentRecordId="12"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_12" Runat="server" Value="1" /> </td>
        <td style="white-space: nowrap;">
            <euc:EformTextBox  Width="80px" RecordId="12"   ParentRecordId="12" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_12" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  EnableHiddenOnUIEvent="PathDateText_12,PathDate_12,PathSide_12,PathSite_12,PathSubsite_12,PathQuality_12"/>
		    <euc:EformHidden                RecordId="12"   ParentRecordId="12" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_12"     Runat="server"/>
		    
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="12" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_12" Runat="server"  />  		    
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="12" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_12" Runat="server"  />  		    
           	<euc:EformTextBox Width="1px" style="display: none;"  RecordId="12" TABLE="OperatingRoomDetails" FIELD="OpQuality" ID="OpQuality_12"  Runat="server"  />  
		    </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="12"  ParentRecordId="12" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_12"   LookupCode="PathHistology"   Runat="server"   /> 
           
            <euc:EformTextBox Width="1px" style="display: none;"  RecordId="12"   ParentRecordId="12" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_12" Runat="server" />
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="12"   ParentRecordId="12" TABLE="Pathology" FIELD="PathDate"     ID="PathDate_12"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="12"   ParentRecordId="12" TABLE="Pathology" FIELD="PathSide"     ID="PathSide_12"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="12"   ParentRecordId="12" TABLE="Pathology" FIELD="PathSite"     ID="PathSite_12"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="12"   ParentRecordId="12" TABLE="Pathology" FIELD="PathSubsite"     ID="PathSubsite_12"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="12"   ParentRecordId="12" TABLE="Pathology" FIELD="PathSpecimenType"     ID="PathSpecimenType_12"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="12"   ParentRecordId="12" TABLE="Pathology" FIELD="PathQuality"     ID="PathQuality_12"     Runat="server"/>
          </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="12"  ParentRecordId="12" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_12"     LookupCode="ProcName" Runat="server" TabIndex="2"   EnableHiddenOnUIEvent="PathDateText_12,PathDate_12,PathSide_12,PathSite_12,PathSubsite_12,PathQuality_12"/> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="12"  ParentRecordId="12" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_12" LookupCode="OpSide"  Runat="server" TabIndex="6"  EnableHiddenOnUIEvent="PathDateText_12,PathDate_12,PathSide_12,PathSite_12,PathSubsite_12,PathQuality_12"/> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="12"  ParentRecordId="12" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_12" LookupCode="DxTarget"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_12,PathDate_12,PathSide_12,PathSite_12,PathSubsite_12,PathQuality_12" /> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="12"  ParentRecordId="12" TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_12" LookupCode="DxTarget"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_12,PathDate_12,PathSide_12,PathSite_12,PathSubsite_12,PathQuality_12"  /> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox DropDownWidth="250px" Width="80px" RecordId="12"  ParentRecordId="12" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_12" LookupCode="DataQuality"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_11,PathDate_11,PathSide_11,PathSite_11,PathSubsite_11,PathQuality_11"  /> </td>
        <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_12" runat="server"/></td>
     </tr>
       <tr style="DISPLAY: none;">
        <td style="white-space: nowrap;">
             <euc:EformCheckBox Width="20px" RecordId="13"  ParentRecordId="13" TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_13" Runat="server" Value="1" /> </td>
        <td style="white-space: nowrap;">
            <euc:EformTextBox  Width="80px" RecordId="13"   ParentRecordId="13" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_13" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  EnableHiddenOnUIEvent="PathDateText_13,PathDate_13,PathSide_13,PathSite_13,PathSubsite_13,PathQuality_13"/>
		    <euc:EformHidden                RecordId="13"   ParentRecordId="13" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_13"     Runat="server"/>
		    
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="13" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_13" Runat="server"  />  		    
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="13" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_13" Runat="server"  />  		    
           	<euc:EformTextBox Width="1px" style="display: none;"  RecordId="13" TABLE="OperatingRoomDetails" FIELD="OpQuality" ID="OpQuality_13"  Runat="server"  />  
		    </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="13"  ParentRecordId="13" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_13"   LookupCode="PathHistology"   Runat="server" /> 
           
            <euc:EformTextBox Width="1px" style="display: none;"  RecordId="13"  ParentRecordId="13" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_13" Runat="server" />
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="13"  ParentRecordId="13" TABLE="Pathology" FIELD="PathDate"     ID="PathDate_13"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="13"  ParentRecordId="13" TABLE="Pathology" FIELD="PathSide"     ID="PathSide_13"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="13"  ParentRecordId="13" TABLE="Pathology" FIELD="PathSite"     ID="PathSite_13"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="13"  ParentRecordId="13" TABLE="Pathology" FIELD="PathSubsite"     ID="PathSubsite_13"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="13"  ParentRecordId="13" TABLE="Pathology" FIELD="PathSpecimenType"     ID="PathSpecimenType_13"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="13"  ParentRecordId="13" TABLE="Pathology" FIELD="PathQuality"     ID="PathQuality_13"     Runat="server"/>
          </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="13" ParentRecordId="13" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_13"     LookupCode="ProcName" Runat="server" TabIndex="2"   EnableHiddenOnUIEvent="PathDateText_13,PathDate_13,PathSide_13,PathSite_13,PathSubsite_13,PathQuality_13"/> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="13" ParentRecordId="13" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_13" LookupCode="OpSide"  Runat="server" TabIndex="6"  EnableHiddenOnUIEvent="PathDateText_13,PathDate_13,PathSide_13,PathSite_13,PathSubsite_13,PathQuality_13"/> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="13" ParentRecordId="13" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_13" LookupCode="DxTarget"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_13,PathDate_13,PathSide_13,PathSite_13,PathSubsite_13,PathQuality_13" /> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="13" ParentRecordId="13" TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_13" LookupCode="DxTarget"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_13,PathDate_13,PathSide_13,PathSite_13,PathSubsite_13,PathQuality_13"  /> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox DropDownWidth="250px" Width="80px" RecordId="13" ParentRecordId="13" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_13" LookupCode="DataQuality"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_11,PathDate_11,PathSide_11,PathSite_11,PathSubsite_11,PathQuality_11"  /> </td>
        <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_13" runat="server"/></td>
     </tr>

       <tr style="DISPLAY: none;">
        <td style="white-space: nowrap;">
             <euc:EformCheckBox Width="20px" RecordId="14" ParentRecordId="14" TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_14" Runat="server" Value="1" /> </td>
        <td style="white-space: nowrap;">
            <euc:EformTextBox  Width="80px" RecordId="14" ParentRecordId="14"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_14" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  EnableHiddenOnUIEvent="PathDateText_14,PathDate_14,PathSide_14,PathSite_14,PathSubsite_14,PathQuality_14"/>
		    <euc:EformHidden                RecordId="14" ParentRecordId="14"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_14"     Runat="server"/>
		    
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_14" Runat="server"  />  		    
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_14" Runat="server"  />  		    
           	<euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" TABLE="OperatingRoomDetails" FIELD="OpQuality" ID="OpQuality_14"  Runat="server"  />  
		    </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="14" ParentRecordId="14" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_14"   LookupCode="PathHistology"   Runat="server"  /> 
           
            <euc:EformTextBox Width="1px" style="display: none;"  RecordId="14"  ParentRecordId="14" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_14" Runat="server" />
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" ParentRecordId="14"  TABLE="Pathology" FIELD="PathDate"     ID="PathDate_14"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="14"  ParentRecordId="14" TABLE="Pathology" FIELD="PathSide"     ID="PathSide_14"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" ParentRecordId="14"  TABLE="Pathology" FIELD="PathSite"     ID="PathSite_14"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" ParentRecordId="14"  TABLE="Pathology" FIELD="PathSubsite"     ID="PathSubsite_14"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" ParentRecordId="14"  TABLE="Pathology" FIELD="PathSpecimenType"     ID="PathSpecimenType_14"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" ParentRecordId="14"  TABLE="Pathology" FIELD="PathQuality"     ID="PathQuality_14"     Runat="server"/>
         </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="14" ParentRecordId="14" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_14"     LookupCode="ProcName" Runat="server" TabIndex="2"   EnableHiddenOnUIEvent="PathDateText_14,PathDate_14,PathSide_14,PathSite_14,PathSubsite_14,PathQuality_14"/> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="14" ParentRecordId="14" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_14" LookupCode="OpSide"  Runat="server" TabIndex="6"  EnableHiddenOnUIEvent="PathDateText_14,PathDate_14,PathSide_14,PathSite_14,PathSubsite_14,PathQuality_14"/> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="14" ParentRecordId="14" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_14" LookupCode="DxTarget"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_14,PathDate_14,PathSide_14,PathSite_14,PathSubsite_14,PathQuality_14" /> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="14" ParentRecordId="14" TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_14" LookupCode="DxTarget"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_14,PathDate_14,PathSide_14,PathSite_14,PathSubsite_14,PathQuality_14"  /> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox DropDownWidth="250px" Width="80px" RecordId="14" ParentRecordId="14" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_14" LookupCode="DataQuality"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_11,PathDate_11,PathSide_11,PathSite_11,PathSubsite_11,PathQuality_11"  /> </td>
        <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_14" runat="server"/></td>
     </tr>

       <tr style="DISPLAY: none;">
        <td style="white-space: nowrap;">
             <euc:EformCheckBox Width="20px" RecordId="15" ParentRecordId="15" TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_15" Runat="server" Value="1" /> </td>
        <td style="white-space: nowrap;">
            <euc:EformTextBox  Width="80px" RecordId="15" ParentRecordId="15"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_15" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  EnableHiddenOnUIEvent="PathDateText_15,PathDate_15,PathSide_15,PathSite_15,PathSubsite_15,PathQuality_15"/>
		    <euc:EformHidden                RecordId="15" ParentRecordId="15"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_15"     Runat="server"/>
		    
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_15" Runat="server"  />  		    
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_15" Runat="server"  />  		    
           	<euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" TABLE="OperatingRoomDetails" FIELD="OpQuality" ID="OpQuality_15"  Runat="server"  />  
		    </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="15" ParentRecordId="15" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_15"   LookupCode="PathHistology"   Runat="server"  /> 
           
            <euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" ParentRecordId="15"  TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_15" Runat="server" />
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" ParentRecordId="15"  TABLE="Pathology" FIELD="PathDate"     ID="PathDate_15"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" ParentRecordId="15"  TABLE="Pathology" FIELD="PathSide"     ID="PathSide_15"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" ParentRecordId="15"  TABLE="Pathology" FIELD="PathSite"     ID="PathSite_15"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" ParentRecordId="15"  TABLE="Pathology" FIELD="PathSubsite"     ID="PathSubsite_15"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" ParentRecordId="15"  TABLE="Pathology" FIELD="PathSpecimenType"     ID="PathSpecimenType_15"     Runat="server"/>
		    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" ParentRecordId="15"  TABLE="Pathology" FIELD="PathQuality"     ID="PathQuality_15"     Runat="server"/>
          </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="15" ParentRecordId="15" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_15"     LookupCode="ProcName" Runat="server" TabIndex="2"   EnableHiddenOnUIEvent="PathDateText_15,PathDate_15,PathSide_15,PathSite_15,PathSubsite_15,PathQuality_15"/> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="15" ParentRecordId="15" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_15" LookupCode="OpSide"  Runat="server" TabIndex="6"  EnableHiddenOnUIEvent="PathDateText_15,PathDate_15,PathSide_15,PathSite_15,PathSubsite_15,PathQuality_15"/> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="15" ParentRecordId="15" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_15" LookupCode="DxTarget"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_15,PathDate_15,PathSide_15,PathSite_15,PathSubsite_15,PathQuality_15" /> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox Width="80px" RecordId="15" ParentRecordId="15" TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_15" LookupCode="DxTarget"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_15,PathDate_15,PathSide_15,PathSite_15,PathSubsite_15,PathQuality_15"  /> </td>
        <td style="white-space: nowrap;">
            <euc:EformComboBox DropDownWidth="250px" Width="80px" RecordId="15" ParentRecordId="15" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_15" LookupCode="DataQuality"  Runat="server" TabIndex="6" EnableHiddenOnUIEvent="PathDateText_11,PathDate_11,PathSide_11,PathSite_11,PathSubsite_11,PathQuality_11"  /> </td>
        <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_15" runat="server"/></td>
     </tr>
                            
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'SalivaryGlandProcedureHistoryHtmlTable');" />

<br /><br /><br />

<script type="text/javascript">
        
    //Adds events to controls 
    addEvents1($('<%= ProcDateText_11.ClientID %>'),$('<%= ProcDate_11.ClientID %>'), $('<%= ProcName_11.ClientID %>'), $('<%= ProcSide_11.ClientID %>'), $('<%= ProcSite_11.ClientID %>'), $('<%= ProcSubsite_11.ClientID %>'), $('<%= ProcQuality_11.ClientID %>'), $('<%= PathDateText_11.ClientID %>'), $('<%= PathDate_11.ClientID %>'), $('<%= PathSide_11.ClientID %>'), $('<%= PathSite_11.ClientID %>'), $('<%= PathSubsite_11.ClientID %>'), $('<%= PathQuality_11.ClientID %>'), $('<%= PathHistology_11.ClientID %>'), $('<%= PathSpecimenType_11.ClientID %>'), $('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpQuality_11.ClientID %>'));
    addEvents1($('<%= ProcDateText_12.ClientID %>'),$('<%= ProcDate_12.ClientID %>'), $('<%= ProcName_12.ClientID %>'), $('<%= ProcSide_12.ClientID %>'), $('<%= ProcSite_12.ClientID %>'), $('<%= ProcSubsite_12.ClientID %>'), $('<%= ProcQuality_12.ClientID %>'), $('<%= PathDateText_12.ClientID %>'), $('<%= PathDate_12.ClientID %>'), $('<%= PathSide_12.ClientID %>'), $('<%= PathSite_12.ClientID %>'), $('<%= PathSubsite_12.ClientID %>'), $('<%= PathQuality_12.ClientID %>'), $('<%= PathHistology_12.ClientID %>'), $('<%= PathSpecimenType_12.ClientID %>'), $('<%= OpDateText_12.ClientID %>'), $('<%= OpDate_12.ClientID %>'), $('<%= OpQuality_12.ClientID %>'));
    addEvents1($('<%= ProcDateText_13.ClientID %>'),$('<%= ProcDate_13.ClientID %>'), $('<%= ProcName_13.ClientID %>'), $('<%= ProcSide_13.ClientID %>'), $('<%= ProcSite_13.ClientID %>'), $('<%= ProcSubsite_13.ClientID %>'), $('<%= ProcQuality_13.ClientID %>'), $('<%= PathDateText_13.ClientID %>'), $('<%= PathDate_13.ClientID %>'), $('<%= PathSide_13.ClientID %>'), $('<%= PathSite_13.ClientID %>'), $('<%= PathSubsite_13.ClientID %>'), $('<%= PathQuality_13.ClientID %>'), $('<%= PathHistology_13.ClientID %>'), $('<%= PathSpecimenType_13.ClientID %>'), $('<%= OpDateText_13.ClientID %>'), $('<%= OpDate_13.ClientID %>'), $('<%= OpQuality_13.ClientID %>'));
    addEvents1($('<%= ProcDateText_14.ClientID %>'),$('<%= ProcDate_14.ClientID %>'), $('<%= ProcName_14.ClientID %>'), $('<%= ProcSide_14.ClientID %>'), $('<%= ProcSite_14.ClientID %>'), $('<%= ProcSubsite_14.ClientID %>'), $('<%= ProcQuality_14.ClientID %>'), $('<%= PathDateText_14.ClientID %>'), $('<%= PathDate_14.ClientID %>'), $('<%= PathSide_14.ClientID %>'), $('<%= PathSite_14.ClientID %>'), $('<%= PathSubsite_14.ClientID %>'), $('<%= PathQuality_14.ClientID %>'), $('<%= PathHistology_14.ClientID %>'), $('<%= PathSpecimenType_14.ClientID %>'), $('<%= OpDateText_14.ClientID %>'), $('<%= OpDate_14.ClientID %>'), $('<%= OpQuality_14.ClientID %>'));
    addEvents1($('<%= ProcDateText_15.ClientID %>'),$('<%= ProcDate_15.ClientID %>'), $('<%= ProcName_15.ClientID %>'), $('<%= ProcSide_15.ClientID %>'), $('<%= ProcSite_15.ClientID %>'), $('<%= ProcSubsite_15.ClientID %>'), $('<%= ProcQuality_15.ClientID %>'), $('<%= PathDateText_15.ClientID %>'), $('<%= PathDate_15.ClientID %>'), $('<%= PathSide_15.ClientID %>'), $('<%= PathSite_15.ClientID %>'), $('<%= PathSubsite_15.ClientID %>'), $('<%= PathQuality_15.ClientID %>'), $('<%= PathHistology_15.ClientID %>'), $('<%= PathSpecimenType_15.ClientID %>'), $('<%= OpDateText_15.ClientID %>'), $('<%= OpDate_15.ClientID %>'), $('<%= OpQuality_15.ClientID %>'));

    function addEvents1(procDateTextID,procDateID, procNameID,  procSideID, procSiteID, procSubsiteID, procQualityID, pathDateTextID, pathDate, pathSideID, pathSiteID, pathSubsiteID, pathQualityID, pathHistologyID, pathSpecimenID, opDateTextID, opDateID, opQualityID)
    { 
        $(procDateTextID).addEvent('blur',curry(setPathHiddenFields, procDateTextID,procDateID, procNameID,  procSideID, procSiteID, procSubsiteID, procQualityID, pathDateTextID, pathDate, pathSideID, pathSiteID, pathSubsiteID, pathQualityID, pathHistologyID, pathSpecimenID, opDateTextID, opDateID, opQualityID));
        $(procNameID).addEvent('blur',curry(setPathHiddenFields, procDateTextID,procDateID, procNameID,  procSideID, procSiteID, procSubsiteID, procQualityID, pathDateTextID, pathDate, pathSideID, pathSiteID, pathSubsiteID, pathQualityID, pathHistologyID, pathSpecimenID, opDateTextID, opDateID, opQualityID));
        $(procSideID).addEvent('blur',curry(setPathHiddenFields, procDateTextID,procDateID, procNameID,  procSideID, procSiteID, procSubsiteID, procQualityID, pathDateTextID, pathDate, pathSideID, pathSiteID, pathSubsiteID, pathQualityID, pathHistologyID, pathSpecimenID, opDateTextID, opDateID, opQualityID));
        $(procSiteID).addEvent('blur',curry(setPathHiddenFields, procDateTextID,procDateID, procNameID,  procSideID, procSiteID, procSubsiteID, procQualityID, pathDateTextID, pathDate, pathSideID, pathSiteID, pathSubsiteID, pathQualityID, pathHistologyID, pathSpecimenID, opDateTextID, opDateID, opQualityID));
        $(procSubsiteID).addEvent('blur',curry(setPathHiddenFields, procDateTextID,procDateID, procNameID,  procSideID, procSiteID, procSubsiteID, procQualityID, pathDateTextID, pathDate, pathSideID, pathSiteID, pathSubsiteID, pathQualityID, pathHistologyID, pathSpecimenID, opDateTextID, opDateID, opQualityID));
        $(pathHistologyID).addEvent('blur',curry(setPathHiddenFields, procDateTextID,procDateID, procNameID,  procSideID, procSiteID, procSubsiteID, procQualityID, pathDateTextID, pathDate, pathSideID, pathSiteID, pathSubsiteID, pathQualityID, pathHistologyID, pathSpecimenID, opDateTextID, opDateID, opQualityID));
        $(procQualityID).addEvent('blur',curry(setPathHiddenFields, procDateTextID,procDateID, procNameID,  procSideID, procSiteID, procSubsiteID, procQualityID, pathDateTextID, pathDate, pathSideID, pathSiteID, pathSubsiteID, pathQualityID, pathHistologyID, pathSpecimenID, opDateTextID, opDateID, opQualityID));
    }

    function setPathHiddenFields(procDateTextID,procDateID, procNameID,  procSideID, procSiteID, procSubsiteID, procQualityID, pathDateTextID, pathDate, pathSideID, pathSiteID, pathSubsiteID, pathQualityID, pathHistologyID, pathSpecimenID, opDateTextID, opDateID, opQualityID) {

        
        if (pathHistologyID.value != '' || procDateTextID.value != '' || procSideID.value != '' || procSiteID.value != '' || procSubsiteID.value != '' || procQualityID.value != '' || procNameID.value != '')
        {
            opDateTextID.value = procDateTextID.value;
            opDateID.value = procDateID.value;
            opQualityID.value = procQualityID.value;
           
            if (pathHistologyID.value != '')
            {
                pathDateTextID.value = procDateTextID.value;
                pathDate.value = procDateID.value;
                pathSideID.value = procSideID.value;
                pathSiteID.value = procSiteID.value;
                pathSubsiteID.value = procSubsiteID.value;
                pathQualityID.value = procQualityID.value;
                pathSpecimenID.value = procNameID.value;
            }
            else
            {
                pathDateTextID.value = '';
                pathDate.value = '';
                pathSideID.value = '';
                pathSiteID.value = '';
                pathSubsiteID.value = '';
                pathQualityID.value = '';
                pathSpecimenID.value = '';
            }
        }
        else
        {
            opDateTextID.value = '';
            opDateID.value = '';
            opQualityID.value = '';
            procQualityID.value = '';
            pathDateTextID.value = '';
            pathDate.value = '';
            pathSideID.value = '';
            pathSiteID.value = '';
            pathSubsiteID.value = '';
            pathQualityID.value = '';  
            pathSpecimenID.value = '';      
        }
        
    }
</script>
