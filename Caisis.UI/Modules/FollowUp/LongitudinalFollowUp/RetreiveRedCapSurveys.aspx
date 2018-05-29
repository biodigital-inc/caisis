<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RetreiveRedCapSurveys.aspx.cs"
    Inherits="Caisis.UI.Modules.FollowUp.RetreiveRedCapSurveys"  %>
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

            if (confirmSubmit('No letter/form received updates have been processed for patient.\rAre you sure you want to quit?'))
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
                <td>
                    <div id="LetterRecievedDiv" runat="server" >
                        <table width="100%" cellpadding="0" cellspacing="20">

                            <tr>
                               <td width="20%" valign="top" align="center" >
                                                                     
                                    <div id="Step1Div" runat="server" >
                                        <table width="320px" class="" cellspacing="0" >
                                            <tr>
                                                <td class="dashboardBG_TopLeft">
                                                    <table width="100%">
                                                        <tr>
                                                            <td valign="top" width="100%">
                                                                <table width="100%" cellpadding="0">
                                                                    <tr>
                                                                        <td align="center" class="PatientListSplashMsg"> <strong>Click button below to retrieve any completed online surveys/forms for patients from REDCap: </strong></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td align="center" >
                                                                        <asp:ImageButton ID="RetreiveCompletedSurveysBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/RetreiveCompletedForms.gif" OnClick="RetreiveCompletedSurveysBtnClick" OnClientClick=" return showLoading('Checking for completed surveys/forms')" />                                                                                        
                                                                    </td>
                                                                   </tr>

                                                                   <%--<tr>
                                                                     <td align="center"><span id="LoadingLayer" runat="server" style="display: none;" ><span id="LoadingTextLayer" runat="server"></span></span></td>
                                                                   </tr>--%>
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
 
                                        <br /><br />
                                        
                                     <div id="Step1ResultsDiv" runat="server" >
                                        <table width="320px" class="" cellspacing="0" >                                            
                                             <tr>
                                                <td class="dashboardBG_TopLeft">
                                                    <table width="100%">
                                                        <tr>
                                                            <td valign="top" width="100%">
                                                                <table width="100%" cellpadding="0">
                                                                    <tr>
                                                                        <td align="center" class="PatientListSplashMsg"> <strong>Results</strong></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                     <td align="center"><span id="LoadingLayer" runat="server" style="display: none;" ><span id="LoadingTextLayer" runat="server"></span></span></td>
                                                                   </tr>
                                                                  <tr>                                                            
                                                                         <td colspan="2" align="left" >
                                                                           <asp:Label ID="RedCapMessage" runat="server" />                                                                                        
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
                                   
                                    </div>                                   

                                </td>
                               <td width="80%" valign="top" >                                    
                                        <table width="98%" class="" cellspacing="0" >
                                            <tr>
                                                <td class="dashboardBG_TopLeft" >                                                    

                                                     <div id="Step1PatientsDiv" runat="server" >

                                                        <table width="98%"> 
                                                            <tr>			                                    
                                                                <td align="left"  class="TableNotes" style="cursor:default; ">
                                                                    * Click patient's name to view comprehensive history
                                                                    <br />
                                                                </td>
                                                                <td  class="TableNotes" style="cursor:default; " align="right" valign="middle" height="1">
                                                                    <span >			                
                                                                            <%= ResultsRecordMemo%>
                                                                    </span>
                                                                    <img src="../../../Images/shim.gif" width="30" height="1"></td>
                                                            </tr>
                                                        </table> 
                                                           <!-- list of patients based on selected criteria -->
                                                            <asp:Repeater ID="rptPatient" runat="server" OnItemDataBound="rptItemDataBound" OnItemCommand="Repeater1_ItemCommand" OnItemCreated="Repeater1_ItemCreated" EnableViewState="true">
                                                                <HeaderTemplate>
                                                                 <table width="98%" class="ListManDataTableTop" > 
                                                                  <tr> 
                                                                    <td id="ControlCellTitle" runat="server" class="ListManDataTableTop" ><asp:Literal ID="ControlTitle" runat="server" /></td>
                                                                    <td id="ControlCellTitle2" runat="server" class="ListManDataTableTop" ><asp:Literal ID="ControlTitle2" runat="server" /></td>
                                                                    <td id="NameCellTitle" runat="server" class="ListManDataTableTop"  >Name</td>
                                                                    <td id="DateOfBirthCellTitle" runat="server" class="ListManDataTableTop" >D.O.B.</td>
                                                                    <td id="MRNCellTitle" runat="server" class="ListManDataTableTop"  >MRN</td>
                                                                    <td id="ContactStatusCellTitle" runat="server" class="ListManDataTableTop"  >Contact Status</td>
                                                                    <td id="CommentsCellTitle" runat="server" class="ListManDataTableTop"  >Comments</td>
                                                                  </tr>							        
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr id="listRow" runat="server"  valign="middle"   >
                                                                        <td id="ControlCellValue" runat="server" align="center" class="ListManDataTableCellA"  >
                                                                                             
                                                                        </td>
                                                                        <td id="ControlCellValue2" runat="server" align="center"  class="ListManDataTableCellA">
                                                                            
                                                                            <asp:Label style="display: none; " ID="StatusPatientId" runat="server" Text='<%# Eval("PatientId") %>' />
                                                                            
                                                                        </td>
                                                                        <td id="NameCellValue" runat="server" align="left" class="ListManDataTableCellA" ><%# ((System.Data.DataRowView)Container.DataItem)["ptFirstName"]%> <%# ((System.Data.DataRowView)Container.DataItem)["ptLastName"]%>&nbsp;</td>
                                                                        <td id="DateOfBirthCellValue" runat="server" align="center" class="ListManDataTableCellA"  >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptBirthDateTExt"]%></td>
                                                                        <td id="MRNCellValue" runat="server" align="center" class="ListManDataTableCellA"  >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptMrn"]%></td>
                                                                        <td id="ContactStatusCellValue" runat="server" align="center" class="ListManDataTableCellA"  >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptContactStatus"]%></td>
                                                                        <td id="CommentsCellValue" runat="server"  align="left" class="ListManDataTableCellA" >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptNotes"]%></td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <tr id="listRow" runat="server"  valign="middle"   >
                                                                        <td id="ControlCellValue" runat="server" align="center" class="ListManDataTableCellB"  >
                                                                        </td>
                                                                        <td id="ControlCellValue2" runat="server" align="center"  class="ListManDataTableCellB">
                                                                            
                                                                            <asp:Label style="display: none; " ID="StatusPatientId" runat="server" Text='<%# Eval("PatientId") %>' />
                                                                            
                                                                        </td>
                                                                        <td id="NameCellValue" runat="server" align="left" class="ListManDataTableCellB" ><%# ((System.Data.DataRowView)Container.DataItem)["ptFirstName"]%> <%# ((System.Data.DataRowView)Container.DataItem)["ptLastName"]%>&nbsp;</td>
                                                                        <td id="DateOfBirthCellValue" runat="server" align="center" class="ListManDataTableCellB"  >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptBirthDateTExt"]%></td>
                                                                        <td id="MRNCellValue" runat="server" align="center" class="ListManDataTableCellB"  >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptMrn"]%></td>
                                                                        <td id="ContactStatusCellValue" runat="server" align="center" class="ListManDataTableCellB"  >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptContactStatus"]%></td>
                                                                        <td id="CommentsCellValue" runat="server"  align="left" class="ListManDataTableCellB" >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptNotes"]%></td>
                                                                    </tr>
                                                                </AlternatingItemTemplate>
                                                                <FooterTemplate>
                                                                    </table>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                    
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


        var seconds = 0;

        function showLoading(loadingText) {

            alert('REDCap functionality is currently unavailable');
            return false;
            
            var loadingLayer = document.getElementById('<%= LoadingLayer.ClientID %>');   //$('LoadingLayer');
            //loadingLayer.show('');
            //loadingLayer.center();
            loadingLayer.style.display = "";
            showLoadingBar(loadingText);
            setInterval(showLoadingBar, 1000);
        }

        function showLoadingBar(loadingText) {
            var loadingLayerText = document.getElementById('<%= LoadingTextLayer.ClientID %>');  //$('LoadingTextLayer');
            var loadingText = loadingText + ' ... ' + seconds + ' seconds';
            loadingLayerText.innerHTML = loadingText;
            seconds++;
        }

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



    </script>