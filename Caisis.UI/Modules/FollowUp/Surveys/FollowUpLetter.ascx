<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FollowUpLetter.ascx.cs"
    Inherits="Modules_FollowUp_Surveys_FollowUpLetter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Epic</title>
    <link href="follow-up_surveys.css" rel="stylesheet" type="text/css" />
</head>
<body style="font-size:11pt;">
<asp:XmlDataSource runat="server" ID="LetterDataSource" DataFile="~/Modules/FollowUp/letter.xml"></asp:XmlDataSource>
  <div style="page-break-after: always; vertical-align: top;">
    <table width="660" border="0" class="surveyLetterStyle" align="center">
        <tr>
            <td valign="top" style="text-align: left; padding-top: 15px;">
                <div>
                    <asp:Literal runat="server" ID="returnAddress"></asp:Literal>
                </div>
                <p>
                    <asp:Label runat="server" ID="Date"></asp:Label>
                </p>
                <div>
                    <asp:Label runat="server" ID="PatientName" CssClass="returnAddress"></asp:Label>
                    <br />
                    <asp:Label runat="server" ID="PatientAddress" CssClass="returnAddress"></asp:Label>
                </div>
                <br />
                <br />
                Dear <asp:Label runat="server" ID="PatientGreetingName"></asp:Label>,
                <div class="letterBody">
                    <asp:Literal runat="server" ID="body"></asp:Literal>
                    <p>
                        <asp:Literal runat="server" ID="complimentaryClose"></asp:Literal>
                    </p>
                    <br />
                    <br />
                    <br />
                    <asp:Label runat="server" ID="PhysicianName"></asp:Label>
                </div>
            </td>
            <td width="35%" class="sideNames" valign="top">
               <asp:Literal runat="server" ID="rightHandMargin"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: left;">
                <!--   <div style="background-color:#ffc000; height:2px; margin-top:20px;">&nbsp;</div>-->
                <img src="Images/<asp:Literal runat="server" ID="footer"></asp:Literal>" style="margin-top: 20px;" />
            </td>
        </tr>
    </table>
    </div>
</body>
</html>
