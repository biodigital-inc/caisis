<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StatusNeedPtContactInfo.aspx.cs"
    Inherits="Caisis.UI.Modules.FollowUp.StatusNeedPtContactInfo"  %>
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
    <script src="../../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="../../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    
    <script language="javascript" type="text/javascript">
        Browser.ResizeElement({ nodeId: '<%= PatientResultsDiv.ClientID %>', heightOffset: 155 });

        function confirmSubmit(msg) {
            return confirm(msg);
        }

        function cancelPage() {

            if (confirmSubmit('Contact info has not been updated for patient.\rAre you sure you want to quit?'))
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
                <td align="left" class="SectionTitle2"><strong>Need Contact Info: </strong><i class="ListManTitle" ><%= PatientName %></i> </td>
            </tr>
            <tr>
                <td>
                    <div id="ContactDiv" runat="server" >
                        <table width="100%" cellpadding="0" cellspacing="20">

                            <tr>
                               <td width="50%" valign="top" >

                                    <strong>Address Info</strong><br /><br />
                                    
                                    <div id="AddressInfoDiv" runat="server" >
                                        <table width="540px" class="" cellspacing="0" >
                                            <tr>
                                                <td class="dashboardBG_TopLeft">
                                                    <table width="100%">
                                                        <tr>
                                                            <td valign="top" width="100%">
                                                                    <table width="100%" cellpadding="2">
                                                                        <tr>
                                                                            <td valign="top" style="white-space: nowrap; " ><strong>Address 1:</strong></td>
                                                                            <td valign="top" ><euc:CaisisTextBox Width="175px" ID="PatientAddress1TB" runat="server" ShowLabel="false" /></td>
                                                                            <td valign="top" style="white-space: nowrap; " ><strong>State:</strong></td>
                                                                            <td valign="top" ><euc:CaisisSelect Width="50px" ID="PatientStateSelect" runat="server"  ShowLabel="false" LookupCode="State" /></td>                                                               
                                                                        </tr>
                                                                        <tr>                                                                    
                                                                            <td valign="top" style="white-space: nowrap; " ><strong>Address 2:</strong></td>
                                                                            <td valign="top" ><euc:CaisisTextBox Width="175px" ID="PatientAddress2TB" runat="server"  ShowLabel="false" /></td> 
                                                                            <td valign="top" style="white-space: nowrap; " ><strong>Postal Code:</strong></td>
                                                                            <td valign="top" ><euc:CaisisTextBox Width="100px" ID="PatientPostalCodeTB" runat="server"  ShowLabel="false" /></td>                                                               
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign="top" style="white-space: nowrap; " ><strong>City:</strong></td>
                                                                            <td valign="top" ><euc:CaisisTextBox Width="150px" ID="PatientCityTB" runat="server"  ShowLabel="false" /></td>                                                               
                                                                              <td valign="top" style="white-space: nowrap; " ><strong>Country:</strong></td>
                                                                              <td valign="top" ><euc:CaisisComboBox Width="100px" ID="PatientCountryCB" runat="server"  ShowLabel="false" LookupCode="Country" /></td>                                                               
                                                                        </tr>
                                                                        <tr>
                                                                             <td valign="top" style="white-space: nowrap; " ><strong>Email:</strong></td>
                                                                             <td colspan="3" valign="top" >
                                                                                <euc:CaisisTextBox Width="175px" ID="PatientEmailTB" runat="server"  ShowLabel="false" ValidationGroup="ValidEmail" />
                                                                             </td>                                                                                                                                            
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="4">
                                                                                <asp:RegularExpressionValidator ID="EmailExpression" runat="server" ControlToValidate="PatientEmailTB"
                                                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="ValidEmail"
                                                                                    ErrorMessage="*  Email Address must be of format something@domain.extension" Display="dynamic" >
                                                                                </asp:RegularExpressionValidator>                                                                        
                                                                            </td>
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
                               <td width="50%" valign="top" >

                                    <strong>Business Info</strong><br /><br />
                                    
                                    <div id="BusinessInfoDiv" runat="server" >
                                        <table width="320px" class="" cellspacing="0" >
                                            <tr>
                                                <td class="dashboardBG_TopLeft">
                                                    <table width="100%">
                                                        <tr>
                                                            <td valign="top" width="100%">
                                                                <table width="100%" cellpadding="2">
                                                                    <tr>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Company:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="200px" ID="PatientCompanyTB" runat="server" ShowLabel="false" /></td>
                                                                    </tr>
                                                                    <tr>                                                                    
                                                                         <td valign="top" style="white-space: nowrap; " ><strong>City:</strong></td>
                                                                         <td valign="top" ><euc:CaisisTextBox Width="150px" ID="PatientBusinessCityTB" runat="server"  ShowLabel="false" /></td>                                                               
                                                                    </tr>
                                                                    <tr>
                                                                         <td valign="top" style="white-space: nowrap; " ><strong>State:</strong></td>
                                                                         <td valign="top" ><euc:CaisisSelect Width="50px" ID="PatientBusinessStateSelect" runat="server"  ShowLabel="false" LookupCode="State" /></td>                                                                    
                                                                    </tr>
                                                                    <tr><td colspan="2" height="28"></td></tr>
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
                            </tr>
                            <tr>
                                <td colspan="2" width="100%" valign="top" >

                                    <strong>Contact Person Info</strong><br /><br />
                                    
                                    <div id="ContactInfoDiv" runat="server" >
                                        <table width="640px" class="" cellspacing="0" >
                                            <tr>
                                                <td class="dashboardBG_TopLeft">
                                                    <table width="100%">
                                                        <tr>
                                                            <td valign="top" width="100%">
                                                                <table width="100%" cellpadding="2">
                                                                     <tr>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Contact Person:</strong></td>
                                                                        <td valign="top" colspan="3" ><euc:CaisisTextBox Width="250px" ID="PatientContactPersonTB" runat="server" ShowLabel="false" /></td>                                                              
                                                                    </tr>                                                                   
                                                                    <tr>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Address 1:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="175px" ID="PatientContactAddress1TB" runat="server" ShowLabel="false" /></td>
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>City:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="150px" ID="PatientContactCityTB" runat="server"  ShowLabel="false" /></td>                                                               
                                                                    </tr>
                                                                    <tr>                                                                    
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Address 2:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="175px" ID="PatientContactAddress2TB" runat="server"  ShowLabel="false" /></td> 
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>State:</strong></td>
                                                                        <td valign="top" ><euc:CaisisSelect Width="50px" ID="PatientContactStateSelect" runat="server"  ShowLabel="false" LookupCode="State" /></td>                                                               
                                                                    </tr>
                                                                    <tr>
                                                                         <td valign="top" style="white-space: nowrap; " ><strong>Phone:</strong></td>
                                                                         <td valign="top" >
                                                                            <euc:CaisisTextBox Width="175px" ID="PatientContactPhoneTB" runat="server"  ShowLabel="false" ValidationGroup="ValidEmail" />

                                     
                                                                         </td>                                                                    
                                                                        <td valign="top" style="white-space: nowrap; " ><strong>Postal Code:</strong></td>
                                                                        <td valign="top" ><euc:CaisisTextBox Width="100px" ID="PatientContactPostalCodeTB" runat="server"  ShowLabel="false" /></td>                                                               
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
                   <td align="left"><asp:ImageButton ID="NeedPtContactInfoBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/ClickToCompleteBtn.gif" OnClick="SaveActionClick" /></td>
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