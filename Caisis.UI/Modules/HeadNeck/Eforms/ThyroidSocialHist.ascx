<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.ThyroidSocialHist" CodeFile="ThyroidSocialHist.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    function updateSocHxQlty()
	{
	    document.getElementById('<%= SocHxQuality_1.ClientID %>').value='STD';
	}
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="ThyroidSocialHist" /><span class="controlBoxTitle">Social History</span> <br/>

<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SocialHistoryTable">
  <tr> 
    <td width="45%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Tobacco Use</td>
    <td width="45%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" colspan="2">&nbsp;Alcohol Use</td>
  </tr>
  
  <asp:Repeater ID="SocialHx" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('SocialHistories', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'SocHxTobaccoType,SocHxAlcohol', 'SocialHistoryTable');">
		   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoType")%></td>
		   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxAlcohol")%></td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr id="emptySocHxRow" runat="server" visible="false" > 
    <td height="28" ><euc:EformDropDownList style="width:125px;" TABLE="SocialHistories" FIELD="SocHxTobaccoType" ID="SocHxTobaccoType_1" Runat="server" TabIndex="1" LookupCode="SocHxTobaccoType" onblur="updateSocHxQlty();" /></td>
    <td height="28" ><euc:EformDropDownList style="width:125px;" TABLE="SocialHistories" FIELD="SocHxAlcohol"    ID="SocHxAlcohol_1" Runat="server" TabIndex="2" LookupCode="AlcoholUsage"  />
    <euc:EformTextBox TABLE="SocialHistories" FIELD="SocHxQuality" ID="SocHxQuality_1" Runat="server" Width="1px" style="display:none;" />
    </td>
  </tr>  
</table>
<br/><br/>