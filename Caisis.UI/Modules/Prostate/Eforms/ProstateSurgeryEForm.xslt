<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--ToDo: Determine where we can get this information-->
<xsl:param name="InPtAccountNum" />
<xsl:param name="SurgeonID">Need the surgeon ID</xsl:param>

<!--Barcode Variables
<xsl:variable name="DocType">*U06*</xsl:variable>
<xsl:variable name="AcctType">*ACCTOUTPATIENT*</xsl:variable>-->
<xsl:variable name="ReportTitle">Urology Prostatectomy Details</xsl:variable>

<!--It may be useful to put some commonly used sections like the header in a variable for reuse-->
<!--Header Variables-->
<!--ToDo: Use institution Short Name From Web Config-->
<xsl:variable name="InstitutionShortName">MSKCC</xsl:variable>
<!--ToDo: Move to Library once other variables pulled from web config-->
<xsl:variable name="PrivacyHeader">
  <tr>
    <td style="text-align:center;">
      <font size="-1">CONTAINS PROTECTED HEALTH INFORMATION - HANDLE ACCORDING TO <xsl:value-of select="$InstitutionShortName" /> POLICY</font>
    </td>
  </tr>
</xsl:variable>

<xsl:include href="../../../Core/Eforms/EFormTemplateLibrary.xslt" />
<xsl:template match="eform">

	
	<style type="text/css">
	<!-- removes the white background-color from the normal style -->
	.FormInsideTableTopCell_Modified {
		border-top: 1px solid #999999;
		border-right: 1px solid #999999;
		border-bottom: 1px solid #999999;
		border-left: 0px solid #999999;
	}
	
	.Box {
		border-top: 1px solid #999999;
		border-right: 1px solid #999999;
		border-bottom: 1px solid #999999;
		border-left: 1px solid #999999;
		text-align: left;
		padding: 2px;
	}
	</style>



  <div align="left"  id="LastPageInForm" runat="server">

      <table class="masterTable" border="0" cellspacing="0" cellpadding="0">
        <xsl:value-of select="$PrivacyHeader"/>
        <!--eForm Header: Demographics, Institution Symbol and Form name-->
        <xsl:call-template name="EformHeader"/>
        <!--Date and Physician Header-->
        <xsl:call-template name="SurgeryDatePhysician"/>
        <xsl:call-template name="Anesthesia"/>
        <xsl:call-template name="ProceduresList"/>
        <xsl:call-template name="ProstatectomyDetails"/>
        <xsl:call-template name="SurgicalDetailsFluids"/>
        <xsl:call-template name="SurgeryFooter"/>
      </table>
    </div>
</xsl:template>	
		
</xsl:stylesheet>