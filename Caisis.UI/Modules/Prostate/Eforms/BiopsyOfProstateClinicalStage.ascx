<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateClinicalStage" CodeFile="BiopsyOfProstateClinicalStage.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="BiopsyOfProstateClinicalStage" id="BiopsyOfProstateClinicalStage" />
<table border="0" cellspacing="0" cellpadding="2" width="650" class="eformLargePopulatedTable">

 <tr >
	<td width="35%" style="padding-top: 20px;padding-bottom: 20px;"><span class="controlBoxTitle">Digital Rectal Examination</span><br/>
	</td>
	<td style="padding-top: 20px;padding-bottom: 20px;">
			<euc:EformRadioButtonList Table="EncRectalExams" Field="DRE_Result" id="DRE_Result" RepeatLayout="Table" RepeatDirection="Horizontal" runat="server">		
			<asp:ListItem  >Normal</asp:ListItem>
			<asp:ListItem  >Abnormal</asp:ListItem>
			<asp:ListItem  >Abnormal Malignant</asp:ListItem>
	        </euc:EformRadioButtonList>
	</td>

  </tr>

  
 </table>
<br/><br/>
