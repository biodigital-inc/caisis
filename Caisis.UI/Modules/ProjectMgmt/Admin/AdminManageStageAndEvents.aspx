<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminManageStageAndEvents.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.AdminManageStageAndEvents" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Stages And Events</title>
    <link href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
     Browser.ResizeElement( { nodeId: 'TreeHolder', heightOffset: 295, context: window} );
     Browser.ResizeElement( { nodeId: 'LookupOverflow', heightOffset: 325, context: window } );
         
     function showHideRelationship(span,childId,type)
     {
        var viewText = 'View Associated ' + type;
        var hideText = 'Hide Associated ' + type;
        if($(childId).isHidden()) { span.innerHTML = 'hide'; }
        else { span.innerHTML = 'show'; }
        showHideOptionalFields(span,childId,null,null,viewText,hideText);
     }
     
     function doDelete()
     {
        return confirmDelete('Are you sure you want to remove this Lookup Code?');
     }
     
    </script>

    <style type="text/css">
    .LookupCode
    {
        width: 175px;
    }
    .LkpOrder
    {
        width: 20px;
    }
    .LkpNavBtn
    {
        font-weight: bold;
        font-size: 12px;
        text-align: right;
        display: block;
        margin: 5px 10px 5px auto;
    }
    .ShowHideBtn
    {
        cursor: pointer;
        text-decoration: underline;
        font-weight: bold;
        color: #00668d;
        font-size: 10px;
    }
    .LkpCodeText
    {
        font-weight: bold; 
        font-size: 12px;
    }
    ol.ChildLkpRelation
    {
        list-style-type:  decimal;
        border: 1px solid #999999;
        background-color: #fffccc;
    } 
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="ColorAttributeId" />
        <asp:HyperLink runat="server" ID="BackBtn" Text="Back" Visible="false"></asp:HyperLink>
        <!-- A List of Columns With LookupCode Parent/Child Relationships -->
        <div id="TreePanel" runat="server">
            <span style="display: block; text-align: center; margin-bottom: 10px;"><a class="LkpNavBtn"
                href="?view=edit" title="Edit Stages, Events &amp; Attributes" style="display: inline;
                margin-right: 0px;">
                <img src="../Images/StagesRelationshipsToggle_EditStagesOff.png" style="border: none;" /></a><img
                    src="../Images/StagesRelationshipsToggle_EditRelationshipsOn.png" /></span>
            <table cellpadding="0" cellspacing="0" border="0" style="table-layout: fixed; width: 95%;
                margin: auto;">
                <tr class="BlueListBar">
                    <td class="BlueListBar" style="width: 2%;">
                        <img src="../Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;" /></td>
                    <td class="BlueListBar">
                        <span style="font-weight: bold; font-size: 12px; margin-top: 10px;">Project > Stages</td>
                    <td class="BlueListBar">
                        <span style="font-weight: bold; font-size: 12px; margin-top: 10px;">Stages > Events</td>
                    <td class="BlueListBar">
                        <span style="font-weight: bold; font-size: 12px; margin-top: 10px;">Events > Attributes</td>
                    <td class="BlueListBar" style="width: 2%; text-align: right;">
                        <img src="../Images/HeaderBarBlueRight.gif" width="6" height="35" align="right" /></td>
                </tr>
            </table>
            <!-- Overflow Container for Relationships -->
            <div id="TreeHolder" style="overflow: auto; width: 95%; margin: auto; height: 400px; background-color: #ffffff;
                color: #000000; border: 1px solid #333333;">
                <table style="width: 95%; table-layout: fixed; margin: auto;">
                    <tr>
                        <td valign="top">
                            <div style="vertical-align: top;">
                                <ul>
                                    <asp:Repeater runat="server" ID="CurrentProjectTypesRptr">
                                        <ItemTemplate>
                                            <li><span class="LkpCodeText">
                                                <%# Eval("LkpCode") %>
                                            </span><span title="View Associated Stages" class="ShowHideBtn" onclick="showHideRelationship(this,'<%# Eval("LookupCodeId") %>','Stages');">
                                                show</span>
                                                <asp:HiddenField runat="server" ID="ParentLookupCodeId" />
                                                <ol class="ChildLkpRelation" id="<%# Eval("LookupCodeId") %>" style="display: none;">
                                                    <asp:Repeater runat="server" ID="CurrentItemsRptr" OnItemDataBound="SetLkpCodeNames">
                                                        <ItemTemplate>
                                                            <li>
                                                                <asp:HiddenField runat="server" ID="LookupCodeId" />
                                                                <asp:CheckBox runat="server" ID="CurrentItemCheckBox" OnCheckedChanged="UpdateLookupRelationship" />
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ol>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </td>
                        <td valign="top">
                            <div style="vertical-align: top;">
                                <ul>
                                    <asp:Repeater runat="server" ID="CurrentStagesRptr">
                                        <ItemTemplate>
                                            <li><span class="LkpCodeText">
                                                <%# Eval("LkpCode") %>
                                            </span><span title="View Associated Events" class="ShowHideBtn" onclick="showHideRelationship(this,'<%# Eval("LookupCodeId") %>','Events');">
                                                show</span>
                                                <asp:HiddenField runat="server" ID="ParentLookupCodeId" />
                                                <ol class="ChildLkpRelation" id="<%# Eval("LookupCodeId") %>" style="display: none;">
                                                    <asp:Repeater runat="server" ID="CurrentItemsRptr" OnItemDataBound="SetLkpCodeNames">
                                                        <ItemTemplate>
                                                            <li>
                                                                <asp:HiddenField runat="server" ID="LookupCodeId" />
                                                                <asp:CheckBox runat="server" ID="CurrentItemCheckBox" OnCheckedChanged="UpdateLookupRelationship" />
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ol>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </td>
                        <td valign="top">
                            <div style=" vertical-align: top;">
                                <ul>
                                    <asp:Repeater runat="server" ID="CurStageEventsRptr">
                                        <ItemTemplate>
                                            <li><span class="LkpCodeText">
                                                <%# Eval("LkpCode") %>
                                            </span><span title="View Associated Attributes" class="ShowHideBtn" onclick="showHideRelationship(this,'<%# Eval("LookupCodeId") %>','Attributes');">
                                                show</span>
                                                <asp:HiddenField runat="server" ID="ParentLookupCodeId" />
                                                <ol class="ChildLkpRelation" id="<%# Eval("LookupCodeId") %>" style="display: none;">
                                                    <asp:Repeater runat="server" ID="CurrentItemsRptr" OnItemDataBound="SetLkpCodeNames">
                                                        <ItemTemplate>
                                                            <li>
                                                                <asp:HiddenField runat="server" ID="LookupCodeId" />
                                                                <asp:CheckBox runat="server" ID="CurrentItemCheckBox" OnCheckedChanged="UpdateLookupRelationship" />
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ol>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:ImageButton ID="SaveRelationshipsBtn" OnClick="SaveRelationships" runat="server"
                ImageUrl="../Images/Button_Update.gif" ToolTip="Update Relationships" Style="float: right;
                margin-right: 100px; margin-top: 6px;" />
        </div>
        <!-- Panel to Edit Lookup Codes for ProjectTypes, Stages, Events, and EventAttributes -->
        <div runat="server" id="EditPanel" style="width: 95%; margin: auto;">
            <span style="display: block; text-align: center; margin-bottom: 10px;">
                <img src="../Images/StagesRelationshipsToggle_EditStagesOn.png" /><a class="LkpNavBtn"
                    href="?view=tree" title="Edit Relationships" style="display: inline;"><img src="../Images/StagesRelationshipsToggle_EditRelationshipsOff.png"
                        style="cursor: pointer; border: none;" /></a></span>
            <!-- Header Table -->
            <table cellpadding="0" cellspacing="0" border="0" style="table-layout: fixed; width: 100%;
                margin: auto;">
                <tr class="BlueListBar">
                    <td class="BlueListBar" style="width: 2%;">
                        <img src="../Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;" /></td>
                    <td class="BlueListBar">
                        <span style="font-weight: bold; font-size: 12px; margin-top: 10px;">Project Type</td>
                    <td class="BlueListBar">
                        <span style="font-weight: bold; font-size: 12px; margin-top: 10px;">Stages</td>
                    <td class="BlueListBar">
                        <span style="font-weight: bold; font-size: 12px; margin-top: 10px;">Events</td>
                    <td class="BlueListBar">
                        <span style="font-weight: bold; font-size: 12px; margin-top: 10px;">Event Attributes</td>
                    <td class="BlueListBar" style="width: 2%; text-align: right;">
                        <img src="../Images/HeaderBarBlueRight.gif" width="6" height="35" align="right" /></td>
                </tr>
            </table>
            <div id="LookupOverflow" style="background-color: #ffffff; border: 1px solid #cccccc;
                overflow: auto; height: 420px; width: 100%;">
                <table style="width: 95%; table-layout: fixed; margin: auto;" border="0">
                    <tbody>
                        <tr>
                            <td valign="top">
                                <custom:ExtendedGridView runat="server" ID="ProjectTypeGrid" TableName="LookupCodes"
                                    DataKeyNames="LookupCodeId" AutoGenerateColumns="false" Width="100%" OnRowUpdating="HandleLookupUpdate"
                                    ShowHeader="false" GridLines="None">
                                    <Columns>
                                        <custom:ExtendedTemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/iconDelete.gif"
                                                    ToolTip="Delete" OnCommand="HandleLookupDeleteClick" CommandArgument='<%# Eval("LookupCodeId") %>'
                                                    OnClientClick="return doDelete();" />
                                            </ItemTemplate>
                                        </custom:ExtendedTemplateField>
                                        <custom:ExtendedTemplateField>
                                            <ItemTemplate>
                                                <cc:CaisisTextBox runat="server" ID="LookupCode" CssClass="LookupCode" Table="LookupCodes"
                                                    Field="LkpCode" ShowLabel="False" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                                                <cc:CaisisTextBox runat="server" ID="LkpOrder" CssClass="LkpOrder" Table="LookupCodes"
                                                    Field="LkpOrder" ShowLabel="False" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                                            </ItemTemplate>
                                        </custom:ExtendedTemplateField>
                                    </Columns>
                                </custom:ExtendedGridView>
                            </td>
                            <td valign="top">
                                <custom:ExtendedGridView runat="server" ID="StagesGrid" TableName="LookupCodes" DataKeyNames="LookupCodeId"
                                    AutoGenerateColumns="false" Width="100%" OnRowUpdating="HandleLookupUpdate" OnRowDataBound="SetColorBox"
                                    ShowHeader="false" GridLines="None">
                                    <Columns>
                                        <custom:ExtendedTemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/iconDelete.gif"
                                                    ToolTip="Delete" OnCommand="HandleLookupDeleteClick" CommandArgument='<%# Eval("LookupCodeId") %>'
                                                    OnClientClick="return doDelete();" />
                                            </ItemTemplate>
                                        </custom:ExtendedTemplateField>
                                        <custom:ExtendedTemplateField ItemStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:HiddenField runat="server" ID="ColorCode" OnValueChanged="SaveStage" />
                                                <asp:HiddenField runat="server" ID="LookupCodeAttributeId" />
                                                <asp:HiddenField runat="server" ID="LookupCodeId" />
                                                <asp:Label runat="server" ID="ColorCodeBox" CssClass="ColorCodeBox"><img src="../Images/shim.gif" /></asp:Label>
                                            </ItemTemplate>
                                        </custom:ExtendedTemplateField>
                                        <custom:ExtendedTemplateField>
                                            <ItemTemplate>
                                                <cc:CaisisTextBox runat="server" ID="LookupCode" CssClass="LookupCode" Table="LookupCodes"
                                                    Field="LkpCode" ShowLabel="False" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                                                <cc:CaisisTextBox runat="server" ID="LkpOrder" CssClass="LkpOrder" Table="LookupCodes"
                                                    Field="LkpOrder" ShowLabel="False" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                                            </ItemTemplate>
                                        </custom:ExtendedTemplateField>
                                    </Columns>
                                </custom:ExtendedGridView>
                            </td>
                            <td valign="top">
                                <custom:ExtendedGridView runat="server" ID="EventsGrid" TableName="LookupCodes" DataKeyNames="LookupCodeId"
                                    AutoGenerateColumns="false" Width="100%" OnRowUpdating="HandleLookupUpdate" ShowHeader="false"
                                    GridLines="None">
                                    <Columns>
                                        <custom:ExtendedTemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/iconDelete.gif"
                                                    ToolTip="Delete" OnCommand="HandleLookupDeleteClick" CommandArgument='<%# Eval("LookupCodeId") %>'
                                                    OnClientClick="return doDelete();" />
                                            </ItemTemplate>
                                        </custom:ExtendedTemplateField>
                                        <custom:ExtendedTemplateField>
                                            <ItemTemplate>
                                                <cc:CaisisTextBox runat="server" ID="LookupCode" CssClass="LookupCode" Table="LookupCodes"
                                                    Field="LkpCode" ShowLabel="False" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                                                <cc:CaisisTextBox runat="server" ID="LkpOrder" CssClass="LkpOrder" Table="LookupCodes"
                                                    Field="LkpOrder" ShowLabel="False" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                                            </ItemTemplate>
                                        </custom:ExtendedTemplateField>
                                    </Columns>
                                </custom:ExtendedGridView>
                            </td>
                            <td valign="top">
                                <custom:ExtendedGridView runat="server" ID="AttributesGrid" TableName="LookupCodes"
                                    DataKeyNames="LookupCodeId" AutoGenerateColumns="false" Width="100%" OnRowUpdating="HandleLookupUpdate"
                                    ShowHeader="false" GridLines="None">
                                    <Columns>
                                        <custom:ExtendedTemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/iconDelete.gif"
                                                    ToolTip="Delete" OnCommand="HandleLookupDeleteClick" CommandArgument='<%# Eval("LookupCodeId") %>'
                                                    OnClientClick="return doDelete();" />
                                            </ItemTemplate>
                                        </custom:ExtendedTemplateField>
                                        <custom:ExtendedTemplateField>
                                            <ItemTemplate>
                                                <cc:CaisisTextBox runat="server" ID="LookupCode" CssClass="LookupCode" Table="LookupCodes"
                                                    Field="LkpCode" ShowLabel="False" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                                                <cc:CaisisTextBox runat="server" ID="LkpOrder" CssClass="LkpOrder" Table="LookupCodes"
                                                    Field="LkpOrder" ShowLabel="False" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                                            </ItemTemplate>
                                        </custom:ExtendedTemplateField>
                                    </Columns>
                                </custom:ExtendedGridView>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- Add New Lookup Codes Field -->
            <table style="table-layout: fixed; width: 100%; border: 1px solid #cccccc; background-color: #cccccc;">
                <tr>
                    <td>
                        <cc:CaisisTextBox runat="server" CssClass="LookupCode" ID="ProjectTypeLkpCode" ShowLabel="False"
                            FieldLabel="ProjectType" OnTextChanged="AddLookupCode" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                        <cc:CaisisTextBox runat="server" ID="ProjectTypeLkpOrder" CssClass="LkpOrder" Table="LookupCodes"
                            Field="LkpOrder" ShowLabel="False" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                    </td>
                    <td>
                        <asp:HiddenField runat="server" ID="NewColorCode" />
                        <span class="ColorCodeBox" onclick="showColorPicker('<%=NewColorCode.ClientID %>',this,event);">
                        </span>
                        <cc:CaisisTextBox runat="server" CssClass="LookupCode" ID="StageLkpCode" ShowLabel="False"
                            FieldLabel="ProjectStages" OnTextChanged="AddLookupCode" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                        <cc:CaisisTextBox runat="server" ID="ProjectStagesLkpOrder" CssClass="LkpOrder" Table="LookupCodes"
                            Field="LkpOrder" ShowLabel="False" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                    </td>
                    <td>
                        <cc:CaisisTextBox runat="server" CssClass="LookupCode" ID="StageEventsLkpCode" ShowLabel="False"
                            FieldLabel="ProjectStageEvents" OnTextChanged="AddLookupCode" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                        <cc:CaisisTextBox runat="server" ID="ProjectStageEventsLkpOrder" CssClass="LkpOrder"
                            Table="LookupCodes" Field="LkpOrder" ShowLabel="False" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                    </td>
                    <td>
                        <cc:CaisisTextBox runat="server" CssClass="LookupCode" ID="EventAttributesLkpCode"
                            FieldLabel="ProjectEventAttributes" OnTextChanged="AddLookupCode" ShowLabel="False"
                            onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                        <cc:CaisisTextBox runat="server" ID="ProjectEventAttributesLkpOrder" CssClass="LkpOrder"
                            Table="LookupCodes" Field="LkpOrder" ShowLabel="False" onkeypress="return (event.keyCode!=13);"></cc:CaisisTextBox>
                    </td>
                </tr>
            </table>
            <asp:ImageButton runat="server" OnClick="HandleUpdateLookupCodesClick" ToolTip="Update Stages, Events &amp; Attributes"
                ImageUrl="../Images/Button_Update.gif" Style="float: right; margin-right: 100px;
                margin-top: 6px;" />
        </div>
    </form>
</body>
</html>
