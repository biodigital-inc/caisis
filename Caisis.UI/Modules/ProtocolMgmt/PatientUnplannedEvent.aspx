<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientUnplannedEvent.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientUnplannedEvent" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="dataEntry" TagName="ColumnLayout" Src="~/Core/DataEntryForms/DataEntryControls/ColumnDataEntry.ascx" %>
<%@ Register TagPrefix="dataEntry" TagName="GridLayout" Src="~/Core/DataEntryForms/DataEntryControls/GridDataEntry.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unplanned Event</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        function onWindowResize(width, height, e) {
            var overflow = document.getElementById('Overflow');
            var winHeight = getHeight();
            // adjust overflow to minus data entry buttons
            overflow.style.height = Math.max(100, winHeight - 100) + 'px';
        }

        // notify parent page that record has been updated
        function notifyRecordUpdate(isDelete) {
            if (parent.notifyUnplannedEventUpdate) parent.notifyUnplannedEventUpdate();
        }

        // cancels the current data entry and closes layer
        function cancelEnterData() {
            if (parent.hideDeviation) { parent.hideDeviation(); }
            return false;
        }

        /* ]]> */
    </script>
    <style type="text/css">
        #Overflow
        {
            overflow: auto; 
            border-bottom: 1px solid #cccccc;
            margin-bottom: 10px;
            min-height: 100px;
        }
        .FieldsLayout
        {
            table-layout: fixed;
            margin-bottom: 10px;
            vertical-align: top;
        }
        .FieldsLayout td
        {
            vertical-align: top;
        }
        #ButtonLayout
        {
            width: 86%;
            margin: 0px auto 0px auto;
            text-align: right;
        }
        .EditDataEntryForm_Column1, .EditDataEntryForm_Column2
        {
            width: 305px;
            float: left;
            margin: 0px 15px auto 15px;
        }
        div.EditDataEntryField_Container
        {
            margin: 3px 2px;
        }
        
        div.EditDataEntryField_Container input[type="text"]
        {
            vertical-align: middle;
            width: 110px;
        }
        
        div.EditDataEntryField_Container select
        {
            vertical-align: middle;
            width: 133px;
        }
        div.EditDataEntryField_Container textarea
        {
            width: 110px;
            vertical-align: middle;
        }
        .EditDataEntryField_Label
        {
            display: inline-block;
            width: 120px;
            line-height: 14px;
        }
        .requiredField
        {
            display: inline-block;
            width: 120px;
            line-height: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="PatientItemId" />
    <asp:HiddenField runat="server" ID="PriKeyField" />
    <asp:HiddenField runat="server" ID="RelatedRecordId" />

    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

    <div class="UnplannedEventContainer">
        <div id="Overflow">
            <dataEntry:ColumnLayout runat="server" ID="DataEntryLayout" />
        </div>
        <div id="ButtonLayout">
            <asp:ImageButton runat="server" ID="DeleteBtn" ImageUrl="Images/Button_Delete.png"
                ToolTip="Delete" OnClick="DeleteClick" OnClientClick="return confirmDelete();"
                Style="float: left;" />
            <asp:ImageButton runat="server" ID="CancelBtn" ImageUrl="Images/Button_Cancel.png"
                ToolTip="Cancel" OnClientClick="return cancelEnterData();" Style="margin-right: 20px;" />
            <asp:ImageButton runat="server" ID="UpdateBtn" ImageUrl="Images/Button_Save.png"
                ToolTip="Save" OnClick="SaveClick" />
        </div>
    </div>
    </form>
</body>
</html>
