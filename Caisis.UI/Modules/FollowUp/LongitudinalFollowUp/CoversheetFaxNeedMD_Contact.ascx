<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CoversheetFaxNeedMD_Contact.ascx.cs"
    Inherits="CoversheetFaxNeedMD_Contact" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Fax Coversheet</title>
    <script type="text/javascript">
        function checkBrowser() {
            this.ver = navigator.appVersion
            this.dom = document.getElementById ? 1 : 0
            this.ie7 = (this.ver.indexOf("MSIE 7") > -1 && this.dom) ? 1 : 0;
            this.ie8 = (this.ver.indexOf("MSIE 8") > -1 && this.dom) ? 1 : 0;
            this.bw = (this.ie7 || this.ie8)
            return this
        }

        bw = new checkBrowser()
        if (bw.ie7 || bw.ie8) {
            document.write('<link href="../follow-up_surveys.css" rel="stylesheet" type="text/css" />')
        }
        else {
            document.write('<link href="../follow-up_surveys_ff.css" rel="stylesheet" type="text/css" />')
        }
    </script>
    <link href="../../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../../StyleSheets/DataAnalysis.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
    .coverLetterTitle
    {
        font-weight: bold;
        text-align: left;
    }
    .coverLetterField 
    {
        text-align: left;
    	
    }
    
    .coverLetterSeperator
    {
    	/*border-bottom: solid 1px black;*/
    	
    }
    </style>
</head>
<body>
    <div style="width:775px; background-color: White; " >
        <!-- Physical page 1 -->

        <div class="GrayContainerBox_TopLeft">
            <div class="GrayContainerBox_TopRight">
                <div class="GrayContainerBox_BottomLeft">
                    <div class="GrayContainerBox_BottomRight">
                        <div class="GrayContainerBox_InnerContainer" >

                            <div >
                                <table height="950">
                                    <tr>
                                        <td valign="top" >
                                                <div class="blockHeaderWhiteBgBigFont" >
                                                    <div class="">
                                                        <div class="surveyTitle" style="">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td class=" serifFont" style="font-size: 11pt; text-align: left;  " ><%=  CaisisConfiguration.GetWebConfigValue("institutionName")%></td>
                                                                    <td class=" serifFont" style="text-align: right;  "><img id="logo" runat="server" border="0" width="80"  /></td>
                                                                </tr>
                                                            </table>
                                                        </div>  
                                                        <br /><br />                                  
                                                        <div class="surveyTitle " style="text-align: left; ">
                                                            <span class="surveyTitleBigger serifFont" style="font-size: 35pt; " >Fax</span>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <div class="surveyTitleShadedBox" >
                                                        <table border="0" cellspacing="3" width="100%" >
                                                            <tr  >
                                                                <td width="10%" class="coverLetterTitle" >
                                                                    Date:
                                                                </td>
                                                                <td width="40%" class="coverLetterField" >
                                                                    <%= CoversheetDate.ToShortDateString() %>&nbsp;
                                                                </td>
                                                                <td width="10%" class="coverLetterTitle" >
                                                                    From:
                                                                </td>
                                                                <td width="40%" class="coverLetterField">
                                                                    <%= CoversheetFrom %>&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr><td colspan="4"  >&nbsp;</td></tr>
                                                            <tr>
                                                                <td width="10%" class="coverLetterTitle" >
                                                                   To:
                                                                </td>
                                                                <td width="40%" class="coverLetterField">
                                                                    <%= CoversheetTo %>&nbsp;
                                                                </td>
                                                                <td width="10%" class="coverLetterTitle" >
                                                                    Phone:
                                                                </td>
                                                                <td width="40%" class="coverLetterField">
                                                                    <%= CoversheetFromPhone %>&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr><td colspan="4"  >&nbsp;</td></tr>
                                                            <tr>
                                                                <td width="10%" class="coverLetterTitle" >
                                                                    Fax:
                                                                </td>
                                                                <td width="40%" class="coverLetterField">
                                                                    <%= CoversheetToFax %>&nbsp;
                                                                </td>
                                                                <td width="10%" class="coverLetterTitle" >
                                                                    Fax:
                                                                </td>
                                                                <td width="40%" class="coverLetterField">
                                                                    <%= CoversheetFromFax %>&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr><td colspan="4"  >&nbsp;</td></tr>
                                                            <tr>
                                                                <td width="10%" class="coverLetterTitle" >
                                                                    Pages:
                                                                </td>
                                                                <td colspan="3" class="coverLetterField">
                                                                    <%= CoversheetFaxPages %>&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr><td colspan="4"  >&nbsp;</td></tr>
                                                           <tr>
                                                                <td width="10%" class="coverLetterTitle" >
                                                                    RE:
                                                                </td>
                                                                <td class="coverLetterField" colspan="3">
                                                                    <%= CoversheetFaxRE%>&nbsp;
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </div>
                                                    <div class="">
                                                        <div class="surveyTitle" style="text-align: left; ">
                                                            <span class="serifFont" style="font-size: 12pt; " ><b>Memo:</b>&nbsp;&nbsp;<%= CoversheetFaxMemo%></span>
                                                        </div>
                                                    </div>                                
                                                    
                                                   
                                        </td>
                                    </tr>
                                    <tr height="25">
                                        <td valign="bottom">
                                            <div class="bottomMedSpacer">
                                                &nbsp;</div>
                                            <table class="footer" >
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td width="600">
                                                        &nbsp;
                                                    </td>
                                                    <td class="pageNumber">
                                                        1
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
        
                        </div>
                     </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
