<%@ Page language="c#" Inherits="Caisis.UI.Core.PatientLists.PatListContent" CodeFile="PatListContent.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.ListPage" %>
<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="../Help/helpToolTip.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>Patient List Content</title>
		<link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
		<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
		<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
		<script src="../../ClientScripts/Help.js" type="text/javascript"></script>
        <script type="text/javascript">
        /* <![CDATA[ */

			var onPatientList = true;
			// functions set in codebehind to display a summary of form status if there is one
			function showStatusSummary(summary)
			{
				document.getElementById("FormStatusSummary").innerHTML  = summary;
				document.getElementById("FormStatusSummary").style.visibility = 'visible';
			}
			function hideStatusSummary()
			{
				document.getElementById("FormStatusSummary").innerHTML  = '';
				document.getElementById("FormStatusSummary").style.visibility = 'hidden';
			}
			Browser.ResizeFrame({ heightOffset: 125 });
			Browser.ResizeElement({ nodeId: 'MainHeightTd', heightOffset: 250 }, { nodeId: 'PDFormDiv', heightOffset: 260 });
			
			// position arrows under menu items on load and resize
			Browser.ResizeElement({ customResizer: setArrowPositioning });

			// positions arrows underneath corresponding menu items
			function setArrowPositioning() {
			    // container of arrows
			    var arrows = document.getElementById('Arrows');
			    // main menu
			    var menu = window.parent.document.getElementById('menu');
			    if (arrows && menu) {
			        var arrowItems = arrows.getElementsByTagName('IMG');
			        var menuItems = menu.childNodes;
			        for (var i = 0, aIndex = 0; i < menuItems.length; i++) {
			            var menuItem = menuItems[i];
			            // if top level LI
			            if (menuItem.nodeName == 'LI') {
			                // get arrow which matches menu item
			                var arrow = arrowItems[aIndex];
			                if (arrow) {
			                    var left = getLeftPos(menuItem);
			                    var width = menuItem.offsetWidth;
			                    var position = left + ((width - arrow.offsetWidth) / 2);
			                    arrow.style.left = position + 'px';
			                    aIndex++;
			                }
			            }
			        }
			    }
			}

            function confirmClinicPatientDelete(url, e) {
                var doDelete = "Are you sure you would like to remove this patient from this Clinic List?";
                // if deleteing, do ajax delete
                if(confirm(doDelete)) {
                    AjaxManager.MakeRequest("GET", url, new Param(), reloadPage, true);                    
                }
                // prevent bubbling
                stopBubble(e);
                return false;
            }

            function reloadPage() {
                window.location = window.location;
            }

    /* ]]> */
        </script>

    </head>
<body>
    <div id="patientListSplashLayer" style="border-right: #000000 1px; border-top: #000000 1px; z-index: 7; left: 0px; visibility: visible; border-left: #000000 1px; background-color: #f8fafc; border-bottom: #000000 1px; position: absolute; top: 0px;" visible="false" runat="server" align="left">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
            <tr>
                <td valign="top" align="left">
                    <div id="Arrows" style="height: 17px;">
                        <img src="../../Images/UpArrow.gif" alt="Select an item from the menu above" width="11"
                            height="17" style="position: absolute; left: 240px;" />
                        <img src="../../Images/UpArrow.gif" alt="Select an item from the menu above" width="11"
                            height="17" style="position: absolute; left: 330px;" />
                        <img src="../../Images/UpArrow.gif" alt="Select an item from the menu above" width="11"
                            height="17" style="position: absolute; left: 420px;" />
                        <img src="../../Images/UpArrow.gif" alt="Select an item from the menu above" width="11"
                            height="17" style="position: absolute; left: 510px;" />
                        <img src="../../Images/UpArrow.gif" alt="Select an item from the menu above" width="11"
                            height="17" style="position: absolute; left: 595px;" />
                        <img src="../../Images/UpArrow.gif" alt="Select an item from the menu above" width="11"
                            height="17" style="position: absolute; left: 685px;" />
                        <img src="../../Images/UpArrow.gif" alt="Select an item from the menu above" width="11"
                            height="17" style="position: absolute; left: 770px;" />
                        <img src="../../Images/UpArrow.gif" alt="Select an item from the menu above" width="11"
                            height="17" style="position: absolute; left: 880px;" />
                    </div>
                    <div style="margin-left: 260px; width: 540px; text-align: center; padding-top: 10px;">
                        <asp:Label ID="splashMessage" CssClass="PatientListSplashMsg" runat="server">Please select a list from the menus above to begin.</asp:Label>
                    </div>
                    <%--			<img id="pageCoverImage" runat="server" src="../../Images/shim.gif" width="142" height="700">
--%>
                </td>
            </tr>
	</table>
	</div>
	<form id="dataForm" method="post">
	
	<table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" bgcolor="f8fafc">
	    <tr> 
		    <td height="15" align="center"><img src="../../Images/shim.gif" width="1" height="1"></td>
	    </tr>
	    <tr> 
		    <td align="center"> 
		    <table id="PatContentLayer" runat="server" width="760" border="0" cellspacing="0" cellpadding="0">
			    <tr> 
				    <td colspan="5" height="30" class="ListManTitle" valign="bottom"><img id="BatchPrintButton" runat="server" src="../../Images/PrintFormsForThisList.gif" width="162" height="23" border="0" align="right" onClick="top.location='../PaperForms/Forms.aspx?FormPage=BatchPrint';" style="cursor:hand;"><%= listTitle%>	<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script><img src="../../Images/shim.gif" width="12" height="1" /><img id="clinicDateCal" runat="server" src="../../Images/Calendar/cal.png" border="0" alt="Enter Clinic Date" align="absMiddle" class="pdFormFieldButtonOn" /><input type="hidden" ID="clinicDate" class="pdFormField" runat="server" NAME="clinicDate">
				    </td>
				    <td class="TableNotes">&nbsp;</td>
			    </tr>
    	         
			    <tr> 
			    <td colspan="6"><img src="../../Images/shim.gif" width="10" height="8"></td>
			    </tr>
			    <tr> 
			    <td bgcolor="f1f7fc"><img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
			    <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="10" height="5"></td>
			    <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="20" height="5"></td>
			    <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="320" height="5"></td>
			    <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="400" height="5"></td>
			    <td bgcolor="f1f7fc"><img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
			    </tr>
			    <tr> 
			    <td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			    <td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="8"></td>
			    <td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			    </tr>
			    <tr> 
			    <td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			    <td colspan="2" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="1" height="1"></td>
			    <td class="ListManBGTableBody">Click a record below to view data for that patient.</td>
			    <td class="ListManBGTableBody" align="right" valign="middle" height="1"><span class="TableNotes"><%--- <a href="#" class="ListManBGTableBody"><img src="../../Images/AddPatientToThisList.gif" hspace="31" width="151" height="21" border="0" title="Add Patients to Clinic List by MRN" alt="Add Patients to Clinic List"></a> ---%>
					    <% if (recordCount > 200)
            {%>
						    <%if (startRow > 0)
            {%>
							    <a id="previous" href="PatListContent.aspx?startRow=<%= startRow-200 %>&sortColumn=<%= sortColumn%>"><img src="../../Images/PatientListPrevious.gif" border="0" width="46" height="10" align="middle"></a><img src="../../Images/shim.gif" width="6" height="1">
						    <%}%>
						    <%= recordMemo%>
						    <%if (recordCount > (startRow + 200))
            {%>
							    <img src="../../Images/shim.gif" width="6" height="1"><a id="next" href="PatListContent.aspx?startRow=<%= startRow+200%>&sortColumn=<%= sortColumn%>" class="TableNotes"><img src="../../Images/PatientListNext.gif" border="0" width="28" height="10" align="middle"></a>
						    <%}%>
					    <% } %>
					    <% else
{%>
						    <%= recordMemo%>
					    <% } %>
					    </span><img src="../../Images/shim.gif" width="30" height="1"></td>
			    <td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			    </tr>
			    <tr> 
			    <td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			    <td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="8"></td>
			    <td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			    </tr>
			    <tr> 
			    <td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			    <td colspan="2" class="ListManBGTableBody">&nbsp;</td>
			    <td colspan="2" valign="top" class="ListManBGTableBody">
    				
				    <table id="patientListTableTitles" width="692" border="0" cellpadding="4" cellspacing="0" class="ListManDataTableOuterBorder"  runat="server">
                      <tr> 
                        <td width="225" class="ListManDataTableTop" style="TEXT-ALIGN: left">&nbsp;&nbsp;<a href="PatListContent.aspx?sortColumn=ptLastName">Name</a></td>
                        <td width="75" class="ListManDataTableTop">D.O.B.</td>
                        <td width="100" class="ListManDataTableTop"><a href="PatListContent.aspx?sortColumn=ptMRN">MRN</a></td>
                        <td width="290" class="ListManDataTableTop">Comments</td>
                      </tr>
                     </table>
                     
                     <table id="missedPendingTableTitles" width="692" border="0" cellpadding="4" cellspacing="0" class="ListManDataTableOuterBorder"  runat="server">
                      <tr> 
                        <td width="225" class="ListManDataTableTop" style="TEXT-ALIGN: left">&nbsp;<a href="PatListContent.aspx?sortColumn=ptLastName">Name</a></td>
                        <td width="75" class="ListManDataTableTop">D.O.B.</td>
                        <td width="100" class="ListManDataTableTop"><a href="PatListContent.aspx?sortColumn=ptMRN">MRN</a></td>
                        <td width="290" class="ListManDataTableTop" style="TEXT-ALIGN: left">&nbsp;Items</td>
                      </tr>
                     </table>
    				
				    <table id="clinicListTableTitles" width="692" border="0" cellpadding="4" cellspacing="0" class="ListManDataTableOuterBorder"   runat="server">
                      <tr> 
                       
                        <td width="80" class="ListManDataTableTop" style="TEXT-ALIGN: left">&nbsp;&nbsp;<a href="PatListContent.aspx?sortColumn=ApptTime">Time</a></td>
                        <td width="30" class="ListManDataTableTop" style="TEXT-ALIGN: left"><a href="PatListContent.aspx?sortColumn=ApptVisitType">Visit</a></td>
                        <td width="150" class="ListManDataTableTop" style="TEXT-ALIGN: left">&nbsp;&nbsp;&nbsp;&nbsp;<a href="PatListContent.aspx?sortColumn=ApptLastName">Name</a></td>
                        <td width="70" class="ListManDataTableTop" style="TEXT-ALIGN: left">&nbsp;&nbsp;<a href="PatListContent.aspx?sortColumn=ApptMRN">MRN</a></td>
                        <td width="110" class="ListManDataTableTop" style="TEXT-ALIGN: left">&nbsp;&nbsp;<a href="PatListContent.aspx?sortColumn=EFormStatus">Status</a></td>
                        <td width="250" class="ListManDataTableTop">Comments</td>
                      </tr>
                     </table>
                     
                     <table id="inPatientTableTitles" width="692" border="0" cellpadding="4" cellspacing="0" class="ListManDataTableOuterBorder"   runat="server">
                      <tr> 
                        <td width="105" class="ListManDataTableTop" style="TEXT-ALIGN: left">&nbsp;&nbsp;Admit Date</td>
                        <td width="80" class="ListManDataTableTop" style="TEXT-ALIGN: left">&nbsp;&nbsp;Bed Num</td>
                        <td width="170" class="ListManDataTableTop" style="TEXT-ALIGN: left">&nbsp;&nbsp;&nbsp;&nbsp;Name</td>
                        <td width="70" class="ListManDataTableTop" style="TEXT-ALIGN: left">&nbsp;&nbsp;MRN</td>
                        <td width="275" class="ListManDataTableTop">Admit Reason</td>
                      </tr>
                     </table>
                     
                    </td>
                    
                    <td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
                     </tr>
                     <tr>
              		    <td id="MainHeightTd" class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
					    <td colspan="2" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="1" height="1"></td>
					    <td colspan="2" valign="top" class="ListManBGTableBody">
              			    <div id="PDFormDiv" style="z-index: 1; visibility: visible; overflow: auto; width: 692px; padding-top: 0px; background-color: #E6EAEE; overflow-x: hidden; margin-left: 0px;">
    							
							    <uc1:helpToolTip id="HelpToolTipLayer" runat="server" />
    							
							    <table id="clinicListTable" width="100%" border="0" cellpadding="4" cellspacing="0" class="ListManBGTableBody" style="border: none;">
    							
    							
							    <!-- list of patients based on selected criteria -->
							    <asp:Repeater ID="rptPatient" runat="server" OnItemCreated="rptItemCreated">
								    <ItemTemplate>
									    <tr id="listRow" runat="server" class="ListManDataTableRow" valign="middle"  onmouseover="this.className='ListManDataTableRowOver'" onMouseOut="this.className='ListManDataTableRow';"> 
										    <td width="225"><%# ((System.Data.DataRowView)Container.DataItem)["ptFirstName"]%> <%# ((System.Data.DataRowView)Container.DataItem)["ptLastName"]%>&nbsp;</td>
										    <td width="75" align=center><%# ((System.Data.DataRowView)Container.DataItem)["ptBirthDateTExt"]%>&nbsp;</td>
										    <td width="100" align=center><%# ((System.Data.DataRowView)Container.DataItem)["ptMrn"]%>&nbsp;</td>
										    <td width="277"><%# ((System.Data.DataRowView)Container.DataItem)["ptNotes"]%>&nbsp;</td>
									    </tr>
								    </ItemTemplate>
							    </asp:Repeater>
    							
    							
							    <!-- list of pending and missing items -->
							    <asp:Repeater ID="rptMissedPendingItems" runat="server" OnItemCreated="rptItemCreated">
								    <ItemTemplate>
									    <tr id="listRow" runat="server" class="ListManDataTableRow" valign="middle" onMouseOver="this.className='ListManDataTableRowOver'" onMouseOut="this.className='ListManDataTableRow';"> 
										    <td width="225"><%# ((System.Data.DataRowView)Container.DataItem)["ptFirstName"]%> <%# ((System.Data.DataRowView)Container.DataItem)["ptLastName"]%>&nbsp;</td>
										    <td width="75" align=center><%# ((System.Data.DataRowView)Container.DataItem)["ptBirthDateTExt"]%>&nbsp;</td>
										    <td width="100" align=center><%# ((System.Data.DataRowView)Container.DataItem)["ptMrn"]%>&nbsp;</td>
										    <td width="277"><%# ((System.Data.DataRowView)Container.DataItem)["items"]%>&nbsp;</td>
									    </tr>
								    </ItemTemplate>

							    </asp:Repeater>
    							
    							
							    <!-- list of clinic patients -->
							    <asp:Repeater ID="rptClinic" runat="server" OnItemCreated="rptClinicItemCreated" OnItemDataBound="SetClinicDelete">
								    <ItemTemplate>
									    <tr id="clinicListRow" class="ListManDataTableRow" valign="middle"    onmouseover="this.className='ListManDataTableRowOver'" onMouseOut="this.className='ListManDataTableRow';" runat="server"> 
    										
										    <td width="80" nowrap><%# DataBinder.Eval(Container.DataItem, "ApptTime", "{0:t}")%>&nbsp;</td>
										    <td width="50"><%# ((System.Data.DataRowView)Container.DataItem)["ApptVisitType"]%>&nbsp;</td>
										    <td width="170"><%# ((System.Data.DataRowView)Container.DataItem)["ApptLastName"]%>, <%# ((System.Data.DataRowView)Container.DataItem)["ApptFirstName"]%>&nbsp;</td>
										    <td width="70"><%# ((System.Data.DataRowView)Container.DataItem)["ApptMrn"]%>&nbsp;</td>
										    <td width="120"><asp:Literal ID="eformStatus" runat="server"/>&nbsp;</td>
                                            <td width="237">
                                                    <%# ((System.Data.DataRowView)Container.DataItem)["ApptNotes"]%>
                                                    &nbsp;
                                            </td>
                                            <td>
                                                <a href="#" runat="server" id="DeleteClinicPatientBtn" visible="false" onclick="return confirmClinicPatientDelete(this.href, event);"
                                                    title="Remove this patient from this clinic list for the selected date">
                                                    <img alt="Delete" src="../../Images/EFormDeleteRow.png" style="border: none;" />
                                                </a>
                                            </td>
                                        </tr>
								    </ItemTemplate>

							    </asp:Repeater>
    							
							    <!-- list of inpatients if applicable -->
							    <asp:Repeater ID="rptInPatients" runat="server" OnItemCreated="rptInPatientItemCreated">
								    <ItemTemplate>
									    <tr id="inPatientRow" class="ListManDataTableRow" valign="middle"    onmouseover="this.className='ListManDataTableRowOver'" onMouseOut="this.className='ListManDataTableRow';" runat="server"> 
										    <td width="105"><%# DataBinder.Eval(Container.DataItem, "InPtAdmitDate", "{0:d}")%>&nbsp;</td>
										    <td width="80"><%# DataBinder.Eval(Container.DataItem, "InPtBedNum", "{0:t}")%>&nbsp;</td>
    									
										    <td width="170"><%# ((System.Data.DataRowView)Container.DataItem)["PtLastName"]%>, <%# ((System.Data.DataRowView)Container.DataItem)["PtFirstName"]%>&nbsp;</td>
										    <td width="70"><%# ((System.Data.DataRowView)Container.DataItem)["PtMrn"]%>&nbsp;</td>
										    <td width="262"><%# ((System.Data.DataRowView)Container.DataItem)["InPtAdmitReason"]%>&nbsp;</td>
									    </tr>
								    </ItemTemplate>

							    </asp:Repeater>
    							
    							
									    <tr id="noPatientsRow" runat="server" class="ListManDataTableRow" valign="middle" visible="false" style="cursor: default;" > 
										    <td style="height: 100px; text-align: center; font-size: 13px; font-weight: 400; color: #8d2a2c;">There are no patients on this list.</td>
									    </tr>
    							
    							
    							
							    </table>
						    </div>
					    </td>
					    <td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
				    </tr>
				    <tr>
					    <td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
					    <td class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="10" height="5"></td>
					    <td class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="20" height="5"></td>
					    <td colspan="2" class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="1" height="1"></td>
					    <td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
				    </tr>
			    </table>
	        </td>
        </tr>
    </table>
    </form>
</body>
</html>