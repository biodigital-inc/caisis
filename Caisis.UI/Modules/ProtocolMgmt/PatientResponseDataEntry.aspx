<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientResponseDataEntry.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientResponseDataEntry" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Response Data Entry</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">  
    /* <![CDATA[ */
    
    function onWindowResize()
    {
        var winHeight = getHeight(window);
        var container = $('ResponseHolder');
        if(container)
        {
            var heightOffset = winHeight - 50;
            container.style.height =  Math.max(100,heightOffset)  + 'px';
        }
    }
    /* ]]> */
    </script>

    <style type="text/css">
    #ResponseHolder
    {
        border: 1px solid #cccccc;
        margin:  auto;
    }
    #ResponseFields
    {
        margin: auto;
        width: 400px;
        table-layout: fixed;
    }
    #ResponseFields td
    {
        padding-top: 5px;
        paddding-bottom: 5px;
        vertical-align: top;
    }
    #ResponseFields input
    {
        width: 175px;
    }
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%-- Data Entry Fields for Response--%>
        <asp:Panel runat="server" ID="DataEntryFields">
            <span id="PageTitle" class="SectionTitle" style="font-weight: bold; font-size: 12px;
                display: block; padding-left: 10px;">Response</span>
            <div id="ResponseHolder">
                <table id="ResponseFields">
                    <tr>
                        <td style="width: 125px;">
                            <label for="ResponseDateText">
                                Date</label>
                        </td>
                        <td style="width: auto;">
                            <cic:CaisisTextBox runat="server" ID="ResponseDateText" ShowLabel="false" Table="ProtocolMgr_PatientResponse"
                                Field="ResponseDateText" ShowCalendar="true" CalcDate="true">
                            </cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <cic:CaisisHidden runat="server" ID="ResponseDate" ShowLabel="false" Table="ProtocolMgr_PatientResponse"
                                Field="ResponseDate" DisplayCalculatedDate="true" ShowSpacer="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="ResponseField" style="font-weight: bold;">
                                Response</label>
                        </td>
                        <td>
                            <cic:CaisisComboBox runat="server" ID="ResponseField" ShowLabel="false" Table="ProtocolMgr_PatientResponse"
                                Field="Response" LookupCode="PatientTreatmentResponse" Style="font-weight: bold;"></cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="ResponseType">
                                Type</label>
                        </td>
                        <td>
                            <cic:CaisisComboBox ID="ResponseType" runat="server" ShowLabel="false" Table="ProtocolMgr_PatientResponse"
                                Field="ResponseType" LookupCode="ResponseType"></cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="ResponseCriteria">
                                Criteria</label>
                        </td>
                        <td>
                            <cic:CaisisComboBox ID="ResponseCriteria" runat="server" ShowLabel="false" Table="ProtocolMgr_PatientResponse"
                                Field="ResponseCriteria" LookupCode="ResponseCriteria"></cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="ResponseNotes">
                                Notes</label>
                        </td>
                        <td>
                            <cic:CaisisTextArea ID="ResponseNotes" runat="server" Rows="5" Width="200px" ShowLabel="false"
                                Table="ProtocolMgr_PatientResponse" Field="ResponseNotes"></cic:CaisisTextArea>
                        </td>
                    </tr>
                </table>
            </div>
            <table id="Buttons" style="width: 100%; table-layout: fixed;">
                <tr>
                    <td style="width: auto; text-align: left;">
                        <asp:ImageButton ImageUrl="Images/Button_Delete.png" runat="server" ID="DeleteBtn" OnClick="DeleteClick" OnClientClick="return confirm('Are you sure you want to delete this Response?');" />
                    </td>
                    <td style="width: 100px; text-align: left;">
                        <asp:ImageButton runat="server" ID="CancelBtn" ImageUrl="Images/Button_Cancel.png"
                            ToolTip="Save" OnClick="CancelClick" />
                    </td>
                    <td style="width: 100px; text-align: right;">
                        <asp:ImageButton runat="server" ID="SaveBtn" ImageUrl="Images/Button_Save.png" ToolTip="Save"
                            OnClick="SaveClick" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
