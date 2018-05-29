<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StatusNeedTumorRegistryCheck.aspx.cs"
    Inherits="Caisis.UI.Modules.FollowUp.StatusNeedTumorRegistryCheck"  %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../../StyleSheets/DataAnalysis.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
    <script src="../../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">

        Browser.ResizeElement({ nodeId: '<%= PatientResultsDiv.ClientID %>', heightOffset: 150 });

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
            


    </script>

    <style type="text/css">
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
<body class="reportContentBody" onunload="return false; reloadMainPage();">
    <form id="ContactStatusForm" runat="server" method="post">
    
        <div id="PatientResultsDiv" runat="server" style="width: 100%; overflow-x: hidden; overflow-y: auto;   ">
        <span id="LoadingLayer" runat="server" style="display: none;" ><span id="LoadingTextLayer" runat="server"></span></span>
            <table class="" width="100%" >
                <tr>            
                    <td>                
                      <div class="" >  
                        <table width="98%"> 
                            <tr>			                                    
                                <td align="left"  class="TableNotes" style="cursor:default; ">
                                    1.  Click the corresponding button below to indicate that the Tumor Registry has been checked.<br />
                                    2.  Set patient's status to 'Current' or 'NeedDataEntry'.
                                    <br /><br />
                                    * Click patient's name to view comprehensive history
                                    <br /><br />
                                </td>
                                <td  class="TableNotes" style="cursor:default; " align="right" valign="middle" height="1">
                                    <span >			                
                                            <%= ResultsRecordMemo%>
                                    </span>
                                    <img src="../../../Images/shim.gif" width="30" height="1"></td>
                            </tr>
                        </table> 
                        </div>
                           <!-- list of patients based on selected criteria -->
                            <asp:Repeater ID="rptPatient" runat="server" OnItemDataBound="rptItemDataBound" OnItemCommand="Repeater1_ItemCommand" OnItemCreated="Repeater1_ItemCreated" EnableViewState="true">
                                <HeaderTemplate>
                                 <table width="98%" class="ListManDataTableTop"> 
                                  <tr> 
                                    <td id="ControlCellTitle" runat="server" class="ListManDataTableTop" ><asp:Literal ID="ControlTitle" runat="server" /></td>
                                    <td id="ControlCellTitle2" runat="server" class="ListManDataTableTop" >Patient Status</td>
                                    <td id="NameCellTitle" runat="server" class="ListManDataTableTop"  >Name</td>
                                    <td id="DateOfBirthCellTitle" runat="server" class="ListManDataTableTop" >D.O.B.</td>
                                    <td id="MRNCellTitle" runat="server" class="ListManDataTableTop"  >MRN</td>
                                    <td id="CommentsCellTitle" runat="server" class="ListManDataTableTop"  >Comments</td>
                                  </tr>							        
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr id="listRow" runat="server"  valign="middle"   >
                                        <td id="ControlCellValue" runat="server" align="center" class="ListManDataTableCellA"  >
                                            <asp:ImageButton ID="TumorRegCheckedBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/TumorRegistryChecked.gif"  CommandName="TumorRegistryChecked" CommandArgument='<%# Eval("PatientId") %>' OnClientClick="showLoading();"/>
                                            <span>
                                                <img id="TumorRegCheckedImg" runat="server" border="0" src="~/Modules/FollowUp/Images/checkBox.gif" style="display: none; " />
                                                <asp:Label ID="TumorRegCheckedLBL" runat="server" Text="" ForeColor="Green" Font-Bold="true"  />
                                            </span>                                                                                              
                                        </td>
                                        <td id="ControlCellValue2" runat="server" align="center"  class="ListManDataTableCellA">
                                            
                                            <asp:Label style="display: none; " ID="StatusPatientId" runat="server" Text='<%# Eval("PatientId") %>' />
                                            <asp:Label ID="StatusLBL" runat="server" Text="NeedTumorRegistryCheck" />
                                            <asp:DropDownList Width="1px" style="display: none; " ID="StatusDDL" runat="server"  OnSelectedIndexChanged="StatusDDL_OnSelectedIndexChanged" AutoPostBack="true"   >
                                                <asp:ListItem Value="Current" Text="Current" />
                                                <asp:ListItem Value="NeedDataEntry" Text="NeedDataEntry" />
                                                <asp:ListItem Value="NeedTumorRegistryCheck" Text="NeedTumorRegistryCheck" Selected="True"/>
                                            </asp:DropDownList>                                          
                                            
                                        </td>
                                        <td id="NameCellValue" runat="server" align="left" class="ListManDataTableCellA" ><%# ((System.Data.DataRowView)Container.DataItem)["ptFirstName"]%> <%# ((System.Data.DataRowView)Container.DataItem)["ptLastName"]%>&nbsp;</td>
                                        <td id="DateOfBirthCellValue" runat="server" align="center" class="ListManDataTableCellA"  >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptBirthDateTExt"]%></td>
                                        <td id="MRNCellValue" runat="server" align="center" class="ListManDataTableCellA"  >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptMrn"]%></td>
                                        <td id="CommentsCellValue" runat="server"  align="left" class="ListManDataTableCellA" >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptNotes"]%></td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr id="listRow" runat="server"  valign="middle"   >
                                        <td id="ControlCellValue" runat="server" align="center" class="ListManDataTableCellB"  >
                                            <asp:ImageButton ID="TumorRegCheckedBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/TumorRegistryChecked.gif"  CommandName="TumorRegistryChecked" CommandArgument='<%# Eval("PatientId") %>' OnClientClick="showLoading();"/>
                                            <span>
                                                <img id="TumorRegCheckedImg" runat="server" border="0" src="~/Modules/FollowUp/Images/checkBox.gif" style="display: none; " />
                                                <asp:Label ID="TumorRegCheckedLBL" runat="server" Text="" ForeColor="Green" Font-Bold="true"  />
                                            </span>                                                                                              
                                        </td>
                                        <td id="ControlCellValue2" runat="server" align="center"  class="ListManDataTableCellB">
                                            
                                            <asp:Label style="display: none; " ID="StatusPatientId" runat="server" Text='<%# Eval("PatientId") %>' />
                                            <asp:Label ID="StatusLBL" runat="server" Text="NeedTumorRegistryCheck" />
                                            <asp:DropDownList Width="1px" style="display: none; " ID="StatusDDL" runat="server"  OnSelectedIndexChanged="StatusDDL_OnSelectedIndexChanged" AutoPostBack="true"   >
                                                <asp:ListItem Value="Current" Text="Current" />
                                                <asp:ListItem Value="NeedDataEntry" Text="NeedDataEntry" />
                                                <asp:ListItem Value="NeedTumorRegistryCheck" Text="NeedTumorRegistryCheck" Selected="True"/>
                                            </asp:DropDownList>                                          
                                            
                                        </td>
                                        <td id="NameCellValue" runat="server" align="left" class="ListManDataTableCellB" ><%# ((System.Data.DataRowView)Container.DataItem)["ptFirstName"]%> <%# ((System.Data.DataRowView)Container.DataItem)["ptLastName"]%>&nbsp;</td>
                                        <td id="DateOfBirthCellValue" runat="server" align="center" class="ListManDataTableCellB"  >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptBirthDateTExt"]%></td>
                                        <td id="MRNCellValue" runat="server" align="center" class="ListManDataTableCellB"  >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptMrn"]%></td>
                                        <td id="CommentsCellValue" runat="server"  align="left" class="ListManDataTableCellB" >&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["ptNotes"]%></td>
                                    </tr>
                                </AlternatingItemTemplate>
                            </asp:Repeater>

                        </table>		                   
                    </td>
                </tr>

            </table>        
        </div> 
        <br />
        <div id="ButtonsDiv" runat="server" style="width: 100%; " align="right" >
            <asp:ImageButton ID="CloseBtn" runat="server" ImageUrl="~/Modules/FollowUp/Images/Close.gif" OnClick="CloseModalClick" /> 
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

        function checkPatientStatus(ddl) {
            if (ddl != null) {
                if (ddl.options[ddl.selectedIndex].value == '') {
                    ddl.focus();
                    alert('Please select a patient status');
                }

            }
        }

    </script>