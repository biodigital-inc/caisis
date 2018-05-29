<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.IntervalHistoryGeneral" CodeFile="IntervalHistoryGeneral.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<style type="text/css">

</style>

<a name="IntervalHistoryGeneral" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Interval History"></asp:Label><br/>

<table border="0" cellspacing="0" cellpadding="16" width="600" id="IntervalHistoryTable">
  
  <tr>
    <td class="eformLargePopulatedTable"><euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="IntervalHistory" Rows="4"  style="width: 560px;"  Runat="server" ID="IntervalHistory"/></td>
  </tr>
</table>

<br/>
<br/>
<br/>