<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
    <!-- Parameters are passed in from mailer form -->
    <xsl:param name="senderLastName"></xsl:param>
    <xsl:param name="senderFirstName"></xsl:param>
    <xsl:param name="patientLastName"></xsl:param>
    <xsl:param name="patientFirstName"></xsl:param>
    <xsl:param name="patientMRN"></xsl:param>
    <xsl:param name="patientDOB"></xsl:param>
    <xsl:param name="patientId"></xsl:param>
    <xsl:param name="eformName"></xsl:param>
    <xsl:param name="eformDate"></xsl:param>
    <xsl:param name="eformId"></xsl:param>
    <xsl:param name="recipientLastName"></xsl:param>
    <xsl:param name="recipientFirstName"></xsl:param>
    <xsl:param name="referralMessage"></xsl:param>
    <xsl:param name="limitEMailInfo"></xsl:param>


    <!-- The Path to the Application Root http://webserver/appName -->
  <xsl:param name="urlBase"></xsl:param>
  <!-- Html View -->
  <xsl:template match="/eforms">
    <html>
        <head>
            <style type="text/css">
                .PatientTable
                {
                border: solid 1px #999999;
                border-collapse: collapse;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                margin-top: 20px;
                margin-bottom: 40px;
                }
                .PatientTable td
                {
                color: #111111;
                border-bottom: solid 1px #cccccc;
                border-collapse: collapse;
                padding: 5px;
                }

                .PatientTable td.labelCol
                {
                background-color: #dddddd;
                color: #000000;
                font-weight: normal;
                }

                .PatientTable a
                {
                color: #004256;
                text-decoration: underline;
                cursor: pointer;
                }
                .PatientTable a:hover
                {
                color: #8d2a2c;
                }
            </style>
        </head>
        <body>

            <p>
                <xsl:choose>
                    <xsl:when test="$referralMessage != ''">
                        <xsl:value-of select="$referralMessage"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$senderFirstName"/>&#160;<xsl:value-of select="$senderLastName"/> has referred the following patient EForm to you:
                    </xsl:otherwise>
                </xsl:choose>
            </p>
            <table  class="PatientTable" cellspacing="0">
                <tr>
                    <td class="labelCol" style="font-weight: bold;">Patient Name</td>
                    <td style="font-weight: bold;">
                        <xsl:value-of select="$patientLastName"/>, <xsl:value-of select="$patientFirstName"/>
                    </td>
                </tr>
                <tr>
                    <td class="labelCol">DOB</td>
                    <td>
                        <xsl:value-of select="$patientDOB"/>
                    </td>
                </tr>
                <tr>
                    <td class="labelCol">MRN</td>
                    <td>
                        <xsl:value-of select="$patientMRN"/>
                    </td>
                </tr>

                <xsl:if test="($limitEMailInfo != 'true')">
                    <tr>
                        <td class="labelCol">Approved EForm</td>
                        <td>
                            <a >
                                <!-- These are the query string parameters passed in the URL 
                      $variables are passed in the argument list, and Field Names 
                      are passed in from the record(row)
                    -->
                                <xsl:attribute name="href">
                                    <xsl:value-of select="$urlBase"/>
                                    <xsl:text>Login.aspx?eform=</xsl:text>
                                    <xsl:value-of select="$eformName"/>
                                    <xsl:text>&amp;ptId=</xsl:text>
                                    <xsl:value-of select="$patientId"/>
                                    <xsl:text>&amp;eformId=</xsl:text>
                                    <xsl:value-of select="$eformId"/>
                                    <xsl:text>&amp;apptDate=</xsl:text>
                                    <xsl:value-of select="$eformDate"/>
                                    <xsl:text>&amp;referral=true&amp;surgeon=</xsl:text>
                                </xsl:attribute>


                                <xsl:value-of select="$eformName"/> (click to view)
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelCol">EForm Date</td>
                        <td>
                            <xsl:value-of select="$eformDate"/>
                        </td>
                    </tr>
                </xsl:if>
            </table>



            <p>
                Replies to this message will be sent directly to the sender. 
                <xsl:if test="($limitEMailInfo != 'true')">For issues regarding accessing this EForm in Caisis, contact the system administrator.</xsl:if>
            </p>

        </body>
    </html>
  </xsl:template>
</xsl:stylesheet>