<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProjectViewOrgNav.ascx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectViewOrgNav" %>
<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<table class="ProjectNav" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td>
            <a id="Summary" class="SelectedNavigation" href="ProjectSummary.aspx?projectId=<%= ProjectId %>&organizationId=<%= OrganizationId %>"
                target="ContentPage" onclick="setActiveNavLink(this);" style="line-height: normal;">
                <span style="font-size: smaller;">Summary for</span><br />
                <asp:Label runat="server" ID="OrganizationLabel"></asp:Label>
            </a>
        </td>
    </tr>
    <tr>
        <td style="height: 8px;">
            <img src="Images/shim.gif" /></td>
    </tr>
    <tr>
        <td style="border-bottom: solid 1px #cccccc; background-image: url(Images/GrayStageNavBG.gif);
            background-position: 60px 11px; background-repeat: no-repeat; padding-bottom: 0px;">
            <a runat="server" id="StagesLink" style="margin-bottom: 0px; display: inline;">Stages</a>
            <table width="100%">
                <asp:Repeater runat="server" ID="ProjectStagesRptr" OnItemDataBound="SetStageItems">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <a id="StageLink<%# Eval("StageId") %>" href="<%= this.ResolveUrl("../EditProjectStageEvents.aspx") %>?projectId=<%# ProjectId %>&amp;organizationId=<%# Eval("OrganizationId") %>&amp;stageId=<%# Eval("stageId") %>"
                                    style="font-size: 10px; margin-bottom: 0px;" target="ContentPage" title="<%# Eval("Name") %>"
                                    onclick="setActiveNavLink(this);" class="StageLink">
                                    <asp:Panel runat="server" ID="StageColorBlock" CssClass="StageColorBlock">
                                    </asp:Panel>
                                    <asp:Label runat="server" ID="StageName" CssClass="StageNameMenuItem"></asp:Label>
                                </a>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </td>
    </tr>
    <tr>
        <td style="height: 8px;">
            <img src="Images/shim.gif" /></td>
    </tr>
    <tr>
        <td>
            <a id="Organizations" href="ProjectOrgs.aspx?projectId=<%= ProjectId %>&amp;organizationId=<%= OrganizationId %>"
                target="ContentPage" onclick="setActiveNavLink(this);">Organizations</a>
        </td>
    </tr>
    <tr>
        <td>
            <a id="Contacts" href="ProjectContacts.aspx?projectId=<%= ProjectId %>&amp;FilterBy=Organization&amp;FilterID=<%= OrganizationId %>"
                target="ContentPage" onclick="setActiveNavLink(this);">Contacts</a>
        </td>
    </tr>
    <tr>
        <td>
            <a runat="server" id="Funding" target="ContentPage" onclick="setActiveNavLink(this);">
                Funding</a>
        </td>
    </tr>
    <tr>
        <td>
            <a id="Manuscripts" href="ProjectManuscript.aspx?projectId=<%= ProjectId %>" target="ContentPage"
                onclick="setActiveNavLink(this);">Manuscripts</a>
        </td>
    </tr>
</table>
