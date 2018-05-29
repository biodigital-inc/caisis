<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <!-- Parameters are passed in from mailer form -->
  <xsl:param name="surgeonName"></xsl:param>
  <xsl:param name="surgeryDate"></xsl:param>
  <xsl:param name="surgeonEmail"></xsl:param>
  <!-- The Path to the Application Root http://webserver/appName -->
  <xsl:param name="urlBase"></xsl:param>
  <!-- Html View -->
  <xsl:template match="/eforms">
    <html>
      <body>
          <xsl:if test="//eform/ApptEform/text()='Colorectal Surgery EForm'">
              <span style="color: red; font-weight: bold; font-style: italics;">DO NOT complete a surgery E-form for the following procedures if you already submitted a Clindoc:</span>
              <div>Right hemicolectomy; Extended right hemicolectomy; Left hemicolectomy; Extended left hemicolectomy; Sigmoid resection; Subtotal colectomy; Total abdominal colectomy; Low Anterior Resection; Abdominal Perineal Resection; Ileostomy Closure.</div>
          </xsl:if>
        <p>
          Here is a list of Surgeries for <xsl:value-of select="$surgeonName"/> on <xsl:value-of select="$surgeryDate"/>
        </p>          
          <table cellpadding="2" style="border: 1px solid #cccccc; border-collapse: collapse; width: 500px; margin: 10px 5px 5px 5px;">
          <thead>
            <tr>
              <td style="background-color: #00668d;color: #ffffff;">
                Patient Name
              </td>
              <td style="background-color: #00668d;color: #ffffff;">
                Patient MRN
              </td>
              <td style="background-color: #00668d;color: #ffffff;">
                Surgery EForm
              </td>
            </tr>
          </thead>
          <tbody>
            <!-- Nodes are named by BizObj name, so Patient's first name is referenced by node "ApptFirstName"-->
            <xsl:for-each select="//eform">
              <!-- Controls the alternating row styles -->
              <xsl:variable name="cellStyle">
                <!-- Row A -->
                <xsl:if test="(position() mod 2 = 0)=false" >
                  <xsl:text>margin: 5px auto 5px auto;background-color: #dfedf9;</xsl:text>
                </xsl:if>
                <!-- Row B -->
                <xsl:if test="position() mod 2 = 0">
                  <xsl:text>background-color: #ffffff;margin: 5px auto 5px auto;</xsl:text>
                </xsl:if>
              </xsl:variable>
              <tr>
                <td>
                  <xsl:attribute name="style">
                    <xsl:value-of select="$cellStyle"></xsl:value-of>
                  </xsl:attribute>
                  <a>
                    <!-- These are the query string parameters passed in the URL 
                      $variables are passed in the argument list, and Field Names 
                      are passed in from the record(row)
                    -->
                    <xsl:attribute name="href">
                      <xsl:value-of select="$urlBase"/>
                      <xsl:text>Login.aspx?eform=</xsl:text>
                      <xsl:value-of select="ApptEform"/>
                      <xsl:text>&amp;ptId=</xsl:text>
                      <xsl:value-of select="PatientId"/>
                      <xsl:text>&amp;userEmail=</xsl:text>
                      <xsl:value-of select="$surgeonEmail"/>
                      <xsl:text>&amp;surgeon=</xsl:text>
                      <xsl:value-of select="ApptCaseSurgeon"/>
                      <xsl:text>&amp;apptDate=</xsl:text>
                      <xsl:value-of select="ApptSurgeryDate"/>
                    </xsl:attribute>
                    <xsl:value-of select="ApptLastName"/>, <xsl:value-of select="ApptFirstName"/>
                  </a>
                </td>
                <td>
                  <xsl:attribute name="style">
                    <xsl:value-of select="$cellStyle"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:value-of select="ApptMRN"/>
                </td>
                <td>
                  <xsl:attribute name="style">
                    <xsl:value-of select="$cellStyle"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:value-of select="ApptEform"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

