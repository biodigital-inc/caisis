<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Survey.ascx.cs" Inherits="Caisis.UI.Modules.All.DataEntryForms.Survey" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<!-- Survey Form (Parent) -->
<div class="PDFormCol">
    <div class="DataEntryRow">
        <custom:CaisisTextBox Table="Surveys" ID="SurveyDateText" runat="server" Field="SurveyDateText">
        </custom:CaisisTextBox>
    </div>
    <div class="DataEntryRow">
        <custom:CaisisHidden Table="Surveys" ID="SurveyDate" Field="SurveyDate" runat="server" />
    </div>
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="Surveys" ID="SurveyType" runat="server" Field="SurveyType">
        </custom:CaisisSelect></div>
    <div class="DataEntryRow">
        <custom:CaisisTextBox Table="Surveys" ID="SurveyResult" runat="server" Field="SurveyResult">
        </custom:CaisisTextBox></div>
    <div class="DataEntryRow">
        <custom:CaisisTextBox Table="Surveys" ID="SurveyTotal" runat="server" Field="SurveyTotal">
        </custom:CaisisTextBox></div>
    <div class="DataEntryRow">
        <custom:CaisisTextBox Table="Surveys" ID="SurveyVersion" runat="server" Field="SurveyVersion">
        </custom:CaisisTextBox></div>
    <div class="DataEntryRow">
        <custom:CaisisComboBox Table="Surveys" ID="SurveyDataSource" runat="server" Field="SurveyDataSource">
        </custom:CaisisComboBox></div>
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="Surveys" Field="SurveyQuality" FieldLabel="Data Quality"
            Required="false" ShowLabel="true" ShowHelpBubble="true" runat="server" LookupCode="DataQuality">
        </custom:CaisisSelect></div>
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="Surveys" Field="SurveyDataSource" FieldLabel="Data Source"
            Required="false" ShowLabel="true" ShowHelpBubble="true" runat="server" LookupCode="DataSource">
        </custom:CaisisSelect>
    </div>
<div class="DataEntryRow">
    <custom:CaisisTextArea Table="Surveys" ID="SurveyNotes" runat="server" Field="SurveyNotes">
    </custom:CaisisTextArea></div>
</div>
<!-- END Survey Form -->
<%--<span class="SubFormSectionTitle">Survey Items</span>
<hr class="DataEntryLine" />
<!-- SurveyItem Form (Child) -->
<asp:Panel runat="server" ID="GridPanel">
    <caisis:CaisisGridView AutoExtractValues="true" AutoPopulateValues="true" AutoGenerateStyles="true"
        SaveButtonID="SaveBtn" EmptyRows="10" DisplayableEmptyRows="5" AddButtonId="AddRowsBtn"
        DataKeyNames="SurveyId,SurveyItemId" ID="SurveyItemGrid_CGV" runat="server">
        <Columns>
            <asp:TemplateField>
                <itemtemplate>
                    <custom:CaisisComboBox Table="SurveyItems" ID="SurveyItemSelect" runat="server" Field="SurveyItem"
                         ShowLabel="false" CascadeValuesBasedOn="SurveyType"
                        CascadeFormatString="SurveyItem_{0}" >
                    </custom:CaisisComboBox>
                </itemtemplate>
                <headertemplate>
                    <span>Item</span>
                </headertemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <itemtemplate>
                    <custom:CaisisComboBox Table="SurveyItems" ID="SurveyItemResultText" runat="server"
                        Field="SurveyItemResult"  ShowLabel="false" CascadeValuesBasedOn="SurveyType"
                        CascadeFormatString="SurveyItem_{0}">
                    </custom:CaisisComboBox>
                </itemtemplate>
                <headertemplate>
                    <span>Result</span>
                </headertemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <itemtemplate>
                    <custom:CaisisTextBox Table="SurveyItems" ID="SurveyItemTotalText" runat="server"
                        Field="SurveyItemTotal"  ShowLabel="false" >
                    </custom:CaisisTextBox>
                </itemtemplate>
                <headertemplate>
                    <span>Total</span>
                </headertemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <itemtemplate>
                    <custom:CaisisTextBox Table="SurveyItems" ID="SurveyItemNotesText" runat="server"
                        Field="SurveyItemNotes"  ShowLabel="false" >
                    </custom:CaisisTextBox>
                </itemtemplate>
                <headertemplate>
                    <span>Notes</span>
                </headertemplate>
            </asp:TemplateField>
        </Columns>
    </caisis:CaisisGridView>
</asp:Panel>
<asp:ImageButton runat="server" ID="SurveyItems_CGV_NewRow" ImageUrl="~/Images/DataGridAddNewRow.gif"
    OnClientClick="disIsDirty();" CssClass="dataGridImageButton" />
--%><!-- END SurveyItem Form -->
