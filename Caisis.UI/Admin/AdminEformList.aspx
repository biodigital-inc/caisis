<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminEformList.aspx.cs" Inherits="Caisis.UI.Admin.AdminEformList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin EForm List</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery.tablesorter.min.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        var USE_NEW_WINDOW = true;
        var BUILDER_WINDOW;

        
        function createNewEForm() {
            return loadEForm('dynamic', '','');
        }

        function loadEForm(type, eFormName, eid) {
            if (type == 'dynamic') {
                // warn user if they're editing Baseline form
                if (eFormName == 'Baseline') {
                    // cancel by user request if needed
                    var goToBaseline = confirm('Editing this Eform may have consequences to the Protocol Manager module. Would you like to continue?');
                    if (!goToBaseline) {
                        return false;
                    }
                }
                var url = 'AdminEformBuilder/AdminEformBuilder.aspx?eformId=' + eid;
                if (USE_NEW_WINDOW) {
                    BUILDER_WINDOW = window.open(url,'','menubar=0,toolbar=0,resizable=1');
                }
                else {
                    parent.showHideAdminNav(true);
                    window.location = url;
                }
            }
            else {
                alert('Only dynamic EForm can be loaded at this time.');
            }
            return false;
        }

        function closeBuilderAndReload() {
            if (BUILDER_WINDOW) BUILDER_WINDOW.close();
            window.location = window.location;
        }

        function adjustOverflow() {
            jQuery('#EFormListContainer').css('height', jQuery(window).height() - 115 + 'px');
        }

        jQuery(document).ready(function() {
            // setup sorting on eform list
            jQuery('#EFormListTable').tablesorter();
            var adjustRows = function() {
                setTimeout(function() {
                    jQuery('#EFormListTable TBODY').find('TR').each(function(i, row) {
                        jQuery(row).attr('class', i % 2 == 0 ? 'RowA' : 'RowB');
                    });
                }, 50);
            };
            jQuery('#EFormListTable THEAD').find('TH').click(adjustRows);
            // at runtime move header row from inner table to outter table to prevent scrolling
            var inner = document.getElementById('InnerHeader');
            var outer = document.getElementById('OuterTable');
            outer.appendChild(inner.parentNode.removeChild(inner));

            adjustOverflow();
            jQuery(window).resize(adjustOverflow);
        });

        /* ]]> */
    </script>

    <style type="text/css">
        .EFormListTable
        {
            width: 100%;
            table-layout: fixed;
            text-align: left;
        }
        #EFormListContainer
        {
            overflow: auto;
            overflow-x: hidden;
            height: 400px;
            clear: both;
            border: solid 1px #cccccc;
        }
        th
        {
            
        }
		.RowA
		{
			background-color: #E0EBF1;
		}
		.RowA td
		{
			font-family: Arial, Helvetica, sans-serif;
			font-size: 12px;
			color: #111111;
			border-bottom: solid 1px #cccccc;
			padding: 6px 0px 6px 14px;
		}
		.RowB
		{
			background-color: #ffffff;
		}
		.RowB td
		{
			font-family: Arial, Helvetica, sans-serif;
			font-size: 12px;
			color: #111111;
			border-bottom: solid 1px #cccccc;
			padding: 6px 0px 6px 14px;
		}
		.RowHighlight
		{
			background-color: #E3CFCF;
			cursor: pointer;
		}
		.RowHighlight td
		{
			font-family: Arial, Helvetica, sans-serif;
			font-size: 12px;
			color: #000000;
			border-bottom: solid 1px #cccccc;
			padding: 6px 0px 6px 14px;
		}
		.ListHeader th
		{
			cursor: pointer;
            text-decoration: underline;
			font-size: 12px;
			padding: 6px 0px 6px 14px;
			color: #ffffff;
			background-color: #3D556D;
		}
		#UpdateActiveEformsBtn
		{
		    float: right;
		    margin-top: 10px;
		}
    </style>
</head>
<body class="AdminBody">
    <form id="form1" runat="server">
    <img alt="Create New Eform" title="Create New Eform" src="../Images/AdminImages/Button_CreateNewEForm.png" onclick="return createNewEForm();"
        style="cursor: pointer; margin: 0px 60px 6px 0px; vertical-align: middle;" />
        
        <span style="font-size: 12px; font-weight: bold;">Select a workflow to view/edit in a new window.</span>
        
    <table id="OuterTable" class="EFormListTable" cellspacing="0">
    </table>
    <div id="EFormListContainer">
        <table id="EFormListTable" class="EFormListTable" cellspacing="0">
            <thead id="InnerHeader">
                <tr class="ListHeader">
                    <th style="width: 50px; text-align: left;">
                        Active
                    </th>
                    <th style="width: auto; text-align: left;">
                        EForm Name
                    </th>
                    <th style="width: 200px; text-align: left;">
                        Disease
                    </th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater runat="server" ID="EFormsRptr">
                    <ItemTemplate>
                        <tr class="<%# Container.ItemIndex % 2 == 0 ? "RowA" : "RowB" %>" onmouseover="<%# Eval("EFormType").ToString()=="dynamic" ? "this.className = 'RowHighlight';" : "" %>"
                            onmouseout="this.className = this.rowIndex % 2 == 0 ? 'RowA' : 'RowB';">
                            <td style="width: 50px; text-align: center;">
                                <asp:HiddenField runat="server" ID="MetaEformId" Value='<%# Eval("EFormId") %>' />
                                <asp:CheckBox runat="server" ID="ActiveEformCheckBox" Checked=<%# (bool)Eval("Active") %> OnCheckedChanged="UpdateEformActiveBit"  />
                            </td>
                            <td style="width: auto;" onclick="loadEForm('<%# Eval("EFormType") %>','<%# Eval("Name").ToString().Replace("'","\\'") %>','<%# Eval("EFormId") %>');">
                                <span class="EFormNameText"><%# Eval("Name") %></span>
                            </td>
                            <td style="width: 200px;" onclick="loadEForm('<%# Eval("EFormType") %>','<%# Eval("Name").ToString().Replace("'","\\'") %>','<%# Eval("EFormId") %>');">&nbsp;&nbsp;&nbsp;<span class="EFormDiseaseText"><%# Eval("Disease") %></span></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <asp:ImageButton runat="server" ID="UpdateActiveEformsBtn" ImageUrl="AdminEformBuilder/Images/AdminImages/Button_Save.png" OnClick="BuildEformList" />
    </form>
</body>
</html>
