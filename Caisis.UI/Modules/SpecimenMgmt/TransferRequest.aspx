<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls"  %>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TransferRequest.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.TransferRequest" %>
<%@ Register TagPrefix="val" TagName="ErrorMsg" Src="../../Core/Utilities/ErrorMsg.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Transfer Request</title>
    
	<meta name="GENERATOR" content="Microsoft Visual Studio 7.0" />
	<meta name="CODE_LANGUAGE" content="C#" />
	<meta name="vs_defaultClientScript" content="JavaScript" />
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
	
	<link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
	<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>

	<script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script type="text/javascript">
    
        NotesEditor.editorWidth = 500;
        NotesEditor.editorHeight = 150;
        
        Browser.ResizeElement( { nodeId: 'WrappingDiv', heightOffset: 180 } );
    
        // Start Override utility functions for getting position of combo boxes
        function posHelper(obj,dir)
        {
            var endloop = false, tablePos = 0, tableCount = 0, pos = 0;
            if(obj.offsetParent)
            {
                pos  = dir == 'top' ? obj.offsetTop : obj.offsetLeft;
                while( (obj = obj.offsetParent) && !endloop )
                {
                    if(obj.nodeName == "BODY" || obj.id == 'WrappingDiv') { endloop = true; break; }
                    pos+= dir == 'top' ? obj.offsetTop : obj.offsetLeft;  
                }
            }
            return tableCount > 1 ? tablePos : pos;
        }

        function getTopPos(obj) { return posHelper(obj,'top'); }
        function getLeftPos(obj) { return posHelper(obj,'left'); }
    
	    function toggle_visible (arg1) 
	    {
	        var el = document.getElementById (arg1);
	        var isVisible = (el.style.visibility == "hidden") ? true : false;

	        el.style.visibility = isVisible ? "visible" : "hidden";
	        el.style.display = isVisible ? "inline" : "none";
	    }
	    // End Override utility functions for getting position of combo boxes
    </script>
    
    <style type="text/css">
        .label
        {
            text-align:right; 
            vertical-align:top;
            padding-right:2px;
            padding-top:5px;
            width:100px;
            color: #000000;
        }
        .labelRequired
        {
            text-align:right;
            font-weight: bold; 
            vertical-align:top;
            padding-right:2px;
            padding-top:5px;
            width:100px;
            color: #8d282c;
        }
        div.divActive
        {
            width: 790px; float: left; 
            border-style: solid;
            border-width:1px;
            border-top-color: #000000;
            border-left-color: #000000;
            border-bottom-color: #666666;
            border-right-color: #666666;
            background-color: #FBFBFB;; 
            margin: 0px; margin-left:5px;
            padding: 0px 0px 10px 0px;
        }
        div.divInactive
        {
            width: 790px; float: left; 
            border: solid 1px #cccccc; 
            background-color: #FEFEFE; 
            margin: 0px; margin-left:5px;
            padding: 0px 0px 10px 0px;
        }
        div.halfDivActive
        {
            width: 390px;
            background-color: #ffffff; 
            border-style: solid;
            border-width:1px;
            border-top-color: #000000;
            border-left-color: #000000;
            border-bottom-color: #666666;
            border-right-color: #666666;
            margin-top: 0px; padding-top: 0px; 
        }
        div.halfDivInactive
        {
            width: 390px; 
            background-color: #FEFEFE; 
            border: solid 1px #cccccc; 
            margin-top: 0px; padding-top: 0px;
        }
        div.headerActive
        {
            background-color: #3D556D;
            text-align: left; 
            padding: 3px;
            padding-left:7px;
            font-size: 13px;
            letter-spacing: 1px;
            font-weight: bold;
            color: #FFFFFF;
        }
        div.headerInactive
        {
            background-color: #7F99AF;
            text-align: left; 
            padding: 3px;
            padding-left:7px;
            font-size: 13px;
            letter-spacing: 1px;
            font-weight: bold;
            color: #EEEEEE;
        }
        td.reqControl
        {
           
            text-align:right; 
            padding-right:50px;
            
        }
        td.subtitle
        {
            font-weight:bold;
            color:#3D556D;
            text-align:left;
            padding-left:20px;
        }
        /*
        td.control
        {
            text-align:left; 
            vertical-align:top;
        }
        td.halfLabel
        {
            text-align:right; 
            vertical-align:top;
            padding-right:2px;
            padding-top:5px;
            width:50px;
        }
        */ 
    </style>
</head>
<body>
    <form id="dataForm" method="post" runat="server" defaultfocus="RequestTypeCBL">
        <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f8fafc">
            <tr>
                <td height="10" align="center">
                    <img src="../../Images/shim.gif" width="1" height="1"></td>
            </tr>
            <tr>
                <td align="center">
                
                    <table id="SearchLayer" runat="server" width="820" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td colspan="4" height="15" valign="bottom" align="left">
                                <img src="../../Images/shim.gif" width="3" height="1" />
                                <asp:Label ID="ResultsTitle" runat="server" CssClass="ListManTitle"></asp:Label>
                                
                            </td>
                            <td colspan="2" align="right">
                                <asp:ImageButton ID="backToSearchIcon" runat="server" Visible="true" AlternateText="Back to Search Results"
                                        ImageUrl="Images/BackToSearchResults.gif" OnCommand="GoToSearch" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <img src="../../Images/shim.gif" width="10" height="8"></td>
                        </tr>
                        <tr>
                            <td style="background-color: #F1F7FC; width: 6px;">
                                <img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
                            <td class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="10" height="5"></td>
                            <td class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="20" height="5"></td>
                            <td class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="320" height="5"></td>
                            <td class="ListManagerBGTableTop" style="width: 436px">
                                <img src="../../Images/shim.gif" width="400" height="5"></td>
                            <td style="background-color: #F1F7FC;">
                                <img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
                        </tr>
                        <tr id="searchControlsRow" runat="server" style="background-color: #F1F7FC;">
                            <td class="ListManBGTableLeftSide" style="width: 6px;">
                                &nbsp;</td>
                            <td colspan="4" valign="top">
                               <div id="WrappingDiv" style="width: auto; height: 600px; overflow: auto; position: relative;">
                               <!-- Needs to be here for formatting reasons -->
                               <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
                                <!-------------- Request -------------->
                                <div style="width: 800px; margin-top:10px; margin-bottom:10px;">
                                    <div id="RequestDiv" class="divActive" runat="server">
                                        <div id="RequestHeader" class="headerActive" runat="server">Request</div>
                                        <div style="float: left; width: 390px; padding-top:5px;">
                                            <table style="width:100%;" cellpadding="2" border="0">
                                                <tr>
                                                    <td style="text-align:right;width:150px">
                                                        Type
                                                    </td>
                                                    <td align="left">
                                                        <asp:RadioButtonList  ID="RequestTypeCBL" runat="server" RepeatColumns="2" TabIndex="1">
                                                            <asp:ListItem Text="Internal" Value="Internal" Selected="True"></asp:ListItem>
                                                            <asp:ListItem Text="External" Value="External"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                         <cc:CaisisHidden runat="server" Table="SpecimenRequests" Field="SpecimenRequestId" ID="SpecimenRequestId" ShowLabel="False"></cc:CaisisHidden>
                                                    </td>
                                                </tr>
                                               
                                                <tr>
                                                    <td colspan="2" style="text-align:right; padding-right:38px">
                                                        <cc:CaisisTextBox FieldLabel="Request Name " TabIndex="2" runat="server" Table="SpecimenRequests" Field="RequestIdentifier" ID="RequestIdentifier" MaxLength="50" Width="200" Required="true"></cc:CaisisTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="text-align:right; padding-right:17px" >
                                                        <cc:CaisisTextBox Required="true"  FieldLabel="Date " runat="server" TabIndex="3" Table="SpecimenRequests"
                                                            Field="RequestDate" ID="RequestDate" onblur="isDateAndNotEmpty(this.id, this.value)"
                                                            ShowCalendar="True" Width="200" Height="17px"></cc:CaisisTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="text-align:right; padding-right:38px">
                                                        <cc:CaisisSelect FieldLabel="Status " TabIndex="4" runat="server" LookupCode="Specimen_RequestStatus"
                                                            Table="SpecimenRequests" Field="RequestStatus" ID="RequestStatus" Width="207" Enabled="false">
                                                        </cc:CaisisSelect>
                                                        <cc:CaisisHidden runat="server" ID="CollectionIds" ShowLabel="False"></cc:CaisisHidden>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="text-align:right; padding-right:38px">
                                                        <cc:CaisisTextBox FieldLabel="Project " TabIndex="5" runat="server" Table="SpecimenRequests"
                                                            Field="RequestProject" ID="RequestProject" MaxLength="50" Width="200"></cc:CaisisTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="availableCollectionsLbl" runat="server" style="text-align:right; vertical-align:top; color:#993333; font-weight:bold;">
                                                        Available <br />Collections 
                                                    </td>
                                                    <td  style="text-align:right; padding-right:38px">
                                                        <select id="AvailableCollectionSelectBox" multiple="true" runat="server" size="5" TabIndex="6" style="width:205px;" title="hold down the Ctrl key to make multiple selections" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="float: right; width: 390px;  padding-top:5px;">
                                            <table style="width: 100%;" cellpadding="3">
                                                 <tr>
                                                     <td colspan="2" style="text-align:left; padding-right:25px">
                                                        <cc:CaisisTextArea FieldLabel="Notes " TabIndex="7" runat="server" Table="SpecimenRequests"
                                                            Field="RequestNotes" ID="RequestNotes" Height="50" Width="195"></cc:CaisisTextArea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="subtitle">Generating</td>
                                                </tr>
                                                <tr>
                                                      <td colspan="2" style="text-align:left; padding-right:45px">
                                                        <cc:CaisisSelect Required="true" FieldLabel="Institution " TabIndex="8" runat="server"
                                                            Table="SpecimenRequests" Field="RequestGenInstitution" ID="RequestGenInsitution"
                                                            LookUpDistinct="SpecimenSites; SiteId; SiteName" Width="200" >
                                                        </cc:CaisisSelect>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="text-align: left; padding-right: 25px">
                                                        <div style="text-align:left; padding-left:5px;">
                                                            <cc:CaisisSelect FieldLabel="Contact " runat="server" ID="RequestGenContactName" 
                                                            Table="SpecimenRequests" Field="RequestGenContactName" 
                                                            TabIndex="9" Width="200" ShowLabel="true" LookupDistinct="Contact;ContactId;COALESCE(LastName,'') + ', ' + COALESCE(FirstName,'');(ContactType='Specimen')"></cc:CaisisSelect>
                                                        </div>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td colspan="2" class="subtitle">Receiving</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="text-align: left; padding-right: 45px">
                                                        <cc:CaisisSelect Required="true" FieldLabel="Institution " TabIndex="10" runat="server"
                                                            Table="SpecimenRequests" Field="RequestRecInstitution" ID="RequestRecInstitution"
                                                            LookupDistinct="SpecimenSites; SiteId; SiteName" Width="200">
                                                        </cc:CaisisSelect>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="text-align: left; padding-right: 25px">
                                                        <div style="text-align: left; padding-left:5px;">
                                                            <cc:CaisisSelect FieldLabel="Contact " runat="server" ID="RequestRecContactName" 
                                                            Table="SpecimenRequests" Field="RequestRecContactName" 
                                                            TabIndex="11" Width="200" ShowLabel="true" LookupDistinct="Contact;ContactId;COALESCE(LastName,'') + ', ' + COALESCE(FirstName,'');(ContactType='Specimen')"></cc:CaisisSelect>
                                                        </div>
                                                    </td>
                                                </tr>
                                               
                                            </table>
                                        </div>
                                    
                                        <div style="width:785px; text-align:center; float:left; padding-bottom:3px; padding-top:5px;" align="center">
                                            <!-- display message about required fields -->
                                            <asp:Label ID="UserMessage" CssClass="patientDataFormUserMessage" runat="server" />
                                            <br />
                                            <asp:imagebutton id="requestBtn" tabIndex="12" OnClick="SaveRequestDetails" runat="server" Tooltip="Submit Request For Transfer" ImageUrl="../../images/SubmitRequestForTransfer.gif"></asp:imagebutton>
                                            <br />
                                        </div>
                                    </div>
                                </div>
                                <!-------------- End Request -------------->
                                
                                <!-------------- Dispatch & Receive -------------->
                                <div style="width: 800px; margin-bottom:10px;">
                                    <!-------------- Dispatch -------------->
                                    <div style="width: 400px; float: left; margin-top:10px;">
                                        <div id="DispatchDiv" class="halfDivActive" runat="server">
                                            <div  id="DispatchHeader" class="headerActive"  runat="server">
                                                Dispatch
                                            </div>
                                            <table width="100%" cellpadding="2" border="0">
                                                <tr>
                                                    <td style="text-align:left;padding-left:50px; color: #ff3366;"><asp:Label ID="DispatchDateError"  runat="server" ></asp:Label>
                                                        <cc:CaisisTextBox ReadOnly="true" Visible="false" runat="server" Table="SpecimenDistributions" Field="DistributionId" ID="DistributionId" MaxLength="10" Width="0" ShowLabel="False"></cc:CaisisTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                   <td style="text-align:right; padding-right:50px;">
                                                          <cc:CaisisTextBox Required="true" FieldLabel="Date" LabelClass="labelRequired" TabIndex="13" runat="server" Table="SpecimenDistributions"
                                                            Field="DispatchedDate" ID="DispatchedDate" onblur="isDateAndNotEmpty(this.id, this.value)"
                                                            ShowCalendar="True" Width="100" Height="17px"></cc:CaisisTextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            Time <cc:CaisisTextBox FieldLabel="Time" LabelClass="label" TabIndex="14" runat="server" Table="SpecimenDistributions"
                                                            Field="DispatchedTime" ID="DispatchedTime" Width="80" Height="17px" ShowLabel="False"></cc:CaisisTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left; padding-left:35px;">
                                                        <cc:CaisisComboBox FieldLabel="Contact " LabelClass="label" TabIndex="15" runat="server" LookupCode="Specimen_Contacts" 
                                                            Table="SpecimenDistributions" Field="DispatchedContact" ID="DispatchedContact" 
                                                            MaxLength="50" Width="250" DropDownWidth="250px" DropDownHeight="auto"></cc:CaisisComboBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                   <td style="text-align:right; padding-right:50px;" >
                                                        <cc:CaisisTextBox FieldLabel="Method " LabelClass="label" TabIndex="16" runat="server" 
                                                            Table="SpecimenDistributions" Field="DispatchedMethod" ID="DispatchedMethod" Width="250"></cc:CaisisTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;padding-right:50px;">
                                                        <cc:CaisisTextBox FieldLabel="Tracking #" LabelClass="label" TabIndex="17" runat="server" 
                                                            Table="SpecimenDistributions" Field="DispatchedTrackingNumber" ID="DispatchedTrackingNumber" Width="250" Height="17px"></cc:CaisisTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right; padding-right:30px;">
                                                        <cc:CaisisTextArea FieldLabel="Notes " LabelClass="label" TabIndex="18" runat="server" Width="250" Height="37"
                                                            Table="SpecimenDistributions" Field="DispatchedNotes" ID="DispatchedNotes" >
                                                        </cc:CaisisTextArea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:center; padding-left:50px; padding-bottom:7px; padding-top:5px;"> 
                                                        <asp:imagebutton id="dispatchBtn" TabIndex="19" ToolTip="Dispatch Transfer" OnClick="SaveDispatchDetails" runat="server" ImageUrl="../../images/DispatchTransfer.gif"></asp:imagebutton></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <!-------------- Receive -------------->
                                    <div style="width: 400px; float: right; margin-top:10px;">
                                         <div id="ReceiveDiv" class="halfDivActive" runat="server">
                                            
                                            <div  id="ReceiveHeader" class="headerActive"  runat="server">
                                                Receive
                                            </div>
                                           
                                            <table width="390" cellpadding="2" border="0">
                                                <tr>
                                                    <td style="text-align:left;padding-left:80px;color: #ff3366;"><asp:Label ID="ReceiveDateError" runat="server" ></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;padding-right:50px;">
                                                        <cc:CaisisTextBox Required="true" FieldLabel="Date" LabelClass="labelRequired" runat="server" TabIndex="20"
                                                            Table="SpecimenDistributions" Field="ReceivedDate" ID="ReceivedDate" 
                                                            onblur="isDateAndNotEmpty(this.id, this.value)" ShowCalendar="True" Width="100"
                                                            Height="17px"></cc:CaisisTextBox>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Time
                                                        <cc:CaisisTextBox FieldLabel="Time" LabelClass="label" TabIndex="21" runat="server" 
                                                            Table="SpecimenDistributions" Field="ReceivedTime" ID="ReceivedTime" 
                                                            Width="75" Height="17px" ShowLabel="False"></cc:CaisisTextBox>  
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left;padding-left:35px;">
                                                        <cc:CaisisComboBox FieldLabel="Contact " LabelClass="label" TabIndex="22" runat="server" LookupCode="Specimen_Contacts" 
                                                            Table="SpecimenDistributions" Field="ReceivedContact" ID="ReceivedBy" MaxLength="50" Width="250" DropDownWidth="250px" DropDownHeight="auto"></cc:CaisisComboBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;padding-right:50px;">
                                                        <cc:CaisisSelect FieldLabel="Integrity " LabelClass="label" TabIndex="23" runat="server" LookupCode="Specimen_RequestIntegrity"
                                                            Table="SpecimenDistributions" Field="ReceivedIntegrity" ID="ReceivedIntegrity" Width="255">
                                                        </cc:CaisisSelect>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;padding-right:30px;">
                                                        <cc:CaisisTextArea FieldLabel="Notes " LabelClass="label" TabIndex="24" runat="server" Width="250" Height="70" 
                                                            Table="SpecimenDistributions" Field="ReceivedNotes" ID="ReceivedNotes" >
                                                        </cc:CaisisTextArea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:center; padding-bottom:7px; padding-top:5px;"> 
                                                        <asp:imagebutton id="receiveBtn" TabIndex="25" Tooltip="Receive Transfer" OnClick="SaveReceiveDetails" runat="server" ImageUrl="../../images/ReceiveTransfer.gif"></asp:imagebutton>
                                                        <asp:imagebutton id="MoveSpecimenBtn" TabIndex="26" Tooltip="Move Specimens" OnClick="MoveSpecimenBtnClick" runat="server" ImageUrl="../../images/MoveSpecimens_Off.gif" Enabled="false"></asp:imagebutton>
                                                        <br />
                                                    </td>
                                                </tr>
                                            </table>
                                           
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </td>
                            <td class="ListManBGTableRightSide" style="width: 6px;">
                                &nbsp;</td>
			            </tr>
			            
			            <!-- Rounded Bottom Border -->
			            <tr>
                            <td style="background-color:#F1F7FC; width: 6px; height: 5px;">
                                <img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
                            <td class="ListManagerBGTableBottom" style="height: 5px">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td class="ListManagerBGTableBottom" style="height: 5px">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td colspan="2" class="ListManagerBGTableBottom" style="height: 5px">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td style="background-color:#F1F7FC; width: 5px; height: 5px;">
                                <img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
			            </tr>
		            </table>
		           
		        </td>
	        </tr>
	       
        </table>   
    </form>

</body>
</html>
