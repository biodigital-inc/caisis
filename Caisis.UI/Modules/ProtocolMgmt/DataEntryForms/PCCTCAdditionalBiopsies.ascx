<%@ Control Language="c#" Inherits="Caisis.UI.Modules.ProtocolMgmt.DataEntryForms.PCCTCAdditionalBiopsies"
    CodeFile="PCCTCAdditionalBiopsies.ascx.cs" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Import Namespace="Caisis.BOL" %>
<script type="text/javascript">
    function calculateBxResult(primaryGleasonId, secondaryGleasonId, gleasonSumId) {
        var ggs = 0;
        var g1 = parseInt(document.getElementById(primaryGleasonId).value, 10);
        var g2 = parseInt(document.getElementById(secondaryGleasonId).value, 10);
        if (!isNaN(g1) && !isNaN(g2)) {
            ggs = g1 + g2;
            document.getElementById(gleasonSumId).value = ggs;
        }
    }
</script>
<h3 id="PCCTCAdditionalBiopsies">
    Additional Biopsies
</h3>
<table id="<%= this.ClientID %>_Table" class="DataRecords EditableRecords" cellspacing="0"
    style="width: 900px;">
    <thead>
        <tr>
            <th style="width: 95px;">
                Date
            </th>
            <th style="width: 110px;" class="required">
                Type
            </th>
            <th style="width: 110px;">
                Site
            </th>
            <th style="width: 110px;">
                Histology
            </th>
            <th>
                G1
            </th>
            <th>
                G2
            </th>
            <th>
                G3
            </th>
            <th>
                G Sum
            </th>
            <th>
                + Cores
            </th>
            <th>
                Total Cores
            </th>
            <th>
                % Cancer
            </th>
            <th style="width: 30px;">
            </th>
        </tr>
    </thead>
    <tbody>
        <asp:Repeater runat="server" ID="BiopsiesRptr" OnItemDataBound="PopulateRowValues">
            <ItemTemplate>
                <tr style="<%# !(Container.DataItem as Procedure).PrimaryKeyHasValue && Container.ItemIndex > 2 ? "display: none;": ""  %>;"
                    class="<%# !(Container.DataItem as Procedure).PrimaryKeyHasValue ? "dataGridBlankRowVisible": ""  %>">
                    <td>
                        <%--key fields --%>
                        <asp:HiddenField runat="server" ID="ProcedureId" />
                        <asp:HiddenField runat="server" ID="PathologyId" />
                        <cic:CaisisTextBox ShowCalendar="true" CalcDate="true" Table="Procedures" Field="ProcDateText"
                            runat="server" ID="ProcDateText" Width="70px" ShowLabel="false"></cic:CaisisTextBox>
                        <cic:CaisisHidden runat="server" ID="ProcDate" Table="Procedures" Field="ProcDate">
                        </cic:CaisisHidden>
                    </td>
                    <td>
                        <cic:CaisisComboBox LookupCode="BxType" Table="Pathology" Field="PathSpecimenType"
                            runat="server" ID="PathSpecimenType" ShowLabel="false" Width="85px" Required="true"></cic:CaisisComboBox>
                    </td>
                    <td>
                        <cic:CaisisComboBox LookupCode="BxSite" Table="Pathology" Field="PathSite" runat="server"
                            ID="PathSite" ShowLabel="false" Width="85px"></cic:CaisisComboBox>
                    </td>
                    <td>
                        <cic:CaisisComboBox LookupCode="PathHistology" ID="PathHistology" Table="Pathology"
                            Field="PathHistology" runat="server" ShowLabel="false" Width="85px"></cic:CaisisComboBox>
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="PathGG1" Table="ProstateBiopsyPath" Field="PathGG1" runat="server"
                            Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="PathGG2" Table="ProstateBiopsyPath" Field="PathGG2" runat="server"
                            Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="PathGG3" Table="ProstateBiopsyPath" Field="PathGG3" runat="server"
                            Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="PathGGS" Table="ProstateBiopsyPath" Field="PathGGS" runat="server"
                            Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="PathPosCores" Table="ProstateBiopsyPath" Field="PathPosCores"
                            runat="server" Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="PathNumCores" Table="ProstateBiopsyPath" Field="PathNumCores"
                            runat="server" Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="PathPercCancer" Table="ProstateBiopsyPath" Field="PathPercCancer"
                            runat="server" Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                    <td>
                        <img src="~/Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage"
                            runat="server" title="This record has been locked." alt="Locked" />
                        <img runat="server" id="ClearBtn" onclick="clearElementsInParentRow(this);" src="~/Images/EFormDeleteRow.gif"
                            alt="Clear Values" title="Clear Values" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </tbody>
</table>
<span style="<%= BlankRows== 0 ? "display: none;": "" %>" class="dataEntryButtonGray AddNewRowBtn"
    onclick="return showFirstAdditionalRow(this,'<%= this.ClientID %>_Table');">Add
    Row</span>
