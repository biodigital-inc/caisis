<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--Variables-->
<!--Barcode Variables-->
<xsl:variable name="DocType">*U19*</xsl:variable>
<xsl:variable name="AcctType">*ACCTOUTPATIENT*</xsl:variable>
<!--Header Variables-->
<xsl:variable name="ReportTitle">GU Prostate Follow-Up Patient</xsl:variable>
<!--Footer Variables-->
<xsl:variable name="DocNumber">15</xsl:variable>
<xsl:variable name="DocAssignment">19</xsl:variable>
<xsl:variable name="ApprovalDate">8/03</xsl:variable>
<xsl:variable name="RevisedDate">10/05/10</xsl:variable>
<!--Please Note: The footer cannot be implemented as a template until Jason's new page counting information is added
<xsl:variable name="PageNumber">X of Y</xsl:variable>-->


  <!--Header Variables-->
  <!--ToDo: Use institution Short Name From Web Config-->
  <xsl:variable name="InstitutionShortName">MSKCC</xsl:variable>
  <!--ToDo: Move to Library once other variables pulled from web config-->
  <xsl:variable name="PrivacyHeader">
    <tr>
      <td style="text-align:center;">
        <font size="-1">
          CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY
        </font>
      </td>
    </tr>
  </xsl:variable>

  <xsl:include href="../../../Core/Eforms/EFormTemplateLibrary.xslt" />



    <xsl:template match="eform">


    <div align="left"  style="page-break-after:always;">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>
        <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
            <xsl:value-of select="$PrivacyHeader"/>


            <!--eForm Header: Demographics, Institution Symbol and Form name-->
            <xsl:call-template name="EformHeader"/>
            <!--Date and Physician Header-->
                <tr>
                    <td  class="FormOuterTableRow">
                        <a name="DatePhysician_Anchor"/>
                        <table class="EFormTable" cellspacing="0">
                            <tr class="EFormTableRow">
                                <td width="50%" height="10" align="left" valign="bottom" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('EncDate','AppointmentWMultiClinicians')">
                                    <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Date</span>:&#160;<xsl:value-of select="Encounters/EncDate"/>
                                </td>
                                <td width="50%" align="left" valign="bottom" onmouseover="this.className='chronListHilighted'" onmouseout="this.className=''" onclick="LoadComponentByField('EncPhysician','AppointmentWMultiClinicians')">
                                    <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Physician</span>:&#160;<xsl:value-of select="Encounters/EncPhysician"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            <!--Referring MD Row-->
            <xsl:call-template name="ReferringMD"/>
            <!--Chief Complaint
        <xsl:call-template name="EncChiefComplaint"/>-->
            <!--HPI and Disease States-->
            <tr>
                <td class="FormOuterTableRow">
                        <table class="EFormTable" cellspacing="0">
                        <tr class="EFormTableRow">
                            <td width="71%" valign="top" style="padding-left: 4px;">
                               <!-- <xsl:call-template name="GU_ProstateHpi"/> -->
                                <span class="blackBoldText">HPI / Diagnosis / Stage</span>
                                <br/>

                                <style type="text/css">
                                    table.GUHPIRow td
                                    {
                                    border-bottom: solid 1px #cccccc;
                                    vertical-align: top
                                    font-size: 10px;
                                    }
                                    table.GUHPIRow td.startDate
                                    {
                                    width: 75px;
                                    white-space:nowrap;
                                    }
                                    table.GUHPIRow td.endDate
                                    {
                                    width: 100px;
                                    white-space:nowrap;
                                    }
                                </style>


                                <table border="0" cellpadding="0" cellspacing="0">
                                <xsl:variable name="EFormTOP" select="/"/>
                                <xsl:for-each select="$HPIItems/HPIGroup">
                                    <tr>
                                        <td>
                                            <table border="0" cellpadding="0" cellspacing="0" class="GUHPIRow">
                                                
                                                    
                                
              <xsl:choose>
                <xsl:when test="(descendant::PriKey[1] != '')">
                <tr>
                    <td class="startDate" onmouseover="this.className='startDate chronListHilighted';" onmouseout="this.className='startDate'" onclick="LoadDataEntryForm('{descendant::Table[1]}','{descendant::PriKey[1]}','')" title="Date" >
                      <xsl:value-of select="@HPIDate"/>&#160;
                    </td>
                    <xsl:for-each select="HPI">
                        <xsl:choose>
                            <xsl:when test="(position() = 1)">
                        <td class="endDate" onmouseover="this.className='endDate chronListHilighted';" onmouseout="this.className='endDate'"  onclick="LoadDataEntryForm('{Table}','{PriKey}','')" title="Stop Date (if applicable)" ><xsl:choose><xsl:when test="(EndDate != '')">-&#160;<xsl:value-of select="EndDate" /></xsl:when></xsl:choose><xsl:text>&#160;</xsl:text>
                        </td>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="Item != ''">
                        <td style="width: auto;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className=''" onclick="LoadDataEntryForm('{Table}','{PriKey}','')">
                            <xsl:value-of select="Item" />&#160;&#160;
                        </td>
                            </xsl:when>
                        </xsl:choose>
                      </xsl:for-each>
                  </tr>
                </xsl:when>
                <xsl:otherwise>
                    <tr>
                    <td  class="startDate" onmouseover="this.className='startDate chronListHilighted';" onmouseout="this.className='startDate'">
                      <xsl:value-of select="@HPIDate"/>&#160;
                    </td>
                        <xsl:for-each select="HPI">
                            <xsl:variable name="ItemRecordId"  select="RecordId"></xsl:variable>
                            
                            <td  class="endDate" onmouseover="this.className='endDate chronListHilighted';" onmouseout="this.className='endDate'"  onclick="LoadComponentByTable('{Table}','{RecordId}')"><xsl:choose><xsl:when test="(EndDate != '')">-&#160;<xsl:value-of select="EndDate" /></xsl:when></xsl:choose>&#160;</td>
                            <td onmouseover="this.className='chronListHilighted';" onmouseout="this.className=''" onclick="LoadComponentByTable('{Table}','{RecordId}')"><xsl:value-of select="Item" />&#160;&#160;
                        </td>
                            <xsl:if test="(Table = 'Procedures')">
                                <xsl:for-each select="$EFormTOP//Pathology[@RecordId=$ItemRecordId]">
                                    <td>
                                        <xsl:value-of select="PathHistology" />&#160;&#160;<xsl:value-of select="PathHistology2" />&#160;&#160;
                                    </td>
                                    <xsl:for-each select="ProstatectomyPath">
                                        <xsl:if test="((PathGG1 != '') or (PathGG2 != ''))">
                                            <td>
                                                <xsl:value-of select="PathGG1" />+<xsl:value-of select="PathGG2" />=<xsl:value-of select="PathGGS" />&#160;&#160;
                                            </td>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:if>

                        </xsl:for-each>
                    </tr>

                </xsl:otherwise>
              </xsl:choose>

                                </table>
                            </td>
                        </tr>
          </xsl:for-each>
                                    <tr>
                                        <td>&#160;</td>
                                    </tr>
            </table>                     
                                
                                
                                
                                
                                
                            </td>
                            <td width="29%" valign="top" class="FormInsideTableLeftCell">
                                <xsl:call-template name="StatusTableGU"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <!--Nomogram Predictions
				<xsl:call-template name="UrologyProstateNomogram"/>-->
            <!--Current treatment: ToDo: Display tretment and date, fix onclick event for last GnRH-->
            <xsl:call-template name="CurrentTreatment"/>
            <!--Interval History & progression criteria-->
            <xsl:call-template name="IntervalHistoryProgressionCriteria"/>

            <!--Comorbidities-->





            <tr>
                <td valign="top" class="FormOuterTableRow" style="height:40px; padding-left: 4px;">

                    <span class="blackBoldText" style="display: block;" title="Click to Add New" onmouseover="this.className='blackBoldText chronListHilighted';" onmouseout="this.className='blackBoldText'" onclick="LoadComponentByTable('Comorbidities','')" >Comorbidities</span>
                    <table cellspacing="4" cellpadding="0">
                    <xsl:value-of select="$ComorbidityGUProstateFURows" disable-output-escaping="yes"/>
                    <xsl:for-each select="Comorbidities">
                        <xsl:choose>
                            <xsl:when test="((ComorbDateText != '') or (Comorbidity != '') )">
                                <tr onmouseover="this.className='chronListHilighted';" onmouseout="this.className=''" onclick="LoadComponentByTable('Comorbidities',{./@RecordId})" >
                                    <td>
                                        <xsl:value-of select="ComorbDateText"  />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Comorbidity"  />
                                    </td>
                                </tr>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
              </td>
          </tr>
        <!--Allergies-->
          <tr>
              <td class="FormOuterTableRow" valign="top" style="height:40px; padding-left: 4px;">
                  <span class="blackBoldText" onmouseover="this.className='blackBoldText chronListHilighted';" onmouseout="this.className='blackBoldText'" onclick="LoadComponentByTable('Allergies','')" >Allergies</span>&#160;&#160;&#160;&#160;
                  <xsl:choose>
                                            <xsl:when test="(NoTable/Allergies_NKA !='')">
                                                <input name="AllergiesNKA" type="checkbox" id="AllergiesNKA" value="yes" checked="checked" />NKA
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <input name="AllergiesNKA" type="checkbox" id="AllergiesNKA" value="yes"/>NKA
                                            </xsl:otherwise>
                                        </xsl:choose>&#160;&#160;&#160;&#160;<br />
                      <xsl:value-of select="$AllergyGUString" disable-output-escaping="yes"/>
                      <xsl:for-each select="Allergies">
                          <xsl:choose>
                              <xsl:when test="((Allergen != '') or (AllergyResponse != ''))">
                                  <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Allergies',{./@RecordId})" >
                                      <xsl:value-of select="Allergen"  /> - <xsl:value-of select="AllergyResponse"  />,
                                  </span>
                              </xsl:when>
                          </xsl:choose>
                      </xsl:for-each>

                  </td>
          </tr>
        
        
        
        <!--Footer will be changed to a template once the Page Numbers are generated automatically-->
        <!--<xsl:call-template name="Footer"/>-->
        <tr class="FormOuterTableRow">
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/>
            <img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">1</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />B/02.070.<span class="blackBoldTextSmall">
              <xsl:value-of select="$DocNumber"/>
            </span>
          </td>
        </tr>
      </table>
    </div>



  <div align="left"  style="page-break-after:always;">

    <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
    <xsl:call-template name="FormBarcode"/>
    <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
      <xsl:value-of select="$PrivacyHeader"/>

      <!--eForm Header: Demographics, Institution Symbol and Form name-->
      <xsl:call-template name="EformHeader"/>
      <!--Date and Physician Header-->
      <xsl:call-template name="EncounterDatePhysician"/>
      <!--Review of Systems: Toxicity Table as Source-->
      <xsl:call-template name="ROS_ToxicityTable"/>
      <!--Nursing Sign-off-->
      <xsl:call-template name="ROS_Signature"/>      
      <tr class="FormOuterTableRow">
        <td height="14" align="center" valign="bottom" class="blackBoldText">
          GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/>
          <img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">2</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />B/02.070.<span class="blackBoldTextSmall">
            <xsl:value-of select="$DocNumber"/>
          </span>
        </td>
      </tr>
    </table>
  </div>

    <div align="left"  style="page-break-after:always;">

      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>
      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <xsl:value-of select="$PrivacyHeader"/>

        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="EformHeader"/>
        <!--Date and Physician Header-->
        <xsl:call-template name="EncounterDatePhysician"/>
        <!--Vital Signs-->

                      <xsl:for-each select="Encounters">
                          <tr >
                              <td class="FormOuterTableRow">
                  <a name="VitalSigns_Anchor"/>
                                  <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
                                      <tr>
                                          <td width="10%" rowspan="2"  class="FormInsideTableRegCell"  valign="top" >
                                              <span class="blackBoldText">Vital Signs</span>
                                          </td>
                                          <td height="15" align="left" valign="top"  class="FormInsideTableRegCell" style="padding-left: 4px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncSystolic', 'VitalSigns')">
                                              BP: <xsl:value-of select="EncSystolic"  /> / <xsl:value-of select="EncDiastolic"  />
                                          </td>
                                          <td height="15" align="left" valign="top" class="FormInsideTableRegCell" style="padding-left: 4px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncPulse', 'VitalSigns')">
                                              Pulse: <xsl:value-of select="EncPulse"  />
                                          </td>
                                          <td height="15" align="left" valign="top" class="FormInsideTableRegCell" style="padding-left: 4px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncTemp', 'VitalSigns')">
                                              Temp: <xsl:value-of select="EncTemp"  />
                                          </td>
                                          <td height="15" align="left" valign="top" class="FormInsideTableRegCell" style="padding-left: 4px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncRespiration', 'VitalSigns')">
                                              Resp: <xsl:value-of select="EncRespiration"  />
                                          </td>
                                      </tr>
                                      <tr>
                                          <td height="15" align="left" valign="top" class="FormInsideTableRegCell" style="padding-left: 4px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncKPS', 'VitalSigns')">
                                              KPS: <xsl:value-of select="EncKPS"  />
                                          </td>
                                          <td height="15" align="left" valign="top" class="FormInsideTableRegCell" style="padding-left: 4px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncHeight', 'VitalSigns')">
                                              Height: <xsl:value-of select="EncHeight"  />
                                          </td>
                                          <td height="15" align="left" valign="top" class="FormInsideTableRegCell" style="padding-left: 4px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncWeight', 'VitalSigns')">
                                              Weight: <xsl:value-of select="EncWeight"  />
                                          </td>
                                          <td height="15" align="left" valign="top" class="FormInsideTableRegCell" style="padding-left: 4px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncBSA', 'VitalSigns')">
                                              BSA: <xsl:value-of select="EncBSA"  />
                                          </td>
                                      </tr>
                                  </table>
                              </td>
                          </tr>
                      </xsl:for-each>
        <!--Physical Exam-->
          <tr>
              <td  class="FormOuterTableRow" valign="middle" onclick="LoadComponentByTable('EncExams','')"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" style="cursor: pointer;">
                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />
                      <span class="blackBoldText">Exam</span>&#160;&#160;&#160;<span class="smallGrayText">
                      <xsl:for-each select="NoTable">
                          <xsl:choose>
                            <xsl:when test="Exam_Clinician_PA != ''"><img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" /></xsl:when>
                            <xsl:otherwise><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" /></xsl:otherwise>
                          </xsl:choose>PA&#160;&#160;&#160;
                          <xsl:choose>
                              <xsl:when test="Exam_Clinician_NP != ''">
                                  <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                              </xsl:when>
                              <xsl:otherwise>
                                  <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                              </xsl:otherwise>
                          </xsl:choose>NP&#160;&#160;&#160;
                          <xsl:choose>
                            <xsl:when test="Exam_Clinician_Fellow != ''"><img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" /></xsl:when>
                            <xsl:otherwise><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" /></xsl:otherwise>
                          </xsl:choose>Fellow&#160;&#160;&#160;
                          <xsl:choose>
                              <xsl:when test="Exam_Clinician_Attending != ''">
                                  <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                              </xsl:when>
                              <xsl:otherwise>
                                  <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                              </xsl:otherwise>
                          </xsl:choose>Attending Confirmed
                      </xsl:for-each></span>

                      <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                          <tr >
                              <td class="FormInsideTableTopCell" align="center">
                                  <strong>System</strong>
                              </td>
                              <td class="FormInsideTableTopCell" align="center">
                                  <strong>Normal Findings</strong>
                              </td>
                              <td class="FormInsideTableTopCell" align="center">
                                  <strong>Abn</strong>
                              </td>
                              <td class="FormInsideTableTopCell" align="center">
                                  <strong>
                                      Not<br/>Done
                                  </strong>
                              </td>
                              <td class="FormInsideTableTopCell" align="center">
                                  <strong>Comments</strong>
                              </td>
                          </tr>
                          <tr >
                              <td class="FormInsideTableRegCell" align="left" valign="top">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />Gen/MS&#160;
                              </td>
                              <td class="FormInsideTableRegCell" align="left">
                                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td valign="middle">
                                          <xsl:for-each select="Encounters/EncExams[position()=1]">
                                              <xsl:choose>
                                                <xsl:when test="ExamResult = 'Normal'"><img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" /></xsl:when>
                                                <xsl:otherwise><img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" /></xsl:otherwise>
                                              </xsl:choose>
                                          </xsl:for-each>WD WN
                                          </td>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=2]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>NAD
                                          </td>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=3]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>A&amp;O
                                          </td>
                                      </tr>
                                  </table>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                                  <xsl:choose>
                                                      <xsl:when test="(EncExams[position()=1]/ExamResult = 'Abnormal') or (EncExams[position()=2]/ExamResult = 'Abnormal') or (EncExams[position()=3]/ExamResult = 'Abnormal')">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=1]/ExamResult = 'Not Done') and (EncExams[position()=2]/ExamResult = 'Not Done') and (EncExams[position()=3]/ExamResult = 'Not Done')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" rowspan="8" style="border-bottom: none; vertical-align: top; padding: 3px;">
                              
                                  
                                  <xsl:for-each select="Encounters/EncExams">
                                      <xsl:choose>
                                        <xsl:when test="ExamNotes != ''">
                                            <xsl:value-of select="ExamNotes"  />
                                            <br/>
                                        </xsl:when>
                                        </xsl:choose>
                                  </xsl:for-each>
                              
                              </td>
                          </tr>
                          <tr >
                              <td class="FormInsideTableRegCell" align="left" valign="top">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />Eyes&#160;
                              </td>
                              <td class="FormInsideTableRegCell" align="left">
                                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=4]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Scleral Icterus
                                          </td>
                                          <td>&#160;</td>
                                      </tr>
                                  </table>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters/EncExams[position()=4]">
                                      <xsl:choose>
                                          <xsl:when test="ExamResult = 'Abnormal'">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters/EncExams[position()=4]">
                                      <xsl:choose>
                                          <xsl:when test="ExamResult = 'Not Done'">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                          </tr>
                          <tr >
                              <td class="FormInsideTableRegCell" align="left" valign="top">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />ENT&#160;
                              </td>
                              <td class="FormInsideTableRegCell" align="left">
                                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=5]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Mucositis
                                          </td>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=6]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Thrush
                                          </td>
                                      </tr>
                                      <tr>
                                      <td valign="middle" colspan="2">
                                          <xsl:for-each select="Encounters/EncExams[position()=7]">
                                              <xsl:choose>
                                                  <xsl:when test="ExamResult = 'Normal'">
                                                      <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                      <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:otherwise>
                                              </xsl:choose>
                                          </xsl:for-each>Mucous Membranes Moist
                                      </td>
                                      </tr>
                                  </table>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=5]/ExamResult = 'Abnormal') or (EncExams[position()=6]/ExamResult = 'Abnormal') or (EncExams[position()=7]/ExamResult = 'Abnormal')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=5]/ExamResult = 'Not Done') and (EncExams[position()=6]/ExamResult = 'Not Done') and (EncExams[position()=7]/ExamResult = 'Not Done')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                          </tr>
                          <tr >
                              <td class="FormInsideTableRegCell" align="left" valign="top">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />Nodes
                              </td>
                              <td  class="FormInsideTableRegCell" align="left">
                                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=8]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Cervical
                                          </td>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=9]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Axillary
                                          </td>
                                      </tr><tr>
                                      <td valign="middle" colspan="2">
                                          <xsl:for-each select="Encounters/EncExams[position()=10]">
                                              <xsl:choose>
                                                  <xsl:when test="ExamResult = 'Normal'">
                                                      <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                      <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:otherwise>
                                              </xsl:choose>
                                          </xsl:for-each>No Supraclavicular
                                      </td>
</tr>
                                  </table>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=8]/ExamResult = 'Abnormal') or (EncExams[position()=9]/ExamResult = 'Abnormal') or (EncExams[position()=10]/ExamResult = 'Abnormal')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=8]/ExamResult = 'Not Done') and (EncExams[position()=9]/ExamResult = 'Not Done') and (EncExams[position()=10]/ExamResult = 'Not Done')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                          </tr>
                          <tr >
                              <td class="FormInsideTableRegCell" align="left" valign="top">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />Resp.&#160;
                              </td>
                              <td  class="FormInsideTableRegCell" align="left">
                                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td valign="middle" colspan="2">
                                          <xsl:for-each select="Encounters/EncExams[position()=11]">
                                              <xsl:choose>
                                                  <xsl:when test="ExamResult = 'Normal'">
                                                      <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                      <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:otherwise>
                                              </xsl:choose>
                                          </xsl:for-each>Clear to Percussion&amp; Ausculation
                                          </td>
                                      </tr>
                                  </table>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters/EncExams[position()=11]">
                                      <xsl:choose>
                                          <xsl:when test="ExamResult = 'Abnormal'">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                          <xsl:for-each select="Encounters/EncExams[position()=11]">
                                              <xsl:choose>
                                                  <xsl:when test="ExamResult = 'Not Done'">
                                                      <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                      <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:otherwise>
                                              </xsl:choose>
                                          </xsl:for-each>
                              </td>
                          </tr>
                          <tr >
                              <td class="FormInsideTableRegCell" align="left" valign="top">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />C/V&#160;
                              </td>
                              <td  class="FormInsideTableRegCell" align="left">
                                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=13]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Murmurs
                                          </td>
                                          <td valign="middle">
                                          <xsl:for-each select="Encounters/EncExams[position()=14]">
                                              <xsl:choose>
                                                  <xsl:when test="ExamResult = 'Normal'">
                                                      <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                      <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:otherwise>
                                              </xsl:choose>
                                          </xsl:for-each>Regular Rate &amp; Rhythm
                                          </td>
                                      </tr>
                                      <tr>					</tr>
                                  </table>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=13]/ExamResult = 'Abnormal') or (EncExams[position()=14]/ExamResult = 'Abnormal')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=13]/ExamResult = 'Not Done') and (EncExams[position()=14]/ExamResult = 'Not Done')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                          </tr>
                          <tr >
                              <td class="FormInsideTableRegCell" align="left" valign="top">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />Abdomen&#160;
                              </td>
                              <td  class="FormInsideTableRegCell" align="left">
                                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=15]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Hepatosplenomegaly
                                          </td>
                                          <td valign="middle">
                                          <xsl:for-each select="Encounters/EncExams[position()=16]">
                                              <xsl:choose>
                                                  <xsl:when test="ExamResult = 'Normal'">
                                                      <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                      <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:otherwise>
                                              </xsl:choose>
                                          </xsl:for-each>No Ascites
                                          </td>
                                      </tr>
                                      <tr><td valign="middle">
                                          <xsl:for-each select="Encounters/EncExams[position()=17]">
                                              <xsl:choose>
                                                  <xsl:when test="ExamResult = 'Normal'">
                                                      <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                      <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:otherwise>
                                              </xsl:choose>
                                          </xsl:for-each>Soft Non-tender
                                      </td>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=18]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>Normal Bowel Sounds
                                          </td>
</tr>
                                  </table>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=15]/ExamResult = 'Abnormal') or (EncExams[position()=16]/ExamResult = 'Abnormal') or (EncExams[position()=17]/ExamResult = 'Abnormal') or (EncExams[position()=18]/ExamResult = 'Abnormal')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=15]/ExamResult = 'Not Done') and (EncExams[position()=16]/ExamResult = 'Not Done') and (EncExams[position()=17]/ExamResult = 'Not Done') and (EncExams[position()=18]/ExamResult = 'Not Done')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                          </tr>
                          <tr >
                              <td class="FormInsideTableRegCell" align="left" valign="top">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />Back&#160;
                              </td>
                              <td  class="FormInsideTableRegCell" align="left">
                                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td valign="middle" nowrap="">
                                              <xsl:for-each select="Encounters/EncExams[position()=19]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Spinal Tenderness
                                          </td>
                                          <td valign="middle" nowrap="">
                                              <xsl:for-each select="Encounters/EncExams[position()=20]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No CVA Tenderness
                                          </td>
                                      </tr>
                                  </table>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=19]/ExamResult = 'Abnormal') or (EncExams[position()=20]/ExamResult = 'Abnormal')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=19]/ExamResult = 'Not Done') and (EncExams[position()=20]/ExamResult = 'Not Done')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                          </tr>
                          <tr >
                              <td class="FormInsideTableRegCell" align="left" valign="top">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />
                                      GU<br/>
                                      <img src="../../Images/shim.gif" border="0" width="4" height="0" />Male&#160;</td>
                              <td  class="FormInsideTableRegCell" align="left">
                                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td valign="middle" colspan="2">
                                              <xsl:for-each select="Encounters/EncExams[position()=21]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>Testes w/o Tenderness or Masses
                                          </td>
                                      </tr>
                                      <tr>
                                          <td valign="middle" colspan="2">
                                              <xsl:for-each select="Encounters/EncExams[position()=22]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>DRE of Prostate
                                          </td>
                                      </tr>
                                  </table>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=21]/ExamResult = 'Abnormal') or (EncExams[position()=22]/ExamResult = 'Abnormal')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=21]/ExamResult = 'Not Done') and (EncExams[position()=22]/ExamResult = 'Not Done')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" rowspan="5" align="center">
                                  <img src="../../Images/ProstateImageURONVWeb.gif" width="251" height="125" />
                              </td>
                          </tr>
                          <tr >
                              <td class="FormInsideTableRegCell" align="left" valign="top">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />M/S&#160;
                              </td>
                              <td  class="FormInsideTableRegCell" align="left">
                                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=23]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Clubbing or Cyanosis
                                          </td>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=24]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Cord
                                          </td>
                                      </tr>
                                      <tr>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=25]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Calf Tenderness
                                          </td>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=26]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Leg Swelling
                                          </td>
                                      </tr>
                                  </table>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=23]/ExamResult = 'Abnormal') or (EncExams[position()=24]/ExamResult = 'Abnormal') or (EncExams[position()=25]/ExamResult = 'Abnormal') or (EncExams[position()=26]/ExamResult = 'Abnormal')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=23]/ExamResult = 'Not Done') and (EncExams[position()=24]/ExamResult = 'Not Done') and (EncExams[position()=25]/ExamResult = 'Not Done') and (EncExams[position()=26]/ExamResult = 'Not Done')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                          </tr>
                          <tr >
                              <td class="FormInsideTableRegCell" align="left" valign="top">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />Neuro&#160;
                              </td>
                              <td  class="FormInsideTableRegCell" align="left">
                                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=27]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>Motor Function
                                          </td>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=28]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>Sensation
                                          </td>
                                      </tr>
                                      <td valign="middle" colspan="2">
                                          <xsl:for-each select="Encounters/EncExams[position()=29]">
                                              <xsl:choose>
                                                  <xsl:when test="ExamResult = 'Normal'">
                                                      <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                      <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                  </xsl:otherwise>
                                              </xsl:choose>
                                          </xsl:for-each>Cranial Nerves II-XII Intact
                                      </td>
                                      <tr>					</tr>
                                  </table>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=27]/ExamResult = 'Abnormal') or (EncExams[position()=28]/ExamResult = 'Abnormal') or (EncExams[position()=29]/ExamResult = 'Abnormal')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=27]/ExamResult = 'Not Done') and (EncExams[position()=28]/ExamResult = 'Not Done') and (EncExams[position()=29]/ExamResult = 'Not Done')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                          </tr>
                          <tr >
                              <td class="FormInsideTableRegCell" align="left" valign="top">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />Skin&#160;
                              </td>
                              <td  class="FormInsideTableRegCell" align="left">
                                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=30]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Rash or Ulcers
                                          </td>
                                          <td valign="middle">
                                              <xsl:for-each select="Encounters/EncExams[position()=31]">
                                                  <xsl:choose>
                                                      <xsl:when test="ExamResult = 'Normal'">
                                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </xsl:for-each>No Nodules
                                          </td>
                                      </tr>
                                  </table>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=30]/ExamResult = 'Abnormal') or (EncExams[position()=31]/ExamResult = 'Abnormal')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:for-each select="Encounters">
                                      <xsl:choose>
                                          <xsl:when test="(EncExams[position()=30]/ExamResult = 'Not Done') and (EncExams[position()=31]/ExamResult = 'Not Done')">
                                              <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  </xsl:for-each>
                              </td>
                          </tr>
                          <xsl:for-each select="Encounters/EncExams[position()=32]">
                          <tr >
                              <td class="FormInsideTableRegCell" align="left" valign="top">
                                  <img src="../../Images/shim.gif" border="0" width="4" height="0" />
                                 
                                      <xsl:choose>
                                          <xsl:when test="ExamSystem != ''">
                                              <xsl:value-of select="ExamSystem"  />
                                          </xsl:when>
                                          <xsl:otherwise>
                                              Other
                                          </xsl:otherwise>
                                      </xsl:choose>
                                  
                              </td>
                              <td  class="FormInsideTableRegCell" align="left">
                                  <xsl:choose>
                                      <xsl:when test="ExamResult = 'Normal'">
                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                      </xsl:when>
                                      <xsl:otherwise>
                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                      </xsl:otherwise>
                                  </xsl:choose><xsl:value-of select="Exam"  />
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:choose>
                                      <xsl:when test="ExamResult = 'Abnormal'">
                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                      </xsl:when>
                                      <xsl:otherwise>
                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                      </xsl:otherwise>
                                  </xsl:choose>
                              </td>
                              <td class="FormInsideTableRegCell" align="center">
                                  <xsl:choose>
                                      <xsl:when test="ExamResult = 'Not Done'">
                                          <img src="../../Images/icon_checkBoxChecked.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                      </xsl:when>
                                      <xsl:otherwise>
                                          <img src="../../Images/icon_checkBoxBlank.gif" style="width: 18px; height: 14px; border: none;  vertical-align: middle;" />
                                      </xsl:otherwise>
                                  </xsl:choose>
                              </td>
                          </tr>
                          </xsl:for-each>
                      </table>
                  </td>
          </tr>




          <!--Stool Guaiac-->
	<tr>
      <td align="left" valign="top" class="FormOuterTableRow blackBoldText" style="padding: 10px 2px 10px 4px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('StoolGuaiacSent', 'StoolGuaiacSent')">Stool Guaiac Sent:&#160;&#160;&#160;&#160;&#160;
                <xsl:for-each select="NoTable">


          <xsl:choose>
              <xsl:when test="(StoolGuaiacSent = 'Yes')">
                  <input type="radio" name="StoolGuaiacSent" value="Yes" checked="checked"/>Yes
              </xsl:when><xsl:otherwise>
                  <input type="radio" name="StoolGuaiacSent" value="Yes" />Yes
              </xsl:otherwise>
              </xsl:choose>
              &#160;&#160;&#160;&#160;&#160;
              <xsl:choose>
              <xsl:when test="(StoolGuaiacSent = 'No')">
                  <input type="radio" name="StoolGuaiacSent" value="No" checked="checked"/>No
              </xsl:when><xsl:otherwise>
                  <input type="radio" name="StoolGuaiacSent" value="No" />No
              </xsl:otherwise>
          </xsl:choose>
              </xsl:for-each>
    </td>
	  </tr>
	  
         
         
         
         
        
        <!--Lab Tests-->
          <tr>
              <td  class="FormOuterTableRow">
                  <span class="blackBoldText">
                      <img src="../../Images/shim.gif" border="0" width="4" height="0" />Lab Tests
                  </span>
                  <span style="margin-left: 30px;">Date: <xsl:value-of select="$LabTestOnEFormDate_DateText" disable-output-escaping="yes"/></span>
                  <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                      <tr>
                          <td width="50%">
                              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                  <tr>
                                      <td class="FormInsideTableTopCell" align="left" valign="top" width="25%" height="18" style="padding-left: 4px;">
                                          WBC: <xsl:value-of select="$LabTestOnEFormDate_WBC" disable-output-escaping="yes"/>
                                      </td>
                                      <td class="FormInsideTableTopCell" align="left" valign="top" width="25%" style="padding-left: 4px;">
                                          ANC: <xsl:value-of select="$LabTestOnEFormDate_ANEUT" disable-output-escaping="yes"/>
                                      </td>
                                      <td class="FormInsideTableTopCell" align="left" valign="top" width="25%" style="padding-left: 4px;">HGB: <xsl:value-of select="$LabTestOnEFormDate_HGB" disable-output-escaping="yes"/>
                                  </td>
                                      <td class="FormInsideTableTopCell" align="left" valign="top" width="25%" style="padding-left: 4px;">PLT: <xsl:value-of select="$LabTestOnEFormDate_UNVPLT" disable-output-escaping="yes"/>
                                  </td>
                                  </tr>
                              </table>
                          </td>
                          <td width="50%" class="FormInsideTableTopCell" style="padding-left: 4px;">Comments:</td>
                      </tr>
                      <tr>
                          <td class="FormInsideTableRegCell"  valign="top" align="left" height="40" style="padding-left: 4px;">Chemistry:<img src="../../Images/shim.gif" border="0" width="270" height="1" />Creat: <xsl:value-of select="$LabTestOnEFormDate_CREAT" disable-output-escaping="yes"/></td>
                      </tr>
                      <tr>
                          <td class="FormInsideTableRegCell"  valign="top" align="left" height="50" style="padding-left: 4px;"><span>Markers (PSA/ACP/LDH):</span>
                                  <table width="700" cellpadding="0" cellspacing="0" border="0">
                                      <tr>
                                          <td >

                                              <xsl:value-of select="$LabTestGURows" disable-output-escaping="yes"/>
                                              
                                              <xsl:for-each select="LabTests">
                                                  <xsl:choose>
                                                      <xsl:when test="((LabDateText != '') or (LabTest != '') or (LabResult != '') or (LabQuality != ''))">
                                                          <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('LabTests',{./@RecordId})"><xsl:value-of select="LabDateText"/>&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="LabTest" />&#160;&#160;&#160;&#160;<xsl:value-of select="LabResult"  />&#160;&#160;&#160;&#160;<xsl:value-of select="LabQuality"  /></span><br/>
                                                      </xsl:when>
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
        <!--PSA Doubling Time-->
        <xsl:call-template name="PSADoublingTime" />
        <!--Diagnostic Tests-->
        <xsl:call-template name="GUProsFUDiagnosticsTable"/>
        <!--ToDo: Remove Rectal Exam from the eForm Interface-->
        <!--Rectal Exam
				<xsl:call-template name="RectalExamTable"/>-->
        <tr class="FormOuterTableRow">
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/>
            <img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">3</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />B/02.070.<span class="blackBoldTextSmall">
              <xsl:value-of select="$DocNumber"/>
            </span>
          </td>
        </tr>
      </table>
    </div>


    <div align="left"   id="LastPageInForm" runat="server" >
      <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
      <xsl:call-template name="FormBarcode"/>
      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <xsl:value-of select="$PrivacyHeader"/>

        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="EformHeader"/>
        <!--Date and Physician Header-->
        <xsl:call-template name="EncounterDatePhysician"/>
        <!--Problem Plan-->
          <tr>
              <td class="FormOuterTableRow">
                  <a name="PatientProblems_Anchor"/>
                  <table class="EFormTable" cellspacing="0">
                      <tr class="EFormTableRow">
                          <td colspan="2">
                              <img src="../../Images/shim.gif" width="4" height="1" />
                              <span class="blackBoldText">Impression and Plan</span>
                          </td>
                      </tr>
                      <tr class="EFormTableRow">
                          <td width="40%" align="center" valign="middle" class="FormInsideTableTopLeftCell">
                              <strong>Diagnosis / Problem List</strong>
                          </td>
                          <td width="60%" align="center" valign="middle" class="FormInsideTableTopCell">
                              <strong>Plan and Referrals</strong>
                          </td>
                      </tr>
                      <xsl:for-each select="PatientProblems">
                          <xsl:choose>
                              <xsl:when test="(ProblemName != '')">
                                  <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientProblems',{./@RecordId})">
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
                              <!--<xsl:otherwise>
							<tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('PatientProblems','')">	
								<td align="center" valign="middle" class="FormInsideTableLeftCell">&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
							</tr>
						</xsl:otherwise>-->
                          </xsl:choose>
                      </xsl:for-each>
                  </table>
              </td>
          </tr>


        <tr>
          <td align="left" valign="top" class="FormOuterTableRow" style="padding: 2px 2px 2px 2px; font-weight: bold; font-size: 13px;"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('TreatmentRisksDiscussed', 'Disposition_GUFU')">

            <xsl:for-each select="NoTable">
                <xsl:choose>
                  <xsl:when test="(TreatmentRisksDiscussed != '')">
                    <input type="checkbox" name="TreatmentRisksDiscussed" checked="checked" />
                  </xsl:when>
                  <xsl:otherwise>
                    <input type="checkbox" name="TreatmentRisksDiscussed" />
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each> 

            Risks, benefits and rationale of treatment plan discussed in detail. All questions answered.
            
          </td>
        </tr>

          <tr>
              <td align="left" valign="top" class="FormOuterTableRow" style="padding: 2px 2px 2px 2px; font-weight: bold; font-size: 13px;"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolRisksDiscussed', 'Disposition_GUFU')">

                  <xsl:for-each select="NoTable">
                      <xsl:choose>
                          <xsl:when test="(ProtocolRisksDiscussed != '')">
                              <input type="checkbox" name="ProtocolRisksDiscussed" checked="checked" />
                          </xsl:when>
                          <xsl:otherwise>
                              <input type="checkbox" name="ProtocolRisksDiscussed" />
                          </xsl:otherwise>
                      </xsl:choose>
                  </xsl:for-each>

                  The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.

              </td>
          </tr>
        <tr>
          <td align="left" valign="top" class="FormOuterTableRow" height="40" style="padding: 2px 2px 2px 8px;"  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('AdditionalRecordsToRequest', 'AdditionalRecordsFilmsToRequest')">
              <span class="blackBoldText">
                Additional Records/Films to Request:
            </span>
            <br/>

                <xsl:for-each select="NoTable">
                      <span>
                        <xsl:value-of select="AdditionalRecordsToRequest"  />&#160;
                      </span>
                </xsl:for-each>
                
                
              
          </td>
        </tr>
        <!--<tr>
          <td class="FormOuterTableRow">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2" class="FormInsideTableTopLeftCell">
                  <span class="blackBoldText">
                    <img src="../../Images/shim.gif" border="0" width="8" height="8" />Disposition
                  </span>
                </td>
              </tr>
              <tr>
                <td class="FormInsideTableRegCell" width="50%" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('Dictated', 'Disposition_GUFU')">
                  <table align="left" width="100%">
                    <tr>
                      <td style="width: 50%;">Dictation for today's visit?</td>
                      <td>

                        <xsl:for-each select="NoTable">
                          <xsl:choose>
                            <xsl:when test="(Dictated != '')">
                                <xsl:value-of select="Dictated"  />
                            </xsl:when>
                            <xsl:otherwise>
                              Yes<img src="../../Images/shim.gif" border="0" width="22" height="0" />No
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                        
                      </td>
                    </tr>
                  </table>
                </td>
                <td class="FormInsideTableRegCell" width="50%" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('SeeDispoForOrders', 'Disposition_GUFU')" >
                   <table align="left" width="100%">
                    <tr>
                      <td style="width: 50%;">See dispo for orders?</td>
                      <td >

                        <xsl:for-each select="NoTable">
                          <xsl:choose>
                            <xsl:when test="(SeeDispoForOrders != '')">
                              <xsl:value-of select="SeeDispoForOrders"  />
                            </xsl:when>
                            <xsl:otherwise>
                              Yes<img src="../../Images/shim.gif" border="0" width="22" height="0" />No
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
</td>
                    </tr>
                  </table>
                </td>
              </tr>

              <tr>
                <td height="40" colspan="2" valign="top" class="FormInsideTableRegCell">
                  <table align="left" width="100%">
                    <tr>
                      <td colspan="2">
                        Return:<img src="../../Images/shim.gif" border="0" width="16" height="1" />
                        <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ReturnWeeks', 'Disposition_GUFU')">
                          <xsl:for-each select="NoTable">
                            <xsl:choose>
                              <xsl:when test="(ReturnWeeks != '')">
                                <xsl:value-of select="ReturnWeeks"  />
                              </xsl:when>
                              <xsl:otherwise>
                                _____________
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                          Weeks
                        </span> <img src="../../Images/shim.gif" border="0" width="12" height="0" /><span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ReturnMonths', 'Disposition_GUFU')">
                          <xsl:for-each select="NoTable">
                            <xsl:choose>
                              <xsl:when test="(ReturnMonths != '')">
                                <xsl:value-of select="ReturnMonths"  />
                              </xsl:when>
                              <xsl:otherwise>
                                _____________
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                          Months
                        </span>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>

            </table>
          </td>
        </tr>-->
        <tr>
          <td align="left" valign="top" class="FormOuterTableRow" height="30" style="padding: 2px 2px 2px 8px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncNotes', 'Disposition_GUFU')">
              <span class="blackBoldText">Comments / Notes:</span>
            <br/>
            <xsl:value-of select="Encounters/EncNotes"/>
          </td>
        </tr>
        <!--Disposition Protocol-->
      <xsl:if test="(NoTable/ProtocolTemp[position()=1]/ProtocolNumber != '') or (NoTable/ProtocolTemp[position()=2]/ProtocolNumber != '') or (NoTable/ProtocolTemp[position()=3]/ProtocolNumber != '')">  
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
			<xsl:for-each select="NoTable/ProtocolTemp">
					<xsl:choose>
						<xsl:when test="((ProtocolNumber != '') or (ProtocolConsidered != '') or (ProtocolConsentObtained != '') or (ProtocolRegistered != ''))">
							<tr class="EFormTableRow">
								<td align="center" valign="middle" class="FormInsideTableLeftCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolNumber', 'Protocols')"><xsl:value-of select="ProtocolNumber"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolConsidered', 'Protocols')"><xsl:value-of select="ProtocolConsidered"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolConsentObtained', 'Protocols')"><xsl:value-of select="ProtocolConsentObtained"  />&#160;</td>
								<td align="center" valign="middle" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('ProtocolRegistered', 'Protocols')"><xsl:value-of select="ProtocolRegistered"  />&#160;</td>
						</tr>
						</xsl:when>
						<xsl:otherwise>

					</xsl:otherwise>
					</xsl:choose>
			</xsl:for-each>
		</table>
	  </td>
	</tr>
	</xsl:if>
        <!--Disposition Attending Time-->
        <tr>
          <td valign="top" class="FormOuterTableRow">
            <table width="100%" border="0" cellspacing="0" cellpadding="4">

              <tr>
                <td class="FormInnerRowRightBorder">
                  <span onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('GreaterThan50PercentTimeInCounseling', 'Disposition_GUFU')">
                      <xsl:for-each select="NoTable">
                            <xsl:choose>
                              <xsl:when test="(GreaterThan50PercentTimeInCounseling != '')">
                                <input type="checkbox" name="50% of Time22" checked="checked" />
                              </xsl:when>
                              <xsl:otherwise>
                                <input type="checkbox" name="50% of Time22" />
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each> 
                      </span>
                  
                    &gt; 50% of attending time was spent in counseling<img src="../../Images/shim.gif" border="0" width="4" height="1" />
                      <span style="font-size: smaller;">(If so, mark total attending time in minutes)</span>

                      <span style="font-weight: bold;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('TotalAttendingTime', 'Disposition_GUFU')">
                      <xsl:for-each select="NoTable">
                            <xsl:choose>
                              <xsl:when test="(TotalAttendingTime != '')">
                                &#160;&#160;&#160;&#160;<xsl:value-of select="TotalAttendingTime"  />
                              </xsl:when>
                              <xsl:otherwise>
                                <input type="checkbox" name="15-24 (3)22" />
                        15-24 (3)&#160;&#160;<input type="checkbox" name="25-39 (4)22" />
                          25-39 (4)&#160;&#160;<input type="checkbox" name="40+ (5)22" />40+ (5)
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each> 
                      </span>
                        
                        
                      
                </td>
              </tr>
            </table>
          </td>
        </tr>        
        <!--Approval Signature-->
        <tr>
          <td class="FormOuterTableRow">
            <table class="pageWidth98percent" border="0" cellspacing="0" cellpadding="4">
              <tr>
                <td colspan="2">
                  <span class="blackBoldText">Signatures</span>
                </td>
                <td>&#160;</td>
                <td class="blackBoldText">&#160;</td>
              </tr>
              <tr>
                <td>
                  <span class="blackBoldText">
                    <img src="../../Images/shim.gif" border="0" width="6" height="1" />Fellow:
                  </span>
                </td>
                <td align="left">
                  <span class="blackBoldText">_________________________________________</span>
                </td>
                <td>
                  <span class="blackBoldText">Date:____/____/____</span>
                </td>
                <td class="blackBoldText">
                  Time:___:____ <span style="font-size: 9px;">AM / PM </span>
                </td>
              </tr>
              <tr>
                <td>
                  <span class="blackBoldText">
                    <img src="../../Images/shim.gif" border="0" width="6" height="1" />NP/PA:
                  </span>
                </td>
                <td align="left">
                  <span class="blackBoldText">_________________________________________</span>
                </td>
                <td>
                  <span class="blackBoldText">Date:____/____/____</span>
                </td>
                <td class="blackBoldText" style="white-space:nowrap;">
                  Time:___:____ <span style="font-size: 9px;">AM / PM </span>
                </td>
              </tr>
              <tr align="center">
                <td colspan="4">
                  <table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                    <tr>
                      <td>
                        I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I have reviewed this entire document and I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.<br/>
                                          <span id="AttendingSignature_Blank" class="blackBoldText">
                                              <img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: ________________________________________<img src="../../Images/shim.gif" border="0" width="35" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="32" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM </span>
                                          </span>
                                          <span id="AttendingSignature_Signed" class="blackBoldText" style="display: none;">
                                              <img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: <img id="signedForm_signatureImage" style="width: 300px;vertical-align:middle;"  />
                                              <img src="../../Images/shim.gif" border="0" width="35" height="1" />Date: <span id="signedForm_date">____/____/____</span><img src="../../Images/shim.gif" border="0" width="32" height="1" />Time: <span id="signedForm_time">___:____ <span style="font-size: 9px;">AM / PM </span></span>
                                          </span>                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr class="FormOuterTableRow">
          <td height="14" align="center" valign="bottom" class="blackBoldText">
            GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/>
            <img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">4</span> of <span id="TotalPages">4</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />B/02.070.<span class="blackBoldTextSmall">
              <xsl:value-of select="$DocNumber"/>
            </span>
          </td>
        </tr>
      </table>
    </div>
	
	
	
	
</xsl:template>
</xsl:stylesheet> 