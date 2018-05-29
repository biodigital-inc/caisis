<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientVisit.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientVisit" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="unp" TagName="AddUnplannedEvent" Src="AddUnplannedEvent.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PatientVisit</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        var readonlyDates = ['<%= string.Join("', '", ReadOnlyDates.ToArray()) %>'];

        // sets text fields to readonly=true||false, true to prevent editing by user, false to trigger server events on postback
        function enableDisableDateFields(isReadOnly) {
            for (var i = 0; i < readonlyDates.length; i++) {
                var field = $(readonlyDates[i]);
                if (field) {
                    field.readOnly = isReadOnly;
                }
            }
            return true;
        }

        function onWindowResize() {
            var overflowContainer = $('OverflowContainer');
            if (overflowContainer) {
                overflowContainer.style.height = getHeight(window) - 175 + 'px';
            }
        }

        // shows the layer to set the status for an Item
        function showChangeStatus(index, statusField) {
            var layer = $(index + '_selectorLayer');
            var statusIMG = $(index + '_StatusImage');
            layer.style.display = 'block';
            layer.style.left = statusIMG.offsetLeft + 'px';
        }

        // hides the popup layer to choose status for Item
        function hideChangeStatus(index, e) {
            var layer = $(index + '_selectorLayer');
            if (e == null || isMouseLeave(layer, e)) {
                layer.style.display = 'none';
            }
        }

        // sets the status for an Item
        function setStatus(index, status) {
            // update hidden status field
            var layer = $(index + '_selectorLayer');
            var fields = layer.parentNode.getElementsByTagName('INPUT');
            var statusField;
            for (var i = 0; i < fields.length; i++) {
                var field = fields[i];
                if (field.type == 'hidden' && field.id.indexOf('Status') > -1) {
                    statusField = field;
                    break;
                }
            }
            statusField.value = status;
            // update image to reflect new status
            var statusIMG = $(index + '_StatusImage');
            var statusSRC = 'Images/ItemStatusSelector_' + status.replace(' ','') + '.png';
            statusIMG.src = statusSRC;
            statusIMG.alt = 'Item Status: ' + status;
            // update for on label
            var label = $('ScheduledDateLabel_' + index);
            label.innerHTML = status == 'Performed' || status == 'Refused' ? 'on' : 'for';
            // hide choose status layer
            hideChangeStatus(index);

            return false;
        }

        function showShift() {
            var layer = $('ShiftLayer');
            layer.show('');
            layer.center();
        }

        function hideShift() {
            $('ShiftLayer').hide('none');
        }

        // validate shift parameters
        function validateShift() {
            var date = $('ShiftDate').value;
            var shift = $('ShiftNumOfDays').value;
            var valid = shift != '' && parseInt(shift).toString() != 'NaN' && date != '';
            if (!valid) {
                alert('Please verify fields before shifting schedule.');
                $('ShiftDate').focus();
            }
            return valid;
        }

        function setVisitsMissing() {
            if(confirm('Are you sure you want to mark all visits as Missed?'))
            {
                for (var i = 0; i < <%= PatientVisitsGrid.Rows.Count %>; i++) {
                    setStatus(i, 'Missed');
                }
            }
            else
            {
                $('AddDeviationCheckBox').checked = false;
            }
        }
        
        function loadPatientItem(patientItemId)
        {
            var url = '<%= GetQueryString("PatientVisitDataEntryContainer.aspx") %>' + '&patientSchemaId=' + '<%= PatientSchemaId %>' + '&visit='+ '<%= SelectedTimelineId %>' + '&patientItemId=' + patientItemId;
            // load data entry into parent page
            window.parent.location = url;
            return false;
        }
        
        function loadPatientDeviation(patientItemId, deviationTable, deviationKey)
        {
            // attempt to load deviation data entry
            var dataEntryLoaded = loadUnplannedVisistItem(patientItemId, deviationTable, deviationKey);
            // if data entry layer not loaded, load into generic item entry
            if(!dataEntryLoaded){
                loadPatientItem(patientItemId);
            }
            return false;
        }

        function reloadPage() {
            reloadMainLists();
            window.location = window.location;
        }
        
        // reload main patients' list and calendar
        function reloadMainLists()
        {
            if(window.parent.parent.reloadListAndCalendar) {
                window.parent.parent.reloadListAndCalendar();
            }
        }
               
        // fix for calendar position, override position method
        function getLeftPos(obj) {
            // signals if to account for table nesting
            var ignore = true;
            var endloop = false, tablePos = 0, tableCount = 0, pos = 0;
            if(obj.offsetParent)
            {
                pos  = obj.offsetLeft;
                while( (obj = obj.offsetParent) && !endloop )
                {
                    if(obj.nodeName == "BODY") { endloop = true; break; }
                    pos+= obj.offsetLeft;
                }
            }
            return pos;
        }

        $(window).addEvent('load', curry(enableDisableDateFields, true));

        /* ]]> */
    </script>

    <style type="text/css">
        html
        {
            height: 100%;
        }
        body
        {
            min-height: 100%;
            padding: 0px;
            margin: 0px;
            background-color: #ffffff;
        }
        a
        {
            text-decoration: none;
            color: #000000;
        }
        #PatientVisitsGrid
        {
            width: 98%;
            margin: auto;
        }
        #SelectVisitText
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #111111;
            font-size: 15px;
            font-weight: bold;
        }
        .warningText
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #8d2a2c;
            font-size: 12px;
            font-weight: normal;
        }
        .checkedRow
        {
            background-image: url(Images/CheckMark.png);
            background-repeat: no-repeat;
            background-position: 12px 12px;
            padding-left: 38px;
        }
        .uncheckedRow
        {
            padding-left: 38px;
        }
        .ScheduledDateInputA
        {
            border-style: none;
            background-color: #e0ebf1;
            font-weight: bold;
            cursor: pointer;
            font-size: 9px;
            width: 70px;
        }
        .ScheduledDateInputB
        {
            border-style: none;
            background-color: #f8fafc;
            font-weight: bold;
            cursor: pointer;
            font-size: 9px;
            width: 70px;
        }
        .dateSelector
        {
            background-image: url(images/ItemDateSelectorBG.png);
            background-repeat: no-repeat;
            width: 119px;
            height: 26px;
            vertical-align: middle;
            cursor: pointer;
        }
        .itemListHeader
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            font-size: 12px;
            font-weight: bold;
            text-align: center;
        }
        .DataEntered
        {
            color: #386b3a;
        }
        .DataNotDone
        {
            color: #999999;
        }
        #ShiftBtn
        {
            margin-left: 40px;
            float: left;
        }
        #SaveBtn
        {
            float: right;
            margin-right: 40px;
        }
        .HiddenText
        {
            width: 1px;
            height: 1px;
            position: absolute;
            z-index: -1;
        }
        #ShiftLayer
        {
            width: 550px;
            position: absolute;
            z-index: 10001;
        }
        #ShiftLayer table
        {
            border: 1px solid #cccccc;         
        }
        #ShiftLayer table td
        {
            color: #111111;
            font-size: 11px;
            font-weight: bold;
        }
        .patientItemName
        {
            display: block;
            padding: 6px 0px 6px 15px;
            border: solid 1px transparent;
        }
        .patientItemName:hover
        {
            display: block;
            padding: 6px 0px 6px 15px;
            background-color: #EAF1F5;
            background-image: url(images/EnterDataHighlight.gif);
            background-position: right top;
            background-repeat: no-repeat;
            color: #8d2a2c;
            border: solid 1px #D1D7DA;
        }
    </style>
</head>
<body style="height: 100%;">
    <form id="form1" runat="server">
    <div id="ShiftLayer" style="display: none;">
        <table cellpadding="10" cellspacing="0" style=" background-color: #ffffff;">
            <tr>
                <td>
                    <label for="ShiftNumOfDays">
                        Number of days to shift patient's schedule
                    </label>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="ShiftNumOfDays" ShowLabel="false"></cic:CaisisTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="ShiftDate">
                        Shift all visits for this patient after the following date
                    </label>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="ShiftDate" ShowLabel="false" ShowCalendar="true"></cic:CaisisTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <img src="Images/Button_Cancel.png" alt="Cancel" onclick="hideShift();" style="cursor: pointer;
                        float: right;" />
                </td>
                <td>
                    <asp:ImageButton runat="server" ID="ShiftBtn" ImageUrl="Images/Button_ShiftPatientSchedule_red.png"
                        OnClick="ShiftPatientSchedule" OnClientClick="return validateShift();" AlternateText="Shift Patient Schedule"
                        Width="135" Height="25" Style="margin-right: 30px;" />
                </td>
            </tr>
        </table>
    </div>
    <table border="0" cellspacing="0" cellpadding="0" style="width: 90%; margin-left: auto;
        margin-right: auto;">
        <tr>
            <td style="padding-top: 20px; padding-bottom: 22px; width: auto;">
                <label id="SelectVisitText" for="VisitsDropDown">
                    Items planned for
                </label>
                <cic:CaisisSelect runat="server" ID="VisitsDropDown" ShowLabel="false" OnSelectedIndexChanged="SetVisit"
                    DataTextField="VisitLabel" DataValueField="TimelineId" AutoPostBack="true" Style="width: auto; min-width: 150px;
                    margin-left: 8px; margin-right: 35px; color: #111111; font-size: 12px; font-weight: bold;">
                </cic:CaisisSelect>
                <label for="AddDeviationCheckBox" title="Missed Visit" style="font-weight: bold;">
                    <input type="checkbox" id="AddDeviationCheckBox" title="Missed Visit" onclick="if(this.checked) { setVisitsMissing(); }" />Patient
                    Missed This Visit</label>
            </td>
            <td style="font-size: 13px; color: #666666; text-align: right; padding-right: 10px;">
                <%-- Click a protocol item to enter/view data.--%>&nbsp;
            </td>
            <td style="width: 155px;">
                <unp:AddUnplannedEvent runat="server" ID="AddUnplannedEvent" />
            </td>
        </tr>
    </table>
    <asp:Panel runat="server" ID="DataEntryPanel">
        
        <table width="90%" border="0" cellspacing="0" cellpadding="0" style="margin-left: auto;
            margin-right: auto;">
            <tr>
                <td>
                    <table border="0" cellpadding="0" style="width: 100%;">
                        <tr>
                            <td class="itemListHeader" style="width: 25%;">
                                Protocol Item
                            </td>
                            <td class="itemListHeader" style="width: 30%;">
                                Item Status
                            </td>
                            <td class="itemListHeader" style="width: 20%; text-align: center;">
                                Anticipated Visit Range
                            </td>
                            <td class="itemListHeader" style="width: 25%;">
                                Data Entry Status
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="OverflowContainer" style="height: 300px; overflow: auto; overflow-x: hidden; position: relative;">
                        <%-- Render calendar for formatting in container --%>

                        <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>
                        <%-- Visits for Current Interval --%>
                        <asp:GridView runat="server" ID="PatientVisitsGrid" AutoGenerateColumns="false" ShowHeader="false"
                            RowStyle-CssClass="ItemRow_A" AlternatingRowStyle-CssClass="ItemRow_B" BorderStyle="None"
                            CellPadding="0" CellSpacing="0" GridLines="Horizontal" DataKeyNames="PatientItemId"
                            OnRowCreated="WireUpdateEvent" Width="100%">
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="25%">
                                    <ItemTemplate>
                                        <a href="<%= GetQueryString("PatientVisitDataEntryContainer.aspx") %>&patientSchemaId=<%= PatientSchemaId %>&visit=<%= SelectedTimelineId %>&patientItemId=<%# EncryptValue(Eval("PatientItemId").ToString()) %>"
                                            onclick="return loadPatientItem('<%# EncryptValue(Eval("PatientItemId").ToString()) %>');"
                                            target="_parent" class="patientItemName" title="Click to enter/view data for this item" style="text-decoration: underline;">
                                            <%# Eval("ItemDescription") %></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="30%">
                                    <ItemTemplate>
                                        <div style="position: relative; z-index: <%# 10000 - Container.DataItemIndex %>;">
                                            <table border="0" cellspacing="0" cellpadding="0" style="margin: auto auto auto auto;">
                                                <tr>
                                                    <td>
                                                        <cic:CaisisHidden runat="server" ID="Status" Table="ProtocolMgr_PatientItems" Field="Status" OnValueChanged="MarkRowDirty">
                                                        </cic:CaisisHidden>
                                                        <cic:CaisisHidden runat="server" ID="PatientDeviationId">
                                                        </cic:CaisisHidden>
                                                        <img id="<%# Container.DataItemIndex %>_StatusImage" onclick="showChangeStatus('<%# Container.DataItemIndex %>','<%# (Container as Control).FindControl("Status").ClientID %>');"
                                                            src="Images/ItemStatusSelector_<%# GetItemStatus(Container.DataItem).Replace(" ","") %>.png"
                                                            alt="Item Status: <%# GetItemStatus(Container.DataItem) %>" width="105" height="26"
                                                            style="margin-right: 4px; cursor: pointer;">
                                                    </td>
                                                    <td class="dateSelector" style="padding-left: 7px; white-space: nowrap;" onclick="showCal($('<%# (Container as Control).FindControl("ScheduledDate").ClientID %>'),$('<%# (Container as Control).FindControl("ScheduledDate").ClientID %>'));">
                                                        <span id="ScheduledDateLabel_<%# Container.DataItemIndex %>" style="white-space: nowrap;">
                                                            <%# (GetItemStatus(Container.DataItem) == "Performed" || GetItemStatus(Container.DataItem) == "Completed") ? "on" : "for"%>
                                                        </span> <cic:CaisisTextBox runat="server" ID="ScheduledDate" CssClass='<%# Container.DataItemIndex%2 == 0 ? "ScheduledDateInputA" :"ScheduledDateInputB"  %>'
                                                            Style="border: none;" Table="ProtocolMgr_PatientItems" Field="ScheduledDate"
                                                            ShowLabel="false" OnValueChanged="MarkRowDirty" ></cic:CaisisTextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div id="<%# Container.DataItemIndex %>_selectorLayer" class="selectorLayer" style="z-index: <%# 10000 - Container.DataItemIndex %>;"
                                                onmouseout="hideChangeStatus('<%# Container.DataItemIndex %>', event);">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="selectorLayerTop">
                                                            <a class="selectorLayerRowTd" href="#" onclick="return setStatus('<%# Container.DataItemIndex %>','Anticipated');">
                                                                <span class="AnticipatedText">
                                                                    <img src="Images/Icon_Anticipated.png" alt="Anticipated" width="9" height="9">Anticipated</span>
                                                            </a>
                                                            <a class="selectorLayerRowTd" href="#" onclick="return setStatus('<%# Container.DataItemIndex %>','Scheduled');">
                                                                <span class="ScheduledText">
                                                                    <img src="Images/Icon_Scheduled.png" alt="Scheduled" width="9" height="9">Scheduled</span>
                                                            </a>
                                                            <a class="selectorLayerRowTd" href="#" onclick="return setStatus('<%# Container.DataItemIndex %>','Performed');">
                                                                <span class="PerformedText">
                                                                    <img src="Images/Icon_Performed.png" alt="Performed" width="9" height="9">Performed</span>
                                                            </a>
                                                            <a class="selectorLayerRowTd" href="#" onclick="return setStatus('<%# Container.DataItemIndex %>','Missed');">
                                                                <span class="MissedText">
                                                                    <img src="Images/Icon_Missed.png" alt="Missed" width="9" height="9">Missed</span>
                                                            </a>                                                            
                                                            <a class="selectorLayerRowTd" href="#" onclick="return setStatus('<%# Container.DataItemIndex %>','Not Applicable');">
                                                                <span class="NotApplicableText">
                                                                    <img src="Images/Icon_NotApplicable.png" alt="Not Applicable" width="9" height="9">Not Applicable</span>
                                                            </a>
                                                             <a class="selectorLayerRowTd" href="#" onclick="return setStatus('<%# Container.DataItemIndex %>','Refused');">
                                                                <span class="RefusedText">
                                                                    <img src="Images/Icon_Refused.png" alt="Refused" width="9" height="9">Refused</span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="selectorLayerBottom">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%">
                                    <ItemTemplate>
                                        <%# Eval("FirstAnticipatedDate","{0:d}") %>
                                        -
                                        <%# Eval("LastAnticipatedDate", "{0:d}")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="25%" ItemStyle-HorizontalAlign="center">
                                    <ItemTemplate>
                                        <a href="<%= GetQueryString("PatientVisitDataEntryContainer.aspx") %>&patientSchemaId=<%= PatientSchemaId %>&visit=<%= SelectedTimelineId %>&patientItemId=<%# EncryptValue(Eval("PatientItemId").ToString()) %>"
                                            onclick="return loadPatientItem('<%# EncryptValue(Eval("PatientItemId").ToString()) %>');"
                                            target="_parent" class="patientItemName" title="Click to enter/view data for this item">
                                            <asp:Image runat="server" ID="DataEntered" ImageUrl="Images/CheckMark.png" AlternateText="Entered" />
                                            <asp:Label runat="server" ID="DataEntry"></asp:Label></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <%-- Unplanned Events --%>
                        <asp:GridView runat="server" ID="DeviationsGrid" AutoGenerateColumns="false" ShowHeader="false"
                            RowStyle-CssClass="ItemRow_A" AlternatingRowStyle-CssClass="ItemRow_B" BorderStyle="None"
                            CellPadding="0" CellSpacing="0" GridLines="Horizontal" DataKeyNames="PatientItemId"
                            Width="100%">
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="25%">
                                    <ItemTemplate>
                                        <a href="#" onclick="return loadPatientDeviation('<%# EncryptValue(Eval("PatientItemId").ToString()) %>','<%# Eval("DeviationTable") %>','<%# Eval("DeviationKey") %>');"
                                            class="patientItemName" title="Click to edit this unplanned event" style="text-decoration: underline;">
                                            <%# Eval("ItemDescription")%></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="25%">
                                    <ItemTemplate>
                                        <img src="Images/Icon_Unplanned.png" alt="Missed" width="9" height="9">Unplanned
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="25%" ItemStyle-HorizontalAlign="center">
                                    <ItemTemplate>
                                        <%# Eval("ScheduledDate", "{0:d}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="25%" ItemStyle-HorizontalAlign="center">
                                    <ItemTemplate>
                                        <a href="#" onclick="return loadPatientDeviation('<%# EncryptValue(Eval("PatientItemId").ToString()) %>','<%# Eval("DeviationTable") %>','<%# Eval("DeviationKey") %>');"
                                            class="patientItemName" title="Click to edit this unplanned event"><span class="DataNotDone">
                                                Deviation</span></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="padding-top: 16px;">
                    <asp:ImageButton runat="server" ID="SaveBtn" ImageUrl="Images/Button_Save.png" AlternateText="Save Changes"
                        Width="71px" Height="25px" OnClick="UpdateStatusClick" OnClientClick="return enableDisableDateFields(false);" /><img src="Images/Button_ShiftPatientSchedule.png"
                            alt="Shift Patient Schedule" width="135" height="25" style="cursor: pointer;
                            vertical-align: middle; display: inline;" onclick="showShift();" />
                </td>
            </tr>
        </table>
    </asp:Panel>

    <script type="text/javascript">
        /* <![CDATA[ */
        onWindowResize();
        /* ]]> */
    </script>

    </form>
</body>
</html>
