<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Patients_EditInstitutionsAndDiseases.aspx.cs"
    Inherits="Caisis.UI.Admin.Patients_EditInstitutionsAndDiseases" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="filter" TagName="SearchFilter" Src="~/Admin/ListFilter_Control.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Patient's Institutions and Diseases</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../ClientScripts/Admin.js"></script>

    <script type="text/javascript" src="../ClientScripts/PatientDataEntry.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery-ui.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        jQuery.noConflict();

        jQuery(document).ready(function() {

        });

        /* ]]> */
    </script>

    <style type="text/css">
        #SelectFormBox
        {
            margin-top: 10px;
        }
        #PatientsPanelContent
        {
            margin-top: 10px;
            margin-left: 250px;
        }
        #LetterSelection
        {
        }
        #LetterSelection a
        {
            display: inline-block;
            text-align: center;
            padding: 2px;
            margin: 2px;
            width: 15px;
            height: 15px;
            background-color: #ffffff;
            color: #333;
            border: 1px solid #cccccc;
            border-radius: 3px;
            text-decoration: none;
            font-weight: bold;
        }
        .adminBox
        {
            overflow: auto;
            min-height: 150px;
            max-height: 600px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <%-- Patient List --%>
    <asp:HiddenField runat="server" ID="EncPatientId" />
    <asp:PlaceHolder runat="server" ID="PatientSelectionPanel">
        <div id="SelectFormBox" class="adminNavBoxContainer" style="width: 230px;">
            <label class="adminNavBoxContainerTitle">
                Search By:
                <br />
                <cic:CaisisSelect runat="server" ID="SearchOptionsDropdown" DataTextField="DisplayName"
                    DataValueField="LkpCode" ShowLabel="false" ShowEmptyListItem="false">
                </cic:CaisisSelect>
            </label>
            <span class="adminNavBoxContainerTitle">Select A Patient</span>
            <div id="mainAdminBox" class="adminBox" style="margin-top: 0px;">                
                <filter:SearchFilter ID="PatientSearch" runat="server" ListId="PatientsList" LiveSearch="false"
                    OnDoClientSearch="DoSearch" />
                <div class="adminBoxNavListContainer" style="overflow-x: hidden;">
                    <ul id="PatientsList" class="adminBoxNavList">
                        <asp:Repeater runat="server" ID="PatientsRptr">
                            <ItemTemplate>
                                <li class="<%# EncPatientId.Value == Eval("EncPatientId").ToString() ? "selected" : "" %>">                                       
                                    <asp:LinkButton runat="server" OnCommand="EditPatient" CommandArgument='<%# Eval("PatientId") %>'>
                                        <div><%# Eval("PatientName")%></div>
                                        <div class="boldText"><%# Eval("Identifier") %></div>
                                    </asp:LinkButton>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
    <%-- TABS --%>
    <asp:PlaceHolder runat="server" ID="PatientsPanel" Visible="false">
        <div id="PatientsPanelContent">
            <span class="adminNavBoxContainerTitle" style="margin-right: 10px;">
                <asp:Label runat="server" ID="PtNameLabel"></asp:Label>
            </span>
            <div class="adminBox">
                <div class="EditDataEntryForm_ChildTable">
                    <div class="EditDataEntryForm_ChildTableTitleOuterContainer">
                        <span id="Tabs_Link_0" class="EditDataEntryForm_ChildTableTitleInnerContainer" onclick="setActiveDataEntryTab('Tabs',0);">
                            <span id="Tabs_Text_0" class="EditDataEntryForm_ChildTableTitle">Institutions</span></span>
                        <span id="Tabs_Link_1" class="EditDataEntryForm_ChildTableTitleInnerContainer dataEntryTabDisabled"
                            onclick="setActiveDataEntryTab('Tabs',1);"><span id="Tabs_Text_1" class="EditDataEntryForm_ChildTableTitle">
                                Diseases</span></span>
                        <div id="Tabs_Tab_0">
                            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden;">
                                <ul id="InstitutionsList" class="adminBoxNavList">
                                    <asp:Repeater runat="server" ID="InstitutionsRptr">
                                        <ItemTemplate>
                                            <li <%# Container.ItemIndex % 2 == 0 ? "class=\"alternate\"" : "" %>>
                                                <cic:CaisisHidden runat="server" ID="ForeignKeyField" Table="Institutions" Field="InstitutionId"
                                                    Value='<%# Eval("InstitutionId") %>' />
                                                <cic:CaisisHidden runat="server" ID="PrimaryKeyField" Table="PatientInstitutions"
                                                    Field="PatientInstitutionId" Value='<%# Eval("PatientInstitutionId") %>' />
                                                <asp:CheckBox runat="server" ID="AssociateCheckBox" Checked='<%# !string.IsNullOrEmpty(Eval("PatientInstitutionId").ToString()) %>' />
                                                <asp:Label runat="server" AssociatedControlID="AssociateCheckBox">
                                            <%# Eval("InstitutionName")%>
                                                </asp:Label>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                        <div id="Tabs_Tab_1" style="display: none;">
                            <div class="adminBoxNavListContainer" style="overflow-x: hidden;">
                                <ul id="DiseasesList" class="adminBoxNavList">
                                    <asp:Repeater runat="server" ID="DiseasesRptr">
                                        <ItemTemplate>
                                            <li <%# Container.ItemIndex % 2 == 0 ? "class=\"alternate\"" : "" %>>
                                                <cic:CaisisHidden runat="server" ID="ForeignKeyField" Table="Diseases" Field="DiseaseId"
                                                    Value='<%# Eval("DiseaseId") %>' />
                                                <cic:CaisisHidden runat="server" ID="PrimaryKeyField" Table="PatientDiseases" Field="PatientDiseaseId"
                                                    Value='<%# Eval("PatientDiseaseId") %>' />
                                                <asp:CheckBox runat="server" ID="AssociateCheckBox" Checked='<%# !string.IsNullOrEmpty(Eval("PatientDiseaseId").ToString()) %>' />
                                                <asp:Label runat="server" AssociatedControlID="AssociateCheckBox">
                                            <%# Eval("DiseaseName")%>
                                                </asp:Label>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Button runat="server" ID="SaveBtn" Text="Save" OnClick="SaveClick" CssClass="dataEntryButtonGray" />
        </div>
    </asp:PlaceHolder>
    </form>
</body>
</html>
