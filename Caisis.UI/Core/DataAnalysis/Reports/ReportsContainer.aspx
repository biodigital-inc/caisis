<%@ Page Language="c#" Inherits="Caisis.UI.Core.DataAnalysis.Reports.ReportContainer"
    CodeFile="ReportsContainer.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../../ClientScripts/headerJS.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        Browser.ResizeElement({ customResizer: resizeReportFrame });

        //var helpArray = new Array();
        //helpArray.PrintForm="<b>Reminder:</b><br>For accurate printing results, please eliminate the header and footer and set all margins to 0.25 inches (or less) in the Page Setup Dialog Box of your browser.";

        function setFormTitle(title) {
            document.getElementById('formTitleSectionName').innerHTML = title;
        }

        function printForm() {
            window.frames['ReportContent'].focus();
            window.frames['ReportContent'].print();
        }

        function loadFormOnChange(sel) {
            var formPath = getSelectValue(sel);
            if (formPath && formPath != '') { $('ReportContent').src = formPath; }

        }

        // adjuts the height of the report frame to window
        function resizeReportFrame() {
            var h = getHeight(window.top);
            $('<%= ReportContent.ClientID %>').style.height = Math.max(100, h - 250) + 'px';
        }

        // sets the current report into iframe
        // @url: location of report
        function loadReportFrame(url) {
            resizeReportFrame();
            var reportFrameDOM = $('<%= ReportContent.ClientID %>');
            var clientWidth = reportFrameDOM.offsetWidth;
            var clientHeight = reportFrameDOM.offsetHeight;
            $('<%= ReportContent.ClientID %>').src = url + '&clientWidth=' + clientWidth + '&clientHeight=' + clientHeight;
        }

        /* ]]> */
    </script>

    <style type="text/css">
        #Container
        {
            width: 100%;
            margin: auto;
        }
        .ListManagerBGTableCorner
        {
            background-repeat: no-repeat;
            width: 5px;
            height: 5px;
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server" action="ReportsContainer.aspx">
    <iframe id="ReportContent" name="ReportContent" src="" style="display: block; width: 98%;
        margin: auto; height: 400px; overflow: auto;" scrolling="auto"
        frameborder="0" runat="server"></iframe>
    <table border="0" cellspacing="0" cellpadding="0" align="center" style="width: 100%; display: none;">
        <tr>
            <td>
                <asp:PlaceHolder runat="server" ID="ModuleListHolder" Visible="false"><span class="ListManTitle">
                    Select Report: </span>
                    <select onchange="loadFormOnChange(this);">
                        <option value=""></option>
                        <asp:Repeater ID="ReportsRptr" runat="server" OnItemDataBound="SetAvailableReports">
                            <ItemTemplate>
                                <option runat="server" id="ReportItem"></option>
                            </ItemTemplate>
                        </asp:Repeater>
                    </select>
                </asp:PlaceHolder>
                <span class="ListManTitle" id="formTitleSectionName"></span>&nbsp;<asp:Label ID="formTitlePatientName"
                    runat="server"></asp:Label>
            </td>
            <td>
                <%--<img id="printFormButton" src="../../../Images/PrintThisReport.gif" style="cursor: pointer;
                        float: right; border-style: none;"
                        onclick="printForm();" onmouseover="showToolTip('PrintForm')" onmouseout="hideToolTip()"
                        runat="server" alt="Print" />--%>
            </td>
        </tr>
        <tr>
            <td colspan="2">                
                <!--- don't delete this div - needed for the help functionality --->
                <div class="patientDataFormDiv" id="PDFormDiv" style="display: none;">
                </div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
