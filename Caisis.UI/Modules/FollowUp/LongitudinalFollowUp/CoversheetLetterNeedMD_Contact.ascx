<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CoversheetLetterNeedMD_Contact.ascx.cs"
    Inherits="CoversheetLetterNeedMD_Contact" %>
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
                                
                                <table height="950">
                                    <tr>
                                        <td valign="top">                                    
                                            <div class="surveyTitle" style="">
                                                <table width="100%" align="center">
                                                    <tr>
                                                        <td style="border-bottom: solid 2px black; ">
                                                            <table width="100%">
                                                                <tr>                                                                
                                                                     <td class="serifFont" align="right" valign="middle" ><img id="logo" runat="server" border="0" width="80"  /></td>
                                                                     <td class="serifFont" style="font-size: 15pt;"  align="left" valign="middle" ><%=  CaisisConfiguration.GetWebConfigValue("institutionName")%></td>
                                                               </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            
                                            <div class="" >
                                                <table border="0" cellspacing="3" width="100%" >
                                                    <tr  >
                                                        <td class="coverLetterTitle" >
                                                            <%= CoversheetTo %>
                                                        </td>
                                                    </tr>
                                            </div>
                                            <br /><br />
                                            <div class="" >
                                                <table border="0" cellspacing="3" width="100%" >
                                                    <tr  >
                                                        <td class="coverLetterTitle" >
                                                            <%= CoversheetToAddress1 %>
                                                        </td>
                                                    </tr>
                                                    <tr  >
                                                        <td class="coverLetterTitle" >
                                                            <%= CoversheetToAddress2 %>
                                                        </td>
                                                    </tr>
                                                    <tr  >
                                                        <td class="coverLetterTitle" >
                                                            <%= CoversheetToCity %>,&nbsp;<%= CoversheetToState %>&nbsp;<%= CoversheetToPostalCode %>
                                                        </td>
                                                    </tr>
                                              </table>
                                            </div>
                                             <br /><br />
                                            <div class="" >
                                                <table border="0" cellspacing="3" width="100%" >
                                                    <tr  >
                                                        <td class="coverLetterTitle" >
                                                            <%= CoversheetDate.ToLongDateString() %>
                                                        </td>
                                                    </tr>
                                              </table>
                                            </div>
                                             <br /><br />
                                            <div class="" >
                                                <table border="0" cellspacing="3" width="100%" >
                                                    <tr  >
                                                        <td class="coverLetterTitle" >
                                                            <%= CoversheetLetterSalutation %>:
                                                        </td>
                                                    </tr>
                                                    <tr  >
                                                        <td class="coverLetterField" height="300px" valign="top" >
                                                            <br />
                                                            <p align="justify">
                                                                <%= CoversheetLetterBody %>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <tr  >
                                                        <td class="coverLetterTitle" style="padding-bottom: 30px;" >
                                                            <%= CoversheetLetterClosure1%>
                                                        </td>
                                                    </tr>                                                    
                                                    <tr  >
                                                        <td class="coverLetterTitle" >
                                                            <%= CoversheetLetterClosure2%>
                                                        </td>
                                                    </tr>
                                                    <tr  >
                                                        <td class="coverLetterTitle" >
                                                            <%= CoversheetLetterClosure3%>
                                                        </td>
                                                    </tr>
                                                    <tr  >
                                                        <td class="coverLetterTitle" >
                                                            <%= CoversheetLetterClosure4%>
                                                        </td>
                                                    </tr>
                                              </table>
                                            </div>
                                            <br /><br /><br />                                        
                                           
                                        </td>
                                    </tr>
                                </table>

                        </div>
                     </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
