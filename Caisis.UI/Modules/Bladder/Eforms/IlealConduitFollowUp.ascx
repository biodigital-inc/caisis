<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.IlealConduitFollowUp" CodeFile="IlealConduitFollowUp.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<style type="text/css">
.IlealConduitSectionTable
{
	border: solid 1px #cccccc;
	border-collapse: collapse;
	margin-bottom: 20px;
}
.IlealConduitSectionTable td
{
	border-top: solid 1px #cccccc;
	border-bottom: solid 1px #cccccc;
	padding: 7px 6px 7px 6px;
}

table#IlealConduitApplianceTable td
{
	border-top: none;
	border-bottom: none;
}

</style>


<a name="IlealConduitFollowUp" id="IlealConduitFollowUp" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Ileal Conduit Diversion"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;"><strong>Ileal Conduit Diversion Performed?</strong><euc:EformRadioButtonList Table="NoTable" Field="IlealConduitDiversionFollowUpData" id="IlealConduitDiversionFollowUpData" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;">
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
 <tr id="IlealConduitFollowUpDetails" style="display: none;">
    <td>


<strong style="display: block;">Conduit Stoma</strong>
<table cellspacing="0" class="IlealConduitSectionTable" >

  <tr>
    <td style="text-align: left; border: none;">Pink and Viable</td>  
    <td style="border: none;" ><euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="1" ParentRecordId="211" id="SurveyItemResult_11_1" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList>

	</td>
  </tr>
  <tr>
    <td style="text-align: left; border: none;">Stoma Type</td>  
    <td style="border: none;" ><euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="2" ParentRecordId="211" id="SurveyItemResult_11_2" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		    <asp:ListItem>Turnbull</asp:ListItem>
            <asp:ListItem>Rosebud</asp:ListItem>
		</euc:EformRadioButtonList>

	</td>
  </tr>
  <tr>
    <td style="text-align: left; border-bottom: none;">Stomal Stenosis</td>  
    <td style="border-bottom: none;" ><euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="3" ParentRecordId="211" id="SurveyItemResult_11_3" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList>

	</td>
  </tr>
  <tr>
    <td style="text-align: left; border: none; padding-top: 0px; padding-bottom: 0px;">Required Revision</td>  
    <td style="border: none; padding-top: 0px; padding-bottom: 0px;" ><euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="4" ParentRecordId="211" id="SurveyItemResult_11_4" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList>
	</td>
  </tr>
  <tr>
    <td style="text-align: left; border: none;">Revision Date</td>  
    <td style="border: none;" >
	
	<euc:EformTextBox Runat="server" ID="StomalStenosisRevisionDateText" TABLE="SurveyItems" FIELD="SurveyItemResult" RecordId="5" ParentRecordId="211" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden Runat="server" ID="StomalStenosisRevisionDate" Table="SurveyItems" Field="SurveyItemResult" RecordId="6" ParentRecordId="211" />
	
	</td>
  </tr>
  <tr>
    <td style="text-align: left; border-bottom: none;">Peristomal Hernia</td>  
    <td style="border-bottom: none;" ><euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="7" ParentRecordId="211" id="SurveyItemResult_11_7" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList>

	</td>
  </tr>
  <tr>
    <td style="text-align: left; border: none; padding-top: 0px; padding-bottom: 0px;">Required Revision</td>  
    <td style="border: none; padding-top: 0px; padding-bottom: 0px;" ><euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="8" ParentRecordId="211" id="SurveyItemResult_11_8" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList>
	</td>
  </tr>
  <tr>
    <td style="text-align: left; border: none;">Revision Date</td>  
    <td style="border: none;" ><euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" Table="SurveyItems"  RecordId="9" ParentRecordId="211"  Field="SurveyItemResult" Runat="server" ID="PeristomalHerniaRevisionDateText" />
							<euc:EformHidden Runat="server" ID="PeristomalHerniaRevisionDate" Table="SurveyItems"  RecordId="10" ParentRecordId="211"   Field="SurveyItemResult" />
	</td>
  </tr>
  
</table>

<strong style="display: block;">Appliance</strong>
<table id="IlealConduitApplianceTable" cellspacing="0" class="IlealConduitSectionTable" >
  <tr>
    <td ><euc:EformCheckBox Field="SurveyItemResult" Table="SurveyItems" RecordId="11" ParentRecordId="211" Runat="server" id="SurveyItemResult_11_11"  Value="True"  />No Problems or Leakage</td>
  </tr>
  <tr>
    <td style="text-align: left;"># Days Between Plate Changes&nbsp;&nbsp;
	<euc:EformTextBox  style="width:50px;" Table="SurveyItems"  Field="SurveyItemResult" RecordId="12" ParentRecordId="211" Runat="server" ID="SurveyItemResult_11_12" /></td>
  </tr>
  <tr>
    <td ><euc:EformCheckBox Field="SurveyItemResult" Table="SurveyItems" RecordId="13" ParentRecordId="211" Runat="server" id="SurveyItemResult_11_13"  Value="True"  />Uses Abdominal Binder</td>
  </tr>
  <tr>
    <td ><euc:EformCheckBox Field="SurveyItemResult" Table="SurveyItems" RecordId="14" ParentRecordId="211" Runat="server" id="SurveyItemResult_11_14"  Value="True"  />Uses Appliance Belt</td>
  </tr>
</table>
		
		



	
    </td>
  </tr>
</table>
<br/><br/>

<script type="text/javascript">
showHideBasedOnRadioToggle($('<% = IlealConduitDiversionFollowUpData.ClientID %>'), $('IlealConduitFollowUpDetails'), 'Yes', 'No');
</script>