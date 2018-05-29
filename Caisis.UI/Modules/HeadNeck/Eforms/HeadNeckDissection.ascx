<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeadNeckDissection.ascx.cs" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.HeadNeckDissection" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />

<a name="HeadNeckDissection" /><br/>
<div id="TopNeckDissecitonDiv" runat="server" style="display: inline;">
<table width="340" cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue">
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
<br />

<div id="NeckDissecitonDiv" runat="server" style="display: none;">
   
    <table border="0" cellspacing="1" cellpadding="3" class="ClinicalEformTable">

        <tr>
            <td align="center" colspan="1" class="eformLargePopulatedTableBlue"></td>
            <td align="center" colspan="1" class="eformLargePopulatedTableBlue"><span class="controlBoxTitle">Levels Dissected</span></td>
            <td align="center" colspan="4" class="eformLargePopulatedTable"><span class="controlBoxTitle">Additional Structures Removed</span></td>
        </tr>
        
        <tr>
            <td style="text-align: left; white-space: nowrap;"  >Right Levels </td>        
            <td valign="middle" style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
                <euc:EformExtendedCheckBoxList style="white-space: nowrap;" Table="NoTable" Field="LevelsDissRight" ID="LevelsDissRight" runat="server" RepeatColumns="7" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="1" Text="1" />
                    <asp:ListItem Value="2" Text="2" />
                    <asp:ListItem Value="3" Text="3" />
                    <asp:ListItem Value="4" Text="4" />
                    <asp:ListItem Value="5" Text="5" />
                    <asp:ListItem Value="6" Text="6" />
                    <asp:ListItem Value="7" Text="7" />                           
                </euc:EformExtendedCheckBoxList>
               
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ID="ProcDateText_17" TABLE="Procedures" FIELD="ProcDateText" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ID="ProcDate_17" TABLE="Procedures" FIELD="ProcDate" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ID="ProcSide_17" TABLE="Procedures" FIELD="ProcSide" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ID="ProcSite_17" TABLE="Procedures" FIELD="ProcSite" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ID="ProcSubsite_17" TABLE="Procedures" FIELD="ProcSubsite" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ID="ProcName_17" TABLE="Procedures" FIELD="ProcName" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ID="ProcQuality_17" TABLE="Procedures" FIELD="ProcQuality" />              
               
               
            </td>
            <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
                <table class="CheckBoxListLayer">
                    <tr>
                        <td>
                            <input type="checkbox" id="ProcFinding_1" value="Accessory Nerve" runat="server" />
                            <euc:EformTextBox Width="1px" Style="display: none;" ID="ProcFinding_1_Text" runat="server"
                                RecordId="1" ParentRecordId="17" Table="ProcedureFinding" Field="ProcFinding" />
                            <euc:EformTextBox Width="1px" Style="display: none;" RecordId="1" ParentRecordId="17"
                                Table="ProcedureFinding" Field="ProcFindSide" ID="ProcFindSide_1" runat="server" />
                            <euc:EformTextBox Width="1px" Style="display: none;" RecordId="1" ParentRecordId="17"
                                Table="ProcedureFinding" Field="ProcFindSite" ID="ProcFindSite_1" runat="server" />
                            <euc:EformTextBox Width="1px" Style="display: none;" RecordId="1" ParentRecordId="17"
                                Table="ProcedureFinding" Field="ProcFindSubsite" ID="ProcFindSubsite_1" runat="server" />
                        </td>
                        <td>
                            <asp:Label runat="server" AssociatedControlID="ProcFinding_1">Accessory Nerve</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" id="ProcFinding_2" value="Sternomastoid" runat="server" />
                            <euc:EformTextBox Width="1px" Style="display: none;" ID="ProcFinding_2_Text" runat="server"
                                RecordId="2" ParentRecordId="17" Table="ProcedureFinding" Field="ProcFinding" />
                            <euc:EformTextBox Width="1px" Style="display: none;" RecordId="2" ParentRecordId="17"
                                Table="ProcedureFinding" Field="ProcFindSide" ID="ProcFindSide_2" runat="server" />
                            <euc:EformTextBox Width="1px" Style="display: none;" RecordId="2" ParentRecordId="17"
                                Table="ProcedureFinding" Field="ProcFindSite" ID="ProcFindSite_2" runat="server" />
                            <euc:EformTextBox Width="1px" Style="display: none;" RecordId="2" ParentRecordId="17"
                                Table="ProcedureFinding" Field="ProcFindSubsite" ID="ProcFindSubsite_2" runat="server" />
                        </td>
                        <td>
                            <asp:Label runat="server" AssociatedControlID="ProcFinding_2">Sternomastoid</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" id="ProcFinding_3" value="Internal Jugular Vein" runat="server" />
                            <euc:EformTextBox Width="1px" Style="display: none;" ID="ProcFinding_3_Text" runat="server"
                                RecordId="3" ParentRecordId="17" Table="ProcedureFinding" Field="ProcFinding" />
                            <euc:EformTextBox Width="1px" Style="display: none;" RecordId="3" ParentRecordId="17"
                                Table="ProcedureFinding" Field="ProcFindSide" ID="ProcFindSide_3" runat="server" />
                            <euc:EformTextBox Width="1px" Style="display: none;" RecordId="3" ParentRecordId="17"
                                Table="ProcedureFinding" Field="ProcFindSite" ID="ProcFindSite_3" runat="server" />
                            <euc:EformTextBox Width="1px" Style="display: none;" RecordId="3" ParentRecordId="17"
                                Table="ProcedureFinding" Field="ProcFindSubsite" ID="ProcFindSubsite_3" runat="server" />
                        </td>
                        <td>
                             <asp:Label runat="server" AssociatedControlID="ProcFinding_3">Internal Jugular Vein</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" AssociatedControlID="ProcFinding_4" CssClass="boldText">Other:&nbsp;</asp:Label>
                        </td>
                        <td>
                            <input type="text" id="ProcFinding_4" runat="server" />
                            <euc:EformTextBox Width="1px" Style="display: none;" ID="ProcFinding_4_Text" runat="server"
                                RecordId="4" ParentRecordId="17" Table="ProcedureFinding" Field="ProcFinding" />
                            <euc:EformTextBox Width="1px" Style="display: none;" RecordId="4" ParentRecordId="17"
                                Table="ProcedureFinding" Field="ProcFindSide" ID="ProcFindSide_4" runat="server" />
                            <euc:EformTextBox Width="1px" Style="display: none;" RecordId="4" ParentRecordId="17"
                                Table="ProcedureFinding" Field="ProcFindSite" ID="ProcFindSite_4" runat="server" />
                            <euc:EformTextBox Width="1px" Style="display: none;" RecordId="4" ParentRecordId="17"
                                Table="ProcedureFinding" Field="ProcFindSubsite" ID="ProcFindSubsite_4" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; white-space: nowrap;"  >Left Levels </td>       
            <td valign="middle" style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
                <euc:EformExtendedCheckBoxList style="white-space: nowrap;" Table="NoTable" Field="LevelsDissLeft" ID="LevelsDissLeft" runat="server" RepeatColumns="7" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="1" Text="1" />
                    <asp:ListItem Value="2" Text="2" />
                    <asp:ListItem Value="3" Text="3" />
                    <asp:ListItem Value="4" Text="4" />
                    <asp:ListItem Value="5" Text="5" />
                    <asp:ListItem Value="6" Text="6" />
                    <asp:ListItem Value="7" Text="7" />                             
                </euc:EformExtendedCheckBoxList>          
               </td>
            <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
                <table class="CheckBoxListLayer">
                    <tr>
                        <td>
                            <input type="checkbox" id="ProcFinding_5" value="Accessory Nerve" runat="server" />
                        </td>
                        <td>
                            <asp:Label runat="server" AssociatedControlID="ProcFinding_5">Accessory Nerve</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" id="ProcFinding_6" value="Sternomastoid" runat="server" />
                        </td>
                        <td>
                            <asp:Label runat="server" AssociatedControlID="ProcFinding_6">Sternomastoid</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" id="ProcFinding_7" value="Internal Jugular Vein" runat="server" />
                        </td>
                        <td>
                            <asp:Label runat="server" AssociatedControlID="ProcFinding_7">Internal Jugular Vein</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" AssociatedControlID="ProcFinding_8" CssClass="boldText">
                            Other:&nbsp;</asp:Label>
                        </td>
                        <td>
                            <input type="text" id="ProcFinding_8" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>


    </table>
</div>
<br/><br/>
</div>


<script type="text/javascript">
   
    addEvents($('<%= NeckDissecitonRecorded.ClientID %>'),$('<%= NeckDissecitonDiv.ClientID %>'),$('<%= LevelsDissRight.ClientID %>'),$('<%= LevelsDissLeft.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcQuality_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),$('<%= ProcSubsite_17.ClientID %>'),$('<%= ProcName_17.ClientID %>'),$('<%= ProcFinding_1.ClientID %>'),$('<%= ProcFinding_1_Text.ClientID %>'),$('<%= ProcFindSide_1.ClientID %>'),$('<%= ProcFindSite_1.ClientID %>'),$('<%= ProcFindSubsite_1.ClientID %>'),$('<%= ProcFinding_5.ClientID %>'));
    addEvents($('<%= NeckDissecitonRecorded.ClientID %>'),$('<%= NeckDissecitonDiv.ClientID %>'),$('<%= LevelsDissRight.ClientID %>'),$('<%= LevelsDissLeft.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcQuality_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),$('<%= ProcSubsite_17.ClientID %>'),$('<%= ProcName_17.ClientID %>'),$('<%= ProcFinding_2.ClientID %>'),$('<%= ProcFinding_2_Text.ClientID %>'),$('<%= ProcFindSide_2.ClientID %>'),$('<%= ProcFindSite_2.ClientID %>'),$('<%= ProcFindSubsite_2.ClientID %>'),$('<%= ProcFinding_6.ClientID %>'));
    addEvents($('<%= NeckDissecitonRecorded.ClientID %>'),$('<%= NeckDissecitonDiv.ClientID %>'),$('<%= LevelsDissRight.ClientID %>'),$('<%= LevelsDissLeft.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcQuality_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),$('<%= ProcSubsite_17.ClientID %>'),$('<%= ProcName_17.ClientID %>'),$('<%= ProcFinding_3.ClientID %>'),$('<%= ProcFinding_3_Text.ClientID %>'),$('<%= ProcFindSide_3.ClientID %>'),$('<%= ProcFindSite_3.ClientID %>'),$('<%= ProcFindSubsite_3.ClientID %>'),$('<%= ProcFinding_7.ClientID %>'));
    addEvents($('<%= NeckDissecitonRecorded.ClientID %>'),$('<%= NeckDissecitonDiv.ClientID %>'),$('<%= LevelsDissRight.ClientID %>'),$('<%= LevelsDissLeft.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcQuality_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),$('<%= ProcSubsite_17.ClientID %>'),$('<%= ProcName_17.ClientID %>'),$('<%= ProcFinding_4.ClientID %>'),$('<%= ProcFinding_4_Text.ClientID %>'),$('<%= ProcFindSide_4.ClientID %>'),$('<%= ProcFindSite_4.ClientID %>'),$('<%= ProcFindSubsite_4.ClientID %>'),$('<%= ProcFinding_8.ClientID %>'));

    //Adds events to controls
    function addEvents(neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft)
    { 
        
        if (procFindCBRight.type == 'checkbox')
            $(procFindCBRight).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        else if (procFindCBRight.type = 'text')
            $(procFindCBRight).addEvent('blur',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        
        if (procFindCBLeft.type == 'checkbox')
            $(procFindCBLeft).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        else if (procFindCBLeft.type = 'text')
            $(procFindCBLeft).addEvent('blur',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
  
  
        var rbl = neckDissectionRecorded.getElementsByTagName('input');
        for (var j = 0; j < rbl.length; j++)
        {
            var rblRef = rbl[j];
            if (rblRef.type == 'radio')
                  $(rblRef).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        } 
 
        var cbl = levelsRightCBL.getElementsByTagName('input');
        for (var j = 0; j < cbl.length; j++)
        {
            var cblRef = cbl[j];
            if (cblRef.type == 'checkbox')
                  $(cblRef).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
            else if (cblRef.type == 'text')
                  $(cblRef).addEvent('blur',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        } 
        
        var cbl2 = levelsLeftCBL.getElementsByTagName('input');
        for (var j = 0; j < cbl2.length; j++)
        {
            var cblRef2 = cbl2[j];
            if (cblRef2.type == 'checkbox')
                  $(cblRef2).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
            else if (cblRef2.type == 'text')
                  $(cblRef2).addEvent('blur',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        } 
        
        // show on load
        ShowOnLoad(neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft);
    }
    

    function ShowOnLoad(neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft)
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
                else if (procFindCBRight.type == 'text' && temp != 'Accessory Nerve' && temp != 'Sternomastoid ' && temp != 'Internal Jugular Vein' )
                    procFindCBRight.value = temp;
            }
            else if (procFindSideHidden.value == 'Left')
            {
                 if (procFindCBLeft.type == 'checkbox' && temp == procFindCBLeft.value)
                    procFindCBLeft.checked = true;
                else if (procFindCBLeft.type == 'text' && temp != 'Accessory Nerve' && temp != 'Sternomastoid ' && temp != 'Internal Jugular Vein' )
                    procFindCBLeft.value = temp;

            }
            else if (procFindSideHidden.value == 'Bilateral')
            {
                if (procFindCBRight.type == 'checkbox' && temp == procFindCBRight.value)
                    procFindCBRight.checked = true;
                else if (procFindCBRight.type == 'text' && temp != 'Accessory Nerve' && temp != 'Sternomastoid ' && temp != 'Internal Jugular Vein' )
                    procFindCBRight.value = temp;
 
                  if (procFindCBLeft.type == 'checkbox' && temp == procFindCBLeft.value)
                    procFindCBLeft.checked = true;
                else if (procFindCBLeft.type == 'text' && temp != 'Accessory Nerve' && temp != 'Sternomastoid ' && temp != 'Internal Jugular Vein' )
                    procFindCBLeft.value = temp;
           }     
        }    
       
        SetHiddenFields(neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft);

        //Disable Neck Dissection if primary procedure site = 'Neck' (HeadNeckPrimaryProcedure)
        var ProcSite = getProcSite();  //document.getElementById('ctl00_ProcSite_1'); 
        var ProcName = getProcName();  //document.getElementById('ctl00_ProcName_1');
        
        if ((ProcSite) && (ProcName)) {
            if (ProcSite.value == 'Neck' && ProcName.value == 'Neck Dissection')
            {
                neckDissectionRecorded.disabled = true;
                //hide Neck Dissection component if primary procedure ProcSite = 'Neck' and ProcName = 'Neck Dissection'
                var TopDiv = document.getElementById('<%= TopNeckDissecitonDiv.ClientID %>');
                if (TopDiv) { TopDiv.style.display = 'none'; }

                procSiteHidden.value = '';
                procNameHidden.value = '';
                procSideHidden.value = '';
                procSubsiteHidden.value = ''; 
                procDateTextHidden.value = '';
                procDateHidden.value = '';
                procQualityHidden.value = ''; 
            }
        }
    }

    function getProcSite() {
        var ndr = null;
        var ddls = document.getElementsByTagName("select");
        for (var j = 0; j < ddls.length; j++) {
            var ddl = ddls[j];
            if (ddl.id.indexOf('ProcSite_1') > -1) {
                ndr = ddl;
                break;
            }
        }
        return ndr;
    }

    function getProcName() {
        var ndr = null;
        var ddls = document.getElementsByTagName("input");
        for (var j = 0; j < ddls.length; j++) {
            var ddl = ddls[j];
            if (ddl.id.indexOf('ProcName_1') > -1) {
                ndr = ddl;
                break;
            }
        }
        return ndr;
    }

    function SetHiddenFields(neckDissectionRecorded,neckDissectionDiv,levelsRightCBL,levelsLeftCBL,procDateTextHidden,procDateHidden,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procNameHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft)
    {
        var levelsRightCBLRef = levelsRightCBL.getElementsByTagName('input');
        var levelsLeftCBLRef = levelsLeftCBL.getElementsByTagName('input');
        var neckDissectionRecordedRef = neckDissectionRecorded.getElementsByTagName('input');
               
        for (var i = 0; i < neckDissectionRecordedRef.length; i++) 
            if (neckDissectionRecordedRef[i].checked) 
            {                 
                  if (neckDissectionRecordedRef[i].value == "Yes" )
                  {
                    neckDissectionDiv.style.display='block';
                      
                  }
                  else if (neckDissectionRecordedRef[i].value == "No")
                  {
                    neckDissectionDiv.style.display='none';                      
                    
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
                        
                        
                    procSiteHidden.value = '';
                    procNameHidden.value = '';
                    procSideHidden.value = '';
                    procSubsiteHidden.value = '';                
                  }
            }
            
         var levelsRightString = RetrieveCheckBoxListSelectedValues (levelsRightCBL,"FLOW");
         var levelsLeftString = RetrieveCheckBoxListSelectedValues (levelsLeftCBL,"FLOW");
            
           
        if (levelsRightString != '' || levelsLeftString != '')
        {            
            //if (procSiteHidden.value == '')
                procSiteHidden.value = 'Neck';
            
            //if (procNameHidden.value == '')
                procNameHidden.value = 'Neck Dissection';           
            
            procQualityHidden.value = 'STD';                
            
            if (levelsRightString != '' && levelsLeftString == '')
            {
                procSideHidden.value = "Right";
                
                var temp = levelsRightString;               
                procSubsiteHidden.value = "Level " + temp;
            }
            else if (levelsRightString == '' && levelsLeftString != '')
            {
                procSideHidden.value = "Left";
 
                var temp = levelsLeftString;               
                procSubsiteHidden.value = "Level " + temp;
               
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
                    procSubsiteHidden.value = "Level " + temp;
                    
                }
                // else, the left and right levels have different items checked
                else
                {
                    //enter both into subsite field
                    var temp = levelsRightString;                   
                    temp = "Right Level " + temp;                   
                    
                    var temp2 = levelsLeftString;                   
                    temp2 = "Left Level " + temp2;
                    
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
            procDateTextHidden.value = '';
            procDateHidden.value = '';
            procQualityHidden.value = '';
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
                procDateTextHidden.value = '';
                procDateHidden.value = '';
                procQualityHidden.value = '';                
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
                procDateTextHidden.value = '';
                procDateHidden.value = '';
                procQualityHidden.value = '';                
            }
        }
    }
</script>