<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminEformActivity.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminEformActivity" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register  TagPrefix="eform" TagName="EFormList" Src="~/Core/Utilities/ConfigDropDown.ascx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EForm Activity</title>
    <link type="text/css" rel="stylesheet" href="../StyleSheets/GlobalStyles.css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link type="text/css" rel="stylesheet" href="../StyleSheets/AdminStyles.css" />
    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../ClientScripts/jquery.js"></script>
    <style type="text/css">
        .dataGrid
        {
            margin-top: 0px;
        }
        #MainOverflow
        {
            max-height: 400px;
            overflow: auto;
            overflow-x: hidden;
        }
        a, a:visited, a:active
        {
            color: #ffffff;
            display: block;
            margin: auto 2px auto 2px;
        }
        a.link, a:visited.link, a:active.link
        {
            display: block;
            text-align: center;
            padding: auto 5px auto 5px;
            color: #000000;
        }
        #btnUpdate
        {

        }
        .AuditField
        {
            display: block;
            font-weight: bold;
            font-size: 12px;
        }
        .AuditFieldValue
        {
            display: block;
            font-size: 12px;
        }
        #EFormActivityGrid th
        {
            text-align: center;
        }
        #EFormActivityGrid td
        {
            white-space: normal;
        }
        
        .fixedListTable
        {
            width: 100%;
            table-layout: fixed;
            border-collapse: collapse;
        }
        
        
        
        #EFormActivityHeader th
        {
            border: solid 1px #AAAAAA;
        }
        #EFormActivityHeader tr#columnGroupHeader th
        {
            padding: 3px 0px;
        }
        
        #EFormActivityHeader tr#columnGroupHeader th.columnGroupPatient,#EFormActivityHeader tr#columnGroupHeaderSpacer th.columnGroupPatient
        {
            background-color: #C3CB15;
            color: #1F1F1F;
            font-size: 14px;
            font-weight: bold;
            border: none;
        }
        
        #EFormActivityHeader tr#columnGroupHeader th.columnGroupClinic,#EFormActivityHeader tr#columnGroupHeaderSpacer th.columnGroupClinic
        {
            background-color: #00BED6;
            color: #1F1F1F;
            font-size: 14px;
            font-weight: bold;
            border: none;
        }
        #EFormActivityHeader tr#columnGroupHeader th.columnGroupEForm,#EFormActivityHeader tr#columnGroupHeaderSpacer th.columnGroupEForm
        {
            background-color: #FFA80D;
            color: #1F1F1F;
            font-size: 14px;
            font-weight: bold;
            border: none;
        }
        
        
        #EFormActivityHeader th.columnGroupPatient
        {
           width: inherit;
        }
        #EFormActivityHeader th.columnGroupPatient a
        {
            color: #7D8413;
            font-size: 12px;
            font-weight: normal;
            text-decoration: none;
        }
        #EFormActivityHeader th.columnGroupPatient a:hover
        {
            text-decoration: underline;
        }
        #EFormActivityHeader th.columnGroupClinic a
        {
            color: #108296;
            font-size: 12px;
            font-weight: normal;
            text-decoration: none;
        }
        #EFormActivityHeader th.columnGroupClinic a:hover
        {
            text-decoration: underline;
        }
        #EFormActivityHeader th.columnGroupEForm a
        {
            color: #CF7A10;
            font-size: 12px;
            font-weight: normal;
            text-decoration: none;
        }
        #EFormActivityHeader th.columnGroupEForm a:hover
        {
            text-decoration: underline;
        }
        
        
        
        
        
        .fixedListTable tr:nth-child(odd) td
        {
            background-color: #efefef;
        }
        
        .fixedListTable tr td
        {
            overflow: hidden;
            border: solid 1px #cccccc;
        }
        /*
        .fixedListTable tr:hover td, .fixedListTable tr:nth-child(odd):hover td
        {
            background-color: #ffcccc;
        }
        */
        .fixedListTable th, .fixedListTable td
        {
            text-align: center;
        }
        .fixedListTable td:first-child
        {
            text-align: left;
            padding-left: 5px;
        }
        .fixedListTable th, .fixedListTable th a
        {
            color: #00668D;
        }
        /* fixed column widths */
        .fixedListTable .columnMRN, #EFormActivityHeader th.columnMRN.columnGroupPatient
        {
            width: 8%;
        }
        .fixedListTable .columnPatient
        {
            width: 14%;
        }
        .fixedListTable td.columnPatient
        {
            text-align: left;
            padding-left: 5px;
        }
        .fixedListTable .columnEformId
        {
            width: 7%;
        }
        .fixedListTable .columnName
        {
            width: 14%;
        }
        .fixedListTable .columnStatus
        {
            width: 16%;
        }
        .fixedListTable .columnSurgeon
        {
            width: 15%;
        }
        .fixedListTable .columnApptDate
        {
            width: 11%;
        }
        .fixedListTable .columnXHTML
        {
            width: 10%;
        }
        .fixedListTable .dataEntryButtonGray
        {
            display: block;
            width: 60px;
            margin: 7px auto;
        }
        
        div#EFormQueryPanel
        {
            width: 60%;
            min-width: 400px;
        }
        div#EFormQueryPanel table
        {
            width: 100%;
            border-spacing:  none;
            border-collapse: collapse;
        }
        div#EFormQueryPanel>table>tbody>tr:nth-child(odd)
        {
            background-color: #efefef;
        }
        div#EFormQueryPanel>table>tbody>tr>td
        {
            font-size: 12px;
            padding: 4px 10px 4px 0px;
        }
        div#EFormQueryPanel>table>tbody>tr>td:first-child
        {
            padding-left: 10px;
            width: 100px;
        }
        
        table#EFormActivityFooter
        {
            margin-top: 5px;
        }
        table#EFormActivityFooter th
        {
            padding: 5px 0px 5px 0px;
        }
        table#EFormActivityFooter th
        {
            padding: 5px 0px 5px 0px;
        }
        
        
        table#EFormActivityFooter th.columnMRN { }
        table#EFormActivityFooter th.columnPatient { background-color: #555555; color: #ffffff; font-size: 15px; font-weight: bold; border-radius: 5px 0px 0px 5px; }
        table#EFormActivityFooter th.columnEformId { background-color: #555555; }
        table#EFormActivityFooter th.columnName { background-color: #555555; }
        table#EFormActivityFooter th.columnStatus { background-color: #555555; border-radius: 0px 5px 5px 0px; }
        table#EFormActivityFooter th.columnSurgeon { background-color: #555555; }
        table#EFormActivityFooter th.columnApptDate { background-color: #555555; }
        table#EFormActivityFooter th.columnXHTML { }
        
        
        
        #footerButtonContainer
        {
            display: block;
            text-align: center;
            margin-top: 6px;
        }
        #footerButtonContainer a
        {
            margin: 0px 100px;
        }
    </style>
    <script type="text/javascript">

        jQuery.noConflict();

        jQuery(document).ready(function () {
            onWindowResize();

            //            jQuery('#<% = AllEFormApptPhysicianField.ClientID %>').change(function () {
            //                var v = this.value;

            //                var c = confirm("Are you sure you want to recode all of the Clinic Physicians in this list?");
            //                if (c == true) {
            //                    jQuery('td.columnSurgeon select').val(v);
            ////                    alert('All associated clinic physicians in this list have been changed, hit "Save Changes" to save.');
            //                } else {
            // //                   alert('Cancelled');
            //                }

            //            });

            //            jQuery('#<% = AllEFormApptTimeField.ClientID %>').change(function () {
            //                var t = this.value;

            //                var c = confirm("Are you sure you want to recode all of the Clinic Dates in this list?");
            //                if (c == true) {
            //                    jQuery('td.columnApptDate input').val(t);
            ////                    alert('All associated clinic dates in this list have been changed, hit "Save Changes" to save.');
            //                } else {
            ////                    alert('Cancelled.');
            //                }

            //            });

        });

        function recodeEFormClinics() {

            var clinicPhysicianField = jQuery('#<% = AllEFormApptPhysicianField.ClientID %>');
            var clinicDateField = jQuery('#<% = AllEFormApptTimeField.ClientID %>');

            var physVal = clinicPhysicianField.val();
            var dateVal = clinicDateField.val();

            var c = confirm("Are you sure you want to recode all of the clinics in this list?");
            if (c == true) {
                jQuery('td.columnSurgeon select').val(physVal);
                jQuery('td.columnApptDate input').val(dateVal);
                alert('All clinic fields have been updated, but have not yet been saved.');
            } else {
                //                   alert('Cancelled');
            }


        }







        var imgDir = "../Images/Calendar/";

        function onWindowResize() {
            var header = jQuery("#EFormActivityHeader");
            var dataTable = jQuery("#EFormActivityData");
            var overflow = jQuery("#MainOverflow");
            var targetWidth = overflow.width();
            // set fixed header table width           
            if (true) { //dataTable.height() + 20 < overflow.height()) {
                targetWidth = targetWidth - 15 + "px";
            }
 //           header.css("width", targetWidth);

            // set overflow
            overflow.css("max-height", jQuery(window).height() - 355 + "px");
        }

        function loadEformIntoModal(url, title) {
            top.showModalWithConfig(url, title, { width: '85%', height: '85%' });
            return false;
        }

        function showLoadingMsg() {
            jQuery('#SearchMessage').html("Loading...");
            jQuery('#SearchResultsAdminBox').hide();
            jQuery('#EFormActivityFooter').hide();
            jQuery('#footerButtonContainer').hide();
        }

    </script>
</head>
<body style="margin: auto; height: auto;">
    <form id="form1" runat="server">
    <span class="adminNavBoxContainerTitle">Search EForms</span>
    <div id="EFormQueryPanel" style="min-height: 0px;" class="adminBox">
        <table>
            <tr>
                <td>EForm Type</td>
                <td><%-- <custom:CaisisSelect runat="server" ID="_EFormNameSearchType" DataTextField="DisplayName" DataValueField="LkpCode" ShowLabel="false" ShowEmptyListItem="true">
                        <asp:ListItem Text="   " Value="" />
                        <asp:ListItem Text="=" Value="equals" />
                        <asp:ListItem Text="<>" Value="notequals" />
                    </custom:CaisisSelect>
--%>
                    <eform:EFormList runat="server" ConfigTypeName="EformConfig" ID="_EFormName" CssClass="RowEformList" UseUserDefault="false"  />

                </td>
            </tr>
            <tr>
                <td>EForm Status</td>
                <td><%-- <custom:CaisisSelect runat="server" ID="_EFormStatusSearchType" DataTextField="DisplayName" DataValueField="LkpCode" ShowLabel="false" ShowEmptyListItem="true">
                        <asp:ListItem Text="   " Value="" />
                        <asp:ListItem Text="=" Value="equals" />
                        <asp:ListItem Text="<>" Value="notequals" />
                    </custom:CaisisSelect>
                    --%><custom:CaisisSelect runat="server" ID="_EFormStatus" ShowLabel="false" ShowEmptyListItem="true" LookupDistinct="EForms;CurrentStatus;CurrentStatus"  /></td>
            </tr>
            <tr>
                <td>Entered</td>
                <td><!--<custom:CaisisTextBox runat="server" ID="DateChooser" ShowLabel="false" ShowCalendar="true" Width="70px" />--><custom:CaisisTextBox runat="server" ID="_EnteredStartDate" ShowLabel="false" ShowCalendar="true" Width="70px" /><span style="display: inline-block; padding: 0px 10px;">to</span><custom:CaisisTextBox runat="server" ID="_EnteredEndDate" ShowLabel="false" ShowCalendar="true" Width="70px" /><span style="display: inline-block; padding: 0px 20px;">by</span>
                    <custom:CaisisSelect runat="server" ID="_EnteredBy" LookupDistinct="EForms;EnteredBy;EnteredBy" ShowLabel="false" ShowEmptyListItem="true" Width="140px" />
                </td>
            </tr>
            <tr>
                <td>Last Updated</td>
                <td><custom:CaisisTextBox runat="server" ID="_UpdatedStartDate" ShowLabel="false" ShowEmptyListItem="true" ShowCalendar="true" Width="70px" /><span style="display: inline-block; padding: 0px 10px">to</span><custom:CaisisTextBox runat="server" ID="_UpdatedEndDate" ShowLabel="false"  ShowCalendar="true" Width="70px" /><span style="display: inline-block; padding: 0px 20px">by</span>
                    <custom:CaisisSelect runat="server" ID="_UpdatedBy" LookupDistinct="EForms;UpdatedBy;UpdatedBy" ShowLabel="false" ShowEmptyListItem="true" Width="140px"/>
                </td>
            </tr>
            <tr>
                <td>Clinic Physician</td>
                <td><custom:CaisisSelect runat="server" ID="_ClinicPhysician" ShowLabel="false" ShowEmptyListItem="true" LookupDistinct="Appointments;ApptPhysician;ApptPhysician" /></td>
            </tr>
            <tr>
                <td>Clinic Date</td>
                <td><custom:CaisisTextBox runat="server" ID="_ClinicStartDate" ShowLabel="false"  ShowCalendar="true" Width="70px" /><span style="display: inline-block; padding: 0px 20px;">to</span>
                    <custom:CaisisTextBox runat="server" ID="_ClinicEndDate" ShowLabel="false"  ShowCalendar="true" Width="70px" />
                </td>
            </tr>

            <tr style="display: none;">
                <td><label for="IdType" >Show Identifier</label></td>
                <td><custom:CaisisSelect runat="server" ID="IdTypeSelection" DataTextField="DisplayName" DataValueField="LkpCode" ShowLabel="false" ShowEmptyListItem="false" /></td>
            </tr>
        </table>
        
        <script type="text/javascript" src="../ClientScripts/popcalendar.js"></script>
    </div>
        <asp:Button runat="server" OnClientClick="showLoadingMsg()" ID="DateChooserSearch" Text="Search" OnClick="RunSearch" CssClass="dataEntryButtonGray" style="margin-top: 4px; margin-left: 350px;" />
        <span runat="server" style="display: block; margin-top: 22px; font-weight: bold;" id="SearchMessage"></span>
    <asp:PlaceHolder runat="server" ID="SearchResultsContainer" Visible="false">
        <div id="SearchResultsAdminBox"  class="adminBox" style="padding: 0px;">
        
        <table runat="server" id="EFormActivityHeader" cellspacing="0" cellpadding="0" class="fixedListTable EFormActivityHeader" style="margin: 0px 0px 0px 0px;">
            <thead>
                <tr id="columnGroupHeaderSpacer" >
                    <th class="columnMRN columnGroupPatient" style="width: 8%; border: none; font-size: 1px; line-height: 1px; font-weight: normal;">&nbsp;</th>
                    <th class="columnPatient columnGroupPatient" style="width: 14%; border: none; font-size: 1px; line-height: 1px;">&nbsp;</th>
                    <th class="columnSurgeon columnGroupClinic" style="width: 15%; border: none; font-size: 1px; line-height: 1px;">&nbsp;</th>
                    <th class="columnApptDate columnGroupClinic" style="width: 11%; border: none; font-size: 1px; line-height: 1px;">&nbsp;</th>
                    <th class="columnEformId columnGroupEForm" style="width: 7%; border: none; font-size: 1px; line-height: 1px;">&nbsp;</th>
                    <th class="columnName columnGroupEForm" style="width: 14%; border: none; font-size: 1px; line-height: 1px;">&nbsp;</th>
                    <th class="columnStatus columnGroupEForm" style="width: 16%; border: none; font-size: 1px; line-height: 1px;">&nbsp;</th>
                    <th class="columnXHTML columnGroupEForm" style="width: 10%; border: none; font-size: 1px; line-height: 1px;">&nbsp;</th>
                    <th class="columnGroupEForm" style="border: none; font-size: 1px; line-height: 1px;">&nbsp;</th>
                </tr>
                <tr id="columnGroupHeader">
                    <th class="columnGroupPatient" colspan="2">Patient</th>
                    <th class="columnGroupClinic" colspan="2">Clinic</th>
                    <th class="columnGroupEForm" colspan="5">EForm</th>
                </tr>
                <tr>
                    <th class="columnMRN columnGroupPatient" style="width: 8%;"><a runat="server" href="#" title="PtMRN">MRN</a></th>
                    <th class="columnPatient columnGroupPatient" style="width: 14%;"><a runat="server" href="#" title="Name">Patient</a></th>
                    <th class="columnSurgeon columnGroupClinic" style="width: 15%;"><a runat="server" href="#" title="EFormApptPhysician">Physician</a></th>
                    <th class="columnApptDate columnGroupClinic" style="width: 11%;"><a runat="server" href="#" title="EFormApptTime">Clinic Date</a></th>
                    <th class="columnEformId columnGroupEForm" style="width: 7%;"><a runat="server" href="#" title="EformId">EFormId</a></th>
                    <th class="columnName columnGroupEForm" style="width: 14%;"><a runat="server" href="#" title="EformName">EForm Name</a></th>
                    <th class="columnStatus columnGroupEForm" style="width: 16%;"><a runat="server" href="#" title="CurrentStatus">Status</a></th>
                    <th class="columnXHTML columnGroupEForm" style="width: 10%;"><a>XHTML</a></th>
                    <th class="columnGroupEForm"><a>Delete</a></th>
                </tr>
            </thead>
        </table>
        <div id="MainOverflow" class="adminBox" style="min-height: 50px; max-height: 100px; margin: 0px 0px 0px 0px;">
        <table id="EFormActivity" cellspacing="0" cellpadding="0" class="fixedListTable" style="margin: 0px 0px 0px 0px;" >
 <asp:Repeater runat="server" ID="EFormActivityRptr" OnItemDataBound="SetEformFields">
                    <ItemTemplate>
                <tr title="Entered <%# Eval("EnteredTime") %> by <%# Eval("EnteredBy") %>
Last Updated <%# Eval("UpdatedTime") %> by <%# Eval("UpdatedBy") %>">
                    <td class="columnMRN">
                        <asp:Label runat="server" ID="PtMRN" CssClass="AuditFieldValue" />
                        <asp:Label runat="server" ID="IdType" CssClass="AuditField"></asp:Label><asp:Label runat="server" ID="IdTypeValue" CssClass="AuditFieldValue"></asp:Label>
                    </td>
                    <td class="columnPatient">
                        <asp:Label runat="server" ID="PtLabel"></asp:Label>
                    </td>
                    <td class="columnSurgeon">
                         <custom:CaisisSelect runat="server" ID="EFormApptPhysicianField" ShowLabel="false" Table="EForms" Field="EFormApptPhysician" LookupDistinct="Appointments;ApptPhysician;ApptPhysician" OnValueChanged="SetRecordChanged" Width="110px" />
                    </td>
                    <td class="columnApptDate">
                         <custom:CaisisTextBox runat="server" ID="EFormApptTimeField" ShowLabel="false" Table="EForms" Field="EFormApptTime" OnValueChanged="SetRecordChanged" Width="70px" ShowCalendar="true" />
                    </td>
                    <td class="columnEformId">
                        <custom:CaisisHidden runat="server" Table="Eforms" Field="EformId" ID="EformId" Value='<%# Eval("EformId") %>' />
                                            <%# Eval("EFormId") %>
                    </td>
                    <td class="columnName">
                        <%# Eval("EFormName") %>
                    </td>
                    <td class="columnStatus">
                         <custom:CaisisSelect runat="server" ID="StatusField" ShowLabel="false" Table="EForms" Field="CurrentStatus" OnValueChanged="SetRecordChanged" Width="110px" />
                    </td>
                    <td class="columnXHTML">
                       <a class="dataEntryButtonGray" href="#" onclick="loadEformIntoModal('AdminEFormDocViewer.aspx?docType=xml&eformId=<%# Eval("EFormId") %>','<%# PageUtil.EscapeSingleQuotes(Eval("EFormName").ToString()) %> for <%# PageUtil.EscapeSingleQuotes(Eval("Name").ToString()) %> (XML)'); return false;">
                                                View XML</a> <a class="dataEntryButtonGray" href="#" onclick="loadEformIntoModal('../Core/EForms/EFormPrintableText.aspx?docType=html&eformId=<%# Eval("EFormId") %>','<%# PageUtil.EscapeSingleQuotes(Eval("EFormName").ToString()) %> for <%# PageUtil.EscapeSingleQuotes(Eval("Name").ToString()) %> (Printable)'); return false;">View Form</a>
                    </td>
                    <td>
                        <asp:ImageButton runat="server" ID="DeleteBtn" AlternateText="Delete" ToolTip="Delete this Eform?"
                                                OnClientClick="return confirmDelete();" ImageUrl="~/Images/EFormDeleteRow.png"
                                                OnCommand="DeleteEform" CommandArgument='<%# Eval("EformId") %>' />
                    </td>
                </tr> 

                    </ItemTemplate>
                </asp:Repeater>
        </table>
  <%--
            <ul id="EFormActivityData" class="adminBoxNavList">
              <asp:Repeater runat="server" ID="EFormActivityRptr" OnItemDataBound="SetEformFields">
                    <ItemTemplate>
                        <li class="<%# Container.ItemIndex%2==0?"":"alternate" %>">
                            <table cellspacing="0" cellpadding="0" class="fixedListTable">
                                <thead>
                                    <tr>
                                        <td class="columnMRN">
                                            <asp:Label runat="server" ID="IdType" CssClass="AuditField"></asp:Label><asp:Label runat="server" ID="IdTypeValue" CssClass="AuditFieldValue"></asp:Label>
                                            <span class="AuditField">MRN: </span><asp:Label runat="server" ID="PtMRN" CssClass="AuditFieldValue"></asp:Label> <span class="AuditField">Entered By:</span> <span class="AuditFieldValue">
                                                    <%#Eval("EnteredBy") %>
                                                </span></span><span class="AuditField">Entered Time:</span> <span class="AuditFieldValue">
                                                    <%#Eval("EnteredTime")%>
                                                </span></span><span class="AuditField">Updated By:</span> <span class="AuditFieldValue">
                                                    <%#Eval("UpdatedBy") %>
                                                </span></span><span class="AuditField">Updated Time</span> <span class="AuditFieldValue">
                                                    <%#Eval("UpdatedTime") %>
                                                </span>
                                        </td>
                                        <td class="columnPatient">
                                            <asp:Label runat="server" ID="PtLabel"></asp:Label>
                                        </td>
                                        <td class="columnEformId">
                                            <custom:CaisisHidden runat="server" Table="Eforms" Field="EformId" ID="EformId" Value='<%# Eval("EformId") %>' />
                                            <%# Eval("EFormId") %>
                                        </td>
                                        <td class="columnName">
                                            <%# Eval("EFormName") %>
                                        </td>
                                        <td class="columnStatus">
                                            <custom:CaisisSelect runat="server" ID="StatusField" ShowLabel="false" Table="EForms"
                                                Field="CurrentStatus" OnValueChanged="SetRecordChanged">
                                            </custom:CaisisSelect>
                                        </td>
                                        <td class="columnSurgeon">
                                            <%# Eval("EFormApptPhysician")%>
                                        </td>
                                        <td class="columnXHTML">
                                            <a class="dataEntryButtonGray" href="#" onclick="loadEformIntoModal('AdminEFormDocViewer.aspx?docType=xml&eformId=<%# Eval("EFormId") %>','<%# PageUtil.EscapeSingleQuotes(Eval("EFormName").ToString()) %> for <%# PageUtil.EscapeSingleQuotes(Eval("Name").ToString()) %> (XML)'); return false;">
                                                View XML</a> <a class="dataEntryButtonGray" href="#" onclick="loadEformIntoModal('../Core/EForms/EFormPrintableText.aspx?docType=html&eformId=<%# Eval("EFormId") %>','<%# PageUtil.EscapeSingleQuotes(Eval("EFormName").ToString()) %> for <%# PageUtil.EscapeSingleQuotes(Eval("Name").ToString()) %> (Printable)'); return false;">
                                                    View Form</a>
                                        </td>
                                        <td>
                                            <asp:ImageButton runat="server" ID="DeleteBtn" AlternateText="Delete" ToolTip="Delete this Eform?"
                                                OnClientClick="return confirmDelete();" ImageUrl="~/Images/EFormDeleteRow.png"
                                                OnCommand="DeleteEform" CommandArgument='<%# Eval("EformId") %>' />
                                        </td>
                                    </tr>
                                </thead>
                            </table>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>  
            </ul>--%>
        </div>
        </div>
        <table runat="server" id="EFormActivityFooter" cellspacing="0" cellpadding="0" class="fixedListTable" >
            <thead>
                <tr>
                    <th class="columnMRN">&nbsp;</th>
                    <th class="columnPatient">Recode All</th>
                     <th class="columnSurgeon">
                         <custom:CaisisSelect runat="server" ID="AllEFormApptPhysicianField" ShowLabel="false" Width="110px"  LookupDistinct="Appointments;ApptPhysician;ApptPhysician" />
                    </th>
                    <th class="columnApptDate">
                         <custom:CaisisTextBox runat="server" ID="AllEFormApptTimeField" ShowLabel="false" Width="70px" ShowCalendar="true" />
                    </th>
                    <th class="columnEformId" colspan="2" style="width: auto; text-align: left; padding-left: 30px;">
                    <a class="dataEntryButtonGray" onclick="recodeEFormClinics();" >Recode</a>
                    </th>
                    <th class="columnStatus">&nbsp;</th>
                    <th class="columnXHTML">&nbsp;</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
        </table>
        <span id="footerButtonContainer">
        <a class="dataEntryButtonGray" onclick="location.reload();" >Cancel</a><asp:Button runat="server" ID="btnUpdate" Text="Save Changes" ToolTip="Save Changes" CssClass="dataEntryButtonGray" OnClick="UpdateEformStatuses" /></span>
    </asp:PlaceHolder>
    </form>
</body>
</html>
