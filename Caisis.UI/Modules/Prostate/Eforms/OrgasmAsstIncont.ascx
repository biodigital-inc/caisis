<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.OrgasmAsstIncont" CodeFile="OrgasmAsstIncont.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
<script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>

<a name="OrgasmAsstIncont" /><span class="controlBoxTitle">Orgasm Associated Incontinence</span><br />
<table width="600" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OrgasmAsstIncontTbl">
    <tr> 
        <td style="padding-top:10px;"><strong>Orgasm Associated Incontinence</strong></td>
        <td style="padding-top:10px;">
            <euc:EformHidden RecordId="5" TABLE="Surveys" FIELD="SurveyType" Runat="server" ID="SurveyType_5" Value="Mulhall Sexual Function" />
            <euc:EformHidden RecordId="34" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_34" Value="Orgasm Associated Incontinence" />
            <euc:EformRadioButtonList RecordId="34" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_34" 
                RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyType_5,SurveyItem_34" >
                <asp:ListItem  Value="Yes">Yes</asp:ListItem>
			    <asp:ListItem  Value="No">No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:10px;"><strong>Commenced Postop</strong></td>
        <td style="padding-top:10px;">
            <euc:EformHidden RecordId="35" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_35" Value="Orgasm Associated Incontinence Commenced Postop" />
            <euc:EformTextBox RecordId="35" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_35" 
                EnableHiddenOnUIEvent="SurveyType_5,SurveyItem_35" Width="80px" /> months</td>
    </tr>
    <tr> 
        <td style="padding-top:10px;"><strong>Ceased Postop</strong></td>
        <td style="padding-top:10px;">
            <euc:EformHidden RecordId="36" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_36" Value="Orgasm Associated Incontinence Ceased Postop" />
            <euc:EformTextBox RecordId="36" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_36" 
                EnableHiddenOnUIEvent="SurveyType_5,SurveyItem_36" Width="80px" /> months</td>
    </tr>
    <tr> 
        <td style="padding-top:10px;"><strong>Partner Distress</strong></td>
        <td style="padding-top:10px;">
            <euc:EformHidden RecordId="37" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_37" Value="Orgasm Associated Incontinence Partner Distress" />
            <euc:EformRadioButtonList RecordId="37" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_37" 
                RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyType_5,SurveyItem_37" >
                <asp:ListItem  Value="Rare">Rare</asp:ListItem>
			    <asp:ListItem  Value="Occasional">Occasional</asp:ListItem>
			    <asp:ListItem  Value="Frequent">Frequent</asp:ListItem>
			    <asp:ListItem  Value="Always">Always</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:10px;"><strong>Level</strong></td>
        <td style="padding-top:10px;">
            <euc:EformHidden RecordId="38" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_38" Value="Orgasm Associated Incontinence Level" />
            <euc:EformRadioButtonList RecordId="38" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_38" 
                RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyType_5,SurveyItem_38" >
                <asp:ListItem  Value="Small">Small</asp:ListItem>
			    <asp:ListItem  Value="Moderate">Moderate</asp:ListItem>
			    <asp:ListItem  Value="Large">Large</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:10px;"><strong>Distress</strong></td>
        <td style="padding-top:10px;">
            <euc:EformHidden RecordId="39" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_39" Value="Orgasm Associated Incontinence Male Distress" />
            <euc:EformRadioButtonList RecordId="39" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_39" 
                RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyType_5,SurveyItem_39" >
                <asp:ListItem  Value="None">None</asp:ListItem>
			    <asp:ListItem  Value="Minimal">Minimal</asp:ListItem>
			    <asp:ListItem  Value="Moderate">Moderate</asp:ListItem>
			    <asp:ListItem  Value="Severe">Severe</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:10px;"><strong>Treatments Attempted</strong></td>
        <td style="padding-top:10px;">
            <euc:EformHidden RecordId="40" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_40" Value="Orgasm Associated Incontinence TXs Attempted" />
            <euc:EformRadioButtonList RecordId="40" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_40" 
                RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyType_5,SurveyItem_40" >
                <asp:ListItem  Value="Imipramine">Imipramine</asp:ListItem>
			    <asp:ListItem  Value="ACTIS">ACTIS</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:10px;"><strong>Improvements</strong></td>
        <td style="padding-top:10px;">
            <euc:EformHidden RecordId="41" TABLE="SurveyItems" FIELD="SurveyItem" Runat="server" ID="SurveyItem_41" Value="Orgasm Associated Incontinence Improvements" />
            <euc:EformRadioButtonList RecordId="41" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_41" 
                RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyType_5,SurveyItem_41" >
                <asp:ListItem  Value="Yes">Yes</asp:ListItem>
			    <asp:ListItem  Value="No">No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr>
        <td style="padding-top:10px;"><strong>Comments</strong></td>
        <td style="padding-top:10px;"><euc:EformTextArea TextMode="MultiLine" RecordId="5" Table="Surveys" Field="SurveyNotes" ID="SurveyNotes_5" 
            runat="server" Width="400px" /></td>
    </tr>
</table><br /><br />