<%@ Control Language="c#" Inherits="Caisis.UI.Modules.ProtocolMgmt.DataEntryForms.PCCTCDiseaseState"
    CodeFile="PCCTCDiseaseState.ascx.cs" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<h3 id="PCCTCDiseaseState">
    Diagnosis &amp; Disease State</h3>
<span style="font-size: 12px; color: #666666;">Dates for past disease states are listed
    below.</span><br />
<table id="PCCTCDiseaseStateTable" class="DataRecords EditableRecords" cellspacing="0"
    style="width: 400px;">
    <thead>
        <tr>
            <th>
                Status
            </th>
            <th>
                Date
            </th>
            <th style="width: 30px;">
                &nbsp;
            </th>
        </tr>
    </thead>
    <tbody>
        <asp:Repeater runat="server" ID="StatusRptr" OnItemDataBound="SetFieldValues">
            <ItemTemplate>
                <tr runat="server" id="DataRecordRow">
                    <td>
                        <asp:Label runat="server" ID="StatusLabel" AssociatedControlID="StatusDateText">
                            <%# Eval("Status") %>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:HiddenField runat="server" ID="StatusId_Field" />
                        <cic:CaisisHidden ShowLabel="false" Table="Status" Field="Status" runat="server"
                            ID="Status" />
                        <cic:CaisisHidden ID="StatusDate" runat="server" Table="Status" Field="StatusDate" />
                        <cic:CaisisTextBox ShowLabel="false" ShowCalendar="true" CalcDate="true" Style="width: 90px;"
                            Table="Status" Field="StatusDateText" runat="server" ID="StatusDateText" />
                    </td>
                    <td>
                        <img src="~/Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage"
                            runat="server" title="This record has been locked." visible="false" />
                        <img runat="server" id="ClearBtn" onclick="clearElementsInParentRow(this);" src="~/Images/EFormDeleteRow.gif"
                            alt="Clear Values" title="Clear Values" visible="false" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </tbody>
</table>
