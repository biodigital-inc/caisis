<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminProtocol.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminProtocol" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Protocol</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
    
    function editSchema(url)
    {
        setPortalHeaderLarge();
        $('SchemaPortal').src = url;
        loadSchemaPortal();
    }
    
    function loadSchemaPortal()
    {
        $('SchemaLayer').show();
    }
    
    function hideSchemaPortal()
    {
        $('SchemaLayer').hide();
    }

    // closes popup portal and reloads admin
    function hideSchemaPortalAndReload() {
        hideSchemaPortal();
        refreshAdminProtocol();
    }
        
        // Controls the size of patient portal layer
    var PORTAL_OFFSET_SMALL = 350; // offset for small pages
    var PORTAL_OFFSET_LARGE = 100; // offset for large pages
    var PORTAL_OFFSET = PORTAL_OFFSET_LARGE; // default offset
    var PORTAL_HEIGHT_MIN = 350; // minimum height of patient portal frame
    
    function resizePortal() { resizeSchemaPortal(PORTAL_OFFSET); }
    function resizeSchemaPortal(off)
    {
        PORTAL_OFFSET = off ? off : PORTAL_OFFSET;
        
        if($('SchemaLayer').style.display == 'none') { return; }
        var currentHeight = $('SchemaPortal').offsetHeight;
        var targetHeight = Math.max(getHeight(window) - PORTAL_OFFSET,PORTAL_HEIGHT_MIN);

        var ppFrame = $('SchemaPortal');
        var ppStretch = $('PatientLayerLeft');
        var resizeStyle = targetHeight  + 'px';
        ppFrame.style.height = resizeStyle;
        ppStretch.style.height = resizeStyle;

    }
    
    // Adjust patient portal left and right layer header sizes
    function setPortalHeader(cls)
    {
        var ppLeft = $('PatientLayerLeft');
        ppLeft.className = 'PatientLayerLeft' + cls;
        var ppRight = $('PatientLayerRight');
        ppRight.className = 'PatientLayerRight' + cls;
    }
    function setPortalHeaderSmall() { setPortalHeader('_miniTabs'); }
    function setPortalHeaderLarge() { setPortalHeader(''); }
    
    
    var resizeSchemaPortalSmall = curry(resizeSchemaPortal,PORTAL_OFFSET_SMALL);
    var resizeSchemaPortalLarge = curry(resizeSchemaPortal,PORTAL_OFFSET_LARGE);
    
    function addTreatmentArm(prvr)
    {
        setPortalHeaderSmall();
        $('SchemaPortal').src = '<%= GetQueryString("AdminAddTreatmentArm.aspx") %>' + '&prvr=' + prvr;
        loadSchemaPortal();
        return false;
    }
    
    function addVersion()
    {
        setPortalHeaderSmall();
        $('SchemaPortal').src = '<%= GetQueryString("AdminAddVersion.aspx") %>';
        loadSchemaPortal();
        return false;
    }

    function showTreatmentArms(url, e) {
        if (e) {
            var target = e.srcElement || e.target;
            if (target && target.type == 'image') {
                return;
            }
        }
        $('TreatmentArmFrame').src = url;
        return false;
    }
    
    function reloadTreatmentArms()
    {
        $('TreatmentArmFrame').src = $('TreatmentArmFrame').src;
    }
    
    function editVersionInfo(vrId)
    {
        var url = '<%= GetQueryString(Page.ResolveUrl("AdminVersionInfo.aspx")) %>';
        var modalTitle = 'Edit Version Info';
        if (vrId < 0) modalTitle = 'Add New Version';
        url += '&prvr=' + vrId;
        return showEditDetailsInModal(url,modalTitle,560,280);
    }

    function editSchemaPatients(schemaId) {
        setPortalHeaderSmall();
        resizeSchemaPortal(PORTAL_OFFSET_SMALL);
        $('SchemaPortal').src = 'AdminSchemaPatients.aspx?scid=' + schemaId;
        loadSchemaPortal();
        return false;
    }

    function copyVersionInfo(copyVersionId) {
        var url = '<%= GetQueryString(Page.ResolveUrl("AdminVersionInfo.aspx")) %>';
        var modalTitle = modalTitle = 'Copy Version';
        url += '&copyVersionId=' + copyVersionId;
        return showEditDetailsInModal(url, modalTitle, 560, 280);
    }

    // reloads the admin protocol interface with the active version set
    function reloadAdminProtocolVersion(prvr) {
        var url = '<%= GetQueryString(Page.ResolveUrl("AdminProtocol.aspx")) %>' + '&prvr=' + prvr;
        window.location.href = url;
    }

    // scrolls to verion row
    function setDefaultVersionFocus(versionId) {
        var scroller = $('ProtocolVersionsDiv');
        var row = $('VersionRow_' + versionId);
        if (scroller && row) {
            scroller.scrollTop = row.offsetTop;
            setVersionRowActive(row.rowIndex);
        }
    }

    var activeVersionRow = null;

    // sets the version row as active
    // @rowIndex: the row index to set as active
    function setVersionRowActive(rowIndex) {
        var versions = $('VersionRows');
        if (versions) {
            var rows = versions.rows;
            if (rowIndex < rows.length) {
                // classes are toggled on first cell of row
                var newActiveRow = rows[rowIndex].cells[0];
                // reset active row
                if (activeVersionRow != null) {
                    activeVersionRow.className = 'dashboardVersionRow_' + (rowIndex % 2 == 0 ? 'A' : 'B');
                }
                activeVersionRow = newActiveRow;
                activeVersionRow.className = 'dashboardVersionRow_Hover';
                return false;
            }
        }     
    }

    function getProtocolTitle() {
        var protocolNum = $('ProtocolNumberLabel').innerHTML;
        return 'Protocol ' + protocolNum;
    }
    
     function editEligibilityQuestionnaire() {

        var url = '<%= GetQueryString(Page.ResolveUrl("AdminEligibilityQuestionnaire.aspx")) %>';
        var modalTitle = getProtocolTitle() + ': Questionnaire';
        return showEditDetailsInModal(url, modalTitle, 700, 550);
    }

    function editProtocolOrganizations() {
        var url = '<%= GetQueryString(Page.ResolveUrl("AdminProtocolOrganizations.aspx")) %>';
        var modalTitle = getProtocolTitle() + ': Organizations';
        return showEditDetailsInModal(url, modalTitle, 700, 550);
    }
    
    function manageProtocolPatients() {
        var url = '<%= GetQueryString(Page.ResolveUrl("AdminManagePatients.aspx")) %>';
        var modalTitle = getProtocolTitle() + ': Manage Patients';
        return showEditDetailsInModal(url, modalTitle, 700, 550);
    }

    function editPatientSchedule() {
        var url = '<%= GetQueryString(Page.ResolveUrl("PatientEditSchedule.aspx")) %>';
        window.open(url);
    }

    function editPatientSpecimens() {
        var url = '<%= GetQueryString(Page.ResolveUrl("AdminManageSpecimens.aspx")) %>';
        var modalTitle = getProtocolTitle() + ': Specimens';
        return showEditDetailsInModal(url, modalTitle, 1000, 550);
    }
    
    function refreshAdminProtocol()
    {
        window.location = window.location;
    }

    
    // export
    function showProtocolExportScreen(title, url) {
        showEditDetailsInModal(url, title, 800, 480);
        return false;
    }

    function manageTimeline() {
        var url = '<%= GetQueryString(Page.ResolveUrl("AdminManageTimeline.aspx")) %>';
        var modalTitle = 'Manage Timeline';
        return showEditDetailsInModal(url, modalTitle, 1000, 550);
    }

    /* ]]> */
    </script>

    <style type="text/css">
    .dashboardVersionRow_A
    {
        cursor: pointer;
    }
    .dashboardVersionRow_B
    {
        cursor: pointer;
    }
    #otherTasksTable
    {        
        overflow: auto;
        max-height: 180px;
    }
    #otherTasksTable .dataEntryButtonGray {
        width: 150px;
        margin: 6px auto;
        padding: 5px;
    }
    </style>

</head>
<body style="background-color: #fbfbfb;">
    <form id="form1" runat="server">
        <div>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="ProtocolTitleBarLeft">
                        &nbsp;</td>
                    <td id="ProtocolNumberTd" runat="server"  class="ProtocolTitleBarBG_ProtNum">
                        <asp:Label runat="server" ID="ProtocolNumberLabel"></asp:Label>
                    </td>
                    <td id="ProtocolTitleTd" runat="server" class="ProtocolTitleBarBG_ProtTitle" style="padding-right: 20px;">
                        <asp:Label runat="server" ID="ProtocolTitleLabel">Add New Protocol</asp:Label>
                    </td>
                    <td id="ProtocolNewProtocolTd" runat="server" class="ProtocolTitleBarBG_ProtTitle_New" visible="false">Add New Protocol</td>
                    <td id="ProtocolExitTd" runat="server" class="ProtocolTitleBarBG_ExitButton" style="width: 226px;">
                        <a href="<%= GetQueryString("ProtocolIndex.aspx") %>" title="Exit Admin Options">
                            <img src="Images/Button_ExitAdminOptions.gif" alt="Exit Admin Options" style="border-style: none;
                                margin-right: 30px;" /></a> <a href="<%= GetQueryString("ProtocolList.aspx") %>"
                                    title="Exit Protocol"><img src="Images/Button_ExitProtocol.gif" alt="Exit Protocol" style="border-style: none;" /></a>
                    </td>
                    <td class="ProtocolTitleBarRight">&nbsp;</td>
                </tr>
            </table>
        </div>
        <div id="resizableContentDiv" style="width: 98%; height: 620px; overflow: auto;">


           <div style="width: 88%; margin-top: 20px; margin-left: auto; margin-right: auto; margin-bottom: 0px;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;">
                <tr>
                    <td style="width:80%;">
                            <iframe id="ProtocolInfo" frameborder="0" src="<%= GetQueryString("AdminProtocolInfo.aspx") + "&edit=" + IsNew.ToString().ToLower() %>"
                                style="overflow: auto; overflow-x: hidden; width: 100%; height: <%= (IsNew == false ? "270px" : "600px") %>"></iframe>
                    </td>
                    <td style="vertical-align: top;">
                        <table id="OtherAdminTasks" runat="server" width="95%" border="0" cellspacing="0" cellpadding="0" style="float: right;">
                            <tr>
                                <td class="dashboardTitleBar" colspan="2">
                                    <img src="images/AdminDashboardTitle_OtherAdminTasks.gif" alt="Other Admin Tasks"
                                        width="154" height="17" style="margin-bottom: 3px;"></td>

                            </tr>
                            <tr>
                                <td class="dashboardBG_TopLeft" style="text-align: center; vertical-align: middle; height: 165px;">
                                    <div id="otherTasksTable">
                                        <span title="Edit Eligibility Questionnaire"
                                            class="dataEntryButtonGray" onclick="editEligibilityQuestionnaire();">Edit Eligibility Questionnaire</span>
                                        <span class="dataEntryButtonGray" title="Edit Protocol Organizations" onclick="editProtocolOrganizations();">
                                            Edit Protocol Organizations</span>                                    
                                        <span class="dataEntryButtonGray" title="Edit Protocol Organizations" onclick="manageProtocolPatients();">
                                            Manage Protocol Patients</span>                                                                                   
                                        <a runat="server" id="ExportProtocolBtn" visible="false" href="#" class="dataEntryButtonGray"
                                            title="Export Protocol" onclick="return showProtocolExportScreen(this.title, this.href);">Export Protocol</a>
                                        <a runat="server" id="ExportPatientsBtn" visible="false" href="#" class="dataEntryButtonGray"
                                            title="Export Protocol Patients" onclick="return showProtocolExportScreen(this.title, this.href);">Export Protocol Patients</a>
                                        <span class="dataEntryButtonGray" title="Manage Patient Schedule" onclick="editPatientSchedule();">
                                            Manage Patient Schedule</span>
                                         <span class="dataEntryButtonGray" title="Manage Specimens" onclick="editPatientSpecimens();">
                                            Manage Specimens</span>
                                         <span class="dataEntryButtonGray" title="Manage Timeline" onclick="manageTimeline();">
                                            Manage Timeline</span>
                                    </div>
                                </td>
                                <td class="dashboardBG_TopRight">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="dashboardBG_BottomLeft">
                                    &nbsp;</td>
                                <td class="dashboardBG_BottomRight">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            </div>
            <div id="ManageTreatmentArms" runat="server" style="width: 88%; margin-top: 0px; margin-left: auto; margin-right: auto;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;">
                    <tr>
                        <td style="vertical-align: top;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="dashboardTitleBar">
                                        <img src="images/AdminDashboardTitle_ManageTreatmentArms.gif" alt="Manage Treatment Arms"
                                            width="191" height="17" style="margin-right: 16px; vertical-align: middle; margin-bottom: 3px;">add
                                        / edit treatment arms & schemas for this protocol
                                    </td>
                                    <td style="width: 9px;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="dashboardBG_TopLeft" style="padding-right: 15px;">
                                    <div style="color: #111111; font-weight: bold; font-size: 12px; margin-bottom: 12px;">Select a version below to view its treatment arms.</div>
                                        <table width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 40%; vertical-align: top; padding-right: 16px;">
                                                    <table border="0" cellspacing="0" cellpadding="0" >
                                                        <tr>
                                                            <td class="dashboardTitleBar" style="color: #111111; font-weight: bold; width: 14%;">
                                                                Ver #</td>
                                                            <td class="dashboardTitleBar" style="color: #111111; font-weight: bold; width: 26%;">
                                                                Approval Date
                                                            </td>
                                                            <td class="dashboardTitleBar" style="color: #111111; font-weight: bold; width: 60%;">
                                                                Notes
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div id="ProtocolVersionsDiv" style="overflow: auto; overflow-x: hidden;">
                                                        <table id="VersionRows" style="width: 96%; table-layout: fixed;" border="0" cellspacing="0" cellpadding="0" >
                                                            <asp:Repeater runat="server" ID="VersionListRptr" OnItemDataBound="SetVersionBtns">
                                                                <ItemTemplate>
                                                                    <tr id="VersionRow_<%# Eval("ProtocolVersionId") %>" onclick="return showTreatmentArms('<%# GetQueryStringWithVersion(Eval("ProtocolVersionId"), Eval("VersionNumber")) %>', event);">
                                                                        <td class="dashboardVersionRow_<%# Container.ItemIndex %2 == 0 ? "A" : "B" %>" onclick="setVersionRowActive(<%# Container.ItemIndex %>);"
                                                                            onmouseover="if(isMouseEnter(this,event)) { this.className='dashboardVersionRow_Hover'; }" onmouseout="if(isMouseLeave(this,event) && this != activeVersionRow) { this.className='dashboardVersionRow_<%# Container.ItemIndex %2 == 0 ? "A" : "B" %>'; }">
                                                                            <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td style="padding: 8px; width: 14%;">
                                                                                        <%# Eval("VersionNumber") %>&nbsp;
                                                                                    </td>
                                                                                    <td style="padding: 8px; width: 26%;">
                                                                                        <%# Eval("ApprovalDate", "{0:d}") %>&nbsp;
                                                                                    </td>
                                                                                    <td style="padding: 8px; width: 30%;">
                                                                                        <%# Eval("VersionReason") %>&nbsp;
                                                                                    </td>
                                                                                    <td style="padding: 8px; text-align: center; width: 30%;">
                                                                                        <asp:ImageButton runat="server" ID="EditVersionBtn" ImageUrl="Images/Button_Edit_small.png"
                                                                                            ToolTip="Edit Version" AlternateText="Edit Version" />
                                                                                        <asp:ImageButton runat="server" ID="DeleteVersionBtn" ImageUrl="Images/Button_Delete_small.png"
                                                                                            OnClientClick="return confirmDelete('Are you sure you would like to delete this Version?');"
                                                                                            OnCommand="DeleteVersion" CommandArgument='<%# Eval("ProtocolVersionId") %>'
                                                                                            ToolTip="Delete Version" AlternateText="Delete Version" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <tr id="noVerionsMsg" runat="server" visible="false">
                                                                <td class="dashboardTreatmentArmRow_A" style="padding: 10px; font-size: 10px; font-weight: normal;">
                                                                    There are currenly no versions assigned to this protocol. Click the button below
                                                                    to create a new version for this protocol.
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <img onclick="return addVersion();" style="cursor: pointer;
                                            margin-top: 8px; margin-left: 10px;" alt="Add Treatment Arm" src="Images/Button_AddNewVersion.png" />
                                                </td>
                                                <td style="vertical-align: top;">
                                                    <iframe id="TreatmentArmFrame" name="TreatmentArmFrame" src="<%= !string.IsNullOrEmpty(DefaultTreatmentArmsURL) ? DefaultTreatmentArmsURL : GetQueryString("AdminTreatmentArms.aspx") %>" frameborder="0" style="margin-right: 20px;
                                                        width: 100%; height: 200px;"></iframe>
                                                </td>
                                            </tr>
                                        </table>
                                        
                                    </td>
                                    <td class="dashboardBG_TopRight">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="dashboardBG_BottomLeft">
                                        &nbsp;</td>
                                    <td class="dashboardBG_BottomRight">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            
        </div>
        <div id="SchemaLayer" style="z-index: 50; position: absolute; top: 43px; width: 100%;
            display: none;">
            <table style="width: 97%; border: none; margin-left: auto; margin-right: auto;" cellpadding="0"
                cellspacing="0" border="0">
                <tr>
                    <td class="PatientLayerTopLeft" style="height: 37px;">
                        &nbsp;</td>
                    <td id="PatientLayerTop" rowspan="2" class="PatientLayerTop">
                        <iframe id="SchemaPortal" style="width: 100%; height: 500px;" frameborder="0" src="AdminSchema.aspx"
                            scrolling="no"></iframe>
                    </td>
                    <td class="PatientLayerTopRight" style="height: 37px;">
                        <img onclick="hideSchemaPortal();" src="Images/CloseWidget_Red.gif" alt="Close" style="margin-top: 7px;
                            border: none; cursor: pointer; vertical-align: top;" /></td>
                </tr>
                <tr>
                    <td id="PatientLayerLeft" class="PatientLayerLeft" style="height: 500px;">
                        &nbsp;</td>
                    <td id="PatientLayerRight" class="PatientLayerRight">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="PatientLayerBottomLeft">
                        &nbsp;</td>
                    <td class="PatientLayerBottom">
                        &nbsp;</td>
                    <td class="PatientLayerBottomRight">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
    
<script type="text/javascript">
    setMaxHeight('ProtocolVersionsDiv', 150);
    // set focus on default version
    if ('<%= QueryVersionId %>' != '') {
        setDefaultVersionFocus('<%= QueryVersionId %>');
    }
    // otherwise focus on first item
    else {
        setVersionRowActive(0);
    }
</script>    
</body>
</html>
