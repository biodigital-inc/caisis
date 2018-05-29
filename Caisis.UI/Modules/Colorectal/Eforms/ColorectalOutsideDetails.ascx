<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.ColorectalOutsideDetails" CodeFile="ColorectalOutsideDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<div style="margin-top: -50px; padding-bottom: 200px;">
<a name="ColorectalOutsideDetails" id="ColorectalOutsideDetails" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>




<table id="ColorectalOutsideDetailsHTMLTable" border="0" cellspacing="0" cellpadding="6" width="600" class="eformLargePopulatedTable">
<tr  id="OutsideORAndProcDetailsToggleContainer" >
	<td style="padding: 14px;">
        <euc:EformCheckBox ID="OutsideORAndProcDetails" Table="NoTable" Field="OutsideORAndProcDetails" runat="server" Value="None" /> <span style="font-weight: bold; font-size: 14px;">Pathology</span>&nbsp;&nbsp;(Check here to add details for outside procedure.)
	</td>
</tr>
<tr id="OutsideORAndProcDetailsContainer" style="display: none;" >
    <td style="padding: 14px; padding-left: 30px;"><strong>Outside Procedure</strong><br />
    <table style="border: solid 1px #cccccc; background-color: #e1e1e1;">
    <tr>
	<td title="Usually initial visit date"><%-- onmouseover="copyColorectalORProcDateVals();" onmouseout="copyColorectalORProcDateVals();" --%>
		<strong>Slide Submission Date</strong>
	</td>
	<td>
		<euc:EformTextBox Runat="server" RecordId="1"  ID="OpDateText" TABLE="OperatingRoomDetails" FIELD="OpDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	    <euc:EformTextBox RecordId="1" Runat="server" ID="OpDate" Table="OperatingRoomDetails" Field="OpDate" style="display: none;" />
	</td>
	</tr>
	<tr>
	<td title="Date the procedure was performed" ><%-- onmouseover="copyColorectalORProcDateVals();" onmouseout="copyColorectalORProcDateVals();" --%>
		<strong>Outside Procedure Date</strong>
	</td>
	<td>
		<euc:EformTextBox Runat="server" RecordId="1"  ID="ProcDateText" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	    <euc:EformTextBox RecordId="1" Runat="server" ID="ProcDate" Table="Procedures" Field="ProcDate" style="display: none;" />
	    <%--
		<euc:EformTextBox Runat="server" ID="ProcDateText" Table="Procedures" RecordId="1" Field="ProcDateText" style="display: none;" />
		<euc:EformTextBox Runat="server" ID="ProcDate" Table="Procedures" RecordId="1" Field="ProcDate" style="display: none;" />
		--%>
	</td>
	</tr>
	<tr>
    <td>
		<strong>Procedure</strong>
	</td>
	<td>
	    <euc:EformComboBox runat="server"  LookupCode="ProcName" style="width:350px;" Field="ProcName" RecordId="1" Table="Procedures" id="ProcName" />
	</td>
	</tr></table></td>
</tr>
</table>
<script type="text/javascript">
showHideBasedOnCheckboxToggle($('OutsideORAndProcDetailsToggleContainer'), $('OutsideORAndProcDetailsContainer'));
function copyColorectalORProcDateVals()
{
    var ORDateTextField = $('<% = OpDateText.ClientID %>');
    var ORDateField = $('<% = OpDate.ClientID %>');
    var ProcDateTextField = $('<% = ProcDateText.ClientID %>');
    var ProcDateField = $('<% = ProcDate.ClientID %>');
    
    ProcDateTextField.value = ORDateTextField.value;
    ProcDateField.value = ORDateField.value;

    
}
</script>
</div>
<br /><br /><br />