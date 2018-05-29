<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StatusNeedPtAuthorization.aspx.cs"
    Inherits="Caisis.UI.Modules.FollowUp.StatusNeedPtAuthorization"  %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register Assembly="PdfViewer" Namespace="PdfViewer" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../../StyleSheets/DataAnalysis.css" type="text/css" rel="stylesheet" />
    <link href="../../ProtocolMgmt/StyleSheets/ProtocolMgmtStyles.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
    <script src="../../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
	<script type="text/javascript">



	    function printAddressLabels() {
	        window.frames['FormsContentAddressLabels'].focus();
	        window.frames['FormsContentAddressLabels'].print();

	    }

	    Browser.ResizeElement({ nodeId: '<%= PatientResultsDiv.ClientID %>', heightOffset: 170 });
	    Browser.ResizeElement({ nodeId: '<%= rptPatientDiv.ClientID %>', heightOffset: 310 });
	    Browser.ResizeElement({ nodeId: 'PrintSurveysLetterDiv', heightOffset: 330 });
	    Browser.ResizeElement({ nodeId: 'PrintLabelsDiv', heightOffset: 340 });

        function reloadMainPage() {
            var win = top.getModalCallingWindow();
            if (win != null) {
                // if loaded into modal, signal calling page
                if (win.onChildSave) {
                    var doClose = win.onChildSave.call(win);
                    if (doClose) {
                        top.hideModal();
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

        function confirmSubmit(msg) {
            return confirm(msg);
        }

        function cancelPage() {

            if (confirmSubmit('Are you sure you want to quit?'))
                reloadMainPage();
        }

        function back() {

            history.go(-1);
        }

        function SetPrintPackageSource(patientIds) {
            window.frames["mergedPdf"].location = '../LongitudinalFollowUp/MergedFileContainter.aspx?surveyRuleType=HippaAuthorization&patientIds=' + patientIds;    
        }

        function LoadAddressLabels(patientIds) {

            window.frames["FormsContentAddressLabels"].location = '../PrintLabels.aspx?pIds=' + patientIds;
        }

        var NEEDPTAUTHORIZATION_PACKET_CALLBACK_PATH = '<%= Caisis.UI.Core.Classes.PageUtil.GetBasePath(this.Request) + "/Modules/FollowUp/LongitudinalFollowUp/NeedPacketCallBack.aspx" %>';

        function getPatientNeedPtAuthorizationPacket(patientId, packetDivId, packetLinkTitleId, packetLabelId, packetFileNamesId) {
            // Create params to pass back to server
            var p = new Param();

            p.add('surveyRuleType', 'HippaAuthorization');
            p.add('patientId', patientId);
            p.add('packetDivId', packetDivId);
            p.add('packetLinkTitleId', packetLinkTitleId);
            p.add('packetLabelId', packetLabelId);
            p.add('packetFileNamesId', packetFileNamesId);

            var cbFunc = function(text, xml) {

                var contentArray = eval(text);
                var patientId = contentArray[0];
                var currentStatus = contentArray[1];
                var followUpMonth = contentArray[2];
                var surveySent = contentArray[3];
                var surveysDue = contentArray[4];
                var surveysDueFileNames = contentArray[5];
                var surveyMenuLinkTitle = contentArray[6];
                var packetDivId = contentArray[7];
                var packetLinkTitleId = contentArray[8];
                var packetLabelId = contentArray[9];
                var packetFileNamesId = contentArray[10];

                var packetDiv = document.getElementById(packetDivId);
                var packetLinkTitle = document.getElementById(packetLinkTitleId);
                var packetLabel = document.getElementById(packetLabelId);
                var packetFileNames = document.getElementById(packetFileNamesId);

                packetLinkTitle.innerHTML = currentStatus;
                packetLabel.innerHTML = surveysDue;                
                packetFileNames.innerHTML = surveysDueFileNames;
                packetDiv.style.display = "";

            }
            // Call server
            AjaxManager.MakeRequest('POST', NEEDPTAUTHORIZATION_PACKET_CALLBACK_PATH, p, cbFunc, true);
        }

        function ShowGetNeedPtAuthorizationPacket(patientId, packetDivId, packetLinkTitleId, packetLabelId, packetFileNamesId) {
            getPatientNeedPtAuthorizationPacket(patientId, packetDivId, packetLinkTitleId, packetLabelId, packetFileNamesId);
    
        }

        function HideGetNeedPtAuthorizationPacket(packetDivId, packetLinkTitleId, packetLabelId, packetFileNamesId) {
            
            document.getElementById(packetDivId).style.display = "none";
        }

    </script>

    <style type="text/css">
        .TableNotes{ font-size: 9pt; }
        .reportContentBody { background-color:#ffffff; }
        .DivWhite { background-color:White; }        

        .ListManDataTableTop
        {   
            font-size: 11px;
            font-weight: bold;
            background-color: #3d556d;
        }

        .ListManDataTableCellA
        {
            background-color: #FFFFFF;
            vertical-align: top;
            border: 0px solid #FFFFFF;
            border-collapse: collapse;
            border-bottom:solid 1px #dedede;
            white-space: nowrap;
            font-size: 12px;
        }
        .ListManDataTableCellB
        {
            background-color: #DFEDF9;
            vertical-align: top;
            border: 0px solid #DFEDF9;
            border-collapse: collapse;
            border-bottom:solid 1px #dedede;
            white-space: nowrap;
            font-size: 12px;
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
    
</head>
<body class="reportContentBody"  onunload="return false; reloadMainPage();">
    <form id="ContactStatusForm" runat="server" method="post">
    
        <div id="PatientResultsDiv" runat="server" style="width: 100%; overflow-x: hidden; overflow-y: auto;   ">
        <span id="LoadingLayer" runat="server" style="display: none;" ><span id="LoadingTextLayer" runat="server"></span></span>
            <table class="" width="98%" >
                <tr>            
                    <td>                
                      <div id="SelectCorrespondenceDiv" runat="server" class="" >  
                        <table width="98%" cellpadding="3"> 
                            <tr>
                                <td width="10px" align="left" valign="top"  class="TableNotes" style="cursor:default; ">1.</td>			                                    
                                <td align="left"  valign="top"class="TableNotes" style="cursor:default; ">Click the corresponding checkbox to indicate if patient:<br /> a.)  should be sent an email to complete an online survey, or<br /> b.)  should be mailed a package to complete a survey.  </td>			                                    
                                 <td rowspan="3" align="left">
                                        <table width="200px" class="" cellspacing="0" >
                                            <tr>
                                                <td class="dashboardBG_TopLeft">
                                                    <table width="100%">
                                                        <tr>
                                                            <td valign="top" width="100%">
                                                                <table width="100%" cellpadding="0">
                                                                    <tr>
                                                                        <td valign="top" align="left" style="white-space: nowrap; "><strong># of Pts to email:</strong></td>
                                                                        <td valign="top" align="left" style="white-space: nowrap; "><asp:Label ID="NumOfPatientsToEmail" runat="server" Text="0" ForeColor="Green" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td valign="top" align="left" style="white-space: nowrap; "><strong># of Pts to mail:</strong></td>
                                                                        <td valign="top" align="left" style="white-space: nowrap; "><asp:Label ID="NumOfPatientsToMail" runat="server" Text="0" ForeColor="Green" /></td>                                                                    
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
                                </td>
                                <td rowspan="3"  class="TableNotes" style="cursor:default; " align="right" valign="middle" height="1">
                                    <span >			                
                                            <%= ResultsRecordMemo%>
                                    </span>
                                    <img src="../../../Images/shim.gif" width="30" height="1"></td>
                           
                            </tr>
                            <tr>
                                <td width="10px" align="left"  valign="top"class="TableNotes" style="cursor:default; ">2.</td>			                                    
                                <td align="left" valign="top" class="TableNotes" style="cursor:default; ">Click the <strong>Next</strong> button to continue.</td>			                                                               
                            </tr>
                            <tr>
                                <td width="10px" align="left" valign="top" class="TableNotes" style="cursor:default; "></td>			                                    
                                <td align="left"  valign="top"class="TableNotes" style="cursor:default; ">* Click patient's name to view comprehensive history</td>			                                                               
                            </tr>
                            <tr>
                          </tr>
                        </table> 
                        <div id="rptPatientDiv" runat="server" style="overflow-y:auto; width: 99%; "  >
                      
                           <!-- list of patients based on selected criteria -->
                            <asp:Repeater ID="rptPatient" runat="server" OnItemDataBound="rptItemDataBound" OnItemCommand="Repeater1_ItemCommand" OnItemCreated="Repeater1_ItemCreated" EnableViewState="true">
                                <HeaderTemplate>
                                 <table width="98%" class="ListManDataTableTop"> 
                                  <tr> 
                                    <td id="ControlCellTitle" runat="server" class="ListManDataTableTop" >Email</td>
                                    <td id="ControlCellTitle2" runat="server" class="ListManDataTableTop" >Print</td>
                                    <td id="NameCellTitle" runat="server" class="ListManDataTableTop"  >Name</td>
                                    <td id="MRNCellTitle" runat="server" class="ListManDataTableTop"  >MRN</td>
                                    <td id="PhysicianTreatingCellTitle" runat="server" class="ListManDataTableTop" >Treating Physician</td>
                                    <td id="SurveysDueCellTitle" runat="server" class="ListManDataTableTop"  >Follow Up Status (click for info)</td>
                                  </tr>							        
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr id="listRow" runat="server"  valign="middle"   >
                                        <td id="ControlCellValue" runat="server" align="center" class="ListManDataTableCellA"  >
                                            <euc:CaisisCheckBox ID="EmailCB" runat="server" ShowLabel="false"  /></td>
                                        <td id="ControlCellValue2" runat="server" align="center"  class="ListManDataTableCellA">                                            
                                            <asp:Label style="display: none; " ID="StatusPatientId" runat="server" Text='<%# Eval("PatientId") %>' />
                                            <euc:CaisisCheckBox ID="PrintCB" runat="server" ShowLabel="false" /></td>
                                        <td id="NameCellValue" runat="server" align="left" class="ListManDataTableCellA" ><%# ((System.Data.DataRowView)Container.DataItem)["ptFirstName"]%> <%# ((System.Data.DataRowView)Container.DataItem)["ptLastName"]%>&nbsp;</td>
                                        <td id="MRNCellValue" runat="server" align="center" class="ListManDataTableCellA"  >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptMrn"]%></td>
                                        <td id="PhysicianTreatingCellValue" runat="server" align="left" class="ListManDataTableCellA"  >&nbsp;<asp:Literal ID="PhysicianTreating" runat="server" /></td>
                                        <td id="SurveysDueCellValue" runat="server"  align="center" valign="middle" class="ListManDataTableCellA" >                                                  
                                             <a id="SurveyMenuLink" runat="server" style="color: Blue; "  ><asp:Label id="SurveyMenuLinkTitle" runat="server" /></a>
                                             <div align="left">
                                             <div id="SurveyPacketMenuDiv" runat="server" align="left" style="display: none; position: absolute; z-index: 100; right:15%; width: 300px; ">
                                                  <table width="100%" cellpadding="2" style=" background-color: White; border: solid 5px #8D2A2C; ">
                                                    <tr>
                                                        <td width="100%" style="font-size: 12px; white-space: nowrap;  ">
                                                          <asp:Label ID="SurveysDue" runat="server" />
                                                          <asp:Label style="display: none; " ID="SurveysDueFileNames" runat="server" />                                                        
                                                        </td>
                                                    </tr>
                                                  </table>
                                             </div> 
                                             </div>                                       
                                        </td>                                                  
                                                  
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr id="listRow" runat="server"  valign="middle"   >
                                        <td id="ControlCellValue" runat="server" align="center" class="ListManDataTableCellB"  >
                                            <euc:CaisisCheckBox ID="EmailCB" runat="server" ShowLabel="false" /></td>
                                        <td id="ControlCellValue2" runat="server" align="center"  class="ListManDataTableCellB">                                            
                                            <asp:Label style="display: none; " ID="StatusPatientId" runat="server" Text='<%# Eval("PatientId") %>' />
                                            <euc:CaisisCheckBox ID="PrintCB" runat="server" ShowLabel="false" /></td>
                                        <td id="NameCellValue" runat="server" align="left" class="ListManDataTableCellB" ><%# ((System.Data.DataRowView)Container.DataItem)["ptFirstName"]%> <%# ((System.Data.DataRowView)Container.DataItem)["ptLastName"]%>&nbsp;</td>
                                        <td id="MRNCellValue" runat="server" align="center" class="ListManDataTableCellB"  >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptMrn"]%></td>
                                        <td id="PhysicianTreatingCellValue" runat="server" align="left" class="ListManDataTableCellB"  >&nbsp;<asp:Literal ID="PhysicianTreating" runat="server" /></td>
                                        <td id="SurveysDueCellValue" runat="server"  align="center" valign="middle" class="ListManDataTableCellB" >                                                  
                                             <a id="SurveyMenuLink" runat="server" style="color: Blue; "  ><asp:Label id="SurveyMenuLinkTitle" runat="server" /></a>
                                             <div align="left">
                                             <div id="SurveyPacketMenuDiv" runat="server" align="left" style="display: none; position: absolute; z-index: 100; right:15%; width: 300px; ">
                                                  <table width="100%" cellpadding="2" style=" background-color: White; border: solid 5px #8D2A2C; ">
                                                    <tr>
                                                        <td width="100%" style="font-size: 12px; white-space: nowrap;  ">
                                                          <asp:Label ID="SurveysDue" runat="server" />
                                                          <asp:Label style="display: none; " ID="SurveysDueFileNames" runat="server" />                                                        
                                                        </td>
                                                    </tr>
                                                  </table>
                                             </div> 
                                             </div>                                        
                                        </td>                                                  
                                    </tr>
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
	                  </div>
	                  
	                  <div id="ProcessCorrespondenceDiv" runat="server" style="display: none; ">
                            <table width="98%" cellpadding="3"> 
                                <tr>
                                    <td width="10px" align="left" valign="top"  class="TableNotes" style="cursor:default; ">3.</td>
                                    <td align="left" valign="top" class="TableNotes" style="cursor:default; ">Click corresponding buttons to send emails or print mailing packets.  Upon selecting correspondence, follow any additional steps/instructions provided.</td>
                                </tr>
	                        </table>
                            <table width="98%" cellpadding="0" cellspacing="20">

                                <tr>
                                   <td width="25%" valign="top" align="left" >
                                       
                                        <div id="Option1Div" runat="server" >
                                            <table width="375px" class="" cellspacing="0" >
                                                <tr>
                                                    <td class="dashboardBG_TopLeft">
                                                        <table width="100%">
                                                            <tr>
                                                                <td valign="top" width="100%">
                                                                    <table width="100%" cellpadding="0">
                                                                        <tr>
                                                                            <td valign="top" align="left" width="40px" ><euc:EformRadioButton ID="Option1RB" runat="server"  AutoPostBack="true" ShowLabel="false"  oncheckedchanged="Option1RB_CheckedChanged"  /></td>
                                                                            <td valign="top" align="left" style="white-space: nowrap; " class="PatientListSplashMsg"><asp:Label ID="Option1Title" runat="server" Text="Email" /></td>                                                                        
                                                                        </tr>
                                                                         <tr>
                                                                            <td colspan="2" style="font-size: 9pt; text-align: center; ">
                                                                                <asp:Label ID="Option1Details" runat="server" Text="" />                                                                                 
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

                                        <br /><br />
                                        
                                        <div id="Option2Div" runat="server" >
                                            <table width="375px" class="" cellspacing="0" >
                                                <tr>
                                                    <td class="dashboardBG_TopLeft">
                                                        <table width="100%">
                                                            <tr>
                                                                <td valign="top" width="100%">
                                                                    <table width="100%" cellpadding="0">
                                                                        <tr>
                                                                            <td valign="top" align="left" width="40px" ><euc:EformRadioButton ID="Option2RB" runat="server" AutoPostBack="true" ShowLabel="false" oncheckedchanged="Option2RB_CheckedChanged" /></td>
                                                                            <td valign="top" align="left" style="white-space: nowrap; " class="PatientListSplashMsg"><asp:Label ID="Option2Title" runat="server" Text="Print" /><strong></strong>&nbsp;&nbsp;</td>                                                                        
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="font-size: 9pt; text-align: center; ">
                                                                                <asp:Label ID="Option2Details" runat="server" Text="" />                                                                                 
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
                                   <td width="75%" valign="top" >                                    
                                            <table width="98%" class="" cellspacing="0">
                                                <tr>
                                                    <td class="dashboardBG_TopLeft" height="360px"  align="center">                                                    

                                                        <div id="Option1ResultDiv" runat="server" style="display: none;" align="center" >
                                                                        
                                                                        <b style="color: Red; ">Email Functionality Currently Unavailable</b>                          
                                                        </div>    

                                                        <div id="Option2ResultDiv" runat="server" style="display: none; " align="left"  >    
                                                        
                                                        	<table width="98%" border="0" cellspacing="0" cellpadding="0" >
		                                                        <tr>
			                                                        <td valign="bottom" style="text-align:left;">
			                                                            <span>
			                                                                View:
                                                                            <euc:CaisisRadioButton runat="server" ID="RbPrintTypeSurveys" Text="Surveys/Letters/Forms" LabelClass="LabelName" Checked="True" Value="Survey" GroupName="PrintFormTypes" AutoPostBack="True" OnCheckedChanged="OnRbPrintTypeLabelsCheckChange" />
                                                                            <euc:CaisisRadioButton runat="server" ID="RbPrintTypeLabels" Text="Labels" LabelClass="LabelName" Value="Label" GroupName="PrintFormTypes" AutoPostBack="True" OnCheckedChanged="OnRbPrintTypeLabelsCheckChange" />
			                                                                <a id="printFormButtonAnchor" runat="server" href="javascript:printAddressLabels();" visible="false" >
			                                                                    <img id="printFormButton" src="../../../Images/FormImages/Print.gif" width="60" height="23" border="0" hspace="30" runat="server"/>
			                                                                </a>
			                                                            </span>
			                                                        </td>
		                                                        </tr>
		                                                    </table>

                                                            <div id="PrintLabelsDiv" runat="server" style="display: none; overflow-x: auto; overflow-y: hidden; ">
                                                                <div style="width: 850px; height: 350px; ">
                                                                    <iframe id="FormsContentAddressLabels" name="FormsContentAddressLabels" runat="server"  style="width: 100%; height: 100%" scrolling="no" frameborder="0"   ></iframe>                                                                
                                                                </div>
                                                            </div>
                                                            
                                                            <div id="PrintSurveysLetterDiv" runat="server" >
                                                                <iframe name="mergedPdf" id="mergedPdf" frameborder="0" scrolling="no" style="width: 100%; height: 100%"></iframe>
                                                            </div>
                                                            
                                                            
                                                            <div id="PrintConfirmationDiv" runat="server">
                                                                 <table class="" cellspacing="8" align="left" >
                                                                    <tr>                                                            
                                                                         <td align="left"> <span id="Span1" runat="server"><b style="color: blue;">Click when printing is complete: </b></span></td>
                                                                         <td align="left" style="white-space: nowrap; " >
                                                                            <asp:ImageButton ID="PrintingCompleteBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/PrintingComplete.gif" OnClick="PrintingCompleteClick" OnClientClick="return IsPrintingComplete();" />                                                                                           
                                                                        </td>
                                                                   </tr>
                                                                 </table>  
                                                             </div>                                                         
                                                                                                    
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
        <br />
        <div id="ButtonsDiv" runat="server" style="width: 100%; " >
            <table width="100%">
                <tr>
                    <td width="33%" valign="top" align="left" >
                            <%--<asp:ImageButton ID="ClickToCompleteBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/ClickToCompleteBtn.gif" OnClick="CloseModalClick" />--%></td>
                    <td width="34%" align="center" valign="top" >
                        <span>
                            <asp:ImageButton ID="BackBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/BackBtn.gif" OnClick="SelectPatientsClick" />
                            <asp:ImageButton ID="NextBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/NextBtn.gif" OnClick="PatientsSelectedClick" />
                        </span>
                        &nbsp;
                    </td>
                    <td width="33%" align="right" valign="top" > 
                            
                        <asp:ImageButton ID="CloseBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/Close.gif" OnClick="CloseModalClick" /> &nbsp;</td>
                </tr>
            
            </table>
             
        </div>
       
    </form>
</body>
</html>

    <script type="text/javascript">

        function confirmSubmit(msg) {
            return confirm(msg);
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

        function mutuallyExcludeCheckbox(emailCB, mailCB, action) {


            if (emailCB != null && mailCB != null ) {

                var numToEmail = document.getElementById('<%= NumOfPatientsToEmail.ClientID %>');
                var numToMail = document.getElementById('<%= NumOfPatientsToMail.ClientID %>');
                var index;

                if (action == 'email') {
                    if (emailCB.checked) {
                        index = parseInt(numToEmail.innerHTML);
                        index = index + 1;
                        numToEmail.innerHTML = index.toString();

                        if (mailCB.checked) {
                            index = parseInt(numToMail.innerHTML);
                            if (index > 0) {
                                index = index - 1;
                                numToMail.innerHTML = index.toString();
                            }
                            mailCB.checked = false;
                        }

                    }
                    else {
                        index = parseInt(numToEmail.innerHTML);
                        if (index > 0) {
                            index = index - 1;
                            numToEmail.innerHTML = index.toString();
                        }
                    }
                }
                else if (action == 'mail') {
                    if (mailCB.checked) {
                        index = parseInt(numToMail.innerHTML);
                        index = index + 1;
                        numToMail.innerHTML = index.toString();

                        if (emailCB.checked) {
                            index = parseInt(numToEmail.innerHTML);
                            if (index > 0) {
                                index = index - 1;
                                numToEmail.innerHTML = index.toString();
                            }
                            emailCB.checked = false;
                        }
                    }
                    else {
                        index = parseInt(numToMail.innerHTML);
                        if (index > 0) {
                            index = index - 1;
                            numToMail.innerHTML = index.toString();
                        }
                    }

                }
            }
        }

        var nonIEUserMessage = 'Note: Printing PDFs for Caisis Longitudinal Follow Up currently requires Microsoft Internet Explorer.';
        var is_chrome = false;
        var is_firefox = false;
        var is_IE = false;

        if ((navigator.userAgent.toLowerCase().indexOf('chrome') > -1) && (navigator.userAgent.toLowerCase().indexOf('msie') < 0))
            is_chrome = true;
        if ((navigator.userAgent.toLowerCase().indexOf('firefox') > -1 && navigator.userAgent.toLowerCase().indexOf('mozilla') > -1) && (navigator.userAgent.toLowerCase().indexOf('msie') < 0))
            is_firefox = true;
        is_IE = document.all && window.attachEvent;    

        addAbsentEventCorrespondence($('<%= Option1RB.ClientID %>'), $('<%= Option2RB.ClientID %>'));

        function addAbsentEventCorrespondence(option1RB, option2RB) {
            //$(option2RB).addEvent('click', curry(HandleOption2Click, option2RB));

       }

        function HandleOption2Click(option2RB) {

            if (!is_IE) {
                alert(nonIEUserMessage);
                option2RB.checked = false;
                option2RB.blur();
                return false;
            }
            return true;
        }

        function IsPrintingComplete() {

            if (confirmSubmit('Are you sure all materials printed successfully?'))
                return true;
            return false;
            
        }


    </script>