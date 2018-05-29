<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.SiteMarking" CodeFile="SiteMarking.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="SiteMarking" id="SiteMarking" />
<span class="controlBoxTitle">Site Marking</span><br/>

<table border="0" cellspacing="0" cellpadding="16" width="600">
  
  <tr>
    <td class="eformLargePopulatedTable">
    
        The procedure site/side has been marked and the marking is in concordance with the consent and patient.<br />
    
    
        <euc:EformRadioButtonList style="margin-left: 220px;" TABLE="NoTable" FIELD="SiteMarking" id="SiteMarkingList" CellSpacing="6" RepeatLayout="Table" RepeatDirection="Horizontal" runat="server">
				<asp:ListItem >Yes</asp:ListItem>
				<asp:ListItem>N/A</asp:ListItem>
				</euc:EformRadioButtonList>
        
    </td>
  </tr>
 
</table>

<br/><br/><br/>