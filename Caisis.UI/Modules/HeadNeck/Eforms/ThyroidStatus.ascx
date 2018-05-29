<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.ThyroidStatus" CodeFile="ThyroidStatus.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="ThyroidStatus" id="ThyroidStatus" />

<table width="648" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width: 301px; vertical-align: top;">
		<span class="controlBoxTitle">Left Thyroid</span>
		<table border="0" cellspacing="0" cellpadding="0" width="290" >
		<tr>
		    <td>
		    <table border="0" cellspacing="0" cellpadding="16" width="290" class="eformLargePopulatedTableBlue">
		
		 <tr >
			<td  style="padding-top: 20px;">
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="1" Field="ProcFindSide" id="ProcFindSide_L" runat="server" Value="Left" />
				
				<strong>Status of Left Thyroid</strong><br />
				<euc:EformExtendedCheckBoxList LookupCode="ResultThyroid" Table="ProcedureFinding" ShowOther="true" ParentRecordId="1"  RecordId="1" Field="ProcFinding" id="ProcFinding_L" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" EnableHiddenOnUIEvent="ProcFindSide_L,ProcFindSite_L">
				</euc:EformExtendedCheckBoxList>


			</td>
		</tr>
		 <tr >
			<td  style="padding-top: 20px;">
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="1" Field="ProcFindSite" id="ProcFindSite_L" runat="server" Value="Nodule" />
				<strong>Location of Tumor</strong><br />
				<euc:EformExtendedCheckBoxList LookupCode="ThyroidProcFindSubSite" ShowOther="true" Table="ProcedureFinding" ParentRecordId="1"  RecordId="1" Field="ProcFindSubsite" id="ProcFindSubsite_L" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" EnableHiddenOnUIEvent="ProcFindSide_L,ProcFindSite_L">
				</euc:EformExtendedCheckBoxList>


			</td>
		</tr>
		 <tr >
			<td  style="padding-top: 20px;">
				<strong>Single Nodule Size</strong> 
				<euc:EformTextBox CssClass="InputText" style="width: 40px;" Table="ProcedureFinding" ParentRecordId="1"  RecordId="1" Field="ProcFindPrimaryDimension" id="ProcFindMaxDim_L" runat="server" /> cm



			</td>
		</tr>      
		 <tr >
			<td  style="padding-top: 20px;">
				<strong>Primary Tumor Encapsulation</strong><br />
				<euc:EformRadioButtonList LookupCode="YesNoUnknown" Table="ProcedureFinding" ParentRecordId="1"  RecordId="1" Field="ProcFindEncapsulation" id="ProcFindEncapsulation_L" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" />


			</td>
		</tr>		
		 <tr >
			<td  style="padding-top: 20px;">
				<strong>Extra Thyroid Extension</strong><br />
				<euc:EformExtendedCheckBoxList LookupCode="ThyroidProcFindExtension"  ShowOther="true" Table="ProcedureFinding" ParentRecordId="1"  RecordId="1" Field="ProcFindExtension" id="ProcFindExtension_L" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
				</euc:EformExtendedCheckBoxList>


			</td>
		</tr>		
		
		
		
		</table>
		    </td>
		    <td style="width: 11px; background-color: #3D556D; padding: 2px;"><img src="../../Images/VerticalSideMarker_Left.gif" /><br /><img src="../../Images/VerticalSideMarker_Left.gif" style="margin-top: 300px;" /></td>
		</tr>
		</table>

		
		
	</td>
    <td style="width: 36px;">&nbsp;</td>
    <td style="width: 311px; vertical-align: top;">
	
	
	
		<span class="controlBoxTitle">Right Thyroid</span>
<table border="0" cellspacing="0" cellpadding="0" width="290">
		<tr>
		    <td style="width: 11px; background-color: #666666; padding: 2px;"><img src="../../Images/VerticalSideMarker_Right.gif" /><br /><img src="../../Images/VerticalSideMarker_Right.gif" style="margin-top: 300px;" /></td>
		    <td>
		    <table border="0" cellspacing="0" cellpadding="16" width="290" class="eformLargePopulatedTable">
		
		 <tr >
			<td  style="padding-top: 20px;">
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="2" Field="ProcFindSide" id="ProcFindSide_R" runat="server" Value="Right" />
				

				<strong>Status of Right Thyroid</strong><br />
				<euc:EformExtendedCheckBoxList  LookupCode="ResultThyroid" ShowOther="true" Table="ProcedureFinding" ParentRecordId="1"  RecordId="2" Field="ProcFinding" id="ProcFinding_R" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  EnableHiddenOnUIEvent="ProcFindSide_R,ProcFindSite_R">
				</euc:EformExtendedCheckBoxList>


			</td>
		</tr>
		 <tr >
			<td  style="padding-top: 20px;">
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="2" Field="ProcFindSite" id="ProcFindSite_R" runat="server" Value="Nodule" />
				<strong>Location of Tumor</strong><br />
				<euc:EformExtendedCheckBoxList  LookupCode="ThyroidProcFindSubSite" ShowOther="true" Table="ProcedureFinding" ParentRecordId="1"  RecordId="2" Field="ProcFindSubsite" id="ProcFindSubsite_R" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  EnableHiddenOnUIEvent="ProcFindSide_R,ProcFindSite_R">
				</euc:EformExtendedCheckBoxList>


			</td>
		</tr>
		 <tr >
			<td  style="padding-top: 20px;">
				<strong>Single Nodule Size</strong> 
				<euc:EformTextBox CssClass="InputText" style="width: 40px;" Table="ProcedureFinding" ParentRecordId="1"  RecordId="2" Field="ProcFindPrimaryDimension" id="ProcFindMaxDim_R" runat="server" /> cm



			</td>
		</tr>      
		 <tr >
			<td  style="padding-top: 20px;">
				<strong>Primary Tumor Encapsulation</strong><br />
				<euc:EformRadioButtonList LookupCode="YesNoUnknown" Table="ProcedureFinding" ParentRecordId="1"  RecordId="2" Field="ProcFindEncapsulation" id="ProcFindEncapsulation_R" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" />


			</td>
		</tr>		
		 <tr >
			<td  style="padding-top: 20px;">
				<strong>Extra Thyroid Extension</strong><br />
				<euc:EformExtendedCheckBoxList LookupCode="ThyroidProcFindExtension" ShowOther="true" Table="ProcedureFinding" ParentRecordId="1"  RecordId="2" Field="ProcFindExtension" id="ProcFindExtension_R" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
				</euc:EformExtendedCheckBoxList>


			</td>
		</tr>		
		
		
		
		</table>
		    </td>
		</tr>
    </table>
	</td>
  </tr>
</table>





<br/><br/><br/>
