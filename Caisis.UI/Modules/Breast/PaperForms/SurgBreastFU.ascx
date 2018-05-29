<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.PaperForms.SurgBreastFU" CodeFile="SurgBreastFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>



<asp:PlaceHolder id="SurveyFormHolder" runat="server"></asp:PlaceHolder>


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
		<div  class="VerticalBarCodeDocType">*U46*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td  class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="80" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br>
              Breast Surgery Follow-Up Patient</span><br>            </td>
            <td width="50%" align="center" valign="bottom">
				<table  width="340" border="0" cellspacing="1" cellpadding="0" >
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
                    <% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %>
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
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient 
                    Identification</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="15">Date: 
              <% =apptClinicDate %>
              <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: 
              <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span>            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td align="left" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">Referring&nbsp;M.D.: 
              <asp:Repeater ID="ReferringMD" Runat="server" > 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "phFirstName") %>
                  <%# DataBinder.Eval(Container.DataItem, "phLastName") %>
                  ( 
                  <%# DataBinder.Eval(Container.DataItem, "phInstitution") %>
                  )</ItemTemplate>
                <SeparatorTemplate>, </SeparatorTemplate>
              </asp:Repeater> <asp:Label ID="blankReferrringMD" Runat="server"></asp:Label>            </td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td height="30" align="left" valign="top" class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="12">Chief 
              Complaint</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="135" valign="top" class="FormOuterTableRow hpiText" style="padding-left: 4px;"><span class="blackBoldText">HPI</span>

                <asp:Repeater ID="hpi" Runat="server" OnItemDataBound="hpiItemDataBound">
                    <ItemTemplate> 
                        <asp:Literal ID="hpiStartRow" runat="server" Visible="false" ><br /></asp:Literal>
			            <asp:Literal ID="hpiDate" runat="server" /> <%# DataBinder.Eval(Container.DataItem, "VarSummary")%><asp:Literal id="HpiRowItems" runat="server"/>&nbsp;
                    </ItemTemplate>
                </asp:Repeater> 

        </td>
    </tr>
    <tr>
      <td valign="middle" class="FormOuterTableRow" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15%" style="padding-left: 4px;"><span  class="blackBoldText">Genetic Testing</span></td>
            <td style="padding-left: 4px;"><span style="padding-left: 4px;"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle" />Positive<img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle" style="margin-left: 20px;" />Negative<img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle" style="margin-left: 20px;" />Not Done </td>
          </tr>
          
      </table></td>
    </tr>
    <tr>
      <td height="50" valign="middle" class="FormOuterTableRow" style="padding-left: 4px;"><span class="blackBoldText">Date of Last Menstrual Period: ______/______/______</span></td>
    </tr>
    <tr>
      <td valign="middle" class="FormOuterTableRow" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="12%" style="padding-left: 4px;"><span  class="blackBoldText">Menopause</span></td>
          <td style="padding-left: 4px;"><span style="padding-left: 4px;"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle" />Premenopausal<img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle" style="margin-left: 20px;" />Perimenopausal<img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle" style="margin-left: 20px;" />Postmenopausal</td>
        </tr>
        <tr>
          <td >&nbsp;</td>
          <td valign="bottom" style="padding-bottom: 4px; padding-left: 10px; height: 35px;" >Date of Menopause: ______/______/______</td>
        </tr>

      </table></td>
    </tr>
    
    <tr> 
      <td valign="top" class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr>
            <td colspan="3" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0" /><span class="blackBoldText">Interval 
              Patient Complaints </span><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle" style="margin-left: 20px;" />None</td>
            </tr>
          <tr > 
            <td width="33%" valign="top" style="border-right: solid 1px #333333;border-bottom: solid 1px #333333;"><table width="100%" border="0" cellspacing="0" cellpadding="1">
                <tr>
                  <td align="center" class="FormInsideTableTopLeftCell" style="font-size: smaller;"><strong>Patient Complaints - Breast </strong></td>
                  <td align="center" class="FormInsideTableTopCell" style="font-size: smaller;"><strong>Yes</strong></td>
                  <td align="center" class="FormInsideTableTopCell" style="font-size: smaller;"><strong>No</strong></td>
                </tr>
                <tr>
                  <td align="center" class="FormInsideTableLeftCell">Breast Mass </td>
                  <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                  <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                </tr>
                <tr>
                  <td align="center" class="FormInsideTableLeftCell">Nipple Discharge </td>
                  <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                  <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                </tr>
                <tr>
                  <td align="center" class="FormInsideTableLeftCell">Abnormal Imaging  </td>
                  <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                  <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                </tr>
                <tr>
                  <td align="center" class="FormInsideTableLeftCell">Breast Biopsy </td>
                  <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                  <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                </tr>
				<tr>
                  <td align="center" class="FormInsideTableLeftCell">Chest Wall Mass </td>
                  <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                  <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                </tr><tr>
                  <td align="center" class="FormInsideTableLeftCell">Breast Pain </td>
                  <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                  <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                </tr>
              </table>              </td>
            <td width="33%" align="left" valign="top" style="border-right: solid 1px #333333;border-bottom: solid 1px #333333;"><table width="100%" border="0" cellspacing="0" cellpadding="1">
              <tr>
                <td align="center" class="FormInsideTableTopLeftCell" style="font-size: smaller;"><strong> Complications </strong></td>
                <td align="center" class="FormInsideTableTopCell" style="font-size: smaller;"><strong>Yes</strong></td>
                <td align="center" class="FormInsideTableTopCell" style="font-size: smaller;"><strong>No</strong></td>
              </tr>
              <tr>
                <td align="center" class="FormInsideTableLeftCell">Cellulitis</td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
              </tr>
              <tr>
                <td align="center" class="FormInsideTableLeftCell">Lymphedema </td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
              </tr>
              <tr>
                <td align="center" class="FormInsideTableLeftCell">Wound Problem </td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
              </tr>
            </table></td>
            <td width="33%" align="left" valign="top" style="border-bottom: solid 1px #333333;"><table width="100%" border="0" cellspacing="0" cellpadding="1">
              <tr>
                <td align="center" class="FormInsideTableTopLeftCell" style="font-size: smaller;"><strong>Patient Complaints - Other </strong></td>
                <td align="center" class="FormInsideTableTopCell" style="font-size: smaller;"><strong>Yes</strong></td>
                <td align="center" class="FormInsideTableTopCell" style="font-size: smaller;"><strong>No</strong></td>
              </tr>
              <tr>
                <td align="center" class="FormInsideTableLeftCell">Weight Loss </td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
              </tr>
              <tr>
                <td align="center" class="FormInsideTableLeftCell">Bone Pain </td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
              </tr>
              <tr>
                <td align="center" class="FormInsideTableLeftCell">SOB / Cough </td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
              </tr>
              <tr>
                <td align="center" class="FormInsideTableLeftCell">Depression</td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
                <td align="center" class="FormInsideTableRegCell"><img src="../../Images/icon_checkBoxBlank.gif" width="18" height="14" alt="" border="0" /></td>
              </tr>
            </table></td>
          </tr>
          <tr >
            <td height="55" colspan="3" valign="top" style="border-right: solid 1px #333333;border-bottom: solid 1px #333333; padding: 5px;"><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle"  /> Other:</td>
            </tr>
          
          
          <!-- <tr>
						<td  align="left" valign="top">
							<table align="left" border="0" width="70%" cellpadding="0" cellspacing="0" >
								<tr>
									<td valign="middle"><img src="../../Images/shim.gif" border="0" width="4" height="0">Check Indication:</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">+SM</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">BCR</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">+ECE/SVI</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">LCR</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">+LN</td>
									<td class="smallGrayText" valign="middle"><input type="checkbox" name="Yes">Mets</td>
								</tr>
							</table>
						</td>
					</tr>-->
        </table></td>
    </tr>
    <tr>
      <td valign="top" class="FormOuterTableRow"><span class="blackBoldText" style="margin-left:4px;">New 
              Treatments:</span> <span class="smallGrayText"> (CHEMO,Hormone,XRT,Reconstruction,NONE)</span><br />
              <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
                <tr>
                  <td align="center" class="FormInsideTableTopLeftCell">Start 
                    Date</td>
                  <td align="center" class="FormInsideTableTopCell">Treatment<br />
                      <img src="../../Images/shim.gif" border="0" width="90" height="1" /></td>
                  <td align="center" class="FormInsideTableTopCell">Notes (Protocol 
                    #)</td>
                  <td align="center" class="FormInsideTableTopCell">Stop Date</td>
                </tr>
                <tr>
                  <td height="30" class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr>
                  <td height="30" class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
                <tr>
                  <td height="30" class="FormInsideTableLeftCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInsideTableRegCell">&nbsp;</td>
                  <td class="FormInnerRowBottomBorder">&nbsp;</td>
                </tr>
              </table></td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"> <table class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="52%" class="FormInnerRowRightBorder" valign="top"> <table width="97%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="3"><span class="blackBoldText"  style="margin-left:4px;">Medications</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
                    <input name="DateLastGnRH4" type="checkbox" id="DateLastGnRH4" value="yes">
                    Unchanged Since Last Visit</span></td>
                </tr>
                <tr align="center"> 
                  <td width="60%" class="FormInsideTableTopCell">Agent</td>
                  <td width="18%" class="FormInsideTableTopCell">Dose</td>
                  <td width="22%" class="FormInsideTableTopCell">Schedule</td>
                </tr>
                <asp:Repeater ID="medications" Runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td class="FormInsideTableRegCell" style="height:30px;"> 
                        <%# DataBinder.Eval(Container.DataItem, "Medication") %>                      </td>
                      <td class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "MedDose") %>
                        &nbsp;</td>
                      <td class="FormInsideTableRegCell"> 
                        <%# DataBinder.Eval(Container.DataItem, "MedSchedule") %>
                        &nbsp;</td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
            <td width="48%" valign="top"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td colspan="2" class="FormInnerRowBottomBorder"><span class="blackBoldText" style="margin-left:4px;">Allergies</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
                    <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes">
                    NKA&nbsp;&nbsp; 
                    <input name="DateLastGnRH3" type="checkbox" id="DateLastGnRH3" value="yes">
                    Unchanged Since Last Visit</span></td>
                </tr>
                <tr align="center"> 
                  <td width="47%" class="FormInsideTableRegCell">Allergen</td>
                  <td width="53%" class="FormInsideTableRegCell">Reaction</td>
                </tr>
                <asp:Repeater ID="allergies" Runat="server"> 
                  <ItemTemplate> 
                    <tr> 
                      <td class="FormInsideTableRegCell" style="height:30px;">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "Allergen") %>                      </td>
                      <td class="FormInnerRowBottomBorder">&nbsp; 
                        <%# DataBinder.Eval(Container.DataItem, "AllergyResponse") %>                      </td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td bgcolor="#FFFFFF" class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr > 
            <td height="105" align="left" valign="top"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span  class="blackBoldText">Medical 
              &amp; Surgical History / Comorbidities</span><br/> 
              <img src="../../Images/shim.gif" border="0" width="1" height="14"> 
              <asp:Repeater ID="comorbidities" Runat="server"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %>
                  - <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>
                  </strong> </ItemTemplate>
                <SeparatorTemplate>&nbsp;&nbsp;&nbsp;&nbsp;</SeparatorTemplate>
              </asp:Repeater> </td>
          </tr>
        </table></td>
    </tr>
	<tr>
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Imaging</span><span><br />
        </span>
          <table class="pageWidth" align="center" border="0" cellpadding="1" cellspacing="0">
            <tr>
              <td width="15%" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
              <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
              <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
              <td width="45%" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
            </tr>
            <asp:Repeater ID="images" Runat="server">
              <ItemTemplate>
                <tr >
                  <td height="27" align="center" class="FormInsideTableRegCell">&nbsp; <%# DataBinder.Eval(Container.DataItem, "DxDateText") %> </td>
                  <td class="FormInsideTableRegCell">&nbsp; <%# DataBinder.Eval(Container.DataItem, "DxType") %> </td>
                  <td class="FormInsideTableRegCell">&nbsp; <%# DataBinder.Eval(Container.DataItem, "DxResult") %> </td>
                  <td class="FormInnerRowBottomBorder">&nbsp; <%# DataBinder.Eval(Container.DataItem, "DxNotes") %> </td>
                </tr>
              </ItemTemplate>
            </asp:Repeater>
        </table></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU41<img src="../../Images/shim.gif" border="0" width="45" height="1">U46<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 1/09<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:03/02/09<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">1</span> of <span id="TotalPages">3</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">41</span></td>
    </tr>
  </table>
</div>

<div  align="left"  style="page-break-after:always;" >

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U46*</div>
		<div  class="VerticalBarCodeAcctType"><% =BarCodeAcctType %></div>
		<div  class="VerticalBarCodeDate"><% =BarCodeDate %></div>

	</div>
</div>




  <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td style="text-align:center;"><font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <%= institutionShortName%> POLICY</font></td>
  </tr>
    <tr> 
      <td class="FormOuterTableTopRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br>
              Breast Surgery Follow-Up Patient</span></td>
            <td width="50%" align="center" valign="bottom"> <table  width="340" border="0" cellspacing="1" cellpadding="0" >
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
                    <% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %>
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
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient 
                    Identification</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="0">Biopsies&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <input type="checkbox" name="PA222" value="Yes"><strong>Check if None</strong><br> 
		<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">Result</td>
            <td width="60%" align="center" valign="middle" class="FormInsideTableTopCell">Comments</td>
          </tr>
          <tr > 
            <td height="27" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="30" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr > 
            <td height="30" align="center" class="FormInsideTableRegCell">/<span><img src="../../Images/shim.gif" border="0" width="22" height="1"></span>/</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
            <td class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
        </table>		</td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText">Vital 
              Signs</span></td>
            <td height="28" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BP:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Pulse:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Temp:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp:</td>
          </tr>
          <tr> 
            <td height="28" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">KPS:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Height:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Weight:</td>
            <td height="22" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BSA:</td>
          </tr>
        </table></td>
    </tr>
	<tr>
      <td align="center" class="FormOuterTableRow"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="490" valign="top" style="padding:10px; padding-right: 0px;"><img src="../../Images/FormImages/BreastDiagram.gif" width="480" border="0" /></td>
    <td valign="top" style="padding:10px;"><strong>Notes</strong><br />
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border: solid 1px #999999;">
        <tr>
          <td style="height:260px;">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
        </td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Exam</span>&nbsp;&nbsp;&nbsp;<span class="smallGrayText">Clinician 
        Performing Initial Exam: 
        <input type="checkbox" name="NP2" value="Yes">
        PA / NP&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Fellow2" value="Yes">
        Fellow&nbsp;&nbsp;&nbsp; 
        <input type="checkbox" name="Attending2" value="Yes">
        Attending</span> <table align="center" border="0" width="100%" cellpadding="1" cellspacing="0" >
          <tr>
            <td align="center" class="FormInsideTableTopCell">&nbsp;</td>
            <td colspan="4" align="left" class="FormInsideTableTopCell" style="border-right: solid 3px #666666;padding-left:60px;"><strong>Left Breast</strong><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle" style="margin-left: 70px;" />Surgically Absent</td>
            <td colspan="4" align="left" class="FormInsideTableTopCell" style="padding-left:60px;"><strong>Right Breast</strong><img src="../../Images/icon_checkBoxBlank.gif" alt="" width="18" height="14" border="0" align="absmiddle" style="margin-left: 78px;" />Surgically Absent</td>
            </tr>
          <tr> 
            <td align="center" class="FormInsideTableRegCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableRegCell"><strong style="font-size: smaller;">Normal 
              Findings</strong><strong></strong></td>
            <td align="center" class="FormInsideTableRegCell"><strong style="font-size: smaller;">Abnormal</strong></td>
            <td align="center" class="FormInsideTableRegCell" style="border-right: solid 3px #666666;"><strong style="font-size: smaller;">Attnd<br>
              Performed</strong></td>
            <td colspan="2" align="center" class="FormInsideTableRegCell"><strong style="font-size: smaller;">Normal 
              Findings</strong><strong></strong></td>
            <td align="center" class="FormInsideTableRegCell"><strong style="font-size: smaller;">Abnormal</strong></td>
            <td align="center" class="FormInsideTableRegCell"><strong style="font-size: smaller;">Attnd<br />
              Performed</strong></td>
          </tr>
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Breast</td>
            <td height="23" align="left" class="FormInsideTableRegCell">Normal Symmetry </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" style="border-right: solid 3px #666666;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td height="26" align="left" class="FormInsideTableRegCell">Normal Symmetry </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td height="23" align="left" class="FormInsideTableRegCell">Normal Skin / Nipple </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" style="border-right: solid 3px #666666;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td height="26" align="left" class="FormInsideTableRegCell">Normal Skin / Nipple </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          
          <tr>
            <td height="23" align="left" class="FormInsideTableRegCell">No Nipple Discharge </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell" style="border-right: solid 3px #666666;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td height="26" align="left" class="FormInsideTableRegCell">No Nipple Discharge </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td height="23" align="left" class="FormInsideTableRegCell"> No Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" style="border-right: solid 3px #666666;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td height="26" align="left" class="FormInsideTableRegCell"> No Masses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr> 
            <td height="23" align="left" class="FormInsideTableRegCell">Well Healed Incision </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" style="border-right: solid 3px #666666;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td height="26" align="left" class="FormInsideTableRegCell">Well Healed Incision </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr>
            <td colspan="4" valign="middle" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0"><strong style="font-size: smaller;">Nodes</strong></td>
            <td align="center" class="FormInsideTableRegCell" style="border-right: solid 3px #666666;">&nbsp;</td>
            <td height="26" colspan="4" align="left" class="FormInnerRowBottomBorder">&nbsp;</td>
            </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Axilla</td>
            <td height="23" align="left" class="FormInsideTableRegCell">No Palpable Nodes </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" style="border-right: solid 3px #666666;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td height="26" align="left" class="FormInsideTableRegCell">No Palpable Nodes </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr>
            <td align="left" valign="top" class="FormInsideTableRegCell" style="font-size:10pt;"><img src="../../Images/shim.gif" border="0" width="4" height="0" />Supraclav</td> 
            <td height="23" align="left" class="FormInsideTableRegCell">No Palpable Nodes </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell" style="border-right: solid 3px #666666;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td height="26" align="left" class="FormInsideTableRegCell">No Palpable Nodes </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" /></td>
          </tr>
          <tr>
            <td height="90" colspan="4" valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0" /><strong style="font-size: smaller;">Notes on Left Breast </strong></td>
            <td align="center" class="FormInsideTableRegCell" style="border-right: solid 3px #666666;">&nbsp;</td>
            <td height="26" colspan="4" align="left" valign="top" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0" /><strong style="font-size: smaller;">Notes on Right Breast </strong></td>
          </tr>
          
          
        </table></td>
    </tr>
    <tr>
      <td height="30" class="FormOuterTableRow" style="padding-left: 4px;"><span class="blackBoldText">Cosmesis</span><img src="../../Images/shim.gif" border="0" width="20" height="1" />
        <input type="checkbox" name="NED22" /> 
        Excellent
<img src="../../Images/shim.gif" border="0" width="20" height="1" />
<input type="checkbox" name="ActiveSurveillance2" />
Good <img src="../../Images/shim.gif" border="0" width="20" height="1" />
<input type="checkbox" name="NED3" />
Fair <img src="../../Images/shim.gif" border="0" width="20" height="1" />
<input type="checkbox" name="Mets2" /> 
Poor
<img src="../../Images/shim.gif" border="0" width="20" height="1" />
<input type="checkbox" name="Mets22" /> 
N/A</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="15%"  valign="middle"><img src="../../Images/shim.gif" border="0" width="4" height="0"><span class="blackBoldText">Disease 
              State</span></td>
            <td width="25%"  valign="middle"><input type="checkbox" name="NED" />
NED</td>
            <td width="25%"  valign="middle"><input type="checkbox" name="NBM" />
New Breast Mass</td>
            <td width="35%"  valign="middle"><input type="checkbox" name="LR2" />
Local Recurrence</td>
          </tr>
          <tr>
            <td  valign="middle">&nbsp;</td>
            <td  valign="middle"><input type="checkbox" name="AWD22" />
Alive with Disease</td>
            <td  valign="middle">
              <input type="checkbox" name="AWD32" />
Work-up Ongoing</td>
            <td  valign="middle">&nbsp;</td>
          </tr>
          
          <tr>
            <td  valign="middle">&nbsp;</td>
            <td colspan="3"  valign="middle" style="padding-top: 5px;"><strong>Date:</strong></td>
          </tr>
          <tr>
            <td  valign="middle">&nbsp;</td>
            <td colspan="3"  valign="middle"><asp:Label ID="LastStatus" Runat="server" />&nbsp;</td>
            </tr>
        </table>
 </td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU41<img src="../../Images/shim.gif" border="0" width="45" height="1">U46<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 1/09<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:03/02/09<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">2</span> of <span id="TotalPages">3</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">41</span></td>
    </tr>
  </table>
</div>
<div  id="LastPageInForm" runat="server" align="left" >

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U46*</div>
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
	  	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
          <tr> 
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><span class="blackBoldText"><%= institutionName%><br>
              Breast Surgery Follow-Up Patient</span></td>
            <td width="50%" align="center" valign="bottom"> <table  width="340" border="0" cellspacing="1" cellpadding="0" >
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
                    <% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %>
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
                  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient 
                    Identification</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="11"><span class="blackBoldText">Date: 
        <% =apptClinicDate %>
        </span></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr>
            <td colspan="3"><span class="blackBoldText" style="margin-right:100px;">Impression &amp; Plan</span>Clinician 
        Completing Impression &amp; Plan:
                <input type="checkbox" name="NP22" value="Yes" />
PA / NP&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="Fellow22" value="Yes" />
Fellow&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="Attending22" value="Yes" />
Attending</td>
          </tr>
          <tr>
            <td align="center" class="FormInsideTableTopCell"><strong>Diagnoses 
              / Problem List</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Plan 
              &amp; Referrals</strong></td>
          </tr>
          <tr>
            <td width="50%" height="60" valign="top" class="FormInsideTableRegCell">1.</td>
            <td width="28%" class="FormInsideTableRegCell">&nbsp;</td>
            <td rowspan="3" valign="top" class="FormInnerRowBottomBorder"><input type="checkbox" name="GNRH23" value="Yes" />
              Rad Tx Consult<br />
              <input type="checkbox" name="GNRH24" value="Yes" />
              Med Oncology Consult<br />
              <input type="checkbox" name="GNRH242" value="Yes" /> 
              Plastic Surgery</td></tr>
          <tr>
            <td height="60" valign="top" class="FormInsideTableRegCell">2.</td>
            <td height="25" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="60" valign="top" class="FormInsideTableRegCell">3.</td>
            <td class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="60" valign="top" class="FormInsideTableRegCell">4.</td>
            <td colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <!--<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">4.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">5.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">6.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
 					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">7.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">8.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">9.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr>
					<tr  >
						<td valign="top" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0">10.</td>
						<td align="center" valign="middle"><img src="../../Images/icon_checkBoxBlank.gif" width="24" height="18" alt="" border="0"></td>
						<td>&nbsp;</td>
					</tr> -->
      </table></td>
      </tr>
    <tr>
      <td height="200" valign="top" class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Attending Addendum / Comments</span></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth" align="center" border="0" cellpadding="4" cellspacing="0">
          <tr>
            <td class="FormInnerRowBottomBorder"><span class="blackBoldText">Disposition</span></td>
          </tr>
          <tr>
            <td width="69%" align="center" class="FormInnerRowRightBorder"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="20%" height="26">Prescriptions:</td>
                  <td align="left">No<img src="../../Images/shim.gif" border="0" width="36" height="1" />Yes:<img src="../../Images/shim.gif" border="0" width="22" height="1" />Refill &nbsp;&nbsp;or &nbsp;&nbsp;New</td>
                  </tr>
                <tr>
                  <td height="36" colspan="2" valign="bottom">Rx: ________________________________________________________________________________</td>
                </tr>
                <tr>
                  <td height="36" colspan="2" valign="bottom">Rx: ________________________________________________________________________________</td>
                </tr>
            </table></td>
            </tr>
      </table></td>
      </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" height="32" class="FormInnerRowRightBorder">Circle 
              Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1">1<img src="../../Images/shim.gif" border="0" width="22" height="1">2<img src="../../Images/shim.gif" border="0" width="22" height="1">3<img src="../../Images/shim.gif" border="0" width="22" height="1">4<img src="../../Images/shim.gif" border="0" width="22" height="1">5            </td>
            <td rowspan="2" align="right" valign="top">Copy to:</td>
            <td width="43%" rowspan="2" valign="top"><input name="fellow222" type="checkbox" id="fellow223" />
referring M.D.: ________________________<br />
<input name="fellow2222" type="checkbox" id="fellow2222" />
other: _______________________________</td>
          </tr>
          <tr> 
            <td height="32" class="FormInnerRowRightBorder">Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1">Fellow/ 
              Resident<img src="../../Images/shim.gif" border="0" width="30" height="1">Attending</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="FormOuterTableRow"><table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="4">
          <tr>
            <td colspan="2"><span class="blackBoldText">Signatures</span></td>
            <td>&nbsp;</td>
            <td class="blackBoldText">&nbsp;</td>
          </tr>
          <tr>
            <td height="45" align="right"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Fellow: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr>
            <td height="45" align="right"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />NP/PA: </span></td>
            <td align="left"><span class="blackBoldText">_________________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText" style="white-space:nowrap;">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          <tr class="pageWidth">
            <td height="40" align="right" valign="bottom" style="padding-bottom: 0px; padding-top: 13px;"><span class="blackBoldText">Attending&nbsp;<br />
              Addendum:</span></td>
            <td colspan="3"  class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
          </tr>
          <tr class="pageWidth">
            <td height="45">&nbsp;</td>
            <td colspan="3"  class="FormInnerRowBottomBorder" style="border-bottom-color: #000000;">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4"><table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr>
                  <td>I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.<br/>
                      <span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="1" height="50" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="55" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span></span></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
      </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU41<img src="../../Images/shim.gif" border="0" width="45" height="1">U46<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 1/09<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:03/02/09<img src="../../Images/shim.gif" border="0" width="45" height="1">Page 
        <span id="PageNumber">3</span> of <span id="TotalPages">3</span><img src="../../Images/shim.gif" border="0" width="45" height="1">B/02.070.<span class="blackBoldTextSmall">41</span></td>
    </tr>
  </table>
</div>

</div>