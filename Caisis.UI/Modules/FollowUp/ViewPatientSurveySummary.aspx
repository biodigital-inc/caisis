<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewPatientSurveySummary.aspx.cs"
    Inherits="Caisis.UI.Modules.FollowUp.Modules_FollowUp_ViewPatientSurveySummary" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>View Patient Survey Summary</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio 7.0" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <script type="text/javascript">  
        /*function enterSurveyData(actionId, surveyType)
	    {           
            var page = "EnterSurveyResponses.aspx?surveyType=" + surveyType;
            var url = window.location.href;
            url = url.substr(0,url.lastIndexOf("/")) + "/" + page;
            
            var config = new ModalConfig();
            config.closeHandler = hideSpecimenInfo; 
            config.showPrint=false;
            config.width = '900px';
            showModalWithConfig(url,'Enter Survey Responses',config);
              //alert(surveyType + " -- " + actionId);
	    }*/
	    
	    function hideSpecimenInfo() { document.Form1.submit(); }
	    
	    function enterSurveyResponses(sType, month)
	    {
	        var surveyURL = '<%= Page.ResolveUrl("~/Plugins/SurveyPlugin/SurveyWizardPage.aspx?surveyType=") %>' + sType + '&month=' + month + '&readOnly=true&viewType=Short&saveActionItem=true&SurveyDate=' + escape('<%= DateTime.Now.ToShortDateString() %>') + '&SurveyDateText=' + escape('<%= DateTime.Now.ToShortDateString() %>');
	        var title = 'Enter Survey Responses';
	        top.showModalWithConfig(surveyURL, title, { width: '80%', height: '80%', context: window });
	    }
	    
	    function viewSurveyResponses(surveyId)
	    {
	        //SurveyPrintablePage.aspx?surveyId=1234
	        var surveyURL = '<%= Page.ResolveUrl("~/Plugins/SurveyPlugin/SurveyPrintablePage.aspx?surveyId=") %>' + surveyId;
	        var title = 'View Survey Responses';
	        top.showModalWithConfig(surveyURL, title, { width: '80%', height: '80%', context: window });
	    }
	    
	    // After popup Survey saved, this function is called
	    function onSurveySave(sId)
	    {
	        top.hideModal();
	        setTimeout(function() { window.location = window.location; }, 250);
	        // true to close window, else false to leave open
	        
	        return true;
	    }
	    
	    function confirmSelected()
	    {
	        var dd = $("SurveyDD");
	        var stype = dd.value;
	        if(dd.value == "")
	        { 
	            alert('Please select a survey type first.');
	            return false;
	        }
	        else { return true; }
	    }
	    
    </script>

    <style type="text/css">
        .DataEntryRow input { width:20px; }
        .LabelName { width:20px; padding-right:5px; }
        .DateText { width:80px; margin:5px; }
        .TimesText { width:50px; margin:5px; }
        .NoLabel { width:0px; height:0px; display:none; } 
        .Heading { background-color:#00668d; color:#ffffff; text-align:center;}
        .SurveyGroup0 { background-color:#dedede; }
        .SurveyGroup1 { background-color:#cccccc; }
        .SurveyGroup2 { background-color:#aaaaaa; }
        .SurveyGroup3 { background-color:#888888; }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server" defaultfocus="collectionName">
        <div>
            <table width="940" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                    <td width="57" valign="top">
                        <a href="FollowUpSplash.aspx">
                            <img border="0" src="../../Images/GoToSurveysStartPage.jpg" width="57" height="45"
                                vspace="3"></a>
                    </td>
                    <td>
                        <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f8fafc">
                            <tr>
                                <td height="15" align="center">
                                    <img src="../../Images/shim.gif" width="1" height="1"></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table id="SearchLayer" runat="server" width="760" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td height="30" valign="top" align="left">
                                                <asp:Label ID="ResultsTitle" runat="server" CssClass="ListManTitle">Patient Surveys for </asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" height="30">
                                                Contact Status <cc:CaisisTextBox ID="Status" runat="server" Enabled="false" ShowLabel="false" 
                                                     Width="90"></cc:CaisisTextBox>
                                                &nbsp; &nbsp; &nbsp;
                                                DOS <cc:CaisisTextBox ID="DOS" runat="server" Enabled="false" ShowLabel="false" 
                                                     Width="75"></cc:CaisisTextBox>
                                                &nbsp; &nbsp;
                                                Procedure <cc:CaisisTextBox ID="ProcedureName" runat="server" Enabled="false" ShowLabel="false"
                                                    ></cc:CaisisTextBox>
                                                &nbsp; &nbsp; &nbsp;
                                                Survey Type <cc:CaisisSelect ID="SurveyDD" runat="server" ShowLabel="false" DataTextField="SurveyType" Enabled="true" 
                                                   ></cc:CaisisSelect> 
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <table width="760" border="0" cellpadding="0" cellspacing="0" class="ListManDataTableOuterBorder">
                                                    <thead>
                                                        <tr>
                                                            <td width="100" class="Heading">
                                                                Survey</td>
                                                            <td width="145" class="Heading">
                                                                Due</td>
                                                            <td width="145" class="Heading">
                                                                Sent</td>
                                                            <td width="90" class="Heading">
                                                                Times</td>
                                                            <td width="145" class="Heading">
                                                                Completed</td>
                                                            <td width="475" class="Heading">
                                                                Enter Data / Print</td>
                                                        </tr>
                                                    </thead>
                                                </table>
                                                <%--<div id="PDFormDiv" style="overflow-y: auto; overflow-x: hidden; min-height: 250px; width: 760px;
                                    border: solid 1px #999999; background-color: #ffffff;">--%>
                                                <table width="760" border="0" cellpadding="0" cellspacing="0" class="ListManDataTableOuterBorder">
                                                    <tbody>
                                                        <asp:Repeater runat="server" ID="MyRptr" OnItemDataBound="SetDates" OnItemCommand="HandleItemClick">
                                                            <ItemTemplate>
                                                                <tr id="surveyRow" runat="server">
                                                                    <td style="width: 140px; text-align:center;">
                                                                        <asp:HiddenField ID="MonthNumber" runat="server" />
                                                                        <%# Eval("MonthName")%>
                                                                    </td>
                                                                    <td style="width: 100px;">
                                                                        <cc:CaisisTextBox ID="dd_month" runat="server" CssClass="DateText" LabelClass="NoLabel"
                                                                            Enabled="False" Value='<%# Eval("DueDate") %>'></cc:CaisisTextBox>
                                                                    </td>
                                                                    <td style="width: 100px;">
                                                                        <cc:CaisisTextBox ID="sd_month" runat="server" CssClass="DateText" LabelClass="NoLabel"
                                                                            Enabled="False" Value='<%# Eval("SentDate") %>'></cc:CaisisTextBox>
                                                                    </td>
                                                                    <td style="width:80px;">
                                                                        <cc:CaisisTextBox ID="times_month" runat="server" CssClass="TimesText" LabelClass="NoLabel"
                                                                            Enabled="False" Value='<%# Eval("TimesSent") %>'></cc:CaisisTextBox>
                                                                    </td>
                                                                    <td style="width: 100px;">
                                                                        <cc:CaisisTextBox ID="cd_month" runat="server" CssClass="DateText" LabelClass="NoLabel"
                                                                            Enabled="False" Value='<%# Eval("CompletedDate") %>'></cc:CaisisTextBox>
                                                                    </td>
                                                                    <td style="padding-left: 10px; width: 560px; text-align: left;">
                                                                        <asp:ImageButton runat="server" ID="PrintBtn" OnClientClick="return confirmSelected();" CommandName="Print" ImageUrl="~/Modules/FollowUp/Images/print-surveys.gif" ToolTip="Print Survey" />
                                                                        &nbsp;&nbsp;
                                                                        <asp:ImageButton runat="server" ID="EnterBtn" Visible="false" ImageUrl="~/Modules/FollowUp/Images/enter-responses.gif"
                                                                            ToolTip="Enter Survey Responses" />
                                                                        <asp:ImageButton runat="server" ID="ViewBtn" Visible="false" ImageUrl="~/Modules/FollowUp/Images/view-responses.gif"
                                                                            ToolTip="View Survey Responses" />
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                            <SeparatorTemplate>
                                                                <tr>
                                                                    <td colspan="6" class="ListManDataTableDottedLine" style="cursor: default; height: 1px;">
                                                                    </td>
                                                                </tr>
                                                            </SeparatorTemplate>
                                                        </asp:Repeater>
                                                        <!-- Message - Search Returns Empty -->
                                                        <tr id="noResultsRow" runat="server" class="ListManDataTableRow" valign="middle"
                                                            visible="false" style="cursor: default;">
                                                            <td colspan="6" style="height: 275px; text-align: center; font-size: 13px; color: #8d2a2c;">
                                                                <asp:Label ID="noRecordsFound" runat="server">&nbsp;</asp:Label>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <%--</div>--%>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
            </table>
    </form>
</body>
</html>
