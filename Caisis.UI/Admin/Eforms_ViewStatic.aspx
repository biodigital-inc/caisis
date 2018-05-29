<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Eforms_ViewStatic.aspx.cs"
    Inherits="Caisis.UI.Admin.Eforms_ViewStatic" %>

<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="~/Core/Help/helpToolTip.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Static Eform</title>
    <link href="../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../ClientScripts/headerJS.js" type="text/javascript"></script>

    <script src="../ClientScripts/EFormScripts.js" type="text/javascript"></script>

    <script src="../ClientScripts/Help.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        Browser.ResizeElement({ nodeId: 'EformMain', heightOffset: 165 });
        Browser.ResizeElement({ nodeId: 'EformDebug', heightOffset: 175 });

        function fixImgPaths() {
            var imgPath = '<%= Page.ResolveUrl("~/Images/") %>';
            var imgs = document.getElementsByTagName('IMG');

            for (var i = 0; i < imgs.length; i++) {
                var img = imgs[i];
                if (img.src.indexOf(imgPath) == -1) {
                    img.src = img.src.replace('/Images/', imgPath);
                }
            }
        }

        function showHideEformDebug(doShow) {
            var debug = $('EformDebugLayer'); ;
            var main = $('EformMain');
            debug.style.display = doShow ? 'block' : 'none';
            main.style.display = !doShow ? 'block' : 'none';
        }

        /* ]]> */
    </script>

    <style type="text/css">
        @media screen
        {
            #EformNavigation
            {
                float: left;
                overflow: auto;
                height: 95%;
                width: 250px;
                position: fixed;
                top: 0px;
                left: 0px;
            }
            #EformNavigation table
            {
                width: 100%;
            }
            ul#EformNavigationList
            {
                list-style-type: none inside;
                margin-left: 0px;
                padding-left: 0px;
            }
            ul#EformNavigationList * a
            {
                color: #000;
                text-decoration: none;
            }
            ul#EformNavigationList * a:hover
            {
                text-decoration: underline;
            }
            .EformDisplayLayer
            {
                position: absolute;
                top: 0px;
                right: 0px;
                width: 825px;
                height: 95%;
                overflow: auto;
                border: 1px solid #ccc;
                padding: 5px;
            }
        }
        @media print
        {
            #EformNavigation
            {
                display: none;
            }
            .EformDisplayLayer
            {
                width: auto;
                float: none;
                border-style: none;
            }
        }
        #EformDebugLayer
        {
            display: none;
            border: 1px solid #ccc;
        }
        h2
        {
            font-size: 14px;
        }
        h3
        {
            font-size: 12px;
        }
        .EformSection
        {
            margin-top: 10px;
        }
        .EformSectionComponent
        {
        }
    </style>
</head>
<body class="AdminBody">
    <form id="form1" runat="server">
    <div id="EformMainLayer">
        <div id="EformNavigation">
            <h2 class="EFormMainTitle">
                <%= EformName %></h2>
            <label for="EformDebugCheckBox" title="Show Eform XML">
                Show Debug
            </label>
            <input id="EformDebugCheckBox" name="EformDebugCheckBox" type="checkbox" onclick="showHideEformDebug(this.checked);" />
            <ul id="EformNavigationList">
                <asp:Repeater runat="server" ID="EformSectionNaviation" OnItemDataBound="BuildSectionNavigation">
                    <ItemTemplate>
                        <%-- section --%>
                        <li class="eformNavigationHeadingOn"><a href="#Section_<%# Container.ItemIndex %>">
                            <%# Eval("SectionName") %></a> </li>
                        <%-- components --%>
                        <asp:Repeater runat="server" ID="EformSectionComponentsNaviation">
                            <ItemTemplate>
                                <li class="eformNavigationLinkOn"><a href="#Component_<%# (Container.NamingContainer.NamingContainer as RepeaterItem).ItemIndex %>_<%# Container.ItemIndex %>">
                                    <%# Eval("Title") %>
                                </a><span title="<%# Eval("InputControlsCount") %> Control(s) | <%# Eval("InputControlsStats") %>">
                                    (<%# Eval("InputControlsCount") %>)</span></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div id="EformMain" class="EformDisplayLayer">
            <uc1:helpToolTip ID="HelpToolTipLayer" runat="server" />

            <script src="../ClientScripts/popcalendar.js" type="text/javascript"></script>

            <asp:Repeater runat="server" ID="EformSectionRptr" OnItemDataBound="LoadEformComponents">
                <ItemTemplate>
                    <h3>
                        <%# Eval("SectionName") %></h3>
                    <div class="EformSection" id="Section_<%# Container.ItemIndex %>" style="page-break-before: auto;">
                        <asp:Repeater runat="server" ID="EformComponentsRptr" OnItemDataBound="LoadEformControl">
                            <ItemTemplate>
                                <div id="Component_<%# (Container.NamingContainer.NamingContainer as RepeaterItem).ItemIndex %>_<%# Container.ItemIndex %>"
                                    class="EformSectionComponent">
                                    <asp:PlaceHolder runat="server" ID="ComponentHolder"></asp:PlaceHolder>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div id="EformDebugLayer" class="EformDisplayLayer">
            <asp:TextBox runat="server" ID="EformDebug" TextMode="MultiLine" Width="95%" Height="95%"></asp:TextBox>
        </div>
    </div>

    <script type="text/javascript">
        /* <![CDATA[ */

        fixImgPaths();

        /* ]]> */
    </script>

    </form>
</body>
</html>
