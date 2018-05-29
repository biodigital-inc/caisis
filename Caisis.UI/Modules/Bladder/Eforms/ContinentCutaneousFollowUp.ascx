<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.ContinentCutaneousFollowUp" CodeFile="ContinentCutaneousFollowUp.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<style type="text/css">
.continentCutaneousSectionTable
{
	border: solid 1px #cccccc;
	border-collapse: collapse;
}
.continentCutaneousSectionTable td
{
	border-top: solid 1px #cccccc;
	border-bottom: solid 1px #cccccc;
	padding: 7px 6px 7px 6px;
}
.continentCutaneousComplicationTable
{
	border: solid 1px #cccccc;
	border-collapse: collapse;
}
.continentCutaneousComplicationTable th
{
	border-top: solid 1px #cccccc;
	border-bottom: solid 1px #cccccc;
	padding: 7px 6px 7px 6px;
	background-color: #e1e1e1;
	text-align: center;
	font-weight: bold;
	font-size: 12px;
	color: #111111;
}
.continentCutaneousComplicationTable td
{
	border-top: solid 1px #cccccc;
	border-bottom: solid 1px #cccccc;
	padding: 7px 6px 7px 6px;
}
</style>


<a name="ContinentCutaneousFollowUp" id="ContinentCutaneousFollowUp" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Continent Cutaneous Diversions"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;"><strong>Continent Cutaneous Diversion Performed?</strong><euc:EformRadioButtonList Table="NoTable" Field="ContinentCutaneousDiversionFollowUpData" id="ContinentCutaneousDiversionFollowUpData" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;">
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
 <tr id="ContinentCutaneousFollowUpDetails" style="display: none;">
    <td>
        
<table cellspacing="0" class="continentCutaneousSectionTable" style="">
  <tr>
    <td style="text-align: left; vertical-align: top; padding-top: 10px;">Cath Interval</td>
    <td ><euc:EformTextBox  style="width:40px;" Table="SurveyItems"  Field="SurveyItemResult" RecordId="1" ParentRecordId="210" Runat="server" ID="SurveyItemResult_10_1" /> hrs
	</td>
  </tr>
  <tr>
    <td style="text-align: left; border: none;">Continence</td>
    <td style="border: none;"><euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="2" ParentRecordId="210" id="SurveyItemResult_10_2" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
			<asp:ListItem Value="Complete" Text="Complete&nbsp;&nbsp;" />   
			<asp:ListItem Value="Leakage" Text="Leakage&nbsp;&nbsp;" /> 
			<asp:ListItem Value="Constant" Text="Constant" /> 
		</euc:EformRadioButtonList>
	</td>
  </tr>
  <tr>
    <td style="text-align: left; border: none;">Within</td>
    <td style="border: none;" ><euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="3" ParentRecordId="210" id="SurveyItemResult_10_3" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
			<asp:ListItem Value="1 Hour" Text="1 Hour&nbsp;&nbsp;" />   
			<asp:ListItem Value="2 Hours" Text="2 Hours&nbsp;&nbsp;" />
			<asp:ListItem Value="4 Hours" Text="4 Hours&nbsp;&nbsp;" /> 
			<asp:ListItem Value="6 Hours" Text="6 Hours" /> 
		</euc:EformRadioButtonList>   
	</td>
  </tr>
  <tr>
    <td style="text-align: left; border: none;"># of Pads</td>
    <td style="border: none;" ><euc:EformTextBox  style="width:50px;" Table="SurveyItems"  Field="SurveyItemResult" RecordId="4" ParentRecordId="210" Runat="server" ID="SurveyItemResult_10_4" /></td>
  </tr>
  <tr>
    <td style="text-align: left; ">Catheter Size</td>
    <td ><euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="5" ParentRecordId="210" id="SurveyItemResult_10_5" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
			<asp:ListItem Value="12 F" Text="12 F&nbsp;&nbsp;" />
			<asp:ListItem Value="14 F" Text="14 F&nbsp;&nbsp;" />
			<asp:ListItem Value="16 F" Text="16 F&nbsp;&nbsp;" />
			<asp:ListItem Value="18 F" Text="18 F&nbsp;&nbsp;" /> 
			<asp:ListItem Value=">20 F" Text=">20 F" /> 
		</euc:EformRadioButtonList>  </td>
  </tr>
  <tr>
    <td style="text-align: left; border: none;">Ease of Catheterization</td>
    <td style="border: none;" ><euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="6" ParentRecordId="210" id="SurveyItemResult_10_6" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
			<asp:ListItem Value="No Difficulty" Text="No Difficulty&nbsp;&nbsp;" />   
			<asp:ListItem Value="<1 /week" Text="<1 /week&nbsp;&nbsp;" />
			<asp:ListItem Value="1 /day" Text="1 /day&nbsp;&nbsp;" /> 
		</euc:EformRadioButtonList>     

	</td>
  </tr>
  <tr>
    <td style="text-align: left; border: none;">Change</td>  
    <td style="border: none;" ><euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="7" ParentRecordId="210" id="SurveyItemResult_10_7" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
			<asp:ListItem Value="Unchanged" Text="Unchanged&nbsp;&nbsp;" />   
			<asp:ListItem Value="Worse" Text="Worse&nbsp;&nbsp;" />
			<asp:ListItem Value="Improved" Text="Improved" /> 
		</euc:EformRadioButtonList>     

	</td>
  </tr>
</table>
<div style="margin-top:24px; font-weight: bold; font-size: 15px;">Complications</div>
<table cellspacing="0" class="continentCutaneousSectionTable">
  <tr>
  	<td><strong>Stoma</strong>
		<table cellspacing="0" class="continentCutaneousComplicationTable" >
		  <tr>
			<th>Complication</th>
			<th>Related to Stoma</th>
			<th>Date</th>
		  </tr>
		  <tr>
			<td><euc:EformComboBox  LookupCode="ToxName_Complication" RecordId="21" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_21" style="width: 120px;"/></td>
			<td>
			<euc:EformRadioButtonList TABLE="Toxicities" FIELD="ToxProbability" RecordId="21" id="ToxProbability_21" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" >
				<asp:ListItem Value="Definite" >Yes&nbsp;</asp:ListItem>
				<asp:ListItem Value="Unrelated" >No</asp:ListItem>
			</euc:EformRadioButtonList>
			</td>
			<td><euc:EformTextBox RecordId="21" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_21"/><euc:EformHidden RecordId="21"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_21"/></td>
		  </tr>
		  <tr>
			<td><euc:EformComboBox  LookupCode="ToxName_Complication" RecordId="22" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_22" style="width: 120px;"/></td>
			<td>
			<euc:EformRadioButtonList TABLE="Toxicities" FIELD="ToxProbability" RecordId="22" id="ToxProbability_22" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" >
				<asp:ListItem Value="Definite" >Yes&nbsp;</asp:ListItem>
				<asp:ListItem Value="Unrelated" >No</asp:ListItem>
			</euc:EformRadioButtonList>
			</td>
			<td><euc:EformTextBox RecordId="22" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_22"/><euc:EformHidden RecordId="22"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_22"/></td>
		  </tr>
		  <tr>
			<td><euc:EformComboBox  LookupCode="ToxName_Complication" RecordId="23" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_23" style="width: 120px;"/></td>
			<td>
			<euc:EformRadioButtonList TABLE="Toxicities" FIELD="ToxProbability" RecordId="23" id="ToxProbability_23" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" >
				<asp:ListItem Value="Definite" >Yes&nbsp;</asp:ListItem>
				<asp:ListItem Value="Unrelated" >No</asp:ListItem>
			</euc:EformRadioButtonList>
			</td>
			<td><euc:EformTextBox RecordId="23" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_23"/><euc:EformHidden RecordId="23"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_23"/></td>
		  </tr>
		  <tr>
			<td><euc:EformComboBox  LookupCode="ToxName_Complication" RecordId="24" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_24" style="width: 120px;"/></td>
			<td>
			<euc:EformRadioButtonList TABLE="Toxicities" FIELD="ToxProbability" RecordId="24" id="ToxProbability_24" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" >
				<asp:ListItem Value="Definite" >Yes&nbsp;</asp:ListItem>
				<asp:ListItem Value="Unrelated" >No</asp:ListItem>
			</euc:EformRadioButtonList>
			</td>
			<td><euc:EformTextBox RecordId="24" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_24"/><euc:EformHidden RecordId="24"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_24"/></td>
		  </tr>
		  <tr>
			<td><euc:EformComboBox  LookupCode="ToxName_Complication" RecordId="25" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_25" style="width: 120px;"/></td>
			<td>
			<euc:EformRadioButtonList TABLE="Toxicities" FIELD="ToxProbability" RecordId="25" id="ToxProbability_25" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" >
				<asp:ListItem Value="Definite" >Yes&nbsp;</asp:ListItem>
				<asp:ListItem Value="Unrelated" >No</asp:ListItem>
			</euc:EformRadioButtonList>
			</td>
			<td><euc:EformTextBox RecordId="25" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_25"/><euc:EformHidden RecordId="25"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_25"/></td>
		  </tr>
		</table>
	</td>
  	<td><strong>Pouch</strong>
		<table cellspacing="0" class="continentCutaneousComplicationTable" style="">
		  <tr>
			<th>Complication</th>
			<th>Related to Pouch</th>
			<th>Date</th>
		  </tr>
		  <tr>
			<td><euc:EformComboBox  LookupCode="ToxName_Complication" RecordId="26" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_26" style="width: 120px;"/></td>
			<td>
			<euc:EformRadioButtonList TABLE="Toxicities" FIELD="ToxProbability" RecordId="26" id="ToxProbability_26" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" >
				<asp:ListItem Value="Definite" >Yes&nbsp;</asp:ListItem>
				<asp:ListItem Value="Unrelated" >No</asp:ListItem>
			</euc:EformRadioButtonList>
			</td>
			<td><euc:EformTextBox RecordId="26" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_26"/><euc:EformHidden RecordId="26"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_26"/></td>
		  </tr>
		  <tr>
			<td><euc:EformComboBox  LookupCode="ToxName_Complication" RecordId="27" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_27" style="width: 120px;"/></td>
			<td>
			<euc:EformRadioButtonList TABLE="Toxicities" FIELD="ToxProbability" RecordId="27" id="ToxProbability_27" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" >
				<asp:ListItem Value="Definite" >Yes&nbsp;</asp:ListItem>
				<asp:ListItem Value="Unrelated" >No</asp:ListItem>
			</euc:EformRadioButtonList>
			</td>
			<td><euc:EformTextBox RecordId="27" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_27"/><euc:EformHidden RecordId="27"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_27"/></td>
		  </tr>
		  <tr>
			<td><euc:EformComboBox  LookupCode="ToxName_Complication" RecordId="28" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_28" style="width: 120px;"/></td>
			<td>
			<euc:EformRadioButtonList TABLE="Toxicities" FIELD="ToxProbability" RecordId="28" id="ToxProbability_28" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" >
				<asp:ListItem Value="Definite" >Yes&nbsp;</asp:ListItem>
				<asp:ListItem Value="Unrelated" >No</asp:ListItem>
			</euc:EformRadioButtonList>
			</td>
			<td><euc:EformTextBox RecordId="28" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_28"/><euc:EformHidden RecordId="28"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_28"/></td>
		  </tr>
		  <tr>
			<td><euc:EformComboBox  LookupCode="ToxName_Complication" RecordId="29" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_29" style="width: 120px;"/></td>
			<td>
			<euc:EformRadioButtonList TABLE="Toxicities" FIELD="ToxProbability" RecordId="29" id="ToxProbability_29" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" >
				<asp:ListItem Value="Definite" >Yes&nbsp;</asp:ListItem>
				<asp:ListItem Value="Unrelated" >No</asp:ListItem>
			</euc:EformRadioButtonList>
			</td>
			<td><euc:EformTextBox RecordId="29" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_29"/><euc:EformHidden RecordId="29"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_29"/></td>
		  </tr>
		  <tr>
			<td><euc:EformComboBox  LookupCode="ToxName_Complication" RecordId="30" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_30" style="width: 120px;"/></td>
			<td>
			<euc:EformRadioButtonList TABLE="Toxicities" FIELD="ToxProbability" RecordId="30" id="ToxProbability_30" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" >
				<asp:ListItem Value="Definite" >Yes&nbsp;</asp:ListItem>
				<asp:ListItem Value="Unrelated" >No</asp:ListItem>
			</euc:EformRadioButtonList>
			</td>
			<td><euc:EformTextBox RecordId="30" ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_30"/><euc:EformHidden RecordId="30"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_30"/></td>
		  </tr>
		</table>
	</td>
  </tr>
</table>

<table cellspacing="0" class="continentCutaneousSectionTable" style="margin-top:20px;">

  <tr>
    <td style="text-align: left; border: none;">Required Revisions</td>  
    <td style="border: none;" ><euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="8" ParentRecordId="210" id="SurveyItemResult_10_8" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList>

	</td>
  </tr>
  <tr>
    <td style="text-align: left; border: none;">Revision Date</td>  
    <td style="border: none;" ><euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" Table="SurveyItems"  RecordId="9" ParentRecordId="210"  Field="SurveyItemResult" Runat="server" ID="RevisionDateText" />
							<euc:EformHidden Runat="server" ID="RevisionDate" Table="SurveyItems"  RecordId="10" ParentRecordId="210"   Field="SurveyItemResult" />
	</td>
  </tr>
  <tr>
    <td style="text-align: left; border: none;">Revision Type</td>  
    <td style="border: none;" ><euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="11" ParentRecordId="210" id="SurveyItemResult_10_11" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
			<asp:ListItem Value="Stomal Stenosis" Text="Stomal Stenosis&nbsp;&nbsp;" />   
			<asp:ListItem Value="Limb Revision" Text="Limb Revision&nbsp;&nbsp;" />
			<asp:ListItem Value="Pouch" Text="Pouch" /> 
		</euc:EformRadioButtonList>
	</td>
  </tr>
</table>
		



	
    </td>
  </tr>
</table>
<br/><br/>

<script type="text/javascript">
showHideBasedOnRadioToggle($('<% = ContinentCutaneousDiversionFollowUpData.ClientID %>'), $('ContinentCutaneousFollowUpDetails'), 'Yes', 'No');
</script>