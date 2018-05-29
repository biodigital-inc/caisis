<%@ Page EnableViewState="true" Language="c#" CodeFile="SpecimenAccessions.aspx.cs" AutoEventWireup="true"
    Inherits="Caisis.UI.Modules.SpecimenMgmt.SpecimenAccessions" %>
<%@ Register TagPrefix="cc" TagName="LocationControl" Src="~/Plugins/SpecimenLocation/SpecimenLocationControl.ascx" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="grid" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Specimen Accessions Info</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        
        //function to stop deletion of Specimens with children in the grid
        function onRowDelete(row)
        {
            var mySpecId = row.Keys['SpecimenId'];
            if(mySpecId!=null && window.SpecimensWithChildren != null && SpecimensWithChildren.length > 0)
            {
                for(var i=0;i<SpecimensWithChildren.length;i++)
                {
                    var specWithChild = SpecimensWithChildren[i];
                    if(specWithChild==mySpecId)
                    {
                        alert('This Specimen cannot be deleted, unless all Child Specimens are deleted.');
                        // Return false to signal the record to not delete
                        return false;
                    }
                }
            }
            // Otherwise ask user if they want to delete
            return confirmDelete();
        }
    
        function refreshParentwindow()
        { 
            var browser=navigator.appName;
            if(browser=="Microsoft Internet Explorer")
            {
                parent.window.location.reload();
            }
            else if(browser=="Netscape")
            {
                parent.document.getElementById('SpecimensRptFrame').contentDocument.location.reload(true);
            }
        }
        
        function refreshParent(ptId, saId)
        {  
            var url='AccessionsContainer.aspx?patientId=' + ptId + '&specimenaccessionId=' + saId;
            window.parent.location.href =url; 
        } 
        
        function NewAccessionRecord(paId)
        { 
            var url='AccessionsContainer.aspx?patientId=' + paId + '&specimenaccessionId=0';
            window.parent.location.href =url;
        }         
        
        function disIsDirty(){}        
        
        function updateDate()
        {
            $('<%=AccCollectionDate.ClientID %>').value=$('<%=AccCollectionDateText.ClientID %>').value
        }
        
        function showNextGridRow()
        {
            var grid = $('<%= specimensGrid.ClientID %>');
            for(var i=0;i<grid.rows.length;i++)
            {
                var row = grid.rows[i];
                if(row.className == 'blankRow')
                {
                    row.className = 'blankRowVisible';
                    return;
                }
            }
            alert('Please save the form before adding more rows.');
        }
        
        var frameExpand = false;
        var ExpandWidth = 950;
        var CollapseWidth = 650;
        // Expands/Collapses content to page
        function showHideFrame()
        {
            var btn = $('ShowHideFrameBtn');
            var dataFrame = parent.document.getElementById('AccessionsDataFrame');
            var rptFrame=parent.document.getElementById('AccessionsRptFrame');

            btn.src = frameExpand ? '../../Images/buttonExpand.gif' : '../../Images/buttonReturn.gif';
            btn.alt = frameExpand ? 'Expand' : 'Return';
     
            frameExpand = !frameExpand;
            dataFrame.style.width = (frameExpand ? ExpandWidth : CollapseWidth) + 'px';
            rptFrame.style.display = frameExpand ? 'none' : 'block';
        }
        
        if(window.disIsDirty) { window.disIsDirty(); }
        
        //Event.Register('load',window,setQueryPageBoxAndPosition,false);
    </script>
    
    <!-- Controls the Styles defining box colors in popup layer -->
    <style type="text/css">
    .CurrentPosition {  background-color: #8d2a2c;  color: #ffffff; font-weight: bold; }
    .FilledPosition { background-color: #999999; cursor: default;  border: solid 2px #999999; border-collapse: separate;  color: #000000;}
    .UnavailablePosition { background-color: #666666; cursor: text;  }
    .AvailablePosition { background-color: #e4e4e4; border: solid 2px #e4e4e4; border-collapse: separate; }
    .AvailablePositionHover { background-color: #e4e4e4; border: solid 2px #8d2a2c; border-collapse: separate; color: #8d2a2c;}
    .ActivePosition { background-color: #0066cc; }
    .BoxMatrix { border: 1px solid #666666; }    
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
            text-align:right; font-size:10px; vertical-align:center; color:#000000;font-family:Verdana, Arial, Helvetica, sans-serif;
        }
        td.left
        {
            width: 50%; text-align:left; padding-top:3px; vertical-align:top;
        }
        td.right
        {
            width: 50%; text-align:left; padding-top:3px; vertical-align:top;
        }
        tr.dataGridHeader
        {
            background-color: #00668d;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 10px;
            font-weight: 300;
            color: #ffffff;
            text-align: center;
            text-decoration: none;
            border: none;
        }
        .dataGridHeaderRequired
        {
            background-color: #00668d;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 10px;
            color: #8d2a2c; /*	color: #E09499; */
            text-align: center;
        }
        .blankRowVisible
        {
            display: block;
            background-color: #F1F7FC;
        }
        .blankRow
        {
            background-color: #999999;
            display: none;
        }
    </style>
</head>
<body style="margin: 0px; width: 100%; background-color: #f8fafc;" >
    <form id="dataForm" method="post" runat="server" defaultfocus="AccCollectionDateText">    
    <asp:HiddenField ID="isGridVisible" runat="server" />
        <table cellpadding="0" cellspacing="0" style="table-layout: fixed; margin: auto; border: 0px solid #999999;">
            <tr>
                <td class="left"><asp:Label ID="AccessionTitle" runat="server" CssClass="ListManTitle"></asp:Label></td>
            </tr>
        </table>
        <div id="AccessionDiv" runat="server" style=" height:350px; overflow:auto; border:1px solid #999999; position:relative;">        
         <table cellpadding="0" cellspacing="0" style="width: 90%; table-layout: fixed; margin: auto; border: 0px solid #999999;">
            <tr id="ReqFieldMsg" align="center">
                <td colspan="2"><asp:RequiredFieldValidator ID="ColDateRfv" ControlToValidate="AccCollectionDateText" runat="server" ErrorMessage="Enter Collection Date!" />
                </td>
            </tr>
            <!-- Accession Info Input Controls -->
            <tr runat="server" id="inputControlsRow">
                <%--Left Accession Info Input Controls --%>
                <td class="left">
                <table id="leftctrlstbl" >
                        <tr>
                            <td class="leftL" style="color: #8d2a2c; font-weight:bold;" title="Date on which specimens were received" >
                                Collection Date 
                            </td>
                            <td>
                                <cc:CaisisTextBox FieldLabel="Collection Date" runat="server" ID="AccCollectionDateText" Table="SpecimenAccessions" 
                                    Field="AccessionDateText" TabIndex="1" MaxLength="20" ShowLabel="false" ShowCalendar="true" CalcDate="true" 
                                    onblur="updateDate();" Width="110px" Required="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td align="left"><cc:CaisisTextBox ID="AccCollectionDate" runat="server" Width="64px" Table="SpecimenAccessions" 
                                    Field="AccessionDate" ShowLabel="False" MaxLength="10" style="border:none;  background-color:Transparent;"/></td>
                        </tr>
                        <tr>
                            <td class="leftL" title="Time of day at which specimens were received">Collection Time</td>
                            <td align="left" >
                                <cc:CaisisTextBox FieldLabel="Collection Time" runat="server" ID="AccCollectionTime" Table="SpecimenAccessions" 
                                    Field="AccessionTime" MaxLength="10" ShowLabel="false" TabIndex="2" ShowNumberPad="true" Width="110px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="leftL" title="Condition in which specimen was received" >Received Condition</td>
                            <td >
                             <cc:CaisisSelect FieldLabel="Received Condition" runat="server" ID="AccHoldingCondition" Table="SpecimenAccessions" 
                                Field="HoldingCondition" TabIndex="3" ShowLabel="False" LookupCode="Specimen_HoldingCondition"/>
                             </td>
                        </tr>
                        <tr>
                           <td class="leftL" title="Number of EDTA tubes used to store blood samples"># EDTA Tubes</td>
                            <td>
                                <cc:CaisisTextBox ID="AccEDTATubes" runat="server" FieldLabel="# EDTA Tubes" ShowLabel="False" TabIndex="4"  
                                    Table="SpecimenAccessions" Field="NumberTubesEDTA" ShowNumberPad="true" MaxLength="10" Width="110px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="leftL" title="Date on which specimens were banked">Date Frozen</td>
                            <td>
                                <cc:CaisisTextBox FieldLabel="Date Frozen " runat="server" ID="AccDateFrozen" Table="SpecimenAccessions" 
                                    Field="DateBanked" TabIndex="5" ShowLabel="False" ShowCalendar="true" Width="110px" />             
                            </td>
                        </tr>
                        <tr>
                            <td class="leftL" title="Time of day at which specimens were banked">Time Frozen</td>
                            <td>
                                <cc:CaisisTextBox FieldLabel="Time Frozen " runat="server" ID="AccTimeFrozen" Table="SpecimenAccessions" 
                                    Field="TimeFrozen" TabIndex="6" ShowLabel="False" MaxLength="10" ShowNumberPad="true" Width="110px" />
                             </td>
                        </tr>
                        <tr>
                            <td class="leftL" title="Accession Number or other pathology reference number">Path Ref #</td>
                            <td>
                                <cc:CaisisTextBox FieldLabel="Path Reference # " runat="server" ID="AccPathReference" Table="SpecimenAccessions" 
                                    Field="PathologyReferenceNumber" TabIndex="7" ShowLabel="False" MaxLength="50" Width="110px" />
                             </td>
                        </tr>                        
                    </table>
                </td>
                <%--Right Accession Info Input Controls --%>
                <td class="right">
                    <table id="rightctrlstbl">
                        <tr>
                            <td class="leftL" title="Institution by which accession is carried out">Institution</td>
                            <td>
                                <cc:CaisisComboBox FieldLabel="Institution" runat="server" ID="AccInstitution" Table="SpecimenAccessions" 
                                    Field="AccessionInstitution" TabIndex="8" ShowLabel="False" MaxLength="50" LookupCode="Institution" Width="110"/>
                             </td>
                        </tr>                          
                        <tr>
                            <td class="leftL" title="Department by which accession is carried out">Department</td>
                            <td>
                                <cc:CaisisComboBox FieldLabel="Department " runat="server" ID="AccDepartment" Table="SpecimenAccessions" 
                                    Field="AccessionDepartment" TabIndex="9" ShowLabel="False" MaxLength="50" LookupCode="Specimen_Department"
                                     Width="110px" />
                             </td>
                        </tr>
                        <tr>
                            <td class="leftL" title="Procedure method by which specimen is collected">Method of Collection</td>
                            <td>
                                <cc:CaisisComboBox FieldLabel="Method of Collection " runat="server" ID="AccMethodCollection" 
                                Table="SpecimenAccessions" Field="AccessionProcName" TabIndex="10" ShowLabel="False" MaxLength="50" 
                                LookupCode="Specimen_AccessionProcName" Width="110px" />
                             </td>
                        </tr>
                        <tr>
                            <td class="leftL">Pathology Lab</td>
                            <td>
                                <cc:CaisisComboBox FieldLabel="Pathology Lab " runat="server" ID="AccPathologyLab" 
                                Table="SpecimenAccessions" Field="PathologyLab" TabIndex="11" ShowLabel="False" MaxLength="50" 
                                LookupCode="Specimen_PathologyLab" Width="110px" />
                             </td>
                        </tr>
                        <tr>
                            <td class="leftL">Time Received in Lab</td>
                            <td>
                                <cc:CaisisTextBox FieldLabel="Time Received in Lab " runat="server" ID="AccTimeReceivedInLab" 
                                Table="SpecimenAccessions" Field="TimeReceivedInLab" TabIndex="12" ShowLabel="False" MaxLength="10" 
                                ShowNumberPad="true" Width="110px" />
                             </td>
                        </tr>
                        <tr>
                            <td class="leftL">Notes</td> 
                            <td>
                                <cc:CaisisTextArea FieldLabel="Notes " runat="server" ID="AccNotes" TabIndex="13" Table="SpecimenAccessions" 
                                    Field="AccessionNotes" ShowLabel="False" MaxLength="1000" Height="55" Width="110px" />
                            </td>
                        </tr>
                        </table>
                </td>
              </tr>
            </table>
            
            <table width="100%" style="text-align: center;">
                <!-- Specimens Grid -->
                <tr>
                    <td colspan="2">
                        <div id="gridViewDiv" style=" text-align: center; margin: 0px auto; width: 100%;" runat="server">
                            <table id="SpecimensGridViewTable" width="925px" border="0" cellpadding="0" cellspacing="0" runat="server">
                                <tr>
                                    <td class="left"><asp:Label ID="totalSubSpecimens" runat="server" CssClass="ListManTitle" Text="Specimens" /></td>
                                </tr>
                                <tr>
                                <td colspan="12" style="text-align:left; position:relative;">
                                        <!-- Specimens GridView -->
                                        <grid:ExtendedGridView TableName="Specimens" BlankRows="10" BlankRowCssClass="blankRow" VisibleBlankRows="3" 
                                            VisibleBlankRowCssClass="blankRowVisible" DataKeyNames="SpecimenId" ID="specimensGrid" 
                                            runat="server" Width="925px" Visible="true" AutoGenerateColumns="false" ShowFooter="false" 
                                            ShowHeader="true" HeaderStyle-CssClass="dataGridHeader" OnRowDeleted="HandleRowDelete" 
                                            OnRowDataBound="SetFieldValues" BackColor="White" RowStyle-CssClass="dataGridItemA" 
                                            AlternatingRowStyle-CssClass="dataGridItemB" CellPadding="4" CellSpacing="0" BorderStyle="Solid" 
                                            BorderWidth="1px" BorderColor="#999999" CssClass="dataGrid">
                                            <Columns>
                                                <grid:ExtendedTemplateField HeaderText="Ref #" HeaderStyle-CssClass="dataGridHeaderRequired" 
                                                    ItemStyle-VerticalAlign="Top" ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisTextBox ID="SpecRef" Enabled="true" Table="Specimens" runat="server"
                                                                Field="SpecimenReferenceNumber" ShowLabel="false" Width="75" TabIndex="14" 
                                                                MaxLength="50" />
                                                    </ItemTemplate>
                                                </grid:ExtendedTemplateField>
                                                <grid:ExtendedTemplateField HeaderText="Box:Position" ControlStyle-Font-Size="Smaller" ItemStyle-Wrap="false">
                                                    <ItemTemplate>
                                                        <%--<img alt="SpecimenPickerImg" id="SpecimenPickerImg" runat="server" 
                                                            src="~/Images/icon_SpecimenAccessions.png" />--%> 
                                                           <cc:LocationControl ID="LocationControl" runat="server" Visible="true"/>
                                                           <cc:CaisisTextBox Enabled="true" FieldLabel="Site" runat="server" ID="SiteName" 
                                                                MaxLength="50" Width="1px" Visible="false" ShowLabel="False" Table="SpecimenSites" 
                                                                Field="SiteName" />
                                                           <cc:CaisisTextBox FieldLabel="Storage/Rack" Enabled="true" runat="server" 
                                                                ID="StorageName" MaxLength="50" Width="1px" Visible="false" ShowLabel="False" 
                                                                Table="SpecimenStorages"  Field="StorageName"/>
                                                           <cc:CaisisTextBox FieldLabel="Container/Bin" Enabled="true" runat="server" 
                                                                ID="ContainerName" MaxLength="50" Width="1px" Visible="false" ShowLabel="False" 
                                                                Table="SpecimenContainers"  Field="ContainerName"/> 
                                                                
                                                           <cc:CaisisTextBox ID="SpecBoxName" Enabled="true" runat="server" FieldLabel="Box Name"
                                                              Table="SpecimenBoxes" Field="BoxName"   ShowLabel="false" Width="75" />
                                                            <cc:CaisisTextBox ID="SpecPositionName" Enabled="true" runat="server" 
                                                              Table="SpecimenPositions" Field="Position" FieldLabel="Position Name" ShowLabel="false" 
                                                              Width="35" />
                                                            <cc:CaisisHidden FieldLabel="Box Id" Enabled="true" runat="server" ID="BoxId"
                                                                Table="Specimens" Field="BoxId" ShowLabel="False" Width="1px"/>
                                                            <cc:CaisisHidden FieldLabel="Position Id" Enabled="true" runat="server" ID="PositionId"
                                                                Table="Specimens" Field="PositionId" ShowLabel="False" Width="1px"/>
                                                    </ItemTemplate>
                                                </grid:ExtendedTemplateField>
                                                <grid:ExtendedTemplateField HeaderStyle-CssClass="dataGridHeaderRequired" HeaderText="Type" 
                                                    ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisSelect ID="SpecType" runat="server" LookupCode="Specimen_Type" Width="130px"
                                                                ShowLabel="False" Table="Specimens" Field="SpecimenType" Enabled="true" 
                                                                TabIndex="16" />
                                                    </ItemTemplate>
                                                </grid:ExtendedTemplateField>
                                                <grid:ExtendedTemplateField HeaderText="SubType" ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisComboBox ID="SpecSubType" runat="server" LookupCode="Specimen_SubType" 
                                                                CascadeValuesBasedOn="SpecimenType" CascadeFormatString="Specimen_SubType_{0}"
                                                                Width="75px" ShowLabel="False" Table="Specimens" Field="SpecimenSubType" 
                                                                Enabled="true" />
                                                    </ItemTemplate>
                                                </grid:ExtendedTemplateField>
                                                <grid:ExtendedTemplateField HeaderText="Status" ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisSelect ID="SpecStatus" Table="Specimens" runat="server" Enabled="true"
                                                                Field="SpecimenStatus" ShowLabel="false" LookupCode="Specimen_Status" 
                                                                TabIndex="18" DropDownWidth="auto" DropDownHeight="auto" />
                                                    </ItemTemplate>
                                                </grid:ExtendedTemplateField>
                                                <grid:ExtendedTemplateField HeaderText="Contact" ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisSelect ID="SpecContact" FieldLabel="Contact" runat="server" Table="Specimens" 
                                                                Field="ContactId" TabIndex="5" ShowLabel="False" DataTextField="Name" 
                                                                DataValueField="ContactId" Enabled="true" LookupDistinct="Contact;ContactId;COALESCE(LastName,'') + ', ' + COALESCE(FirstName,'');(ContactType='Specimen')" />
                                                    </ItemTemplate>
                                                </grid:ExtendedTemplateField>
                                                <grid:ExtendedTemplateField HeaderText="Org Qty" ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisTextBox ID="SpecOrgQty" Enabled="true" Table="Specimens" runat="server"
                                                                Field="SpecimenOriginalQty" ShowLabel="false" Width="35px"  TabIndex="20" />
                                                    </ItemTemplate>
                                                </grid:ExtendedTemplateField>
                                                <grid:ExtendedTemplateField HeaderText="Units" ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisComboBox ID="SpecUnits" Enabled="true" Table="Specimens" runat="server"
                                                                Field="SpecimenUnits" LookupCode="Specimen_Units" ShowLabel="false" Width="40px" 
                                                                TabIndex="21" />
                                                    </ItemTemplate>
                                                </grid:ExtendedTemplateField>
                                                <grid:ExtendedTemplateField HeaderText="Storage Type" ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisComboBox ID="SpecPreserveType" runat="server" Width="90px" ShowLabel="False" 
                                                                LookupCode="Specimen_PreservationType" Table="Specimens" 
                                                                Field="SpecimenPreservationType" CascadeValuesBasedOn="SpecimenType" 
                                                                CascadeFormatString="Specimen_PreservationType_{0}" Enabled="true"  TabIndex="19" 
                                                                DropDownHeight="auto" DropDownWidth="auto" />
                                                    </ItemTemplate>
                                                </grid:ExtendedTemplateField>
                                                <grid:ExtendedTemplateField HeaderText="Rem Qty" ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisTextBox ID="SpecRemQty" Enabled="true" Table="Specimens" runat="server"
                                                                Field="SpecimenRemainingQty" ShowLabel="false" Width="35px"  TabIndex="20" />
                                                    </ItemTemplate>
                                                </grid:ExtendedTemplateField>
                                                <grid:ExtendedTemplateField HeaderText="Notes" ControlStyle-Font-Size="Smaller">
                                                    <ItemTemplate>
                                                        <cc:CaisisTextBox FieldLabel="Notes " runat="server" ID="SpecNotes" TabIndex="8" Width="100px"
                                                                Table="Specimens" Field="SpecimenNotes" MaxLength="1000" ShowLabel="False" 
                                                                ShowTextEditor="true" />
                                                    </ItemTemplate>
                                                </grid:ExtendedTemplateField>
                                                <%--<grid:ExtendedTemplateField>
                                                    <ItemTemplate>
                                                        <asp:ImageButton AlternateText="Delete Event" runat="server" ImageUrl="~/Images/iconDelete.gif"
                                                            ID="DeleteBtn" Enabled="true" Style="vertical-align: top; cursor: default;"
                                                            CommandName="Delete" OnClientClick="onRowDelete(this);"/>
                                                    </ItemTemplate>
                                                </grid:ExtendedTemplateField>--%>
                                                <grid:GridRowDeleteImage HeaderText="Delete" ControlStyle-Font-Size="Smaller" ItemStyle-Width="40px" 
                                                    Visible="false">
                                                </grid:GridRowDeleteImage>
                                                <grid:GridRowUIHelper>
                                                    <ItemTemplate>
                                                        <asp:HyperLink CssClass="ResetGridRowLink" ImageUrl="~/Images/icon_refresh_small.gif" 
                                                            runat="server" style=" cursor:pointer; visibility:hidden;"></asp:HyperLink>
                                                    </ItemTemplate>
                                                </grid:GridRowUIHelper>
                                            </Columns>
                                        </grid:ExtendedGridView>
                                        <img id="AddRow" alt="AddRow" onclick="showNextGridRow();" src="../../Images/DataGridAddNewRow.gif" style="padding-top:5px;" visible="false" runat="server" />
                                </td>
                            </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>            
       </div>            
            <table width="100%" style="text-align:center;">
                <tr>  
                    <td><div style="text-align:left;">
                                <img id="ShowHideFrameBtn" alt="Expand" src="../../Images/buttonExpand.gif" style="cursor: pointer;" 
                                    onclick="showHideFrame();"/></div>
                    </td>
                    <td>
                        <asp:ImageButton OnCommand="NewAccession" ID="NewBtn" TabIndex="12" Enabled="False" runat="server" ToolTip="New Record" 
                            ImageUrl="../../Images/DataEntryButtons/Button_New_off.gif" Height="22px" Width="61px" CssClass="PDButtonOff"/>   
                        <asp:ImageButton ID="EditBtn" AccessKey="E" Enabled="false" OnCommand="EditAccession" runat="server" Height="22px" 
                            Width="61px" CssClass="PDButtonOff" ImageUrl="../../Images/DataEntryButtons/Button_Edit_Off.gif" 
                            ToolTip="Edit Record" TabIndex="13"  /> 
                        <asp:ImageButton ID="SaveBtn" OnClick="SaveBtn_Click" Enabled="False" runat="server" ToolTip="Save Record" TabIndex="14" 
                            ImageUrl="~/Images/DataEntryButtons/Button_Save_Off.gif" eight="22px" Width="61px" CssClass="PDButtonOff" 
                                OnClientClick="if(validateGrids()) { disIsDirty(); } else { return false; }"/>
                        <asp:ImageButton ID="CancelBtn" OnClientClick="disIsDirty()" OnCommand="CancelSave" Enabled="False" runat="server" 
                            TabIndex="15" ImageUrl="../../Images/DataEntryButtons/Button_Cancel_off.gif" Height="22px" Width="61px" 
                            CssClass="PDButtonOff" /> 
                        <asp:ImageButton ID="DeleteBtn" OnClientClick="disIsDirty(); if(confirmDelete()==false)return false;" OnCommand="AccessionDelete" Enabled="False" runat="server" Height="22px" Width="61px" 
                            CssClass="PDButtonOff" ImageUrl="../../Images/DataEntryButtons/Button_Delete_off.gif" 
                            ToolTip="Delete Record" TabIndex="16"/>
                    </td>
                </tr>
                <!-- DATA ENTRY AUDIT LABELS -->
                <tr>
                    <td colspan="2">
                        <div id="AuditLabels" class="smallPrint">
                            <div id="AuditLabelsLeft">
                                <span class="AuditLabel">Entered By:&nbsp;</span> 
                                <span class="AuditLabel">Updated By:&nbsp;</span>
                                <span class="AuditLabel">Locked By:&nbsp;</span>
                            </div>
                            <div id="AuditLabelsRight">
                                <div>
                                    <asp:Label ID="EnteredBy" runat="server" /><asp:Label ID="EnteredTime" runat="server" /></div>
                                <div>
                                    <asp:Label ID="UpdatedBy" runat="server" /><asp:Label ID="UpdatedTime" runat="server" /> <asp:HyperLink ID="AuditLink" runat="server" Visible="false"><img src="../../Images/ViewAuditLogIcon.gif" title="View Previous Changes To This Record" border="0" style="margin-left: 3px;" /></asp:HyperLink></div>
                                <div>
                                    <asp:Label ID="LockedBy" runat="server" /><asp:Label ID="LockedTime" runat="server" /></div>
                            </div>
                        </div> 
                    </td>
                </tr>
            </table>
           <%--<cc:LocationControl ID="LocationControl1" runat="server" DynamicRender="true" />--%> 
    </form>
</body>
</html>