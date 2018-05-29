<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.IntervalHistory" CodeFile="IntervalHistory.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="IntervalHistory" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Interval History"></asp:Label><br/>

<table border="0" cellspacing="0" cellpadding="16" width="600">
  
  <tr>
    <td class="eformLargePopulatedTable"><euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="HPI_AddedText" Rows="4"  style="width: 560px;"  Runat="server" ID="HPI_AddedText"/></td>
  </tr>
 
</table>
			
	
<br/>
<br/>
<br/>
