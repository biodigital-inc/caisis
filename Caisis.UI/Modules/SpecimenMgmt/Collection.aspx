<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>

<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Collection.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.Collection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Collection</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio 7.0" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
	<link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>   
	<script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
	<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
	<script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
	
    <script type="text/javascript">  
        
        Browser.ResizeElement( { nodeId: 'resultsDiv', heightOffset: 470 } );
        
        function showSpecimenInfo(id)
	    {           
            var page = "EditSpecimens.aspx?specimenId=" + id;
            var url = window.location.href;
            url = url.substr(0,url.lastIndexOf("/")) + "/" + page;
                       
            top.showRefrshIcon = getRefreshHelper();

            top.showModalWithConfig(url, 'Edit Specimen Details', { width: '600px', showPrint : false, context: window });
	    }	    
	    function getRefreshHelper()
	    {
	        var refreshIcon = document.getElementById('RefreshLayer');
	        return function()
	        {
	            refreshIcon.style.display = '';
	        }
	    }

        // capture modal close
	    function onModalClose() {
	        hideSpecimenInfo();
	    }
	    
	    function hideSpecimenInfo() { document.Form1.submit(); }  
	    
	    function popupPrintCollectionWindow()
	    {
	        //have to get the ColId to pass on each Printcollection submit
	        var colId=document.getElementById('ColId').value;
	        var pageAndQS = 'CollectionPrintView.aspx?CollectionId=' + colId;
	        window.open(pageAndQS,'PrintView', 'toolbars=no,resize=no,scrollbars=no,left=300,top=200');
	    }  
    </script>
    
    <style type="text/css">
        td.leftL
        {
            width:40%; text-align:right; font-size:11px; 
        }
        td.leftR
        {
            width:60%; text-align:left; font-size:11px;
        }
        td.rightL
        {
            width:25%; text-align:right; font-size:11px; 
        }
        td.rightR
        {
            width:75%; text-align:left; font-size:11px;
        }
        td.left
        {
            width:50%; text-align:left; padding-top:16px; vertical-align:top;
        }
        td.right
        {
            width:50%; text-align:left; padding-top:15px; vertical-align:top; 
        }
        table.leftAndRight
        {
            align: center; 
            cellspacing:5px; cellpadding: 5px;
        }
        td.headerTitle
        {
            font-weight: bold; font-size: 11px; color: #ffffff; 
            font-family: Verdana, Arial, Helvetica, sans-serif; 
            height:20px;
            text-align:center;
            border-color:#999999; border-width:1px; border-style:solid; 
        }
    </style>

</head>
<body style="margin: 0px; background-color:#f8fafc; width:100%;">
    <form id="Form1" action="" method="post" runat="server" defaultfocus="collectionName">
    <!-- Getting CollectionId -->
    <asp:HiddenField runat="server" ID="ColId" />
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color:#f8fafc; height:100%;">
            <!-- Collection Name Prompt when adding specimens to "new collection" -->
            <tr id="collectionNamePage" runat="server" visible="false">
                 <td>
                     <table id="Table1" runat="server" visible="true" width="775" align="center" border="0" cellpadding="0" cellspacing="0" style="background-color:#f8fafc;">
                        <tr>
                            <td colspan="3" class="ListManTitle" style="height: 50px; text-align: left; vertical-align: bottom; padding-bottom:7px;">
                                <div style="vertical-align: bottom; padding-top: 12px;">
                                    Enter A Name For the New Collection
                                </div>
                            </td>
                        </tr>
                    
                        <!-- Rounded Top Border -->
                        <tr>
                            <td style="background-color: #F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
                            <td class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="10" height="5"></td>
                            <td style="background-color: #F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
                        </tr>
                        <!-- Collection Info Input Controls -->
                        <tr>
                            <td class="ListManBGTableLeftSide" style="width: 1px;">&nbsp;</td>
                            <td align="center" style="background-color: #F1F7FC; padding-top:25px; padding-bottom:100px;">
                                <cc:CaisisTextBox ID="newCollectionName" runat="server" FieldLabel="Collection Name " Width="275"
                                    MaxLength="50"></cc:CaisisTextBox>
                                
                                <div style="color: #ff3366; padding-bottom:25px;">
                                    &nbsp;<asp:Label ID="colNameError" runat="server"></asp:Label> 
                                </div>
                                
                                <asp:ImageButton ID="btnSubmit" runat="server" OnClick="btnSubmit_onClick" ImageUrl="../../images/submit.gif" />
                            </td>
                            <td class="ListManBGTableRightSide" style="width: 1px;">&nbsp;</td>
                        </tr>
                        <!-- Rounded Bottom Border -->
                        <tr>
                            <td style="background-color: #F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
                            <td class="ListManagerBGTableBottom">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td style="background-color: #F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            
            <!-- Collection Details -->
            <tr id="collectionDetailsPage" runat="server" visible="true">
                <td align="center">
                    <table id="SearchLayer" runat="server" width="820" border="0" cellspacing="0" cellpadding="0" style="z-index:69;">
                        <tr>
                            <td style="height:15px;" colspan="6"><img src="../../Images/shim.gif" width="1" height="1"></td>
                        </tr>
                      
                        <!-- Page Title and ModifyQuery and Print Icons -->
                        <tr>
                            <td style="width: 1px;">&nbsp;</td>
                            <td colspan="4" class="ListManTitle" style="height: 30px; text-align: left; vertical-align: bottom;">
                                <div style="float: left; vertical-align: bottom; padding-top: 5px;">
                                    <!-- Page Title: "Edit Collection" or "Add #specs to Collection" or "Add #specs to New Collection" -->
                                    <asp:Label ID="pageTitle" runat="server"></asp:Label>
                                </div>
                                <div style="float: right; vertical-align: bottom; padding-bottom: 5px;">
                                    <asp:ImageButton ID="backToSearchIcon" runat="server" Visible="true" AlternateText="Back to Search Results"
                                        ImageUrl="Images/BackToSearchResults.gif" OnClientClick="window.history.back(-1);return false;" OnCommand="GoToSearch" />
                                    <asp:ImageButton ID="printIcon" runat="server" OnClientClick="popupPrintCollectionWindow();" Visible="false" AlternateText="Print Collection"
                                        ImageUrl="Images/PrintCollection.gif" />
                                </div>
                            </td>
                            <td style="width: 1px;">&nbsp;</td>
                        </tr>
                       
                        <!-- Rounded Top Border -->
                        <tr>
                            <td style="background-color: #F1F7FC; width:5px;">
                                <img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
                            <td colspan="4" class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="10" height="5"></td>
                            <td style="background-color: #F1F7FC; width:5px;">
                                <img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
                        </tr>
                        
                        <!-- Collection Info Input Controls -->
                        <tr>
                            <td class="ListManBGTableLeftSide" style="width: 1px;">&nbsp;</td>
                            <td colspan="2" align="center" style="background-color: #F1F7FC; vertical-align: top;">
                                <div style="float: left; padding-top: 10px; width: 400px;">
                                    <cc:CaisisTextBox ReadOnly="true" FieldLabel="Collection Id" Visible="false" runat="server"
                                        Table="SpecimenCollections" Field="CollectionId" ID="CollectionId" TabIndex="0"
                                        MaxLength="10" Width="0" ShowLabel="False"></cc:CaisisTextBox>
                                    <table class="leftAndRight">
                                        <tr>
                                            <td class="leftL" style="padding-bottom: 7px; padding-top: 4px; vertical-align: top;">
                                                Name
                                            </td>
                                            <td class="leftR" style="padding-bottom: 7px;">
                                                <cc:CaisisTextBox FieldLabel="Name " runat="server" Table="SpecimenCollections" Field="CollectionName"
                                                    ID="CollectionName" TabIndex="1" MaxLength="50" Width="195" ShowLabel="False"></cc:CaisisTextBox>
                                                &nbsp; <span style="color: #ff3366;">
                                                    <asp:Label ID="errorMessage" runat="server"></asp:Label></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="leftL" style="padding-bottom: 7px;">
                                                Date Created
                                            </td>
                                            <td class="leftR" style="padding-bottom: 7px;">
                                                <cc:CaisisTextBox FieldLabel="Date Created " runat="server" Table="SpecimenCollections"
                                                    Field="CollectionAssignDate" ID="CollectionAssignDate" TabIndex="2" onblur="isDateAndNotEmpty(this.id, this.value)"
                                                    ShowCalendar="True" Width="195" ShowLabel="False"></cc:CaisisTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="leftL" style="padding-bottom: 7px;">
                                                Type
                                            </td>
                                            <td class="leftR" style="padding-bottom: 7px;">
                                                <cc:CaisisSelect FieldLabel="Type " runat="server" Table="SpecimenCollections" Field="CollectionType"
                                                    ID="CollectionType" TabIndex="3" LookupCode="Specimen_CollectionType" Width="200"
                                                    ShowLabel="False">
                                                </cc:CaisisSelect>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="leftL" style="padding-bottom: 7px;">
                                                Status
                                            </td>
                                            <td class="leftR" style="padding-bottom: 7px;">
                                                <cc:CaisisSelect FieldLabel="Status " runat="server" Table="SpecimenCollections"
                                                    Field="CollectionStatus" ID="CollectionStatus" TabIndex="4" LookupCode="Specimen_CollectionStatus"
                                                    Width="200" ShowLabel="False">
                                                </cc:CaisisSelect>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                            <td colspan="2" style="background-color: #F1F7FC; vertical-align: top;">
                                <div style="float: right; padding-top: 10px; width: 400px;">
                                    <table class="leftAndRight">
                                        <tr>
                                            <td class="rightL" style="padding-bottom: 7px;">
                                                Project Code
                                            </td>
                                            <td class="rightR" style="padding-bottom: 7px;">
                                                <cc:CaisisTextBox FieldLabel="Project Code " runat="server" Table="SpecimenCollections"
                                                    Field="CollectionProjectCode" ID="CollectionProjectCode" TabIndex="5" MaxLength="50"
                                                    Width="200" ShowLabel="False"></cc:CaisisTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="rightL" style="padding-bottom: 7px; vertical-align: top;">
                                                Notes
                                            </td>
                                            <td class="rightR" style="padding-bottom: 7px;">
                                                <cc:CaisisTextArea FieldLabel="Notes " runat="server" Table="SpecimenCollections"
                                                    Field="CollectionAssignNotes" ID="CollectionAssignNotes" TabIndex="6" Font-Size="Small"
                                                    Height="70" Width="200" ShowLabel="False"></cc:CaisisTextArea>
                                            </td>
                                        </tr>
                                       
                                    </table>
                                </div>
                            </td>
                            <td class="ListManBGTableRightSide" style="width: 1px;">&nbsp;</td>
                        </tr>
                        
                        <!-- Message Total Specimens in Collection -->
                        <tr>
                            <td class="ListManBGTableLeftSide" style="width: 1px;">&nbsp;</td>
                            <td colspan="4" class="ListManBGTableBody" align="right" valign="middle" style="text-align:right; padding-bottom:3px;">
                                <img src="../../Images/shim.gif" width="3" height="5" />
                                <span id="RefreshLayer" style="display: none; margin-left: 15px;">Changes were made<img style="vertical-align: middle;
                                        margin-left: 10px; cursor: pointer;" src="../../Images/icon_refresh_small.gif" alt="Refresh Results"
                                        title="Refresh Results" onclick="window.location = window.location;" /></span>
                                <span class="TableNotes">
                                    <asp:Label ID="lblTotalSpecimens" runat="server"></asp:Label>
                                </span>
                                <img src="../../Images/shim.gif" width="3" height="1" />
                            </td>
                            <td class="ListManBGTableRightSide" style="width: 1px;">&nbsp;</td>
                        </tr>
                        
                        <!-- Specimens in Collection Panel -->
                        <tr style="background-color: #F1F7FC;">
                            <td class="ListManBGTableLeftSide" style="width: 1px;">&nbsp;</td>
                            <td colspan="4" align="center">
                                <asp:Panel ID="specimensPanel" Visible="false" runat="server" 
                                            style="position: relative; width: 800px;">
                                    
                                    <!-- Specimen Detail PopUp -->
                                    <div id="PopupLayer" align="center" 
                                            style="z-index: 50; visibility: hidden; left: -4px;  top: -147px; 
                                               position: absolute; overflow: hidden; text-align: center; width: 850px;">
                                        <table border="0">
                                            <tr>
                                                <td align="center">
                                                    <iframe id="PopupPage" name="PopupPage" src="" height="483" frameborder="0"
                                                        style="width:830px; border-width: 1px; border-style: solid; border-bottom-color: #666666;
                                                        border-right-color: #666666; border-left-color: #333333; border-top-color: #333333;">
                                                    </iframe>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    
                                    <!-- Titles - Specimens "Grid" ... width is 802 to compensate for next div -->
                                    <table id="resultsTitles" width="802" border="0" cellpadding="2" cellspacing="0"
                                            class="ListManDataTableOuterBorder" runat="server">
                                        <tr>
                                            <td class="ListManDataTableTop" style="width: 40px;">
                                                Ref #</td>
                                            <td class="ListManDataTableTop" style="width: 80px;">
                                                <asp:Literal ID="IdentifierColumnTitle" runat=server></asp:Literal></td>
                                            <td class="ListManDataTableTop" style="width: 85px;">
                                                Type</td>
                                            <td class="ListManDataTableTop" style="width: 85px;">
                                                SubType</td>
                                            <td class="ListManDataTableTop" style="width: 120px;">
                                                Status</td>
                                            <td class="ListManDataTableTop" style="width: 40px;">
                                                Qty</td>
                                            <td class="ListManDataTableTop" style="width: 40px;">
                                                Units</td>
                                            <td class="ListManDataTableTop" style="width: 85px;">
                                                Box</td>
                                            <td class="ListManDataTableTop" style="width: 60px;">
                                                Position</td>
                                            <td class="ListManDataTableTop" style="width: 40px;">
                                                Edit</td>
                                            <td class="ListManDataTableTop" style="width: 60px;">
                                                Delete</td>
                                        </tr>
                                    </table>
                                    
                                    <!-- Content - Results Table -->
                                    <div id="resultsDiv" style="overflow-y: auto; overflow-x:hidden; height: 85px; width: 800px; border:solid 1px #999999; background-color:#ffffff;">
                                        <!--<table id="specimensTable" width="783" class="ListManDataTableOuterBorder" cellspacing="0"-->
                                        <table id="specimensTable" width="800" cellspacing="0"
                                            cellpadding="2" border="0" style="background-color: #ffffff;">
                                            <asp:Repeater ID="rptSpecimenResults" runat="server">
                                                <ItemTemplate>
                                                    <%--<tr id="specimenRow" class="ListManDataTableRow" valign="middle" style="cursor: pointer;" onmouseover="this.className='ListManDataTableRowOver'" onmouseout="this.className='ListManDataTableRow';" onclick="showSpecimenInfo('<%# Eval("SpecimenId") %>');">--%>
                                                    <tr id="specimenRow" runat="server" class="ListManDataTableRow" valign="middle">
                                                        <td style="width: 50px; text-align:center;">
                                                            <%# Eval("SpecimenReferenceNumber")%>
                                                        </td>
                                                        <td style="width: 80px; text-align:center;">
                                                            <%# Eval("Identifier")%>
                                                        </td>
                                                        <td style="width: 85px; text-align:center;">
                                                            <%# Eval("SpecimenType")%>
                                                        </td>
                                                        <td style="width: 85px; text-align:center;">
                                                            <%# Eval("SpecimenSubType")%>
                                                        </td>
                                                        <td style="width: 120px; text-align:center;">
                                                            <%# Eval("SpecimenStatus")%>
                                                        </td>
                                                        <td style="width: 40px; text-align:center;">
                                                            <%# Eval("SpecimenOriginalQty")%>
                                                        </td>
                                                        <td style="width: 40px; text-align:center;">
                                                            <%# Eval("SpecimenUnits")%>
                                                        </td>
                                                        <td style="width: 85px; text-align:center;">
                                                            <%# Eval("BoxName")%>
                                                        </td>
                                                        <td style="width: 60px; text-align:center;">
                                                            <%# Eval("Position")%>
                                                        </td>
                                                        <td style="width: 40px; text-align:center;">
                                                            <img alt="Edit This Record" id="editImage" style="cursor: pointer;" src="../../Images/IconEdit.gif"
                                                                onclick="showSpecimenInfo('<%# Eval("SpecimenId") %>');" /></td>
                                                        <td style="width: 60px; text-align:center;">
                                                            <asp:ImageButton ID="deleteImage" runat="server" ImageUrl="../../Images/IconDelete.gif"
                                                                OnClientClick="return confirm('Are you sure you want to remove this specimen from the collection?');"
                                                                OnCommand="RemoveFromCollection" CommandArgument='<%# Eval("SpecimenID") %>' /></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <SeparatorTemplate>
                                                    <tr>
                                                        <td height="1" colspan="11" class="ListManDataTableDottedLine">
                                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                                    </tr>
                                                </SeparatorTemplate>
                                                <FooterTemplate>
                                                    <tr>
                                                        <td height="1" colspan="11" class="ListManDataTableDottedLine">
                                                            <img src="../../Images/shim.gif" width="1" height="1"></td>
                                                    </tr>
                                                </FooterTemplate>
                                            </asp:Repeater>
									    
                                            <!-- Message - Search Returns Empty -->
                                            <tr id="noCollectionsRow" runat="server" class="ListManDataTableRow" valign="middle"
                                                visible="false" style="cursor: default;">
                                                <td colspan="6" style="height: 100px; text-align: center; font-size: 13px; color: #8d2a2c;">
                                                    There are no collections that match your search criteria.</td>
                                            </tr>
                                        </table>
                                    </div>
                                    
                                </asp:Panel>
                            </td>
                            <td class="ListManBGTableRightSide" style="width: 1px;">&nbsp;</td>
                        </tr>
							        
                        <!-- Save Button -->
                        <tr style="background-color: #F1F7FC;">
                            <td class="ListManBGTableLeftSide" style="width:1px;">&nbsp;</td>
                            <td colspan="4" align="center"><br />
                                <img id="CancelBtn" onclick="Form1.reset();" src="..\..\Images\ButtonCancel.gif"
                                    style="vertical-align: bottom; cursor: pointer; margin-right: 25px;" 
                                    alt="Cancel Changes" title="Cancel Changes" TabIndex="7"/>
                                <asp:ImageButton ID="btnSave" TabIndex="8" runat="server" OnClick="btnSave_onClick" 
                                    Width="66" Height="22" ImageUrl="../../images/buttonSave.gif" ToolTip="Save Changes"></asp:ImageButton>
                                  <img src="../../Images/shim.gif" alt="img" width="25px" height="5">
                                <asp:ImageButton ID="btnDelete" TabIndex="9" runat="server" 
                                    OnClientClick="return confirm('Are you sure you want to delete this collection?');" OnClick="btnDelete_onClick" 
                                    Width="66" Height="22" ImageUrl="../../images/buttonDelete.gif" ToolTip="Delete Collection"></asp:ImageButton>
                            </td> 
                            <td class="ListManBGTableRightSide" style="width:1px;">&nbsp;</td>
                        </tr>
                        <!-- Audit Information Labels -->
                        <tr style="background-color: #F1F7FC;">
                            <td class="ListManBGTableLeftSide" style="width: 1px;">&nbsp;</td>
                            <td colspan="4" align="center" style="padding-bottom:10px;">
                                <div id="AuditLabels" class="smallPrint">
                                    <div id="AuditLabelsLeft">
                                        <span class="AuditLabel">Entered By:&nbsp;</span> <span class="AuditLabel">Updated By:&nbsp;</span>
                                        <span class="AuditLabel">Locked By:&nbsp;</span>
                                    </div>
                                    <div id="AuditLabelsRight">
                                        <div>
                                            <asp:Label ID="EnteredBy" runat="server" />&nbsp;<asp:Label ID="EnteredTime" runat="server" /></div>
                                        <div>
                                            <asp:Label ID="UpdatedBy" runat="server" />&nbsp;<asp:Label ID="UpdatedTime" runat="server" /></div>
                                        <div>
                                            <asp:Label ID="LockedBy" runat="server" />&nbsp;<asp:Label ID="LockedTime" runat="server" /></div>
                                    </div>
                                </div>
                            </td>
                            <td class="ListManBGTableRightSide" style="width: 1px;">&nbsp;</td>
                        </tr>
                        
                        <!-- Rounded Bottom Border -->
                        <tr>
                            <td style="background-color: #F1F7FC; width:5px;">
                                <img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
                            <td colspan="4" class="ListManagerBGTableBottom">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td style="background-color: #F1F7FC; width:5px;">
                                <img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
