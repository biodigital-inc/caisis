<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!--Parameters-->
    <xsl:param name="CombinedDiagnostics_Kidney" />
    <xsl:param name="KidneyHPI" />
    <xsl:param name="CombinedComplications_Kidney" />
    <xsl:param name="CombinedFamilyMembers" />
    <xsl:param name="CombinedSocialHistories" />
    <xsl:param name="DiseaseState_Kidney" />
    <xsl:param name="LabTests_Kidney" />

    


    <!--Variables-->
    <!--Barcode Variables-->
    
    <xsl:variable name="DocType">*U12*</xsl:variable>
    <xsl:variable name="AcctType">*ACCTOUTPATIENT*</xsl:variable>
    <!--Header Variables-->
    <xsl:variable name="ReportTitle">Urology Nephrectomy Follow-Up Patient</xsl:variable>
    <!--Footer Variables-->
    <xsl:variable name="DocNumber">08</xsl:variable>
    <xsl:variable name="DocAssignment">12</xsl:variable>
    <xsl:variable name="ApprovalDate">6/03</xsl:variable>
    <xsl:variable name="RevisedDate">06/21/12</xsl:variable>
    <!--Please Note: The footer cannot be implemented as a template until Jason's new page counting information is added
<xsl:variable name="PageNumber">X of Y</xsl:variable>-->


    <!--Header Variables-->
    <!--ToDo: Use institution Short Name From Web Config-->
    <xsl:variable name="InstitutionShortName">MSKCC</xsl:variable>


    <xsl:include href="../../../Core/Eforms/EFormTemplateLibrary.xslt" />
    <xsl:template match="eform">






        <div align="left"  style="page-break-after:always;">

            <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
            <xsl:call-template name="FormBarcode"/>
            <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="text-align:center;">
                        <font size="-1">
                            CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY
                        </font>
                    </td>
                </tr>
                <!--eForm Header: Demographics, Institution Symbol and Form name-->
                <xsl:call-template name="EformHeader"/>
                <!--Date and Physician Header-->
                <xsl:call-template name="EncounterDatePhysician"/>
                <!--Referring MD Row-->
                <xsl:call-template name="ReferringMD"/>





                <tr>
                    <td height="90" valign="top" class="FormOuterTableRow" style="padding: 4px;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('EncChiefComplaint')">
                        <span class="blackBoldText">Chief Complaint</span>
                        
                        <xsl:choose>
                            <xsl:when test="(NoTable/EncChiefComplaint_PresetOption = 'Active Surveillance')">
                                <input type="checkbox" name="ActiveSurveillance_ChiefComplaint" style="vertical-align: middle; margin-left: 90px;" checked="checked" />
                            </xsl:when>
                            <xsl:otherwise>
                                <input type="checkbox" name="ActiveSurveillance_ChiefComplaint" style="vertical-align: middle; margin-left: 90px;"  />
                            </xsl:otherwise>
                        </xsl:choose>
                        Active Surveillance
                        <br/>
                        <xsl:for-each select="Encounters">
                            <xsl:choose>
                                <xsl:when test="(EncChiefComplaint != 'Active Surveillance')">
                                    <xsl:value-of select="EncChiefComplaint"/><br/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                        

                    </td>
                </tr>
                <tr>
                    <td height="400" valign="top" class="FormOuterTableRow" style="padding: 4px;">
                        <span class="blackBoldText">HPI</span>
                        <br/>
                        <table cellpadding="4" cellspacing="0" border="0">
                            <tr>
                                <td class="HPIText" valign="top" >
                                    &#160;

                                    <xsl:for-each select="$KidneyHPI/hpi">
                                        <!-- <xsl:if test="position() mod 9 = 0"></td><td></xsl:if>-->
                                    <xsl:value-of select="PatientHPI"  />
                                    <br/>
                                    </xsl:for-each>



                                    <!--<asp:Repeater ID="hpi" runat="server" OnItemDataBound="hpiItemDataBound">
                                            <ItemTemplate>
                                                <span
                                                    <%# Eval("patientHPI").ToString().ToUpper().IndexOf("PROTOCOL")>-1 ? "style=\"font-weight: bold;\"" : "" %>  ><%# DataBinder.Eval(Container.DataItem, "patientHPI") %></span>
                                                <br/>
                                                <asp:Literal ID="StartNextHpiColumn" Runat="server" />
                                            </ItemTemplate>
                                        </asp:Repeater>-->
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>



                <tr>
                    <td class="FormOuterTableRow">
                        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="130" colspan="4" valign="top" class="FormInsideTableRegCell" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadComponentByField('IntervalHistory')">
                                    <img src="../../Images/shim.gif" border="0" width="4" height="0"/>
                                        <span class="blackBoldText">Interval History</span>

                                    <xsl:choose>
                                        <xsl:when test="(NoTable/ComplicationsPresent != '')">
                                            <input type="checkbox" name="Complication" id="Complication" style="margin-left: 40px;" checked="checked" />Complication
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <input type="checkbox" name="Complication" id="Complication" style="margin-left: 40px;" />Complication
                                        </xsl:otherwise>
                                    </xsl:choose>
                                        <br/>


                                                <xsl:value-of select="NoTable/IntervalHistory"/>
                                        
                                        
                                        
                                    </td>
                                <td align="left" valign="top" class="FormInnerRowBottomBorder">
                                    <img src="../../Images/shim.gif" border="0" width="4" height="0"/>
                                        <span class="blackBoldText">Other Treatments</span>
                                        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td colspan="1" align="center" class="FormInsideTableTopCell">Start Date</td>
                                                <td colspan="1" align="center" class="FormInsideTableTopCell">
                                                    TX<br/><img src="../../Images/shim.gif" border="0" width="90" height="1"/>
                                                
                                                </td>
                                                <td colspan="1" align="center" class="FormInsideTableTopCell">Notes (Protocol #)</td>
                                                <td colspan="1" align="center" class="FormInsideTableTopCell">Stop Date</td>
                                            </tr>
                                            <xsl:for-each select="MedicalTherapy">
                                                <xsl:choose>
                                                    <xsl:when test="((MedTxDateText != '') or (MedTxType != '') or (MedTxAgent != '') or (MedTxDose != '') or (MedTxNotes != ''))">
                                                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('MedicalTherapy',{./@RecordId})">
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                                <xsl:value-of select="MedTxDateText"  />&#160;
                                                            </td>
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                                <xsl:value-of select="MedTxType"  />&#160;
                                                                <xsl:if test="(MedTxAgent != '') or (MedTxDose != '')">(<xsl:value-of select="MedTxAgent"  />&#160;<xsl:value-of select="MedTxDose" /><xsl:value-of select="MedTxUnits"  />)</xsl:if>
                                                        </td>
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                                <xsl:value-of select="MedTxNotes"  />&#160;
                                                            </td>
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                                <xsl:value-of select="MedTxStopDateText"  />&#160;
                                                            </td>
                                                        </tr>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:for-each>

                                            <xsl:for-each select="RadiationTherapy">
                                                <xsl:choose>
                                                    <xsl:when test="((RadTxDateText != '') or (RadTxType != '') or (RadTxTarget != '') or (RadTxTotalDose != '') or (RadTxNotes != ''))">
                                                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('RadiationTherapy',{./@RecordId})">
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                                <xsl:value-of select="RadTxDateText"  />&#160;
                                                            </td>
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                                <xsl:value-of select="RadTxType"  />&#160;
                                                                <xsl:if test="(RadTxTarget != '') or (RadTxTotalDose != '')">
                                                                    (<xsl:value-of select="RadTxTarget"  />&#160;<xsl:value-of select="RadTxTotalDose" />)
                                                                </xsl:if>
                                                                </td>
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                                <xsl:value-of select="RadTxNotes"  />&#160;
                                                            </td>
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                                <xsl:value-of select="RadTxStopDateText"  />&#160;
                                                            </td>
                                                        </tr>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:for-each>

                                            <xsl:for-each select="Procedures">
                                                <xsl:choose>
                                                    <xsl:when test="(ProcDateText != '') or (ProcName != '') or (ProcSide != '') or (ProcNotes != '')">
                                                        <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures',{./@RecordId})">
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                                <xsl:value-of select="ProcDateText"  />&#160;
                                                            </td>
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                                <xsl:value-of select="ProcName"  />&#160;
                                                                <xsl:if test="(ProcSide != '')">
                                                                    (<xsl:value-of select="ProcSide"  />)
                                                                </xsl:if>
                                                            </td>
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">
                                                                <xsl:value-of select="ProcNotes"  />&#160;
                                                            </td>
                                                            <td align="center" valign="middle" class="FormInsideTableRegCell">&#160;</td>
                                                        </tr>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:for-each>
                                            <tr class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Procedures','')">
                                                <td height="24" class="FormInsideTableRegCell">&#160;</td>
                                                <td height="12" class="FormInsideTableRegCell">&#160;</td>
                                                <td height="12" class="FormInsideTableRegCell">&#160;</td>
                                                <td height="12" class="FormInsideTableRegCell">&#160;</td>
                                            </tr>
                                        </table>
                                    </td>
                            </tr>
                            <tr >
                                <td colspan="8" style="vertical-align: top; padding: 4px 4px 8px 4px;">
                                    Complication Details:

                                    <xsl:for-each select="$CombinedComplications_Kidney/Toxicities">
                                        <xsl:choose>
                                            <xsl:when test="(@IsDB = 'true')">
                                                <xsl:variable name="ToxicityID" select="ToxicityID"/>
                                                <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadDataEntryForm('Toxicities', {./ToxicityId}, 'ToxDateText,ToxDate,ToxName')">
                                                    <xsl:value-of select="ToxDateText"  /> - <xsl:value-of select="ToxName"  />
                                                </span>;&#160;&#160;&#160;
                                            </xsl:when>
                                            <xsl:when test="(@IsDB = 'false') and (ToxName != '')">
                                                <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Toxicities',{./@RecordId})" ><xsl:value-of select="ToxDateText"  /> - <xsl:value-of select="ToxName"  /></span>;&#160;&#160;&#160;
                                                
                                            </xsl:when>
                                            <xsl:otherwise>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>

            </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="FormOuterTableRow">
                        <table  style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td class="FormInnerRowRightBorder" style="width: 50%; vertical-align: top; height: 150px; padding: 2px 2px 20px 4px; " >
                                    <span class="blackBoldText">Allergies</span>&#160;&#160;&#160;&#160;&#160;&#160;&#160;<span>
                                        <xsl:choose>
                                            <xsl:when test="(NoTable/Allergies_NKA !='')">
                                                <input name="AllergiesNKA" type="checkbox" id="AllergiesNKA" value="yes" checked="checked" />NKA
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <input name="AllergiesNKA" type="checkbox" id="AllergiesNKA" value="yes"/>NKA
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        &#160;&#160;
                                        <xsl:choose>
                                            <xsl:when test="(NoTable/Allergies_UnchangedSinceLastVisit !='')">
                                                <input name="AllergiesUnchanged" type="checkbox" id="AllergiesUnchanged" value="yes" checked="checked" />Unchanged Since Last Visit
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <input name="AllergiesUnchanged" type="checkbox" id="AllergiesUnchanged" value="yes"/>Unchanged Since Last Visit
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        </span><br/>

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
                                <td style="padding: 2px 2px 2px 4px; vertical-align: top;">
                                    <span class="blackBoldText">Comorbidities</span>
                                    <br/>

                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        <tr>
                                            <td>
                                                <xsl:value-of select="$ComorbidityGUProstateFURows" disable-output-escaping="yes"/>
                                                <xsl:for-each select="Comorbidities">
                                                    <xsl:choose>
                                                        <xsl:when test="((ComorbDateText != '') or (Comorbidity != '') )">
                                                            <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('Comorbidities',{./@RecordId})" >
                                                                <xsl:value-of select="ComorbDateText"  /> - <xsl:value-of select="Comorbidity"  />,&#160;&#160;
                                                            </span>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </xsl:for-each>
                                                <!--<asp:Repeater ID="comorbidities" runat="server" OnItemDataBound="ComorbiditiesItemDataBound">
                                                    <ItemTemplate>
                                                        <%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %>
                  -
                                                        <strong>
                                                            <%# DataBinder.Eval(Container.DataItem, "Comorbidity") %></strong>
                                                        <br/>
                                                        <asp:Literal ID="StartNextColumn" Runat="server"/>
                                                    </ItemTemplate>
                                                </asp:Repeater>-->
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>




                <tr >
                    <td height="14" align="center" valign="bottom" class="blackBoldText">
                        GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
                            U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
                                CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
                                    rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
                                        Page <span id="PageNumber">1</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS

                    </td>
                </tr>
            </table>
        </div>





        <div  align="left"  style="page-break-after:always;" >

            <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
            <xsl:call-template name="FormBarcode"/>
            <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="text-align:center;">
                        <font size="-1">
                            CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY
                        </font>
                    </td>
                </tr>
                <!--eForm Header: Demographics, Institution Symbol and Form name-->
                <xsl:call-template name="EformHeader"/>
                <!--Date Header-->
                <tr >
                    <td class="FormOuterTableRow" height="10" align="left" valign="bottom" onmouseover="this.className='FormOuterTableRow chronListHilighted'" onmouseout="this.className='FormOuterTableRow'" onclick="LoadComponentByField('EncDate','ChiefComplaint')">
                        <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Date</span>:&#160;<xsl:value-of select="Encounters/EncDate"/>
                    </td>
                </tr>






                <tr>
                    <td valign="top" class="FormOuterTableRow">
                        <table  style="width: 100%;" border="0" cellspacing="0" cellpadding="4">
                            <tr valign="top">
                                <td width="49%" class="FormInnerRowRightBorder" style="height: 450px; vertical-align: top;">
                                    <span class="blackBoldText" style="margin-right: 50px;">
                                        Family
                                        History:
                                    </span>
                                    <xsl:choose>
                                        <xsl:when test="contains(NoTable/FamilyMembers_Notes, 'No known family history of ca')">
                                            <input type="checkbox" name="FamilyMembers_Notes" checked="checked"  />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <input type="checkbox" name="FamilyMembers_Notes" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                        No known family history of ca<br/>

                                    <table cellspacing="0" style="border: solid 1px #333333;">
                                        <xsl:for-each select="$CombinedFamilyMembers/FamilyMembers">
                                            <xsl:choose>
                                                <xsl:when test="(@IsDB = 'true')">
                                                    <tr  class="EFormTableRow"  onmouseover="this.className='chronListHilighted EFormTableRow';" onmouseout="this.className='EFormTableRow'" onclick="LoadDataEntryForm('FamilyMembers', {./FamilyMemberId}, 'FamMemSide,FamMemRelation,FamMemDeathAge')" >
                                                        <td  height="34" class="FormInsideTableRegCell" align="center">
                                                            <xsl:value-of select="FamMemRelation"  />&#160;
                                                            <xsl:if test="(FamMemSide != '')">
                                                                (<xsl:value-of select="FamMemSide"  />)
                                                            </xsl:if>
                                                        </td>
                                                        <td  class="FormInsideTableRegCell" style="padding-left: 4px;">
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
                                                        <td  class="FormInsideTableRegCell" style="padding-left: 4px;">
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

                                    <span style="display: block; margin-top: 20px;">
                                        <xsl:choose>
                                            <xsl:when test="contains(NoTable/FamilyMembers_Notes, 'Balkan Heritage')">
                                                <input type="checkbox" name="BalkanHeritage_Notes" checked="checked"  />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <input type="checkbox" name="BalkanHeritage_Notes" />
                                            </xsl:otherwise>
                                        </xsl:choose>Balkan Heritage
                                    </span>
                                    



                                    <!--<table width="98%" border="0" cellspacing="0" cellpadding="0" id="BlankFamilyHistoryTable" runat="server">
                                            <tr>
                                                <td>
                                                    <img src="../../Images/shim.gif" border="0" width="72" height="1"/>
                                                </td>
                                                <td>
                                                    <img src="../../Images/shim.gif" border="0" width="25" height="1"/>
                                                </td>
                                                <td>
                                                    <img src="../../Images/shim.gif" border="0" width="25" height="1"/>
                                                </td>
                                                <td>
                                                    <img src="../../Images/shim.gif" border="0" width="40" height="1"/>
                                                </td>
                                                <td>
                                                    <img src="../../Images/shim.gif" border="0" width="150" height="1"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&#160;</td>
                                                <td align="center">Y</td>
                                                <td align="center">N</td>
                                                <td>&#160;</td>
                                                <td>&#160;</td>
                                            </tr>
                                            <tr>
                                                <td>Kidney Ca</td>
                                                <td align="center">
                                                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"/>
                                                </td>
                                                <td align="center">
                                                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"/>
                                                </td>
                                                <td align="right">If Y:&#160;</td>
                                                <td>Number of 1&#176; relatives:&#160;&#160;_______</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&#160;</td>
                                                <td>&#160;</td>
                                                <td>Number of other relatives:&#160;_______</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&#160; </td>
                                                <td colspan="2">&#160;&#160;&#160;&#160;&#160;Side of Family:</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <img src="../../Images/shim.gif" border="0" width="10" height="30"/>
                                                </td>
                                                <td align="center" valign="bottom">Y</td>
                                                <td align="center" valign="bottom">N</td>
                                                <td>&#160;</td>
                                                <td valign="top">
                                                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"/>
                                                        &#160;&#160;Maternal&#160;&#160;&#160;
                                                        <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"/>&#160;&#160;Paternal</td>
                                            </tr>
                                            <tr valign="top">
                                                <td>Other Ca</td>
                                                <td align="center">
                                                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"/>
                                                </td>
                                                <td align="center">
                                                    <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"/>
                                                </td>
                                                <td align="right">List:&#160;</td>
                                                <td>
                                                    &#160;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"/>
                                                        Breast&#160;&#160;&#160;&#160;&#160;&#160;&#160; <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"/>
                                                            Prostate<br/>
                                                            &#160;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"/>
                                                                Bladder&#160;&#160;&#160;&#160;&#160;&#160;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"/>
                                                                    Testis <br/>
                                                                    &#160;<img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13"/> 
                    Other: ____________
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5">
                                                    <table width="312" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td>
                                                                <img src="../../Images/shim.gif" border="0" width="40" height="8" />
                                                            </td>
                                                            <td>
                                                                <img src="../../Images/shim.gif" border="0" width="50" height="1" />
                                                            </td>
                                                            <td>
                                                                <img src="../../Images/shim.gif" border="0" width="50" height="1" />
                                                            </td>
                                                            <td>
                                                                <img src="../../Images/shim.gif" border="0" width="50" height="1" />
                                                            </td>
                                                            <td>
                                                                <img src="../../Images/shim.gif" border="0" width="122" height="8" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&#160;</td>
                                                            <td align="center">Alive</td>
                                                            <td align="center">Dead</td>
                                                            <td align="center">Age</td>
                                                            <td align="center">Cause of Death</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Mother</td>
                                                            <td align="center">
                                                                <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                            </td>
                                                            <td align="center">
                                                                <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                            </td>
                                                            <td align="center">______</td>
                                                            <td align="center">________________</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Father</td>
                                                            <td align="center">
                                                                <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                            </td>
                                                            <td align="center">
                                                                <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                            </td>
                                                            <td align="center">______</td>
                                                            <td align="center">________________</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Siblings</td>
                                                            <td align="center">
                                                                <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                            </td>
                                                            <td align="center">
                                                                <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                            </td>
                                                            <td align="center">______</td>
                                                            <td align="center">________________</td>
                                                        </tr>
                                                        <tr>
                                                            <td>&#160;</td>
                                                            <td align="center">
                                                                <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                            </td>
                                                            <td align="center">
                                                                <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                            </td>
                                                            <td align="center">______</td>
                                                            <td align="center">________________</td>
                                                        </tr>
                                                        <tr>
                                                            <td>&#160;</td>
                                                            <td align="center">
                                                                <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                            </td>
                                                            <td align="center">
                                                                <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                            </td>
                                                            <td align="center">______</td>
                                                            <td align="center">________________</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Other</td>
                                                            <td align="center">
                                                                <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                            </td>
                                                            <td align="center">
                                                                <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                            </td>
                                                            <td align="center">______</td>
                                                            <td align="center">________________</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>

                                        <br/> <input type="checkbox" name="Digitized232"/>
                                            Balkan Heritage<br/>
                                            <br />Other Significant Family Hx:<br />
                                            <table  class="FamilyHistoryNonCancerDiseases" width="98%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td style="width: 5%;">&#160;</td>
                                                    <td style="width: 45%; font-weight: bold; padding-left: 10px;">Disease</td>
                                                    <td style="width: 2%;">&#160;</td>
                                                    <td style="width: 48%; font-weight: bold; padding-left: 70px;">Relation(s)</td>
                                                </tr>
                                                <tr>
                                                    <td height="24">
                                                        <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                    </td>
                                                    <td>
                                                        Von Hippel-Lindau (VHL)<br />
                                                    </td>
                                                    <td>&#160;</td>
                                                    <td style="border-bottom: solid 1px #111111;">&#160;</td>
                                                </tr>
                                                <tr>
                                                    <td height="24">
                                                        <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                    </td>
                                                    <td>Birt-Hogg-Dub&#233; (BHD)</td>
                                                    <td>&#160;</td>
                                                    <td style="border-bottom: solid 1px #111111;">&#160;</td>
                                                </tr>
                                                <tr>
                                                    <td height="24">
                                                        <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                    </td>
                                                    <td>Hereditary Papillary</td>
                                                    <td>&#160;</td>
                                                    <td style="border-bottom: solid 1px #111111;">&#160;</td>
                                                </tr>
                                                <tr>
                                                    <td height="24">
                                                        <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                    </td>
                                                    <td>Tubulosclerosis</td>
                                                    <td>&#160;</td>
                                                    <td style="border-bottom: solid 1px #111111;">&#160;</td>
                                                </tr>
                                                <tr>
                                                    <td height="24">
                                                        <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                    </td>
                                                    <td style="border-bottom: solid 1px #111111;">&#160;</td>
                                                    <td>&#160;</td>
                                                    <td style="border-bottom: solid 1px #111111;">&#160;</td>
                                                </tr>
                                                <tr>
                                                    <td height="24">
                                                        <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                    </td>
                                                    <td style="border-bottom: solid 1px #111111;">&#160;</td>
                                                    <td>&#160;</td>
                                                    <td style="border-bottom: solid 1px #111111;">&#160;</td>
                                                </tr>
                                                <tr>
                                                    <td height="24">
                                                        <img src="../../Images/FormImages/WinCheckbox.gif" width="13" height="13" />
                                                    </td>
                                                    <td style="border-bottom: solid 1px #111111;">&#160;</td>
                                                    <td>&#160;</td>
                                                    <td style="border-bottom: solid 1px #111111;">&#160;</td>
                                                </tr>
                                            </table>-->
                                        </td>
                                <td width="51%">

                                    <a name="PatientsSocialHistories_Anchor"/>


                                    <span class="blackBoldText">Social History:</span>
                                    <br/>
                                    <br/>



                                    <xsl:for-each select="$CombinedSocialHistories/SocialHistories">
                                        <xsl:choose>
                                            <xsl:when test="(@IsDB = 'true')">


                                                <table class="EFormTable" cellspacing="0" style="border: solid 1px #999999; border-collapse: collapse;">
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
                                            <xsl:when test="((SocHxOccupation != '') or (SocHxMaritalStatus != '') or (SocHxChildren != '') or (SocHxTobaccoType != '') or (SocHxTobaccoPacksPerDay != '') or (SocHxTobaccoYears != '') or (SocHxTobaccoQuitYear != '') or (SocHxAlcohol != '') or (SocHxCarcinogen != ''))">


                                                <table class="EFormTable" cellspacing="0" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'" onclick="LoadComponentByTable('SocialHistories',{./@RecordId})">
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
                    <td class="FormOuterTableRow" style="padding: 4px; height: 250px; vertical-align: top;">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;" >
                            <tr>
                                <td style="width: 50%; vertical-align: top;">
                                    <span class="blackBoldText" style="margin-right: 70px;">Disease State</span>



                                    Change:

                                    <xsl:choose>
                                        <xsl:when test="(NoTable/DiseaseState_Change != '')">
                                            <input type="checkbox" name="NP" checked="checked" />
                                            <strong><xsl:value-of select="NoTable/DiseaseState_Change"  /></strong>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <img src="../../Images/shim.gif" border="0" width="12" height="1"/>
                                        Y<img src="../../Images/shim.gif" border="0" width="12" height="1"/>
                                            N
                                        </xsl:otherwise>
                                    </xsl:choose>
                                            <br/>


                                    <xsl:for-each select="$DiseaseState_Kidney/Status">
                                        <xsl:choose>
                                            <xsl:when test="(@IsDB = 'true')">
                                                <span  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"  onclick="LoadDataEntryForm('Status', {./StatusId}, 'StatusDateText,StatusDate,Status')" >
                                                    <xsl:value-of select="StatusDateText"  />&#160;&#160;<xsl:value-of select="Status"  />
                                                    <xsl:if test="(StatusNotes != '')" >
                                                        &#160;(<xsl:value-of select="StatusNotes"  />)
                                                    </xsl:if>
                                                </span>
                                            </xsl:when>
                                            <xsl:when test="((@IsDB = 'false') and ((Status != '') or (StatusDateText != '')))">
                                                <span  onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''"   onclick="LoadComponentByTable('Status',{./@RecordId})" >
                                                    <xsl:value-of select="StatusDateText"  />&#160;&#160;<xsl:value-of select="Status"  />
                                                    <xsl:if test="(StatusNotes != '')" >
                                                        &#160;(<xsl:value-of select="StatusNotes"  />)
                                                    </xsl:if>
                                                </span>
                                            </xsl:when>
                                            <xsl:otherwise>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <br/>
                                    </xsl:for-each>



                                    


                                </td>

                </tr>
            </table>
            </td>
            </tr>



                <tr class="FormOuterTableRow">
                    <td height="14" align="center" valign="bottom" class="blackBoldText">
                        GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/>
                        <img src="../../Images/shim.gif" border="0" width="45" height="8" />rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />Page <span id="PageNumber">2</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />B/02.070.<span class="blackBoldTextSmall">
                            <xsl:value-of select="$DocNumber"/>
                        </span>
                    </td>
                </tr>
            </table>
        </div>





        <div  align="left"  style="page-break-after:always;" >

            <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
            <xsl:call-template name="FormBarcode"/>
            <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="text-align:center;">
                        <font size="-1">
                            CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY
                        </font>
                    </td>
                </tr>
                <!--eForm Header: Demographics, Institution Symbol and Form name-->
                <xsl:call-template name="EformHeader"/>
                <!--Date Header-->
                <tr >
                    <td class="FormOuterTableRow" height="10" align="left" valign="bottom" onmouseover="this.className='FormOuterTableRow chronListHilighted'" onmouseout="this.className='FormOuterTableRow'" onclick="LoadComponentByField('EncDate','ChiefComplaint')">
                        <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Date</span>:&#160;<xsl:value-of select="Encounters/EncDate"/>
                    </td>
                </tr>




                <tr>
                    <td align="center" class="FormOuterTableRow" style="border-bottom: none;">
                        <table  style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td  colspan="3" style="padding: 4px;">
                                    <span class="blackBoldText">Lab Tests</span> 
                                </td>
                            </tr>

                            <tr id="PopulatedLabTestsTableRow" runat="server">
                                <td colspan="3" style="padding-left: 0px; padding-right: 0px;">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed;" >
                                        <thead>
                                            <tr >
                                                <td width="16%" height="20" align="center" valign="middle" class="FormInsideTableTopLeftCell">Date</td>
                                                <td align="center" valign="middle" class="FormInsideTableTopCell">Marker</td>
                                                <td align="center" valign="middle" class="FormInsideTableTopCell">Value</td>
                                                <td align="center" valign="middle" class="FormInsideTableTopCell">GFR</td>
                                                <td align="center" valign="middle" class="FormInsideTableTopCell">Data Source</td>
                                            </tr>
                                        </thead>

                                        <tbody  id="LabTestRows">
                                        <xsl:for-each select="$LabTests_Kidney/LabTests">
                                            <xsl:choose>
                                                <xsl:when test="(LabTest != '')">
                                                    <tr onmouseover="this.className='FormOuterTableRow chronListHilighted'" onmouseout="this.className='FormOuterTableRow'"   onclick="LoadComponentByTable('LabTests','')">
                                                        <td class="FormInsideTableLeftCell" style="font-weight: bold;">&#160;&#160;&#160;&#160;<xsl:value-of select="LabDateText"  /></td>
                                                        <td class="FormInsideTableRegCell" style="font-weight: bold; text-align: center;" ><xsl:value-of select="LabTest"  />&#160;</td>
                                                        <td class="FormInsideTableRegCell" style="font-weight: bold; text-align: center;" ><xsl:value-of select="LabResult"  />&#160;</td>
                                                        <td class="FormInsideTableRegCell" style="font-weight: bold; text-align: center;" ><xsl:value-of select="GFR"  />&#160;<xsl:value-of select="GFRError"  /></td>
                                                        <td class="FormInsideTableRegCell"  style="font-weight: bold; text-align: center;" ><xsl:value-of select="LabQuality"  />&#160;
                                                        </td>
                                                    </tr>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                        </tbody>
                                        
                                        <tbody  id="LabTestBlankRows" runat="server">
                                            <tr>
                                                <td class="FormInsideTableLeftCell">&#160;</td>
                                                <td class="FormInsideTableRegCell" >&#160;</td>
                                                <td class="FormInsideTableRegCell" >&#160;</td>
                                                <td class="FormInsideTableRegCell">&#160;</td>
                                                <td class="FormInsideTableRegCell" >&#160;</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>




                <tr>
                    <td class="FormOuterTableRow" style="border-top: solid 1px #000000;">
                        <span class="blackBoldText">
                            <img src="../../Images/shim.gif" border="0" width="4" height="0" />Imaging
                        </span>

                        <xsl:choose>
                            <xsl:when test="(NoTable/Imaging_Notes != '')">
                                <span style="margin-left: 20px;" onmouseover="this.className='chronListHilighted';" onmouseout="this.className=''" onclick="LoadComponentByField('Imaging_Notes','Imaging_Kidney')"><strong><xsl:value-of select="NoTable/Imaging_Notes"/></strong>
                                <br/></span>
                            </xsl:when>
                            <xsl:otherwise>
                                <span onmouseover="this.className='chronListHilighted';" onmouseout="this.className=''" onclick="LoadComponentByField('Imaging_Notes','Imaging_Kidney')">
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
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        
                        <table align="center" border="0"  style="width: 100%;" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="12%" height="20" align="center" valign="middle" class="FormInsideTableTopCell">Date</td>
                                <td width="24%" align="center" valign="middle" class="FormInsideTableTopCell">Study</td>
                                <td width="12%" align="center" valign="middle" class="FormInsideTableTopCell">Largest Dimension </td>
                                <td width="9%" align="center" valign="middle" class="FormInsideTableTopCell">
                                    Side<br/><span style="font-size: 10px;">(of largest lesion)</span>
                                </td>
                                <td width="10%" align="center" valign="middle" class="FormInsideTableTopCell"># Tumors</td>
                                <td width="13%" align="center" valign="middle" class="FormInsideTableTopCell">Tumor Type</td>
                                <td width="20%" align="center" valign="middle" class="FormInsideTableTopCell">Notes</td>
                            </tr>



                            <xsl:for-each select="$CombinedDiagnostics_Kidney/Diagnostics">
                                <xsl:choose>
                                    <xsl:when test="(@IsDB = 'true')">
                                <tr  class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"  onclick="LoadDataEntryForm('Diagnostics', {./DiagnosticId}, 'DxDateText,DxDate,DxType,DxTarget,DxResult,DxTotalNumTumors,DxNotes')" >
                                <td  height="34" class="FormInsideTableRegCell" style="text-align: center;">
                                    <xsl:value-of select="DxDateText"  />&#160;</td>
                                <td  class="FormInsideTableRegCell"  style="text-align: center;">
                                    <xsl:value-of select="DxType"  />&#160;</td>
                                <td  class="FormInsideTableRegCell" style="text-align: center;"><xsl:value-of select="MaxDim"  />&#160;</td>
                                <td  class="FormInsideTableRegCell" style="white-space: nowrap;text-align: center;"><xsl:value-of select="MaxDimSide"  />&#160;
                                </td>
                                <td  class="FormInsideTableRegCell" style="white-space: nowrap;"><xsl:value-of select="DxTotalNumTumors"  />&#160;</td>
                                <td  class="FormInsideTableRegCell" style="text-align: center;"><xsl:value-of select="TumorType"  />&#160;</td>
                                    <td  class="FormInsideTableRegCell" style="text-align: center;">&#160;</td>
                                </tr>
                                    </xsl:when>
                                    <xsl:when test="(@IsDB = 'false') and (DxType != '')">
                                <tr  class="EFormTableRow" onmouseover="this.className='chronListHilighted';" onmouseout="this.className='EFormTableRow'"   onclick="LoadComponentByTable('Diagnostics',{./@RecordId})" >
                                <td  height="34" class="FormInsideTableRegCell" style="text-align: center;">
                                    <xsl:value-of select="DxDateText"  />&#160;</td>
                                <td  class="FormInsideTableRegCell" style="text-align: center;">
                                    <xsl:value-of select="DxType"  />&#160;</td>
                                <td  class="FormInsideTableRegCell" style="text-align: center;">
                                    <xsl:for-each select="./DxImageFindingsKidney">
                                        <xsl:value-of select="ImgFindLength"  />&#160;
                                    </xsl:for-each>
                                    &#160;</td>
                                <td  class="FormInsideTableRegCell" style="text-align: center;">
                                    <xsl:for-each select="./DxImageFindingsKidney">
                                        <xsl:value-of select="ImgFindSide"  />&#160;
                                    </xsl:for-each>
                                    &#160;</td>
                                <td  class="FormInsideTableRegCell" style="text-align: center;"><xsl:value-of select="DxTotalNumTumors"  />&#160;</td>
                                <td  class="FormInsideTableRegCell" style="text-align: center;">
                                    <xsl:for-each select="./DxImageFindingsKidney">
                                        <xsl:value-of select="ImgFindTumorType"  />&#160;
                                    </xsl:for-each>
                                    &#160;
                                </td>
                                <td  class="FormInsideTableRegCell" style="text-align: center;"><xsl:value-of select="DxNotes"  />&#160;</td>
                            </tr>
                                    </xsl:when>
                                    <xsl:otherwise>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>


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
                                    <strong><xsl:value-of select="$ROS_Clinician"/></strong>
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
                <tr bgcolor="#FFFFFF">
                    <td height="25" class="FormOuterTableRow">
                        &#160;
                        <input name="HistoryROSReview" type="checkbox" id="HistoryROSReview" value="Yes"/>
                        <span class="blackBoldText"> PFSH and ROS performed by: _____________________________________</span>
                    </td>
                </tr>



                <tr >
                    <td height="14" align="center" valign="bottom" class="blackBoldText">
                        GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
                            U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
                                CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
                                    rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
                                        Page <span id="PageNumber">3</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS

                    </td>
                </tr>
            </table>
        </div>





        <div  align="left"  style="page-break-after:always;" >

            <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
            <xsl:call-template name="FormBarcode"/>
            <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="text-align:center;">
                        <font size="-1">
                            CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY
                        </font>
                    </td>
                </tr>
                <!--eForm Header: Demographics, Institution Symbol and Form name-->
                <xsl:call-template name="EformHeader"/>
                <!--Date Header-->
                <tr >
                    <td class="FormOuterTableRow" height="10" align="left" valign="bottom" onmouseover="this.className='FormOuterTableRow chronListHilighted'" onmouseout="this.className='FormOuterTableRow'" onclick="LoadComponentByField('EncDate','ChiefComplaint')">
                        <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Date</span>:&#160;<xsl:value-of select="Encounters/EncDate"/>
                    </td>
                </tr>




                <tr>
                    <td class="FormOuterTableRow">
                        <table align="center" border="0"  style="width: 100%;" cellpadding="4" cellspacing="0">
                            <tr>
                                <td width="10%" rowspan="2" align="left" valign="top" class="FormInnerRowRightBorder">
                                    <span class="blackBoldText">
                                        Vital
                                        Signs
                                    </span>
                                </td>
                                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />BP:&#160;&#160;<strong>
                                        <xsl:value-of select="Encounters/EncSystolic"/>
                                        <xsl:if test="((Encounters/EncSystolic != '') or (Encounters/EncDiastolic != ''))">&#160;/&#160;</xsl:if> 
                                        <xsl:value-of select="Encounters/EncDiastolic"/>
                                    </strong>
                                </td>
                                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />Pulse:&#160;&#160;<strong><xsl:value-of select="Encounters/EncPulse"/></strong>
                                </td>
                                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />Temp:&#160;&#160;<strong><xsl:value-of select="Encounters/EncTemp"/></strong>
                                </td>
                                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />Resp:&#160;&#160;<strong><xsl:value-of select="Encounters/EncRespiration"/></strong>
                                </td>
                            </tr>
                            <tr>
                                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />KPS:&#160;&#160;<strong><xsl:value-of select="Encounters/EncKPS"/></strong>
                                </td>
                                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />Height:&#160;&#160;<strong><xsl:value-of select="Encounters/EncHeight"/></strong>
                                </td>
                                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />Weight:&#160;&#160;<strong><xsl:value-of select="Encounters/EncWeight"/></strong>
                                </td>
                                <td height="22" align="left" valign="top" class="FormInsideTableRegCell">
                                    <img src="../../Images/shim.gif" border="0" width="4" height="0" />BSA:&#160;&#160;<strong><xsl:value-of select="Encounters/EncBSA"/></strong>
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
                            </xsl:choose>Attending</span><br/>
                            <table align="center" border="0" style="width: 100%; border-collapse: collapse;" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td  align="center" class="FormInsideTableTopLeftCell">
                                        <strong>System</strong>
                                    </td>
                                    <td colspan="2" align="center" class="FormInsideTableTopCell">
                                        <strong>
                                            Normal
                                            Findings
                                        </strong>
                                    </td>
                                    <td align="center" class="FormInsideTableTopCell">
                                        <strong>Abnormal</strong>
                                    </td>
                                    <td  align="center" class="FormInsideTableTopCell">
                                        <strong>
                                            Attnd<br/>
                                            Performed
                                        </strong>
                                    </td>
                                    <td width="40%" align="center" class="FormInsideTableTopCell">
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


                <tr >
                    <td height="14" align="center" valign="bottom" class="blackBoldText">
                        GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
                            U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
                                CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
                                    rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
                                        Page <span id="PageNumber">4</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS

                    </td>
                </tr>
            </table>
        </div>




        <div  align="left"  style="page-break-after:always;" >

            <!--eForm Barcode: Barcodes used for scanning document into Medical Records at MSKCC-->
            <xsl:call-template name="FormBarcode"/>
            <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="text-align:center;">
                        <font size="-1">
                            CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY
                        </font>
                    </td>
                </tr>
                <!--eForm Header: Demographics, Institution Symbol and Form name-->
                <xsl:call-template name="EformHeader"/>
                <!--Date Header-->
                <tr >
                    <td class="FormOuterTableRow" height="10" align="left" valign="bottom" onmouseover="this.className='FormOuterTableRow chronListHilighted'" onmouseout="this.className='FormOuterTableRow'" onclick="LoadComponentByField('EncDate','ChiefComplaint')">
                        <img src="../../Images/shim.gif" width="4" height="1" /><span class="blackBoldText">Date</span>:&#160;<xsl:value-of select="Encounters/EncDate"/>
                    </td>
                </tr>



                <tr>
                    <td class="FormOuterTableRow">
                        <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
                            <tr>
                                <td colspan="3" class="blackBoldText">Impression &#38; Plan</td>
                            </tr>
                            <tr>
                                <td width="309" align="center" class="FormInsideTableTopCell">
                                    <strong>Diagnoses / Problem List</strong>
                                </td>
                                <!--<td width="32" align="center" class="FormInsideTableTopCell">
                                    <strong>New</strong>
                                </td>-->
                                <td width="309" align="center" class="FormInsideTableTopCell">
                                    <strong>Plan &#38; Referrals</strong>
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
                                </xsl:choose>
                            </xsl:for-each>
                            <tr>
                                <td height="20" valign="top" class="FormInsideTableRegCell">&#160;</td>
                                <!--<td align="center" valign="middle" class="FormInsideTableRegCell">
                                    <input name="diagnosisNew1" type="checkbox" id="diagnosisNew1"/>
                                </td>-->
                                <td class="FormInnerRowBottomBorder">&#160;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="45" valign="top" class="FormOuterTableRow" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('EncNotes', 'Disposition')">
                        <span class="blackBoldText">
                            <img src="../../Images/shim.gif" border="0" width="4" height="15"/>Comments
                            <br/>
                            <xsl:value-of select="Encounters/EncNotes"/>
                        </span>
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
                <!--<tr>
                    <td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
                        <input type="checkbox" name="TreatmentRisksDiscussed" style="vertical-align: middle;" /> Risks, benefits, and rationale of treatment plan discussed in detail. All questions answered.
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="FormOuterTableRow" style="padding: 4px 2px 4px 2px; font-weight: bold; font-size: 13px;">
                        <input type="checkbox" name="informedConsent" style="vertical-align: middle;" /> The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.
                    </td>
                </tr>-->
                <tr>
                    <td class="FormOuterTableRow">
                        <table align="center" border="0" width="100%" cellpadding="4" cellspacing="0">
                            <tr>
                                <td colspan="2" class="FormInnerRowBottomBorder">
                                    <span class="blackBoldText">Disposition</span>
                                </td>
                            </tr>

                            <!--Disposition Prescrptions-->
                            <xsl:call-template name="DispoPrescriptionsTable"/>
                            <!--Disposition Protocol-->
                            <xsl:call-template name="DispoProtocolTable"/>



                            <!--<tr>
                                <td width="450" align="center" class="FormInnerRowRightBorder">
                                    <table width="440" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="100" height="20">Prescriptions:</td>
                                            <td width="80" align="center">
                                                No<img src="../../Images/shim.gif" border="0" width="22" height="1"/>Yes:</td>
                                            <td>Refill &#160;&#160;or &#160;&#160;New</td>
                                        </tr>
                                        <tr>
                                            <td height="20" colspan="3">Rx: __________________________________________________________</td>
                                        </tr>
                                        <tr>
                                            <td height="20" colspan="3">Rx: __________________________________________________________</td>
                                        </tr>
                                        <tr>
                                            <td height="20">Chemo Orders:</td>
                                            <td align="center">
                                                No<img src="../../Images/shim.gif" border="0" width="22" height="1"/>Yes:</td>
                                            <td>____________________________________</td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="200" align="center">
                                    <span>Protocol &#35;: ________</span>
                                    <br/>
                                    <table align="left" width="100%">
                                        <tr>
                                            <td>Considered:</td>
                                            <td align="center">
                                                Yes<img src="../../Images/shim.gif" border="0" width="22" height="1"/>No</td>
                                        </tr>
                                        <tr>
                                            <td>Consent Obtained:</td>
                                            <td align="center">
                                                Yes<img src="../../Images/shim.gif" border="0" width="22" height="1"/>No</td>
                                        </tr>
                                        <tr>
                                            <td>Registered:</td>
                                            <td align="center">
                                                Yes<img src="../../Images/shim.gif" border="0" width="22" height="1"/>No</td>
                                        </tr>
                                    </table>
                                    <br/>
                                    <br/>
                                </td>
                            </tr>-->
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="FormOuterTableRow">
                        <table  style="width: 100%;" border="0" cellspacing="0" cellpadding="4">
                            <tr>
                                <td width="50%" class="FormInnerRowRightBorder">
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
                                        &#8805; 50% of attending time was spent in counseling <br/> <img src="../../Images/shim.gif" border="0" width="1" height="15"/>
                                            If so, mark total attending time in minutes &#38; describe on right:<br/>
                                            <img src="../../Images/shim.gif" border="0" width="30" height="12"/>


                                    <span style="font-weight: bold;" onmouseover="this.style.backgroundColor='e7d1c8';" onmouseout="this.style.backgroundColor=''" onclick="LoadComponentByField('TotalAttendingTime', 'Disposition_FU')">
                                        <xsl:for-each select="NoTable">
                                            <xsl:choose>
                                                <xsl:when test="(TotalAttendingTime = '3')">
                                                    <input type="checkbox" name="15-24 (3)2" checked="checked" />
                                                    15-24 (3) &#160;&#160;&#160;&#160; <input type="checkbox" name="25-39 (4)2"/>
                                                    25-39 (4) &#160;&#160;&#160;&#160; <input type="checkbox" name="40+ (5)2"/>
                                                    40+ (5)
                                                </xsl:when>
                                                <xsl:when test="(TotalAttendingTime = '4')">
                                                    <input type="checkbox" name="15-24 (3)2"/>
                                                    15-24 (3) &#160;&#160;&#160;&#160; <input type="checkbox" name="25-39 (4)2" checked="checked" />
                                                    25-39 (4) &#160;&#160;&#160;&#160; <input type="checkbox" name="40+ (5)2"/>
                                                    40+ (5)
                                                </xsl:when>
                                                <xsl:when test="(TotalAttendingTime = '5')">
                                                    <input type="checkbox" name="15-24 (3)2"/>
                                                    15-24 (3) &#160;&#160;&#160;&#160; <input type="checkbox" name="25-39 (4)2"/>
                                                    25-39 (4) &#160;&#160;&#160;&#160; <input type="checkbox" name="40+ (5)2" checked="checked" />
                                                    40+ (5)
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <input type="checkbox" name="15-24 (3)2"/>
                                                    15-24 (3) &#160;&#160;&#160;&#160; <input type="checkbox" name="25-39 (4)2"/>
                                                    25-39 (4) &#160;&#160;&#160;&#160; <input type="checkbox" name="40+ (5)2"/>
                                                    40+ (5)
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </span>


                                    </td>
                                <td width="50%" valign="top" class="FormInnerRowRightBorder">
                                    <img src="../../Images/shim.gif" border="0" width="1" height="11"/>Describe
                                    Counseling or Dictate Note:

                                    <xsl:choose>
                                    <xsl:when test="(NoTable/CounselingDescription != '')">
                                        <strong>
                                            <xsl:value-of select="NoTable/CounselingDescription"/>
                                        </strong>
                                    </xsl:when>
                                </xsl:choose>

                                    
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="FormOuterTableRow">
                        <table style="width: 100%;" border="0" cellspacing="0" cellpadding="4">
                            <tr>
                                <td width="50%" height="22" class="FormInnerRowRightBorder">


                                    <xsl:choose>
                                        <xsl:when test="(NoTable/LevelOfService != '')">
                                            Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1"/>
                                            <strong>
                                                <xsl:value-of select="NoTable/LevelOfService"/>
                                            </strong>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            Circle Level of Service:<img src="../../Images/shim.gif" border="0" width="15" height="1"/>
                                            1<img src="../../Images/shim.gif" border="0" width="22" height="1"/>
                                            2<img src="../../Images/shim.gif" border="0" width="22" height="1"/>
                                            3<img src="../../Images/shim.gif" border="0" width="22" height="1"/>
                                            4<img src="../../Images/shim.gif" border="0" width="22" height="1"/>5
                                        </xsl:otherwise>
                                    </xsl:choose>
                                
                                    
                                                    
                                                    
                                                    </td>
                                <td width="50%" rowspan="2">
                                    <span style="width: 60px;">Copy to:</span>
                                    <input name="fellow222" type="checkbox" id="fellow223"/>
                                        referring M.D.: ________________________<br/>
                                        <span style="width: 60px;">&#160;</span><input name="fellow2222" type="checkbox" id="fellow2222"/> other: _______________________________
                                </td>
                            </tr>
                            <tr>
                                <td height="22" class="FormInnerRowRightBorder">

                                    <xsl:choose>
                                        <xsl:when test="(NoTable/Dictated != '')">
                                            Dictated:<img src="../../Images/shim.gif" border="0" width="15" height="1"/>
                                            <strong>
                                                by <xsl:value-of select="NoTable/Dictated"/>
                                            </strong>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            Circle if Dictated:<img src="../../Images/shim.gif" border="0" width="30" height="1"/>
                                            Fellow / Resident<img src="../../Images/shim.gif" border="0" width="30" height="1"/>Attending
                                        </xsl:otherwise>
                                    </xsl:choose>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="FormOuterTableRow">
                        <table style="width: 98%;" border="0" cellspacing="0" cellpadding="4">
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
                            <tr>
                                <td colspan="4">
                                    <span class="blackBoldText">
                                        <img src="../../Images/shim.gif" border="0" width="6" height="1" />Attending
                                        Addendum:&#160;&#160;&#160;____________________________________________________________________<br />
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <span class="blackBoldText">
                                        <img src="../../Images/shim.gif" border="0" width="136" height="1" />____________________________________________________________________
                                    </span>
                                </td>
                            </tr>
                            <tr align="center">
                                <td colspan="4">
                                    <table width="100%" cellpadding="4" cellspacing="0" class="FormInnerTableBlackTopRow">
                                        <tr>
                                            <td>
                                                I personally performed or was physically present during the <strong>key portions</strong> of the visit today.  I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.<br/>
                                                <span class="blackBoldText">
                                                    <img src="../../Images/shim.gif" border="0" width="1" height="20" /> Attending: __________________________________<img src="../../Images/shim.gif" border="0" width="16" height="1" />Date:____/____/____<img src="../../Images/shim.gif" border="0" width="16" height="1" />Time:___:____ <span style="font-size: 9px;">AM / PM</span>
                                                </span>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr >
                    <td height="14" align="center" valign="bottom" class="blackBoldText">GU<xsl:value-of select="$DocNumber"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />U<xsl:value-of select="$DocAssignment"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
CMIC Approval Date: <xsl:value-of select="$ApprovalDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
rev:<xsl:value-of select="$RevisedDate"/><img src="../../Images/shim.gif" border="0" width="45" height="1" />
Page <span id="PageNumber">5</span> of <span id="TotalPages">5</span><img src="../../Images/shim.gif" border="0" width="45" height="1" />ASMNTS
</td>
                </tr>


            </table>
        </div>





    </xsl:template>
</xsl:stylesheet>
