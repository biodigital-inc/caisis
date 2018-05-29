<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.Cavermaps" CodeFile="Cavermaps.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="Cavermaps" />
<span class="controlBoxTitle">&nbsp;&nbsp;Cavermap</span><br />
<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="CavermapHtmlTable" style="margin-left:8px;">
   <tr>
     <td width="15%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Site</td>
     <td width="15%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Side</td>
     <td width="15%" class="controlBoxDataGridHeaderFirstCol">Level</td>
     <td width="25%" class="controlBoxDataGridHeaderFirstCol">Max Response </td>
     <td width="15%" class="controlBoxDataGridHeaderFirstCol">mA</td>
     <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
     <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
   </tr>
   <tr>
     <td rowspan="9" valign="top" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb; border-right: solid 1px #bbbbbb;">NVB</td>
     <td rowspan="3" valign="top" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb; border-right: solid 1px #bbbbbb;">Right</td>
     <td height="28" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb;">
	 Base
	 <euc:EformHidden ParentRecordId="2" RecordId="1" Runat="server" ID="ProcNS_Site_1" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSite" Value="NVB" />
	 <euc:EformHidden ParentRecordId="2" RecordId="1" Runat="server" ID="ProcNS_Side_1" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSide" Value="Right" />
	 <euc:EformHidden ParentRecordId="2" RecordId="1" Runat="server" ID="ProcNS_Level_1" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindLevel" Value="Base" />	 </td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60" ID="ProcNS_Movement_1"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindMovement" ParentRecordId="2" RecordId="1" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_1,ProcNS_Side_1,ProcNS_Level_1"/></td>
     <td align="center" style="border-bottom: solid 1px #cccccc; white-space:nowrap;"><euc:EformTextBox style="width:60" ID="ProcNS_mA_1"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindmA" ParentRecordId="2" RecordId="1" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_1,ProcNS_Side_1,ProcNS_Level_1"/></td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
   </tr>
   <tr >
     <td height="28" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb;"> Mid
       <euc:EformHidden ParentRecordId="2" RecordId="2" Runat="server" ID="ProcNS_Site_2" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSite" Value="NVB" />
         <euc:EformHidden ParentRecordId="2" RecordId="2" Runat="server" ID="ProcNS_Side_2" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSide" Value="Right" />
         <euc:EformHidden ParentRecordId="2" RecordId="2" Runat="server" ID="ProcNS_Level_2" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindLevel" Value="Mid" />     </td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60" ID="ProcNS_Movement_2"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindMovement" ParentRecordId="2" RecordId="2" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_2,ProcNS_Side_2,ProcNS_Level_2"/></td>
     <td align="center" style="border-bottom: solid 1px #cccccc; white-space:nowrap;"><euc:EformTextBox style="width:60" ID="ProcNS_mA_2"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindmA" ParentRecordId="2" RecordId="2" class="InputText"  ShowNumberPad="true"  runat="server"  EnableHiddenOnUIEvent="ProcNS_Site_2,ProcNS_Side_2,ProcNS_Level_2"/></td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
   </tr>
   <tr >
     <td height="28" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb;"> Apex
       <euc:EformHidden ParentRecordId="2" RecordId="3" Runat="server" ID="ProcNS_Site_3" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSite" Value="NVB" />
         <euc:EformHidden ParentRecordId="2" RecordId="3" Runat="server" ID="ProcNS_Side_3" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSide" Value="Right" />
         <euc:EformHidden ParentRecordId="2" RecordId="3" Runat="server" ID="ProcNS_Level_3" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindLevel" Value="Apex" />     </td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60" ID="ProcNS_Movement_3"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindMovement" ParentRecordId="2" RecordId="3" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_3,ProcNS_Side_3,ProcNS_Level_3"/></td>
     <td align="center" style="border-bottom: solid 1px #cccccc; white-space:nowrap;"><euc:EformTextBox style="width:60" ID="ProcNS_mA_3"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindmA" ParentRecordId="2" RecordId="3" class="InputText"  ShowNumberPad="true"  runat="server"  EnableHiddenOnUIEvent="ProcNS_Site_3,ProcNS_Side_3,ProcNS_Level_3"/></td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
   </tr>
   <tr >
     <td rowspan="3" valign="top" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb; border-right: solid 1px #bbbbbb;">Midline</td>
     <td height="28" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb;"> Base
       <euc:EformHidden ParentRecordId="2" RecordId="4" Runat="server" ID="ProcNS_Site_4" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSite" Value="NVB" />
         <euc:EformHidden ParentRecordId="2" RecordId="4" Runat="server" ID="ProcNS_Side_4" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSide" Value="Midline" />
         <euc:EformHidden ParentRecordId="2" RecordId="4" Runat="server" ID="ProcNS_Level_4" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindLevel" Value="Base" />     </td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60" ID="ProcNS_Movement_4"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindMovement" ParentRecordId="2" RecordId="4" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_4,ProcNS_Side_4,ProcNS_Level_4"/></td>
     <td align="center" style="border-bottom: solid 1px #cccccc; white-space:nowrap;"><euc:EformTextBox style="width:60" ID="ProcNS_mA_4"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindmA" ParentRecordId="2" RecordId="4" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_4,ProcNS_Side_4,ProcNS_Level_4"/></td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
   </tr>
   <tr >
     <td height="28" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb;"> Mid
       <euc:EformHidden ParentRecordId="2" RecordId="5" Runat="server" ID="ProcNS_Site_5" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSite" Value="NVB" />
         <euc:EformHidden ParentRecordId="2" RecordId="5" Runat="server" ID="ProcNS_Side_5" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSide" Value="Midline" />
         <euc:EformHidden ParentRecordId="2" RecordId="5" Runat="server" ID="ProcNS_Level_5" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindLevel" Value="Mid" />     </td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60" ID="ProcNS_Movement_5"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindMovement" ParentRecordId="2" RecordId="5" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_5,ProcNS_Side_5,ProcNS_Level_5"/></td>
     <td align="center" style="border-bottom: solid 1px #cccccc; white-space:nowrap;"><euc:EformTextBox style="width:60" ID="ProcNS_mA_5"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindmA" ParentRecordId="2" RecordId="5" class="InputText"  ShowNumberPad="true"  runat="server"  EnableHiddenOnUIEvent="ProcNS_Site_5,ProcNS_Side_5,ProcNS_Level_5"/></td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
   </tr>
   <tr >
     <td height="28" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb;"> Apex
       <euc:EformHidden ParentRecordId="2" RecordId="6" Runat="server" ID="ProcNS_Site_6" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSite" Value="NVB" />
         <euc:EformHidden ParentRecordId="2" RecordId="6" Runat="server" ID="ProcNS_Side_6" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSide" Value="Midline" />
         <euc:EformHidden ParentRecordId="2" RecordId="6" Runat="server" ID="ProcNS_Level_6" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindLevel" Value="Apex" />     </td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60" ID="ProcNS_Movement_6"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindMovement" ParentRecordId="2" RecordId="6" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_6,ProcNS_Side_6,ProcNS_Level_6"/></td>
     <td align="center" style="border-bottom: solid 1px #cccccc; white-space:nowrap;"><euc:EformTextBox style="width:60" ID="ProcNS_mA_6"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindmA" ParentRecordId="2" RecordId="6" class="InputText"  ShowNumberPad="true"  runat="server"  EnableHiddenOnUIEvent="ProcNS_Site_6,ProcNS_Side_6,ProcNS_Level_6"/></td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
   </tr>
   <tr >
     <td rowspan="3" valign="top" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb; border-right: solid 1px #bbbbbb;">Left</td>
     <td height="28" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb;"> Base
       <euc:EformHidden ParentRecordId="2" RecordId="7" Runat="server" ID="ProcNS_Site_7" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSite" Value="NVB" />
         <euc:EformHidden ParentRecordId="2" RecordId="7" Runat="server" ID="ProcNS_Side_7" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSide" Value="Left" />
         <euc:EformHidden ParentRecordId="2" RecordId="7" Runat="server" ID="ProcNS_Level_7" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindLevel" Value="Base" />     </td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60" ID="ProcNS_Movement_7"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindMovement" ParentRecordId="2" RecordId="7" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_7,ProcNS_Side_7,ProcNS_Level_7"/></td>
     <td align="center" style="border-bottom: solid 1px #cccccc; white-space:nowrap;"><euc:EformTextBox style="width:60" ID="ProcNS_mA_7"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindmA" ParentRecordId="2" RecordId="7" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_7,ProcNS_Side_7,ProcNS_Level_7"/></td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
   </tr>
   <tr >
     <td height="28" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb;"> Mid
       <euc:EformHidden ParentRecordId="2" RecordId="8" Runat="server" ID="ProcNS_Site_8" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSite" Value="NVB" />
         <euc:EformHidden ParentRecordId="2" RecordId="8" Runat="server" ID="ProcNS_Side_8" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSide" Value="Left" />
         <euc:EformHidden ParentRecordId="2" RecordId="8" Runat="server" ID="ProcNS_Level_8" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindLevel" Value="Mid" />     </td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60" ID="ProcNS_Movement_8"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindMovement" ParentRecordId="2" RecordId="8" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_8,ProcNS_Side_8,ProcNS_Level_8"/></td>
     <td align="center" style="border-bottom: solid 1px #cccccc; white-space:nowrap;"><euc:EformTextBox style="width:60" ID="ProcNS_mA_8"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindmA" ParentRecordId="2" RecordId="8" class="InputText"  ShowNumberPad="true"  runat="server"  EnableHiddenOnUIEvent="ProcNS_Site_8,ProcNS_Side_8,ProcNS_Level_8"/></td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
   </tr>
   <tr >
     <td height="28" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb;"> Apex
       <euc:EformHidden ParentRecordId="2" RecordId="9" Runat="server" ID="ProcNS_Site_9" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSite" Value="NVB" />
         <euc:EformHidden ParentRecordId="2" RecordId="9" Runat="server" ID="ProcNS_Side_9" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSide" Value="Left" />
         <euc:EformHidden ParentRecordId="2" RecordId="9" Runat="server" ID="ProcNS_Level_9" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindLevel" Value="Apex" />     </td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60" ID="ProcNS_Movement_9"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindMovement" ParentRecordId="2" RecordId="9" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_9,ProcNS_Side_9,ProcNS_Level_9"/></td>
     <td align="center" style="border-bottom: solid 1px #cccccc; white-space:nowrap;"><euc:EformTextBox style="width:60" ID="ProcNS_mA_9"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindmA" ParentRecordId="2" RecordId="9" class="InputText"  ShowNumberPad="true"  runat="server"  EnableHiddenOnUIEvent="ProcNS_Site_9,ProcNS_Side_9,ProcNS_Level_9"/></td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
   </tr>
   <tr >
     <td rowspan="2" valign="top" class="ClinicalEformGridColumnOne" style="border-right: solid 1px #bbbbbb;">Remote / Bladder Neck </td>
     <td height="28" colspan="2" valign="top" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb;">Right
       <euc:EformHidden ParentRecordId="2" RecordId="10" Runat="server" ID="ProcNS_Site_10" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSite" Value="BN" />
         <euc:EformHidden ParentRecordId="2" RecordId="10" Runat="server" ID="ProcNS_Side_10" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSide" Value="Right" />	</td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60" ID="ProcNS_Movement_10"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindMovement" ParentRecordId="2" RecordId="10" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_10,ProcNS_Side_10"/></td>
     <td align="center" style="border-bottom: solid 1px #cccccc; white-space:nowrap;"><euc:EformTextBox style="width:60" ID="ProcNS_mA_10"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindmA" ParentRecordId="2" RecordId="10" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_10,ProcNS_Side_10"/></td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
     <td  style="border-bottom: solid 1px #cccccc;">&nbsp;</td>
   </tr>
   <tr >
     <td height="28" colspan="2" valign="top" class="ClinicalEformGridColumnOne"  > Left
       <euc:EformHidden ParentRecordId="2" RecordId="11" Runat="server" ID="ProcNS_Site_11" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSite" Value="BN" />
         <euc:EformHidden ParentRecordId="2" RecordId="11" Runat="server" ID="ProcNS_Side_11" TABLE="NeuralStimulationProcFinding" FIELD="ProcFindSide" Value="Left" />	</td>
     <td align="center" ><euc:EformTextBox style="width:60" ID="ProcNS_Movement_11"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindMovement" ParentRecordId="2" RecordId="11" class="InputText"  ShowNumberPad="true"  runat="server" EnableHiddenOnUIEvent="ProcNS_Site_11,ProcNS_Side_11"/></td>
     <td align="center" ><euc:EformTextBox style="width:60" ID="ProcNS_mA_11"  TABLE="NeuralStimulationProcFinding" FIELD="ProcFindmA" ParentRecordId="2" RecordId="11" class="InputText"  ShowNumberPad="true"  runat="server"  EnableHiddenOnUIEvent="ProcNS_Site_11,ProcNS_Side_11"/></td>
     <td  >&nbsp;</td>
     <td  >&nbsp;</td>
   </tr>
 </table>