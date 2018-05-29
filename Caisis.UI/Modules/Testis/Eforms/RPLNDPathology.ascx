<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Testis.Eforms.RPLNDPathology" CodeFile="RPLNDPathology.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="RPLNDPathology" />
<span class="controlBoxTitle">RPLND Pathology</span><br />
<table border="0" cellspacing="0" cellpadding="16" class="eformLargePopulatedTable" style="width: 700px;">
 <tr >
 <td style="width: 33%; vertical-align: top;"><span style="font-family: Symbol;">b</span><strong>HCG at the Time of RPLND</strong>
 <div style="border: solid 1px #999999; padding: 4px; background-color: #f8f8f8;"><br/><br/>coming soon<br/><br/><br/><br/><br/></div>
 </td>
 <td style="width: 33%; vertical-align: top;"><strong>AFP at the Time of RPLND</strong>
 <div style="border: solid 1px #999999; padding: 4px; background-color: #f8f8f8;"><br/><br/>coming soon<br/><br/><br/><br/><br/></div>
 </td>
 <td style="width: 33%; vertical-align: top;">
 <strong>Stage at the Time of RPLND</strong>
 <div style="border: solid 1px #999999; padding: 4px; background-color: #f8f8f8;">
 <euc:EformHidden id="PathStageDisease" Table="PathologyStageGrade" Field="PathStageDisease" RecordId="1" ParentRecordId="1"  runat="server" Value="Testis" />
 <euc:EformHidden id="PathStageSystem" Table="PathologyStageGrade" Field="PathStageSystem" RecordId="1" ParentRecordId="1"  runat="server" Value="UICC_02" />
 <euc:EformRadioButtonList TABLE="PathologyStageGrade" RecordId="1" ParentRecordId="1"  FIELD="PathStageN" LookupCode="StagePath_Testis_02_N" id="PathStageN" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" EnableHiddenOnUIEvent="PathStageDisease,PathStageSystem" />
 </div>
 </td>
</tr>
</table>
<br/><br/>