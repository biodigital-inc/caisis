<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientUnplannedSurvey.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientUnplannedSurvey" %>

<%@ Register TagPrefix="plugin" TagName="SurveyPlugin" Src="~/Plugins/SurveyPlugin/SurveyControl.ascx" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="grid" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unplanned Survey</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        function onWindowResize(width, height, e) {
            var overflow = document.getElementById('Overflow');
            var winHeight = getHeight();
            // adjust overflow to minus data entry buttons
            overflow.style.height = Math.max(100, winHeight - 100) + 'px';
        }

        // notify parnet page that record has been updated
        function notifyRecordUpdate(isDelete) {
            if (parent.notifyUnplannedEventUpdate) parent.notifyUnplannedEventUpdate();
        }

        function cancelEnterData() {
            if (parent.hideDeviation) { parent.hideDeviation(); }
            return false;
        }

        function onSurveySave(surveyId) {
            $('<%= SurveyIdField.ClientID %>').value = surveyId;
            $('<%= SaveFromPlugin.ClientID %>').value = true.toString();
            document.getElementById('form1').submit();
            return true;
        }

        /* ]]> */
    </script>

    <style type="text/css">
        #Overflow
        {
            overflow: auto;
            position: relative;
            border-bottom: 1px solid #cccccc;
            margin-bottom: 10px;
            height: 300px;
        }
        #FieldsLayout
        {
            width: auto;
            table-layout: fixed;
            margin-bottom: 10px;
        }
        #FieldsLayout td
        {
            vertical-align: top;
        }
        #ButtonLayout
        {
            width: 86%;
            margin: 0px auto 0px auto;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="PatientItemId" />
    <asp:HiddenField runat="server" ID="SurveyIdField" />
    <asp:HiddenField runat="server" ID="RelatedRecordId" />
    <asp:HiddenField runat="server" ID="SaveFromPlugin" />

    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

    <div class="UnplannedEventContainer">
        <div id="Overflow">
            <table id="FieldsLayout">
                <tr>
                    <td style="width: 15%;">
                        <label for="FieldSurveyDateText">
                            Date</label>
                    </td>
                    <td style="width: 35%;">
                        <cic:CaisisTextBox ID="FieldSurveyDateText" runat="server" ShowLabel="false" Table="Surveys"
                            Field="SurveyDateText" ShowCalendar="true" CalcDate="true"></cic:CaisisTextBox>
                    </td>
                    <td style="width: 15%;">
                        <label for="FieldSurveyVersion">
                            Version</label>
                    </td>
                    <td style="width: 35%;">
                        <cic:CaisisTextBox ID="FieldSurveyVersion" runat="server" ShowLabel="false" Table="Surveys"
                            Field="SurveyVersion"></cic:CaisisTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">
                        &nbsp
                    </td>
                    <td colspan="3">
                        <cic:CaisisHidden runat="server" ID="FieldSurveyDate" ShowSpacer="false" Table="Surveys"
                            Field="SurveyDate" DisplayCalculatedDate="true">
                        </cic:CaisisHidden>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">
                        <label for="FieldSurveyType">
                            Type</label>
                    </td>
                    <td style="width: 35%;">
                        <cic:CaisisSelect ID="FieldSurveyType" runat="server" ShowLabel="false" Table="Surveys"
                            Field="SurveyType" LookupCode="SurveyType">
                        </cic:CaisisSelect>
                        <plugin:SurveyPlugin runat="server" ID="SurveyPluginControl" />
                    </td>
                    <td style="width: 15%;">
                        <label for="FieldSurveyDataSource">
                            Data Source</label>
                    </td>
                    <td style="width: 35%;">
                        <cic:CaisisComboBox ID="FieldSurveyDataSource" runat="server" ShowLabel="false" Table="Surveys"
                            Field="SurveyDataSource" LookupCode="DataSource"></cic:CaisisComboBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">
                        <label for="FieldSurveyResult">
                            Result</label>
                    </td>
                    <td style="width: 35%;">
                        <cic:CaisisTextBox ID="FieldSurveyResult" runat="server" ShowLabel="false" Table="Surveys"
                            Field="SurveyResult"></cic:CaisisTextBox>
                    </td>
                    <td style="width: 15%;">
                        <label for="FieldSurveyQuality">
                            Data Quality</label>
                    </td>
                    <td style="width: 35%;">
                        <cic:CaisisSelect ID="FieldSurveyQuality" runat="server" ShowLabel="false" Table="Surveys"
                            Field="SurveyQuality" LookupCode="DataQuality">
                        </cic:CaisisSelect>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">
                        <label for="FieldSurveyTotal">
                            Total</label>
                    </td>
                    <td style="width: 35%;">
                        <cic:CaisisTextBox ID="FieldSurveyTotal" runat="server" ShowLabel="false" Table="Surveys"
                            Field="SurveyTotal"></cic:CaisisTextBox>
                    </td>
                    <td style="width: 15%;">
                        <label for="FieldSurveyNotes">
                            Notes</label>
                    </td>
                    <td style="width: 35%;">
                        <cic:CaisisTextArea ID="FieldSurveyNotes" runat="server" ShowLabel="false" Table="Surveys"
                            Field="SurveyNotes"></cic:CaisisTextArea>
                    </td>
                </tr>
            </table>
            <grid:ExtendedGridView runat="server" ID="SurveyItemsGrid" TableName="SurveyItems"
                CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" DataKeyNames="SurveyId,SurveyItemId"
                BlankRows="3" VisibleBlankRows="3" AutoGenerateColumns="false" Width="650px"
                HorizontalAlign="Left">
                <Columns>
                    <grid:ExtendedTemplateField HeaderText="Number" HeaderStyle-Width="55px" ItemStyle-Width="55px"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <cic:CaisisTextBox runat="server" ShowLabel="false" Table="SurveyItems" Field="SurveyItemNum"
                                Width="50px"></cic:CaisisTextBox>
                        </ItemTemplate>
                    </grid:ExtendedTemplateField>
                    <grid:ExtendedTemplateField HeaderText="Item">
                        <ItemTemplate>
                            <cic:CaisisTextBox runat="server" ShowLabel="false" Table="SurveyItems" Field="SurveyItem"
                                Width="150px"></cic:CaisisTextBox>
                        </ItemTemplate>
                    </grid:ExtendedTemplateField>
                    <grid:ExtendedTemplateField HeaderText="Result" HeaderStyle-Width="55px" ItemStyle-Width="55px"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <cic:CaisisTextBox runat="server" ShowLabel="false" Table="SurveyItems" Field="SurveyItemResult"
                                Width="50px"></cic:CaisisTextBox>
                        </ItemTemplate>
                    </grid:ExtendedTemplateField>
                    <grid:ExtendedTemplateField HeaderText="Total">
                        <ItemTemplate>
                            <cic:CaisisTextBox runat="server" ShowLabel="false" Table="SurveyItems" Field="SurveyItemTotal"></cic:CaisisTextBox>
                        </ItemTemplate>
                    </grid:ExtendedTemplateField>
                    <grid:ExtendedTemplateField HeaderText="Notes">
                        <ItemTemplate>
                            <cic:CaisisTextBox runat="server" ShowLabel="false" Table="SurveyItems" Field="SurveyItemNotes"
                                ShowTextEditor="true"></cic:CaisisTextBox>
                        </ItemTemplate>
                    </grid:ExtendedTemplateField>
                </Columns>
            </grid:ExtendedGridView>
            <asp:ImageButton runat="server" ID="AddNewRowBtn" ImageUrl="~/Images/DataGridAddNewRow.gif"
                OnClick="SaveClick" Style="display: block; clear: both;" />
        </div>
        <div id="ButtonLayout">
            <asp:ImageButton runat="server" ID="DeleteBtn" ImageUrl="Images/Button_Delete.png"
                ToolTip="Delete" OnClick="DeleteClick" OnClientClick="return confirmDelete();"
                Style="float: left;" />
            <asp:ImageButton runat="server" ID="CancelBtn" ImageUrl="Images/Button_Cancel.png"
                ToolTip="Cancel" OnClientClick="return cancelEnterData();" Style="margin-right: 20px;" />
            <asp:ImageButton runat="server" ID="UpdateBtn" ImageUrl="Images/Button_Save.png"
                ToolTip="Save" OnClick="SaveClick" />
        </div>
    </div>
    </form>
</body>
</html>
