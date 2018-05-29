<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LetterOfIntentEditorGI.ascx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.LetterOfIntentEditorGI" %>
<%@ Register TagPrefix="spaw" Namespace="Solmetra.Spaw2" Assembly="Solmetra.Spaw2" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>

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
</style>
<table runat="server" cellpadding="0" cellspacing="0" style="table-layout: fixed;
    width: 95%; margin: 10px auto 25px auto; vertical-align: top;" id="MainTable">
    <tr>
        <td>
            <div id="ProjectContainerModal" style="position: absolute; z-index: 5; background-color: #000000;
                width: 100%; margin: 0; padding: 0; height: 300px; top: 0px; left: 0px; display: none;">
            </div>
        </td>
    </tr>
    <tr>
        <td style="font-weight: bold; font-size: 13px; color: #000000;" colspan="4">
            General Information<br />
            <table cellpadding="4" cellspacing="0" style="border: solid 1px #999999; width: 100%; font-weight: normal;" >
                <tr>
                    <td style="width: 15%;" >
                        <label for="LOINumber" title="LOI Number">
                            LOI Number</label>
                    </td>
                    <td style="width: 35%;">
                        <cc:CaisisTextBox ID="LOINumber" runat="server" CssClass="UnselectedField" ShowLabel="false"
                            Table="ProjectLetterOfIntent" Field="LOINumber" MaxLength="50"></cc:CaisisTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;" >
                        <label for="CreationDate" title="Creation Date">
                            Creation Date</label>
                    </td>
                    <td style="width: 35%;">
                        <cc:CaisisTextBox ID="CreationDate" runat="server" CssClass="UnselectedField" ShowLabel="false"
                            Table="ProjectLetterOfIntent" Field="CreationDate" ShowCalendar="true"></cc:CaisisTextBox>
                    </td>
                    <td  style="width: 15%;" >
                        <label for="ParticipatingCenters" title="Presenting Center">
                            Presenting Center</label>
                    </td>
                    <td style="width: 35%;">
                        <cc:CaisisComboBox ID="ParticipatingCenters" runat="server" CssClass="UnselectedField"
                            ShowLabel="false" Table="ProjectLetterOfIntent" Field="ParticipatingCenters" MaxLength="255"
                            LookupDistinct="ProjectOrganization; Name; OrganizationId"></cc:CaisisComboBox>
                    </td>
                </tr>
                
                    <tr>
                    <td >
                        <label for="AgentSource" title="Agent Source">
                            Agent Source</label>
                    </td>
                    <td >
                        <cc:CaisisTextBox ID="AgentSource" runat="server" CssClass="UnselectedField" ShowLabel="false"
                            Table="ProjectLetterOfIntent" Field="AgentSource" MaxLength="50"></cc:CaisisTextBox>
                    </td>
                    <td >
                        <label for="SampleSize" title="Sample Size">
                            Sample Size</label></td>
                    <td >
                        <cc:CaisisTextBox ID="SampleSize" runat="server" CssClass="UnselectedField" ShowLabel="false"
                            Table="ProjectLetterOfIntent" Field="SampleSize"></cc:CaisisTextBox></td>
                </tr>
                
                  <tr>
                    <td >
                        <label for="INDHolder" title="IND Holder">
                            IND Holder</label>
                    </td>
                    <td >
                        <cc:CaisisComboBox ID="INDHolder" runat="server" CssClass="UnselectedField" ShowLabel="false"
                            Table="ProjectLetterOfIntent" Field="INDHolder" MaxLength="50" LookupDistinct="ProjectOrganization; Name; OrganizationId">
                        </cc:CaisisComboBox>
                    </td>
                    <td >
                        <label for="INDNumber" title="IND Number">
                            IND Number</label>
                    </td>
                    <td >
                        <cc:CaisisTextBox ID="INDNumber" runat="server" CssClass="UnselectedField" ShowLabel="false"
                            Table="ProjectLetterOfIntent" Field="INDNumber" MaxLength="50"></cc:CaisisTextBox>
                    </td>
                </tr>
            </table>   
        </td>
    </tr>
</table>
