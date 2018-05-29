<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProjectApprovalEditor.ascx.cs" 
Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectApprovalEditor" %>

<%@ Register TagPrefix="spaw" Namespace="Solmetra.Spaw2" Assembly="Solmetra.Spaw2" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="diseaseState" TagName="DiseaseEditor" Src="DiseaseState.ascx" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<table runat="server" style="table-layout: fixed; width: 95%; margin: 10px auto 25px auto; vertical-align: top;"
    id="MainTable">
    <tr>
        <td>
            <div id="ProjectContainerModal" style="position: absolute; z-index: 5; background-color: #000000;
                width: 100%; margin: 0; padding: 0; height: 300px; top: 0px; left: 0px; display: none;">
            </div>
        </td>
    </tr>
    <tr>
        <td style="width: 25%;">
            <label for="CreationDate" title="Creation Date">
                Creation Date</label>
        </td>
        <td style="width: 25%;">
            <cc:CaisisTextBox ID="CreationDate" runat="server" CssClass="UnselectedField" ShowLabel="false"
                Table="ProjectLetterOfIntent" Field="CreationDate" ShowCalendar="true"></cc:CaisisTextBox>
        </td>
    </tr>
    <tr>
        <td valign="top" colspan="1">
            <span title="Population Disease State">Population Disease State</span>
        </td>
        <td colspan="3">
            <diseaseState:DiseaseEditor ID="DiseaseStateEditor" runat="server" />
        </td>
    </tr>
</table>


