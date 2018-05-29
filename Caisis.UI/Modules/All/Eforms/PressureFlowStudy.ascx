<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PressureFlowStudy" CodeFile="PressureFlowStudy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="PressureFlowStudy" id="PressureFlowStudy" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pressure Flow Study" /><span class="urodynamicsSectionComment">(Complex Uroflometry CPT:51741)</span><br/>
<table id="UrodynamicsProcedureTable" border="0" cellspacing="0" cellpadding="8" width="650"  class="eformLargePopulatedTable">
  <tr>
    <td class="labelTd" style="width: 310px;">Voiding at Capacity</td>
    <td>
        <euc:EformHidden id="SurveyItem_12" runat="server" RecordId="12" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Pressure Flow Study: Voiding at Capacity"/>
        <euc:EformExtendedRadioButtonList id="SurveyItemResult_12" runat="server" RecordId="12" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_12" >
            <asp:ListItem >Allowed</asp:ListItem>
            <asp:ListItem >Involuntary Detrusor</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
    </td>
  </tr>
  <tr>
    <td class="labelTd">Voiding Cystometrogram Peak Flow Rate (Qmax)</td>
    <td>
        <euc:EformHidden id="SurveyItem_13" runat="server" RecordId="13" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Pressure Flow Study: Voiding cysto peak flow rate"/>
       <euc:EformTextBox CssClass="InputText" RecordId="13" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_13" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_13" /> ml/sec
    </td>
  </tr>
  <tr>
    <td class="labelTd">Detrusor Pressure at Qmax</td>
    <td>
        <euc:EformHidden id="SurveyItem_14" runat="server" RecordId="14" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Pressure Flow Study: Detrusor pressure at Qmax"/>
       <euc:EformTextBox CssClass="InputText" RecordId="14" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_14" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_14" /> cmH2O
    </td>
  </tr>
  <tr>
    <td class="labelTd">Bladder Outlet Obstruction Index<br/><span style="font-size: 10px; font-weight: normal;">(PdetQmax-2*Qmax)</span></td>
    <td style="vertical-align: top; padding-top: 6px;">
        <euc:EformHidden id="SurveyItem_15" runat="server" RecordId="15" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Pressure Flow Study: BOO Index"/>
       <euc:EformTextBox CssClass="InputText" RecordId="15" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_15" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_15" />
    </td>
  </tr>
  <tr>
    <td class="labelTd">Pattern</td>
    <td>
        <euc:EformHidden id="SurveyItem_16" runat="server" RecordId="16" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Pressure Flow Study: Pattern"/>
        <euc:EformExtendedRadioButtonList id="SurveyItemResult_16" runat="server" RecordId="16" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_16" >
            <asp:ListItem >Normal</asp:ListItem>
            <asp:ListItem >Plateau</asp:ListItem>
            <asp:ListItem >Interrupted</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
    </td>
  </tr>
  <tr>
    <td class="labelTd">Bladder Outlet Obstruction Index consistent with Obstruction?&nbsp;&nbsp;&nbsp;<span style="font-size: 10px; font-weight: normal;">(BOOI>40 means obstruction)</span></td>
    <td style="vertical-align: top; padding-top: 6px;">
        <euc:EformHidden id="SurveyItem_17" runat="server" RecordId="17" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Pressure Flow Study: BOO Index Obstruction"/>
        <euc:EformExtendedRadioButtonList id="SurveyItemResult_17" runat="server" RecordId="17" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_17" >
            <asp:ListItem >Yes</asp:ListItem>
            <asp:ListItem >No</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
    </td>
  </tr>
  <tr>
    <td class="labelTd">Abdominal straining during voiding? </td>
    <td>
        <euc:EformHidden id="SurveyItem_18" runat="server" RecordId="18" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Pressure Flow Study: Abdominal Straining"/>
        <euc:EformExtendedRadioButtonList id="SurveyItemResult_18" runat="server" RecordId="18" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_18" >
            <asp:ListItem >Yes</asp:ListItem>
            <asp:ListItem >No</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
    </td>
  </tr></table>
<br/><br/>