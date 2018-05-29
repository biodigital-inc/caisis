<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PCCTCMedTxGrid.ascx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.DataEntryForms.PCCTCMedTxGrid" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<custom:ExtendedGridView runat="server" ID="MedTxGrid" TableName="MedicalTherapy"
    BlankRows="5" VisibleBlankRows="2" AutoGenerateColumns="false" RenderFullTable="true"
    Width="900" CssClass="DataRecords EditableRecords" GridLines="None" OnRowDataBound="SetFieldValues"
    VisibleBlankRowCssClass="dataGridBlankRowVisible" BlankRowCssClass="dataGridBlankRowHidden">
    <Columns>
        <asp:TemplateField HeaderText="Start Date" HeaderStyle-Width="95px">
            <ItemTemplate>
                <cic:CaisisTextBox runat="server" ID="MedTxDateText" Table="MedicalTherapy" Field="MedTxDateText"
                    ShowCalendar="True" CalcDate="True" Width="70px" ShowLabel="false"></cic:CaisisTextBox><cic:CaisisHidden
                        runat="server" ID="MedTxDate" Table="MedicalTherapy" Field="MedTxDate" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Stop Date" HeaderStyle-Width="95px">
            <ItemTemplate>
                <cic:CaisisTextBox runat="server" ID="MedTxStopDateText" Table="MedicalTherapy" Field="MedTxStopDateText"
                    ShowCalendar="True" CalcDate="True" Width="70px" ShowLabel="false"></cic:CaisisTextBox>
                <cic:CaisisHidden runat="server" ID="MedTxStopDate" Table="MedicalTherapy" Field="MedTxStopDate" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Agent" HeaderStyle-Width="125px">
            <ItemTemplate>
                <cic:CaisisHidden runat="server" ID="MedTxType" Table="MedicalTherapy" Field="MedTxType">
                </cic:CaisisHidden>
                <cic:CaisisComboBox runat="server" ID="MedTxAgent" Table="MedicalTherapy" Field="MedTxAgent"
                    LookupCode="MedTxAgent" Width="100px" ShowLabel="false">
                </cic:CaisisComboBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Total Cycles" HeaderStyle-Width="85px">
            <ItemTemplate>
                <cic:CaisisTextBox ShowCalendar="False" CalcDate="False" Table="MedicalTherapy" Field="MedTxCycle"
                    runat="server" ID="MedTxCycle" Width="50px" ShowLabel="false"></cic:CaisisTextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Dose" HeaderStyle-Width="60px">
            <ItemTemplate>
                <cic:CaisisTextBox ShowCalendar="False" CalcDate="False" Table="MedicalTherapy" Field="MedTxDose"
                    runat="server" ID="MedTxDose" Width="50px" ShowLabel="false"></cic:CaisisTextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Units" HeaderStyle-Width="60px">
            <ItemTemplate>
                <cic:CaisisSelect LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits"
                    runat="server" ID="MedTxUnits" Width="50px" ShowLabel="false">
                </cic:CaisisSelect>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Schedule">
            <ItemTemplate>
                <cic:CaisisComboBox LookupCode="MedSchedule" Table="MedicalTherapy" Field="MedTxSchedule"
                    runat="server" ID="MedTxSchedule" Width="65px" ShowLabel="false"></cic:CaisisComboBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Disc. Reason">
            <ItemTemplate>
                <cic:CaisisComboBox ield="MedTxNotes" LookupCode="TxDiscReason" Table="MedicalTherapy"
                    Field="MedTxNotes" runat="server" ID="MedTxNotes" Width="65px" ShowLabel="false"></cic:CaisisComboBox>
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
<span class="dataEntryButtonGray AddNewRowBtn" onclick="return showFirstAdditionalRow(this,'<%= MedTxGrid.ClientID %>');">
    Add Row</span> 