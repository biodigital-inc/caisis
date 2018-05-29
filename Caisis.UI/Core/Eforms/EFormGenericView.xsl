<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt">
  <!-- Table For Record -->
  <xsl:template name="printTable">
    <xsl:param name="tableName"></xsl:param>
    <!-- Print Table Label -->
    <xsl:if test="@tableLabel!=''">
      <span class="EFormVerifySectionTitle" style="display: block; margin-top: 25px; font-size: 15px; color: #333333; font-weight: bold;">
        <xsl:value-of select="@tableLabel"/>
      </span>
    </xsl:if>
    <!-- Record Contents -->
    <table style="width: 425px; border: 1px solid #cccccc; margin-bottom: 5px; " cellpadding="4" cellspacing="0">
      <tbody>
        <!-- Print Fields and Values  -->
        <xsl:for-each select="child::*[@fieldLabel]">
          <xsl:variable name="rowClassName">
            <xsl:if test="(position() mod 2 = 0)">
              <xsl:text>eformVerifyTableRow1</xsl:text>
            </xsl:if>
            <xsl:if test="(position() mod 2 = 0)=false">
              <xsl:text>eformVerifyTableRow2</xsl:text>
            </xsl:if>
          </xsl:variable>
          <tr onmouseover="this.className='eformVerifyTableCellHighlight';">
            <xsl:attribute name="class">
              <xsl:value-of select="$rowClassName"/>
            </xsl:attribute>
            <xsl:attribute name="onmouseout">
              this.className='<xsl:value-of select="$rowClassName"/>';
            </xsl:attribute>
            <!-- Field Label -->
            <td style="width: 50%; font-weight: bold; color: #333333;">
              <xsl:value-of select="@fieldLabel"/>
            </td>
            <!-- Field Value -->
            <td style="width: 50%; color: #333333;">
              <xsl:value-of select="current()"/>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
    <!-- Child Tables -->
    <xsl:variable name="childTables" select="*[@tableLabel]"/>
    <xsl:if test="count($childTables)>0">
      <xsl:for-each select="$childTables">
        <xsl:call-template name="printTable">
          <xsl:with-param name="tableLabel" select="@tableLabel"></xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:if>

  </xsl:template>

  <!-- HTML Output-->
  <xsl:template match="/eform">
    <html>
      <head>
        <!--<link type="text/css" rel="stylesheet" href="../StyleSheets/EformStyles.css" />-->
      </head>
      <body style="background-color: #ffffff;">
        <!-- Only Records with a Table Label have data -->
        <xsl:for-each select="/eform/child::*[@tableLabel]">
          <xsl:call-template name="printTable">
            <xsl:with-param name="tableName" select="@tableLabel"></xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
        <div>
          <span class="EFormVerifySectionTitle" style="display: block; margin: 30px auto 10px auto;	font-size: 15px; color: #333333; font-weight: bold;">No data was recorded for the following:</span>
          <table style="width: 425px; border: 1px solid #cccccc; margin-bottom: 5px; " cellpadding="4" cellspacing="0">
            <tbody>
              <xsl:for-each select="/eform/*[@noData]">
                <tr style="background-color: #ffffff; color: #000000;	cursor: pointer;" class="eformVerifyTableRow1" onmouseover="this.style.backgroundColor = ''; this.style.color = ''; this.style.cursor = ''; this.className='eformVerifyTableCellHighlight';" onmouseout="this.className='eformVerifyTableRow1'">
                  <td>
                    <span style="display: block;">
                      <xsl:value-of select="name()"/>
                    </span>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>