<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RandPostLateTxSurvey.ascx.cs"
    Inherits="Modules_FollowUp_Surveys_EVUQOLPostLateTx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Late Post Treatment Survey</title>
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
    <!-- Physical page 1 -->
    <div style="page-break-after: always;">
        <table height="900">
            <tr>
                <td>
                    <div class="topSpacer">
                        &nbsp;</div>
                    <div class="coverPage">
                        <div class="blockHeaderWhiteBgBigFont">
                            <div class="surveyInfoRight">
                                <span>&nbsp;</span>
                                <br />
                                Late Post Tx &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1-4/
                            </div>
                            <div class="surveyPatientBox">
                                Patient Name:
                                <asp:Label runat="server" ID="Name"></asp:Label>
                            </div>
                            <br />
                            <br />
                            <div class="surveyPatientBox">
                                Patient #:
                                <asp:Label runat="server" ID="MRN"></asp:Label>
                            </div>
                            <div class="surveyInfoRight">
                                <span>&nbsp;</span>
                                <br />
                                Period:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label runat="server" ID="Period"></asp:Label>
                            </div>
                            <br />
                            <br />
                            <br />
                            <br />
                            <div class="surveyTitle">
                                <asp:Label ID="SurveyInstitutionName" runat="server"></asp:Label>
                                <br />
                                DEPARTMENT OF UROLOGY
                                <br />
                                QUALITY-OF-LIFE QUESTIONNAIRE</div>
                        </div>
                        <br />
                        <br />
                        <table align="center">
                            <tr>
                                <td colspan="2">
                                    Treatment: <b>
                                        <asp:Label runat="server" ID="ProcName"></asp:Label></b> @ <b>
                                            <asp:Label runat="server" ID="FUMonth"></asp:Label></b> Months
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b><span class="tmrFont">Today's Date:</span></b>&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <div class="surveyDateBox">
                                        <table align="center">
                                            <tr>
                                                <td>
                                                    <b><span class="uFont">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></b>
                                                </td>
                                                <td>
                                                    <b>/ <span class="uFont">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></b>
                                                </td>
                                                <td>
                                                    <b>/ <span class="uFont">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Month
                                                </td>
                                                <td>
                                                    Day
                                                </td>
                                                <td>
                                                    Year
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;<span class="tmrTinyFont">5-12 /</span>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <div class="surveySummary">
                            <p align="justify">
                                The purpose of this questionnaire is to find out about your health in general and
                                about how your prostate cancer and any treatment you received for it affects your
                                quality of life.</p>
                            <p align="justify">
                                Please read each question carefully before answering. If you are unsure about how
                                to answer a question, please give the best answer you can. Remember that there are
                                no right or wrong answers. If you have any questions, please call the study coordinator
                                at (757) 457-5165.</p>
                            <p align="justify">
                                Your answers to this questionnaire will be kept confidential and will be used only
                                for research purposes. The information you give will be combined with the responses
                                of other patients completing this questionnaire, and you will not be identifiable
                                in any way.</p>
                        </div>
                        <br />

                    </div>
                </td>
            </tr>
            <tr height="30">
                <td valign="bottom">
                    <table class="footer">
                        <tr>
                            <td width="355" style="text-align: left;">
                                Rev. 03/13/06
                            </td>
                            <td width="385" class="pageNumber" style="text-align: right;">
                                1
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    
 <div class="surveyForm">
        <!-- Physical page 2 -->
        <div style="page-break-after: always; vertical-align: top;">
            <table height="900">
                <tr>
                    <td valign="top">
                        <div class="topSpacer">
                            &nbsp;</div>
                        <div class="instructions">
                            These first questions are about your <u>health in general</u>, BOTH RELATED and
                            UNRELATED to your prostate cancer. We recognize that other diseases you may have
                            in addition to your prostate cancer may affect your answers. Please give the best
                            answer you can and remember there are no right or wrong answers.
                        </div>
                        <br />
                        <div class="boxedQuestion">
                            <ol start="1">
                                <li>The following questions are about activities you might do during a typical day.
                                    <u>Does your health now limit</u> you in these activities? If so, how much?</li>
                            </ol>
                        </div>
                        <table border="1" class="questionsGridR">
                            <tr>
                                <td class="questionHeader">
                                    <span class="tmrFont">(Circle 1, 2, or 3 on each line.)</span>
                                </td>
                                <td>
                                    <b>Yes, limited
                                        <br />
                                        a lot</b>
                                </td>
                                <td>
                                    <b>Yes, limited
                                        <br />
                                        a little</b>
                                </td>
                                <td>
                                    <b>No, not limited
                                        <br />
                                        at all</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    a. <b>Vigorous activities</b>, such as running, lifting heavy objects, participating
                                    in strenuous sports
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
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    b. <b>Moderate activities</b>, such as moving a table, pushing a vacuum cleaner,
                                    bowling, or playing golf
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
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    c. Lifting or carrying groceries
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
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    d. Climbing <b>several</b> flights of stairs
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
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    e. Climbing <b>one</b> flight of stairs
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
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    f. Bending, kneeling, or stooping
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
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    g. Walking <b>more than a mile</b>
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
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    h. Walking <b>several hundred yards</b>
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
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    i. Walking <b>one hundred yards</b>
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
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    j. Bathing or dressing yourself
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
                            </tr>
                        </table>
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="2">
                                <li>During the LAST 4 WEEKS, have you had any of the following problems with your work
                                    or other regular daily activities <u>as a result of your</u> PHYSICAL HEALTH?</li>
                            </ol>
                        </div>
                        <table border="1" class="questionsGridR">
                            <tr>
                                <td class="questionHeader">
                                    <span class="tmrFont">(Answer YES or NO for each question by circling 1 or 2 on each
                                        line.)</span>
                                </td>
                                <td>
                                    <b>Yes</b>
                                </td>
                                <td>
                                    <b>No</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    a. Cut down the <b>amount of time</b> you spent on work or other activities
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
                                    b. <b>Accomplished less</b> than you would like
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
                                    c. Were limited in the <b>kind</b> of work or other activities
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
                                    d. Had <b>difficulty</b> performing the work or other activities<br />
                                    (for example, it took extra effort)
                                </td>
                                <td class="questionAnswerOption">
                                    1
                                </td>
                                <td class="questionAnswerOption">
                                    2
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr height="40">
                    <td valign="bottom">
                        <table class="footer">
                            <tr>
                                                                <td width="355" style="text-align: left;">
                                    Rev. 03/13/06
                                </td>
                                <td width="385" class="pageNumber" style="text-align: right;">
                                    2
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <!-- Physical page 3 -->
        <div style="page-break-after: always; vertical-align: top;">
            <table height="900">
                <tr>
                    <td>
                        <div class="topSpacer">
                            &nbsp;</div>
                        <div class="boxedQuestion">
                            <ol start="3">
                                <li>During the LAST 4 WEEKS, have you had any of the following problems with your work
                                    or other regular daily activities <u>as a result of any</u> EMOTIONAL PROBLEMS,
                                    such as feeling depressed or anxious?</li>
                            </ol>
                        </div>
                        <table border="1" class="questionsGridR">
                            <tr>
                                <td class="questionHeader">
                                    <span class="tmrFont">(Answer YES or NO for each question by circling 1 or 2 on each
                                        line.)</span>
                                </td>
                                <td>
                                    <b>Yes</b>
                                </td>
                                <td>
                                    <b>No</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    a. Cut down the <b>amount of time</b> you spent on work or other activities
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
                                    b. <b>Accomplished less</b> than you would like
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
                                    c. Did work or other activities <b>less carefully</b> than usual
                                </td>
                                <td class="questionAnswerOption">
                                    1
                                </td>
                                <td class="questionAnswerOption">
                                    2
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="4">
                                <li>These questions are about how you feel and how things have been with you during
                                    the LAST 4 WEEKS. For each question, please give the one answer that comes closest
                                    to the way you have been feeling. How much of the time during the LAST 4 WEEKS...</li>
                            </ol>
                        </div>
                        <table border="1" class="questionsGridR">
                            <tr>
                                <td width="434" class="questionHeader">
                                    (Circle one number on each line.)
                                </td>
                                <td width="55">
                                    <b>All the time </b>
                                </td>
                                <td width="55">
                                    <b>Most of the time </b>
                                </td>
                                <td width="55">
                                    <b>A good bit of the time </b>
                                </td>
                                <td width="55" valign="top">
                                    <b>Some of the time</b>
                                </td>
                                <td width="55" valign="top">
                                    <b>A little of the time</b>
                                </td>
                                <td width="55" valign="top">
                                    <b>None of the time</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    a. Did you feel full of life?
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
                                <td class="questionAnswerOption">
                                    6
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    b. Have you been very nervous?
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
                                <td class="questionAnswerOption">
                                    6
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    c. Have you felt so down in the dumps that nothing could cheer you up?
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
                                <td class="questionAnswerOption">
                                    6
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    d. Have you felt calm and peaceful?
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
                                <td class="questionAnswerOption">
                                    6
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    e. Did you have a lot of energy?
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
                                <td class="questionAnswerOption">
                                    6
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    f. Have you felt downhearted and depressed?
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
                                <td class="questionAnswerOption">
                                    6
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    g. Did you feel worn out?
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
                                <td class="questionAnswerOption">
                                    6
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    h. Have you been happy?
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
                                <td class="questionAnswerOption">
                                    6
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    i. Did you feel tired?
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
                                <td class="questionAnswerOption">
                                    6
                                </td>
                            </tr>
                        </table>
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
                                document.write('<div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div>')
                            }
                        </script>
                    </td>
                </tr>
                <tr height="40">
                    <td valign="bottom">
                        <table class="footer">
                            <tr>
                                <td width="355" style="text-align: left;">
                                    Rev. 03/13/06
                                </td>
                                <td width="385" class="pageNumber" style="text-align: right;">
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
                        <div class="boxedQuestion">
                            <ol start="5">
                                <li>During the LAST 4 WEEKS, how much of the time has your physical health or emotional
                                    problems interfered with your social activities (like visiting with friends, relatives,
                                    etc.)?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    All of the time
                                </td>
                                <td>
                                    .................................................. 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Most of the time
                                </td>
                                <td>
                                    .................................................. 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Some of the time
                                </td>
                                <td>
                                    .................................................. 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    A little of the time
                                </td>
                                <td>
                                    .................................................. 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    None of the time
                                </td>
                                <td>
                                    .................................................. 5
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="6">
                                <li>During the LAST 4 WEEKS, to what extent has your physical health or emotional problems
                                    interfered with your normal social activities with family, friends, neighbors, or
                                    groups?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td width="264" valign="top">
                                    Not at all</p>
                                </td>
                                <td>
                                    .................................................. 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    Slightly
                                </td>
                                <td>
                                    .................................................. 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    Moderately
                                </td>
                                <td>
                                    .................................................. 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    Quite a bit
                                </td>
                                <td>
                                    .................................................. 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    Extremely
                                </td>
                                <td>
                                    .................................................. 5
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="7">
                                <li>How much BODILY pain have you had during the LAST 4 WEEKS?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td width="264" valign="top">
                                    None
                                </td>
                                <td>
                                    .................................................. 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    Very mild
                                </td>
                                <td>
                                    .................................................. 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    Mild
                                </td>
                                <td>
                                    .................................................. 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    Moderate
                                </td>
                                <td>
                                    .................................................. 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    Severe
                                </td>
                                <td>
                                    .................................................. 5
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    Very severe
                                </td>
                                <td>
                                    .................................................. 6
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="8">
                                <li>During the LAST 4 WEEKS, how much did pain interfere with your normal work (including
                                    both work outside the home and housework)?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td width="264" valign="top">
                                    Not at all</p>
                                </td>
                                <td>
                                    .................................................. 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    Slightly
                                </td>
                                <td>
                                    .................................................. 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    Moderately
                                </td>
                                <td>
                                    .................................................. 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    Quite a bit
                                </td>
                                <td>
                                    .................................................. 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="264" valign="top">
                                    Extremely
                                </td>
                                <td>
                                    .................................................. 5
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        
                        <script type="text/javascript">
                            if (!(bw.ie7 || bw.ie8)) {
                                document.write('<div class="bottomMedSpacer">&nbsp;</div>')
                            }
                        </script>
                    </td>
                </tr>
                <tr height="10">
                    <td valign="bottom">
                        <table class="footer">
                            <tr>
                                <td width="355" style="text-align: left;">
                                    Rev. 03/13/06
                                </td>
                                <td width="385" class="pageNumber" style="text-align: right;">
                                    4
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <!-- Physical page 5 -->
        <div style="page-break-after: always; vertical-align: top;">
            <table height="900">
                <tr>
                    <td valign="top">
                        <div class="topSpacer">
                            &nbsp;</div>
                        <div class="boxedQuestion">
                            <ol start="9">
                                <li>Please choose the answer that best describes how TRUE or FALSE each of the following
                                    statements is for you.</li>
                            </ol>
                        </div>
                        <table border="1" class="questionsGridR">
                            <tr>
                                <td width="434" class="questionHeader">
                                    (Circle one number on each line.)
                                </td>
                                <td valign="top">
                                    <b>Definitely true</b>
                                </td>
                                <td valign="top">
                                    <b>Mostly true</b>
                                </td>
                                <td valign="top">
                                    <b>Not sure</b>
                                </td>
                                <td valign="top">
                                    <b>Mostly false</b>
                                </td>
                                <td valign="top">
                                    <b>Definitely false</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    a. I seem to get sick a little easier than other people
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
                                    b. I am as healthy as anyone I know
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
                                    c. I expect my health to get worse
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
                                    d. My health is excellent
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
                        <br />
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="10">
                                <li>In general, would you say your health is:</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    Excellent
                                </td>
                                <td>
                                    .......................................................... 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Very Good</p>
                                </td>
                                <td>
                                    .......................................................... 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Good
                                </td>
                                <td>
                                    .......................................................... 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Fair
                                </td>
                                <td>
                                    .......................................................... 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Poor
                                </td>
                                <td>
                                    .......................................................... 5
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="11">
                                <li>COMPARED TO ONE YEAR AGO, how would you rate your health in general now?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    Much better now than one year ago
                                </td>
                                <td>
                                    ........................ 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Somewhat better now than one year ago
                                </td>
                                <td>
                                    ........................ 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    About the same
                                </td>
                                <td>
                                    ........................ 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Somewhat worse now than one year ago
                                </td>
                                <td>
                                    ........................ 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Much worse now than one year ago
                                </td>
                                <td>
                                    ........................ 5
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
                        
                        <script type="text/javascript">
                            if (!(bw.ie7 || bw.ie8)) {
                                document.write('<div class="bottomMedSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div>')
                            }
                        </script>
                    </td>
                </tr>
                <tr height="40">
                    <td valign="bottom">
                        <table class="footer">
                            <tr>
                                <td width="355" style="text-align: left;">
                                    Rev. 03/13/06
                                </td>
                                <td width="385" class="pageNumber" style="text-align: right;">
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
                        <div class="topSpacer">
                            &nbsp;</div>
                        <div class="boxedQuestion">
                            <ol start="12">
                                <li>During the LAST 4 WEEKS, how much did your prostate cancer or its treatment interfere
                                    with the following things:</li>
                            </ol>
                        </div>
                        <table border="1" class="questionsGridR">
                            <tr>
                                <td width="444" class="questionHeader">
                                    (Circle one number on each line.)
                                </td>
                                <td width="65" valign="top">
                                    <b>Not at all</b>
                                </td>
                                <td width="65" valign="top">
                                    <b>A little bit</b>
                                </td>
                                <td width="66" valign="top">
                                    <b>Moderer- ately</b>
                                </td>
                                <td width="65" valign="top">
                                    <b>Quite a bit</b>
                                </td>
                                <td width="65" valign="top">
                                    <b>Ex- tremely</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    a. Your ability to walk or move about?
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
                                    b. Your sleep?
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
                                    c. Your normal work (including both work outside the home and housework)?
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
                                    d. Your recreational and social activities?
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
                                    e. Your mood?
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
                                    f. Your relationship with other family members?
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
                                    g. Your enjoyment of life?
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
                                    h. Your relationship with your spouse or significant other?
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
                        <br />
                        <br />
                        <br />
                        <div class="blockHeaderBlackBg">
                            BOWEL HABITS
                        </div>
                        <div class="blockHeaderWhiteBg">
                            <span class="tmrFont">This section is about your bowel habits and abdominal pain.
                                <br />
                                Please consider </span><b>ONLY THE LAST 4 WEEKS</b>.
                        </div>
                        <div class="boxedQuestion">
                            <ol start="13">
                                <li>Overall, how often have you had rectal urgency (felt like you had to pass stool,
                                    but did not) during the LAST 4 WEEKS?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    More than once a day
                                </td>
                                <td>
                                    .................................................................. 1
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
                                    .................................................................. 2
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
                                    .................................................................. 3
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
                                    .................................................................. 4
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
                                    .................................................................. 5
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
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
                        <div class="bottomSpacer">
                            &nbsp;</div>
                       
                        <script type="text/javascript">
                            if (!(bw.ie7 || bw.ie8)) {
                                document.write('<div class="bottomMedSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div>')
                            }
                        </script>
                    </td>
                </tr>
                <tr height="40">
                    <td valign="bottom">
                        <table class="footer">
                            <tr>
                                <td width="355" style="text-align: left;">
                                    Rev. 03/13/06
                                </td>
                                <td width="385" class="pageNumber" style="text-align: right;">
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
                    <td valign="top">
                        <div class="topSpacer">
                            &nbsp;</div>
                        <div class="boxedQuestion">
                            <ol start="14">
                                <li>How often have you had stools (bowel movements) that were loose or liquid (no form,
                                    watery, mushy) during the LAST 4 WEEKS?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    Never
                                </td>
                                <td>
                                    .................................................................. 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Rarely
                                </td>
                                <td>
                                    .................................................................. 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    About half the time
                                </td>
                                <td>
                                    .................................................................. 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Usually
                                </td>
                                <td>
                                    .................................................................. 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Always
                                </td>
                                <td>
                                    .................................................................. 5
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="15">
                                <li>How much distress have your bowel movements caused you during the LAST 4 WEEKS?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    Severe distress
                                </td>
                                <td>
                                    .................................................................. 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Moderate distress
                                </td>
                                <td>
                                    .................................................................. 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    A little distress
                                </td>
                                <td>
                                    .................................................................. 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    No distress
                                </td>
                                <td>
                                    .................................................................. 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="16">
                                <li>How often have you had crampy pain in your abdomen or pelvis during the LAST 4 WEEKS?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    Several times a day
                                </td>
                                <td>
                                    .................................................................. 1
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
                                    .................................................................. 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Several times a week
                                </td>
                                <td>
                                    .................................................................. 3
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
                                    .................................................................. 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    About once this month
                                </td>
                                <td>
                                    .................................................................. 5
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
                                    .................................................................. 6
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="17">
                                <li>Overall, how big a problem have your bowel habits been for you during the LAST 4
                                    WEEKS?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    Big problem
                                </td>
                                <td>
                                    .................................................................. 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Moderate problem
                                </td>
                                <td>
                                    .................................................................. 2
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
                                    .................................................................. 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Very small problem
                                </td>
                                <td>
                                    .................................................................. 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    No problem
                                </td>
                                <td>
                                    .................................................................. 5
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <div class="bottomSpacer">
                            &nbsp;</div>
                        <div class="bottomSpacer">
                            &nbsp;</div>
                        <div class="bottomSpacer">
                            &nbsp;</div>

                        <script type="text/javascript">
                            if (!(bw.ie7 || bw.ie8)) {
                                document.write('<div class="bottomMedSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div>')
                            }
                        </script>

                    </td>
                </tr>
                <tr height="40">
                    <td valign="bottom">
                        <table class="footer">
                            <tr>
                                <td width="355" style="text-align: left;">
                                    Rev. 03/13/06
                                </td>
                                <td width="385" class="pageNumber" style="text-align: right;">
                                    7
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <!-- Physical Page 8 -->
        <div style="page-break-after: always;">
            <table height="900">
                <tr>
                    <td valign="top">
                        <div class="topSpacer">
                            &nbsp;</div>
                        <div class="blockHeaderBlackBg">
                            SEXUAL FUNCTION
                        </div>
                        <div class="blockHeaderWhiteBg">
                            <span class="tmrFont">The next section is about your sexual function and sexual satisfaction.
                                Many of the questions are very personal, but they will help us understand the important
                                issues that you face every day. Remember that your answers to this questionnaire
                                will be kept confidential and will be used only for research purposes. Please answer
                                honestly about </span><b>THE LAST 4 WEEKS</b>.
                        </div>
                        <div class="boxedQuestion">
                            <ol start="18">
                                <li>How would you rate each of the following during the <b>LAST 4 WEEKS</b>?</li>
                            </ol>
                        </div>
                        <table border="1" class="questionsGridR">
                            <tr>
                                <td width="434" class="questionHeader">
                                    (Circle one number on each line.)
                                </td>
                                <td valign="top">
                                    <p>
                                        Very Poor
                                    </p>
                                </td>
                                <td valign="top">
                                    <p>
                                        Poor</p>
                                </td>
                                <td valign="top">
                                    <p>
                                        Fair</p>
                                </td>
                                <td valign="top">
                                    <p>
                                        Good</p>
                                </td>
                                <td valign="top">
                                    <p>
                                        Very Good
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    a. Your level of sexual desire?
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
                                    b. Your ability to have an erection?
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
                                    c. Your ability to reach orgasm (climax)?
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
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="19">
                                <li>How would you describe the usual <b>QUALITY</b> of your erections?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    None at all
                                </td>
                                <td>
                                    .............................. 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Not firm enough for any sexual activity</p>
                                </td>
                                <td>
                                    .............................. 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Firm enough for masturbation and foreplay only
                                </td>
                                <td>
                                    .............................. 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Firm enough for intercourse
                                </td>
                                <td>
                                    .............................. 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div class="boxedQuestion">
                            <ol start="20">
                                <li>How would you describe the <b>FREQUENCY</b> of your erections?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td width="394" valign="top">
                                    I <b>NEVER</b> had an erection when I wanted one</p>
                                </td>
                                <td>
                                    ........ 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    I had an erection <b>LESS THAN HALF</b> the time I wanted one</p>
                                </td>
                                <td>
                                    ........ 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="394" valign="top">
                                    I had an erection <b>ABOUT HALF</b> the time I wanted one</p>
                                </td>
                                <td>
                                    ........ 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    I had an erection <b>MORE THAN HALF</b> the time I wanted one</p>
                                </td>
                                <td>
                                    ........ 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    I had an erection <b>WHENEVER</b> I wanted one</p>
                                </td>
                                <td>
                                    ........ 5
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div class="boxedQuestion">
                            <ol start="21">
                                <li>How often have you awakened in the morning or night with an erection?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    Never
                                </td>
                                <td>
                                    ........ 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Seldom (less than 25% of the time)
                                </td>
                                <td>
                                    ........ 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Not often (less than half the time)
                                </td>
                                <td>
                                    ........ 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Often (more than half the time)
                                </td>
                                <td>
                                    ........ 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Very often (more than 75% of the time)
                                </td>
                                <td>
                                    ........ 5
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>

                        <script type="text/javascript">
                            if (!(bw.ie7 || bw.ie8)) {
                                document.write('<div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div>')
                            }
                        </script>

                    </td>
                </tr>
                <tr height="40">
                    <td valign="bottom">
                        <table class="footer">
                            <tr>
                                <td width="355" style="text-align: left;">
                                    Rev. 03/13/06
                                </td>
                                <td width="385" class="pageNumber" style="text-align: right;">
                                    8
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        
        <!-- Physical page 9 -->
        <div style="page-break-after: always;">
            <table height="900">
                <tr>
                    <td valign="top">
                        <div class="topSpacer">
                            &nbsp;</div>
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="22">
                                <li>During the LAST 4 WEEKS did you have vaginal or anal intercourse?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    No
                                </td>
                                <td>
                                    .................................................................. 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Yes, once
                                </td>
                                <td>
                                    .................................................................. 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Yes, more than once
                                </td>
                                <td>
                                    .................................................................. 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        
                        <div class="boxedQuestion">
                            <ol start="23">
                                <li>Overall, how would you rate your ability to function sexually during the LAST 4
                                    WEEKS?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    Very Poor
                                </td>
                                <td>
                                    ......................................... 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Poor</p>
                                </td>
                                <td>
                                    ......................................... 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Fair
                                </td>
                                <td>
                                    ......................................... 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Good
                                </td>
                                <td>
                                    ......................................... 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Very Good
                                </td>
                                <td>
                                    ......................................... 5
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />

                        <div class="boxedQuestion">
                            <ol start="24">
                                <li>Overall, how big a problem has your sexual function been for you during the LAST
                                    4 WEEKS?</li>
                            </ol>
                        </div>
                        <table border="0" class="smallquestionsGridR" cellpadding="4">
                            <tr>
                                <td valign="top">
                                    No problem
                                </td>
                                <td>
                                    ................................................................... 1
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
                                    ................................................................... 2
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
                                    ................................................................... 3
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
                                    ................................................................... 4
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
                                    ................................................................... 5
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <div class="blockHeaderBlackBg">
                            URINARY FUNCTION
                        </div>
                        <div class="blockHeaderWhiteBg">
                            <span class="tmrFont">This section is about your urinary habits.
                                <br />
                                Please answer honestly about </span><b>THE LAST 4 WEEKS</b>.
                        </div>
                        <div class="boxedQuestion">
                            <ol start="25">
                                <li>Over the LAST 4 WEEKS, how often have you leaked urine?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    Every day
                                </td>
                                <td>
                                    .................................................................. 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    About once a week
                                </td>
                                <td>
                                    .................................................................. 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Less than once a week
                                </td>
                                <td>
                                    .................................................................. 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Not at all
                                </td>
                                <td>
                                    .................................................................. 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>

                        <script type="text/javascript">
                            if (!(bw.ie7 || bw.ie8)) {
                                document.write('<div class="bottomMedSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div>')
                            }
                        </script>

                    </td>
                </tr>
                <tr height="40">
                    <td valign="bottom">
                        <table class="footer">
                            <tr>
                                <td width="355" style="text-align: left;">
                                    Rev. 03/13/06
                                </td>
                                <td width="385" class="pageNumber" style="text-align: right;">
                                    9
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        
        <!-- Physical page 10 -->
        <div style="page-break-after: always;">
            <table height="900">
                <tr>
                    <td valign="top">
                        <div class="topSpacer">
                            &nbsp;</div>
                        <div class="boxedQuestion">
                            <ol start="26">
                                <li>Which of the following best describes your urinary control during the LAST 4 WEEKS?
                                </li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">No control whatsoever</td>
                                    <td>
                                        .................................................................. 1
                                    </td>
                                    <td class="circleIns">
                                        Circle one number.
                                    </td>
                            </tr>
                            <tr>
                                <td valign="top">Frequent dribbling</td>
                                    <td>
                                        .................................................................. 2
                                    </td>
                                    <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">Occasional dribbling</td>
                                    <td>
                                        .................................................................. 3
                                    </td>
                                    <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">Total control</td>
                                    <td>
                                        .................................................................. 4
                                    </td>
                                    <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        
                        <div class="boxedQuestion">
                            <ol start="27">
                                <li>How many pads or adult diapers per day did you usually use to control leakage during
                                    the LAST 4 WEEKS?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">3 or more pads per day</td>
                                    <td>
                                        .................................................................. 1
                                    </td>
                                    <td class="circleIns">
                                        Circle one number.
                                    </td>
                            </tr>
                            <tr>
                                <td valign="top">1-2 pads per day</td>
                                    <td>
                                        .................................................................. 2
                                    </td>
                                    <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    No pads
                                </td>
                                <td>
                                    .................................................................. 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Not needed
                                </td>
                                <td>
                                    .................................................................. 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="28">
                                <li>How big a problem, if any, has each of the following been for you?</li>
                            </ol>
                        </div>
                        <table border="1" class="questionsGridR">
                            <tr>
                                <td width="434" class="questionHeader">
                                    (Circle one number on each line.)
                                </td>
                                <td valign="top">
                                    <p>
                                        No problem</p>
                                </td>
                                <td valign="top">
                                    <p>
                                        Very small problem</p>
                                </td>
                                <td valign="top">
                                    <p>
                                        Small problem</p>
                                </td>
                                <td valign="top">
                                    <p>
                                        Moderate problem</p>
                                </td>
                                <td valign="top">
                                    <p>
                                        Big problem</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    a. Dripping urine or wetting your pants?
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
                                    b. Urine leakage interfering with your sexual activity?
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
                        <br />
                        <br />
                        
                        <div class="boxedQuestion">
                            <ol start="29">
                                <li>Overall, how big a problem has your urinary function been for you during the LAST
                                    4 WEEKS? </li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR" cellpadding="4">
                            <tr>
                                <td valign="top">
                                    No problem
                                </td>
                                <td>
                                    ................................................................... 1
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
                                    ................................................................... 2
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
                                    ................................................................... 3
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
                                    ................................................................... 4
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
                                    ................................................................... 5
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
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
                                document.write('<div class="bottomMedSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div>')
                            }
                        </script>
                    </td>
                </tr>
                <tr height="40">
                    <td valign="bottom">
                        <table class="footer">
                            <tr>
                                <td width="355" style="text-align: left;">
                                    Rev. 03/13/06
                                </td>
                                <td width="385" class="pageNumber" style="text-align: right;">
                                    10
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        
        <!-- Physical page 11 -->
        <div style="page-break-after: always;">
            <table height="900">
                <tr>
                    <td valign="top">
                        <div class="topSpacer">
                            &nbsp;</div>
                        <div class="boxedQuestion">
                            <ol start="30">
                                <li>GENERAL URINARY FUNCTION</li>
                            </ol>
                        </div>
                        <table border="1" class="questionsGridR">
                            <tr>
                                <td width="404" class="questionHeader">
                                    (Circle one number on each line.)
                                </td>
                                <td width="60" valign="middle">
                                    <b>Not at all </b>
                                </td>
                                <td width="60" valign="middle">
                                    <b>Less than 1 time in 5 </b>
                                </td>
                                <td width="60" valign="middle">
                                    <b>Less than half the time </b>
                                </td>
                                <td width="60" valign="middle">
                                    <b>About half the time </b>
                                </td>
                                <td width="60" valign="middle">
                                    <b>More than half the time </b>
                                </td>
                                <td width="60" valign="middle">
                                    <b>Almost always</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    a. Over the past month or so, how often have you had a sensation of not emptying
                                    your bladder completely after you finished urinating?
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
                                <td class="questionAnswerOption">
                                    5
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    b. Over the past month or so, how often have you had to urinate again less than
                                    two hours after you finished urinating?
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
                                <td class="questionAnswerOption">
                                    5
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    c. Over the past month or so, how often have you found you stopped and started again
                                    several times when you urinated?
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
                                <td class="questionAnswerOption">
                                    5
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    d. Over the past month or so, how often have you found it difficult to postpone
                                    urination?
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
                                <td class="questionAnswerOption">
                                    5
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    e. Over the past month or so, how often have you had a weak urinary stream?
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
                                <td class="questionAnswerOption">
                                    5
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    f. Over the past month or so, how often have you had to push or strain to begin
                                    urination?
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
                                <td class="questionAnswerOption">
                                    5
                                </td>
                            </tr>
                            <tr>
                                <td class="questionHeader">
                                    &nbsp;
                                </td>
                                <td width="60" valign="middle">
                                    <b>None </b>
                                </td>
                                <td width="60" valign="middle">
                                    <b>1 time </b>
                                </td>
                                <td width="60" valign="middle">
                                    <strong>2 times</strong>
                                </td>
                                <td width="60" valign="middle">
                                    <b>3 times </b>
                                </td>
                                <td width="60" valign="middle">
                                    <b>4 times </b>
                                </td>
                                <td width="60" valign="middle">
                                    <b>5 or more times </b>
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    g. Over the past month, how many times did you most typically get up to urinate
                                    from the time you went to bed at night until the time you got up in the morning?
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
                                <td class="questionAnswerOption">
                                    5
                                </td>
                            </tr>
                        </table>
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
                        <div class="bottomSpacer">
                            &nbsp;</div>

                        <script type="text/javascript">
                            if (!(bw.ie7 || bw.ie8)) {
                                document.write('<div class="bottomMedSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div>')
                            }
                        </script>

                    </td>
                </tr>
                <tr height="40">
                    <td valign="bottom">
                        <table class="footer">
                            <tr>
                                <td width="355" style="text-align: left;">
                                    Rev. 03/13/06
                                </td>
                                <td width="385" class="pageNumber" style="text-align: right;">
                                    11
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        
    
    <!-- Physical page 12 -->
    <div style="page-break-after: always;">
    <table height="900">
        <tr>
            <td valign="top">
                 <div class="topSpacer">&nbsp;</div>
        <div class="blockHeaderBlackBgBigFont">
            YOUR FEELINGS ABOUT PROSTATE CANCER
        </div>
        <br />
        <b>We would like to better understand how patients cope with aspects of their treatment
            for prostate cancer and the medical tests involved in their care.</b>
        <br />
        <br />
        <br />
        <div class="boxedQuestion">
            <ol start="31">
                <li>Listed below are a number of statements concerning a person’s beliefs about their
                    own health. In thinking about the past week, please indicate how much you agree
                    or disagree with each statement: Strongly Agree, Agree, Not Certain, Disagree, or
                    Strongly Disagree. Please circle the number of your answer.</li>
            </ol>
        </div>
        <table border="1" class="questionsGridR">
            <tr>
                <td width="434" class="questionHeader">
                    (Circle one number on each line.)
                </td>
                <td valign="top">
                    <b>Strongly Agree </b>
                </td>
                <td valign="top">
                    <b>Agree</b>
                </td>
                <td valign="top">
                    <b>Not Certain </b>
                </td>
                <td valign="top">
                    <b>Disagree</b>
                </td>
                <td valign="top">
                    <b>Strongly Disagree </b>
                </td>
            </tr>
            <tr>
                <td class="questionOption">
                    a. Because cancer is unpredictable, I feel I cannot plan for the future.
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
                    b. My fear of having my cancer get worse gets in the way of my enjoying life.
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
                    c. I am afraid of my cancer getting worse.
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
                    d. I will probably have a relapse (recurrence) within the next five years.
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
                    e. I am certain that I will be cured of cancer.
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
        <br />
        <br />
        <br />
        <br />
        <div class="boxedQuestion">
            <ol start="32">
                <li>If you could choose your treatment option again, which of the following would you
                    choose?</li>
            </ol>
        </div>
        <br />
        <table border="0" class="smallquestionsGridR">
            <tr>
                <td valign="top">
                    Radical Prostatectomy
                </td>
                <td>
                    ................................ 1
                </td>
                <td class="circleIns">
                    Circle one number.
                </td>
            </tr>
            <tr>
                <td valign="top">External Beam Radiotherapy</td>
                <td>
                    ................................ 2
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">Seed Implants (Brachytherapy)</td>
                <td>
                    ................................ 3
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">No Treatment/Watchful Waiting</td>
                <td>
                    ................................ 4
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">Other</td>
                <td>
                    ................................ 5
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">Cryotherapy</td>
                <td>
                    ................................ 6
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
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
                <div class="bottomSpacer">
                    &nbsp;</div>
                <div class="bottomSpacer">
                    &nbsp;</div>

                <script type="text/javascript">
                    if (!(bw.ie7 || bw.ie8)) {
                        document.write('<div class="bottomMedSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div><div class="bottomSpacer">&nbsp;</div>')
                    }
                </script>

            </td>
        </tr>
        <tr height="40">
            <td valign="bottom">
                <table class="footer">
                    <tr>
                        <td width="355" style="text-align: left;">
                            Rev. 03/13/06
                        </td>
                        <td width="385" class="pageNumber" style="text-align: right;">
                            12
                        </td>
                    </tr>
                        </table>
                    </td>
                </tr>
    </table>
           
    </div>
    
        <!-- Physical page 13 -->
        <div style="page-break-after: always;">
            <table height="900">
                <tr>
                    <td valign="top">
                        <div class="topSpacer">
                            &nbsp;</div>
                        <div class="blockHeaderBlackBgBigFont">
                            ADDITIONAL INFORMATION
                        </div>
                        <div class="boxedQuestion">
                            <ol start="33">
                                <li>Are you now working at a paying job? </li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    Yes, full time
                                </td>
                                <td>
                                    .................................................................. 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Yes, part time
                                </td>
                                <td>
                                    .................................................................. 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    No, but looking for a job
                                </td>
                                <td>
                                    .................................................................. 3
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    No, retired
                                </td>
                                <td>
                                    .................................................................. 4
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="34">
                                <li>Have you taken any of these medications during the LAST 4 WEEKS?</li>
                            </ol>
                        </div>
                        <table border="1" class="questionsGridR">
                            <tr>
                                <td class="questionHeader">
                                    <span class="tmrFont">(Please circle Yes ot No for evey item.)</span>
                                </td>
                                <td>
                                    <b>Yes</b>
                                </td>
                                <td>
                                    <b>No</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    a. Flutamide (Eulexin) or Casodex
                                </td>
                                <td class="questionAnswerOption">
                                    1
                                </td>
                                <td class="questionAnswerOption">
                                    0
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    b. Finasteride (Proscar) or Dutasteride (Avodart)
                                </td>
                                <td class="questionAnswerOption">
                                    1
                                </td>
                                <td class="questionAnswerOption">
                                    0
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    c. Cardura or Hytrin or Flomax
                                </td>
                                <td class="questionAnswerOption">
                                    1
                                </td>
                                <td class="questionAnswerOption">
                                    0
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    d. Anti-inflammatory medications like Motrin or Advil
                                </td>
                                <td class="questionAnswerOption">
                                    1
                                </td>
                                <td class="questionAnswerOption">
                                    0
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    e. Pyridium
                                </td>
                                <td class="questionAnswerOption">
                                    1
                                </td>
                                <td class="questionAnswerOption">
                                    0
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    f. Pain medications like Vicodin or Tylenol #3
                                </td>
                                <td class="questionAnswerOption">
                                    1
                                </td>
                                <td class="questionAnswerOption">
                                    0
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    g. Viagra, Cialis, Levitra or similar drug
                                </td>
                                <td class="questionAnswerOption">
                                    1
                                </td>
                                <td class="questionAnswerOption">
                                    0
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    h. USE urethral suppositories
                                </td>
                                <td class="questionAnswerOption">
                                    1
                                </td>
                                <td class="questionAnswerOption">
                                    0
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    i. Penile triple injection therapy
                                </td>
                                <td class="questionAnswerOption">
                                    1
                                </td>
                                <td class="questionAnswerOption">
                                    0
                                </td>
                            </tr>
                            <tr>
                                <td class="questionOption">
                                    j. Vacuum erection device
                                </td>
                                <td class="questionAnswerOption">
                                    1
                                </td>
                                <td class="questionAnswerOption">
                                    0
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <div class="boxedQuestion">
                            <ol start="35">
                                <li>Are you on Lupron, Zoladex or Eligard?</li>
                            </ol>
                        </div>
                        <br />
                        <table border="0" class="smallquestionsGridR">
                            <tr>
                                <td valign="top">
                                    Yes
                                </td>
                                <td>
                                    .................................................................. 1
                                </td>
                                <td class="circleIns">
                                    Circle one number.
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    No
                                </td>
                                <td>
                                    .................................................................. 2
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                                <div class="bottomSpacer">&nbsp;</div>
                    </td>
                </tr>
                <tr height="40">
                    <td valign="bottom">
                        <table class="footer">
                            <tr>
                                                                <td width="355" style="text-align: left;">
                                    Rev. 03/13/06
                                </td>
                                <td width="385" class="pageNumber" style="text-align: right;">
                                    13
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    
    <!-- Physical page 14 -->
    <div style="page-break-after: always;">
        <table height="900">
            <tr>
                <td valign="top">
                    <div class="topSpacer">
                        &nbsp;</div>
                    <div class="blockHeaderWhiteBgBigFont" style="text-align: center;">
                        Past Medical History Checklist
                    </div>
                    <div class="instructions" style="text-align: center;">
                        Please check all conditions you currently have or have had in the past.
                    </div>
                    <table border="1" class="questionsGridR">
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                1. Diabetes
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                2. Heart Attack
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                3. Angina (chest pain)
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                4. Congestive heart failure
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                5. Hypertension (high blood pressure)
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                6. Stroke
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                7. Amputation
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                8. Circulation problems (peripheral vascular disease, blood clots)
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                9. Chronic Lung Disease(COPD,Asthma,Emphysema)
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                10. Ulcers (stomach)
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                11. Inflammatory bowel disease (Crohn&rsquo;s disease, ulcerative colitis)
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                12. Kidney failure
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                13. Major depression
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                14. Seizures
                            </td>
                        </tr>
                        <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                15. Other ongoing medical problems you feel may interfere with your quality of life
                                ___________________________
                            </td>
                        </tr>
                                               <tr>
                            <td class="questionAnswerOption">
                                &nbsp;
                            </td>
                            <td class="questionOption">
                                16. No Change Since Last Survey
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <div class="blockHeaderWhiteBgBigFont">
                        <b>Comments: </b>
                        <br />
                        <br />
                        <br />
                         <br />
                    </div>
                    <div class="bottomSpacer">
                        &nbsp;</div>
                    <div class="boxedQuestion" style="text-align: center; font-weight: normal;">
                        <b>Please place this survey in the enclosed envelope and drop it in the mail.
                            <br />
                            Thank you for your participation!</b>
                        <br />
                        <span class="tmrFont">Call 757- 457-5165 with any questions.</span>
                    </div>
                </td>
            </tr>
            <tr height="40">
                <td valign="bottom">
                    <table class="footer">
                        <tr>
                                                            <td width="355" style="text-align: left;">
                                Rev. 03/13/06
                            </td>
                            <td width="385" class="pageNumber" style="text-align: right;">
                                14
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>

    <!-- Physical page 15 -->
    <!-- Left Intentionally Blank -->
        <div class="BlankPageText">
            ------------------------------- Left Intentionally Blank -------------------------------              
        </div>
        </div>
</body>
</html>
