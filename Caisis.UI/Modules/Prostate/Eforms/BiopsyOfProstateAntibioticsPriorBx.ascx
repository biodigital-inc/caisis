<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateAntibioticsPriorBx" CodeFile="BiopsyOfProstateAntibioticsPriorBx.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="BiopsyOfProstateAntibioticsPriorBx" id="BiopsyOfProstateAntibioticsPriorBx" />
<span class="controlBoxTitle">Antibiotics Prior to Biopsy</span><br/>

<table border="0" cellspacing="0" cellpadding="16" width="650" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		
			<euc:EformRadioButtonList Table="NoTable" Field="AntibioticPriorToBx" id="AntibioticPriorToBx" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">		
			<asp:ListItem  >Yes</asp:ListItem>
			<asp:ListItem  >No</asp:ListItem>
	        </euc:EformRadioButtonList>
		       
	</td>

  </tr>
 </table>
<br/><br/>
