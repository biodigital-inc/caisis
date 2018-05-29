<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasIPMNDiabetesYesNo" CodeFile="PancreasIPMNDiabetesYesNo.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl"%>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PancreasIPMNDiabetesYesNo" />

<table class="eformLargePopulatedTable">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="Label1" runat="server" CssClass="controlBoxTitle" Text="Diabetes"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ComorbRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="ComorbRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>                
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="ComorbAbsentDiv" runat="server" style="display: none;" >
 <br /><br />  
    <table class="eformLargePopulatedTable">
        <tr>
           <td><strong> <asp:Label ID="AbsentEventPrefix" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_1"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="1" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_1"
                Runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="TableName" ID="TableName_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldName" ID="FieldName_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_1"
            runat="server" Width="1px" Style="display: none;" />
           </td>
        </tr>
</table>
<br />
</div>

<div id="ComorbDiv" runat="server" style="display:none;">
<br /><br />
    <table cellpadding="3" cellspacing="0" class="ClinicalEformTable">
        <tr>
            <td  height="28" class="ClinicalEformGridColumnOne"><strong> Date </strong>
                <euc:EformTextBox RecordId="10" Table="Comorbidities" Field="ComorbDateText" ID="ComorbDateText_10"
                    runat="server" Width="100px" ShowCalendar="true" />
                <euc:EformTextBox RecordId="10" Table="Comorbidities" Field="ComorbDate" ID="ComorbDate_10"
                    runat="server" Width="1px" Style="display:none;"/>             
                <euc:EformTextBox RecordId="10" Table="Comorbidities" Field="Comorbidity" ID="Comorbidity_10" Value="Diabetes"
                    runat="server" Width="1px" Style="display:none;" /></td>
            <td  height="28" class="ClinicalEformGridColumnOne"><strong>&nbsp&nbsp Grade / Severity </strong>
                <euc:EformComboBox RecordId="10" Table="Comorbidities" Field="ComorbGrade" ID="ComorbGrade_10" 
                    runat="server" Width="100px" LookupCode="ComorbSeverity" />
            </td>
        </tr>
    </table>
</div>
<br/><br/><br/>

<script type="text/javascript">

    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'),
                   $('<%= ComorbDateText_10.ClientID %>'), $('<%= ComorbDate_10.ClientID %>'), $('<%= Comorbidity_10.ClientID %>'), 
                   $('<%= ComorbGrade_10.ClientID %>'));


    function addAbsentEvent(comorbRecordedID, comorbDivID, comorbAbsentDivID,
                            comorbDateTextID, comorbDateID, comorbidityID, 
                            comorbGradeID) {
        $(comorbRecordedID).addEvent('click', curry(ComorbYesNo, comorbRecordedID, comorbDivID, comorbAbsentDivID, comorbDateTextID, comorbDateID, comorbidityID, comorbGradeID));
        $(comorbDateTextID).addEvent('blur', curry(ComorbYesNo, comorbRecordedID, comorbDivID, comorbAbsentDivID, comorbDateTextID, comorbDateID, comorbidityID, comorbGradeID));
        $(comorbDateID).addEvent('blur', curry(ComorbYesNo, comorbRecordedID, comorbDivID, comorbAbsentDivID, comorbDateTextID, comorbDateID, comorbidityID, comorbGradeID));
        $(comorbidityID).addEvent('blur', curry(ComorbYesNo, comorbRecordedID, comorbDivID, comorbAbsentDivID, comorbDateTextID, comorbDateID, comorbidityID, comorbGradeID));
        $(comorbGradeID).addEvent('blur', curry(ComorbYesNo, comorbRecordedID, comorbDivID, comorbAbsentDivID, comorbDateTextID, comorbDateID, comorbidityID, comorbGradeID));

        ComorbYesNo(comorbRecordedID, comorbDivID, comorbAbsentDivID, comorbDateTextID, comorbDateID, comorbidityID, comorbGradeID);

    }

    function ComorbYesNo(comorbRecordedID, comorbDivID, comorbAbsentDivID, comorbDateTextID, comorbDateID, comorbidityID, comorbGradeID) {

        var comorbRecordedRef = comorbRecordedID.getElementsByTagName('input');

        for (var i = 0; i < comorbRecordedRef.length; i++)
            if (comorbRecordedRef[i].checked) {
                ComorbRadioClick(comorbRecordedRef[i].value, comorbDivID, comorbAbsentDivID, comorbDateTextID, comorbDateID, comorbidityID, comorbGradeID);
            }
    }

    function ComorbRadioClick(comorbRecorded_value, comorbDivID, comorbAbsentDivID, comorbDateTextID, comorbDateID, comorbidityID, comorbGradeID) {

        if (comorbRecorded_value == "Yes") {

            comorbDivID.style.display = "block";
            comorbAbsentDivID.display = "none";

            document.getElementById('<%= AbsentDateText_1.ClientID %>').value = '';
            document.getElementById('<%= AbsentDate_1.ClientID %>').value = '';
            document.getElementById('<%= TableName_1.ClientID %>').value = '';
            document.getElementById('<%= FieldName_1.ClientID %>').value = '';
            document.getElementById('<%= FieldValue_1.ClientID %>').value = '';
            document.getElementById('<%= AbsentReason_1.ClientID %>').value = '';
            document.getElementById('<%= AbsentQuality_1.ClientID %>').value = '';
        }
        else if (comorbRecorded_value == "No") {

            comorbDivID.style.display = "none";
            comorbAbsentDivID.display = "block";

            document.getElementById('<%= TableName_1.ClientID %>').value = 'Comorbidities';
            document.getElementById('<%= FieldName_1.ClientID %>').value = 'Comorbidity';
            document.getElementById('<%= FieldValue_1.ClientID %>').value = 'Diabetes';
            document.getElementById('<%= AbsentReason_1.ClientID %>').value = 'None Recorded';
            document.getElementById('<%= AbsentQuality_1.ClientID %>').value = 'STD';

            comorbDateTextID.value = '';
            comorbDateID.value = '';
            comorbidityID.value = '';
            comorbGradeID.value = '';                
        }
    }

</script>