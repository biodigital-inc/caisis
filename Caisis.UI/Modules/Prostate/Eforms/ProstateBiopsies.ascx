	<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateBiopsies" CodeFile="ProstateBiopsies.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<br>

<a name="ProstateBiopsies" />
<table  width="400" border="0" cellpadding="0" cellspacing="0" class="controlBox">
   
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td colspan="3" height="18" align="left" class="controlBoxTitle">Prostate Biopsy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </td>
          </tr>
          <tr class="controlBoxDataGridTitleColumn">
			<td nowrap>
				Date<br><euc:EformHidden TABLE="BiopsiesProstate" FIELD="BxDate" Runat="server" ID="BxDate"/> <euc:EformTextbox TabIndex=1 style="width:100;" ShowCalendar="True" CalcDate="True"  TABLE="BiopsiesProstate" FIELD="BxDateText" Runat="server" ID="BxDateText"/></td>
			<td>
				Number + Cores <euc:EformTextBox TabIndex=5 ShowNumberPad="True"  style="width:100;" TABLE="BiopsiesProstate" FIELD="BxPosCores" Runat="server" ID="BxPosCores"/></td>
			<td>
				GG1 <euc:EformTextBox TabIndex="9"  style="width:100;" ShowNumberPad="True" TABLE="BiopsiesProstate" FIELD="BxGG1" Runat="server" ID="BxGG1"/></td>
		  </tr>
          
          <tr class="controlBoxDataGridTitleColumn">
			<td>
				Type<br> <euc:EformSelect TabIndex="2" LookupCode="BxTypeProstate"  style="width:100;" TABLE="BiopsiesProstate" FIELD="BxType" Runat="server" ID="BxType"/></td>
			 <td>
				Number Cores <euc:EformTextBox TabIndex="6" ShowNumberPad="True" style="width:100;" TABLE="BiopsiesProstate" FIELD="BxNumCores" Runat="server" ID="BxNumCores"/></td>
			
			<td>
				GG2 <euc:EformTextBox  TabIndex="10" ShowNumberPad="True" style="width:100;" TABLE="BiopsiesProstate" FIELD="BxGG2" Runat="server" ID="BxGG2"/></td>
		  </tr>
          
          <tr class="controlBoxDataGridTitleColumn">
			  <td>
				Path Number <euc:EformTextBox TabIndex="3" ShowNumberPad="True"  style="width:100;" TABLE="BiopsiesProstate" FIELD="BxPathNum" Runat="server" ID="BxPathNum"/></td>
			  <td>
				Number Sites <euc:EformTextBox TabIndex="7" ShowNumberPad="True"  style="width:100;" TABLE="BiopsiesProstate" FIELD="BxNumSites" Runat="server" ID="BxNumSites"/></td>
			
			<td>
				GGS <euc:EformTextBox TabIndex="11" ShowNumberPad="True"  style="width:100;" TABLE="BiopsiesProstate" FIELD="BxGGS" Runat="server" ID="BxGGS"/></td>
		</tr>
          
         <tr class="controlBoxDataGridTitleColumn">
			 <td>
				Max % Cancer <euc:EformTextBox TabIndex="4" ShowNumberPad="True"  style="width:100;" TABLE="BiopsiesProstate" FIELD="BxMaxPercCancer" Runat="server" ID="BxMaxPercCancer"/></td>
		 
			 <td>
				% Cancer <euc:EformTextBox TabIndex="8" ShowNumberPad="True" style="width:100;" TABLE="BiopsiesProstate" FIELD="BxPercCancer" Runat="server" ID="BxPercCancer"/></td>
			  <td>
				Result <euc:EformSelect LookupCode="ResultProstate" TabIndex="12"  style="width:100;" TABLE="BiopsiesProstate" FIELD="BxResult" Runat="server" ID="BxResult"/></td>
		  </tr>
		  
        </table>
       </td>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
</table>

<br>

<a name="Prostate Biopsy Cores" />
<table width="700" border="0" cellpadding="0" cellspacing="0" class="controlBox">
   
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          
			<tr> 
				<td colspan="3" height="18" align="left" class="controlBoxTitle">Biopsy Cores&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				</td>
			</tr>
			<tr class="controlBoxDataGridTitleColumn">
				<td nowrap align=left>Core #</td>
				<td align=center>1</td>
				<td align=center>2</td>
				<td align=center>3</td>
				<td align=center>4</td>
				<td align=center>5</td>
				<td align=center>6</td>
				<td align=center>7</td>
				<td align=center>8</td>
			</tr>
			
			<tr>
				<td class="controlBoxDataGridTitleColumn">Side</td>
				<td><euc:EformSelect TabIndex=13 RecordId="1" LookupCode="ProstateSide" TABLE="BiopsyCoresProstate" FIELD="BxCoreSide" Runat="server" ID="BxCoreSide_1"/></td>
				<td><euc:EformSelect TabIndex=22 RecordId="2" LookupCode="ProstateSide" TABLE="BiopsyCoresProstate" FIELD="BxCoreSide" Runat="server" ID="BxCoreSide_2"/></td>
				<td><euc:EformSelect TabIndex=31 RecordId="3" LookupCode="ProstateSide" TABLE="BiopsyCoresProstate" FIELD="BxCoreSide" Runat="server" ID="BxCoreSide_3"/></td>
				<td><euc:EformSelect TabIndex=40 RecordId="4" LookupCode="ProstateSide" TABLE="BiopsyCoresProstate" FIELD="BxCoreSide" Runat="server" ID="BxCoreSide_4"/></td>
				<td><euc:EformSelect TabIndex=49 RecordId="5" LookupCode="ProstateSide" TABLE="BiopsyCoresProstate" FIELD="BxCoreSide" Runat="server" ID="BxCoreSide_5"/></td>
				<td><euc:EformSelect TabIndex=58 RecordId="6" LookupCode="ProstateSide" TABLE="BiopsyCoresProstate" FIELD="BxCoreSide" Runat="server" ID="BxCoreSide_6"/></td>
				<td><euc:EformSelect TabIndex=67 RecordId="7" LookupCode="ProstateSide" TABLE="BiopsyCoresProstate" FIELD="BxCoreSide" Runat="server" ID="BxCoreSide_7"/></td>
				<td><euc:EformSelect TabIndex=76 RecordId="8" LookupCode="ProstateSide" TABLE="BiopsyCoresProstate" FIELD="BxCoreSide" Runat="server" ID="BxCoreSide_8"/></td>
			</tr>
       
			<tr>
				<td class="controlBoxDataGridTitleColumn">Level</td>
				<td><euc:EformSelect  TabIndex=14 RecordId="1" LookupCode="ProstateLevel" TABLE="BiopsyCoresProstate" FIELD="BxCoreLevel" Runat="server" ID="BxCoreLevel_1"/></td>
				<td><euc:EformSelect  TabIndex=23 RecordId="2" LookupCode="ProstateLevel" TABLE="BiopsyCoresProstate" FIELD="BxCoreLevel" Runat="server" ID="BxCoreLevel_2"/></td>
				<td><euc:EformSelect  TabIndex=32 RecordId="3" LookupCode="ProstateLevel" TABLE="BiopsyCoresProstate" FIELD="BxCoreLevel" Runat="server" ID="BxCoreLevel_3"/></td>
				<td><euc:EformSelect  TabIndex=41 RecordId="4" LookupCode="ProstateLevel" TABLE="BiopsyCoresProstate" FIELD="BxCoreLevel" Runat="server" ID="BxCoreLevel_4"/></td>
				<td><euc:EformSelect  TabIndex=50 RecordId="5" LookupCode="ProstateLevel" TABLE="BiopsyCoresProstate" FIELD="BxCoreLevel" Runat="server" ID="BxCoreLevel_5"/></td>
				<td><euc:EformSelect  TabIndex=59 RecordId="6" LookupCode="ProstateLevel" TABLE="BiopsyCoresProstate" FIELD="BxCoreLevel" Runat="server" ID="BxCoreLevel_6"/></td>
				<td><euc:EformSelect  TabIndex=68 RecordId="7" LookupCode="ProstateLevel" TABLE="BiopsyCoresProstate" FIELD="BxCoreLevel" Runat="server" ID="BxCoreLevel_7"/></td>
				<td><euc:EformSelect  TabIndex=77 RecordId="8" LookupCode="ProstateLevel" TABLE="BiopsyCoresProstate" FIELD="BxCoreLevel" Runat="server" ID="BxCoreLevel_8"/></td>
			</tr>
			
			<tr>
				<td class="controlBoxDataGridTitleColumn">Laterality</td>
				<td><euc:EformSelect TabIndex=15 RecordId="1" LookupCode="Laterality" TABLE="BiopsyCoresProstate" FIELD="BxCoreLaterality" Runat="server" ID="BxCoreLaterality_1"/></td>
				<td><euc:EformSelect TabIndex=24 RecordId="2" LookupCode="Laterality" TABLE="BiopsyCoresProstate" FIELD="BxCoreLaterality" Runat="server" ID="BxCoreLaterality_2"/></td>
				<td><euc:EformSelect TabIndex=33 RecordId="3" LookupCode="Laterality" TABLE="BiopsyCoresProstate" FIELD="BxCoreLaterality" Runat="server" ID="BxCoreLaterality_3"/></td>
				<td><euc:EformSelect TabIndex=42 RecordId="4" LookupCode="Laterality" TABLE="BiopsyCoresProstate" FIELD="BxCoreLaterality" Runat="server" ID="BxCoreLaterality_4"/></td>
				<td><euc:EformSelect TabIndex=51 RecordId="5" LookupCode="Laterality" TABLE="BiopsyCoresProstate" FIELD="BxCoreLaterality" Runat="server" ID="BxCoreLaterality_5"/></td>
				<td><euc:EformSelect TabIndex=60 RecordId="6" LookupCode="Laterality" TABLE="BiopsyCoresProstate" FIELD="BxCoreLaterality" Runat="server" ID="BxCoreLaterality_6"/></td>
				<td><euc:EformSelect TabIndex=69 RecordId="7" LookupCode="Laterality" TABLE="BiopsyCoresProstate" FIELD="BxCoreLaterality" Runat="server" ID="BxCoreLaterality_7"/></td>
				<td><euc:EformSelect TabIndex=78 RecordId="8" LookupCode="Laterality" TABLE="BiopsyCoresProstate" FIELD="BxCoreLaterality" Runat="server" ID="BxCoreLaterality_8"/></td>
			</tr>
			
			<tr>
				<td class="controlBoxDataGridTitleColumn"># Cores</td>
				<td><euc:EformTextBox TabIndex=16 style="width:72"  RecordId="1" TABLE="BiopsyCoresProstate" FIELD="BxCoreNumCores" Runat="server" ID="BxCoreNumCores_1"/></td>
				<td><euc:EformTextBox TabIndex=25 style="width:72"  RecordId="2" TABLE="BiopsyCoresProstate" FIELD="BxCoreNumCores" Runat="server" ID="BxCoreNumCores_2"/></td>
				<td><euc:EformTextBox TabIndex=34 style="width:72"  RecordId="3" TABLE="BiopsyCoresProstate" FIELD="BxCoreNumCores" Runat="server" ID="BxCoreNumCores_3"/></td>
				<td><euc:EformTextBox TabIndex=43 style="width:72"  RecordId="4" TABLE="BiopsyCoresProstate" FIELD="BxCoreNumCores" Runat="server" ID="BxCoreNumCores_4"/></td>
				<td><euc:EformTextBox TabIndex=52 style="width:72"  RecordId="5" TABLE="BiopsyCoresProstate" FIELD="BxCoreNumCores" Runat="server" ID="BxCoreNumCores_5"/></td>
				<td><euc:EformTextBox TabIndex=61 style="width:72"  RecordId="6" TABLE="BiopsyCoresProstate" FIELD="BxCoreNumCores" Runat="server" ID="BxCoreNumCores_6"/></td>
				<td><euc:EformTextBox TabIndex=70 style="width:72"  RecordId="7" TABLE="BiopsyCoresProstate" FIELD="BxCoreNumCores" Runat="server" ID="BxCoreNumCores_7"/></td>
				<td><euc:EformTextBox TabIndex=79 style="width:72"  RecordId="8" TABLE="BiopsyCoresProstate" FIELD="BxCoreNumCores" Runat="server" ID="BxCoreNumCores_8"/></td>
			</tr>
			
			<tr>
				<td class="controlBoxDataGridTitleColumn">% Ca</td>
				<td><euc:EformTextBox TabIndex=17 style="width:72"  RecordId="1" TABLE="BiopsyCoresProstate" FIELD="BxCorePercCancer" Runat="server" ID="BxCorePercCancer_1"/></td>
				<td><euc:EformTextBox TabIndex=26 style="width:72"  RecordId="2" TABLE="BiopsyCoresProstate" FIELD="BxCorePercCancer" Runat="server" ID="BxCorePercCancer_2"/></td>
				<td><euc:EformTextBox TabIndex=35 style="width:72"  RecordId="3" TABLE="BiopsyCoresProstate" FIELD="BxCorePercCancer" Runat="server" ID="BxCorePercCancer_3"/></td>
				<td><euc:EformTextBox TabIndex=44 style="width:72"  RecordId="4" TABLE="BiopsyCoresProstate" FIELD="BxCorePercCancer" Runat="server" ID="BxCorePercCancer_4"/></td>
				<td><euc:EformTextBox TabIndex=53 style="width:72"  RecordId="5" TABLE="BiopsyCoresProstate" FIELD="BxCorePercCancer" Runat="server" ID="BxCorePercCancer_5"/></td>
				<td><euc:EformTextBox TabIndex=62 style="width:72"  RecordId="6" TABLE="BiopsyCoresProstate" FIELD="BxCorePercCancer" Runat="server" ID="BxCorePercCancer_6"/></td>
				<td><euc:EformTextBox TabIndex=71 style="width:72"  RecordId="7" TABLE="BiopsyCoresProstate" FIELD="BxCorePercCancer" Runat="server" ID="BxCorePercCancer_7"/></td>
				<td><euc:EformTextBox TabIndex=80 style="width:72"  RecordId="8" TABLE="BiopsyCoresProstate" FIELD="BxCorePercCancer" Runat="server" ID="BxCorePercCancer_8"/></td>
			</tr>
			
			<tr>
				<td class="controlBoxDataGridTitleColumn">GG 1</td>
				<td><euc:EformTextBox TabIndex=18 style="width:72"  RecordId="1" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG1" Runat="server" ID="BxCoreGG1_1"/></td>
				<td><euc:EformTextBox TabIndex=27 style="width:72"  RecordId="2" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG1" Runat="server" ID="BxCoreGG1_2"/></td>
				<td><euc:EformTextBox TabIndex=36 style="width:72"  RecordId="3" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG1" Runat="server" ID="BxCoreGG1_3"/></td>
				<td><euc:EformTextBox TabIndex=45 style="width:72"  RecordId="4" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG1" Runat="server" ID="BxCoreGG1_4"/></td>
				<td><euc:EformTextBox TabIndex=54 style="width:72"  RecordId="5" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG1" Runat="server" ID="BxCoreGG1_5"/></td>
				<td><euc:EformTextBox TabIndex=63 style="width:72"  RecordId="6" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG1" Runat="server" ID="BxCoreGG1_6"/></td>
				<td><euc:EformTextBox TabIndex=72 style="width:72"  RecordId="7" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG1" Runat="server" ID="BxCoreGG1_7"/></td>
				<td><euc:EformTextBox TabIndex=81 style="width:72"  RecordId="8" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG1" Runat="server" ID="BxCoreGG1_8"/></td>
			</tr>
			
			<tr>
				<td class="controlBoxDataGridTitleColumn">GG 2</td>
				<td><euc:EformTextBox TabIndex=19 style="width:72"  RecordId="1" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG2" Runat="server" ID="BxCoreGG2_1"/></td>
				<td><euc:EformTextBox TabIndex=28 style="width:72"  RecordId="2" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG2" Runat="server" ID="BxCoreGG2_2"/></td>
				<td><euc:EformTextBox TabIndex=37 style="width:72"  RecordId="3" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG2" Runat="server" ID="BxCoreGG2_3"/></td>
				<td><euc:EformTextBox TabIndex=46 style="width:72"  RecordId="4" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG2" Runat="server" ID="BxCoreGG2_4"/></td>
				<td><euc:EformTextBox TabIndex=55 style="width:72"  RecordId="5" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG2" Runat="server" ID="BxCoreGG2_5"/></td>
				<td><euc:EformTextBox TabIndex=64 style="width:72"  RecordId="6" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG2" Runat="server" ID="BxCoreGG2_6"/></td>
				<td><euc:EformTextBox TabIndex=73 style="width:72"  RecordId="7" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG2" Runat="server" ID="BxCoreGG2_7"/></td>
				<td><euc:EformTextBox TabIndex=82 style="width:72"  RecordId="8" TABLE="BiopsyCoresProstate" FIELD="BxCoreGG2" Runat="server" ID="BxCoreGG2_8"/></td>
			</tr>
			
			<tr>
				<td class="controlBoxDataGridTitleColumn">GG Sum</td>
				<td><euc:EformTextBox TabIndex=20 style="width:72"  RecordId="1" TABLE="BiopsyCoresProstate" FIELD="BxCoreGGS" Runat="server" ID="BxCoreGGS_1"/></td>
				<td><euc:EformTextBox TabIndex=29 style="width:72"  RecordId="2" TABLE="BiopsyCoresProstate" FIELD="BxCoreGGS" Runat="server" ID="BxCoreGGS_2"/></td>
				<td><euc:EformTextBox TabIndex=38 style="width:72"  RecordId="3" TABLE="BiopsyCoresProstate" FIELD="BxCoreGGS" Runat="server" ID="BxCoreGGS_3"/></td>
				<td><euc:EformTextBox TabIndex=47 style="width:72"  RecordId="4" TABLE="BiopsyCoresProstate" FIELD="BxCoreGGS" Runat="server" ID="BxCoreGGS_4"/></td>
				<td><euc:EformTextBox TabIndex=56 style="width:72"  RecordId="5" TABLE="BiopsyCoresProstate" FIELD="BxCoreGGS" Runat="server" ID="BxCoreGGS_5"/></td>
				<td><euc:EformTextBox TabIndex=65 style="width:72"  RecordId="6" TABLE="BiopsyCoresProstate" FIELD="BxCoreGGS" Runat="server" ID="BxCoreGGS_6"/></td>
				<td><euc:EformTextBox TabIndex=74 style="width:72"  RecordId="7" TABLE="BiopsyCoresProstate" FIELD="BxCoreGGS" Runat="server" ID="BxCoreGGS_7"/></td>
				<td><euc:EformTextBox TabIndex=83 style="width:72"  RecordId="8" TABLE="BiopsyCoresProstate" FIELD="BxCoreGGS" Runat="server" ID="BxCoreGGS_8"/></td>
			</tr>
			
			<tr>
				<td class="controlBoxDataGridTitleColumn">Result</td>
				<td><euc:EformSelect LookupCode="ResultProstate" TabIndex=21 style="width:72"  RecordId="1" TABLE="BiopsyCoresProstate" FIELD="BxCoreResult" Runat="server" ID="BxCoreResult_1"/></td>
				<td><euc:EformSelect LookupCode="ResultProstate" TabIndex=30 style="width:72"  RecordId="2" TABLE="BiopsyCoresProstate" FIELD="BxCoreResult" Runat="server" ID="BxCoreResult_2"/></td>
				<td><euc:EformSelect LookupCode="ResultProstate" TabIndex=39 style="width:72"  RecordId="3" TABLE="BiopsyCoresProstate" FIELD="BxCoreResult" Runat="server" ID="BxCoreResult_3"/></td>
				<td><euc:EformSelect LookupCode="ResultProstate" TabIndex=48 style="width:72"  RecordId="4" TABLE="BiopsyCoresProstate" FIELD="BxCoreResult" Runat="server" ID="BxCoreResult_4"/></td>
				<td><euc:EformSelect LookupCode="ResultProstate" TabIndex=57 style="width:72"  RecordId="5" TABLE="BiopsyCoresProstate" FIELD="BxCoreResult" Runat="server" ID="BxCoreResult_5"/></td>
				<td><euc:EformSelect LookupCode="ResultProstate" TabIndex=66 style="width:72"  RecordId="6" TABLE="BiopsyCoresProstate" FIELD="BxCoreResult" Runat="server" ID="BxCoreResult_6"/></td>
				<td><euc:EformSelect LookupCode="ResultProstate" TabIndex=75 style="width:72"  RecordId="7" TABLE="BiopsyCoresProstate" FIELD="BxCoreResult" Runat="server" ID="BxCoreResult_7"/></td>
				<td><euc:EformSelect LookupCode="ResultProstate" TabIndex=84 style="width:72"  RecordId="8" TABLE="BiopsyCoresProstate" FIELD="BxCoreResult" Runat="server" ID="BxCoreResult_8"/></td>
			</tr>		
			
        </table>
       </td>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
</table>
