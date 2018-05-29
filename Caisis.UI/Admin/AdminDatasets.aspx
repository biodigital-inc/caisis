<%@ Page EnableEventValidation="false" Language="c#" Inherits="Caisis.UI.Admin.AdminDatasets"
    CodeFile="AdminDatasets.aspx.cs" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title>Group Administrator</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta content="NOINDEX" name="ROBOTS">
    <meta http-equiv="PRAGMAS" content="NO-CACHE">
    <meta http-equiv="EXPIRES" content="0">
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .DimensionSelect { width: 150px; }
    </style>

    <script type="text/javascript">
        var listOfDimensionSelects = ['All','Institution','Physician','Protocol','Disease'];
		function showInstDropDown(select)
		{
		    if(select)
		    {
		        var selectedValue = select.options[select.selectedIndex].value;
		        for(var k in listOfDimensionSelects)
		        {
		            var selectType = listOfDimensionSelects[k];
		            var selectId = selectType + 'DropDown';
		            var dropDown = document.getElementById(selectId);
		            if(selectedValue == selectType)
		            {
		                dropDown.style.display = "";
		                dropDown.style.width = "150px";
		            }
		            else
		            {
		                dropDown.style.display = "none";
		                dropDown.style.width = "0px";
		            }
		        }
		    }
		}
		var showSelectsOnLoad = function() { showInstDropDown(document.getElementById('DimensionTypeDrownDown')); }
		window.attachEvent ? window.attachEvent('onload',showSelectsOnLoad) : window.addEventListener('load',showSelectsOnLoad,false);
    </script>

</head>
<body class="AdminBody">
    <form id="dataForm" method="post" runat="server">
        <!--- XML Output for Updating Config Site -->
        <asp:Panel runat="server" ID="XmlPanel">
            <div class="requiredField" style="padding-bottom: 10px;">
                The Dataset table has been updated, however, for the Dataset to be functional, you
                may need to update your DataSet.xml(in App_Data folder) file with the following
                XML.</div>
            <asp:Label runat="server" ID="XMLBlock"></asp:Label>
            <a class="requiredField" style="display: block; margin-top: 10px;" href="AdminDatasets.aspx">
                &lt;&lt;&lt; Back to Manage DataSets</a></asp:Panel>
        <table width="490" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2">
                    <div id="RepeaterDiv" runat="server">
                        <table width="550" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                                <td width="30" class="requiredField">
                                    Id</td>
                                <td width="150" class="requiredField">
                                    Name</td>
                                <td width="30" class="requiredField">
                                    Active</td>
                                <td width="110" class="requiredField">
                                    Updated</td>
                                <td width="140" height="20" align="right" class="requiredField">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="1" colspan="5" class="ListManDataTableDottedLine">
                                    <img src="../Images/shim.gif" width="1" height="1"></td>
                            </tr>
                            <asp:Repeater ID="rptDatasets" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td height="25" width="30">
                                            &nbsp;<%# Eval("DatasetId")%></td>
                                        <td height="25" width="150">
                                            &nbsp;<%# Eval("DatasetName")%></td>
                                        <td height="25" width="30">
                                            &nbsp;<%# Eval("DatasetActive")%></td>
                                        <td height="25" width="110">
                                            &nbsp;<%# Eval("UpdatedTime")%></td>
                                        <td width="140" align="left" nowrap="nowrap">
                                            &nbsp;&nbsp;<asp:ImageButton ID="EditBtn" OnCommand="EditButtonClick" CommandArgument='<%# Eval("DatasetId")%>'
                                                CommandName='<%# ((System.Data.DataRowView)Container.DataItem)["DatasetId"]%>'
                                                runat="server" src="../Images/ButtonEditSmall.gif"></asp:ImageButton>&nbsp;&nbsp;&nbsp;<asp:ImageButton
                                                    ID="DeleteBtn" OnCommand="DeleteButtonClick" CommandArgument='<%# ((System.Data.DataRowView)Container.DataItem)["DatasetId"]%>'
                                                    runat="server" src="../Images/ButtonDeleteSmall.gif"></asp:ImageButton></td>
                                    </tr>
                                </ItemTemplate>
                                <SeparatorTemplate>
                                    <tr>
                                        <td height="1" colspan="5" class="ListManDataTableDottedLine">
                                            <img src="../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                </SeparatorTemplate>
                                <FooterTemplate>
                                    <tr>
                                        <td height="1" colspan="5" class="ListManDataTableDottedLine">
                                            <img src="../Images/shim.gif" width="1" height="1"></td>
                                    </tr>
                                </FooterTemplate>
                            </asp:Repeater>
                            <tr>
                                <td colspan="5" height="30" align="left">
                                    <asp:LinkButton runat="server" CssClass="requiredField" OnCommand="AddNewRecordClick"
                                        Text="add new dataset >>>"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <table id="AddDatasetsTable" runat="server" width="500" border="0" cellspacing="3"
                        cellpadding="0">
                        <tr>
                            <td colspan="2">
                                <span style="color: Red;" id="ErrorMessage" runat="server"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="hidden" id="GroupId" runat="server" name="GroupId" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="DatasetId">
                                    dataset id</label></td>
                            <td>
                                <input type="text" id="DatasetId" readonly="true" disabled="true" runat="server" style="width: 50;" /></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="DatasetName">
                                    dataset name</label></td>
                            <td>
                                <input type="text" id="DatasetName" runat="server" style="width: 250;" /></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="DatasetActive">
                                    active</label></td>
                            <td>
                                <input type="checkbox" id="DatasetActive" runat="server" value="1" checked="true" /></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="DimensionTypeDrownDown">
                                    dimension type</label></td>
                            <td>
                                <select class="DimensionSelect" onchange="showInstDropDown(this);" id="DimensionTypeDrownDown"
                                    runat="server">
                                    <option value="All">All</option>
                                    <option value="Institution">Institution</option>
                                    <option value="Physician">Physician</option>
                                    <option value="Protocol">Protocol</option>
                                    <option value="Disease">Disease</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                dimension value</td>
                            <td>
                                <!-- DIMENSION VALUES: Shows selected based on Dimension Type -->
                                <asp:DropDownList ID="AllDropDown" runat="server" CssClass="DimensionSelect">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="InstitutionDropDown" CssClass="DimensionSelect" DataTextField="Institution"
                                    DataValueField="Institution" DataSourceID="InstDS" runat="server">
                                </asp:DropDownList>
                                <asp:DropDownList ID="PhysicianDropDown" CssClass="DimensionSelect" DataTextField="PhFirstName" OnDataBound="FormatPhysicianName"
                                    DataValueField="PhLastName" DataSourceID="PhysDS" runat="server">
                                </asp:DropDownList>
                                <asp:DropDownList ID="ProtocolDropDown" CssClass="DimensionSelect" DataTextField="ProtocolNum"
                                    DataValueField="ProtocolNum" DataSourceID="ProtDS" runat="server">
                                </asp:DropDownList>
                                <asp:DropDownList ID="DiseaseDropDown" CssClass="DimensionSelect" DataTextField="DiseaseName"
                                    DataValueField="DiseaseName" DataSourceID="DisDS" runat="server">
                                </asp:DropDownList>
                                <!-- DATA SOURCES FOR DROP DOWNS -->
                                <asp:ObjectDataSource runat="server" ID="InstDS" TypeName="Caisis.DataAccess.InstitutionDa"
                                    SelectMethod="GetInstitutions"></asp:ObjectDataSource>
                                <asp:ObjectDataSource runat="server" ID="PhysDS" TypeName="Caisis.DataAccess.PhysicianDa"
                                    SelectMethod="GetDistinctPhysicians"></asp:ObjectDataSource>
                                <asp:ObjectDataSource runat="server" ID="ProtDS" TypeName="Caisis.DataAccess.ProtocolDa"
                                    SelectMethod="GetDistinctProtocols"></asp:ObjectDataSource>
                                <asp:ObjectDataSource runat="server" ID="DisDS" TypeName="Caisis.DataAccess.DiseaseDa"
                                    SelectMethod="GetDiseases"></asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td height="30" valign="bottom">
                                <asp:ImageButton ID="AddBtn" OnCommand="AddButtonClick" Width="65" Height="21" runat="server"
                                    ImageUrl="~/Images/AdminImages/submit.gif"></asp:ImageButton><asp:ImageButton ID="UpdateBtn"
                                        OnCommand="UpdateButtonClick" Width="65" Height="21" runat="server" ImageUrl="~/Images/AdminImages/submit.gif">
                                    </asp:ImageButton>
                                <asp:ImageButton ID="CancelButton" OnCommand="Page_Load" Width="65" Height="21" runat="server"
                                    ImageUrl="~/Images/CancelOnWhite_small.gif"></asp:ImageButton></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" height="50" valign="middle">
                    <asp:Literal ID="valMsg" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
