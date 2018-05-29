<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.PelvicLymphadenectomyDetails" CodeFile="PelvicLymphadenectomyDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="PelvicLymphadenectomyDetails" id="PelvicLymphadenectomyDetails" />
<span class="controlBoxTitle">Pelvic Lymphadenectomy Details</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>Nodes Submitted</strong>&nbsp;&nbsp;
		
		<euc:EformRadioButtonList LookupCode="NodePacketType" Table="NodeProc" Field="ProcPacketType" id="ProcPacketType" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server">

		</euc:EformRadioButtonList>



	</td>
</tr>
<tr>
	<td style="padding-top: 12px;">
		<strong>Packets Submitted</strong><br />
		
		
		<euc:EformExtendedCheckBoxList Table="NodeProc" Field="ProcNumPackets" id="ProcNumPackets" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
			
				<asp:ListItem  >Extended</asp:ListItem>
				<asp:ListItem  >Right Common</asp:ListItem>
				<asp:ListItem  >Left Common</asp:ListItem>
				<asp:ListItem  >Right Distal</asp:ListItem>
				<asp:ListItem  >Left Distal</asp:ListItem>
				<asp:ListItem  >Presacral</asp:ListItem>
				
		</euc:EformExtendedCheckBoxList>

		
		


	</td>	
</tr>
<tr>
	<td style="padding-top: 12px;">
		<strong>Proximal Limits of Dissection</strong><br />


		<euc:EformRadioButtonList Table="NodeProc" Field="ProcDissectionExtent" LookupCode="NodeDissectionExtent" id="ProcDissectionExtent" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
			
		</euc:EformRadioButtonList>



	</td>	
</tr>
<tr>
	<td style="padding-top: 12px;">
		<strong>Location of Suspicious Nodes</strong><br />
<table style="margin-top: 8px; margin-bottom: 20px;">
        <tr >
        	<td style="width: 50%; ">
			    <euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="1" Field="ProcFinding" id="ProcFinding_SN_1" runat="server" Value="Suspicious Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="1" Field="ProcFindSide" id="ProcFindSide_SN_1" runat="server" Value="Left" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="1"  RecordId="1" Field="ProcFindSite" id="ProcFindSite_SN_1" runat="server" Value="Periaortic" Text="Left Periaortic" EnableHiddenOnUIEvent="ProcFinding_SN_1,ProcFindSide_SN_1" />
			</td>
			<td  style="width: 50%;">
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="2" Field="ProcFinding" id="ProcFinding_SN_2" runat="server" Value="Suspicious Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="2" Field="ProcFindSide" id="ProcFindSide_SN_2" runat="server" Value="Right" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="1"  RecordId="2" Field="ProcFindSite" id="ProcFindSite_SN_2" runat="server" Value="Periaortic" Text="Right Periaortic" EnableHiddenOnUIEvent="ProcFinding_SN_2,ProcFindSide_SN_2" />
			</td>
		</tr>	
        <tr >
        	<td style="width: 50%; ">
			    <euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="3" Field="ProcFinding" id="ProcFinding_SN_3" runat="server" Value="Suspicious Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="3" Field="ProcFindSide" id="ProcFindSide_SN_3" runat="server" Value="Left" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="1"  RecordId="3" Field="ProcFindSite" id="ProcFindSite_SN_3" runat="server" Value="Perivesical" Text="Left Perivesical" EnableHiddenOnUIEvent="ProcFinding_SN_3,ProcFindSide_SN_3" />
			</td>
			<td  style="width: 50%;">
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="4" Field="ProcFinding" id="ProcFinding_SN_4" runat="server" Value="Suspicious Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="4" Field="ProcFindSide" id="ProcFindSide_SN_4" runat="server" Value="Right" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="1"  RecordId="4" Field="ProcFindSite" id="ProcFindSite_SN_4" runat="server" Value="Perivesical" Text="Right Perivesical" EnableHiddenOnUIEvent="ProcFinding_SN_4,ProcFindSide_SN_4" />
			</td>
		</tr>	
        <tr >
        	<td style="width: 50%; ">
			    <euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="5" Field="ProcFinding" id="ProcFinding_SN_5" runat="server" Value="Suspicious Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="5" Field="ProcFindSide" id="ProcFindSide_SN_5" runat="server" Value="Left" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="1"  RecordId="5" Field="ProcFindSite" id="ProcFindSite_SN_5" runat="server" Value="Common Iliac" Text="Left Common Iliac" EnableHiddenOnUIEvent="ProcFinding_SN_5,ProcFindSide_SN_5" />
			</td>
			<td  style="width: 50%;">
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="6" Field="ProcFinding" id="ProcFinding_SN_6" runat="server" Value="Suspicious Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="6" Field="ProcFindSide" id="ProcFindSide_SN_6" runat="server" Value="Right" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="1"  RecordId="6" Field="ProcFindSite" id="ProcFindSite_SN_6" runat="server" Value="Common Iliac" Text="Right Common Iliac" EnableHiddenOnUIEvent="ProcFinding_SN_6,ProcFindSide_SN_6" />
			</td>
		</tr>	
        <tr >
        	<td style="width: 50%; ">
			    <euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="7" Field="ProcFinding" id="ProcFinding_SN_7" runat="server" Value="Suspicious Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="7" Field="ProcFindSide" id="ProcFindSide_SN_7" runat="server" Value="Left" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="1"  RecordId="7" Field="ProcFindSite" id="ProcFindSite_SN_7" runat="server" Value="External Iliac" Text="Left External Iliac" EnableHiddenOnUIEvent="ProcFinding_SN_7,ProcFindSide_SN_7" />
			</td>
			<td  style="width: 50%;">
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="8" Field="ProcFinding" id="ProcFinding_SN_8" runat="server" Value="Suspicious Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="8" Field="ProcFindSide" id="ProcFindSide_SN_8" runat="server" Value="Right" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="1"  RecordId="8" Field="ProcFindSite" id="ProcFindSite_SN_8" runat="server" Value="External Iliac" Text="Right External Iliac" EnableHiddenOnUIEvent="ProcFinding_SN_8,ProcFindSide_SN_8" />
			</td>
		</tr>	
        <tr >
        	<td style="width: 50%; ">
			    <euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="9" Field="ProcFinding" id="ProcFinding_SN_9" runat="server" Value="Suspicious Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="9" Field="ProcFindSide" id="ProcFindSide_SN_9" runat="server" Value="Left" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="1"  RecordId="9" Field="ProcFindSite" id="ProcFindSite_SN_9" runat="server" Value="Hypogastric" Text="Left Hypogastric" EnableHiddenOnUIEvent="ProcFinding_SN_9,ProcFindSide_SN_9" />
			</td>
			<td  style="width: 50%;">
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="10" Field="ProcFinding" id="ProcFinding_SN_10" runat="server" Value="Suspicious Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="10" Field="ProcFindSide" id="ProcFindSide_SN_10" runat="server" Value="Right" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="1"  RecordId="10" Field="ProcFindSite" id="ProcFindSite_SN_10" runat="server" Value="Hypogastric" Text="Right Hypogastric" EnableHiddenOnUIEvent="ProcFinding_SN_10,ProcFindSide_SN_10" />
			</td>
		</tr>	
        <tr >
        	<td style="width: 50%; ">
			    <euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="11" Field="ProcFinding" id="ProcFinding_SN_11" runat="server" Value="Suspicious Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="11" Field="ProcFindSide" id="ProcFindSide_SN_11" runat="server" Value="Left" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="1"  RecordId="11" Field="ProcFindSite" id="ProcFindSite_SN_11" runat="server" Value="Obturator" Text="Left Obturator" EnableHiddenOnUIEvent="ProcFinding_SN_11,ProcFindSide_SN_11" />
			</td>
			<td  style="width: 50%;">
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="12" Field="ProcFinding" id="ProcFinding_SN_12" runat="server" Value="Suspicious Nodes" />
				<euc:EformHidden Table="ProcedureFinding" ParentRecordId="1"  RecordId="12" Field="ProcFindSide" id="ProcFindSide_SN_12" runat="server" Value="Right" />
                <euc:EformCheckBox Table="ProcedureFinding" ParentRecordId="1"  RecordId="12" Field="ProcFindSite" id="ProcFindSite_SN_12" runat="server" Value="Obturator" Text="Right Obturator" EnableHiddenOnUIEvent="ProcFinding_SN_12,ProcFindSide_SN_12" />
			</td>
		</tr>	
		
		
			

		</table>
	</td>	
</tr>
<tr>
	<td style="padding-top: 12px;">
		<strong>Node Involvement</strong><br />

		<euc:EformRadioButtonList Table="NodeProc" Field="ProcResult" id="ProcResult" LookupCode="NodeResult" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
		</euc:EformRadioButtonList>

	</td>	
</tr>  
  
  
</table>
<br/><br/><br/>
