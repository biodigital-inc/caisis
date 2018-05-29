<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientDiseaseProgression.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientDiseaseProgression" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PatientDiseaseProgression</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />
    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>
    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>
    <style type="text/css">
        label
        {
            font-weight: bold;
        }
        #MainContainer
        {
            width: 350px;
            margin: auto;
            padding: 5px 10px;
        }
        #MainContainer table tr td:first-child
        {
            width: 100px;
        }
        #MainContainer table tr td
        {
            width: 225px;
        }
        #MainContainer input[type="text"]
        {
            width: 75px;
        }
        #SaveBtn
        {
            display: block;
            width: 100px;
            margin: 5px auto;
        }
    </style>
</head>
<body>
    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>
    <form id="form1" runat="server">
    <div id="MainContainer">
        <asp:Repeater runat="server" ID="ProgressionRptr" OnItemDataBound="PopulateRptrStatuses">
            <ItemTemplate>
                <asp:HiddenField runat="server" ID="StatusIdField" />
                <h1 class="SectionTitle">
                    <%# Container.DataItem %></h1>
                <table class="StatusTable">
                    <tr>
                        <td>
                            <asp:Label runat="server" AssociatedControlID="StatusDateText" Text="Date"></asp:Label>
                        </td>
                        <td>
                            <cic:CaisisTextBox runat="server" ID="StatusDateText" ShowLabel="false" Table="Status"
                                Field="StatusDateText" ShowCalendar="true" CalcDate="true"></cic:CaisisTextBox>
                            <cic:CaisisHidden runat="server" ID="StatusDate" Table="Status" Field="StatusDate"
                                DisplayCalculatedDate="false">
                            </cic:CaisisHidden>
                            <cic:CaisisHidden runat="server" ID="StatusDisease" ShowLabel="false" Table="Status"
                                Field="StatusDisease" Enabled="false">
                            </cic:CaisisHidden>
                            <cic:CaisisHidden runat="server" ID="Status_Field" ShowLabel="false" Table="Status"
                                Field="Status" Enabled="false">
                            </cic:CaisisHidden>
                        </td>
                        <td>
                            <asp:ImageButton runat="server" ID="DeleteBtn" ImageUrl="~/Images/EFormDeleteRow.gif"
                                AlternateText="Delete" OnClick="DeleteStatusClick" OnClientClick="return confirmDelete('Are you sure you would like to clear this status?');" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Button runat="server" ID="SaveBtn" Text="Update" OnClick="UpdateClick" CssClass="dataEntryButtonRed" />
    </div>
    </form>
</body>
</html>
