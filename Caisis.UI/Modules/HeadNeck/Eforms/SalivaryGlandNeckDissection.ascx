<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandNeckDissection" CodeFile="SalivaryGlandNeckDissection.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="SalivaryGlandNeckDissection" /><br/>

<table width="200" cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue">
    <tr>
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Neck Dissection"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="NeckDissecitonRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="NeckDissecitonRecorded">
                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </euc:EformRadioButtonList>
        </td>
    </tr>
</table>
<br /><br />

<div id="NeckDissecitonDiv" runat="server" style="display: none;">
    <table border="0" cellspacing="1" cellpadding="3" class="ClinicalEformTable">
            <tr>
            <td><strong>Date: </strong>
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="17" ID="OpDateText_17" TABLE="OperatingRoomDetails" FIELD="OpDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="17" ID="OpDate_17" TABLE="OperatingRoomDetails" FIELD="OpDate" /></td>
        </tr>


    </table>
    <br />
    <table border="0" cellspacing="1" cellpadding="3" border="0" class="ClinicalEformTable">

        <tr>
            <td align="center" colspan="1" class="eformLargePopulatedTableBlue"></td>
            <td align="center" colspan="1" class="eformLargePopulatedTableBlue"><span class="controlBoxTitle">Levels Dissected</span></td>
            <td align="center" colspan="4" class="eformLargePopulatedTable"><span class="controlBoxTitle">Additional Structures </span></td>
        </tr>
        
        <tr>
            <td style="text-align: left; white-space: nowrap;"  >Right Levels </td>        
            <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
                <euc:EformExtendedCheckBoxList style="white-space: nowrap;" Table="NoTable" Field="LevelsDissRight" ID="LevelsDissRight" runat="server" RepeatColumns="7" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="1" Text="1" />
                    <asp:ListItem Value="2" Text="2" />
                    <asp:ListItem Value="3" Text="3" />
                    <asp:ListItem Value="4" Text="4" />
                    <asp:ListItem Value="5" Text="5" />
                    <asp:ListItem Value="6" Text="6" />
                    <asp:ListItem Value="7" Text="7" />
                    <asp:ListItem Value="N/K: Lateral" Text="N/K: Lateral" />
                    <asp:ListItem Value="N/K: Central" Text="N/K: Central" />
                    <asp:ListItem Value="N/K" Text="N/K" />
                    <asp:ListItem Value="Not Done" Text="Not Done" />            
                </euc:EformExtendedCheckBoxList>
               
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="17"  ID="ProcDateText_17" TABLE="Procedures" FIELD="ProcDateText" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="17"  ID="ProcDate_17" TABLE="Procedures" FIELD="ProcDate" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="17"  ID="ProcSide_17" TABLE="Procedures" FIELD="ProcSide" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="17"  ID="ProcSite_17" TABLE="Procedures" FIELD="ProcSite" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="17"  ID="ProcSubsite_17" TABLE="Procedures" FIELD="ProcSubsite" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="17"  ID="ProcName_17" TABLE="Procedures" FIELD="ProcName" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="17"  ID="ProcQuality_17" TABLE="Procedures" FIELD="ProcQuality" />
               
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ID="OpQuality_17" TABLE="OperatingRoomDetails" FIELD="OpQuality" /> 
               
               </td>
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <input type="checkbox" id="ProcFinding_1" value="Accessory Nerve"    runat="server"   />Accessory Nerve
                    <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_1_Text" runat="server" RecordId="1" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_1" Runat="server" />
				    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_1"     Runat="server"/>
			        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_1" runat="server" /></td>
              <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <input type="checkbox" id="ProcFinding_2" value="Steromastoid"    runat="server"   />Steromastoid
                    <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_2_Text" runat="server" RecordId="2" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_2" Runat="server" />
				    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_2"     Runat="server"/>
			        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_2" runat="server" /></td>
           <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <input type="checkbox" id="ProcFinding_3" value="Internal Jugular Vein"    runat="server"   />Internal Jugular Vein
                    <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_3_Text" runat="server" RecordId="3" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_3" Runat="server" />
				    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_3"     Runat="server"/>
			        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_3" runat="server" /></td>
           <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <strong>Other:&nbsp;</strong>
                    <input type="text" id="ProcFinding_4" runat="server"   />
                    <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_4_Text" runat="server" RecordId="4" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="4" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_4" Runat="server" />
				    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="4" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_4"     Runat="server"/>
			        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="4" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_4" runat="server" /></td>


        </tr>
        <tr>
            <td style="text-align: left; white-space: nowrap;"  >Left Levels </td>       
            <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
                <euc:EformExtendedCheckBoxList style="white-space: nowrap;" Table="NoTable" Field="LevelsDissLeft" ID="LevelsDissLeft" runat="server" RepeatColumns="7" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="1" Text="1" />
                    <asp:ListItem Value="2" Text="2" />
                    <asp:ListItem Value="3" Text="3" />
                    <asp:ListItem Value="4" Text="4" />
                    <asp:ListItem Value="5" Text="5" />
                    <asp:ListItem Value="6" Text="6" />
                    <asp:ListItem Value="7" Text="7" />
                    <asp:ListItem Value="N/K: Lateral" Text="N/K: Lateral" />
                    <asp:ListItem Value="N/K: Central" Text="N/K: Central" />
                    <asp:ListItem Value="N/K" Text="N/K" />
                    <asp:ListItem Value="Not Done" Text="Not Done" />           
                </euc:EformExtendedCheckBoxList>          
               </td>
           <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <input type="checkbox" id="ProcFinding_5" value="Accessory Nerve"    runat="server"   />Accessory Nerve</td>
           <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <input type="checkbox" id="ProcFinding_6" value="Steromastoid"    runat="server"   />Steromastoid</td>
           <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <input type="checkbox" id="ProcFinding_7" value="Internal Jugular Vein"    runat="server"   />Internal Jugular Vein</td>
           <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <strong>Other:&nbsp;</strong>
                    <input type="text" id="ProcFinding_8" runat="server"   /></td>
        </tr>


    </table>
</div>
<br/><br/><br/>

<script type="text/javascript">

    /* <![CDATA[ */
    addEvents($('<%= NeckDissecitonRecorded.ClientID %>'),$('<%= NeckDissecitonDiv.ClientID %>'),$('<%= OpDateText_17.ClientID %>'),$('<%= OpDate_17.ClientID %>'),$('<%= OpQuality_17.ClientID %>'),$('<%= LevelsDissRight.ClientID %>'),$('<%= LevelsDissLeft.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcQuality_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),$('<%= ProcSubsite_17.ClientID %>'),$('<%= ProcName_17.ClientID %>'),$('<%= ProcFinding_1.ClientID %>'),$('<%= ProcFinding_1_Text.ClientID %>'),$('<%= ProcFindSide_1.ClientID %>'),$('<%= ProcFindSite_1.ClientID %>'),$('<%= ProcFindSubsite_1.ClientID %>'),$('<%= ProcFinding_5.ClientID %>'));
    addEvents($('<%= NeckDissecitonRecorded.ClientID %>'),$('<%= NeckDissecitonDiv.ClientID %>'),$('<%= OpDateText_17.ClientID %>'),$('<%= OpDate_17.ClientID %>'),$('<%= OpQuality_17.ClientID %>'),$('<%= LevelsDissRight.ClientID %>'),$('<%= LevelsDissLeft.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcQuality_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),$('<%= ProcSubsite_17.ClientID %>'),$('<%= ProcName_17.ClientID %>'),$('<%= ProcFinding_2.ClientID %>'),$('<%= ProcFinding_2_Text.ClientID %>'),$('<%= ProcFindSide_2.ClientID %>'),$('<%= ProcFindSite_2.ClientID %>'),$('<%= ProcFindSubsite_2.ClientID %>'),$('<%= ProcFinding_6.ClientID %>'));
    addEvents($('<%= NeckDissecitonRecorded.ClientID %>'),$('<%= NeckDissecitonDiv.ClientID %>'),$('<%= OpDateText_17.ClientID %>'),$('<%= OpDate_17.ClientID %>'),$('<%= OpQuality_17.ClientID %>'),$('<%= LevelsDissRight.ClientID %>'),$('<%= LevelsDissLeft.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcQuality_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),$('<%= ProcSubsite_17.ClientID %>'),$('<%= ProcName_17.ClientID %>'),$('<%= ProcFinding_3.ClientID %>'),$('<%= ProcFinding_3_Text.ClientID %>'),$('<%= ProcFindSide_3.ClientID %>'),$('<%= ProcFindSite_3.ClientID %>'),$('<%= ProcFindSubsite_3.ClientID %>'),$('<%= ProcFinding_7.ClientID %>'));
    addEvents($('<%= NeckDissecitonRecorded.ClientID %>'),$('<%= NeckDissecitonDiv.ClientID %>'),$('<%= OpDateText_17.ClientID %>'),$('<%= OpDate_17.ClientID %>'),$('<%= OpQuality_17.ClientID %>'),$('<%= LevelsDissRight.ClientID %>'),$('<%= LevelsDissLeft.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcQuality_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),$('<%= ProcSubsite_17.ClientID %>'),$('<%= ProcName_17.ClientID %>'),$('<%= ProcFinding_4.ClientID %>'),$('<%= ProcFinding_4_Text.ClientID %>'),$('<%= ProcFindSide_4.ClientID %>'),$('<%= ProcFindSite_4.ClientID %>'),$('<%= ProcFindSubsite_4.ClientID %>'),$('<%= ProcFinding_8.ClientID %>'));
   
    //Adds events to controls
    function addEvents(neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft)
    { 
        $(opDateText).addEvent('blur',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        
        if (procFindCBRight.type == 'checkbox')
            $(procFindCBRight).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        else if (procFindCBRight.type = 'text')
            $(procFindCBRight).addEvent('blur',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        
        if (procFindCBLeft.type == 'checkbox')
            $(procFindCBLeft).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        else if (procFindCBLeft.type = 'text')
            $(procFindCBLeft).addEvent('blur',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
  
  
        var rbl = neckDissectionRecorded.getElementsByTagName('input');
        for (var j = 0; j < rbl.length; j++)
        {
            var rblRef = rbl[j];
            if (rblRef.type == 'radio')
                  $(rblRef).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        } 
 
        var cbl = levelsRightCBL.getElementsByTagName('input');
        for (var j = 0; j < cbl.length; j++)
        {
            var cblRef = cbl[j];
            if (cblRef.type == 'checkbox')
                  $(cblRef).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
            else if (cblRef.type == 'text')
                  $(cblRef).addEvent('blur',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        } 
        
        var cbl2 = levelsLeftCBL.getElementsByTagName('input');
        for (var j = 0; j < cbl2.length; j++)
        {
            var cblRef2 = cbl2[j];
            if (cblRef2.type == 'checkbox')
                  $(cblRef2).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
            else if (cblRef2.type == 'text')
                  $(cblRef2).addEvent('blur',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        } 
        
        // show on load
        ShowOnLoad(neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft);
   }
 
    /* ]]> */

function ShowOnLoad(neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft)
{
    //re-check any structures that where saved
    if (procFindHidden.value != '')
    {
        var temp = procFindHidden.value;
        temp = temp.replace("Removed ","");

        if (procFindSideHidden.value == 'Right')
        {
            if (procFindCBRight.type == 'checkbox' && temp == procFindCBRight.value)
                procFindCBRight.checked = true;
            else if (procFindCBRight.type == 'text' && temp != 'Accessory Nerve' && temp != 'Steromastoid ' && temp != 'Internal Jugular Vein' )
                procFindCBRight.value = temp;
        }
        else if (procFindSideHidden.value == 'Left')
        {
             if (procFindCBLeft.type == 'checkbox' && temp == procFindCBLeft.value)
                procFindCBLeft.checked = true;
            else if (procFindCBLeft.type == 'text' && temp != 'Accessory Nerve' && temp != 'Steromastoid ' && temp != 'Internal Jugular Vein' )
                procFindCBLeft.value = temp;

        }
        else if (procFindSideHidden.value == 'Bilateral')
        {
            if (procFindCBRight.type == 'checkbox' && temp == procFindCBRight.value)
                procFindCBRight.checked = true;
            else if (procFindCBRight.type == 'text' && temp != 'Accessory Nerve' && temp != 'Steromastoid ' && temp != 'Internal Jugular Vein' )
                procFindCBRight.value = temp;
 
              if (procFindCBLeft.type == 'checkbox' && temp == procFindCBLeft.value)
                procFindCBLeft.checked = true;
            else if (procFindCBLeft.type == 'text' && temp != 'Accessory Nerve' && temp != 'Steromastoid ' && temp != 'Internal Jugular Vein' )
                procFindCBLeft.value = temp;
       }     
    }       
       
    SetHiddenFields(neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft);
} 
    
function SetHiddenFields(neckDissectionRecorded,neckDissectionDiv,opDateText,opDate,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft)
{
        var levelsRightCBLRef = levelsRightCBL.getElementsByTagName('input');
        var levelsLeftCBLRef = levelsLeftCBL.getElementsByTagName('input');
        var neckDissectionRecordedRef = neckDissectionRecorded.getElementsByTagName('input');
               
        for (var i = 0; i < neckDissectionRecordedRef.length; i++) 
            if (neckDissectionRecordedRef[i].checked) 
            {                 
                  if (neckDissectionRecordedRef[i].value == "Yes" )
                   neckDissectionDiv.style.display='block';
                  else if (neckDissectionRecordedRef[i].value == "No")
                  {
                    neckDissectionDiv.style.display='none';
                    opDateText.value = '';
                    opDate.value = '';   
                    
                    for (var i = 0; i < levelsRightCBLRef.length; i++)
                        levelsRightCBLRef[i].checked = false;
                        
                    for (var i = 0; i < levelsLeftCBLRef.length; i++)
                        levelsLeftCBLRef[i].checked = false;
                    
                    if (procFindCBRight.type == 'checkbox')
                        procFindCBRight.checked = false;
                    else if (procFindCBRight.type == 'text') 
                        procFindCBRight.value = '';
 
                     if (procFindCBLeft.type == 'checkbox')
                        procFindCBLeft.checked = false;
                    else if (procFindCBLeft.type == 'text') 
                        procFindCBLeft.value = '';                 
                  }
            }
            
         var levelsRightString = RetrieveCheckBoxListSelectedValues (levelsRightCBL,"FLOW");
         var levelsLeftString = RetrieveCheckBoxListSelectedValues (levelsLeftCBL,"FLOW");
            
           
        if (opDateText.value != '' || levelsRightString != '' || levelsLeftString != '')
        {            
            procSiteHidden.value = 'Neck';
            procNameHidden.value = 'Neck Dissection';
            procDateTextHidden.value = opDateText.value;
            procDateHidden.value = opDate.value;
            procQualityHidden.value = 'STD';
            opQualityHidden.value = 'STD';            
            
            if (levelsRightString != '' && levelsLeftString == '')
            {
                procSideHidden.value = "Right";
                
                var temp = levelsRightString;
                temp = temp.replace("N/K: Lateral","1,2,3,4,5");
                temp = temp.replace("N/K: Central"," 6,7");
                temp = temp.replace("N/K","1,2,3,4,5,6,7");
                procSubsiteHidden.value = "Level: " + temp;
            }
            else if (levelsRightString == '' && levelsLeftString != '')
            {
                procSideHidden.value = "Left";
 
                var temp = levelsLeftString;
                temp = temp.replace("N/K: Lateral","1,2,3,4,5");
                temp = temp.replace("N/K: Central"," 6,7");
                temp = temp.replace("N/K","1,2,3,4,5,6,7");
                procSubsiteHidden.value = "Level: " + temp;
               
            }
            else if (levelsRightString != '' && levelsLeftString != '')
            {
                procSideHidden.value = "Bilateral";
                
                //determine if left and right checkbox have the same items checked
                var HaveSameItems = 'true';
                for (var i = 0; i < levelsRightCBLRef.length; i++)
                        if (levelsRightCBLRef[i].checked != levelsLeftCBLRef[i].checked)
                            HaveSameItems = 'false';
                            
                // if the left and right levels have the same items checked
                if (HaveSameItems == 'true')
                {
                    // use on one to fill the subsite field
                    var temp = levelsRightString;
                    temp = temp.replace("N/K: Lateral","1,2,3,4,5");
                    temp = temp.replace("N/K: Central"," 6,7");
                    temp = temp.replace("N/K","1,2,3,4,5,6,7");
                    procSubsiteHidden.value = "Level: " + temp;
                    
                }
                // else, the left and right levels have different items checked
                else
                {
                    //enter both into subsite field
                    var temp = levelsRightString;
                    temp = temp.replace("N/K: Lateral","1,2,3,4,5");
                    temp = temp.replace("N/K: Central"," 6,7");
                    temp = temp.replace("N/K","1,2,3,4,5,6,7");
                    temp = "Right Level: " + temp;                   
                    
                    var temp2 = levelsLeftString;
                    temp2 = temp2.replace("N/K: Lateral","1,2,3,4,5");
                    temp2 = temp2.replace("N/K: Central"," 6,7");
                    temp2 = temp2.replace("N/K","1,2,3,4,5,6,7");
                    temp2 = "Left Level: " + temp2;
                    
                    procSubsiteHidden.value = temp + "; " + temp2;                               
                }            
            }
        }
        else
        {
            procSiteHidden.value = '';
            procNameHidden.value = '';
            procSideHidden.value = '';
            procSubsiteHidden.value = '';
        }

        if (procFindCBRight.type == 'checkbox' && procFindCBLeft.type == 'checkbox')
        {
            if (procFindCBRight.checked || procFindCBLeft.checked)
            {                
                procFindSiteHidden.value = 'Neck';
                procFindSideHidden.value = procSideHidden.value;
                procFindSubsiteHidden.value = procSubsiteHidden.value;
                
                if (procFindCBRight.checked)
                    procFindHidden.value = "Removed " + procFindCBRight.value;
                else (procFindCBRight.checked)
                    procFindHidden.value = "Removed " + procFindCBLeft.value;                
            }
            else
            {
                procFindSiteHidden.value = '';
                procFindHidden.value = '';
                procFindSideHidden.value = '';
                procFindSubsiteHidden.value = '';
            }
        }
        else if (procFindCBRight.type == 'text' && procFindCBLeft.type == 'text')
        {
            if (procFindCBRight.value != '' || procFindCBLeft.value != '')
            {                
                procFindSiteHidden.value = 'Neck';
                procFindSideHidden.value = procSideHidden.value;
                procFindSubsiteHidden.value = procSubsiteHidden.value;
                
                if (procFindCBRight.value != '')
                    procFindHidden.value = "Removed " + procFindCBRight.value; 
                else if (procFindCBLeft.value != '')
                    procFindHidden.value = "Removed " + procFindCBLeft.value;               
            }
            else
            {
                procFindSiteHidden.value = '';
                procFindHidden.value = '';
                procFindSideHidden.value = '';
                procFindSubsiteHidden.value = '';
            }
        }
}
</script>