<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminEFormComponentViewer.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminEFormComponentViewer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EForm Component Viewer</title>
    <link type="text/css" rel="stylesheet" href="../StyleSheets/GlobalStyles.css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript">
    var transSet = false;
    
    function loadComponent(sel)
    {
        var opt = sel.options[sel.selectedIndex];
        var val = opt.value;
        var path = 'AdminEformComponentHolder.aspx?componentPath=' + val;
        var componentFrame = window.frames['ComponentFrame'];
        componentFrame.location.href = path;
        showComponentLayer();
    }
    
    function showComponentLayer()
    {
        var layer = $('LoadingLayer');
        var timer = $('LoadingTimer');
        var loadingTimerLeft =  ($('ComponentFrame').offsetWidth - 134)/2;
        timer.style.left = loadingTimerLeft + 'px';
        layer.style.display = 'block';
        setTransparencyForLoad(layer);
    }
    
    function hideComponentLayer()
    {
        var layer = $('LoadingLayer');
        layer.style.display = 'none';
        setTransparencyForLoad(layer);
    }
    
    function setTransparencyForLoad(layer)
    {
        if(!transSet)
        {
            var divs = layer.getElementsByTagName('DIV');
            var inc = 50;
            for(var i=0;i<divs.length-1;i++,inc+=10)
            {
                $(divs[i]).setTransparency(inc);
            }
        }
    }
    </script>

    <style type="text/css">
    #LoadingLayer
    {
        width: 100%; 
        height: 450px; 
        position: absolute; 
        z-index: 100;
        background-color: #ffffff; 
        display: none;
        text-align: center;
        font-weight: bold;
    }
    .LoadingBox
    {
        width: 16px; 
        height: 16px;
        background-color: #990000;
        border: 1px solid #666666; 
        float: left;
        margin: 2px;
    }
    </style>
</head>
<body class="AdminBody">
    <form id="form1" runat="server">
        <div>
            <h4>
                NOTES: You must load a patient before testing eform components. In addition, some
                components may appear slightly different as the are not contained in the eform section.</h4>
        </div>
        <div>
            <asp:DropDownList runat="server" ID="DiseasesList" AppendDataBoundItems="true" DataSourceID="ViewsXML"
                DataTextField="name" DataValueField="name" Width="200" AutoPostBack="true" OnSelectedIndexChanged="GetEformComponents">
                <asp:ListItem Text="" Value=""></asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList runat="server" ID="DiseaseComponents" AppendDataBoundItems="true"
                Width="200" onchange="loadComponent(this);">
                <asp:ListItem Text="" Value=""></asp:ListItem>
            </asp:DropDownList>
            <asp:XmlDataSource runat="server" ID="ViewsXML" DataFile="~/App_Data/ViewRegistry.xml"
                XPath="//view"></asp:XmlDataSource>
        </div>
        <div style="position: relative; clear: both;">
            <iframe runat="server" id="ComponentFrame" name="ComponentFrame" frameborder="0"
                style="width: 100%; height: 450px; overflow: auto; position: absolute; z-index: 99;"
                src="AdminEformComponentHolder.aspx"></iframe>
            <div id="LoadingLayer">
                <div id="LoadingTimer" style="width: 134px; position: absolute; top: 220px;">
                    <div class="LoadingBox">
                    </div>
                    <div class="LoadingBox">
                    </div>
                    <div class="LoadingBox">
                    </div>
                    <div class="LoadingBox">
                    </div>
                    <div class="LoadingBox">
                    </div>
                    <div class="LoadingBox">
                    </div>
                    <div style="clear: both;">
                        . . . L O A D I N G . . .</div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
