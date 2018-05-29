<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.LevelIVCInvasion" CodeFile="LevelIVCInvasion.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="LevelIVCInvasion" />
<span class="controlBoxTitle">Level of IVC Invasion</span><br />

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >


				<euc:EformRadioButtonList LookupCode="KidneyIVC_Invasion" TABLE="NephrectomyProc" FIELD="ProcIVC_Inv" id="ProcIVC_Inv" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">
				</euc:EformRadioButtonList>



        
	</td>

  </tr>
</table>
<br/><br/>
