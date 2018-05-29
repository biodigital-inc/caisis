<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="ProjectLOIDetails.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectLOIDetails" %>

<%@ Register TagPrefix="spaw" Namespace="Solmetra.Spaw2" Assembly="Solmetra.Spaw2" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="Custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Letter Of Intent Field Details</title>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="ProjectMgmtStyles.css" rel="stylesheet" type="text/css" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script type="text/javascript" src="ProjectMgmtScripts.js"></script>

    <style type="text/css">
        .LeftCell
        {
            padding-left: 5px;
            border-left: #999999 1px solid;
        }
        .RightCell
        {
            padding-left: 5px;
            border-right: #999999 1px solid;
        }
        .TopLeftCell
        {
            padding-left: 5px;
            padding-top: 5px;
            border-top: #999999 1px solid;
            border-left: #999999 1px solid;
        }
        .TopRightCell
        {
            padding-left: 5px;
            padding-top: 5px;
            border-top: #999999 1px solid;
            border-right: #999999 1px solid;
        }
        .BottomLeftCell
        {
            padding-left: 5px;
            border-bottom: #999999 1px solid;
            border-left: #999999 1px solid;
            padding-bottom: 5px;
        }
        .BottomRightCell
        {
            padding-left: 5px;
            border-right: #999999 1px solid;
            border-bottom: #999999 1px solid;
            padding-bottom: 5px;
        }
        .EntireCell
        {
            padding-top: 5px;
            border-top: #999999 1px solid;
            border-left: #999999 1px solid;
            border-bottom: #999999 1px solid;
            border-right: #999999 1px solid;
            padding-bottom: 5px;
        }
        .SingleLeftCell
        {
            padding-left: 5px;
            border-bottom: #999999 1px solid;
            border-top: #999999 1px solid;
            border-left: #999999 1px solid;
            padding-bottom: 5px;
        }
        .SingleRightCell
        {
            padding-left: 5px;
            border-right: #999999 1px solid;
            border-top: #999999 1px solid;
            border-bottom: #999999 1px solid;
            padding-bottom: 5px;
        }
        .CallBackSelect 
        {
            width: 150px;
            display: block;
        }
        .Error
        {
            border: 2px solid #8d2a2c;
            color: #8d2a2c;
            font-weight: bold;
            background-color: #EBE1E3; 
            padding: 5px;
        }
    </style>
</head>
<body style="background-color: #ffffff;">
    <form id="form1" runat="server">
        <asp:PlaceHolder ID="DynamicControlHolder" runat="server" />
        <div id="Holder" style="width: 600px; margin: auto; position: absolute;">
            <asp:Label ID="labelErrMsg" runat="server" Visible="false" CssClass="Error"></asp:Label>
            <br />
            <spaw:Editor ID="LOIField" runat="server" ToolbarSet="patiented" Height="350" FloatingMode="false"
                Resizable="false" ModeStripVisible="true">
            </spaw:Editor>
            <div style="text-align: right; width: 100%;">
                <asp:ImageButton ID="BtnSave" runat="server" ImageUrl="Images/Button_Save.gif" AlternateText="Update"
                    OnClick="BtnSave_Click" Style="margin-top: 5px;" />
            </div>
        </div>

        <script type="text/javascript">
        $('Holder').center();
        </script>

    </form>
</body>
</html>
