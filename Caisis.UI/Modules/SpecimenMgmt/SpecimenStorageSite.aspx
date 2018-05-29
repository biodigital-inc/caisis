<%@ Page EnableViewState="true" Language="c#" CodeFile="SpecimenStorageSite.aspx.cs" AutoEventWireup="true"
    Inherits="Caisis.UI.Modules.SpecimenMgmt.SpecimenStorageSite" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Specimen Storage Site</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    function refreshParent()
    {
        var modWin = top.frames['ModuleWindow'];
        if(modWin && modWin.frames['MainWindow'])
        {
            var storageManagerWindow = modWin.frames['MainWindow'];
            var url = 'StorageManager.aspx';
            storageManagerWindow.location = url;
        }
        top.hideModal();
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
            width:10%; text-align:right; font-size:11px; 
        }
        td.rightR
        {
            width:90%; text-align:left; font-size:11px;
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
            width: 100%; border: 0px; align: center; 
            cellspacing:5px; cellpadding: 5px;
        }
    </style>
</head>
<body style="margin: 0px; width: 100%; background-color: #f8fafc;">
    <form id="dataForm" method="post" runat="server" defaultfocus="Name">
    <asp:HiddenField ID="delResp" runat="server" />
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2">
                    <asp:Label id="PageTitle" runat="server" class="ListManTitle"></asp:Label>
                </td>
            </tr>
            <!-- Site Info Input Controls -->
            <tr runat="server" id="inputControlsRow">
                <%--Left Site Info Input Controls --%>
                <td class="left">
                    <table class="leftAndRight">
                        <tr>
                            <td class="leftL" style="padding-bottom: 7px; color:Maroon; width: 25%;">
                                Name 
                            </td>
                            <td class="leftR" style="padding-bottom: 7px;">
                                <cc:CaisisTextBox FieldLabel="Name " runat="server" ID="Name"
                                    Table="SpecimenSites" Field="SiteName" TabIndex="1" MaxLength="50"
                                    Width="200" ShowLabel="false" />
                            <asp:RequiredFieldValidator ID="NameRfv" ControlToValidate="Name" runat="server" ErrorMessage="Please enter Name"/>
                            </td>
                        </tr>   
                        <tr>
                            <td class="leftL" style="padding-bottom: 7px; width: 25%;">
                                Address 1
                            </td>
                            <td class="leftR" style="padding-bottom: 7px;">
                                <cc:CaisisTextBox FieldLabel="Address1 " runat="server" ID="Address1"
                                    Table="SpecimenSites" Field="SiteAddress1" TabIndex="2" MaxLength="50"
                                    Width="200" ShowLabel="false" />
                            </td>
                        </tr>
                        <tr>
                            <td class="leftL" style="padding-bottom: 7px; width: 25%;">
                                Address 2
                            </td>
                            <td class="leftR" style="padding-bottom: 7px;">
                                <cc:CaisisTextBox FieldLabel="Address1 " runat="server" ID="Address2"
                                    Table="SpecimenSites" Field="SiteAddress2" TabIndex="3" MaxLength="50"
                                    Width="200" ShowLabel="false" />
                            </td>
                        </tr>
                        <tr>
                            <td class="leftL" style="padding-bottom: 5px; width: 25%;">
                                City
                            </td>
                            <td class="leftR" style="padding-bottom: 5px;">
                               <cc:CaisisTextBox FieldLabel="City " runat="server" ID="City"
                                    Table="SpecimenSites" Field="SiteCity" TabIndex="4" MaxLength="50"
                                    Width="200" ShowLabel="false" />
                            </td>
                        </tr>
                        <tr>
                            <td class="leftL" style="padding-bottom: 5px; width: 25%;">
                                State
                            </td>
                            <td class="leftR" style="padding-bottom: 5px;">
                               <cc:CaisisComboBox FieldLabel="State " runat="server" ID="State"
                                    Table="SpecimenSites" Field="SiteState" TabIndex="5" MaxLength="50"
                                     LookupCode="State" DropDownWidth="200px" Width="200" ShowLabel="false" />
                            </td>
                        </tr>
                        <tr>
                            <td class="leftL" style="padding-bottom: 5px; width: 25%;">
                                Postal Code
                            </td>
                            <td class="leftR" style="padding-bottom: 5px;">
                               <cc:CaisisTextBox FieldLabel="State " runat="server" ID="PostalCode"
                                    Table="SpecimenSites" Field="SitePostalCode" TabIndex="6" MaxLength="50"
                                    Width="200" ShowLabel="false" />
                            </td>
                        </tr>
                    </table>
                </td>
                <%--Right Specimen Info Input Controls --%>
                <td class="right">
                    <table class="leftAndRight">
                       <tr>
                            <td class="rightL" style="padding-top: 5px; vertical-align: top;">
                                Notes
                            </td>
                            <td class="rightR" style="padding-top: 5px;">
                                <cc:CaisisTextArea FieldLabel="Notes " runat="server" ID="Notes" TabIndex="7"
                                    Table="SpecimenSites" Field="SiteNotes" Font-Size="Small" Height="100" Width="265"
                                    ShowLabel="False"></cc:CaisisTextArea>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <!-- Buttons: Cancel&Close, Save&Close, Delete Site -->
            <tr>
                <td align="center" style="vertical-align: top; padding-top: 15px; padding-bottom: 15px;"
                    colspan="2">
                    
                    <asp:ImageButton ID="SaveBtn" OnCommand="Save_Click" runat="server" ImageUrl="..\..\Images\buttonSaveAndClose.gif"
                        Style="margin-right: 25px; cursor: pointer;" ToolTip="Save Changes and Close" TabIndex="8" />
                                        
                   <img id="CancelBtn"  onclick="dataForm.reset();"  src="..\..\Images\buttonCancelChanges.gif"
                        style="vertical-align: bottom; cursor: pointer; margin-right: 25px;" 
                        alt="Cancel Changes" title="Cancel Changes" TabIndex="9"/>
                        
                   <asp:ImageButton ID="DeleteBtn" OnClientClick="return confirm('Are you SURE you want to permanently delete this Site ?');" 
                        OnCommand="Delete_Click" runat="server" ImageUrl="~/Images/buttonDeleteAndClose.gif" Style="margin-right: 25px; cursor: pointer;" 
                        ToolTip="Delete Site" TabIndex="10" />
                    
                    
                    <br />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
