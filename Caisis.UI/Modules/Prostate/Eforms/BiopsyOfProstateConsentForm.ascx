<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateConsentForm" CodeFile="BiopsyOfProstateConsentForm.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="BiopsyOfProstateConsentForm" id="BiopsyOfProstateConsentForm" />
<span class="controlBoxTitle">Consent Form</span><br/>

<table border="0" cellspacing="0" cellpadding="16" width="650" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		
			<euc:EformRadioButtonList Table="NoTable" Field="ConsentForm" id="ConsentForm" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">		
			<asp:ListItem  >Yes</asp:ListItem>
			<asp:ListItem  >No</asp:ListItem>
	        </euc:EformRadioButtonList>
		       
	</td>

  </tr>
 </table>
<br/><br/>
