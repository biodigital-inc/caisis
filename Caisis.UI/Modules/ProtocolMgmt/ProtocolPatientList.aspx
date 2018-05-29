<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProtocolPatientList.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.ProtocolPatientList" %>
<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="~/Core/Help/helpToolTip.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Protocol Patient List</title>
    
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/Help.js" type="text/javascript"></script>

    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
    
    <script src="ProtocolMgmtScripts.js" type="text/javascript"></script>
    <script type="text/javascript">
    /* <![CDATA[ */
    
    // Set nodes to resize when page loads and window resizes
    Browser.ResizeElement( { nodeId: 'PDFormDiv', heightOffset: 235} ); 
    Browser.ResizeElement( { nodeId: 'ContentTableHolder', heightOffset: 300} ); 
    Browser.ResizeElement( { nodeId: 'FilteredListHolder', heightOffset: 300} );         
    
    var DEFAULT_SEARCH_TEXT = '';
    var TABLE_NAME = 'PatientsTable';
    var TABLE_COUNT = 1;
    var SEARCH_THROTTLE = 1; // in ms
    var lock = new Lock();
    var delayedSearch;
    
    function handleRowClick(grid,node,evt) 
    {
        
    }
    
    function loadPatientDialog(scid, paid)
    {
        parent.loadPatientInfo(<%= BaseProtocolId %>, scid,paid);
    }
        
    // initiate a patient search call back to the server
    function doSearchCallback(type,val,callbackType,callbackSortCol)
    {
        lock.lock();
        var p = new Param();
        p.add('SearchType',type);
        p.add('SearchValue',val);
        p.add('CallbackType',callbackType);
        p.add('CallbackSortCol', callbackSortCol);
        _doSearch(p);
    }
    
    // Gets called when call returns from server
    function handleSearchReturn(arg,context)
    {
        lock.unlock();

        var originalTable = $('MainTableHolder');
        originalTable.hide();
        
        var filteredTable = $('SecondaryTableHolder');
        filteredTable.show();
        
        var filteredList = $('FilteredListHolder');
        filteredList.clear();

        var tmp = $(document.createElement('DIV'));
        tmp.innerHTML = arg;
        var filterdTable = tmp.tag('TABLE')[0];
        filterdTable.id = 'FilteredPatientsTable'
        filteredList.appendChild(filterdTable);
        addHoverToGrid('FilteredPatientsTable');
        
        var recordCounter = $('RecordCount');
        recordCounter.innerHTML = filterdTable.rows.length + ' Patients';
        return;          
        
    }

    // Adds hover styles to grid when page loads
    addHoverToGrid('PatientsTable');
    
    // adjust cells in de-identified views
    $(window).addEvent('load', function(e) {
        var doResize = <%= (!CanViewIdentifiers).ToString().ToLower() %>;
        if(doResize) {
            var tableIds = ['ListHeaderTable', 'PatientsTable'];
            for(var i=0;i<tableIds.length;i++) {
                var table = document.getElementById(tableIds[i]);
                if(table && table.rows.length>0) {
                    var cells = table.rows[0].cells;
                    var visibileWidths = [30,15,15,35];
                    for(var j=1;j<cells.length-1;j++) {
                        var cell = cells[j];
                        if(cell.style.display == 'none')
                            cell.style.width = 'auto';
                        else
                            cell.style.width = visibileWidths.shift()+'%';
                    }
                }
            }
        }
    });
    
    </script>
    
    <style type="text/css">
    .BlueListBarTable
    {
        table-layout: fixed;
        width: 100%;
        color: #ffffff;
    }
    .BlueListBar
    {
        background-image: url(Images/HeaderBarBlueBG.gif);
        background-repeat: repeat-x;
        height: 35px;
        font-weight: bold;
        color: #ffffff;
    }
    .BlueListBar img
    {
        margin: 0px;
        width: 6px;
        height: 35px;
    }
    .BlueListBar a
    {
        color: #ffffff;
        text-decoration: none;
    }
    .BlueListBar a:hover
    {
        text-decoration: underline;
    }
    #FilteredListHolder
    {
        margin: auto;
        overflow: auto;
		width: 99%;
		border-left: solid 3px #dddddd;
		border-right: solid 3px #dddddd;
		border-bottom: solid 2px #dddddd;
        background-color: #ffffff;
    }
    .ContentTableHolder
    {
        margin: auto;
        overflow: auto;
 		width: auto;
		border-left: solid 3px #dddddd;
		border-right: solid 3px #dddddd;
		border-bottom: solid 2px #dddddd;
        background-color: #ffffff;
    }
    .PatientsTable
    {
        margin: auto;
        table-layout: fixed;
        width: auto;
        cursor: pointer;
        background-color: #ffffff;
        width: 100%;
    }
    
     /* Overwrite .css based values */
     #PDFormDiv
     {
        margin: 20px auto auto auto; 
        width: 95%; 
        height: 600px; 
        background-color: inherit;
        border: none;
     }
     
     #HeaderSection
     {
        width: 90%; 
        margin: auto; 
        height: 40px;
     }
     
     #PatientSearchLayer
	 {
	    padding: 4px; 
	    border: 1px solid #cccccc;
        background-color: #ffffff; 
        width: 200px;
	 }
	 #PatientSearchLayer input
	 {
	    float: left; 
	    display: block;
	    border-style: none; 
	    border: 0px; 
	    width: 175px;
	 }
	 #PatientSearchLayer img
	 {
	    float: right;
	    display: block;
	    margin-right: 4px;
	    cursor: pointer;
	 }
     #RecordCount
	 {
	    display: block;
	    width: 125px;
	    margin: auto;
	    text-align: center;
	    color: #004256;
        font-size: 11px;
        font-weight: bold;
        margin-top: 4px;
    }
    .dataGridItemHover
    {
        background-color: #CEA8AA;
        height: 25px;
    }
    .dataGridItemHover td
    {
        color: #000000;
    }

    .datGridItemClick
    {
        cursor: pointer;
        background-color: #8d2a2c;
        height: 25px;
    }

    .datGridItemClick td
    {
        color: #ffffff;
    }
    .HeaderItem
    {
        font-weight: bold;
    }
    #PatientsTable tr
    {
        text-align: left;
    }
    
     </style>
</head>
<body class="PatientProtocolBody">
    <form id="form1" runat="server">
    <!-- Sort Columns -->
    <input runat="server" id="HiddenSortOrder" type="hidden" value="ASC" />
    <input runat="server" id="HiddenSortColumn" type="hidden" value="PtProtocolStudyId" />
    <!-- Main Content Holder -->
        <div id="PDFormDiv" style="background-color: #f8fafc; width: 100%; padding-top: 0px; margin-top: 0px;">
            <!-- Tool Tip Layer -->
            <uc1:helpToolTip ID="HelpToolTipLayer" runat="server" />
            <!-- Header Section -->
            <!-- Protocol Listings Header -->
            <div id="ListView">
                <div id="MainTableHolder">
                <input id="SearchType" type="hidden" value="Title" />
                <table id="ListHeaderTable" cellpadding="0" cellspacing="0" border="0" width="100%" style="margin: auto;">
                    <tr class="BlueListBar">
                        <td class="BlueListBar" style="width: 5%;">
                            <img src="Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;"
                                alt="Patient List" /></td>
                        <td class="BlueListBar" style="width: 25%; <%= GetPatientIdentifiersVisibility() %>;">
                            <asp:LinkButton CssClass="HeaderItem" ID="LinkButtonName" runat="server" Text="Name" OnClientClick="return doMainListSort('', 'Name');" 
                                ToolTip="Patient Name"  OnLoad="SetPatientIdentifiersVisibility" Visible="false" /></td>
                        <td class="BlueListBar" style="width: 12%;  <%= GetPatientIdentifiersVisibility() %>;"><asp:LinkButton CssClass="HeaderItem" ID="LinkButtonMRN" runat="server" Text="MRN" OnClientClick="return doMainListSort('', 'PtMRN');"  
                                ToolTip="MRN"  OnLoad="SetPatientIdentifiersVisibility" Visible="false" /></td>
                        <td class="BlueListBar" style="width: 12%;"><asp:Label CssClass="HeaderItem" ID="LinkButtonStatus" runat="server" Text="Status"  
                                ToolTip="Status" /></td>
                        <td class="BlueListBar" style="width: 11%;">
                            <asp:LinkButton CssClass="HeaderItem" ID="LinkButtonStudyId" runat="server" Text="StudyId"
                                OnClientClick="return doMainListSort('', 'PtProtocolStudyId');" ToolTip="StudyId" />
                        </td>
                        <td class="BlueListBar" style="width: 11%;">
                            <asp:LinkButton CssClass="HeaderItem" ID="LinkButtonScreeningId" runat="server" Text="ScreeningId"
                                OnClientClick="return doMainListSort('', 'PtProtocolScreeningId');" ToolTip="ScreeningId" />
                        </td>
                        <td class="BlueListBar" style="width: 27%; text-align: center;"><asp:LinkButton CssClass="HeaderItem" ID="LinkButtonNextVisit" runat="server" Text="NextVisit" OnClientClick="return doMainListSort('', 'NextVisit');" 
                                ToolTip="Next Visit" /></td>
                        <td class="BlueListBar" style="width: 5%; text-align: right;">
                            <img src="Images/HeaderBarBlueRight.gif" width="6" height="35" alt="Protocol List" /></td>
                    </tr>
                    <tr>
                        <td colspan="9" align="center">
                            <div runat="server" id="ContentTableHolder" class="ContentTableHolder">
                                <!-- Table Containing Protocols, ability to overflow -->
                                <table id="PatientsTable" class="PatientsTable" cellpadding="0" cellspacing="0" border="0" >
                                        <asp:Repeater runat="server" ID="PatientListRptr" OnItemDataBound="HilightFoundText">
                                            <ItemTemplate>
                                                <tr id="_tr_<%# Container.ItemIndex %>" class="<%# Container.ItemIndex %2==0? "dataGridItemRowA":"dataGridItemRowB" %>" onclick="loadPatientDialog('<%# Eval("ProtocolSchemaId")%>','<%# EncryptPatientId(Eval("PatientId").ToString()) %>');" >
                                                    <td style="width: 5%;">&nbsp;
                                                        <input type="hidden" id="_tr_<%# Container.ItemIndex %>_paid" value="<%# EncryptPatientId(Eval("PatientId").ToString()) %>" />
                                                        <input type="hidden"  id="_tr_<%# Container.ItemIndex %>_scid" value="<%# Eval("ProtocolSchemaId")%>" />
                                                    </td>
                                                    <td style="width: 25%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;   <%= GetPatientIdentifiersVisibility() %>;">
                                                        <asp:Panel runat="server" ID="PtNameLabel" OnLoad="SetPatientIdentifiersVisibility" Visible="false">
                                                            <asp:Label runat="server" ID="NameField" Text='<%# Eval("Name") %>'>
                                                            </asp:Label><asp:Label runat="server" ID="NamePre"></asp:Label><asp:Label runat="server"
                                                                ID="NameMatch" CssClass="FoundText"></asp:Label><asp:Label runat="server" ID="NamePost"></asp:Label>
                                                        </asp:Panel>
                                                    </td>
                                                    <td style="width: 12%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; <%= GetPatientIdentifiersVisibility() %>;"><asp:Label runat="server" ID="PtMRNLabel" OnLoad="SetPatientIdentifiersVisibility" Visible="false"><%# Eval("PtMRN")%></asp:Label></td>
                                                    <td style="width: 12%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;"><div runat="server" id="StatusLabel" style="text-align: center;"></div></td>
                                                    <td style="width: 11%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;">&nbsp;&nbsp;&nbsp;<span><%# Eval("PtProtocolStudyId")%></span></td>
                                                    <td style="width: 11%; vertical-align: top; padding-top: 4px; padding-bottom: 2px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><%# Eval("PtProtocolScreeningId")%></span></td>
                                                    <td style="width: 27%; vertical-align: top; padding-top: 4px; padding-bottom: 2px; text-align: center;"><asp:Label runat="server" ID="NextVisitLabel"></asp:Label></td>
                                                    <td style="width: 5%;">&nbsp;</td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                </div>
                <!-- Container for dynamically inserted filterd results table -->
                <div id="SecondaryTableHolder" style="display:none;">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin: auto;">
                        <tr class="BlueListBar">
                            <td class="BlueListBar" style="width: 5%;">
                                <img src="Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;"
                                    alt="Patient List" />
                            </td>
                            <td class="BlueListBar" style="width: 25%; <%= GetPatientIdentifiersVisibility() %>;">
                                <asp:LinkButton CssClass="HeaderItem" ID="LinkButton1" runat="server" Text="Name"
                                    OnClientClick="return doMainListSort('', 'Name');" ToolTip="Patient Name" OnLoad="SetPatientIdentifiersVisibility" Visible="false" />
                            </td>
                            <td class="BlueListBar" style="width: 12%;  <%= GetPatientIdentifiersVisibility()%>;">
                                <asp:LinkButton CssClass="HeaderItem" ID="LinkButton2" runat="server" Text="MRN"
                                    OnClientClick="return doMainListSort('', 'PtMRN');" ToolTip="MRN"  OnLoad="SetPatientIdentifiersVisibility" Visible="false" />
                            </td>
                            <td class="BlueListBar" style="width: 12%;">
                                <asp:Label CssClass="HeaderItem" ID="LinkButton3" runat="server" Text="Status" ToolTip="Status" />
                            </td>
                            <td class="BlueListBar" style="width: 11%;">
                                <asp:LinkButton CssClass="HeaderItem" ID="LinkButton4" runat="server" Text="StudyId"
                                    OnClientClick="return doMainListSort('', 'PtProtocolStudyId');" ToolTip="StudyId" />
                            </td>
                            <td class="BlueListBar" style="width: 11%;">
                                <asp:LinkButton CssClass="HeaderItem" ID="LinkButton7" runat="server" Text="ScreeningId"
                                    OnClientClick="return doMainListSort('', 'PtProtocolScreeningId');" ToolTip="ScreeningId" />
                            </td>
                            <td class="BlueListBar" style="width: 27%; text-align: center;">
                                <asp:LinkButton CssClass="HeaderItem" ID="LinkButton6" runat="server" Text="NextVisit"
                                    OnClientClick="return doMainListSort('', 'NextVisit');" ToolTip="Next Visit" />
                            </td>
                            <td class="BlueListBar" style="width: 5%; text-align: right;">
                                <img src="Images/HeaderBarBlueRight.gif" width="6" height="35" alt="Protocol List" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="9">
                                <div id="FilteredListHolder" class="ContentTableHolder">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <span id="RecordCount">
                    <%= recordCount %>
                    Patients</span>
          </div>
        </div>
    </form>
</body>
</html>
