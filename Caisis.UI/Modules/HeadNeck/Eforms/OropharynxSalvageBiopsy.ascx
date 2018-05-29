<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxSalvageBiopsy" CodeFile="OropharynxSalvageBiopsy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
 
<a name="OropharynxSalvageBiopsy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Salvage Diagnosis Biopsy"></asp:Label><br/>
<table  width="650" border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="OropharynxSalvageBiopsyHtmlTable" > 

          <tr>
            <td valign="top" style="white-space: nowrap;"><strong>Date</strong><br /> 
                <euc:EformTextBox  Width="100px" RecordId="17" ParentRecordId="17"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" EnableHiddenOnUIEvent="ProcSite,ProcQuality" />
				<euc:EformHidden                 RecordId="17" ParentRecordId="17"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate"     Runat="server"/>
                <euc:EformHidden Enabled="false" RecordId="17" ParentRecordId="17"  TABLE="Procedures" FIELD="ProcSite"     ID="ProcSite"     Value="Oropharynx" Runat="server"   />
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="17" ParentRecordId="17"  TABLE="Procedures" FIELD="ProcSubsite"     ID="ProcSubsite"     Runat="server"   /></td>

                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="17" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_16" Runat="server"  />
                <euc:EformTextBox  Width="1px" style="display: none" RecordId="17" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_16" Runat="server"  />
                <euc:EformTextBox  Width="1px" style="display: none" RecordId="17" TABLE="OperatingRoomDetails" FIELD="OpQuality" ID="OpQuality_16" Runat="server"  />

             <td align="left" style="white-space: nowrap;" valign="top" colspan="3" ><strong>Procedure</strong><br /> 
                    <euc:EformExtendedRadioButtonList style="white-space: nowrap;" RecordId="17" ParentRecordId="17" TABLE="Procedures" FIELD="ProcName" Runat="server" ID="ProcName" CellSpacing="2" CellPadding="2" RepeatDirection="Horizontal" RepeatLayout="Table" ShowOther="true" EnableHiddenOnUIEvent="ProcSite" >
                        <asp:ListItem Value="Punch Biopsy" Text="Punch Biopsy"  />
                        <asp:ListItem Value="Open Biopsy" Text="Open Biopsy"  />
                        <asp:ListItem Value="FNA" Text="FNA"  />
                    </euc:EformExtendedRadioButtonList></td>
        </tr>
          
        <tr>
         <td align="left" ><strong>Path #</strong><br /> 
            <euc:EformTextBox style="width: 100px;" RecordId="17" ParentRecordId="17"  TABLE="Pathology" FIELD="PathNum" ID="PathNum" Runat="server"  TabIndex="2" EnableHiddenOnUIEvent="PathDateText,PathDate,PathSite,PathQuality" /></td>

       <td align="left" style="white-space: nowrap;">
            <euc:EformHidden RecordId="17" ParentRecordId="17"  TABLE="Pathology" FIELD="PathDateText" ID="PathDateText" Runat="server" TabIndex="2"  />
            <euc:EformHidden RecordId="17" ParentRecordId="17"  TABLE="Pathology" FIELD="PathDate"     ID="PathDate"     Runat="server" TabIndex="2"  />
            <euc:EformHidden Enabled="false" RecordId="17" ParentRecordId="17"  TABLE="Pathology" FIELD="PathSite"     ID="PathSite"     Value="Oropharynx" Runat="server" TabIndex="2"  />
            <euc:EformHidden Enabled="false" RecordId="17" ParentRecordId="17"  TABLE="Pathology" FIELD="PathQuality" ID="PathQuality" Runat="server"  TabIndex="2" />
            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="17" ParentRecordId="17" TABLE="Pathology" FIELD="PathSpecimenType" ID="PathSpecimenType" Runat="server"  />

            <strong>Subsite</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="17" ParentRecordId="17"  TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" Runat="server"  TabIndex="2" EnableHiddenOnUIEvent="PathDateText,PathDate,PathSite,PathQuality"  /></td>
        
        <td align="left"style="white-space: nowrap;"> <strong>Side</strong><br /> 
            <euc:EformComboBox style="width: 100px;" DropDownHeight="auto" RecordId="17" ParentRecordId="17"  TABLE="Pathology" FIELD="PathSide" ID="PathSide" LookupCode="OpSide" Runat="server"  TabIndex="4" EnableHiddenOnUIEvent="PathDateText,PathDate,PathSite,PathQuality"  /></td>
        
        <td align="left"style="white-space: nowrap;"> <strong>Primary Histology</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="17" ParentRecordId="17"  TABLE="Pathology" FIELD="PathHistology" ID="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" Runat="server"  TabIndex="2" EnableHiddenOnUIEvent="PathDateText,PathDate,PathSite,PathQuality" /></td>
    </tr>
    
    <tr>

       <td align="left" style="white-space: nowrap;">
            <strong>PathKeratinization</strong><br /> 
            <euc:EformComboBox style="width: 100px;" DropDownHeight="auto" TABLE="NoTable" FIELD="PathKeratinizationSalvage" ID="PathKeratinization" LookupCode="YesNoUnknown" Runat="server"  TabIndex="2" EnableHiddenOnUIEvent="PathNotes"/>

   				<euc:EformHidden RecordId="17" ParentRecordId="17"   TABLE="Pathology" FIELD="PathNotes" ID="PathNotes"  Runat="server"/></td>
        <td align="left" style="white-space: nowrap;"><strong>Neural Invasion</strong><br /> 
            <euc:EformComboBox style="width: 100px;" DropDownHeight="auto" RecordId="1" ParentRecordId="17" TABLE="HeadNeckPath" FIELD="PathPerineuralInv" ID="PathPerineuralInv" LookupCode="YesNoUnknown" Runat="server"  TabIndex="2"  /></td>

        <td align="left" style="white-space: nowrap;"><strong>Lymphovascular</strong><br /> 
            <euc:EformComboBox style="width: 100px;" DropDownHeight="auto" RecordId="1" ParentRecordId="17" TABLE="HeadNeckPath" FIELD="PathVascularInv" ID="PathVascularInv" LookupCode="YesNoUnknown" Runat="server"  TabIndex="2"/></td>


        <td align="left" style="white-space: nowrap;"><strong>Thickness (cm): </strong><br />
            <euc:EformHidden Enabled="false" RecordId="1" ParentRecordId="17" TABLE="PathologyFinding" FIELD="PathFindSite"      ID="PathFindSite" Value="Oropharynx" Runat="server" TabIndex="2"  />
            <euc:EformHidden RecordId="1" ParentRecordId="17" TABLE="PathologyFinding" FIELD="PathFindSubsite"   ID="PathFindSubsite"                 Runat="server" TabIndex="2"  />
            <euc:EformHidden RecordId="1" ParentRecordId="17" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology"               Runat="server" TabIndex="2"  />
         
            <euc:EformTextBox style="width: 100px;" RecordId="1" ParentRecordId="17" TABLE="PathologyFinding" FIELD="PathFindWidth" ID="PathFindWidth" Runat="server"  TabIndex="2" EnableHiddenOnUIEvent="PathFindSite,PathFindSubsite,PathFindHistology"  /></td>
 


    </tr>
    
    <tr>
        <td valign="top" style="white-space: nowrap;"><strong>Grade</strong><br /> 
		    <euc:EformComboBox style="width:80px" DropDownWidth="300" RecordId="1" ParentRecordId="17" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_1" LookupCode="PathGrade" Runat="server" /></td>
      <td valign="top" style="white-space: nowrap;"><strong>Data Quality</strong><br /> 
         <euc:EformComboBox Width="100px" RecordId="16" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality" Lookupcode="DataQuality" Runat="server" TabIndex="3"  DropDownHeight="auto" DropDownWidth="300" /></td>
    </tr>

</table>
<br /><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */

    addBlur($('<%= ProcDateText.ClientID %>'),$('<%= ProcDate.ClientID %>'),$('<%= ProcName.ClientID %>'),$('<%= ProcSubsite.ClientID %>'),$('<%= PathDate.ClientID %>'),$('<%= PathDateText.ClientID %>'),$('<%= PathHistology.ClientID %>'),$('<%= PathSubsite.ClientID %>'),$('<%= PathFindSubsite.ClientID %>'), $('<%= PathFindHistology.ClientID  %>'),$('<%= PathKeratinization.ClientID  %>'),$('<%= PathNotes.ClientID  %>'),$('<%= PathFindWidth.ClientID  %>'),$('<%= ProcQuality.ClientID  %>'),$('<%= PathQuality.ClientID  %>'),$('<%= PathNum.ClientID  %>'),$('<%= PathSpecimenType.ClientID  %>'),$('<%= OpDateText_16.ClientID  %>'),$('<%= OpDate_16.ClientID  %>'),$('<%= OpQuality_16.ClientID  %>'));
   
    //Adds blur event to combo
    function addBlur(procDateTextID,procDateID,procNameID,procSubsiteID,pathDateID,pathDateTextID,pathHistologyID,pathSubsiteID,pathFindSubsiteID,pathFindHistologyID,pathKeratinizationID,pathNotesID,pathFindWidthID,procQuality,pathQuality,pathNum,pathSpecimenTypeID,opRoomDateIDTextID,opRoomDateID,opQualityID)
    {  
        $(procDateTextID).addEvent('blur',curry(SetHiddenFields,procDateTextID,procDateID,procNameID,procSubsiteID,pathDateID,pathDateTextID,pathHistologyID,pathSubsiteID,pathFindSubsiteID,pathFindHistologyID,pathKeratinizationID,pathNotesID,pathFindWidthID,procQuality,pathQuality,pathNum,pathSpecimenTypeID,opRoomDateIDTextID,opRoomDateID,opQualityID));
       
        var rbl = procNameID.getElementsByTagName('input');
        for (var j = 0; j < rbl.length; j++)
        {
            var rblRef = rbl[j];
            if (rblRef.type == 'radio')
                  $(rblRef).addEvent('click',curry(SetHiddenFields,procDateTextID,procDateID,procNameID,procSubsiteID,pathDateID,pathDateTextID,pathHistologyID,pathSubsiteID,pathFindSubsiteID,pathFindHistologyID,pathKeratinizationID,pathNotesID,pathFindWidthID,procQuality,pathQuality,pathNum,pathSpecimenTypeID,opRoomDateIDTextID,opRoomDateID,opQualityID));
            else if (rblRef.type == 'text')
                  $(rblRef).addEvent('blur',curry(SetHiddenFields,procDateTextID,procDateID,procNameID,procSubsiteID,pathDateID,pathDateTextID,pathHistologyID,pathSubsiteID,pathFindSubsiteID,pathFindHistologyID,pathKeratinizationID,pathNotesID,pathFindWidthID,procQuality,pathQuality,pathNum,pathSpecimenTypeID,opRoomDateIDTextID,opRoomDateID,opQualityID));
        } 

        $(procQuality).addEvent('blur',curry(SetHiddenFields,procDateTextID,procDateID,procNameID,procSubsiteID,pathDateID,pathDateTextID,pathHistologyID,pathSubsiteID,pathFindSubsiteID,pathFindHistologyID,pathKeratinizationID,pathNotesID,pathFindWidthID,procQuality,pathQuality,pathNum,pathSpecimenTypeID,opRoomDateIDTextID,opRoomDateID,opQualityID));
        $(pathSubsiteID).addEvent('blur',curry(SetHiddenFields,procDateTextID,procDateID,procNameID,procSubsiteID,pathDateID,pathDateTextID,pathHistologyID,pathSubsiteID,pathFindSubsiteID,pathFindHistologyID,pathKeratinizationID,pathNotesID,pathFindWidthID,procQuality,pathQuality,pathNum,pathSpecimenTypeID,opRoomDateIDTextID,opRoomDateID,opQualityID));
        $(pathHistologyID).addEvent('blur',curry(SetHiddenFields,procDateTextID,procDateID,procNameID,procSubsiteID,pathDateID,pathDateTextID,pathHistologyID,pathSubsiteID,pathFindSubsiteID,pathFindHistologyID,pathKeratinizationID,pathNotesID,pathFindWidthID,procQuality,pathQuality,pathNum,pathSpecimenTypeID,opRoomDateIDTextID,opRoomDateID,opQualityID));
        $(pathNum).addEvent('blur',curry(SetHiddenFields,procDateTextID,procDateID,procNameID,procSubsiteID,pathDateID,pathDateTextID,pathHistologyID,pathSubsiteID,pathFindSubsiteID,pathFindHistologyID,pathKeratinizationID,pathNotesID,pathFindWidthID,procQuality,pathQuality,pathNum,pathSpecimenTypeID,opRoomDateIDTextID,opRoomDateID,opQualityID));
        $(pathFindWidthID).addEvent('blur',curry(SetHiddenFields,procDateTextID,procDateID,procNameID,procSubsiteID,pathDateID,pathDateTextID,pathHistologyID,pathSubsiteID,pathFindSubsiteID,pathFindHistologyID,pathKeratinizationID,pathNotesID,pathFindWidthID,procQuality,pathQuality,pathNum,pathSpecimenTypeID,opRoomDateIDTextID,opRoomDateID,opQualityID));
        $(pathKeratinizationID).addEvent('blur',curry(SetHiddenFields,procDateTextID,procDateID,procNameID,procSubsiteID,pathDateID,pathDateTextID,pathHistologyID,pathSubsiteID,pathFindSubsiteID,pathFindHistologyID,pathKeratinizationID,pathNotesID,pathFindWidthID,procQuality,pathQuality,pathNum,pathSpecimenTypeID,opRoomDateIDTextID,opRoomDateID,opQualityID));
    }

    /* ]]> */
    
    function SetHiddenFields(procDateTextID,procDateID,procNameID,procSubsiteID,pathDateID,pathDateTextID,pathHistologyID,pathSubsiteID,pathFindSubsiteID,pathFindHistologyID,pathKeratinizationID,pathNotesID,pathFindWidthID,procQuality,pathQuality,pathNum,pathSpecimenTypeID,opRoomDateIDTextID,opRoomDateID,opQualityID)
    {
        SetPathFields(procNameID,pathDateID, pathDateTextID, procDateTextID,procDateID,pathSubsiteID,pathHistologyID,procQuality,pathQuality,pathNum,pathSpecimenTypeID);
        SetPathFindingsFields(pathFindWidthID, pathSubsiteID, pathHistologyID, pathFindSubsiteID, pathFindHistologyID);
        SetPathologyNotes(pathKeratinizationID, pathNotesID); 
        SetSalvageBiopsyProcedureFields(pathSubsiteID,procSubsiteID);
        SetOpRoomFields(procDateTextID,procDateID,procQuality,opRoomDateIDTextID,opRoomDateID,opQualityID);
    }
	
	function SetPathFields(procNameID,pathDateID, pathDateTextID,procDateID, procDateTextID,pathSubsiteID,pathHistologyID,procQuality,pathQuality,pathNum,pathSpecimenTypeID)
	{
        
	    if (pathSubsiteID.value != '' || pathHistologyID.value != '' || pathNum.value != '')
	    {
	        pathDateID.value = procDateTextID.value;
	        pathDateTextID.value = procDateID.value;	   
	        pathQuality.value = procQuality.value; 
	        pathSpecimenTypeID.value = RetrieveRadioBtnListSelectedValues (procNameID,"TABLE");     
	    }	
	    else
	    {
	       	pathDateID.value = '';
	        pathDateTextID.value = '';
	        pathQuality.value = ''; 
	        pathSpecimenTypeID.value = '';     
	    }	    
	    
	    
	}
	
	function SetPathFindingsFields(pathFindWidthID, pathSubSiteID, pathHistologyID, pathFindSubSiteID, pathFindHistologyID)
	{
	    if (pathFindWidthID.value != '')
	    { 
	        pathFindSubSiteID.value = pathSubSiteID.value;
	        pathFindHistologyID.value = pathHistologyID.value;     
	    }
	    else
	    {
	    	pathFindSubSiteID.value = '';
	        pathFindHistologyID.value = '';
	    }
	}

	function SetPathologyNotes(PathKID, PathNotesID) {
	    var prefix = '';
	    var currentNote = '';
	    var firstChar = '';
	    PathNotesID.value = '';

	    if (PathKID != null) {
	        if (PathKID.value != '') {
	            prefix = "PathKeratinization: ";
	            currentNote = PathKID.value;
	            firstChar = currentNote.charAt(0);

	            if (firstChar != null && firstChar != 'P')
	                PathNotesID.value = PathNotesID.value + prefix + PathKID.value;
	        }
	    }
	}

	function SetSalvageBiopsyProcedureFields(pathSubsiteID,procSubsiteID)
	{
	    if (pathSubsiteID.value != '')
	    { 
	        procSubsiteID.value = pathSubsiteID.value;   
	    }
	    else
	    {
	    	procSubsiteID.value = '';
	    }
	}

	function SetOpRoomFields(procDateTextID,procDateID,procQuality,opRoomDateIDTextID,opRoomDateID,opQualityID)
	{
	    if (procDateTextID.value != '' || procQuality.value != '')
	    { 
	        opRoomDateIDTextID.value = procDateTextID.value;
	        opRoomDateID.value = procDateID.value;     
	        opQualityID.value = procQuality.value;
	    }
	    else
	    {
	    	opRoomDateIDTextID.value = '';
	        opRoomDateID.value = '';
	        opQualityID.value = '';
	    }
	}
	
</script>

