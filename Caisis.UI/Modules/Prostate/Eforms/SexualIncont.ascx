<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.SexualIncont" CodeFile="SexualIncont.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<style type="text/css">
table#SexualIncontTbl td
{
	vertical-align: top;
}

</style>


<a name="SexualIncont" /><span class="controlBoxTitle">Sexual Incontinence</span><br />
<table width="700" cellpadding="0" cellspacing="0" class="ClinicalEformTable" id="SexualIncontTbl">
<tr>
<td>

<table width="350" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OrgasmAsstIncontTbl">
    <tr>
      <td colspan="2" style="padding-top:10px;font-weight: bold; font-size: 13px; background-color: #dddddd; color: #111111;">Orgasm Associated Incontinence</td>
      </tr>
    <tr>  
        <td style="padding-top:16px; height: 53px;"><strong>Orgasm Associated Incontinence</strong></td>
        <td style="padding-top:16px; height: 53px;">
            <euc:EformRadioButtonList RecordId="114" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_114" 
                RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" >
                <asp:ListItem  Value="Yes">Yes</asp:ListItem>
			    <asp:ListItem  Value="No">No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Commenced Postop</strong></td>
        <td style="padding-top:16px;">
            <euc:EformTextBox RecordId="115" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_115" Width="80px" /> months</td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Ceased Postop</strong></td>
        <td style="padding-top:16px;">
            <euc:EformTextBox RecordId="116" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_166" Width="80px" /> months</td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Frequency</strong></td>
        <td style="padding-top:16px;">
            <euc:EformRadioButtonList RecordId="117" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_177" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Vertical" >
                <asp:ListItem  Value="Rare">Rare</asp:ListItem>
			    <asp:ListItem  Value="Occasional">Occasional</asp:ListItem>
			    <asp:ListItem  Value="Frequent">Frequent</asp:ListItem>
			    <asp:ListItem  Value="Always">Always</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Level</strong></td>
        <td style="padding-top:16px;">
            <euc:EformRadioButtonList RecordId="118" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_118" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Vertical"  >
                <asp:ListItem  Value="Small">Small</asp:ListItem>
			    <asp:ListItem  Value="Moderate">Moderate</asp:ListItem>
			    <asp:ListItem  Value="Large">Large</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Distress</strong></td>
        <td style="padding-top:16px;">
            <euc:EformRadioButtonList RecordId="119" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_119" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Vertical">
                <asp:ListItem  Value="None">None</asp:ListItem>
			    <asp:ListItem  Value="Minimal">Minimal</asp:ListItem>
			    <asp:ListItem  Value="Moderate">Moderate</asp:ListItem>
			    <asp:ListItem  Value="Severe">Severe</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Treatments Attempted</strong></td>
        <td style="padding-top:16px;">
            <euc:EformRadioButtonList RecordId="120" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_120" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" >
                <asp:ListItem  Value="Imipramine">Imipramine</asp:ListItem>
			    <asp:ListItem  Value="ACTIS">ACTIS</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Improvement</strong></td>
        <td style="padding-top:16px;">
            <euc:EformRadioButtonList RecordId="121" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_121" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" >
                <asp:ListItem  Value="Yes">Yes</asp:ListItem>
			    <asp:ListItem  Value="No">No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table></td>
<td>
<table width="350" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OrgasmAsstIncontTbl">
    <tr>
      <td colspan="2" style="padding-top:10px;font-weight: bold; font-size: 13px; background-color: #dddddd; color: #111111;">Arousal Incontinence</td>
      </tr>
    <tr>  
        <td style="padding-top:16px; height: 53px;"><strong>Arousal Incontinence</strong></td>
        <td style="padding-top:16px; height: 53px;">
            <euc:EformRadioButtonList RecordId="122" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_122" 
                RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" >
                <asp:ListItem  Value="Yes">Yes</asp:ListItem>
			    <asp:ListItem  Value="No">No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Commenced Postop</strong></td>
        <td style="padding-top:16px;">
            <euc:EformTextBox RecordId="123" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_123" Width="80px" /> months</td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Ceased Postop</strong></td>
        <td style="padding-top:16px;">
            <euc:EformTextBox RecordId="124" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_124" Width="80px" /> months</td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Frequency</strong></td>
        <td style="padding-top:16px;">
            <euc:EformRadioButtonList RecordId="125" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_125" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Vertical" >
                <asp:ListItem  Value="Rare">Rare</asp:ListItem>
			    <asp:ListItem  Value="Occasional">Occasional</asp:ListItem>
			    <asp:ListItem  Value="Frequent">Frequent</asp:ListItem>
			    <asp:ListItem  Value="Always">Always</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Level</strong></td>
        <td style="padding-top:16px;">
            <euc:EformRadioButtonList RecordId="126" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_126" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Vertical"  >
                <asp:ListItem  Value="Small">Small</asp:ListItem>
			    <asp:ListItem  Value="Moderate">Moderate</asp:ListItem>
			    <asp:ListItem  Value="Large">Large</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Distress</strong></td>
        <td style="padding-top:16px;">
            <euc:EformRadioButtonList RecordId="127" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_127" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Vertical">
                <asp:ListItem  Value="None">None</asp:ListItem>
			    <asp:ListItem  Value="Minimal">Minimal</asp:ListItem>
			    <asp:ListItem  Value="Moderate">Moderate</asp:ListItem>
			    <asp:ListItem  Value="Severe">Severe</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Treatments Attempted</strong></td>
        <td style="padding-top:16px;">
            <euc:EformRadioButtonList RecordId="128" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_128" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" >
                <asp:ListItem  Value="Imipramine">Imipramine</asp:ListItem>
			    <asp:ListItem  Value="ACTIS">ACTIS</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:16px;"><strong>Improvement</strong></td>
        <td style="padding-top:16px;">
            <euc:EformRadioButtonList RecordId="129" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_129" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" >
                <asp:ListItem  Value="Yes">Yes</asp:ListItem>
			    <asp:ListItem  Value="No">No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table></td>
</tr>
<tr>
  <td colspan="2" style="padding: 20px;">
  
  <strong>Comments</strong><br/>
  <euc:EformTextArea TextMode="MultiLine" RecordId="5" Table="Surveys" Field="SurveyNotes" ID="SurveyNotes_5" runat="server" Width="600px" />
  
  </td>
  </tr>
</table>

<br /><br />