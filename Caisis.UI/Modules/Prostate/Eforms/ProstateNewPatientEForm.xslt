<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--Demographic parameters-->
		<xsl:param name="PtTitle"/>
		<xsl:param name="PtFirstName"/>
		<xsl:param name="PtMiddleName"/>
		<xsl:param name="PtLastName"/>
		<xsl:param name="PtSuffix"/>
		<xsl:param name="PtAge" />
		<xsl:param name="PtMRN"/>
		
<xsl:template match="eform">
		
		
<table width="500" cellspacing="1" cellpadding="4" style="border: 1px solid black; bgcolor: white;">
	<tr>
		<td colspan="2" align="center">CONTAINS PROTECTED HEALTH INFORMATION</td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td valign="top" class="boldText">Name: <xsl:value-of select="$PtLastName"/>, <xsl:value-of select="$PtFirstName"/>&#160;<xsl:value-of select="$PtMiddleName"/></td>
		<td align="right" class="boldText">MRN: <xsl:value-of select="$PtMRN"/></td>
	</tr>
	<tr>
		<td colspan="2" valign="top" class="boldText"></td>
	</tr>
	<tr>
		<td></td>
	</tr>	
	<tr class="EFormReportRow1">
		<td valign="top" class="boldText">Phone</td>
		<td>
			<ul>
				<xsl:for-each select="PatientPhoneNumbers">
					<xsl:if test="PtPhoneType != '' or PtPhoneNumber != ''">
					<li><xsl:value-of select="PtPhoneType"/>: <xsl:value-of select="PtPhoneNumber"/> ext. <xsl:value-of select="PtPhoneExtension"/></li>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</td>
	</tr>
	
	<tr><td valign="top" class="boldText">Identifiers</td>
		<td>
			<ul>
				<xsl:for-each select="Identifiers">
					<xsl:if test="IdType != '' or Identifier != ''">
						<li><xsl:value-of select="IdType"/> : <xsl:value-of select="Identifier"/> </li>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</td>
	</tr>
	
	<tr class="EFormReportRow1">
		<td valign="top" class="boldText">Biopsy</td>
		<td>
			<ul>
				<xsl:for-each select="BiopsiesProstate">
					<li>Date: <xsl:value-of select="BxDateText"/></li>
					<li>Type: <xsl:value-of select="BxType"/></li>
					<li>PathNum: <xsl:value-of select="BxPathNum"/></li>
					<li>PosCores: <xsl:value-of select="BxPosCores"/></li>
					<li>NumCores: <xsl:value-of select="BxNumCores"/></li>
					<li>NumSites: <xsl:value-of select="BxNumSites"/></li>
					<li>NumSites: <xsl:value-of select="BxNumSites"/></li>
					<li>GG1: <xsl:value-of select="BxGG1"/></li>
					<li>GG2: <xsl:value-of select="BxGG2"/></li>
					<li>GGS: <xsl:value-of select="BxGGS"/></li>
					<li>Result: <xsl:value-of select="BxResult"/></li>
					<li>PercCancer: <xsl:value-of select="BxPercCancer"/></li>
					<li>MaxPercCancer: <xsl:value-of select="BxMaxPercCancer"/></li>
					
						</xsl:for-each>
						
						<BR></BR>
						
						<table>
						<xsl:for-each select="BiopsiesProstate/BiopsyCoresProstate">
							
							<xsl:if test="BxCoreSide != '' or BxCoreLevel != '' or BxCoreLaterality != '' or BxCoreNumCores != '' or BxCorePercCancer != '' or BxCoreGG1 != '' or BxCoreGG2 != ''  or BxCoreGGS != ''  or BxCoreResult != ''">
								<tr>
									<td><span class="boldText">Core <xsl:value-of select="position()"/></span>
										<li>Side: <xsl:value-of select="BxCoreSide"/></li>
										<li>Level: <xsl:value-of select="BxCoreLevel"/></li>
										<li>Laterality: <xsl:value-of select="BxCoreLaterality"/></li>
										<li>Num Cores: <xsl:value-of select="BxCoreNumCores"/></li>
										<li>PercCancer: <xsl:value-of select="BxCorePercCancer"/></li>
										<li>GG1: <xsl:value-of select="BxCoreGG1"/></li>
										<li>GG2: <xsl:value-of select="BxCoreGG2"/></li>
										<li>GGS: <xsl:value-of select="BxCoreGGS"/></li>
										<li>Result: <xsl:value-of select="BxCoreResult"/></li>
									</td>
								</tr>
							</xsl:if>
										
						</xsl:for-each>
						</table>
			</ul>
		</td>
	</tr>

	<tr>
		<td valign="top" class="boldText">Imaging</td>
		<td>
			<ul>
				<xsl:for-each select="Diagnostics">
					<xsl:if test="DxType != '' or DxDateText != '' or DxResult != '' or DxTarget != ''">
						<span class="boldText"><xsl:value-of select="DxType"/></span>
						<li>Date: <xsl:value-of select="DxDateText"/></li>
						<li>Target: <xsl:value-of select="DxTarget"/></li>
						<li>Result: <xsl:value-of select="DxResult"/></li>
					
						<!-- ultrasound may have dosimetry values in child table -->
						<xsl:if test="DxType = 'Ultrasound'">
							<xsl:for-each select="DxImageProstate">
										<li>UseForDosimetry: <xsl:if test="ImgUseForDosimetry = '1'">Yes</xsl:if><xsl:if test="ImgUseForDosimetry = ''">No</xsl:if></li>
										<li>Height: <xsl:value-of select="ImgProsHeight"/></li>
										<li>Width: <xsl:value-of select="ImgProsWidth"/></li>
										<li>Length: <xsl:value-of select="ImgProsLength"/></li>
										<li>Avg Dim: <xsl:value-of select="ImgAvgDim"/></li>
										<li>Volume: <xsl:value-of select="ImgProsVolume"/></li>
							</xsl:for-each>
						</xsl:if>
						<br></br>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</td>
	</tr>

	<tr class="EFormReportRow1">
		<td valign="top" class="boldText">Lab Test</td>
		<td>
			<ul>
				<xsl:for-each select="LabTests">
					<xsl:if test="LabTest != '' or LabResult != '' or LabDateText != ''">
						<span class="boldText"><xsl:value-of select="LabTest"/></span>
						<li>Result: <xsl:value-of select="LabResult"/></li>
						<li>Date: <xsl:value-of select="LabDateText"/></li>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</td>
	</tr>
	
	<tr>
		<td valign="top" class="boldText">Medications</td>
		<td>
			<ul>
				<xsl:for-each select="Medications">
					<xsl:if test="MedType != '' or MedDateText != '' or MedStopDateText != ''">
						<span class="boldText"><xsl:value-of select="Medication"/></span>
						<li>Type: <xsl:value-of select="MedType"/></li>
						<li>Date: <xsl:value-of select="MedDateText"/></li>
						<li>Stop Date: <xsl:value-of select="MedStopDateText"/></li>	
						<br></br>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</td>
	</tr>
	
	<tr class="EFormReportRow1">
		<td valign="top" class="boldText">Clinical Stage</td>
		<td>
			<ul>
				<xsl:for-each select="ClinicalStages">
					<xsl:if test="ClinStageDateText != '' or ClinStageDisease != '' or ClinStageSystem != '' or ClinStageT != ''">
						<li>Date: <xsl:value-of select="ClinStageDateText"/></li>
						<li>Disease: <xsl:value-of select="ClinStageDisease"/></li>
						<li>System: <xsl:value-of select="ClinStageSystem"/></li>
						<li>T Stage: <xsl:value-of select="ClinStageT"/></li>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</td>
	</tr>
	
	<tr >
		<td valign="top" class="boldText">Surveys</td>
		<td>
			<ul>
				<xsl:for-each select="Surveys">
					<xsl:if test="SurveyType != '' or SurveyResult != '' or SurveyTotal != '' or SurveyDateText != ''">
						<span class="boldText"><xsl:value-of select="SurveyType"/></span>
						<li>Result: <xsl:value-of select="SurveyResult"/></li>
						<li>Total: <xsl:value-of select="SurveyTotal"/></li>
						<li>Date: <xsl:value-of select="SurveyDateText"/></li>
						<br></br>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</td>
	</tr>
	
	<tr class="EFormReportRow1">
		<td valign="top" class="boldText">Toxicities</td>
		<td>
			<ul>
				<xsl:for-each select="Toxicities">
					<xsl:if test="ToxName != '' or ToxGradeResult != '' or ToxDateText != ''">
						<span class="boldText"><xsl:value-of select="ToxName"/></span>
						<li>Grade: <xsl:value-of select="ToxGradeResult"/></li>
						<li>Date: <xsl:value-of select="ToxDateText"/></li>
						<br></br>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</td>
	</tr>
	
	<tr>
		<td valign="top" class="boldText">Encounters</td>
		<td>
			<ul>
				<xsl:for-each select="Encounters">
					<xsl:if test="EncDateText != '' or EncKPS != '' or EncNotes != ''">
					<li>Date: <xsl:value-of select="EncDateText"/></li>
					<li>KPS: <xsl:value-of select="EncKPS"/></li>
					<li>Notes: <xsl:value-of select="EncNotes"/></li>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</td>
	</tr>
	
	<tr class="EFormReportRow1">
		<td valign="top" class="boldText">Booking</td>
		<td>
			<ul>
				<xsl:for-each select="Actions">
						<li>Date: <xsl:value-of select="ActionDateText"/></li>
						<li>Status: <xsl:value-of select="ActionItem"/></li>
				</xsl:for-each>
				<xsl:for-each select="BrachyTherapy">
					<li>Isotope: <xsl:value-of select="BrachyIsotope"/></li>
					<li>PrescribedDose: <xsl:value-of select="BrachyPrescribedDose"/></li>
				</xsl:for-each>
			</ul>
		</td>
	</tr>
	
</table>
</xsl:template>
</xsl:stylesheet>