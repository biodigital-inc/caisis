<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientImaging.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientImaging" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Imaging</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">  
    /* <![CDATA[ */

    // resize relevent containers and pages when Browser loads and resizes
    function onWindowResize()
    {
        var winHeight = getHeight(window) - 25;
        var layout = $('LayoutTable');
        var overflow = $('OverflowContainer');
        var dataFrame = $('DataEntryFrame');
        var heightOffset = Math.max(100, winHeight);
        layout.style.height =  heightOffset - 25 + 'px';
        overflow.style.height = heightOffset - 50 + 'px';
        dataFrame.style.height = heightOffset - 25  + 'px';
    }
    
    // Loads a record into relevant form, depending on table (i.e., Imaging, Response, etc...)
    function loadRecord(table,priKey,varName)
    {
        if(table=='Diagnostics') { loadDiagnostic(varName,priKey); }
        else if(table=='ProtocolMgr_PatientResponse') { loadResponse(priKey); }
    }
    
    // loads a relevant data entry form for a type of Diagnostic
    function loadDiagnostic(type,diagId)
    {
        var imgType = getImagingType(type);
        // need to load relevant forms (handled in parent page)
        if(imgType) { parent.setActiveImaging(imgType,diagId); }
        // otherwise load generic interface
        else
        {
            $('DataEntryFrame').src = '<%= GetQueryString("PatientImagingDataEntry.aspx") %>&diagnosticId=' + diagId;
        }
    }
        
    // loads PatientProtocolResponse data entry form
    function loadResponse(responseId)
    {
        $('DataEntryFrame').src = '<%= GetQueryString("PatientResponseDataEntry.aspx") %>&patientResponseId=' + responseId;
    }
    
    // gets the type of imaging to load
    function getImagingType(typeCheck)
    {
        var typeList = ['<%= string.Join("','",DxImagingTypes) %>'];
        for(var i=0;i<typeList.length;i++)
        {
            var type = typeList[i];
            if(typeCheck.indexOf(type)>-1) { return type=='MRI' ? 'CT' : type; }
        }
        return null;
    }
    
    // reload this page with relevent table and record passed in query string
    function reloadChronRecord(table,recordId)
    {
        window.location = '<%= GetQueryString("PatientImaging.aspx") %>&table=' + table + '&recordId=' + recordId;
    }
    
    /* ]]> */
    </script>

    <style type="text/css">
    #OverflowContainer
    {
        overflow: auto;
        overflow-x: hidden;
        height: 375px;
        border: 1px solid #cccccc;
        margin: 0px;
        padding: 0px;
    }
    #PatientImagingTable tr
    {
        cursor: pointer;
    }
    #PatientImagingTable td
    {
        padding: 0px;

    }
    .Diagnostics_Cell
    {
        font-weight: normal;
    }
    .ProtocolMgr_PatientResponse_Cell
    {
        font-weight: bold;
    }
    .ItemRow_Click
    {
        background-color: #bb7f80;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table id="LayoutTable" style="width: 100%; height: 400px; table-layout: fixed;"
            cellpadding="4" cellspacing="0" border="0">
            <tr>
                <td style="vertical-align: top; width: 450px; margin: 0px;">
                    <span style="font-weight: bold; font-size: 12px; display: block; padding-left: 10px;">
                        Date</span>
                    <div id="OverflowContainer">
                        <table id="PatientImagingTable" style="width: 100%; margin: 0px; padding: 0px;" border="0"
                            cellpadding="0" cellspacing="0">
                            <asp:Repeater runat="server" ID="ImagingChronListRptr">
                                <ItemTemplate>
                                    <tr id="<%# Eval("TableName") %>_<%# Eval("PrimaryKey") %>" class="<%# Container.ItemIndex % 2 == 0 ? "ItemRow_A" : "ItemRow_B" %>"
                                        onclick="loadRecord('<%# Eval("TableName") %>','<%# Eval("PrimaryKey") %>','<%# Eval("VarName").ToString().Replace("'","\'") %>');">
                                        <td style="width: 30%;" class="<%# Eval("TableName") %>_Cell">
                                            <span style="padding-left: 10px;">
                                                <%# Eval("VarDate") %>
                                            </span>
                                        </td>
                                        <td style="width: auto;" class="<%# Eval("TableName") %>_Cell">
                                            <%# Eval("TableName").ToString() == "ProtocolMgr_PatientResponse" ? "Response: " : ""%>
                                            <%# Eval(Eval("TableName").ToString() == "ProtocolMgr_PatientResponse" ? "VarValue" : "VarName")%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>

                    <script type="text/javascript">  
                    /* <![CDATA[ */
                    initDataEntryChronList('PatientImagingTable','<%= QueryTable %>_<%= QueryRecordId %>');
                    /* ]]> */
                    </script>

                    <a href="<%= GetQueryString("PatientImaging.aspx") %>&table=ProtocolMgr_PatientResponse&recordId=new">
                        <img alt="Add New Response" src="Images/Button_AddNewResponse.png" style="margin-top: 4px; margin-left: 10px;" /></a>
                    <br />
                    <asp:CheckBox runat="server" ID="DiagFilter" Text="Only show scans between 90 before On Study date and Off Study Date?"
                        Checked="true" OnCheckedChanged="PopulateForm" AutoPostBack="true" /> 
                </td>
                <td style="vertical-align: top; width: auto; padding-left: 20px;">
                    <iframe runat="server" name="DataEntryFrame" id="DataEntryFrame" style="width: auto;
                        display: block; width: 100%; height: 410px;" frameborder="0"></iframe>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
