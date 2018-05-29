<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NotesPage.aspx.cs" Inherits="Caisis.UI.Plugins.Plugins_StickyNote_NotesPage" %>

<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
    function validateNote()
    {
        var noteValue = document.getElementById('<%=StickyNoteTextArea.ClientID %>').value;
        if(noteValue == '')
        {
           alert("Please enter a note before saving...");
           return false;
        }
        else
        {
            parent.closeSticky();
            return true;
        }
    }
    
    
    
    </script>

    <style type="text/css">
    label
    {
        font-weight: bold;
    }
    </style>
</head>
<body style="background-image: url(Images/Sticky_BG.png); background-repeat: no-repeat;
    background-position: -14px -20px;">
    <form id="form1" runat="server">
        <asp:HiddenField ID="NotificationId" runat="server" />
        <table cellspacing="3" cellpadding="0" width="97%" border="0" style="margin-left: 10px;
            margin-right: 10px;">
            <tr>
                <td style="font-family: Arial; font-size: 13px; color: #8d2a2c;">
                    <asp:Image Visible="false" ID="previousBtn" ImageUrl="Images/Button_PreviousNote.gif"
                        runat="server" Style="margin-left: 0px; margin-right: 6px; vertical-align: middle;
                        cursor: pointer;" ToolTip="Previous Note" /><asp:Label ID="StickyNotePageTitle" runat="server"
                            Style="font-size: 12px; color: #8d2a2c; font-weight: bold;">New Sticky Note </asp:Label><asp:Label
                                ID="NotesPaging" runat="server" Style="font-size: 12px; color: #8d2a2c; font-weight: bold;"></asp:Label><asp:Image
                                    Visible="false" ID="nextBtn" ImageUrl="Images/Button_NextNote.gif" runat="server"
                                    Style="margin-left: 6px; vertical-align: middle; cursor: pointer;" ToolTip="Next Note" /><asp:Image
                                        runat="server" ID="NewBtn" ImageUrl="Images/Button_NewNote.gif" Style="margin-left: 12px;
                                        vertical-align: middle; cursor: pointer;" ToolTip="Add New Note" Visible="false" /></td>
            </tr>
            <tr>
                <td align="left" id="RecordReferencedRow" runat="server" visible="true">
                    <caisis:CaisisCheckBox ID="RecordReferenced" Visible="false" ShowLabel="false" runat="server" />
                    <asp:Literal ID="RecordReferencedTitle" runat="server" /><img src="../../images/shim.gif"
                        width="1" height="15" /></td>
            </tr>
            <tr>
                <td valign="top">
                    <caisis:CaisisTextArea Wrap="true" ID="StickyNoteTextArea" ShowLabel="false" Style="font-size: 15px;
                        height: 160px; width: 100%; border: solid 1px #E5E0B4; background-color: Transparent;
                        color: #111111; font-weight: bold;" runat="server" ShowTextEditor="false"></caisis:CaisisTextArea></td>
            </tr>
            <tr>
                <td valign="top" style="padding: 10px; padding-top: 8px;">
                    <table cellpadding="2" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td valign="top" style="padding-top: 4px;">
                                <label for="NotifyWho" title="Assign to">
                                    Assign to</label></td>
                            <td>
                                <caisis:CaisisSelect Style="width: 150px;" ID="NotifyWho" ShowLabel="false" runat="server" /></td>
                            <td style="text-align: right;">
                                <caisis:CaisisCheckBox ID="NotifyBy" ShowLabel="false" runat="server" />
                                <label for="NotifyBy" title="Notify by email">
                                    Notify by email</label></td>
                        </tr>
                        <tr>
                            <td valign="top" style="font-weight: bold; padding-top: 4px;">
                                <label for="Reason" title="Reason">
                                    Reason</label></td>
                            <td colspan="2">
                                <caisis:CaisisSelect Style="width: 150px;" ID="Reason" ShowLabel="false" LookupCode="StickyNoteReasons"
                                    runat="server" /></td>
                        </tr>
                        <tr>
                            <td valign="top" style="font-weight: bold; padding-top: 4px;">
                                <label for="Response" title="Response">
                                    Response</label>
                            </td>
                            <td colspan="2">
                                <caisis:CaisisSelect Style="width: 150px;" ID="Response" ShowLabel="false" LookupCode="StickyNoteResponse"
                                    runat="server" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 5px; padding-top: 20px;">
                    <asp:ImageButton ID="SubmitStickyBtn" ImageUrl="Images/Button_SaveNote.gif" runat="server"
                        OnCommand="SaveSticky" ToolTip="Save Note" OnClientClick="return validateNote();"
                        Style="float: right; padding-right: 10px;" />
                    <div>
                        Noted by:
                        <asp:Label ID="NotedBy" runat="server"></asp:Label></div>
                    <div>
                        Updated by:
                        <asp:Label ID="UpdatedBy" runat="server"></asp:Label></div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
