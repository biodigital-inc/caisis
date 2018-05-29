<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddressLabel.ascx.cs"
    Inherits="Modules_FollowUp_Surveys_AddressLabel" %>
<div class="PtAddressItem">
    <asp:Label runat="server" ID="PatientNameLabel" CssClass="PtNameLabel"></asp:Label>
    <asp:Label runat="server" ID="PatientAddressLabel" CssClass="PtAddressLabel"></asp:Label>
    <%--  <link href="follow-up_surveys.css" rel="stylesheet" type="text/css" />  

<style type="text/css">
        .label
        {
            width: 300px;
            background-color: #cccccc;
        }
        .labelVSpacer
        {
            height: 25px;
        }
        .LabelName { width:20px; padding-right:5px; }
        .NoLabel { width:0px; height:0px; display:none; } 
        .NarrowTextBox { width:75px; }
    </style>
    <asp:Repeater ID="rptLabels" runat="server">
        <ItemTemplate>
            <div class="label">
                Hello World
                <asp:Label runat="server" ID="PatientName" CssClass="returnAddress"></asp:Label>
                <br />
                <asp:Label runat="server" ID="PatientAddress" CssClass="returnAddress"></asp:Label>
            </div>
        </ItemTemplate>
        <SeparatorTemplate>
            <div class="labelVSpacer">
                &nbsp;</div>
        </SeparatorTemplate>
    </asp:Repeater>
    <br />
    <br />
    <asp:Label runat="server" ID="PatientName" CssClass="returnAddress"></asp:Label>
    <br />
    <asp:Label runat="server" ID="PatientAddress" CssClass="returnAddress"></asp:Label>--%>
</div>
