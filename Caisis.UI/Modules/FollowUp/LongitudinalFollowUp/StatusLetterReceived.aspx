<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StatusLetterReceived.aspx.cs"
    Inherits="Caisis.UI.Modules.FollowUp.StatusLetterReceived"  %>
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
        Browser.ResizeElement({ nodeId: '<%= PatientResultsDiv.ClientID %>', heightOffset: 155 });

        function confirmSubmit(msg) {
            return confirm(msg);
        }

        function cancelPage() {

            if (confirmSubmit('No letter received updates have been processed for patient.\rAre you sure you want to quit?'))
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
    .PatientListSplashMsg
    {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 13px;
        color: #8d2a2c;
        font-weight: bold;
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
        

        <table width="98%"> 
            <tr>			                                    
                <td align="left" class="SectionTitle2"><strong>Letter Received: </strong><i class="ListManTitle" ><%= PatientName %></i> </td>
            </tr>
            <tr>
                <td>
                    <div id="LetterRecievedDiv" runat="server" >
                        <table width="100%" cellpadding="0" cellspacing="20">

                            <tr>
                               <td width="33%" valign="top" align="center" >

                                    <strong>Select an option that represents the status of the letter</strong><br /><br />
                                    
                                    <div id="Option1Div" runat="server" >
                                        <table width="420px" class="" cellspacing="0" >
                                            <tr>
                                                <td class="dashboardBG_TopLeft">
                                                    <table width="100%">
                                                        <tr>
                                                            <td valign="top" width="100%">
                                                                <table width="100%" cellpadding="0">
                                                                    <tr>
                                                                        <td valign="top" align="left" ><euc:EformRadioButton ID="Option1RB" runat="server"  AutoPostBack="true" ShowLabel="false"  oncheckedchanged="Option1RB_CheckedChanged"  /></td>
                                                                        <td valign="top" align="left" style="white-space: nowrap; " class="PatientListSplashMsg"><asp:Label ID="Option1Title" runat="server" Text="Option 1:  Letter was recieved complete." /></td>                                                                        
                                                                    </tr>
                                                                </table>
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

                                    <br /><br />
                                    
                                    <div id="Option2Div" runat="server" >
                                        <table width="420px" class="" cellspacing="0" >
                                            <tr>
                                                <td class="dashboardBG_TopLeft">
                                                    <table width="100%">
                                                        <tr>
                                                            <td valign="top" width="100%">
                                                                <table width="100%" cellpadding="0">
                                                                    <tr>
                                                                        <td valign="top" align="left" ><euc:EformRadioButton ID="Option2RB" runat="server" AutoPostBack="true" ShowLabel="false" oncheckedchanged="Option2RB_CheckedChanged" /></td>
                                                                        <td valign="top" align="left" style="white-space: nowrap; " class="PatientListSplashMsg"><asp:Label ID="Option2Title" runat="server" Text="Option 2:  Letter was returned to sender." /><strong></strong>&nbsp;&nbsp;</td>                                                                        
                                                                    </tr>
                                                                </table>
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
                                    
                                    <br /><br />

                                    <div id="Option3Div" runat="server" >
                                        <table width="420px" class="" cellspacing="0" >
                                            <tr>
                                                <td class="dashboardBG_TopLeft">
                                                    <table width="100%">
                                                        <tr>
                                                            <td valign="top" width="100%">
                                                                <table width="100%" cellpadding="0">
                                                                    <tr>
                                                                        <td valign="top" align="left" ><euc:EformRadioButton ID="Option3RB" runat="server" AutoPostBack="true" ShowLabel="false" oncheckedchanged="Option3RB_CheckedChanged"/></td>
                                                                        <td valign="top" align="left" style="white-space: nowrap; " class="PatientListSplashMsg"><asp:Label ID="Option3Title" runat="server" Text="Option 3:  Patient requested to not be contacted at all." /></td>                                                                        
                                                                    </tr>
                                                                </table>
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
                               <td width="65%" valign="top" >                                    
                                        <strong class="PatientListSplashMsg"><asp:Label ID="OptionResultTitle" runat="server" /></strong><br /><br />
                                        <table width="95%" class="" cellspacing="0" >
                                            <tr>
                                                <td class="dashboardBG_TopLeft" height="200px" >                                                    
                                                    <div id="Option1ResultDiv" runat="server" style="display: none; " align="center" >
                                                    
                                                        <table class="" cellspacing="5" >
                                                            <tr>
                                                                <td colspan="2">Enter date letter was received (or today's date if unknown):</td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <euc:CaisisTextBox ID="LetterReceivedDateText" runat="server" ShowLabel="false" CalcDate="true" ShowCalendar="true"/>
                                                                    <euc:CaisisHidden ID="LetterReceivedDate" runat="server" ShowLabel="false" />
                                                                </td>                                                                
                                                            </tr>
                                                            <tr>                                                            
                                                                 <td colspan="2" ><asp:ImageButton style="visibility: hidden; " ID="SubmitLetterReceicedDateBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/ClickToCompleteBtn.gif" OnClick="LetterReceivedClick" /></td>
                                                           </tr>
                                                       </table>          
                                                                                                 
                                                    </div>    
                                                    
                                                     <div id="Option2ResultDiv" runat="server" style="display: none; " align="center" >
                                                    
                                                        <table class="" cellspacing="8" align="left" >
                                                            <tr>
                                                                <td colspan="2" align="left"> <strong>1.  If a fowarding address was provided, update patient's address: </strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" valign="top" align="left" >
                                                                    <table width="100%" cellpadding="5">
                                                                        <tr>
                                                                            <td valign="top" style="white-space: nowrap; " >Address 1:</td>
                                                                            <td valign="top" ><euc:CaisisTextBox Width="175px" ID="PatientAddress1TB" runat="server" ShowLabel="false" /></td>
                                                                            <td valign="top" style="white-space: nowrap; " >State:</td>
                                                                            <td valign="top" ><euc:CaisisSelect Width="50px" ID="PatientStateSelect" runat="server"  ShowLabel="false" LookupCode="State" /></td>                                                               
                                                                        </tr>
                                                                        <tr>                                                                    
                                                                            <td valign="top" style="white-space: nowrap; " >Address 2:</td>
                                                                            <td valign="top" ><euc:CaisisTextBox Width="175px" ID="PatientAddress2TB" runat="server"  ShowLabel="false" /></td> 
                                                                            <td valign="top" style="white-space: nowrap; " >Postal Code:</td>
                                                                            <td valign="top" ><euc:CaisisTextBox Width="100px" ID="PatientPostalCodeTB" runat="server"  ShowLabel="false" /></td>                                                               
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign="top" style="white-space: nowrap; " >City:</td>
                                                                            <td valign="top" ><euc:CaisisTextBox Width="175px" ID="PatientCityTB" runat="server"  ShowLabel="false" /></td>                                                               
                                                                            <td valign="top" style="white-space: nowrap; " >Country:</td>
                                                                            <td valign="top" ><euc:CaisisComboBox Width="100px" ID="PatientCountryCB" runat="server"  ShowLabel="false" LookupCode="Country" /></td>                                                               
                                                                        </tr>
                                                                    </table>
                                                                </td>                                                                
                                                            </tr>
                                                            <tr>                                                            
                                                                 <td colspan="2" align="left" >
                                                                    <asp:ImageButton ID="UpdatePatientAddressBTN" runat="server" ImageUrl="~/Modules/FollowUp/Images/NeedPtContactInfoBtn.gif" OnClick="UpdatePatientAddressClick" />
                                                                        <span>
                                                                            <img id="AddressUpdatedImg" runat="server" border="0" src="~/Modules/FollowUp/Images/checkBox.gif" style="display: none; " />
                                                                            <asp:Label ID="AddressUpdatedLBL" runat="server" Text="" ForeColor="Green" Font-Bold="true"  />
                                                                        </span>                                                                                            
                                                                </td>
                                                           </tr>
                                                            <%--<tr>
                                                                <td colspan="2">&nbsp;</td>
                                                            </tr>--%>
                                                            <tr>
                                                                <td colspan="2" align="left"> <strong>2.  If no fowarding address was provided: </strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" align="left">&nbsp;&nbsp;&nbsp;&nbsp;Throw it away in HIPAA bin</td>
                                                            </tr>
                                                            <%--<tr>
                                                                <td colspan="2">&nbsp;</td>
                                                            </tr>--%>
                                                            <tr>
                                                                <td colspan="2" align="left"> <strong>3.  If MD needs to contact patient, update status below: </strong></td>
                                                            </tr>
                                                            <tr>                                                            
                                                                 <td colspan="2" align="left" >
                                                                    <asp:ImageButton ID="NeedMDContactBTN" runat="server" ImageUrl="~/Modules/FollowUp/Images/ReContactMD.gif" OnClick="NeedMDContactClick" />
                                                                         <span>
                                                                            <img id="NeedMDContactImg" runat="server" border="0" src="~/Modules/FollowUp/Images/checkBox.gif" style="display: none; " />
                                                                            <asp:Label ID="NeedMDContactLBL" runat="server" Text="" ForeColor="Green" Font-Bold="true"  />
                                                                        </span>                                                                                            
                                                                </td>
                                                           </tr>
                                                             <%--<tr>
                                                                <td colspan="2">&nbsp;</td>
                                                            </tr>--%>
                                                            <tr>
                                                                <td colspan="2" align="left"> 
                                                                    <strong>4. When finished:</strong>
                                                                </td>
                                                            </tr>
                                                              <tr>
                                                                <td colspan="2" align="left"><asp:ImageButton ID="Option2CompleteBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/ClickToCompleteBtn.gif" OnClick="SaveActionClick" /></td>
                                                            </tr>
                                                     </table>          
                                                                                                 
                                                    </div>    

                                                     <div id="Option3ResultDiv" runat="server" style="display: none; " align="center" >
                                                    
                                                        <table class="" cellspacing="8" align="left" >
                                                            <tr>
                                                                <td colspan="2" align="left"> <strong>If the patient doesn't want to be contacted any more, update the status below: </strong></td>
                                                            </tr>
                                                            <tr>                                                            
                                                                 <td colspan="2" align="left" >
                                                                    <asp:ImageButton ID="DoNotContactPTBTN" runat="server" ImageUrl="~/Modules/FollowUp/Images/DoNotContactPerPt.gif" OnClick="DoNotContactClick" />                                                                                        
                                                                </td>
                                                           </tr>
                                                     </table>          
                                                                                                 
                                                    </div>    

                                                   &nbsp;                                                     
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
                         </table>
                        
                    
                    </div>
                </td>
            </tr>

        </table>		                   

        </div> 
 
       
        <div id="ButtonsDiv" runat="server" style="width: 100%;  ">
            <table width="100%" cellpadding="5" >
                  <tr>
                   <%--<td align="left"><asp:ImageButton ID="NeedPtContactInfoBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/ClickToCompleteBtn.gif" OnClick="SaveActionClick" /></td>--%>
                   <td align="right">
                    <asp:ImageButton ID="CancelBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/Cancel.gif" OnClick="CancelModalClick" />
                   </td>
                </tr>
          
            </table>
        
        </div>
         
       
    </form>
</body>
</html>

    <script type="text/javascript">

        // Overrides function in DynamicControls.js
        function UpdateAssociatedDate(dateTextElement) {
            dateTextElementId = dateTextElement.id;
            dateFieldId = dateTextElementId.replace('DateText', 'Date');
            dateDisplayId = dateTextElementId.replace('DateText', 'DateDisplay');
            dateElement = document.getElementById(dateFieldId);
            dateDisplayElement = document.getElementById(dateDisplayId);
            fuzzyDate(dateTextElement, dateElement);
            dateTextElement.value = dateElement.value;
            if (dateElement && dateDisplayElement) { dateDisplayElement.innerHTML = dateElement.value; }
        }

        addEventShowElement($('<%= LetterReceivedDateText.ClientID %>'), $('<%= SubmitLetterReceicedDateBtn.ClientID %>'));

        function addEventShowElement(letterReceivedDateText, submitLetterReceivedDateBTN) {
            $(letterReceivedDateText).addEvent('blur', curry(ShowElement, letterReceivedDateText, submitLetterReceivedDateBTN));
            $(letterReceivedDateText).addEvent('change', curry(ShowElement, letterReceivedDateText, submitLetterReceivedDateBTN));

            // run on page load
            ShowElement(letterReceivedDateText, submitLetterReceivedDateBTN);
        }

        function ShowElement(letterReceivedDateText, submitLetterReceivedDateBTN) {

            if (letterReceivedDateText.value != '')
                submitLetterReceivedDateBTN.style.visibility = '';
            else
                submitLetterReceivedDateBTN.style.visibility = 'hidden';
                

        }


    </script>