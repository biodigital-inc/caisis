<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateContour" CodeFile="BiopsyOfProstateContour.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="ProstateContour" id="ProstateContour" />
<span class="controlBoxTitle">&nbsp;Prostate Contour</span>
<table border="0" cellspacing="0" cellpadding="2" width="650" class="eformLargePopulatedTable">
   <tr >
	<td width="80%" style="padding-top: 20px;padding-bottom: 20px;">	
		<euc:EformCheckboxList Table="DxImageProstate" Field="ImgProstateContour" id="ImgProstateContour" ShowOther="true" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="7" runat="server" >	
		    <asp:ListItem  >Smooth</asp:ListItem>
			<asp:ListItem  >Irregular</asp:ListItem>
		    <asp:ListItem  >Right</asp:ListItem>
			<asp:ListItem  >Left</asp:ListItem>		
		</euc:EformCheckboxList> 	
	</td>
  </tr>
 </table>
<br/><br/>