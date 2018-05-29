<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientImagingPET.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientImagingPET" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PED Scan</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        function loadDiagnosticRecord(diagnosticId) {
            window.location = '<%= GetQueryString("PatientImagingPET.aspx") %>&diagnosticId=' + diagnosticId;
        }

        /* ]]> */
    </script>

    <style type="text/css">
        html
        {
            height: 100%;
        }
        body
        {
            padding: 0px;
            margin: 0px;
            background-color: #ffffff;
        }
        .GrayRoundedBox_TopLeft
        {
            background-image: url(images/GrayRoundedBoxBG_TopLeft.gif);
            background-repeat: no-repeat;
            font-family: Arial, Helvetica, sans-serif;
        }
        .GrayRoundedBox_TopRight
        {
            background-image: url(images/GrayRoundedBoxBG_TopRight.gif);
            background-repeat: no-repeat;
            background-position: top right;
            width: 12px;
        }
        .GrayRoundedBox_Middle
        {
            background-color: #efefef;
            font: Arial, Helvetica, sans-serif;
            color: #111111;
            font-size: 12px;
        }
        .GrayRoundedBox_BottomLeft
        {
            background-image: url(images/GrayRoundedBoxBG_BottomLeft.gif);
            background-repeat: no-repeat;
            height: 12px;
        }
        .GrayRoundedBox_BottomRight
        {
            background-image: url(images/GrayRoundedBoxBG_BottomRight.gif);
            background-repeat: no-repeat;
            background-position: bottom right;
            width: 12px;
            height: 12px;
        }
        .DoubleGrayRoundedBox_TopLeft
        {
            background-image: url(images/DoubleGrayRoundedBoxBG_TopLeft.png);
            background-repeat: no-repeat;
            font-family: Arial, Helvetica, sans-serif;
        }
        .DoubleGrayRoundedBox_TopRight
        {
            background-image: url(images/DoubleGrayRoundedBoxBG_TopRight.png);
            background-repeat: no-repeat;
            background-position: top right;
            width: 17px;
        }
        .DoubleGrayRoundedBox_BottomLeft
        {
            background-image: url(images/DoubleGrayRoundedBoxBG_BottomLeft.png);
            background-repeat: no-repeat;
            height: 17px;
        }
        .DoubleGrayRoundedBox_BottomRight
        {
            background-image: url(images/DoubleGrayRoundedBoxBG_BottomRight.png);
            background-repeat: no-repeat;
            background-position: bottom right;
            width: 17px;
            height: 17px;
        }
        .PastScansHeader
        {
            width: 93%;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            margin: 0px auto 0px auto;
            font-weight: bold;
        }
        .PastScansDiv
        {
            width: 93%;
            margin: 0px auto 0px auto;
            height: 373px;
            border: solid 1px #DDDDDD;
            background-color: #F8FAFC;
            overflow: auto;
            overflow-x: hidden;
        }
        .PastScansTable
        {
            width: 100%;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            margin: 0px auto 0px auto;
        }
        .PastScansA
        {
            background-color: #E0EBF1;
            text-align: left;
            padding-left: 8%;
            vertical-align: middle;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #1C3B68;
            height: 31px;
            cursor: pointer;
        }
        .PastScansB
        {
            background-color: #F8FAFC;
            text-align: left;
            padding-left: 8%;
            vertical-align: middle;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #1C3B68;
            height: 31px;
            cursor: pointer;
        }
        .PastScansHightlight
        {
            background-color: #E3D1D3;
            text-align: left;
            padding-left: 8%;
            vertical-align: middle;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            height: 31px;
            cursor: pointer;
        }
        .PastScansTD
        {
            padding-left: 8%;
        }
        .PastScansDiv1
        {
            width: 93%;
            margin: 0px auto 0px auto;
            height: 400px;
            border: solid 1px #DDDDDD;
            background-color: #F8FAFC;
            overflow: auto;
            overflow-x: hidden;
        }
        .BoneScanDataDiv
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            font-size: 13px;
        }
        .descriptionText
        {
            font-size: 11px;
            color: #333333;
        }
        #DiagnosticInfo td
        {
            font-size: 13px;
            height: 24px;
            padding-right: 8px;
            vertical-align: top;
        }
        .dataEntryButtonGray
        {
            font-weight: bold;
            font-size: 10px;
            display: inline-block;
            padding: 2px 7px;
            cursor: pointer;
            background-color: #eeeeee;
            color: #666666;
            border: 1px solid #bbbbbb;
            border-radius: 4px;
        }
        .dataEntryButtonGray:hover
        {
            background-color: #ccc;
            color: #333;
        }
        .FindListLayer
        {
            height: 100px;
            overflow: auto;
        }
    </style>
</head>
<body>

    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

    <div style="margin-top: 10px;">
        <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td style="width: 232px; vertical-align: top;">
                    <%-- PET Scans --%>
                    <table style="width: 220px;" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="GrayRoundedBox_TopLeft">
                                <img src="images/shim.gif" style="width: 208px; height: 1px;" />
                            </td>
                            <td class="GrayRoundedBox_TopRight">
                                <img src="images/shim.gif" style="width: 12px; height: 1px;" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="GrayRoundedBox_Middle">
                                <table class="PastScansHeader" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="width: 50%; padding-left: 8%;">
                                            Date
                                        </td>
                                        <td style="width: 50%; padding-left: 0%;">
                                            New Lesions
                                        </td>
                                    </tr>
                                </table>
                                <div class="PastScansDiv">
                                    <table id="DiagnosticsTable" class="PastScansTable" border="0" cellspacing="0" cellpadding="0">
                                        <asp:Repeater runat="server" ID="DiagnosticsRptr">
                                            <ItemTemplate>
                                                <tr id="Diagnostic_<%# Eval("DiagnosticId") %>" class="<%# Container.ItemIndex % 2==0? "PastScansA" : "PastScansB" %>"
                                                    onmouseover="this.className='PastScansHightlight';" onmouseout="this.className='PastScansA';"
                                                    onclick="loadDiagnosticRecord('<%# Eval("DiagnosticId") %>');">
                                                    <td class="PastScansTD" style="width: 50%;">
                                                        <%# Eval("DxDate","{0:d}") %>
                                                    </td>
                                                    <td class="PastScansTD">
                                                        <%# Eval("DxNumNewTumors")%>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>

                                    <script type="text/javascript">
                                        /* <![CDATA[ */
                                        // init chron hover
                                        CHRON_ACTIVE_ROW_CLASS = 'PastScansHightlight';
                                        CHRON_HOVER_ROW_CLASS = 'PastScansHightlight';
                                        initDataEntryChronList('DiagnosticsTable', 'Diagnostic_<%= QueryDiagnosticId %>');
                                        /* ]]> */
                                    </script>

                                </div>
                                <a href="<%= GetQueryString("PatientImagingPET.aspx") %>&new=true"><a href="<%= GetQueryString("PatientImagingPET.aspx") %>"
                                    class="dataEntryButtonGray" style="margin: 3px 7px;">Add New PET Scan</a>
                            </td>
                        </tr>
                        <tr>
                            <td class="GrayRoundedBox_BottomLeft">
                                <img src="images/shim.gif" style="width: 1px; height: 1px;">
                            </td>
                            <td class="GrayRoundedBox_BottomRight">
                                <img src="images/shim.gif" style="width: 12px; height: 1px;">
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="vertical-align: top;">
                    <form id="form1" runat="server">
                    <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="DoubleGrayRoundedBox_TopLeft" style="height: 45px; padding-left: 17px;
                                color: #8d2a2c; font-size: 15px; font-weight: bold;">
                                <span style="float: right; margin-top: 2px; margin-right: 10px;">
                                    <img id="DiagnosticTab" src="images/BoneScanTabGeneralScanInformation_On.png" alt="General Scan Information"
                                        width="190" height="31" style="cursor: pointer;" onclick="showDiagnostic();"></span>
                                <asp:Literal ID="ScanDetailTitle" runat="server">PET Scan on</asp:Literal>
                                <asp:Label runat="server" ID="DxDateLabel"></asp:Label>
                                <asp:Label runat="server" ID="DxBaselineLabel" Style="display: none; font-weight: normal;
                                    font-size: 12px; margin-left: 10px; vertical-align: middle;">(BASELINE)</asp:Label>
                            </td>
                            <td class="DoubleGrayRoundedBox_TopRight">
                                <img src="images/shim.gif" style="width: 12px; height: 1px;">
                            </td>
                        </tr>
                        <tr>
                            <td class="DoubleGrayRoundedBox_TopLeft" style="background-position: 0px -45px; padding-left: 17px;
                                padding-right: 17px;">
                                <%-- Diagnostic Record --%>
                                <div id="DiagnosticPanel" style="position: relative;">
                                    <table id="DiagnosticInfo" cellpadding="0" cellspacing="0" style="margin: 0px auto 0px 200px;">
                                        <tr>
                                            <td>
                                                <label for="DxType">
                                                    Type</label>
                                            </td>
                                            <td>
                                                <cic:CaisisTextBox runat="server" ID="DxType" ShowLabel="false" Table="Diagnostics"
                                                    Field="DxType" Value="PET"></cic:CaisisTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="ImgBaseline">
                                                    Baseline Scan</label>
                                            </td>
                                            <td>
                                                <cic:CaisisCheckBox runat="server" ID="ImgBaseline" ShowLabel="false" Table="Diagnostics"
                                                    Field="ImgBaseline"></cic:CaisisCheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="DxDateText">
                                                    Date Of Scan</label>
                                            </td>
                                            <td>
                                                <cic:CaisisTextBox runat="server" ID="DxDateText" ShowLabel="false" ShowCalendar="true"
                                                    CalcDate="true" Table="Diagnostics" Field="DxDateText"></cic:CaisisTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <cic:CaisisHidden runat="server" ID="DxDate" ShowLabel="false" DisplayCalculatedDate="true" ShowSpacer="false"
                                                    Table="Diagnostics" Field="DxDate" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="DxResult">
                                                    Tracer uptake related to metastatic disease?</label>
                                            </td>
                                            <td>
                                                <cic:CaisisSelect runat="server" ID="DxResult" ShowLabel="false" Table="Diagnostics"
                                                    Field="DxResult">
                                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                </cic:CaisisSelect>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="DxTotalNumTumors">
                                                    Total Lesions</label>
                                            </td>
                                            <td>
                                                <cic:CaisisTextBox runat="server" ID="DxTotalNumTumors" ShowLabel="false" Table="Diagnostics"
                                                    Field="DxTotalNumTumors"></cic:CaisisTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="DxNumNewTumors">
                                                    Total New Lesions</label>
                                            </td>
                                            <td>
                                                <cic:CaisisTextBox runat="server" ID="DxNumNewTumors" ShowLabel="false" Table="Diagnostics"
                                                    Field="DxNumNewTumors"></cic:CaisisTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="DxSummary">
                                                    Clinical Impression</label>
                                            </td>
                                            <td>
                                                <cic:CaisisTextBox runat="server" ID="DxSummary" ShowLabel="false" Table="Diagnostics"
                                                    Field="DxSummary"></cic:CaisisTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="ImgFindResult1">
                                                    Total Bone Lesions</label>
                                            </td>
                                            <td>
                                                <cic:CaisisSelect runat="server" ID="ImgFindResult1" ShowLabel="false" Table="DxImageFindings"
                                                    Field="ImgFindResult">
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="2-4" Value="2-4"></asp:ListItem>
                                                    <asp:ListItem Text="5-9" Value="5-9"></asp:ListItem>
                                                    <asp:ListItem Text="10-20" Value="10-20"></asp:ListItem>
                                                    <asp:ListItem Text=">20" Value=">20"></asp:ListItem>
                                                </cic:CaisisSelect>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="ImgFindSide1">
                                                    Bone Lesion Locations</label>
                                            </td>
                                            <td>
                                                <div class="FindListLayer">
                                                    <cic:CaisisCheckBoxList runat="server" ID="ImgFindSide1" ShowLabel="false" Table="DxImageFindings"
                                                        Field="ImgFindSide" ShowOther="false" LookupCode="ImgFindSite">
                                                    </cic:CaisisCheckBoxList>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="ImgFindResult2">
                                                    Total Soft Tissue Lesions</label>
                                            </td>
                                            <td>
                                                <cic:CaisisSelect runat="server" ID="ImgFindResult2" ShowLabel="false" Table="DxImageFindings"
                                                    Field="ImgFindResult">
                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="2-4" Value="2-4"></asp:ListItem>
                                                    <asp:ListItem Text="5-9" Value="5-9"></asp:ListItem>
                                                    <asp:ListItem Text="10-20" Value="10-20"></asp:ListItem>
                                                    <asp:ListItem Text=">20" Value=">20"></asp:ListItem>
                                                </cic:CaisisSelect>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="ImgFindSide2">
                                                    Soft Tissue Locations</label>
                                            </td>
                                            <td>
                                                <div class="FindListLayer">
                                                    <cic:CaisisCheckBoxList runat="server" ID="ImgFindSide2" ShowLabel="false" Table="DxImageFindings"
                                                        Field="ImgFindSide" ShowOther="false" LookupCode="ImgFindSite">
                                                    </cic:CaisisCheckBoxList>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <%-- grids --%>
                                    <h4>
                                        SUV of 5 Hottest Lesions</h4>
                                    <cic:ExtendedGridView runat="server" ID="DxGrid1" AutoGenerateColumns="false" TableName="DxImageFindings"
                                        BlankRows="5" VisibleBlankRows="5" GridLines="None" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader"
                                        RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                                        OnRowDeleted="RebindOnDelete">
                                        <Columns>
                                            <cic:ExtendedTemplateField HeaderText="Lesion" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <span style="white-space: nowrap;">Lesion
                                                        <%# Container.DataItemIndex + 1 %></span>
                                                </ItemTemplate>
                                            </cic:ExtendedTemplateField>
                                            <cic:ExtendedTemplateField HeaderText="Series">
                                                <ItemTemplate>
                                                    <cic:CaisisTextBox ID="ImgFindSeriesNum" runat="server" ShowLabel="false" Table="DxImageFindings"
                                                        Field="ImgFindSeriesNum"></cic:CaisisTextBox>
                                                </ItemTemplate>
                                            </cic:ExtendedTemplateField>
                                            <cic:ExtendedTemplateField HeaderText="Slice">
                                                <ItemTemplate>
                                                    <cic:CaisisTextBox ID="ImgFindSliceNum" runat="server" ShowLabel="false" Table="DxImageFindings"
                                                        Field="ImgFindSliceNum"></cic:CaisisTextBox>
                                                </ItemTemplate>
                                            </cic:ExtendedTemplateField>
                                            <cic:ExtendedTemplateField HeaderText="Side">
                                                <ItemTemplate>
                                                    <cic:CaisisComboBox ID="ImgFindSide" runat="server" LookupCode="FindSide" ShowLabel="false" Table="DxImageFindings"
                                                        Field="ImgFindSide"></cic:CaisisComboBox>
                                                </ItemTemplate>
                                            </cic:ExtendedTemplateField>
                                            <cic:ExtendedTemplateField HeaderText="Site">
                                                <ItemTemplate>
                                                    <cic:CaisisComboBox ID="ImgFindSite" runat="server" LookupCode="ImgFindSite" ShowLabel="false"
                                                        Table="DxImageFindings" Field="ImgFindSite"></cic:CaisisComboBox>
                                                </ItemTemplate>
                                            </cic:ExtendedTemplateField>
                                            <cic:ExtendedTemplateField HeaderText="SubSite">
                                                <ItemTemplate>
                                                    <cic:CaisisComboBox ID="ImgFindSubsite" runat="server" LookupCode="ImgFindSubsite"
                                                        ShowLabel="false" Table="DxImageFindings" Field="ImgFindSubsite"></cic:CaisisComboBox>
                                                </ItemTemplate>
                                            </cic:ExtendedTemplateField>
                                            <cic:ExtendedTemplateField HeaderText="SUV Max">
                                                <ItemTemplate>
                                                    <cic:CaisisTextBox ID="ImgFindSUV" runat="server" ShowLabel="false" Table="DxImageFindings"
                                                        Field="ImgFindSUV"></cic:CaisisTextBox>
                                                </ItemTemplate>
                                            </cic:ExtendedTemplateField>
                                            <cic:GridRowDeleteImage>
                                            </cic:GridRowDeleteImage>
                                        </Columns>
                                    </cic:ExtendedGridView>
                                    <h4>
                                        New Lesions</h4>
                                    <cic:ExtendedGridView runat="server" ID="DxGrid2" AutoGenerateColumns="false" TableName="DxImageFindings"
                                        GridLines="None" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA"
                                        AlternatingRowStyle-CssClass="dataGridItemRowB" BlankRows="6" VisibleBlankRows="3">
                                        <Columns>
                                            <cic:ExtendedTemplateField>
                                                <ItemTemplate>
                                                    <cic:CaisisTextBox ID="CaisisTextBox1" runat="server" Table="DxImageFindings" Field=""></cic:CaisisTextBox>
                                                </ItemTemplate>
                                            </cic:ExtendedTemplateField>
                                        </Columns>
                                    </cic:ExtendedGridView>
                                    <div style="width: 500px; margin: 14px auto 0px auto; height: 30px; padding-right: 100px;">
                                        <asp:ImageButton runat="server" ID="SaveBtn" ImageUrl="Images/Button_Save.png"
                                            ToolTip="Save" OnClick="SaveClick" Style="cursor: pointer; float: right;" />
                                        <asp:ImageButton ImageUrl="Images/Button_DeleteThisBoneScan.png" ID="DeleteBtn" runat="server"
                                            Text="Delete Diagnostic" OnClick="DeleteClick" OnClientClick="return confirmDelete('Are you sure you want to delete this Diagnostic and associated findings?');"
                                            Style="height: 25px; width: 144px;" />
                                    </div>
                                </div>
                            </td>
                            <td class="DoubleGrayRoundedBox_TopRight" style="background-position: bottom right;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="DoubleGrayRoundedBox_BottomLeft">
                                <img src="images/shim.gif" style="width: 1px; height: 1px;">
                            </td>
                            <td class="DoubleGrayRoundedBox_BottomRight">
                                <img src="images/shim.gif" style="width: 12px; height: 1px;">
                            </td>
                        </tr>
                    </table>
                    </form>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
