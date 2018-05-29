<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectApproval.aspx.cs" Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectApproval" %>

<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="diseaseState" TagName="DiseaseEditor" Src="Controls/DiseaseState.ascx" %>
<%@ Register TagPrefix="editor" TagName="LOIEditor" Src="Controls/LetterOfIntentEditor.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Project Approval</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProjectMgmtScripts.js"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <script type="text/javascript">
    
    Browser.ResizeElement({ nodeId: 'LOIContainer', heightOffset: 200 });
    
    var EDIT_LARGE__FIELD_URL = '<%= Page.ResolveUrl("ProjectLOIDetails.aspx") %>';
    var EDIT_SMALL_FIELDS_URL = '<%= Page.ResolveUrl("EditLetterOfIntentField.aspx") %>';   
 
    // Loads small fields for editing
    function editSmallFields() { showEditModal(EDIT_SMALL_FIELDS_URL); }
    
    // Load single notes field for editing
    function editLargeField(node) { showEditModal(EDIT_LARGE__FIELD_URL,node.title); }
    
    // Loads field/fields into modal window for editing
    function showEditModal(baseURL,label)
    {
        var field = label ? label.replace(' ','') : '';
        var title = label ? (label + ' Details') : 'Edit Project of Approval Fields';
        var url = baseURL + '?projectId=<%= ProjectId %>&field=' + field;
        // Load page into modal
        showEditDetailsInModal(url ,title,750,300);
    }
    </script>

    <style type="text/css">
    td
    {
        vertical-align: top;
    }
    .FieldTitle
    {
        font-size: 13px;
        font-weight: bold;
        color: #000000;
        cursor: pointer;
        display: block;
    }
    
    .LOITableCell
    {
        border: solid 1px #eeeff0;
        border-left-color: #ffffff; border-right-color: #ffffff;
        cursor: pointer;
        color: #333333;
    }

    .LOITableCellMouseover
    {
        border: solid 1px #8d2a2c;
        background-color: #eee6e8;
        cursor: pointer;
        color: #000000;
    }
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="LOIContainer" class="ProjectGridContainer">
            <table cellpadding="8" style="table-layout: fixed; width: 95%; margin: 10px auto 25px auto;
                vertical-align: top;" id="MainTable">
                <tr>
                    <td style="padding-bottom: 30px;">
                        <span style="font-size: 18px; color: #000000; font-weight: bold;">
                            <asp:Label ID="ProjectTitle" runat="server"></asp:Label>
                        </span><br />
                        Click on a section to edit its contents.</td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editSmallFields();" onmouseover="this.className='LOITableCellMouseover'"
                        onmouseout="this.className='LOITableCell'">
                        <table style="width: 100%;" cellpadding="4">
                            <tr>
                                <td style="width: 22%;">
                                    <span class="FieldTitle" title="Creation Date">Creation Date</span>
                                </td>
                                <td style="width: 28%;">
                                    <asp:Label ID="CreationDate" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="FieldTitle" title="Population Disease State">Population Disease State</span>
                                </td>
                                <td>
                                    <diseaseState:DiseaseEditor ID="DiseaseStateEditor" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editLargeField(this);" title="Population Description" onmouseover="this.className='LOITableCellMouseover'"
                        onmouseout="this.className='LOITableCell'">
                        <span class="FieldTitle" title="Research study sample/dataset">Research study sample/dataset</span>
                        <asp:Label ID="PopulationDescription" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editLargeField(this);" title="Objectives" onmouseover="this.className='LOITableCellMouseover'"
                        onmouseout="this.className='LOITableCell'">
                        <span class="FieldTitle">Research Question(s)</span>
                        <asp:Label ID="Objectives" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editLargeField(this);" title="Research Methods"
                        onmouseover="this.className='LOITableCellMouseover'" onmouseout="this.className='LOITableCell'">
                        <span class="FieldTitle">Statistical Methods</span>
                        <asp:Label ID="ResearchMethods" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editLargeField(this);" title="Notes"
                        onmouseover="this.className='LOITableCellMouseover'" onmouseout="this.className='LOITableCell'">
                        <span class="FieldTitle">Notes</span>
                        <asp:Label ID="Notes" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

