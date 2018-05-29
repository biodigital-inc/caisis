<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PainAndAnxietyInventory" CodeFile="PainAndAnxietyInventory.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="PainAndAnxietyInventory" />
<script type="text/javascript">
    function setSurveyRecord() {
        if ((jQuery('#<% = SurveyItemResult_1.ClientID %>').val().length > 0) || (jQuery('#<% = SurveyItemResult_2.ClientID %>').val().length > 0) || (jQuery('#<% = SurveyItemResult_3.ClientID %>').val().length > 0) || (jQuery('#<% = SurveyItemResult_4.ClientID %>').val().length > 0)) jQuery('#<% = SurveyType.ClientID %>').val('Prostate Biopsy Pain and Anxiety Inventory');
        else jQuery('#<% = SurveyType.ClientID %>').val('');
    }
</script>


<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pain And Anxiety Inventory"></asp:Label>
<table border="0" cellspacing="0" cellpadding="6" class="eformLargePopulatedTable">
   <tr >
	<td><euc:EformDefaultLabel ID="SurveyItemNum_1" runat="server" DefaultField="SurveyItems.SurveyItemNum,1" /></td>
	<td><euc:EformDefaultLabel ID="SurveyItem_1" runat="server" DefaultField="SurveyItems.SurveyItem,1" /></td>
	<td>
		<euc:EformDropDownList Table="SurveyItems" RecordId="1" ParentRecordId="1" Field="SurveyItemResult" id="SurveyItemResult_1" runat="server" onchange="setSurveyRecord();" >
		    <asp:ListItem Text="" Value="" />
		    <asp:ListItem Text="0: No Pain" Value="0" />
		    <asp:ListItem Text="0.5" Value="0.5" />
		    <asp:ListItem Text="1" Value="1" />
		    <asp:ListItem Text="1.5" Value="1.5" />
		    <asp:ListItem Text="2" Value="2" />
		    <asp:ListItem Text="2.5" Value="2.5" />
		    <asp:ListItem Text="3" Value="3" />
		    <asp:ListItem Text="3.5" Value="3.5" />
		    <asp:ListItem Text="4" Value="4" />
		    <asp:ListItem Text="4.5" Value="4.5" />
		    <asp:ListItem Text="5" Value="5" />
		    <asp:ListItem Text="5.5" Value="5.5" />
		    <asp:ListItem Text="6" Value="6" />
		    <asp:ListItem Text="6.5" Value="6.5" />
		    <asp:ListItem Text="7" Value="7" />
		    <asp:ListItem Text="7.5" Value="7.5" />
		    <asp:ListItem Text="8" Value="8" />
		    <asp:ListItem Text="8.5" Value="8.5" />
		    <asp:ListItem Text="9" Value="9" />
		    <asp:ListItem Text="9.5" Value="9.5" />
		    <asp:ListItem Text="10: Very Severe Pain" Value="10" />
		</euc:EformDropDownList> 	
	</td>
  </tr>
   <tr >
	<td><euc:EformDefaultLabel ID="SurveyItemNum_2" runat="server" DefaultField="SurveyItems.SurveyItemNum,2" /></td>
	<td><euc:EformDefaultLabel ID="SurveyItem_2" runat="server" DefaultField="SurveyItems.SurveyItem,2" /></td>
	<td>
		<euc:EformDropDownList Table="SurveyItems" RecordId="2" ParentRecordId="1" Field="SurveyItemResult" id="SurveyItemResult_2" runat="server" onchange="setSurveyRecord();" >
		    <asp:ListItem Text="" Value="" />
		    <asp:ListItem Text="0: Very Comfortable" Value="0" />
		    <asp:ListItem Text="0.5" Value="0.5" />
		    <asp:ListItem Text="1" Value="1" />
		    <asp:ListItem Text="1.5" Value="1.5" />
		    <asp:ListItem Text="2" Value="2" />
		    <asp:ListItem Text="2.5" Value="2.5" />
		    <asp:ListItem Text="3" Value="3" />
		    <asp:ListItem Text="3.5" Value="3.5" />
		    <asp:ListItem Text="4" Value="4" />
		    <asp:ListItem Text="4.5" Value="4.5" />
		    <asp:ListItem Text="5" Value="5" />
		    <asp:ListItem Text="5.5" Value="5.5" />
		    <asp:ListItem Text="6" Value="6" />
		    <asp:ListItem Text="6.5" Value="6.5" />
		    <asp:ListItem Text="7" Value="7" />
		    <asp:ListItem Text="7.5" Value="7.5" />
		    <asp:ListItem Text="8" Value="8" />
		    <asp:ListItem Text="8.5" Value="8.5" />
		    <asp:ListItem Text="9" Value="9" />
		    <asp:ListItem Text="9.5" Value="9.5" />
		    <asp:ListItem Text="10: Very Uncomfortable" Value="10" />
		</euc:EformDropDownList> 	
	</td>
  </tr>
   <tr >
	<td><euc:EformDefaultLabel ID="SurveyItemNum_3" runat="server" DefaultField="SurveyItems.SurveyItemNum,3" /></td>
	<td><euc:EformDefaultLabel ID="SurveyItem_3" runat="server" DefaultField="SurveyItems.SurveyItem,3" /></td>
	<td>
		<euc:EformDropDownList Table="SurveyItems" RecordId="3" ParentRecordId="1" Field="SurveyItemResult" id="SurveyItemResult_3" runat="server" onchange="setSurveyRecord();" >
		    <asp:ListItem Text="" Value="" />
		    <asp:ListItem Text="0: Calm" Value="0" />
		    <asp:ListItem Text="0.5" Value="0.5" />
		    <asp:ListItem Text="1" Value="1" />
		    <asp:ListItem Text="1.5" Value="1.5" />
		    <asp:ListItem Text="2" Value="2" />
		    <asp:ListItem Text="2.5" Value="2.5" />
		    <asp:ListItem Text="3" Value="3" />
		    <asp:ListItem Text="3.5" Value="3.5" />
		    <asp:ListItem Text="4" Value="4" />
		    <asp:ListItem Text="4.5" Value="4.5" />
		    <asp:ListItem Text="5" Value="5" />
		    <asp:ListItem Text="5.5" Value="5.5" />
		    <asp:ListItem Text="6" Value="6" />
		    <asp:ListItem Text="6.5" Value="6.5" />
		    <asp:ListItem Text="7" Value="7" />
		    <asp:ListItem Text="7.5" Value="7.5" />
		    <asp:ListItem Text="8" Value="8" />
		    <asp:ListItem Text="8.5" Value="8.5" />
		    <asp:ListItem Text="9" Value="9" />
		    <asp:ListItem Text="9.5" Value="9.5" />
		    <asp:ListItem Text="10: Very Anxious" Value="10" />
		</euc:EformDropDownList> 	
	</td>
  </tr>
   <tr >
	<td><euc:EformDefaultLabel ID="SurveyItemNum_4" runat="server" DefaultField="SurveyItems.SurveyItemNum,4" /></td>
	<td><euc:EformDefaultLabel ID="SurveyItem_4" runat="server" DefaultField="SurveyItems.SurveyItem,4" /></td>
	<td>
		<euc:EformDropDownList Table="SurveyItems" RecordId="4" ParentRecordId="1" Field="SurveyItemResult" id="SurveyItemResult_4" runat="server" onchange="setSurveyRecord();" >
		    <asp:ListItem Text="" Value="" />
		    <asp:ListItem Text="0: Easy, No Problem" Value="0" />
		    <asp:ListItem Text="0.5" Value="0.5" />
		    <asp:ListItem Text="1" Value="1" />
		    <asp:ListItem Text="1.5" Value="1.5" />
		    <asp:ListItem Text="2" Value="2" />
		    <asp:ListItem Text="2.5" Value="2.5" />
		    <asp:ListItem Text="3" Value="3" />
		    <asp:ListItem Text="3.5" Value="3.5" />
		    <asp:ListItem Text="4" Value="4" />
		    <asp:ListItem Text="4.5" Value="4.5" />
		    <asp:ListItem Text="5" Value="5" />
		    <asp:ListItem Text="5.5" Value="5.5" />
		    <asp:ListItem Text="6" Value="6" />
		    <asp:ListItem Text="6.5" Value="6.5" />
		    <asp:ListItem Text="7" Value="7" />
		    <asp:ListItem Text="7.5" Value="7.5" />
		    <asp:ListItem Text="8" Value="8" />
		    <asp:ListItem Text="8.5" Value="8.5" />
		    <asp:ListItem Text="9" Value="9" />
		    <asp:ListItem Text="9.5" Value="9.5" />
		    <asp:ListItem Text="10: Unable to Tolerate" Value="10" />
		</euc:EformDropDownList> 	
	</td>
  </tr>
 </table>
<euc:EformTextBox ID="SurveyType" runat="server" Table="Surveys" RecordId="1" Field="SurveyType" style="display: none;" />

<br/><br/>