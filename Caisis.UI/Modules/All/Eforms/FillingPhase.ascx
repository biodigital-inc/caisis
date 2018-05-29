<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.FillingPhase" CodeFile="FillingPhase.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">
#DetrusorPressureContainer
{
	border-left: solid 1px #cccccc;
	background-color: #f8f8f8;
	width: 440px;
}
#DetrusorPressureContainer td
{
	border-right: solid 1px #cccccc;
	border-bottom: solid 1px #cccccc;
	padding: 3px 10px 3px 10px;
	text-align: center;
	font-size: 11px;
}
</style>

<a name="FillingPhase" id="FillingPhase" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Filling Phase" /><span class="urodynamicsSectionComment">(Complex Cystometrogram CPT: 51728)</span><br/>
<table id="FillingPhaseTable" border="0" cellspacing="0" cellpadding="8" width="650"  class="eformXLargePopulatedTable" style="table-layout: fixed;">
  <tr>
    <td class="labelTd" style="width: 150px;">First Sensation</td>
    <td>
        <euc:EformHidden id="SurveyItem_19" runat="server" RecordId="19" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: First Sensation"/>
       <euc:EformTextBox CssClass="InputText" RecordId="19" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_19" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_19" /> ml
    </td>
  </tr>
  <tr>
    <td class="labelTd" >First Urge</td>
    <td>
        <euc:EformHidden id="SurveyItem_20" runat="server" RecordId="20" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: First Urge"/>
       <euc:EformTextBox CssClass="InputText" RecordId="20" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_20" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_20" /> ml
    </td>
  </tr>
  <tr>
    <td class="labelTd" >Severe Urge</td>
    <td>
        <euc:EformHidden id="SurveyItem_21" runat="server" RecordId="21" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Severe Urge"/>
       <euc:EformTextBox CssClass="InputText" RecordId="21" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_21" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_21" /> ml
    </td>
  </tr>
  <tr>
    <td class="labelTd" >Bladder Capacity</td>
    <td>
        <euc:EformHidden id="SurveyItem_22" runat="server" RecordId="22" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Bladder Capacity"/>
       <euc:EformTextBox CssClass="InputText" RecordId="22" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_22" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_22" /> ml
    </td>
  </tr>
  <tr>
    <td class="labelTd" style="vertical-align: top;">Detrusor Pressure<br />
    <span class="urodynamicsSectionComment">(CPT: 51797)</span>
    
    </td>
    <td style="vertical-align: top;">
		<div style="border: solid 1px #cccccc; background-color: #f8f8f8; padding: 5px; width: 440px;">
		Resting Pressure (cmH2O)
		<euc:EformHidden id="SurveyItem_23" runat="server" RecordId="23" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Detrusor Resting Pressure"/>
       <euc:EformTextBox CssClass="InputText" RecordId="23" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_23" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_23" />
		</div>
		<table id="DetrusorPressureContainer" cellspacing="0" cellpadding="0" style="margin-top: 0px;">
		<tr>
			<td class="labelTd">Volume (ml)</td>
			<td class="labelTd">Pressure (cmH2O)</td>
			<td class="labelTd">Compliance (ml/cmH2O)</td>
		</tr>
		<tr>
			<td ><euc:EformHidden id="SurveyItem_24" runat="server" RecordId="24" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Detrusor Volume 1"/>
       			 <euc:EformTextBox CssClass="InputText" RecordId="24" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_24" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_24" />
			</td>
			<td ><euc:EformHidden id="SurveyItem_25" runat="server" RecordId="25" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Detrusor Pressure 1"/>
       			 <euc:EformTextBox CssClass="InputText" RecordId="25" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_25" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_25" />
			</td>
			<td ><euc:EformHidden id="SurveyItem_26" runat="server" RecordId="26" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Detrusor Compliance 1"/>
       			 <euc:EformTextBox CssClass="InputText" RecordId="26" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_26" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_26" />
			</td>
		</tr>
		<tr>
			<td ><euc:EformHidden id="SurveyItem_27" runat="server" RecordId="27" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Detrusor Volume 2"/>
       			 <euc:EformTextBox CssClass="InputText" RecordId="27" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_27" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_27" />
			</td>
			<td ><euc:EformHidden id="SurveyItem_28" runat="server" RecordId="28" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Detrusor Pressure 2"/>
       			 <euc:EformTextBox CssClass="InputText" RecordId="28" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_28" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_28" />
			</td>
			<td ><euc:EformHidden id="SurveyItem_29" runat="server" RecordId="29" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Detrusor Compliance 2"/>
       			 <euc:EformTextBox CssClass="InputText" RecordId="29" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_29" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_29" />
			</td>
		</tr>
		<tr>
			<td ><euc:EformHidden id="SurveyItem_30" runat="server" RecordId="30" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Detrusor Volume 3"/>
       			 <euc:EformTextBox CssClass="InputText" RecordId="30" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_30" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_30" />
			</td>
			<td ><euc:EformHidden id="SurveyItem_31" runat="server" RecordId="31" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Detrusor Pressure 3"/>
       			 <euc:EformTextBox CssClass="InputText" RecordId="31" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_31" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_31" />
			</td>
			<td ><euc:EformHidden id="SurveyItem_32" runat="server" RecordId="32" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Detrusor Compliance 3"/>
       			 <euc:EformTextBox CssClass="InputText" RecordId="32" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_32" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_32" />
			</td>
		</tr>
		</table>
    </td>
  </tr>
  <tr>
    <td class="labelTd">Detrusor Overactivity</td>
    <td>
        <euc:EformHidden id="SurveyItem_33" runat="server" RecordId="33" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Detrusor Overactivity"/>
        <euc:EformExtendedRadioButtonList id="SurveyItemResult_33" runat="server" RecordId="33" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_33" >
            <asp:ListItem >Yes</asp:ListItem>
            <asp:ListItem >No</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
    </td>
  </tr>
  <tr>
    <td class="labelTd">Patient Leaked with Overactivity</td>
    <td>
        <euc:EformHidden id="SurveyItem_34" runat="server" RecordId="34" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Patient Leaked"/>
        <euc:EformExtendedRadioButtonList id="SurveyItemResult_34" runat="server" RecordId="34" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_34" >
            <asp:ListItem >Yes</asp:ListItem>
            <asp:ListItem >No</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
    </td>
  </tr>
  <tr>
    <td class="labelTd" style="font-size: 12px;" colspan="2">Involuntary detrusor contraction with a detrusor pressure of
		<euc:EformHidden id="SurveyItem_35" runat="server" RecordId="35" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Involuntary detrusor contraction pressure"/>
       	<euc:EformTextBox CssClass="InputText" RecordId="35" ParentRecordId="1"  style="width: 40px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_35" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_35" />cmH2O
		occurred at 
		<euc:EformHidden id="SurveyItem_36" runat="server" RecordId="36" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Involuntary detrusor contraction volume"/>
       	<euc:EformTextBox CssClass="InputText" RecordId="36" ParentRecordId="1"  style="width: 40px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_36" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_36" />
		ml.
        
	</td>
  </tr>
  <tr>
    <td class="labelTd" >Approximate DLPP</td>
    <td>
        <euc:EformHidden id="SurveyItem_37" runat="server" RecordId="37" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Approximate DLPP"/>
       <euc:EformTextBox CssClass="InputText" RecordId="37" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_37" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_37" /> cmH2O
    </td>
  </tr>
  <tr>
    <td class="labelTd" >Other IDC</td>
	<td>
        <euc:EformHidden id="SurveyItem_38" runat="server" RecordId="38" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Other IDC 1"/>
       <euc:EformTextBox CssClass="InputText" RecordId="38" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_38" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_38" /> cm/mL
	
		<euc:EformHidden id="SurveyItem_39" runat="server" RecordId="39" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Other IDC 2"/>
       <euc:EformTextBox CssClass="InputText" RecordId="39" ParentRecordId="1"  style="width: 60px; margin-left: 60px" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_39" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_39" /> cm/mL

	</td>
  </tr>
  
   <tr>
    <td class="labelTd">Patient unable to void</td>
    <td>
        <euc:EformHidden id="SurveyItem_40" runat="server" RecordId="40" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Patient unable to void"/>
        <euc:EformExtendedRadioButtonList id="SurveyItemResult_40" runat="server" RecordId="40" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Flow" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_40" >
            <asp:ListItem Text="Yes&nbsp;&nbsp;&nbsp;&nbsp;">Yes</asp:ListItem>
            <asp:ListItem >No</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
		
		<span style="margin-left: 50px;">If unable, Maximum pDet Obtained</span>
		
		<euc:EformHidden id="SurveyItem_41" runat="server" RecordId="41" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: Maximum pDet obtained"/>
       <euc:EformTextBox CssClass="InputText" RecordId="41" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_41" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_41" /> 

    </td>
  </tr>
    <tr>
    <td class="labelTd" >QMax without catheter</td>
    <td>
        <euc:EformHidden id="SurveyItem_42" runat="server" RecordId="42" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Filling Phase: QMax without catheter"/>
       <euc:EformTextBox CssClass="InputText" RecordId="42" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_42" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_42" /> ml/sec 
    </td>
  </tr>

</table>

<br/><br/><br/>