<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.UrinaryDiversionDetails" CodeFile="UrinaryDiversionDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="UrinaryDiversionDetails" id="UrinaryDiversionDetails" />
<span class="controlBoxTitle">Urinary Diversion Type</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
	    <euc:EformHidden id="ProcInstitution_1" runat="server" RecordId="1" Table="Procedures" Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
          <euc:EformHidden id="ProcQuality_1" runat="server" RecordId="1" Table="Procedures" Field="ProcQuality" Value="STD" />
          <euc:EformHidden id="ProcDateText_1" Table="Procedures" Field="ProcDateText" RecordId="1" runat="server"/>
        <euc:EformHidden id="ProcDate_1" Table="Procedures" Field="ProcDate"  RecordId="1" runat="server"/>	

		<euc:EformRadioButtonList  LookupCode="BladderDiversionProcName" Table="Procedures" RecordId="1" Field="ProcName" id="ProcName" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  EnableHiddenOnUIEvent="ProcInstitution_1,ProcQuality_1,ProcDateText_1,ProcDate_1">

		</euc:EformRadioButtonList>

	</td>
</tr>


</table><br /><br />
