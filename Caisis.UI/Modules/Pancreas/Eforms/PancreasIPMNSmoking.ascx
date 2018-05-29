<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasIPMNSmoking" CodeFile="PancreasIPMNSmoking.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl"%>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PancreasIPMNSmoking" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Smoking" Visible="false"></asp:Label>
<table class="eformLargePopulatedTable" cellspacing="0">
    <tr id="NewSocialHx" runat="server">
        <td>
            <span class="controlBoxTitle"><asp:Label ID="Label1" runat="server" CssClass="controlBoxTitle" Text="Smoking"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="SmokingRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="SmokingRecorded">
                <asp:ListItem>Never</asp:ListItem>
                <asp:ListItem>Past</asp:ListItem>
                <asp:ListItem>Current</asp:ListItem>                
            </euc:EformRadioButtonList></td>
    </tr>
    <asp:Repeater ID="PrevSocialHx" runat="server" OnItemDataBound="EFormRepeaterOnDataBound">
        <ItemTemplate>
            <tr>
                <td onmouseover="this.style.backgroundColor='#E7BDC8';" onmouseout="this.style.backgroundColor='';" onclick="LoadDataEntryForm('SocialHistories', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoPacksPerYear,SocHxTobaccoYears,SocHxTobaccoQuitYear', 'SocialHistories');" style="padding: 0px 0px 0px 0px;">
                    <style type="text/css">
                    table#PrevSocialHxTable
                    {
                    }
                    table#PrevSocialHxTable td
                    {
                        padding: 4px 10px 4px 10px;
                        cursor: pointer;
                    }
                    table#PrevSocialHxTable td.fieldLabel
                    {
                        white-space: nowrap;
                        font-weight: bold;
                    }
                    </style>
                    <table cellspacing="0" id="PrevSocialHxTable" title="Click to edit existing record" >
                        <tr>
                            <td class="fieldLabel">Tobacco Type</td>
                            <td><%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoType")%></td>
                        </tr>
                        <tr>
                            <td class="fieldLabel"># Years Used</td>
                            <td><%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoYears")%></td>
                        </tr>
                        <tr>
                            <td class="fieldLabel">Year Quit</td>
                            <td><%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoQuitYear")%></td>
                        </tr>
                        <tr>
                            <td class="fieldLabel">Packs Per Day</td>
                            <td><%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoPacksPerDay")%></td>
                        </tr>
                        <tr>
                            <td class="fieldLabel">Packs Per Year</td>
                            <td><%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoPacksPerYear")%></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</table>

<div id="PastDiv" runat="server" style="display:none;">
<br/>
    <table class="eformLargePopulatedTable">
        <tr>
            <td height="28" ><strong> Tobacco Usage (Yrs) </strong>
                <euc:EformTextBox Table="SocialHistories" Field="SocHxTobaccoYears" ID="SocHxTobaccoYears"
                    runat="server" Width="100px" />
                <euc:EformTextBox runat="server" Table="SocialHistories" Field="SocHxTobaccoType" ID="SocHxTobaccoType" width="1px" style="display:none;" />
            </td>
            <td height="28"><strong> Tobacco Year Quit </strong>
                <euc:EformTextBox Table="SocialHistories" Field="SocHxTobaccoQuitYear" ID="SocHxTobaccoQuitYear"
                    runat="server" Width="100px" /> 
            </td>
        </tr>
    </table>
</div>

<div id="CurrentDiv" runat="server" style="display:none;">
<br/>
    <table class="eformLargePopulatedTable">
        <tr>
            <td height="28" ><strong> Packs per Day </strong>
                <euc:EformTextBox Table="SocialHistories" Field="SocHxTobaccoPacksPerDay" ID="SocHxTobaccoPacksPerDay"
                    runat="server" Width="100px" />
            </td>
            <td height="28"><strong> Packs per Year </strong>
                <euc:EformTextBox Table="SocialHistories" Field="SocHxTobaccoPacksPerYear" ID="SocHxTobaccoPacksPerYear"
                    runat="server" Width="100px" /> 
            </td>
        </tr>
    </table>
</div>
<br/><br/>

<script type="text/javascript">

    addSmokingEvent($('<%= SmokingRecorded.ClientID %>'), $('<%= PastDiv.ClientID %>'), $('<%= CurrentDiv.ClientID %>'),
                    $('<%= SocHxTobaccoType.ClientID %>'), $('<%= SocHxTobaccoPacksPerDay.ClientID %>'),
                    $('<%= SocHxTobaccoPacksPerYear.ClientID %>'), $('<%= SocHxTobaccoYears.ClientID %>'), 
                    $('<%= SocHxTobaccoQuitYear.ClientID %>'));

    function addSmokingEvent(smokingRecordedID, pastDivID, currentDivID,
                             socHxTobaccoTypeID, socHxTobaccoPacksPerDayID, socHxTobaccoPacksPerYearID, 
                             socHxTobaccoYearsID, socHxTobaccoQuitYearID) {
        if (smokingRecordedID)
        {
        $(smokingRecordedID).addEvent('click', curry(SmokingYesNo, smokingRecordedID, pastDivID, currentDivID, socHxTobaccoTypeID, socHxTobaccoPacksPerDayID, socHxTobaccoPacksPerYearID, socHxTobaccoYearsID, socHxTobaccoQuitYearID));
        $(socHxTobaccoPacksPerDayID).addEvent('blur', curry(SmokingYesNo, smokingRecordedID, pastDivID, currentDivID, socHxTobaccoTypeID, socHxTobaccoPacksPerDayID, socHxTobaccoPacksPerYearID, socHxTobaccoYearsID, socHxTobaccoQuitYearID));
        $(socHxTobaccoPacksPerYearID).addEvent('blur', curry(SmokingYesNo, smokingRecordedID, pastDivID, currentDivID, socHxTobaccoTypeID, socHxTobaccoPacksPerDayID, socHxTobaccoPacksPerYearID, socHxTobaccoYearsID, socHxTobaccoQuitYearID));
        $(socHxTobaccoYearsID).addEvent('blur', curry(SmokingYesNo, smokingRecordedID, pastDivID, currentDivID, socHxTobaccoTypeID, socHxTobaccoPacksPerDayID, socHxTobaccoPacksPerYearID, socHxTobaccoYearsID, socHxTobaccoQuitYearID));
        $(socHxTobaccoQuitYearID).addEvent('blur', curry(SmokingYesNo, smokingRecordedID, pastDivID, currentDivID, socHxTobaccoTypeID, socHxTobaccoPacksPerDayID, socHxTobaccoPacksPerYearID, socHxTobaccoYearsID, socHxTobaccoQuitYearID));

        SmokingYesNo(smokingRecordedID, pastDivID, currentDivID, socHxTobaccoTypeID, socHxTobaccoPacksPerDayID, socHxTobaccoPacksPerYearID, socHxTobaccoYearsID, socHxTobaccoQuitYearID);
        }
    }
    function SmokingYesNo(smokingRecordedID, pastDivID, currentDivID, socHxTobaccoTypeID, socHxTobaccoPacksPerDayID, socHxTobaccoPacksPerYearID, socHxTobaccoYearsID, socHxTobaccoQuitYearID) {

        var smokingRecordedRef = smokingRecordedID.getElementsByTagName('input');

        for (var i = 0; i < smokingRecordedRef.length; i++) {
            if (smokingRecordedRef[i].checked) {
                SmokingRadioClick(smokingRecordedRef[i].value, pastDivID, currentDivID, socHxTobaccoTypeID, socHxTobaccoPacksPerDayID, socHxTobaccoPacksPerYearID, socHxTobaccoYearsID, socHxTobaccoQuitYearID);
            }
        }
    }

    function SmokingRadioClick(smokingRecorded_value, pastDivID, currentDivID, socHxTobaccoTypeID, socHxTobaccoPacksPerDayID, socHxTobaccoPacksPerYearID, socHxTobaccoYearsID, socHxTobaccoQuitYearID) {

        if (smokingRecorded_value == "Never") {
            pastDivID.style.display = "none";
            currentDivID.style.display = "none";
            
            document.getElementById('<%= SocHxTobaccoType.ClientID %>').value = "Never";            
            socHxTobaccoPacksPerDayID.value = '';
            socHxTobaccoPacksPerYearID.value = '';
            socHxTobaccoYearsID.value = '';
            socHxTobaccoQuitYearID.value = '';

        }
        else if (smokingRecorded_value == "Past") {
            pastDivID.style.display = "block";
            currentDivID.style.display = "none";

            document.getElementById('<%= SocHxTobaccoType.ClientID %>').value = "Yes";
            socHxTobaccoPacksPerDayID.value = '';
            socHxTobaccoPacksPerYearID.value = '';

        }
        else if (smokingRecorded_value == "Current") {
            pastDivID.style.display = "none";
            currentDivID.style.display = "block";
            
            document.getElementById('<%= SocHxTobaccoType.ClientID %>').value = "Yes";
            socHxTobaccoYearsID.value = '';
            socHxTobaccoQuitYearID.value = ''; 
            

        }
    }
</script>