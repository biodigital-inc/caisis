<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.VesicourethralAnastamosis" CodeFile="VesicourethralAnastamosis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


    <!-- BEGIN Vesicourethral Anastamosis -->
    <a name="VesicourethralAnastamosis" />
    <span class="controlBoxTitle">&nbsp;&nbsp;Vesicourethral Anastomosis</span><br />
  <table width="460" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable">
    <tr> 
      <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td height="35" align="right" class="controlBoxDataGridTitleColumn">Quality<font size="1"> (Surgeon's Judgement)</font></td>
      <td  width="6" class="controlBoxDataGridTitleColumn">&nbsp;</td>
      <td width="6" class="controlBoxDataGridTitleColumn">&nbsp;</td>
      <td class="controlBoxDataGridTitleColumn"><euc:EFormSelect DropDownHeight="auto" DropDownWidth="105" LookupCode="ProstateAnastamosisQuality" TABLE="ProstatectomyProc" FIELD="ProcAnastQuality" runat="server" ID="OpAnastQuality"/></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridValueColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="right" class="controlBoxDataGridValueColumn">Number of Sutures</td>
      <td align="right" class="controlBoxDataGridValueColumn">&nbsp;</td>
      <td align="center" class="controlBoxDataGridValueColumn">&nbsp;</td>
      <td class="controlBoxDataGridValueColumn"><euc:EformTextBox TABLE="ProstatectomyProc" FIELD="ProcAnastNumSutures" ID="OpAnastNumSutures" runat="server" ShowNumberPad=true  class="InputText" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="right" class="controlBoxDataGridTitleColumn">Suture Pattern </td>
      <td align="right" class="controlBoxDataGridTitleColumn">&nbsp;</td>
      <td align="center" class="controlBoxDataGridTitleColumn">&nbsp;</td>
      <!--Input type changed from text box to select box-KR-->
      <td class="controlBoxDataGridTitleColumn"><euc:EFormSelect DropDownHeight="auto" DropDownWidth="105" LookupCode="OpSuturePattern" TABLE="ProstatectomyProc" FIELD="ProcAnastSuturePattern" runat="server" ID="OpAnastSuturePattern"/></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridValueColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="right" class="controlBoxDataGridValueColumn">Diameter of Bladder Neck</td>
      <td align="right" class="controlBoxDataGridValueColumn">&nbsp;</td>
      <td align="center" class="controlBoxDataGridValueColumn">&nbsp;</td>
      <td class="controlBoxDataGridValueColumn"><euc:EformTextBox TABLE="ProstatectomyProc" FIELD="ProcBN_Diam" ID="OpBN_Diam" runat="server"  ShowNumberPad="true" class="InputText" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="right" class="controlBoxDataGridTitleColumn">Mucosal Eversion</td>
      <td align="right" class="controlBoxDataGridTitleColumn">&nbsp;</td>
      <td align="center" class="controlBoxDataGridTitleColumn">&nbsp;</td>
      <!--Input type changed from select box to text box-KR-->
      <td class="controlBoxDataGridTitleColumn">
	  
	  
	  <euc:EFormSelect DropDownHeight="auto" DropDownWidth="105" LookupCode="ProstateMucosalEversion" TABLE="ProstatectomyProc" FIELD="ProcBN_DegreeEversion" size="1" id="OpBN_DegreeEversion" runat="server"/>
	  

	</td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridValueColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="right" class="controlBoxDataGridValueColumn">Suspension of Venous Complex</td>
      <td align="right" class="controlBoxDataGridValueColumn">&nbsp;</td>
      <td align="center" class="controlBoxDataGridValueColumn">&nbsp;</td>
      <td class="controlBoxDataGridValueColumn"><euc:EformRadioButtonList TABLE="ProstatectomyProc" FIELD="ProcSuspVeinComplex" LookupCode="YesNoUnknown" id="OpSuspVeinComplex" RepeatLayout="Flow" RepeatDirection="Horizontal"  runat="server">
		</euc:EformRadioButtonList>	
      </td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="right" class="controlBoxDataGridTitleColumn">Bladder Neck Preservation</td>
      <td align="right" class="controlBoxDataGridTitleColumn">&nbsp;</td>
      <td align="center" class="controlBoxDataGridTitleColumn">&nbsp;</td>
      <td class="controlBoxDataGridTitleColumn"><euc:EFormSelect DropDownHeight="auto" DropDownWidth="105" LookupCode="ProstateBladderNeckPreservation" TABLE="ProstatectomyProc" FIELD="ProcBladderNeckPreservation" name="QualityBladderSparing" size="1" id="QualityBladderSparing" runat="server"/></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridValueColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="right" class="controlBoxDataGridValueColumn">Subjective Score of Urethral Stump</td>
      <td align="right" class="controlBoxDataGridValueColumn">&nbsp;</td>
      <td align="center" class="controlBoxDataGridValueColumn">&nbsp;</td>
      <td class="controlBoxDataGridValueColumn"><euc:EFormSelect DropDownHeight="auto" DropDownWidth="105" LookupCode="ProstateUrethralStump" TABLE="ProstatectomyProc" FIELD="ProcUrethralStumpScore" size="1" id="ProcUrethralStumpScore" runat="server"/></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="right" class="controlBoxDataGridTitleColumn" style="vertical-align: top; padding-top: 10px;">Bladder Closure</td>
      <td align="right" class="controlBoxDataGridTitleColumn">&nbsp;</td>
      <td align="center" class="controlBoxDataGridTitleColumn">&nbsp;</td>
      <td class="controlBoxDataGridTitleColumn" style="padding-top: 7px;">
      <euc:EformRadioButtonList LookupCode="ProcedureBladderClosure" TABLE="ProstatectomyProc" FIELD="ProcBladderClosure" ID="OpBladderClosure" RepeatLayout="Flow" RepeatDirection="Vertical"  runat="server">
			</euc:EformRadioButtonList>	
      </td>

  
    <tr> 
      <td class="controlBoxDataGridValueColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="right" class="controlBoxDataGridValueColumn">Anastamosis Watertight </td>
      <td align="right" class="controlBoxDataGridValueColumn">&nbsp;</td>
      <td align="center" class="controlBoxDataGridValueColumn">&nbsp;</td>
      <td class="controlBoxDataGridValueColumn"><euc:EformRadioButtonList TABLE="ProstatectomyProc" FIELD="ProcAnastWatertight" LookupCode="YesNoUnknown" id="ProcAnastWatertight" RepeatLayout="Flow" RepeatDirection="Horizontal"  runat="server">
		</euc:EformRadioButtonList>	
      </td>
    </tr>
    
    <tr> 
      <td class="controlBoxDataGridTitleColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td  align="right" class="controlBoxDataGridTitleColumn" style="vertical-align: top; padding-top: 30px;">Anastamosis Notes</td>
      <td align="right" class="controlBoxDataGridTitleColumn">&nbsp;</td>
      <td align="center" class="controlBoxDataGridTitleColumn">&nbsp;</td>
      <td class="controlBoxDataGridTitleColumn" style="vertical-align: top; padding-top: 10px; padding-bottom: 10px">
<%--		<euc:EformTextBox TABLE="ProstatectomyProc" FIELD="ProcAnastSutureNotes" id="OpAnastSutureNotes" runat="server" size="30"></euc:EformTextBox> --%>
		<euc:EformTextArea TextMode="MultiLine" TABLE="ProstatectomyProc" FIELD="ProcAnastSutureNotes" style="width: 200px;" Height="100" Runat="server" ID="OpAnastSutureNotes"/>
      </td>
    </tr>
  </table>  <br/><br/><br/>


    <!-- END Vesicourethral Anastamosis -->
