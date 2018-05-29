<%@ Control Language="c#" Inherits="Caisis.UI.Modules.ProtocolMgmt.DataEntryForms.PCCTCRadiationTherapy"
    CodeFile="PCCTCRadiationTherapy.ascx.cs" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="custom" TagName="AbsentEventQuestion" Src="~/Modules/All/DataEntryForms/AbsentEventYesNo.ascx" %>
<h3>
    Radiation Therapy</h3>
<!-- prior radiation therapy -->
<custom:AbsentEventQuestion runat="server" ID="RadTxAbsentEvent" AbsentTable="RadiationTherapy"
    AbsentField="RadTxTarget" AbsentFieldValue="Prostate" AbsentQuestionText="Has the subject had prior radiation therapy?"
    PanelId="PCCTCRadiationTherapyPanel" />
<div id="PCCTCRadiationTherapyPanel" style="display: none;">
    <custom:ExtendedGridView runat="server" ID="RadTxGrid" TableName="RadiationTherapy"
        BlankRows="5" VisibleBlankRows="2" AutoGenerateColumns="false" RenderFullTable="true"
        Width="900" CssClass="DataRecords EditableRecords" GridLines="None" OnRowDataBound="SetFieldValues"
        VisibleBlankRowCssClass="dataGridBlankRowVisible" BlankRowCssClass="dataGridBlankRowHidden">
        <Columns>
            <asp:TemplateField HeaderText="Start Date" HeaderStyle-Width="95px">
                <ItemTemplate>
                    <cic:CaisisTextBox runat="server" ID="RadTxDateText" ShowLabel="false" Table="RadiationTherapy"
                        Field="RadTxDateText" ShowCalendar="True" CalcDate="True" Width="70px"></cic:CaisisTextBox>
                    <cic:CaisisHidden runat="server" ID="RadTxDate" ShowLabel="false" Table="RadiationTherapy"
                        Field="RadTxDate" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Stop Date" HeaderStyle-Width="95px">
                <ItemTemplate>
                    <cic:CaisisTextBox runat="server" ID="RadTxStopDateText" ShowLabel="false" Table="RadiationTherapy"
                        Field="RadTxStopDateText" ShowCalendar="True" CalcDate="True" Width="70px"></cic:CaisisTextBox>
                    <cic:CaisisHidden runat="server" ID="RadTxStopDate" ShowLabel="false" Table="RadiationTherapy"
                        Field="RadTxStopDate" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type" HeaderStyle-Width="100px" HeaderStyle-CssClass="required">
                <ItemTemplate>
                    <cic:CaisisComboBox ShowLabel="false" LookupCode="RadTxType" Table="RadiationTherapy"
                        Field="RadTxType" runat="server" ID="RadTxType" Width="75px" Required="true"></cic:CaisisComboBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Target" HeaderStyle-Width="100px">
                <ItemTemplate>
                    <cic:CaisisComboBox ShowLabel="false" LookupCode="RadTxTarget" Field="RadTxTarget"
                        Table="RadiationTherapy" runat="server" ID="RadTxTarget" Width="75px"></cic:CaisisComboBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Intent" HeaderStyle-Width="125px">
                <ItemTemplate>
                    <cic:CaisisComboBox LookupCode="TxIntent" Field="RadTxIntent" ShowLabel="false" Table="RadiationTherapy"
                        runat="server" ID="RadTxIntent" Width="100px"></cic:CaisisComboBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="# Fractions">
                <ItemTemplate>
                    <cic:CaisisTextBox ShowCalendar="False" CalcDate="False" ShowLabel="false" Table="RadiationTherapy"
                        Field="RadTxNumFractions" runat="server" ID="RadTxNumFractions" Width="50px"></cic:CaisisTextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Dose">
                <ItemTemplate>
                    <cic:CaisisTextBox Field="RadTxTotalDose" ShowLabel="false" Table="RadiationTherapy"
                        runat="server" ID="RadTxTotalDose" Width="50px"></cic:CaisisTextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Units" HeaderStyle-Width="75px">
                <ItemTemplate>
                    <cic:CaisisComboBox LookupCode="RadTxUnits" DropDownHeight="auto" ShowLabel="false"
                        Table="RadiationTherapy" Field="RadTxUnits" runat="server" ID="RadTxUnits" Width="50px"></cic:CaisisComboBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Disc. Reason">
                <ItemTemplate>
                    <cic:CaisisComboBox ShowLabel="false" Field="RadTxNotes" LookupCode="TxDiscReason"
                        Table="RadiationTherapy" runat="server" ID="RadTxNotes" Width="65px"></cic:CaisisComboBox>
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
    <span class="dataEntryButtonGray AddNewRowBtn" onclick="return showFirstAdditionalRow(this,'<%= RadTxGrid.ClientID %>');">
        Add Row</span>
</div>
