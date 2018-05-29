<!--<?xml version="1.0" encoding="UTF-8" ?>-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

		<!--Demographic parameters-->
		<xsl:param name="PtTitle"/>
		<xsl:param name="PtFirstName"/>
		<xsl:param name="PtMiddleName"/>
		<xsl:param name="PtLastName"/>
    <xsl:param name="HPIItems" />
    <xsl:param name="PtMRNTitle"/>
    <xsl:param name="PtMRN"/>
		<xsl:param name="PtBirthDate" />
		<xsl:param name="PtAge" />
		<xsl:param name="PtAddress" />
    <xsl:param name="PtGender" />
    <xsl:param name="PtRace"/>
    <xsl:param name="PtBirthPlace"/>
		
		<xsl:param name="ReferringMdList" />
		<xsl:param name="InstitutionLogoImgUrl" />
		<xsl:param name="InstitutionName" />
				
		<xsl:param name="Hpi" />
		<xsl:param name="preRP5Nomo"/>
    <xsl:param name="preRP10Nomo"/>
		<xsl:param name="preXRTNomo"/>
		<xsl:param name="preBrachyNomo"/>
    <xsl:param name="postRP7yrNomo" />
    <xsl:param name="postRP10yrNomo" />

 <xsl:param name="ComorbidityRows" />
    <xsl:param name="ComorbidityGUProstateFURows" />
    
    <xsl:param name="LabTestRows" />
    <xsl:param name="LabTestGURows" />
    <xsl:param name="LabTestRowsAll2" />
  <xsl:param name="LabTestRowsAll"/>
		<xsl:param name="AllergyRows" />
    <xsl:param name="AllergyGUString" />
    <xsl:param name="ToxicityRows" />
		<xsl:param name="MedicationRows" />
		<xsl:param name="MedicationRowsHML" />
    <xsl:param name="MedicationRowsGUHML" />
  <xsl:param name="MedicationRowsInline" />
    <xsl:param name="MedicationRowsBiopsyOfProstate" />

  
  <xsl:param name="ImagingRows" />
  <xsl:param name="BMDImagingRows" />
  <xsl:param name="ProstateBiopsyRows" />
		<xsl:param name="ROS_Rows" />
		<xsl:param name="MedicalTherapyRows" />
		<xsl:param name="RadiationTherapyRows" />
    <xsl:param name="PatientsFamilyMembersRows"/>
    <xsl:param name="PatientsSocialHistoriesRows"/>
  <xsl:param name="HasSocialHistory"/>
    <xsl:param name="DiagnosticProstateBiopsyRows"/>
  <xsl:param name="DiagnosticProstateBiopsyTRUSRows"/>
  <xsl:param name="PatientPhysiciansRows"/>
  <xsl:param name="PatientPhysiciansNameKeyRows"/>
  <xsl:param name="PatientPhysiciansReferringNameKeyRows"/>
  <xsl:param name="SurgicalHistoryRows"/>
  <xsl:param name="SurgicalHistoryRows2"/>
  <xsl:param name="PlannedProceduresRows"/>
  <xsl:param name="BrachyTherapyRows"/>
  <xsl:param name="HasBrachyTherapyHistory"/>
  <xsl:param name="psaDT"/>
  <xsl:param name="CurrentMedTxParams"/>
    <xsl:param name="GUProstateStatusParams"/>
    <xsl:param name="GUProsFUImagingRows"/>
    <xsl:param name="GUProstateHpi"/>

    <xsl:param name="LabTestOnEFormDate_WBC"/>
    <xsl:param name="LabTestOnEFormDate_CREAT"/>
    <xsl:param name="LabTestOnEFormDate_ANEUT"/>
    <xsl:param name="LabTestOnEFormDate_HGB"/>
    <xsl:param name="LabTestOnEFormDate_UNVPLT"/>
    <xsl:param name="LabTestOnEFormDate_DateText"/>


    <xsl:param name="DxBiopsyId" />
    <xsl:param name="Dx_BxDateText" />
    <xsl:param name="Dx_BxPathStageT" />
    <xsl:param name="Dx_BxPathStageN" />
    <xsl:param name="Dx_BxPathStageM" />
    <xsl:param name="PreBxTxPSA" />
    <xsl:param name="Dx_BxPathID" />
    <xsl:param name="Dx_BxGG1" />
    <xsl:param name="Dx_BxGG2" />
    <xsl:param name="Dx_BxGGS" />
    <xsl:param name="Dx_BxPosCores" />
    <xsl:param name="Dx_BxNegCores" />
  
  
  <!--ToDo: Can we have the header variables in this file and pull from the web config?-->

<!--eForm Templates for Generating Reports-->
<!--Template: Barcode Details-->
<xsl:template name="FormBarcode">
  <div>
    <div class="VerticalBarCodeDiv">
      <div class="VerticalBarCodeStatement">
        <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" />
          <br/>
          <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage" vspace="220"/>
            <br/>
            <img src="../../Images/FormImages/BarCodeLineStatement.gif" border="0" class="VerticalBarCodeStatementImage"/>
      </div>
      <div  class="VerticalBarCodeMRN">*MRN<xsl:value-of select="$PtMRN"/>*</div>
      <div  class="VerticalBarCodeDocType"><xsl:value-of select="$DocType"/></div>
      <div  class="VerticalBarCodeAcctType"><xsl:value-of select="$AcctType"/></div>
      <div  class="VerticalBarCodeDate">*<xsl:value-of select="Encounters/EncDate"/>*</div>

    </div>
  </div>
</xsl:template>


<!--Template: Form Header: Require <div> and <table> tags in place on all forms-->
<xsl:template name="EformHeader">
<tr class="EFormTableRow"> 
  <td class="FormOuterTableTopRow">
	  <table class="EFormTable" cellspacing="0" cellpadding="10">
		  <tr class="EFormTableRow"> 
			<td width="50%" align="center" valign="middle"  class="FormInsideTableRegCell"><xsl:value-of select="$InstitutionLogoImgUrl" disable-output-escaping="yes" /><span class="blackBoldText"><xsl:value-of select="$InstitutionName"/><br /><xsl:value-of select="$ReportTitle"/></span></td>
			<td width="50%" align="center" valign="bottom" class="FormInsideTableRegCell">
				<table cellspacing="0">
					<tr class="EFormTableRow"> 
					  <td width="20%"><img src="../../Images/shim.gif" border="0" width="65" height="1" /></td>
					  <td align="left" width="80%"><img src="../../Images/shim.gif" border="0" width="274" height="1" /></td>
					</tr>
					<tr class="EFormTableRow"> 
					  <td align="left"><!--MRN:--><xsl:value-of select="$PtMRNTitle"/>:
          </td>
					  <td align="left">
              <strong><xsl:value-of select="$PtMRN"/></strong><img src="../../Images/shim.gif" width="20" height="1" />
              DOB:&#160;<strong><xsl:value-of select="$PtBirthDate"/></strong><img src="../../Images/shim.gif" width="20" height="1" />
              Gender:&#160;<strong><xsl:value-of select="$PtGender"/></strong></td>
				   </tr>
					<tr class="EFormTableRow"> 
					  <td colspan="1" align="left">Name:</td>
					  <td colspan="1" align="left"><strong><xsl:value-of select="$PtLastName"/>, <xsl:value-of select="$PtFirstName"/>&#160;<xsl:value-of select="$PtMiddleName"/></strong></td>
					</tr>
					<tr class="EFormTableRow"> 
					  <td align="left" valign="top">Address:</td>
					  <td align="left" valign="top"><strong><xsl:value-of select="$PtAddress" disable-output-escaping="yes" /></strong></td>
					</tr>
					<tr class="EFormTableRow"> 
					  <td colspan="2"><img src="../../Images/shim.gif" border="0" width="1" height="5" /></td>
					</tr>
					<tr class="EFormTableRow"> 
					  <td colspan="2" align="center" valign="bottom" class="blackBoldText">Patient Identification</td>
					</tr>
				</table>
			</td>
		  </tr>
		</table>
	</td>
</tr>
</xsl:template>

<!--Date and Physician Row on Clinic Forms-->
<!--ToDo: Modify to allow entry from the Review step-->
<xsl:template name="EncounterDatePhysician">
	<tr>
		<td  class="FormOuterTableRow">
			<a name="DatePhysician_Anchor"/>
			<table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td width="50%" height="10" align="left" valign="bottom" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('EncDate','ChiefComplaint')">
						<img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Date</span>:&#160;<xsl:value-of select="Encounters/EncDate"/>
					</td>
					<td width="50%" align="left" valign="bottom" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('EncPhysician','ChiefComplaint')">
						<img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Physician</span>:&#160;<xsl:value-of select="Encounters/EncPhysician"/>
					</td>
				</tr>
			</table>		
		</td>				
	</tr>
</xsl:template>

<!--Template: Clinic Date and Clinic Physician
<xsl:template name="DatePhysician">
	<tr>
		<td  class="FormOuterTableRow">
			<table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td width="50%" height="10" align="left" valign="bottom"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Date</span>:&#160;<xsl:value-of select="Encounters/EncDate"/></td>
					<td width="50%" align="left" valign="bottom"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Physician</span>:&#160;<xsl:value-of select="Encounters/EncPhysician"/></td>
				</tr>
			</table>		
		</td>				
	</tr>
</xsl:template>-->

<!--Template: Referring MDs-->
<xsl:template name="ReferringMD">
	<tr>
		<td class="FormOuterTableRow">
			<table class="EFormTable" cellspacing="0">
				<xsl:choose>
					<xsl:when test="($ReferringMdList != '')">
						<tr>
							<td><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Referring MD(s)</span>&#160;&#160;&#160;<xsl:value-of select="$ReferringMdList"/></td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="EFormTableRow">
							<td width="50%" height="10" align="left" valign="middle"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Referring MD</span>: (<xsl:value-of select="$InstitutionShortName"/>)</td>
							<td width="50%" align="left" valign="middle" ><span class="blackBoldText">Non-<xsl:value-of select="$InstitutionShortName"/></span></td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</table>
		</td>
	</tr>
</xsl:template>
  
<!--Template: Urology Prostate HPI-->
  <xsl:template name="UrologyProstateHpi">
    <tr class="EFormTableRow">
      <td  class="FormOuterTableRow">

        <table class="EFormTable" cellspacing="0" >
          <tr class="EFormTableRow">
            <td width="100%" align="left" valign="top">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">HPI</span>
              <xsl:value-of select="$Hpi" disable-output-escaping="yes"/>
            </td>
          </tr>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('HPI_AddedText')">
            <td width="100%" align="left" valign="top" style="padding: 5px;">
              <xsl:value-of select="NoTable/HPI_AddedText"/>
            </td>
          </tr>

        </table>

      </td>

      
    </tr>
   

  </xsl:template>

  <!--Template: Interval History-->
  <xsl:template name="IntervalHistory">
    <xsl:choose>
      <xsl:when test="(NoTable/HPI_AddedText != '')">
        <tr class="EFormTableRow">
          <td  class="FormOuterTableRow">

            <table class="EFormTable" cellspacing="0" >
              <tr class="EFormTableRow">
                <td width="100%" align="left" valign="top">
                  <img src="../../Images/shim.gif" width="4" height="1" />
                  <span class="blackBoldText">Interval History</span>
                </td>
              </tr>
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('HPI_AddedText')">
                <td width="100%" align="left" valign="top" style="padding: 5px;">
                  <xsl:value-of select="NoTable/HPI_AddedText"/>
                </td>
              </tr>

            </table>

          </td>
        </tr>
      </xsl:when>
      <xsl:otherwise>
        <tr class="EFormTableRow">
          <td  class="FormOuterTableRow">

            <table class="EFormTable" cellspacing="0" >
              <tr class="EFormTableRow">
                <td width="100%" align="left" valign="top">
                  <img src="../../Images/shim.gif" width="4" height="1" />
                  <span class="blackBoldText">Interval History</span>
                </td>
              </tr>
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('HPI_AddedText')">
                <td width="100%" align="left" valign="top" style="padding: 5px;">&#160;</td>
              </tr>

            </table>

          </td>
        </tr>

      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>
  
<!--Template: Urology Prostate Nomograms-->
<xsl:template name="UrologyProstateNomogram">
	<tr >
		<td  class="FormOuterTableRow">
			<table width="100%"  cellspacing="0">
				<tr>
					<td width="20%" rowspan="2"  align="left" valign="middle" class="FormInsideTableTopLeftCell"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Nomogram Predictions</span></td>
					<td width="13%" align="right" valign="middle"  class="FormInsideTableTopCell">PreRP 5:</td>
					<td width="13%" align="center" valign="middle"  class="FormInsideTableTopCell"><xsl:value-of select="$preRP5Nomo" />&#160;</td>
					<td width="14%" align="right"  class="FormInsideTableTopCell">PreBrachy:</td>
					<td width="13%" align="center" valign="middle" class="FormInsideTableTopCell"><xsl:value-of select="$preBrachyNomo" />&#160;</td>
					<td width="14%" align="right"  class="FormInsideTableTopCell">Post RP 7yr:</td>
					<td width="13%" align="center" valign="middle" class="FormInsideTableTopCell"><xsl:value-of select="$postRP7yrNomo" />&#160;</td>
				</tr>
        <tr>
          <td align="right" valign="middle"  class="FormInsideTableTopCell">PreRP 10:</td>
          <td align="center" valign="middle"  class="FormInsideTableTopCell"><xsl:value-of select="$preRP10Nomo" />&#160;</td>
          <td align="right"  class="FormInsideTableTopCell">PreXRT:</td>
          <td align="center" valign="middle" class="FormInsideTableTopCell"><xsl:value-of select="$preXRTNomo" />&#160;</td>
          <td align="right"  class="FormInsideTableTopCell">Post RP 10yr:</td>
          <td align="center" valign="middle" class="FormInsideTableTopCell"><xsl:value-of select="$postRP10yrNomo" />&#160;</td>
        </tr>
			</table>
		</td>
	</tr>
</xsl:template>

<!--Template: Matches Chief Complaint Data-->
<xsl:template name="EncChiefComplaint">
	<xsl:choose>
		<xsl:when test="(Encounters/EncChiefComplaint != '')">
			<tr>
				<td  class="FormOuterTableRow">
					<table class="EFormTable" cellspacing="0" >
						<tr class="EFormTableRow">
							<td width="100%" align="left" valign="top"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Chief Complaint</span></td>
						</tr>
						<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('EncChiefComplaint')">
							<td width="100%" align="left" valign="top" style="padding: 5px;"><xsl:value-of select="Encounters/EncChiefComplaint"/></td>
						</tr>
					</table>
				</td>
			</tr>
		</xsl:when>
		<xsl:otherwise>
			<tr>
				<td class="FormOuterTableRow">
					<table class="EFormTable" cellspacing="0">
						<tr class="EFormTableRow">
							<td width="100%" align="left" valign="top"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Chief Complaint</span></td>
						</tr>
						<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('EncChiefComplaint')">
							<td width="100%" align="left" valign="top" class="FormInsideTableRegCell">&#160;</td>
						</tr>
					</table>
				</td>
			</tr>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!--Medical Therapy Table-->
<xsl:template name="MedicalTherapiesTable">
<tr>
	<td class="FormOuterTableRow">
		<a name="MedicalTherapy_Anchor"/>
		<table class="EFormTable" cellspacing="0">
			<tr class="EFormTableRow">
				<td align="left" valign="middle" colspan="7"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Medical Therapies</span></td>
			</tr>
			<tr class="EFormTableRow">
				<td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Date</strong></td>
				<td width="15%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Therapy</strong></td>
				<td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Agent</strong></td>
				<td width="5%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Dose</strong></td>
				<td width="5%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Units</strong></td>
				<td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Institution</strong></td>
				<td width="30%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Notes</strong></td>	
			</tr>	
			<!--Medical Therapies from the Database-->
			<xsl:value-of select="$MedicalTherapyRows" disable-output-escaping="yes"/>
			<xsl:for-each select="MedicalTherapy">
				<xsl:choose>
					<xsl:when test="((MedTxDateText != '') or (MedTxType != '') or (MedTxAgent != '') or (MedTxDose != '') or (MedTxInstitution != '') or (MedTxNotes != ''))">
						<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('MedicalTherapy',{./@RecordId})">
							<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="MedTxDateText"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedTxType"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedTxAgent"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" ><xsl:value-of select="MedTxDose" />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedTxUnits"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedTxInstitution"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedTxNotes"  />&#160;</td>
						</tr>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('MedicalTherapy','')">
				<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>	
			</tr>	
		</table>
	</td>
</tr>
</xsl:template>

    <!--Medical Therapy Table for TRUSBiopsy -->
    <xsl:template name="MedicalTherapiesTRUSBiopsyTable">
        <tr>
            <td class="FormOuterTableRow">
                <a name="MedicalTherapiesTRUSBiopsyTable_Anchor"/>
                <table class="EFormTable" cellspacing="0">
                    <tr class="EFormTableRow">
                        <td align="left" valign="middle" colspan="7">
                            <img src="../../Images/shim.gif" width="4" height="1" />
                            <span class="blackBoldText">Medical Therapy</span>
                        </td>
                    </tr>
                    <tr class="EFormTableRow">
                        <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                            <strong>Date</strong>
                        </td>
                        <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Agent</strong>
                        </td>
                        <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Therapy</strong>
                        </td>
                        <td width="5%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Dose</strong>
                        </td>
                        <td width="5%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Units</strong>
                        </td>
                        <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Institution</strong>
                        </td>
                        <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Notes</strong>
                        </td>
                    </tr>
                    <!--Medical Therapies from the Database-->
                    <xsl:value-of select="$MedicalTherapyRows" disable-output-escaping="yes"/>
                    <xsl:for-each select="MedicalTherapy">
                        <xsl:choose>
                            <xsl:when test="((MedTxDateText != '') or (MedTxType != '') or (MedTxAgent != '') or (MedTxDose != '') or (MedTxInstitution != '') or (MedTxNotes != ''))">
                                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('MedicalTherapy',{./@RecordId})">
                                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                                        <xsl:value-of select="MedTxDateText"  />&#160;
                                    </td>
                                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                                        <xsl:value-of select="MedTxAgent"  />&#160;
                                    </td>
                                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                                        <xsl:value-of select="MedTxType"  />&#160;
                                    </td>
                                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                                        <xsl:value-of select="MedTxDose" />&#160;
                                    </td>
                                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                                        <xsl:value-of select="MedTxUnits"  />&#160;
                                    </td>
                                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                                        <xsl:value-of select="MedTxInstitution"  />&#160;
                                    </td>
                                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                                        <xsl:value-of select="MedTxNotes"  />&#160;
                                    </td>
                                </tr>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('MedicalTherapy','')">
                        <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>



    <xsl:template name="FocalTherapiesTRUSBiopsyTable">
        <tr>
            <td class="FormOuterTableRow">
                <a name="FocalTherapiesTRUSBiopsyTable_Anchor"/>
                <table class="EFormTable" cellspacing="0">
                    <tr class="EFormTableRow">
                        <td align="left" valign="middle" colspan="5">
                            <img src="../../Images/shim.gif" width="4" height="1" />
                            <span class="blackBoldText">Focal Therapy</span>
                        </td>
                    </tr>
                    <tr class="EFormTableRow">
                        <td style="width: 10%; text-align: center; vertical-align: middle;" class="FormInsideTableTopLeftCell">
                            <strong>Date</strong>
                        </td>
                        <td style="width: 20%; text-align: center; vertical-align: middle;"  class="FormInsideTableTopCell">
                            <strong>Type</strong>
                        </td>
                        <td style="width: 15%; text-align: center; vertical-align: middle;"  class="FormInsideTableTopCell">
                            <strong>Target</strong>
                        </td>
                        <td style="width: 25%; text-align: center; vertical-align: middle;"  class="FormInsideTableTopCell">
                            <strong>Institution</strong>
                        </td>
                        <td style="width: 30%; text-align: center; vertical-align: middle;"  class="FormInsideTableTopCell">
                            <strong>Notes</strong>
                        </td>
                    </tr>
                    <xsl:for-each select="Procedures[position()>1]">
                        <xsl:choose>
                            <xsl:when test="((ProcName != '') or (ProcIndication != '') or (ProcDateText != '') or (ProcSite != '') or (ProcNotes != '') or (ProcInstitution != ''))">
                                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                                        <xsl:value-of select="ProcDateText"  />&#160;
                                    </td>
                                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                                        <xsl:value-of select="ProcName"  />&#160;
                                    </td>
                                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                                        <xsl:value-of select="ProcSite"  />&#160;
                                    </td>
                                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                                        <xsl:value-of select="ProcInstitution" />&#160;
                                    </td>
                                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                                        <xsl:value-of select="ProcNotes"  />&#160;
                                    </td>
                                </tr>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures','')">
                        <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>


    <!--Radiation Therapy Table-->
<xsl:template name="RadiationTherapiesTable">
<tr>
	<td class="FormOuterTableRow">
		<a name="RadiationTherapy_Anchor"/>
		<table class="EFormTable" cellspacing="0">
			<tr class="EFormTableRow">
				<td align="left" valign="middle" colspan="6"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Radiation Therapies</span></td>
			</tr>
			<tr class="EFormTableRow">
				<td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Date</strong></td>
				<td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Type</strong></td>
				<td width="15%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Target</strong></td>
				<td width="5%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Dose</strong></td>
				<td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Institution</strong></td>			
				<td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Notes</strong></td>			
			</tr>
			<!--Radiation Therapies from the Database-->
			<xsl:value-of select="$RadiationTherapyRows" disable-output-escaping="yes"/>
			<xsl:for-each select="RadiationTherapy">
				<xsl:choose>
					<xsl:when test="((RadTxDateText != '') or (RadTxType != '') or (RadTxTarget != '') or (RadTxTotalDose != '') or (RadTxInstitution != '') or (RadTxNotes != ''))">
						<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('RadiationTherapy',{./@RecordId})">
							<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="RadTxDateText"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="RadTxType"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="RadTxTarget"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="RadTxTotalDose"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="RadTxInstitution"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="RadTxNotes"  />&#160;</td>
						</tr>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('RadiationTherapy','')">
				<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
			</tr>	
		</table>
	</td>
</tr>
</xsl:template>

    <!--Brachy Therapy Table-->
    <xsl:template name="BrachyTherapiesTable">
        <tr>
            <td class="FormOuterTableRow">
                <table class="EFormTable" cellspacing="0">
                    <tr class="EFormTableRow">
                        <td align="left" valign="middle" colspan="5">
                            <img src="../../Images/shim.gif" width="4" height="1" />
                            <span class="blackBoldText">Brachy Therapy</span>
                        </td>
                    </tr>
                    <tr class="EFormTableRow">
                        <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                            <strong>Date</strong>
                        </td>
                        <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Prescribed Dose</strong>
                        </td>
                        <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Isotope</strong>
                        </td>
                        <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Institution</strong>
                        </td>
                        <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Notes</strong>
                        </td>
                    </tr>

                    <xsl:if test="($HasBrachyTherapyHistory = 'No')" >

                        <xsl:for-each select="BrachyTherapy">
                            <xsl:choose>
                                <xsl:when test="((BrachyDateText != '') or (BrachyPrescribedDose != '') or (BrachyIsotope != '') or (BrachyInstitution != '') or (BrachyNotes != ''))">
                                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('BrachyTherapy',{./@RecordId})">
                                        <td align="center" valign="middle" class="FormInsideTableLeftCell">
                                            <xsl:value-of select="BrachyDateText"  />&#160;
                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">
                                            <xsl:value-of select="BrachyPrescribedDose"  />&#160;
                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">
                                            <xsl:value-of select="BrachyIsotope"  />&#160;
                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">
                                            <xsl:value-of select="BrachyInstitution"  />&#160;
                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">
                                            <xsl:value-of select="BrachyNotes"  />&#160;
                                        </td>
                                    </tr>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:if>


                    <xsl:if test="($HasBrachyTherapyHistory = 'Yes')" >

                        <!--Brachytherapies from the Database (Database currently only supports one Brachytherapy)-->
                        <xsl:value-of select="$BrachyTherapyRows" disable-output-escaping="yes"/>

                    </xsl:if>
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('BrachyTherapy','')">
                        <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>

<!--Template: Late Complications: Matches Toxicities-->
<xsl:template match="Toxicities" name="ComplicationsTable">
	<tr>
		<td class="FormOuterTableRow"><a name="Toxicities_Anchor"/>
		   <table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td colspan="3"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Late Complications</span></td>
				</tr>
				<tr class="EFormTableRow">
					<td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Date</strong></td>
					<td width="40%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Complication</strong></td>
					<td width="40%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Notes</strong></td>
				</tr>
				<!--Toxicities from the database-->
				<xsl:value-of select="$ToxicityRows" disable-output-escaping="yes"/>
				<xsl:for-each select="Toxicities">
					<xsl:choose>
						<xsl:when test="((ToxDateText != '') or (ToxName != '') or (ToxNotes != ''))">		
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Toxicities',{./@RecordId})">
								<td align="center" valign="middle"  class="FormInsideTableLeftCell" ><xsl:value-of select="ToxDateText"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" ><xsl:value-of select="ToxName"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ToxNotes"  />&#160;</td>
							</tr>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
				<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Toxicities','');">
					<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
					<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
					<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				</tr>
			</table>
		</td>
	</tr>
</xsl:template>

<!--Medications and Allergies combined in one Row-->
<xsl:template name="MedAllergiesTable">
	<tr>
		<td class="FormOuterTableRow">
			<table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td width="50%" valign="top"><xsl:call-template name="MedTable"/></td>
					<td width="50%" valign="top"><xsl:call-template name="AllergiesTable"/></td>
				</tr>
			</table>
		</td>
	</tr>
</xsl:template>

  <!-- Allergies in one Row-->
  <xsl:template name="AllergiesTableOnly">
    <tr>
      <td class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
             <td width="50%" valign="top">
              <xsl:call-template name="AllergiesTable"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Medications in one Row-->
  <xsl:template name="MedTableOnly">
    <tr>
      <td class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td width="50%" valign="top">
              <xsl:call-template name="MedTable"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

		
<!--Template: Matches Medications-->
<xsl:template match="Medications" name="MedTable">
	<a name="Medications_Anchor"/>
	<table class="EFormTable" cellspacing="0">
		<tr class="EFormTableRow">
			<td colspan="7"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Medications</span></td>
		</tr>
		<tr class="EFormTableRow">
			<td width="30%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Medication</strong></td>
			<td width="5%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Dose</strong></td>
			<td width="5%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Units</strong></td>
      <td width="5%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Route</strong></td>			
      <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Schedule</strong></td>
      <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>StartDate</strong></td>
      <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>StopDate</strong></td>
    </tr>
    <!--Medications from the Database-->
	<xsl:value-of select="$MedicationRows" disable-output-escaping="yes"/>	
	<xsl:for-each select="Medications">
		<xsl:choose>
			<xsl:when test="((Medication != '') or (MedDose != '') or (MedUnits != '') or (MedRoute != '') or (MedSchedule != '') or (MedStopDateText != ''))">
				<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications',{./@RecordId})">		
					<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="Medication"  />&#160;</td>
					<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedDose"  />&#160;</td>
					<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedUnits"  />&#160;</td>
          <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedRoute"  />&#160;</td>
					<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedSchedule"  />&#160;</td>
          <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedDateText"  />&#160;</td>
          <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedStopDateText"  />&#160;</td>
        </tr>
      </xsl:when>
		</xsl:choose>
	</xsl:for-each>
	<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
		<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
  </tr>
</table>
</xsl:template>

  
<!--Template: Allergies: Matches Allergies-->
<xsl:template match="Allergies" name="AllergiesTable">
	<a name="Allergies_Anchor"/>
	<table class="EFormTable" cellspacing="0">
		<tr class="EFormTableRow">
			<td colspan="2"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Allergies</span></td>
		</tr>
		<tr class="EFormTableRow">
			<td width="50%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Allergy</strong></td>
			<td width="50%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Response</strong></td>
		</tr>
		<!--Allergies from the database-->	
		<xsl:value-of select="$AllergyRows" disable-output-escaping="yes"/>
		<xsl:for-each select="Allergies">
			<xsl:choose>
				<xsl:when test="((Allergen != '') or (AllergyResponse != ''))">
					<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Allergies',{./@RecordId})">
						<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="Allergen"  />&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="AllergyResponse"  />&#160;</td>
					</tr>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Allergies','')">	
			<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		</tr>
	</table>
</xsl:template>

<!--Medical and Surgical History (Comorbidities and Procedures)-->
<xsl:template name="ComorbProceduresTable">
	<tr>
		<td class="FormOuterTableRow">
			<table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td width="50%" valign="top"><xsl:call-template name="ComorbiditiesTable"/></td>
					<td width="50%" valign="top"><xsl:call-template name="ProceduresTable"/></td>
				</tr>
			</table>
		</td>
	</tr>
</xsl:template>

  <!--Medical  History (Comorbidities)-->
  <xsl:template name="ComorbiditiesTableOnly">
    <tr>
      <td class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td valign="top">
              <xsl:call-template name="ComorbiditiesTable"/>
            </td>

          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

 
  <!-- Surgical History (Procedures)-->
  <xsl:template name="ProceduresTableOnly">
    <tr>
      <td class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td valign="top">
              <xsl:call-template name="ProceduresTable"/>
            </td>

          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  
<!--Template: Comorbidities: Matches Comorbidities-->
<xsl:template match="Comorbidities" name="ComorbiditiesTable">
	<a name="Comorbidities_Anchor"/>
	<table class="EFormTable" cellspacing="0">
		<tr class="EFormTableRow">
			<td colspan="3"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Medical History / Comorbidities</span></td>
		</tr>
		<tr class="EFormTableRow">
			<td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Date</strong></td>
			<td width="40%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Comorbidity</strong></td>
			<td width="40%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Notes</strong></td>
		</tr>
	   <!--Comorbidities from the Database-->
		<xsl:value-of select="$ComorbidityRows" disable-output-escaping="yes"/>

    <!--Tracks whether or not Table contains data-->
    
    <xsl:variable name="HasData" select="false" />   
    
		<xsl:for-each select="Comorbidities">
			<xsl:choose>
				<xsl:when test="((ComorbDateText != '') or (Comorbidity != '') or (ComorbNotes != ''))">



          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Comorbidities',{./@RecordId})">		
						<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="ComorbDateText"  />&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Comorbidity"  />&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ComorbNotes"  />&#160;</td>
					</tr>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Comorbidities','')">		
			<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		</tr>
	</table>
</xsl:template>


  <xsl:template name="ProceduresTable">
     
    <table class="EFormTable" cellspacing="0">
      <tr class="EFormTableRow">
        <td colspan="3">
          <img src="../../Images/shim.gif" width="4" height="1" />
          <span class="blackBoldText">Surgical History</span>
        </td>
      </tr>
      <tr class="EFormTableRow">
        <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
          <strong>Date</strong>
        </td>
        <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>Procedure</strong>
        </td>
        <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>Result</strong>
        </td>
      </tr>

      <!--Surgeries from the Database-->
      <xsl:value-of select="$SurgicalHistoryRows2" disable-output-escaping="yes"/>

      <xsl:for-each select="Surgeries">
        <tr class="EFormTableRow">
          <td align="center" valign="middle" class="FormInsideTableLeftCell">
            <xsl:value-of select="ProcDateText"  />&#160;
          </td>
          <td align="center" valign="middle" class="FormInsideTableRegCell">
            <xsl:value-of select="ProcSurgeon"  />&#160;
          </td>
          <td align="center" valign="middle" class="FormInsideTableRegCell">
            <xsl:value-of select="ProcNotes"  />&#160;
          </td>
        </tr>
      </xsl:for-each>
      <xsl:for-each select="ProstatectomyProc">
        <xsl:choose>
          <xsl:when test="((ProcType != '') or (ProcSurgeon != '') or (ProcStageT != '') or (ProcNotes != ''))">
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('ProcProstatectomiesOp',{./@RecordId})">
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcName"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcSurgeon"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcStageT"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcNotes"  />&#160;
              </td>
            </tr>
          </xsl:when>
        </xsl:choose>
      </xsl:for-each>
      <xsl:for-each select="Procedures">
        <xsl:choose>
          <xsl:when test="( (ProcPending != 1) and ((OpDateText != '') or (ProcName != '') or (PathResult != '')))">
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
              <td align="center" valign="middle" class="FormInsideTableLeftCell">
                <xsl:value-of select="ProcDateText"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="ProcName"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="PathResult"  />&#160;
              </td>
            </tr>
          </xsl:when>
        </xsl:choose>
      </xsl:for-each>
      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures','')">
        <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      </tr>
    </table>
  </xsl:template>


  <xsl:template name="ProceduresPlannedTable">
    <tr>
      <td class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="3">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Planned Procedures</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Procedure</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Side</strong>
            </td>
            <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>

          <!--Planned Procedures from the Database-->
          <xsl:value-of select="$PlannedProceduresRows" disable-output-escaping="yes"/>
          
          <xsl:for-each select="Procedures">
            <xsl:choose>
              <xsl:when test="( (ProcPending = 1) and  ((ProcDateText != '') or (ProcName != '') or (ProcSide != '') or (ProcNotes != '')))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ProcDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcName"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcSide"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProcNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  
  
<!--Template: Lab Tests Values Matches LabTests-->
<xsl:template match="LabTests" name="LabTable">
	<tr>
	   <td class="FormOuterTableRow">
		   <a name="LabTests_Anchor"/>
		   <table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td colspan="4"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Biochemical Markers / Lab Tests</span></td>
				</tr>
				<tr class="EFormTableRow">
					<td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Date</strong></td>
					<td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Lab Test</strong></td>
					<td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Value</strong></td>
					<td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Quality</strong></td>
				</tr>
			<xsl:value-of select="$LabTestRows" disable-output-escaping="yes"/>
			<xsl:for-each select="LabTests">
					<xsl:choose>
						<xsl:when test="((LabDateText != '') or (LabTest != '') or (LabResult != '') or (LabUnits != '') or (LabQuality != ''))">
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests',{./@RecordId})">
								<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="LabDateText"/>&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="LabTest" />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="LabResult"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="LabQuality"  />&#160;</td>
							</tr>	
						</xsl:when>
					</xsl:choose>
			</xsl:for-each>
			<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests','')">
				<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<!--<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>-->
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
			</tr>
		</table>
	  </td>
	</tr>
</xsl:template>

  <!--Template: Lab Tests Values Matches LabTests-->
  <xsl:template match="LabTests" name="LabTable2">
    <tr>
      <td class="FormOuterTableRow">
        <a name="LabTests_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="4">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Biochemical Markers / Lab Tests</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Lab Test</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Value</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Quality</strong>
            </td>
          </tr>
          <xsl:value-of select="$LabTestRowsAll" disable-output-escaping="yes"/>
          <xsl:for-each select="LabTests">
            <xsl:choose>
              <xsl:when test="((LabDateText != '') or (LabTest != '') or (LabResult != '') or (LabUnits != '') or (LabQuality != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="LabDateText"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="LabTest" />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="LabResult"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="LabQuality"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <!--<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>-->
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  
  <!--Template: Lab Tests (PSAs) Values Matches LabTests-->
  <xsl:template match="LabTests" name="LabTable3">
    <tr>
      <td class="FormOuterTableRow">
        <a name="LabTests_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="4">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Biochemical Markers / Lab Tests</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Lab Test</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Value</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Units</strong></td>
            <!--<td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Quality</strong>
            </td>-->
          </tr>
          <xsl:value-of select="$LabTestRowsAll2" disable-output-escaping="yes"/>
          <xsl:for-each select="LabTests">
            <xsl:choose>
              <xsl:when test="((LabDateText != '') or (LabTest != '') or (LabResult != '') or (LabUnits != '') or (LabQuality != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="LabDateText"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="LabTest" />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="LabResult"  />&#160;
                  </td>                  
                  <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="LabUnits"  />&#160;</td>
                  <!--Field removed from XML-->
                  <!--<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="LabQuality"  />&#160;</td>-->
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <!--<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>-->
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  
<!--Template: Diagnostics Values Matches Diagnostics-->
<xsl:template match="Diagnostics" name="DiagnosticsTable">
	<tr>
	   <td class="FormOuterTableRow">
		   <a name="Diagnostics_Anchor"/>
		   <table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td colspan="4"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Imaging</span></td>
				</tr>
				<tr class="EFormTableRow" >
					<td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Date</strong></td>
					<td width="15%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Test Type</strong></td>
					<td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Result</strong></td>
					<td width="55%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Notes</strong></td>
				</tr>
				<!--Imaging data from the database-->
				<xsl:value-of select="$ImagingRows" disable-output-escaping="yes"/>
				<xsl:for-each select="Diagnostics">
					<xsl:choose>
						<xsl:when test="((DxDateText != '') or (DxType != '') or (DxResult != '') or (DxNotes != ''))">
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics',{./@RecordId})">
								<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="DxDateText"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DxType"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DxResult"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DxNotes"  />&#160;</td>	
							</tr>
						</xsl:when>
					</xsl:choose>
			   </xsl:for-each>
			<!-- empty row for adding new ones -->
			<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics','')">
				<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
			</tr>
		</table>
	  </td>
	</tr>
</xsl:template>

<!--Template: Prostate Biopsies Values Matches BiopsiesProstate-->
<xsl:template match="BiopsiesProstate" name="BiopsiesProstateTable">
	<tr>
	   <td class="FormOuterTableRow">
		   <a name="BiopsiesProstate_Anchor"/>
		   <table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td colspan="6"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Prostate Biopsies: Watchful Waiting Patients</span></td>
				</tr>
				<tr class="EFormTableRow" >
					<td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Date</strong></td>
					<td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Type</strong></td>
					<td width="5%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>G 1</strong></td>
					<td width="5%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>G 2</strong></td>
					<td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Result</strong></td>
					<td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>PIN</strong></td>
					<td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>ASAP</strong></td>
					<td width="30%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Notes</strong></td>
				</tr>
				<!--Prostate Biopsy data from the database-->
				<xsl:value-of select="$ProstateBiopsyRows" disable-output-escaping="yes"/>
				<xsl:for-each select="Pathology">
					<xsl:choose>
						<xsl:when test="((PathDateText != '') or (PathSpecimenType != '') or (PathResult != '') or (PathNotes != '') or (ProstateBiopsyPath/PathGG1 != '') or (ProstateBiopsyPath/PathGG2 != '') or (ProstateBiopsyPath/PathASAP != '') or (ProstateBiopsyPath/PathHG_PIN != ''))">
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Pathology',{./@RecordId})">
								<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="PathDateText"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="PathSpecimenType"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProstateBiopsyPath/PathGG1"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProstateBiopsyPath/PathGG2"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="PathResult"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProstateBiopsyPath/PathHG_PIN"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProstateBiopsyPath/PathASAP"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="PathNotes"  />&#160;</td>	
							</tr>
						</xsl:when>
					</xsl:choose>
			   </xsl:for-each>
			<!-- empty row for adding new ones -->
			<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Pathology','')">
				<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
			</tr>
		</table>
	  </td>
	</tr>
</xsl:template>

<!--Template: Review of Systems Values Matches EncReviewOfSystems-->
<xsl:template match="EncReviewOfSystems" name="ROS_Table">
	<tr>
	   <td class="FormOuterTableRow">
	   <a name="EncReviewOfSystems_Anchor"/>
		   <table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td colspan="5"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Review of Systems</span><img src="../../Images/shim.gif" border="0" width="65" height="1" />Clinician Performing Review:&#160;<xsl:call-template name="ROS_Clinician" /></td>
				</tr>
				<tr class="EFormTableRow">
					<td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
					<td width="23%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Symptom</strong></td>
					<td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Result</strong></td>
					<td width="12%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Relation</strong></td>
					<td width="45%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Notes</strong></td>
				</tr>
			<xsl:for-each select="Encounters/EncReviewOfSystems">
					<xsl:choose>
						<xsl:when test="((ROS_System != '') or (ROS_Symptom != '') or (ROS_Result != '') or (ROS_RelatedTo != '') or (ROS_Notes != ''))">
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncReviewOfSystems',{./@RecordId})">
								<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="ROS_System"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ROS_Symptom"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell">
								   <xsl:choose>
											<xsl:when test="(ROS_Result='Abnormal')"><strong>Abnormal</strong></xsl:when>
											<xsl:when test="(ROS_Result='Not Done')"><i>*Not Done*</i></xsl:when>
											<xsl:otherwise><xsl:value-of select="ROS_Result"  /></xsl:otherwise>
									</xsl:choose>&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ROS_RelatedTo"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ROS_Notes"  />&#160;</td>
							</tr>	
						</xsl:when>
					</xsl:choose>
			</xsl:for-each>
			<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncReviewOfSystems','')">
				<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
			</tr>
		</table>
	  </td>
	</tr>
</xsl:template>
  

  <!--Template: Review of Systems Values Matches EncReviewOfSystems-->
  <xsl:template match="EncReviewOfSystems" name="ROS_Table2">
    <tr>
      <td class="FormOuterTableRow">
        <a name="EncReviewOfSystems_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="5">
              <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Review of Systems</span><img src="../../Images/shim.gif" border="0" width="65" height="1" />
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>System</strong>
            </td>
            <td width="23%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Symptom</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Result</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Relation</strong>
            </td>
            <td width="45%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>
          <xsl:for-each select="Encounters/EncReviewOfSystems">
            <xsl:choose>
              <xsl:when test="((ROS_System != '') or (ROS_Symptom != '') or (ROS_Result != '') or (ROS_RelatedTo != '') or (ROS_Notes != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncReviewOfSystems',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ROS_System"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ROS_Symptom"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:choose>
                      <xsl:when test="(ROS_Result='Abnormal')">
                        <strong>Abnormal</strong>
                      </xsl:when>
                      <xsl:when test="(ROS_Result='Not Done')">
                        <i>*Not Done*</i>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="ROS_Result"  />
                      </xsl:otherwise>
                    </xsl:choose>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ROS_RelatedTo"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ROS_Notes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncReviewOfSystems','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

<!--NoTable Data for tracking the clinician performing the review-->
<xsl:template match="ROS_Clinician" name="ROS_Clinician">
   <xsl:for-each select="NoTable" ><strong><xsl:value-of select="ROS_Clinician"  /></strong></xsl:for-each>
</xsl:template>

    <!--Template: Review of Systems Values for GU Medicine Matches ROS_Toxicities-->
    <xsl:template match="ROS_Toxicities" name="ROS_ToxicityTable">
        <tr>
            <td class="FormOuterTableRow">
                <a name="ROS_Toxicities_Anchor"/>
                <table class="EFormTable" cellspacing="0" style="border-collapse: collapse;">
                    <tr class="EFormTableRow">
                        <td colspan="8">
                            <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Review of Systems</span><img src="../../Images/shim.gif" border="0" width="65" height="1" />Clinician Performing Review:&#160;<xsl:call-template name="ROS_Clinician" />
                        </td>
                    </tr>
                    <tr class="EFormTableRow">
                        <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                            <strong>Category</strong>
                        </td>
                        <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Toxicity</strong>
                        </td>
                        <td width="6%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Grade</strong>
                        </td>
                        <td width="9%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Start</strong>
                        </td>
                        <td width="9%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Stop</strong>
                        </td>
                        <td width="9%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Attribution</strong>
                        </td>
                        <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Intervention</strong>
                        </td>
                        <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
                            <strong>Notes</strong>
                        </td>
                    </tr>
                    <xsl:for-each select="Toxicities">
                        <xsl:choose>
                            <xsl:when test="((ToxCategory != '') or (ToxName != '') or (ToxGrade != '') or (ToxRelatedTo != '') or (ToxIntervention != '') or (ToxDateText != '') or (ToxStopDateText != '') or (ToxNotes != ''))">
                                <xsl:choose>
                                    <xsl:when test="(ToxName = 'Pain')">

                                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Toxicities',{./@RecordId})">
                                            <td  colspan="1" rowspan="1" class="FormInsideTableLeftCell" style="font-size: 12px; font-weight: bold; verical-align: top; padding: 4px; border-top: solid 1px;border-right: none;">Pain</td>
                                            <td rowspan="1" class="FormInsideTableLeftCell" >
                                                Site:
                                                <xsl:choose>
                                                    <xsl:when test="(position() = 20)">
                                                        <xsl:value-of select="../NoTable/PainLocation"  />
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="../NoTable/PainLocation2"  />
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </td>
                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                <xsl:choose>
                                                    <xsl:when test="(ToxGrade='Abnormal')">
                                                        <strong>Abnormal</strong>
                                                    </xsl:when>
                                                    <xsl:when test="(ToxGrade='Not Done')">
                                                        <i>*Not Done*</i>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="ToxGrade"  />
                                                    </xsl:otherwise>
                                                </xsl:choose>&#160;
                                            </td>
                                            <td align="center" valign="middle"  class="FormInsideTableRegCell" >
                                                <xsl:value-of select="ToxDateText"  />&#160;
                                            </td>
                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                <xsl:value-of select="ToxStopDateText"  />&#160;
                                            </td>
                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                <xsl:value-of select="ToxProbability"  />&#160;
                                            </td>
                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                <xsl:value-of select="ToxIntervention"  />&#160;
                                            </td>
                                            <td  valign="middle" class="FormInsideTableRegCell">
                                                Ongoing:
                                                <xsl:choose>
                                                    <xsl:when test="(position() = 20)">
                                                        <strong>
                                                            <xsl:value-of select="../NoTable/PainOngoing"  />
                                                        </strong>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <strong>
                                                            <xsl:value-of select="../NoTable/PainOngoing2"  />
                                                        </strong>
                                                    </xsl:otherwise>
                                                </xsl:choose><br/>Intensity (1-10):
                                                <xsl:choose>
                                                    <xsl:when test="(position() = 20)">
                                                        <strong>
                                                            <xsl:value-of select="../NoTable/PainSeverity"  />
                                                        </strong>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <strong>
                                                            <xsl:value-of select="../NoTable/PainSeverity2"  />
                                                        </strong>
                                                    </xsl:otherwise>
                                                </xsl:choose><br/>Relief:
                                                <xsl:choose>
                                                    <xsl:when test="(position() = 20)">
                                                        <strong>
                                                            <xsl:value-of select="../NoTable/PainRelief"  />
                                                        </strong>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <strong>
                                                            <xsl:value-of select="../NoTable/PainRelief"  />
                                                        </strong>
                                                    </xsl:otherwise>
                                                </xsl:choose><br/>

                                                <xsl:value-of select="ToxNotes"  />


                                            </td>
                                        </tr>

                                    </xsl:when>

                                    <xsl:when test="(ToxName = 'Erectile dysfunction') or (ToxName = 'Fasting')">
                                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Toxicities',{./@RecordId})">
                                            <td align="center" valign="middle" class="FormInsideTableLeftCell" style="border-bottom: none;">
                                                <xsl:choose>
                                                    <xsl:when test="ToxName = 'Erectile dysfunction'">&#160;</xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="ToxCategory"  />
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </td>

                                            <td  colspan="7" rowspan="1" class="FormInsideTableLeftCell" style="font-size: 12px; font-weight: bold; verical-align: top; padding: 4px; border-top: solid 1px;border-right: none;">
                                                <xsl:choose>
                                                    <xsl:when test="ToxName = 'Erectile dysfunction'">
                                                        Potency:
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="ToxName"  />:
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                                <span class="smallGrayText">&#160;&#160;&#160;&#160;&#160;&#160;</span>&#160;&#160;&#160;

                                                <xsl:choose>
                                                    <xsl:when test="ToxNotes = 'Yes'">
                                                        <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                    </xsl:otherwise>
                                                </xsl:choose>Y&#160;&#160;&#160;&#160;&#160;
                                                <xsl:choose>
                                                    <xsl:when test="ToxNotes = 'No'">
                                                        <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                    </xsl:otherwise>
                                                </xsl:choose>N
                                            </td>
                                        </tr>

                                    </xsl:when>
                                    <xsl:otherwise>
                                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Toxicities',{./@RecordId})">
                                            <xsl:variable name="lastToxCategory" select="ToxCategory"/>
                                            <xsl:if test="((not(preceding-sibling::Toxicities[ToxCategory=$lastToxCategory])) or (ToxName = 'Edema limbs') or (ToxName = 'Nausea'))">
                                                <td align="center" valign="middle" class="FormInsideTableLeftCell" style="border-bottom: none; border-top: solid 1px;">
                                                    <xsl:if test="((ToxCategory = 'General disorders and administration site conditions') and not(ToxName = 'Edema limbs'))">
                                                        <xsl:text disable-output-escaping="no">Const</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="((ToxCategory = 'Metabolism and nutrition disorders') or (ToxName = 'Chest pain - cardiac'))">
                                                        <xsl:text disable-output-escaping="no">&#160;</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="(ToxCategory = 'Skin and subcutaneous tissue disorders')">
                                                        <xsl:text disable-output-escaping="no">Skin</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="(ToxName = 'Mucositis oral')">
                                                        <xsl:text disable-output-escaping="no">ENMT</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="(ToxName = 'Edema limbs')">
                                                        <xsl:text disable-output-escaping="no">CV</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="((ToxCategory = 'Respiratory, thoracic and mediastinal disorders') and not(ToxName = 'Edema limbs'))">
                                                        <xsl:text disable-output-escaping="no">Resp</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="((ToxCategory = 'Cardiac disorders') and not(ToxName = 'Chest pain - cardiac'))">
                                                        <xsl:text disable-output-escaping="no">CV</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="((ToxCategory = 'Gastrointestinal disorders') and not(ToxName = 'Mucositis oral'))">
                                                        <xsl:text disable-output-escaping="no">GI</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="(ToxCategory = 'Nervous system disorders')">
                                                        <xsl:text disable-output-escaping="no">Neuro</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="(ToxCategory = 'Renal and urinary disorders')">
                                                        <xsl:text disable-output-escaping="no">GU</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="(ToxCategory = 'Reproductive system and breast disorders')">
                                                        <xsl:text disable-output-escaping="no">GU</xsl:text>
                                                    </xsl:if>
                                                    <xsl:if test="(ToxCategory != 'General disorders and administration site conditions' and ToxCategory != 'Metabolism and nutrition disorders' and ToxCategory != 'Skin and subcutaneous tissue disorders' and ToxCategory != 'Respiratory, thoracic and mediastinal disorders' and ToxCategory != 'Cardiac disorders' and ToxCategory != 'Gastrointestinal disorders' and ToxCategory != 'Nervous system disorders' and ToxCategory != 'Renal and urinary disorders' and ToxCategory != 'Reproductive system and breast disorders')">
                                                        <xsl:value-of select="ToxCategory"  />
                                                    </xsl:if>
                                                    &#160;
                                                </td>
                                            </xsl:if>
                                            <xsl:if test="((preceding-sibling::Toxicities[ToxCategory=$lastToxCategory]) and not(ToxName = 'Edema limbs') and not(ToxName = 'Nausea'))">
                                                <td align="center" valign="middle" class="FormInsideTableLeftCell" style="border-bottom: none;">
                                                    &#160;
                                                </td>
                                            </xsl:if>

                                            <td align="center" valign="middle" class="FormInsideTableRegCell" >
                                                <xsl:value-of select="ToxName"  />&#160;
                                            </td>
                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                <xsl:choose>
                                                    <xsl:when test="(ToxGrade='Abnormal')">
                                                        <strong>Abnormal</strong>
                                                    </xsl:when>
                                                    <xsl:when test="(ToxGrade='Not Done')">
                                                        <i>*Not Done*</i>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="ToxGrade"  />
                                                    </xsl:otherwise>
                                                </xsl:choose>&#160;
                                            </td>
                                            <td align="center" valign="middle"  class="FormInsideTableRegCell" >
                                                <xsl:value-of select="ToxDateText"  />&#160;
                                            </td>
                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                <xsl:value-of select="ToxStopDateText"  />&#160;
                                            </td>
                                            <td align="center" valign="middle" class="FormInsideTableRegCell" style="font-weight: bold; text-align: left;" >
                                                <!--                   <xsl:value-of select="ToxProbability"  />
                      <br/>
-->

                                                <!-- related record (attribution) -->
                                                <xsl:for-each select="RelatedRecords">
                                                    <xsl:for-each select="RelatedRecord">
                                                        <span style="font-size: 9px; font-weight: normal;">
                                                            <xsl:attribute name="title">
                                                                <xsl:value-of select="../@ScrTableName"/> (<xsl:value-of select="SortValue"/>)
                                                            </xsl:attribute>
                                                            &#8226; <xsl:value-of select="DisplayValue"  />

                                                            <span style="font-weight: bold;" >
                                                                <xsl:if test="(RelationStrength = '0')">(Unrelated)</xsl:if>
                                                                <xsl:if test="(RelationStrength = '1')">(Unlikely)</xsl:if>
                                                                <xsl:if test="(RelationStrength = '2')">(Possible)</xsl:if>
                                                                <xsl:if test="(RelationStrength = '3')">(Probable)</xsl:if>
                                                                <xsl:if test="(RelationStrength = '4')">(Definite)</xsl:if>

                                                            </span>
                                                            <br/>
                                                        </span>
                                                    </xsl:for-each>
                                                </xsl:for-each>


                                                <!--
                      <xsl:if test="RelatedRecords/@ScrTableName">
                          <span>
                              <xsl:attribute name="title">
                                  <xsl:text>Related to </xsl:text>
                                  <xsl:value-of select="RelatedRecords/@ScrTableName"/> (<xsl:value-of select="RelatedRecords[@ScrTableName]/RelatedRecord/SortValue"/>)
                              </xsl:attribute>
                              <xsl:value-of select="RelatedRecords[@ScrTableName]/RelatedRecord/RelationStrength"  />
                              <span style="font-size: 9px; font-weight: normal;" >(<xsl:value-of select="RelatedRecords[@ScrTableName]/RelatedRecord/DisplayValue"  />)</span>
                          </span>
                      </xsl:if>
                      -->


                                            </td>
                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                <xsl:value-of select="ToxIntervention"  />&#160;
                                            </td>
                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                <xsl:value-of select="ToxNotes"  />&#160;
                                            </td>
                                        </tr>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Toxicities','')">
                        <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>

<!--ROS Signature line-->
<xsl:template name="ROS_Signature">
    <tr> 
      <td class="FormOuterTableRow">&#160;<input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes"/> 
        <span class="blackBoldText"> PFSH and ROS performed by: ________________________________&#160;&#160;&#160;Date: ____/____/____ </span></td>
    </tr>
</xsl:template>

<!--Survey: match=Surveys-->
<xsl:template match="Encounters/Surveys" name="SurveysTable">
		<tr>
			<td class="FormOuterTableRow">
				<table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td align="center" valign="middle" class="FormInsideTableLeftCell"><strong>Question</strong></td>
					<td align="center" valign="middle" class="FormInsideTableRegCell"><strong>Response</strong></td>
				</tr>
					<xsl:for-each select="Surveys">
						<xsl:choose>
							<xsl:when test="((SurveyType != '') or (SurveyResult != ''))">
								<tr class="EFormTableRow">
									<td width="50%" align="left" valign="middle" class="FormInsideTableTopLeftCell" style="border-right: none; border-top: solid 1px #000000;">
										<!--Chooses the Survey Type-->
										<xsl:choose>
											<xsl:when test="(SurveyType != '')">
												<span class="blackBoldText"><img src="../../Images/shim.gif" width="4" height="1" /><xsl:value-of select="SurveyType"  />&#160;Survey</span>
											</xsl:when>
											<xsl:otherwise></xsl:otherwise>
										</xsl:choose>&#160;
										<!--Choose Survey Date Text-->
										<xsl:choose>
											<xsl:when test="(SurveyDateText != '')"> <span class="blackBoldText">
                        &#160;on&#160;<xsl:value-of select="SurveyDateText"  /></span></xsl:when>
											<xsl:otherwise></xsl:otherwise>  	
										</xsl:choose></td>
									<td width="50%" align="center" valign="middle" class="FormInsideTableTopCell"  style="border-right: none;  border-top: solid 1px #000000;">
									<!--Select overall Survey Result-->
										<xsl:choose>
											<xsl:when test="(SurveyResult != '')">
												<span><img src="../../Images/shim.gif" width="4" height="1" />Overall Result:&#160;<xsl:value-of select="SurveyResult"  />&#160;</span>
											</xsl:when>
											<xsl:otherwise></xsl:otherwise>
										</xsl:choose>&#160;</td>
								</tr>
							</xsl:when>
						</xsl:choose>
						<xsl:for-each select="SurveyItems">
							<xsl:choose>
								<xsl:when test="((SurveyItem != '') or (SurveyItemResult != ''))">
									<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Surveys',{./@RecordId})">
										<!--Survey Items-->
										<td align="left" valign="middle" class="FormInsideTableLeftCell"><img src="../../Images/shim.gif" width="4" height="1" /><xsl:value-of select="SurveyItem"  />&#160;</td>
										<!--Choose Survey Item results-->
										<td align="center" valign="middle" class="FormInsideTableRegCell"><img src="../../Images/shim.gif" width="4" height="1" />
										   <xsl:choose>
												<xsl:when test="(SurveyItemResult = '')"><strong>No Data</strong></xsl:when>
												<xsl:otherwise><xsl:value-of select="SurveyItemResult"  />&#160;</xsl:otherwise>
											</xsl:choose>
									   </td>
									</tr>
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						<!-- Choose Survey Notes-->
							<xsl:choose>
								<xsl:when test="(SurveyNotes !='')">
									<tr class="EFormTableRow">
										<td colspan="2" class="FormInsideTableLeftCell"><strong><img src="../../Images/shim.gif" width="4" height="1" />Notes:</strong>&#160;<xsl:value-of select="SurveyNotes"  /></td>
									</tr>
								</xsl:when>
								<xsl:otherwise></xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Surveys','')">	
						<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
					</tr>
				</table>
			</td>
		</tr>
</xsl:template>

<!--Template: Matches QOL_Therapy-->
<xsl:template match="QOL_Therapy" name="QOL_TherapyTable">
<tr>
	<td class="FormOuterTableRow">
			<table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td colspan="4"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Quality of Life Treatments</span></td>
				</tr>
				<tr class="EFormTableRow">
					<td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Start</strong></td>
					<td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Stop</strong></td>
					<td width="30%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Indication</strong></td>
					<td width="30%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Therapy</strong></td>
				</tr>
			<xsl:for-each select="QOL_Therapy">
				<xsl:choose>
					<xsl:when test="((QOL_TxDateText != '') or (QOL_TxStopDateText != '') or (QOL_TxIndication != '') or (QOL_Therapy != ''))">
						<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('QOL_Therapy',{./@RecordId})">		
							<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="QOL_TxDateText"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="QOL_TxStopDateText"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="QOL_TxIndication"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="QOL_Therapy"  />&#160;</td>
						</tr>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('QOL_Therapy','')">
				<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
			</tr>
		</table>
	</td>
</tr>
</xsl:template>

<!--Vital Signs: Match=Encounters-->
<xsl:template match="Encounters" name="VitalsTable">
	<tr>
	   <td class="FormOuterTableRow">
	   <a name="VitalSigns_Anchor"/>
		   <table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td colspan="8"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Vital Signs</span></td>
				</tr>
				<tr class="EFormTableRow">
					<td width="16%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Blood Pressure</strong></td>
					<td width="12%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Pulse</strong></td>
					<td width="12%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Temperature</strong></td>
					<td width="12%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Respirations</strong></td>
					<td width="14%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Height (cm)</strong></td>
					<td width="14%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Weight (kg)</strong></td>
					<td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>BSA</strong></td>
					<td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>KPS</strong></td>
				</tr>
			<xsl:for-each select="Encounters">
					<xsl:choose>
						<xsl:when test="((EncSystolic != '') or (EncDiastolic != '') or (EncPulse != '') or (EncTemp != '') or (EncRespiration != '') or (EncHeight != '') or (EncHeight != '') or (EncWeight != '') or (EncBSA != '') or (EncKPS != ''))">
							<tr class="EFormTableRow">
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncSystolic', 'VitalSigns')"><xsl:value-of select="EncSystolic"  /> / <xsl:value-of select="EncDiastolic"  /></td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncPulse', 'VitalSigns')"><xsl:value-of select="EncPulse"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncTemp', 'VitalSigns')"><xsl:value-of select="EncTemp"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncRespiration', 'VitalSigns')"><xsl:value-of select="EncRespiration"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncHeight', 'VitalSigns')"><xsl:value-of select="EncHeight"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncWeight', 'VitalSigns')"><xsl:value-of select="EncWeight"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBSA', 'VitalSigns')"><xsl:value-of select="EncBSA"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncKPS', 'VitalSigns')"><xsl:value-of select="EncKPS"  />&#160;</td>
							</tr>	
						</xsl:when>
						<xsl:otherwise>
						<tr class="EFormTableRow">
							<td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncSystolic', 'VitalSigns')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncPulse', 'VitalSigns')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncTemp', 'VitalSigns')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncRespiration', 'VitalSigns')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncHeight', 'VitalSigns')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncWeight', 'VitalSigns')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBSA', 'VitalSigns')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncKPS', 'VitalSigns')">&#160;</td>
						</tr>
					</xsl:otherwise>
					</xsl:choose>
			</xsl:for-each>
		</table>
	  </td>
	</tr>
</xsl:template>

  <!--Vital Signs2: Match=Encounters-->
  <xsl:template match="Encounters" name="VitalsTable2">
    <tr>
      <td class="FormOuterTableRow">
        <a name="VitalSigns2_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="8">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Vital Signs</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Blood Pressure</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Pulse</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Temperature</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Respirations</strong>
            </td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Height (cm)</strong>
            </td>
            <td width="14%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Weight (kg)</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>BSA</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>BMI</strong>
            </td>
          </tr>
          <xsl:for-each select="Encounters">
            <xsl:choose>
              <xsl:when test="((EncSystolic != '') or (EncDiastolic != '') or (EncPulse != '') or (EncTemp != '') or (EncRespiration != '') or (EncHeight != '') or (EncHeight != '') or (EncWeight != '') or (EncBSA != '') or (EncBMI != ''))">
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncSystolic', 'VitalSigns')">
                    <xsl:value-of select="EncSystolic"  /> / <xsl:value-of select="EncDiastolic"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncPulse', 'VitalSigns')">
                    <xsl:value-of select="EncPulse"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncTemp', 'VitalSigns')">
                    <xsl:value-of select="EncTemp"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncRespiration', 'VitalSigns')">
                    <xsl:value-of select="EncRespiration"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncHeight', 'VitalSigns')">
                    <xsl:value-of select="EncHeight"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncWeight', 'VitalSigns')">
                    <xsl:value-of select="EncWeight"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBSA', 'VitalSigns')">
                    <xsl:value-of select="EncBSA"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBMI', 'VitalSigns')">
                    <xsl:value-of select="EncBMI"  />&#160;
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncSystolic', 'VitalSigns')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncPulse', 'VitalSigns')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncTemp', 'VitalSigns')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncRespiration', 'VitalSigns')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncHeight', 'VitalSigns')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncWeight', 'VitalSigns')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBSA', 'VitalSigns')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBMI', 'VitalSigns')">&#160;</td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>
  
<!--BMI may be used in future forms
<xsl:template match="EncBMI" name="EncBMI">
   <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBMI', 'VitalSigns')"><xsl:value-of select="EncBMI"  />&#160;</td>
</xsl:template>-->

<!--Template: Physical Exam Matches EncExams-->
<xsl:template match="EncExams" name="ExamsTable">
	<tr>
	   <td class="FormOuterTableRow">
		 <a name="EncExams_Anchor"/>
		   <table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td colspan="5"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Physical Exam</span><img src="../../Images/shim.gif" border="0" width="65" height="1" />Clinician(s) Performing Exam:&#160;<xsl:call-template name="Exam_Clinician" /></td>
				</tr>
				<tr class="EFormTableRow">
					<td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>System</strong></td>
					<td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Exam</strong></td>
					<td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Result</strong></td>
					<td width="18%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Attending Performed</strong></td>
					<td width="37%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Notes</strong></td>
				</tr>
			<xsl:for-each select="Encounters/EncExams">
					<xsl:choose>
						<xsl:when test="((ExamSystem != '') or (Exam != '') or (ExamResult != '') or (ExamAttendingPerformed != '') or (ExamNotes != ''))">
              <xsl:variable name="lastExamSystem" select="ExamSystem"/>
              
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncExams',{./@RecordId})">
                  <xsl:if test="(not(preceding-sibling::EncExams[ExamSystem=$lastExamSystem]))">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell" style="border-top: solid 1px; border-bottom: none;"><xsl:value-of select="ExamSystem"  />&#160;</td>
                  </xsl:if>
                <xsl:if test="(preceding-sibling::EncExams[ExamSystem=$lastExamSystem])">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell" style="border-top: none; border-bottom: none;">&#160;</td>
                  </xsl:if>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Exam"  />&#160;</td>
								<!--Choose Exam Result and modify format of display-->
								<td align="center" valign="middle" class="FormInsideTableRegCell">
								   <xsl:choose>
											<xsl:when test="(ExamResult='Abnormal')"><strong>Abnormal</strong></xsl:when>
											<xsl:when test="(ExamResult='Not Done')"><i>*Not Done*</i></xsl:when>
											<xsl:otherwise><xsl:value-of select="ExamResult"  /></xsl:otherwise>
									</xsl:choose>&#160;</td>
								<!--Choose Yes for Attending performed and No for Attending did not Perform Exam-->
								<td align="center" valign="middle" class="FormInsideTableRegCell">
									<xsl:choose>
										<xsl:when test="(ExamAttendingPerformed = '1')"><strong>Yes</strong></xsl:when>
										<xsl:otherwise>No</xsl:otherwise>
									</xsl:choose>&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ExamNotes"  />&#160;</td>
							</tr>	
						</xsl:when>
					</xsl:choose>
			</xsl:for-each>
			<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncExams','')">
				<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
			</tr>
		</table>
	  </td>
	</tr>
</xsl:template>

  <!--Template: Physical Exam Matches EncExams-->
  <xsl:template match="EncExams" name="ExamsTable2">
    <tr>
      <td class="FormOuterTableRow">
        <a name="EncExams_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="5">
              <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Physical Exam</span><img src="../../Images/shim.gif" border="0" width="65" height="1" />
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>System</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Exam</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Result</strong>
            </td>
            <td width="18%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Attending Performed</strong>
            </td>
            <td width="37%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>
          <xsl:for-each select="Encounters/EncExams">
            <xsl:choose>
              <xsl:when test="((ExamSystem != '') or (Exam != '') or (ExamResult != '') or (ExamAttendingPerformed != '') or (ExamNotes != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncExams',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ExamSystem"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="Exam"  />&#160;
                  </td>
                  <!--Choose Exam Result and modify format of display-->
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:choose>
                      <xsl:when test="(ExamResult='Abnormal')">
                        <strong>Abnormal</strong>
                      </xsl:when>
                      <xsl:when test="(ExamResult='Not Done')">
                        <i>*Not Done*</i>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="ExamResult"  />
                      </xsl:otherwise>
                    </xsl:choose>&#160;
                  </td>
                  <!--Choose Yes for Attending performed and No for Attending did not Perform Exam-->
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:choose>
                      <xsl:when test="(ExamAttendingPerformed = '1')">
                        <strong>Yes</strong>
                      </xsl:when>
                      <xsl:otherwise>No</xsl:otherwise>
                    </xsl:choose>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ExamNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncExams','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  
  
<!--No Table data specify who performed the exam (Can be multiple)-->
<xsl:template name="Exam_Clinician">
	<!--NP/PA Performed Exam-->
		<span class="smallBlackText">
		   <xsl:for-each select="NoTable">
		   <xsl:choose>
				<xsl:when test="(Exam_Clinician_PANP='True')"><strong>NP/PA</strong></xsl:when>
			</xsl:choose>
		</xsl:for-each>&#160;
		<!--Fellow Performed Exam-->
		   <xsl:for-each select="NoTable">
		   <xsl:choose>
				<xsl:when test="(Exam_Clinician_Fellow='True')"><strong>Fellow</strong></xsl:when>
			</xsl:choose>
		</xsl:for-each>&#160;
		<!--Attending Performed Exam-->
		   <xsl:for-each select="NoTable">
		   <xsl:choose>
				<xsl:when test="(Exam_Clinician_Attending='True')"><strong>Attending</strong></xsl:when>
			</xsl:choose>
		</xsl:for-each>&#160;
   </span>
</xsl:template>

<!--Rectal Exam Findings: Match=EncRectalExamFindings-->
<xsl:template match="Encounters/EncRectalExams/EncRectalExamFindings" name="RectalExamTable">
	<tr>
	   <td class="FormOuterTableRow">
	    <a name="EncRectalExamFindings_Anchor"/>
		   <table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td colspan="5"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Rectal Exam</span><xsl:call-template name="RectalExamDetails" /></td>
				</tr>
				<tr class="EFormTableRow">
					<td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Side</strong></td>
					<!--<td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Laterality</strong></td>-->
					<td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Level</strong></td>
					<td width="30%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Result</strong></td>
					<td width="30%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Extension</strong></td>
				</tr>
			<xsl:for-each select="Encounters/EncRectalExams/EncRectalExamFindings">
					<xsl:choose>
						<xsl:when test="((DRE_FindSide != '') or (DRE_FindLaterality != '') or (DRE_FindLevel != '') or (DRE_FindResult != '') or (DRE_FindExtension != ''))">
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncRectalExamFindings',{./@RecordId})">
								<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="DRE_FindSide"  />&#160;</td>
								<!--<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DRE_FindLaterality"  />&#160;</td>-->
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DRE_FindLevel"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DRE_FindResult"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="DRE_FindExtension"  />&#160;</td>
							</tr>	
						</xsl:when>
					</xsl:choose>
			</xsl:for-each>
			<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncRectalExamFindings','')">
				<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
				<!--<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>-->
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
			</tr>
		</table>
	  </td>
	</tr>
</xsl:template>

<!--Rectal Exam Header: Displays overall details for the DRE including Stage, weight, etc...-->
<xsl:template match="Encounters/EncRectalExams" name="RectalExamDetails">
	<span>
	<!--Overall DRE Result, example: Empty Fossa or Normal-->
		<xsl:choose>
			<xsl:when test="(Encounters/EncRectalExams/DRE_Result !='')">
				<span><img src="../../Images/shim.gif" width="15" height="1" /><strong>Overall Result</strong>:&#160;<xsl:value-of select="Encounters/EncRectalExams/DRE_Result"  /></span>
			</xsl:when>
			<xsl:otherwise>&#160;</xsl:otherwise>
		</xsl:choose>
		<!--Clinical Stage based on DRE-->
        <xsl:choose>
            <xsl:when test="((ClinicalStages/ClinStageT !='') or (ClinicalStages/ClinStageN !='') or (ClinicalStages/ClinStageM !=''))">
                <span><img src="../../Images/shim.gif" width="15" height="1" /><strong>2002 Clinical Stage:&#160;</strong></span>
            </xsl:when>
            <xsl:otherwise>&#160;</xsl:otherwise>
        </xsl:choose>
		<xsl:choose>
			<xsl:when test="(ClinicalStages/ClinStageT !='')">
				<span style="font-weight: bold; margin-left: 6px;"><xsl:for-each select="ClinicalStages"><xsl:value-of select="ClinStageT"  /></xsl:for-each></span>
			</xsl:when>
		</xsl:choose>
        <xsl:choose>
            <xsl:when test="(ClinicalStages/ClinStageN !='')">
                <span style="font-weight: bold; margin-left: 6px;"><xsl:for-each select="ClinicalStages"><xsl:value-of select="ClinStageN"  /></xsl:for-each></span>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="(ClinicalStages/ClinStageM !='')">
                <span style="font-weight: bold; margin-left: 6px;"><xsl:for-each select="ClinicalStages"><xsl:value-of select="ClinStageM"  /></xsl:for-each></span>
            </xsl:when>
        </xsl:choose>
		<!--Prostate Induration Width-->
		<xsl:choose>
			<xsl:when test="(Encounters/EncRectalExams/DRE_IndWidth !='')">
				<span><img src="../../Images/shim.gif" width="15" height="1" />Prostate Width:&#160;<xsl:value-of select="Encounters/EncRectalExams/DRE_IndWidth"  /></span>
			</xsl:when>
			<xsl:otherwise>&#160;</xsl:otherwise>
		</xsl:choose>
		<!--Prostate Induration Length-->
		<xsl:choose>
			<xsl:when test="(Encounters/EncRectalExams/DRE_IndLength !='')">
				<span><img src="../../Images/shim.gif" width="15" height="1" />Prostate Length:&#160;<xsl:value-of select="Encounters/EncRectalExams/DRE_IndLength"  /></span>
			</xsl:when>
			<xsl:otherwise>&#160;</xsl:otherwise>
		</xsl:choose>
		<!--Prostate Weight-->
		<xsl:choose>
			<xsl:when test="(Encounters/EncRectalExams/DRE_ProstateWeight !='')">
				<span><img src="../../Images/shim.gif" width="15" height="1" />Prostate Weight:&#160;<xsl:value-of select="Encounters/EncRectalExams/DRE_ProstateWeight"  /></span>
			</xsl:when>
			<xsl:otherwise>&#160;</xsl:otherwise>
		</xsl:choose>
	</span>
</xsl:template>

<!--Status Template Match = Status-->
<xsl:template match="Encounters/Status" name="StatusTable">
	<tr>
	   <td class="FormOuterTableRow">
		   <table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td colspan="2"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Disease State</span></td>
				</tr>
					<xsl:choose>
						<xsl:when test="((StatusDateText != '') or (Status != ''))">
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Status','')">
								<td align="left" valign="middle" class="FormInsideTableTopLeftCell"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Date:&#160;<xsl:value-of select="Status/StatusDateText"  /></span><img src="../../Images/shim.gif" width="15" height="1" /><span class="blackBoldText">Status:&#160;<xsl:value-of select="Status/Status"  /></span>&#160;</td>
							</tr>	
						</xsl:when>
						<xsl:otherwise>
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Status','')">
								<td align="left" valign="middle"  class="FormInsideTableTopLeftCell"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Please Note: A change in the patient's Disease State has not been indicated.</span></td>
							</tr>
						</xsl:otherwise>
				</xsl:choose>
		</table>
	  </td>
	</tr>
</xsl:template>

<!--GU Follow-up Forms: HPI and Status combined in one Row-->
<xsl:template name="HPI_StatusTable">
	<tr>
		<td class="FormOuterTableRow">
			<table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
          <td width="70%" valign="top">
            <xsl:call-template name="GU_ProstateHpi"/>
          </td>
					<td width="30%" valign="top" class="FormInsideTableLeftCell"><xsl:call-template name="StatusTableGU"/></td>
				</tr>
			</table>
		</td>
	</tr>
</xsl:template>


    <!--GU Prostate HPI-->
    <xsl:template name="GU_ProstateHpi">
        <table class="EFormTable" cellspacing="0">
            <tr class="EFormTableRow">
                <td  style="text-align: left; vertical-align: top; padding-left: 4px;">
                    <span class="blackBoldText">HPI / Diagnosis / Stage</span>
                    <!--<xsl:value-of select="$GUProstateHpi" disable-output-escaping="yes"/>-->
                    <table border="0" cellpadding="0" cellspacing="0">
                        <xsl:variable name="Procedures"  select="Procedures"></xsl:variable>
                        <xsl:for-each select="$HPIItems/HPIGroup">


                            <xsl:choose>
                                <xsl:when test="(descendant::PriKey[1] != '')">
                                    <tr>
                                        <td style="vertical-align: top;">

                                            <xsl:value-of select="@HPIDate"/>
                                        </td>
                                        <td style="vertical-align: top;">
                                            <xsl:for-each select="HPI">
                                                <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadDataEntryForm('{Table}','{PriKey}','')">
                                                    <xsl:choose>
                                                        <xsl:when test="(EndDate != '')">
                                                            -<xsl:value-of select="EndDate" />
                                                        </xsl:when>
                                                    </xsl:choose>&#160;
                                                    <xsl:value-of select="Item" />
                                                </span>
                                                <xsl:if test="position() != last()">
                                                    <xsl:text>&#160;&#160;</xsl:text>
                                                </xsl:if>
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr>
                                        <td style="vertical-align: top;">
                                            <xsl:value-of select="@HPIDate"/>
                                        </td>
                                        <td style="vertical-align: top;">
                                            <xsl:for-each select="HPI">
                                                <xsl:variable name="ItemRecordId"  select="RecordId"></xsl:variable>
                                                <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('{Table}','{RecordId}')">
                                                    &#160;<xsl:value-of select="EndDate" />&#160;
                                                    <xsl:value-of select="Item" />

                                                    <xsl:if test="(Table = 'Procedures')">
                                                        <xsl:for-each select="$Procedures[@RecordId=$ItemRecordId]">
                                                            <xsl:for-each select="Pathology">
                                                                &#160;<xsl:value-of select="PathHistology" />
                                                                &#160;<xsl:value-of select="PathHistology2" />
                                                                <xsl:for-each select="//ProstatectomyPath">
                                                                    <xsl:if test="((PathGG1 != '') or (PathGG2 != ''))">
                                                                        &#160;<xsl:value-of select="PathGG1" />+<xsl:value-of select="PathGG2" />=<xsl:value-of select="PathGGS" />
                                                                    </xsl:if>
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                    </xsl:if>

                                                </span>
                                                <xsl:if test="position() != last()">
                                                    <xsl:text>&#160;&#160;</xsl:text>
                                                </xsl:if>
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </table>
                </td>
            </tr>
        </table>

    </xsl:template>

    <!--GU Status Tabel match=Status-->
    <xsl:template match="Status" name="StatusTableGU">
        <a name="Status_Anchor"/>
        <table class="EFormTable" cellspacing="0">
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Status','')">
                <td colspan="2">
                    <img src="../../Images/shim.gif" width="4" height="1" />
                    <span class="blackBoldText">Disease States</span>
                </td>
            </tr>
            <tr class="EFormTableRow">
                <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Date</strong>
                </td>
                <td width="70%" align="center" valign="middle" class="FormInsideTableTopCell">
                    <strong>Disease State</strong>
                </td>
            </tr>
            <!--Statuses from the database-->
            <xsl:value-of select="$GUProstateStatusParams" disable-output-escaping="yes"/>
            <xsl:for-each select="Status">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Status',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="StatusDateText"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="Status"  />&#160;
                    </td>
                </tr>
            </xsl:for-each>
        </table>

        <!-- sites of disease (from surveys) -->
        <xsl:for-each select="Surveys">
            <xsl:choose>
                <xsl:when test="(SurveyType = 'Prostate Sites of Disease')">

                    <table class="EFormTable" cellspacing="0" style="margin-top: 16px;">
                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SurveyItems','')">
                            <td colspan="2">
                                <img src="../../Images/shim.gif" width="4" height="1" />
                                <span class="blackBoldText">Known Sites of Disease</span>
                            </td>
                        </tr>
                        <tr class="EFormTableRow">
                            <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Site</strong>
                            </td>
                            <td width="60%" align="center" valign="middle" class="FormInsideTableTopCell">
                                <strong>Present/Absent</strong>
                            </td>
                        </tr>
                        <xsl:for-each select="SurveyItems">
                            <xsl:choose>
                                <xsl:when test="((SurveyItem != '') or (SurveyItemResult != ''))">
                                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})">
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">
                                            <xsl:value-of select="SurveyItem"  />&#160;
                                        </td>
                                        <td align="center" valign="middle" class="FormInsideTableRegCell">
                                            <xsl:value-of select="SurveyItemResult"  />&#160;
                                        </td>
                                    </tr>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                    </table>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>

    </xsl:template>


    <!--GU Current Treatment Information-->
<xsl:template match="NoTable" name="CurrentTreatment">

  <tr>
    <td class="FormOuterTableRow">
      <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
        <tr  >
          <td height="28" valign="middle" style="border-bottom: solid 1px #000000;"><strong>Last GnRH</strong>&#160;</td>
          <td height="20" valign="middle"  style="border-bottom: solid 1px #000000;"  class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('LastGnRHDateText', 'CurrentMedicalTherapy_GU')">Date: 
            <xsl:for-each select="NoTable"><xsl:choose><xsl:when test="(LastGnRHDateText != '')">
              <xsl:value-of select="LastGnRHDateText"  />&#160;
            </xsl:when>
              <xsl:otherwise>____\____\____</xsl:otherwise>
            </xsl:choose></xsl:for-each>
                </td>
          <td colspan="2" valign="middle"  style="border-bottom: solid 1px #000000;"  class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('LastGnRHAgent', 'CurrentMedicalTherapy_GU')">Agent: <xsl:for-each select="NoTable">
            <xsl:choose>
              <xsl:when test="(LastGnRHAgent != '')">
                <xsl:value-of select="LastGnRHAgent"  />&#160;
              </xsl:when>
              <xsl:otherwise>_______________________________</xsl:otherwise>
            </xsl:choose>
          </xsl:for-each> </td>
        </tr>
        <tr >
          <td height="28" valign="middle" style="border-bottom: solid 1px #000000;"><strong>Last Bisphosphonate</strong>&#160;</td>
          <td height="20" valign="middle"  style="border-bottom: solid 1px #000000;"  class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('LastBisphosphonateDateText', 'CurrentMedicalTherapy_GU')">
            Date:
            <xsl:for-each select="NoTable">
              <xsl:choose>
                <xsl:when test="(LastBisphosphonateDateText != '')">
                  <xsl:value-of select="LastBisphosphonateDateText"  />&#160;
                </xsl:when>
                <xsl:otherwise>____\____\____</xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </td>
          <td colspan="2" valign="middle"  style="border-bottom: solid 1px #000000;"  class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('LastBisphosphonateAgent', 'CurrentMedicalTherapy_GU')">
            Agent: <xsl:for-each select="NoTable">
              <xsl:choose>
                <xsl:when test="(LastBisphosphonateAgent != '')">
                  <xsl:value-of select="LastBisphosphonateAgent"  />&#160;
                </xsl:when>
                <xsl:otherwise>_______________________________</xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </td>
        </tr>

        

              <tr >
                      <td height="28" valign="middle"  style="border-right: solid 1px #999999; border-bottom: solid 1px #999999;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('CurrentMedTx_Agent', 'CurrentMedicalTherapy_GU')" >
                        Current TX<img src="../../Images/shim.gif" border="0" width="70" height="1" />
                        <xsl:for-each select="NoTable">
                          <xsl:choose>
                            <xsl:when test="(CurrentMedTx_Agent != '')">
                              <xsl:value-of select="CurrentMedTx_Agent"  />&#160;
                            </xsl:when>
                          </xsl:choose>
                        </xsl:for-each>
                        
                      </td>
                      <td valign="middle" style="border-right: solid 1px #999999; border-bottom: solid 1px #999999;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByField('CurrentMedTx_DateText', 'CurrentMedicalTherapy_GU')">Start Date&#160;&#160;<xsl:for-each select="NoTable">
                        <xsl:choose>
                          <xsl:when test="(CurrentMedTx_DateText != '')">
                            <xsl:value-of select="CurrentMedTx_DateText"  />&#160;
                          </xsl:when>
                          <xsl:otherwise>____\____\____</xsl:otherwise>
                        </xsl:choose>
                      </xsl:for-each>
                    </td>

                      
                      
                <td valign="middle" style="border-right: solid 1px #999999; border-bottom: solid 1px #999999;" class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('CurrentMedTx_CyclePerWeek', 'CurrentMedTx_CyclePerWeek')">
                  Cycle / Week
                  <xsl:for-each select="NoTable">
                  <xsl:choose>
                    <xsl:when test="(CurrentMedTx_CyclePerWeek != '')">
                      &#160;<xsl:value-of select="CurrentMedTx_CyclePerWeek"  />
                    </xsl:when>
                    <xsl:otherwise>
                      <img src="../../Images/shim.gif" border="0" width="70" height="1" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
                </td>
                <td valign="middle"  style="border-right: solid 1px #999999; border-bottom: solid 1px #999999;" class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('CurrentMedTx_ProtocolNum', 'CurrentMedTx_ProtocolNum')">
                  Protocol #&#160;
                  <xsl:for-each select="NoTable">
                  <xsl:choose>
                    <xsl:when test="(CurrentMedTx_ProtocolNum != '')">
                      <xsl:value-of select="CurrentMedTx_ProtocolNum"  />
                    </xsl:when>
                    <xsl:otherwise>
                      Y<img src="../../Images/shim.gif" border="0" width="6" height="0" />N<img src="../../Images/shim.gif" border="0" width="70" height="1" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
                </td>
              </tr>
      </table>
    </td>
  </tr>

</xsl:template>

<!--Problem-Plan Template Match = PatientProblems-->
<xsl:template match="Encounters/PatientProblems" name="ProblemPlanTable">
	<tr>
	   <td class="FormOuterTableRow">
	   <a name="PatientProblems_Anchor"/>
		   <table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td colspan="2"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Impression and Plan</span></td>
				</tr>
				<tr class="EFormTableRow">
					<td width="40%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Diagnosis / Problem List</strong></td>
					<td width="60%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Plan and Referrals</strong></td>
				</tr>
				<xsl:for-each select="PatientProblems">
					<xsl:choose>
						<xsl:when test="(ProblemName != '')">
								<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientProblems',{./@RecordId})">	
									<td class="FormInsideTableLeftCell" style="font-weight: bold; vertical-align: top; padding: 6px;"><xsl:value-of select="ProblemName"  /></td>
									<td class="FormInsideTableRegCell" style="vertical-align: top; padding: 6px;">
										<xsl:for-each select="ProblemPlans">
                      <xsl:choose>
                        <xsl:when test="PlanName != ''">
                          &#8226;&#160;<xsl:value-of select="PlanName"  /><br/>
                        </xsl:when>
                        <xsl:otherwise>
                          &#160;
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
									</td>
								</tr>
						</xsl:when>
						<!--<xsl:otherwise>
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientProblems','')">	
								<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
							</tr>
						</xsl:otherwise>-->
					</xsl:choose>
				</xsl:for-each>
         <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientProblems','')">
           <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
           <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
         </tr>

       </table>
	  </td>
	</tr>
</xsl:template>

  <!--Problem-Plan Template Match = PatientProblems-->
  <xsl:template match="Encounters/PatientProblems" name="ProblemPlanTable2">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientProblems_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="2">
              <span class="blackBoldText">Impression and Plan</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td  align="center" valign="middle" class="FormInsideTableTopLeftCell" colspan="2">
              <strong>Summary</strong>
            </td>
          </tr>
          <xsl:choose>
            <xsl:when test="(Encounters/EncNotes != '')">           
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('EncNotes', 'EncNotes')">
                <td width="100%" align="left" valign="top" style="padding: 5px" colspan="2">
                  <xsl:value-of select="Encounters/EncNotes"/>
                </td>
              </tr>
            </xsl:when>
            <xsl:otherwise>
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('EncNotes', 'EncNotes')">
                <td width="100%" align="left" valign="top" style="padding: 5px" colspan="2">&#160;</td>
              </tr>
            </xsl:otherwise>
          </xsl:choose>
          <br></br>

          <tr class="EFormTableRow">
            <td width="50%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Diagnosis / Problem List</strong>
            </td>
            <td width="50%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Plan and Referrals</strong>
            </td>
          </tr>
          <xsl:for-each select="PatientProblems">
            <xsl:choose>
              <xsl:when test="(ProblemName != '')">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientProblems',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ProblemName"  />
                  </td>
                  <td align="left" valign="middle" class="FormInsideTableRegCell">
                    <xsl:for-each select="ProblemPlans">
                      <xsl:choose>
                        <xsl:when test="PlanName != ''">
                          &#8226;&#160;<xsl:value-of select="PlanName"  />
                          <br/>
                        </xsl:when>
                        <xsl:otherwise>
                          &#160;
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                  </td>
                </tr>
              </xsl:when>
              <!--<xsl:otherwise>
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientProblems','')">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                </tr>
              </xsl:otherwise>-->
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientProblems','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  
  
<!--Template: Matches Encounter Notes-->
<xsl:template name="EncNotes">
	<xsl:choose>
		<xsl:when test="(Encounters/EncNotes != '')">
			<tr>
				<td  class="FormOuterTableRow">
				 <a name="EncNotes_Anchor"/>
					<table class="EFormTable" cellspacing="0">
						<tr class="EFormTableRow">
							<td width="100%" align="left" valign="top"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Notes</span></td>
						</tr>
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('EncNotes', 'EncNotes')">
              <td width="100%" align="left" valign="top" style="padding: 5px" colspan="2">
                <xsl:value-of select="Encounters/EncNotes"/>
              </td>
            </tr>
          </table>
				</td>
			</tr>
		</xsl:when>
		<xsl:otherwise>
			<tr>
				<td class="FormOuterTableRow">
					<table class="EFormTable" cellspacing="0">
						<tr class="EFormTableRow">
							<td width="100%" align="left" valign="top"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Notes</span></td>
						</tr>
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('EncNotes', 'EncNotes')">
              <td width="100%" align="left" valign="top" style="padding: 5px" colspan="2">&#160;</td>
            </tr>
					</table>
				</td>
			</tr>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<!--Template: Prescriptions: NoTable/Prescriptions-->
<xsl:template match="Encounters/NoTable" name="DispoPrescriptionsTable">
<tr>
	<td class="FormOuterTableRow">
		 <a name="Prescriptions_Anchor"/>
		<table class="EFormTable" cellspacing="0">
			<tr class="EFormTableRow">
				<td colspan="2"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Prescriptions</span></td>
			</tr>
			<tr class="EFormTableRow">
				<td width="50%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Prescription</strong></td>
				<td width="50%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>New or Refill</strong></td>
			</tr>
			<xsl:for-each select="NoTable/Prescriptions">
				<xsl:choose>
					<xsl:when test="((PrescriptionType != '') or (PrescriptionNewRefill != ''))">
						<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Prescriptions',{./@RecordId})">
							<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="PrescriptionType"  />&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="PrescriptionNewRefill"  />&#160;</td>
						</tr>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
			<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Prescriptions','')">	
				<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
				<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
			</tr>
		</table>
	</td>
</tr>
</xsl:template>

<!--Template: Protocol: NoTable/ProtocolNumber-->
<xsl:template match="Encounters/NoTable" name="DispoProtocolTable">
<tr>
	<td class="FormOuterTableRow">
	<a name="Protocols_Anchor"/>
		<table class="EFormTable" cellspacing="0">
			<tr class="EFormTableRow">
				<td colspan="2"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Protocol</span></td>
			</tr>
			<tr class="EFormTableRow">
				<td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Protocol Number</strong></td>
				<td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Protocol Considered</strong></td>
				<td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Protocol Consented</strong></td>
				<td width="25%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Protocol Registered</strong></td>
			</tr>
			<xsl:for-each select="NoTable">
					<xsl:choose>
						<xsl:when test="((ProtocolNumber != '') or (ProtocolConsidered != '') or (ProtocolConsentObtained != '') or (ProtocolRegistered != ''))">
							<tr class="EFormTableRow">
								<td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolNumber', 'Protocols')"><xsl:value-of select="ProtocolNumber"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolConsidered', 'Protocols')"><xsl:value-of select="ProtocolConsidered"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolConsentObtained', 'Protocols')"><xsl:value-of select="ProtocolConsentObtained"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolRegistered', 'Protocols')"><xsl:value-of select="ProtocolRegistered"  />&#160;</td>
						</tr>
						</xsl:when>
						<xsl:otherwise>
						<tr class="EFormTableRow">
							<td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolNumber', 'Protocols')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolConsidered', 'Protocols')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolConsentObtained', 'Protocols')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolRegistered', 'Protocols')">&#160;</td>
						</tr>
					</xsl:otherwise>
					</xsl:choose>
			</xsl:for-each>
		</table>
	  </td>
	</tr>
</xsl:template>

<!--Template: Attending Time: NoTable/Counseling-->
<xsl:template match="Encounters/NoTable" name="DispoAttendingTimeTable">
<tr>
	<td class="FormOuterTableRow">
	<a name="BillingDetails_Anchor"/>
		<table class="EFormTable" cellspacing="0">
			<tr class="EFormTableRow">
				<td colspan="2"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Billing Details</span></td>
			</tr>
			<tr class="EFormTableRow">
				<td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>&gt; 50% of Attending Time Counseling</strong></td>
				<td width="15%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Total Attending Time</strong></td>
				<td width="40%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Counseling Description</strong></td>
				<td width="13%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Level of Service</strong></td>
				<td width="12%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Dictated</strong></td>
			</tr>
			<xsl:for-each select="NoTable">
					<xsl:choose>
						<xsl:when test="((GreaterThan50PercentTimeInCounseling != '') or (TotalAttendingTime != '') or (CounselingDescription != '') or (LevelOfService != '') or (Dictated != ''))">
							<tr class="EFormTableRow">
								<td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('GreaterThan50PercentTimeInCounseling', 'BillingDetails')"><xsl:value-of select="GreaterThan50PercentTimeInCounseling"  />&#160;</td>
								<!--Choose attending time-->
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('TotalAttendingTime', 'BillingDetails')">
									<xsl:choose>
										<xsl:when test="(TotalAttendingTime = '3')">15-24 minutes</xsl:when>
										<xsl:when test="(TotalAttendingTime = '4')">25-39 minutes</xsl:when>
										<xsl:when test="(TotalAttendingTime = '5')">40+ minutes</xsl:when>
										<xsl:otherwise><xsl:value-of select="TotalAttendingTime"  />&#160;</xsl:otherwise>
									</xsl:choose>
								</td>
								<td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('CounselingDescription', 'BillingDetails')"><xsl:value-of select="CounselingDescription"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('LevelOfService', 'BillingDetails')"><xsl:value-of select="LevelOfService"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Dictated', 'BillingDetails')"><xsl:value-of select="Dictated"  />&#160;</td>
						</tr>
						</xsl:when>
						<xsl:otherwise>
						<tr class="EFormTableRow">
							<td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('GreaterThan50PercentTimeInCounseling', 'BillingDetails')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('TotalAttendingTime', 'BillingDetails')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('CounselingDescription', 'BillingDetails')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('LevelOfService', 'BillingDetails')">&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Dictated', 'BillingDetails')">&#160;</td>
						</tr>
					</xsl:otherwise>
					</xsl:choose>
			</xsl:for-each>
		</table>
	  </td>
	</tr>
</xsl:template>

<!--Signature for submission to Medical Records-->
<xsl:template name="ApprovalSignature">
    <tr> 
      <td class="FormOuterTableRow">
	 	 <table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr> 
            <td colspan="2"><img src="../../Images/shim.gif" border="0" width="4" height="1"/><span class="blackBoldText">Signatures</span></td>
          </tr>
		  <tr>
		  	<td align="left"><img src="../../Images/shim.gif" border="0" width="4" height="1"/><span class="blackBoldText">Fellow:</span>&#160;&#160;_____________________________________</td>
		  	<td align="left"><span class="blackBoldText">NP / PA:&#160;&#160;____________________________________</span></td>
		  </tr>
          <tr> 
            <td colspan="2"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="4" height="1"/>Attending Addendum:&#160;&#160;&#160;____________________________________________________________________<br/></span></td>
          </tr>
          <tr>
            <td colspan="2" align="left"><span class="blackBoldText"><img src="../../Images/shim.gif" border="0" width="136" height="1"/>____________________________________________________________________</span></td>
          </tr>
          <tr align="center"> 
            <td colspan="2">
			<table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr> 
                  <td>
                    I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.
                    <br/>
                    <img src="../../Images/shim.gif" border="0" width="1" height="15" /><br/>
                    <span class="blackBoldText">
                      MD / Attending: ________________________________________________ <img src="../../Images/shim.gif" border="0" width="24" height="1" />Date:____/____/____
                    </span></td>
				</tr>
				<tr>
					<td align="center"><span class="blackBoldTextSmall">**Please verify that the service date is printed on each page**</span></td>
                </tr>
              </table>
			 </td>
          </tr>
        </table>
		</td>
    </tr>
</xsl:template>

  <!--Signature for submission to Medical Records-->
  <xsl:template name="ApprovalSignature2">
    <tr>
      <td class="FormOuterTableRow">
        <table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td colspan="2">
              <img src="../../Images/shim.gif" border="0" width="4" height="1"/>
              <span class="blackBoldText">Signatures</span>
            </td>
          </tr>
          <tr>
            <td align="left">
              <img src="../../Images/shim.gif" border="0" width="4" height="1"/><span class="blackBoldText">Resident:</span>&#160;&#160;_____________________________________
            </td>
          </tr>
          <tr align="center">
            <td colspan="2">
              <table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                <tr>
                  <td>
                    <img src="../../Images/shim.gif" border="0" width="1" height="15" /><br/>
                    <span class="blackBoldText">
                      MD / Attending: ________________________________________________ <img src="../../Images/shim.gif" border="0" width="24" height="1" />Date:____/____/____
                    </span>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  
<!--<xsl:template name="Footer">
	<tr class="FormOuterTableRow">
		<td height="14" align="center" valign="bottom" class="blackBoldText">GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/>
		<img src="../../Images/shim.gif" border="0" width="45" height="8" />
		<xsl:choose>
			<xsl:when test="($RevisedDate != '')">rev:<xsl:value-of select="$RevisedDate"/></xsl:when>
			<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
		</xsl:choose>
		<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page 1 of 4<img src="../../Images/shim.gif" border="0" width="45" height="1" />B/02.070.<span class="blackBoldTextSmall"><xsl:value-of select="$DocNumber"/></span></td>
	</tr>
</xsl:template>

<xsl:template name="Footer_Revised">
	<tr class="FormOuterTableRow">
		<td height="14" align="center" valign="bottom" class="blackBoldText">GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/>
		<img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />Page 1 of 4<img src="../../Images/shim.gif" border="0" width="45" height="1" />B/02.070.<span class="blackBoldTextSmall"><xsl:value-of select="$DocNumber"/></span></td>
	</tr>
</xsl:template>-->

<!--Templates utilized in Surgery eForms-->

<!--Date and Physician Row on Surgery Forms-->
<xsl:template name="SurgeryDatePhysician">
	<tr>
		<td  class="FormOuterTableRow">
			<a name="DatePhysician_Anchor"/>
			<table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td width="50%" height="10" align="left" valign="bottom" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('OpDateText','DatePhysician_Anchor')">
						<img src="../../Images/shim.gif" width="4" height="1" />
						<span class="blackBoldText">Surgery Date</span>:&#160;<xsl:value-of select="OperatingRoomDetails/OpDateText"/>
					</td>
					<td width="50%" align="left" valign="bottom" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('OpCaseSurgeon','DatePhysician_Anchor')">
						<img src="../../Images/shim.gif" width="4" height="1" />
						<span class="blackBoldText">Case Surgeon</span>:&#160;<xsl:value-of select="OperatingRoomDetails/OpCaseSurgeon"/>
					</td>
				</tr>
			</table>		
		</td>				
	</tr>
</xsl:template>

<!-- Anesthesia Row -->
<xsl:template name="Anesthesia">
	<tr>
		<td class="FormOuterTableRow">
			<a name="Anesthesia_Anchor"/>
			<table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td colspan="2" align="left"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Anesthesia</span></td>
				</tr>
				<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'">
					<td width="30%" height="20" align="left" onclick="LoadComponentByField('OpASA','Anesthesia_Anchor')">
						<img src="../../Images/shim.gif" width="4" height="1" /><span>ASA Score: <xsl:value-of select="OperatingRoomDetails/OpASA"/></span>
					</td>
					<td width="70%" align="left" onclick="LoadComponentByField('OpAnesthesiaType','Anesthesia_Anchor')">
						<span class="Box" style="width: 150px;">
							Anesthesia Type:
							<img src="../../Images/shim.gif" width="3" height="1" />
							<xsl:value-of select="OperatingRoomDetails/OpAnesthesiaType"/>
						</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</xsl:template>

<!-- Procedures section -->
<xsl:template name="ProceduresList">
	<tr>
		<td class="FormOuterTableRow">
			<a name="Procedures_Anchor"/>
			<a name="ProcProstatectomiesOp_Anchor"/>
			<table class="EFormTable" cellspacing="0">
				<tr class="EFormTableRow">
					<td colspan="6" align="left">
						<img src="../../Images/shim.gif" width="4" height="1" />
						<span class="blackBoldText">Nature of Operation: Prostatectomy &amp; Ancillary Procedures</span>
					</td>
				</tr>
				<tr class="EFormTableRow">
					<td width="28%" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Procedure</strong></td>
					<td width="12%" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Surgeon</strong></td>
					<td width="12%" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Surgeon Type</strong></td>
					<td width="12%" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Assistant</strong></td>
					<td width="12%" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Assistant Type</strong></td>
					<td width="20%" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Notes</strong></td>
				</tr>
<!--			since they are all in procedures table now, still need this?
				<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTableAndFields('ProcProstatectomiesOp','OpType,OpSurgeon,OpSurgeonType,OpAssistant,OpAssistantType,OpNotes','ProcProstatectomiesOp')">
					<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="Procedures/ProcName"/>&#160;</td>
					<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProcSurgeon"/>&#160;</td>
					<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProcSurgeonType"/>&#160;</td>
					<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProcAssistant"/>&#160;</td>
					<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProcAssistantType"/>&#160;</td>
					<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProcNotes"/>&#160;</td>
				</tr>
-->				
				<xsl:variable name="ns_surgeon" select="NoTable/NeuralStimulationSurgeon"/>
				<xsl:variable name="ns_surgeon_type" select="NoTable/NeuralStimulationSurgeonType"/>
				<xsl:variable name="ns_assistant" select="NoTable/NeuralStimulationAssistant"/>
				<xsl:variable name="ns_assistant_type" select="NoTable/NeuralStimulationAssistantType"/>
				<xsl:variable name="ns_notes" select="NoTable/NeuralStimulationNotes"/>
				<!-- Neural Stimulation -->
				<xsl:choose>
					<xsl:when test="($ns_surgeon != '') or ($ns_surgeon_type != '') or ($ns_assistant != '') or ($ns_assistant_type != '') or ($ns_notes != '')">
						<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTableAndFields('NoTable','NeuralStimulationSurgeon,NeuralStimulationSurgeonType,NeuralStimulationAssistant,NeuralStimulationAssistantType,Notes','ProcProstatectomiesOp')">
							<td align="center" valign="middle" class="FormInsideTableLeftCell">Neural Stimulation</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="NoTable/NeuralStimulationSurgeon"/>&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="NoTable/NeuralStimulationSurgeonType"/>&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="NoTable/NeuralStimulationAssistant"/>&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="NoTable/NeuralStimulationAssistantType"/>&#160;</td>
							<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="NoTable/NeuralStimulationNotes"/>&#160;</td>
						</tr>
					</xsl:when>
				</xsl:choose>
				
				<xsl:for-each select="Procedures">
          <xsl:choose>
          <xsl:when test="((ProcName != '') or (ProcSurgeon != '') or (ProcSurgeonType != '') or (ProcAssistant != '') or (ProcAssistantType != '') or (ProcNotes != ''))">
					<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
						<td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="ProcName"/>&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcSurgeon"/>&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcSurgeonType"/>&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcAssistant"/>&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcAssistantType"/>&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcNotes"/>&#160;</td>
					</tr>
          </xsl:when>
          </xsl:choose>
				</xsl:for-each>
        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures','')">
          <td class="FormInsideTableLeftCell">&#160;</td>
          <td class="FormInsideTableRegCell">&#160;</td>
          <td class="FormInsideTableRegCell">&#160;</td>
          <td class="FormInsideTableRegCell">&#160;</td>
          <td class="FormInsideTableRegCell">&#160;</td>
          <td class="FormInsideTableRegCell">&#160;</td>
        </tr>
      </table>
    </td>
	</tr>
</xsl:template>

<!-- Prostatectomy Details section -->
<xsl:template name="ProstatectomyDetails">
	<tr>
		<td class="FormOuterTableRow">
			<table class="EFormTable" cellspacing="0" cellpadding="2">
				<tr class="EFormTableRow">
					<td colspan="3" align="left" height="25"><!-- 3 columns to support last row of subsections -->
						<a name="OpClinStageT_Anchor"/>
						<table cellspacing="0" cellpadding="0" height="100%">
							<tr>
								<td valign="top">
									<img src="../../Images/shim.gif" width="4" height="1" />
									<span class="blackBoldText">Prostatectomy Details</span>
								</td>
								<td><img src="../../Images/shim.gif" width="150" height="1"/></td>
								<td valign="bottom" onmouseover="this.className='chronListHilighted';" onmouseout="this.className=''" onclick="LoadComponentByField('ProcStageT','ProstateTStage')">
									<span class="Box" style="width: 135px;">
										<strong>UICC2002 T Stage</strong>:
										<img src="../../Images/shim.gif" width="3" height="1" />
										<xsl:value-of select="Procedures/ProstatectomyProc/ProcStageT"/>
									</span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="left">
						<!-- Intraop Prost. Exam subsection -->
						<xsl:call-template name="IntraopProstateExam"/>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="left">
						<!-- Accessory Vessels subsection -->
						<xsl:call-template name="AccessoryVessels"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- Neurovascular Bundles subsection -->
						<xsl:call-template name="NeurovascularBundles"/>
					</td>
					<td rowspan="2" valign="top" width="30%">
						<!-- Vesicourethral Anastomosis subscection -->
						<xsl:call-template name="VesicoAnastomosis"/>
					</td>
				</tr>
				<tr>
					<td width="35%" align="center">
						<!-- Cavermap subsection -->
						<xsl:call-template name="Cavermap"/>
						<br/>
						<xsl:call-template name="CatheterOnTraction"/>
					</td>
					<td width="35%" align="center">
						<!-- Difficulty and Prediction subsections -->
						<xsl:call-template name="SurgeryDifficulty"/>
						<br/>
						<xsl:call-template name="PostOpPrediction"/>
						<br/>
						<xsl:call-template name="Drains"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</xsl:template>

<!-- Prost. Details subsections -->

<!-- IntraOp Prostate Exam subsesction -->
<xsl:template name="IntraopProstateExam">
	<table class="EFormTable" cellspacing="0">
		<tr class="EFormTableRow">
			<td colspan="8" align="left">
				<strong>Intraoperative Prostate Exam</strong>
			</td>
			<td align="center" valign="middle" style="border-right: 1px solid #999999;">
				&#160;
			</td>
			<td align="center" valign="middle" style="border-top: 1px solid #999999; border-left: 0px solid #999999; border-right: 1px solid #999999;">
				<strong>Additional&#160;Tissue</strong>
			</td>
		</tr>
		<tr class="EFormTableRow">
			<td align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Side</strong></td>
			<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Level</strong></td>
			<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>A/P</strong></td>
			<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Lat/Med</strong></td>
			<td align="center" valign="middle"><img src="../../Images/shim.gif" width="10" height="1" /></td>
			<td align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Cancer</strong></td>
			<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>ECE</strong></td>
			<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>+SM</strong></td>
			<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>FS Result</strong></td>
			<td align="center" valign="middle" style="border-bottom: 1px solid #999999; border-left: 0px solid #999999; border-right: 1px solid #999999;"><strong>Resected</strong></td>
		</tr>
		<xsl:for-each select="Procedures/ProstatectomyProcFinding">
      <xsl:choose>
        <xsl:when test="((ProcFindSide != '') or (ProcFindLevel != '') or (ProcFindAP != '') or (ProcFindLaterality != '') or (ProcFindCancer != '') or (ProcFindExtension != '') or (ProcFindMargin != '') or (ProcFindFrozen != '') or (ProcFindAddTissue != ''))">
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('ProstatectomyProcFinding',{./@RecordId})">
            <td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="ProcFindSide"/>&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcFindLevel"/>&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcFindAP"/>&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcFindLaterality"/>&#160;</td>
            <td align="center" valign="middle"><img src="../../Images/shim.gif" width="10" height="1" /></td>
            <td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="ProcFindCancer"/>&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcFindExtension"/>&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcFindMargin"/>&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcFindFrozen"/>&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcFindAddTissue"/>&#160;</td>
          </tr>
        </xsl:when>
      </xsl:choose>
		</xsl:for-each>
    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('ProstatectomyProcFinding','')">
      <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      <td align="center" valign="middle"><img src="../../Images/shim.gif" width="10" height="1" /></td>
      <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
    </tr>
  </table>
</xsl:template>

<!-- Accessory Vessels subsection -->
<xsl:template name="AccessoryVessels">
	<a name="AccessoryVessels_Anchor"/>
	<table class="EFormTable" cellspacing="0" border="0">
		<tr class="EFormTableRow">
			<td width="40%" rowspan="2">
				<table class="EFormTable" cellspacing="0">
					<tr class="EFormTableRow">
						<td colspan="4" align="left" onmouseover="this.className='chronListHilighted';" onmouseout="this.className=''" onclick="LoadComponentByField('ProcAV_Preserved','AccessoryVessels')">
							<span>
								<strong>Accessory Vessels:</strong>
								<img src="../../Images/shim.gif" width="10" height="1" />
								<span><xsl:value-of select="Procedures/ProstatectomyProc/ProcAV_Preserved"/></span>
							</span>
						</td>
					</tr>
					<tr class="EFormTableRow">
						<td align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Side</strong></td>
						<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Location</strong></td>
						<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Size</strong></td>
						<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Preserved</strong></td>
					</tr>
					<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTableAndFields('ProstatectomyProc','ProcL_AV_Site,ProcL_AV_Diam,ProcAV_Preserved','AccessoryVessels')">
						<td align="center" valign="middle" class="FormInsideTableLeftCell">Right</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcR_AV_Site"/>&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcR_AV_Diam"/>&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcAV_Preserved"/>&#160;</td>
					</tr>
					<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTableAndFields('ProstatectomyProc','ProcR_AV_Site,ProcR_AV_Diam,ProcAV_Preserved','AccessoryVessels')">
						<td align="center" valign="middle" class="FormInsideTableLeftCell">Left</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcL_AV_Site"/>&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcL_AV_Diam"/>&#160;</td>
						<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcAV_Preserved"/>&#160;</td>
					</tr>
				</table>
			</td>
			<td colspan="2" align="center">
        <span style="width: 300px; border: solid 1px #cccccc;" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('OpNotes','AdditionalComments')"><img src="../../Images/shim.gif" width="3" height="1" />Surgery Notes:<img src="../../Images/shim.gif" width="3" height="1" /><xsl:value-of select="OperatingRoomDetails/OpNotes"/>&#160;</span>
			</td>
		</tr>
		<tr class="EFormTableRow">
			<td align="center" valign="bottom" colspan="3">

        <table cellpadding="5" cellspacing="0" border="0">
          <tr>
            <td style="border: solid 1px #cccccc;"  onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcSV_DissectFirst','AccessoryVessels')">

              1st Dissection of SV:<img src="../../Images/shim.gif" width="10" height="1" /><span><xsl:value-of select="Procedures/ProstatectomyProc/ProcSV_DissectFirst"/></span>
              
            </td>
            <td style="border: solid 1px #cccccc;" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcApproach','ProstatectomyApproach')">

              Approach:<img src="../../Images/shim.gif" width="10" height="1" /><span><xsl:value-of select="Procedures/ProcApproach"/></span>

            </td>
          </tr>
          <tr>
            <td style="border: solid 1px #cccccc;" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcBulldogClamps','AccessoryVessels')">

              Bulldog Clamps:<img src="../../Images/shim.gif" width="5" height="1" /><span><xsl:value-of select="Procedures/ProstatectomyProc/ProcBulldogClamps"/></span>

            </td>
            <td style="border: solid 1px #cccccc;" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcPeriprostaticVeins','PeriprostaticVeins')">

              Periprostatic Veins:<img src="../../Images/shim.gif" width="5" height="1" /><span><xsl:value-of select="Procedures/ProstatectomyProc/ProcPeriprostaticVeins"/></span>
            </td>
          </tr>
        </table>

      </td>
		</tr>
	</table>
</xsl:template>

<!-- NV Bundles subsection -->
<xsl:template name="NeurovascularBundles">
	<table class="EFormTable" cellspacing="0">
		<tr class="EFormTableRow">
			<td colspan="10"><strong>Neurovascular Bundles</strong></td>
		</tr>
		<tr class="EFormTableRow">
			<td rowspan="2" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Side</strong></td>
			<td rowspan="2" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Visual Status</strong></td>
			<td colspan="2" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Doppler Probe</strong></td>
			<td rowspan="2" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Graft</strong></td>
			<td rowspan="2" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Donor Site</strong></td>
			<td rowspan="2" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Graft<br/>Quality</strong></td>
			<td rowspan="2" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Dissection<br/>Type</strong></td>
		</tr>
		<tr class="EFormTableRow">
			<td align="center" valign="middle" class="FormInsideTableRegCell">Status</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell">Vis. Assessment</td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTableAndFields('ProstatectomyProc','ProcR_NVB_Status,ProcR_DopplerStatus,ProcR_DopplerVA,ProcR_NVB_Graft,ProcR_NVB_Donor,ProcR_NVB_Quality','AcessoryVessels')">
			<td width="7%" align="center" valign="middle" class="FormInsideTableLeftCell">Right</td>
			<td width="20%" align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcR_NVB_Status"/>&#160;</td>
			<td width="8%" align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcR_DopplerStatus"/>&#160;</td>
			<td width="20%" align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcR_DopplerVA"/>&#160;</td>
			<td width="10%" align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcR_NVB_Graft"/>&#160;</td>
			<td width="16%" align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcR_NVB_Donor"/>&#160;</td>
			<td width="9%" align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcR_NVB_Quality"/>&#160;</td>
			<td width="10%" align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcR_NVB_DissectionType"/>&#160;</td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTableAndFields('ProstatectomyProc','ProcL_NVB_Status,ProcL_DopplerStatus,ProcL_DopplerVA,ProcL_NVB_Graft,ProcL_NVB_Donor,ProcL_NVB_Quality','AcessoryVessels')">
			<td align="center" valign="middle" class="FormInsideTableLeftCell">Left</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcL_NVB_Status"/>&#160;</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcL_DopplerStatus"/>&#160;</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcL_DopplerVA"/>&#160;</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcL_NVB_Graft"/>&#160;</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcL_NVB_Donor"/>&#160;</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcL_NVB_Quality"/>&#160;</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcL_NVB_DissectionType"/>&#160;</td>
		</tr>
	</table>
</xsl:template>

<xsl:template name="Cavermap">
	<a name="ProcNeuralStimulations_Anchor"/>
	<table class="EFormTable" cellspacing="0">
		<tr class="EFormTableRow">
			<td colspan="4"><strong>Cavermap</strong></td>
		</tr>
		<tr class="EFormTableRow">
			<td align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Side</strong></td>
			<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Site</strong></td>
			<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Max Response</strong></td>
			<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>mA</strong></td>
		</tr>

		<xsl:for-each select="Procedures/NeuralStimulationProcFinding">
      <xsl:choose>
        <xsl:when test="((ProcFindSide != '') or (ProcFindSite != '') or (ProcFindMovement != '') or (ProcFindmA != ''))">
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('NeuralStimulationProcFinding','{./@RecordId}')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell"><xsl:value-of select="ProcFindSide"/>&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcFindSite"/>&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcFindMovement"/>&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="ProcFindmA"/>&#160;</td>
          </tr>
        </xsl:when>
      </xsl:choose>
		</xsl:for-each>
    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('NeuralStimulationProcFinding','')">
      <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
    </tr>
  </table>
</xsl:template>

<!-- Surgery Difficulty subsection -->
<xsl:template name="SurgeryDifficulty">
	<a name="SurgeryDifficulty_Anchor"/>
	<span onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('OpDifficulty','OverallSurgeryDifficulty')">
		Overall Surgery Difficulty:<img src="../../Images/shim.gif" width="5" height="1" /><xsl:value-of select="OperatingRoomDetails/OpDifficulty"/>&#160;</span>
</xsl:template>

<!-- Post Op Prediction subsection -->
<xsl:template name="PostOpPrediction">
	<a name="PostOpPrediction_Anchor"/>
	<table class="EFormTable" cellspacing="0">

    <xsl:for-each select="Surveys">
      <xsl:choose>
        <xsl:when test="((SurveyType != '') or (SurveyResult != ''))">
          <tr class="EFormTableRow">
            <td colspan="2"  align="left" valign="middle" class="FormInsideTableTopLeftCell">
              <!--Chooses the Survey Type-->
              <xsl:choose>
                <xsl:when test="(SurveyType != '')">
                  <span class="blackBoldText">
                    <img src="../../Images/shim.gif" width="4" height="1" /><xsl:value-of select="SurveyType"  />&#160;
                  </span>
                </xsl:when>
                <xsl:otherwise></xsl:otherwise>
              </xsl:choose>&#160;
              <!--Choose Survey Date Text-->
              <xsl:choose>
                <xsl:when test="(SurveyDateText != '')">
                  <span class="blackBoldText">
                    &#160;on&#160;<xsl:value-of select="SurveyDateText"  />
                  </span>
                </xsl:when>
                <xsl:otherwise></xsl:otherwise>
              </xsl:choose>
            </td>

          </tr>
        </xsl:when>
      </xsl:choose>
      <xsl:for-each select="SurveyItems">
        <xsl:choose>
          <xsl:when test="((SurveyItem != '') or (SurveyItemResult != ''))">
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Surveys',{./@RecordId})">
              <!--Survey Items-->
              <td align="left" valign="middle" class="FormInsideTableLeftCell">
                <xsl:value-of select="SurveyItem"  />&#160;
              </td>
              <!--Choose Survey Item results-->
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <img src="../../Images/shim.gif" width="4" height="1" />
                <xsl:choose>
                  <xsl:when test="(SurveyItemResult = '')">
                    <strong>No Data</strong>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="SurveyItemResult"  />&#160;
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </xsl:when>
          <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>

    </xsl:for-each>
    
    
    
    


  </table>
</xsl:template>

<!-- Drains subsection -->
<xsl:template name="Drains">
	<a name="Drains_Anchor"/>
	<table class="EFormTable" cellspacing="0">
		<tr class="EFormTableRow">
			<td colspan="2"><strong>Drains</strong></td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('ProcL_Drain','Drains')">
			<td width="60%" align="right" valign="middle" class="FormInsideTableTopLeftCell">Left Drain</td>
			<td width="40%" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><xsl:value-of select="Procedures/ProstatectomyProc/ProcL_Drain"/>&#160;</td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('ProcR_Drain','Drains')">
			<td align="right" valign="middle" class="FormInsideTableLeftCell">Right Drain</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcR_Drain"/>&#160;</td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('ProcAnteriorDrain','Drains')">
			<td align="right" valign="middle" class="FormInsideTableLeftCell">Anterior Drain</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcAnteriorDrain"/>&#160;</td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('ProcPosteriorDrain','Drains')">
			<td align="right" valign="middle" class="FormInsideTableLeftCell">Posterior Drain</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcPosteriorDrain"/>&#160;</td>
		</tr>
	</table>
</xsl:template>

<!-- Catheter On Traction subsection -->
<xsl:template name="CatheterOnTraction">
	<a name="CatheterOnTraction_Anchor"/>
	<table class="FormInsideTableTopLeftCell" cellspacing="0">
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('ProcCathTraction','CatheterOnTraction')">
			<td colspan="2" valign="middle"><strong>Catheter on Traction?</strong>&#160;&#160;&#160;<xsl:value-of select="Procedures/ProstatectomyProc/ProcCathTraction"/>
      </td>
		</tr>
	</table>
</xsl:template>

<!-- Vesciourethral Anastomosis subsection -->
<xsl:template name="VesicoAnastomosis">
	<a name="VesicoAnastomosis_Anchor"/>
	<table class="EFormTable" cellspacing="0">
		<tr colspan="2"><strong>Vesicourethral Anastomosis</strong></tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcAnastQuality','VesicourethralAnastamosis')">
			<td width="80%" align="right" valign="middle" class="FormInsideTableTopLeftCell">Quality (surgeon's judgment)</td>
			<td width="20%" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><xsl:value-of select="Procedures/ProstatectomyProc/ProcAnastQuality"/>&#160;</td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcAnastNumSutures','VesicourethralAnastamosis')">
			<td align="right" valign="middle" class="FormInsideTableLeftCell">Number Sutures</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcAnastNumSutures"/>&#160;</td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('OpAnastSuturePattern','VesicourethralAnastamosis')">
			<td align="right" valign="middle" class="FormInsideTableLeftCell">Suture Pattern</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcAnastSuturePattern"/>&#160;</td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcBN_Diam','VesicourethralAnastamosis')">
			<td align="right" valign="middle" class="FormInsideTableLeftCell">Diameter of bladder neck</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcBN_Diam"/>&#160;</td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcBN_DegreeEversion','VesicourethralAnastamosis')">
			<td align="right" valign="middle" class="FormInsideTableLeftCell">Mucosal eversion</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcBN_DegreeEversion"/>&#160;</td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcSuspVeinComplex','VesicourethralAnastamosis')">
			<td align="right" valign="middle" class="FormInsideTableLeftCell">Suspension of<br/>Venous Complex</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcSuspVeinComplex"/>&#160;</td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcBladderNeckPreservation','VesicourethralAnastamosis')">
			<td align="right" valign="middle" class="FormInsideTableLeftCell">Bladder Neck Preservation</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcBladderNeckPreservation"/>&#160;</td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcUrethralStumpScore','VesicourethralAnastamosis')">
			<td align="right" valign="middle" class="FormInsideTableLeftCell">Subjective Score of<br/>Urethral Stump</td>
			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcUrethralStumpScore"/>&#160;</td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByTableAndFields('ProstatectomyProc','OpBladderClosureLocation,ProcBladderClosure','VesicourethralAnastamosis')">
			<td align="right" valign="middle" class="FormInsideTableLeftCell">Bladder Closure
			</td>
			<td align="center" valign="top" class="FormInsideTableRegCell"><xsl:value-of select="Procedures/ProstatectomyProc/ProcBladderClosure"/>&#160;</td>
		</tr>
    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcAnastWatertight','VesicourethralAnastamosis')">
      <td align="right" valign="middle" class="FormInsideTableLeftCell">Anastamosis Watertight</td>
      <td align="center" valign="middle" class="FormInsideTableRegCell">
        <xsl:value-of select="Procedures/ProstatectomyProc/ProcAnastWatertight"/>&#160;
      </td>
    </tr>
		<tr>
			<td colspan="2"><img src="../../Images/shim.gif" width="5" height="1" /></td>
		</tr>
		<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('ProcAnastSutureNotes','VesicourethralAnastamosis')">
			<td colspan="2" align="center" valign="middle" class="Box" >
				Anastamosis Notes:
				<br/>
					<xsl:value-of select="Procedures/ProstatectomyProc/ProcAnastSutureNotes"/>&#160;
				
			</td>
		</tr>
	</table>
</xsl:template>

<!-- Surgical Details / Fluids -->
<xsl:template name="SurgicalDetailsFluids">
	<tr>
		<td class="FormOuterTableRow">
			<a name="SurgicalDetailsFluids_Anchor"/>
			<table class="EFormTable" cellspacing="0" cellpadding="2">
				<tr class="EFormTableRow">
					<td valign="top">
						<img src="../../Images/shim.gif" width="4" height="1" />
						<span class="blackBoldText">Surgical Details / Fluids</span>
					</td>
					<td>&#160;</td>
					<td>&#160;</td>
				</tr>
				<tr class="EformTableRow">
					<td colspan="3" align="center">
						<span onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('OpDuration','SurgicalDetailsFluids')">
							<span class="Box" style="width: 223px;">
								Operating time (skin to skin):&#160;
                <xsl:value-of select="OperatingRoomDetails/OpDuration"/>&#160;min
							</span>
						</span>
						<img src="../../Images/shim.gif" width="25" height="1" />
						<span onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('OpAnesthesiaDuration','SurgicalDetailsFluids')">
							<span class="Box" style="width: 170px;">
								Anesthesia time:&#160;<xsl:value-of select="OperatingRoomDetails/OpAnesthesiaDuration"/>&#160;min
            </span>
						</span>
						<img src="../../Images/shim.gif" width="25" height="1" />
						<span onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('OpEstBloodLoss','SurgicalDetailsFluids')">
							<span class="Box" style="width: 170px;">
								Estimated Blood Loss (cc):
								<img src="../../Images/shim.gif" width="3" height="1" />
								<xsl:value-of select="OperatingRoomDetails/OpEstBloodLoss"/>
							</span>
						</span>
					</td>
				</tr>
				<tr class="EFormTableRow">
					<td width="45%">
						<table class="EFormTable" cellspacing="0">
							<tr class="EFormTableRow">
								<td align="center" valign="middle" class="FormInsideTableTopLeftCell">&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Auto</strong></td>
								<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>PRBC</strong></td>
								<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>FFP</strong></td>
								<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Cellsaver</strong></td>
							</tr>
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTableAndFields('OperatingRoomDetails','OpAutoAvailable,OpRBC_Available,OpFFP_Available','SurgicalDetailsFluids')">
								<td align="center" valign="middle" class="FormInsideTableLeftCell"><strong>Units Available</strong></td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpAutoAvailable"/>&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpRBC_Available"/>&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpFFP_Available"/>&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" style="background-color: #cccccc;">&#160;
              </td>
							</tr>
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTableAndFields('OperatingRoomDetails','OpAutoIntraOp,OpRBC_IntraOp,OpFFP_IntraOp,OpHD_IntraOp','SurgicalDetailsFluids')">
								<td align="center" valign="middle" class="FormInsideTableLeftCell"><strong>Intraoperative</strong></td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpAutoIntraOp"/>&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpRBC_IntraOp"/>&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpFFP_IntraOp"/>&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpHD_IntraOp"/>&#160;
              </td>
							</tr>
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTableAndFields('OperatingRoomDetails','OpAuto_PostOp,OpRBC_PostOp,OpFFP_PostOp','SurgicalDetailsFluids')">
								<td align="center" valign="middle" class="FormInsideTableLeftCell"><strong>PACU / PostOp</strong></td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpAuto_PostOp"/>&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpRBC_PostOp"/>&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpFFP_PostOp"/>&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" style="background-color: #cccccc;">&#160;</td>
							</tr>
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTableAndFields('OperatingRoomDetails','OpAutoTransfused,OpRBC_Transfused,OpFFP_Transfused,OpHD_Transfused','SurgicalDetailsFluids')">
                <td align="center" valign="middle" class="FormInsideTableLeftCell">
                  <strong>Units Transfused</strong>
                </td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="OperatingRoomDetails/OpAutoTransfused"/>&#160;
                </td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="OperatingRoomDetails/OpRBC_Transfused"/>&#160;
                </td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="OperatingRoomDetails/OpFFP_Transfused"/>&#160;
                </td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="OperatingRoomDetails/OpHD_Transfused"/>&#160;
                </td>
              </tr>						</table>
					</td>
					<td width="30%">
						<table class="EFormTable" cellspacing="0">
							<tr class="EFormTableRow">
								<td align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Date</strong></td>
								<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Var</strong></td>
								<td align="center" valign="middle" class="FormInsideTableTopCell_Modified"><strong>Value</strong></td>
							</tr>
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('OpHGB_Admit','SurgicalDetailsFluids')">
								<td align="center" valign="middle" class="FormInsideTableLeftCell">Admission</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell">HGB</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpHGB_Admit"/>&#160;</td>
							</tr>
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('OpHCT_Admit','SurgicalDetailsFluids')">
								<td align="center" valign="middle" class="FormInsideTableLeftCell">Admission</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell">HCT</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpHCT_Admit"/>&#160;</td>
							</tr>
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('OpHGB_IntraOp','SurgicalDetailsFluids')">
								<td align="center" valign="middle" class="FormInsideTableLeftCell">IntraOp</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell">HGB</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpHGB_IntraOp"/>&#160;</td>
							</tr>
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('OpHCT_IntraOp','SurgicalDetailsFluids')">
								<td align="center" valign="middle" class="FormInsideTableLeftCell">IntraOp</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell">HCT</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="OperatingRoomDetails/OpHCT_IntraOp"/>&#160;</td>
							</tr>
						</table>
					</td>
					<td width="25%">
						<table class="EFormTable" cellspacing="0">
							<tr class="EFormTableRow">
								<td colspan="2"><strong>Fluids</strong></td>
							</tr>
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('OpCrystalloid','SurgicalDetailsFluids')">
								<td width="60%" align="right" valign="middle" class="FormInsideTableTopLeftCell">Crystalloid (cc)</td>
								<td width="40%" align="center" valign="middle" class="FormInsideTableTopCell_Modified"><xsl:value-of select="OperatingRoomDetails/OpCrystalloid"/>&#160;</td>
							</tr>
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('OpFluidHespan','SurgicalDetailsFluids')">
                <td width="60%" align="right" valign="middle" class="FormInsideTableLeftCell">Hespan (cc)</td>
                <td width="40%" align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="OperatingRoomDetails/OpFluidHespan"/>&#160;
                </td>
              </tr>
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('OpFluidAlbumin','SurgicalDetailsFluids')">
                <td width="60%" align="right" valign="middle" class="FormInsideTableLeftCell">Albumin (cc)</td>
                <td width="40%" align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="OperatingRoomDetails/OpFluidAlbumin"/>&#160;
                </td>
              </tr>
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted'" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('OpColloid','SurgicalDetailsFluids')">
                <td align="right" valign="middle" class="FormInsideTableLeftCell">Colloid (cc)</td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="OperatingRoomDetails/OpColloid"/>&#160;
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr class="EFormTableRow">
					<td colspan="3" align="center" valign="middle">
						<xsl:variable name="coordinator" select="''"/>
						<xsl:variable name="coordinatorDate" select="''"/>
						<xsl:variable name="physician" select="''"/>
						<xsl:variable name="physicianDate" select="''"/>
						<xsl:variable name="investigator" select="''"/>
						<xsl:variable name="investigatorDate" select="''"/>
						<span>
							Coordinator:&#160;
							<xsl:choose>
								<xsl:when test="($coordinator != '')">
									<xsl:value-of select="$coordinator"/>
								</xsl:when>
								<xsl:otherwise>
									______________
								</xsl:otherwise>
							</xsl:choose>
							<img src="../../Images/shim.gif" width="5" height="1" />
							Date:&#160;
							<xsl:choose>
								<xsl:when test="($coordinatorDate != '')">
									<xsl:value-of select="$coordinatorDate"/>
								</xsl:when>
								<xsl:otherwise>
									_______
								</xsl:otherwise>
							</xsl:choose>
							<img src="../../Images/shim.gif" width="10" height="1" />
							Physician:&#160;
							<xsl:choose>
								<xsl:when test="($physician != '')">
									<xsl:value-of select="$physician"/>
								</xsl:when>
								<xsl:otherwise>
									______________
								</xsl:otherwise>
							</xsl:choose>
							<img src="../../Images/shim.gif" width="5" height="1" />
							Date:&#160;
							<xsl:choose>
								<xsl:when test="($physicianDate != '')">
									<xsl:value-of select="$physicianDate"/>
								</xsl:when>
								<xsl:otherwise>
									_______
								</xsl:otherwise>
							</xsl:choose>
							<img src="../../Images/shim.gif" width="10" height="1" />
							PI:&#160;
							<xsl:choose>
								<xsl:when test="($investigator != '')">
									<xsl:value-of select="$investigator"/>
								</xsl:when>
								<xsl:otherwise>
									______________
								</xsl:otherwise>
							</xsl:choose>
							<img src="../../Images/shim.gif" width="5" height="1" />
							Date:&#160;
							<xsl:choose>
								<xsl:when test="($investigatorDate != '')">
									<xsl:value-of select="$investigatorDate"/>
								</xsl:when>
								<xsl:otherwise>
									_______
								</xsl:otherwise>
							</xsl:choose>
						</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</xsl:template>

  <!-- Surgery Transform Footer -->
  <xsl:template name="SurgeryFooter">
    <tr>
      <td height="14" align="center" valign="bottom" class="blackBoldText">&#160;</td>
    </tr>
  </xsl:template>

  <!--Added by Tumen Tumur-->
  <!--Vital Signs: BP, Pulse, Resp, and Temp-->
  <xsl:template match="Encounters" name="VitalSigns">
    <tr>
      <td class="FormOuterTableRow">
        <a name="VitalSigns_Anchor"/>
        <table class="EFormTable" cellspacing="0" border="0">
          <tr class="EFormTableRow">
            <td colspan="4" bgcolor="#DCDCDC">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Nursing Assessment</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td colspan="4" class="FormInsideTableTopCell">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Vital Signs</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Blood Pressure</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Pulse</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Temperature</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Respirations</strong>
            </td>
          </tr>
          <xsl:for-each select="Encounters">
            <xsl:choose>
              <xsl:when test="((EncSystolic != '') or (EncDiastolic != '') or (EncPulse != '') or (EncTemp != '') or (EncRespiration != ''))">
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncSystolic', 'VitalSigns')">
                    <xsl:value-of select="EncSystolic"  /> / <xsl:value-of select="EncDiastolic"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncPulse', 'VitalSigns')">
                    <xsl:value-of select="EncPulse"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncTemp', 'VitalSigns')">
                    <xsl:value-of select="EncTemp"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncRespiration', 'VitalSigns')">
                    <xsl:value-of select="EncRespiration"  />&#160;
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncSystolic', 'VitalSigns')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncPulse', 'VitalSigns')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncTemp', 'VitalSigns')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncRespiration', 'VitalSigns')">&#160;</td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Nursing Signature line-->
  <xsl:template name="NurseSignature">
    <tr>
      <td class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0" border ="0">
          <tr class="EFormTableRow">
            <td colspan="2">
              <img src="../../Images/shim.gif" width="4" height="1" />
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="40%">
              <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Signature:</span>&#160;&#160;________________________________</td>
            <td>&#160;&#160;</td>
            <td width="30%">
              <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Title:</span>&#160;&#160;________________________________</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: Medication Unchanged Since Last Visit-->
  <xsl:template match="NoTable" name="MedSinceLastVisit">
    <xsl:for-each select="NoTable">
      <xsl:choose>
        <xsl:when test="MedicationUnchanged ='Medication unchanged since last visit'">
          &#160;<input name="CheckBox_MedUnchanged" type="checkbox" id="CheckBox_MedUnchanged" checked="Yes"/>
          &#160;<span class="blackBoldText">Unchanged since last visit</span>
        </xsl:when>
        <xsl:otherwise>
          &#160;<input name="CheckBox_MedUnchanged" type="checkbox" id="CheckBox_MedUnchanged" />
          &#160;<span class="blackBoldText">Unchanged since last visit</span>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  
  <!--Allergies NKA -->
  <xsl:template match="Allergies" name="AllergiesNKA">
    <xsl:for-each select="Allergies[position()=9]">
      <xsl:choose>
        <xsl:when test="Allergen ='NKA'">
          &#160;<input name="CheckBox_NKA" type="checkbox" id="CheckBox_NKA" checked="Yes"/>
          &#160;<span class="blackBoldText">NKA</span>
        </xsl:when>
      <xsl:otherwise>
        &#160;<input name="CheckBox_NKA" type="checkbox" id="CheckBox_NKA" />
        &#160;<span class="blackBoldText">NKA</span>
      </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <!--Allergies Unchanged Since Last Visit -->
  <xsl:template match="NoTable" name="AllergenSinceLastVisit">
    <xsl:for-each select="NoTable">
      <xsl:choose>
        <xsl:when test="AllergiesUnchanged ='Allergies unchanged since last visit'">
          &#160;<input name="CheckBox_AllergenUnchanged" type="checkbox" id="CheckBox_AllergenUnchanged" checked="Yes"/>
          &#160;<span class="blackBoldText">Unchanged since last visit</span>
        </xsl:when>
        <xsl:otherwise>
          &#160;<input name="CheckBox_AllergenUnchanged" type="checkbox" id="CheckBox_AllergenUnchanged" />
          &#160;<span class="blackBoldText">Unchanged since last visit</span>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <!--Template: Allergies with Unchanged since last visit-->
  <xsl:template match="Allergies" name="AllergiesUnchangedTable">
    <a name="Allergies_Anchor"/>
    <table class="EFormTable" cellspacing="0">
      <tr class="EFormTableRow">
        <td colspan="2" align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Allergen', 'AllergiesUnchangedTable')">
          <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Allergies: </span>&#160;
          &#160;<xsl:call-template name="AllergiesNKA"/>
          &#160;<xsl:call-template name="AllergenSinceLastVisit"/>
        </td>
      </tr>
      <tr class="EFormTableRow">
        <td width="50%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
          <strong>Allergy</strong>
        </td>
        <td width="50%" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>Response</strong>
        </td>
      </tr>
      <!--Allergies from the database-->
      <xsl:value-of select="$AllergyRows" disable-output-escaping="yes"/>
      <xsl:for-each select="Allergies">
        <xsl:choose>
          <xsl:when test="(((Allergen != '') or (AllergyResponse != '')) and (Allergen != 'NKA'))">
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Allergies',{./@RecordId})">
              <td align="center" valign="middle" class="FormInsideTableLeftCell">
                <xsl:value-of select="Allergen"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="AllergyResponse"  />&#160;
              </td>
            </tr>
          </xsl:when>
        </xsl:choose>
      </xsl:for-each>
      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Allergies','')">
        <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      </tr>
    </table>
  </xsl:template>
  <!--Template: Medications with Unchanged since last visit (excluding antibiotics)-->
  <xsl:template match="Medications" name="MedUnchangedTable">
    <a name="Medications_Anchor"/>
    <table class="EFormTable" cellspacing="0" border="0">
      <tr class="EFormTableRow">
        <td colspan="6" align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('MedicationUnchanged', 'MedSinceLastVisit')">
          <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Medications: </span>&#160;
          &#160;<xsl:call-template name="MedSinceLastVisit"/>
        </td>
      </tr>
      <tr class="EFormTableRow">
        <td width="40%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
          <strong>Medication</strong>
        </td>
        <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>Dose</strong>
        </td>
        <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>Units</strong>
        </td>
        <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>Schedule</strong>
        </td>
        <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>StartDate</strong>
        </td>
        <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>StopDate</strong>
        </td>
      </tr>
      <!--Medications from the Database-->
      <xsl:value-of select="$MedicationRowsBiopsyOfProstate" disable-output-escaping="yes"/> <!-- formerly $MedicationRows -->
      <xsl:for-each select="Medications">
        <xsl:choose>
          <xsl:when test="(((Medication != '') or (MedDose != '') or (MedUnits != '') or (MedSchedule != '') or (MedStopDateText != '')) and (MedType != 'Antibiotic'))">
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications',{./@RecordId})">
              <td align="center" valign="middle" class="FormInsideTableLeftCell">
                <xsl:value-of select="Medication"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="MedDose"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="MedUnits"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="MedSchedule"  />&#160;
                </td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="MedDateText"  />&#160;
                </td>
                <td align="center" valign="middle" class="FormInsideTableRegCell">
                  <xsl:value-of select="MedStopDateText"  />&#160;</td>
              </tr>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>
        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
          <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        </tr>
      </table>
    </xsl:template>
  <!--Template: StopDates for ASA, Plavix, or Coumadin-->
  <xsl:template match="Medications" name="StopDates">
    <tr>
      <td class="FormOuterTableRow">
        <a name="StopDates_Anchor"/>
        <table class="EFormTable" cellspacing="0" border="0">
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
            <td align="left" valign="middle" class="FormInsideTableLeftCell">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">If taking ASA, Plavix or Coumadin date drug stopped:</span>&#160;
              <xsl:for-each select="Medications[Medication = 'ASA' or Medication ='Plavix' or Medication ='Coumadin']">
                <xsl:value-of select="MedStopDateText" />&#160;
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
 
  <!--Medications and Allergies with Unchanged since last visit combined in one Row-->
  <xsl:template name="MedAllergiesSinceLastVisitTable">
    <tr>
      <td class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td width="50%" valign="top">
              <xsl:call-template name="MedUnchangedTable"/>
            </td>
            <td width="50%" valign="top">
              <xsl:call-template name="AllergiesUnchangedTable"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  <!--Antibiotics taken prior to biopsy: Ciprofloxin 500mg po-->
  <xsl:template match="Medications" name="Ciprofloxin">
    <xsl:for-each select="Medications[position()=21]">
      <xsl:choose>
        <xsl:when test="Medication ='Ciprofloxin'">
          &#160;<input name="CheckBox_Ciprofloxin" type="checkbox" id="CheckBox_Ciprofloxin" checked="Yes"/>
          &#160;<strong>Ciprofloxin 500mg po</strong>
        </xsl:when>
        <xsl:otherwise>
          &#160;<input name="CheckBox_Ciprofloxin" type="checkbox" id="CheckBox_Ciprofloxin" />
          &#160;<strong>Ciprofloxin 500mg po</strong>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <!--Antibiotics taken prior to biopsy: IV-->
  <xsl:template match="Medications" name="IV">
    <xsl:for-each select="Medications[position()=22]">
      <xsl:choose>
        <xsl:when test="Medication !=''">
          &#160;<input name="CheckBox_IV" type="checkbox" id="CheckBox_IV" checked="Yes"/>
          &#160;<strong>IV</strong>
        </xsl:when>
        <xsl:otherwise>
          &#160;<input name="CheckBox_IV" type="checkbox" id="CheckBox_IV" />
          &#160;<strong>IV</strong>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template> 
  <!--Antibiotics taken prior to biopsy-->
  <xsl:template match="Medications" name="MedAntibiotics">
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="6" align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Medication', 'MedAntibiotics')">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Antibiotics Taken Prior to Biopsy:</span>&#160;
              &#160;<xsl:call-template name="Ciprofloxin"/>
              &#160;<xsl:call-template name="IV"/>              
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Agent</strong>
            </td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Dose</strong>
            </td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Units</strong>
            </td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Route</strong>
            </td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>StartDate</strong>
            </td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>StopDate</strong>
            </td>
          </tr>
          <!--Medications with MedType = Antibiotics-->
          <xsl:for-each select="Medications">
            <xsl:choose>
              <xsl:when test="(((Medication != '') or (MedDose != '') or (MedUnits != '') or (MedRoute != '') or (MedStopDateText != '')) and (MedType = 'Antibiotic'))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="Medication"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedDose"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedUnits"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedRoute"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="MedStopDateText"  />&#160;
                  </td>
                </tr>                
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>

          </tr>
        </table>
  </xsl:template>
  <!--Encardities-->
  <xsl:template match="Comorbidities" name="Encardities">
    <table class="EFormTable" cellspacing="0">
      <tr class="EFormTableRow">
    <a name="Encardities_Anchor"/>
    <td align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Comorbidity', 'Encardities')">
      <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Encarditis Prophylaxis assessed for: </span>&#160;
            &#160;<xsl:call-template name="MVP"/>
            &#160;<xsl:call-template name="Cardiac"/>
            &#160; <xsl:call-template name="Joint"/>          
        </td>
    </tr>
    </table>
  </xsl:template>
  <!--Encarditis MVP-->
  <xsl:template match="Comorbidities" name="MVP">
    <xsl:for-each select="Comorbidities[position()=1]">
      <xsl:choose>
        <xsl:when test="Comorbidity ='Mitral Valve Prolapse'">
          &#160;<input name="CheckBox_MVP" type="checkbox" id="CheckBox_MVP" checked="Yes"/>
          &#160;<strong>MVP</strong>
        </xsl:when>
        <xsl:otherwise>
          &#160;<input name="CheckBox_MVP" type="checkbox" id="CheckBox_MVP" />
          &#160;<strong>MVP</strong>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>  
  </xsl:template>
  <!--Encarditis Cardiac Stent/Valve-->
  <xsl:template match="Comorbidities" name="Cardiac">
    <xsl:for-each select="Comorbidities[position()=2]">
      <xsl:choose>
        <xsl:when test="Comorbidity ='Cardiac Stent/Valve'">
          &#160;<input name="CheckBox_Cardiac" type="checkbox" id="CheckBox_Cardiac" checked="Yes"/>
          &#160;<strong>Cardiac Stent/Valve</strong>
        </xsl:when>
        <xsl:otherwise>
          &#160;<input name="CheckBox_Cardiac" type="checkbox" id="CheckBox_Cardiac" />
          &#160;<strong>Cardiac Stent/Valve</strong>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <!--Encarditis Joint Prothesis-->
  <xsl:template match="Comorbidities" name="Joint">
    <xsl:for-each select="Comorbidities[position()=3]">
      <xsl:choose>
        <xsl:when test="Comorbidity ='Joint Prothesis'">
          &#160;<input name="CheckBox_Joint" type="checkbox" id="CheckBox_Joint" checked="Yes"/>
          &#160;<strong>Joint Prothesis</strong>
        </xsl:when>
        <xsl:otherwise>
          &#160;<input name="CheckBox_Joint" type="checkbox" id="CheckBox_Joint" />
          &#160;<strong>Joint Prothesis</strong>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <!--Antibiotics and Encarditis in one Row-->
  <xsl:template name="AntibioticsEncarditis">
    <tr>
      <td class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td valign="top">
              <xsl:call-template name="MedAntibiotics"/>
            </td>
          </tr>
          <tr>
            <td valign="top">
              <xsl:call-template name="Encardities"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  <!--Template: Instruction Fact Cards-->
  <xsl:template match="Encounters" name="InstructionFactCards">
    <tr>
      <td class="FormOuterTableRow">
    <table class="EFormTable" cellspacing="0" border ="0">
      <tr class="EFormTableRow">
        <xsl:for-each select="Encounters">
          <xsl:choose>
            <xsl:when test="((EncNotes != ''))">
              <td valign="middle"  class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncNotes', 'InstructionFactCards')">
                &#160;<input name="CheckBox" type="CheckBox" id="CheckBoxTest" checked="Yes" value="Yes" />
                &#160;<span class="blackBoldText">Pre and Post instructions reviewed. Fact Cards "Prior to Your Prostate Biopsy" and "After Your Prostate Biopsy"</span><br />
                <span class="blackBoldText">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;provided to patient</span>
              </td>
            </xsl:when>
            <xsl:otherwise>
              <td valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncNotes', 'InstructionFactCards')">
                &#160;<input name="CheckBox" type="CheckBox" id="CheckBoxTest" value="No" />
                &#160;<span class="blackBoldText">Pre and Post instructions reviewed. Fact Cards "Prior to Your Prostate Biopsy" and "After Your Prostate Biopsy"</span><br />
                <span class="blackBoldText">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;provided to patient</span>
              </td>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </tr>
    </table>
      </td>
    </tr>
  </xsl:template>
  <!--Signature/Title and Date/Time-->
  <xsl:template name="SignatureDate">
      <tr>
          <td class="FormOuterTableRow">

              <span class="AttendingSignature_Blank">
                  <table width="100%" border="0" cellpadding="8" cellspacing="0">
                      <tr>
                          <td height="45" style="vertical-align: bottom;" >
                              <span class="blackBoldText">Signature:</span>_______________________________________&#160;&#160;<span class="blackBoldText">RN / MD</span>
                          </td>
                          <td style="vertical-align: bottom;" align="right" >
                              <span class="blackBoldText">Date:</span>____/____/____
                          </td>
                          <td style="white-space: nowrap;vertical-align: bottom;">
                              <span class="blackBoldText">Time:</span>____:_____ <span style="font-size: 9px;">AM / PM </span>
                          </td>
                      </tr>
                  </table>
              </span>

              <span class="AttendingSignature_Signed" style="display: none;">
                  <table width="100%" border="0" cellpadding="8" cellspacing="0">
                      <tr>
                          <td height="45" style="vertical-align: bottom;" >
                              <span class="blackBoldText">Signature:</span>&#160;&#160;<img class="signedForm_signatureImage" style="width: 300px;vertical-align:middle;"  />
                          </td>
                          <td align="right" >
                              <span class="blackBoldText">Date:</span>&#160;<span class="signedForm_date">____/____/____</span>
                          </td>
                          <td style="white-space: nowrap;">
                              <span class="blackBoldText">Time:</span>&#160;<span class="signedForm_time">
                                  ___:____ <span style="font-size: 9px;">AM / PM </span>
                              </span>
                          </td>
                      </tr>
                  </table>
              </span>
          </td>
      </tr>
  </xsl:template>
  <!--Medical Assessment-->
  <xsl:template name="MedicalAssessment">
    <tr>
      <td class="FormOuterTableRow">
        <a name="MedicalAssessment_Anchor"/>
        <table class="EFormTable" cellspacing="0" border="0">
          <tr class="EFormTableRow">
            <td colspan ="2" bgcolor="#DCDCDC">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Medical Assessment</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td class="FormInsideTableRegCell">              
              <xsl:call-template name="DRE"/>
            </td>        
          </tr>
          <tr class="EFormTableRow">
            <td class="FormInsideTableRegCell">
              <xsl:call-template name="ClinStageDRE"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  <!--RectalExamResult by DRE-->
  <xsl:template match="Encounters/EncRectalExams" name="DRE">
    <a name="DRE_Anchor"/>
    <table class="EFormTable" cellspacing="0">
      <tr class="EFormTableRow">
        <td align="left" valign="middle" class="FormInsideTableTopCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('DRE_Result', 'DRE')">
          <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Digital Rectal Examination</span>&#160;
          <xsl:for-each select="Encounters/EncRectalExams">
            <xsl:choose>
              <xsl:when test="((DRE_Result = 'Normal'))">
                &#160;<input name="RadioYes_DRE" type="Radio" id="RadioYes_DRE" checked="Yes" />
                &#160;<span class="blackBoldText">Normal</span>
                &#160;<input name="RadioNo_DRE" type="Radio" id="RadioNo_DRE" />
                &#160;<span class="blackBoldText">Abnormal</span>
                &#160;<input name="RadioMalignant_DRE" type="Radio" id="RadioMalignant_DRE" />
                &#160;<span class="blackBoldText">Abnormal Malignant</span>
              </xsl:when>
              <xsl:when test="((DRE_Result = 'Abnormal'))">
                &#160;<input name="RadioYes_DRE" type="Radio" id="RadioYes_DRE" />
                &#160;<span class="blackBoldText">Normal</span>
                &#160;<input name="RadioNo_DRE" type="Radio" id="RadioNo_DRE" checked="Yes" />
                &#160;<span class="blackBoldText">Abnormal</span>
                &#160;<input name="RadioMalignant_DRE" type="Radio" id="RadioMalignant_DRE" />
                &#160;<span class="blackBoldText">Abnormal Malignant</span>
              </xsl:when>
              <xsl:when test="((DRE_Result = 'Abnormal Malignant'))">
                &#160;<input name="RadioYes_DRE" type="Radio" id="RadioYes_DRE" />
                &#160;<span class="blackBoldText">Normal</span>
                &#160;<input name="RadioNo_DRE" type="Radio" id="RadioNo_DRE" />
                &#160;<span class="blackBoldText">Abnormal</span>
                &#160;<input name="RadioMalignant_DRE" type="Radio" id="RadioMalignant_DRE" checked="Yes" />
                &#160;<span class="blackBoldText">Abnormal Malignant</span>
              </xsl:when>
              <xsl:otherwise>
                &#160;<input name="RadioYes_DRE" type="Radio" id="RadioYes_DRE" />
                &#160;<span class="blackBoldText">Normal</span>
                &#160;<input name="RadioNo_DRE" type="Radio" id="RadioNo_DRE" />
                &#160;<span class="blackBoldText">Abnormal</span>
                &#160;<input name="RadioMalignant_DRE" type="Radio" id="RadioMalignant_DRE" />
                &#160;<span class="blackBoldText">Abnormal Malignant</span>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </td>
      </tr>
    </table>
  </xsl:template>
  <!--Clinical Stages by DRE-->
  <xsl:template match="ClinicalStages" name="ClinStageDRE">
        <a name="ClinStage_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td>
              <img src="../../Images/shim.gif" width="4" height="1" />
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ClinStageT', 'ClinStageDRE')">
              <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Clinical Stage by DRE</span>&#160;
              <xsl:for-each select="ClinicalStages">
                <xsl:choose>
                  <xsl:when test="((ClinStageT = 'T1c'))">
                    &#160;<input name="RadioClin_T1c" type="Radio" id="RadioClin_T1c" checked="Yes" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="RadioClin_T2a" type="Radio" id="RadioClin_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="RadioClin_T2b" type="Radio" id="RadioClin_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="RadioClin_T2c" type="Radio" id="RadioClin_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="RadioClin_T3a" type="Radio" id="RadioClin_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="RadioClin_T3b" type="Radio" id="RadioClin_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="RadioClin_T3c" type="Radio" id="RadioClin_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:when test="((ClinStageT = 'T2a'))">
                    &#160;<input name="RadioClin_T1c" type="Radio" id="RadioClin_T1c" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="RadioClin_T2a" type="Radio" id="RadioClin_T2a" checked="Yes" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="RadioClin_T2b" type="Radio" id="RadioClin_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="RadioClin_T2c" type="Radio" id="RadioClin_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="RadioClin_T3a" type="Radio" id="RadioClin_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="RadioClin_T3b" type="Radio" id="RadioClin_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="RadioClin_T3c" type="Radio" id="RadioClin_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:when test="((ClinStageT = 'T2b'))">
                    &#160;<input name="RadioClin_T1c" type="Radio" id="RadioClin_T1c" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="RadioClin_T2a" type="Radio" id="RadioClin_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="RadioClin_T2b" type="Radio" id="RadioClin_T2b" checked="Yes" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="RadioClin_T2c" type="Radio" id="RadioClin_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="RadioClin_T3a" type="Radio" id="RadioClin_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="RadioClin_T3b" type="Radio" id="RadioClin_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="RadioClin_T3c" type="Radio" id="RadioClin_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:when test="((ClinStageT = 'T2c'))">
                    &#160;<input name="RadioClin_T1c" type="Radio" id="RadioClin_T1c" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="RadioClin_T2a" type="Radio" id="RadioClin_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="RadioClin_T2b" type="Radio" id="RadioClin_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="RadioClin_T2c" type="Radio" id="RadioClin_T2c" checked="Yes" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="RadioClin_T3a" type="Radio" id="RadioClin_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="RadioClin_T3b" type="Radio" id="RadioClin_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="RadioClin_T3c" type="Radio" id="RadioClin_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:when test="((ClinStageT = 'T3a'))">
                    &#160;<input name="RadioClin_T1c" type="Radio" id="RadioClin_T1c" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="RadioClin_T2a" type="Radio" id="RadioClin_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="RadioClin_T2b" type="Radio" id="RadioClin_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="RadioClin_T2c" type="Radio" id="RadioClin_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="RadioClin_T3a" type="Radio" id="RadioClin_T3a" checked="Yes" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="RadioClin_T3b" type="Radio" id="RadioClin_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="RadioClin_T3c" type="Radio" id="RadioClin_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:when test="((ClinStageT = 'T3b'))">
                    &#160;<input name="RadioClin_T1c" type="Radio" id="RadioClin_T1c" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="RadioClin_T2a" type="Radio" id="RadioClin_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="RadioClin_T2b" type="Radio" id="RadioClin_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="RadioClin_T2c" type="Radio" id="RadioClin_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="RadioClin_T3a" type="Radio" id="RadioClin_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="RadioClin_T3b" type="Radio" id="RadioClin_T3b" checked="Yes"/>
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="RadioClin_T3c" type="Radio" id="RadioClin_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:when test="((ClinStageT = 'T3c'))">
                    &#160;<input name="RadioClin_T1c" type="Radio" id="RadioClin_T1c"  />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="RadioClin_T2a" type="Radio" id="RadioClin_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="RadioClin_T2b" type="Radio" id="RadioClin_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="RadioClin_T2c" type="Radio" id="RadioClin_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="RadioClin_T3a" type="Radio" id="RadioClin_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="RadioClin_T3b" type="Radio" id="RadioClin_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="RadioClin_T3c" type="Radio" id="RadioClin_T3c" checked="Yes"/>
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:otherwise>
                    &#160;<input name="RadioClin_T1c" type="Radio" id="RadioClin_T1c" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="RadioClin_T2a" type="Radio" id="RadioClin_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="RadioClin_T2b" type="Radio" id="RadioClin_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="RadioClin_T2c" type="Radio" id="RadioClin_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="RadioClin_T3a" type="Radio" id="RadioClin_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="RadioClin_T3b" type="Radio" id="RadioClin_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="RadioClin_T3c" type="Radio" id="RadioClin_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
            </td>
          </tr>
        </table>
  </xsl:template>
  <!--Template: Lab Tests (PSAs) Values Matches LabTests-->
  <xsl:template match="LabTests" name="SerumLabTable">
    <tr>
      <td class="FormOuterTableRow">
        <a name="LabTests_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="4">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Serum PSA Lab Tests</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Lab Test</strong>
            </td>
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Value</strong>
            </td>
            <!--<td width="20%" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Units</strong></td>-->
            <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Quality</strong>
            </td>
          </tr>
          <xsl:value-of select="$LabTestRows" disable-output-escaping="yes"/>
          <xsl:for-each select="LabTests">
            <xsl:choose>
              <xsl:when test="((LabDateText != '') or (LabTest != '') or (LabResult != '') or (LabUnits != '') or (LabQuality != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="LabDateText"/>&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="LabTest" />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="LabResult"  />&#160;
                  </td>
                  <!--Field removed from XML-->
                  <!--<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="LabUnits"  />&#160;</td>-->
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="LabQuality"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <!--<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>-->
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
    <!--Indication for Biopsy-->
  <xsl:template match="Procedures" name="ProcIndicationBx">
    <a name="ProcIndication_Anchor"/>
      <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
              <td align="left" valign="middle" class="blackBoldText" style="padding: 2px 0px 0px 4px;">Indication for Biopsy:</td>
              <td align="left" valign="middle" >
                  <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                          <xsl:when test="(contains(ProcIndication, 'Active Surveillance'))">
                              <input type="checkbox" id="RadioActiveSurveillance" checked="checked" />
                          </xsl:when>
                          <xsl:otherwise>
                              <input type="checkbox" id="RadioActiveSurveillance" />
                          </xsl:otherwise>
                      </xsl:choose>
                  </xsl:for-each>
                  <strong>Active Surveillance</strong>
              </td>
              <td align="left" valign="middle" >
                  <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                          <xsl:when test="(contains(ProcIndication, 'Restaging'))">
                              <input type="checkbox" id="RadioRestage" checked="checked" />
                          </xsl:when>
                          <xsl:otherwise>
                              <input type="checkbox" id="RadioRestage" />
                          </xsl:otherwise>
                      </xsl:choose>
                  </xsl:for-each>
                  <strong>Restaging</strong>
              </td>
              <td align="left" valign="middle" >
                  <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                          <xsl:when test="(contains(ProcIndication, 'Elevated PSA'))">
                              <input type="checkbox" id="RadioPSA" checked="checked" />
                          </xsl:when>
                          <xsl:otherwise>
                              <input type="checkbox" id="RadioPSA" />
                          </xsl:otherwise>
                      </xsl:choose>
                  </xsl:for-each>
                  <strong>Elevated PSA</strong>
              </td>
          </tr>
          <tr class="EFormTableRow">
              <td align="left" valign="middle" style="padding: 2px 0px 0px 4px;">&#160;</td>
              <td align="left" valign="middle" >
                  <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                          <xsl:when test="(contains(ProcIndication, 'Prostate Nodule/Abnormality'))">
                              <input type="checkbox" id="RadioProstate" checked="checked" />
                          </xsl:when>
                          <xsl:otherwise>
                              <input type="checkbox" id="RadioProstate" />
                          </xsl:otherwise>
                      </xsl:choose>
                  </xsl:for-each>
                  <strong>Prostate nodule/abnormality</strong>
              </td>
              <td align="left" valign="middle" >
                  <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                          <xsl:when test="(contains(ProcIndication, 'Post Radiation'))">
                              <input type="checkbox" id="RadioPostRadiation" checked="checked" />
                          </xsl:when>
                          <xsl:otherwise>
                              <input type="checkbox" id="RadioPostRadiation" />
                          </xsl:otherwise>
                      </xsl:choose>
                  </xsl:for-each>
                  <strong>Post Radiation</strong>
              </td>
              <td align="left" valign="middle" >



                  <xsl:for-each select="Procedures[position()=1]">
                      <xsl:choose>
                          <xsl:when test="((ProcIndication != 'Active Surveillance') and (ProcIndication != 'Restaging') and (ProcIndication != 'Elevated PSA') and (ProcIndication != 'Prostate Nodule/Abnormality') and (ProcIndication != 'Post Radiation'))">

                            <xsl:variable name="OtherBiopsyIndicationA">
                              <xsl:call-template name="string-replace-all">
                                <xsl:with-param name="text" select="ProcIndication" />
                                <xsl:with-param name="replace" select="'Active Surveillance'" />
                                <xsl:with-param name="by" select="''" />
                              </xsl:call-template>
                            </xsl:variable>
                            <xsl:variable name="OtherBiopsyIndicationB">
                              <xsl:call-template name="string-replace-all">
                                <xsl:with-param name="text" select="$OtherBiopsyIndicationA" />
                                <xsl:with-param name="replace" select="'Restaging'" />
                                <xsl:with-param name="by" select="''" />
                              </xsl:call-template>
                            </xsl:variable>
                            <xsl:variable name="OtherBiopsyIndicationC">
                              <xsl:call-template name="string-replace-all">
                                <xsl:with-param name="text" select="$OtherBiopsyIndicationB" />
                                <xsl:with-param name="replace" select="'Elevated PSA'" />
                                <xsl:with-param name="by" select="''" />
                              </xsl:call-template>
                            </xsl:variable>
                            <xsl:variable name="OtherBiopsyIndicationD">
                              <xsl:call-template name="string-replace-all">
                                <xsl:with-param name="text" select="$OtherBiopsyIndicationC" />
                                <xsl:with-param name="replace" select="'Prostate Nodule/Abnormality'" />
                                <xsl:with-param name="by" select="''" />
                              </xsl:call-template>
                            </xsl:variable>
                            <xsl:variable name="OtherBiopsyIndicationE">
                              <xsl:call-template name="string-replace-all">
                                <xsl:with-param name="text" select="$OtherBiopsyIndicationD" />
                                <xsl:with-param name="replace" select="'Post Radiation'" />
                                <xsl:with-param name="by" select="''" />
                              </xsl:call-template>
                            </xsl:variable>
                            <xsl:variable name="OtherBiopsyIndication">
                              <xsl:call-template name="string-replace-all">
                                <xsl:with-param name="text" select="$OtherBiopsyIndicationE" />
                                <xsl:with-param name="replace" select="','" />
                                <xsl:with-param name="by" select="' '" />
                              </xsl:call-template>
                            </xsl:variable>
                            
                            
                              <input type="checkbox" id="RadioProstate" checked="checked" />
                              <strong>Other: <xsl:value-of select="$OtherBiopsyIndication"  /></strong>
                          </xsl:when>
                          <xsl:otherwise>
                              <input type="checkbox" id="RadioProstate" />
                              <strong>Other</strong>
                          </xsl:otherwise>
                      </xsl:choose>
                  </xsl:for-each>
              </td>
          </tr>
      </table>
  </xsl:template>
  <!--Consent Form-->
  <xsl:template match="NoTable" name="ConsentFormYesNo">
    <a name="ConsentForm_Anchor"/>
    <table class="EFormTable" cellspacing="0">
        <tr class="EFormTableRow">
          <td align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ConsentForm', 'ConsentFormYesNo')">
            <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Consent Form:</span>&#160;
            <xsl:for-each select="NoTable">
              <xsl:choose>
                <xsl:when test="((ConsentForm = 'Yes'))">
                  <input name="RadioConsentYes" type="Radio" id="RadioConsentYes" checked="Yes" />
                  &#160;<strong>Yes</strong>&#160;
                  <input name="RadioConsentNo" type="Radio" id="RadioConsentNo" />
                  &#160;<strong>No</strong>                 
                </xsl:when>
                <xsl:when test="((ConsentForm = 'No'))">
                  <input name="RadioConsentYes" type="Radio" id="RadioConsentYes" />
                  &#160;<strong>Yes</strong>
                  <input name="RadioConsentNo" type="Radio" id="RadioConsentNo" checked="Yes" />
                  &#160;<strong>No</strong>
                </xsl:when>
                <xsl:otherwise>
                  <input name="RadioConsentYes" type="Radio" id="RadioConsentYes" />
                  &#160;<strong>Yes</strong>&#160;
                  <input name="RadioConsentNo" type="Radio" id="RadioConsentNo" />
                  &#160;<strong>No</strong>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </td>
        </tr>
    </table>
  </xsl:template>
  <!--Antibiotics Prior to Biopsy-->
  <xsl:template match="NoTable" name="AntibioticsPriorBx">
    <a name="AntibioticsPriorBx_Anchor"/>
    <table class="EFormTable" cellspacing="0">
      <tr class="EFormTableRow">
        <td align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('AntibioticPriorToBx', 'AntibioticsPriorBx')">
          <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Antibiotics Prior to Biopsy:</span>&#160;
          <xsl:for-each select="NoTable">
            <xsl:choose>
              <xsl:when test="((AntibioticPriorToBx = 'Yes'))">
                <input name="RadioPriorBxYes" type="Radio" id="RadioPriorBxYes" checked="Yes" />
                &#160;<strong>Yes</strong>&#160;
                <input name="RadioPriorBxNo" type="Radio" id="RadioPriorBxNo" />
                &#160;<strong>No</strong>
              </xsl:when>
              <xsl:when test="((AntibioticPriorToBx = 'No'))">
                <input name="RadioPriorBxYes" type="Radio" id="RadioPriorBxYes" />
                &#160;<strong>Yes</strong>&#160;
                <input name="RadioPriorBxNo" type="Radio" id="RadioPriorBxNo" checked="Yes" />
                &#160;<strong>No</strong>
              </xsl:when>
              <xsl:otherwise>
                <input name="RadioPriorBxYes" type="Radio" id="RadioPriorBxYes" />
                &#160;<strong>Yes</strong>&#160;
                <input name="RadioPriorBxNo" type="Radio" id="RadioPriorBxNo" />
                &#160;<strong>No</strong>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </td>
      </tr>
    </table>
  </xsl:template>
  <!--Consent Form and Antibiotics prior to Bx in one row-->
  <xsl:template name="IndicationConsentAntibioticsBx">
    <tr>
      <td class="FormOuterTableRow">
        <a name="IndicationConsentAntibioticsBx_Anchor"/>
        <table class="EFormTable" cellspacing="0" border="0">
          <tr class="EFormTableRow">
            <td colspan="2" class="FormInsideTableRegCell">
              <xsl:call-template name="ProcIndicationBx"/>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td colspan="2" class="FormInsideTableRegCell blackBoldText" style="padding: 7px 0px 7px 4px;">
              <table class="EFormTable" cellspacing="0">
                <tr class="EFormTableRow">
                  <td class="blackBoldText" >Fiducial Markers</td>
                  <td  onclick="LoadComponentByField('ProcFindSubsite')" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  >
                    <strong>Subsite:</strong>
                    <xsl:choose>
                      <xsl:when test="(Procedures[@RecordId=1]/ProcedureFinding[@RecordId=1]/ProcFindSubsite != '')">
                        <input name="FiducialMarkersSubsite" type="checkbox" id="FiducialMarkersSubsite" style="vertical-align: text-top; margin-left: 1em;" checked="checked"  />
                      </xsl:when>
                      <xsl:otherwise>
                        <input name="FiducialMarkersSubsite" type="checkbox" id="FiducialMarkersSubsite" style="vertical-align: text-top; margin-left: 1em;" />
                      </xsl:otherwise>
                    </xsl:choose>
                    Right Apex, Right Base, Left Base
                  </td>
                  <td  onclick="LoadComponentByField('ProcFindNotes')" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  >
                    <strong>Type:</strong><xsl:choose>
                      <xsl:when test="(Procedures[@RecordId=1]/ProcedureFinding[@RecordId=1]/ProcFindNotes = 'Calypso')">
                        <input name="FiducialMarkersType" type="radio" id="FiducialMarkersTypeCalypso" style="vertical-align: text-top; margin-left: 1.5em;" checked="checked"  />
                      </xsl:when>
                      <xsl:otherwise>
                        <input name="FiducialMarkersType" type="radio" id="FiducialMarkersTypeCalypso" style="vertical-align: text-top; margin-left: 1.5em;" />
                      </xsl:otherwise>
                    </xsl:choose> Calypso<xsl:choose>
                      <xsl:when test="(Procedures[@RecordId=1]/ProcedureFinding[@RecordId=1]/ProcFindNotes = 'Gold')">
                        <input name="FiducialMarkersType" type="radio" id="FiducialMarkersTypeCalypso" style="vertical-align: text-top; margin-left: 1.5em;" checked="checked"  />
                      </xsl:when>
                      <xsl:otherwise>
                        <input name="FiducialMarkersType" type="radio" id="FiducialMarkersTypeCalypso" style="vertical-align: text-top; margin-left: 1.5em;" />
                      </xsl:otherwise>
                    </xsl:choose> Gold
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="50%" class="FormInsideTableRegCell">
              <xsl:call-template name="ConsentFormYesNo"/>
            </td>            
            <td width="50%" class="FormInsideTableRegCell">
              <xsl:call-template name="AntibioticsPriorBx"/>
            </td>            
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  <!--Ultrasound Report: Overall Assessment-->
  <xsl:template match="Diagnostics" name="UltrasoundReport">
    <tr>
      <td class="FormOuterTableRow">
        <a name="UltrasoundReport_Anchor"/>
        <table class="EFormTable" cellspacing="0" border="0">
          <tr class="EFormTableRow">
            <td colspan ="2" bgcolor="#DCDCDC" >
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Ultrasound Report</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td align="left" valign="middle" class="FormInsideTableTopCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('DxResult', 'UltrasoundReport')">
              <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Overall Assessment:</span>&#160;
              <xsl:for-each select="Diagnostics">
                <xsl:choose>
                  <xsl:when test="((DxResult = 'Normal'))">
                    &#160;<input name="RadioYes_Assessment" type="Radio" id="RadioYes_Assessment" checked="Yes" />
                    &#160;<span class="blackBoldText">Normal</span>
                    &#160;<input name="RadioNo_Assessment" type="Radio" id="RadioNo_Assessment" />
                    &#160;<span class="blackBoldText">Abnormal</span>
                  </xsl:when>
                  <xsl:when test="((DxResult = 'Abnormal'))">
                    &#160;<input name="RadioYes_Assessment" type="Radio" id="RadioYes_Assessment" />
                    &#160;<span class="blackBoldText">Normal</span>
                    &#160;<input name="RadioNo_Assessment" type="Radio" id="RadioNo_Assessment" checked="Yes" />
                    &#160;<span class="blackBoldText">Abnormal</span>
                  </xsl:when>
                  <xsl:otherwise>
                    &#160;<input name="RadioYes_Assessment" type="Radio" id="RadioYes_Assessment" />
                    &#160;<span class="blackBoldText">Normal</span>
                    &#160;<input name="RadioNo_Assessment" type="Radio" id="RadioNo_Assessment" />
                    &#160;<span class="blackBoldText">Abnormal</span>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  <!--Ultrasound Clinical Stage-->
  <xsl:template match="Diagnostics/DxImageProstate" name="UltrasoundClinStage">
    <tr>
      <td class="FormOuterTableRow">
        <a name="UltrasoundClinStage_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td>
              <img src="../../Images/shim.gif" width="4" height="1" />
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ImgClinStageT', 'UltrasoundClinStage')">
              <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Ultrasound Clinical Stage:</span>&#160;
              <xsl:for-each select="Diagnostics[not(@RecordId)]/DxImageProstate">
                <xsl:choose>
                  <xsl:when test="((ImgClinStageT = 'T1c'))">
                    &#160;<input name="Radio_T1c" type="Radio" id="Radio_T1c" checked="Yes" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="Radio_T2a" type="Radio" id="Radio_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="Radio_T2b" type="Radio" id="Radio_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="Radio_T2c" type="Radio" id="Radio_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="Radio_T3a" type="Radio" id="Radio_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="Radio_T3b" type="Radio" id="Radio_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="Radio_T3c" type="Radio" id="Radio_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:when test="((ImgClinStageT = 'T2a'))">
                    &#160;<input name="Radio_T1c" type="Radio" id="Radio_T1c" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="Radio_T2a" type="Radio" id="Radio_T2a" checked="Yes" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="Radio_T2b" type="Radio" id="Radio_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="Radio_T2c" type="Radio" id="Radio_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="Radio_T3a" type="Radio" id="Radio_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="Radio_T3b" type="Radio" id="Radio_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="Radio_T3c" type="Radio" id="Radio_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:when test="((ImgClinStageT = 'T2b'))">
                    &#160;<input name="Radio_T1c" type="Radio" id="Radio_T1c" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="Radio_T2a" type="Radio" id="Radio_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="Radio_T2b" type="Radio" id="Radio_T2b" checked="Yes" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="Radio_T2c" type="Radio" id="Radio_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="Radio_T3a" type="Radio" id="Radio_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="Radio_T3b" type="Radio" id="Radio_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="Radio_T3c" type="Radio" id="Radio_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:when test="((ImgClinStageT = 'T2c'))">
                    &#160;<input name="Radio_T1c" type="Radio" id="Radio_T1c" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="Radio_T2a" type="Radio" id="Radio_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="Radio_T2b" type="Radio" id="Radio_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="Radio_T2c" type="Radio" id="Radio_T2c" checked="Yes" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="Radio_T3a" type="Radio" id="Radio_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="Radio_T3b" type="Radio" id="Radio_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="Radio_T3c" type="Radio" id="Radio_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:when test="((ImgClinStageT = 'T3a'))">
                    &#160;<input name="Radio_T1c" type="Radio" id="Radio_T1c" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="Radio_T2a" type="Radio" id="Radio_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="Radio_T2b" type="Radio" id="Radio_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="Radio_T2c" type="Radio" id="Radio_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="Radio_T3a" type="Radio" id="Radio_T3a" checked="Yes" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="Radio_T3b" type="Radio" id="Radio_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="Radio_T3c" type="Radio" id="Radio_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:when test="((ImgClinStageT = 'T3b'))">
                    &#160;<input name="Radio_T1c" type="Radio" id="Radio_T1c" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="Radio_T2a" type="Radio" id="Radio_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="Radio_T2b" type="Radio" id="Radio_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="Radio_T2c" type="Radio" id="Radio_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="Radio_T3a" type="Radio" id="Radio_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="Radio_T3b" type="Radio" id="Radio_T3b" checked="Yes" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="Radio_T3c" type="Radio" id="Radio_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:when test="((ImgClinStageT = 'T3c'))">
                    &#160;<input name="Radio_T1c" type="Radio" id="Radio_T1c" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="Radio_T2a" type="Radio" id="Radio_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="Radio_T2b" type="Radio" id="Radio_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="Radio_T2c" type="Radio" id="Radio_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="Radio_T3a" type="Radio" id="Radio_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="Radio_T3b" type="Radio" id="Radio_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="Radio_T3c" type="Radio" id="Radio_T3c" checked="Yes" value="No"/>
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:when>
                  <xsl:otherwise>
                    &#160;<input name="Radio_T1c" type="Radio" id="Radio_T1c" />
                    &#160;<span class="blackBoldText">T1c</span>
                    &#160;<input name="Radio_T2a" type="Radio" id="Radio_T2a" />
                    &#160;<span class="blackBoldText">T2a</span>
                    &#160;<input name="Radio_T2b" type="Radio" id="Radio_T2b" />
                    &#160;<span class="blackBoldText">T2b</span>
                    &#160;<input name="Radio_T2c" type="Radio" id="Radio_T2c" />
                    &#160;<span class="blackBoldText">T2c</span>
                    &#160;<input name="Radio_T3a" type="Radio" id="Radio_T3a" />
                    &#160;<span class="blackBoldText">T3a</span>
                    &#160;<input name="Radio_T3b" type="Radio" id="Radio_T3b" />
                    &#160;<span class="blackBoldText">T3b</span>
                    &#160;<input name="Radio_T3c" type="Radio" id="Radio_T3c" />
                    &#160;<span class="blackBoldText">T3c</span>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  <!--Prostate Size-->
  <xsl:template match="DxImageProstate" name="ProstateSize">
    <tr>
      <td class="FormOuterTableRow">
        <a name="ProstateSize_Anchor"/>
        <table class="EFormTable" cellspacing="0" border="0">        
          <tr class="EFormTableRow">
            <td colspan="7" class="FormInsideTableTopCell">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Prostate Size</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              &#160;&#160;
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Height(cm)</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Width(cm)</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Length(cm)</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              &#160;&#160;
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Volume(cc)</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>PSA density</strong>
            </td>
          </tr>         
          <tr class="EFormTableRow">
            <td align="left" valign="middle" class="FormInsideTableRegCell" >
              <img src="../../Images/shim.gif" width="4" height="2" />
              <strong>Prostate</strong>
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('ImgProstateHeight', 'ProstateSize')">
              <xsl:value-of select="Diagnostics/DxImageProstate/ImgProstateHeight"  />&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ImgProstateWidth', 'ProstateSize')">
              <xsl:value-of select="Diagnostics/DxImageProstate/ImgProstateWidth"  />&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ImgProstateLength', 'ProstateSize')">
              <xsl:value-of select="Diagnostics/DxImageProstate/ImgProstateLength"  />&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" >
              <strong>x 0.52 =</strong>
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ImgProstateVolume', 'ProstateSize')">
              <xsl:value-of select="Diagnostics/DxImageProstate/ImgProstateVolume"  />&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" >
              <xsl:value-of select="NoTable/ProstatePSADensity"  />&#160;
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td align="left" valign="middle" class="FormInsideTableRegCell" >
              <img src="../../Images/shim.gif" width="4" height="2" />
              <strong>Transition zone</strong>
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('ImgTZ_Height', 'ProstateSize')">
              <xsl:value-of select="Diagnostics/DxImageProstate/ImgTZ_Height"  />&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ImgTZ_Width', 'ProstateSize')">
              <xsl:value-of select="Diagnostics/DxImageProstate/ImgTZ_Width"  />&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ImgTZ_Length', 'ProstateSize')">
              <xsl:value-of select="Diagnostics/DxImageProstate/ImgTZ_Length"  />&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" >
              <strong>x 0.52 =</strong>
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ImgTZ_Volume', 'ProstateSize')">
              <xsl:value-of select="Diagnostics/DxImageProstate/ImgTZ_Volume"  />&#160;
            </td>
            <td align="center" valign="middle" class="FormInsideTableRegCell" >
              <xsl:value-of select="NoTable/TZPSADensity"  />&#160;
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  <!--Hypoechoic Lesion-->
  <xsl:template match="Diagnostics/DxImageFindingsProstate" name="HypoechoicLesion">
    <tr>
      <td class="FormOuterTableRow">
        <a name="HypoechoicLesion_Anchor"/>
        <table class="EFormTable" cellspacing="0" border="0" >
         <tr class="EFormTableRow">
           <td width="0.3%" valign="top" bgcolor="#A9A9A9">
             <img src="../../Images/shim.gif" width="2" height="2" />
           </td>
            <td width="24.7%" align="left" valign="middle" bgcolor="#A9A9A9">
              <span class="blackBoldText">Side:</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#A9A9A9">
              <span class="blackBoldText">Area:</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#A9A9A9">
              <span class="blackBoldText">Zone:</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#A9A9A9">
              <span class="blackBoldText">Cancer/ECE Codes:</span>
            </td>
         </tr>
         <tr class="EFormTableRow">
           <td width="0.3%" valign="top" bgcolor="#DCDCDC">
             <img src="../../Images/shim.gif" width="2" height="2" />
           </td>
            <td width="24.7%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">L - left lateral</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">A - apex</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">P - peripheral</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">1 - definitely no</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="0.3%" valign="top" bgcolor="#DCDCDC">
              <img src="../../Images/shim.gif" width="2" height="2" />
            </td>
            <td width="24.7%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">LM - left medial</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">M - mid</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">T - transition</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">2 - probably no</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="0.3%" valign="top" bgcolor="#DCDCDC">
              <img src="../../Images/shim.gif" width="2" height="2" />
            </td>
            <td width="24.7%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">M - midline</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">B - base</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">&#160;</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">3 - possibly present</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="0.3%" valign="top" bgcolor="#DCDCDC">
              <img src="../../Images/shim.gif" width="2" height="2" />
            </td>
            <td width="24.7%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">RM - right medial</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">SV - seminal vesicle</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">&#160;</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">4 - probably present</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="0.3%" valign="top" bgcolor="#DCDCDC">
              <img src="../../Images/shim.gif" width="2" height="2" />
            </td>
            <td width="24.7%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">R - right lateral</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">&#160;</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">&#160;</span>
            </td>
            <td width="25%" align="left" valign="middle" bgcolor="#DCDCDC">
              <span class="blackBoldText">5 - definitely present</span>
            </td>
          </tr>
        </table><br />

        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="9">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Suspicious Nodules</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="9%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Side</strong>
            </td>
            <td width="9%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Area</strong>
            </td>
            <td width="9%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Zone</strong>
            </td>
            <td width="9%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Height</strong>
            </td>
             <td width="9%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Width</strong>
            </td>
             <td width="9%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Length</strong>
            </td>
             <td width="11%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Cancer</strong>
            </td>
             <td width="11%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>ECE</strong>
            </td>
            <td width="24%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Directed or systematic Bx.</strong>
            </td>
          </tr>
          <!--Hypoechoic lession table-->          
          <xsl:for-each select="Diagnostics/DxImageFindingsProstate">
            <xsl:choose>
              <xsl:when test="((ImgFindSide != '') or (ImgFindLevel != '') or (ImgFindAP != '') or (ImgFindZone != '') or (ImgFindHeight != '') or (ImgFindWidth != '') or (ImgFindLength != '') or (ImgFindResult != '') or (ImgFindExtension != '') or (ImgNotes != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('DxImageFindingsProstate',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="ImgFindSide"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ImgFindLevel"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ImgFindZone"  />&#160;
                  </td>                  
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ImgFindHeight"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ImgFindWidth"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ImgFindLength"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ImgFindResult"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ImgFindExtension"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ImgNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('DxImageFindingsProstate','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  <!--Biopsy US guided (Systematic)-->
    <xsl:template match="NoTable" name="Biopsy">

        <tr>
            <td class="FormOuterTableRow">
                <a name="Biopsy_Anchor" />
                <table class="EFormTable" cellspacing="0" border="0">
                    <tr class="EFormTableRow">
                        <td colspan="3" class="FormInsideTableTopCell">
                            <img src="../../Images/shim.gif" width="4" height="1" />
                            <span class="blackBoldText">Biopsy</span>
                        </td>
                    </tr>
                    <tr class="EFormTableRow">
                        <td width="46%" align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('US_GuidedSystematic', 'Biopsy')">
                            <img src="../../Images/shim.gif" width="2" height="1" />
                            <xsl:for-each select="NoTable">
                                <xsl:choose>
                                    <xsl:when test="((US_GuidedSystematic !=''))">
                                        <input name="CheckBoxUS" type="checkbox" id="CheckBoxUS" checked="checked"  />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <input name="CheckBoxUS" type="checkbox" id="CheckBoxUS"  />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                            <strong>US guided (Systematic)</strong>
                            <xsl:for-each select="NoTable">
                                <xsl:choose>
                                    <xsl:when test="((US_GuidedSystematicNum !=''))">
                                        <strong>
                                            &#160;&#160;#<xsl:value-of select="US_GuidedSystematicNum"/>
                                        </strong>
                                    </xsl:when>
                                    <xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </td>
                        <td width="30%" align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('TZ_Biopsy', 'Biopsy')">
                            <img src="../../Images/shim.gif" width="2" height="1" />
                            <xsl:for-each select="NoTable">
                                <xsl:choose>
                                    <xsl:when test="((TZ_Biopsy !=''))">
                                        <input name="CheckBoxTZ" type="checkbox" id="CheckBoxTZ" checked="checked"  />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <input name="CheckBoxTZ" type="checkbox" id="CheckBoxTZ"  />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                            <strong>2 TZ biopsy</strong>
                        </td>
                        <td width="24%" align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('SV_Biopsy', 'Biopsy')">
                            <img src="../../Images/shim.gif" width="2" height="1" />
                            <xsl:for-each select="NoTable">
                                <xsl:choose>
                                    <xsl:when test="((SV_Biopsy !=''))">
                                        <input name="CheckBoxSV2" type="checkbox" id="CheckBoxSV2" checked="checked"  />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <input name="CheckBoxSV2" type="checkbox" id="CheckBoxSV2"  />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                            <strong>2 SV biopsy</strong>
                        </td>
                    </tr>
                    <tr class="EFormTableRow">
                        <td align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('DirectedBiopsy', 'Biopsy')">
                            <img src="../../Images/shim.gif" width="2" height="1" />
                            <xsl:for-each select="NoTable">
                                <xsl:choose>
                                    <xsl:when test="((DirectedBiopsy !=''))">
                                        <input name="CheckBoxDirected" type="checkbox" id="CheckBoxDirected" checked="checked"  />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <input name="CheckBoxDirected" type="checkbox" id="CheckBoxDirected" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                            <strong>Directed biopsy</strong>
                            <table cellpadding="0">
                                <tr>
                                    <td>
                                        <xsl:for-each select="NoTable">
                                            <xsl:choose>
                                                <xsl:when test="((DirectedBiopsyLocation !=''))">
                                                    <strong>
                                                        &#160;&#160;Location: <xsl:value-of select="DirectedBiopsyLocation"/>
                                                    </strong>
                                                </xsl:when>
                                                <xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="NoTable">
                                            <xsl:choose>
                                                <xsl:when test="((DirectedBiopsyNum !=''))">
                                                    <strong>
                                                        &#160;&#160;# Cores: <xsl:value-of select="DirectedBiopsyNum"/>
                                                    </strong>
                                                </xsl:when>
                                                <xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <xsl:for-each select="NoTable">
                                            <xsl:choose>
                                                <xsl:when test="((DirectedBiopsyLocation2 !=''))">
                                                    <strong>
                                                        &#160;&#160;Location: <xsl:value-of select="DirectedBiopsyLocation2"/>
                                                    </strong>
                                                </xsl:when>
                                                <xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="NoTable">
                                            <xsl:choose>
                                                <xsl:when test="((DirectedBiopsyNum2 !=''))">
                                                    <strong>
                                                        &#160;&#160;# Cores: <xsl:value-of select="DirectedBiopsyNum2"/>
                                                    </strong>
                                                </xsl:when>
                                                <xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="2" align="left" valign="middle" class="FormInsideTableRegCell"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('FingerGuidedBiopsy', 'Biopsy')">
                            <img src="../../Images/shim.gif" width="2" height="1" />
                            <xsl:for-each select="NoTable">
                                <xsl:choose>
                                    <xsl:when test="((FingerGuidedBiopsy !=''))">
                                        <input name="FingerGuidedBiopsy" type="checkbox" id="FingerGuidedBiopsy" checked="checked"  />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <input name="FingerGuidedBiopsy" type="checkbox" id="FingerGuidedBiopsy" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                            <strong>Finger guided biopsy</strong>
                            <table cellpadding="0">
                                <tr>
                                    <td>
                                        <xsl:for-each select="NoTable">
                                            <xsl:choose>
                                                <xsl:when test="((FingerGuidedBiopsyLocation !=''))">
                                                    <strong>
                                                        &#160;&#160;Location: <xsl:value-of select="FingerGuidedBiopsyLocation"/>
                                                    </strong>
                                                </xsl:when>
                                                <xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="NoTable">
                                            <xsl:choose>
                                                <xsl:when test="((FingerGuidedBiopsyNum !=''))">
                                                    <strong>
                                                        &#160;&#160;# Cores: <xsl:value-of select="FingerGuidedBiopsyNum"/>
                                                    </strong>
                                                </xsl:when>
                                                <xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <xsl:for-each select="NoTable">
                                            <xsl:choose>
                                                <xsl:when test="((FingerGuidedBiopsyLocation2 !=''))">
                                                    <strong>
                                                        &#160;&#160;Location: <xsl:value-of select="FingerGuidedBiopsyLocation2"/>
                                                    </strong>
                                                </xsl:when>
                                                <xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="NoTable">
                                            <xsl:choose>
                                                <xsl:when test="((FingerGuidedBiopsyNum2 !=''))">
                                                    <strong>
                                                        &#160;&#160;# Cores: <xsl:value-of select="FingerGuidedBiopsyNum2"/>
                                                    </strong>
                                                </xsl:when>
                                                <xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>
  <!--Prostate Contour-->
  <xsl:template match="Diagnostics/DxImageProstate" name="Contour">
    <tr>
      <td class="FormOuterTableRow">
        <a name="Contour_Anchor"/>
        <table class="EFormTable" cellspacing="0" border ="0">
          <tr class="EFormTableRow">
            <xsl:for-each select="Diagnostics[not(@RecordId)]/DxImageProstate">
                    <td align="left" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ImgProstateContour', 'Contour')">
                      <img src="../../Images/shim.gif" width="4" height="1" />
                      <span class="blackBoldText">Prostate Contour</span>&#160;
                      &#160;
                      <xsl:choose>
                  <xsl:when test="contains(ImgProstateContour, 'Smooth')"><input name="RadioSmooth" type="Radio" id="RadioSmooth" checked="checked" /></xsl:when>
                  <xsl:otherwise><input name="RadioSmooth" type="Radio" id="RadioSmooth" /></xsl:otherwise>
                  </xsl:choose><strong>Smooth</strong>
                      <img src="../../Images/shim.gif" width="2" height="1" />
                      &#160;<xsl:choose>
                  <xsl:when test="contains(ImgProstateContour, 'Irregular')"><input name="RadioIrregular" type="Radio" id="RadioIrregular" checked="checked" /></xsl:when>
                  <xsl:otherwise><input name="RadioIrregular" type="Radio" id="RadioIrregular" /></xsl:otherwise>
                  </xsl:choose><strong>Irregular</strong>
                      <img src="../../Images/shim.gif" width="2" height="1" />
                      &#160;<xsl:choose>
                  <xsl:when test="contains(ImgProstateContour, 'Right')"><input name="RadioRight" type="Radio" id="RadioRight" checked="checked" /></xsl:when>
                  <xsl:otherwise><input name="RadioRight" type="Radio" id="RadioRight" /></xsl:otherwise>
                  </xsl:choose><strong>Right</strong>
                      <img src="../../Images/shim.gif" width="2" height="1" />
                      &#160;<xsl:choose>
                  <xsl:when test="contains(ImgProstateContour, 'Left')"><input name="RadioLeft" type="Radio" id="RadioLeft" checked="checked" /></xsl:when>
                  <xsl:otherwise><input name="RadioLeft" type="Radio" id="RadioLeft" /></xsl:otherwise>
                  </xsl:choose><strong>Left</strong>
                      <img src="../../Images/shim.gif" width="16" height="1" />
                      &#160;<strong>Comment: <xsl:choose>
                        <xsl:when test="((ImgProstateContour != 'Smooth') and (ImgProstateContour != 'Irregular') and (ImgProstateContour != 'Right') and (ImgProstateContour != 'Left'))">
                          <xsl:value-of select="ImgProstateContour"/>
                        </xsl:when>
                        <xsl:otherwise>__________</xsl:otherwise>
                      </xsl:choose></strong>
                    </td>
              </xsl:for-each>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  <!--PostProc Instructions and Comments-->
  <xsl:template match="NoTable" name="PostProcInstructions">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PostProcInsturctions_Anchor"/>
        <table class="EFormTable" cellspacing="0" border ="0">

          <xsl:for-each select="NoTable">
            <xsl:choose>
              <xsl:when test="((PostProcedureInstruction = 'Yes'))">
                <tr class="EFormTableRow">
                  <td align="left" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('PostProcedureInstruction', 'PostProcInstructions')">
                    <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Post procedure instructions were reviewed with patient</span>
                    &#160;<input name="RadioYes_PostProcInstructions" type="Radio" id="RadioYes_PostProcInstructions" checked="Yes" />
                    &#160;<span class="blackBoldText">Yes</span>
                    &#160;<input name="RadioNo_PostProcInstructions" type="Radio" id="RadioNo_PostProcInstructions" />
                    &#160;<span class="blackBoldText">No</span>
                  </td>
                </tr>
                <tr class="EFormTableRow">
                  <td align="left" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('AbnormalComments', 'PostProcInstructions')">
                    <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Comments</span>
                    &#160;<xsl:value-of select="AbnormalComments"/>
                  </td>
                </tr>
                </xsl:when>
                <xsl:when test="((PostProcedureInstruction = 'No'))">
                  <tr class="EFormTableRow">
                    <td align="left" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('PostProcedureInstruction', 'PostProcInstructions')">
                      <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Post procedure instructions were reviewed with patient</span>
                      &#160;<input name="RadioYes_PostProcInstructions" type="Radio" id="RadioYes_PostProcInstructions"  />
                      &#160;<span class="blackBoldText">Yes</span>
                      &#160;<input name="RadioNo_PostProcInstructions" type="Radio" id="RadioNo_PostProcInstructions" checked="Yes" />
                      &#160;<span class="blackBoldText">No</span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td align="left" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('AbnormalComments', 'PostProcInstructions')">
                      <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Comments</span>
                      &#160;<xsl:value-of select="AbnormalComments"/>
                    </td>
                  </tr>
                </xsl:when>
                <xsl:otherwise>
                  <tr class="EFormTableRow">
                    <td align="left" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('PostProcedureInstruction', 'PostProcInstructions')">
                      <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Post procedure instructions were reviewed with patient</span>
                      &#160;<input name="RadioYes_PostProcInstructions" type="Radio" id="RadioYes_PostProcInstructions"  />
                      &#160;<span class="blackBoldText">Yes</span>
                      &#160;<input name="RadioNo_PostProcInstructions" type="Radio" id="RadioNo_PostProcInstructions" />
                      &#160;<span class="blackBoldText">No</span>
                    </td>
                  </tr>
                  <tr class="EFormTableRow">
                    <td align="left" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('AbnormalComments', 'PostProcInstructions')">
                      <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Comments</span>
                      &#160;<xsl:value-of select="AbnormalComments"/>
                    </td>
                  </tr>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>         
        </table>
      </td>
    </tr>
  </xsl:template>
  <!--Verification of Attending Presence-->
  <xsl:template match="Procedures" name="AttendingPresence">
    <tr>
      <td class="FormOuterTableRow">
        <a name="AttendingPresence_Anchor"/>
        <table class="EFormTable" cellspacing="0" border ="0">
          <tr class="EFormTableRow">
            <td bgcolor="#DCDCDC" >
              <img src="../../Images/shim.gif" width="2" height="1" />
              <span class="blackBoldText">Verification of Attending Presence</span>
            </td>
          </tr>
            <xsl:for-each select="Procedures[position() = 1]">
                <xsl:choose>
              <xsl:when test="((ProcNotes = 'I was present for the entire procedure'))">
                <tr class="EFormTableRow">
                  <td align="left" valign="middle" class="FormInsideTableTopCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProcNotes', 'AttendingPresence')">
                    <img src="../../Images/shim.gif" width="2" height="1" />
                    <input name="RadioYes_AttendingPresence" type="Radio" id="RadioYes_AttendingPresence" checked="Yes" />
                    &#160;<span class="blackBoldText">I was present for the entire procedure</span><br />
                    <img src="../../Images/shim.gif" width="2" height="1" />
                    <input name="RadioNo_AttendingPresence" type="Radio" id="RadioNo_AttendingPresence" />
                    &#160;<span class="blackBoldText">I was present for all key portions of the procedure, including but not limited to radiologic interpretation on </span><br />
                    <span class="blackBoldText">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;ultra-sonographic findings and needle guided biopsy</span><br />
                  </td>
                </tr>
              </xsl:when>
              <xsl:when test="((ProcNotes = ''))">
                <tr class="EFormTableRow">
                  <td align="left" valign="middle" class="FormInsideTableTopCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProcNotes', 'AttendingPresence')">
                    <img src="../../Images/shim.gif" width="2" height="1" />
                    <input name="RadioYes_AttendingPresence" type="Radio" id="RadioYes_AttendingPresence" />
                    &#160;<span class="blackBoldText">I was present for the entire procedure</span><br />
                  <img src="../../Images/shim.gif" width="2" height="1" />
                  <input name="RadioNo_AttendingPresence" type="Radio" id="RadioNo_AttendingPresence" />
                    &#160;<span class="blackBoldText">I was present for all key portions of the procedure, including but not limited to radiologic interpretation on </span><br />
                    <span class="blackBoldText">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;ultra-sonographic findings and needle guided biopsy</span><br />
                  </td>
            </tr>
          </xsl:when>
          <xsl:otherwise>
            <tr class="EFormTableRow">
              <td align="left" valign="middle" class="FormInsideTableTopCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProcNotes', 'AttendingPresence')">
                <img src="../../Images/shim.gif" width="2" height="1" />
                <input name="RadioYes_AttendingPresence" type="Radio" id="RadioYes_AttendingPresence" />
                &#160;<span class="blackBoldText">I was present for the entire procedure</span><br />
                  <img src="../../Images/shim.gif" width="2" height="1" />
                  <input name="RadioNo_AttendingPresence" type="Radio" id="RadioNo_AttendingPresence" checked="Yes" />
                &#160;<span class="blackBoldText">I was present for all key portions of the procedure, including but not limited to radiologic interpretation on </span><br />
                <span class="blackBoldText">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;ultra-sonographic findings and needle guided biopsy</span><br />
              </td>
            </tr>
          </xsl:otherwise>
         </xsl:choose>
        </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>
  
  <!--Disposition-->
  <xsl:template match="NoTable" name="Disposition">
    <tr>
      <td class="FormOuterTableRow">
        <a name="Disposition_Anchor"/>
        <table class="EFormTable" cellspacing="0" border ="0">
          <tr class="EFormTableRow" >
            <td bgcolor="#DCDCDC" >
              <img src="../../Images/shim.gif" width="2" height="1" />
              <span class="blackBoldText">Disposition</span>
            </td>
          </tr>

          <xsl:for-each select="NoTable">
            <xsl:choose>
              <xsl:when test="((Disposition = 'Discharge Home'))">
                <tr class="EFormTableRow">
                  <td align="left" valign="middle" class="FormInsideTableTopCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Disposition', 'Disposition')">
                    <img src="../../Images/shim.gif" width="2" height="1" />
                    <input name="RadioYes_Disposition" type="Radio" id="RadioYes_Disposition" checked="Yes" />
                    &#160;<span class="blackBoldText">
                    Discharge Home</span><br />
                    <img src="../../Images/shim.gif" width="2" height="1" />
                    <input name="RadioNo_Disposition" type="Radio" id="RadioNo_Disposition" />
                    &#160;<span class="blackBoldText">Transfer to UCC</span><br />
                    <img src="../../Images/shim.gif" width="2" height="1" />
                    <input name="RadioOther" type="Radio" id="RadioOther" />
                    &#160;<span class="blackBoldText">
                      Other Specify:
                    </span><br />
                    </td>
            </tr>
          </xsl:when>
          <xsl:when test="((Disposition = 'Transfer to UCC'))">
            <tr class="EFormTableRow">
              <td align="left" valign="middle" class="FormInsideTableTopCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Disposition', 'Disposition')">
                <img src="../../Images/shim.gif" width="2" height="1" />
                <input name="RadioYes_Disposition" type="Radio" id="RadioYes_Disposition" />
                &#160;<span class="blackBoldText">Discharge Home</span><br />
                <img src="../../Images/shim.gif" width="2" height="1" />
                <input name="RadioNo_Disposition" type="Radio" id="RadioNo_Disposition" checked="Yes" />
                &#160;<span class="blackBoldText">
                  Transfer to UCC
                </span><br />
                <img src="../../Images/shim.gif" width="2" height="1" />
                <input name="RadioOther" type="Radio" id="RadioOther" />
                &#160;<span class="blackBoldText">Other Specify: </span><br />
                  </td>
                </tr>
              </xsl:when>
              <xsl:when test="((Disposition = ''))">
                <tr class="EFormTableRow">
                  <td align="left" valign="middle" class="FormInsideTableTopCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Disposition', 'Disposition')">
                    <img src="../../Images/shim.gif" width="2" height="1" />
                    <input name="RadioYes_Disposition" type="Radio" id="RadioYes_Disposition" />
                    &#160;<span class="blackBoldText">
                    Discharge Home</span><br />
                    <img src="../../Images/shim.gif" width="2" height="1" />
                    <input name="RadioNo_Disposition" type="Radio" id="RadioNo_Disposition" />
                    &#160;<span class="blackBoldText">
                      Transfer to UCC
                    </span><br />
                      <img src="../../Images/shim.gif" width="2" height="1" />
                      <input name="RadioOther" type="Radio" id="RadioOther" />
                      &#160;<span class="blackBoldText">Other Specify: </span><br />
                    </td>
              </tr>
            </xsl:when>
            <xsl:otherwise>
              <tr class="EFormTableRow">
                <td align="left" valign="middle" class="FormInsideTableTopCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Disposition', 'Disposition')">
                  <img src="../../Images/shim.gif" width="2" height="1" />
                  <input name="RadioYes_Disposition" type="Radio" id="RadioYes_Disposition" />
                  &#160;<span class="blackBoldText">Discharge Home</span><br />
                    <img src="../../Images/shim.gif" width="2" height="1" />
                    <input name="RadioNo_Disposition" type="Radio" id="RadioNo_Disposition" />
                    &#160;<span class="blackBoldText">Transfer to UCC</span><br />
                    <img src="../../Images/shim.gif" width="2" height="1" />
                    <input name="RadioOther" type="Radio" id="RadioOther" checked="Yes"/>
                    &#160;<span class="blackBoldText">Other Specify: </span><xsl:value-of select="Disposition"/><br />
                  </td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>


  <!--Family History Table-->
  <xsl:template name="PatientsFamilyMembersTable">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsFamilyMembers_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td align="left" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Family History</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Side of Family</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Relation</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Death Age</strong>
            </td>
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Diagnosis</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Age</strong>
            </td>
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>
          <!--Family History from the Database-->
          <xsl:value-of select="$PatientsFamilyMembersRows" disable-output-escaping="yes"/>
          <xsl:for-each select="FamilyMembers">
            <xsl:choose>
              <xsl:when test="((FamMemSide != '') or (FamMemRelation != '') or (FamMemDeathAge != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('FamilyMembers','')" >
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" >
                    <xsl:value-of select="FamMemSide"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="FamMemRelation"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="FamMemDeathAge"  />&#160;
                  </td>


                  <xsl:for-each select="FamilyMemberDiagnosis" >
                    <xsl:choose>
                      <xsl:when test="((FamMemDiagnosis != '') or (FamMemDiagnosisAge != '') or (FamMemNotes != ''))">

                        <xsl:if test="position() != 1" >
                          <tr></tr>
                          <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                        </xsl:if>

                        <td align="center" valign="middle" class="FormInsideTableRegCell" >
                          <xsl:value-of select="FamMemDiagnosis" />&#160;
                        </td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell" >
                          <xsl:value-of select="FamMemDiagnosisAge"  />&#160;
                        </td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell" >
                          <xsl:value-of select="FamMemNotes"  />&#160;
                        </td>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('FamilyMembers','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>

        </table>
      </td>
    </tr>
  </xsl:template>


  <!--Social History Table-->
  <xsl:template name="PatientsSocialHistoriesTable">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsSocialHistories_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td align="left" valign="middle" colspan="5">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Social History</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Occupation</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Marital Status</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Children</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Tobacco Type</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Tobacco Usage</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Year Quit</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Alcohol Use</strong>
            </td>
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Carcinogen Exposure</strong>
            </td>
          </tr>


          <xsl:if test="($HasSocialHistory = 'No')" >
        
            <xsl:for-each select="SocialHistories">
              <xsl:choose>
                <xsl:when test="((SocHxOccupation != '') or (SocHxMaritalStatus != '') or (SocHxChildren != '') or (SocHxTobaccoType != '') or (SocHxTobaccoPacksPerDay != '') or (SocHxTobaccoYears != '') or (SocHxTobaccoQuitYear != '') or (SocHxAlcohol != '') or (SocHxCarcinogen != ''))">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="SocHxOccupation"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="SocHxMaritalStatus"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="SocHxChildren"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="SocHxTobaccoType"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:if test="(SocHxTobaccoPacksPerDay != '' or SocHxTobaccoYears != '' )">
                        <xsl:value-of select="SocHxTobaccoPacksPerDay"  />&#160;packs/day for&#160;<xsl:value-of select="SocHxTobaccoYears"  />&#160;years&#160;
                      </xsl:if>&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="SocHxTobaccoQuitYear"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="SocHxAlcohol"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="SocHxCarcinogen"  />&#160;
                    </td>
                  </tr>
                </xsl:when>
                <xsl:otherwise>
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                  </tr>
                </xsl:otherwise>
              </xsl:choose>
        </xsl:for-each>
      </xsl:if>

          <xsl:if test="($HasSocialHistory = 'Yes')" >

            <!--SocialHistories from the Database (Database currently only supports one SocialHistories)-->
            <xsl:value-of select="$PatientsSocialHistoriesRows" disable-output-escaping="yes"/>

          </xsl:if>

        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Social History Table-->
  <xsl:template name="PatientsSocialHistoriesTableCurrent">
    <tr>
      <td class="FormOuterTableRow">
        <a name="PatientsSocialHistories_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td align="left" valign="middle" colspan="7">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Current Social History</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Occupation</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Marital Status</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Children</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Tobacco Type</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Tobacco Usage</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Year Quit</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Alcohol Use</strong>
            </td>
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Carcinogen Exposure</strong>
            </td>
            <xsl:value-of select="$PatientsSocialHistoriesRows" disable-output-escaping="yes"/>
          </tr>
          <tr class="EFormTableRow" >
            <td align="center" valign="middle" class="FormInsideTableLeftCell" colspan="8">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  
  <!--Template: Prostate Biopsies Values Matches BiopsiesProstate2-->
  <xsl:template match="BiopsiesProstate" name="BiopsiesProstateTable2">
    <tr>
      <td class="FormOuterTableRow">
        <a name="BiopsiesProstate_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="6">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Biopsies</span>
            </td>
          </tr>
          <tr class="EFormTableRow" >
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Type</strong>
            </td>
            <td width="5%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>G 1</strong>
            </td>
            <td width="5%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>G 2</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Result</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>PIN</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>ASAP</strong>
            </td>
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>
          <!--Prostate Biopsy data from the database-->
          <xsl:value-of select="$ProstateBiopsyRows" disable-output-escaping="yes"/>
          <xsl:for-each select="Pathology">
            <xsl:choose>
              <xsl:when test="((PathDateText != '') or (PathSpecimenType != '') or (PathResult != '') or (PathNotes != '') or (ProstateBiopsyPath/PathGG1 != '') or (ProstateBiopsyPath/PathGG2 != '') or (ProstateBiopsyPath/PathASAP != '') or (ProstateBiopsyPath/PathHG_PIN != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Pathology',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="PathDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathSpecimenType"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProstateBiopsyPath/PathGG1"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProstateBiopsyPath/PathGG2"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathResult"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProstateBiopsyPath/PathHG_PIN"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="ProstateBiopsyPath/PathASAP"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="PathNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <!-- empty row for adding new ones -->
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Pathology','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: Other Previous Prostate Biopsies Values -->
  <xsl:template match="BiopsiesProstate" name="PreviousOtherBiopsiesProstate">
    <tr>
      <td class="FormOuterTableRow">
        <a name="BiopsiesProstate_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="6">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Other Biopsies</span>
            </td>
          </tr>
          <tr class="EFormTableRow" >
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Type</strong>
            </td>
            <td width="5%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>G 1</strong>
            </td>
            <td width="5%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>G 2</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Result</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>PIN</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>ASAP</strong>
            </td>
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>
          <!--Prostate Biopsy data from the database-->
          <xsl:value-of select="$ProstateBiopsyRows" disable-output-escaping="yes"/>
          <!-- empty row for adding new ones -->
          <tr class="EFormTableRow" >
            <td align="center" valign="middle" class="FormInsideTableLeftCell" colspan="8">&#160;</td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: Prostate Biopsies Values Matches BiopsiesProstateDiagnostic-->
  <xsl:template match="BiopsiesProstate" name="BiopsiesProstateDiagnosticTable">
    <tr>
      <td class="FormOuterTableRow">
        <a name="BiopsiesProstate_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="12">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Diagnostic Biopsies </span>
            </td>
          </tr>
          <tr class="EFormTableRow" >
            <td align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Data Quality</strong>
            </td>
            <td align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>G1</strong>
            </td>
            <td align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>G2</strong>
            </td>
            <td align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>GS</strong>
            </td>
            <td align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Result</strong>
            </td>
            <td align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Cores</strong>
            </td>
            <td align="center" valign="middle" class="FormInsideTableTopCell" colspan="5">
              <strong>Notes</strong>
            </td>
          </tr>
          
            <!--Prostate Biopsy data from the database-->
            <xsl:value-of select="$DiagnosticProstateBiopsyRows" disable-output-escaping="yes"/>
          <xsl:for-each select="Pathology">
              <xsl:choose>
                <xsl:when test="( ((PathDateText != '') or (PathResult != '') or (PathQuality != '') or (PathNotes != '')  or (ProstateBiopsyPath/PathGGS != '') or (ProstateBiopsyPath/PathPosCores != '') or (ProstateBiopsyPath/PathNumCores != '') ) or ((ProstateBiopsyCorePath/PathCoreZone != '') or (PathCoreNumCores != '') or (PathCoreGG1 != '') or (PathCoreGGS != '') or (PathCorePercCancer != '') or (PathCoreCancerLength != '') or (PathCoreLength != '') or (PathCorePerineuralInv != '') or (PathCoreASAP != '') or (PathCoreHG_PIN != '')))">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Pathology',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="PathDateText"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="PathQuality"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      &#160;<xsl:value-of select="ProstateBiopsyPath/PathGG1"  />
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      &#160;<xsl:value-of select="ProstateBiopsyPath/PathGG2"  />
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      &#160;<xsl:value-of select="ProstateBiopsyPath/PathGGS"  />
                    </td>

                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      <xsl:value-of select="PathResult"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell">
                      Positive:&#160;<xsl:value-of select="ProstateBiopsyPath/PathPosCores"  />
                      Total:&#160;<xsl:value-of select="ProstateBiopsyPath/PathNumCores"  />
                    </td>

                    <td align="center" valign="middle" class="FormInsideTableRegCell" colspan="5">
                      <xsl:value-of select="PathNotes"  />&#160;
                    </td>



 

                    <tr class="EFormTableRow" >
                      <td align="center" valign="middle" class="FormInsideTableTopLeftCell" colspan="1">
                        <strong></strong>
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableTopLeftCell">
                        <strong>Zone</strong>
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">
                        <strong>#Cores</strong>
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">
                        <strong>GG1</strong>
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">
                        <strong>GG2</strong>
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">
                        <strong>GGS</strong>
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">
                        <strong>%Ca</strong>
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">
                        <strong>mmCa</strong>
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">
                        <strong>mmCore</strong>
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">
                        <strong>PNI</strong>
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">
                        <strong>ASAP</strong>
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">
                        <strong>HG PIN</strong>
                      </td>
                   </tr>

                  <xsl:for-each select="ProstateBiopsyCorePath">
                    <xsl:choose>
                      <xsl:when test="((PathCoreZone != '') or (PathCoreNumCores != '') or (PathCoreGG1 != '') or (PathCoreGGS != '') or (PathCorePercCancer != '') or (PathCoreCancerLength != '') or (PathCoreLength != '') or (PathCorePerineuralInv != '') or (PathCoreASAP != '') or (PathCoreHG_PIN != ''))">
                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('ProstateBiopsyCorePath',{./@RecordId})">

                          <td align="center" valign="middle" class="FormInsideTableLeftCell" colspan="1">
                            &#160;
                          </td>
                          <td align="center" valign="middle" class="FormInsideTableLeftCell"  onclick="LoadComponentByTable('ProstateBiopsyCorePath',{./@RecordId})">
                            <xsl:value-of select="PathCoreZone"  />&#160;
                          </td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell"  onclick="LoadComponentByTable('ProstateBiopsyCorePath',{./@RecordId})">
                            <xsl:value-of select="PathCoreNumCores"  />&#160;
                          </td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell"  onclick="LoadComponentByTable('ProstateBiopsyCorePath',{./@RecordId})">
                            &#160;<xsl:value-of select="PathCoreGG1"  />
                          </td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell"  onclick="LoadComponentByTable('ProstateBiopsyCorePath',{./@RecordId})">
                            &#160;<xsl:value-of select="PathCoreGG2"  />
                          </td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell"  onclick="LoadComponentByTable('ProstateBiopsyCorePath',{./@RecordId})">
                            &#160;<xsl:value-of select="PathCoreGGS"  />
                          </td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell"  onclick="LoadComponentByTable('ProstateBiopsyCorePath',{./@RecordId})">
                            <xsl:value-of select="PathCorePercCancer"  />&#160;
                          </td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell"  onclick="LoadComponentByTable('ProstateBiopsyCorePath',{./@RecordId})">
                            <xsl:value-of select="PathCoreCancerLength"  />&#160;
                          </td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell"  onclick="LoadComponentByTable('ProstateBiopsyCorePath',{./@RecordId})">
                            <xsl:value-of select="PathCoreLength"  />&#160;
                          </td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell"  onclick="LoadComponentByTable('ProstateBiopsyCorePath',{./@RecordId})">
                            <xsl:value-of select="PathCorePerineuralInv"  />&#160;
                          </td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell"  onclick="LoadComponentByTable('ProstateBiopsyCorePath',{./@RecordId})">
                            <xsl:value-of select="PathCoreASAP"  />&#160;
                          </td>
                          <td align="center" valign="middle" class="FormInsideTableRegCell"  onclick="LoadComponentByTable('ProstateBiopsyCorePath',{./@RecordId})">
                            <xsl:value-of select="PathCoreHG_PIN"  />&#160;
                          </td>
                        </tr>
                        <tr></tr>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>
                  
                </tr>
                  <tr >
                    <td align="center" valign="middle" class="FormInsideTableLeftCell" colspan="12">&#160;</td>
                  </tr>
                </xsl:when>
            </xsl:choose>
          </xsl:for-each>
            <!-- empty row for adding new ones -->
            <!--<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('ProstateBiopsyCorePath','')">
              <td align="center" valign="middle" class="FormInsideTableLeftCell" colspan="12">&#160;</td>
            </tr>-->         
         </table>


        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="12">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">TRUS Volumes </span>
            </td>
          </tr>
          <tr class="EFormTableRow" >
            <td width="50%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Diagnostic Biopsy Date</strong>
            </td>
            <td width="50%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Volume (cc)</strong>
            </td>
          </tr>
          <!--Prostate Biopsy data from the database-->
          <xsl:value-of select="$DiagnosticProstateBiopsyTRUSRows" disable-output-escaping="yes"/>
          
          <tr class="EFormTableRow" >
            <xsl:for-each select="Diagnostics">
              <xsl:choose>
                <xsl:when test="((DxType = 'TRUS'))">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" >
                    <td width="50%" align="center" valign="middle" class="FormInsideTableLeftCell"  onclick="LoadComponentByTable('Diagnostics',{./@RecordId})">
                      <xsl:value-of select="DxDateText"  />&#160;
                    </td>
                    <td width="50%" align="center" valign="middle" class="FormInsideTableLeftCell"  onclick="LoadComponentByTable('DxImageProstate',{./@RecordId})">
                      <xsl:value-of select="DxImageProstate/ImgProstateVolume"  />&#160;
                    </td>
                  </tr>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
            <!-- empty row for adding new ones -->
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics',21)">
              <td colspan="2" align="center" valign="middle" class="FormInsideTableLeftCell"  >
                &#160;
              </td>
            </tr>
          </tr>
        </table>

      </td>
    </tr>
  </xsl:template>

  <!--Template: Dictated-->
  <xsl:template match="Encounters/NoTable" name="DispoDictatedTable">
    <tr>
      <td class="FormOuterTableRow">
        <a name="DispoDictated_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Dictated</strong>
            </td>
          </tr>
          <xsl:for-each select="NoTable">
            <xsl:choose>
              <xsl:when test="((Dictated != ''))">
                <tr class="EFormTableRow">
                   <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Dictated', 'BillingDetails')">
                    <xsl:value-of select="Dictated"  />&#160;
                  </td>
                  <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell" colspan="3"></td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableRegCell"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Dictated', 'BillingDetails')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" colspan="3" >&#160;</td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--PatientPhysicansNameKey and PatientPhysicans combined in one Row-->
  <xsl:template name="PatitentPhysiciansAndKeyTable">
    <tr>
      <td class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td width="50%" valign="top">
              <xsl:call-template name="PatientPhysiciansNameKeyTable"/>
            </td>
            <td width="50%" valign="top">
              <xsl:call-template name="PatientPhysiciansTable"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--PatientPhysicans Name Key alone-->
  <xsl:template name="PatientPhysiciansNameKeyReferringTableOnly">
    <tr>
      <td class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td width="50%" valign="top">
              <xsl:call-template name="PatientPhysiciansNameKeyReferringTable"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  
  <!--PatientPhysicans table alone-->
  <xsl:template name="PatitentPhysiciansTableOnly">
    <tr>
      <td class="FormOuterTableRow">
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td width="50%" valign="top">
              <xsl:call-template name="PatientPhysiciansTable"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  

  <!--Template: Patient Physician Values Matches PatientsPhysicians-->
  <xsl:template match="PatientPhysicians" name="PatientPhysiciansTable">    
         <a name="PatientPhysicians_Anchor"/>

        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="3">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">&#160;</span>
            </td>
          </tr>
          <tr class="EFormTableRow" >
            <!--<td width="30%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>ID</strong>
            </td>-->
            <td width="30%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Role</strong>
            </td>
          </tr>
          <!--Patient Physician data from the database-->
          <xsl:value-of select="$PatientPhysiciansRows" disable-output-escaping="yes"/>
          <xsl:for-each select="Patients/PatientPhysicians">
              <xsl:choose>
                
                <xsl:when test="((PhysicianId != '') or (PtPhRole != '') )">

                  <xsl:variable name="PhName" select="concat('PatientPhysician',PhysicianId)" ></xsl:variable>
                                    
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians',{./@RecordId})">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="PtPhRole"  />&#160;
                    </td>
                  </tr>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
          <!-- empty row for adding new ones -->
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
          </tr>

          </table>
  </xsl:template>
  
  <!--Template: Patient Physician Values Matches PatientsPhysiciansKeyTable-->
  <xsl:template match="PatientPhysicians" name="PatientPhysiciansNameKeyTable">
    
        <a name="PatientPhysicians_Anchor"/>

        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td >
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Patient Physicians</span>
            </td>
          </tr>
          <tr class="EFormTableRow" >
            <td width="100%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Physician Name</strong>
            </td>
          </tr>
          
          <!--Patient Physician data from the database-->
          <xsl:value-of select="$PatientPhysiciansNameKeyRows" disable-output-escaping="yes"/>
          <xsl:for-each select="NoTable">
            <xsl:choose>
              <xsl:when test="((PatientPhysicians_PhName_1 != '') or (PatientPhysicians_PhName_2 != '') or (PatientPhysicians_PhName_3 != '') or (PatientPhysicians_PhName_4 != '') or (PatientPhysicians_PhName_5 != '') or (PatientPhysicians_PhName_6 != '') or (PatientPhysicians_PhName_7 != '') or (PatientPhysicians_PhName_8 != '') or (PatientPhysicians_PhName_9 != '') or (PatientPhysicians_PhName_10 != '') )">
                <xsl:if test="(PatientPhysicians_PhName_1 != '')">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','1')">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="PatientPhysicians_PhName_1"  />&#160;
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="(PatientPhysicians_PhName_2 != '')">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','2')">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="PatientPhysicians_PhName_2"  />&#160;
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="(PatientPhysicians_PhName_3 != '')">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','3')">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="PatientPhysicians_PhName_3"  />&#160;
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="(PatientPhysicians_PhName_4 != '')">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','4')">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="PatientPhysicians_PhName_4"  />&#160;
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="(PatientPhysicians_PhName_5 != '')">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','5')">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="PatientPhysicians_PhName_5"  />&#160;
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="(PatientPhysicians_PhName_6 != '')">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','6')">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="PatientPhysicians_PhName_6"  />&#160;
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="(PatientPhysicians_PhName_7 != '')">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','7')">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="PatientPhysicians_PhName_7"  />&#160;
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="(PatientPhysicians_PhName_8 != '')">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','8')">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="PatientPhysicians_PhName_8"  />&#160;
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="(PatientPhysicians_PhName_9 != '')">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','9')">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="PatientPhysicians_PhName_9"  />&#160;
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="(PatientPhysicians_PhName_10 != '')">
                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','10')">
                    <td align="center" valign="middle" class="FormInsideTableLeftCell">
                      <xsl:value-of select="PatientPhysicians_PhName_10"  />&#160;
                    </td>
                  </tr>
                </xsl:if>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <!--empty row for adding new ones-->
          <tr class="EFormTableRow" >
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
          </tr>
        </table>

  </xsl:template>

  <!--Template: Patient Physician Values Matches PatientsPhysiciansKeyTable-->
  <xsl:template match="PatientPhysicians" name="PatientPhysiciansNameKeyReferringTable">

    <a name="PatientPhysicians_Anchor"/>

    <table class="EFormTable" cellspacing="0">
      <tr class="EFormTableRow">
        <td >
          <img src="../../Images/shim.gif" width="4" height="1" />
          <span class="blackBoldText">Referring MD(s)</span>
        </td>
      </tr>

      <!--Patient Physician data from the database-->
      <xsl:value-of select="$PatientPhysiciansReferringNameKeyRows" disable-output-escaping="yes"/>
      <xsl:for-each select="NoTable">
        <xsl:choose>
          <xsl:when test="((PatientPhysicians_PhName_1 != '') or (PatientPhysicians_PhName_2 != '') or (PatientPhysicians_PhName_3 != '') or (PatientPhysicians_PhName_4 != '') or (PatientPhysicians_PhName_5 != '') or (PatientPhysicians_PhName_6 != '') or (PatientPhysicians_PhName_7 != '') or (PatientPhysicians_PhName_8 != '') or (PatientPhysicians_PhName_9 != '') or (PatientPhysicians_PhName_10 != '') )">
            <xsl:if test="(PatientPhysicians_PhName_1 != '')">
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','1')">
                <td align="center" valign="middle" class="FormInsideTableLeftCell">
                  <xsl:value-of select="PatientPhysicians_PhName_1"  />&#160;
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(PatientPhysicians_PhName_2 != '')">
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','2')">
                <td align="center" valign="middle" class="FormInsideTableLeftCell">
                  <xsl:value-of select="PatientPhysicians_PhName_2"  />&#160;
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(PatientPhysicians_PhName_3 != '')">
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','3')">
                <td align="center" valign="middle" class="FormInsideTableLeftCell">
                  <xsl:value-of select="PatientPhysicians_PhName_3"  />&#160;
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(PatientPhysicians_PhName_4 != '')">
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','4')">
                <td align="center" valign="middle" class="FormInsideTableLeftCell">
                  <xsl:value-of select="PatientPhysicians_PhName_4"  />&#160;
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(PatientPhysicians_PhName_5 != '')">
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','5')">
                <td align="center" valign="middle" class="FormInsideTableLeftCell">
                  <xsl:value-of select="PatientPhysicians_PhName_5"  />&#160;
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(PatientPhysicians_PhName_6 != '')">
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','6')">
                <td align="center" valign="middle" class="FormInsideTableLeftCell">
                  <xsl:value-of select="PatientPhysicians_PhName_6"  />&#160;
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(PatientPhysicians_PhName_7 != '')">
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','7')">
                <td align="center" valign="middle" class="FormInsideTableLeftCell">
                  <xsl:value-of select="PatientPhysicians_PhName_7"  />&#160;
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(PatientPhysicians_PhName_8 != '')">
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','8')">
                <td align="center" valign="middle" class="FormInsideTableLeftCell">
                  <xsl:value-of select="PatientPhysicians_PhName_8"  />&#160;
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(PatientPhysicians_PhName_9 != '')">
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','9')">
                <td align="center" valign="middle" class="FormInsideTableLeftCell">
                  <xsl:value-of select="PatientPhysicians_PhName_9"  />&#160;
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="(PatientPhysicians_PhName_10 != '')">
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','10')">
                <td align="center" valign="middle" class="FormInsideTableLeftCell">
                  <xsl:value-of select="PatientPhysicians_PhName_10"  />&#160;
                </td>
              </tr>
            </xsl:if>
          </xsl:when>
        </xsl:choose>
      </xsl:for-each>
      <!--empty row for adding new ones-->
      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientPhysicians','1')">
        <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
      </tr>
    </table>

  </xsl:template>
  <!--EncountersAssessment : Match=Encounters-->
  <xsl:template match="Encounters" name="EncountersAssessmentTable">
    <tr>
      <td class="FormOuterTableRow">
        <a name="EncountersAssessment_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="8">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Performance</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>ECOG</strong>
            </td>
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>KPS</strong>
            </td>
          </tr>
          <xsl:for-each select="Encounters">
            <xsl:choose>
              <xsl:when test="((EncKPS != '') or (EncECOG_Score != ''))">
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncECOG_Score', 'Encounters')">
                    <xsl:value-of select="EncECOG_Score"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncKPS', 'Encounters')">
                    <xsl:value-of select="EncKPS"  />&#160;
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncECOG_Score', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncKPS', 'Encounters')">&#160;</td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>


  <!--EncountersVitalSignsTable2 : Match=Encounters-->
<xsl:template match="Encounters" name="EncountersVitalSignsTable2">
    <tr>
      <td class="FormOuterTableRow">
        <a name="EncountersVitalSigns_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="8">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Encounter</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Height (cm)</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Weight (kg)</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>BSA</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>BMI</strong>
            </td>
            <td width="48%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>


          </tr>
          <xsl:for-each select="Encounters">
            <xsl:choose>
              <xsl:when test="((EncDate != '') or (EncHeight != '') or (EncWeight != '') or (EncBSA != '') or (EncBMI != ''))">
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncDate', 'Encounters')">
                    <xsl:value-of select="EncDate"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncHeight', 'Encounters')">
                    <xsl:value-of select="EncHeight"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncWeight', 'Encounters')">
                    <xsl:value-of select="EncWeight"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncBSA', 'Encounters')">
                    <xsl:value-of select="EncBSA"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncBMI', 'Encounters')">
                    <xsl:value-of select="EncBMI"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncNotes', 'Encounters')">
                    <xsl:value-of select="EncNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncDate', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncHeight', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncWeight', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBSA', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBMI', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncNotes', 'Encounters')">&#160;</td>

                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>


  <!--EncountersVitalSignsTable4 : Match=Encounters-->
<xsl:template match="Encounters" name="EncountersVitalSignsTable4">
    <tr>
      <td class="FormOuterTableRow">
        <a name="EncountersVitalSigns_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="8">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Encounter</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Height (cm)</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Weight (kg)</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>BSA</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>BMI</strong>
            </td>
          </tr>
          <xsl:for-each select="Encounters">
            <xsl:choose>
              <xsl:when test="((EncHeight != '') or (EncWeight != '') or (EncBSA != '') or (EncBMI != ''))">
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncHeight', 'Encounters')">
                    <xsl:value-of select="EncHeight"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncWeight', 'Encounters')">
                    <xsl:value-of select="EncWeight"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncBSA', 'Encounters')">
                    <xsl:value-of select="EncBSA"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncBMI', 'Encounters')">
                    <xsl:value-of select="EncBMI"  />&#160;
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncHeight', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncWeight', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBSA', 'Encounters')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBMI', 'Encounters')">&#160;</td>

                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--EncountersAssessmentMobility : Match=Surveys-->
  <xsl:template match="Surveys" name="EncountersAssessmentMobilityTable">
    <tr>
      <td class="FormOuterTableRow">
        <a name="EncountersAssessmentMobility_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="8">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Performance</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="16%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Assessment Type</strong>
            </td>
            <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Result</strong>
            </td>
            <td width="48%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>


          </tr>
          <xsl:for-each select="Surveys">
            <xsl:choose>
              <xsl:when test="((SurveyDateText != '') or (SurveyType != '') or (SurveyResult != '') or (SurveyNotes != ''))">
                <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('Surveys','')" >
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="SurveyDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="SurveyType"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="SurveyResult"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="SurveyNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
            <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('Surveys','')">
              <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >&#160;</td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >&#160;</td>
              <td align="center" valign="middle" class="FormInsideTableRegCell" >&#160;</td>
            </tr>
        </table>
      </td>
    </tr>
  </xsl:template>


  <!--ProceduresOsteoTable : Match=Procedures-->
  <xsl:template match="Procedures" name="ProceduresOsteoTable">
    <tr>
      <td class="FormOuterTableRow">
        <a name="ProceduresOsteo_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="8">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Surgeries</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="5%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Pending</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Site/Bone</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Side</strong>
            </td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Surgery</strong>
            </td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Surgeon</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Indication</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell" >
              <strong>Notes</strong>
            </td>
          </tr>
          
          <xsl:value-of select="$SurgicalHistoryRows" disable-output-escaping="yes"/>

          <xsl:for-each select="Procedures">
              <xsl:choose>
                  <xsl:when test="((ProcDateText != '') or (ProcSite != '') or (ProcName != '') or (ProcSurgeon != '') or (ProcSurgeonType != '') or (ProcPrimary != '') or (ProcIndication != '') or (ProcNotes != '') or (ProcSide != ''))">
                  <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('Procedures','')" >

                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                      <xsl:if test="ProcPrimary = '1'">
                        Yes
                      </xsl:if>&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                      <xsl:value-of select="ProcDateText"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                      <xsl:value-of select="ProcSite"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                      <xsl:value-of select="ProcSide"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                      <xsl:value-of select="ProcName"  />&#160;
                    </td>
                    <td align="center" valign="middle" class="FormInsideTableRegCell" >
                      <xsl:value-of select="ProcSurgeon"  />&#160;
                    </td>
                 
                  <td align="center" valign="middle" class="FormInsideTableRegCell" >
                    <xsl:value-of select="ProcIndication"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell"  >
                    <xsl:value-of select="ProcNotes"  />&#160;
                  </td>
                 </tr>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
            <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByTable('Procedures','')">
              <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
              <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
              <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
              <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
              <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
              <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
              <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
              <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
           </tr>
       </table>
      </td>
    </tr>
  </xsl:template>

  <!--HospitalizationBone : Match=Hospitalizations-->
  <xsl:template match="Surveys" name="HospitalizationBoneTable">
    <tr>
      <td class="FormOuterTableRow">
        <a name="HospitalizationBone_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="8">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Hospitalization</span>
            </td>
          </tr>
          <tr class="EFormTableRow">
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Admit Date</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Discharge Date</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Hospital</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Living Arrangements (Pre)</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Living Arrangements (Post)</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Ambulation (Pre)</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Ambulation (Post)</strong>
            </td>
            <td width="48%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>
          </tr>
          <xsl:for-each select="Hospitalizations">
            <xsl:choose>
              <xsl:when test="((HospAdmitDateText != '') or (HospDischargeDateText != '') or (HospInstitution != '') or (HospLivingArrangmentPre != '') or (HospLivingArrangmentPost != '') or (HospAmbulationPre != '') or (HospAmbulationPre != '') or (HospNotes != ''))">
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('HospAdmitDateText', 'Hospitalizations')">
                    <xsl:value-of select="HospAdmitDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('HospDischargeDateText', 'Hospitalizations')">
                    <xsl:value-of select="HospDischargeDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('HospInstitution', 'Hospitalizations')">
                    <xsl:value-of select="HospInstitution"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('HospLivingArrangmentPre', 'Hospitalizations')">
                    <xsl:value-of select="HospLivingArrangmentPre"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('HospLivingArrangmentPost', 'Hospitalizations')">
                    <xsl:value-of select="HospLivingArrangmentPost"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('HospAmbulationPre', 'Hospitalizations')">
                    <xsl:value-of select="HospAmbulationPre"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('HospAmbulationPost', 'Hospitalizations')">
                    <xsl:value-of select="HospAmbulationPost"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('HospNotes', 'Hospitalizations')">
                    <xsl:value-of select="HospNotes"  />&#160;
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr class="EFormTableRow">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('HospAdmitDateText', 'Hospitalizations')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('HospDischargeDateText', 'Hospitalizations')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('HospInstitution', 'Hospitalizations')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('HospLivingArrangmentPre', 'Hospitalizations')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('HospLivingArrangmentPost', 'Hospitalizations')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('HospAmbulationPre', 'Hospitalizations')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('HospAmbulationPost', 'Hospitalizations')">&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('HospNotes', 'Hospitalizations')">&#160;</td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>

  <!--Template: Diagnostics Values Matches Diagnostics-->
  <xsl:template match="Diagnostics" name="DiagnosticsBMDHtmlTable">
    <tr>
      <td class="FormOuterTableRow">
        <a name="DiagnosticsBMD_Anchor"/>
        <table class="EFormTable" cellspacing="0">
          <tr class="EFormTableRow">
            <td colspan="4">
              <img src="../../Images/shim.gif" width="4" height="1" />
              <span class="blackBoldText">Bone Mineral Density</span>
            </td>
          </tr>
          <tr class="EFormTableRow" >
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
              <strong>Date</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Test Type</strong>
            </td>
             <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Institution</strong>
            </td>
            <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Site</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Measure</strong>
            </td>
            <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Result</strong>
            </td>
            <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">
              <strong>Notes</strong>
            </td>

          </tr>
          <!--Imaging data from the database-->
          <xsl:value-of select="$BMDImagingRows" disable-output-escaping="yes"/>
          <xsl:for-each select="Diagnostics">
            <xsl:choose>
              <xsl:when test="((DxDateText != '') or (DxType != '') or (DxResult != '') or (DxInstitution != '') or (DxNotes != ''))">
                <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics',{./@RecordId})">
                  <td align="center" valign="middle" class="FormInsideTableLeftCell">
                    <xsl:value-of select="DxDateText"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="DxType"  />&#160;
                  </td>
                  <td align="center" valign="middle" class="FormInsideTableRegCell">
                    <xsl:value-of select="DxInstitution"  />&#160;
                  </td>

                  <xsl:for-each select="DxImageFindings">
                    <xsl:choose>
                      <xsl:when test="((ImgFindSite != '') or (ImgFindStatus != '') or (ImgFindResult != '') or (ImgFindNotes != ''))">
                        <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByTable('DxImageFindings',{./@RecordId})" >
                          <xsl:value-of select="ImgFindSite"  />&#160;
                        </td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByTable('DxImageFindings',{./@RecordId})">
                          <xsl:value-of select="ImgFindStatus"  />&#160;
                        </td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByTable('DxImageFindings',{./@RecordId})">
                          <xsl:value-of select="ImgFindResult"  />&#160;
                        </td>
                        <td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByTable('DxImageFindings',{./@RecordId})">
                          <xsl:value-of select="ImgFindNotes"  />&#160;
                        </td>
                        <tr></tr>
                        <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
                        <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>


                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
                  <td align="center" valign="middle" class="FormInsideTableLeftCell" >&#160;</td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <!-- empty row for adding new ones -->
          <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics','')">
            <td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>

          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  
  
  <!--Template: Matches Medications-->
<xsl:template match="Medications" name="HomeMedicationsList">
	<a name="Medications_Anchor"/>
	<table class="EFormTable" cellspacing="0">
		<tr class="EFormTableRow">
			<td colspan="7"><img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Medications</span></td>
		</tr>
		<tr class="EFormTableRow">
			<td width="" align="center" valign="middle" class="FormInsideTableTopLeftCell"><strong>Medication</strong></td>
			<td width="" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Dose</strong></td>
			<td width="" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Schedule</strong></td>
			<td width="" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Indication</strong></td>			
		  <td width="" align="center" valign="middle" class="FormInsideTableTopCell"><strong>Route</strong></td>			
      
      <td width="" align="center" valign="middle" class="FormInsideTableTopCell"><strong>StartDate</strong></td>
      <td width="" align="center" valign="middle" class="FormInsideTableTopCell"><strong>StopDate</strong></td>
    </tr>
    <!--Medications from the Database-->
	<xsl:value-of select="$MedicationRowsHML" disable-output-escaping="yes"/>	
	<xsl:for-each select="Medications">
		<xsl:choose>
			<xsl:when test="((Medication != '') or (MedDose != '') or (MedUnits != '') or (MedRoute != '') or (MedSchedule != '') or (MedIndication != '') or (MedStopDateText != ''))">
				<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications',{./@RecordId})">		
					<td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;"><xsl:value-of select="Medication"  />&#160;</td>
					<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedDose"  />&#160;<xsl:value-of select="MedUnits"  /></td>
          			<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedSchedule"  />&#160;</td>
					<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedIndication"  />&#160;</td>
					<td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedRoute"  />&#160;</td>
          <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedDateText"  />&#160;</td>
          <td align="center" valign="middle" class="FormInsideTableRegCell"><xsl:value-of select="MedStopDateText"  />&#160;</td>
        </tr>
      </xsl:when>
		</xsl:choose>
	</xsl:for-each>
	<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
		<td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
  </tr>
  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
		<td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
  </tr>
  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
		<td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
  </tr>
  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
		<td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
  </tr>
  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
		<td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
  </tr>
  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
		<td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
  </tr>
  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
		<td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
  </tr>
  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
		<td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
		<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
  </tr>
</table>
</xsl:template>

  <xsl:template match="Medications" name="GUHomeMedicationsList">
    <a name="Medications_Anchor"/>
    <table class="EFormTable" cellspacing="0">
      <tr class="EFormTableRow">
        <td colspan="7">
          <img src="../../Images/shim.gif" width="4" height="1" />
          <span class="blackBoldText">Medications</span>
        </td>
      </tr>
      <tr class="EFormTableRow">
        <td width="" align="center" valign="middle" class="FormInsideTableTopLeftCell">
          <strong>Medication</strong>
        </td>
        <td width="" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>Dose</strong>
        </td>
        <td width="" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>Schedule</strong>
        </td>
        <td width="" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>Indication</strong>
        </td>
        <td width="" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>Route</strong>
        </td>

        <td width="" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>StartDate</strong>
        </td>
        <td width="" align="center" valign="middle" class="FormInsideTableTopCell">
          <strong>StopDate</strong>
        </td>
      </tr>
      <!--Medications from the Database-->
      <xsl:value-of select="$MedicationRowsGUHML" disable-output-escaping="yes"/>
      <xsl:for-each select="Medications">
        <xsl:choose>
          <xsl:when test="((Medication != '') or (MedDose != '') or (MedUnits != '') or (MedRoute != '') or (MedSchedule != '') or (MedIndication != '') or (MedStopDateText != ''))">
            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications',{./@RecordId})">
              <td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">
                <xsl:value-of select="Medication"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="MedDose"  />&#160;<xsl:value-of select="MedUnits"  />
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="MedSchedule"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="MedIndication"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="MedRoute"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="MedDateText"  />&#160;
              </td>
              <td align="center" valign="middle" class="FormInsideTableRegCell">
                <xsl:value-of select="MedStopDateText"  />&#160;
              </td>
            </tr>
          </xsl:when>
        </xsl:choose>
      </xsl:for-each>
      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
        <td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      </tr>
      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
        <td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      </tr>
      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
        <td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      </tr>
      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
        <td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      </tr>
      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
        <td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      </tr>
      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
        <td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      </tr>
      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
        <td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      </tr>
      <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Medications','')">
        <td align="center" valign="middle" class="FormInsideTableLeftCell" style="height: 26px;">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
        <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
      </tr>
    </table>
  </xsl:template>

    <!--IntervalHistoryProgressionCriteria Table-->
    <xsl:template name="IntervalHistoryProgressionCriteria">
        <tr class="EFormTableRow">
            <td  class="FormOuterTableRow">
                <table cellspacing="0" cellpadding="0" style="width: 100%;">
                    <tr>
                        <td width="70%" style="border-right: solid 1px #999999; vertical-align: top;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByField('HPI_AddedText')">
                            <table   cellspacing="0" width="100%" >
                                <tr >
                                    <td width="100%" align="left" valign="top">
                                        <img src="../../Images/shim.gif" width="4" height="1" />
                                        <span class="blackBoldText">Interval History</span>
                                    </td>
                                </tr>
                                <tr >
                                    <td width="100%" align="left" valign="top" style="padding: 5px;">
                                        <xsl:value-of select="NoTable/HPI_AddedText"/>&#160;
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <xsl:for-each select="Surveys">
                            <xsl:choose>
                                <xsl:when test="(SurveyType = 'Progression Criteria')">
                                    <td style="vertical-align: top;">

                                        <!-- sites of disease (from surveys) -->
                                        <table class="EFormTable" cellspacing="0" style="margin-top: 10px;" cellpadding="0">
                                            <tr class="EFormTableRow">
                                                <td colspan="2" class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SurveyItems','')" style="padding-left: 4px;">
                                                    <span class="blackBoldText">Progression Criteria</span>
                                                </td>
                                            </tr>
                                            <tr class="EFormTableRow">
                                                <td width="40%" align="center" valign="middle" class="FormInsideTableTopCell">
                                                    <strong>Site</strong>
                                                </td>
                                                <td width="60%" align="center" valign="middle" class="FormInsideTableTopCell">
                                                    <strong>Yes/No</strong>
                                                </td>
                                            </tr>
                                            <xsl:for-each select="SurveyItems">
                                                <xsl:choose>
                                                    <xsl:when test="((SurveyItem != '') or (SurveyItemResult != ''))">
                                                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SurveyItems',{./@RecordId})">
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                                <xsl:value-of select="SurveyItem"  />&#160;
                                                            </td>
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                                <xsl:value-of select="SurveyItemResult"  />&#160;
                                                            </td>
                                                        </tr>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:for-each>
                                        </table>
                                    </td>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>



  <!--PSA Doubling Time-->
  <xsl:template name="PSADoublingTime">
    <tr>
      <td valign="top" class="FormOuterTableRow" >
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr valign="top">
            <td height="40" class="FormInsideTableRegCell" valign="top">
              <span class="blackBoldText">PSA Doubling Time</span>
              <img src="../../Images/shim.gif" border="0" width="30" height="1" />
              <xsl:value-of select="$psaDT" disable-output-escaping="yes"/>
              </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>



    <!--GU Pros FU Imaging-->
    <xsl:template match="Diagnostics" name="GUProsFUDiagnosticsTable">
        <tr>
            <td  class="FormOuterTableRow" style="vertical-align: top; height: 200px;" valign="top" height="200">
                <span class="blackBoldText" style="padding-left: 4px;">Diagnostics</span>
                <xsl:for-each select="NoTable">
                    <xsl:choose>
                        <xsl:when test="contains(Imaging_Notes, 'Films Reviewed')">
                            <input type="checkbox" checked="checked" name="Films Reviewed" style="margin-left: 32px;" />
                        </xsl:when>
                        <xsl:otherwise>
                            <input type="checkbox" name="Films Reviewed" style="margin-left: 32px;" />
                        </xsl:otherwise>
                    </xsl:choose>Films Reviewed
                    <xsl:choose>
                        <xsl:when test="contains(Imaging_Notes, 'Compared to Past')">
                            <input type="checkbox" checked="checked" name="Compared to Past" style="margin-left: 32px;" />
                        </xsl:when>
                        <xsl:otherwise>
                            <input type="checkbox" name="Compared to Past" style="margin-left: 32px;" />
                        </xsl:otherwise>
                    </xsl:choose>Compared to Past
                    <xsl:choose>
                        <xsl:when test="contains(Imaging_Notes, 'Reviewed with Radiologist')">
                            <input type="checkbox" checked="checked" name="Reviewed with Radiologist" style="margin-left: 32px;" />
                        </xsl:when>
                        <xsl:otherwise>
                            <input type="checkbox" name="Reviewed with Radiologist" style="margin-left: 32px;" />
                        </xsl:otherwise>
                    </xsl:choose>Reviewed with Radiologist
                    <xsl:choose>
                        <xsl:when test="contains(Imaging_Notes, 'Digitized')">
                            <input type="checkbox" checked="checked" name="Digitized" style="margin-left: 32px;" />
                        </xsl:when>
                        <xsl:otherwise>
                            <input type="checkbox" name="Digitized" style="margin-left: 32px;" />
                        </xsl:otherwise>
                    </xsl:choose>Digitized
                </xsl:for-each>
                <br/>
                <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
                    <tr >
                        <td class="FormInsideTableTopCell" width="15%" align="center" valign="middle">Date&#160;(mm/dd/yyyy)</td>
                        <td class="FormInsideTableTopCell" width="20%" align="center" valign="middle">Modality&#160;(CT,MRI...)</td>
                        <td class="FormInsideTableTopCell" width="65%" align="center" valign="middle">Results/ Comments/ Comparisons</td>
                    </tr>
                    <xsl:value-of select="$GUProsFUImagingRows" disable-output-escaping="yes"/>
                    <xsl:for-each select="Diagnostics">
                        <xsl:choose>
                            <xsl:when test="((DxDateText != '') or (DxType != '') or (DxResult != '') or (DxNotes != ''))">

                                <tr  onmouseover="this.className='chronListHilighted';" onmouseout="this.className=''" onclick="LoadComponentByTable('Diagnostics',{./@RecordId})">
                                    <td align="center" class="FormInsideTableRegCell">
                                        &#160;<xsl:value-of select="DxDateText"  />
                                    </td>
                                    <td align="center" class="FormInsideTableRegCell">
                                        &#160;<xsl:value-of select="DxType"  />
                                    </td>
                                    <td class="FormInsideTableRegCell">
                                        &#160;<xsl:if test="(DxResult != '')">Result: </xsl:if><xsl:value-of select="DxResult"  />
                                        <xsl:if test="(DxResult != '') and (DxNotes != '')">&#160;&#160;&#160;--&#160;&#160;&#160;</xsl:if>
                                        <xsl:value-of select="DxNotes"  />
                                    </td>
                                </tr>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>

                </table>
            </td>
        </tr>
    </xsl:template>

  <xsl:template name="string-replace-all">
    <xsl:param name="text" />
    <xsl:param name="replace" />
    <xsl:param name="by" />
    <xsl:choose>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)" />
        <xsl:value-of select="$by" />
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text"
          select="substring-after($text,$replace)" />
          <xsl:with-param name="replace" select="$replace" />
          <xsl:with-param name="by" select="$by" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  
  <!--css styles needed for McGill EForms-->
  <xsl:template name="McGillEFormStyles">
  <style type="text/css">
    .VerticalBarCodeDiv {display:none;}
    .NoVerticalBarCodeDiv {display:none;}
    .VerticalBarCodeMRN {display:none;}
    .VerticalBarCodeDocType {display:none;}
    .VerticalBarCodeAcctType {display:none;}
    .VerticalBarCodeDate {display:none;}
    .VerticalBarCodeDateText {display:none;}
    .VerticalBarCodeDateTextBG {display:none;}
    .VerticalBarCodeStatement {display:none;}
    .VerticalBarCodeStatementImage {display:none;}
    .masterTable {width: 100%;}
    .pageWidth {width: 100%;}
    .pageWidth98percent {width: 98%;}
    .pageWidth90percent {width: 90%;}
  </style>
  
  </xsl:template>
</xsl:stylesheet>

  