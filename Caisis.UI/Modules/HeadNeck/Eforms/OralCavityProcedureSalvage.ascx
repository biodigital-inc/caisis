<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OralCavityProcedureSalvage" CodeFile="OralCavityProcedureSalvage.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.OralCavityProcedureSalvageHtmlTable = "OralCavityProcedureSalvageHtmlTable";
</script>
<script type="text/javascript">


</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
<script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>

<a name="OralCavityProcedureSalvage" /><br/>  
<table  class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Salvage Surgery Done"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="SalvageSurgeryDone" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="62" Table="NoTable" Field="SalvageSurgeryDone">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<br /><br />

<div id="SalvageSurgeryDiv" runat="server" style="display:none;">

<%--Surgeon specified in Primay Procedure--%>
<euc:EformTextBox  style="display:none;" Runat="server" RecordId="16" ID="GlobalSurgeon" TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon"  />
<%--Global Default Institution based on web.config --%>
<euc:CaisisTextBox style="display:none;"  Runat="server" ID="GlobalInstitution"   />


    <table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OralCavityProcedureSalvageHtmlTable" >
        <tr>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Date</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Surgeon</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Procedure</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" ></td>
        </tr>
        
      <tr>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="90px"  Runat="server" RecordId="31" ID="ProcDateText_31" ParentRecordId="31"   TABLE="Procedures" FIELD="ProcDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="31" ParentRecordId="31"   ID="ProcDate_31" TABLE="Procedures" FIELD="ProcDate" />
                               	                    			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ParentRecordId="31"  ID="ProcQuality_31" TABLE="Procedures" FIELD="ProcQuality" />   		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ParentRecordId="31" ID="ProcIndication_31" TABLE="Procedures" FIELD="ProcIndication" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ParentRecordId="31" ID="ProcService_31" TABLE="Procedures" FIELD="ProcService" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ParentRecordId="31" ID="ProcInstitution_31" TABLE="Procedures" FIELD="ProcInstitution" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ParentRecordId="31" ID="ProcSite_31" TABLE="Procedures" FIELD="ProcSite" />

                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ID="OpDateText_31" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ID="OpDate_31" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ID="OpQuality_31" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ID="OpCaseSurgeon_31" TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" /> 
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="31" ParentRecordId="31" ID="ProcSurgeon_31" TABLE="Procedures" FIELD="ProcSurgeon" LookupCode="Physician" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"  Width="250px" Runat="server" RecordId="31" ParentRecordId="31" ID="ProcName_31" TABLE="Procedures" FIELD="ProcName" LookupCode="ProcName,Disease,HeadNeck" /></td>
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_31"  runat="server"/></td>
        </tr>
      <tr style="display: none;" >
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="90px"  Runat="server" RecordId="32" ID="ProcDateText_32" ParentRecordId="32"   TABLE="Procedures" FIELD="ProcDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="32" ParentRecordId="32"   ID="ProcDate_32" TABLE="Procedures" FIELD="ProcDate" />                               	      
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ParentRecordId="32"  ID="ProcQuality_32" TABLE="Procedures" FIELD="ProcQuality" />   		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ParentRecordId="32" ID="ProcIndication_32" TABLE="Procedures" FIELD="ProcIndication" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ParentRecordId="32" ID="ProcService_32" TABLE="Procedures" FIELD="ProcService" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ParentRecordId="32" ID="ProcInstitution_32" TABLE="Procedures" FIELD="ProcInstitution" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ParentRecordId="32" ID="ProcSite_32" TABLE="Procedures" FIELD="ProcSite" />

                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ID="OpDateText_32" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ID="OpDate_32" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ID="OpQuality_32" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ID="OpCaseSurgeon_32" TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" /> 

            </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="32" ParentRecordId="32" ID="ProcSurgeon_32" TABLE="Procedures" FIELD="ProcSurgeon" LookupCode="Physician" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"  Width="250px" Runat="server" RecordId="32" ParentRecordId="32" ID="ProcName_32" TABLE="Procedures" FIELD="ProcName" LookupCode="ProcName,Disease,HeadNeck" /></td>
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_32"  runat="server"/></td>
        </tr>
      <tr style="display: none;" >
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="90px"  Runat="server" RecordId="33" ID="ProcDateText_33" ParentRecordId="33"   TABLE="Procedures" FIELD="ProcDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="33" ParentRecordId="33"   ID="ProcDate_33" TABLE="Procedures" FIELD="ProcDate" />
                               	      
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ParentRecordId="33"  ID="ProcQuality_33" TABLE="Procedures" FIELD="ProcQuality" />   		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ParentRecordId="33" ID="ProcIndication_33" TABLE="Procedures" FIELD="ProcIndication" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ParentRecordId="33" ID="ProcService_33" TABLE="Procedures" FIELD="ProcService" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ParentRecordId="33" ID="ProcInstitution_33" TABLE="Procedures" FIELD="ProcInstitution" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ParentRecordId="33" ID="ProcSite_33" TABLE="Procedures" FIELD="ProcSite" />

                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ID="OpDateText_33" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ID="OpDate_33" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ID="OpQuality_33" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ID="OpCaseSurgeon_33" TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" /> 
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="33" ParentRecordId="33"  ID="ProcSurgeon_33" TABLE="Procedures" FIELD="ProcSurgeon" LookupCode="Physician" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"  Width="250px" Runat="server" RecordId="33" ParentRecordId="33" ID="ProcName_33" TABLE="Procedures" FIELD="ProcName" LookupCode="ProcName,Disease,HeadNeck" /></td>
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_33"  runat="server"/></td>
        </tr>  
      <tr style="display: none;" >
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="90px"  Runat="server" RecordId="34" ID="ProcDateText_34" ParentRecordId="34"   TABLE="Procedures" FIELD="ProcDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="34" ParentRecordId="34"   ID="ProcDate_34" TABLE="Procedures" FIELD="ProcDate" />
                               	                    			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ParentRecordId="34"  ID="ProcQuality_34" TABLE="Procedures" FIELD="ProcQuality" />   		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ParentRecordId="34" ID="ProcIndication_34" TABLE="Procedures" FIELD="ProcIndication" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ParentRecordId="34" ID="ProcService_34" TABLE="Procedures" FIELD="ProcService" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ParentRecordId="34" ID="ProcInstitution_34" TABLE="Procedures" FIELD="ProcInstitution" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ParentRecordId="34" ID="ProcSite_34" TABLE="Procedures" FIELD="ProcSite" />

                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ID="OpDateText_34" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ID="OpDate_34" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ID="OpQuality_34" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ID="OpCaseSurgeon_34" TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" /> 
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="34" ParentRecordId="34"  ID="ProcSurgeon_34" TABLE="Procedures" FIELD="ProcSurgeon" LookupCode="Physician" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"  Width="250px" Runat="server" RecordId="34" ParentRecordId="34" ID="ProcName_34" TABLE="Procedures" FIELD="ProcName" LookupCode="ProcName,Disease,HeadNeck" /></td>
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_34"  runat="server"/></td>
        </tr> 
      <tr style="display: none;" >
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="90px"  Runat="server" RecordId="35" ID="ProcDateText_35" ParentRecordId="35"   TABLE="Procedures" FIELD="ProcDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="35" ParentRecordId="35"   ID="ProcDate_35" TABLE="Procedures" FIELD="ProcDate" />                             	      
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ParentRecordId="35"  ID="ProcQuality_35" TABLE="Procedures" FIELD="ProcQuality" />   		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ParentRecordId="35" ID="ProcIndication_35" TABLE="Procedures" FIELD="ProcIndication" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ParentRecordId="35" ID="ProcService_35" TABLE="Procedures" FIELD="ProcService" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ParentRecordId="35" ID="ProcInstitution_35" TABLE="Procedures" FIELD="ProcInstitution" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ParentRecordId="35" ID="ProcSite_35" TABLE="Procedures" FIELD="ProcSite" />

                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ID="OpDateText_35" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ID="OpDate_35" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ID="OpQuality_35" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ID="OpCaseSurgeon_35" TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" /> 
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="35" ParentRecordId="35"  ID="ProcSurgeon_35" TABLE="Procedures" FIELD="ProcSurgeon" LookupCode="Physician" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"  Width="250px" Runat="server" RecordId="35" ParentRecordId="35" ID="ProcName_35" TABLE="Procedures" FIELD="ProcName" LookupCode="ProcName,Disease,HeadNeck" /></td>
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_35"  runat="server"/></td>
        </tr>     
        </table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OralCavityProcedureSalvageHtmlTable');" />

</div>
<br/><br/><br/>

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo

    addAbsentEvent($('<%= SalvageSurgeryDone.ClientID %>'),$('<%= SalvageSurgeryDiv.ClientID %>'),$('<%= OpDateText_31.ClientID %>'),$('<%= OpDate_31.ClientID %>'),$('<%= OpCaseSurgeon_31.ClientID %>'),$('<%= OpQuality_31.ClientID %>'),$('<%= ProcName_31.ClientID %>'),$('<%= ProcDateText_31.ClientID %>'),$('<%= ProcDate_31.ClientID %>'),$('<%= ProcSurgeon_31.ClientID %>'),$('<%= ProcQuality_31.ClientID %>'),$('<%= ProcIndication_31.ClientID %>'),$('<%= ProcService_31.ClientID %>'),$('<%= ProcInstitution_31.ClientID %>'),$('<%= ProcSite_31.ClientID %>'),$('<%= GlobalSurgeon.ClientID %>').value,$('<%= GlobalInstitution.ClientID %>').value);
    addAbsentEvent($('<%= SalvageSurgeryDone.ClientID %>'),$('<%= SalvageSurgeryDiv.ClientID %>'),$('<%= OpDateText_32.ClientID %>'),$('<%= OpDate_32.ClientID %>'),$('<%= OpCaseSurgeon_32.ClientID %>'),$('<%= OpQuality_32.ClientID %>'),$('<%= ProcName_32.ClientID %>'),$('<%= ProcDateText_32.ClientID %>'),$('<%= ProcDate_32.ClientID %>'),$('<%= ProcSurgeon_32.ClientID %>'),$('<%= ProcQuality_32.ClientID %>'),$('<%= ProcIndication_32.ClientID %>'),$('<%= ProcService_32.ClientID %>'),$('<%= ProcInstitution_32.ClientID %>'),$('<%= ProcSite_32.ClientID %>'),$('<%= GlobalSurgeon.ClientID %>').value,$('<%= GlobalInstitution.ClientID %>').value);
    addAbsentEvent($('<%= SalvageSurgeryDone.ClientID %>'),$('<%= SalvageSurgeryDiv.ClientID %>'),$('<%= OpDateText_33.ClientID %>'),$('<%= OpDate_33.ClientID %>'),$('<%= OpCaseSurgeon_33.ClientID %>'),$('<%= OpQuality_33.ClientID %>'),$('<%= ProcName_33.ClientID %>'),$('<%= ProcDateText_33.ClientID %>'),$('<%= ProcDate_33.ClientID %>'),$('<%= ProcSurgeon_33.ClientID %>'),$('<%= ProcQuality_33.ClientID %>'),$('<%= ProcIndication_33.ClientID %>'),$('<%= ProcService_33.ClientID %>'),$('<%= ProcInstitution_33.ClientID %>'),$('<%= ProcSite_33.ClientID %>'),$('<%= GlobalSurgeon.ClientID %>').value,$('<%= GlobalInstitution.ClientID %>').value);
    addAbsentEvent($('<%= SalvageSurgeryDone.ClientID %>'),$('<%= SalvageSurgeryDiv.ClientID %>'),$('<%= OpDateText_34.ClientID %>'),$('<%= OpDate_34.ClientID %>'),$('<%= OpCaseSurgeon_34.ClientID %>'),$('<%= OpQuality_34.ClientID %>'),$('<%= ProcName_34.ClientID %>'),$('<%= ProcDateText_34.ClientID %>'),$('<%= ProcDate_34.ClientID %>'),$('<%= ProcSurgeon_34.ClientID %>'),$('<%= ProcQuality_34.ClientID %>'),$('<%= ProcIndication_34.ClientID %>'),$('<%= ProcService_34.ClientID %>'),$('<%= ProcInstitution_34.ClientID %>'),$('<%= ProcSite_34.ClientID %>'),$('<%= GlobalSurgeon.ClientID %>').value,$('<%= GlobalInstitution.ClientID %>').value);
    addAbsentEvent($('<%= SalvageSurgeryDone.ClientID %>'),$('<%= SalvageSurgeryDiv.ClientID %>'),$('<%= OpDateText_35.ClientID %>'),$('<%= OpDate_35.ClientID %>'),$('<%= OpCaseSurgeon_35.ClientID %>'),$('<%= OpQuality_35.ClientID %>'),$('<%= ProcName_35.ClientID %>'),$('<%= ProcDateText_35.ClientID %>'),$('<%= ProcDate_35.ClientID %>'),$('<%= ProcSurgeon_35.ClientID %>'),$('<%= ProcQuality_35.ClientID %>'),$('<%= ProcIndication_35.ClientID %>'),$('<%= ProcService_35.ClientID %>'),$('<%= ProcInstitution_35.ClientID %>'),$('<%= ProcSite_35.ClientID %>'),$('<%= GlobalSurgeon.ClientID %>').value,$('<%= GlobalInstitution.ClientID %>').value);

    function addAbsentEvent(surgeryDone,surgeryDiv,opDateTextHidden,opDateHidden,opSurgeonHidden,opQualityHidden,procName,procDateText,procDate,procSurgeon,procQualityHidden,procIndicationHidden,procServiceHidden,procInstitutionHidden,procSiteHidden,surgeonValue,institutionValue)
    {  
        $(surgeryDone).addEvent('click',curry(ComplicationYesNo,surgeryDone,surgeryDiv,opDateTextHidden,opDateHidden,opSurgeonHidden,opQualityHidden,procName,procDateText,procDate,procSurgeon,procQualityHidden,procIndicationHidden,procServiceHidden,procInstitutionHidden,procSiteHidden,surgeonValue,institutionValue));
        $(procDateText).addEvent('blur',curry(ComplicationYesNo,surgeryDone,surgeryDiv,opDateTextHidden,opDateHidden,opSurgeonHidden,opQualityHidden,procName,procDateText,procDate,procSurgeon,procQualityHidden,procIndicationHidden,procServiceHidden,procInstitutionHidden,procSiteHidden,surgeonValue,institutionValue));
        $(procSurgeon).addEvent('blur',curry(ComplicationYesNo,surgeryDone,surgeryDiv,opDateTextHidden,opDateHidden,opSurgeonHidden,opQualityHidden,procName,procDateText,procDate,procSurgeon,procQualityHidden,procIndicationHidden,procServiceHidden,procInstitutionHidden,procSiteHidden,surgeonValue,institutionValue));
        $(procName).addEvent('blur',curry(ComplicationYesNo,surgeryDone,surgeryDiv,opDateTextHidden,opDateHidden,opSurgeonHidden,opQualityHidden,procName,procDateText,procDate,procSurgeon,procQualityHidden,procIndicationHidden,procServiceHidden,procInstitutionHidden,procSiteHidden,surgeonValue,institutionValue));
     
        // check on load as well
       ComplicationYesNo(surgeryDone,surgeryDiv,opDateTextHidden,opDateHidden,opSurgeonHidden,opQualityHidden,procName,procDateText,procDate,procSurgeon,procQualityHidden,procIndicationHidden,procServiceHidden,procInstitutionHidden,procSiteHidden,surgeonValue,institutionValue);
    }
   
    /* ]]> */   
 
    function ComplicationYesNo(surgeryDone,surgeryDiv,opDateTextHidden,opDateHidden,opSurgeonHidden,opQualityHidden,procName,procDateText,procDate,procSurgeon,procQualityHidden,procIndicationHidden,procServiceHidden,procInstitutionHidden,procSiteHidden,surgeonValue,institutionValue)
    {        
      var surgeryDoneRef = surgeryDone.getElementsByTagName('input');
       
      for (var i = 0; i < surgeryDoneRef.length; i++) 
      {  
        if (surgeryDoneRef[i].checked) 
        {
              if (surgeryDoneRef[i].value == "Yes")
              { 
                surgeryDiv.style.display='block';
              } 
              else if (surgeryDoneRef[i].value == "No")
              {
                surgeryDiv.style.display='none';
                
                procDateText.value = '';
                procDate.value = '';
                procSurgeon.value = '';
                procName.value = '';                 
              }        
        }  
      }
      
      if (procDateText.value != '' || procSurgeon.value != '' || procName.value != '' )
      {         
            if (procSurgeon.value == '')
            {
                procSurgeon.value = surgeonValue;
            }
            procIndicationHidden.value = 'Salvage';
            procServiceHidden.value = 'Head and Neck';
            procInstitutionHidden.value = institutionValue;
            procSiteHidden.value = 'Oral Cavity';
            procQualityHidden.value = 'STD';

            opDateTextHidden.value = procDateText.value;
            opDateHidden.value = procDate.value;
            opSurgeonHidden.value = procSurgeon.value;
            opQualityHidden.value = procQualityHidden.value;

      }
      else
      {
            procQualityHidden.value = '';
            procIndicationHidden.value = '';
            procServiceHidden.value = '';
            procInstitutionHidden.value = '';
            procSiteHidden.value = '';  
          
            opDateTextHidden.value = '';
            opDateHidden.value = ''; 
            opSurgeonHidden.value = '';
            opQualityHidden.value = '';                
 
      }
  }
</script>