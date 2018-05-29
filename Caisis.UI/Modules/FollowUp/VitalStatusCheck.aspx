<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VitalStatusCheck.aspx.cs"
    Inherits="Caisis.UI.Modules.FollowUp.VitalStatusCheck"  %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Check Patient Vital Status</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/DataAnalysis.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/EFormScripts.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript">

        Browser.ResizeElement(
            { nodeId: '<%= ResultsDIV.ClientID %>', heightOffset: 150 },
            { nodeId: '<%= ParametersDIV.ClientID %>', heightOffset: 150 }

                    );

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
            margin: 20% 0% 0% 25%;
            background-color: #004256;
            color: #ffffff;
            border: 2px solid #cccccc;
            font-size: 14px;
            font-weight: bold;
            position: absolute;
            z-index: 500px;
            padding: 5px;
        }
        .ListManDataTableTop
        {
            font-size: 11px;
            font-weight: bold;
            background-color: #3d556d;
        }
       .ParametersSection
        {
	       
	      /* border-bottom: solid 1px #dedede; */
	       padding-bottom: 10px;
        }
        
        .ParametersTitle
        {
    		font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            font-weight: bold;
            color: #111111;
            margin: 0px 0px 5px 2px;
        }

       .navigationHeader

    </style>
    
</head>
<body class="reportContentBody">
    <form id="form1" runat="server">
    
     <table style="text-align: center;">
        <tr>
        
            <td width="20%" align="center" >
   
                <div id="ParametersContainer" style="margin-left: 15px; margin-right: 25px; float: left; " >
            
                <div class="GrayContainerBox_TopLeft" >
                    <div class="GrayContainerBox_TopRight">
                        <div class="GrayContainerBox_BottomLeft">
                            <div class="GrayContainerBox_BottomRight">
                                <div class="GrayContainerBox_InnerContainer" >

                                    <div id="ParametersDIV" runat="server" style="overflow:auto; width:100%; vertical-align: middle;" align="center" >
                                    
                                        <br />
                                        <span class="ParametersTitle">Operations</span><br /><br />
                                        <div id="OperationsDIV" runat="server" class="ParametersSection" style="text-align: center; " >
                                            <asp:Button Width="175px" runat="server" ID="CheckStatusBtn" Text="Check Patient Status" Enabled="false" OnClick="CheckPatientSSIDStatusClick"  />
                                            <br />
                                            <asp:Label ID="UpdateSelectedPatientMsg" runat="server" ForeColor="Green" Font-Italic="false" ></asp:Label><br /><br />
                                            <asp:Button Width="175px" runat="server" ID="UpdateSelectedPatient"  Text="Update Selected Patient(s)" Enabled="false" OnClick="UpdateSelectedPatientClick" />
                                            
                                        </div>
                                         <br />
                                                                           
                                        <span class="ParametersTitle">Service Information</span><br /><br />
                                        <div id="ServiceDIV" runat="server" class="ParametersSection"  style="text-align: left; ">
                                              <%=recordcount%> <asp:Label ID="VitalsMsg" runat="server" /><br /><br />   
                                              SSDMF Requests Remaining: <asp:Label ID="SSDMFRequestsRemaining" runat="server" /> <br /><br />                                                  
                                              Days until service expires:  <asp:Label ID="DaysToSSDIExpiration" runat="server"/><br /><br />                                                  
                                              <b style="color:Red;">*</b> SSN required to run SSDI check<br /><br />
                                        </div>
                                        <br />
                                        
                                        <span class="ParametersTitle">SSDI Results</span><br /><br />
                                        <div id="SSDIDIV" runat="server" class="ParametersSection"  style="text-align: left; ">
                                             <div id="SSDIResultsNoResultsDiv" runat="server" >
                                                <asp:Label ID="SSDINoResutlsMsg" runat="server" Text="No check performed."></asp:Label>
                                            </div>
                                            <div id="SSDIResultsLinkDiv" runat="server"  style="display: none; " >
                                                <a id="SSDIResultsLink" runat="server" onmouseover="ShowSSDIResults()" ><u>View Results</u></a>
                                            </div>
                                            <div id="SSDIResultsDIV" runat="server" align="left" style="display: none; position: absolute; z-index: 100; " onmouseleave="HideSSDIResults()">
                                                <asp:GridView runat="server" ID="ResultsGrid" AutoGenerateColumns="true"
                                                              BackColor="LightGray" HeaderStyle-BackColor="#8d282c" HeaderStyle-ForeColor="#ffffff"
                                                ></asp:GridView>
                                            </div>                                   
                                        </div>
                                        <br />
                                        
                                        <span class="ParametersTitle">Other Messages</span><br /><br />
                                        <div id="OtherDIV" runat="server"  class="ParametersSection" style="text-align: left; ">
                                            <asp:Label runat="server" ID="VitalErrors" CssClass="redText" Text=""></asp:Label>
                                        </div>
                                        
                                        <br />                                     
                                        
                                        <div id="ReturnButtonDIV" runat="server" style="text-align: center; ">
                                            <asp:Button Width="175px" runat="server" ID="ReturnToPatientsDue" Text="Return To Patients Due" OnClick="ReturnToPatientsDueClick" />
                                        </div>
                                         
                                         
                                         
                                   </div>

                                </div>
                             </div>
                          </div>
                        </div>
                      </div>
                      
                      
           
            </div>
           </td>
        <td width="80%" align="center">
            <div id="ResultsContainer" style="margin-left: 15px; margin-right: 15px; text-align: left; " >
            
                <div id="DataAnalysisResultsTitle" style="text-align: left; font-size: 14px; ">Vital Status Check </div>
                <div class="GrayContainerBox_TopLeft" >
                    <div class="GrayContainerBox_TopRight">
                        <div class="GrayContainerBox_BottomLeft">
                            <div class="GrayContainerBox_BottomRight">
                                <div class="GrayContainerBox_InnerContainer" >                            
                                     
                                    <div id="ResultsDIV" runat="server" style="text-align:left; overflow-x: auto; overflow-y:auto; width:99%; vertical-align: middle;" >
                                        
                                        <asp:HiddenField ID="HiddenVitalState" runat="server" />
                                        <span id="LoadingLayer" runat="server" style="display: none;" ><span id="LoadingTextLayer" runat="server"></span></span>

                                        <table width="97%" border="0"  id="VitalSignsHTMLTable" class="ListManDataTableTop"> 
                                        <asp:Repeater ID="VitalPatients" runat="server" OnItemDataBound="CheckVitalStatusRepeater" EnableViewState="true" >                
                                             <HeaderTemplate>
                                                <tr>
                                                    <td id="RunSSDICheckCBTitleCell" runat="server" width="100" class="vitalPatientsHeader" >
                                                        Run SSDI Check<br />
                                                        <img id="RunSSDICheckAll" runat="server" src="~/Images/EFormCheckAll.gif"  class="ClickableImage" style="margin-top: 5px;"  onclick="return checkAllWidgetsInColumn('VitalSignsHTMLTable', 0, 10);" /></td>
                                                    
                                                    <td id="SsdiStatusTitleCell" runat="server" width="100" class="vitalPatientsHeader" >SSDI Status</td>                       
                                                    <td id="UpdatePatientStatusCBTitleCell" runat="server" width="40"  class="vitalPatientsHeader" >Update Patient<br />
                                                        <img id="UpdatePatientStatusCheckAll" runat="server" src="~/Images/EFormCheckAll.gif"  class="ClickableImage" style="margin-top: 5px;"  onclick="return checkAllWidgetsInColumn('VitalSignsHTMLTable', 2, 10);" /></td>
                                                    
                                                    <td id="FinalStatusTitleCell" runat="server" width="100" class="vitalPatientsHeader" >Update Status</td>
				                                    <td id="ptMrnTitleCell" runat="server" width="100" class="vitalPatientsHeader">MRN</td>
				                                    <td id="ptNameTitleCell" runat="server" width="160" class="vitalPatientsHeader">Name</td>
				                                    <td id="PtSSNTitleCell" runat="server" width="100" class="vitalPatientsHeader"> SSN <b style="color:Red;">*</b></td>
				                                    <td id="ptBirthDateTextTitleCell" runat="server" width="100" class="vitalPatientsHeader">DOB</td>
				                                    <td id="ptDeathDateTextTitleCell" runat="server" width="200" class="vitalPatientsHeader">DOD</td>
				                                    <td id="ptContactStatusTitleCell" runat="server" width="100" class="vitalPatientsHeader">Contact Status</td>
				                                </tr>
                                             </HeaderTemplate>
                                             <ItemTemplate>
			                                    <tr id="PatientRow" runat="server" class="vitalPatientsDataA" valign="middle" >
				                                    <td id="RunSSDICheckCBValueCell" runat="server" class="vitalPatientsDataA"  style="text-align: center; ">
				                                        <asp:CheckBox ID="RunSSDICheckCB"  runat="server" AutoPostBack="false" /> </td>
                            				            
				                                    <td id="SsdiStatusValueCell" runat="server" width="100" class="vitalPatientsDataA" >
				                                        <asp:Literal ID="SsdiStatus" runat="server"  />
				                                        </td>
                            				            
				                                    <td id="UpdatePatientStatusCBValueCell" runat="server" width="40" class="vitalPatientsDataA" >
				                                        <asp:CheckBox ID="UpdatePatientStatusCB"  runat="server" AutoPostBack="false" />
				                                        <asp:Literal ID="UpdatePatientStatus"  runat="server" /></td>
                            				            
				                                    <td id="FinalStatusValueCell" runat="server" width="100" class="vitalPatientsDataA" >
				                                        <asp:Literal ID="FinalStatus" runat="server" />&nbsp;</td>

				                                    <td id="ptMrnValueCell" runat="server" width="100" class="vitalPatientsDataA" >
				                                        <asp:Literal ID="ptMrn" runat="server"/>			            
				                                        <asp:Literal ID="PatientId" runat="server" Visible="false" />&nbsp;</td>
                            				            				            
				                                    <td id="ptNameValueCell" runat="server" width="160" class="vitalPatientsDataA" style="text-align: left; white-space: nowrap; " >&nbsp;<asp:Literal ID="ptLastName" runat="server"/>, <asp:Literal ID="ptFirstName" runat="server"/></td>
				                                    <td id="PtSSNValueCell" runat="server" width="100" class="vitalPatientsDataA" ><asp:Literal ID="PtSSN" runat="server"/>&nbsp;</td>
				                                    <td id="ptBirthDateTextValueCell" runat="server" width="100" class="vitalPatientsDataA" ><asp:Literal ID="ptBirthDateText" runat="server"/>&nbsp;</td>
				                                    <td id="ptDeathDateTextValueCell" runat="server" width="200" class="vitalPatientsDataA"  >
				                                        <asp:Literal ID="SsdiDeathDateText" runat="server" Text='<%#DataBinder.Eval( Container.DataItem,"SsdiDeathDateText")%>'/>
				                                        <asp:Literal ID="ptDeathDateText" runat="server"/>&nbsp;</td>
				                                    <td id="ptContactStatusValueCell" runat="server" width="100" class="vitalPatientsDataA" ><asp:Literal ID="ptContactStatus" runat="server"/>&nbsp;</td>
			                                    </tr>
			                                    </ItemTemplate>
		                                    <AlternatingItemTemplate>
			                                    <tr id="PatientRow" runat="server" class="vitalPatientsDataB" valign="middle" >
				                                    <td id="RunSSDICheckCBValueCell" runat="server" class="vitalPatientsDataB" style="text-align: center; ">
				                                        <asp:CheckBox ID="RunSSDICheckCB"  runat="server" AutoPostBack="false" /> </td>
                            				            
				                                    <td id="SsdiStatusValueCell" runat="server" width="100" class="vitalPatientsDataB" >
				                                        <asp:Literal ID="SsdiStatus" runat="server"  />
				                                        </td>
                            				            
				                                    <td id="UpdatePatientStatusCBValueCell" runat="server" width="40" class="vitalPatientsDataB" >
				                                        <asp:CheckBox ID="UpdatePatientStatusCB"  runat="server" AutoPostBack="false" />
				                                        <asp:Literal ID="UpdatePatientStatus"  runat="server" /></td>
                            				            
				                                    <td id="FinalStatusValueCell" runat="server" width="100" class="vitalPatientsDataB" >
				                                        <asp:Literal ID="FinalStatus" runat="server" />&nbsp;</td>

				                                    <td id="ptMrnValueCell" runat="server" width="100" class="vitalPatientsDataB" >
				                                        <asp:Literal ID="ptMrn" runat="server"/>			            
				                                        <asp:Literal ID="PatientId" runat="server" Visible="false" />&nbsp;</td>
                            				            				            
				                                    <td id="ptNameValueCell" runat="server" width="160" class="vitalPatientsDataB" style="text-align: left; white-space: nowrap;" >&nbsp;<asp:Literal ID="ptLastName" runat="server"/>, <asp:Literal ID="ptFirstName" runat="server"/></td>
				                                    <td id="PtSSNValueCell" runat="server" width="100" class="vitalPatientsDataB" ><asp:Literal ID="PtSSN" runat="server"/>&nbsp;</td>
				                                    <td id="ptBirthDateTextValueCell" runat="server" width="100" class="vitalPatientsDataB" ><asp:Literal ID="ptBirthDateText" runat="server"/>&nbsp;</td>
				                                    <td id="ptDeathDateTextValueCell" runat="server" width="200" class="vitalPatientsDataB" >
				                                        <asp:Literal ID="SsdiDeathDateText" runat="server" Text='<%#DataBinder.Eval( Container.DataItem,"SsdiDeathDateText")%>'/>
				                                        <asp:Literal ID="ptDeathDateText" runat="server"/>&nbsp;</td>
				                                    <td id="ptContactStatusValueCell" runat="server" width="100" class="vitalPatientsDataB" ><asp:Literal ID="ptContactStatus" runat="server"/>&nbsp;</td>
			                                    </tr>		        
		                                    </AlternatingItemTemplate>
                                        </asp:Repeater>
                                        
                                        </table>
                                   </div>
                                           
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>

            </div>
        
        </td>
  
     </table>
    </form>
</body>
</html>

    <script type="text/javascript">

        addLoadingEvent($('<%= CheckStatusBtn.ClientID %>'));
        addLoadingEvent($('<%= UpdateSelectedPatientMsg.ClientID %>'));
    
            function addLoadingEvent(btn) {

                $(btn).addEvent('click', curry(showLoading));
            }

        var updateRecordBtn = document.getElementById('<%= UpdateSelectedPatient.ClientID %>');
        if (!updateRecordBtn.disabled && updateRecordBtn.style.display == '') {

            document.getElementById('<%= UpdateSelectedPatientMsg.ClientID %>').innerHTML = 'Verify death date matches.\r Click to update patient record(s).\r\r';
        }
        else{
            document.getElementById('<%= UpdateSelectedPatientMsg.ClientID %>').innerHTML = '';
            }


        function EnableButton(cb, button, dbName) {

            var atLeastOneCBChecked = false;

            // retrieve the base id compoenent for all controls in the current repeater row
            var baseTableId = cb.id.substring(0, cb.id.indexOf("_")) + "_";

            // iterate through all visible repeater rows.  if any row has cb = true, enable button.
            // otherwise, disble button
            var i = 1;
            var baseSuffix = '01';
            var currentRow = document.getElementById(baseTableId + 'ctl' + baseSuffix + '_PatientRow');
            var currentRowCB = document.getElementById(baseTableId + 'ctl' + baseSuffix + '_' + dbName);
            //alert(cb.id + "," + currentRowCB.id + "," + currentRowCB.checked + "," + !currentRowCB.disabled);
            while (currentRowCB != null ) {

                if (currentRowCB.checked && currentRow.style.display == '') {
                    atLeastOneCBChecked = true;
                    break;
                }

                i = i + 1;

                if (i < 10)
                    baseSuffix = "0" + i.toString();
                else
                    baseSuffix = i.toString();

                currentRowCB = document.getElementById(baseTableId + 'ctl' + baseSuffix + '_' + dbName);
                currentRow = document.getElementById(baseTableId + 'ctl' + baseSuffix + '_PatientRow');
            }

            button.disabled = !atLeastOneCBChecked;
        }

        /* overrides funciton toggleWidgetInTableCell() in EformScript.js; now toggles checkboxes/radiobuttons to true and false*/
        function toggleWidgetInTableCell(tableCell, docheck) {
            for (j = 0; j < tableCell.childNodes.length; j++) {
                var node = tableCell.childNodes[j];
                if (node.nodeName == 'INPUT') {
                    var type = node.getAttribute('type');
                    if ((type == 'radio' || type == 'checkbox') && !node.disabled) {
                        toggleWidget(node, !node.checked);
                    }
                } else if (node.nodeName == 'LABEL' || node.nodeName == 'SPAN') {
                    for (k = 0; k < node.childNodes.length; k++) {
                        var nodek = node.childNodes[k];
                        if (nodek.nodeName == 'INPUT') {
                            var typek = nodek.getAttribute('type');
                            if ((typek == 'radio' || typek == 'checkbox') && !nodek.disabled) {
                                toggleWidget(nodek, !nodek.checked);
                            }
                        } else if ((nodek.nodeName == 'LABEL' || nodek.nodeName == 'SPAN') && nodek.getAttribute('style')) {
                            for (l = 0; l < nodek.childNodes.length; l++) {
                                var nodel = nodek.childNodes[l];
                                if (nodel.nodeName == 'INPUT' && nodel.id.indexOf('Other') < 0) {
                                    var typel = nodel.getAttribute('type');
                                    if ((typel == 'radio' || typel == 'checkbox') && !node1.disabled) {
                                        toggleWidget(nodel, !nodel.checked);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }




        function ShowSSDIResults() {
            document.getElementById('<%= SSDIResultsDIV.ClientID %>').style.display = "";
        }

        function HideSSDIResults() {
            document.getElementById('<%= SSDIResultsDIV.ClientID %>').style.display = "none";
        }
    
    </script>