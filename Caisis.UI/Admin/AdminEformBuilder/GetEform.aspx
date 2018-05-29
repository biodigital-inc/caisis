<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetEform.aspx.cs" Inherits="Caisis.UI.Admin.GetEform" %>

<%@ Register TagPrefix="eform" TagName="page" Src="~/Admin/AdminEformBuilder/Controls/EFormPageControl.ascx" %>
<%@ Register TagPrefix="eform" TagName="section" Src="~/Admin/AdminEformBuilder/Controls/EFormSectionControl.ascx" %>
<%@ Register TagPrefix="eform" TagName="fields" Src="~/Admin/AdminEformBuilder/Controls/EFormSectionFieldList.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Preview</title>
    <link href="../../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="Styles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>

    <script type="text/javascript">
        // supress conflict with caisis specific $ object
        jQuery.noConflict();

        function outputEForm(type) {
            var data = jQuery('#JSONData').val();
            var eform = jQuery('#eform');
            eform.val(data);
            jQuery('#OuputEForm').attr('action', 'GetSerializedEFom.aspx?type=' + type).submit();
            return false;
        }
    </script>

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

    <style type="text/css">
        ol
        {
            list-style-type: none;
            padding: 0px;
            margin: 0px;
        }
    </style>
</head>
<body>
    <button onclick="return outputEForm('json');">
        Output as JSON</button>
    <button onclick="return outputEForm('xml');">
        Output as XML</button>
    <form id="OuputEForm" action="GetSerializedEFom.aspx" method="post" target="_blank">
    <input type="hidden" id="eform" name="eform" />
    </form>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="EFormId" />
    <asp:HiddenField runat="server" ID="OperationMessage" Value="" />
    <asp:Panel runat="server" ID="PreviewPanel" Visible="false">
        <asp:HiddenField runat="server" ID="JSONData" />
        <h1>
            <asp:Label runat="server" ID="EFormName"></asp:Label>
        </h1>
    </asp:Panel>
    <asp:Panel runat="server" ID="ToolboxPanel" Visible="false">
        <eform:fields runat="server" ID="ToolboxList" />
    </asp:Panel>
    <asp:Panel runat="server" ID="EFormSectionPanel" Visible="false">
        <%-- Eform Section --%>
        <eform:page runat="server" ID="PageOne" />
    </asp:Panel>
    </form>
</body>
</html>
