<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LongitudinalFollowUp.aspx.cs"
    Inherits="Caisis.UI.Modules.FollowUp.LongitudinalFollowUp"  %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Longitudinal Follow Up</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/DataAnalysis.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/EFormScripts.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>
    
    <style type="text/css">
        .reportContentBody { background-color:#ffffff; }
        .DivWhite { background-color:White; }        
        .innerTable
        {
            border: 1px solid #cccccc;
            width:100%;
            background-color:White;
        }
        .vitalPatientsHeader
        {
            background-color: #3d556d;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #FFFFFF;
            text-align: center;
            font-weight:bold;
            border-bottom:solid 1px #dedede;
            white-space: nowrap;
        }
        .vitalPatientsHeader
        {
            background-color: #3d556d;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #FFFFFF;
            text-align: center;
            font-weight:bold;
            border-bottom:solid 1px #dedede;
            white-space: nowrap;
        }
        .vitalPatientsDataA
        {
            background-color: #FFFFFF;
            vertical-align: top;
            border: 0px solid #999999;
            border-collapse: collapse;
            border-bottom:solid 1px #dedede;
            white-space: nowrap;
            font-size: 12px;
            text-align: center;
        }
        .vitalPatientsDataB
        {
            background-color: #DFEDF9;
            vertical-align: top;
            border: 0px solid #999999;
            border-collapse: collapse;
            border-bottom:solid 1px #dedede;
            white-space: nowrap;
            font-size: 12px;
            text-align: center;
        }
        .ClickableImage
        {
            cursor: pointer;
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
            position: relative;
            /*z-index: 500px;*/
            padding: 5px;
        }
        .ListManDataTableTop
        {
            font-size: 11px;
            font-weight: bold;
            background-color: #3d556d;
            border: solid 1px #3d556d;
               
            
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

       .navigationSection
        {
	       
	       /*font-style: italic;*/
	       background-color: #DFEDF9;
        }

       .navigationHeader
        {
            background-color: #3d556d;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 12px;
            color: #FFFFFF;
            text-align: center;
            font-weight:bold;
            border-bottom:solid 1px #dedede;
            white-space: nowrap;
        }
        
    .ClinicalEformHighlightedRow {
	    background-color: #ffffff;
	    background-image: url(../../Images/EformHighlightedRowBG.gif);
	    background-repeat: repeat-x;
	    height: 18px;
	    cursor: pointer;

    }

    .ClinicalEformPopulatedRow {
	    background-image: url(../../Images/EformPopulatedRowBG.gif);
	    background-repeat: repeat-x;
	    height: 18px;
	    cursor: pointer;
    }

    .ClinicalEformPopulatedRowNonClickable {
	    height: 18px;
	    background-color: #efefef;
    }
    .ReportList_ReportOuterContainer
    {
        cursor: pointer; 
    }
    .ReportList_ReportOuterContainerSelected
    {
	    background-image: url(../../Images/ReportListHoverBackground.png);
	    background-repeat: no-repeat;
	    cursor: pointer; 
    }

    
    .PatientListSplashMsg
    {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 14px;
        color: #8d2a2c;
        font-weight: bold;
    }

    </style>
    
    <script type="text/javascript">

        Browser.ResizeElement(
            { nodeId: '<%= ResultsDIV.ClientID %>', heightOffset: 150 },
            { nodeId: '<%= ParametersDIV.ClientID %>', heightOffset: 150 }
          
                    );


    </script>
    
</head>
<body class="reportContentBody">
    <form id="ContactStatusForm" runat="server" method="post">
    <table style="text-align: center;">
        <tr>
        
            <td width="20%" align="center" >
            <div id="ParametersContainer" style="margin-left: 15px; margin-right: 25px; float: left; " >
            
                 <div id="DataAnalysisParametersTitle" align="center">
                    Filter status list by Physician and Disease:</div>
                <div class="GrayContainerBox_TopLeft" >
                    <div class="GrayContainerBox_TopRight">
                        <div class="GrayContainerBox_BottomLeft">
                            <div class="GrayContainerBox_BottomRight">
                                <div class="GrayContainerBox_InnerContainer" >

                                    <div id="ParametersDIV" runat="server" style="overflow:auto; width:100%; vertical-align: middle;" align="center" >
                                        <br />
                                        <div id="PhysicianDiseaseDIV" runat="server" style="text-align: center; " >
                                            
                                            <asp:DropDownList Width="200px" ID="TreatingPhysicianDDL" runat="server"  EnableViewState="true"
                                                        onselectedindexchanged="TreatingPhysicianDDL_SelectedIndexChanged" AutoPostBack="true" />
                                            <br /><br />
                                            <asp:DropDownList Width="200px" ID="PatientDiseaseDDL" runat="server" 
                                                        onselectedindexchanged="PatientDiseaseDDL_SelectedIndexChanged"  AutoPostBack="true" />
                
                                         </div>   
                                     <br />
                                        <div id="ContactStatusDIV" runat="server"  style="height: 70%; overflow-y: auto; width: 92%; " align="center">
                                        
                                            <asp:Button runat="server" ID="PostBackBtn" Visible="false"  />
                                            
                                             <asp:GridView ID="ContactStatusGV" Runat="server" EnableViewState="true" 
                                                AutoGenerateColumns="False" AllowSorting="true" OnSorting="ContactStatus_Sorting"
                                                BorderWidth="1px" BackColor="White" GridLines="Vertical"  Width="92%"
                                                CellPadding="4" BorderStyle="None" 
                                                BorderColor="#DEDFDE" ForeColor="Black" 
                                                    onrowdatabound="ContactStatusGV_RowDataBound">
                                                <FooterStyle BackColor="#CCCC99"></FooterStyle>
                                                <PagerStyle ForeColor="Black" HorizontalAlign="Right" 
                                                   BackColor="#F7F7DE"></PagerStyle>
                                                <HeaderStyle ForeColor="White" Font-Bold="True" 
                                                   BackColor="#3d556d"></HeaderStyle>
                                                <Columns>
                                                    <asp:BoundField HeaderText="Patient Status" DataField="PtContactStatus" 
                                                       SortExpression="PtContactStatus"  ></asp:BoundField>
                                                    <asp:BoundField HeaderText="Count" DataField="NumberOfPatients" 
                                                       SortExpression="NumberOfPatients"></asp:BoundField>
                                                </Columns>
                                                <SelectedRowStyle ForeColor="White" Font-Bold="True" 
                                                     BackColor="#CE5D5A"></SelectedRowStyle>
                                                <RowStyle  ></RowStyle>
                                                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>                                                       
                                            </asp:GridView>     
                                        </div>                                 
                                   <br />
                                       <div id="ResetDIV" runat="server" align="center">
                                            <asp:ImageButton ID="ResetBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/ResetBtn.gif" AlternateText="Restart"  onclick="ResetBtn_Click"   />
                                        </div>
                                    </div>
                               
                            
                                </div>
                             </div>
                          </div>
                        </div>
                      </div>
           
            </div>
            </td>
            
            <td width="80%" align="center" >        
            <div id="ResultsContainer" style="margin-left: 15px; margin-right: 15px; text-align: left; " >
            
                <div id="DataAnalysisResultsTitle" style="text-align: left; font-size: 14px; "><%=GetResultsTitle%> </div>
                <div class="GrayContainerBox_TopLeft" >
                    <div class="GrayContainerBox_TopRight">
                        <div class="GrayContainerBox_BottomLeft">
                            <div class="GrayContainerBox_BottomRight">
                                <div class="GrayContainerBox_InnerContainer" >                            
                                     
                                    <div id="ResultsDIV" runat="server" style="text-align:left; overflow-x: hidden; overflow-y:auto; width:99%; vertical-align: middle;" >

                                    <asp:HiddenField ID="HiddenVitalState" runat="server" />
                                    <span id="LoadingLayer" runat="server" style="display: none;" ><span id="LoadingTextLayer" runat="server"></span></span>

                                         <div id="ContactStatusStartDIV" runat="server" style=" width: 100%; height: 100%;  display: none; " >
                                                <table width="100%" height="95%" >
                                                    <tr>
                                                        <td class="PatientListSplashMsg" style=" width: 100%; vertical-align: middle; text-align: center; ">
                                                            Please select a Patient Status from the left menu to begin.
                                                        </td>
                                                   </tr>
                                               </table>
                                        </div>     
                                            
                                        <div id="ContactStatusResultsDIV" runat="server" style="width: 97%; height: 100%; display : none; overflow-x: hidden; overflow-y: auto; height: 89%; "  >
      
                                        <div class="" >
                                             <table width="100%" border="0"> 
                                                            <tr>			                                    
                                                                <td  class="TableNotes" style="cursor:default; ">Click patient's name to view comprehensive history</td>
                                                                <td  class="TableNotes" style="cursor:default; " align="right" valign="middle" height="1"><span class="">			                
                                                                        <% if (ResultsRecordCount > ResultsNumOfRecordsToDisplay)
                                                            {%>
                                                                            <%if (ResultsStartRow > 0)
                                                                            {%>
                                                                                <a id="A1" href="LongitudinalFollowUp.aspx?startRow=<%= ResultsStartRow-ResultsNumOfRecordsToDisplay %>&sortColumn=<%= FollowUpListSortColumn%>&listType=<%= FollowUpListType%>&listCrit=<%= FollowUpListCriteria%>&treatingPhysicianId=<%= SelectedTreatingPhysicianId%>&treatingPatientDisease=<%= SelectedPatientDisease%>"><img src="../../Images/PatientListPrevious.gif" border="0" width="46" height="10" align="middle"></a><img src="../../Images/shim.gif" width="6" height="1">
                                                                          <%}%>
                                                                        <%= ResultsRecordMemo%>
                                                                        <%if (ResultsRecordCount > (ResultsStartRow + ResultsNumOfRecordsToDisplay))
                                                                            {%>
                                                                                <img src="../../Images/shim.gif" width="6" height="1"><a id="A2"  href="LongitudinalFollowUp.aspx?startRow=<%= ResultsStartRow+ResultsNumOfRecordsToDisplay%>&sortColumn=<%= FollowUpListSortColumn%>&listType=<%= FollowUpListType%>&listCrit=<%= FollowUpListCriteria%>&treatingPhysicianId=<%= SelectedTreatingPhysicianId%>&treatingPatientDisease=<%= SelectedPatientDisease%>" class="TableNotes"><img src="../../Images/PatientListNext.gif" border="0" width="28" height="10" align="middle"></a>
                                                                            <%}%>
                                                                        <% } %>
                                                                        <% else {%>
                                                                            <%= ResultsRecordMemo%>
                                                                        <% } %>
                                                                        </span><img src="../../Images/shim.gif" width="30" height="1"></td>
                                                            </tr>			                                
                                                        </table>
                                            </div>

                                            <table width="97%" border="0" class="ListManDataTableTop"> 
                                                <!-- list of patients based on selected criteria -->
                                                <asp:Repeater ID="rptPatient" runat="server" OnItemDataBound="rptItemDataBound" >
                                                    <HeaderTemplate>
                                                      <tr class="ListManDataTableTop"> 
                                                        <td id="ImageButtonCellTitle" runat="server" class="ListManDataTableTop" style="display: none; " ><asp:Literal ID="ImageButtonTitle" runat="server" /></td>
                                                        <td id="CheckBoxCellTitle" runat="server" class="ListManDataTableTop" style="display: none; " ><asp:Literal ID="CheckBoxTitle" runat="server" /></td>
                                                        <td id="NameCellTitle" runat="server" class="ListManDataTableTop" style="display: none; " ><a style="color: White;"  href="LongitudinalFollowUp.aspx?startRow=<%= ResultsStartRow%>&sortColumn=PtLastName&listType=<%= FollowUpListType%>&listCrit=<%= FollowUpListCriteria%>&treatingPhysicianId=<%= SelectedTreatingPhysicianId%>&treatingPatientDisease=<%= SelectedPatientDisease%>" class="TableNotes">Name</a></td>
                                                        <td id="DateOfBirthCellTitle" runat="server" class="ListManDataTableTop" style="display: none; " >D.O.B.</td>
                                                        <td id="MRNCellTitle" runat="server" class="ListManDataTableTop" style="display: none; " ><a style="color: White;"  href="LongitudinalFollowUp.aspx?startRow=<%= ResultsStartRow%>&sortColumn=PtMRN&listType=<%= FollowUpListType%>&listCrit=<%= FollowUpListCriteria%>&treatingPhysicianId=<%= SelectedTreatingPhysicianId%>&treatingPatientDisease=<%= SelectedPatientDisease%>" class="TableNotes">MRN</a></td>
                                                        <td id="CommentsCellTitle" runat="server" class="ListManDataTableTop" style="display: none; " >Comments</td>
                                                        <td id="HrefLinkCellTitle" runat="server" class="ListManDataTableTop" style="display: none;  " ><asp:Literal ID="HrefLinkTitle" runat="server" /></td>
                                                      </tr>							        
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr id="listRow" runat="server"  valign="middle"   >
                                                            <td id="ImageButtonCellValue" runat="server" style="display: none; " align="center" class="ListManDataTableCellA"><asp:ImageButton id="ImageButtonValue" runat="server" /></td>
                                                            <td id="CheckBoxCellValue" runat="server" style="display: none; " class="ListManDataTableCellA"><asp:CheckBox id="CheckBoxValue" runat="server" /></td>
                                                            <td id="NameCellValue" runat="server" style="display: none; " align="left"  class="ListManDataTableCellA"><%# Eval("ptLastName") %>, <%# Eval("ptFirstName") %>&nbsp;  </td>
                                                            <td id="DateOfBirthCellValue" runat="server" style="display: none; " align="center" class="ListManDataTableCellA">&nbsp;<%# Eval("ptBirthDateText") %></td>
                                                            <td id="MRNCellValue" runat="server" style="display: none; " align="center" class="ListManDataTableCellA">&nbsp;<%# Eval("ptMrn") %></td>
                                                            <td id="CommentsCellValue" runat="server" style="display: none; " align="left" class="ListManDataTableCellA">&nbsp;<%# Eval("ptNotes")%></td>
                                                            <td id="HrefLinkCellValue" runat="server" style="display: none; white-space: nowrap;" align="center" class="ListManDataTableCellA"><u><asp:Literal ID="HrefLinkValue" runat="server" /></u>&nbsp;</td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <AlternatingItemTemplate>
                                                        <tr id="listRow" runat="server"  valign="middle"    >
                                                            <td id="ImageButtonCellValue" runat="server" style="display: none; " align="center" class="ListManDataTableCellB"><asp:ImageButton id="ImageButtonValue" runat="server" /></td>
                                                            <td id="CheckBoxCellValue" runat="server" style="display: none; " class="ListManDataTableCellB"><asp:CheckBox id="CheckBoxValue" runat="server" /></td>
                                                            <td id="NameCellValue" runat="server" style="display: none; " align="left" class="ListManDataTableCellB"><%# Eval("ptLastName") %>, <%# Eval("ptFirstName") %>&nbsp;</td>
                                                            <td id="DateOfBirthCellValue" runat="server" style="display: none; " align="center" class="ListManDataTableCellB">&nbsp;<%# Eval("ptBirthDateText") %></td>
                                                            <td id="MRNCellValue" runat="server" style="display: none; " align="center" class="ListManDataTableCellB">&nbsp;<%# Eval("ptMrn") %></td>
                                                            <td id="CommentsCellValue" runat="server" style="display: none; " align="left" class="ListManDataTableCellB">&nbsp;<%# Eval("ptNotes")%></td>
                                                            <td id="HrefLinkCellValue" runat="server" style="display: none; white-space: nowrap; " align="center" class="ListManDataTableCellB"><u><asp:Literal ID="HrefLinkValue" runat="server" /></u>&nbsp;</td>
                                                        </tr>	                                                        
                                                    </AlternatingItemTemplate>
                                                </asp:Repeater>
        	                                
                                            </table>			                                
                                 

                                        </div>
                                        <div id="ContactStatusButtonsDIV" runat="server" style="width: 97%; display : none; " >
                                            <table width="100%">
                                                <tr>
                                                    <td width="25%" align="right" valign="top" ><asp:ImageButton ID="StatusBtn4" runat="server" Visible="false"  /></td>
                                                    <td width="25%" align="right" valign="top" ><asp:ImageButton ID="StatusBtn3" runat="server" Visible="false" /></td>
                                                    <td width="25%" align="right" valign="top" ><asp:ImageButton ID="StatusBtn2" runat="server" Visible="false"/></td>
                                                    <td width="25%" align="right" valign="top" ><asp:ImageButton ID="StatusBtn1" runat="server" Visible="false" /></td>
                                                </tr>
                                            </table>
                                            
                                        </div>
                                   </div>
                                           
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>

            </div>
            </td>
       </tr>
  </table> 
        
                            

        
   <%-- </div>--%>
    

    
    

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

        function submitContactStatusform() {
            document.forms["ContactStatusForm"].submit();
        }

        function runStatusUtility(pageTitle,pId,alternateFileName) {

            var urlVars;
            if (pId != null && pId != '')
                urlVars = 'patientId='+pId;
            else
                urlVars = 'listCrit=<%= FollowUpListCriteria%>&treatingPhysicianId=<%= SelectedTreatingPhysicianId%>&treatingPatientDisease=<%= SelectedPatientDisease%>&recordCount=<%= ResultsRecordCount %>';

            if (alternateFileName != null && alternateFileName != '')
                top.showModalWithConfig('../../Modules/FollowUp/LongitudinalFollowUp/' + alternateFileName + '?' + urlVars, pageTitle, { width: '85%', height: '85%', showClose: false, showPrint: false, context: window });            
            else
                top.showModalWithConfig('../../Modules/FollowUp/LongitudinalFollowUp/Status<%= FollowUpListCriteria %>.aspx?' + urlVars, pageTitle, { width: '85%', height: '85%', showClose: false, showPrint: false, context: window });


            return false;
        }

        function confirmGoToPage(msg) {
            return confirm(msg);
        }

    if(window.onChildSave==null)
    {
        window.onChildSave = function() {
            var url;

            var is_chrome = false;
            var is_firefox = false;
            
            if ((navigator.userAgent.toLowerCase().indexOf('chrome') > -1) && (navigator.userAgent.toLowerCase().indexOf('msie') < 0))
                is_chrome = true;
            if ((navigator.userAgent.toLowerCase().indexOf('firefox') > -1 && navigator.userAgent.toLowerCase().indexOf('mozilla') > -1) && (navigator.userAgent.toLowerCase().indexOf('msie') < 0))
                is_firefox = true;

            if (is_chrome || is_firefox)
                url = '../../FollowUp/LongitudinalFollowUp.aspx?listType=ContactStatus&listCrit=<%= FollowUpListCriteria %>&treatingPhysicianId=<%= SelectedTreatingPhysicianId %>&treatingPatientDisease=<%= SelectedPatientDisease %>&recordCount=<%= ResultsRecordCount %>';
            else
                url = '../../Modules/FollowUp/LongitudinalFollowUp.aspx?listType=ContactStatus&listCrit=<%= FollowUpListCriteria %>&treatingPhysicianId=<%= SelectedTreatingPhysicianId %>&treatingPatientDisease=<%= SelectedPatientDisease %>&recordCount=<%= ResultsRecordCount %>';
            location.href = url;
            return true;
        }
    }
    </script>
