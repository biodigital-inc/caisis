<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditStage.aspx.cs" Inherits="Caisis.UI.Modules.ProjectMgmt.EditStage" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Project Stage</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="ProjectMgmtScripts.js"></script>

    <script type="text/javascript">
    function editField(fieldId)
    {
        $(fieldId).disabled = false;
        return false;
    }
    
    </script>

    <style type="text/css">
    
    table
    {
        width: 100%; 
        table-layout: fixed;
        vertical-align: top;
        text-align: left;
    }
    tr
    {
        padding-bottom: 20px;
    }
    td
    {
        padding-top: 15px;
    }
    .dataGrid
    {
        margin-top: 0px;
    }
    .dataGrid tr
    {
        padding-bottom: 5px;
    }
    .dataGrid td
    {
        padding-top: 0px
    }
    .LabelCol
    {
        width: 150px;
        vertical-align: top;
    }
    .FieldLabel
    {
        font-weight: bold;
    }
    .InputField
    {
        width: 90%;
    }
    .dataGrid
    {
 
        margin-bottom: 0px;
    }
    .HiddenField
    {
        display: none;
    }
    .VisibleField
    {
        display: auto;
    }
    .IconCol
    {
        width: 40px;
    }
    div
    {
        margin: 0px;
    }
   
    </style>
</head>
<body style="background-color: #ffffff;">
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="StageId" />
        <div>
            <table id="MainLayoutTable">
                <tr>
                    <td class="LabelCol">
                        <span class="FieldLabel">Stage Name</span>
                    </td>
                    <td>
                        <cc:CaisisTextBox ID="StageName" runat="server" ShowLabel="false" Table="ProjectStage"
                            Field="Name" CssClass="InputField" OnTextChanged="SignalStageUpdate" MaxLength="50"></cc:CaisisTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="LabelCol">
                        <span class="FieldLabel">Color</span></td>
                    <td style="vertical-align: middle;">
                        <asp:Panel runat="server" ID="ColorCodeBox" CssClass="ColorCodeBox" onclick="showColorPicker('ColorCode',this,event);">
                        </asp:Panel>
                        <asp:HiddenField runat="server" ID="ColorCode" OnValueChanged="SignalStageUpdate" />
                        <span style="font-style: italic; padding-left: 5px;">Click color box to change.</span></td>
                </tr>
                <tr>
                    <td class="LabelCol">
                        <span class="FieldLabel">Notes</span>
                    </td>
                    <td>
                        <cc:CaisisTextArea runat="server" Table="ProjectStage" Field="Notes" CssClass="InputField"
                            Rows="5" OnTextChanged="SignalStageUpdate"></cc:CaisisTextArea>
                    </td>
                </tr>
                <tr>
                    <td class="LabelCol">
                        <span class="FieldLabel">Events & Details</span></td>
                    <td>
                        <div class="InputField" >
                            <table cellpadding="0" cellspacing="0" border="0" class="dataGrid" style="background-color: #336699;
                                color: #ffffff;">
                                <tr style="color: #ffffff;">
                                    <td style="width: 200px; color: #ffffff;">
                                        Event</td>
                                    <td style="color: #ffffff;">
                                        Details</td>
                                    <td class="IconCol" style="color: #ffffff;">
                                        Edit</td>
                                    <td class="IconCol" style="color: #ffffff;">
                                        Delete</td>
                                </tr>
                            </table>
                            <custom:ExtendedGridView runat="server" ID="EventsGrid" GridLines="None" CssClass="dataGrid"
                                RowStyle-CssClass="dataGridItemRowB" AlternatingRowStyle-CssClass="dataGridItemRowA"
                                TableName="ProjectStageEvent" AutoGenerateColumns="false" AutoBindChildGridByRowPrimaryKey="true"
                                ShowHeader="false" AutoUpdateChildGridViews="true" RebindOnDelete="true" HeaderStyle-CssClass="dataGridHeader"
                                ShowFooter="true" ShowFooterOnEmpty="true" CellSpacing="0" CellPadding="0" BorderStyle="Solid"
                                OnRowDataBound="SetComboDisable" BorderWidth="1" BorderColor="#666666" EmptyRecordsMessage="The Stage must be saved before adding Events and Details.">
                                <Columns>
                                    <custom:ExtendedTemplateField HeaderStyle-Width="200px" ItemStyle-VerticalAlign="Top">
                                        <ItemTemplate>
                                            <table style="table-layout: fixed;" cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td style="width: 200px;">
                                                        <cc:CaisisComboBox ID="NameComboBox" runat="server" Table="ProjectStageEvent" LookupCode="ProjectStageEvents"
                                                            Field="Name" ShowLabel="false" Width="150px" MaxLength="50"></cc:CaisisComboBox>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td class="IconCol">
                                                        <asp:ImageButton ID="EditBtn" runat="server" AlternateText="Edit" ImageUrl="~/Images/Icon_Refresh.gif" />
                                                    </td>
                                                    <td class="IconCol">
                                                        <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return confirmDelete('Are you sure you want to delete this stage and it\'s details?');"
                                                            CommandName="Delete" ImageUrl="~/Images/iconDelete.gif" AlternateText="Delete this stage and details."
                                                            OnClick="RegisterUpdateScript" /></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 200px;">
                                                        &nbsp;
                                                    </td>
                                                    <td colspan="3"  >
                                                        <custom:ExtendedGridView runat="server" ID="EventsAttributesGrid" GridLines="None"
                                                            CssClass="dataGrid" TableName="ProjectEventAttributes" AutoGenerateColumns="false"
                                                            ShowFooter="true" ShowHeader="false" RebindOnDelete="true" ShowFooterOnEmpty="true"
                                                            CellPadding="0" CellSpacing="0" BorderStyle="None" OnRowDataBound="SetComboDisable">
                                                            <Columns>
                                                                <custom:ExtendedTemplateField>
                                                                    <ItemTemplate>
                                                                        <table style="table-layout: fixed; border-top: 1px solid #666666;" cellpadding="0"
                                                                            cellspacing="0" border="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <cc:CaisisComboBox ID="NameComboBox" runat="server" Table="ProjectEventAttributes"
                                                                                        LookupCode="ProjectEventAttributes" Field="AttributeName" ShowLabel="false" Width="150px" MaxLength="200"></cc:CaisisComboBox>
                                                                                </td>
                                                                                <td class="IconCol">
                                                                                    <asp:ImageButton ID="EditBtn" runat="server" AlternateText="Edit" ImageUrl="~/Images/Icon_Refresh.gif" />
                                                                                </td>
                                                                                <td class="IconCol">
                                                                                    <asp:ImageButton ID="ImageButton2" runat="server" OnClientClick="return confirmDelete('Are you sure you want to delete this detail?');"
                                                                                        CommandName="Delete" ImageUrl="~/Images/iconDelete.gif" AlternateText="Delete this detail."
                                                                                        OnClick="RegisterUpdateScript" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <cc:CaisisComboBox ID="CaisisComboBox2" runat="server" Table="ProjectEventAttributes"
                                                                            LookupCode="ProjectEventAttributes" Field="AttributeName" ShowLabel="false" Width="150px" MaxLength="200"></cc:CaisisComboBox>
                                                                        <asp:Button ID="Button2" runat="server" Text="Add Detail" OnClick="UpdateStageRecord" />
                                                                    </FooterTemplate>
                                                                </custom:ExtendedTemplateField>
                                                            </Columns>
                                                        </custom:ExtendedGridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <cc:CaisisComboBox ID="CaisisComboBox1" runat="server" Table="ProjectStageEvent"
                                                LookupCode="ProjectStageEvents" Field="Name" ShowLabel="false" Width="150px" MaxLength="50"></cc:CaisisComboBox>
                                            <asp:Button ID="Button1" runat="server" Text="Add an Event" OnClick="UpdateStageRecord" />
                                        </FooterTemplate>
                                    </custom:ExtendedTemplateField>
                                </Columns>
                            </custom:ExtendedGridView>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="LabelCol">
                        &nbsp;
                    </td>
                    <td>
                        <div style="width: 90%; text-align: right;">
                            <asp:ImageButton ID="SaveBtn" runat="server" ImageUrl="Images/Button_Save.gif" OnClick="UpdateStageRecord" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
