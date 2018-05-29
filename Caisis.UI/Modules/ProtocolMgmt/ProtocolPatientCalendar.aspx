<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProtocolPatientCalendar.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.ProtocolPatientCalendar" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="unp" TagName="AddUnplannedEvent" Src="AddUnplannedEvent.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VisitCalendar</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="StyleSheets/ProtocolMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">  
    /* <![CDATA[ */
           
		function highlightCell(cell) {
			if (cell.className == "day") {
				cell.className = "anticipated";
			} else if (cell.className == "otherMonthDay") {
				cell.className = "otherAnticipated";
			} else if (cell.className == "selectedDay") {
				cell.className = "selectedAnticipated";
			}
		}
		
		// set cell back to the original style
		function resetCell(cell) {
			if (cell.className == "otherAnticipated") {
				cell.className = "otherMonthDay";
			} else if (cell.className == "anticipated") {
				cell.className = "day";
			} else if (cell.className == "selectedAnticipated") {
				cell.className = "selectedDay";
			}
		}
		
		function modDates(dateArray, modFunction) {
			for (i = 0; i < dateArray.length; i++) {
				var cell = $(dateArray[i]);
				if (cell != null) {
					modFunction(cell);
				}
			}
		}
		
		// alert users no patients have been assigned
		function NoPatientsMsg() {
			alert('No patients are currently assigned to this schema.\nYou may add patients by using the button on the top right of the calendar.');
		}
		
		
        // check if item is deviation or standard visit
        function loadPatientItem(patientItemId, deviationTable, deviationKey)
        {
            if(deviationTable!=null && deviationKey!=null && window.loadUnplannedVisistItem)
            {
               var itemLoaded = loadUnplannedVisistItem(patientItemId, deviationTable, deviationKey);
               if(itemLoaded)
               {
                    return;
               }
            }
            parent.loadPatientItem(patientItemId,'ProtocolPatientCalendar');
            return;
        }
        
        // loads the date of the selected month and year into the calendar
        function loadSelectedDate() {
            var month = $('<%= ddlMonth.ClientID %>');
            var year = $('<%= ddlYear.ClientID %>');
            var selectedMonth = month.options[month.selectedIndex].value;
            var selectedYear = year.options[year.selectedIndex].value;
            var url = '<%= GetQueryString("ProtocolPatientCalendar.aspx") %>' + '&year=' + selectedYear + '&month=' + selectedMonth;
            window.location = url;
        }
		
     /* ]]> */
    </script>

    <style type="text/css">
        .CalendarDropDown
        {
            font-size: 13px;
            color: #3D556D;
            font-weight: bold;
            border: solid 1px #bbbbbb;
        }
    </style>
</head>
<body id="pageBody" runat="server" style="background-color: #ffffff;">
    <form id="form1" runat="server">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td align="center" valign="middle" height="100%">
                <table border="0" cellpadding="0">
                    <tr>
                        <td colspan="2">
                            <div style="padding-top: 0px; vertical-align: top;">
                                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; margin-left: 60px;">
                                    <tr>
                                        <td style="width: auto; text-align: center; vertical-align: bottom;">
                                            <asp:HyperLink runat="server" ID="PreviousYearBtn" ToolTip="Previous Year" ImageUrl="~/Modules/ProtocolMgmt/Images/Button_DoubleLeftArrow.png" />
                                            <asp:HyperLink runat="server" ID="PreviousMonth" AlternateText="Previous Month" ToolTip="Previous Month"
                                                ImageUrl="~/Modules/ProtocolMgmt/Images/Button_LeftArrow.png" />
                                            <cic:CaisisSelect ID="ddlMonth" runat="server" ShowLabel="false" CssClass="CalendarDropDown"
                                                onchange="loadSelectedDate();">
                                            </cic:CaisisSelect>
                                            <cic:CaisisSelect ID="ddlYear" runat="server" ShowLabel="false" CssClass="CalendarDropDown"
                                                onchange="loadSelectedDate();">
                                            </cic:CaisisSelect>
                                            <asp:HyperLink runat="server" ID="NextMonth" AlternateText="Next Month" ToolTip="Next Month"
                                                ImageUrl="~/Modules/ProtocolMgmt/Images/Button_RightArrow.png" />
                                            <asp:HyperLink runat="server" ID="NextYearBtn" ToolTip="Next Year" ImageUrl="~/Modules/ProtocolMgmt/Images/Button_DoubleRightArrow.png" />
                                        </td>
                                        <td style="width: 150px;">
                                            <div id="PatientCalendarButtons" runat="server" style="display: inline; float: right;">
                                                <unp:AddUnplannedEvent runat="server" ID="AddUnplannedEvent" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <asp:Calendar ID="ProtocolCalendar" runat="server" ShowGridLines="false" CellPadding="1"
                                OnDayRender="ProtocolCalendar_DayRender" ShowNextPrevMonth="True" CssClass="calendar"
                                BackColor="#ffffff" OnVisibleMonthChanged="ProtocolCalendar_VisibleMonthChanged"
                                ShowTitle="false">
                                <OtherMonthDayStyle CssClass="otherMonthDay" />
                                <TitleStyle CssClass="calendarTitle" />
                                <NextPrevStyle CssClass="calendarTitle" />
                                <DayStyle CssClass="day" />
                                <DayHeaderStyle CssClass="dayTitle" />
                                <DayStyle HorizontalAlign="Left" VerticalAlign="Top" Width="130" />
                                <SelectedDayStyle CssClass="selectedDay" />
                                <TodayDayStyle CssClass="selectedDay" />
                            </asp:Calendar>

                            <script type="text/javascript">
                                /* <![CDATA[ */
                                // supress calendar tooltip
                                if ($('ProtocolCalendar')) { $('ProtocolCalendar').title = ''; }
                                /* ]]> */
                            </script>

                            <img id="CalendarKeyImg" alt="Item Status" runat="server" src="Images/Key_ItemStatus.png"
                                style="float: left; margin-top: 2px;" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <input type="hidden" id="ProtocolId" name="ProtocolId" runat="server" />
    </form>
</body>
</html>
