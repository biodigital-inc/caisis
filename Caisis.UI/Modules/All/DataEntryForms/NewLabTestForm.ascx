<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.DataEntryForms.NewLabTestForm" CodeFile="NewLabTestForm.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePatientDataControl" %>


<%@ Register TagPrefix="uc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<div class="pdFormCol">
<div class="DataEntryRow"><uc:CaisisCheckBox	CssClass="pdFormField" TABLE="LabTests" FIELD="LabPending" id="LabPending" Value="1" runat="server" /></div>
<div class="DataEntryRow"><uc:CaisisTextBox	CssClass="pdFormField" FieldLabel="Date:" ShowCalendar="true" CalcDate="True" TABLE="LabTests" FIELD="LabDateText" id="LabDateText" runat="server"/></div>
<div class="DataEntryRow"><uc:CaisisTextBox	CssClass="pdFormField" ReadOnly="true" style="width:120" id="LabDate" TABLE="LabTests" FIELD="LabDate" runat="server"/></div>
<div class="DataEntryRow"><uc:CaisisSelect    CssClass="pdFormField" Visible="True" LookupCode="LabTest" Required="True" FieldLabel="TEST" TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest"/></div>
<div class="DataEntryRow"><uc:CaisisTextBox   CssClass="pdFormField" Required="True" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult"/></div>
<div class="DataEntryRow"><uc:CaisisTextBox   CssClass="pdFormField" TextMode="MultiLine" Wrap="True" FieldLabel="Notes" TABLE="LabTests" FIELD="LabNotes" id="LabNotes" maxlength="1000" runat="server"/></div>
<div class="DataEntryRow"><uc:CaisisComboBox  CssClass="pdFormField" LookupCode="DxResult" Id="LabDataSource" TABLE="LabTests" FIELD="LabDataSource" RefBy="LabDataSource" runat="server" /></div>
</div>