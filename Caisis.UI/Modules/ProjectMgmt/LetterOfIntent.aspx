<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LetterOfIntent.aspx.cs" Inherits="Caisis.UI.Modules.ProjectMgmt.LetterOfIntent" %>

<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="diseaseState" TagName="DiseaseEditor" Src="Controls/DiseaseState.ascx" %>
<%@ Register TagPrefix="editor" TagName="LOIEditor" Src="Controls/LetterOfIntentEditor.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Letter of Intent</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProjectMgmtScripts.js"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <script type="text/javascript">
    
    if ('<%=strEdit %>' == "true")
        window.print(); 
    
 //   Browser.ResizeElement({ nodeId: 'LOIContainer', heightOffset: 200 });
    
    var EDIT_LARGE__FIELD_URL = '<%= Page.ResolveUrl("ProjectLOIDetails.aspx?") %>';
    var EDIT_SMALL_FIELDS_URL = '<%= Page.ResolveUrl("EditLetterOfIntentField.aspx?GIField=false&") %>';
    var EDIT_GI_FIELDS_URL = '<%= Page.ResolveUrl("EditLetterOfIntentField.aspx?GIField=true&") %>';
 
    // Loads small fields for editing
    function editSmallFields() { showEditModal(EDIT_SMALL_FIELDS_URL); }
    
    function editHybridField(screenName, node) 
    { 
        var url = EDIT_LARGE__FIELD_URL;
        url += "ControlName=" + screenName + ".ascx&";
        showEditModal(url,node.title); 
    }
    
    function checkMouseOver(obj)
    {
        var bEdit = '<%=strEdit %>';
        if (bEdit == "false")
        {
            obj.className='LOITableCellMouseover';
        }
    }
    
    function checkMouseOut(obj)
    {
        var bEdit = '<%=strEdit %>';
        if (bEdit == "false")
        {
            obj.className='LOITableCell';
        }
    }
    
    
    // Loads General Info fields for editing
    function editGIFields() { showEditModal(EDIT_GI_FIELDS_URL); }
    
    // Load single notes field for editing
    function editLargeField(node) { showEditModal(EDIT_LARGE__FIELD_URL,node.title); }
    
    // Loads field/fields into modal window for editing
    function showEditModal(baseURL,label)
    {
        var bEdit = '<%=strEdit %>';
        if (bEdit == "false")
        {
            var field = label ? label.replace(' ','') : '';
            field = field ? field.replace('/','') : '';
            var title = label ? (label + ' Details') : 'Edit Letter Of Intent Fields';
            var url = baseURL + 'projectId=<%= ProjectId %>&field=' + field;
            // Load page into modal
            showEditDetailsInModal(url ,title,750,780);
        }
    }
    </script>

    <style type="text/css">
    td
    {
        vertical-align: top;
        font-family: times, Times New Roman, times-roman, georgia, serif;
    }
    .FieldTitle
    {
        font-size: 13px;
        font-weight: bold;
        color: #000000;
        cursor: pointer;
        display: block;
    }
    </style>
    
    <style type="text/css" media="screen">
    td
    {
        font-size: 13px;
    }
    .LOITableCell
    {
        border: solid 1px #ffffff;
        cursor: pointer;
        color: #333333;
    }

    .LOITableCellMouseover
    {
        border: solid 1px #8d2a2c;
        background-color: #eee6e8;
        cursor: pointer;
        color: #000000;
    }
    .LOIScreenInstructions
    {
    }
    .LOITitle
    {
        font-size: 20px;
        color: #000000;
        font-weight: normal;
        font-family: Helvetica, Arial, sans-serif;
    }
    .LOISectionTitle
    {
        font-size: 14px;
        font-weight:bold;
        display: block;
    }
    .LOISectionContainer
    {
        width: 100%;
        border-top: solid 1px #333333;
        margin-top: 2px;
    }
    .LOIHeader
    {
        width: 96%;
        margin-top: 10px;
    }
    </style>
    
    
    <style type="text/css" media="print">
    body
    {
        background-color: Transparent;
    }
    td
    {
        font-size: 11pt;
    }
    .LOITableCell
    {
        padding-bottom: 35px;
        border: solid 1px #ffffff;
        border-left-color: #ffffff; border-right-color: #ffffff;
        color: #000000;
        font-size: 11pt;
    }
    .LOIScreenInstructions
    {
        display: none;
    }
    .LOITitle
    {
        font-size: 20pt;
        color: #000000;
        font-weight: normal;
        font-family: Helvetica, Arial, sans-serif;
    }
    .LOISectionTitle
    {
        font-size: 12pt;
        font-weight:bold;
        display: block;
    }
    .LOISectionContainer
    {
        width: 100%;
        border-top: solid 1px #333333;
        margin-top: 2px;
    }
    .LOIHeader
    {
        width: 100%;
    }

    </style>
    
</head>
<body onload="if (parent.displayPrintButton) parent.displayPrintButton(true)" onunload="if (parent.displayPrintButton) parent.displayPrintButton(false)" style="background-color: #ffffff;">
    <form id="form1" runat="server">
    
    <div style="text-align: center;"><img src="images/LOI_Header.gif" class="LOIHeader" alt="Letter of Intent" /></div>
    
            <table cellpadding="8" style="table-layout: fixed; width: 95%; margin: 20px auto 20px auto;
                vertical-align: top;" id="MainTable">
                <tr>
                    <td style="padding-bottom: 30px;">
                        <span class="LOITitle" >
                            <asp:Label ID="ProjectTitle" runat="server"></asp:Label>
                        </span><br />
                        <span class="LOIScreenInstructions">Click on a section to edit its contents.</span>
                     </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editGIFields();" onmouseover="checkMouseOver(this);"
                        onmouseout="checkMouseOut(this);">
                        
                        <span  class="LOISectionTitle">General Information</span>
                        <table cellpadding="0" class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px;">
                                    <span class="FieldTitle" title="LOI Number">LOI Number</span>
                                </td>
                                <td colspan="3" style="padding-top: 10px;">
                                    <asp:Label ID="LOINumber" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td  style="width: 12%;">
                                    <span class="FieldTitle" title="Creation Date">Creation Date</span>
                                </td>
                                <td  style="width: 38%;">
                                    <asp:Label ID="CreationDate" runat="server"></asp:Label>
                                </td>
                                 <td style="width: 15%;">
                                    <span class="FieldTitle" title="Presenting Center">Presenting Center</span>
                                </td>
                                <td style="width: 35%;">
                                    <asp:Label ID="ParticipatingCenters" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="FieldTitle" title="Agent Source">AgentSource</span>
                                </td>
                                <td>
                                    <asp:Label ID="AgentSource" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <span class="FieldTitle" title="Sample Size">Sample Size</span></td>
                                <td>
                                    <asp:Label ID="SampleSize" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="FieldTitle" title="IND Holder">IND Holder</span>
                                </td>
                                <td>
                                    <asp:Label ID="INDHolder" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <span class="FieldTitle" title="IND Number">IND Number</span>
                                </td>
                                <td>
                                    <asp:Label ID="INDNumber" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editLargeField(this);" title="Objectives" onmouseover="checkMouseOver(this);"
                        onmouseout="checkMouseOut(this);" style="height: 60px; vertical-align: top;">
                        <span  class="LOISectionTitle">Objectives</span>
                        <table cellpadding="0" class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px;">
                        <asp:Label ID="Objectives" runat="server"></asp:Label>
                        </td></tr></table>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editLargeField(this);" title="Background" onmouseover="checkMouseOver(this);"
                        onmouseout="checkMouseOut(this);" style="height: 60px; vertical-align: top;">
                        <span class="LOISectionTitle" title="Rational/Hypothesis">Rational/Hypothesis</span>
                        <table cellpadding="0" class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px;">
                        <asp:Label ID="Background" runat="server"></asp:Label>
                        </td></tr></table>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editLargeField(this);" title="Eligibility" onmouseover="checkMouseOver(this);"
                        onmouseout="checkMouseOut(this);" style="height: 60px; vertical-align: top;">
                        <span class="LOISectionTitle" title="Eligibility">Eligibility</span>
                        <table cellpadding="0" class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px;">
                        <asp:Label ID="Eligibility" runat="server"></asp:Label>
                        </td></tr></table>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editLargeField(this);" title="Research Methods"
                        onmouseover="checkMouseOver(this);" onmouseout="checkMouseOut(this);" style="height: 60px; vertical-align: top;">
                        <span class="LOISectionTitle" title="Treatment Plan">Treatment Plan</span>
                        <table cellpadding="0" class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px;">
                        <asp:Label ID="ResearchMethods" runat="server"></asp:Label>
                        </td></tr></table>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editLargeField(this);" title="Evaluation Metrics"
                        onmouseover="checkMouseOver(this);" onmouseout="checkMouseOut(this);" style="height: 60px; vertical-align: top;">
                        <span class="LOISectionTitle" title="Evaluation Metrics">Evaluation Metrics</span>
                        <table cellpadding="0" class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px;">
                        <asp:Label ID="EvaluationMetrics" runat="server"></asp:Label>
                        </td></tr></table>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editLargeField(this);" title="Population Description" onmouseover="checkMouseOver(this);"
                        onmouseout="checkMouseOut(this);" style="height: 60px; vertical-align: top;">
                        <span class="LOISectionTitle" title="Population Description">Population Description</span>
                        <table cellpadding="0" class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px;">
                                <asp:Label ID="PopulationDescription" runat="server"></asp:Label>
                        </td></tr></table>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editLargeField(this);" title="Statistics/Analytics Plans" onmouseover="checkMouseOver(this);"
                        onmouseout="checkMouseOut(this);" style="height: 60px; vertical-align: top;">
                        <span class="LOISectionTitle" title="Statistics/Analytics Plans">Statistics / Analytics Plans</span>
                        <table cellpadding="0" class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px;">
                                <asp:Label ID="StatisticsAnalyticsPlans" runat="server"></asp:Label>
                        </td></tr></table>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editLargeField(this);" title="Notes" onmouseover="checkMouseOver(this);"
                        onmouseout="checkMouseOut(this);" style="height: 60px; vertical-align: top;">
                        <span class="LOISectionTitle" onclick="editLargeField(this);" title="Notes">Notes</span>
                        <table cellpadding="0" class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px;">
                        <asp:Label ID="Notes" runat="server"></asp:Label>
                        </td></tr></table>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" onclick="editSmallFields();" onmouseover="checkMouseOver(this);"
                        onmouseout="checkMouseOut(this);">
                        
                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                        <tr><td class="LOITableCell" style="border: none;">
                        <span class="LOISectionTitle">Protocol Status</span>
                        <table cellpadding="0" class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px; width: 15%">
                                    <span class="FieldTitle" title="Protocol Written">Protocol Written</span>
                                </td>
                                <td style="padding-top: 10px; width: 35%">
                                    <asp:Label ID="ProtocolWritten" runat="server"></asp:Label>
                                </td>
                                <td style="padding-top: 10px; width: 18%">
                                    <span class="FieldTitle" title="Protocol Provided">Protocol Provided</span>
                                </td>
                                <td style="padding-top: 10px; width: 32%">
                                    <asp:Label ID="ProtocolProvided" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 10px;">
                                    <span class="FieldTitle" title="Protocol IRB Approved">Protocol IRB Approved</span>
                                </td>
                                <td style="padding-top: 10px;">
                                    <asp:Label ID="ProtocolIRBApproved" runat="server"></asp:Label>
                                </td>
                                <td style="padding-top: 10px;">
                                    <span class="FieldTitle" title="Protocol Opening At Other Centers">Protocol Opening At Other Centers</span>
                                </td>
                                <td style="padding-top: 10px;">
                                    <asp:Label ID="OpeningAtOtherCenters" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        </td></tr>
                        <tr><td class="LOITableCell" style="border: none; padding-top: 20px;">
                        <span class="LOISectionTitle">Patient Population</span>
                        <table class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px; width: 20%;">
                                    <span class="FieldTitle" title="Population Disease State">Population Disease State</span>
                                </td>
                                <td  style="padding-top: 10px; width: 80%;">
                                    <diseaseState:DiseaseEditor ID="DiseaseStateEditor" runat="server" />
                                </td>
                            </tr>
                        </table>
                        </td></tr>
                        <tr><td class="LOITableCell" style="border: none; padding-top: 20px;">
                        <span class="LOISectionTitle">Data Collection</span>
                        <table class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px; width: 20%;">
                                    <span class="FieldTitle" title="Data Collection Method">Data Collection Method</span>
                                </td>
                                <td style="padding-top: 10px; width: 80%;">
                                    <asp:Label ID="DataCollection" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        </td></tr>
                        <tr><td class="LOITableCell" style="border: none; padding-top: 20px;">
                        <span class="LOISectionTitle">Contact Information</span>
                        <table class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px; width: 13%;">
                                    <span class="FieldTitle" title="Completed By First Name">First Name</span>
                                </td>
                                <td style="padding-top: 10px; width: 37%;">
                                    <asp:Label ID="CompletedByFirstName" runat="server"></asp:Label>
                                </td>
                                <td style="padding-top: 10px; width: 10%;">
                                    <span class="FieldTitle" title="Completed By Email">Email</span>
                                </td>
                                <td style="padding-top: 10px; width: 40%;">
                                    <asp:Label ID="CompletedByEmail" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="FieldTitle" title="Completed By Last Name">Last Name</span>
                                </td>
                                <td>
                                    <asp:Label ID="CompletedByLastName" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <span class="FieldTitle" title="Completed By Phone">Phone</span>
                                </td>
                                <td>
                                    <asp:Label ID="CompletedByPhone" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        
                        
                    </td></tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" title="Contract Notes" onclick="editHybridField('LetterOfIntentEditorContract', this);" 
                                    onmouseover="checkMouseOver(this);"
                                    onmouseout="checkMouseOut(this);">
                        <span class="LOISectionTitle" >Contract</span>
                        <table cellpadding="0" class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px; width: 25%">
                                    <span class="FieldTitle" title="Contract Executed">Contract Executed</span>
                                </td>
                                <td style="padding-top: 10px; width: 25%">
                                    <asp:Label ID="ContractExecuted" runat="server"></asp:Label>
                                </td>
                                <td style="padding-top: 10px; width: 15%">
                                    <span class="FieldTitle" title="MCTA Used">MCTA Used</span>
                                </td>
                                <td style="padding-top: 10px; width: 35%">
                                    <asp:Label ID="MCTAUsed" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 10px;">
                                    <span class="FieldTitle" title="Sponsor Agreed To Proceed">Sponsor Agreed To Proceed</span>
                                </td>
                                <td colspan="3" style="padding-top: 10px;">
                                    <asp:Label ID="SponsorAgreed" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="padding-top: 10px;">
                                <span class="FieldTitle" title="Contract Notes">Contract Notes</span>
                                   <asp:Label ID="ContractNotes" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="LOITableCell" title="Budget Notes" onclick="editHybridField('LetterOfIntentEditorBudget', this);" 
                                    onmouseover="checkMouseOver(this);"
                                    onmouseout="checkMouseOut(this);">
                        <span class="LOISectionTitle" >Budget</span>
                        <table cellpadding="0" class="LOISectionContainer">
                            <tr>
                                <td style="padding-top: 10px; width: 25%;">
                                    <span class="FieldTitle" title="PCCTC Budget Used">PCCTC Budget Used</span>
                                </td>
                                <td style="padding-top: 10px; width: 20%;">
                                    <asp:Label ID="PCCTCBudgetUsed" runat="server"></asp:Label>
                                </td>
                                <td style="padding-top: 10px; width: 25%;">
                                    <span class="FieldTitle" title="Budget Based Per Patient">Budget Based Per Patient</span>
                                </td>
                                <td style="padding-top: 10px; width: 30%;">
                                    <asp:Label ID="IsBudgetPerPatient" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 10px;">
                                    <span class="FieldTitle" title="Correlative Studies Proposed">Correlative Studies Proposed</span>
                                </td>
                                <td style="padding-top: 10px;">
                                    <asp:Label ID="RelativeStudiesProposed" runat="server">
                                    </asp:Label>
                                </td>
                                <td style="padding-top: 10px;">
                                    <span class="FieldTitle" title="Correlative Studies Funded">Correlative Studies Funded</span>
                                </td>
                                <td style="padding-top: 10px;">
                                    <asp:Label ID="RelativeStudiesFunded" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="height: 60px; vertical-align: top;padding-top: 10px;">
                                    <span class="FieldTitle" title="Budget Notes">Budget Notes</span>
<asp:Label ID="BudgetNotes" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
    </form>
</body>
</html>
