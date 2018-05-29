<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


  <!--Parameters-->
  <xsl:param name="CombinedBiopsies_Prostate" />
  <xsl:param name="CombinedFamilyMembers" />
  <xsl:param name="CombinedSocialHistories" />
  <xsl:param name="CombinedAllergies" />
  <xsl:param name="CombinedComorbidities" />
  <xsl:param name="CombinedProcedures" />
  <!--  <xsl:param name="CombinedQOLTherapies" /> -->
  <xsl:param name="CombinedDiagnostics" />
  <xsl:param name="CombinedToxicities" />
  <xsl:param name="CombinedMedications" />
  <xsl:param name="SurvivorshipLabTests" />
  <xsl:param name="CombinedMedTx" />
  <xsl:param name="CombinedRadTx" />
  
  
  
  
  

  <!--Variables-->
  <!--Barcode Variables-->
  <xsl:variable name="DocType">*U38*</xsl:variable>
  <xsl:variable name="AcctType">*ACCTOUTPATIENT*</xsl:variable>
  <xsl:variable name="ReportTitle">Urology Survivorship</xsl:variable>
  <!--Footer Variables-->
  <xsl:variable name="DocNumber">34</xsl:variable>
  <xsl:variable name="DocAssignment">38</xsl:variable>
  <xsl:variable name="ApprovalDate">6/05</xsl:variable>
  <xsl:variable name="RevisedDate">10/27/14</xsl:variable>
  <!--Please Note: The footer cannot be implemented as a template until Jason's new page counting information is added
<xsl:variable name="PageNumber">X of Y</xsl:variable>-->

  <!--Header Variables-->
  <!--ToDo: Use institution Short Name From Web Config-->
  <xsl:variable name="InstitutionShortName">MSKCC</xsl:variable>

  <xsl:include href="../../../Core/Eforms/EFormTemplateLibrary.xslt" />
  <xsl:template match="eform">


    <style type="text/css">
      .EFormTable {	padding:0px 0px 0px 0px;

      width:100%;
      }
      .EFormTableRow {	background-color: #ffffff;
      }

      table#ProstateBiopsyScores
      {
      width: 100%;
      }
      table#ProstateBiopsyScores td
      {
      padding: 13px 4px;
      text-align: left;
      width: 30%;
      }
      span.ActiveSurveillanceNotes
      {
      color: #666666;
      font-size: smaller;
      display: block;
      padding-left: 10px;
      }
      span.ActiveSurveillanceNotes span.noteTitle
      {
      font-weight: bold;
      }
      span.ActiveSurveillanceNotes table
      {
      border: solid 1px #666666;
      border-collapse: collapse;

      }
      span.ActiveSurveillanceNotes table td
      {
      color: #666666;
      font-size: smaller;
      text-align: left;
      font-weight: normal;
      padding: 2px 15px;
      }
      span.ActiveSurveillanceNotes table td.labelCol { border-left: solid 1px #666666; }

      table.PaperFormDataTable
      {
      border: solid 1px #666666;
      border-collapse: collapse;
      border-spacing: 0;
      width: 100%;
      }
      table.PaperFormDataTable td
      {
      border: solid 1px #666666;
      padding: 1px;
      text-align: center;
      }

      table.PageBreakable
      {
      table-layout: fixed;
      }
      table.PaperFormDataTable tr:last-child td
      {
      border-bottom: none;
      }

      table#IPSSTable
      {
      border-collapse: collapse;
      width: 100%;
      }
      table#IPSSTable th
      {
      border: solid 1px #666666;
      font-size: smaller;
      padding: 2px 3px;
      }
      table#IPSSTable td
      {
      border: solid 1px #666666;
      padding: 2px 3px;
      text-align: center;
      font-size: smaller;
      font-weight: bold;
      }
      table.ActiveSurveillancePSATable
      {

      }
      table.ActiveSurveillancePSATable td { border-bottom: none; }
      table.ActiveSurveillancePSATable td:nth-child(1) { width: 15%; padding: 5px 1px; }
      table.ActiveSurveillancePSATable td:nth-child(2) { width: 12%; }
      table.ActiveSurveillancePSATable td:nth-child(3) { width: 13%; }
      table.ActiveSurveillancePSATable td:nth-child(4) { width: 9%; }
      table.ActiveSurveillancePSATable td:nth-child(5) { width: 9%; }
      table.ActiveSurveillancePSATable td:nth-child(6) { width: 9%; }
      table.ActiveSurveillancePSATable td:nth-child(7) { width: 9%; }
      table.ActiveSurveillancePSATable td:nth-child(8) { width: 8%; }
      table.ActiveSurveillancePSATable td:nth-child(9) { width: 8%; }
      table.ActiveSurveillancePSATable td:nth-child(10) { width: 8%; }



      .clickable
      {
      cursor: pointer;
      }

      .clickable:hover
      {
      background-color: #e7d1c8;
      color: #000000;
      }
      span.ProstateQOLAnswer
      {
      border-bottom: solid 1px #000000;
      width: 20px;
      display: inline-block;
      }
    </style>

    <div align="left"  style="page-break-after:always;">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>

      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <tr><td style="text-align:center; font-size: smaller;">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY</td></tr>
        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="EformHeader"/>
        <!--Date and Physician Header-->
        <tr>
          <td class="FormOuterTableRow">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="blackBoldText">
                  <img src="../../images/shim.gif" border="0" width="4" height="15" />Date: <span style="display: inline-block; width: 80px;"><xsl:value-of select="Encounters/EncDate"/></span>
                  Nurse Practitioner: <span style="display: inline-block; width: 120px;"><xsl:value-of select="Encounters/EncNurse"/></span>
                  Primary Physician: <xsl:value-of select="Encounters/EncPhysician"/>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td class="FormOuterTableRow">
            <table align="center" border="0" width="100%" cellpadding="1" cellspacing="0">
              <tr>
                <td width="50%" align="left" class="FormInnerRowRightBorder clickable" valign="top" onclick="LoadComponentByTable('PhysicianLocal','1')" style="background-color: none;">
                  <img src="../../images/shim.gif" border="0" width="4" height="1" />Local&#160;M.D.:&#160;&#160;<span style="font-weight: bold;"><xsl:value-of select="NoTable/PhysicianLocal[@RecordId=1]/PhFirstName"/> <xsl:value-of select="NoTable/PhysicianLocal[@RecordId=1]/PhLastName"/></span>
                </td>
                <td width="50%" align="left" class="clickable" onclick="LoadComponentByTable('PhysicianLocal','2')" style="background-color: none;">
                  <img src="../../images/shim.gif" border="0" width="4" height="1" />Local&#160;M.D.:&#160;&#160;<span style="font-weight: bold;"><xsl:value-of select="NoTable/PhysicianLocal[@RecordId=2]/PhFirstName"/> <xsl:value-of select="NoTable/PhysicianLocal[@RecordId=2]/PhLastName"/>
                  </span>
                </td>
              </tr>
              <tr>
                <td align="left" class="FormInnerRowRightBorder clickable"  onclick="LoadComponentByTable('PhysicianLocal','1')" style="background-color: none;"  >
                  <table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="22%" height="20" align="right" valign="bottom">Address</td>
                      <td class="FormInnerRowBottomBorder" style="vertical-align:bottom; background-color: transparent;">&#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=1]/PhAddress1"/></td>
                    </tr>
                    <tr>
                      <td  height="20" align="right" valign="bottom">&#160;</td>
                      <td class="FormInnerRowBottomBorder" style="vertical-align:bottom; background-color: transparent;">&#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=1]/PhAddress2"/>
                    </td>
                    </tr>
                    <tr>
                      <td  height="20" align="right" valign="bottom">City, State, Zip</td>
                      <td class="FormInnerRowBottomBorder"  style="vertical-align:bottom; background-color: transparent;">&#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=1]/PhCity"/>
                        &#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=1]/PhState"/>
                        &#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=1]/PhPostalCode"/>
                      </td>
                    </tr>
                    <tr>
                      <td height="20" align="right" valign="bottom">Phone</td>
                      <td class="FormInnerRowBottomBorder" style="vertical-align:bottom; background-color: transparent;">
                        &#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=1]/PhWorkPhone"/>
                      </td>
                    </tr>
                    <tr>
                      <td  height="20" align="right" valign="bottom">Fax</td>
                      <td class="FormInnerRowBottomBorder" style="vertical-align:bottom; background-color: transparent;">
                        &#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=1]/PhFax"/>
                      </td>
                    </tr>
                    <tr>
                      <td  height="20" align="right" valign="bottom">Specialty</td>
                      <td class="FormInnerRowBottomBorder" style="vertical-align:bottom; background-color: transparent;">
                        &#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=1]/PhSpecialty"/>
                      </td>
                    </tr>
                  </table>
                </td>
                <td align="left"  class="clickable"  onclick="LoadComponentByTable('PhysicianLocal','2')">
                  <table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="22%" height="20" align="right" valign="bottom">Address</td>
                      <td class="FormInnerRowBottomBorder" style="vertical-align:bottom; background-color: transparent;">
                        &#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=2]/PhAddress1"/>
                      </td>
                    </tr>
                    <tr>
                      <td  height="20" align="right" valign="bottom">&#160;</td>
                      <td class="FormInnerRowBottomBorder" style="vertical-align:bottom; background-color: transparent;">
                        &#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=2]/PhAddress2"/>
                      </td>
                    </tr>
                    <tr>
                      <td  height="20" align="right" valign="bottom">City, State, Zip</td>
                      <td class="FormInnerRowBottomBorder"  style="vertical-align:bottom; background-color: transparent;">
                        &#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=2]/PhCity"/>
                        &#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=2]/PhState"/>
                        &#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=2]/PhPostalCode"/>
                      </td>
                    </tr>
                    <tr>
                      <td height="20" align="right" valign="bottom">Phone</td>
                      <td class="FormInnerRowBottomBorder" style="vertical-align:bottom; background-color: transparent;">
                        &#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=2]/PhWorkPhone"/>
                      </td>
                    </tr>
                    <tr>
                      <td  height="20" align="right" valign="bottom">Fax</td>
                      <td class="FormInnerRowBottomBorder" style="vertical-align:bottom; background-color: transparent;">
                        &#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=2]/PhFax"/>
                      </td>
                    </tr>
                    <tr>
                      <td  height="20" align="right" valign="bottom">Specialty</td>
                      <td class="FormInnerRowBottomBorder" style="vertical-align:bottom; background-color: transparent;">
                        &#160;&#160;<xsl:value-of select="NoTable/PhysicianLocal[@RecordId=2]/PhSpecialty"/>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="FormOuterTableRow">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr >
                <td align="left" height="22">
                  <img src="../../images/shim.gif" border="0" width="4" height="0" />Referring&#160;M.D.:
                  <span id="ctl00_blankReferrringMD">
                    (MSKCC)<img src="../../images/shim.gif" border="0" width="200" height="1" />Non-MSKCC:
                  </span>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td  class="FormOuterTableRow clickable"  onclick="LoadComponentByField('EncChiefComplaint')">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
              <tr>
                <td height="30" align="left" valign="top" class="blackBoldText">
                  <img src="../../images/shim.gif" border="0" width="4" height="12" />Chief Complaint

                  <span style="font-size: 12px; font-weight: normal;">
                    <xsl:value-of select="Encounters/EncChiefComplaint"/>
                  </span>

                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="95" valign="top" class="FormOuterTableRow">
            <img src="../../images/shim.gif" border="0" width="4" height="12" />
            <span class="blackBoldText">HPI</span>
            <br/>
            <xsl:value-of select="$Hpi" disable-output-escaping="yes"/>
          </td>
        </tr>
        <tr>
          <td valign="top" class="FormOuterTableRow">
            <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="23%" rowspan="2" valign="top" class="FormInsideTableTopLeftCell">
                  <span class="blackBoldText">
                    <img src="../../images/shim.gif" border="0" width="4" height="12" />Nomogram
                    Prediction
                  </span>
                </td>
                <td width="11%" class="FormInsideTableTopCell">&#160;PreRP 5:</td>
                <td width="16%" class="FormInsideTableTopCell">
                  &#160; <span id="ctl00_preRP5Nomo"></span>
                </td>
                <td width="11%" class="FormInsideTableTopCell">&#160;PreBrachy:</td>
                <td width="16%" class="FormInsideTableTopCell">
                  &#160;
                  <span id="ctl00_preBrachyNomo"></span>
                </td>
                <td width="12%" class="FormInsideTableTopCell">
                  &#160;Post RP
                  7 Yr:
                </td>
                <td width="19%" class="FormInsideTableTopCell">
                  &#160; <span id="ctl00_postRP7yrNomo"></span>
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableTopCell">&#160;PreRP 10:</td>
                <td class="FormInsideTableTopCell">
                  &#160; <span id="ctl00_preRP10Nomo"></span>
                </td>
                <td class="FormInsideTableTopCell">&#160;PreXRT:</td>
                <td class="FormInsideTableTopCell">
                  &#160;
                  <span id="ctl00_preXRTNomo"></span>
                </td>
                <td class="FormInsideTableTopCell">
                  &#160;Post RP
                  10 Yr:
                </td>
                <td class="FormInsideTableTopCell">
                  &#160; <span id="ctl00_postRP10yrNomo"></span>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td valign="top" class="FormOuterTableRow">
            <table align="center" border="0" class="pageWidth" cellpadding="0" cellspacing="0" >
              <tr>
                <td width="50%" valign="top" class="FormInsideTableTopCell" style="padding: 0px 4px;">
                  <span class="blackBoldText">Interval History</span>
                  <br/>
                  <xsl:choose>
                    <xsl:when test="(NoTable/HPI_AddedText != '')">
                      <xsl:value-of select="NoTable/HPI_AddedText"/>
                    </xsl:when>
                  </xsl:choose>
                </td>
                <td colspan="2" align="left" valign="top">
                  <span class="blackBoldText">Other Treatments:</span>
                  <span class="smallGrayText"> (CHEMO,GENE,HORM,ORCH,XRT,NONE)</span>
                  <br/>
                  <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" >
                    <tr>
                      <td align="center" class="FormInsideTableTopLeftCell">Start Date</td>
                      <td align="center" class="FormInsideTableTopCell">
                        TX<br/> <img src="../../Images/shim.gif" border="0" width="90" height="1" />
                      </td>
                      <td align="center" class="FormInsideTableTopCell">Notes (Protocol #)</td>
                      <td align="center" class="FormInsideTableTopCell">Stop Date</td>
                    </tr>


                    <xsl:for-each select="$CombinedRadTx/RadiationTherapy">
                      <xsl:choose>
                        <xsl:when test="(@IsDB = 'true')">
                          <tr class="EFormTableRow clickable" onclick="LoadDataEntryForm('RadiationTherapy', {./RadiationTherapyId}, 'RadTxType,RadTxDateText,RadTxDate,RadTxNotes,RadTxStopDateText,RadTxStopDate')" >
                            <td class="FormInsideTableLeftCell">
                              <xsl:value-of select="RadTxDateText"  />&#160;</td>
                            <td class="FormInsideTableRegCell">
                              <xsl:value-of select="RadTxType"  />&#160;</td>
                            <td class="FormInsideTableRegCell">
                              <xsl:value-of select="RadTxNotes"  />&#160;</td>
                            <td class="FormInnerRowBottomBorder">
                              <xsl:value-of select="RadTxStopDateText"  />&#160;</td>
                          </tr>

                        </xsl:when>
                        <xsl:when test="(@IsDB = 'false') and (RadTxType != '')">
                          <tr class="EFormTableRow clickable" onclick="LoadComponentByTable('RadiationTherapy',{./@RecordId})" >
                            <td class="FormInsideTableLeftCell">
                              <xsl:value-of select="RadTxDateText"  />&#160;
                            </td>
                            <td class="FormInsideTableRegCell">
                              <xsl:value-of select="RadTxType"  />&#160;
                            </td>
                            <td class="FormInsideTableRegCell">
                              <xsl:value-of select="RadTxNotes"  />&#160;
                            </td>
                            <td class="FormInnerRowBottomBorder">
                              <xsl:value-of select="RadTxStopDateText"  />&#160;
                            </td>
                          </tr>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:for-each>




                    <xsl:for-each select="$CombinedMedTx/MedicalTherapy">
                      <xsl:choose>
                        <xsl:when test="(@IsDB = 'true')">
                          <tr class="EFormTableRow clickable" onclick="LoadDataEntryForm('MedicalTherapy', {./MedicalTherapyId}, 'MedTxType,MedTxAgent,MedTxDateText,MedTxDate,MedTxNotes,MedTxStopDateText,MedTxStopDate')" >
                            <td class="FormInsideTableLeftCell">
                              <xsl:value-of select="MedTxDateText"  />&#160;
                            </td>
                            <td class="FormInsideTableRegCell">
                              <xsl:value-of select="MedTxAgent"  />&#160;
                            </td>
                            <td class="FormInsideTableRegCell">
                              <xsl:value-of select="MedTxNotes"  />&#160;
                            </td>
                            <td class="FormInnerRowBottomBorder">
                              <xsl:value-of select="MedTxStopDateText"  />&#160;
                            </td>
                          </tr>

                        </xsl:when>
                        <xsl:when test="(@IsDB = 'false') and (MedTxAgent != '')">
                          <tr class="EFormTableRow clickable" onclick="LoadComponentByTable('MedicalTherapy',{./@RecordId})" >
                            <td class="FormInsideTableLeftCell">
                              <xsl:value-of select="MedTxDateText"  />&#160;
                            </td>
                            <td class="FormInsideTableRegCell">
                              <xsl:value-of select="MedTxAgent"  />&#160;
                            </td>
                            <td class="FormInsideTableRegCell">
                              <xsl:value-of select="MedTxNotes"  />&#160;
                            </td>
                            <td class="FormInnerRowBottomBorder">
                              <xsl:value-of select="MedTxStopDateText"  />&#160;
                            </td>
                          </tr>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:for-each>
                    
                    
                    <tr>
                      <td class="FormInsideTableLeftCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInnerRowBottomBorder">&#160;</td>
                    </tr>

                    <tr>
                      <td class="FormInsideTableLeftCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInnerRowBottomBorder">&#160;</td>
                    </tr>


                    <tr>
                      <td class="FormInsideTableLeftCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInnerRowBottomBorder">&#160;</td>
                    </tr>

                    <tr>
                      <td class="FormInsideTableLeftCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInnerRowBottomBorder">&#160;</td>
                    </tr>



                  </table>
                </td>
              </tr>

              
              <tr>
                <td style="text-align: left; vertical-align: top; height: 30px; padding: 4px;" colspan="2" >Late Complications:&#160;&#160; <input type="checkbox" name="No"/>
                    No&#160;&#160; <input type="checkbox" name="Yes"/> Yes (specify):<br/>
                  <xsl:for-each select="$CombinedToxicities/Toxicities">
                    <xsl:choose>
                      <xsl:when test="(@IsDB = 'true')">
                        <span class="EFormTableRow clickable" onclick="LoadDataEntryForm('Toxicities', {./ToxicityId}, 'ToxName,ToxDateText,ToxDate,ToxNotes')" >
                          <xsl:value-of select="ToxDateText"  />&#160;&#160;<xsl:value-of select="ToxName"  />&#160;&#160;<xsl:value-of select="ToxNotes"  /><br/>
                        </span>
                      </xsl:when>
                      <xsl:when test="(@IsDB = 'false') and (ToxName != '')">
                        <span  class="EFormTableRow" style="display:block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByTable('Toxicities',{./@RecordId})" >
                          <xsl:value-of select="ToxDateText"  />&#160;&#160;<xsl:value-of select="ToxName"  />&#160;&#160;<xsl:value-of select="ToxNotes"  /><br/>
                        </span>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td valign="top" class="FormOuterTableRow">
            <table  class="pageWidth" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="52%" class="FormInnerRowRightBorder" valign="top">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td colspan="3" style="height: 22px;">
                        <span class="blackBoldText">
                          <img src="../../images/shim.gif" border="0" width="4" height="0" />Medications/Devices
                        </span> <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> Yes <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> No&#160;<span>
                          <img src="../../images/shim.gif" border="0" width="30" height="1"/>
                            <input name="DateLastGnRH4" type="checkbox" id="DateLastGnRH4" value="yes" />&#160;Unchanged
                        </span>
                      </td>
                    </tr>
                    <tr align="center">
                      <td width="58%" class="FormInsideTableTopCell">Agent</td>
                      <td width="21%" class="FormInsideTableTopCell">Dose</td>
                      <td width="21%" class="FormInsideTableTopCell">Schedule</td>
                    </tr>

                    <xsl:for-each select="$CombinedMedications/Medications">
                      <xsl:choose>
                        <xsl:when test="(@IsDB = 'true')">
                          <tr class="EFormTableRow clickable" onclick="LoadDataEntryForm('Medications', {./MedicationId}, 'Medication,MedDateText,MedDate,MedDose,MedUnits,MedSchedule')" >
                            <td class="FormInsideTableRegCell"><xsl:value-of select="Medication"  />&#160;</td>
                            <td class="FormInsideTableRegCell"><xsl:value-of select="MedDose"  />&#160;<xsl:value-of select="MedUnits"  /></td>
                            <td class="FormInsideTableRegCell"><xsl:value-of select="MedSchedule"  />&#160;</td>
                          </tr>
                        </xsl:when>
                        <xsl:when test="(@IsDB = 'false') and (Medication != '')">
                          <tr class="EFormTableRow clickable" onclick="LoadComponentByTable('Medications',{./@RecordId})" >
                            <td class="FormInsideTableRegCell">
                              <xsl:value-of select="Medication"  />&#160;
                            </td>
                            <td class="FormInsideTableRegCell">
                              <xsl:value-of select="MedDose"  />&#160;<xsl:value-of select="MedUnits"  />
                            </td>
                            <td class="FormInsideTableRegCell">
                              <xsl:value-of select="MedSchedule"  />&#160;
                            </td>
                          </tr>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:for-each>

                    <tr class="EFormTableRow clickable" onclick="LoadComponentByTable('Medications','')" >
                      <td class="FormInsideTableRegCell">
                        &#160;

                      </td>
                      <td class="FormInsideTableRegCell">
                        &#160;
                        &#160;
                      </td>
                      <td class="FormInsideTableRegCell">
                        &#160;
                        &#160;
                      </td>
                    </tr>

                  </table>
                </td>
                <td width="48%" valign="top">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td  style="height: 22px;" colspan="3">&#160;</td>
                    </tr>
                    <tr align="center">
                      <td width="60%" class="FormInsideTableTopCell">Agent</td>
                      <td width="18%" class="FormInsideTableTopCell">Dose</td>
                      <td width="22%" class="FormInsideTableTopCell">Schedule</td>
                    </tr>
                    <tr align="center">
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                    </tr>
                    <tr align="center">
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                    </tr>
                    <tr align="center">
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                      <td class="FormInsideTableRegCell">&#160;</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr >
          <td class="FormOuterTableRow">
            <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
              <tr >
                <td align="left" valign="top" height="90">
                  <span  class="blackBoldText">Medical &amp; Surgical History/Comorbidities</span><br/><br/>

                  <xsl:for-each select="$CombinedComorbidities/Comorbidities">
                    <xsl:choose>
                      <xsl:when test="(@IsDB = 'true')">
                        <span class="EFormTableRow" style="display:block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadDataEntryForm('Comorbidities', {./ComorbidityId}, 'Comorbidity,ComorbDateText,ComorbDate')" >
                          <xsl:value-of select="ComorbDateText"  />&#160;&#160;<xsl:value-of select="Comorbidity"  /><br/>
                        </span>
                      </xsl:when>
                      <xsl:when test="(@IsDB = 'false') and (Comorbidity != '')">
                        <span  class="EFormTableRow" style="display:block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByTable('Comorbidities',{./@RecordId})" >
                          <xsl:value-of select="ComorbDateText"  />&#160;&#160;<xsl:value-of select="Comorbidity"  /><br/>
                        </span>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>
                </td>
                <td width="55%" valign="top">
                  <span  class="blackBoldText">&#160;</span><br/><br/>
                  <xsl:for-each select="$CombinedProcedures/Procedures">
                    <xsl:choose>
                      <xsl:when test="(@IsDB = 'true')">
                        <span class="EFormTableRow" style="display:block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadDataEntryForm('Procedures', {./ProcedureId}, 'ProcName,ProcDateText,ProcDate,ProcSide,ProcNotes')" >
                          <xsl:value-of select="ProcDateText"  />&#160;&#160;<xsl:value-of select="ProcName"  />&#160;&#160;<xsl:value-of select="ProcSide"  /><br/>
                        </span>
                      </xsl:when>
                      <xsl:when test="(@IsDB = 'false') and (ProcName != '')">
                        <span  class="EFormTableRow" style="display:block;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByTable('Procedures',{./@RecordId})" >
                          <xsl:value-of select="ProcDateText"  />&#160;&#160;<xsl:value-of select="ProcName"  />&#160;&#160;<xsl:value-of select="ProcSide"  /><br/>
                        </span>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>
                </td>
              </tr>
            </table>
          </td>
        </tr>

        <tr>
          <td valign="top" class="FormOuterTableRow">
            <style type="text/css">
              table.FamilySocialHistoryHTMLTable
              {
              border-collapse: collapse;
              }
              table.FamilySocialHistoryHTMLTable td
              {
              border: solid 1px #333333;
              }
            </style>
            <table  style="width: 100%;" border="0" cellspacing="0" cellpadding="4">
              <tr valign="top">
                <td width="49%" class="FormInnerRowRightBorder" style="height: 300px; vertical-align: top;">
                  <span class="blackBoldText" style="margin-right: 50px;">
                    Family
                    History:
                  </span>
                  <xsl:choose>
                    <xsl:when test="contains(NoTable/FamilyHistoryNotes, 'No known family history of ca')">
                      <input type="checkbox" name="FamilyHistoryNotes" checked="checked"  />
                    </xsl:when>
                    <xsl:otherwise>
                      <input type="checkbox" name="FamilyMembers_Notes" />
                    </xsl:otherwise>
                  </xsl:choose>
                  No known family history of ca<br/>

                  <table cellspacing="0"  class="FamilySocialHistoryHTMLTable">
                    <xsl:for-each select="$CombinedFamilyMembers/FamilyMembers">
                      <xsl:choose>
                        <xsl:when test="(@IsDB = 'true')">
                          <tr  class="EFormTableRow"  onmouseover="this.className='chronListHilighted EFormTableRow';" onmouseout="this.className='EFormTableRow'" onclick="LoadDataEntryForm('FamilyMembers', {./FamilyMemberId}, 'FamMemSide,FamMemRelation,FamMemDeathAge')" >
                            <td  height="34"  align="center">
                              <xsl:value-of select="FamMemRelation"  />&#160;
                              <xsl:if test="(FamMemSide != '')">
                                (<xsl:value-of select="FamMemSide"  />)
                              </xsl:if>
                            </td>
                            <td  style="padding-left: 4px;">
                              <xsl:for-each select="./FamilyMemberDiagnosis">
                                <xsl:value-of select="FamMemDiagnosis"  />&#160;
                                <xsl:if test="(FamMemDiagnosisAge != '')">
                                  (Age <xsl:value-of select="FamMemDiagnosisAge"  />)
                                </xsl:if>
                                <xsl:if test="(FamMemNotes != '')">
                                  - <xsl:value-of select="FamMemNotes"  />
                                </xsl:if>
                                <br/>
                              </xsl:for-each>&#160;
                            </td>
                          </tr>
                        </xsl:when>
                        <xsl:when test="(@IsDB = 'false') and ((FamMemSide != '') or (FamMemRelation != '') or (FamMemDeathAge != ''))">
                          <tr  class="EFormTableRow" onmouseover="this.className='chronListHilighted EFormTableRow';" onmouseout="this.className='EFormTableRow'"  onclick="LoadComponentByTable('FamilyMembers',{./@RecordId})" >
                            <td  height="34" class="FormInsideTableRegCell" align="center">
                              <xsl:value-of select="FamMemRelation"  />&#160;
                              <xsl:if test="(FamMemSide != '')">
                                (<xsl:value-of select="FamMemSide"  />)
                              </xsl:if>
                            </td>
                            <td  style="padding-left: 4px;">
                              <xsl:for-each select="./FamilyMemberDiagnosis">
                                <xsl:value-of select="FamMemDiagnosis"  />&#160;
                                <xsl:if test="(FamMemDiagnosisAge != '')">
                                  (Age <xsl:value-of select="FamMemDiagnosisAge"  />)
                                </xsl:if>
                                <xsl:if test="(FamMemNotes != '')">
                                  - <xsl:value-of select="FamMemNotes"  />
                                </xsl:if>
                                <br/>
                              </xsl:for-each>&#160;
                            </td>
                          </tr>
                        </xsl:when>
                        <xsl:otherwise>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>


                  </table>




                </td>
                <td width="51%">

                  <a name="PatientsSocialHistories_Anchor"/>


                  <span class="blackBoldText">Social History:</span>
                  <br/>
                  <br/>



                  <xsl:for-each select="$CombinedSocialHistories/SocialHistories">
                    <xsl:choose>
                      <xsl:when test="(@IsDB = 'true')">


                        <table  class="FamilySocialHistoryHTMLTable">
                          <tr onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxOccupation', 'PatientsSocialHistories')">
                            <td width="10%" align="center" valign="middle" >
                              <strong>Occupation</strong>
                            </td>
                            <td  valign="middle" >
                              <xsl:value-of select="SocHxOccupation"  />&#160;
                            </td>

                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxMaritalStatus', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle">
                              <strong>Marital Status</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:value-of select="SocHxMaritalStatus"  />&#160;
                            </td>
                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxChildren', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Children</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:value-of select="SocHxChildren"  />&#160;
                            </td>
                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxTobaccoType', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Tobacco Type</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:value-of select="SocHxTobaccoType"  />&#160;
                            </td>
                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxTobaccoPacksPerDay', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Tobacco Usage</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:if test="(SocHxTobaccoPacksPerDay != '' or SocHxTobaccoYears != '' )">
                                <xsl:value-of select="SocHxTobaccoPacksPerDay"  />&#160;packs/day for&#160;<xsl:value-of select="SocHxTobaccoYears"  />&#160;years&#160;
                              </xsl:if>&#160;
                            </td>
                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxTobaccoQuitYear', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Year Quit</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:value-of select="SocHxTobaccoQuitYear"  />&#160;
                            </td>
                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxAlcohol', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Alcohol Use</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:value-of select="SocHxAlcohol"  />&#160;
                            </td>
                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxCarcinogen', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Carcinogen Exposure</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:value-of select="SocHxCarcinogen"  />&#160;
                            </td>
                          </tr>

                        </table>



                      </xsl:when>
                      <xsl:when test="((SocHxOccupation != '') or (SocHxMaritalStatus != '') or (SocHxChildren != '') or (SocHxTobaccoType != '') or (SocHxTobaccoPacksPerDay != '') or (SocHxTobaccoYears != '') or (SocHxTobaccoQuitYear != '') or (SocHxAlcohol != '') or (SocHxCarcinogen != ''))">


                        <table  class="FamilySocialHistoryHTMLTable" onmouseover="this.className='FamilySocialHistoryHTMLTable chronListHilighted';" onmouseout="this.className='FamilySocialHistoryHTMLTable'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxOccupation', 'PatientsSocialHistories')">
                            <td width="10%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                              <strong>Occupation</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:value-of select="SocHxOccupation"  />&#160;
                            </td>

                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxMaritalStatus', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Marital Status</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:value-of select="SocHxMaritalStatus"  />&#160;
                            </td>
                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxChildren', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Children</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:value-of select="SocHxChildren"  />&#160;
                            </td>
                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxTobaccoType', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Tobacco Type</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:value-of select="SocHxTobaccoType"  />&#160;
                            </td>
                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxTobaccoPacksPerDay', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Tobacco Usage</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:if test="(SocHxTobaccoPacksPerDay != '' or SocHxTobaccoYears != '' )">
                                <xsl:value-of select="SocHxTobaccoPacksPerDay"  />&#160;packs/day for&#160;<xsl:value-of select="SocHxTobaccoYears"  />&#160;years&#160;
                              </xsl:if>&#160;
                            </td>
                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxTobaccoQuitYear', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Year Quit</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:value-of select="SocHxTobaccoQuitYear"  />&#160;
                            </td>
                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxAlcohol', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Alcohol Use</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:value-of select="SocHxAlcohol"  />&#160;
                            </td>
                          </tr>
                          <tr class="EFormTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('SocHxCarcinogen', 'PatientsSocialHistories')">
                            <td  align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Carcinogen Exposure</strong>
                            </td>
                            <td  valign="middle" class="FormInsideTableLeftCell">
                              <xsl:value-of select="SocHxCarcinogen"  />&#160;
                            </td>
                          </tr>

                        </table>



                      </xsl:when>
                      <xsl:otherwise>


                        <p>
                          Occupation:
                          <!--<asp:Label ID="socHxOccupation" Runat="server" />--><br/>
                          <br/>
                          Marital Status:
                          <!--<asp:Label ID="socHxMaritalStatus" Runat="server" />--><img src="../../Images/shim.gif" border="0" width="30" height="1"/>
                          Children:
                          <!--<asp:Label ID="socHxChildren" Runat="server" />--><br/>
                          <img src="../../Images/shim.gif" border="0" width="1" height="8"/>
                          <br/>
                          <table cellspacing="0" cellpadding="0">
                            <tr>
                              <td style="padding-right: 8px;">Tobacco Use:</td>
                              <td>
                                <input type="checkbox" name="Digitized222222"/> None
                              </td>
                            </tr>
                            <tr>
                              <td>&#160;</td>
                              <td>
                                <!--<asp:Label ID="socHxTobaccoType" Runat="server">
                                                                <input type="checkbox" name="Digitized2222"/>
                                                                    Cigarettes <img src="../../Images/shim.gif" border="0" width="10" height="8"/>
                                                                        <input type="checkbox" name="Digitized22222"/>
                                                                            Cigar<img src="../../Images/shim.gif" border="0" width="10" height="1"/>
                                                                                <input type="checkbox" name="Digitized22223"/>
                  Pipe</asp:Label>-->
                              </td>
                            </tr>
                            <tr>
                              <td>&#160;</td>
                              <td style="padding-top: 20px;">
                                <input type="checkbox"  id="socHxTobaccoPacksPerDayCheckBox" runat="server" NAME="socHxTobaccoPacksPerDayCheckBox"/>
                                <!--<asp:Label ID="socHxTobaccoPacksPerDay" Runat="server">______</asp:Label>-->
                                packs / day for
                                <!--<asp:Label ID="socHxTobaccoYears" Runat="server">______</asp:Label>-->
                                years
                              </td>
                            </tr>
                            <tr>
                              <td>&#160;</td>
                              <td>
                                <input type="checkbox" id="socHxTobaccoQuitYearCheckbox" runat="server" NAME="socHxTobaccoQuitYearCheckbox"/>
                                Year Quit:
                                <!--<asp:Label ID="socHxTobaccoQuitYear" Runat="server">______</asp:Label>-->
                              </td>
                            </tr>

                          </table>

                          <br/>
                          <br/>
                          Alcohol Use:
                          <!--<asp:Label ID="socHxAlcohol" Runat="server" />--><br/>
                          <br/>
                          Carcinogen Exposure:
                          <!--<asp:Label ID="socHxCarcinogen" Runat="server" />--><br/>
                        </p>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:for-each>





                </td>
              </tr>
            </table>
          </td>
        </tr>





        <tr>
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            GU34<img src="../../Images/shim.gif" border="0" width="45" height="1" />U38<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC
            Approval Date: 6/05<img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:10/27/14<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">1</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
          </td>
        </tr>
      </table>
    </div>
    <div align="left"  style="page-break-after:always;">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>


      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <tr><td style="text-align:center; font-size: smaller;">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY</td></tr>
        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="EformHeader"/>
        <!--Date and Physician Header-->
        <tr>
          <td class="FormOuterTableRow blackBoldText"><img src="../../images/shim.gif" border="0" width="4" height="15" />Date: <xsl:value-of select="Encounters/EncDate"/></td>
        </tr>
        <tr>
          <td class="FormOuterTableRow">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td style="padding-top: 5px; vertical-align: top; width: 58%;" class="FormInnerRowRightBorder">
                  <span class="blackBoldText" style="margin-left: 4px;">Biochemical Markers/Lab Tests</span>
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">Marker</td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">GFR</td>
                      <td align="center" valign="middle" class="FormInsideTableTopCell">Data Source</td>
                    </tr>

                    <xsl:for-each select="$SurvivorshipLabTests/LabTests">
                      <xsl:choose>
                        <xsl:when test="(@IsDB = 'true')">
                          <tr class="clickable"  onclick="LoadDataEntryForm('LabTests', {./LabTestId}, 'LabTest,LabDateText,LabDate,LabResult,LabUnits,LabQuality')">
                            <td class="FormInsideTableRegCell" style="height: 17px; text-align: center;"><xsl:value-of select="LabDateText"  />&#160;</td>
                            <td class="FormInsideTableRegCell" style="text-align: center;">
                              <xsl:value-of select="LabTest"  />&#160;
                            </td>
                            <td class="FormInsideTableRegCell" style="text-align: center;">
                              <xsl:value-of select="LabResult"  />&#160;<xsl:value-of select="LabUnits"  />
                            </td>
                            <td class="FormInsideTableRegCell" style="text-align: center;">
                              <xsl:value-of select="GFR"  />&#160;<xsl:value-of select="GFRError"  />
                            </td>
                            <td class="FormInsideTableRegCell" style="text-align: center;">
                              <xsl:value-of select="LabQuality"  />&#160;
                            </td>
                          </tr>
                        </xsl:when>
                        <xsl:when test="(@IsDB != 'true') and (LabTest != '')">
                          <tr class="clickable"  onclick="LoadComponentByTable('LabTests',{./@RecordId})">
                            <td class="FormInsideTableRegCell" style="height: 17px; text-align: center;">
                              <xsl:value-of select="LabDateText"  />&#160;
                            </td>
                            <td class="FormInsideTableRegCell" style="text-align: center;">
                              <xsl:value-of select="LabTest"  />&#160;
                            </td>
                            <td class="FormInsideTableRegCell" style="text-align: center;">
                              <xsl:value-of select="LabResult"  />&#160;<xsl:value-of select="LabUnits"  />
                            </td>
                            <td class="FormInsideTableRegCell" style="text-align: center;">
                              <xsl:value-of select="GFR"  />&#160;<xsl:value-of select="GFRError"  />
                            </td>
                            <td class="FormInsideTableRegCell" style="text-align: center;">
                              <xsl:value-of select="LabQuality"  />&#160;
                            </td>
                          </tr>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:for-each>






                    <tr class="clickable"  onclick="LoadComponentByTable('LabTests','')">
                      <td class="FormInsideTableRegCell" style="height: 17px; text-align: center;">/&#160;&#160;&#160;&#160;&#160;&#160;&#160;/&#160;</td>
                      <td class="FormInsideTableRegCell" style="text-align: center;">&#160;</td>
                      <td class="FormInsideTableRegCell" style="text-align: center;">&#160;</td>
                      <td class="FormInsideTableRegCell" style="text-align: center;">&#160;</td>
                      <td class="FormInsideTableRegCell" style="text-align: center;">&#160;</td>
                    </tr>
                  </table>
                </td>
                <td style="padding-top: 5px; vertical-align: top; width: 42%;">
                  <span class="blackBoldText" style="margin-left: 4px;">Allergies</span>&#160;&#160; <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />Yes <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" /> No&#160;&#160;&#160;&#160;&#160;<span>
                    <input name="DateLastGnRH2" type="checkbox" id="DateLastGnRH2" value="yes"/>
                      NKA&#160;&#160;&#160;&#160;
                      <input name="DateLastGnRH3" type="checkbox" id="DateLastGnRH3" value="yes"/>Unchanged</span>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr align="center">
                      <td width="49%" class="FormInsideTableTopCell">Allergen</td>
                      <td width="51%" class="FormInsideTableTopCell">Reaction</td>
                    </tr>



                    <xsl:for-each select="$CombinedAllergies/Allergies">
                      <xsl:choose>
                        <xsl:when test="(@IsDB = 'true')">

                          <tr class="clickable"  onclick="LoadDataEntryForm('Allergies', {./AllergyId}, 'Allergen,AllergyResponse')">
                            <td class="FormInsideTableRegCell" style="height:17px;">
                              <xsl:value-of select="Allergen"  />&#160;
                            </td>
                            <td class="FormInsideTableRegCell">
                              <xsl:value-of select="AllergyResponse"  />&#160;
                            </td>
                          </tr>
                        </xsl:when>
                        <xsl:when test="(@IsDB = 'false') and (Allergen != '')">
                          <tr class="clickable" onclick="LoadComponentByTable('Allergies',{./@RecordId})">
                            <td class="FormInsideTableRegCell" style="height:17px;">
                              <xsl:value-of select="Allergen"  />&#160;
                            </td>
                            <td class="FormInsideTableRegCell">
                              <xsl:value-of select="AllergyResponse"  />&#160;
                            </td>
                          </tr>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:for-each>

                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Allergies','')">
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                    </tr>
                    

                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>

        <tr>
          <td class="FormOuterTableRow" style="border-bottom: none;">
            <span class="blackBoldText">
              <img src="../../images/shim.gif" border="0" width="4" height="0" />Imaging
            </span>
            <span>
              <img src="../../Images/shim.gif" border="0" width="12" height="1"/>
                <input type="checkbox" name="Films Reviewed"/>
                  Films Reviewed<img src="../../Images/shim.gif" border="0" width="12" height="1"/>
                    <input type="checkbox" name="Compared to Past"/>
                      Compared to Past<img src="../../Images/shim.gif" border="0" width="12" height="1"/>
                        <input type="checkbox" name="Reviewed with Radiologist"/>
                          Reviewed with Radiologist<img src="../../Images/shim.gif" border="0" width="12" height="1"/>
                            <input type="checkbox" name="Digitized"/>
                              Digitized<br/>
                            </span>
            <table class="pageWidth" align="center" border="0" cellpadding="1" cellspacing="0">
              <tr>
                <td width="15%" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
                <td width="15%" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
                <td width="25%" align="center" valign="middle" class="FormInsideTableTopCell">Results</td>
                <td width="45%" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
              </tr>
            </table>
          </td>
        </tr>
        <xsl:for-each select="$CombinedDiagnostics/Diagnostics">
          <xsl:choose>
            <xsl:when test="(@IsDB = 'true')">

              <tr>
                <td class="FormOuterTableRow" style="border-bottom: none;">
                  <table class="pageWidth" style="width: 100%;" align="center" border="0" cellpadding="1" cellspacing="0">
                    <tr  class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadDataEntryForm('Diagnostics', {./DiagnosticId}, 'DxDateText,DxDate,DxType,DxTarget,DxResult,DxTotalNumTumors,DxNotes')" >
                      <td width="15%" height="28" align="center" valign="middle" class="FormInsideTableLeftCell">
                        <xsl:value-of select="DxDateText"  />&#160;
                      </td>
                      <td width="15%" align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="DxType"  />&#160;
                      </td>
                      <td width="25%" align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="DxResult"  />&#160;
                      </td>
                      <td width="45%" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="DxNotes"  />&#160;
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </xsl:when>
            <xsl:when test="((@IsDB = 'false') and ((DxDateText != '') or (DxType != '') or (DxResult != '') or (DxNotes != '')) and ((@RecordId != '11') and (@RecordId != '12') and (@RecordId != '13') and (@RecordId != '14')))">
              <tr>
                <td class="FormOuterTableRow" style="border-bottom: none;">
                  <table class="pageWidth" style="width: 100%;" align="center" border="0" cellpadding="1" cellspacing="0">
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics',{./@RecordId})">
                      <td width="15%" height="28" align="center" valign="middle" class="FormInsideTableLeftCell">
                        <xsl:value-of select="DxDateText"  />&#160;
                      </td>
                      <td width="15%" align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="DxType"  />&#160;
                      </td>
                      <td width="25%" align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="DxResult"  />&#160;
                      </td>
                      <td width="45%" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="DxNotes"  />&#160;
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>
        <!-- empty row for adding new ones -->
        <tr>
          <td class="FormOuterTableRow" style="border-bottom: none;">
            <table class="pageWidth" style="width: 100%;" align="center" border="0" cellpadding="1" cellspacing="0">
              <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics','')">
                <td width="15%" height="28" align="center" valign="middle" class="FormInsideTableLeftCell">/&#160;&#160;&#160;&#160;&#160;&#160;&#160;/</td>
                <td width="15%" align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                <td width="25%" align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                <td width="45%" align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
              </tr>
            </table>
          </td>
        </tr>


        <tr>
          <td class="FormOuterTableRow">

            <style type="text/css">
              table#SurvivorshipHealthMaintenance
              {
              width: 100%;
              border-collapse: collapse;
              border-spacing: 0;
              }
              table#SurvivorshipHealthMaintenance td
              {
              border: solid 1px #666666;
              padding: 1px 2px;
              text-align: center;
              height: 20px;
              }
              table#SurvivorshipHealthMaintenance td:first-child
              {
              border-left: none;
              }
            </style>
            <img src="../../Images/shim.gif" border="0" width="4" height="1" />
            <span class="blackBoldText">Health Maintenance</span>
            <table id="SurvivorshipHealthMaintenance" cellspacing="0">
              <tr>
                <td style="width: 15%;">Test</td>
                <td style="width: 15%;">Date</td>
                <td style="width: 70%;">Results</td>
              </tr>
              <tr onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics','11')">
                <td >Colonoscopy</td>
                <td ><xsl:value-of select="Diagnostics[@RecordId=11]/DxDateText"/>&#160;</td>
                <td ><xsl:value-of select="Diagnostics[@RecordId=11]/DxResult"/>&#160;</td>
              </tr>
              <tr onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics','12')">
                <td >Mammogram</td>
                <td >
                  <xsl:value-of select="Diagnostics[@RecordId=12]/DxDateText"/>&#160;
                </td>
                <td >
                  <xsl:value-of select="Diagnostics[@RecordId=12]/DxResult"/>&#160;
                </td>
              </tr>
              <tr onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics','13')">
                <td >Bone Density Scan</td>
                <td >
                  <xsl:value-of select="Diagnostics[@RecordId=13]/DxDateText"/>&#160;
                </td>
                <td >
                  <xsl:value-of select="Diagnostics[@RecordId=13]/DxResult"/>&#160;
                </td>
              </tr>
              <tr onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Diagnostics','14')">
                <td >Pap Smear</td>
                <td >
                  <xsl:value-of select="Diagnostics[@RecordId=14]/DxDateText"/>&#160;
                </td>
                <td >
                  <xsl:value-of select="Diagnostics[@RecordId=14]/DxResult"/>&#160;
                </td>
              </tr>
              <tr class="clickable" onclick="LoadComponentByField('HealthMaintenanceCholesterolDateText', 'HealthMaintenance_Survivorship')">
                <td >Cholesterol</td>
                <td >
                  <xsl:value-of select="NoTable/HealthMaintenanceCholesterolDateText"/>&#160;
                </td>
                <td >
                  <xsl:value-of select="NoTable/HealthMaintenanceCholesterolResult"/>&#160;
                </td>
              </tr>
              <tr class="clickable" onclick="LoadComponentByField('HealthMaintenancePSADateText', 'HealthMaintenance_Survivorship')">
                <td >PSA</td>
                <td >
                  <xsl:value-of select="NoTable/HealthMaintenancePSADateText"/>&#160;
                </td>
                <td >
                  <xsl:value-of select="NoTable/HealthMaintenanceCholesterolResult"/>&#160;
                </td>
              </tr>
              <tr class="clickable" onclick="LoadComponentByField('HealthMaintenanceFluVaccineDateText', 'HealthMaintenance_Survivorship')">
                <td >Flu Vaccine</td>
                <td >
                  <xsl:value-of select="NoTable/HealthMaintenanceFluVaccineDateText"/>&#160;
                </td>
                <td >
                  <xsl:value-of select="NoTable/HealthMaintenanceFluVaccineResult"/>&#160;
                </td>
              </tr>
              <tr class="clickable" onclick="LoadComponentByField('HealthMaintenancePneumovaxDateText', 'HealthMaintenance_Survivorship')">
                <td >Pneumovax</td>
                <td >
                  <xsl:value-of select="NoTable/HealthMaintenancePneumovaxDateText"/>&#160;
                </td>
                <td >
                  <xsl:value-of select="NoTable/HealthMaintenancePneumovaxResult"/>&#160;
                </td>
              </tr>
              <tr class="clickable" onclick="LoadComponentByField('HealthMaintenanceShinglesVaccineDateText', 'HealthMaintenance_Survivorship')">
                <td >Shingles Vaccine</td>
                <td >
                  <xsl:value-of select="NoTable/HealthMaintenanceShinglesVaccineDateText"/>&#160;
                </td>
                <td >
                  <xsl:value-of select="NoTable/HealthMaintenanceShinglesVaccineResult"/>&#160;
                </td>
              </tr>
              <tr class="clickable" onclick="LoadComponentByField('HealthMaintenanceTdapVaccineDateText', 'HealthMaintenance_Survivorship')">
                <td >Tdap Vaccine</td>
                <td >
                  <xsl:value-of select="NoTable/HealthMaintenanceTdapVaccineDateText"/>&#160;
                </td>
                <td >
                  <xsl:value-of select="NoTable/HealthMaintenanceTdapVaccineResult"/>&#160;
                </td>
              </tr>
            </table>
          </td>
        </tr>


        <tr>
          <td class="FormOuterTableRow">
            <img src="../../Images/shim.gif" border="0" width="4" height="15" />
            <span class="blackBoldText">Review of Systems</span>&#160;&#160;&#160;<span class="smallGrayText">
              Clinician Performing Review:

              <xsl:variable name="ROS_Clinician" select="NoTable/ROS_Clinician"/>
              <xsl:choose>
                <xsl:when test="($ROS_Clinician != '')">
                  <strong>
                    <xsl:value-of select="$ROS_Clinician"/>
                  </strong>
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="NP22" value="Yes"/>
                  NP&#160;&#160;&#160;
                  <input type="checkbox" name="PA22" value="Yes"/>
                  PA&#160;&#160;&#160;
                  <input type="checkbox" name="Fellow22" value="Yes"/>
                  Fellow&#160;&#160;&#160;
                  <input type="checkbox" name="Attending22" value="Yes"/>Attending
                </xsl:otherwise>
              </xsl:choose>
            </span> <br/>
            <table align="center" border="0" style="width: 100%;" cellpadding="1" cellspacing="0">
              <tr onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncReviewOfSystems','')">
                <td align="center" class="FormInsideTableTopCell">
                  <strong>System</strong>
                </td>
                <td align="center" class="FormInsideTableTopCell">
                  <strong>Symptom</strong>
                </td>
                <td align="center" class="FormInsideTableTopCell">
                  <strong>Not Present</strong>
                </td>
                <td align="center" class="FormInsideTableTopCell">
                  <strong>Present</strong>
                </td>
                <td align="center" class="FormInsideTableTopCell">
                  <strong>
                    Disease<br/>Related
                  </strong>
                </td>
                <td width="50%" align="center" class="FormInsideTableTopCell">
                  <strong>Notes</strong>
                </td>
              </tr>



              <xsl:for-each select="Encounters/EncReviewOfSystems">
                <xsl:choose>
                  <xsl:when test="((ROS_System != '') or (ROS_Symptom != '') or (ROS_Result != '') or (ROS_RelatedTo != '') or (ROS_Notes != ''))">
                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncReviewOfSystems',{./@RecordId})">
                      <td align="center" valign="middle" class="FormInsideTableLeftCell">
                        <xsl:choose>
                          <xsl:when test="(ROS_System='Constitution')">
                            Gen
                          </xsl:when>
                          <xsl:when test="(ROS_System='Dermatology / Skin')">
                            Skin
                          </xsl:when>
                          <xsl:when test="(ROS_System='Pulmonary')">
                            Resp
                          </xsl:when>
                          <xsl:when test="(ROS_System='Cardiovascular (General)')">
                            CV
                          </xsl:when>
                          <xsl:when test="(ROS_System='Gastrointestinal')">
                            GI
                          </xsl:when>
                          <xsl:when test="(ROS_System='Genitourinary')">
                            GU
                          </xsl:when>
                          <xsl:when test="(ROS_System='Psychiatric')">
                            Psych
                          </xsl:when>
                          <xsl:when test="(ROS_System='Neurology')">
                            Neuro
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="ROS_System"  />&#160;
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                      <td align="center" valign="middle" class="FormInsideTableRegCell">
                        <xsl:value-of select="ROS_Symptom"  />&#160;
                      </td>

                      <xsl:choose>
                        <xsl:when test="(ROS_Result='Abnormal')">
                          <td align="center" class="FormInsideTableRegCell">
                            <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                          </td>
                          <td align="center" class="FormInsideTableRegCell">
                            <img src="../../Images/FormImages/WinCheckbox_Checked.gif" width="13" height="13" vspace="1" />
                          </td>
                        </xsl:when>
                        <xsl:when test="(ROS_Result='Normal')">
                          <td align="center" class="FormInsideTableRegCell">
                            <img src="../../Images/FormImages/WinCheckbox_Checked.gif" width="13" height="13" vspace="1" />
                          </td>
                          <td align="center" class="FormInsideTableRegCell">
                            <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                          </td>
                        </xsl:when>
                        <xsl:when test="(ROS_Result='Not Done')">
                          <td colspan="2" align="center" class="FormInsideTableRegCell">
                            <i>*Not Done*</i>&#160;
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td colspan="2" align="center" class="FormInsideTableRegCell">
                            <xsl:value-of select="ROS_Result"  />&#160;
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>

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


            </table>
          </td>
        </tr>
        <tr>
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            GU34<img src="../../Images/shim.gif" border="0" width="45" height="1" />U38<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC
            Approval Date: 6/05<img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:10/27/14<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">2</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
          </td>
        </tr>
      </table>
    </div>

    <div align="left"  style="page-break-after:always;">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>


      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <tr><td style="text-align:center; font-size: smaller;">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY</td></tr>
        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="EformHeader"/>
        <!--Date and Physician Header-->
        <tr>
          <td class="FormOuterTableRow blackBoldText">
            <img src="../../images/shim.gif" border="0" width="4" height="15" />Date: <xsl:value-of select="Encounters/EncDate"/>
          </td>
        </tr>
        <tr>
          <td class="FormOuterTableRow">
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="50%" class="FormInsideTableTopLeftCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="1" />
                  <span class="blackBoldText">Urinary Function Survey </span>
                </td>
                <td width="50%" class="FormInsideTableTopCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="1" />
                  <span class="blackBoldText">Erectile Function Survey</span>
                  <img src="../../images/shim.gif" border="0" width="20" height="1"/>
                    <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />&#160;Not Applicable
                </td>
              </tr>
              <tr>
                <td height="25" class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="1" />Q1:______<img src="../../images/shim.gif" border="0" width="6" height="1"/>
                    Q2:______<img src="../../images/shim.gif" border="0" width="6" height="1"/>Q3:______</td>
                <td class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="1" />Q4:_____ <img src="../../images/shim.gif" border="0" width="30" height="1"/>
                    On PDE-5? <input type="checkbox" name="Yes2"/>
                      Yes&#160; <input type="checkbox" name="Yes22"/>No</td>
              </tr>
              <tr>
                <td height="25" class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="1" />Total: ____ / 15&#160;<br/><span id="ctl00_LastUrinaryQOLScores" class="blackBoldTextSmall"></span><span id="ctl00_UrinaryQOL" class="blackBoldTextSmall"></span>
                </td>
                <td class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="1" />(Q5:_____ &#160;&#160;+&#160;&#160;Q6:_____&#160;)&#160;&#160;=<img src="../../images/shim.gif" border="0" width="4" height="0" />Total: _____ / 12<br/><span id="ctl00_LastSexualQOLScores" class="blackBoldTextSmall"></span><span id="ctl00_SexualQOL" class="blackBoldTextSmall"></span>
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="1" />Continence:<img src="../../images/shim.gif" width="10" height="1"/>
                  <span style="display:inline-block;padding:1px 14px;border:solid 1px #666666;">
                    <xsl:value-of select="Surveys[@RecordId=2]/SurveyItems[@RecordId=1]/SurveyItemResult"/>&#160;
                  </span>
                      <img src="../../images/shim.gif" width="5" height="1"/>
                        Date Fully Continent: 
                  <span style="display:inline-block;padding:1px 14px;border-bottom:solid 1px #666666;">
                    <xsl:value-of select="Surveys[@RecordId=6]/SurveyDateText"/>&#160;
                  </span><br/>

                  <span id="ctl00_LastCont" class="blackBoldTextSmall"></span>
                </td>
                <td align="left" class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="1" />Current Erectile Function:<img src="../../images/shim.gif" width="10" height="1"/>
                  <span style="display:inline-block;padding:1px 14px;border:solid 1px #666666;"><xsl:value-of select="Surveys[@RecordId=3]/SurveyItems[@RecordId=1]/SurveyItemResult"/>&#160;</span>
                    <span id="ctl00_LastPot" class="FormPopulatedSmallerText"></span>
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell" onmouseover="this.className='FormInsideTableRegCell chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByTable('QOL_Therapy','4')">
                  <img src="../../images/shim.gif" border="0" width="4" height="0" />TX for Stricture:<img src="../../images/shim.gif" border="0" width="20" height="1"/>
                  <span style="display:inline-block;padding:1px 4px;border:solid 1px #666666;">
                    <xsl:value-of select="QOL_Therapy[@RecordId=4]/QOL_Therapy"/>&#160;
                  </span>
                      <img src="../../images/shim.gif" border="0" width="20" height="1"/>
                        Tx Date:<span style="display:inline-block;padding:1px 4px;border:solid 1px #666666;">
                  <xsl:value-of select="QOL_Therapy[@RecordId=4]/QOL_TxDateText"/>&#160;
                </span>
                </td>
                <td class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="1" />% Best Erection: No Medications: 
<span style="display:inline-block;padding:1px 14px;border-bottom:solid 1px #666666;">
                  <xsl:value-of select="Surveys[@RecordId=3]/SurveyItems[@RecordId=2]/SurveyItemResult"/>&#160;
                </span>
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell" onmouseover="this.className='FormInsideTableRegCell chronListHilighted';" onmouseout="this.className='FormInsideTableRegCell'" onclick="LoadComponentByTable('QOL_Therapy','3')">
                  <img src="../../images/shim.gif" border="0" width="4" height="0" />TX for Incontinence:<span style="display:inline-block;padding:1px 4px;border:solid 1px #666666;">
                  <xsl:value-of select="QOL_Therapy[@RecordId=3]/QOL_Therapy"/>&#160;
                </span>

                  <img src="../../images/shim.gif" border="0" width="20" height="1"/>
                      Tx Date:<span style="display:inline-block;padding:1px 4px;border:solid 1px #666666;">
                  <xsl:value-of select="QOL_Therapy[@RecordId=3]/QOL_TxDateText"/>&#160;
                </span>
                </td>
                <td class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="1" />% Best Erection: Oral PDE-5 Drugs:
                  <span style="display:inline-block;padding:1px 14px;border-bottom:solid 1px #666666;">
                    <xsl:value-of select="Surveys[@RecordId=3]/SurveyItems[@RecordId=3]/SurveyItemResult"/>&#160;
                  </span>
                </td>
              </tr>
              <tr id="ctl00_LastIncontTxTableRow">
                <td class="FormInnerRowRightBorder" colspan="2">
                  <img src="../../images/shim.gif" border="0" width="20" height="1"/>
                    <span id="ctl00_LastIncontTx" class="blackBoldTextSmall"></span>
                </td>
              </tr>

              <tr>
                <td class="FormInsideTableRegCell">
                  <p class="smallGrayText">
                    <img src="../../images/shim.gif" border="0" width="4" height="1" />1 - Continence(no pads)<br/>
                    <img src="../../images/shim.gif" border="0" width="4" height="1" />2 - Mild SUI(leaks only during heavy actvty)<br/>
                    <img src="../../images/shim.gif" border="0" width="4" height="1" />3 - Moderate SUI(leaks with moderate actvty)<br/>
                    <img src="../../images/shim.gif" border="0" width="4" height="1" />4 - Severe SUI(leaks during normal actvty, dry at night and at rest)<br/>
                    <img src="../../images/shim.gif" border="0" width="4" height="1" />5 - Total incont(continuous leakage of urine at rest)
                  </p>
                </td>
                <td valign="top" class="FormInsideTableRegCell">
                  <span class="smallGrayText">
                    <img src="../../images/shim.gif" border="0" width="4" height="1" />Current Erectile Function<br/>
                    <img src="../../images/shim.gif" border="0" width="4" height="1" />1-Normal, full erections <br/>
                    <img src="../../images/shim.gif" border="0" width="4" height="1" />2-Full, but recently diminished <br/>
                    <img src="../../images/shim.gif" border="0" width="4" height="1" />3-Partial, satis. for intercourse <br/>
                    <img src="../../images/shim.gif" border="0" width="4" height="1" />4-Partial, unsatis. for intercourse<br/>
                    <img src="../../images/shim.gif" border="0" width="4" height="1" />5-Impotent
                  </span>
                </td>
              </tr>
            </table>
          </td>
        </tr>

        <tr>
          <td class="FormOuterTableRow">
            <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
              <tr>
                <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder">
                  <span class="blackBoldText">Vital Signs</span>
                </td>
                <td width="30%" height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="0" />BP:&#160;&#160;<strong>
                    <xsl:value-of select="Encounters/EncSystolic"/>
                    <xsl:if test="((Encounters/EncSystolic != '') or (Encounters/EncDiastolic != ''))">&#160;/&#160;</xsl:if>
                    <xsl:value-of select="Encounters/EncDiastolic"/>
                  </strong>
                </td>
                <td width="30%" height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="0" />Resp:&#160;&#160;<strong>
                  <xsl:value-of select="Encounters/EncRespiration"/>
                  </strong>
                </td>
                <td width="30%" height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="0" />Height:&#160;&#160;<strong>
                  <xsl:value-of select="Encounters/EncHeight"/></strong>
                </td>
              </tr>
              <tr>
                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="0" />Pulse:&#160;&#160;<strong>
                  <xsl:value-of select="Encounters/EncPulse"/>
                </strong>
                </td>
                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="0" />Temp:&#160;&#160;<strong>
                  <xsl:value-of select="Encounters/EncTemp"/>
                </strong>
                </td>
                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                  <img src="../../images/shim.gif" border="0" width="4" height="0" />Weight:
                  <span style="display: inline-block; width: 50px;">&#160;&#160;<strong><xsl:value-of select="Encounters/EncWeight"/></strong></span>
                  BMI:&#160;&#160;<strong>
                  <xsl:value-of select="Encounters/EncBMI"/>
                </strong>
              </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="FormOuterTableRow">
            <img src="../../Images/shim.gif" border="0" width="4" height="0" />
            <span class="blackBoldText">Exam</span>&#160;&#160;&#160;<span class="smallGrayText">
              Clinician
              Performing Initial Exam:
              <xsl:choose>
                <xsl:when test="(NoTable/Exam_Clinician_NP != '')">
                  <input type="checkbox" name="NP" checked="checked" />
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="NP"   />
                </xsl:otherwise>
              </xsl:choose>NP&#160;&#160;&#160;
              <xsl:choose>
                <xsl:when test="(NoTable/Exam_Clinician_PA != '')">
                  <input type="checkbox" name="PA" checked="checked" />
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="PA"   />
                </xsl:otherwise>
              </xsl:choose>PA&#160;&#160;&#160;
              <xsl:choose>
                <xsl:when test="(NoTable/Exam_Clinician_Fellow != '')">
                  <input type="checkbox" name="Fellow" checked="checked" />
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="Fellow"   />
                </xsl:otherwise>
              </xsl:choose>Fellow&#160;&#160;&#160;
              <xsl:choose>
                <xsl:when test="(NoTable/Exam_Clinician_Attending != '')">
                  <input type="checkbox" name="Attending" checked="checked" />
                </xsl:when>
                <xsl:otherwise>
                  <input type="checkbox" name="Attending"   />
                </xsl:otherwise>
              </xsl:choose>Attending
            </span><br/>
            <table align="center" border="0" style="width: 100%; border-collapse: collapse;" cellpadding="0" cellspacing="0">
              <tr onmouseover="this.className='chronListHilighted';" onmouseout="this.className=''" onclick="LoadComponentByTable('EncExams','')">
                <td  align="center" class="FormInsideTableTopLeftCell">
                  <strong>System</strong>
                </td>
                <td colspan="2" align="center" class="FormInsideTableTopCell" style="background-color: transparent;" >
                  <strong>
                    Normal
                    Findings
                  </strong>
                </td>
                <td align="center" class="FormInsideTableTopCell" style="background-color: transparent;" >
                  <strong>Abnormal</strong>
                </td>
                <td  align="center" class="FormInsideTableTopCell" style="background-color: transparent;" >
                  <strong>
                    Attnd<br/>
                    Performed
                  </strong>
                </td>
                <td width="40%" align="center" class="FormInsideTableTopCell" style="background-color: transparent;" >
                  <strong>Notes</strong>
                </td>
              </tr>


              <xsl:for-each select="Encounters/EncExams">
                <xsl:choose>
                  <xsl:when test="((ExamSystem != '') or (Exam != '') or (ExamResult != '') or (ExamAttendingPerformed != '') or (ExamNotes != ''))">
                    <xsl:variable name="lastExamSystem" select="ExamSystem"/>

                    <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('EncExams',{./@RecordId})">
                      <xsl:if test="(not(preceding-sibling::EncExams[ExamSystem=$lastExamSystem]))">
                        <td align="center" valign="middle" class="FormInsideTableLeftCell" style="border-top: solid 1px; border-bottom: none;">
                          <xsl:value-of select="ExamSystem"  />&#160;
                        </td>
                      </xsl:if>
                      <xsl:if test="(preceding-sibling::EncExams[ExamSystem=$lastExamSystem])">
                        <td align="center" valign="middle" class="FormInsideTableLeftCell" style="border-top: none; border-bottom: none;">&#160;</td>
                      </xsl:if>
                      <td align="center" valign="middle" class="FormInsideTableRegCell" style="border-right: none;">
                        <xsl:value-of select="Exam"  />&#160;
                      </td>


                      <!--Choose Exam Result and modify format of display-->
                      <xsl:choose>
                        <xsl:when test="(ExamResult='Abnormal')">
                          <td align="center" class="FormInsideTableRegCell">
                            <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                          </td>
                          <td align="center" class="FormInsideTableRegCell">
                            <img src="../../Images/FormImages/WinCheckbox_Checked.gif" width="13" height="13" vspace="1" />
                          </td>
                        </xsl:when>
                        <xsl:when test="(ExamResult='Normal')">
                          <td align="center" class="FormInsideTableRegCell">
                            <img src="../../Images/FormImages/WinCheckbox_Checked.gif" width="13" height="13" vspace="1" />
                          </td>
                          <td align="center" class="FormInsideTableRegCell">
                            <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" vspace="1" />
                          </td>
                        </xsl:when>
                        <xsl:when test="(ExamResult='Not Done')">
                          <td colspan="2" align="center" class="FormInsideTableRegCell">
                            <i>*Not Done*</i>&#160;
                          </td>
                        </xsl:when>
                        <xsl:otherwise>
                          <td colspan="2" align="center" class="FormInsideTableRegCell">
                            <xsl:value-of select="ROS_Result"  />&#160;
                          </td>
                        </xsl:otherwise>
                      </xsl:choose>


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







            </table>
          </td>
        </tr>

        <tr>
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            GU34<img src="../../Images/shim.gif" border="0" width="45" height="1" />U38<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC
            Approval Date: 6/05<img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:10/27/14<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">3</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
          </td>
        </tr>
      </table>
    </div>
    <div id="ctl00_LastPageInForm" align="left">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>




      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <tr><td style="text-align:center; font-size: smaller;">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY</td></tr>
        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="EformHeader"/>
        
        <tr>
          <td class="FormOuterTableRow">
            <table align="center" border="0" width="100%" cellpadding="2" cellspacing="0">
              <tr>
                <td colspan="3" class="blackBoldText">Impression &amp; Plan </td>
              </tr>
              <tr>
                <td width="50%" align="center" class="FormInsideTableTopCell">
                  <strong>Diagnoses / Problem List</strong>
                </td>
                <td width="50%" align="center" class="FormInsideTableTopCell">
                  <strong>Plan &amp; Referrals</strong>
                </td>
              </tr>

              <xsl:for-each select="PatientProblems">
                <xsl:choose>
                  <xsl:when test="(ProblemName != '')">
                    <tr class="EFormTableRow clickable" onclick="LoadComponentByTable('PatientProblems',{./@RecordId})">
                      <td class="FormInsideTableLeftCell" style="font-weight: bold; vertical-align: top; padding: 6px;">
                        <xsl:value-of select="ProblemName"  />
                      </td>
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
                </xsl:choose>
              </xsl:for-each>

              <tr class="EFormTableRow clickable" onclick="LoadComponentByTable('PatientProblems','')">
                <td valign="top" class="FormInsideTableRegCell">&#160;</td>
                <td class="FormInsideTableRegCell"  >&#160;</td>
              </tr>
<!--              <tr>
                <td rowspan="5" class="FormInsideTableRegCell" style="vertical-align: top;">
                  1.&#160;&#160;<img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Bladder Cancer
                </td>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Return Visit in 12 Months
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Return Visit in 6 Months
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Urine Cytology
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Renal US
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;CXR
                </td>
              </tr>



              <tr>
                <td rowspan="4" class="FormInsideTableRegCell" style="vertical-align: top;">
                  2.&#160;&#160;<img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Testicular Cancer
                </td>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Return Visit in 12 Months
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Return Visit in 6 Months
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;CXR
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;AFP, Bhcg, LDH
                </td>
              </tr>




              <tr>
                <td rowspan="5" class="FormInsideTableRegCell" style="vertical-align: top;">
                  3.&#160;&#160;<img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Prostate Cancer
                </td>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Return Visit in 12 Months
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Return Visit in 6 Months
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Discharge to PCP for Continued Annual PSA and Exam
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Repeat PSA in 12 Months
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Repeat PSA in 6 Months
                </td>
              </tr>









              <tr>
                <td rowspan="8" class="FormInsideTableRegCell" style="vertical-align: top;">
                  4.&#160;&#160;<img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Renal Cancer
                </td>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Return Visit in 12 Months
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Return Visit in 6 Months
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Renal US
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;CXR
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;MRI Renal Protocol
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;CT Abdomen/Pelvis
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;UA
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell"  >
                  <img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;CMP
                </td>
              </tr>



              <tr>
                <td valign="top" class="FormInsideTableRegCell">
                  5.&#160;&#160;<img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Renal Mass
                </td>
                <td class="FormInsideTableRegCell"  >&#160;</td>
              </tr>
              <tr>
                <td valign="top" class="FormInsideTableRegCell">
                  6.&#160;&#160;<img src="../../images/FormImages/WinCheckbox.gif" style="vertical-align: middle;" />&#160;Active Surveillance
                </td>
                <td class="FormInsideTableRegCell"  >&#160;</td>
              </tr>
              <tr>
                <td valign="top" class="FormInsideTableRegCell">7.</td>
                <td class="FormInsideTableRegCell"  >&#160;</td>
              </tr>
              <tr>
                <td valign="top" class="FormInsideTableRegCell">8.</td>
                <td class="FormInsideTableRegCell"  >&#160;</td>
              </tr>
-->
            </table>
          </td>
        </tr>
        <!-- Patient Consent Statements -->

        <tr class="clickable"  onclick="LoadComponentByField('TreatmentRisksDiscussed')">
          <td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px; background-color: transparent;">
            <xsl:choose>
              <xsl:when test="(NoTable/TreatmentRisksDiscussed != '')">
                <input type="checkbox" name="TreatmentRisksDiscussed" style="vertical-align: middle;" checked="checked" />
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="TreatmentRisksDiscussed" style="vertical-align: middle;"  />
              </xsl:otherwise>
            </xsl:choose>
            Risks, benefits, and rationale of treatment plan discussed in detail. All questions answered.
          </td>
        </tr>
        <tr class="clickable"  onclick="LoadComponentByField('ProtocolRisksDiscussed')">
          <td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px; background-color: transparent;">
            <xsl:choose>
              <xsl:when test="(NoTable/ProtocolRisksDiscussed != '')">
                <input type="checkbox" name="ProtocolRisksDiscussed" style="vertical-align: middle;" checked="checked" />
              </xsl:when>
              <xsl:otherwise>
                <input type="checkbox" name="ProtocolRisksDiscussed" style="vertical-align: middle;"  />
              </xsl:otherwise>
            </xsl:choose> The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.
          </td>
        </tr>
        <tr>
          <td class="FormOuterTableRow">
            <span class="blackBoldText">Disposition</span>

            <table style="width: 40%;" cellpadding="4" cellspacing="0" border="0">
              <tr>
                <td valign="bottom" align="center" class="FormInsideTableTopCell">Appointment</td>
                <td valign="bottom" align="center" class="FormInsideTableTopCell">Y</td>
                <td valign="bottom" align="center" class="FormInsideTableTopCell">N</td>
              </tr>

            <xsl:for-each select="NoTable/Disposition">
              <xsl:choose>
                <xsl:when test="(DispositionAppointment != '')">
                  <tr class="clickable" onclick="LoadComponentByTable('Disposition',{./@RecordId})">
                    <td align="left" class="FormInsideTableRegCell">
                      <xsl:value-of select="DispositionAppointment"  />
                    </td>
                    <td align="center" class="FormInsideTableRegCell">
                      <img src="../../images/FormImages/WinCheckbox_Checked.gif" style="width: 13px; height: 13px; vertical-align: middle;" />
                    </td>
                    <td align="center" class="FormInsideTableRegCell">
                      <img src="../../images/FormImages/WinCheckbox.gif" style="width: 13px; height: 13px; vertical-align: middle;" />
                    </td>
                  </tr>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
              <tr class="clickable" onclick="LoadComponentByTable('Disposition','')">
                <td align="left" class="FormInsideTableRegCell">&#160;</td>
                <td align="center" class="FormInsideTableRegCell">&#160; </td>
                <td align="center" class="FormInsideTableRegCell">&#160; </td>
              </tr>
            </table>
          </td>
        </tr>

        <tr>
          <td class="FormOuterTableRow">
            <table width="100%" cellpadding="4" cellspacing="0" border="0">
              <tr>
                <td class="blackBoldText" style="width: 70%; border-bottom: solid 1px #666666; border-right: solid 1px #666666; text-align: left;" >Counseling</td>
                <td class="blackBoldText" style="border-bottom: solid 1px #666666; text-align: left;" >Notes</td>
              </tr>
              <tr>
                <td style="height: 120px; vertical-align: top; line-height: 1.5em;border-right: solid 1px #666666;" class="clickable"  onclick="LoadComponentByField('CounselingDescription')"><xsl:value-of select="NoTable/CounselingDescription"  /></td>
                <td style="vertical-align: top; line-height: 1.5em;" class="clickable"  onclick="LoadComponentByField('CounselingNotes')">
                  <xsl:value-of select="NoTable/CounselingNotes"  />
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="FormOuterTableRow">
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
              <tr>
                <td class="FormInsideTableRegCell">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="clickable" onclick="LoadComponentByTable('Prescriptions','')">
                    <tr>
                      <td height="18" >
                        <img src="../../images/shim.gif" border="0" width="4" height="1" />Prescriptions:
                      </td>
                    </tr>

                    <xsl:for-each select="NoTable/Prescriptions">
                      
                        
                          <tr>
                            <td height="18" width="50%">
                              <img src="../../images/shim.gif" border="0" width="4" height="1" />Rx: <xsl:choose><xsl:when test="(PrescriptionType != '')">
                                <span style="text-decoration: underline;">
                                  &#160;&#160;<xsl:value-of select="PrescriptionType"  /> (<xsl:value-of select="PrescriptionNewRefill"  />)&#160;
                                  &#160;
                                </span>
                              </xsl:when>
<xsl:otherwise>________________________________</xsl:otherwise></xsl:choose>
                            </td>
                          </tr>
                    </xsl:for-each>
                  </table>
                </td>
                <td class="FormInsideTableTopCell">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td rowspan="2">
                        Copy to:<br/><img src="../../images/shim.gif" border="0" width="40" height="1"/>
                          <input name="fellow222" type="checkbox" id="fellow223"/>
                            Local M.D.: _____________________<br/><br/><img src="../../images/shim.gif" border="0" width="36" height="1" /> <input name="fellow2222" type="checkbox" id="fellow2222"/>
							  Other: _________________________</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="FormOuterTableRow">
            <table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="2">
              <tr>
                <td colspan="2">
                  <span class="blackBoldText">Signature</span>
                </td>
                <td>&#160;</td>
                <td class="blackBoldText">&#160;</td>
              </tr>
              <tr>
                <td colspan="4" style="padding-top: 20px; text-align: center;">
                  <span class="AttendingSignature_Blank blackBoldText">
                    <img src="../../Images/shim.gif" border="0" width="1" height="20" /> Nurse Practitioner: ________________________________________<img src="../../Images/shim.gif" border="0" width="22" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="22" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span>
                  </span>
                  <span class="AttendingSignature_Signed blackBoldText" style="display: none;">
                    <img src="../../Images/shim.gif" border="0" width="1" height="20" /> Nurse Practitioner: <img class="signedForm_signatureImage" style="height: 90px;vertical-align:middle;"  /><img src="../../Images/shim.gif" border="0" width="22" height="1" />Date: <span class="signedForm_date">____/____/____</span><img src="../../Images/shim.gif" border="0" width="22" height="1" />Time: <span class="signedForm_time">
                      ___:____ <span style="font-size: 9px;">AM / PM </span>
                    </span>
                  </span>
                </td>
              </tr>
              <tr>
                <td colspan="4" style="text-align: center; padding-bottom: 10px;" >
                  <span class="blackBoldTextSmall">**Please verify that the service date is printed on each page**</span>
                </td>
              </tr>
            </table>
          </td>
        </tr>

        <tr>
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            GU34<img src="../../Images/shim.gif" border="0" width="45" height="1" />U38<img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC
            Approval Date: 6/05<img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:10/27/14<img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">4</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
          </td>
        </tr>
      </table>
    </div>




  </xsl:template>
</xsl:stylesheet>
