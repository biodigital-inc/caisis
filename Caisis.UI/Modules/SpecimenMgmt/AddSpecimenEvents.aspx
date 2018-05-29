<%@ Page EnableViewState="true" Language="c#" CodeFile="AddSpecimenEvents.aspx.cs"
    AutoEventWireup="true" Inherits="Caisis.UI.Modules.SpecimenMgmt.AddSpecimenEvents" %>

<%@ Register TagPrefix="cc" TagName="LocationControl" Src="~/Plugins/SpecimenLocation/SpecimenLocationControl.ascx" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Specimen Events</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script type="text/javascript">	    
        //offset height should be 480 for formatting reasons in both IE & firefox
        Browser.ResizeElement( { nodeId: 'eventsDiv', heightOffset: 480 } ); 
        
        //setting width & height to fit the events frame
        NotesEditor.editorWidth = 500;
        NotesEditor.editorHeight = 75;
        
  	    function toggle_visible (arg1) 
	    {
	        var el = document.getElementById (arg1);
	        var isVisible = (el.style.visibility == "hidden") ? true : false;

	        el.style.visibility = isVisible ? "visible" : "hidden";
	        el.style.display = isVisible ? "inline" : "none";
	    }
	    // End Override utility functions for getting position of combo boxes
	   
        function toggleIcon(icon,onSrc,offSrc,isEdit,disable)
        {
            icon.disabled = disable ;
            icon.src = isEdit ? onSrc : offSrc;
            icon.style.cursor = disable ? 'default' : 'pointer';
        }
        
        function disableEnableRow(row,disable)
        {
            if(disable) 
            { 
                disableInputFields(row); 
                resetInputFields(row); //reset to default since user clicked Cancel
            }
            else 
            { 
                enableInputFields(row); 
            }
            
            var inputs = row.getElementsByTagName('INPUT');
            var len = inputs.length;
            var editImage = inputs[len-3];
            editImage.disabled = false;
            var saveImage = inputs[len-2];
            saveImage.disabled = false;
            var delImg = inputs[len-1];
            delImg.disabled = false;
            
            var isEdit = row.editState;
            toggleIcon(editImage,'../../Images/iconCancel.gif','../../Images/iconEdit.gif',isEdit,false);
            toggleIcon(saveImage,'../../Images/iconSave.gif','../../Images/iconSave_Off.gif',isEdit,disable);
            toggleIcon(delImg,'../../Images/ButtonSmallDelete.gif','../../Images/iconDelete_Off.gif',isEdit,disable);
        }
        
	    function enableGridFields(rowIndex) 
        {
            var grid = document.getElementById('<%= SpecimenEventsGridView.ClientID %>');
            var tableRows = grid.getElementsByTagName('TR');
            var row = tableRows[rowIndex];
            row.editState =  row.editState ? false : true;
            
            if(row.editState)
            {
                for(var i=0;i<tableRows.length-1;i++)
                {
                    var currentRow = tableRows[i];
                    if(currentRow!=row) 
                    {
                        disableEnableRow(currentRow,true); //diable row fields
                    }
                    else 
                    { 
                        disableEnableRow(currentRow,false); //enable row fields
                    }
                }
            }
            else
            {
                disableEnableRow(row,true); //diable row fields
            }
        }        
        
        function disIsDirty(){}
        
        //to set Test as required field
        function validateTest(comboId)
        {
            var evtTest = document.getElementById(comboId);
            if(evtTest)
            {
                if(evtTest.value.replace(' ','')=='')
                {
                    alert('Please select Test!');
                    return false;
                }
                else
                {
                    return true;
                }
            }
            else
            {
                return true;
            }
        }
        
        
    //Browser.ResizeElement( { nodeId: 'eventsDiv', heightOffset: 645 });    
        
    </script>

    <!-- Controls the Styles defining box colors in popup layer -->
    <style type="text/css">
    
  .BoxMatrix td
    {
        text-align: center;
        vertical-align: middle;
        height: 20px;
        cursor: pointer;
    }

    input.PseudoSpan
    {
        border-style: none; 
        background-color: #f8fafc;
        font-size:11px;        
        color:#696969;
        font-family:Verdana, Arial, Helvetica, sans-serif;
    }
        td.leftL
        {
            text-align:right; font-size:11px; vertical-align:center; color:#000000;font-family:Verdana, Arial, Helvetica, sans-serif;
        }
        td.rightR
        {
            text-align:left; font-size:11px; vertical-align:center;font-family:Verdana, Arial, Helvetica, sans-serif;
        }
        td.left
        {
            width: 45%; text-align:left; padding-top:5px; vertical-align:top;
        }
        td.right
        {
            width: 55%; text-align:left; padding-top:5px; vertical-align:top;
        }
        tr.gridHeader
        {
            background-color: #00668d;
            text-align: center;
        }
        td.headerTitle
        {
            font-weight: bold; font-size: 10px; color: #ffffff; 
            font-family: Verdana, Arial, Helvetica, sans-serif; 
            text-align:center;
        }
        td.hdrType
        {
            font-weight: bold; font-size: 11px; color:#8d282c; 
            font-family: Verdana, Arial, Helvetica, sans-serif; 
            height:20px;
            text-align:left;
        }
        td.footerCell
        {
            background-color:#F1F7FC;
            padding-top:3px;
            height:40px;
            text-align:center;
            vertical-align: top;
            border-color:#999999; border-width:1px; border-style:solid; 
        }
        .LeftAlignText
        {
            text-align:left;
        }
        .PaddingBottom
        {
            padding-bottom:18px;
        }
    </style>
</head>
<body style="margin: 0px; width: 100%; background-color: #f1f7fc;">
    <form id="dataForm" method="post" runat="server">
        <table width="100%" cellpadding="0" cellspacing="0">
            <!-- Specimen Events Grid -->
            <tr >
                <td colspan="2" >
                    <!-- width should be 900 for formatting reasons -->
                        <div  style="text-align: left;">
                            <asp:Label runat="server" ID="refNumber" Font-Size="12px" ForeColor="#8d282c" Font-Bold="true" Width="780px"></asp:Label>
                            <asp:Label ID="totalSpecimenEvents" runat="server" CssClass="TableNotes" Font-Size="11px" Width="120px"></asp:Label>
                        </div>
                        <!-- Specimen Events Grid header-->
                        <table id="SpecimenEventsGridViewTable" border="0" cellpadding="2" cellspacing="0" runat="server" width="915px">
                            <tr class="gridHeader">
                                <td class="headerTitle" style="width: 20px; text-align:left;">Pending</td>
                                <td class="headerTitle" style="width: 60px;text-align:left;">Date</td>
                                <td class="headerTitle" style="width: 60px;text-align:center;">Received<br />Date</td>
                                <td class="headerTitle" style="width: 30px;font-size: smaller;text-align:center;">Qty<br />Used</td>
                                <td class="headerTitle" style="width: 30px; font-size: smaller;text-align:left;">Units</td>
                                <%--<td class="headerTitle" style="width: 65px;">Time</td>--%>
                                <td class="headerTitle" style="width: 80px;text-align:left; ">ProcessedBy</td>
                                <td class="hdrType" style="width: 55px;padding-right:5px;text-align:left;">Test</td>
                                <td class="headerTitle" style="width: 55px;">Analyte</td> 
                                <td class="headerTitle" style="width: 60px;">SubTest</td>       
                                <td class="headerTitle" style="width: 65px;padding-right:20px">Result</td>
                                <td class="headerTitle" style="width: 65px">Notes</td>
                                <td id="hdrRpt" class="headerTitle" style="width: 65px;" visible="false">Report</td>
                                <td class="headerTitle" style="width: 65px;padding-right:20px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="13">
                                    <div id="eventsDiv" style="overflow-y:auto; text-align: center; width:auto; background-color: #ffffff; border: solid 1px #cccccc; position:relative;">
                                        <!-- Specimen Events GridView -->
                                        <!-- width should be 915 for formatting reasons-->
                                        <asp:GridView DataKeyNames="SpecimenEventId" ID="SpecimenEventsGridView" runat="server"
                                            Width="915" Visible="true" AutoGenerateColumns="false" ShowFooter="true" ShowHeader="false"
                                            OnRowUpdating="HandleRowUpdating" OnRowDeleting="HandleRowDeleting" OnRowDataBound="SetFieldValues"
                                            BackColor="White" AlternatingRowStyle-BackColor="#ffffff" CellPadding="2" CellSpacing="0"
                                            BorderStyle="Solid" BorderWidth="1px" CssClass="smallPrint" style="border: solid 1px #ffffff;" >
                                            <FooterStyle ForeColor="White" BackColor="#ffffff" Font-Bold="False" Font-Size="Smaller"
                                                Font-Names="Verdana, Arial, Helvetica, sans-serif" BorderStyle="Solid" BorderWidth="0px"
                                                BorderColor="#999999" />
                                            <EmptyDataRowStyle ForeColor="White" BackColor="#ffffff" Font-Bold="False" Font-Size="Smaller"
                                                Font-Names="Verdana, Arial, Helvetica, sans-serif" BorderStyle="Solid" BorderWidth="0px"
                                                BorderColor="#999999"/>
                                            <EmptyDataTemplate>
                                                <table width="905">
                                                    <tr>
                                                        <td style="font-size:smaller; text-align:left;">
                                                            <cc:CaisisCheckBox ID="EvtChkBox" Enabled="true" Table="SpecimenEvents" runat="server"
                                                                Field="EventPending" ShowLabel="false" Width="30" TabIndex="1"></cc:CaisisCheckBox>
                                                        </td>
                                                        <td style="font-size:smaller;">
                                                            <cc:CaisisTextBox ID="EvtDtTxtBox" Table="SpecimenEvents" runat="server" Enabled="true"
                                                                Field="EventDateText" ShowLabel="false" Width="60" TabIndex="2" ShowCalendar="true">
                                                            </cc:CaisisTextBox>
                                                        </td>
                                                        <td style="font-size:smaller;">
                                                            <cc:CaisisTextBox ID="ResultsRecDtTxtBox" Table="SpecimenEvents" runat="server" Enabled="true"
                                                                Field="ResultsReceivedDateText" ShowLabel="false" Width="60" TabIndex="3" ShowCalendar="true">
                                                            </cc:CaisisTextBox>
                                                        </td>
                                                        <td style="font-size:smaller;">
                                                            <cc:CaisisTextBox ID="EvtQtyUsed" Enabled="true" Table="SpecimenEvents" runat="server"
                                                                Field="QuantityUsed" ShowLabel="false" Width="30" TabIndex="4">
                                                            </cc:CaisisTextBox>
                                                        </td>
                                                        <td style="font-size:smaller;">
                                                            <cc:CaisisSelect ID="EvtQtyUnits" Enabled="true" Table="SpecimenEvents" runat="server"
                                                                Field="QuantityUnits" LookupCode="Specimen_Units" ShowLabel="false" Width="40"
                                                                TabIndex="5">
                                                            </cc:CaisisSelect>
                                                        </td>
                                                        <%--<td style="width: 60px">
                                                            <cc:CaisisTextBox ID="EvtTimeTxtBox" runat="server" Width="50" ShowLabel="False"
                                                                Table="SpecimenEvents" Field="EventTime" Enabled="true" TabIndex="17">
                                                            </cc:CaisisTextBox>
                                                        </td>--%>
                                                        <td style="font-size:smaller;">
                                                            <cc:CaisisComboBox ID="ProcessedBy" runat="server" Width="80" ShowLabel="False" 
                                                                Table="SpecimenEvents" Field="ProcessedBy" LookupCode="Specimen_EventProcessedBy" 
                                                                Enabled="true" TabIndex="6" DropDownWidth="90px" DropDownHeight="auto">
                                                            </cc:CaisisComboBox>
                                                        </td>
                                                        <%--TODO: properties for Test, Analyte, Subtest are to changed after 
                                                            dual-cascading is added--%> 
                                                        <td style="font-size:smaller;">
                                                            <cc:CaisisComboBox ID="EvtTest" runat="server" Width="55" ShowLabel="False" 
                                                                Table="SpecimenEvents" Field="EventType" LookupCode="Specimen_EventTest" 
                                                                TabIndex="7" Enabled="true" Required="true" DropDownHeight="auto" 
                                                                DropDownWidth="90px">
                                                            </cc:CaisisComboBox>
                                                        </td>
                                                        <td style="font-size:smaller;">
                                                            <cc:CaisisComboBox ID="EvtAnalyte" runat="server" LookupCode="Specimen_EventAnalyte" 
                                                                Width="45" ShowLabel="False" Table="SpecimenEvents" Field="EventAnalyte" TabIndex="8" 
                                                                Enabled="true" Required="true" DropDownHeight="auto" DropDownWidth="70px" 
                                                                CascadeValuesBasedOn="EventType" CascadeFormatString="Specimen_EventTest">
                                                            </cc:CaisisComboBox>
                                                        </td>
                                                        <td style="font-size:smaller;">
                                                            <cc:CaisisComboBox ID="EvtSubTest" runat="server" LookupCode="Specimen_EventSubTest" 
                                                                Width="55" ShowLabel="False" Table="SpecimenEvents" Field="EventSubType" TabIndex="9" 
                                                                Enabled="true" Required="true" DropDownWidth="auto" DropDownHeight="auto" 
                                                                CascadeValuesBasedOn="EventAnalyte" CascadeFormatString="Specimen_EventAnalyte">
                                                            </cc:CaisisComboBox>
                                                        </td>
                                                        <td style="font-size:smaller;">
                                                            <cc:CaisisTextArea ID="EvtResult" runat="server"  
                                                                Width="60" ShowLabel="False" Table="SpecimenEvents" Field="EventResult" 
                                                                Enabled="true" TabIndex="10" DropDownWidth="100px" DropDownHeight="130px" >
                                                            </cc:CaisisTextArea>
                                                        </td>
                                                        <td style="font-size:smaller;">
                                                            <cc:CaisisTextArea   ID="EvntNotes" runat="server" Enabled="true" Table="SpecimenEvents"
                                                                Field="EventNotes" ShowLabel="false" Width="55" Height="15" TabIndex="11" 
                                                                MaxLength="4000">
                                                            </cc:CaisisTextArea>
                                                        </td>
                                                        <td style="font-size:smaller;" visible="false">
                                                        </td>
                                                        <td style="font-size:smaller; width:65px">
                                                            <asp:ImageButton ID="EvtAdd" runat="server" ImageUrl="../../Images/add.gif" AlternateText="Add Specimen Events"
                                                                Style="vertical-align: top;" CommandName="Update" TabIndex="12" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:TemplateField ControlStyle-Font-Size="Smaller" ItemStyle-Width="20px" >
                                                    <ItemTemplate>
                                                        <cc:CaisisHidden runat="server" Field="SpecimenEventId"></cc:CaisisHidden>
                                                        <cc:CaisisCheckBox ID="EvtChkBox1" Enabled="true" Table="SpecimenEvents" runat="server"
                                                            Field="EventPending" ShowLabel="false" Width="30"></cc:CaisisCheckBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <cc:CaisisCheckBox ID="EvtChkBox2" runat="server" ShowLabel="false" Table="SpecimenEvents"
                                                            Field="EventPending" Width="30"></cc:CaisisCheckBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ControlStyle-Font-Size="Smaller" ItemStyle-Width="85px" >
                                                    <ItemTemplate>
                                                        <cc:CaisisTextBox ID="EvtDtTxtBox1" Table="SpecimenEvents" runat="server" Enabled="true"
                                                            Field="EventDateText" ShowLabel="false" ShowCalendar="true" Width="60">
                                                        </cc:CaisisTextBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <cc:CaisisTextBox ID="EvtDtTxtBox2" Table="SpecimenEvents" Field="EventDateText"
                                                            runat="server" ShowLabel="False" ShowCalendar="true" Width="60">
                                                        </cc:CaisisTextBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                
                                                <asp:TemplateField ControlStyle-Font-Size="Smaller"  ItemStyle-Width="85px" >
                                                    <ItemTemplate>
                                                        <cc:CaisisTextBox ID="ResultsRecDtTxtBox1" Table="SpecimenEvents" runat="server" Enabled="true"
                                                            Field="ResultsReceivedDateText" ShowLabel="false" ShowCalendar="true" Width="60">
                                                        </cc:CaisisTextBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <cc:CaisisTextBox ID="ResultsRecDtTxtBox2" Table="SpecimenEvents" Field="ResultsReceivedDateText"
                                                            runat="server" ShowLabel="False" ShowCalendar="true" Width="60">
                                                        </cc:CaisisTextBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                
                                                <asp:TemplateField ControlStyle-Font-Size="Smaller"  ItemStyle-Width="30px" >
                                                    <ItemTemplate>
                                                        <cc:CaisisTextBox ID="EvtQtyUsed1" Enabled="false" Table="SpecimenEvents" runat="server"
                                                            Field="QuantityUsed" ShowLabel="false" Width="30">
                                                        </cc:CaisisTextBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <cc:CaisisTextBox ID="EvtQtyUsed2" runat="server" ShowLabel="false" Table="SpecimenEvents"
                                                            Field="QuantityUsed" Width="30">
                                                        </cc:CaisisTextBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ControlStyle-Font-Size="Smaller"  ItemStyle-Width="30px" >
                                                    <ItemTemplate>
                                                        <cc:CaisisSelect ID="EvtQtyUnits1" Enabled="false" Table="SpecimenEvents" runat="server"
                                                            Field="QuantityUnits" ShowLabel="false" Width="40" LookupCode="Specimen_Units">
                                                        </cc:CaisisSelect>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <cc:CaisisSelect ID="EvtQtyUnits1" runat="server" ShowLabel="false" Table="SpecimenEvents"
                                                            Field="QuantityUnits" Width="40" LookupCode="Specimen_Units">
                                                        </cc:CaisisSelect>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField ItemStyle-Width="60">
                                                    <ItemTemplate>
                                                        <cc:CaisisTextBox ID="EvtTimeTxtBox1" runat="server" Width="50" ShowLabel="False"
                                                            Table="SpecimenEvents" Field="EventTime" Enabled="false">
                                                        </cc:CaisisTextBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <cc:CaisisTextBox ID="EvtTimeTxtBox2" runat="server" Width="50" ShowLabel="False"
                                                            Table="SpecimenEvents" Field="EventTime">
                                                        </cc:CaisisTextBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>--%>
                                                <asp:TemplateField ControlStyle-Font-Size="Smaller"  ItemStyle-Width="85px" >
                                                    <ItemTemplate>
                                                        <cc:CaisisComboBox ID="ProcessedBy1" runat="server" Width="60" ShowLabel="False" 
                                                            Table="SpecimenEvents" Field="ProcessedBy" Enabled="false" 
                                                            LookupCode="Specimen_EventProcessedBy" DropDownWidth="auto" DropDownHeight="60px">
                                                        </cc:CaisisComboBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <cc:CaisisComboBox ID="ProcessedBy2" runat="server" Width="60" ShowLabel="False" 
                                                            Table="SpecimenEvents" Field="ProcessedBy" LookupCode="Specimen_EventProcessedBy" 
                                                            DropDownWidth="auto" DropDownHeight="60px">
                                                        </cc:CaisisComboBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisComboBox ID="EvtTest1" runat="server" LookupCode="Specimen_EventTest" Width="55"
                                                            ShowLabel="False" Table="SpecimenEvents" Field="EventType" Required="true" 
                                                            Enabled="false" DropDownHeight="auto" DropDownWidth="90px">
                                                        </cc:CaisisComboBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <cc:CaisisComboBox ID="EvtTest2" runat="server" LookupCode="Specimen_EventTest" Width="55"
                                                            ShowLabel="False" Table="SpecimenEvents" Field="EventType" DropDownHeight="auto" 
                                                            DropDownWidth="90px">
                                                        </cc:CaisisComboBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisComboBox ID="EvtAnalyte1" runat="server" LookupCode="Specimen_EventAnalyte" 
                                                            Width="45" ShowLabel="False" Table="SpecimenEvents" Field="EventAnalyte" Required="true" 
                                                            Enabled="false" DropDownHeight="auto" DropDownWidth="110px" 
                                                            CascadeValuesBasedOn="EventType" CascadeFormatString="Specimen_EventTest">
                                                        </cc:CaisisComboBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <cc:CaisisComboBox ID="EvtAnalyte2" runat="server" LookupCode="Specimen_EventAnalyte" 
                                                            Width="45" ShowLabel="False" Table="SpecimenEvents" Field="EventAnalyte" 
                                                            DropDownHeight="auto" DropDownWidth="110px" CascadeValuesBasedOn="EventType" 
                                                            CascadeFormatString="Specimen_EventTest">
                                                        </cc:CaisisComboBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisComboBox ID="EvtSubTest1" runat="server" LookupCode="Specimen_EventSubTest" 
                                                            Width="55" ShowLabel="False" Table="SpecimenEvents" Field="EventSubType" Enabled="false" 
                                                            DropDownWidth="auto" DropDownHeight="auto" CascadeValuesBasedOn="EventAnalyte" 
                                                            CascadeFormatString="Specimen_EventAnalyte" >
                                                        </cc:CaisisComboBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <cc:CaisisComboBox ID="EvtSubTest2" runat="server" LookupCode="Specimen_EventSubTest" 
                                                            Width="55" ShowLabel="False" Table="SpecimenEvents" Field="EventSubType" 
                                                            DropDownWidth="auto" DropDownHeight="auto" CascadeValuesBasedOn="EventAnalyte" 
                                                            CascadeFormatString="Specimen_EventAnalyte">
                                                        </cc:CaisisComboBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisTextArea ID="EvtResult1" runat="server" 
                                                            Width="55" ShowLabel="False" Table="SpecimenEvents" Field="EventResult" Enabled="false"
                                                            DropDownWidth="110px" DropDownHeight="60px" >
                                                        </cc:CaisisTextArea>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <cc:CaisisTextArea ID="EvtResult2" runat="server" 
                                                            Width="55" ShowLabel="False" Table="SpecimenEvents" Field="EventResult" 
                                                            DropDownWidth="110px" DropDownHeight="60px" >
                                                        </cc:CaisisTextArea>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisTextArea ID="EvntNotes1" runat="server" Enabled="false" Table="SpecimenEvents"
                                                            Field="EventNotes" ShowLabel="false" Width="55" Height="15" MaxLength="4000">
                                                        </cc:CaisisTextArea>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <cc:CaisisTextArea ID="EvntNotes2" runat="server" Table="SpecimenEvents" Field="EventNotes"
                                                            ShowLabel="false" Width="55" Height="15" MaxLength="4000">
                                                        </cc:CaisisTextArea>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ControlStyle-Font-Size="Smaller" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Button ID="EvtURL1" runat="server" Text="View" Enabled="false" Width="45" style="visibility: hidden;"  />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ControlStyle-Font-Size="Smaller" ItemStyle-Width="65px">
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" ID="EditImage" AlternateText="Edit Event" ImageUrl="~/Images/iconEdit.gif" />
                                                        <asp:ImageButton AlternateText="Save Changes" runat="server" ImageUrl="~/Images/iconSave_Off.gif"
                                                            ID="SaveRowBtn" Enabled="false" Style="vertical-align: top; cursor: default;"
                                                            CommandName="Update" />
                                                        <asp:ImageButton AlternateText="Delete Event" runat="server" ImageUrl="~/Images/iconDelete_Off.gif"
                                                            ID="DeleteBtn" Enabled="false" Style="vertical-align: top; cursor: default;"
                                                            CommandName="Delete" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:ImageButton ID="EvntAdd1" runat="server" ImageUrl="../../Images/add.gif" AlternateText="Add Specimen Events"
                                                            Style="vertical-align: top;" CommandName="Update" />
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </td>
                            </tr>
                        </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>