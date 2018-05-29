<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.HPI_Kidney" CodeFile="HPI_Kidney.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="HPI_Kidney" /><span class="controlBoxTitle">HPI</span><br/>
<asp:Literal ID="NoHPIMsg" Runat="server" Visible="False">No history of present illness found for this patient.</asp:Literal>
<table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable">

        <asp:Repeater ID="hpi" runat="server" OnItemDataBound="SetHpiItem">
		<ItemTemplate>
				<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "TableName") %>', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, '', 'HPI_Kidney', '<%# DataBinder.Eval(Container.DataItem, "ChildTableNames") %>');"  <%# Eval("patientHPI").ToString().ToUpper().IndexOf("PROTOCOL")>-1 ? "style=\"font-weight: bold;\"" : "" %>>  
	                <td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "patientHPI") %></span><%# DataBinder.Eval(Container.DataItem, "ChildTableNames") %></td>
                </tr>  
		</ItemTemplate>
	  </asp:Repeater>

</table>
<br/>
<br/>
<br/>