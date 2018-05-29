<%@ Page EnableViewState="true" Language="c#" CodeFile="SpecimenStorage.aspx.cs" AutoEventWireup="true"
    Inherits="Caisis.UI.Modules.SpecimenMgmt.SpecimenStorage" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Specimen Storage</title>
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
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2">
                    <asp:Label id="PageTitle" runat="server" class="ListManTitle"></asp:Label>
                </td>
            </tr>
            
            <!-- Site Info Input Controls -->
            <tr runat="server" id="inputControlsRow">
                <%--Left Site Info Input Controls --%>
                <td class="left" style="width: 52%">
                    <table class="leftAndRight">
                        <tr>
                            <td class="leftL" style="padding-bottom: 7px; width: 25%; color:Maroon;">
                                Name 
                            </td>
                            <td class="leftR" style="padding-bottom: 7px;">
                                <cc:CaisisTextBox FieldLabel="Name " runat="server" ID="Name"
                                    Table="SpecimenStorages" Field="StorageName" TabIndex="1" MaxLength="50"
                                    Width="200" ShowLabel="false" />
                                <asp:RequiredFieldValidator ID="NameRfv" ControlToValidate="Name" runat="server" ErrorMessage="Please enter Name"/>
                            </td>
                        </tr>   
                        <tr>
                            <td class="leftL" style="padding-bottom: 7px; width: 25%;">
                                Type
                            </td>
                            <td class="leftR" style="padding-bottom: 7px;">
                                <cc:CaisisTextBox FieldLabel="Type " runat="server" ID="Type"
                                    Table="SpecimenStorages" Field="StorageType" TabIndex="2" MaxLength="50"
                                    Width="200" ShowLabel="false" />
                            </td>
                        </tr>
                        <tr>
                            <td class="leftL" style="padding-bottom: 7px; width: 25%;">
                                Status
                            </td>
                            <td class="leftR" style="padding-bottom: 7px;">
                                <cc:CaisisTextBox FieldLabel="Status " runat="server" ID="Status"
                                    Table="SpecimenStorages" Field="StorageStatus" TabIndex="3" MaxLength="50"
                                    Width="200" ShowLabel="false" />
                            </td>
                        </tr>
                        <tr>
                            <td class="leftL" style="padding-bottom: 5px; width: 25%;">
                                Max Container #
                            </td>
                            <td class="leftR" style="padding-bottom: 5px;">
                               <cc:CaisisTextBox FieldLabel="Maximum Container Number " runat="server" ID="MaxContainer"
                                    Table="SpecimenStorages" Field="MaxContainerNo" TabIndex="4" MaxLength="50"
                                    Width="200" ShowLabel="false" />
                              <asp:CompareValidator ID="intCV1" runat="server" Operator="DataTypeCheck" Type="Integer" 
                                    ErrorMessage="Please enter an integer" ControlToValidate="MaxContainer" />
                            </td>
                        </tr>
                        <tr>
                            <td class="leftL" style="padding-bottom: 5px; width: 25%;">
                                Curr Container #
                            </td>
                            <td class="leftR" style="padding-bottom: 5px;">
                               <cc:CaisisTextBox FieldLabel="Current Container Number " runat="server" ID="CurrentContainer"
                                    Table="SpecimenStorages" Field="CurContainerNo" TabIndex="5" MaxLength="50"
                                     Width="200" ShowLabel="false" />
                               <asp:CompareValidator ID="intCV2" runat="server" Operator="DataTypeCheck" Type="Integer" 
                                    ErrorMessage="Please enter an integer" ControlToValidate="CurrentContainer" />
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
                                <cc:CaisisTextArea FieldLabel="Notes " runat="server" ID="CaisisTextArea1" TabIndex="7"
                                    Table="SpecimenStorages" Field="StorageNotes" Font-Size="Small" Height="100" Width="265"
                                    ShowLabel="False"></cc:CaisisTextArea>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <!-- Buttons: Cancel&Close, Save&Close, Delete Storage -->
            <tr>
                <td align="center" style="vertical-align: top; padding-top: 15px; padding-bottom: 15px;"
                    colspan="2">
                    
                    <asp:ImageButton ID="SaveBtn" OnCommand="Save_Click" runat="server" ImageUrl="..\..\Images\buttonSaveAndClose.gif"
                        Style="margin-right: 25px; cursor: pointer;" ToolTip="Save Changes and Close" TabIndex="8" />
                        
                    <img id="CancelBtn"  onclick="dataForm.reset();"  src="..\..\Images\buttonCancelChanges.gif"
                        style="vertical-align: bottom; cursor: pointer; margin-right: 25px;" 
                        alt="Cancel Changes" title="Cancel Changes" tabIndex="9"/>
                        
                    <asp:ImageButton ID="DeleteBtn" OnClientClick="return confirm('Are you SURE you want to permanently delete this Storage/Rack ?');" OnCommand="Delete_Click" runat="server" ImageUrl="~/Images/buttonDeleteAndClose.gif" 
                        Style="margin-right: 25px; cursor: pointer;" ToolTip="Delete Storage" TabIndex="10" />
                    
                    
                    <br />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
