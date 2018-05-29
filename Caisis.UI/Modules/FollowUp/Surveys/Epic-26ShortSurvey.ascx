<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Epic-26ShortSurvey.ascx.cs"
    Inherits="Modules_FollowUp_Surveys_EpicSurvey" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Epic</title>
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
            document.write('<link href="follow-up_surveys.css" rel="stylesheet" type="text/css" />')
        }
        else {
            document.write('<link href="follow-up_surveys_ff.css" rel="stylesheet" type="text/css" />')
        }
    </script>
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <div style="width:775px; background-color:none;">
        <!-- Physical page 1 -->
        <div style="page-break-after: always;">
            <table height="900">
                <tr>
                    <td>
                        <div class="topSpacer">
                            &nbsp;</div>
                        <div class="topSpacer">
                            &nbsp;</div>
                        <div class="topSpacer">
                            &nbsp;</div>
                        <div class="topSpacer">
                            &nbsp;</div>
                        <div class="coverPageNoBorder">
                            <div class="blockHeaderWhiteBgBigFont">
                                <div class="surveyTitleShadedBox">
                                    <div class="surveyTitle ">
                                        <br />
                                        <span class="surveyTitleBigger serifFont"><u>EPIC-26</u></span> <span class="serifFont">
                                            <br />
                                            The <u>E</u>xpanded <u>P</u>rostate Cancer <u>I</u>ndex <u>C</u>omposite</span>
                                    </div>
                                    <div class="surveyTitleDesc">
                                        <span class="serifFont">Short Form</span>
                                        <br />
                                        <br />
                                    </div>
                                </div>
                                <br />
                                <br />
                                <div class="surveySummary">
                                    <p align="justify">
                                        This questionnaire is designed to measure Quality of Life issues in patients with
                                        Prostate cancer. To help us get the most accurate measurement, it is important that
                                        you answer all questions honestly and completely.</p>
                                    <p align="justify">
                                        Remember, as with all medical records, information contained within this survey
                                        will remain strictly confidential.</p>
                                </div>
                                <br />
                                <br />
                                <br />
                                <div class="surveyBoxedPatientInfo">
                                    <table border="0" cellspacing="15">
                                        <tr>
                                            <td>
                                                <b>Period:</b>
                                            </td>
                                            <td class="surveyEmptyBox">
                                                <asp:Label runat="server" ID="Period"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;<b>Patient ID:</b>
                                            </td>
                                            <td class="surveyEmptyBox">
                                                <asp:Label runat="server" ID="MRN"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <b>Date Survey Completed:</b> Month _____________ Day _____________ Year _____________
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>Name:</b>
                                            </td>
                                            <td colspan="3" class="underlined leftaligned">
                                                <asp:Label runat="server" ID="Name"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <b>Date of Birth:&nbsp;&nbsp; </b>
                                                        </td>
                                                        <td>
                                                            Month
                                                        </td>
                                                        <td class="surveyEmptyUnderlinedSpace">
                                                            <asp:Label ID="DOBMonth" runat="server" />
                                                        </td>
                                                        <td>
                                                            Day
                                                        </td>
                                                        <td class="surveyEmptyUnderlinedSpace">
                                                            <asp:Label ID="DOBDay" runat="server" />
                                                        </td>
                                                        <td>
                                                            Year
                                                        </td>
                                                        <td class="surveyEmptyUnderlinedSpace">
                                                            <asp:Label ID="DOBYear" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
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
                                    EPIC-SF 6.2002
                                </td>
                                <td width="600">
                                    Copyright 2002. The University of Michigan. All rights reserved.
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
        
        <!-- Start content pages -->
        <div class="surveyForm">
            <!-- Physical page #2 -->
            <div style="page-break-after: always; vertical-align: top;">
                <table height="900">
                    <tr>
                        <td  valign="top">
                  
                            <div class="question noTopMargin">
                                <ol start="1">
                                    <li>Over the <b>past 4 weeks</b>, how often have you leaked urine?</li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR" cellpadding="4">
                                <tr>
                                    <td valign="top">
                                        More than once a day
                                    </td>
                                    <td>
                                        ............................................... 1
                                    </td>
                                    <td class="circleIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        About once a day
                                    </td>
                                    <td>
                                        ............................................... 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        More than once a week
                                    </td>
                                    <td>
                                        ............................................... 3
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        About once a week
                                    </td>
                                    <td>
                                        ............................................... 4
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Rarely or never
                                    </td>
                                    <td>
                                        ............................................... 5
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            
                            <div class="question">
                                <ol start="2">
                                    <li>Which of the following best describes your urinary control <b>during the last 4
                                        weeks?</b></li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR" cellpadding="4">
                                <tr>
                                    <td valign="top">
                                        No urinary control whatsoever
                                    </td>
                                    <td>
                                        ....................................... 1
                                    </td>
                                    <td class="circleIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Frequent dribbling
                                    </td>
                                    <td>
                                        ....................................... 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="264" valign="top">
                                        Occasional dribbling
                                    </td>
                                    <td>
                                        ....................................... 3
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td width="264" valign="top">
                                        Total control
                                    </td>
                                    <td>
                                        ....................................... 4
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            
                            <div class="question">
                                <ol start="3">
                                    <li>How many pads or adult diapers per day did you usually use to control leakage <b>
                                        during the last 4 weeks</b>?</li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR" cellpadding="4">
                                <tr>
                                    <td valign="top">
                                        None
                                    </td>
                                    <td>
                                        ............................................... 0
                                    </td>
                                    <td class="circleIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        1 pad per day
                                    </td>
                                    <td>
                                        ............................................... 1
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        2 pads per day
                                    </td>
                                    <td>
                                        ............................................... 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        3 or more pads per day
                                    </td>
                                    <td>
                                        ............................................... 3
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            
                            <div class="question">
                                <ol start="4">
                                    <li>How big a problem, if any, has each of the following been for you <b>during the
                                        last 4 weeks</b>?</li>
                                </ol>
                            </div>
                            <table border="1" class="questionsGrid">
                                <tr>
                                    <td width="350" class="questionHeader">
                                        (Circle one number on each line.)
                                    </td>
                                    <td valign="top" class="header">
                                        <b>No Problem</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Very Small Problem</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Small Problem</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Moderate Problem</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Big Problem</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        a. Dripping or leaking urine.
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        b. Pain or burning on urination
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        c. Bleeding with urination
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        d. Weak urine stream or incomplete emptying
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        e. Need to urinate frequently during the day
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                            </table>
                            
                            <div class="question">
                                <ol start="5">
                                    <li>Overall, how big a problem has your urinary function been for you <b>during the
                                        last 4 weeks</b>?</li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR" cellpadding="4">
                                <tr>
                                    <td valign="top">
                                        No problem
                                    </td>
                                    <td>
                                        ................................................ 1
                                    </td>
                                    <td class="circleIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Very small problem
                                    </td>
                                    <td>
                                        ................................................ 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Small problem
                                    </td>
                                    <td>
                                        ................................................ 3
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Moderate problem
                                    </td>
                                    <td>
                                        ................................................ 4
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Big problem
                                    </td>
                                    <td>
                                        ................................................ 5
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr height="10" valign="bottom">
                        <td  valign="bottom">
                            <table class="footer">
                                <tr>
                                    <td>
                                        EPIC-SF 6.2002
                                    </td>
                                    <td width="600">
                                        Copyright 2002. The University of Michigan. All rights reserved.
                                    </td>
                                    <td class="pageNumber">
                                        2
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            
            <!-- Physical page #3 -->
            <div style="page-break-after: always; vertical-align: top;">
                <table height="900">
                    <tr>
                        <td valign="top">
                            <div class="topSpacer">
                                &nbsp;</div>
                            <div class="question noTopMargin">
                                <ol start="6">
                                    <li>How big a problem, if any, has each of the following been for you?</li>
                                </ol>
                            </div>
                            <table border="1" class="questionsGrid">
                                <tr>
                                    <td width="350" class="questionHeader">
                                        (Circle one number on each line.)
                                    </td>
                                    <td valign="top" class="header">
                                        <b>No Problem</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Very Small Problem</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Small Problem</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Moderate Problem</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Big Problem</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        a. Urgency to have a bowel movement
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        b. Increased frequency of bowel movements
                                        <td class="questionAnswerOption">
                                            0
                                        </td>
                                        <td class="questionAnswerOption">
                                            1
                                        </td>
                                        <td class="questionAnswerOption">
                                            2
                                        </td>
                                        <td class="questionAnswerOption">
                                            3
                                        </td>
                                        <td class="questionAnswerOption">
                                            4
                                        </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        c. Losing control of your stools
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        d. Bloody stools
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        e. Abdominal/Pelvic/Rectal pain
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                            </table>
                            <div class="bottomSpacer">&nbsp;</div>
    
                            <div class="question">
                                <ol start="7">
                                    <li>Overall, how big a problem have your bowel habits been for you <b>during the last
                                        4 weeks</b>?</li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR" cellpadding="4">
                                <tr>
                                    <td valign="top">
                                        No problem
                                    </td>
                                    <td>
                                        ...................................................... 1
                                    </td>
                                    <td class="circleIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Very small problem
                                    </td>
                                    <td>
                                        ...................................................... 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Small problem
                                    </td>
                                    <td>
                                        ...................................................... 3
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Moderate problem
                                    </td>
                                    <td>
                                        ...................................................... 4
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Big problem
                                    </td>
                                    <td>
                                        ...................................................... 5
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <div class="bottomSpacer">&nbsp;</div>
                            
                            <div class="question">
                                <ol start="8">
                                    <li>How would you rate each of the following <b>during the last 4 weeks</b>?</li>
                                </ol>
                            </div>
                            <table border="1" class="questionsGrid">
                                <tr>
                                    <td width="350" class="questionHeader">
                                        (Circle one number on each line.)
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Very Poor to None</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Poor</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Fair</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Good</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Very Good</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        a. Your ability to have an erection?
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                    <td class="questionAnswerOption">
                                        5
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        b. Your ability to reach orgasm (climax)?
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                    <td class="questionAnswerOption">
                                        5
                                    </td>
                                </tr>
                            </table>
                            <div class="bottomSpacer">&nbsp;</div>
                            
                            <div class="question">
                                <ol start="9">
                                    <li>How would you describe the usual QUALITY of your erections <b>during the last 4
                                        weeks</b>? </li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR">
                                <tr>
                                    <td valign="top">None at all</td>
                                    <td>
                                        ........................ 1
                                    </td>
                                    <td class="circleIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Not firm enough for any sexual activity</td>
                                    <td>
                                        ........................ 2
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td valign="top">Firm enough for any sexual activity</td>
                                    <td>
                                        ........................ 3
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td valign="top">Firm enough for masturbation and foreplay only</td>
                                    <td>
                                        ........................ 4
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <div class="bottomSpacer">&nbsp;</div>
                            
                            <div class="question">
                                <ol start="10">
                                    <li>How would you describe the FREQUENCY of your erections <b>during the last 4 weeks</b>?
                                    </li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR">
                                <tr>
                                    <td valign="top">I NEVER had an erection when I wanted one</td>
                                    <td>
                                        ..... 1</td>
                                    <td class="circleIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">I had an erection LESS THAN HALF the time I wanted one</td>
                                    <td>
                                        ..... 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">I had an erection ABOUT HALF the time I wanted one</td>
                                    <td>
                                        ..... 3
                                    </td>    
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">I had an erection MORE THAN HALF the time I wanted one</td>
                                    <td>
                                        ..... 4
                                    </td>    
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">I had an erection WHENEVER I wanted one</p>
                                    </td>
                                    <td>
                                        ..... 5
                                    </td>    
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr height="35">
                        <td valign="bottom">
                            <table class="footer">
                                <tr>
                                    <td>
                                        EPIC-SF 6.2002
                                    </td>
                                    <td width="600">
                                        Copyright 2002. The University of Michigan. All rights reserved.
                                    </td>
                                    <td class="pageNumber">
                                        3
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            
            <!-- Physical page 4 -->
            <div style="page-break-after: always; vertical-align: top;">
                <table height="900">
                    <tr>
                        <td valign="top">
                            <div class="topSpacer">
                                &nbsp;</div>
                            <div class="question">
                                <ol start="11">
                                    <li>Overall, how would you rate your ability to function sexually <b>during the last
                                        4 weeks</b>?</li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR">
                                <tr>
                                    <td valign="top">Very Poor</td>
                                    <td>
                                        ......................................... 1
                                    </td>
                                    <td class="circleIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Poor
                                    </td>
                                    <td>
                                        ......................................... 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Fair</td>
                                    <td>
                                        ......................................... 3
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Good</td>
                                    <td>
                                        ......................................... 4
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Very Good</td>
                                    <td>
                                        ......................................... 5
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <div class="bottomSpacer">&nbsp;</div>
                            
                            <div class="question">
                                <ol start="12">
                                    <li>Overall, how big a problem has your sexual function or lack of sexual function been
                                        for you <b>during the last 4 weeks</b>?</li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR" cellpadding="4">
                                <tr>
                                    <td valign="top">
                                        No problem
                                    </td>
                                    <td>
                                        ................................................. 1
                                    </td>
                                    <td class="circleIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Very small problem
                                    </td>
                                    <td>
                                        ................................................. 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Small problem
                                    </td>
                                    <td>
                                        ................................................. 3
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Moderate problem
                                    </td>
                                    <td>
                                        ................................................. 4
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Big problem
                                    </td>
                                    <td>
                                        ................................................. 5
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <div class="bottomSpacer">&nbsp;</div>
                            
                            <div class="question">
                                <ol start="13">
                                    <li>How big a problem <b>during the last 4 weeks</b>, if any, has each of the following
                                        been for you? </li>
                                </ol>
                            </div>
                            <table border="1" class="questionsGrid">
                                <tr>
                                    <td width="350" class="questionHeader">
                                        (Circle one number on each line.)
                                    </td>
                                    <td valign="top" class="header">
                                        <b>No Problem</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Very Small Problem</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Small Problem</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Moderate Problem</b>
                                    </td>
                                    <td valign="top" class="header">
                                        <b>Big Problem</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        a. Hot flashes
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        b. Breast tenderness/enlargement
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        c. Feeling depressed
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        d. Lack of energy
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        e. Change in bobdy weight
                                    </td>
                                    <td class="questionAnswerOption">
                                        0
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                    <td class="questionAnswerOption">
                                        3
                                    </td>
                                    <td class="questionAnswerOption">
                                        4
                                    </td>
                                </tr>
                            </table>
                            <div class="bottomMedSpacer">&nbsp;</div>
                            <div class="bottomSpacer">&nbsp;</div>
                            <div class="bottomSpacer">&nbsp;</div>
                            <div class="bottomSpacer">&nbsp;</div>
                            <div class="bottomSpacer">&nbsp;</div>
                            <%--<div class="bottomSpacer">&nbsp;</div>
                            <div class="bottomSpacer">&nbsp;</div>
                            <div class="bottomSpacer">&nbsp;</div>--%>
                            
                            <script type="text/javascript">
                                if ( ! (bw.ie7 || bw.ie8) ) {
                                    document.write('<div class="bottomMedSpacer">&nbsp;</div><div class="bottomMedSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div>')
                                }
                            </script>   
                        </td>
                    </tr>
                    <tr height="35">
                        <td valign="bottom">
                            <table class="footer">
                                <tr>
                                    <td>
                                        EPIC-SF 6.2002
                                    </td>
                                    <td width="600">
                                        Copyright 2002. The University of Michigan. All rights reserved.
                                    </td>
                                    <td class="pageNumber">
                                        4
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            
            <!-- Physical page 5 -->
            <div style="page-break-after: always;">
                <table height="900">
                    <tr>
                        <td>
                            <div class="topSpacer">
                                &nbsp;</div>
                            <div class="blockHeaderBlackBg">
                                FINAL SECTION
                            </div>
                            <div class="blockHeaderWhiteBg">
                                <span class="tmrFont">These last questions are about your household and your general
                                    medical history.
                                    <br />These items are very important for our research. Please answer honestly.
                            </div>
                            <div class="question">
                                <ol start="1">
                                    <li>How do you describe yourself?</li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR">
                                <tr>
                                    <td valign="top">White/Caucasian (not Latino/Hispanic)</td>
                                    <td>
                                        ................................ 1
                                    </td>
                                    <td class="cirIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Black/African-American (not Latino/Hispanic)</td>
                                    <td>
                                        ................................ 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Latino/Hispanic/Mexican-American</td>
                                    <td>
                                        ................................ 3
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Asian/Oriental/Pacific Islander</td>
                                    <td>
                                        ................................ 4
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">American Indian/Native Alaskan</td>
                                    <td>
                                        ................................ 5
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Other: Please specify ______________</td>
                                    <td>
                                        ................................ 6
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <div class="bottomSpacer">&nbsp;</div>
                            
                            <div class="question">
                                <ol start="2">
                                    <li>Which of the following best describes your current relationship?</li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR">
                                <tr>
                                    <td valign="top">Living with spouse or partner</td>
                                    <td>
                                        ...................... 1
                                    </td>
                                    <td class="cirIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">In a significant relationship, but not living together</td>
                                    <td>
                                        ...................... 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Not in a significant relationship</td>
                                    <td>
                                        ...................... 3
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <div class="bottomSpacer">&nbsp;</div>
                            
                            <div class="question">
                                <ol start="3">
                                    <li>What is your current marital status?</li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR">
                                <tr>
                                    <td valign="top">Never married
                                    </td>
                                    <td>
                                        .............................................................................. 1
                                    </td>
                                    <td class="cirIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Married</td>
                                    <td>
                                        .............................................................................. 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Separated</td>
                                    <td>
                                        .............................................................................. 3
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Divorced</td>
                                    <td>
                                        .............................................................................. 4
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Widowed</td>
                                    <td>
                                        .............................................................................. 5
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <div class="bottomSpacer">&nbsp;</div>
                            
                            <div class="question">
                                <ol start="4">
                                    <li>Are you now working at a paying job?</li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR">
                                <tr>
                                    <td valign="top">Yes, full-time</td>
                                    <td>
                                        ............................................................ 1
                                    </td>
                                    <td class="cirIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">Yes, part-time</td>
                                    <td>
                                        ............................................................ 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">No, but looking for a job</td>
                                    <td>
                                        ............................................................ 3
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">No, retired</td>
                                    <td>
                                        ............................................................ 4
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <div class="bottomSpacer">&nbsp;</div>
                            
                            <div class="question">
                                <ol start="5">
                                    <li>Do you currently smoke cigarettes?</li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR">
                                <tr>
                                    <td valign="middle"> No</td>
                                    <td>
                                        ........................................................................................ 1
                                    </td>
                                    <td class="cirIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle">Yes</td>
                                    <td>
                                        ........................................................................................ 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            
                            <div class="bottomSpacer">&nbsp;</div>
                            <div class="bottomSpacer">&nbsp;</div>
                            <div class="bottomSpacer">&nbsp;</div>
                            <div class="bottomSpacer">&nbsp;</div>
                            <div class="bottomSpacer">&nbsp;</div>
                            <%--<div class="bottomSpacer">&nbsp;</div>
                            <div class="bottomSpacer">&nbsp;</div>
                            <div class="bottomSpacer">&nbsp;</div>--%>

                            <script type="text/javascript">
                                if (!(bw.ie7 || bw.ie8)) {
                                    document.write('<div class="bottomMedSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div>')
                                }
                            </script>

                        </td>
                    </tr>
                    <tr height="35">
                        <td valign="bottom">
                            <table class="footer">
                                <tr>
                                    <td>
                                        EPIC-SF 6.2002
                                    </td>
                                    <td width="600">
                                        Copyright 2002. The University of Michigan. All rights reserved.
                                    </td>
                                    <td class="pageNumber">
                                        5
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            
            <!-- Physical page 6 -->
            <div style="page-break-after: always; vertical-align: top;">
                <table height="900">
                    <tr>
                        <td valign="top">
                                            <div class="topSpacer">&nbsp;</div>
                <div class="question">
                    <ol start="6">
                        <li>Have you <b>EVER</b> had any of the following treatments for prostate cancer <b>
                            (Please circle YES or NO for <u>every</u> item and fill in the month/year during
                            which therapy was started)</b></li>
                    </ol>
                </div>
                <div class="bottomSpacer">&nbsp;</div>
                <table border="1" class="questionsGrid">
                    <tr>
                        <td width="444" class="questionHeader">
                            (Circle one number on each line.)
                        </td>
                        <td width="65" valign="middle">
                            <b>No</b>
                        </td>
                        <td width="65" valign="middle">
                            <b>Yes</b>
                        </td>
                        <td valign="middle" class="header">
                            <b>Month & year of surgery:</b>
                        </td>
                    </tr>
                    <tr>
                        <td class="questionOption">
                            a. Radical prostatectomy (surgery to remove the prostate through the abdomen or
                            perineum, or by using a laparoscope)
                        </td>
                        <td class="questionAnswerOption">
                            1
                        </td>
                        <td class="questionAnswerOption">
                            2
                        </td>
                        <td class="questionAnswerOption">
                            ______/_______
                        </td>
                    </tr>
                    <tr>
                        <td class="questionOption">
                            b. External Beam Radiation
                        </td>
                        <td class="questionAnswerOption">
                            1
                        </td>
                        <td class="questionAnswerOption">
                            2
                        </td>
                        <td class="questionAnswerOption">
                            ______/_______
                        </td>
                    </tr>
                    <tr>
                        <td class="questionOption">
                            c. Radioactive Seed implantation (Brachytherapy)
                        </td>
                        <td class="questionAnswerOption">
                            1
                        </td>
                        <td class="questionAnswerOption">
                            2
                        </td>
                        <td class="questionAnswerOption">
                            ______/_______
                        </td>
                    </tr>
                    <tr>
                        <td class="questionOption">
                            d. Expectant management (Watchful Waiting)
                        </td>
                        <td class="questionAnswerOption">
                            1
                        </td>
                        <td class="questionAnswerOption">
                            2
                        </td>
                        <td class="questionAnswerOption">
                            ______/_______
                        </td>
                    </tr>
                    <tr>
                        <td class="questionOption">
                            e. Orchiectomy (surgical removal of the testes)
                        </td>
                        <td class="questionAnswerOption">
                            1
                        </td>
                        <td class="questionAnswerOption">
                            2
                        </td>
                        <td class="questionAnswerOption">
                            ______/_______
                        </td>
                    </tr>
                    <tr>
                        <td class="questionOption">
                            f. Hormone deprivation therapy shots
                        </td>
                        <td class="questionAnswerOption">
                            1
                        </td>
                        <td class="questionAnswerOption">
                            2
                        </td>
                        <td class="questionAnswerOption">
                            ______/_______
                        </td>
                    </tr>
                    <tr>
                        <td class="questionOption">
                            g. Hormone pills (Flutamide, Nilandron, or Casodex)
                        </td>
                        <td class="questionAnswerOption">
                            1
                        </td>
                        <td class="questionAnswerOption">
                            2
                        </td>
                        <td class="questionAnswerOption">
                            ______/_______
                        </td>
                    </tr>
                    <tr>
                        <td class="questionOption">
                            h. Other ____________________________________
                        </td>
                        <td class="questionAnswerOption">
                            1
                        </td>
                        <td class="questionAnswerOption">
                            2
                        </td>
                        <td class="questionAnswerOption">
                            ______/_______
                        </td>
                    </tr>
                </table>

                <div class="bottomSpacer">&nbsp;</div>
                 
                <div class="question">
                    <ol start="7">
                        <li>Which therapy, if any, do you <b>currently</b> use to improve your erections?</li>
                    </ol>
                </div>
                <table border="0" class="smallQuestionsGridR">
                    <tr>
                        <td valign="top">None at all</td>
                        <td>
                            .................................... 0
                        </td>
                        <td class="cirIns">
                            Circle one number.
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">Vacuum erection device (Erect-aid)</td>
                        <td>
                            .................................... 1
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">Penile injection therapy</td>
                        <td>
                            .................................... 2
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">Penile prosthesis</td>
                        <td>
                            .................................... 3
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">Muse (intra-urethral alprostadil)</td>
                        <td>
                            .................................... 4
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">Viagra or Levitra</td>
                        <td>
                            .................................... 5
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">Other _____________________________</td>
                        <td>
                            .................................... 6
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                            <div class="bottomMedSpacer">
                                &nbsp;</div>
                            <div class="bottomSpacer">
                                &nbsp;</div>
                            <div class="bottomSpacer">
                                &nbsp;</div>
                            <div class="bottomSpacer">
                                &nbsp;</div>
                            <div class="bottomSpacer">
                                &nbsp;</div>
                            <div class="bottomSpacer">
                                &nbsp;</div>
                            <div class="bottomSpacer">
                                &nbsp;</div>

                            <script type="text/javascript">
                                if (!(bw.ie7 || bw.ie8)) {
                                    document.write('<div class="bottomMedSpacer">&nbsp;</div><div class="bottomMedSpacer">&nbsp;</div>')
                                }
                            </script>
                        </td>
                    </tr>
                    <tr height="35">
                        <td valign="bottom">
                            <table class="footer">
                                <tr>
                                    <td>
                                        EPIC-SF 6.2002
                                    </td>
                                    <td width="600">
                                        Copyright 2002. The University of Michigan. All rights reserved.
                                    </td>
                                    <td class="pageNumber">
                                        6
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

            </div>
            
            <!-- Physical page 7 -->
            <div style="page-break-after: always; vertical-align: top;">
                <table height="900">
                    <tr>
                        <td>
                            <div class="topSpacer">
                                &nbsp;</div>
                            <div class="question">
                                <ol start="8">
                                    <li>Have you <b>EVER</b> had any of the following medical conditions?</li>
                                </ol>
                            </div>
                                                        <div class="bottomSpacer">
                                &nbsp;</div>
                            <table border="1" class="questionsGrid">
                                <tr>
                                    <td width="434" class="questionHeader">
                                        (Please Circle YES or NO for <u>every</u> item.)
                                    </td>
                                    <td valign="middle">
                                        <p>
                                            No</p>
                                    </td>
                                    <td valign="middle">
                                        <p>
                                            Yes</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        a. Diabetes
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        b. Heart attack, chest pain
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        c. Stroke
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        d. Amputation
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        e. Circulation problems in your legs or feet
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        f. Asthma, emphysema, or breathing problems
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        g. Stomach ulcer, irritable bowel.
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        h. Kidney disease
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        i. Major depression
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        j. Seizures
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        k. Alcoholism or alchol problem
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                </tr>
                                <tr>
                                    <td class="questionOption">
                                        l. Drug problems
                                    </td>
                                    <td class="questionAnswerOption">
                                        1
                                    </td>
                                    <td class="questionAnswerOption">
                                        2
                                    </td>
                                </tr>
                            </table>
                            <div class="question">
                                <ol start="9">
                                    <li>How much school did you complete?</li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR">
                                <tr>
                                    <td valign="top">
                                        Grade school or less
                                    </td>
                                    <td>
                                        ............................ 1
                                    </td>
                                    <td class="cirIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Some high school or technical school
                                    </td>
                                    <td>
                                        ............................ 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        High school or technical school graduate
                                    </td>
                                    <td>
                                        ............................ 3
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Some college
                                    </td>
                                    <td>
                                        ............................ 4
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        College graduate
                                    </td>
                                    <td>
                                        ............................ 5
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Graduate or professional school after college</p>
                                    </td>
                                    <td>
                                        ............................ 6
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <div class="question">
                                <ol start="10">
                                    <li>What is your approximate annual combined household income?</li>
                                </ol>
                            </div>
                            <table border="0" class="smallQuestionsGridR">
                                <tr>
                                    <td valign="top">
                                        Less than $10,000
                                    </td>
                                    <td>
                                        ................................................................... 1
                                    </td>
                                    <td class="cirIns">
                                        Circle one number.
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        $10,000 - 30,000
                                    </td>
                                    <td>
                                        ................................................................... 2
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        $30,001 - 100,000
                                    </td>
                                    <td>
                                        ................................................................... 3
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        More than $100,00
                                    </td>
                                    <td>
                                        ................................................................... 4
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <br />
                            <div class="bottomSpacer">&nbsp;</div>
                                                        
                            <div align="center" class="surveyTitleMedium">
                                <b>THANK YOU VERY MUCH!!!</b>
                            </div>
                            

                        </td>
                    </tr>
                    <tr height="35">
                        <td valign="bottom">
                            <table class="footer">
                                <tr>
                                    <td>
                                        EPIC-SF 6.2002
                                    </td>
                                    <td width="600">
                                        Copyright 2002. The University of Michigan. All rights reserved.
                                    </td>
                                    <td class="pageNumber">
                                        7
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            
            <!-- Physical page 8 -->
            <!-- Left Intentionally Blank -->
            <div class="BlankPageText">
            ------------------------------- Left Intentionally Blank -------------------------------              
            </div>
        </div>
    </div>
</body>
</html>
