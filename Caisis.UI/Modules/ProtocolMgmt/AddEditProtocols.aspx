<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddEditProtocols.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.AddEditProtocols" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Add/Edit a Protocol</title>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="StyleSheets/ProtocolMgmtStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="ProtocolMgmtScripts.js" type="text/javascript"></script>
    <script type="text/javascript">		

	</script>
   <style type="text/css">
    #FieldsHolder span { display: block; float: left; }    
#MainOverflow
    {
        height: 330px;
        overflow: auto;
    }
    </style>
</head>
<body>
    <form id="dataForm" method="post" runat="server">
			<table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">

				<tr>
					<td align="center" valign="top">
					</td>
					
					<td align="center">
						<table width="760" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td  colspan="6" class="ListManTitle" align="left" style="padding-left: 15px;">Add / Edit Protocol:&nbsp;&nbsp; <asp:DropDownList ID="ProtocolsDropDown" OnSelectedIndexChanged="OnDropDownChange" Width="580" AutoPostBack=true runat=server></asp:DropDownList></td>
							</tr>
							<tr>
								<td colspan="6"><img src="../../Images/shim.gif" width="10" height="8"></td>
							</tr>
							<tr>
								<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
								<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="10" height="5"></td>
								<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="20" height="5"></td>
								<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="420" height="5"></td>
								<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="300" height="5"></td>
								<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
							</tr>

							<tr>
								<td class="ListManBGTableLeftSide">&nbsp;</td>
								<td colspan="2" class="ListManBGTableBody">&nbsp;</td>
								<td class="ListManBGTableBody" align="left" colspan="2" style="vertical-align: middle; height: 40px;">
								    <asp:Label ID="UserMessage" runat="server">To add a new protocol, enter the information below.  To edit an existing protocol, select from drop down items above.<br/>Fields named in <span class="requiredField">red</span> are required.</asp:Label></td>
								<td class="ListManBGTableRightSide">&nbsp;</td>
							</tr>

							<tr>
								<td class="ListManBGTableLeftSide">&nbsp;</td>
								<td colspan="2" class="ListManBGTableBody">&nbsp;</td>
								<td colspan="2" align="left" valign="top" class="ListManBGTableBody" style="vertical-align: top;">
									<cic:CaisisHidden Field="ProtocolId" Table="Protocols" id="ProtocolId" runat="server"/>
									
								<div id="MainOverflow">
                                    <table width="600" style="padding: 10; margin-left: 70px;" id="FieldsHolder">
                                        <tr>
                                            <td style="font-weight: bold; font-size: 14px; color: #333333; border-bottom: solid 1px #999999;">Protocol Information</td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <cic:CaisisTextBox ID="IRBNumber" MaxLength="50" TabIndex="1" FieldLabel="IRB #" Table="Protocols" Field="ProtocolNum"
                                                    Required="true" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <cic:CaisisTextArea ID="ProtocolTitle" MaxLength="1000" TabIndex="2" FieldLabel="Protocol Title" Table="Protocols" Field="ProtocolTitle"
                                                    Required="true" runat="server" style="width: 400px; height: 50px;"/></td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <cic:CaisisTextBox ID="ProtocolAlias" MaxLength="50" TabIndex="3" FieldLabel="Short Description" Table="Protocols"
                                                    Field="ProtocolAlias" runat="server" style="width: 400px;" /></td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <cic:CaisisTextBox ID="ProtocolPI" MaxLength="100" TabIndex="4" FieldLabel="Principal Investigator" Table="Protocols"
                                                    Field="ProtocolPI" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <cic:CaisisComboBox LookupCode="Department" ID="Department" MaxLength="50" TabIndex="5" FieldLabel="Department" Table="Protocols" Field="ProtocolDept"
                                                    runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <cic:CaisisTextArea ID="Notes" MaxLength="1000" TabIndex="6" FieldLabel="Notes" Table="Protocols" Field="ProtocolNotes"
                                                    runat="server" style="width: 400px; height: 50px;" /></td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold; font-size: 14px; color: #333333; border-bottom: solid 1px #999999; padding-top: 20px;">Version Details</td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <cic:CaisisTextBox ID="VersionNumber" MaxLength="50" TabIndex="7" FieldLabel="Version Number" Table="ProtocolMgr_ProtocolVersions" Field="VersionNumber"
                                                    runat="server"  style="width: 60px;"/></td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <cic:CaisisTextBox ID="ApprovalDate" TabIndex="8" FieldLabel="Approval Date" Table="ProtocolMgr_ProtocolVersions" Field="ApprovalDate"
                                                    runat="server" ShowCalendar="true" Required="true" /></td>
                                        </tr>
                                        <tr>
                                            <td height="30">
                                                <cic:CaisisTextArea ID="VersionReason" MaxLength="1000" TabIndex="9" FieldLabel="Version Reason" Table="ProtocolMgr_ProtocolVersions" Field="VersionReason"
                                                    runat="server" style="width: 400px; height: 50px;" /></td>
                                        </tr>

                                        </table></div>
							  </td>
								<td class="ListManBGTableRightSide">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
								<td class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="10" height="5"></td>
								<td class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="20" height="5"></td>
								<td colspan="2" class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="1" height="1"></td>
								<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
							</tr>
						</table>
						
						<table width="600" style="padding: 10; margin-left: 70px;">
                                        <tr>
                                            <td colspan="5" align="center">
                                                <div id="DataEntryButtons">
                                                    <asp:ImageButton ID="NewBtn" OnCommand="NewClick" runat="server" ImageUrl="../../Images/DataEntryButtons/Button_New_Off.gif"
                                                        Height="22px" Enabled="False" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                    <asp:ImageButton ID="EditBtn" AccessKey="E" OnCommand="EditClick" CommandName="Edit"
                                                        Enabled="True" runat="server" ImageUrl="../../Images/DataEntryButtons/Button_Edit_on.gif"
                                                        Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                    <asp:ImageButton ID="SaveBtn" OnCommand="SaveClick" CommandName="Save" runat="server"
                                                        ImageUrl="../../Images/DataEntryButtons/Button_Save_Off.gif" Enabled="False"
                                                        Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                    <asp:ImageButton ID="LockBtn" OnCommand="SaveClick" CommandName="Lock" Enabled="False"
                                                        runat="server" ImageUrl="../../Images/DataEntryButtons/Button_Lock_off.gif" Height="22px"
                                                        Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                    <asp:ImageButton ID="UnlockBtn" OnCommand="SaveClick" CommandName="Unlock" Enabled="False"
                                                        runat="server" ImageUrl="../../Images/DataEntryButtons/Button_Unlock_off.gif"
                                                        Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                    <asp:ImageButton ID="CancelBtn" OnCommand="CancelClick" runat="server" ImageUrl="../../Images/DataEntryButtons/Button_Cancel_Off.gif"
                                                        Enabled="False" Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                    <asp:ImageButton ID="DeleteBtn" OnCommand="DeleteClick" OnClientClick="if(confirmDelete()==false)return false;"
                                                        runat="server" ImageUrl="../../Images/DataEntryButtons/Button_Delete_Off.gif"
                                                        Enabled="False" Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" align="center">
                                                <!-- DATA ENTRY AUDIT LABELS -->
                                                <div id="AuditLabels">
                                                
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                <td class="smallPrint">Entered By:</td>
                                                <td class="smallPrint" style="white-space: nowrap; width: 80%; padding-left: 10px; text-align: left;" ><asp:Label ID="EnteredBy" runat="server" style="margin-right: 10px;" /><asp:Label ID="EnteredTime" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                <td class="smallPrint">Updated By:</td>
                                                <td class="smallPrint" style="white-space: nowrap;padding-left: 10px; text-align: left;" ><asp:Label ID="UpdatedBy" runat="server" style="margin-right: 10px;" /><asp:Label ID="UpdatedTime" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                <td class="smallPrint">Locked By:</td>
                                                <td class="smallPrint" style="white-space: nowrap;padding-left: 10px; text-align: left;"><asp:Label ID="LockedBy" runat="server" style="margin-right: 10px;" /><asp:Label ID="LockedTime" runat="server" /></td>
                                                </tr>
                                                </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
					</td>
				</tr>
			</table>
		</form>
</body>
</html>