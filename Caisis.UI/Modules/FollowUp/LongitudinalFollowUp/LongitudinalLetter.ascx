<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LongitudinalLetter.ascx.cs"
    Inherits="Modules_FollowUp_Surveys_LongitudinalLetter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<asp:PlaceHolder runat="server" ID="ExternalContent">
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
    <link href="../../../StyleSheets/EformStyles.css" type="text/css" rel="stylesheet" />
</asp:PlaceHolder>
</head>
<body style="font-size:11pt; " >

<asp:XmlDataSource runat="server" ID="LetterDataSource" ></asp:XmlDataSource>
    <div style="width:775px; background-color: Transparent;">

  <div style="page-break-after: always; vertical-align: top;">
    <table width="100%" border="0" class="surveyLetterStyle" style="font-family:Arial, Verdana; font-size:11pt; text-align:left; margin-top:20px;">
        <tr>
            <td colspan="1" width="50%" align="left" valign="top">
                <asp:Label runat="server" ID="identifier"></asp:Label>
                <br />                
                <asp:Label runat="server" ID="Date"></asp:Label>
                <br />                
                <br />                
            </td>
            <td colspan="1" width="50%" rowspan="2" align="right" valign="top">            
                <img ID="HeaderLogo" runat="server" width="80" border="0" align="right"  />
            </td>
        </tr>        
         <tr>
            <td colspan="1" width="50%" align="left" valign="top"style="text-transform:uppercase; font-size:10pt; text-align:left;">
                <asp:Label runat="server" ID="PatientName" ></asp:Label><br />
                <asp:Label runat="server" ID="PatientAddress" ></asp:Label>
                <br />                
                <br />                
            </td>
            <%--<td colspan="1" width="50%" align="left" >&nbsp;</td>--%>
        </tr>
        <tr>
            <td colspan="2" width="100%" align="left" valign="top">
                <asp:Literal runat="server" ID="greeting"></asp:Literal>&nbsp;<asp:Label runat="server" ID="PatientGreetingName"></asp:Label>,
            </td>
        </tr>
        <tr>
            <td colspan="2" width="100%" align="left" valign="top" class="letterBody" style="padding-right:35px; text-align:justify;">
                <asp:Literal runat="server" ID="body"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td colspan="2" width="100%" align="left" valign="top"class="letterBody" style="padding-right:35px; text-align:justify;">
                <asp:Literal runat="server" ID="complimentaryClose"></asp:Literal>
                <br />
                <br />
                <asp:PlaceHolder ID="SignaturePH" runat="server" Visible="false" >
                    <asp:Image ID="SignatureImage" runat="server" Width="94px" Height="35px" />
                </asp:PlaceHolder>
                <br />
                <asp:Label runat="server" ID="PhysicianName"></asp:Label><br />
                <asp:Label runat="server" ID="PhysicianInfo"></asp:Label>
            </td>
        </tr>
        
    </table>
    </div>
    
   </div>

</body>
</html>
