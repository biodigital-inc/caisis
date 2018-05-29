<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.UreteralAnastamosis" CodeFile="UreteralAnastamosis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<style type="text/css">
table.UreteralAnastamosisTable
{
    border: solid 1px #cccccc;
    width: 320px;
    margin: 10px 10px 10px 10px;
}

table.UreteralAnastamosisTable td
{
    padding: 16px 4px 16px 4px;
    font-weight: bold;
}
</style>

<a name="UreteralAnastamosis" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Ureteral Anastamosis"></asp:Label>

<table border="0" cellspacing="0"    class="eformLargePopulatedTable">
  <tr>
    <td>
        <table border="0" cellspacing="0"   class="eformLargePopulatedTable UreteralAnastamosisTable">
          <tr>
            <td colspan="2" style="text-align: left; border-bottom: none;">Hydronephrosis&nbsp;&nbsp;<euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="1" ParentRecordId="212" id="SurveyItemResult_12_1" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		            <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
		        </euc:EformRadioButtonList>
	        </td>
          </tr>
          <tr>
            <td style="text-align: left; border: none; padding-top: 0px; padding-bottom: 0px;">Date</td>  
            <td style="border: none; padding-top: 0px; padding-bottom: 0px;" >
                <euc:EformTextBox Runat="server" id="HydronephrosisDateText" TABLE="SurveyItems" FIELD="SurveyItemResult" RecordId="2" ParentRecordId="212" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	            <euc:EformTextBox style="display: none;" Runat="server" ID="HydronephrosisDate" Table="SurveyItems" Field="SurveyItemResult" RecordId="3" ParentRecordId="212" />

	        </td>
          </tr>
          <tr>
            <td style="text-align: left; border: none;">Side</td>  
            <td style="border: none;" >
        	
                <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="4" ParentRecordId="212" id="SurveyItemResult_12_4" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" Uncheckable="true"  >
		            <asp:ListItem>Left</asp:ListItem>
		            <asp:ListItem>Right</asp:ListItem>
                    <asp:ListItem>Bilateral</asp:ListItem>
		        </euc:EformRadioButtonList>        	
	        </td>
          </tr>
        </table>
    </td>
    <td style="padding-left: 20px;">
        <table border="0" cellspacing="0"  class="eformLargePopulatedTable UreteralAnastamosisTable">
          <tr>
            <td colspan="2" style="text-align: left; border-bottom: none;">Ureteral Stenosis&nbsp;&nbsp;<euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="9" ParentRecordId="212" id="SurveyItemResult_12_9" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		            <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
		        </euc:EformRadioButtonList>
	        </td>
          </tr>
          <tr>
            <td style="text-align: left; border: none; padding-top: 0px; padding-bottom: 0px;">Date</td>  
            <td style="border: none; padding-top: 0px; padding-bottom: 0px;" >
                <euc:EformTextBox Runat="server" id="UreteralStenosisDateText" TABLE="SurveyItems" FIELD="SurveyItemResult" RecordId="10" ParentRecordId="212" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	            <euc:EformTextBox style="display: none;" Runat="server" ID="UreteralStenosisDate" Table="SurveyItems" Field="SurveyItemResult" RecordId="11" ParentRecordId="212" />
	        </td>
          </tr>
          <tr>
            <td style="text-align: left; border: none;">Side</td>  
            <td style="border: none;" >
        	
                <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="12" ParentRecordId="212" id="SurveyItemResult_12_12" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" Uncheckable="true"  >
		            <asp:ListItem>Left</asp:ListItem>
		            <asp:ListItem>Right</asp:ListItem>
                    <asp:ListItem>Bilateral</asp:ListItem>
		        </euc:EformRadioButtonList>        	
	        </td>
          </tr>
        </table>
    </td>
  </tr>
  
  
  <tr>
    <td>
        <table border="0" cellspacing="0"   class="eformLargePopulatedTable UreteralAnastamosisTable">
          <tr>
            <td colspan="2" style="text-align: left; border-bottom: none;">Upper Tract Recurrence&nbsp;&nbsp;<euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="5" ParentRecordId="212" id="SurveyItemResult_12_5" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		            <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
		        </euc:EformRadioButtonList>
	        </td>
          </tr>
          <tr>
            <td style="text-align: left; border: none; padding-top: 0px; padding-bottom: 0px;">Date</td>  
            <td style="border: none; padding-top: 0px; padding-bottom: 0px;" >
                <euc:EformTextBox Runat="server" id="UpperTractRecurrenceDateText" TABLE="SurveyItems" FIELD="SurveyItemResult" RecordId="6" ParentRecordId="212" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	            <euc:EformTextBox style="display: none;" Runat="server" ID="UpperTractRecurrenceDate" Table="SurveyItems" Field="SurveyItemResult" RecordId="7" ParentRecordId="212" />



	        </td>
          </tr>
          <tr>
            <td style="text-align: left; border: none;">Side</td>  
            <td style="border: none;" >
        	
                <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="8" ParentRecordId="212" id="SurveyItemResult_12_8" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" Uncheckable="true"  >
		            <asp:ListItem>Left</asp:ListItem>
		            <asp:ListItem>Right</asp:ListItem>
                    <asp:ListItem>Bilateral</asp:ListItem>
		        </euc:EformRadioButtonList>        	
	        </td>
          </tr>
        </table>
    </td>
    <td style="padding-left: 20px;">
        <table border="0" cellspacing="0"  class="eformLargePopulatedTable UreteralAnastamosisTable">
          <tr>
            <td colspan="2" style="text-align: left; border-bottom: none;">Required Revision or AI Procedure&nbsp;&nbsp;<euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="13" ParentRecordId="212" id="SurveyItemResult_12_13" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"  >
		            <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
		        </euc:EformRadioButtonList>
	        </td>
          </tr>
          <tr>
            <td style="text-align: left; border: none; padding-top: 0px; padding-bottom: 0px;">Date</td>  
            <td style="border: none; padding-top: 0px; padding-bottom: 0px;" >
                <euc:EformTextBox Runat="server" id="RequiredRevisionorAIProcedureDateText" TABLE="SurveyItems" FIELD="SurveyItemResult" RecordId="14" ParentRecordId="212" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	            <euc:EformTextBox style="display: none;" Runat="server" ID="RequiredRevisionorAIProcedureDate" Table="SurveyItems" Field="SurveyItemResult" RecordId="15" ParentRecordId="212" />
	        </td>
          </tr>
          <tr>
            <td style="text-align: left; border: none;">Side</td>  
            <td style="border: none;" >
        	
                <euc:EformRadioButtonList Table="SurveyItems" Field="SurveyItemResult"  RecordId="16" ParentRecordId="212" id="SurveyItemResult_12_16" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" Uncheckable="true"  >
		            <asp:ListItem>Left</asp:ListItem>
		            <asp:ListItem>Right</asp:ListItem>
                    <asp:ListItem>Bilateral</asp:ListItem>
		        </euc:EformRadioButtonList>        	
	        </td>
          </tr>
        </table>
    </td>
  </tr>
</table>
<script type="text/javascript" >
</script>
<br/>
<br/>
<br/>
