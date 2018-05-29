<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EpicSurvey.ascx.cs" Inherits="Modules_FollowUp_Surveys_EpicSurvey" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Epic</title>
    <link href="follow-up_surveys.css" rel="stylesheet" type="text/css" />
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <!-- Physical page 1 -->
    <div style="page-break-after: always;">
        <div class="coverPageNoBorder">
            <div class="blockHeaderWhiteBgBigFont">
                <br />
                <br />
                <br />
                <br />
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
                    <br />
                    <table width="96%" align="center">
                        <tr>
                            <td>
                                Period:</td>
                            <td class="surveyEmptyBox">
                                &nbsp;</td>
                            <td>
                                &nbsp;&nbsp;Patient ID:</td>
                            <td class="surveyEmptyBox">
                                <asp:Label runat="server" ID="MRN"></asp:Label></td>
                        </tr>
                    </table>
                    <br />
                    Date Survey Completed: Month _________ Day _________ Year _________
                    <br />
                    <br />
                    Name: <u>
                        <asp:Label runat="server" ID="Name"></asp:Label></u>
                    <br />
                    <br />
                    Date of Birth: Month <u>
                        <asp:Label ID="DOBMonth" runat="server"></asp:Label></u> Day <u>
                            <asp:Label ID="DOBDay" runat="server"></asp:Label></u>Year <u>
                                <asp:Label ID="DOBYear" runat="server"></asp:Label></u>
                    <br />
                    <br />
                </div>
                <br />
                <br />
            </div>
            <br />
            <br />
            <br />
            <table class="footer">
                <tr>
                    <td>
                        EPIC-SF 6.2002</td>
                    <td width="655">
                        Copyright 2002. The University of Michigan. All rights reserved.</td>
                    <td class="pageNumber">
                        1</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="surveyForm">
        <!-- Physical page #2 -->
        <div style="page-break-after: always;">
            <div class="question">
                <ol start="1">
                    <li>Over the <b>past 4 weeks</b>, how often have you leaked urine?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td width="264" valign="top">
                        <p>
                            More than once a day........................ 1</p>
                    </td>
                    <td>
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            About once a day............................... 2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            More than once a week...................... 3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Rarely or never.................................. 4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <div class="question">
                <ol start="2">
                    <li>Which of the following best describes your urinary control <b>during the last 4
                        weeks?</b></li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td width="264" valign="top">
                        <p>
                            No urinary control whatsoever................ 1</p>
                    </td>
                    <td>
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Frequent dribbling.................................. 2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Occasional dribbling............................... 3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Total control........................................... 4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <div class="question">
                <ol start="3">
                    <li>How many pads or adult diapers per day did you usually use to control leakage <b>
                        during the last 4 weeks</b>?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td width="264" valign="top">
                        <p>
                            None...................................................... 0</p>
                    </td>
                    <td>
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            1 pad per day........................................ 1</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            2 pads per day....................................... 2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            3 or more pads per day........................... 3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <div class="question">
                <ol start="4">
                    <li>How big a problem, if any, has each of the following been for you <b>during the
                        last 4 weeks</b>?</li>
                </ol>
            </div>
            <table border="1" class="questionsGrid">
                <tr>
                    <td width="434" class="questionHeader">
                        (Circle one number on each line.)</td>
                    <td valign="top">
                        <b>No Problem</b></td>
                    <td valign="top">
                        <b>Very Small Problem</b></td>
                    <td valign="top">
                        <b>Small Problem</b></td>
                    <td valign="top">
                        <b>Moderate Problem</b></td>
                    <td valign="top">
                        <b>Big Problem</b></td>
                </tr>
                <tr>
                    <td class="questionOption">
                        a. Dripping or leaking urine.</td>
                    <td class="questionAnswerOption">
                        0</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        b. Pain or burning on urination</td>
                    <td class="questionAnswerOption">
                        0</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        c. Bleeding with urination</td>
                    <td class="questionAnswerOption">
                        0</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        d. Weak urine stream or incomplete emptying</td>
                    <td class="questionAnswerOption">
                        0</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        e. Need to urinate frequently during the day</td>
                    <td class="questionAnswerOption">
                        0</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <div class="question">
                <ol start="5">
                    <li>Overall, how big a problem has your urinary function been for you <b>during the
                        last 4 weeks</b>?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td width="264" valign="top">
                        <p>
                            No problem ............................................ 1</p>
                    </td>
                    <td>
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Very small problem ................................ 2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Small problem ....................................... 3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Moderate problem ................................ 4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Big problem .......................................... 5</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <table class="footer">
                <tr>
                    <td>
                        EPIC-SF 6.2002</td>
                    <td width="655">
                        Copyright 2002. The University of Michigan. All rights reserved.</td>
                    <td class="pageNumber">
                        2</td>
                </tr>
            </table>
        </div>
        <!-- Physical page #3 -->
        <div style="page-break-after: always;">
            <div class="question">
                <ol start="6">
                    <li>How big a problem, if any, has each of the following been for you?</li>
                </ol>
            </div>
            <table border="1" class="questionsGrid">
                <tr>
                    <td width="434" class="questionHeader">
                        (Circle one number on each line.)</td>
                    <td valign="top">
                        <b>No Problem</b></td>
                    <td valign="top">
                        <b>Very Small Problem</b></td>
                    <td valign="top">
                        <b>Small Problem</b></td>
                    <td valign="top">
                        <b>Moderate Problem</b></td>
                    <td valign="top">
                        <b>Big Problem</b></td>
                </tr>
                <tr>
                    <td class="questionOption">
                        a. Urgency to have a bowel movement</td>
                    <td class="questionAnswerOption">
                        0</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        b. Increased frequency of bowel movements/td>
                        <td class="questionAnswerOption">
                            0</td>
                        <td class="questionAnswerOption">
                            1</td>
                        <td class="questionAnswerOption">
                            2</td>
                        <td class="questionAnswerOption">
                            3</td>
                        <td class="questionAnswerOption">
                            4</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        c. Losing control of your stools</td>
                    <td class="questionAnswerOption">
                        0</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        d. Bloody stools</td>
                    <td class="questionAnswerOption">
                        0</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        e. Abdominal/Pelvic/Rectal pain</td>
                    <td class="questionAnswerOption">
                        0</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <div class="question">
                <ol start="7">
                    <li>Overall, how big a problem have your bowel habits been for you <b>during the last
                        4 weeks</b>?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td width="264" valign="top">
                        <p>
                            No problem ............................................ 1</p>
                    </td>
                    <td>
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Very small problem ................................ 2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Small problem ....................................... 3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Moderate problem ................................ 4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Big problem .......................................... 5</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <div class="question">
                <ol start="8">
                    <li>How would you rate each of the following <b>during the last 4 weeks</b>?</li>
                </ol>
            </div>
            <table border="1" class="questionsGrid">
                <tr>
                    <td width="434" class="questionHeader">
                        (Circle one number on each line.)</td>
                    <td valign="top">
                        <b>Very Poor to None</b></td>
                    <td valign="top">
                        <b>Poor</b></td>
                    <td valign="top">
                        <b>Fair</b></td>
                    <td valign="top">
                        <b>Good</b></td>
                    <td valign="top">
                        <b>Very Good</b></td>
                </tr>
                <tr>
                    <td class="questionOption">
                        a. Your ability to have an erection?</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                    <td class="questionAnswerOption">
                        5</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        b. Your ability to reach orgasm (climax)?</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                    <td class="questionAnswerOption">
                        5</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <div class="question">
                <ol start="9">
                    <li>How would you describe the usual QUALITY of your erections <b>during the last 4
                        weeks</b>? </li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td valign="top">
                        <p>
                            None at all ..................................................................................
                            1</p>
                    </td>
                    <td width="134">
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Not firm enough for any sexual activity....................................... 2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Firm enough for any sexual activity ...........................................
                            3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Firm enough for masturbation and foreplay only ....................... 4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <div class="question">
                <ol start="10">
                    <li>How would you describe the FREQUENCY of your erections <b>during the last 4 weeks</b>?
                    </li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td valign="top">
                        <p>
                            I NEVER had an erection when I wanted one ............................. 1</p>
                    </td>
                    <td width="134">
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            I had an erection LESS THAN HALF the time I wanted one ........ 2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            I had an erection ABOUT HALF the time I wanted one ............... 3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            I had an erection WHENEVER I wanted one ............................... 4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <table class="footer">
                <tr>
                    <td>
                        EPIC-SF 6.2002</td>
                    <td width="655">
                        Copyright 2002. The University of Michigan. All rights reserved.</td>
                    <td class="pageNumber">
                        3</td>
                </tr>
            </table>
        </div>
        <!-- Physical page 4 -->
        <div style="page-break-after: always;">
            <div class="question">
                <ol start="11">
                    <li>Overall, how would you rate your ability to function sexually <b>during the last
                        4 weeks</b>?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Very Poor ............................................. 1</p>
                    </td>
                    <td>
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Poor ..................................................... 2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Fair ...................................................... 3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Good .................................................... 4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Very Good ............................................ 5</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <div class="question">
                <ol start="12">
                    <li>Overall, how big a problem has your sexual function or lack of sexual function been
                        for you <b>during the last 4 weeks</b>?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td width="264" valign="top">
                        <p>
                            No problem ............................................ 1</p>
                    </td>
                    <td>
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Very small problem ................................ 2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Small problem ....................................... 3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Moderate problem ................................ 4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="264" valign="top">
                        <p>
                            Big problem .......................................... 5</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <div class="question">
                <ol start="13">
                    <li>How big a problem <b>during the last 4 weeks</b>, if any, has each of the following
                        been for you? </li>
                </ol>
            </div>
            <table border="1" class="questionsGrid">
                <tr>
                    <td width="444" class="questionHeader">
                        (Circle one number on each line.)</td>
                    <td width="65" valign="top">
                        <b>No Problem</b></td>
                    <td width="65" valign="top">
                        <b>Very Small Problem</b></td>
                    <td width="66" valign="top">
                        <b>Small Problem</b></td>
                    <td width="65" valign="top">
                        <b>Moderate Problem</b></td>
                    <td width="65" valign="top">
                        <b>Big Problem</b></td>
                </tr>
                <tr>
                    <td class="questionOption">
                        a. Hot flashes</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                    <td class="questionAnswerOption">
                        5</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        b. Breast tenderness/enlargement
                    </td>
                    <td class="questionAnswerOption">
                        0</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        c. Feeling depressed</td>
                    <td class="questionAnswerOption">
                        0</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        d. Lack of energy</td>
                    <td class="questionAnswerOption">
                        0</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        e. Change in bobdy weight</td>
                    <td class="questionAnswerOption">
                        0</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        3</td>
                    <td class="questionAnswerOption">
                        4</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <table class="footer">
                <tr>
                    <td>
                        EPIC-SF 6.2002</td>
                    <td width="655">
                        Copyright 2002. The University of Michigan. All rights reserved.</td>
                    <td class="pageNumber">
                        4</td>
                </tr>
            </table>
        </div>
        <br />
        <!-- Physical page 5 -->
        <div style="page-break-after: always;">
            <div class="blockHeaderBlackBg">
                FINAL SECTION
            </div>
            <div class="blockHeaderWhiteBg">
                <span class="tmrFont">These last questions are about your household and your general
                    medical history.
                    <br />These items are very important for our research. Please answer honestly.
            </div>
            <br />
            <br />
            <div class="question">
                <ol start="1">
                    <li>How do you describe yourself?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td valign="top">
                        <p>
                            White/Caucasian (not Latino/Hispanic)....................................... 1</p>
                    </td>
                    <td width="129">
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Black/African-American (not Latino/Hispanic).............................. 2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Latino/Hispanic/Mexican-American.............................................. 3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Asian/Oriental/Pacific Islander....................................................
                            4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            American Indian/Native Alaskan..................................................
                            5</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Other: Please specify ________________________________ 6</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <div class="question">
                <ol start="2">
                    <li>Which of the following best describes your current relationship?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td valign="top">
                        <p>
                            Living with spouse or partner......................................................
                            1</p>
                    </td>
                    <td width="129">
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            In a significant relationship, but not living together...................... 2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Not in a significant relationship...................................................
                            3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <div class="question">
                <ol start="3">
                    <li>What is your current marital status?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td valign="top">
                        <p>
                            Never married....................................................................
                            1</p>
                    </td>
                    <td width="129">
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Married.............................................................................
                            2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Separated.........................................................................
                            3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Divorced...........................................................................
                            4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Widowed...........................................................................
                            5</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <div class="question">
                <ol start="4">
                    <li>Are you now working at a paying job?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td valign="top">
                        <p>
                            Yes, full-time........................................................................
                            1</p>
                    </td>
                    <td width="129">
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Yes, part-time.......................................................................
                            2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            No, but looking for a job........................................................
                            3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            No, retired..............................................................................
                            4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <table class="footer">
                <tr>
                    <td>
                        EPIC-SF 6.2002</td>
                    <td width="655">
                        Copyright 2002. The University of Michigan. All rights reserved.</td>
                    <td class="pageNumber">
                        5</td>
                </tr>
            </table>
        </div>
        <!-- Physical page 6 -->
        <div style="page-break-after: always;">
            <div class="question">
                <ol start="5">
                    <li>Do you currently smoke cigarettes?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td valign="top">
                        <p>
                            No......................................................................................
                            1</p>
                    </td>
                    <td width="129">
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Yes....................................................................................
                            2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <div class="question">
                <ol start="6">
                    <li>Have you <b>EVER</b> had any of the following treatments for prostate cancer <b>
                        (Please circle YES or NO for <u>every</u> item and fill in the month/year during
                        which therapy was started)</b></li>
                </ol>
            </div>
            <table border="1" class="questionsGrid">
                <tr>
                    <td width="444" class="questionHeader">
                        (Circle one number on each line.)</td>
                    <td width="65" valign="top">
                        <b>No</b></td>
                    <td width="65" valign="top">
                        <b>Yes</b></td>
                    <td width="66" valign="top">
                        <b>Month & year of surgery:</b></td>
                </tr>
                <tr>
                    <td class="questionOption">
                        a. Radical prostatectomy (surgery to remove the prostate through the abdomen or
                        perineum, or by using a laparoscope)
                    </td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        ______/_______</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        b. External Beam Radiation
                    </td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        ______/_______</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        c. Radioactive Seed implantation (Brachytherapy)
                    </td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        ______/_______</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        d. Expectant management (Watchful Waiting)</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        ______/_______</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        e. Orchiectomy (surgical removal of the testes)</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        ______/_______</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        f. Hormone deprivation therapy shots</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        ______/_______</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        g. Hormone pills (Flutamide, Nilandron, or Casodex)
                    </td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        ______/_______</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        h. Other ____________________________________</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                    <td class="questionAnswerOption">
                        ______/_______</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <div class="question">
                <ol start="7">
                    <li>Which therapy, if any, do you <b>currently</b> use to improve your erections?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td valign="top">
                        <p>
                            None at all.................................................................................
                            0</p>
                    </td>
                    <td width="129">
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Vacuum erection device (Erect-aid).......................................... 1</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Penile injection therapy.............................................................
                            2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                    .
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Penile prosthesis......................................................................
                            3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Muse (intra-urethral alprostadil)................................................
                            4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Viagra or Levitra.......................................................................
                            5</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Other _____________________________............................. 6</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <table class="footer">
                <tr>
                    <td>
                        EPIC-SF 6.2002</td>
                    <td width="655">
                        Copyright 2002. The University of Michigan. All rights reserved.</td>
                    <td class="pageNumber">
                        6</td>
                </tr>
            </table>
        </div>
        <!-- Physical page 7 -->
        <div style="page-break-after: always;">
            <div class="question">
                <ol start="8">
                    <li>Have you <b>EVER</b>s had any of the following medical conditions?</li>
                </ol>
            </div>
            <table border="1" class="questionsGrid">
                <tr>
                    <td width="434" class="questionHeader">
                        (Please Circle YES or NO for <u>every</u> item.)</td>
                    <td valign="top">
                        <p>
                            No</p>
                    </td>
                    <td valign="top">
                        <p>
                            Yes</p>
                    </td>
                </tr>
                <tr>
                    <td class="questionOption">
                        a. Diabetes
                    </td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        b. Heart attack, chest pain
                    </td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        c. Stroke</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        d. Amputation</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        e. Circulation problems in your legs or feet</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        f. Asthma, emphysema, or breathing problems</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        g. Stomach ulcer, irritable bowel.</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        h. Kidney disease</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        i. Major depression</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        j. Seizures</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        k. Alcoholism or alchol problem</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                </tr>
                <tr>
                    <td class="questionOption">
                        l. Drug problems</td>
                    <td class="questionAnswerOption">
                        1</td>
                    <td class="questionAnswerOption">
                        2</td>
                </tr>
            </table>
            <br />
            <br />
            <div class="question">
                <ol start="9">
                    <li>How much school did you complete?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td valign="top">
                        <p>
                            Grade school or less...................................................................
                            1</p>
                    </td>
                    <td width="129">
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Some high school or technical school......................................... 2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            High school or technical school graduate................................... 3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Some college..............................................................................
                            4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            College graduate.........................................................................
                            5</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            Graduate or professional school after college............................. 6</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <div class="question">
                <ol start="10">
                    <li>What is your approximate annual combined household income?</li>
                </ol>
            </div>
            <table border="0" class="smallQuestionsGrid">
                <tr>
                    <td valign="top">
                        <p>
                            Less than $10,000.......................................................................
                            1</p>
                    </td>
                    <td width="129">
                        <span class="tmrFont">Circle one number.</span></td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            $10,000 - 30,000.........................................................................
                            2</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            $30,001 - 100,000.......................................................................
                            3</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <p>
                            More than $100,00......................................................................
                            4</p>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div align="center" class="surveyTitleMedium">
                <b>THANK YOU VERY MUCH!!!</b></div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <table class="footer">
                <tr>
                    <td>
                        EPIC-SF 6.2002</td>
                    <td width="655">
                        Copyright 2002. The University of Michigan. All rights reserved.</td>
                    <td class="pageNumber">
                        7</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
