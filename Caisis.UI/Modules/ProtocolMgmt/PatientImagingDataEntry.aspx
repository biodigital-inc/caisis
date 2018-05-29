<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientImagingDataEntry.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientImagingDataEntry" %>

<%@ Register TagPrefix="grid" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Imaging Data Entry</title>
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
        if($('OverflowTable'))
        {
            var winHeight = getHeight(window);
            var overflowHeight = Math.max(100, winHeight - 50);
            $('OverflowTable').style.height = overflowHeight + 'px';
        }
    }
    
    /* ]]> */
    </script>

    <style type="text/css">
    h2
    {
        font-size: 14px;
        color: #222222;
        margin: 0px;
        line-height: 15px;
        font-weight: bold;
    }
    
    
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel runat="server" ID="DataEntryFields">
            <div id="OverflowTable" style="height: 250px; overflow: auto;">
                <h2 style="font-size: 15px; display: inline;">Diagnostic</h2>
                <table id="DxFields" style="width: 400px;">
                    <tr>
                        <td style="width: 125px;">
                            <label for="DxDateText">
                                Date</label>
                        </td>
                        <td>
                            <cic:CaisisTextBox runat="server" ID="DxDateText" ShowLabel="false" Table="Diagnostics"
                                Field="DxDateText" ShowCalendar="true" CalcDate="true">
                            </cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: left;">
                            <cic:CaisisHidden runat="server" ID="DxDate" ShowLabel="false" Table="Diagnostics"
                                Field="DxDate" DisplayCalculatedDate="true" />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="DxType">
                                DxType</label>
                        </td>
                        <td>
                            <cic:CaisisTextBox ID="DxType" runat="server" ShowLabel="false" Table="Diagnostics"
                                Field="DxType"></cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="DxResult">
                                Result</label>
                        </td>
                        <td>
                            <cic:CaisisTextBox ID="DxResult" runat="server" ShowLabel="false" Table="Diagnostics"
                                Field="DxResult"></cic:CaisisTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="DxNotes">
                                Notes</label>
                        </td>
                        <td>
                            <cic:CaisisTextArea ID="DxNotes" runat="server" Rows="5" Width="200px" ShowLabel="false"
                                Table="Diagnostics" Field="DxNotes"></cic:CaisisTextArea>
                        </td>
                    </tr>
                </table>
                <h2 style="font-size: 15px; display: inline;">Findings</h2>
                <%-- Imaging Data --%>
                <asp:GridView runat="server" ID="ImageFindingsGrid" DataKeyNames="DiagnosticId,DxImageFindingId"
                    AutoGenerateColumns="false" BorderStyle="Solid" BorderWidth="1" GridLines="both">
                    <Columns>
                        <asp:BoundField DataField="ImgFindSite" HeaderText="Site" />
                        <asp:BoundField DataField="ImgFindSubsite" HeaderText="Sub Site" />
                        <asp:BoundField DataField="ImgFindSide" HeaderText="Side" />
                        <asp:BoundField DataField="ImgFindHeight" HeaderText="Height" />
                        <asp:BoundField DataField="ImgFindWidth" HeaderText="Width" />
                        <asp:BoundField DataField="ImgFindLength" HeaderText="Length" />
                        <asp:BoundField DataField="ImgFindSUV" HeaderText="SUV" />
                    </Columns>
                </asp:GridView>
                <asp:Label runat="server" ID="NoImagingRecords">No DxImages</asp:Label>
            </div>
            <asp:ImageButton runat="server" ID="SaveBtn" ImageUrl="Images/Button_Save.png" ToolTip="Save" />
        </asp:Panel>
    </form>
</body>
</html>
