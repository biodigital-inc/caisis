<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.MedTxBreastFU" CodeFile="MedTxBreastFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">

    tableArray.BreastMedTxTbl="BreastMedTxTbl";
    tableArray.BreastRadTxTbl="BreastRadTxTbl";    

</script>

<a name="MedTxBreastFU" /><span class="controlBoxTitle">Medical Therapies</span> <br/>

<!-- Retrieving Complications values from previous user control -->
    <euc:EformTextBox RecordId="1" style="display:none;width:1px;" TABLE="Encounters" FIELD="EncDateText" Runat="server" 
        ID="EncDateText" />
    <euc:EFormTextBox style="display:none;width:1px;" Table="NoTable" Field="CellulitisYesNo" Runat="server" ID="CellulitisYesNo"/>
    <euc:EFormTextBox RecordId="1" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_1"/>
    <euc:EformTextBox RecordId="1" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" 
        ID="ToxDateText_1"/>
    <euc:EformTextBox RecordId="1" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_1"/>
    <euc:EformTextBox RecordId="1" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" ID="ToxQuality_1"/>
    
    <euc:EFormTextBox style="display:none;width:1px;" Table="NoTable" Field="LymphedemaYesNo" Runat="server" ID="LymphedemaYesNo"/>
    <euc:EFormTextBox RecordId="2" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_2"/>
    <euc:EformTextBox RecordId="2" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" 
        ID="ToxDateText_2"/>
    <euc:EformTextBox RecordId="2" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_2"/>
    <euc:EformTextBox RecordId="2" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" ID="ToxQuality_2"/>
    
    <euc:EFormTextBox style="display:none;width:1px;" Table="NoTable" Field="WoundProblemYesNo" Runat="server" ID="WoundProblemYesNo"/>
    <euc:EFormTextBox RecordId="3" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_3"/>
    <euc:EformTextBox RecordId="3" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" 
        ID="ToxDateText_3"/>
    <euc:EformTextBox RecordId="3" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_3"/>
    <euc:EformTextBox RecordId="3" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" ID="ToxQuality_3"/>
<!-- End -->

<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
 <tr >
    <td style="white-space:nowrap;"><strong>Any medical therapies since last appointment ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="MedTxYesNo" id="MedTxYesNo" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
    <td style="width:50%"></td>
  </tr>
  <tr id="MedTxTR" runat="server" style="display: none;">
    <td colspan="3">
    <span class="controlBoxTitle" style="font-size: 12px;">Previous Medical Therapies</span><br/>
    <table cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="MedTxHxTable">
        <tr>
	        <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:130px">Protocol #</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:90px">Start Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:90px">Stop Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:50px">Agent</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:50px">Type</td>		    
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:60px">Indication</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:60px">Disease</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:60px">Schedule</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:60px">Institution</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:60px">Notes</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:50px">Data Qlty</td>
	        <td  class="controlBoxDataGridTitleColumn" style="width:20px">&nbsp;</td>
          </tr>
          
          <asp:Repeater ID="BreastFUMedTxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound">
            <ItemTemplate>
                <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxDate,MedTxStopDateText,MedTxStopDate,MedTxType,MedTxAgent,MedTxIndication,MedTxDisease,MedTxSchedule,MedTxInstitution,MedTxNotes,MedTxQuality','MedicalTherapy');">
                    <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;</td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxDateText")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxAgent")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxType")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxIndication")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxDisease")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxSchedule")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxInstitution")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxNotes")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxQuality")%></td>
                    <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9"
                            height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
</table><br /><br />
    
    <span class="controlBoxTitle" style="font-size: 12px;">Add Medical Therapies</span><br/>
    <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastMedTxTbl">    
        <tr>
	        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Protocol #</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Start Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Stop Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Agent</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>		    
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Indication</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Schedule</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
	        <td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
          </tr>
                         
          <tr id="BreastMedTxTr1">
            <td align="center"><euc:EformDropDownList RecordId="1" runat="server" ID="ProtocolId_1" Table="MedicalTherapy" 
                Field="ProtocolId" LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)" Width="110px" /></td>
                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="1" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxDateText" ID="MedTxDateText_1"/>
		        <euc:EformHidden RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_1"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="1" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_1"/>
		        <euc:EformHidden RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_1"/></td>	
		        
		    <td align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" 
                ID="MedTxAgent_1" LookupCode="MedTxAgent" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" 
                ID="MedTxType_1" LookupCode="MedTxType,Disease,Breast" style="width:60px" DropDownWidth="300px"/></td>            
                
            <td align="center"><euc:EformSelect RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" 
                ID="MedTxIndication_1" LookupCode="MedIndication" style="width:60px" DropDownWidth="150px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_1" LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformSelect RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_1" LookupCode="MedSchedule" style="width:60px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" 
                ID="MedTxInstitution_1" LookupCode="Institution" style="width:60px" DropDownWidth="250px"/></td>
                
	        <td align="center"><euc:EformTextBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_1" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
                
	        <td align="center"><euc:EformDropDownList RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" 
	            ID="MedTxQuality_1" LookupCode="DataQuality"/></td>
	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedTxTr2" style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="2" runat="server" ID="ProtocolId_2" Table="MedicalTherapy" 
                Field="ProtocolId" LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)"  Width="110px"/></td>
                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="2" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxDateText" ID="MedTxDateText_2"/>
		        <euc:EformHidden RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_2"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="2" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_2"/>
		        <euc:EformHidden RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_2"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" 
                ID="MedTxAgent_2" LookupCode="MedTxAgent" style="width:60px" DropDownWidth="250px"/></td>	
		        
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" 
                ID="MedTxType_2" LookupCode="MedTxType,Disease,Breast" style="width:60px" DropDownWidth="300px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" 
                ID="MedTxIndication_2" LookupCode="MedIndication" style="width:60px" DropDownWidth="150px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_2" LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformSelect RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_2" LookupCode="MedSchedule" style="width:60px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" 
                ID="MedTxInstitution_2" LookupCode="Institution" style="width:60px" DropDownWidth="250px"/></td>
                
	        <td align="center"><euc:EformTextBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_2" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
                
	        <td align="center"><euc:EformDropDownList RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" 
	            ID="MedTxQuality_2" LookupCode="DataQuality"/></td>
	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedTxTr3" style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="3" runat="server" ID="ProtocolId_3" Table="MedicalTherapy" 
                Field="ProtocolId" LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)"  Width="110px"/></td>
                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="3" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxDateText" ID="MedTxDateText_3"/>
		        <euc:EformHidden RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_3"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="3" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_3"/>
		        <euc:EformHidden RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_3"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" 
                ID="MedTxAgent_3" LookupCode="MedTxAgent" style="width:60px" DropDownWidth="250px"/></td>	
		        
            <td align="center"><euc:EformSelect RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" 
                ID="MedTxType_3" LookupCode="MedTxType,Disease,Breast" style="width:60px" DropDownWidth="300px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" 
                ID="MedTxIndication_3" LookupCode="MedIndication" style="width:60px" DropDownWidth="150px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_3" LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformSelect RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_3" LookupCode="MedSchedule" style="width:60px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" 
                ID="MedTxInstitution_3" LookupCode="Institution" style="width:60px" DropDownWidth="250px"/></td>
                
	        <td align="center"><euc:EformTextBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_3" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
                
	        <td align="center"><euc:EformDropDownList RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" 
	            ID="MedTxQuality_3" LookupCode="DataQuality"/></td>	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedTxTr4" style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="4" runat="server" ID="ProtocolId_4" Table="MedicalTherapy" 
                Field="ProtocolId" LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)"  Width="110px"/></td>
                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="4" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxDateText" ID="MedTxDateText_4"/>
		        <euc:EformHidden RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_4"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="4" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_4"/>
		        <euc:EformHidden RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_4"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" 
                ID="MedTxAgent_4" LookupCode="MedTxAgent" style="width:60px" DropDownWidth="250px"/></td>	
		        
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" 
                ID="MedTxType_4" LookupCode="MedTxType,Disease,Breast" style="width:60px" DropDownWidth="300px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" 
                ID="MedTxIndication_4" LookupCode="MedIndication" style="width:60px" DropDownWidth="150px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_4" LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformSelect RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_4" LookupCode="MedSchedule" style="width:60px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" 
                ID="MedTxInstitution_4" LookupCode="Institution" style="width:60px" DropDownWidth="250px"/></td>
                
	        <td align="center"><euc:EformTextBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_4" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
                
	        <td align="center"><euc:EformDropDownList RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" 
	            ID="MedTxQuality_4" LookupCode="DataQuality"/></td>	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedTxTr5" style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="5" runat="server" ID="ProtocolId_5" Table="MedicalTherapy" 
                Field="ProtocolId" LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)"  Width="110px"/></td>
                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="5" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxDateText" ID="MedTxDateText_5"/>
		        <euc:EformHidden RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_5"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="5" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_5"/>
		        <euc:EformHidden RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_5"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" 
                ID="MedTxAgent_5" LookupCode="MedTxAgent" style="width:60px" DropDownWidth="250px"/></td>	
		        
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" 
                ID="MedTxType_5" LookupCode="MedTxType,Disease,Breast" style="width:60px" DropDownWidth="300px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" 
                ID="MedTxIndication_5" LookupCode="MedIndication" style="width:60px" DropDownWidth="150px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_5" LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformSelect RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_5" LookupCode="MedSchedule" style="width:60px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" 
                ID="MedTxInstitution_5" LookupCode="Institution" style="width:60px" DropDownWidth="250px"/></td>
                
	        <td align="center"><euc:EformTextBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_5" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
                
	        <td align="center"><euc:EformDropDownList RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" 
	            ID="MedTxQuality_5" LookupCode="DataQuality"/></td>	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedTxTr6" style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="6" runat="server" ID="ProtocolId_6" Table="MedicalTherapy" 
                Field="ProtocolId" LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)"  Width="110px"/></td>
                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="6" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxDateText" ID="MedTxDateText_6"/>
		        <euc:EformHidden RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_6"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="6" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_6"/>
		        <euc:EformHidden RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_6"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" 
                ID="MedTxAgent_6" LookupCode="MedTxAgent" style="width:60px" DropDownWidth="250px"/></td>	
		        
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" 
                ID="MedTxType_6" LookupCode="MedTxType,Disease,Breast" style="width:60px" DropDownWidth="300px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" 
                ID="MedTxIndication_6" LookupCode="MedIndication" style="width:60px" DropDownWidth="150px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_6" LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformSelect RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_6" LookupCode="MedSchedule" style="width:60px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" 
                ID="MedTxInstitution_6" LookupCode="Institution" style="width:60px" DropDownWidth="250px"/></td>
                
	        <td align="center"><euc:EformTextBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_6" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
                
	        <td align="center"><euc:EformDropDownList RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" 
	            ID="MedTxQuality_6" LookupCode="DataQuality"/></td>	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedTxTr7" style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="7" runat="server" ID="ProtocolId_7" Table="MedicalTherapy" 
                Field="ProtocolId" LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)"  Width="110px"/></td>
                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="7" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxDateText" ID="MedTxDateText_7"/>
		        <euc:EformHidden RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_7"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="7" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_7"/>
		        <euc:EformHidden RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_7"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" 
                ID="MedTxAgent_7" LookupCode="MedTxAgent" style="width:60px" DropDownWidth="250px"/></td>	
		        
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" 
                ID="MedTxType_7" LookupCode="MedTxType,Disease,Breast" style="width:60px" DropDownWidth="300px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" 
                ID="MedTxIndication_7" LookupCode="MedIndication" style="width:60px" DropDownWidth="150px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_7" LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformSelect RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_7" LookupCode="MedSchedule" style="width:60px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" 
                ID="MedTxInstitution_7" LookupCode="Institution" style="width:60px" DropDownWidth="250px"/></td>
                
	        <td align="center"><euc:EformTextBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_7" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
                
	        <td align="center"><euc:EformDropDownList RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" 
	            ID="MedTxQuality_7" LookupCode="DataQuality"/></td>	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedTxTr8" style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="8" runat="server" ID="ProtocolId_8" Table="MedicalTherapy" 
                Field="ProtocolId" LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)"  Width="110px"/></td>
                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="8" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxDateText" ID="MedTxDateText_8"/>
		        <euc:EformHidden RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_8"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="8" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_8"/>
		        <euc:EformHidden RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_8"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" 
                ID="MedTxAgent_8" LookupCode="MedTxAgent" style="width:60px" DropDownWidth="250px"/></td>	
		        
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" 
                ID="MedTxType_8" LookupCode="MedTxType,Disease,Breast" style="width:60px" DropDownWidth="300px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" 
                ID="MedTxIndication_8" LookupCode="MedIndication" style="width:60px" DropDownWidth="150px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_8" LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformSelect RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_8" LookupCode="MedSchedule" style="width:60px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" 
                ID="MedTxInstitution_8" LookupCode="Institution" style="width:60px" DropDownWidth="250px"/></td>
                
	        <td align="center"><euc:EformTextBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_8" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
                
	        <td align="center"><euc:EformDropDownList RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" 
	            ID="MedTxQuality_8" LookupCode="DataQuality"/></td>	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedTxTr9" style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="9" runat="server" ID="ProtocolId_9" Table="MedicalTherapy" 
                Field="ProtocolId" LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)"  Width="110px"/></td>
                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="9" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxDateText" ID="MedTxDateText_9"/>
		        <euc:EformHidden RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_9"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="9" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_9"/>
		        <euc:EformHidden RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_9"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" 
                ID="MedTxAgent_9" LookupCode="MedTxAgent" style="width:60px" DropDownWidth="250px"/></td>	
		        
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" 
                ID="MedTxType_9" LookupCode="MedTxType,Disease,Breast" style="width:60px" DropDownWidth="300px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" 
                ID="MedTxIndication_9" LookupCode="MedIndication" style="width:60px" DropDownWidth="150px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_9" LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformSelect RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_9" LookupCode="MedSchedule" style="width:60px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" 
                ID="MedTxInstitution_9" LookupCode="Institution" style="width:60px" DropDownWidth="250px"/></td>
                
	        <td align="center"><euc:EformTextBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_9" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
                
	        <td align="center"><euc:EformDropDownList RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" 
	            ID="MedTxQuality_9" LookupCode="DataQuality"/></td>	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedTxTr10" style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="10" runat="server" ID="ProtocolId_10" Table="MedicalTherapy" 
                Field="ProtocolId" LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)"  Width="110px"/></td>
                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="10" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxDateText" ID="MedTxDateText_10"/>
		        <euc:EformHidden RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_10"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="10" Runat="server" 
                TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_10"/>
		        <euc:EformHidden RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_10"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" 
                ID="MedTxAgent_10" LookupCode="MedTxAgent" style="width:60px" DropDownWidth="250px"/></td>	
		        
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" 
                ID="MedTxType_10" LookupCode="MedTxType,Disease,Breast" style="width:60px" DropDownWidth="300px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" 
                ID="MedTxIndication_10" LookupCode="MedIndication" style="width:60px" DropDownWidth="150px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_10" LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformSelect RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_10" LookupCode="MedSchedule" style="width:60px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" 
                ID="MedTxInstitution_10" LookupCode="Institution" style="width:60px" DropDownWidth="250px"/></td>
                
	        <td align="center"><euc:EformTextBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_10" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
                
	        <td align="center"><euc:EformDropDownList RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" 
	            ID="MedTxQuality_10" LookupCode="DataQuality"/></td>	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" 
            onclick="return showFirstAdditionalRow(this,'BreastMedTxTbl');" /><br /><br />
</td>
  </tr>
</table><br /><br />


<span class="controlBoxTitle">Radiation Therapies</span> <br/>
<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
 <tr >
    <td style="white-space:nowrap;"><strong>Any radiation therapies since last appointment ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="RadTxYesNo" id="RadTxYesNo" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
	<td style="width:50%"></td>
  </tr>
  
  <tr id="RadTxTR" runat="server" style="display: none;">
     <td colspan="3">
     <span class="controlBoxTitle" style="font-size: 12px;">Previous Radiation Therapies</span><br/>
     <table cellpadding="0" cellspacing="0" class="ClinicalEformTable" id="RadTxHxTbl">
        <tr>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:95px;">Start Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:95px;">Stop Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:90px;">Type</td>		    
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:60px;">Indication</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:60px;">Target</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:50px;">Total<br />Dose</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:50px;">Units</td>		    
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:60px;">Disease</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:90px;">Institution</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:60px;">Notes</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:50px;">Data Qlty</td>
	        <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:20px;">&nbsp;</td>
          </tr>
          <asp:Repeater ID="BreastFURadTxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound">
            <ItemTemplate>
                <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxStopDateText,RadTxStopDate,RadTxType,RadTxIndication,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxDisease,RadTxInstitution,RadTxNotes,RadTxQuality','RadiationTherapy');">
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxDateText")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxStopDateText")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxType")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxIndication")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTarget")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxUnits")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxDisease")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxInstitution")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxNotes")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxQuality")%></td>
                    <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9"
                            height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
          
     </table><br /><br />
    
    <span class="controlBoxTitle" style="font-size: 12px;">Add Radiation Therapies</span><br/>     
        <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastRadTxTbl">
          <tr>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Start Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Stop Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>		    
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Indication</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Target</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Total<br />Dose</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Units</td>		    
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
	        <td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
          </tr>
          
          <tr id="BreastRadTxTr1">
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="1" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_1"/>
		        <euc:EformHidden RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_1"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="1" TABLE="RadiationTherapy" 
                    FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_1"/>
	            <euc:EformHidden RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_1"/></td>
            
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_1" 
                LookupCode="RadTxType" Width="70px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_1" 
                LookupCode="Indication" style="width:60px" DropDownWidth="250px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_1" 
                LookupCode="RadTxTarget" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                    ID="RadTxTotalDose_1" ShowNumberPad="true" Width="30px" /></td>
                    
            <td align="center"><euc:EformDropDownList RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_1" 
                LookupCode="RadTxUnits" Width="50px"/></td>            
                
            <td align="center"><euc:EformSelect RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_1" 
                LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                ID="RadTxInstitution_1" LookupCode="Institution" style="width:80px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                ID="RadTxNotes_1" ShowTextEditor="true" Width="60px"/></td>
                
            <td align="center"><euc:EformDropDownList RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_1" 
                    LookupCode="DataQuality"/></td>       
                         
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>     
        
        <tr id="BreastRadTxTr2" style="display:none;">
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="2" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_2"/>
		        <euc:EformHidden RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_2"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="2" TABLE="RadiationTherapy" 
                    FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_2"/>
	            <euc:EformHidden RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_2"/></td>
            
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_2" 
                LookupCode="RadTxType" Width="70px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_2" 
                LookupCode="Indication" style="width:60px" DropDownWidth="250px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_2" 
                LookupCode="RadTxTarget" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                    ID="RadTxTotalDose_2" ShowNumberPad="true" Width="30px" /></td>
                    
            <td align="center"><euc:EformDropDownList RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_2" 
                LookupCode="RadTxUnits" Width="50px"/></td>            
                
            <td align="center"><euc:EformSelect RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_2" 
                LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                ID="RadTxInstitution_2" LookupCode="Institution" style="width:80px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                ID="RadTxNotes_2" ShowTextEditor="true" Width="60px"/></td>
                
            <td align="center"><euc:EformDropDownList RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_2" 
                    LookupCode="DataQuality"/></td>       
                         
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastRadTxTr3" style="display:none;">
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="3" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_3"/>
		        <euc:EformHidden RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_3"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="3" TABLE="RadiationTherapy" 
                    FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_3"/>
	            <euc:EformHidden RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_3"/></td>
            
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_3" 
                LookupCode="RadTxType" Width="70px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_3" 
                LookupCode="Indication" style="width:60px" DropDownWidth="250px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_3" 
                LookupCode="RadTxTarget" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                    ID="RadTxTotalDose_3" ShowNumberPad="true" Width="30px" /></td>
                    
            <td align="center"><euc:EformDropDownList RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_3" 
                LookupCode="RadTxUnits" Width="50px"/></td>            
                
            <td align="center"><euc:EformSelect RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_3" 
                LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                ID="RadTxInstitution_3" LookupCode="Institution" style="width:80px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                ID="RadTxNotes_3" ShowTextEditor="true" Width="60px"/></td>
                
            <td align="center"><euc:EformDropDownList RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_3" 
                    LookupCode="DataQuality"/></td>       
                         
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastRadTxTr4" style="display:none;">
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="4" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_4"/>
		        <euc:EformHidden RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_4"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="4" TABLE="RadiationTherapy" 
                    FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_4"/>
	            <euc:EformHidden RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_4"/></td>
            
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_4" 
                LookupCode="RadTxType" Width="70px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_4" 
                LookupCode="Indication" style="width:60px" DropDownWidth="250px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_4" 
                LookupCode="RadTxTarget" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                    ID="RadTxTotalDose_4" ShowNumberPad="true" Width="30px" /></td>
                    
            <td align="center"><euc:EformDropDownList RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_4" 
                LookupCode="RadTxUnits" Width="50px"/></td>            
                
            <td align="center"><euc:EformSelect RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_4" 
                LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                ID="RadTxInstitution_4" LookupCode="Institution" style="width:80px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                ID="RadTxNotes_4" ShowTextEditor="true" Width="60px"/></td>
                
            <td align="center"><euc:EformDropDownList RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_4" 
                    LookupCode="DataQuality"/></td>       
                         
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastRadTxTr5" style="display:none;">
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="5" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_5"/>
		        <euc:EformHidden RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_5"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="5" TABLE="RadiationTherapy" 
                    FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_5"/>
	            <euc:EformHidden RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_5"/></td>
            
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_5" 
                LookupCode="RadTxType" Width="70px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_5" 
                LookupCode="Indication" style="width:60px" DropDownWidth="250px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_5" 
                LookupCode="RadTxTarget" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                    ID="RadTxTotalDose_5" ShowNumberPad="true" Width="30px" /></td>
                    
            <td align="center"><euc:EformDropDownList RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_5" 
                LookupCode="RadTxUnits" Width="50px"/></td>            
                
            <td align="center"><euc:EformSelect RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_5" 
                LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                ID="RadTxInstitution_5" LookupCode="Institution" style="width:80px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                ID="RadTxNotes_5" ShowTextEditor="true" Width="60px"/></td>
                
            <td align="center"><euc:EformDropDownList RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_5" 
                    LookupCode="DataQuality"/></td>       
                         
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastRadTxTr6" style="display:none;">
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="6" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_6"/>
		        <euc:EformHidden RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_6"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="6" TABLE="RadiationTherapy" 
                    FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_6"/>
	            <euc:EformHidden RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_6"/></td>
            
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_6" 
                LookupCode="RadTxType" Width="70px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_6" 
                LookupCode="Indication" style="width:60px" DropDownWidth="250px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_6" 
                LookupCode="RadTxTarget" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                    ID="RadTxTotalDose_6" ShowNumberPad="true" Width="30px" /></td>
                    
            <td align="center"><euc:EformDropDownList RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_6" 
                LookupCode="RadTxUnits" Width="50px"/></td>            
                
            <td align="center"><euc:EformSelect RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_6" 
                LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                ID="RadTxInstitution_6" LookupCode="Institution" style="width:80px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                ID="RadTxNotes_6" ShowTextEditor="true" Width="60px"/></td>
                
            <td align="center"><euc:EformDropDownList RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_6" 
                    LookupCode="DataQuality"/></td>       
                         
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastRadTxTr7" style="display:none;">
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="7" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_7"/>
		        <euc:EformHidden RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_7"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="7" TABLE="RadiationTherapy" 
                    FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_7"/>
	            <euc:EformHidden RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_7"/></td>
            
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_7" 
                LookupCode="RadTxType" Width="70px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_7" 
                LookupCode="Indication" style="width:60px" DropDownWidth="250px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_7" 
                LookupCode="RadTxTarget" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                    ID="RadTxTotalDose_7" ShowNumberPad="true" Width="30px" /></td>
                    
            <td align="center"><euc:EformDropDownList RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_7" 
                LookupCode="RadTxUnits" Width="50px"/></td>            
                
            <td align="center"><euc:EformSelect RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_7" 
                LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                ID="RadTxInstitution_7" LookupCode="Institution" style="width:80px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                ID="RadTxNotes_7" ShowTextEditor="true" Width="60px"/></td>
                
            <td align="center"><euc:EformDropDownList RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_7" 
                    LookupCode="DataQuality"/></td>       
                         
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastRadTxTr8" style="display:none;">
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="8" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_8"/>
		        <euc:EformHidden RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_8"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="8" TABLE="RadiationTherapy" 
                    FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_8"/>
	            <euc:EformHidden RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_8"/></td>
            
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_8" 
                LookupCode="RadTxType" Width="70px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_8" 
                LookupCode="Indication" style="width:60px" DropDownWidth="250px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_8" 
                LookupCode="RadTxTarget" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                    ID="RadTxTotalDose_8" ShowNumberPad="true" Width="30px" /></td>
                    
            <td align="center"><euc:EformDropDownList RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_8" 
                LookupCode="RadTxUnits" Width="50px"/></td>            
                
            <td align="center"><euc:EformSelect RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_8" 
                LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                ID="RadTxInstitution_8" LookupCode="Institution" style="width:80px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                ID="RadTxNotes_8" ShowTextEditor="true" Width="60px"/></td>
                
            <td align="center"><euc:EformDropDownList RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_8" 
                    LookupCode="DataQuality"/></td>       
                         
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastRadTxTr9" style="display:none;">
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="9" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_9"/>
		        <euc:EformHidden RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_9"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="9" TABLE="RadiationTherapy" 
                    FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_9"/>
	            <euc:EformHidden RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_9"/></td>
            
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_9" 
                LookupCode="RadTxType" Width="70px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_9" 
                LookupCode="Indication" style="width:60px" DropDownWidth="250px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_9" 
                LookupCode="RadTxTarget" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                    ID="RadTxTotalDose_9" ShowNumberPad="true" Width="30px" /></td>
                    
            <td align="center"><euc:EformDropDownList RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_9" 
                LookupCode="RadTxUnits" Width="50px"/></td>            
                
            <td align="center"><euc:EformSelect RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_9" 
                LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                ID="RadTxInstitution_9" LookupCode="Institution" style="width:80px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                ID="RadTxNotes_9" ShowTextEditor="true" Width="60px"/></td>
                
            <td align="center"><euc:EformDropDownList RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_9" 
                    LookupCode="DataQuality"/></td>       
                         
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastRadTxTr10" style="display:none;">
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="10" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_10"/>
		        <euc:EformHidden RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_10"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="10" TABLE="RadiationTherapy" 
                    FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_10"/>
	            <euc:EformHidden RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_10"/></td>
            
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_10" 
                LookupCode="RadTxType" Width="70px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_10" 
                LookupCode="Indication" style="width:60px" DropDownWidth="250px"/></td>
            
            <td align="center"><euc:EformSelect RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_10" 
                LookupCode="RadTxTarget" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                    ID="RadTxTotalDose_10" ShowNumberPad="true" Width="30px" /></td>
                    
            <td align="center"><euc:EformDropDownList RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_10" 
                LookupCode="RadTxUnits" Width="50px"/></td>            
                
            <td align="center"><euc:EformSelect RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_10" 
                LookupCode="Disease" style="width:60px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                ID="RadTxInstitution_10" LookupCode="Institution" style="width:80px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                ID="RadTxNotes_10" ShowTextEditor="true" Width="60px"/></td>
                
            <td align="center"><euc:EformDropDownList RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_10" 
                    LookupCode="DataQuality"/></td>       
                         
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
               
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" 
            onclick="return showFirstAdditionalRow(this,'BreastRadTxTbl');" /><br /><br />
     </td>
  </tr>
</table><br /><br />



<script type="text/javascript">
   
    //Adds events for medTx   
    addMedTxEvent($('<%= MedTxYesNo.ClientID %>'),$('<%= MedTxTR.ClientID %>'));
    
    function addMedTxEvent(MedTxYesNoID,MedTxTRID)
    {  
        $(MedTxYesNoID).addEvent('click',curry(MedTxHxYesNo,MedTxYesNoID,MedTxTRID));

        // check on load as well
        MedTxHxYesNo(MedTxYesNoID,MedTxTRID);
    }
   
    function MedTxHxYesNo(MedTxYesNoID,MedTxTRID)
    {
       var MedTxYesNoRef = MedTxYesNoID.getElementsByTagName('input');
       
       for (var i = 0; i < MedTxYesNoRef.length; i++) 
        if (MedTxYesNoRef[i].checked) 
        {  
            MedTxHxRadioClick(MedTxYesNoRef[i].value,MedTxTRID);
        }
    }
    
    function MedTxHxRadioClick(MedTxoption_value,MedTxhideTR)
    {
      if (MedTxoption_value == "Yes")
      { 
        MedTxhideTR.style.display='block';
        
      } 
      else if (MedTxoption_value == "No")
      {
        MedTxhideTR.style.display='none';
        
        //clears all rows data
        for(var i=1;i<=10;i++)
        {
            clearElementsInParentRow(document.getElementById('BreastMedTxTr'+i));
        }
      }
    }
    
    
    //Adds events for radTx   
    addRadTxEvent($('<%= RadTxYesNo.ClientID %>'),$('<%= RadTxTR.ClientID %>'));
    
    function addRadTxEvent(RadTxYesNoID,RadTxTRID)
    {  
        $(RadTxYesNoID).addEvent('click',curry(RadTxHxYesNo,RadTxYesNoID,RadTxTRID));

        // check on load as well
        RadTxHxYesNo(RadTxYesNoID,RadTxTRID);
    }
   
    function RadTxHxYesNo(RadTxYesNoID,RadTxTRID)
    {
       var RadTxYesNoRef = RadTxYesNoID.getElementsByTagName('input');
       
       for (var i = 0; i < RadTxYesNoRef.length; i++) 
        if (RadTxYesNoRef[i].checked) 
        {  
            RadTxHxRadioClick(RadTxYesNoRef[i].value,RadTxTRID);
        }
    }
    
    function RadTxHxRadioClick(RadTxoption_value,RadTxhideTR)
    {
      if (RadTxoption_value == "Yes")
      { 
        RadTxhideTR.style.display='block';
        
      } 
      else if (RadTxoption_value == "No")
      {
        RadTxhideTR.style.display='none';
        
        //clears all rows data
        for(var i=1;i<=10;i++)
        {
            clearElementsInParentRow(document.getElementById('BreastRadTxTr'+i));
        }
      }
    }

</script>