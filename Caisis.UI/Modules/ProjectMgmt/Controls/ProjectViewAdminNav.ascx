<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProjectViewAdminNav.ascx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectViewAdminNav" %>
<table class="ProjectNav" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td>
            <a id="Summary" class="SelectedNavigation" href="ProjectSummary.aspx?projectId=<%= ProjectId %>"
                target="ContentPage" title="Summary" onclick="setActiveNavLink(this);">Project Summary</a>
        </td>
    </tr>
    <tr>
        <td>
            <a runat="server" id="LOI" target="ContentPage" title="Letter Of Intent" onclick="setActiveNavLink(this);">
                Letter Of Intent</a>
        </td>
    </tr>
    <tr>
        <td>
            <a runat="server" id="LOIResponse" href="ProjectLOIResponse.aspx?projectId=<%= ProjectId %>"
                target="ContentPage" title="LOI Response" onclick="setActiveNavLink(this);">LOI
                Response</a>
        </td>
    </tr>
    <tr>
        <td>
            <a id="EditStages" href="<%= Page.ResolveUrl("Admin/AdminAddEditStageEvents.aspx") %>?projectId=<%= ProjectId %>&amp;isWizard=false" target="ContentPage"
                title="Edit Project Stages &amp; Events" onclick="setActiveNavLink(this);">Stages &amp; Events</a>
        </td>
    </tr>
    <tr>
        <td>
            <a id="CommunicationLog" href="ProjectCommunicationLogDetails.aspx?projectId=<%= ProjectId %>"
                target="ContentPage" onclick="setActiveNavLink(this);">Communication Log</a>
        </td>
    </tr>
    <tr>
        <td>
            <a id="Organizations" href="ProjectOrgs.aspx?projectId=<%= ProjectId %>" target="ContentPage"
                title="Organizations" onclick="setActiveNavLink(this);">Organizations</a>
        </td>
    </tr>
    <tr>
        <td>
            <a id="Contacts" href="ProjectContacts.aspx?projectId=<%= ProjectId %>&amp;FilterBy=Projects&amp;FilterID=<%= ProjectId %>"
                target="ContentPage" title="Contacts" onclick="setActiveNavLink(this);">Contacts</a>
        </td>
    </tr>
    <tr>
        <td>
            <a runat="server" id="Funding" target="ContentPage" title="Funding" onclick="setActiveNavLink(this);">
                Funding</a>
        </td>
    </tr>
    <tr>
        <td>
            <a id="Manuscripts" href="ProjectManuscript.aspx?projectId=<%= ProjectId %>" target="ContentPage"
                title="Manuscripts" onclick="setActiveNavLink(this);">Manuscripts</a>
        </td>
    </tr>
    <tr>
        <td>
            <a id="Accrual" href="ProjectAccrual.aspx?projectId=<%= ProjectId %>" target="ContentPage"
                title="Accrual" onclick="setActiveNavLink(this);">View Accrual</a>
        </td>
    </tr>
    <tr>
        <td style="height: 50px;">
            &nbsp;</td>
    </tr>
</table>
