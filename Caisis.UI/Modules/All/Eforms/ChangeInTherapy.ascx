<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ChangeInTherapy" CodeFile="ChangeInTherapy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">

</style>




<a name="ChangeInTherapy"  />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Change in Therapy" /><br/>
<table id="ChangeInTherapyTable" border="0" cellspacing="0" cellpadding="8" width="650"  class="eformLargePopulatedTable" style="table-layout: fixed;">
  <tr>
    <td class="labelTd" style="width: 120px; text-align: right;">Change in Therapy?</td>
    <td id="ChangeInTherapyContainer">
        <euc:EformExtendedRadioButtonList ID="ChangeInTherapyInput" runat="server" Table="NoTable" Field="ChangeInTherapy" RepeatLayout="Table" RepeatDirection="Horizontal" >
            <asp:ListItem >Yes</asp:ListItem>
            <asp:ListItem >No</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
	</td>
  </tr>
  <tr id="ChangeInTherapyReasonContainer" style="display: none;">
    <td class="labelTd" style="text-align: right;">Reason</td>
    <td>
        <euc:EformTextBox  style="width:400px;" TABLE="NoTable" FIELD="ChangeInTherapyReason" Runat="server" ID="ChangeInTherapyReason" ShowTextEditor="true" />	</td>
  </tr>
</table>
<br/><br/><br/>
<script type="text/javascript">
showHideBasedOnRadioToggle($('ChangeInTherapyContainer'), $('ChangeInTherapyReasonContainer'), 'Yes');
</script>