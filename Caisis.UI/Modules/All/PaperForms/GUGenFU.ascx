<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.GUGenFU" CodeFile="GUGenFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


<div id="PaperFormStart">

<div align="left"  style="page-break-after:always;">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U42*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><span style="font-size: 8px; float: right;">Printed <% =DateTime.Now.DayOfWeek %>, <% =DateTime.Now %></span><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>GU Follow-Up Patient<br/></span></td>
            <td width="50%" align="center" valign="bottom" class="blackBoldText"> 
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>
                    , 
                    <% =patientFirstName  %>
                    <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
                </tr>
              </table>			 </td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableRow"> 
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="8" valign="bottom" class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Date: <% =apptClinicDate %><img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableRow"> 
      <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr> 
          <td align="left" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">Referring&nbsp;M.D.: 
            <asp:Repeater ID="ReferringMD" runat=server >
				<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "phFirstName") %> <%# DataBinder.Eval(Container.DataItem, "phLastName") %> (<%# DataBinder.Eval(Container.DataItem, "phInstitution") %>)</ItemTemplate><SeparatorTemplate>, </SeparatorTemplate>
			</asp:Repeater>
			<asp:Label ID="blankReferrringMD" Runat="server"></asp:Label>		  </td>
         </tr>
        </table>       </td>
    </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td valign="top" align="left" class="FormInnerRowRightBorder" width="535" height="250"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">HPI / Diagnosis / Stage</span><br/> 
		<table cellpadding="4" cellspacing="0" border="0">
		<tr>
			<td class="HPIText" valign="top">
				<asp:Repeater ID="hpi" runat=server OnItemDataBound="hpiItemDataBound">
				<ItemTemplate>
					<%# DataBinder.Eval(Container.DataItem, "patientHPI") %><br/><asp:Literal ID="StartNextHpiColumn" Runat="server" />
				</ItemTemplate>
				</asp:Repeater>
				<asp:Label ID="PreTxPot" Runat="server" />			</td>
		</tr>
		</table>			</td>
            </tr>
        </table>	  </td>
    </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td class="FormInsideTableRegCell"  align="center" valign="middle" height="20">Current TX</td>
            <td class="FormInsideTableRegCell"  align="center" valign="middle"><img src="../../Images/shim.gif" border="0" width="70" height="1"></td>
            <td class="FormInsideTableRegCell"  align="center" valign="middle">Start Date</td>
            <td class="FormInsideTableRegCell"  align="center" valign="middle"><img src="../../Images/shim.gif" border="0" width="70" height="1"></td>
            <td class="FormInsideTableRegCell"  align="center" valign="middle">Cycle / Week</td>
            <td class="FormInsideTableRegCell"  align="center" valign="middle"><img src="../../Images/shim.gif" border="0" width="70" height="1"></td>
            <td class="FormInsideTableRegCell"  align="center" valign="middle">Protocol #&nbsp;Y<img src="../../Images/shim.gif" border="0" width="6" height="0">N</td>
            <td class="FormInsideTableRegCell"  align="center" valign="middle"><img src="../../Images/shim.gif" border="0" width="70" height="1"></td>
          </tr>
        </table>	  </td>
    </tr>
	<tr>
	  <td class="FormOuterTableRow"><table align="center" border="0"  class="pageWidth" cellpadding="1" cellspacing="0">
          <tr align="left">
            <td colspan="4" valign="middle"><span class="blackBoldText">Current Sites of Disease </span></td>
          </tr>
          <tr>
            <td valign="middle" class="FormInsideTableTopCell" style="font-weight:bold; text-align:center;">Primary Site </td>
            <td align="center" valign="middle" class="FormInsideTableTopCell"> Absent </td>
            <td align="center" valign="middle" class="FormInsideTableTopCell">Present</td>
            <td align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell">Bladder</td>
            <td align="center" class="FormInsideTableRegCell"><img id="Bladder_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="Bladder_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell"><img id="BladderMuscleInvasive_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" align="absmiddle" style="margin-left:2px; margin-right: 2px;" />Muscle Invasive<img id="BladderLocallyAdvancedUnresectable_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" align="absmiddle" style="margin-left:12px; margin-right: 2px;" />Locally Advanced / Unresectable </td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell">Ureter</td>
            <td align="center" class="FormInsideTableRegCell"><img id="Ureter_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="Ureter_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell">Renal Pelvis </td>
            <td align="center" class="FormInsideTableRegCell"><img id="RenalPelvis_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="RenalPelvis_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell">Urethra</td>
            <td align="center" class="FormInsideTableRegCell"><img id="Urethra_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="Urethra_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell">Testes</td>
            <td align="center" class="FormInsideTableRegCell"><img id="Testes_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="Testes_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
		  <tr>
            <td class="FormInsideTableRegCell">Kidney</td>
            <td align="center" class="FormInsideTableRegCell"><img id="Kidney_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="Kidney_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell"><span style="margin-left: 300px;">Histology:</span></td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell">Other:</td>
            <td align="center" class="FormInsideTableRegCell"><img id="Other_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="Other_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%" valign="middle" class="FormInsideTableTopCell" style="border-top-color: #000000; font-weight:bold; text-align:center;">Metastatic Sites </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell" style="border-top-color: #000000;"> Absent </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell" style="border-top-color: #000000;">Present</td>
            <td width="65%" align="center" valign="middle" class="FormInsideTableTopCell" style="border-top-color: #000000;">Notes</td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell">Bone</td>
            <td align="center" class="FormInsideTableRegCell"><img id="Bone_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="Bone_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell">Soft Tissue </td>
            <td align="center" class="FormInsideTableRegCell"><img id="SoftTissue_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="SoftTissue_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell">Lymph Nodes  </td>
            <td align="center" class="FormInsideTableRegCell"><img id="LymphNodes_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="LymphNodes_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell">Lung</td>
            <td align="center" class="FormInsideTableRegCell"><img id="Lung_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="Lung_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell">Liver</td>
            <td align="center" class="FormInsideTableRegCell"><img id="Liver_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="Liver_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
		  <tr>
            <td class="FormInsideTableRegCell">Brain</td>
            <td align="center" class="FormInsideTableRegCell"><img id="Brain_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="Brain_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell">Other:</td>
            <td align="center" class="FormInsideTableRegCell"><img id="MS_Other_Absent" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td align="center" class="FormInsideTableRegCell"><img id="MS_Other_Present" runat="server" src="../../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>

      </table></td>
	  </tr>
	<tr> 
      <td colspan="8" valign="top" class="FormOuterTableRow">
	  	<table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td valign="top" class="FormInnerRowRightBorder"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td valign="top" height="22" style="height: 140px; vertical-align: top;"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Interval 
                    History</span></td>
                </tr>
              </table>			</td>
          </tr>
        </table>	  </td>
    </tr>
	<tr> 
		
      <td class="FormOuterTableRow" valign="top" height="100"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Comorbidities</span>&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Repeater ID="comorbidities" runat=server>
			<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %> - <%# DataBinder.Eval(Container.DataItem, "Comorbidity") %></ItemTemplate>
			<SeparatorTemplate>,&nbsp;&nbsp;</SeparatorTemplate>
        </asp:Repeater>		</td>
    </tr>
	<tr> 
		<td class="FormOuterTableRow" valign="top" height="20"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="NKA" value="NKA">NKA&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Repeater ID="allergies" runat="server" OnItemDataBound="ShowAllergyResponse">
			<ItemTemplate><%# DataBinder.Eval(Container.DataItem, "Allergen") %> <asp:Literal ID="AllergyResponseText" runat="server" /></ItemTemplate>
			<SeparatorTemplate>,&nbsp;&nbsp;</SeparatorTemplate>
			</asp:Repeater>		</td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU37<img src="../../Images/shim.gif" border="0" width="45" height="1">U42<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 11/07<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>

<div align="left"  style="page-break-after:always;">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U42*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>GU Follow-Up Patient<br/></span></td>
            <td width="50%" align="center" valign="bottom" class="blackBoldText"> 
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>
                    , 
                    <% =patientFirstName  %>
                    <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
                </tr>
              </table>			 </td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td colspan="8" class="FormOuterTableRow"> 
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="8" valign="bottom" class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Date: <% =apptClinicDate %><img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></td>
          </tr>
        </table>		</td>
    </tr>
    <tr>
      <td  class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr>
            <td colspan="6" valign="bottom"><img src="../../Images/shim.gif" border="0" width="4" height="0" /><span class="blackBoldText">Review of Systems</span> &nbsp;&nbsp;<span class="smallGrayText">&nbsp;&nbsp;&nbsp;Clinician 
              Performing Review:
              <input type="checkbox" name="PA22" value="Yes" />
              RN&nbsp;&nbsp;
              <input type="checkbox" name="PA3" value="Yes" />
              PA/NP&nbsp;&nbsp;
              <input type="checkbox" name="Fellow3" value="Yes" />
              Fellow&nbsp;&nbsp;
              <input type="checkbox" name="Attending3" value="Yes" />
              Attending</span></td>
          </tr>
          <tr>
            <td colspan="6" valign="bottom" class="smallGrayText" style="padding-left: 160px;"><strong>Attribution codes:</strong> &nbsp;&nbsp;&nbsp;<strong>1</strong>: Unrelated &nbsp;&nbsp;&nbsp;&nbsp;<strong>2</strong>:  Unlikely &nbsp;&nbsp;&nbsp;&nbsp;<strong>3</strong>: Possible &nbsp;&nbsp;&nbsp;&nbsp;<strong>4</strong>: Probable &nbsp;&nbsp;&nbsp;&nbsp; <strong>5</strong>:  Definite</td>
          </tr>
          <tr>
            <td align="center" valign="bottom" class="FormInsideTableTopCell"><strong>Organ<br/>
              System</strong></td>
            <td align="center" valign="bottom" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td align="center" valign="bottom" class="FormInsideTableTopCell"><strong>Grade<br/>
              0<img src="../../Images/shim.gif" border="0" width="12" height="0" />1<img src="../../Images/shim.gif" border="0" width="12" height="0" />2<img src="../../Images/shim.gif" border="0" width="12" height="0" />3<img src="../../Images/shim.gif" border="0" width="12" height="0" />4</strong></td>
            <td width="15%" align="center" valign="bottom" class="FormInsideTableTopCell"><strong>Start - Stop<br/>
              Dates</strong></td>
            <td align="center" valign="bottom" class="FormInsideTableTopCell"><strong>Attribution</strong></td>
            <td width="30%" align="center" valign="bottom" class="FormInsideTableTopCell"><strong>Comments / Intervention </strong></td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="4"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Const&nbsp;</td>
            <td height="22" align="left" class="FormInsideTableRegCell">Fatigue</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="4" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr >
            <td height="22" align="left" class="FormInsideTableRegCell">Fever</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" nowrap="nowrap" class="FormInsideTableRegCell">Wt Loss/ App</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" nowrap="nowrap" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td rowspan="3" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Skin&nbsp;</td>
            <td height="22" align="left" class="FormInsideTableRegCell">Rash</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" nowrap="nowrap" class="FormInsideTableRegCell">Hand / Foot Syndrome </td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" nowrap="nowrap" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0" />ENMT&nbsp;</td>
            <td height="22" align="left" class="FormInsideTableRegCell">Mucositis</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" nowrap="nowrap" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td rowspan="2" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Resp&nbsp;</td>
            <td height="22" align="left" class="FormInsideTableRegCell">Dyspnea</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" nowrap="nowrap" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="0" />CV&nbsp;</td>
            <td height="22" align="left" class="FormInsideTableRegCell"> Edema</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr >
            <td height="22" align="left" class="FormInsideTableRegCell">Chest Pain</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" nowrap="nowrap" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="5"><img src="../../Images/shim.gif" border="0" width="4" height="0" />GI&nbsp;</td>
            <td height="22" align="left" class="FormInsideTableRegCell">Nausea</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="5" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" class="FormInsideTableRegCell">Vomiting</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td height="22" align="left" class="FormInsideTableRegCell">Diarrhea</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" class="FormInsideTableRegCell">Constipation</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" nowrap="nowrap" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="3"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Neuro&nbsp;</td>
            <td height="22" align="left" class="FormInsideTableRegCell">Neuropathy</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" class="FormInsideTableRegCell">Focal Weakness</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" nowrap="nowrap" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td class="FormInsideTableRegCell" align="left" valign="top" rowspan="6"><img src="../../Images/shim.gif" border="0" width="4" height="0" />GU&nbsp;</td>
            <td height="22" align="left" class="FormInsideTableRegCell">Nocturia</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
            <td rowspan="5" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" class="FormInsideTableRegCell">Hematuria</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" class="FormInsideTableRegCell">Dysuria</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" class="FormInsideTableRegCell">Continence</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center">-</td>
            <td class="FormInsideTableRegCell" align="center">&nbsp;</td>
          </tr>
          <tr >
            <td height="25" colspan="5" align="left" class="FormInsideTableRegCell">Potency:<span class="smallGrayText">(circle)</span>&nbsp;&nbsp;&nbsp;Y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;N</td>
          </tr>
          <tr >
            <td height="30" colspan="6" align="left" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Pain<img src="../../Images/shim.gif" border="0" width="15" height="1" />Y<img src="../../Images/shim.gif" border="0" width="15" height="1" />N<img src="../../Images/shim.gif" border="0" width="24" height="1" />Inten. (0-10):_______<img src="../../Images/shim.gif" border="0" width="24" height="1" />Relief:<img src="../../Images/shim.gif" border="0" width="12" height="1" />Y<img src="../../Images/shim.gif" border="0" width="24" height="1" />N</td>
          </tr>
      </table></td> 
      </tr>
    <tr> 
      <td height="25" class="FormOuterTableRow">&nbsp; <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes"> 
        <span class="blackBoldText"> ROS performed by RN: ________________________________<img src="../../Images/shim.gif" border="0" width="40" height="1">Date: ___/____/____ <span class="blackBoldText" style="white-space:nowrap;"><img src="../../Images/shim.gif" border="0" width="15" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></span></td>
    </tr>
    <tr>
      <td align="left" valign="top" class="FormOuterTableRow" height="90"><img src="../../Images/shim.gif" border="0" width="8" height="8" /><span class="blackBoldText">Comments / Notes:</span></td>
      </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU37<img src="../../Images/shim.gif" border="0" width="45" height="1">U42<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 11/07<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>

<div align="left"  style="page-break-after:always;">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220" /><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U42*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>GU Follow-Up Patient<br/></span></td>
            <td width="50%" align="center" valign="bottom" class="blackBoldText"> 
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>
                    , 
                    <% =patientFirstName  %>
                    <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
                </tr>
              </table>			 </td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
    <tr > 
      <td class="FormOuterTableRow">
	  	<table align="center" border="0"  class="pageWidth" cellpadding="4" cellspacing="0">
          <tr> 
            <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText">Vital Signs</span></td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BP:</td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Pulse:</td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Temp:</td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp:</td>
          </tr>
          <tr> 
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">KPS:</span></td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Height:</td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Weight:</td>
            <td height="15" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BSA:</td>
          </tr>
        </table>
		</td>
    </tr>
	<tr > 
      <td colspan="8" class="FormOuterTableRow" valign="middle"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Exam</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">
        <img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">
        PA&nbsp;&nbsp;&nbsp; 
        <img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">
        NP&nbsp;&nbsp;&nbsp; 
        <img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0">
        Attending Confirmed</span> <table align="center" border="0" class="pageWidth"  cellpadding="0" cellspacing="0">
          <tr > 
            <td class="FormInsideTableTopCell" align="center"><strong>System</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Normal Findings</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Abn</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Not<br/>
              Done</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Attnd<br />
Performed</strong></td>
            <td class="FormInsideTableTopCell" align="center"><strong>Comments</strong></td>
          </tr>
		  <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Gen/MS&nbsp;</td>
            <td class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absbottom">WD WN</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">NAD</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">A&amp;O</td>
					</tr>
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" width="50%" rowspan="13" valign="bottom">&nbsp;MAX-PC Total Score: __________________<br/>
			<br/></td>
          </tr>
          <tr > 
		  	<td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Eyes&nbsp;</td>
            <td class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Scleral Icterus</td>
						<td>&nbsp;</td>
					</tr>
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">ENT&nbsp;</td>
            <td class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Mucositis</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Thrush</td>
					</tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">Mucous Membranes Moist</td>
					<tr>					</tr>
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Nodes</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Cervical</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Axillary</td>
					</tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Supraclavicular</td>
					<tr>					</tr>
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
		  	<td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp.&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">Clear to Percussion&amp; Ausculation</td>
					</tr>
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">C/V&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Edema</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Murmurs</td>
					</tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">Regular Rate &amp; Rhythm</td>
					<tr>					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Abdomen&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Hepatosplenomegaly</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Ascites</td>
					</tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">Soft Non-tender; Normal Bowel Sounds</td>
					<tr>					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Back&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle" nowrap><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Spinal Tenderness</td>
						<td valign="middle" nowrap><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No CVA Tenderness</td>
					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">GU<br/> 
              <img src="../../Images/shim.gif" border="0" width="4" height="0">Male&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">Testes w/o Tenderness or Masses</td>
					</tr> 
					<tr>
						<td width="50%" valign="middle" ><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">DRE of Prostate</td>
						<td valign="middle" ><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">N/A</td>
					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">M/S&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Clubbing or Cyanosis</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Cord</td>
					</tr> 
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Calf Tenderness</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Leg Swelling</td>
					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Neuro&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">Motor
						  Function</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">Sensation</td>
					</tr>
						<td valign="middle" colspan="2"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">Cranial Nerves II-XII Intact</td>
					<tr>					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Skin&nbsp;</td>
            <td  class="FormInsideTableRegCell" align="left">
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Rash or Ulcers</td>
						<td valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle">No Nodules</td>
					</tr> 
				</table>			</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0">Other</td>
            <td  class="FormInsideTableRegCell" align="left">&nbsp;</td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
            <td class="FormInsideTableRegCell" align="center"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0"></td>
          </tr>
        </table>
	  </td>
    </tr>
	<tr>
		<td colspan="8" class="FormOuterTableRow">
			<span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Lab Tests</span>
			<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
			  <tr>
			  	<td width="50%">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td class="FormInsideTableTopCell" align="left" valign="top" width="25%" height="18"><img src="../../Images/shim.gif" border="0" width="4" height="0">WBC:</td>
							<td class="FormInsideTableTopCell" align="left" valign="top" width="25%"><img src="../../Images/shim.gif" border="0" width="4" height="0">ANC:</td>
							<td class="FormInsideTableTopCell" align="left" valign="top" width="25%"><img src="../../Images/shim.gif" border="0" width="4" height="0">HGB:</td>
							<td class="FormInsideTableTopCell" align="left" valign="top" width="25%"><img src="../../Images/shim.gif" border="0" width="4" height="0">PLT:</td>
						</tr>
					</table>
				</td>
			  	<td width="50%" class="FormInsideTableTopCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Comments:</td>
			  </tr>
			  <tr> 
				<td class="FormInsideTableRegCell" colspan="8" valign="top" align="left" height="40"><img src="../../Images/shim.gif" border="0" width="4" height="0">Chemistry:<img src="../../Images/shim.gif" border="0" width="270" height="1">Creat:</td>
			  </tr>
			  <tr> 
				<td class="FormInsideTableRegCell" colspan="8" valign="top" align="left" height="50"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span>Markers</span>
					<table  class="pageWidth" cellpadding="0" cellspacing="0" border="0">
					<tr> 
						<td>
						<asp:Repeater ID="labTests" runat=server OnItemDataBound="labTestsItemDataBound">
							<ItemTemplate>
							&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabQuality") %><br/><asp:Literal ID="StartNextLabTestsColumn" Runat="server" />
							</ItemTemplate>
						</asp:Repeater>
						</td>
					</tr>						
				  </table>
				</td>
			  </tr>
		  </table>
		</td>
	</tr>
    <tr> 
      <td colspan="8" class="FormOuterTableRow" valign="top" height="200"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Imaging</span><span><img src="../../Images/shim.gif" border="0" width="32" height="1"> 
        <input type="checkbox" name="Films Reviewed">
        Films Reviewed<img src="../../Images/shim.gif" border="0" width="32" height="1"> 
        <input type="checkbox" name="Compared to Past">
        Compared to Past<img src="../../Images/shim.gif" border="0" width="32" height="1"> 
        <input type="checkbox" name="Reviewed with Radiologist">
        Reviewed with Radiologist<img src="../../Images/shim.gif" border="0" width="32" height="1"> 
        <input type="checkbox" name="Digitized">
        Digitized</span><br/>
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr > 
            <td class="FormInsideTableTopCell" width="15%" align="center" valign="middle">Date&nbsp;(mm/dd/yyyy)</td>
            <td class="FormInsideTableTopCell" width="20%" align="center" valign="middle">Modality&nbsp;(CT,MRI...)</td>
            <td class="FormInsideTableTopCell" width="65%" align="center" valign="middle">Results/ Comments/ Comparisons</td>
          </tr>
          <asp:Repeater ID="images" runat="server" OnItemCreated="imagesItemCreated">
			<ItemTemplate>
          <tr > 
            <td align="center" class="FormInsideTableRegCell">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></td>
            <td class="FormInsideTableRegCell">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType") %></td>
            <td class="FormInnerRowBottomBorder">&nbsp;Result: <%# DataBinder.Eval(Container.DataItem, "DxResult") %><asp:Literal ID="ImagesNotesBullet" Runat="Server">&nbsp;&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;</asp:Literal><%# DataBinder.Eval(Container.DataItem, "DxNotes") %></td>
          </tr>
			</ItemTemplate>
			</asp:Repeater>
        </table>
	   </td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU37<img src="../../Images/shim.gif" border="0" width="45" height="1">U42<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 11/07<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div> 




<div  align="left"  style="page-break-after:always;" id="LastPageInForm" runat="server" ><%--align="left" --%>

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U42*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>GU Follow-Up Patient<br/></span></td>
            <td width="50%" align="center" valign="bottom" class="blackBoldText"> 
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="274"><img src="../../Images/shim.gif" border="0" width="274" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>
                    , 
                    <% =patientFirstName  %>
                    <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top"> 
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5"></td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
                </tr>
              </table>			 </td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: <% =apptClinicDate %></span></td>
    </tr>
	<tr > 
      <td colspan="8" class="FormOuterTableRow">
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td class="FormInsideTableTopCell" width="48%" align="center"><strong>Diagnoses / Problem List</strong></td>
            <td class="FormInsideTableTopCell" width="2%" align="center"><strong>New</strong></td>
            <td class="FormInsideTableTopCell" width="50%" align="center"><strong>Plan / Work-up / Referrals</strong></td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top" height="74"><img src="../../Images/shim.gif" border="0" width="4" height="0">1.</td>
            <td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top" height="74"><img src="../../Images/shim.gif" border="0" width="4" height="0">2.</td>
            <td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top" height="74"><img src="../../Images/shim.gif" border="0" width="4" height="0">3.</td>
            <td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top" height="74"><img src="../../Images/shim.gif" border="0" width="4" height="0">4.</td>
            <td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr > 
            <td class="FormInsideTableRegCell" valign="top" height="36"><img src="../../Images/shim.gif" border="0" width="4" height="0">5.</td>
            <td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr >
			<td class="FormInsideTableRegCell" valign="top" height="36"><img src="../../Images/shim.gif" border="0" width="4" height="0">6.</td>
			<td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
			<td class="FormInsideTableRegCell">&nbsp;</td>
		  </tr>
          <tr >
			<td class="FormInsideTableRegCell" valign="top" height="36"><img src="../../Images/shim.gif" border="0" width="4" height="0">7.</td>
			<td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
			<td class="FormInsideTableRegCell">&nbsp;</td>
		  </tr>
          <tr >
			<td class="FormInsideTableRegCell" valign="top" height="36"><img src="../../Images/shim.gif" border="0" width="4" height="0">8.</td>
			<td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
			<td class="FormInsideTableRegCell">&nbsp;</td>
		  </tr>
          <tr >
			<td class="FormInsideTableRegCell" valign="top" height="36"><img src="../../Images/shim.gif" border="0" width="4" height="0">9.</td>
			<td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
			<td class="FormInsideTableRegCell">&nbsp;</td>
		  </tr>
          <tr >
			<td class="FormInsideTableRegCell" valign="top" height="36"><img src="../../Images/shim.gif" border="0" width="4" height="0">10.</td>
			<td class="FormInsideTableRegCell" align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
			<td class="FormInsideTableRegCell">&nbsp;</td>
		  </tr>
        </table>	  </td>
    </tr>
    <tr>
      <td align="left" valign="top" class="FormOuterTableRow" height="40"><img src="../../Images/shim.gif" border="0" width="8" height="8"><span class="blackBoldText">Additional 
        Records/Films to Request:</span></td>
	</tr>
	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="TreatmentRisksDiscussed" style="vertical-align: middle;" /> Risks, benefits, and rationale of treatment plan discussed in detail. All questions answered.
		</td>
	</tr>
	<tr>
		<td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
			<input type="checkbox" name="informedConsent" style="vertical-align: middle;" /> The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.		</td>
	</tr>
	<tr> 
      <td class="FormOuterTableRow">
	    <table align="center" border="0"  class="pageWidth"cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="3" class="FormInsideTableTopLeftCell"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="8" height="8">Disposition</span></td>
          </tr>
          <tr> 
            <td class="FormInsideTableRegCell" width="200" align="center">
              <table align="left" width="100%">
				<tr> 
                  <td>Dictation for today's visit?</td>
                  <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="0">No</td>
                </tr>
              </table>			 </td>
            <td class="FormInsideTableRegCell" width="200" align="center">
              <table align="left" width="100%">
                <tr> 
                  <td>See dispo for orders?</td>
                  <td align="center">Yes<img src="../../Images/shim.gif" border="0" width="22" height="0">No</td>
                </tr>
              </table>			 </td>
            <td class="FormInsideTableRegCell" width="200" align="center">
              <table align="left" width="100%">
                <tr> 
                  <td colspan="2" align="center">Return:<img src="../../Images/shim.gif" border="0" width="16" height="1">________Weeks<img src="../../Images/shim.gif" border="0" width="12" height="0">________Months</td>
                </tr>
              </table>			 </td>
          </tr>
        </table>	   </td>
    </tr>
	<tr>
	  <td align="left" valign="top" class="FormOuterTableRow" height="40"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Procedures:</span>
          <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
              <td><img src="../../Images/icon_checkBoxBlank2.gif" width="18" height="10" alt="" border="0" />Port Flush</td>
              <td><img src="../../Images/icon_checkBoxBlank2.gif" width="18" height="10" alt="" border="0" />Patient Education_____________________</td>
              <td align="left" valign="top" rowspan="2" width="350">Comments:</td>
            </tr>
            <tr>
              <td colspan="2"><img src="../../Images/icon_checkBoxBlank2.gif" width="18" height="10" alt="" border="0" />Other Intervention_____________________</td>
            </tr>
        </table></td>
	  </tr>
    <tr>
      <td align="left" valign="top" class="FormOuterTableRow" height="100"><img src="../../Images/shim.gif" border="0" width="8" height="8"><span class="blackBoldText">Comments / Notes:</span></td>
	</tr>
    <tr>
      <td align="left" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="8" height="8" /><span class="blackBoldText">Protocol #: __________________</span><br />
          <table align="left" width="100%">
            <tr>
              <td width="11%">Considered:</td>
              <td>&nbsp;&nbsp;Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
              <td width="16%">Consent Obtained:</td>
              <td>&nbsp;&nbsp;Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
              <td width="10%">Registered:</td>
              <td>&nbsp;&nbsp;Yes<img src="../../Images/shim.gif" border="0" width="22" height="1" />No</td>
            </tr>
        </table></td>
      </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow">
	  	<table  class="pageWidth" cellspacing="0" cellpadding="4">
          <tr> 
            <td class="FormInnerRowRightBorder"> <input type="checkbox" name="50% of Time22">&#8805; 50% of attending time was spent in counseling<img src="../../Images/shim.gif" border="0" width="4" height="1">(If so, mark total attending time in minutes):<img src="../../Images/shim.gif" border="0" width="4" height="1">
			<input type="checkbox" name="15-24 (3)22">15-24 (3)&nbsp;&nbsp;<input type="checkbox" name="25-39 (4)22">25-39 (4)&nbsp;&nbsp;<input type="checkbox" name="40+ (5)22">40+ (5)			  </td>
          </tr>
        </table>	  </td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td colspan="2"><span class="blackBoldText">Signatures</span></td>
            <td>&nbsp;</td>
            <td class="blackBoldText">&nbsp;</td>
          </tr>
          <tr>
            <td><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Fellow: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr>
            <td><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />NP/PA: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText" style="white-space:nowrap;">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr align="center">
            <td colspan="4"><table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr>
                  <td>I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.<br/>
                      <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
      </table></td> 
      </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU37<img src="../../Images/shim.gif" border="0" width="45" height="1">U42<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 11/07<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:10/19/10<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">4</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
    </tr>
    </table>
	</td>
    </tr>
  </table>
</div>

</div>
<asp:PlaceHolder id="HomeMedicationsListHolder" runat="server"></asp:PlaceHolder>