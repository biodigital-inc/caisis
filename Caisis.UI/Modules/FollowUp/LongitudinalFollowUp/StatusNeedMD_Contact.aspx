<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StatusNeedMD_Contact.aspx.cs"
    Inherits="Caisis.UI.Modules.FollowUp.StatusNeedMD_Contact"  %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../../StyleSheets/DataAnalysis.css" type="text/css" rel="stylesheet" />
    <link href="../../ProtocolMgmt/StyleSheets/ProtocolMgmtStyles.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>
        <script src="../../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        Browser.ResizeElement({ nodeId: '<%= PrintDiv.ClientID %>', heightOffset: 50 });
        Browser.ResizeElement({ nodeId: '<%= PatientResultsDiv.ClientID %>', heightOffset: 155 });

        function confirmSubmit(msg) {
            return confirm(msg);
        }

        function cancelPage() {

            if (confirmSubmit('Follow up has not been completed for patient.\rAre you sure you want to quit?'))
                    reloadMainPage();
        }

        function closePage() {

           reloadMainPage();
        }

        function refreshPage() {

            window.location.href = window.location.href;
        }
       
        function reloadMainPage() {
            var win = top.getModalCallingWindow();
            if (win != null) {
                // if loaded into modal, signal calling page
                if (win.onChildSave) {
                    var doClose = win.onChildSave.call(win);
                    if (doClose) {
                        top.hideModal();
                        window.location = window.location;
                        return;
                    }
                }
            }
            closeAfterSave();
        }

        function closeAfterSave() {
            // confirm closing window
            var doClose = true;
            if (doClose) {
                window.close();
            }
        }
            
        function popupAddEditPhysician(pageName)
        {
	        window.open(pageName, 'Physicians', 'toolbars=no,resize=no,scrollbars=no,width=900,height=480,left=50,top=200');
	    }

    </script>

    <style type="text/css">
        .reportContentBody { background-color:#ffffff; }
        .DivWhite { background-color:White; }        

        .SectionTitle2
        {
            /*color: #3d556d;*/
            font-size: 18px;
            font-weight: bold;
        }

    .ClinicalEformPopulatedRowNonClickable {
	    height: 18px;
	    background-color: #efefef;
    }
    
        #LoadingLayer
        {
            text-align: center;
            width: 250px;
            height: auto;
            margin: auto;
            background-color: #004256;
            color: #ffffff;
            border: 2px solid #cccccc;
            font-size: 14px;
            font-weight: bold;
            position: absolute;
            z-index: 500px;
            padding: 5px;
        }
        

    </style>
    
    <style type="text/css" media="print">
        .printButtonsTable 
        {
	        display: none;
        }    
        .DivWhite 
        {
	        overflow-y: hidden;
        }      
    </style>
    
</head>
<body class="reportContentBody" onunload="return false; reloadMainPage();">
    <form id="ContactStatusForm" runat="server" method="post">
    
    
        <div id="PatientResultsDiv" runat="server" style="width: 100%; overflow-x: auto; overflow-y: auto;   ">
        <span id="LoadingLayer" runat="server" style="display: none;" ><span id="LoadingTextLayer" runat="server"></span></span>
        

        <table width="98%"> 
            <tr>			                                    
                <td align="left" class="SectionTitle2"><strong>Need MD Contact: </strong><i class="ListManTitle" ><%= PatientName %></i> </td>
            </tr>
            <tr>
                <td>
                    <div id="NoPhysicianDiv" runat="server" style="display: none; " >
                        <br /><br /><br />
                        <table width="550px" cellpadding="0" cellspacing="0" align="center">
                            <tr><td style="white-space: nowrap; " colspan="2" align="center" height="40px"><strong>No following physician was found for patient.&nbsp;&nbsp;Assign a physician below:</strong></td></tr>
                            <tr>
                                <td class="dashboardBG_TopLeft" >
                                    <table width="100%" align="left" cellpadding="5">
                                        <tr>
                                            <td valign="top" align="left" width="5%"><strong>Physician: </strong></td>
                                            <td valign="top" align="center"colspan="2" >
                                                <euc:CaisisSelect Width="250px" ID="FollowingPhysicianId"   runat="server" ShowLabel="false" AutoPostBack="false" ShowEmptyListItem="true" ValidationGroup="FollowingPhysician"  />
                                                
                                            </td>
                                             <td valign="top" align="left" rowspan="2">
                                                <a id="AddPhysicianLink" runat="server" style="cursor:hand;" >
                                                    <img src="../../../Images/AddANewPhysicianButton.gif" width="94" height="27" border="0" />
                                                </a>
                                            </td>
                                       </tr>
                                       <tr>
                                        <td colspan="2" align="left">
                                            <asp:ImageButton ID="AssignPhysicianBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/AssignPhysician.gif" OnClick="AssignPhysicianClick" CausesValidation="true" ValidationGroup="FollowingPhysician" />
                                        </td>
                                       </tr>
                                       <tr>
                                        <td colspan="3" align="center">
                                             <asp:RequiredFieldValidator ID="FollowingPhysicianRV" runat="server" ControlToValidate="FollowingPhysicianId"  
                                                 Display="Dynamic" EnableClientScript="true" ErrorMessage="Please select a physician" ValidationGroup="FollowingPhysician"  />
                                            <asp:Label ID="AssignPhysicianErrorLBL" runat="server" ForeColor="Red" />     
                                       
                                        </td>
                                       </tr>
                                    
                                    </table>                                            
                                </td>
                                <td class="dashboardBG_TopRight" ></td>
                            </tr>
                            <tr>
                                <td class="dashboardBG_BottomLeft"></td>
                                <td class="dashboardBG_BottomRight"></td>
                            </tr>
                        </table>
                    </div>
                    <div id="PhysicianDiv" runat="server" style="display: none;">
                        <table width="100%" cellpadding="0" cellspacing="20">

                            <tr>
                                <td width="50%" valign="top" >
                                    <strong>1.0 - Instructions</strong><br /><br />
                                    <table width="495px" class="" cellspacing="0"  >
                                        <tr>
                                            <td class="dashboardBG_TopLeft" >
                                                <table width="100%">
                                                    <tr>
                                                        <td valign="top" width="5%" >1.1</td>
                                                        <td valign="top" style="line-height: 20px; " >
                                                            Gather all authorizations for patients who need MD Contact                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top" width="5%" >1.2</td>
                                                        <td valign="top" style="line-height: 20px; " >
                                                            Call the physician's office to let them know that you want to send a patient's
                                                            authorization form to get medical records.  Ask them if you can fax it, or if they
                                                            would prefer to receive it by mail.  Update the fax number and or/address in the
                                                            physician information section.
                                                        
                                                        </td>
                                                    </tr>
                                                
                                                </table>                                            
                                            </td>
                                            <td class="dashboardBG_TopRight" ></td>
                                        </tr>
                                        <tr>
                                            <td class="dashboardBG_BottomLeft"></td>
                                            <td class="dashboardBG_BottomRight"></td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="50%" rowspan="2" valign="top" >
                                    <strong>Following Physician Information</strong><br /><br />                                    
                                    <table width="300px" class="" cellspacing="0" >
                                        <tr>
                                            <td class="dashboardBG_TopLeft">
                                                <table width="100%" cellpadding="3" >
                                                    <tr>
                                                        <td valign="top" width="100%" colspan="2" class="SectionTitle2"><strong class="ListManTitle" ><%= PatientFollowingPhysicianName %></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top" style="white-space: nowrap; "  ><strong>Phone Number: </strong></td>
                                                        <td valign="top" style="white-space: nowrap; " ><%= PatientFollowingPhysicianWorkPhone %></td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top" style="white-space: nowrap; "  ><strong>Fax Number: </strong></td>
                                                        <td valign="top" style="white-space: nowrap; " ><%= PatientFollowingPhysicianFax %></td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top"style="white-space: nowrap; "  ><strong>Address: </strong></td>
                                                        <td valign="top" style="white-space: nowrap; " ><%= PatientFollowingPhysicianAddress %></td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top" align="right" width="100%" colspan="2"><a id="EditPhysicianLink" runat="server" style="cursor:hand;"><img src=../../../Images/EditThisPhysicianButton.gif width="101" height="16" border="0" align="absmiddle" hspace="20"></a></td>
                                                    </tr>                                                
                                                </table>                                            
                                            </td>
                                            <td class="dashboardBG_TopRight" ></td>
                                        </tr>
                                        <tr>
                                            <td class="dashboardBG_BottomLeft"></td>
                                            <td class="dashboardBG_BottomRight"></td>
                                        </tr>
                                    </table>                                                    
                                </td>
                            </tr>
                            <tr>
                                <td width="50%" valign="top">
                                    <strong>2.0 - Record Conversation</strong><br /><br />
                                    <table width="495px" class="" cellspacing="0" >
                                        <tr>
                                            <td class="dashboardBG_TopLeft">
                                                <table width="100%" >
                                                    <tr>
                                                        <td valign="top" width="5%">2.1</td>
                                                        <td valign="top" style="line-height: 20px; ">
                                                            Record the following information about the conversation:                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top" width="5%">&nbsp;</td>
                                                        <td valign="top" style="line-height: 20px; ">
                                                            <strong>Name of person who you spoke to:</strong>
                                                            <euc:CaisisTextBox Width="250px" ID="PersonSpokeTo" runat="server"  MaxLength="990"/>
                                                        </td>
                                                    </tr>                                                
                                                </table>
                                            </td>
                                            <td class="dashboardBG_TopRight" ></td>
                                        </tr>
                                        <tr>
                                            <td class="dashboardBG_BottomLeft"></td>
                                            <td class="dashboardBG_BottomRight"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" width="100%" valign="top" >

                                    <strong>3.0 - Faxing/Mailing a Request</strong><br /><br />
                                    
                                    <euc:CaisisRadioButtonList ID="CoverSheetViewRBL" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" ShowLabel="false" >
                                        <asp:ListItem Value="Complete A Fax" Text="Complete A Fax" />
                                        <asp:ListItem Value="Complete A Mailing" Text="Complete A Mailing" />
                                    </euc:CaisisRadioButtonList>
                                    <br />
                                    <div id="FaxViewDiv" runat="server" style="display: none; ">
                                        <table width="80%" class="" cellspacing="0" >
                                            <tr>
                                                <td class="dashboardBG_TopLeft">
                                                    <table width="100%">
                                                        <tr>
                                                            <td valign="top" width="5%">3.1</td>
                                                            <td valign="top" style="line-height: 20px; ">
                                                                Enter the information for the coversheet:                                                           
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" valign="top" width="100%">
                                                                <table width="95%" cellpadding="5">
                                                                    <tr>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Date:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="100px" ID="CoverSheetDate" runat="server" ShowCalendar="true" ShowLabel="false" /></td>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>From:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="200px" ID="CoverSheetFrom" runat="server"  ShowLabel="false" /></td>
                                                                        <td valign="top" >&nbsp;</td>
                                                                    </tr>
                                                                   <tr>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>To:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="200px" ID="CoverSheetTo" runat="server" ShowLabel="false"  /></td>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Phone:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="200px" ID="CoverSheetFromPhone" runat="server"  ShowLabel="false" /></td>
                                                                        <td valign="top" >&nbsp;</td>
                                                                    </tr>
                                                                     <tr>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Fax:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="200px" ID="CoverSheetToFax" runat="server"  ShowLabel="false" /></td>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Fax:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="200px" ID="CoverSheetFromFax" runat="server"  ShowLabel="false" /></td>
                                                                        <td valign="top" >&nbsp;</td>
                                                                    </tr>
                                                                   <tr>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Pages:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="100px" ID="CoverSheetFaxPages" runat="server"  ShowLabel="false" /></td>
                                                                        <td valign="top" >&nbsp;</td>
                                                                        <td valign="top" >&nbsp;</td>
                                                                        <td valign="top" >&nbsp;</td>
                                                                    </tr>
                                                                     <tr>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>RE:</strong></td>
                                                                        <td colspan="4" valign="top" ><euc:CaisisTextArea Width="40%" Height="50px" ID="CoverSheetFaxRE" runat="server"  ShowLabel="false" MaxLength="5000"/></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Memo:</strong></td>
                                                                        <td colspan="4" valign="top" ><euc:CaisisTextArea Width="85%" Height="100px" ID="CoverSheetFaxMemo" runat="server" ShowLabel="false" MaxLength="5000" /></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr><td colspan="2" height="10px">&nbsp</td></tr>
                                                         <tr>
                                                            <td valign="top" width="5%">3.2</td>
                                                            <td valign="top">
                                                                Print out coversheet:                                                           
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" valign="top" width="100%">
                                                                <table width="95%" cellpadding="5">
                                                                    <tr>
                                                                        <td width="10%" valign="top" >
                                                                            <span>                                                                    
                                                                                <asp:ImageButton ID="PrintFaxCoverLetter" runat="server"  ShowLabel="false" ImageUrl="~/Modules/FollowUp/Images/PrintFaxCoverSheet.gif" OnClick="PrintFaxCoversheetClick"  />
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr><td colspan="2" height="10px">&nbsp</td></tr>
                                                         <tr>
                                                            <td valign="top" width="5%">3.3</td>
                                                            <td valign="top">
                                                                Coversheet and signed authorization to Dr's office.                                                            
                                                            </td>
                                                        </tr>
                                                    
                                                    </table>
                                                </td>
                                            <td class="dashboardBG_TopRight" ></td>
                                            </tr>
                                            <tr>
                                                <td class="dashboardBG_BottomLeft"></td>
                                                <td class="dashboardBG_BottomRight"></td>
                                            </tr>
                                       </table>
                                    
                                    </div>
                                    
                                    <div id="MailViewDiv" runat="server" style="display: none; ">
                                        <table width="80%" class="" cellspacing="0" >
                                            <tr>
                                                <td class="dashboardBG_TopLeft">
                                                    <table width="100%">
                                                        <tr>
                                                            <td valign="top" width="5%">3.1</td>
                                                            <td valign="top" style="line-height: 20px; ">
                                                                Enter the information for the coverletter:                                                           
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" valign="top" width="100%">
                                                                <table width="95%" cellpadding="5">
                                                                    <tr>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>To:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="200px" ID="CoverLetterTo" runat="server" ShowLabel="false" /></td>
                                                                          <td valign="top" style="white-space: nowrap; " ><strong>City:</strong></td>
                                                                          <td valign="top" ><euc:CaisisTextBox Width="100px" ID="CoverLetterToCity" runat="server"  ShowLabel="false" /></td>                                                               
                                                                    </tr>
                                                                    <tr>
                                                                         <td valign="top" style="white-space: nowrap; " ><strong>Address 1:</strong></td>
                                                                         <td valign="top" ><euc:CaisisTextBox Width="200px" ID="CoverLetterToAddress1" runat="server"  ShowLabel="false" /></td>
                                                                         <td valign="top" style="white-space: nowrap; " ><strong>State:</strong></td>
                                                                         <td valign="top" ><euc:CaisisSelect Width="50px" ID="CoverLetterToState" runat="server"  ShowLabel="false" LookupCode="State" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                         <td valign="top" style="white-space: nowrap; " ><strong>Address 2:</strong></td>
                                                                         <td valign="top" ><euc:CaisisTextBox Width="200px" ID="CoverLetterToAddress2" runat="server"  ShowLabel="false" /></td>                                                                
                                                                         <td valign="top" style="white-space: nowrap; " ><strong>PostalCode:</strong></td>
                                                                         <td valign="top" ><euc:CaisisTextBox Width="100px" ID="CoverLetterToPostalCode" runat="server"  ShowLabel="false" />
                                                                    </tr>

                                                                     <tr>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Date:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="100px" ID="CoverLetterDate" runat="server"  ShowLabel="false" ShowCalendar="true" /></td>
                                                                        <td colspan="2" valign="top" >&nbsp;</td>
                                                                    </tr>
                                                                   <tr>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Salutation:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="200px" ID="CoverLetterSalutation" runat="server"  ShowLabel="false" /></td>
                                                                        <td colspan="2" valign="top" >&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Body:</strong></td>
                                                                        <td colspan="3" valign="top" >
                                                                            <%--<euc:CaisisRichTextEditor Width="85%" Height="100px" ID="CoverLetterBody" runat="server"  ToolbarSet="patiented" FileUploadDirectory="PatientEdImages" FileUploadCaption="Patient Ed Images" FloatingMode="false" Resizable="false" ModeStripVisible="true" />--%>
                                                                            <euc:CaisisTextArea Width="85%" Height="100px" ID="CoverLetterBody" runat="server" ShowLabel="false" MaxLength="5000" /></td>
                                                                    </tr>

                                                                    <tr>
                                                                         <td valign="top" style="white-space: nowrap; " ><strong>Closure Prefix:</strong></td>
                                                                         <td valign="top" ><euc:CaisisTextBox Width="200px" ID="CoverLetterClosure1" runat="server"  ShowLabel="false" /></td>
                                                                         <td valign="top" style="white-space: nowrap; " ><strong>Closure From:</strong></td>
                                                                         <td valign="top" ><euc:CaisisTextBox Width="200px" ID="CoverLetterClosure2" runat="server"  ShowLabel="false" /></td>                                                            
                                                                    </tr>

                                                                    <tr>
                                                                         <td valign="top" style="white-space: nowrap; "  ><strong>Closure Line 3:</strong></td>
                                                                         <td valign="top" ><euc:CaisisTextBox Width="200px" ID="CoverLetterClosure3" runat="server"  ShowLabel="false" /></td>
                                                                         <td valign="top" style="white-space: nowrap; " ><strong>Closure Line 4:</strong></td>
                                                                         <td valign="top" ><euc:CaisisTextBox Width="200px" ID="CoverLetterClosure4" runat="server"  ShowLabel="false" /></td>                                                          
                                                                    </tr>

                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr><td colspan="2" height="10px">&nbsp</td></tr>
                                                         <tr>
                                                            <td valign="top" width="5%">3.2</td>
                                                            <td valign="top">
                                                                Print out coverletter:                                                            
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" valign="top" width="100%">
                                                                <table width="95%" cellpadding="5">
                                                                    <tr>
                                                                        <td width="10%" valign="top" >
                                                                            <span>
                                                                                <asp:ImageButton ID="PrintMailCoverLetter" runat="server" ShowLabel="false" ImageUrl="~/Modules/FollowUp/Images/PrintMailCoverLetter.gif" OnClick="PrintCoverLetterClick" />
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr><td colspan="2" height="10px">&nbsp</td></tr>
                                                         <tr>
                                                            <td valign="top" width="5%">3.3</td>
                                                            <td valign="top">
                                                                Coverletter and signed authorization to Dr's office.                                                           
                                                            </td>
                                                        </tr>
                                                    
                                                    </table>                                                
                                                </td>
                                                <td class="dashboardBG_TopRight" ></td>
                                            </tr>
                                            <tr>
                                                <td class="dashboardBG_BottomLeft"></td>
                                                <td class="dashboardBG_BottomRight"></td>
                                            </tr>

                                       </table>
                                    
                                    </div>

                                </td>
                            </tr>
                          </table>
                        
                    
                    </div>
                </td>
            </tr>

        </table>		                   

        </div> 
 
       
        <div id="ButtonsDiv" runat="server" style="width: 100%;  ">
            <table width="100%" cellpadding="5" >
                  <tr>
                   <td align="left"><asp:ImageButton ID="NeedMD_ContactCompleteBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/NeedMD_ContactCompleteBtn.gif" OnClick="SaveActionClick" /></td>
                   <td align="right">
                    <asp:ImageButton ID="CloseBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/Close.gif" OnClick="CloseModalClick" />
                    <asp:ImageButton ID="CancelBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/Cancel.gif" OnClick="CancelModalClick" />
                   </td>
                </tr>
          
            </table>
        
        </div>
        
        <div class="printButtonsTable" id="PrintButtonsDiv" runat="server" style="display: none; position: relative;" align="center">
        
            <span>
                   <asp:ImageButton ID="ReturnToStatusPageBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/Return.gif"  />
                   <asp:ImageButton ID="PrintCoverSheet" runat="server" ImageUrl="~/Modules/FollowUp/Images/Print.gif" OnClientClick="return printCoversheet();"  />        
            </span><br /><br />
        </div>

          <div id="PrintDiv" runat="server" style="display: none; position: relative;" class="DivWhite"  align="center">
            
            <asp:PlaceHolder id="formHolder" runat="server"></asp:PlaceHolder>
        </div>   
       
    </form>
</body>
</html>

    <script type="text/javascript">

        function printCoversheet() {
            top.printModal();
            return false;
        }


        function returnToStatusPage(pageTitle, pId) {
            window.history.back();
            return false;
        }

        addAbsentEvent($('<%= CoverSheetViewRBL.ClientID %>'));

        function addAbsentEvent(coversheetViewRBL) {

            var rbl = coversheetViewRBL.getElementsByTagName('input');
            for (var j = 0; j < rbl.length; j++) {
                var rblRef = rbl[j];
                if (rblRef.type == 'radio')
                    $(rblRef).addEvent('click', curry(SwitchCoverSheetView, coversheetViewRBL));
            }

            //SwitchCoverSheetViewOnLoad(coversheetViewRBL);
        }
       
        
        function SwitchCoverSheetView(coversheetViewRBL) {
       
            var faxView = document.getElementById('<%= FaxViewDiv.ClientID %>');
            var mailView = document.getElementById('<%= MailViewDiv.ClientID %>');

            var selectedView = RetrieveRadioBtnListSelectedValues(coversheetViewRBL, "TABLE");
            if (selectedView.toLowerCase().indexOf('mail') != -1) {
                
                faxView.style.display = 'none';
                mailView.style.display = '';
                         
            }
            else if (selectedView.toLowerCase().indexOf('fax') != -1) {
                faxView.style.display = '';
                mailView.style.display = 'none';
            }
        }

        window.onload = function SwitchCoverSheetViewOnLoad() {

            var coversheetViewRBL = document.getElementById('<%= CoverSheetViewRBL.ClientID %>');
            var faxView = document.getElementById('<%= FaxViewDiv.ClientID %>');
            var mailView = document.getElementById('<%= MailViewDiv.ClientID %>');

            var selectedView = RetrieveRadioBtnListSelectedValues(coversheetViewRBL, "TABLE");
            if (selectedView.toLowerCase().indexOf('mail') != -1) {

                faxView.style.display = 'none';
                mailView.style.display = '';

            }
            else if (selectedView.toLowerCase().indexOf('fax') != -1) {
                faxView.style.display = '';
                mailView.style.display = 'none';
            }
        }
           
        var seconds = 0;

        function showLoading() {
            var loadingLayer = document.getElementById('<%= LoadingLayer.ClientID %>');   //$('LoadingLayer');
            //loadingLayer.show('');
            //loadingLayer.center();
            loadingLayer.style.display = "";
            showLoadingBar();
            setInterval(showLoadingBar, 1000);
        }

        function showLoadingBar() {
            var loadingLayerText = document.getElementById('<%= LoadingTextLayer.ClientID %>');  //$('LoadingTextLayer');
            var loadingText = 'Processing ... ' + seconds + ' seconds';
            loadingLayerText.innerHTML = loadingText;
            seconds++;
        }

    </script>