<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TreatmentOptions.ascx.cs"
    Inherits="Caisis.UI.Modules.All.Eforms.TreatmentOptions" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<table cellspacing="0" style="float: right;"><tr>
<td id="<%= this.ClientID %>_HPIOptions" class="SpecialTreatmentOptions" onclick="stopBubble(event);" title="" >
    <img id="<%= this.ClientID %>_Toggle" class="hpiOptionsToggle" src="../../Images/shim.gif" onclick="toggleHpiOptions('<%= this.ClientID %>','<%= ChildRecordCheckBox.ClientID %>',  event);" />
    <asp:PlaceHolder runat="server" ID="LastAdministeredPanel">Last Administered:&nbsp;<asp:Label runat="server" ID="LastAdminDate">&nbsp;&nbsp;---</asp:Label><br />
    </asp:PlaceHolder>
    <div id="<%= ChildRecordCheckBox.ClientID %>_TextLayer" style="background-color: #efefef; border-radius: 3px; padding: 4px 8px; margin: 4px 0px 4px 0px; display: none;" onclick="stopBubble(event);">
        <label for="<%= ChildRecordCheckBox.ClientID %>DateText">Administered on</label>
        <span id="<%= this.ClientID %>_DateTextField"></span>
        <input type="text" id="<%= ChildRecordCheckBox.ClientID %>DateText" name="<%= ChildRecordCheckBox.UniqueID %>DateText"
            value="<%= DateTime.Today.ToShortDateString() %>" style="width: 75px;" /><img style="border: none; margin-left: 0px;" src="../../Images/calendar/cal.png" onclick="showCal(this,document.getElementById('<%= ChildRecordCheckBox.ClientID %>DateText'));" class="CalendarWidget"  />
        <label for="<%= ChildRecordCheckBox.ClientID %>" onclick="<%= ChildRecordCheckBox.GetClientScript() %>; toggleHpiOptions('<%= this.ClientID %>','<%= ChildRecordCheckBox.ClientID %>',  event);">
            <img src="<%= Page.ResolveUrl("~/Images/EFormHPIButton_Save.png") %>" style="vertical-align: middle; margin-left: 3px; cursor: pointer;" />
        </label>
    </div>
    <%-- Administer Today --%>
    <asp:PlaceHolder runat="server" ID="ChildRecordPlaceHolder">
        <div id="<%= ChildRecordCheckBox.ClientID %>_CheckLayer" class="HPITreatmentCheckLayer" style="display: inline;">
            <cic:EformChildRecordCheckBox runat="server" ID="ChildRecordCheckBox" EnableDateEntry="false" Text="" />
            <label id="<%= ChildRecordCheckBox.ClientID %>_Label" for="<%= ChildRecordCheckBox.ClientID %>"onclick="<%= ChildRecordCheckBox.GetClientScript() %>">Administered Today</label>
        </div>
    </asp:PlaceHolder>
    <%-- Stop Now --%>
    <asp:PlaceHolder runat="server" ID="StopNowPlaceHolder" Visible="false">
        <div id="<%= StopNowCheckBox.ClientID %>_CheckLayer" class="HPITreatmentCheckLayer" style="display: inline;">
            <cic:EformStopCheckBox runat="server" ID="StopNowCheckBox" EnableDateEntry="false" Text="" />
            <label id="<%= StopNowCheckBox.ClientID %>_Label" for="<%= StopNowCheckBox.ClientID %>"
                onclick="<%= StopNowCheckBox.GetClientScript() %>;">
                Stop Now</label>
        </div>
    </asp:PlaceHolder>
</td>
</tr></table>
