<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.HeadNeckApproach" CodeFile="HeadNeckApproach.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="HeadNeckApproach" id="HeadNeckApproach" /><span class="controlBoxTitle">Approach</span>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
	<euc:EformComboBox LookupCode="HeadNeckApproach" Table="Procedures" RecordId="1" Field="ProcApproach" id="ProcApproach" runat="server"></euc:EformComboBox>
	<%--
	<euc:EformRadioButtonList LookupCode="HeadNeckApproach" Table="Procedures" RecordId="1" Field="ProcApproach" id="ProcApproach" ShowOther="true" RepeatLayout="Table" RepeatDirection="Vertical" CellSpacing="0" runat="server">
    <asp:ListItem>test</asp:ListItem>
    </euc:EformRadioButtonList>
    --%>
</td>
		
</tr>   
</table>
<br/><br/><br/>
