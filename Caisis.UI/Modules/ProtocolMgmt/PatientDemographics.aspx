<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientDemographics.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientDemographics" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PatientDemographics</title>
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
            position: relative;
        }
        #MainContainer table tr td:first-child
        {
            width: 100px;
        }
        #MainContainer table tr td
        {
            width: 225px;
        }
        #MainContainer input, #MainContainer select, #MainContainer textarea
        {
            width: 150px;
        }
    </style>
</head>
<body>
    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>
    <form id="form1" runat="server">
    <div id="MainContainer">
        <h1 class="SectionTitle">
            Demographics</h1>
        <table>
            <tr>
                <td>
                    <label for="PtGender">
                        Gender
                    </label>
                </td>
                <td>
                    <cic:CaisisSelect runat="server" ID="PtGender" ShowLabel="false" Table="Patients"
                        Field="PtGender" LookupCode="PtGender">
                    </cic:CaisisSelect>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="PtRace">
                        Race
                    </label>
                </td>
                <td>
                    <cic:CaisisComboBox runat="server" ID="PtRace" ShowLabel="false" Table="Patients"
                        Field="PtRace" LookupCode="PtRace"></cic:CaisisComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="PtEthnicity">
                        Ethnicity
                    </label>
                </td>
                <td>
                    <cic:CaisisComboBox runat="server" ID="PtEthnicity" ShowLabel="false" Table="Patients"
                        Field="PtEthnicity" LookupCode="PtEthnicity"></cic:CaisisComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="PtDeathDateText">
                        Death Date
                    </label>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="PtDeathDateText" ShowLabel="false" Table="Patients"
                        Field="PtDeathDateText" ShowCalendar="true" CalcDate="true"></cic:CaisisTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <cic:CaisisHidden runat="server" ID="PtDeathDate" Table="Patients" Field="PtDeathDate"
                        DisplayCalculatedDate="true" ShowSpacer="false">
                    </cic:CaisisHidden>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="PtDeathType">
                        Death Type
                    </label>
                </td>
                <td>
                    <cic:CaisisComboBox runat="server" ID="PtDeathType" ShowLabel="false" Table="Patients"
                        Field="PtDeathType" LookupCode="DeathType"></cic:CaisisComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="PtDeathCause">
                        Death Cause
                    </label>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="PtDeathCause" ShowLabel="false" Table="Patients"
                        Field="PtDeathCause"></cic:CaisisTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Button runat="server" ID="SaveBtn" Text="Update" OnClick="UpdateClick" CssClass="dataEntryButtonRed" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
