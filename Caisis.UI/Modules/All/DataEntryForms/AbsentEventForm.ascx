<%@ Control Language="C#" EnableViewState="true" AutoEventWireup="true" CodeFile="AbsentEventForm.ascx.cs"
    Inherits="Caisis.UI.Modules.All.DataEntryForms.AbsentEventForm" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript">
/* <![CDATA[ */

// Disable dirty functionality on dataentry forms
if(window.disIsDirty) { window.disIsDirty(); }

/* ]]> */
</script>
<!-- Data Entry Fields -->
<div style="margin-left: auto; margin-right: auto; width: 400px">
<%--    <custom:CaisisHidden ID="AbsentEventIdField" runat="server" Table="AbsentEvents"
        Field="AbsentEventId" />--%>
    <div class="DataEntryRow">
        <!-- List of Tables which allow Absent Events -->
        <custom:CaisisSelect Table="AbsentEvents" FieldLabel="Table" ID="TableNameField"
            runat="server" Field="TableName" DataTextField="Value" DataValueField="Key"
            AutoPostBack="true" Required="true">
        </custom:CaisisSelect>
    </div>
    <div class="DataEntryRow">
        <!-- List of Fields marked as AllowAbsentEvent in Metadata based on selected Table -->
        <custom:CaisisSelect Table="AbsentEvents" FieldLabel="Field" ID="FieldNameField"
            runat="server" Field="FieldName" DataTextField="Value" DataValueField="Key"
            AutoPostBack="true" Required="true">
        </custom:CaisisSelect>
    </div>
    <div class="DataEntryRow">
        <custom:CaisisComboBox runat="server" ID="FieldValueField" Table="AbsentEvents" Field="FieldValue" Required="true">
        </custom:CaisisComboBox>
    </div>
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="AbsentEvents" FieldLabel="Reason" ID="AbsentReasonField"
            runat="server" Field="AbsentReason" LookupCode="AbsentEventReason,Disease,@DiseaseView">
        </custom:CaisisSelect>
    </div>
    <div class="DataEntryRow">
        <custom:CaisisTextBox Table="AbsentEvents" FieldLabel="Absent Date" ID="AbsentDateText"
            runat="server" Field="AbsentDateText" ShowCalendar="true" CalcDate="true">
        </custom:CaisisTextBox>
    </div>
    <div class="DataEntryRow">
        <custom:CaisisHidden Table="AbsentEvents" FieldLabel="Notes" ID="AbsentDate" runat="server"
            Field="AbsentDate" DisplayCalculatedDate="true" />
    </div>
    <div class="DataEntryRow">
        <custom:CaisisTextArea Table="AbsentEvents" FieldLabel="Notes" ID="AbsentNotesField"
            runat="server" Field="AbsentNotes">
        </custom:CaisisTextArea>
    </div>
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="AbsentEvents" FieldLabel="Data Quality" ID="AbsentQualityField"
            runat="server" Field="AbsentQuality" LookupCode="DataQuality,Disease,@DiseaseView">
        </custom:CaisisSelect>
    </div>
</div>
