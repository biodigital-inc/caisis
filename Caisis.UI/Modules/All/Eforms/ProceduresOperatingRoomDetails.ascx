<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ProceduresOperatingRoomDetails" CodeFile="ProceduresOperatingRoomDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="ProceduresOperatingRoomDetails" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Operating Room Details"></asp:Label><br/>
<table width="700" border="0" cellspacing="0" cellpadding="6" class="ClinicalEformTable"  >
          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Surgery Date </td>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Admit Date </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Discharge Date </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Institution </td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          <tr>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformHidden                 RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpDate"     ID="OpDate"     Runat="server"/></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpAdmitDateText" ID="OpAdmitDateText" Runat="server" TabIndex="2"  ShowCalendar="true" CalcDate="true" />
				<euc:EformHidden                 RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpAdmitDate"     ID="OpAdmitDate"     Runat="server"/></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpDischargeDateText" ID="OpDischargeDateText" Runat="server" TabIndex="3"  ShowCalendar="true" CalcDate="true" />
				<euc:EformHidden                 RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpDischargeDate"     ID="OpDischargeDate"     Runat="server"/></td>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpInstitution" ID="OpInstitution"   LookupCode="Institution" Runat="server" TabIndex="4"  /> </td>

          </tr>
          
          <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Case Surgeon </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Service </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Operating Time (min) </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Est Blood Loss  (cc) </td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          <tr>
            <td>
                <euc:EformSelect  Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon" LookupCode="OpSurgeon" Runat="server" TabIndex="5" /></td>

            <td>
                <euc:EformSelect  Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpService" ID="OpService" LookupCode="HospitalService" Runat="server" TabIndex="6" /> </td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false" /></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpEstBloodLoss" ID="OpEstBloodLoss" Runat="server" TabIndex="8"  ShowCalendar="false" CalcDate="false" /></td>

          </tr>
          
          <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;RBC Available (units) </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;RBC Transfused (units) </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Difficulty </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Notes </td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          <tr>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Available" ID="OpRBC_Available" Runat="server" TabIndex="9" /></td>

            <td>
                <euc:EformTextBox  Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Transfused" ID="OpRBC_Transfused" Runat="server" TabIndex="10" /> </td>
            <td>
                <euc:EformSelect  Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpDifficulty" ID="OpDifficulty" LookupCode="SurgDifficulty" Runat="server" TabIndex="11"  ShowCalendar="false" CalcDate="false" /></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpNotes" ID="OpNotes" Runat="server" TabIndex="12"  ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>

          </tr>

 
</table>
<br /><br /><br />


