<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.Malignant" CodeFile="Malignant.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="Malignant" id="Malignant" /><span class="controlBoxTitle">Malignant</span>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr>
	<td>		
	    <euc:EformRadioButtonList  RecordId="1" Table="HeadNeckProc" Field="ProcResult" id="ProcFinding" RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="10" runat="server">
		    <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
            <asp:ListItem Value="No" Text="No"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>	
		</euc:EformRadioButtonList>		
	</td>
</tr>   
</table>
<br/><br/><br/>
