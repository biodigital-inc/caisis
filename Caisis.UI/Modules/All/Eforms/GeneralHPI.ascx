<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.GeneralHPI" CodeFile="GeneralHPI.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="GeneralHPI" /><span class="controlBoxTitle">HPI</span><br/>
<asp:Literal ID="NoHPIMsg" Runat="server" Visible="False">No history of present illness found for this patient.</asp:Literal>
<table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
  
   	
  <asp:Repeater ID="hpi" OnItemDataBound="SetHpiItem" runat="server" > 
       <ItemTemplate> 
				
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" id="HpiRow" runat="server">  
			<td class="ClinicalEformPopulatedColumn"><asp:Literal id="HpiRowItems" runat="server"/></td>
	    </tr>      

      </ItemTemplate>
  </asp:Repeater>
  

</table>
<br/>
<br/>
<br/>