<%@ Control Language="c#" Inherits="Caisis.UI.Modules.ProtocolMgmt.DataEntryForms.PCCTCSurgicalHistory"
    CodeFile="PCCTCSurgicalHistory.ascx.cs" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="custom" TagName="AbsentEventQuestion" Src="~/Modules/All/DataEntryForms/AbsentEventYesNo.ascx" %>
<h3>
    Surgical History</h3>
<!-- other cancer surgeries -->
<custom:AbsentEventQuestion runat="server" ID="AdditionalAbsentEvent" AbsentQuestionText="Has the subject had other prior cancer surgeries?"
    PanelId="AdditionalProceduresPanel" AbsentTable="Procedures" AbsentField="ProcName" AbsentFieldValue="Cancer Surgery" />
<div id="AdditionalProceduresPanel" style="display: none;">
    <custom:ExtendedGridView runat="server" ID="PriorSurgeriesGrid" TableName="Procedures"
        BlankRows="5" VisibleBlankRows="2" AutoGenerateColumns="false" RenderFullTable="true"
        Width="600" CssClass="DataRecords EditableRecords" GridLines="None" OnRowCreated="SetProcedures" OnRowDataBound="PopulateAdditionalProcedures"
        VisibleBlankRowCssClass="dataGridBlankRowVisible" BlankRowCssClass="dataGridBlankRowHidden">
        <Columns>
            <asp:TemplateField HeaderText="Date" HeaderStyle-Width="95px">
                <ItemTemplate>
                    <cic:CaisisTextBox runat="server" ID="ProcDateText" Table="Procedures" Field="ProcDateText"
                        ShowLabel="false" ShowCalendar="true" CalcDate="true" Width="70px"></cic:CaisisTextBox>
                    <cic:CaisisHidden runat="server" ID="ProcDate" Table="Procedures" Field="ProcDate"
                        ShowLabel="false" DisplayCalculatedDate="false">
                    </cic:CaisisHidden>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Procedure" HeaderStyle-CssClass="required">
                <ItemTemplate>
                    <cic:CaisisComboBox runat="server" ID="ProcName" Table="Procedures" Field="ProcName"
                        ShowLabel="false" Width="200px" Required="true"></cic:CaisisComboBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Notes">
                <ItemTemplate>
                    <cic:CaisisTextArea runat="server" ID="ProcNotes" Table="Procedures" Field="ProcNotes"
                        ShowLabel="false"></cic:CaisisTextArea>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center"
                ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <img runat="server" id="ClearImage" onclick="clearElementsInParentRow(this);" src="~/Images/EFormDeleteRow.gif"
                        alt="Clear Values" title="Clear Values" />
                    <img runat="server" id="LockImage" src="~/Images/EformPopulatedRowLOCK.gif" width="9"
                        height="11" alt="Locked" title="This record has been locked." />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </custom:ExtendedGridView>
    <span class="dataEntryButtonGray AddNewRowBtn" onclick="return showFirstAdditionalRow(this,'<%= PriorSurgeriesGrid.ClientID %>');">
        Add Row</span>
</div>
