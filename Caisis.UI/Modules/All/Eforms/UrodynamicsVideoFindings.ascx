<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.UrodynamicsVideoFindings" CodeFile="UrodynamicsVideoFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="UrodynamicsVideoFindings" id="UrodynamicsVideoFindings" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Video Findings" /><span class="urodynamicsSectionComment">(Injection of Contrast CPT: 51600)</span><br/>
<table id="VideoFindingsTable" border="0" cellspacing="0" cellpadding="8" width="650"  class="eformXLargePopulatedTable" style="table-layout: fixed;">
  <tr>
    <td class="labelTd" style="width: 200px; vertical-align: top;">Video cystourethrogram revealed</td>
    <td>
        <euc:EformHidden id="SurveyItem_43" runat="server" RecordId="43" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Video Findings: Video cystourethrogram"/>
        <euc:EformExtendedRadioButtonList ShowOther="true" id="SurveyItemResult_43" runat="server" RecordId="43" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Vertical" EnableHiddenOnUIEvent="SurveyItem_43" >
            <asp:ListItem >Normal Bladder</asp:ListItem>
            <asp:ListItem >Prostatic Impression</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
    </td>
  </tr>
  <tr>
    <td class="labelTd" style="vertical-align: top;">Other findings</td>
    <td>
        <euc:EformHidden id="SurveyItem_44" runat="server" RecordId="44" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Video Findings: Other findings"/>
        <euc:EformExtendedRadioButtonList ShowOther="true" id="SurveyItemResult_44" runat="server" RecordId="44" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Vertical" EnableHiddenOnUIEvent="SurveyItem_44" >
            <asp:ListItem >None</asp:ListItem>
            <asp:ListItem >Cystocele</asp:ListItem>
            <asp:ListItem >Enterocele</asp:ListItem>
            <asp:ListItem >Rectocele</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
    </td>
  </tr>
  <tr>
    <td class="labelTd" >Bladder Neck at Rest</td>
    <td>
        <euc:EformHidden id="SurveyItem_45" runat="server" RecordId="45" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Video Findings: Bladder Neck at Rest"/>
        <euc:EformExtendedRadioButtonList ShowOther="true" id="SurveyItemResult_45" runat="server" RecordId="45" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_45" >
            <asp:ListItem >Open</asp:ListItem>
            <asp:ListItem >Closed</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
    </td>
  </tr>
  <tr>
    <td class="labelTd" style="vertical-align: top;">Bladder</td>
    <td>
        <euc:EformHidden id="SurveyItem_46" runat="server" RecordId="46" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Video Findings: Bladder"/>
        <euc:EformExtendedRadioButtonList ShowOther="true" id="SurveyItemResult_46" runat="server" RecordId="46" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Vertical" EnableHiddenOnUIEvent="SurveyItem_46" >
            <asp:ListItem >Smooth</asp:ListItem>
            <asp:ListItem >Trabeculated: Mild</asp:ListItem>
            <asp:ListItem >Trabeculated: Moderate</asp:ListItem>
            <asp:ListItem >Trabeculated: Severe</asp:ListItem>
            <asp:ListItem >Diverticula</asp:ListItem>
            <asp:ListItem >Diverticula: Multiple</asp:ListItem>
            <asp:ListItem >Diverticula: Large</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
    </td>
  </tr>
  <tr>
    <td class="labelTd">Bladder Neck During Voiding</td>
    <td>
        <euc:EformHidden id="SurveyItem_47" runat="server" RecordId="47" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Video Findings: Bladder Neck During Voiding"/>
        <euc:EformExtendedRadioButtonList ShowOther="true" id="SurveyItemResult_47" runat="server" RecordId="47" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_47" >
            <asp:ListItem >Open</asp:ListItem>
            <asp:ListItem >Closed</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
    </td>
  </tr>
    <tr>
    <td class="labelTd" >Reflux Present</td>
    <td style="padding-bottom: 0px;">
        <euc:EformHidden id="SurveyItem_48" runat="server" RecordId="48" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Video Findings: Reflux present" />
        <euc:EformExtendedRadioButtonList id="SurveyItemResult_48" runat="server" RecordId="48" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_48">
            <asp:ListItem >Yes</asp:ListItem>
            <asp:ListItem >No</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
    </td>
  </tr>
  <tr>
    <td class="labelTd" >&nbsp;</td>
    <td style="padding-top: 0px; padding-left: 16px;padding-bottom: 0px;">If Yes, Grade
		<span style="margin-left: 10px;">Right</span>
        <euc:EformHidden id="SurveyItem_49" runat="server" RecordId="49" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Video Findings: Grade Right" />
       <euc:EformTextBox CssClass="InputText" RecordId="49" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_49" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_49" />
    
		<span style="margin-left: 26px;">Left</span>
        <euc:EformHidden id="SurveyItem_50" runat="server" RecordId="50" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Video Findings: Grade Left" />
       <euc:EformTextBox CssClass="InputText" RecordId="50" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_50" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_50" />
	</td>
  </tr>
    <tr>
    <td class="labelTd" >&nbsp;</td>
    <td style="padding-top: 0px; padding-left: 16px;">When
        <euc:EformHidden id="SurveyItem_51" runat="server" RecordId="51" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Video Findings: Grade When" />
        <euc:EformExtendedCheckboxList id="SurveyItemResult_51" runat="server" RecordId="51" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Flow" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_51">
            <asp:ListItem Text="Filling&nbsp;&nbsp;&nbsp;&nbsp;">Filling</asp:ListItem>
            <asp:ListItem >Voiding</asp:ListItem>
        </euc:EformExtendedCheckboxList>
	</td>
  </tr>
    <tr>
    <td class="labelTd" style="vertical-align: top;">Urethrogram</td>
    <td>
        <euc:EformHidden id="SurveyItem_52" runat="server" RecordId="52" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Video Findings: Urethrogram"/>
        <euc:EformExtendedRadioButtonList ShowOther="true" id="SurveyItemResult_52" runat="server" RecordId="52" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_52" >
            <asp:ListItem >Normal</asp:ListItem>
            <asp:ListItem >Stricture</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
    </td>
  </tr>
    <tr>
    <td class="labelTd" >Fluoroscopic Post Void Residual<span class="urodynamicsSectionComment">(CPT: 51798)</span></td>
    <td>
        <euc:EformHidden id="SurveyItem_53" runat="server" RecordId="53" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Video Findings: Fluoroscopic PVR"/>
       <euc:EformTextBox CssClass="InputText" RecordId="53" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_53" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_53" /> vol
    </td>
  </tr>
</table>
<br/><br/><br/>