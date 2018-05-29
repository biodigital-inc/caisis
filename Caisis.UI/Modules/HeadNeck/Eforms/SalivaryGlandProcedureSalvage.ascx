<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandProcedureSalvage" CodeFile="SalivaryGlandProcedureSalvage.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.SalivaryGlandProcedureSalvageHtmlTable = "SalivaryGlandProcedureSalvageHtmlTable";
</script>
<script type="text/javascript">


</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
<script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>

<a name="SalivaryGlandProcedureSalvage" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>  
<table  class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle">Salvage Surgery Done ?</span></td>
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

<euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ID="OpDateText_19" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
<euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ID="OpDate_19" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
<euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ID="OpQuality_19" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
<euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ID="OpCaseSurgeon_19" TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" /> 

    <table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SalivaryGlandProcedureSalvageHtmlTable" >
        <tr>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Date</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Surgeon</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Procedure</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" ></td>
        </tr>
        
      <tr>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="90px"  Runat="server" RecordId="19" ID="ProcDateText_19" ParentRecordId="19"   TABLE="Procedures" FIELD="ProcDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="19" ParentRecordId="19"   ID="ProcDate_19" TABLE="Procedures" FIELD="ProcDate" />
                               	                    			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ParentRecordId="19"  ID="ProcQuality_19" TABLE="Procedures" FIELD="ProcQuality" />   		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ParentRecordId="19" ID="ProcIndication_19" TABLE="Procedures" FIELD="ProcIndication" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ParentRecordId="19" ID="ProcService_19" TABLE="Procedures" FIELD="ProcService" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ParentRecordId="19" ID="ProcInstitution_19" TABLE="Procedures" FIELD="ProcInstitution" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ParentRecordId="19" ID="ProcSite_19" TABLE="Procedures" FIELD="ProcSite" />
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="19" ID="ProcSurgeon_19" TABLE="Procedures" FIELD="ProcSurgeon" LookupCode="Physician" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"  Width="250px" Runat="server" RecordId="19" ParentRecordId="19" ID="ProcName_19" TABLE="Procedures" FIELD="ProcName" LookupCode="ProcName,Disease,SalivaryCancer" /></td>
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_19"  runat="server"/></td>
        </tr>
      <tr style="display: none;" >
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="90px"  Runat="server" RecordId="20" ID="ProcDateText_20" ParentRecordId="19"   TABLE="Procedures" FIELD="ProcDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="20" ParentRecordId="19"   ID="ProcDate_20" TABLE="Procedures" FIELD="ProcDate" />                               	      
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="20" ParentRecordId="19"  ID="ProcQuality_20" TABLE="Procedures" FIELD="ProcQuality" />   		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="20" ParentRecordId="19" ID="ProcIndication_20" TABLE="Procedures" FIELD="ProcIndication" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="20" ParentRecordId="19" ID="ProcService_20" TABLE="Procedures" FIELD="ProcService" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="20" ParentRecordId="19" ID="ProcInstitution_20" TABLE="Procedures" FIELD="ProcInstitution" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="20" ParentRecordId="19" ID="ProcSite_20" TABLE="Procedures" FIELD="ProcSite" />
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="20" ParentRecordId="19" ID="ProcSurgeon_20" TABLE="Procedures" FIELD="ProcSurgeon" LookupCode="Physician" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"  Width="250px" Runat="server" RecordId="20" ParentRecordId="19" ID="ProcName_20" TABLE="Procedures" FIELD="ProcName" LookupCode="ProcName,Disease,SalivaryCancer" /></td>
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_20"  runat="server"/></td>
        </tr>
      <tr style="display: none;" >
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="90px"  Runat="server" RecordId="21" ID="ProcDateText_21" ParentRecordId="19"   TABLE="Procedures" FIELD="ProcDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="21" ParentRecordId="19"   ID="ProcDate_21" TABLE="Procedures" FIELD="ProcDate" />
                               	      
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="21" ParentRecordId="19"  ID="ProcQuality_21" TABLE="Procedures" FIELD="ProcQuality" />   		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="21" ParentRecordId="19" ID="ProcIndication_21" TABLE="Procedures" FIELD="ProcIndication" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="21" ParentRecordId="19" ID="ProcService_21" TABLE="Procedures" FIELD="ProcService" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="21" ParentRecordId="19" ID="ProcInstitution_21" TABLE="Procedures" FIELD="ProcInstitution" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="21" ParentRecordId="19" ID="ProcSite_21" TABLE="Procedures" FIELD="ProcSite" />
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="21" ParentRecordId="19"  ID="ProcSurgeon_21" TABLE="Procedures" FIELD="ProcSurgeon" LookupCode="Physician" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"  Width="250px" Runat="server" RecordId="21" ParentRecordId="19" ID="ProcName_21" TABLE="Procedures" FIELD="ProcName" LookupCode="ProcName,Disease,SalivaryCancer" /></td>
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_21"  runat="server"/></td>
        </tr>  
      <tr style="display: none;" >
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="90px"  Runat="server" RecordId="22" ID="ProcDateText_22" ParentRecordId="19"   TABLE="Procedures" FIELD="ProcDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="22" ParentRecordId="19"   ID="ProcDate_22" TABLE="Procedures" FIELD="ProcDate" />
                               	                    			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="22" ParentRecordId="19"  ID="ProcQuality_22" TABLE="Procedures" FIELD="ProcQuality" />   		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="22" ParentRecordId="19" ID="ProcIndication_22" TABLE="Procedures" FIELD="ProcIndication" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="22" ParentRecordId="19" ID="ProcService_22" TABLE="Procedures" FIELD="ProcService" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="22" ParentRecordId="19" ID="ProcInstitution_22" TABLE="Procedures" FIELD="ProcInstitution" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="22" ParentRecordId="19" ID="ProcSite_22" TABLE="Procedures" FIELD="ProcSite" />
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="22" ParentRecordId="19"  ID="ProcSurgeon_22" TABLE="Procedures" FIELD="ProcSurgeon" LookupCode="Physician" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"  Width="250px" Runat="server" RecordId="22" ParentRecordId="19" ID="ProcName_22" TABLE="Procedures" FIELD="ProcName" LookupCode="ProcName,Disease,SalivaryCancer" /></td>
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_22"  runat="server"/></td>
        </tr> 
      <tr style="display: none;" >
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="90px"  Runat="server" RecordId="23" ID="ProcDateText_23" ParentRecordId="19"   TABLE="Procedures" FIELD="ProcDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="23" ParentRecordId="19"   ID="ProcDate_23" TABLE="Procedures" FIELD="ProcDate" />                             	      
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="23" ParentRecordId="19"  ID="ProcQuality_23" TABLE="Procedures" FIELD="ProcQuality" />   		    
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="23" ParentRecordId="19" ID="ProcIndication_23" TABLE="Procedures" FIELD="ProcIndication" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="23" ParentRecordId="19" ID="ProcService_23" TABLE="Procedures" FIELD="ProcService" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="23" ParentRecordId="19" ID="ProcInstitution_23" TABLE="Procedures" FIELD="ProcInstitution" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="23" ParentRecordId="19" ID="ProcSite_23" TABLE="Procedures" FIELD="ProcSite" />
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="23" ParentRecordId="19"  ID="ProcSurgeon_23" TABLE="Procedures" FIELD="ProcSurgeon" LookupCode="Physician" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"  Width="250px" Runat="server" RecordId="23" ParentRecordId="19" ID="ProcName_23" TABLE="Procedures" FIELD="ProcName" LookupCode="ProcName,Disease,SalivaryCancer" /></td>
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_23"  runat="server"/></td>
        </tr>     
        </table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'SalivaryGlandProcedureSalvageHtmlTable');" />

</div>
<br/><br/><br/>

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo

    addAbsentEvent($('<%= SalvageSurgeryDone.ClientID %>'),$('<%= SalvageSurgeryDiv.ClientID %>'),$('<%= OpDateText_19.ClientID %>'),$('<%= OpDate_19.ClientID %>'),$('<%= OpCaseSurgeon_19.ClientID %>'),$('<%= OpQuality_19.ClientID %>'),$('<%= ProcName_19.ClientID %>'),$('<%= ProcDateText_19.ClientID %>'),$('<%= ProcDate_19.ClientID %>'),$('<%= ProcSurgeon_19.ClientID %>'),$('<%= ProcQuality_19.ClientID %>'),$('<%= ProcIndication_19.ClientID %>'),$('<%= ProcService_19.ClientID %>'),$('<%= ProcInstitution_19.ClientID %>'),$('<%= ProcSite_19.ClientID %>'),$('<%= GlobalSurgeon.ClientID %>').value,$('<%= GlobalInstitution.ClientID %>').value);
    addAbsentEvent($('<%= SalvageSurgeryDone.ClientID %>'),$('<%= SalvageSurgeryDiv.ClientID %>'),$('<%= OpDateText_19.ClientID %>'),$('<%= OpDate_19.ClientID %>'),$('<%= OpCaseSurgeon_19.ClientID %>'),$('<%= OpQuality_19.ClientID %>'),$('<%= ProcName_20.ClientID %>'),$('<%= ProcDateText_20.ClientID %>'),$('<%= ProcDate_20.ClientID %>'),$('<%= ProcSurgeon_20.ClientID %>'),$('<%= ProcQuality_20.ClientID %>'),$('<%= ProcIndication_20.ClientID %>'),$('<%= ProcService_20.ClientID %>'),$('<%= ProcInstitution_20.ClientID %>'),$('<%= ProcSite_20.ClientID %>'),$('<%= GlobalSurgeon.ClientID %>').value,$('<%= GlobalInstitution.ClientID %>').value);
    addAbsentEvent($('<%= SalvageSurgeryDone.ClientID %>'),$('<%= SalvageSurgeryDiv.ClientID %>'),$('<%= OpDateText_19.ClientID %>'),$('<%= OpDate_19.ClientID %>'),$('<%= OpCaseSurgeon_19.ClientID %>'),$('<%= OpQuality_19.ClientID %>'),$('<%= ProcName_21.ClientID %>'),$('<%= ProcDateText_21.ClientID %>'),$('<%= ProcDate_21.ClientID %>'),$('<%= ProcSurgeon_21.ClientID %>'),$('<%= ProcQuality_21.ClientID %>'),$('<%= ProcIndication_21.ClientID %>'),$('<%= ProcService_21.ClientID %>'),$('<%= ProcInstitution_21.ClientID %>'),$('<%= ProcSite_21.ClientID %>'),$('<%= GlobalSurgeon.ClientID %>').value,$('<%= GlobalInstitution.ClientID %>').value);
    addAbsentEvent($('<%= SalvageSurgeryDone.ClientID %>'),$('<%= SalvageSurgeryDiv.ClientID %>'),$('<%= OpDateText_19.ClientID %>'),$('<%= OpDate_19.ClientID %>'),$('<%= OpCaseSurgeon_19.ClientID %>'),$('<%= OpQuality_19.ClientID %>'),$('<%= ProcName_22.ClientID %>'),$('<%= ProcDateText_22.ClientID %>'),$('<%= ProcDate_22.ClientID %>'),$('<%= ProcSurgeon_22.ClientID %>'),$('<%= ProcQuality_22.ClientID %>'),$('<%= ProcIndication_22.ClientID %>'),$('<%= ProcService_22.ClientID %>'),$('<%= ProcInstitution_22.ClientID %>'),$('<%= ProcSite_22.ClientID %>'),$('<%= GlobalSurgeon.ClientID %>').value,$('<%= GlobalInstitution.ClientID %>').value);
    addAbsentEvent($('<%= SalvageSurgeryDone.ClientID %>'),$('<%= SalvageSurgeryDiv.ClientID %>'),$('<%= OpDateText_19.ClientID %>'),$('<%= OpDate_19.ClientID %>'),$('<%= OpCaseSurgeon_19.ClientID %>'),$('<%= OpQuality_19.ClientID %>'),$('<%= ProcName_23.ClientID %>'),$('<%= ProcDateText_23.ClientID %>'),$('<%= ProcDate_23.ClientID %>'),$('<%= ProcSurgeon_23.ClientID %>'),$('<%= ProcQuality_23.ClientID %>'),$('<%= ProcIndication_23.ClientID %>'),$('<%= ProcService_23.ClientID %>'),$('<%= ProcInstitution_23.ClientID %>'),$('<%= ProcSite_23.ClientID %>'),$('<%= GlobalSurgeon.ClientID %>').value,$('<%= GlobalInstitution.ClientID %>').value);

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
        if (procDateText.id.indexOf('_19') > -1)
        {
            opDateTextHidden.value = procDateText.value;
            opDateHidden.value = procDate.value;
        }
        
        if (procSurgeon.value != '')
        {
            if (procSurgeon.id.indexOf('_19') > -1)
                opSurgeonHidden.value = procSurgeon.value;
        }
        else
        {   
            if (procSurgeon.id.indexOf('_19') > -1)
            {
                opSurgeonHidden.value = surgeonValue;
            }
            procSurgeon.value = surgeonValue;
        }

        procQualityHidden.value = 'STD';
        opQualityHidden.value = 'STD';
        procIndicationHidden.value = 'Salvage';
        procServiceHidden.value = 'Head and Neck';
        procInstitutionHidden.value = institutionValue;
        procSiteHidden.value = 'Salivary Gland';        
      
      }
      else
      {
        if (procDateText.id.indexOf('_19') > -1)
        {
            opDateTextHidden.value = '';
            opDateHidden.value = ''; 
        }   
        if (procSurgeon.id.indexOf('_19') > -1)
        {
            opSurgeonHidden.value = '';        
        }
                
        procQualityHidden.value = '';
        opQualityHidden.value = '';
        procIndicationHidden.value = '';
        procServiceHidden.value = '';
        procInstitutionHidden.value = '';
        procSiteHidden.value = '';   
      }
  }
</script>