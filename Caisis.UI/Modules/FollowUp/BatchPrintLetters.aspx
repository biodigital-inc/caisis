<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BatchPrintLetters.aspx.cs"
    Inherits="Caisis.UI.Modules.FollowUp.Modules_FollowUp_BatchPrintLetters" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="val" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <script type="text/javascript">

  	    function confirmExport()
	    {
	        var response=confirm('Are you SURE you want to export results to excel that contains patient identifiers?');
	        if(response==true){return true;}
	        else{return false;}	        
	    }
    </script>

    <style type="text/css">
        .LabelName { width:20px; padding-right:5px; }
        .NoLabel { width:0px; height:0px; display:none; } 
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="940" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                    <td width="57" valign="top">
                        <a href="FollowUpSplash.aspx"><img border="0" src="../../Images/GoToSurveysStartPage.jpg" width="57" height="45" vspace="3"></a>
	                </td>
                    <td>
                        <table width="700" align="center" style="margin-top: 25px;">
                            <tr>
                                <td width="100%">
                                    <asp:Label ID="ResultsTitle" runat="server" CssClass="ListManTitle">Batch Print Letters Due</asp:Label>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" nowrap>
                                    <span class="LabelName">Survey Type:</span>
                                    <custom:CaisisSelect ID="ddlSurveyType" runat="server" LookupCode="PtContactStatus,FollowUpType,Survey" LabelClass="NoLabel" AutoPostBack="False" Width="175"></custom:CaisisSelect>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <span class="LabelName">Process Date:</span>
                                    <custom:CaisisTextBox ID="ProcessDate" ShowCalendar="true" runat="server" LabelClass="NoLabel"></custom:CaisisTextBox>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="LabelName">Procedure:</span>
                                    <custom:CaisisSelect ID="ProcedureType" runat="server" LabelClass="NoLabel" AutoPostBack="False" Width="150" LookupCode="ProcName,ModuleDefault,FollowUp"></custom:CaisisSelect>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:ImageButton ID="SubmitBtn" runat="server" ImageUrl="~/Images/buttonSubmit.gif" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top: 20px;">
                                        <tr>
                                            <td style="background-color: #F1F7FC; width: 5px;">
                                                <img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5" /></td>
                                            <td colspan="4" class="ListManagerBGTableTop">
                                                <img src="../../Images/shim.gif" width="10" height="5" /></td>
                                            <td style="background-color: #F1F7FC; width: 5px;">
                                                <img src="../../Images/ListManCornerTopRight.gif" width="5" height="5" /></td>
                                        </tr>
                                        <tr>
                                            <td class="ListManBGTableLeftSide" style="width: 1px;"></td>
                                            <td colspan="4" align="right" style="background-color: #F1F7FC;">
                                                  <div style="float: right; padding-right: 40px">
                                                    <val:ExcelExportImageButton ID="ExcelBtn" runat="server" OnClientClick="return confirmExport();"
                                                        OnClick="ExportToExcelClick" />
                                                </div>                                              
                                            </td>
                                            <td class="ListManBGTableRightSide" style="width: 1px;">&nbsp;</td>
                                        </tr>

                                        <!-- Patient List Panel -->
                                        <tr style="background-color: #F1F7FC;">
                                            <td class="ListManBGTableLeftSide" style="width: 5px;">
                                            </td>
                                            <td colspan="4" align="center" style="padding-bottom: 3px;">
                                                <asp:Panel ID="specimensPanel" Visible="true" runat="server" Style="position: relative;
                                                    width: 760px;">
                                                    <table id="resultsTitles" width="763" border="0" cellpadding="1" cellspacing="0"
                                                        class="ListManDataTableOuterBorder" runat="server">
                                                        <tr>
                                                            <%-- <td style="width: 20px;" class="ListManDataTableTop">
                                                           <asp:CheckBox title="check/uncheck all patients" ID="checkAll" onclick="CheckAll(this);"
                                                        runat="server" name="checkAll" /></td>--%>
                                                            <td style="width: 150px; text-align: center;" class="ListManDataTableTop">
                                                                <span>Patient Name</span>
                                                                <%-- <asp:LinkButton ID="PtName" runat="server" Text="Patient Name" Font-Underline="true"
                                                            OnCommand="SortRecords" CommandName="PtName" ToolTip="Patient Name">
                                                        </asp:LinkButton>--%>
                                                            </td>
                                                            <td style="width: 100px;" class="ListManDataTableTop">
                                                                <span>Patient MRN</span>
                                                                <%-- <asp:LinkButton ID="PtMRN" runat="server" Font-Underline="true" Text="MRN" OnCommand="SortRecords"
                                                            CommandName="PtMRN" ToolTip="MRN">
                                                        </asp:LinkButton>--%>
                                                            </td>
                                                             <td style="width: 125px;" class="ListManDataTableTop">
                                                                <span title="This is the patients most recent Treating Physician">Treating<br/>Physician</span>
                                                            </td>
                                                            <td style="width: 75px;" class="ListManDataTableTop">
                                                                <span>Follow Up Month</span>
                                                                <%--          <asp:LinkButton ID="FollowUpMonth" runat="server" Text="Follow Up Month" Font-Underline="true"
                                                            OnCommand="SortRecords" CommandName="FollowUpMonth" ToolTip="Follow Up Month">
                                                        </asp:LinkButton>--%>
                                                            </td>
                                                            <td style="width: 175px;" class="ListManDataTableTop">
                                                                <span>Survey</span>
                                                                <%-- <asp:LinkButton ID="Survey" runat="server" Text="Survey" Font-Underline="true" OnCommand="SortRecords"
                                                            CommandName="Survey" ToolTip="Survey">
                                                        </asp:LinkButton>--%>
                                                            </td>
                                                            <td style="width: 75px;" class="ListManDataTableTop">
                                                                <span>Sent Date</span>
                                                                <%-- <asp:LinkButton ID="SurveyDueDate" runat="server" Text="Due Date" Font-Underline="true"
                                                            OnCommand="SortRecords" CommandName="SurveyDueDate" ToolTip="Survey Due Date">
                                                        </asp:LinkButton>--%>
                                                            </td>
                                                           
                                                        </tr>

                                                    </table>
                                                    <!-- Content - Results Table -->
                                                    <div id="PDFormDiv" style="overflow-y: auto; overflow-x: hidden; height: 300px; width: 760px;
                                                        border: solid 1px #999999; background-color: #ffffff;">
                                                        <table id="patientsTable" width="760" cellspacing="0" cellpadding="1" border="0">
                                                            <asp:Repeater ID="rptFollowUpList" runat="server">
                                                                <ItemTemplate>
                                                                    <tr id="listRow" class="ListManDataTableRow" align="center" style="vertical-align: middle;">
                                                                        <td style="width: 150px; text-align: left; padding-left: 10px;" class="ListManDataTableCell">
                                                                            <span>
                                                                                <%# Eval("PtName") %>
                                                                            </span>
                                                                        </td>
                                                                        <td style="width: 100px;" class="ListManDataTableCell">
                                                                            <span>
                                                                                <%# Eval("PtMRN") %>
                                                                            </span>
                                                                        </td>
                                                                         <td style="width: 150px;" class="ListManDataTableCell">
                                                                            <span>
                                                                                <%# Eval("Surgeon")%>
                                                                            </span>
                                                                        </td>
                                                                        <td style="width: 75px;" class="ListManDataTableCell">
                                                                            <span>
                                                                                <%# Eval("FUMonth")%>
                                                                            </span>
                                                                        </td>
                                                                        <td style="width: 200px;" class="ListManDataTableCell">
                                                                            <span>
                                                                                <%# Eval("SurveyName")%>
                                                                            </span>
                                                                        </td>
                                                                        <td style="width: 75px;" class="ListManDataTableCell">
                                                                            <span>
                                                                                <%# Eval("SentDate") %>
                                                                            </span>
                                                                        </td>
                                                                        <%--  <td width="150" align="left">
                                                                    <select name="" id="">
                                                                        <option value="none" selected="selected">--- None --- </option>
                                                                        <asp:Repeater ID="ddlSurveys" runat="server" DataSourceID="SurveyRegistry" OnItemDataBound="SetOptionNameAndValue">
                                                                            <ItemTemplate>
                                                                                <option runat="server" id="SurveyFormOption"></option>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </select>
                                                                </td>--%>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <SeparatorTemplate>
                                                                    <tr>
                                                                        <td colspan="12" class="ListManDataTableDottedLine" style="cursor: default; height: 5px;">
                                                                        </td>
                                                                    </tr>
                                                                </SeparatorTemplate>
                                                                <FooterTemplate>
                                                                    <tr>
                                                                        <td colspan="12" class="ListManDataTableDottedLine" style="cursor: default; height: 5px;">
                                                                        </td>
                                                                    </tr>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                            <!-- Message - Search Returns Empty -->
                                                            <%--<tr id="noPatientsRow" runat="server" class="ListManDataTableRow" valign="middle"
                                                        visible="false" style="cursor: default;">
                                                        <td colspan="4" style="height: 325px; text-align: center; font-size: 13px; color: #8d2a2c;">
                                                            <asp:Label ID="noRecordsFound" runat="server">No patients have surveys due.</asp:Label>
                                                        </td>
                                                    </tr>--%>
                                                        </table>
                                                    </div>
                                                </asp:Panel>
                                            </td>
                                            <td class="ListManBGTableRightSide" style="width: 5px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="ListManBGTableLeftSide" style="width: 1px;"></td>
                                            <td colspan="4" align="center" style="background-color: #F1F7FC;">
                                                <span class="TableNotes" style="margin:7px 7px 7px 10px;">
                                                    Letters Due for
                                                    <asp:Literal ID="NumSurveyPatients" runat="server"></asp:Literal> Patients
                                                </span>
                                            </td>
                                            <td class="ListManBGTableRightSide" style="width: 1px;">&nbsp;</td>
                                        </tr>
                                        
                                        <!-- Rounded Bottom Border -->
                                        <tr>
                                            <td style="background-color: #F1F7FC; width: 5px;">
                                                <img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5" /></td>
                                            <td colspan="4" class="ListManagerBGTableBottom">
                                                <img src="../../Images/shim.gif" width="10" height="5" /></td>
                                            <td style="background-color: #F1F7FC; width: 5px;">
                                                <img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="1" align="right">
                                    <img id="CreateBatchButton" runat="server" src="../../Images/PrintFULettersForThisList.gif" style="cursor:pointer;" title="Print Follow Up Letters for this List"  alt="Print Follow Up Letters for this List" 
                                        hspace="30" vspace="6" border="0" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
