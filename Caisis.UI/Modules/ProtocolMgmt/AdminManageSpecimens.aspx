<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminManageSpecimens.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminManageSpecimens" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Protocol Specimens</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="StyleSheets/ProtocolMgmtStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script type="text/javascript">
        Browser.ResizeElement({ nodeId: "MainOverflow", heightOffset: 225 });    
    </script>
    <style type="text/css">
        h3
        {
            margin: 2px auto;
            font-size: 12px;
        }
        .dataEntryNavToggle
        {
            margin: auto;
        }
        .dataEntryNavToggle a
        {
            width: 200px;
            margin: 0;
        }
        .CheckBoxListLayerContainer
        {
            max-width: 150px;
            width: 150px;
            max-height: 225px;
        }
        .searchTable
        {
            table-layout: fixed;
            width: 100%;
            margin: 0;
        }
        .searchTable th a
        {
            font-weight: bold;
            text-decoration: underline;
        }
        .searchTable th, .searchTable td
        {
            width: auto;
            vertical-align: top;
            padding: 2px 3px;
            white-space: normal;
        }
        .searchTable th:first-child label, .searchTable td:first-child label
        {
            display: block;
            text-align: center;
        }
        .searchFilter
        {
            display: none;
        }
        .searchFilter label, .searchFilter input, .searchFilter select
        {
            display: inline-block;
            width: 100px;
        }
        .dataEntryLayoutTable td
        {
            vertical-align: top;
        }
        .dataGridHeader a
        {
            color: #bbbbbb;
        }
        .dataGrid td
        {
            white-space: normal;
        }
        #RecordCount
        {
            display: block;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <label>
        Subject:
        <cic:CaisisSelect runat="server" ID="SubjectSelection" ShowLabel="false" OnSelectedIndexChanged="BuildPatientSpecimens"
            AutoPostBack="true" DataTextField="PtProtocolStudyId" DataValueField="PtProtocolStudyId">
        </cic:CaisisSelect>
    </label>
    <a href="Reports/ProtocolSpecimenReport.aspx?prid=<%= BaseProtocolId %>&scid=&paid="
        target="_blank" class="dataEntryButtonRed" style="float: right;">View Specimen Report</a>
    <asp:Panel runat="server" ID="DataPanel">
        <asp:Label runat="server" ID="RecordCount" CssClass="boldText"></asp:Label>
        <div id="MainOverflow" style="height: 500px; overflow: auto; position: relative;">
            <cic:ExtendedGridView runat="server" ID="SpecimenInventory" TableName="Specimens"
                DataKeyNames="SpecimenAccessionId,SpecimenId" ShowHeader="true" AutoGenerateColumns="false">
            </cic:ExtendedGridView>
        </div>
        <asp:Button runat="server" ID="UpdateBtn" OnClick="UpdateSpecimens" Text="Update"
            CssClass="dataEntryButtonRed" Visible="false" />
    </asp:Panel>
    </form>
</body>
</html>
