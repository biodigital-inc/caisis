<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.IntraOpProstateExam" CodeFile="IntraOpProstateExam.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="IntraOpProstateExam" />
<span class="controlBoxTitle">&nbsp;&nbsp;Intraoperative Prostate Exam</span><br />
  <table width="700" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable">
    <tr> 
      <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="80" height="29" class="controlBoxDataGridHeaderFirstCol">Side</td>
      <td class="controlBoxDataGridHeader">Level</td>
      <td class="controlBoxDataGridHeader">AP</td>
      <td class="controlBoxDataGridHeader">Laterality</td>
      <td class="controlBoxDataGridHeader">Cancer</td>
      <td class="controlBoxDataGridHeader">ECE</td>
      <td class="controlBoxDataGridHeader">+SM</td>
      <td class="controlBoxDataGridHeader">FS Result</td>
      <td class="controlBoxDataGridHeader">Additional<br />
        Tissue<br/>Resected</td>
      <td width="2" align="right" valign="top" class="controlBox"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> 
      <euc:EformSelect style="width: 60;" LookupCode="ProstateSide" runat=server  Field="OpExamSide" RecordId="1" Table="ProstatectomyOpExams" id="OpExamSide_1"/>
        </td>
      <td align="center">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat=server  Field="OpExamLevel" RecordId="1" Table="ProstatectomyOpExams" id="OpExamLevel_1"/>
       </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat=server  Field="OpExamAP" RecordId="1" Table="ProstatectomyOpExams" id="OpExamAP_1"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Laterality" runat=server Field="OpExamLat" RecordId="1" Table="ProstatectomyOpExams" id="OpExamLat_1"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat=server Field="OpExamCancer" RecordId="1" Table="ProstatectomyOpExams" id="OpExamCancer_1"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat=server  Field="OpExamExtension" RecordId="1" Table="ProstatectomyOpExams" id="OpExamExtension_1"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat=server  Field="OpExamMarginStatus" RecordId="1" Table="ProstatectomyOpExams" id="OpExamMarginStatus_1"/>
      </td>
      <td align="center"> 
      <euc:EformSelect style="width: 60;" LookupCode="FrozenSectionResults" runat=server  Field="OpExamFrozenSection" RecordId="1" Table="ProstatectomyOpExams" id="OpExamFrozenSection_1">
      </euc:EformSelect>
      </td>
      
      <td align="center"><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat=server  Field="OpExamAddTissue" RecordId="1" Table="ProstatectomyOpExams" id="OpExamAddTissue_1"/></td>
      <td>&nbsp;</td>
    </tr>

    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> 
      <euc:EformSelect style="width: 60;" LookupCode="ProstateSide" runat=server  Field="OpExamSide" RecordId="2" Table="ProstatectomyOpExams" id="OpExamSide_2"/>
        </td>
      <td align="center">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat=server  Field="OpExamLevel" RecordId="2" Table="ProstatectomyOpExams" id="OpExamLevel_2"/>
       </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat=server  Field="OpExamAP" RecordId="2" Table="ProstatectomyOpExams" id="OpExamAP_2"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Laterality" runat=server Field="OpExamLat" RecordId="2" Table="ProstatectomyOpExams" id="OpExamLat_2"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat=server  Field="OpExamCancer" RecordId="2" Table="ProstatectomyOpExams" id="OpExamCancer_2"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat=server  Field="OpExamExtension" RecordId="2" Table="ProstatectomyOpExams" id="OpExamExtension_2"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat=server  Field="OpExamMarginStatus" RecordId="2" Table="ProstatectomyOpExams" id="OpExamMarginStatus_2"/>
      </td>
      <td align="center"> 
      <euc:EformSelect style="width: 60;" LookupCode="FrozenSectionResults" runat=server  Field="OpExamFrozenSection" RecordId="2" Table="ProstatectomyOpExams" id="OpExamFrozenSection_2">
      </euc:EformSelect>
      </td>

      <td align="center"><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat=server  Field="OpExamAddTissue" RecordId="2" Table="ProstatectomyOpExams" id="OpExamAddTissue_2"/></td>

      <td>&nbsp;</td>
    </tr>

    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> 
      <euc:EformSelect style="width: 60;" LookupCode="ProstateSide" runat=server  Field="OpExamSide" RecordId="3" Table="ProstatectomyOpExams" id="OpExamSide_3"/>
        </td>
      <td align="center">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat=server  Field="OpExamLevel" RecordId="3" Table="ProstatectomyOpExams" id="OpExamLevel_3"/>
       </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat=server  Field="OpExamAP" RecordId="3" Table="ProstatectomyOpExams" id="OpExamAP_3"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Laterality" runat=server  Field="OpExamLat" RecordId="3" Table="ProstatectomyOpExams" id="OpExamLat_3"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat=server  Field="OpExamCancer" RecordId="3" Table="ProstatectomyOpExams" id="OpExamCancer_3"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat=server  Field="OpExamExtension" RecordId="3" Table="ProstatectomyOpExams" id="OpExamExtension_3"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat=server  Field="OpExamMarginStatus" RecordId="3" Table="ProstatectomyOpExams" id="OpExamMarginStatus_3"/>
      </td>
      <td align="center"> 
      <euc:EformSelect style="width: 60;" LookupCode="FrozenSectionResults" runat=server  Field="OpExamFrozenSection" RecordId="3" Table="ProstatectomyOpExams" id="OpExamFrozenSection_3">
      </euc:EformSelect>
      </td>

      <td align="center"><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat=server  Field="OpExamAddTissue" RecordId="3" Table="ProstatectomyOpExams" id="OpExamAddTissue_3"/></td>

      <td>&nbsp;</td>
    </tr>

    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> 
      <euc:EformSelect style="width: 60;" LookupCode="ProstateSide" runat=server  Field="OpExamSide" RecordId="4" Table="ProstatectomyOpExams" id="OpExamSide_4"/>
        </td>
      <td align="center">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat=server  Field="OpExamLevel" RecordId="4" Table="ProstatectomyOpExams" id="OpExamLevel_4"/>
       </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat=server  Field="OpExamAP" RecordId="4" Table="ProstatectomyOpExams" id="OpExamAP_4"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Laterality" runat=server  Field="OpExamLat" RecordId="4" Table="ProstatectomyOpExams" id="OpExamLat_4"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat=server  Field="OpExamCancer" RecordId="4" Table="ProstatectomyOpExams" id="OpExamCancer_4"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat=server  Field="OpExamExtension" RecordId="4" Table="ProstatectomyOpExams" id="OpExamExtension_4"/>
      </td>
      <td align="center">
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat=server  Field="OpExamMarginStatus" RecordId="4" Table="ProstatectomyOpExams" id="OpExamMarginStatus_4"/>
      </td>
      <td align="center"> 
      <euc:EformSelect style="width: 60;" runat=server LookupCode="FrozenSectionResults"  Field="OpExamFrozenSection" RecordId="4" Table="ProstatectomyOpExams" id="OpExamFrozenSection_4">
      </euc:EformSelect>
      </td>

      <td align="center"><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat=server  Field="OpExamAddTissue" RecordId="4" Table="ProstatectomyOpExams" id="OpExamAddTissue_4"/></td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td align="right" valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>  <br/><br/><br/>