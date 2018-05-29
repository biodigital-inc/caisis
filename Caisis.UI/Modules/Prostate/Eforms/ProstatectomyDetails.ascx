<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstatectomyDetails" CodeFile="ProstatectomyDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- START CLIN STAGE T -->
<a name="ProstatectomyDetails" />
<span class="controlBoxTitle">&nbsp;&nbsp;UICC 1992 Stage</span>
<br />
  <table width="350" border="0" cellpadding="0" cellspacing="0" class="controlBox">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">T Stage&nbsp;&nbsp;&nbsp; 
            </td>
            <td>
           
				<euc:EformHidden  ID="OpClinStageSystem" Value="UICC_1992" runat=server></euc:EFormHidden>
				<euc:EformTextBox ID="OpClinStageT" runat="server"  class="InputText" ></euc:EFormTextBox>
				
              <img src="../../Images/TStaging.gif" width="62" height="14" /></td>
          </tr>
        </table></td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
  </table>  <br/><br/><br/>
 <!-- END CLINS STAGE T -->

<!-- START INTRAOP PROSTATE EXAM -->

<span class="controlBoxTitle">&nbsp;&nbsp;Intraoperative Prostate Exam</span><br />
  <table width="760" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable">
   
   <tr>
		<td colspan=11>
	        2.0 REMOVED REFERENCE TO Grid_IntraOpProstateExam. Doesn't exist after conversion
		</td>
	</tr>
   
    <!-- NEED to create EFORM DATAGRID CONTROL? OTHERWISE USE A SERIES OF CONTROLS.. on hold -->
    <tr> 
      <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="100" height="29" class="controlBoxDataGridHeaderFirstCol">Side</td>
      <td class="controlBoxDataGridHeader">Level</td>
      <td class="controlBoxDataGridHeader">AP</td>
      <td class="controlBoxDataGridHeader">Laterality</td>
      <td class="controlBoxDataGridHeader">Cancer</td>
      <td class="controlBoxDataGridHeader">ECE</td>
      <td class="controlBoxDataGridHeader">+SM</td>
      <td class="controlBoxDataGridHeader">FS Result</td>
      <td class="controlBoxDataGridHeader"><font size="1">Additional<br />
        Tissue Resected</font></td>
      <td width="2" align="right" valign="top" class="controlBox"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> <select name="select6" size="1">
          <option selected="selected">Right</option>
          <option>Left</option>
        </select> </td>
      <td align="center"> <select name="select6" size="1">
          <option>Apex</option>
          <option>Middle</option>
          <option>Base</option>
          <option>Bladder Neck</option>
          <option>Seminal Vessicles</option>
          <option selected="selected"> </option>
        </select></td>
      <td align="center"><select name="select6" size="1">
          <option>-----</option>
        </select></td>
      <td align="center"><select name="select6" size="1">
          <option>Lateral</option>
          <option>Medial</option>
        </select></td>
      <td align="center"> <select name="select6" size="1">
          <option>--------</option>
        </select></td>
      <td align="center"> <select name="select6" size="1">
          <option>-----</option>
        </select></td>
      <td align="center"> <select name="select6" size="1">
          <option>-----</option>
        </select></td>
      <td align="center"> <select name="select6" size="1">
          <option>Negative</option>
          <option>Benign</option>
          <option>Cancer</option>
        </select></td>
      <td align="center"> <select name="select6" size="1">
          <option>Negative</option>
          <option>Benign</option>
          <option>Cancer</option>
        </select></td>
      <td><img src="../../Images/EformDeleteRow.gif" width="22" height="14" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> <select name="select7" size="1">
          <option selected="selected">Right</option>
          <option>Left</option>
        </select> </td>
      <td align="center"> <select name="select10" size="1">
          <option>Apex</option>
          <option>Middle</option>
          <option>Base</option>
          <option>Bladder Neck</option>
          <option>Seminal Vessicles</option>
          <option selected="selected"> </option>
        </select></td>
      <td align="center"><select name="select13" size="1">
          <option>-----</option>
        </select></td>
      <td align="center"><select name="select16" size="1">
          <option>Lateral</option>
          <option>Medial</option>
        </select></td>
      <td align="center"> <select name="select6" size="1">
          <option>--------</option>
        </select></td>
      <td align="center"> <select name="select19" size="1">
          <option>-----</option>
        </select></td>
      <td align="center"> <select name="select19" size="1">
          <option>-----</option>
        </select></td>
      <td align="center"> <select name="select25" size="1">
          <option>Negative</option>
          <option>Benign</option>
          <option>Cancer</option>
        </select></td>
      <td align="center"> <select name="select25" size="1">
          <option>Negative</option>
          <option>Benign</option>
          <option>Cancer</option>
        </select></td>
      <td><img src="../../Images/EformDeleteRow.gif" width="22" height="14" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> <select name="select8" size="1">
          <option>Right</option>
          <option selected="selected">Left</option>
        </select> </td>
      <td align="center"> <select name="select11" size="1">
          <option>Apex</option>
          <option>Middle</option>
          <option>Base</option>
          <option>Bladder Neck</option>
          <option>Seminal Vessicles</option>
          <option selected="selected"> </option>
        </select></td>
      <td align="center"><select name="select14" size="1">
          <option>-----</option>
        </select></td>
      <td align="center"><select name="select17" size="1">
          <option>Lateral</option>
          <option>Medial</option>
        </select></td>
      <td align="center"> <select name="select6" size="1">
          <option>--------</option>
        </select></td>
      <td align="center"> <select name="select20" size="1">
          <option>-----</option>
        </select></td>
      <td align="center"> <select name="select20" size="1">
          <option>-----</option>
        </select></td>
      <td align="center"> <select name="select26" size="1">
          <option>Negative</option>
          <option>Benign</option>
          <option>Cancer</option>
        </select></td>
      <td align="center"> <select name="select26" size="1">
          <option>Negative</option>
          <option>Benign</option>
          <option>Cancer</option>
        </select></td>
      <td><img src="../../Images/EformDeleteRow.gif" width="22" height="14" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> <select name="select9" size="1">
          <option>Right</option>
          <option selected="selected">Left</option>
        </select> </td>
      <td align="center"> <select name="select12" size="1">
          <option>Apex</option>
          <option>Middle</option>
          <option>Base</option>
          <option>Bladder Neck</option>
          <option>Seminal Vessicles</option>
          <option selected="selected"> </option>
        </select></td>
      <td align="center"><select name="select15" size="1">
          <option>-----</option>
        </select></td>
      <td align="center"><select name="select18" size="1">
          <option>Lateral</option>
          <option>Medial</option>
        </select></td>
      <td align="center"> <select name="select6" size="1">
          <option>--------</option>
        </select></td>
      <td align="center"> <select name="select21" size="1">
          <option>-----</option>
        </select></td>
      <td align="center"> <select name="select21" size="1">
          <option>-----</option>
        </select></td>
      <td align="center"> <select name="select27" size="1">
          <option>Negative</option>
          <option>Benign</option>
          <option>Cancer</option>
        </select></td>
      <td align="center"> <select name="select27" size="1">
          <option>Negative</option>
          <option>Benign</option>
          <option>Cancer</option>
        </select></td>
      <td><img src="../../Images/EformDeleteRow.gif" width="22" height="14" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td align="center" class="controlBoxDataGridFirstColumn"><img src="../../Images/EformAddRows.gif" width="31" height="18" /></td>
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
<!-- END INTRAOP PROSTATE EXAM -->



<!-- BEGIN MRI -->
<span class="controlBoxTitle">&nbsp;&nbsp;MRI</span><br />
  <table width="500" border="0" cellpadding="0" cellspacing="0" class="controlBox">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="396">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="30" height="18" align="right" class="controlBoxFieldTitle">Veins&nbsp; 
            </td>
            <td>
				<euc:EformTextBox ID="MriVeins"  class="InputText"  runat=server></euc:EFormTextBox>
            </td>
            <td align="right" class="controlBoxFieldTitle">Urethral Length&nbsp; 
            </td>
            <td>
				<euc:EformTextBox ID="MriUrethralLength"  class="InputText"  runat=server></euc:EFormTextBox>
            </td>
          </tr>
        </table></td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
  </table><br/><br/><br/>
<!-- END MRI -->



<!-- BEGIN Accessory Vessels -->
<span class="controlBoxTitle">&nbsp;&nbsp;Accessory Vessels</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  <euc:EformRadioButton id="OpAV_PreservedYes" Text="Yes" GroupName="OpAV_Preserved" runat="server"/>
   &nbsp;&nbsp;&nbsp;&nbsp; 
  <euc:EformRadioButton id="OpAV_PreservedNo" Text="No" GroupName="OpAV_Preserved" runat="server"/>
  <br />
  <table width="520" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable">
    <tr> 
      <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="100" height="25" class="controlBoxDataGridHeaderFirstCol">Side</td>
      <td class="controlBoxDataGridHeader">Location</td>
      <td class="controlBoxDataGridHeader">Size</td>
      <td class="controlBoxDataGridHeader">Preserved</td>
      <td width="2" align="right" valign="top" class="controlBox"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" align="right" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> Right</td>
      <td align="center">
			<euc:EFormSelect runat=server ID="OpR_AV_Site">
					<option value="Apical">Apical</option>
					<option value="Lateral">Lateral</option>
			</euc:EFormSelect>
        </td>
      <td align="center">
			<euc:EformTextBox ID="OpR_AV_Diam"  class="InputText"  runat=server></euc:EFormTextBox>
      </td>
      <td align="center">
			<%--
			<euc:EFormSelect runat=server ID="OpAV_Preserved">
					<option value="Yes">Yes</option>
					<option value="No">No</option>
			</euc:EFormSelect>
			--%>
      </td>
      <td><img src="../../Images/EformDeleteRow.gif" width="22" height="14" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> Left</td>
      <td align="center"> 
			<euc:EFormSelect runat=server ID="OpL_AV_Site">
					<option value="Apical">Apical</option>
					<option value="Lateral">Lateral</option> 
			</euc:EFormSelect>
      </td>
      <td align="center">           
			<euc:EformTextBox ID="OpL_AV_Diam"  class="InputText"  runat=server></euc:EFormTextBox>
	  </td>
      
      <td align="center">  
        
        </td>
      <td><img src="../../Images/EformDeleteRow.gif" width="22" height="14" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td align="center" class="controlBoxDataGridFirstColumn"><img src="../../Images/EformAddRows.gif" width="31" height="18" /></td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td align="right" valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>  <br/><br/><br/>
  
  <!-- END Accessory Vessels -->



<!-- BEGIN Seminal Vessicles -->

<table width="520" border="0" cellpadding="0" cellspacing="0" class="controlBox">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="516">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td><table width="516" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="250" height="18" align="right" class="controlBoxFieldTitle">First 
              Dissection of Seminal Vessicles&nbsp; </td>
            <td class="controlBoxFieldOption"> 
              
              <euc:EformRadioButton id="OpSV_DissectionFirstYes" Text="Yes" GroupName="OpSV_DissectionFirst" runat="server"/>
              <euc:EformRadioButton id="OpSV_DissectionFirstNo" Text="No" GroupName="OpSV_DissectionFirst" runat="server"/>
              
              
            </td>
          </tr>
          <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">Approach&nbsp; 
            </td>
            <td class="controlBoxFieldTitle">
				<euc:EformSelect name="Approach" size="1" id="OpApproach" runat=server>
					<option value=" "></option>
					<option>Intra-peritoneal</option>
					<option>Pre-peritoneal</option>
              </euc:EformSelect></td>
          </tr>
        </table> </td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
  </table>
  <table width="520" border="0" cellpadding="0" cellspacing="0" class="controlBox">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="516">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td><table width="516" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="250" height="18" align="right" class="controlBoxFieldTitle">Bull 
              Dog Clamps</td>
            <td class="controlBoxFieldOption"> <label> 

              <euc:EformRadioButton id="OpBulldogClampsYes" Text="Yes" GroupName="OpBulldogClamps" runat="server"/>
              <euc:EformRadioButton id="OpBulldogClampsNo" Text="No" GroupName="OpBulldogClamps" runat="server"/>


              </td>
          </tr>
          <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">Periprostatic 
              Veins &nbsp; </td>
            <td class="controlBoxFieldTitle">
				<euc:EformSelect name="PeriprostaticVeins" size="1" id="OpPeriprostaticVeins" runat=server>
					<option value=" "></option>
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">4+</option>     
              </euc:EformSelect></td>
          </tr>
        </table></td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
  </table>  <br/><br/><br/>

<!-- END Seminal Vessicles -->





  <!-- BEGIN Neurovascular Bundles -->

<span class="controlBoxTitle">&nbsp;&nbsp;Neurovascular Bundles</span><br />
   <table width="775" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable">
    <tr> 
      <td width="2" rowspan="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="75" height="25" rowspan="2" class="controlBoxDataGridHeaderFirstCol">Side</td>
      <td rowspan="2" class="controlBoxDataGridHeader">Visual Status</td>
      <td colspan="2" class="controlBoxDataGridHeaderFirstCol">Cavermap</td>
      <td class="controlBoxDataGridHeader">&nbsp;</td>
      <td colspan="2" class="controlBoxDataGridHeaderFirstCol">Doppler Probe</td>
      <td rowspan="2" class="controlBoxDataGridHeader">Graft</td>
      <td rowspan="2" class="controlBoxDataGridHeader">Donor Site</td>
      <td rowspan="2" class="controlBoxDataGridHeader">Graft Quality</td>
      <td width="2" rowspan="2" align="right" valign="top" class="controlBox"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridHeader"><font size="1">Max Resp</font></td>
      <td width="40" class="controlBoxDataGridHeader"><font size="1">mA</font></td>
      <td class="controlBoxDataGridHeader">&nbsp;</td>
      <td width="60" class="controlBoxDataGridHeader"><font size="1">Status</font></td>
      <td class="controlBoxDataGridHeader"><font size="1">Assesment</font></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> Right</td>
      <td align="center"> <select name="ProcProstatectomiesOp_OpR_NVB_Status" size="1" id="ProcProstatectomiesOp_OpR_NVB_Status">
          <option>Preserved</option>
          <option>Possible Damage</option>
          <option>Definite Damage</option>
          <option>Complete Resection</option>
        </select></td>
      <td align="center"><input name="CavermapR_MaxResponse" type="text" class="InputText" id="CavermapR_MaxResponse" size="3" /></td>
      <td align="center"><input name="CavermapR_Current" type="text" class="InputText" id="CavermapR_Current" size="3" /></td>
      <td align="center">&nbsp;</td>
      <td align="center"> <input name="ProcProstatectomiesOp_OpR_DopplerStatus" type="text" class="InputText" id="ProcProstatectomiesOp_OpR_DopplerStatus" size="6" /></td>
      <td align="center"> <input name="ProcProstatectomiesOp_OpR_DopplerVA" type="text" class="InputText" id="ProcProstatectomiesOp_OpR_DopplerVA" size="6" /></td>
      <td align="center"> <select name="ProcProstatectomiesOp_OpR_NVB_Graft" size="1" id="ProcProstatectomiesOp_OpR_NVB_Graft">
          <option>Yes</option>
          <option>No</option>
          <option>Canceled</option>
          <option>NP</option>
        </select></td>
      <td align="center"> <select name="ProcProstatectomiesOp_OpR_NVB_Donor" size="1" id="ProcProstatectomiesOp_OpR_NVB_Donor">
          <option>Sural</option>
          <option>Genito-Femoral</option>
          <option>Ilio-Inguinal</option>
        </select></td>
      <td align="center"><select name="ProcProstatectomiesOp_OpR_NVB_Quality" size="1" id="ProcProstatectomiesOp_OpR_NVB_Quality">
          <option value="0">0</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">4+</option>
          <option value=" " selected="selected"></option>
        </select></td>
      <td><img src="../../Images/EFormDeleteRow.gif" width="22" height="14" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> Left 
      </td>
      <td align="center"> <select name="ProcProstatectomiesOp_OpR_NVB_Status" size="1" id="ProcProstatectomiesOp_OpR_NVB_Status">
          <option>Preserved</option>
          <option>Possible Damage</option>
          <option>Definite Damage</option>
          <option>Complete Resection</option>
        </select></td>
      <td align="center"><input name="CavermapL_MaxResponse" type="text" class="InputText" id="CavermapL_MaxResponse" size="3" /></td>
      <td align="center"><input name="CavermapL_Current" type="text" class="InputText" id="CavermapL_Current" size="3" /></td>
      <td align="center">&nbsp;</td>
      <td align="center"> <input name="ProcProstatectomiesOp_OpL_DopplerStatus" type="text" class="InputText" id="ProcProstatectomiesOp_OpL_DopplerStatus" size="6" /></td>
      <td align="center"> <input name="ProcProstatectomiesOp_OpL_DopplerVA" type="text" class="InputText" id="ProcProstatectomiesOp_OpL_DopplerVA" size="6" /></td>
      <td align="center"> <select name="ProcProstatectomiesOp_OpL_NVB_Graft" size="1" id="ProcProstatectomiesOp_OpL_NVB_Graft">
          <option>Yes</option>
          <option>No</option>
          <option>Canceled</option>
          <option>NP</option>
        </select></td>
      <td align="center"> <select name="ProcProstatectomiesOp_OpL_NVB_Donor" size="1" id="ProcProstatectomiesOp_OpL_NVB_Donor">
          <option>Sural</option>
          <option>Genito-Femoral</option>
          <option>Ilio-Inguinal</option>
        </select></td>
      <td align="center"><select name="ProcProstatectomiesOp_OpL_NVB_Quality" size="1" id="ProcProstatectomiesOp_OpL_NVB_Quality">
          <option value="0">0</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">4+</option>
          <option value=" " selected="selected"></option>
        </select></td>
      <td><img src="../../Images/EFORMDeleteRow.gif" width="22" height="14" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td align="center" class="controlBoxDataGridFirstColumn"><img src="../../Images/EformAddRows.gif" width="31" height="18" /></td>
      <td align="center">&nbsp;</td>
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
      <td align="center">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>  <br/><br/><br/>
  
  <!-- END Neurovascular Bundles -->
