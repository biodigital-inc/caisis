<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditAssociatedContacts.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.EditAssociatedContacts" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Associated Contacts</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
    // Keeps the heights of select boxes containers
    Browser.ResizeElement( { customResizer: doResize } );

    function doResize(w,h)
    {
        h = getHeight(window);
        $('FromContacts').style.height = Math.max(100,h - 135) + 'px';
        $('ToContacts').style.height = Math.max(100,h - 135) + 'px'; 
        $('NewContactFrame').style.height = Math.max(100,h - 75) + 'px';
    }
    
    function handleAddContactClick(btn)
    {
        var associateTable = $('AssociateTable')
        if(associateTable.isHidden())
        {
            window.location = window.location;
        }
        else
        {
//            associateTable.hide('none');
            var addNewPage =  $('NewContactFrame');
            var url = '<%= Page.ResolveUrl("ProjectContactsDetails.aspx") %>?projectId=<%= projectId %>&contactId=-1&edit=true';
            
            return showEditDetailsInModal(url,'Add New Contact',900,660);

            
//            addNewPage.show('');
//            addNewPage.src = url;
        }
        return false;
    }
    
    function onRecordSave(orgId)
    {
        window.location = window.location;
    }
    
    </script>

    <style type="text/css">
    .MultiSelect
    {
        width: 100%;
    }
    select[disabled='disabled']
    {
        color: #000000;
        background-color: #999999;
    }
    .MovingSelect
    {
        color: #666666;
        background-color: #ffffff;
        border-style: none;
        width: 100%;
        height: 375px;
        color: #333333;
        border: 1px solid #666666;
    }
    .DisabledMovingSelect
    {
        color: #000000;
        background-color: #E0EBF1;
    }
    
    #FromContainer
    {
        float: left;
    }
    #ToContainer 
    {
        float: right;
    }
    .MoveButton
    {
        display: block;
        margin: auto;
        text-align: center;
        vertical-align: middle;
        margin-top: 10px;
    }
    .SelectHeader
    {
        background-color: #00668d;
        color: #ffffff;
        font-family: Arial, Verdana, Helvetica, sans-serif;
        font-weight: bold;
        font-size: 11px;
        padding: 4px;
        padding-left: 10px;
        text-align: left;
        display: block;
     }
     #AddNewItemBtn
     {
        margin-top: 0px;
        width: 225px;
     }
     #BtnRow
     {
        clear: both;
     }
     .blankGridRow
     {
        background-color: #cccccc;
     }
    </style>
</head>
<body style="background-color: #ffffff;">
    <form id="form1" runat="server">
        
        <table id="AssociateTable" style="table-layout: fixed; width: 90%; margin: auto;
            border-style: none; margin-top: 8px;" border="0" cellpadding="4">
            <tr>
                <td>
                    <span class="SelectHeader">Contacts</span>
                    <asp:Panel runat="server" ID="FromContactsPanel">
                        <select id="FromContacts" name="FromContacts" multiple="multiple" class="MovingSelect">
                            <asp:Repeater runat="server" ID="FromContactsOrgRptr" OnItemDataBound="OnFromOrganizationsBound">
                                <ItemTemplate>
                                    <optgroup label="<%# Eval("Name")%>" title="<%# Eval("Name")%>">
                                        <asp:Repeater runat="server" ID="SingleContactsRptr">
                                            <ItemTemplate>
                                                <option title="<%# Eval("Name")%>" label="<%# Eval("Name")%>" value="<%# Eval("ContactId")%>">
                                                    <%# Eval("Name")%>
                                                </option>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </optgroup>
                                </ItemTemplate>
                            </asp:Repeater>
                        </select>
                    </asp:Panel>
                </td>
                <td style="width: 110px;">
                    <asp:ImageButton ID="Button1" runat="server" OnClick="OnAddClick" CssClass="MoveButton"
                        ImageUrl="Images/AssignBtn.gif" OnClientClick="return true; onMoveBtnClick('add');"
                        AlternateText="Add" />
                    <asp:ImageButton ID="Button2" runat="server" OnClick="OnRemoveClick" CssClass="MoveButton"
                        ImageUrl="Images/RemoveBtn.gif" OnClientClick="return true; onMoveBtnClick('remove');"
                        AlternateText="Remove" />
                </td>
                <td>
                    <span class="SelectHeader">Participating Contacts</span>
                    <asp:Panel runat="server" ID="ToContactsPanel">
                        <select id="ToContacts" name="ToContacts" multiple="multiple" class="MovingSelect">
                            <asp:Repeater runat="server" ID="ToContactsOrgRptr" OnItemDataBound="OnContactsOrgBind">
                                <ItemTemplate>
                                    <optgroup label="<%# Eval("Name")%>" title="<%# Eval("Name")%>">
                                        <asp:Repeater runat="server" ID="SingleContactsRptr">
                                            <ItemTemplate>
                                                <option title="<%# Eval("LastName")%>, <%# Eval("FirstName")%>" label="<%# Eval("LastName")%>, <%# Eval("FirstName")%>"
                                                    value="<%# Eval("ContactId")%>">
                                                    <%# Eval("LastName")%>
                                                    ,
                                                    <%# Eval("FirstName")%>
                                                </option>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </optgroup>
                                </ItemTemplate>
                            </asp:Repeater>
                        </select>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    * Hold <span style="font-style: italic; font-weight: bold;">ctrl</span> to select
                    multiple values.</td>
            </tr>
        </table>
        <div style="margin: 10px auto 10px auto;">
            <iframe id="NewContactFrame" name="NewContactFrame" style="width: 100%; height: 400px;
                display: none; margin: auto; border-style: none;" frameborder="0"></iframe>
        </div>
        <div style="text-align: center;">
            <project:ProjectMgmtButton runat="server" ID="CancelBtn" OnClientClick="top.hideModal();"
                ImageUrl="Images/Button_Cancel.gif" ToolTip="Cancel" Style="margin-right: 40px;" />
            <project:ProjectMgmtButton runat="server" ID="AddContactBtn" UserTypeNames="ModuleAdmin"
                ImageUrl="Images/Button_NewContact.gif" ToolTip="Add A New Contact" OnClientClick="return handleAddContactClick(this);" />
        </div>
    </form>
</body>
</html>
