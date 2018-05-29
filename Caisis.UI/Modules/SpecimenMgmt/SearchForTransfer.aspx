<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls"  %>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchForTransfer.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.SearchForTransfer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Search For Collection</title>
    
	<meta name="GENERATOR" content="Microsoft Visual Studio 7.0" />
	<meta name="CODE_LANGUAGE" content="C#" />
	<meta name="vs_defaultClientScript" content="JavaScript" />
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
	
	<link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
	<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
	<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
	<script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>	

    <style type="text/css">
        .DataEntryRow input
        {
            width:20px;
        }
    </style>
</head>

<body>
    <form id="dataForm" method="post" runat="server" defaultfocus="collectionName">
        <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f8fafc">
            <tr> 
		        <td height="15" align="center"><img src="../../Images/shim.gif" width="1" height="1"></td>
	        </tr>
    	
	        <tr> 
		        <td align="center"> 
		            <table id="SearchLayer" runat="server" width="820" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                            <td colspan="6" height="30" valign="bottom" align="left">
                                <img src="../../Images/shim.gif" width="3" height="1" />
                                <asp:Label ID="ResultsTitle" runat="server" CssClass="ListManTitle"></asp:Label>
                            </td>
                        </tr>

                        <tr> 
                            <td colspan="6"><img src="../../Images/shim.gif" width="10" height="8"></td>
                        </tr>

			            <tr> 
			                <td style="background-color:#F1F7FC;"><img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="10" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="20" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="320" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="400" height="5"></td>
			                <td style="background-color:#F1F7FC;"><img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
                        </tr>
                  
                        <tr id="searchControlsRow" runat="server" style="background-color: #F1F7FC;">
                            <td class="ListManBGTableLeftSide" style="width: 5px;">&nbsp;</td>
                            <td colspan="4" valign="top" style="height: 75px; text-align: center;" align="center">
                                <div class="DataEntryRow" align="center" style="text-align:left; padding:10px 20px 0px 20px; ">
                                    Name
                                    <cc:CaisisComboBox ID="requestName" runat="server" TabIndex="1" LookupDistinct="SpecimenRequests;RequestIdentifier;RequestIdentifier;;RequestIdentifier ASC"
                                        MaxLength="50" DropDownWidth="285px" Width="290" ShowLabel="False"></cc:CaisisComboBox>
                                    <span style="color: #ff3366">*</span><img src="../../Images/shim.gif" width="30" height="1">
                                    Date From
                                    <cc:CaisisTextBox ID="dateFrom" runat="server" TabIndex="2" onblur="isDateAndNotEmpty(this.id, this.value)"
                                        ShowCalendar="True" Width="110" Height="17px" ShowLabel="False"></cc:CaisisTextBox>
                                    <img src="../../Images/shim.gif" width="25" height="1">
                                    Type
                                    <cc:CaisisSelect ID="ddlType" runat="server" TabIndex="4" LookupCode="Specimen_RequestType"
                                        Width="150" ShowLabel="False">
                                    </cc:CaisisSelect>
                                </div>
                                <div class="DataEntryRow" align="center" style="text-align:left; padding:0px 20px 0px 20px; ">
                                    <span style="color: #ff3366; margin-left:30px;">*</span> 
                                    <span style="color: #00668D; margin-right:267px;">allows wildcard search</span>
                                    To
                                    <cc:CaisisTextBox ID="dateTo" runat="server" TabIndex="3" onblur="isDateAndNotEmpty(this.id, this.value)"
                                        Width="110" ShowCalendar="True" Height="17px" ShowLabel="False"></cc:CaisisTextBox>
                                    <img src="../../Images/shim.gif" width="20" height="1">
                                    Status
                                    <cc:CaisisSelect ID="ddlStatus" runat="server" TabIndex="5" LookupCode="Specimen_CollectionStatus"
                                        Width="150" ShowLabel="False">
                                    </cc:CaisisSelect>
                                </div>
                                
                                <!-- Validation Error Message -->
                                <div class="TableNotes">
                                    <img src="../../Images/shim.gif" width="230" height="1">
                                    <asp:Label ID="errorMessage" runat="server"></asp:Label>
                                </div>
                                
                                <div style="padding-top:10px; padding-bottom:10px;">
                                    <asp:imagebutton tabIndex="6" runat="server" onClick="btnSearch_onClick" ImageUrl="../../images/Search_small.gif"></asp:imagebutton>
			                    </div>
			                </td>
			                <td class="ListManBGTableRightSide" style="width: 5px;">&nbsp;</td>
			            </tr>
			            
			            <!-- Message Total Transfer Requests Found -->
                        <tr id="resultsMsg" runat="server">
                            <td class="ListManBGTableLeftSide">
                                &nbsp;</td>
                            <td colspan="4" class="ListManBGTableBody" align="right" style="text-align: center;">
                                <div style="float: left; vertical-align: bottom; padding-top: 8px; padding-left:7px; padding-bottom:3px;">
                                    <span class="TableNotes">
                                        <asp:Label ID="lblTotalRequests" runat="server"></asp:Label>
                                    </span>
                                </div>
                                <div style="float: right; vertical-align: bottom; padding-top: 5px; padding-right:7px; padding-bottom:3px;">
                                    <cc:CaisisCheckBox ID="chkViewAll" runat="server" ShowLabel="false"
                                        AutoPostBack="true" OnCheckedChanged="ReloadCollections" />
                                    <span class="TableNotes">Show Received Transfers</span>
                                </div>
                            </td>
			                <td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="5" height="1"></td>
			            </tr>
			            <!-- End Message Total Collections Found -->
			            
			            
			            <!-- Search Results Panel -->
			            <tr style="background-color:#F1F7FC;">
			                <td class="ListManBGTableLeftSide" style="width: 1px;">&nbsp;</td>
			                <td colspan="4" align="center">
			                    <asp:Panel id="pnlSearchBody" visible="true" runat="server"  style="position: relative; width: 800px;">
			                        <!-- Titles - Results Table -->
			                        <table id="resultsTitles" width="802" border="0" cellpadding="4" cellspacing="0" class="ListManDataTableOuterBorder" runat="server">
								        <tr>
									        <td class="ListManDataTableTop" style="width:150px;">Name</td>
									        <td class="ListManDataTableTop" style="width:100px;">Project Code</td>
									        <td class="ListManDataTableTop" style="width:75px;">Type</td>
									        <td class="ListManDataTableTop" style="width:160px;" >Status</td>
									        <td class="ListManDataTableTop" style="width:100px;">Date Created</td>
									        <td class="ListManDataTableTop" style="width:150px;">Notes</td>
								        </tr>
							        </table>	
							        <!-- End Titles - Results Table-->	
							        
							        <!-- Content - Results Table -->
							        <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 245px; width: 800px; border:solid 1px #999999; background-color:#ffffff;">	                    
							            <table id="collectionTable" cellspacing="0" cellpadding="2" width="800" border="0" style="background-color:#ffffff;">
								            <asp:Repeater id="rptCollection" runat="server" OnItemCreated="rptItemCreated">
								                <ItemTemplate>
								                    <tr id="collectionRow" runat="server"  style="cursor: pointer;" class="ListManDataTableRow" valign="middle" 
								                        onmouseover="this.className='ListManDataTableRowOver'" onmouseout="this.className='ListManDataTableRow';">

									                    <td style="width:150px;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "RequestIdentifier") %></td>
									                    <td style="width:100px;" align="center"><%# DataBinder.Eval(Container.DataItem, "RequestProject") %></td>
									                    <td style="width:75px;" align="center"><%# DataBinder.Eval(Container.DataItem, "RequestType")%></td>
									                    <td style="width:160px;" align="center"><%# DataBinder.Eval(Container.DataItem, "RequestStatus")%></td>
									                    <td style="width:100px;" align="center"><%# DataBinder.Eval(Container.DataItem, "RequestDate", "{0:d}")%></td>
									                    <td style="width:150px;" align="center"><%# DataBinder.Eval(Container.DataItem, "RequestNotes")%></td>
								                    </tr>
								                </ItemTemplate>
								                <SeparatorTemplate>
                                                    <tr >
                                                        <td colspan="7" class="ListManDataTableDottedLine" style="cursor: default; height:5px;"></td>
                                                    </tr>
                                                </SeparatorTemplate>
								                <FooterTemplate>
                                                    <tr>
                                                        <td colspan="7" class="ListManDataTableDottedLine" style="cursor: default; height: 5px;"></td>
                                                    </tr>
                                                </FooterTemplate>
							                </asp:Repeater> 
                                                
							                <!-- Message - Search Returns Empty -->
							                <tr id="noCollectionsRow" runat="server" class="ListManDataTableRow" valign="middle" visible="false" style="cursor: default;" > 
										        <td colspan="6" style="height: 100px; text-align: center; font-size: 13px; color: #8d2a2c;">
										            No Transfer Records Matched Your Search Criteria.
										        </td>
									        </tr>
							                <!-- Message - Search Returns Empty -->
    										
							            </table>
							        </div>
							        <!-- End Content - Results Table -->
							        
							    </asp:Panel>							    
			                </td>
			                <td class="ListManBGTableRightSide" style="width: 1px;">&nbsp;</td>
			            </tr>
			            <!-- End Search Results Panel -->
			            
			            
			            <!-- Rounded Bottom Border -->
			            <tr>
                            <td style="background-color:#F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
                            <td class="ListManagerBGTableBottom">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td class="ListManagerBGTableBottom">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td colspan="2" class="ListManagerBGTableBottom">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td style="background-color:#F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
			            </tr>
		            </table>
		        </td>
	        </tr>
	       
        </table>   
    </form>

</body>
</html>
