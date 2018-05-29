<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminEformComponentHolder.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminEformComponentHolder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Eform Component</title>
    <link type="text/css" rel="stylesheet" href="../StyleSheets/GlobalStyles.css" />
    <link type="text/css" rel="stylesheet" href="../StyleSheets/EformStyles.css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../ClientScripts/EFormScripts.js"></script>

    <script type="text/javascript" src="../ClientScripts/popcalendar.js"></script>

    <script type="text/javascript" src="../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript">
        var tableArray = new Array(); // dummy variable 
        var wrongPath = '<%= Caisis.UI.Core.Classes.PageUtil.GetAbsoluteUrl(Page,"") %>/Images';
        var appPath = '<%= Caisis.UI.Core.Classes.PageUtil.GetAbsoluteUrl(Page,"~/") %>Images';
        // Loading layer covers compoenent while loading and shows after configured time (in ms)
        var LOADING_LAYER_DELAY = 500;

        function cancelUIEvent(e) { Event.CancelBubble(e); return false; }

        // Adjust image paths from eform container
        function checkImagesOnLoad() {
            var images = document.getElementsByTagName('IMG');
            for (var i = 0; i < images.length; i++) {
                var img = images[i];
                if (img.src.indexOf(wrongPath) > -1) {
                    img.src = img.src.replace(wrongPath, appPath);
                }
            }
        }

        // toggles the component and debug view
        // @doShowComponent: true|false whether to show component view 
        function toggleComponentView(doShowComponent) {
            var components = $('ComponentPanel');
            var debug = $('DebugPanel');
            components.style.display = doShowComponent ? '' : 'none';
            debug.style.display = !doShowComponent ? '' : 'none'; ;
            return false;
        }

        // Delay showing component
        //setTimeout(parent.hideComponentLayer,LOADING_LAYER_DELAY); 

        // Capture events on client and check images
        Event.Register('load', window, checkImagesOnLoad);
        Event.Register('click', window, cancelUIEvent);
    </script>

    <style type="text/css">
        .EFormContentOverflow
        {
            width: 98%;
            margin: auto;
            height: 600px;
        }
    </style>
</head>
<body class="adminBody">
    <form id="form1" runat="server">
    <a href="#" onclick="return toggleComponentView(true);">View Component</a> <a href="#"
        onclick="return toggleComponentView(false);">View Debug</a>
    <div id="ComponentPanel" class="EFormContentOverflow" style="z-index: 7; visibility: visible;
        overflow: auto; position: relative; background-color: transparent;">
        <asp:Panel runat="server" ID="ComponentHolder" Style="width: 90%;">
        </asp:Panel>
    </div>
    <div id="DebugPanel" style="display: none;">
        <asp:TextBox runat="server" ID="EFromXMLDebug" TextMode="MultiLine" CssClass="EFormContentOverflow"></asp:TextBox>
    </div>
    </form>
</body>
</html>
