<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.PaperForms.UroSexFuncNP" CodeFile="UroSexFuncNP.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>


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
		<div  class="VerticalBarCodeDocType">*U15*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Sexual Function New Patient<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Clinician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td class="FormOuterTableRow"><table width="100%" border="0" cellpadding="1" cellspacing="0">
          <tr>
            <td colspan="2" align="left" valign="middle" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1" /><span class="blackBoldText">Category of Service</span></td>
          </tr>
          <tr>
            <td width="23%" valign="top" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop" />&nbsp;New Patient Encounter<br />
              (CPT 99201-99205)</td>
            <td width="77%" valign="middle" class="FormInnerRowBottomBorder"><img src="../../Images/shim.gif" border="0" width="4" height="1" />Use for patients who have not been see by anyone in your billing group in the last 3 years <strong>AND</strong><br />
                <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Are self referred (includes those referred by friend or patient)<br />
                <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Do not have  physician asking for your advice/opinion (see PIF sheet or PAS info)<br />
                <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Are referred solely for management and/or treatment of aspect of care<br />
            </td>
          </tr>
          <tr>
            <td valign="top" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop" />&nbsp;Office Consultation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
              (CPT 99241- 99245)</td>
            <td class="FormInnerRowBottomBorder"><table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td ><img src="../../Images/shim.gif" border="0" width="4" height="1" />Office Consultation is requested by _________________________ MD/PA/NP for my advice &amp; opinion<br />
                      <img src="../../Images/shim.gif" border="0" width="4" height="1" />regarding this patient&rsquo;s ______________________________________________________</td>
                </tr>
            </table></td>
            <!--<td class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="1">Office Consultation is requested by _________________________ MD/PA/NP for my advice & opinion<br />
					<img src="../../Images/shim.gif" border="0" width="4" height="1">regarding this patient&rsquo;s ______________________________________________________</td>-->
          </tr>
          <tr>
            <td valign="top" align="center" class="FormInnerRowRightBorder"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" align="texttop" />&nbsp;Established Patient Visit<br />
              (CPT 99212-99215)</td>
            <td><img src="../../Images/shim.gif" border="0" width="4" height="1" />Use for patients who<br />
                <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Are seeing you for the first time for management or treatment (Not a consult) and have been seen<br />
                <img src="../../Images/shim.gif" border="0" width="18" height="1" />by someone else in your billing group in the last 3 years<br />
                <img src="../../Images/shim.gif" border="0" width="12" height="1" /><strong>-</strong>Are seeing you for follow-up care/visits </td>
          </tr>
      </table></td>
    </tr>
	<tr>
		<td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="15">Chief Complaint</span>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="FormInsideTableTopCell"><input type="checkbox" name="No242">Erectile Dysfunction</td>
					<td class="FormInsideTableTopCell"><input type="checkbox" name="No242">Penile Curvature</td>
					<td class="FormInsideTableTopCell"><input type="checkbox" name="No242">Ejaculation Problems</td>
					<td class="FormInsideTableTopCell"><input type="checkbox" name="No242">Orgasm Problems</td>
				</tr>
				<tr>
					<td class="FormInsideTableRegCell"><input type="checkbox" name="No242">Low Testosterone</td>
					<td class="FormInsideTableRegCell"><input type="checkbox" name="No242">Infertility</td>
				    <td class="FormInsideTableRegCell"><input type="checkbox" name="No242" />Fertility Preservation </td>
				    <td class="FormInsideTableRegCell"><input type="checkbox" name="No2422" />Varicocele</td>
				</tr>
			</table>		</td>
	</tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr > 
            <td align="left" height="17"><img src="../../Images/shim.gif" border="0" width="4" height="0">Requesting&nbsp;M.D.: 
              <asp:Repeater ID="ReferringMD" runat=server > 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "phFirstName") %>
                  <%# DataBinder.Eval(Container.DataItem, "phLastName") %>
                  ( 
                  <%# DataBinder.Eval(Container.DataItem, "phInstitution") %>
                  )</ItemTemplate>
                <SeparatorTemplate>, </SeparatorTemplate>
              </asp:Repeater> <asp:Label ID="blankReferrringMD" Runat="server"></asp:Label>            </td>
          </tr>
          <tr> 
            <td height="17" colspan="2" align="left" class="FormInnerRowNoBorder"><img src="../../Images/shim.gif" border="0" width="4" height="0">Requested 
              by: <img src="../../Images/FormImages/shim.gif" border="0" width="20" height="1"> 
              <input type="checkbox" name="No22222">
              Self <img src="../../Images/FormImages/shim.gif" border="0" width="20" height="1"> 
              <input type="checkbox" name="No22232">
              Friend<img src="../../Images/FormImages/shim.gif" border="0" width="20" height="1"> 
              <input type="checkbox" name="No22252">
              Other</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="1">
		<tr> 
			<td class="FormInnerRowBottomBorder"><span class="blackBoldText">Demographics</span></td>
		</tr>
		<tr> 
			<td class="FormInnerRowBottomBorder">Age: __________<img src="../../Images/FormImages/shim.gif" border="0" width="50" height="1">Best 
			  contact phone number: _______________________<br> <img src="../../Images/FormImages/shim.gif" border="0" width="1" height="11">Race:<img src="../../Images/FormImages/shim.gif" border="0" width="25" height="1"> 
			  <input type="checkbox" name="No222">
			  White <img src="../../Images/FormImages/shim.gif" border="0" width="15" height="1"> 
			  <input type="checkbox" name="No223">
			  African-American <img src="../../Images/FormImages/shim.gif" border="0" width="15" height="1"> 
			  <input type="checkbox" name="No224">
			  Asian <img src="../../Images/FormImages/shim.gif" border="0" width="15" height="1"> 
			  <input type="checkbox" name="No2242">
			  Hispanic<img src="../../Images/FormImages/shim.gif" border="0" width="15" height="1"> 
			  <input type="checkbox" name="No225">
			  Non-Hispanic<img src="../../Images/FormImages/shim.gif" border="0" width="15" height="1"> 
			  <input type="checkbox" name="No2252">
			  Other</td>
		</tr>
		<tr> 
			<td  class="FormInnerRowBottomBorder" valign="middle"><img src="../../Images/FormImages/shim.gif" border="0" width="1" height="1">Sexual Orientation:
			<img src="../../Images/FormImages/shim.gif" border="0" width="30" height="1"><input type="checkbox" name="No22">Heterosexual
			<img src="../../Images/FormImages/shim.gif" border="0" width="18" height="1"><input type="checkbox" name="No23">Gay
			<img src="../../Images/FormImages/shim.gif" border="0" width="18" height="1"><input type="checkbox" name="No24">Bisexual
            <img src="../../Images/FormImages/shim.gif" border="0" width="18" height="1"><input type="checkbox" name="No25">Undefined
            </td>
		</tr>
		<tr> 
			<td> <img src="../../Images/FormImages/shim.gif" border="0" width="1" height="1">Relationship Status:
				<img src="../../Images/FormImages/shim.gif" border="0" width="30" height="1"><input type="checkbox" name="No22">Married
				<img src="../../Images/FormImages/shim.gif" border="0" width="18" height="1"><input type="checkbox" name="No23">Divorced
				<img src="../../Images/FormImages/shim.gif" border="0" width="18" height="1"><input type="checkbox" name="No24">Separated
				<img src="../../Images/FormImages/shim.gif" border="0" width="18" height="1"><input type="checkbox" name="No25">Widowed
				<img src="../../Images/FormImages/shim.gif" border="0" width="18" height="1"><input type="checkbox" name="No252">Single
				<img src="../../Images/FormImages/shim.gif" border="0" width="18" height="1"><input type="checkbox" name="No252">Partnered<br />
				<img src="../../Images/FormImages/shim.gif" border="0" width="1" height="11">If married, duration married: _______________ <img src="../../Images/FormImages/shim.gif" border="0" width="45" height="1">If 
			  divorced/widowed, for how long? _______________<br> <img src="../../Images/FormImages/shim.gif" border="0" width="1" height="11">Duration 
			  in current relationship: ____________ <br> <img src="../../Images/FormImages/shim.gif" border="0" width="1" height="11">Partner&#8217;s 
			  Age: _______________ <img src="../../Images/FormImages/shim.gif" border="0" width="45" height="1">Partner&#8217;s 
			  Name: ________________________________________</td>
		  </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="12">Past Medical History</span><br>
	   <table  class="pageWidth" border="0" cellspacing="0" cellpadding="1">
          <tr> 
            <td width="3%" valign="middle" class="FormInsideTableTopLeftCell"><input type="checkbox" name="No2432"></td>
            <td width="46%" valign="middle" class="FormInsideTableTopCell">Hypertension</td>
            <td width="2%" valign="middle">&nbsp;</td>
            <td width="3%" valign="middle" class="FormInsideTableTopLeftCell"><input type="checkbox" name="No243132"></td>
            <td width="46%" valign="middle" class="FormInsideTableTopCell">Disc disease <input type="checkbox" name="No24312"> Lumbar <input type="checkbox" name="No24313"> Thoracic <input type="checkbox" name="No24314"> Cervical</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2433"></td>
            <td valign="middle" class="FormInsideTableRegCell">Diabetes<br> </td>
            <td valign="middle">&nbsp;</td>
            <td valign="top" class="FormInsideTableLeftCell"> <input type="checkbox" name="No243133"></td>
            <td class="FormInsideTableRegCell">Neurological Problems</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2434"></td>
            <td valign="middle" class="FormInsideTableRegCell">High Cholesterol</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2434"></td>
            <td class="FormInsideTableRegCell">Multiple Sclerosis</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2435"></td>
            <td valign="middle" class="FormInsideTableRegCell">Heart Attack</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2435"></td>
            <td class="FormInsideTableRegCell">Parkinson&#8217;s Disease</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2436"></td>
            <td valign="middle" class="FormInsideTableRegCell">Angina</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2436"></td>
            <td class="FormInsideTableRegCell">Thyroid Disease</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2437"></td>
            <td valign="middle" class="FormInsideTableRegCell">Heart Bypass Surgery</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2437"></td>
            <td class="FormInsideTableRegCell">Low Testosterone</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No2438"></td>
            <td valign="middle" class="FormInsideTableRegCell">Coronary Artery Angioplasty </td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No2438"></td>
            <td class="FormInsideTableRegCell">Prostate Cancer Surgery</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2434"></td>
            <td valign="middle" class="FormInsideTableRegCell">Peripheral Vascular Disease</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No243134"></td>
            <td class="FormInsideTableRegCell">Bladder Cancer Surgery</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2435"></td>
            <td valign="middle" class="FormInsideTableRegCell">Benign Prostate Surgery </td>
            <td valign="middle">&nbsp;</td>
            <td valign="top" class="FormInsideTableLeftCell"> <input type="checkbox" name="No243135"></td>
            <td class="FormInsideTableRegCell">Bowel/Rectum Cancer Surgery</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2436"></td>
            <td valign="middle" class="FormInsideTableRegCell">Lower Limb Bypass Surgery </td>
            <td valign="middle">&nbsp;</td>
            <td valign="top" class="FormInsideTableLeftCell"> <input type="checkbox" name="No243136"></td>
            <td valign="middle" class="FormInsideTableRegCell">Prostate Radiation</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No2437"></td>
            <td valign="middle" class="FormInsideTableRegCell">Stroke</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"> <input type="checkbox" name="No243137"></td>
            <td valign="middle" class="FormInsideTableRegCell">Prostate Enlargement</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No2438"></td>
            <td valign="middle" class="FormInsideTableRegCell">Carotid Artery Surgery</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24385"></td>
            <td valign="middle" class="FormInsideTableRegCell">Pelvic Fracture</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24382"></td>
            <td  valign="middle" class="FormInsideTableRegCell">Depression</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24386"></td>
            <td valign="middle" class="FormInsideTableRegCell">HIV</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No243832"></td>
            <td valign="middle" class="FormInsideTableRegCell">Anxiety Disorder</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No243872"></td>
            <td valign="middle" class="FormInsideTableRegCell">Hepatitis B</td>
          </tr>
          <tr> 
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24383"></td>
            <td  valign="middle" class="FormInsideTableRegCell">Priapism (prolonged erection)</td>
            <td valign="middle">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24387"></td>
            <td class="FormInsideTableRegCell">Hepatitis C</td>
          </tr>
          <tr>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24382" /></td>
            <td  valign="middle" class="FormInsideTableRegCell">Mumps</td> 
            <td valign="middle" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24387"></td>
            <td class="FormInsideTableRegCell">STD History</td>
		  </tr>
          <tr>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24382" /></td>
            <td  valign="middle" class="FormInsideTableRegCell">Epididymitis</td> 
            <td valign="middle" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24387"></td>
            <td class="FormInsideTableRegCell">Cryptorchidism (Undescended Testicle) </td>
		  </tr>
          <tr>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24382" /></td>
            <td  valign="middle" class="FormInsideTableRegCell">Varicocele</td>
            <td valign="middle" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24387" /></td>
            <td class="FormInsideTableRegCell">Vasectomy</td>
          </tr>
          <tr>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24382" /></td>
            <td  valign="middle" class="FormInsideTableRegCell">Varicocele Surgery</td>
            <td valign="middle" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24387" /></td>
            <td class="FormInsideTableRegCell">Vasectomy Reversal</td>
          </tr>
          
          <tr>
            <td valign="middle" class="FormInsideTableLeftCell"><input type="checkbox" name="No24382" /></td>
            <td colspan="4"  valign="middle" class="FormInsideTableRegCell">Cancer Dx: </td> 
            </tr>
          <tr>
            <td valign="top" class="FormInsideTableLeftCell"><input type="checkbox" name="No24384" /></td>
            <td colspan="4" align="left" valign="middle" class="FormInsideTableRegCell">Chemotherapy:</td>
            </tr>
          <tr>
            <td valign="top" class="FormInsideTableLeftCell"><input type="checkbox" name="No24384" /></td>
            <td colspan="4" align="left" valign="middle" class="FormInsideTableRegCell">Radiation Therapy:</td>
          </tr>
          <tr>
            <td valign="top" class="FormInsideTableLeftCell"><input type="checkbox" name="No24384" /></td>
            <td colspan="4" align="left" valign="middle" class="FormInsideTableRegCell">Other Medical Conditons (Please List):<br/><br/><br/></td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU11<img src="../../Images/shim.gif" border="0" width="45" height="1">U15<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/31/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">1</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U15*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Sexual Function New Patient<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Clinician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="15">Patient Reported Review of Systems</span>
		<table border="0" width="100%" cellpadding="1" cellspacing="0">
          <tr> 
            <td width="45" align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
            <td width="150" align="center" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
            <td width="40" align="center" class="FormInsideTableTopCell"><strong>Not Present</strong></td>
            <td width="40" align="center" class="FormInsideTableTopCell"><strong>Present</strong></td>
            <td width="385" align="center" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">General</td>
            <td align="left" class="FormInsideTableRegCell">Fever</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Weight Loss</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Neuro</td>
            <td align="left" class="FormInsideTableRegCell">Headaches</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Focal Weakness</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Eyes</td>
            <td align="left" class="FormInsideTableRegCell">Visual Problems</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">CV</td>
            <td align="left" class="FormInsideTableRegCell">Angina</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Palpitations</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Respiratory</td>
            <td align="left" class="FormInsideTableRegCell">Cough</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Shortness of Breath</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hemoptysis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td rowspan="4" align="left" valign="top" class="FormInsideTableLeftCell">GI</td>
            <td align="left" class="FormInsideTableRegCell">Nausea</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="4" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Vomiting</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Abdominal Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Rectal Bleeding</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">GU</td>
            <td align="left" class="FormInsideTableRegCell">Dysuria</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Frequency</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Incontinence</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">MS</td>
            <td align="left" class="FormInsideTableRegCell">Joint Pain</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Psych</td>
            <td align="left" class="FormInsideTableRegCell">Anxiety / Depression</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Heme</td>
            <td align="left" class="FormInsideTableRegCell">Anemia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="2" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Adenopathy</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td align="left" valign="top" class="FormInsideTableLeftCell">Skin</td>
            <td align="left" class="FormInsideTableRegCell">Rash</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Endo</td>
            <td align="left" class="FormInsideTableRegCell">Heat/Cold Intolerance</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td rowspan="3" align="center" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Thirst</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
          </tr>
          <tr> 
            <td align="left" class="FormInsideTableRegCell">Hot Flashes</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
          </tr>
          <tr> 
            <td colspan="7" height="40" align="left" valign="top">Other:</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> <table  class="pageWidth" border="0" cellspacing="0" cellpadding="1">
          <tr> 
            <td colspan="4" class="FormInnerRowBottomBorder"><span class="blackBoldText">Family History</span></td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td width="5%" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td width="45%" class="FormInsideTableRegCell">High Blood Pressure<br></td>
            <td width="5%" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td width="45%" class="FormInsideTableRegCell">Diabetes</td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td align="center" class="FormInsideTableRegCell"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td class="FormInsideTableRegCell">High Cholesterol / Triglycerides</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td class="FormInsideTableRegCell">Depression</td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td class="FormInsideTableRegCell">Heart Attack</td>
            <td align="center" class="FormInsideTableRegCell"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td class="FormInsideTableRegCell">Stroke</td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td class="FormInsideTableRegCell">Prostate Cancer</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td class="FormInsideTableRegCell">Bladder Cancer</td>
          </tr>
          <tr> 
            <td height="26" align="center" class="FormInnerRowRightBorder"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td colspan="3">Other:</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td colspan="4" class="FormInnerRowBottomBorder"><span class="blackBoldText"><img src="../../Images/FormImages/shim.gif" border="0" width="2" height="1">Medications</span></td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td width="5%" height="30" align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td width="45%" valign="top" class="FormInsideTableRegCell">Blood Pressure Pills<br></td>
            <td width="5%" valign="top" align="center" class="FormInsideTableRegCell"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td width="45%" valign="top" class="FormInnerRowBottomBorder"> Incontinence Medications</td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td height="30" align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td valign="top" class="FormInsideTableRegCell">Cholesterol lowering Medications</td>
            <td valign="top" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td valign="top" class="FormInnerRowBottomBorder">Blood Thinning Medications</td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td valign="top" height="30" align="center" class="FormInsideTableRegCell"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td valign="top" class="FormInsideTableRegCell"> Diabetes Medications</td>
            <td valign="top" align="center" class="FormInsideTableRegCell"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td valign="top" class="FormInnerRowBottomBorder"> Stomach Ulcer Medications</td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td valign="top" height="30" align="center" class="FormInsideTableRegCell"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td valign="top" class="FormInsideTableRegCell"> Depression / Anxiety Medications</td>
            <td valign="top" align="center" class="FormInsideTableRegCell"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td valign="top" class="FormInnerRowBottomBorder">Hormone Medications</td>
          </tr>
          <tr class="FormInsideTableRegCell"> 
            <td valign="top" height="30" align="center" class="FormInsideTableRegCell"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td valign="top" class="FormInsideTableRegCell"> Prostate Medications</td>
            <td valign="top" align="center" class="FormInsideTableRegCell"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td valign="top" class="FormInnerRowBottomBorder"> Nitroglycerin-Containing Medications</td>
          </tr>
          <tr> 
            <td valign="top" height="30" align="center" class="FormInnerRowRightBorder"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
            <td valign="top" colspan="3">Others: ______________________________________________________________________________</td>
          </tr>
        </table>
		</td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU11<img src="../../Images/shim.gif" border="0" width="45" height="1">U15<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/31/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">2</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U15*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Sexual Function New Patient<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Clinician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
	<tr>
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" dwcopytype="CopyTableCell">
          <tr> 
			  <td class="FormOuterTableRow">
			  	<table width="100%" border="0" cellspacing="0" cellpadding="1">
                <tr> 
					<td colspan="3" class="FormInnerRowBottomBorder"><span class="blackBoldText">Social History</span></td>
				  </tr>
				  <tr> 
					<td align="center" class="FormInnerRowBottomBorder"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0">					</td>
					<td width="18%" class="FormInnerRowBottomBorder">Recreational drugs:<br> </td>
					<td width="78%" class="FormInnerRowBottomBorder">Details: ________________________________________________________________</td>
				  </tr>
				  <tr> 
					<td align="center" class="FormInnerRowBottomBorder"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
					<td class="FormInnerRowBottomBorder">Alcohol<br></td>
					<td class="FormInnerRowBottomBorder">Amount: __________________ / week</td>
				  </tr>
				  <tr> 
					<td width="4%" align="center" class="FormInnerRowBottomBorder" style="vertical-align: top; padding-top: 7px;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
					<td colspan="2" class="FormInnerRowBottomBorder">
					
					<table cellspacing="0">
					<tr>
					<td style="padding-right: 8px;">Tobacco Use:</td>
					<td><asp:Label ID="socHxTobaccoType" Runat="server"> 
                  <input type="checkbox" name="Digitized2222">
                  Cigarettes <img src="../../Images/shim.gif" border="0" width="10" height="8"> 
                  <input type="checkbox" name="Digitized22222">
                  Cigar<img src="../../Images/shim.gif" border="0" width="10" height="1"> 
                  <input type="checkbox" name="Digitized22223">
                  Pipe</asp:Label></td>
					</tr>
					<tr>
					<td>&nbsp;</td>
					<td><input type="checkbox"  id="socHxTobaccoPacksPerDayCheckBox" runat="server" NAME="socHxTobaccoPacksPerDayCheckBox"/>
                <asp:Label ID="socHxTobaccoPacksPerDay" Runat="server">______</asp:Label>
                packs / day for 
                <asp:Label ID="socHxTobaccoYears" Runat="server">______</asp:Label>
                years</td>
					</tr>
					</table> 
                </td>
                  </tr>
				  <tr> 
					<td align="center" class="FormInnerRowBottomBorder"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
					<td colspan="2" class="FormInnerRowBottomBorder">Can the Patient Walk Up 2 Flights of Stairs without Chest Pain?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					  <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle"> 
					  Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No</td>
				  </tr>
				  <tr> 
					<td align="center" valign="top"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0"></td>
					<td colspan="2" valign="top"><span class="blackBoldText"><img src="../../Images/FormImages/shim.gif" border="0" width="1" height="12"></span>Other:</td>
				  </tr>
				</table>
			  </td>
			</tr>
		  </table>
		</td>	
	</tr>
	<tr><td class="FormOuterTableRow" style="padding-left: 4px;">
	
	<span class="blackBoldText" >Partner Presence Question</span><span style="margin-left: 20px; font-size: smaller;">(you may skip this question if there is no current partner)</span>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td style="padding: 12px 0px 10px 10px;">Is the partner present?<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" style="margin-left: 40px;" /> Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" />No</td>
	  </tr>
	  <tr><td style="padding: 0px 20px 10px 10px; font-style: italic; font-size: smaller;">Please select <strong>up to three (3) choices</strong> and rank them by relevance (1 – most important, 2 – 2nd most important, 3 – 3rd most important).  If fewer than 3 reasons apply, only select appropriate responses.</td></tr>
	  <tr><td style="padding: 0px 20px 4px 10px;">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;">
	  	<tr>
		<td style="width: 50%; border-right: solid 1px #666666; vertical-align: top;"><strong>Partner is PRESENT today for the following reason(s):</strong>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 4px;">
			  <tr>
				  <td style="vertical-align: top;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px; margin-right: 4px;" /></td>
				  <td>To learn about the condition / treatment</td>
			  </tr>
			  <tr>
				  <td style="vertical-align: top;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px; margin-right: 4px;" /></td>
				  <td>Partner experiencing personal problems because of the condition (e.g. stress, sexual frustration, depressed mood)</td>
			  </tr>
			  <tr>
				  <td style="vertical-align: top;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px; margin-right: 4px;" /></td>
				  <td>Doctor’s office suggested the partner be present</td>
			  </tr>
			  <tr>
				  <td style="vertical-align: top;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px; margin-right: 4px;" /></td>
				  <td>Patient prefers the partner is present</td>
			  </tr>
			  <tr>
				  <td style="padding-top: 7px; vertical-align: top;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px; margin-right: 4px;" /></td>
				  <td style="padding-top: 7px;">Other: _____________________________________</td>
			  </tr>
			</table>
		</td>
		<td style="padding: 0px 20px 4px 10px; vertical-align: top;">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;">
	  	<tr>
		<td ><strong>Partner is ABSENT today for the following reason(s):</strong>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 4px;">
			  <tr>
				  <td style="vertical-align: top;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px; margin-right: 4px;" /></td>
				  <td>Work responsibilities</td>
			  </tr>
			  <tr>
				  <td style="vertical-align: top;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px; margin-right: 4px;" /></td>
				  <td>Child care responsibilities</td>
			  </tr>
			  <tr>
				  <td style="vertical-align: top;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px; margin-right: 4px;" /></td>
				  <td>Travel time to the doctor’s office burdensome<br />
						(Estimated travel: _________ hours from home)
				</td>
			  </tr>
			  <tr>
				  <td style="vertical-align: top;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px; margin-right: 4px;" /></td>
				  <td>Partner embarrassed about the topic</td>
			  </tr>
			  <tr>
				  <td style="vertical-align: top;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px; margin-right: 4px;" /></td>
				  <td>Partner not interested in sexual activity </td>
			  </tr>
			  <tr>
				  <td style="vertical-align: top;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px; margin-right: 4px;" /></td>
				  <td>Partner is not aware of this doctor visit</td>
			  </tr>
			  <tr>
				  <td style="vertical-align: top;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px; margin-right: 4px;" /></td>
				  <td>Patient prefers absence of partner</td>
			  </tr>
			  <tr>
				  <td style="padding-top: 7px; vertical-align: top;"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" style="margin-top: 2px; margin-right: 4px;" /></td>
				  <td style="padding-top: 7px;">Other: _____________________________________</td>
			  </tr>
			</table>
		</td>
	  	</tr>
	  </table>
	  </td></tr>
	</table></td></tr>
	</table>

	
	</td></tr>
    <tr>
           <td><table width="100%" cellpadding="4" cellspacing="0" border="0" class="FormOuterTableRow">
            <tr>
            <td colspan="4"><span class="blackBoldText">Signatures</span></td>
          </tr>
           <tr>
            <td><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Patient: </span></td>
            <td align="left"><span class="blackBoldText">____________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText">&nbsp;</td>
          </tr>
          <tr>
            <td><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="6" height="1" />Reviewed by: </span></td>
            <td align="left"><span class="blackBoldText">____________________________________</span></td>
            <td><span class="blackBoldText">Date:____/____/____</span> </td>
            <td class="blackBoldText" style="white-space:nowrap;">Time:___:____ <span style="font-size: 9px;">AM / PM </span> </td>
          </tr>
          </table></td>
	<tr> 
      <td height="30" align="center" class="FormPatientSectionEnd">Clinical Staff Only Beyond This Point</td>
    </tr>
    <tr bgcolor="#ffffff"> 
      <td height="150" valign="top" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="12"><span class="blackBoldText">HPI</span><br> 
        <table width="100%" cellpadding="4" cellspacing="0" border="0">
          <tr> 
            <td class="HPIText" valign="top"> <asp:Repeater ID="hpi" runat=server OnItemDataBound="hpiItemDataBound"> 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "patientHPI") %>
                  <br>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> <asp:Repeater ID="HpiProstatectomies" runat=server OnItemDataBound="HpiProstatectomiesItemDataBound"> 
                <ItemTemplate> <strong> 
                  <%# DataBinder.Eval(Container.DataItem, "ProcName") %>
                  </strong> on 
                  <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                  <asp:Label ID="CaseSurgeonLabel" Runat="server">by 
                    <%# DataBinder.Eval(Container.DataItem, "ProcSurgeon") %>
                  </asp:Label>
                  <br>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> <asp:Label ID="PreTxPot" Runat="server" /> <asp:Repeater ID="hpiProtocols" runat=server OnItemDataBound="appendToHpiItemDataBound"> 
                <ItemTemplate> Protocol 
                  <%# DataBinder.Eval(Container.DataItem, "ProtocolNum") %>
                  <%# DataBinder.Eval(Container.DataItem, "PtProtocolStatus") %>
                  <br>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater> <asp:Repeater ID="hpiBiopsies" runat=server > 
                <ItemTemplate> Biopsy:&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                  &nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ProcName") %>
                  &nbsp;&nbsp;Result:&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathResult") %>
                  &nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathQuality") %>
                  <br>
                  <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                </ItemTemplate>
              </asp:Repeater>  <asp:Label ID="NVB_Left" Runat="server" /> <asp:Label ID="NVB_Right" Runat="server" />
            </td>
          </tr>
        </table>
		</td>
    </tr>
	<tr> 
		<td align="left" class="FormOuterTableRow"><span class="blackBoldText">Surgical History</span></td>
	</tr>
	<tr> 
      <td class="FormOuterTableRow">
	  <table align="center" border="0" class="pageWidth" cellpadding="0" cellspacing="0">
	  	<tr>
			<td width="71%">
				<table align="left" width="100%" border="0" cellpadding="1" cellspacing="0">
				  <tr> 
					<td align="left" class="FormInsideTableLeftCell"><span class="blackBoldText">Prostatectomy</span>
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Surgeon:</td>
				  </tr>
				  <tr> 
					<td align="left" class="FormInsideTableLeftCell">
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">BNS
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">UNS
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">NNS</td>
				</tr>
				<tr> 
					<td height="20" align="left" class="FormInsideTableLeftCell">
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">PSA ND
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">PSA Elev
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Continent
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Incontinent
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Pads / day: _____</td>
				</tr>
				</table>
			</td>
			<td width="29%" valign="top" align="left"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Comments</span></td>
          </tr>
		</table>
		</td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow">
	  <table align="center" border="0"  class="pageWidth" cellpadding="0" cellspacing="0">
	  	<tr>
			<td width="71%">
				<table align="left" width="100%" border="0" cellpadding="1" cellspacing="0">
				  <tr> 
					<td align="left" class="FormInsideTableLeftCell"><span class="blackBoldText">Cystoprostatectomy</span>
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Surgeon:</td>
				  </tr>
				  <tr> 
					<td align="left" class="FormInsideTableLeftCell">
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Neobladder
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Cutaneous diversion
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Conduit</td>
				</tr>
                <tr>					
                	<td align="left" class="FormInsideTableLeftCell"><img src="../../Images/FormImages/shim.gif" border="0" width="12" height="1">NSS:
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Bilateral
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Unilateral
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Non-NS</td>
              	</tr>
				<tr> 
					<td height="20" align="left" class="FormInsideTableLeftCell">
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Neoadjuvant Chemotherapy
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Adjuvant Chemotherapy</td>
				</tr>
				</table>
			</td>
			<td width="29%" valign="top" align="left"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Comments</span></td>
          </tr>
		</table>
		</td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow">
	  <table align="center" border="0" class="pageWidth" cellpadding="0" cellspacing="0">
	  	<tr>
			<td width="71%">
				<table align="left" width="100%" border="0" cellpadding="1" cellspacing="0">
				  <tr> 
					<td align="left" class="FormInsideTableLeftCell"><span class="blackBoldText">Pelvic Radiation</span>
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Radiation Oncologist:</td>
				  </tr>
				  <tr> 
					<td align="left" class="FormInsideTableLeftCell">
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Prostate
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Bladder
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1">Dose _____ cGy</td>
				</tr>
				<tr> 
					<td height="20" align="left" class="FormInsideTableLeftCell">
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Conventional RT
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Brachy
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">IMRT</td>
				</tr>
				<tr> 
					<td height="20" align="left" class="FormInsideTableLeftCell">
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Anti Androgens
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Pre-Therapy
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Post-Therapy
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Total Duration</td>
				</tr>
				</table>
			</td>
			<td width="29%" valign="top" align="left"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Comments</span></td>
          </tr>
		</table>
		</td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow">
	  <table align="center" border="0" class="pageWidth" cellpadding="0" cellspacing="0">
	  	<tr>
			<td width="71%">
				<table align="left" width="100%" border="0" cellpadding="1" cellspacing="0">
				  <tr> 
					<td align="left" class="FormInsideTableLeftCell"><span class="blackBoldText">Rectal Surgery</span>
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Surgeon:</td>
				  </tr>
				  <tr> 
					<td align="left" class="FormInsideTableLeftCell">
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">LAR
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">APR
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Other (specify):</td>
				</tr>
				<tr> 
					<td height="20" align="left" class="FormInsideTableLeftCell">
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Neoadjuvant Chemo
					<img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Adjuvant Chemo
					<img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Neoadjuvant Radiation
					<img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Adjuvant Radiation</td>
				</tr>
				</table>
			</td>
			<td width="29%" valign="top" align="left"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Comments</span></td>
          </tr>
		</table>
		</td>
    </tr>
<!--    <tr> 
      <td class="FormOuterTableRow"><span class="blackBoldText"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="15">Past Surgical History</span><br> 
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td align="center" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td class="FormInsideTableTopCell">RPLND</td>
            <td valign="middle">&nbsp;</td>
            <td align="center" valign="top" class="FormInsideTableTopLeftCell"> 
              <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableTopCell">Colorectal surgery</td>
          </tr>
          <tr> 
            <td align="center" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableRegCell">Benign prostate surgery </td>
            <td valign="middle">&nbsp;</td>
            <td align="center" valign="middle" class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="middle" class="FormInsideTableRegCell">Other:</td>
          </tr>
          <tr> 
            <td width="20" align="center" valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td width="325" valign="middle" class="FormInsideTableRegCell"><span class="blackBoldText"><img src="../../Images/FormImages/shim.gif" border="0" width="1" height="12"></span>Radical 
              Prostatectomy <br> <img src="../../Images/FormImages/shim.gif" border="0" width="1" height="4"><br> 
              <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              BNS &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              UNS &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              NNS &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              NG<br> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              SM+&nbsp;&nbsp; &nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              SM-&nbsp;&nbsp; &nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              LN+&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              LN-&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              SV+&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              SV-<br> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              AA &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              ART&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              PSA ND &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              PSA ELEV<br> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              Continent&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              Incontinent</td>
            <td width="10" valign="middle" class="FormInnerRowBottomBorder">&nbsp;</td>
            <td width="20" align="center" valign="top" class="FormInsideTableLeftCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td width="325" valign="top" class="FormInsideTableRegCell"> <span class="blackBoldText"><img src="../../Images/FormImages/shim.gif" border="0" width="1" height="12"></span>Pelvic 
              radiation <br> <img src="../../Images/FormImages/shim.gif" border="0" width="1" height="4"><br> 
              <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              Prostate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              Bladder<br> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              CRT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              BT<br> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              Retroperitoneum<br> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              Dose ________ cGy&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              AA ________</td>
          </tr>
          <tr> 
            <td align="center" valign="top" class="FormInsideTableRegCell"> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td colspan="4" valign="top" class="FormInsideTableRegCell"><span class="blackBoldText"><img src="../../Images/FormImages/shim.gif" border="0" width="1" height="12"></span>Radical 
              cystectomy<br> <img src="../../Images/FormImages/shim.gif" border="0" width="1" height="4"><br> 
              <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              LN+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              LN- &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              CTX<br> <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              Neobladder&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              Conduit&nbsp;&nbsp;&nbsp; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"> 
              Cutaneous Diversion&nbsp;&nbsp;&nbsp; </td>
          </tr>
        </table></td>
    </tr>-->
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU11<img src="../../Images/shim.gif" border="0" width="45" height="1">U15<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/31/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">3</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U15*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Sexual Function New Patient<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Clinician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow">
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="71%">
					<style type="text/css">#sexualFunctionSectionTable td { padding: 7px 0px 7px 2px; }</style>
				  <table id="sexualFunctionSectionTable" border="0" width="100%" cellpadding="2" cellspacing="0">
					  <tr> 
						<td colspan="2" align="left" class="FormInsideTableTopLeftCell"><span class="blackBoldText">Sexual Function</span></td>
					  </tr>
					  <tr> 
						<td height="20" colspan="2" align="left" class="FormInsideTableLeftCell">Duration of Erectile Dysfunction: ______ months</td>
					  </tr>
					  <tr> 
						<td height="20" colspan="2" align="left" class="FormInsideTableLeftCell">Erectile grade prior to:
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">RP ______
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">RC ______
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">RT ______
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">Rectal Surgery ______</td>
					  </tr>
					  <tr> 
						<td height="20" colspan="2" align="left" class="FormInsideTableLeftCell">Preoperative Sexual Activity (partner):
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">______ / month
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">(total) ______ / month</td>
					  </tr>
					  <tr> 
						<td height="20" colspan="2" align="left" class="FormInsideTableLeftCell">Current Sexual Activity (partner):
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">______ / month
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">(total) ______ / month</td>
					  </tr>
					  <tr> 
						<td height="20" colspan="2" align="left" class="FormInsideTableLeftCell">Current Erection Grade:
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">Sexual:______
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">Masturbatory:______</td>
					  </tr>
					  <tr> 
						<td height="20" align="left" class="FormInsideTableLeftCell">Spontaneity:<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Normal
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Reduced</td>
					  </tr>
					   <tr>
						<td height="20" align="left" class="FormInsideTableLeftCell">Sustaining:<img src="../../Images/FormImages/shim.gif" border="0" width="17" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Normal
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Reduced
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Percent of attempts failing to penetrate _______%</td>
					  </tr>
					  <tr> 
						<td height="20" align="left" class="FormInsideTableLeftCell">Loss of Penile Length?<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">Flaccid&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">Erect&nbsp;
						<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No</td>
					  </tr>
					  <tr> 
						<td height="20" align="left" class="FormInsideTableLeftCell">Nocturnal Erections:<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">None
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Rare
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Occasional
						<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Frequent<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1">Grade:______</td>
					  </tr>
					  <tr> 
						<td height="20" align="left" class="FormInsideTableLeftCell">Libido:<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Preop&nbsp;&nbsp;______ / 10
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Now&nbsp;&nbsp;______ / 10</td>
					  </tr>
					  <tr>
						<td align="left" class="FormInsideTableLeftCell">Ejaculation:<img src="../../Images/FormImages/shim.gif" border="0" width="8" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Normal
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Reduced
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Absent<br />
						<img src="../../Images/FormImages/shim.gif" border="0" width="65" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Premature
						<img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Primary
						<img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Secondary
						<img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Duration ______
						<img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">IELT ______<br />
						<img src="../../Images/FormImages/shim.gif" border="0" width="65" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Control __________
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Distress__________
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Partner Distress</td>
					  </tr>
					  <tr> 
						<td height="20" align="left" class="FormInsideTableLeftCell">Orgasm:<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Normal
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Reduced
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Absent</td>
					  </tr>

					  <tr> 
						<td height="20" align="left" class="FormInsideTableLeftCell">Delayed Orgasm :<img src="../../Images/FormImages/shim.gif" border="0" width="8" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No Orgasm w/ Partner _____ %<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle" style="margin-left: 30px;">No Orgasm w/ Self _____ %</td>
					  </tr>					  <tr> 
						<td height="20" align="left" class="FormInsideTableLeftCell">Orgasmic Pain:<img src="../../Images/FormImages/shim.gif" border="0" width="8" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">None
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Rare
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Occasional
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Frequent
					 	<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Grade _____ / 10<br />
						<img src="../../Images/FormImages/shim.gif" border="0" width="82" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Penis<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Testes<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Perineum<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Other (specify):<br />
						<img src="../../Images/FormImages/shim.gif" border="0" width="82" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Duration _____minutes</td>
					  </tr>
					  <tr> 
						<td height="20" align="left" class="FormInsideTableLeftCell">Orgasm Associated Incontinence:<img src="../../Images/FormImages/shim.gif" border="0" width="8" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">None
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Rare
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Occasional
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Frequent
						<img src="../../Images/FormImages/shim.gif" border="0" width="173" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Small
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Moderate
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Large<br />
						<img src="../../Images/FormImages/shim.gif" border="0" width="173" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Male Distress<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Partner Distress</td>
					  </tr>
					  <tr> 
						<td height="20" align="left" class="FormInsideTableLeftCell">Arousal Incontinence:<img src="../../Images/FormImages/shim.gif" border="0" width="8" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">None
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Rare
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Occasional
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Frequent
						<br/><img src="../../Images/FormImages/shim.gif" border="0" width="143" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Small
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Moderate
						<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Large<br/>
						<img src="../../Images/FormImages/shim.gif" border="0" width="143" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Male Distress<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Partner Distress</td>
					  </tr>
					  <tr>
					    <td height="20" align="left" class="FormInsideTableLeftCell">Duration Trying to Conceive  _____ <img src="../../Images/shim.gif" width="1" height="13" vspace="0" align="absmiddle" style="margin-left: 60px;" />Prior Pregnancies: Male: _____&nbsp;&nbsp;&nbsp;Female: _____</td>
				      </tr>
				  </table>
				</td>
				<td width="29%" valign="top" align="left" style="padding: 7px 0px 7px 2px;"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Comments</span></td>
			</tr>
		</table>
		</td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow">
	  <table align="center" border="0"  class="pageWidth" cellpadding="0" cellspacing="0">
	  	<tr>
			<td width="71%" >
				<style type="text/css">#penileDeformityTable td { padding: 7px 0px 7px 2px; }</style>
				<table id="penileDeformityTable" align="left" width="100%" border="0" cellpadding="2" cellspacing="0">
				  <tr> 
					<td align="left" class="FormInsideTableLeftCell"><span class="blackBoldText">Penile Deformity</span><img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">None<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Curvature<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Other (specify):</td>
				  </tr>
				  <tr> 
					<td align="left" class="FormInsideTableLeftCell">Degree:
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">10-20
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">21-30
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">31-40
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">41-50
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">51-60
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">61-70
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">71-80
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">81-90
					<img src="../../Images/FormImages/shim.gif" border="0" width="6" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">&gt;90</td>
				</tr>
				<tr> 
					<td align="left" class="FormInsideTableLeftCell">Direction: 
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Dorsal
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Ventral
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Right
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Left
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Combined __________</td>
				</tr>
				<tr> 
					<td align="left" class="FormInsideTableLeftCell">Duration: ___________ months<img src="../../Images/FormImages/shim.gif" border="0" width="20" height="1">Stable: ___________ months</td>
				</tr>
				<tr>
					<td align="left" class="FormInsideTableLeftCell">Pain:
					<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Flaccid
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Erect</td>
				</tr>
				<tr>
					<td align="left" class="FormInsideTableLeftCell">Dupuytren &#8217;s Contracture:&nbsp;&nbsp;&nbsp;
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No
					<img src="../../Images/FormImages/shim.gif" border="0" width="30" height="1">Trauma History:
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No</td>
				</tr>
				<tr>
					<td align="left" class="FormInsideTableLeftCell">Penetration Ability:
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No
					<img src="../../Images/FormImages/shim.gif" border="0" width="30" height="1">Instability:
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Yes
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">No</td>
				</tr>
				<tr> 
					<td align="left" class="FormInsideTableLeftCell">First Sign: 
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Pain
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Nodule
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Deformity</td>
				</tr>
				<tr> 
					<td align="left" class="FormInsideTableLeftCell">Treatments: 
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Oral
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">TD
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">IL
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">SWT
					<img src="../../Images/FormImages/shim.gif" border="0" width="10" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="0" align="absmiddle">Surgery</td>
				</tr>
				</table>
			</td>
			<td width="29%" valign="top" align="left" style="padding: 7px 0px 7px 0px;" ><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Comments</span></td>
          </tr>
		</table>
		</td>
    </tr>
    
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU11<img src="../../Images/shim.gif" border="0" width="45" height="1">U15<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/31/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">4</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U15*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Sexual Function New Patient<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Clinician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
	<tr>
		<td class="FormOuterTableRow">
			<asp:Literal id="HypogonadismOptionalStyles" runat="server" Visible="false"><style type="text/css">.HypogonadismHCTCol { display: none; }</style></asp:Literal>
	  		<table align="center" border="0"  class="pageWidth" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="16" style="padding-left: 4px;"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Hypogonadism</span></td>
				</tr>
				<tr>
					<td align="center" height="25" valign="middle" width="10%" class="FormInsideTableTopCell">Date</td>
					<td align="center" valign="middle" width="15%" class="FormInsideTableTopCell">Medication</td>
					<td align="center" valign="middle" width="10%" class="FormInsideTableTopCell">Dose</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">PSA</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">tT</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">fT</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">SHBG</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">E2</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">LH</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">FSH</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell">PRL</td>
					<td align="center" valign="middle" width="7%" class="FormInsideTableTopCell HypogonadismHCTCol">HCT</td>
				</tr>
				
			    <asp:Repeater ID="Hypogonadism" runat="server" > 
                <ItemTemplate>
				<tr>
					<td height="20" class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DateText")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Medication")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDose")%><%# DataBinder.Eval(Container.DataItem, "MedUnits")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PSA")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "tT")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "fT")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SHBG")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "E2")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "LH")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "FSH")%></td>
					<td class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PRL")%></td>
					<td class="FormInsideTableRegCell HypogonadismHCTCol" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "HCT")%></td>
				</tr>
                </ItemTemplate>
                </asp:Repeater>
				<tr>
					<td height="28" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell HypogonadismHCTCol">&nbsp;</td>
				</tr>
				<tr>
					<td height="28" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell HypogonadismHCTCol">&nbsp;</td>
				</tr>
				<tr>
					<td height="28" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell HypogonadismHCTCol">&nbsp;</td>
				</tr>
		  </table>		</td>
	</tr>
	<tr>
		<td class="FormOuterTableRow">
	  		<table align="center" border="0"  class="pageWidth" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="11" style="padding-left: 4px;"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Semen Analysis </span></td>
				</tr>
				<tr>
					<td align="center" height="25" valign="middle" width="11%" class="FormInsideTableTopCell">Date</td>
					<td align="center" valign="middle" width="11%" class="FormInsideTableTopCell">Concentration</td>
					<td align="center" valign="middle" width="10%" class="FormInsideTableTopCell">Motility</td>
					<td align="center" valign="middle" width="10%" class="FormInsideTableTopCell">Normal Morphology </td>
					<td align="center" valign="middle" width="6%" class="FormInsideTableTopCell">pH</td>
					<td align="center" valign="middle" width="8%" class="FormInsideTableTopCell">Volume</td>
					<td align="center" valign="middle" width="44%" class="FormInsideTableTopCell">Other</td>
				</tr>
				<tr>
					<td height="28" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
				<tr>
					<td height="28" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
				<tr>
					<td height="28" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
		  </table>		</td>
	</tr>
	<tr>
<td class="FormOuterTableRow">
	  		<table align="center" border="0"  class="pageWidth" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="16"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">DEXA Scan</span></td>
				</tr>
				<tr>
				  <td align="center" valign="middle" class="FormInsideTableTopCell">&nbsp;</td>
				  <td colspan="4" align="center" valign="middle" class="FormInsideTableTopCell" style="font-weight: bold; background-color: #dfdfdf; padding: 0px 0px;">T-Scores</td>
			  </tr>
				<tr>
					<td align="center" height="25" valign="middle" width="20%" class="FormInsideTableRegCell">Date</td>
					<td align="center" valign="middle" width="20%" class="FormInsideTableRegCell">Total Hip </td>
					<td align="center" valign="middle" width="20%" class="FormInsideTableRegCell">Femoral Neck </td>
					<td align="center" valign="middle" width="20%" class="FormInsideTableRegCell">Lumbar / Spine </td>
					<td align="center" valign="middle" width="20%" class="FormInsideTableRegCell">Forearm</td>
				</tr>
				<tr>
					<td height="28" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
				<tr>
					<td height="28" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
				<tr>
					<td height="28" class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
					<td class="FormInsideTableRegCell">&nbsp;</td>
				</tr>
		  </table>		</td>
	</tr>
	<tr> 
      <td class="FormOuterTableRow">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td colspan="3" class="FormInnerRowBottomBorder"><span class="blackBoldText">Treatments</span></td>
          </tr>
          <tr> 
            <td valign="top" height="36" class="FormInnerRowBottomBorder"> <input type="checkbox" name="No2432142"></td>
            <td valign="top" class="FormInnerRowBottomBorder">Oral</td>
            <td valign="top" width="86%" align="left" class="FormInnerRowBottomBorder">Details:</td>
          </tr>
          <tr> 
            <td valign="top" height="36" class="FormInnerRowBottomBorder"><input type="checkbox" name="No243332"></td>
            <td valign="top" class="FormInnerRowBottomBorder">Psych</td>
            <td valign="top" class="FormInnerRowBottomBorder">Details:</td>
          </tr>
          <tr> 
            <td valign="top" height="36" class="FormInnerRowBottomBorder"><input type="checkbox" name="No243432"></td>
            <td valign="top" class="FormInnerRowBottomBorder">Transdermal</td>
            <td valign="top" class="FormInnerRowBottomBorder">Details:</td>
          </tr>
          <tr> 
            <td valign="top" height="36" class="FormInnerRowBottomBorder"> <input type="checkbox" name="No243532"></td>
            <td valign="top" class="FormInnerRowBottomBorder">Transurethral</td>
            <td valign="top" class="FormInnerRowBottomBorder">Details:</td>
          </tr>
          <tr> 
            <td valign="top" height="36" class="FormInnerRowBottomBorder"> <input type="checkbox" name="No243632"></td>
            <td valign="top" class="FormInnerRowBottomBorder">Injection</td>
            <td valign="top" class="FormInnerRowBottomBorder">Details:</td>
          </tr>
          <tr> 
            <td valign="top" height="36" class="FormInnerRowBottomBorder"> <input type="checkbox" name="No2436322"></td>
            <td valign="top" class="FormInnerRowBottomBorder">Intralesional</td>
            <td valign="top" class="FormInnerRowBottomBorder">Details:</td>
          </tr>
          <tr> 
            <td valign="top" height="36" class="FormInnerRowBottomBorder"> <input type="checkbox" name="No2436323"></td>
            <td valign="top" class="FormInnerRowBottomBorder">VED</td>
            <td valign="top" class="FormInnerRowBottomBorder">Details:</td>
          </tr>
          <tr> 
            <td valign="top" height="36" class="FormInnerRowBottomBorder"> <input type="checkbox" name="No2436323"></td>
            <td valign="top" class="FormInnerRowBottomBorder">Fertility</td>
            <td valign="top" class="FormInnerRowBottomBorder">Details:</td>
          </tr>
          <tr> 
            <td valign="top" height="36" class="FormInnerRowBottomBorder"> <input type="checkbox" name="No2436324"></td>
            <td valign="top" class="FormInnerRowBottomBorder">Surgery</td>
            <td valign="top" class="FormInnerRowBottomBorder">Details:</td>
          </tr>
          <tr> 
            <td valign="top" height="36" > <input type="checkbox" name="No243131832"></td>
            <td colspan="2" valign="top"><span class="blackBoldText"><img src="../../Images/FormImages/shim.gif" border="0" width="1" height="12"></span>Other:</td>
          </tr>
        </table>		</td>
    </tr>
	<tr> 
      <td class="FormOuterTableRow">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td colspan="3" class="FormInnerRowBottomBorder"><span class="blackBoldText">Female Fertility Assessments </span></td>
          </tr>
          <tr> 
            <td valign="top" height="36" class="FormInnerRowBottomBorder"> <input type="checkbox" name="No2432142"></td>
            <td valign="top" class="FormInnerRowBottomBorder">Labs</td>
            <td valign="top" width="80%" align="left" class="FormInnerRowBottomBorder">Details:</td>
          </tr>
          <tr> 
            <td valign="top" height="36" class="FormInnerRowBottomBorder"><input type="checkbox" name="No243332"></td>
            <td valign="top" class="FormInnerRowBottomBorder">HSG</td>
            <td valign="top" class="FormInnerRowBottomBorder">Details:</td>
          </tr>
          <tr> 
            <td valign="top" height="36" class="FormInnerRowBottomBorder"><input type="checkbox" name="No243432"></td>
            <td valign="top" class="FormInnerRowBottomBorder">Endometrial Biopsy </td>
            <td valign="top" class="FormInnerRowBottomBorder">Details:</td>
          </tr>
          <tr> 
            <td valign="top" height="36" class="FormInnerRowBottomBorder"> <input type="checkbox" name="No243532"></td>
            <td valign="top" class="FormInnerRowBottomBorder">Laparoscopy</td>
            <td valign="top" class="FormInnerRowBottomBorder">Details:</td>
          </tr>
          <tr> 
            <td valign="top" height="36" > <input type="checkbox" name="No243131832"></td>
            <td colspan="2" valign="top"><span class="blackBoldText"><img src="../../Images/FormImages/shim.gif" border="0" width="1" height="12"></span>Other:</td>
          </tr>
        </table>		</td>
    </tr>
    <tr> 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU11<img src="../../Images/shim.gif" border="0" width="45" height="1">U15<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/31/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">5</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
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
		<div  class="VerticalBarCodeDocType">*U15*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Sexual Function New Patient<br/></span></td>
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
      <td height="20" class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Clinician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"><table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder"><span class="blackBoldText">Vital 
              Signs</span></td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BP:</td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Pulse:</td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Temp:</td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Resp:</td>
          </tr>
          <tr> 
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">KPS:</td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Height:</td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">Weight:</td>
            <td height="18" align="left" valign="top" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" border="0" width="4" height="0">BSA:</td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
                <tr> 
                <td valign="top" rowspan="3"><span class="blackBoldText">Exam</span></td>
                  <td width="30%"><span class="smallGrayText"><strong>Clinician 
                    Performing Initial Exam:</strong></span></td>
                  <td width="12%"><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle"> 
                    <strong>NP / PA</strong></span></td>
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle"> 
                    <strong>Fellow</strong></span></td>
                  <td><span class="smallGrayText">Attending must repeat and document 
                    <span style="font-weight: bold; text-decoration: underline;">critical</span> 
                    findings.</span></td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                  <td><span class="smallGrayText"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle"> 
                    <strong>Attending</strong></span> </td>
                  <td>&nbsp;</td>
                </tr>
          </table>			  

        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="center" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
            <td colspan="2" align="center" class="FormInsideTableTopCell"><strong>Normal 
              Symptoms</strong><strong></strong></td>
            <td width="30" align="center" class="FormInsideTableTopCell"><strong>Abnormal</strong></td>
            <td width="10%" align="center" class="FormInsideTableTopCell"><strong>Attnd<br>
              Performed</strong></td>
            <td align="center" colspan="2" class="FormInsideTableTopCell"><strong>Notes</strong></td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Gen</td>
            <td height="26" align="left" class="FormInnerRowBottomBorder">Well Developed / 
              Well Nourished</td>
            <td width="30" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td width="20%" rowspan="3" colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder">No Acute Distress</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder">Alert &amp; Oriented</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">Eyes&nbsp;</td>
            <td height="26" align="left" class="FormInnerRowBottomBorder"> No Scleral Icterus</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td colspan="2" rowspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr>
            <td height="26" align="left" class="FormInnerRowBottomBorder"> Conjunctiva</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            </tr>
          
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Lymph Nodes</td>
            <td height="26" align="left" class="FormInnerRowBottomBorder"> Cervical</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td height="26" align="left" class="FormInnerRowBottomBorder"> Supraclavicular</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder"> Groin </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td align="left" valign="top" class="FormInsideTableLeftCell">Respiratory</td>
            <td height="26" align="left" class="FormInnerRowBottomBorder"> Clear to Auscultation </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td rowspan="2" align="left" valign="top" class="FormInsideTableLeftCell">CV</td>
            <td height="26" align="left" class="FormInnerRowBottomBorder">Regular Rate &amp; Rhythm</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow">
            <td height="26" align="left" class="FormInnerRowBottomBorder">No murmurs</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
   
          <tr> 
            <td rowspan="5" align="left" valign="top" class="FormInsideTableLeftCell">Abdomen</td>
            <td height="26" align="left" class="FormInnerRowBottomBorder">Soft Non-tender</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="5" colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder"> Normal Bowel Sounds</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder"> No Hepatosplenomegaly</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder">No Ascites</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder"> No Hernia</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr> 
            <td rowspan="8" align="left" valign="top" class="FormInsideTableLeftCell">GU<br>
              Male</td>
            <td height="26" align="left" class="FormInnerRowBottomBorder">Scrotum</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
            <td width="26%" rowspan="8" align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/sexFuncDiagram1.gif" width="196" height="150"></td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInnerRowBottomBorder">Testis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="top" class="FormInsideTableRegCell">Testis Volume: _______ </td>
          </tr>
          <tr> 
            <td height="26" align="left" class="FormInnerRowBottomBorder">Epididymis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder">Varicocele</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder">Penis</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="top" class="FormInsideTableRegCell">Circumcised:&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Yes&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">No</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder">Penile Stretch</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="top" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Poor&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Fair&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle">Good</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder">Penile Plaque </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td  class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />Tender&nbsp;&nbsp;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" align="absmiddle" />Calcified</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder"> DRE - Prostate </td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td valign="top" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" align="left" valign="top" class="FormInsideTableLeftCell">Peripheral Vascular</td>
            <td height="26" align="left" class="FormInnerRowBottomBorder"> Femoral Pulses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td rowspan="3" colspan="2" class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder">Popliteal Pulses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td height="26" align="left" class="FormInnerRowBottomBorder">Pedal Pulses</td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
            <td align="center" class="FormInsideTableRegCell"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"></td>
          </tr>
          <tr class="eFormInnerTableRow"> 
            <td align="left" height="40" valign="top" class="FormInsideTableLeftCell">Other:</td>
            <td colspan=6&quot; class="FormInsideTableRegCell">&nbsp;</td>
          </tr>
        </table></td></tr></td>
    </tr>
    <tr > 
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU11<img src="../../Images/shim.gif" border="0" width="45" height="1">U15<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/31/12<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page 
        <span id="PageNumber">6</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>



<div align="left"  id="LastPageInForm" runat="server">

<div>
	<div class="VerticalBarCodeDiv">
		<div class="VerticalBarCodeStatement">
	 <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" ><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"><br/>
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage">
	  </div>

		<div  class="VerticalBarCodeMRN"><% =BarCodeMRN %></div>
		<div  class="VerticalBarCodeDocType">*U15*</div>
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
            <td width="50%" align="center" valign="middle" class="FormInnerRowRightBorder"><span class="blackBoldText"><img src="../../Images/FormImages/<%= institutionShortName%>_FormLogo.gif" width="90" alt="" border="0" align="left"><%= institutionName%><br/>Urology Sexual Function New Patient<br/></span></td>
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
      <td class="FormOuterTableRow"><img src="../../Images/shim.gif" border="0" width="4" height="15"><span class="blackBoldText">Date: <% =apptClinicDate %>
        <img src="../../Images/shim.gif" border="0" width="220" height="1">Physician: <span class="AppointmentPhysicianLabel"><% =apptPhysicianName %></span></span></td>
    </tr>
    <tr> 
      <td class="FormOuterTableRow">
	  <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
          <tr> 
            <td colspan="3" class="blackBoldText">Impression &amp; Plan</td>
          </tr>
          <tr> 
            <td width="48%" align="center" class="FormInsideTableTopCell"><strong>Diagnoses / Problem List</strong></td>
            <td width="4%" align="center" class="FormInsideTableTopCell"><strong>New</strong></td>
            <td width="48%" align="center" class="FormInsideTableTopCell"><strong>Plan &amp; Referrals</strong></td>
          </tr>
          <tr> 
            <td height="90" valign="top" class="FormInsideTableRegCell">1.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"> 
              <input name="diagnosisNew1" type="checkbox" id="diagnosisNew1"></td>
            <td valign="top" class="FormInnerRowBottomBorder"> <p>&nbsp;</p></td>
          </tr>
          <tr> 
            <td height="90" valign="top" class="FormInsideTableRegCell">2.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew2" type="checkbox" id="diagnosisNew2"></td>
            <td valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="90" valign="top" class="FormInsideTableRegCell">3.</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><input name="diagnosisNew3" type="checkbox" id="diagnosisNew3"></td>
            <td valign="top" class="FormInnerRowBottomBorder">&nbsp;</td>
          </tr>
          <tr> 
            <td height="90" valign="top" class="FormInnerRowRightBorder">4.</td>
            <td align="center" valign="middle" class="FormInnerRowRightBorder"><input name="diagnosisNew4" type="checkbox" id="diagnosisNew4"></td>
            <td valign="top">&nbsp;</td>
          </tr>
        </table>		</td>
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
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
				<td colspan="2" align="left"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><span class="blackBoldText">Describe Counseling or Dictate Note</span></td>
			    <td align="center" valign="bottom" style="font-weight: bold;">Notes</td>
			</tr>
			<tr>
				<td width="30%" height="20" align="left" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Oral Erectogenic Therapy</td>
				<td width="26%" align="left" valign="middle" class="FormInsideTableTopCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Penile Rehabilitation</td>
				<td width="44%" class="FormInsideTableTopLeftCell">&nbsp;</td>
			</tr>
			<tr>
				<td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Intracavernosal Injections</td>
				<td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Vacuum Device Therapy</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
				<td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Intraurethral Agents</td>
				<td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Penile Implant Surgery</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
				<td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Duplex Doppler US</td>
				<td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;DICC</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
				<td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Premature Ejaculation</td>
				<td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Retarded Orgasm</td>
                <td class="FormInsideTableLeftCell">&nbsp;</td>
            </tr>
             <tr>   
                <td height="20" colspan="2" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Orgasm Associated Incontinence</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
				<td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Peyronie's Disease Medical Therapy</td>
				<td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Intralesional Injection Therapy</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
				<td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Peyronie's Disease Surgery</td>
				<td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Bone Density</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
				<td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Varicocele</td>
				<td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Varicocele Surgery </td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
				<td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Low Testosterone</td>
				<td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Testosterone Supplementation</td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
				<td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Vasectomy</td>
				<td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Vasectomy Reversal </td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
				<td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Male Infertility </td>
				<td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Female Infertility </td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
				<td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;Azoospermia</td>
				<td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;TESE </td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
				<td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;ICSI</td>
				<td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;EEJ </td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
			<tr>
				<td height="20" align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1"><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13">&nbsp;PVS</td>
				<td align="left" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/FormImages/shim.gif" border="0" width="4" height="1" /><img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />&nbsp;Other: </td>
				<td class="FormInsideTableLeftCell">&nbsp;</td>
			</tr>
		</table>      </td>
    </tr>
    <tr> 
      <td valign="top" class="FormOuterTableRow"><table  class="pageWidth" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="50%" height="22" class="FormInnerRowRightBorder">Circle Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1">1<img src="../../Images/shim.gif" border="0" width="22" height="1">2<img src="../../Images/shim.gif" border="0" width="22" height="1">3<img src="../../Images/shim.gif" border="0" width="22" height="1">4<img src="../../Images/shim.gif" border="0" width="22" height="1">5</td>
            <td width="50%">Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="25" height="1">NP/PA<img src="../../Images/shim.gif" border="0" width="25" height="1">Fellow/ Resident<img src="../../Images/shim.gif" border="0" width="25" height="1">Attending</td>
          </tr>
        </table>		</td>
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
          <tr>
            <td colspan="4"><span class="blackBoldText"><input name="np/pa" type="checkbox" id="np/pa"></span>The Fellow / NP/PA conducted this visit <strong>jointly</strong> with the attending physician.</td>
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
      <td height="14" align="center" valign="bottom" class="blackBoldText">GU11<img src="../../Images/shim.gif" border="0" width="45" height="1">U15<img src="../../Images/shim.gif" border="0" width="45" height="1">CMIC 
        Approval Date: 6/03<img src="../../Images/shim.gif" border="0" width="45" height="8">rev:08/31/12<img src="../../Images/shim.gif" border="0" width="45" height="1">Page <span id="PageNumber">7</span> of <span id="TotalPages">7</span><img src="../../Images/shim.gif" border="0" width="45" height="1">ASMNTS</td>
    </tr>
  </table>
</div>


</div>