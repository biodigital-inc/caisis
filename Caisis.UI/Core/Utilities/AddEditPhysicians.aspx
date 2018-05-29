<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddEditPhysicians.aspx.cs" Inherits="Core_Utilities_AddEditPhysicians" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Add/Edit Physician</title>
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        /* <![CDATA[ */
        
        function ClosePhysicianPopup() {
            // close from popup
            if (window.opener != null && doRefreshOnUpdate(window.opener)) {
                window.close();
            }
            // close from modal
            else if (top.getModalCallingWindow) {
                var modalCaller = top.getModalCallingWindow();
                if (modalCaller && doRefreshOnUpdate(modalCaller)) {
                    top.hideModal();
                }
            }
        }

        // for special pages, refresh on updates
        function doRefreshOnUpdate(win) {
            var doRefresh = false;
            // test special locations
            var specialPaths = ['PatientPhysicians', 'Eforms', 'FollowUp'];
            for (var i = 0; i < specialPaths.length; i++) {
                if (win.location.href.indexOf(specialPaths[i]) > -1) {
                    doRefresh = true;
                    win.location = win.location;
                    break;
                }
            }
            return doRefresh;
        }
        
        /* ]]> */
    </script>
	
	<style type="text/css">
	    .pdFormFieldLabel
	    {
	        width: 70px;
	    }
	    .pdFormFieldLabelRequired
	    {
	        width: 70px;
	    }
	    .AjaxCombo
        {
            margin-left: 70px;
        }

        .AjaxCombo input
        {
            width: 110px;
        }
	</style>
	
</head>
<body style="background-color: #ffffff; margin: 0px 0px 0px 0px;">
    <form id="dataForm" method="post" runat="server">
			<table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" >
				<tr>
					<td height="27" align="center">&nbsp;</td>
				</tr>
				<tr>
					<td align="center" valign="top">
					</td>
					
					<td align="center">
						<table width="760" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td  colspan="6" class="ListManTitle" align="left">Add / Edit Physician:&nbsp;&nbsp; <asp:DropDownList ID="PhysiciansDropDown" OnSelectedIndexChanged="OnDropDownChange" AutoPostBack=true runat="server"></asp:DropDownList></td>
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
								<td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
								<td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="8">	</td>
								<td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
							</tr>
							<tr>
								<td class="ListManBGTableLeftSide">&nbsp;</td>
								<td colspan="2" class="ListManBGTableBody">&nbsp;</td>
								<td class="ListManBGTableBody" align="left" colspan="2" style="padding-bottom: 20px; height: 30px;">
								    <asp:Label ID="UserMessage" runat="server">To add a new physician, enter his or her information below.  To edit an existing physician, select the physician above.<br/>Fields named in <span class="requiredField">red</span> are required.</asp:Label></td>
								<td class="ListManBGTableRightSide">&nbsp;</td>
							</tr>
							<tr>
								<td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
								<td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="8"></td>
								<td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
							</tr>
							<tr>
								<td class="ListManBGTableLeftSide">&nbsp;</td>
								<td colspan="2" class="ListManBGTableBody">&nbsp;</td>
								<td colspan="2" align="left" valign="top" class="ListManBGTableBody" height="295">
									<cic:CaisisHidden Field="PhysicianId" Table="Physician" id="PhysicianId" runat="server"/>
									<table width="750" cellpadding="0" cellspacing="0" border="0">
									    <tr>
								          <td width="240" height="30" nowrap><cic:CaisisComboBox TabIndex=1   FieldLabel="Specialty"  TABLE="Physicians" FIELD="PhSpecialty" LookupCode="PhSpecialty" runat="server" id="PtFirstName" /></td>
									        
									        <td nowrap width="240"><cic:CaisisTextBox TabIndex=8   FieldLabel="Address 1"  TABLE="Physicians" FIELD="PhAddress1" runat="server" id="PhAddress1" /></td>
									        
									        <td width="270" nowrap><cic:CaisisTextBox TabIndex=13    FieldLabel="Work Phone" TABLE="Physicians" FIELD="PhWorkPhone" runat="server" id="PhWorkPhone" /></td>           
									    </tr>
									     <tr>
								           <td height="30"><cic:CaisisSelect TabIndex=2    FieldLabel="Level"  TABLE="Physicians" FIELD="PhLevel" LookupCode="PhysicianLevel" runat="server" id="PhLevel" /></td>
									        
									         <td><cic:CaisisTextBox TabIndex=9   FieldLabel="Adddress 2"  TABLE="Physicians" FIELD="PhAddress2" runat="server" id="PhAddress2" /></td>
									        
									        <td><cic:CaisisTextBox TabIndex=14   FieldLabel="Fax" TABLE="Physicians" FIELD="PhFax" runat="server" id="PhFax" /></td>
									        
									    </tr>
									     <tr>
								           <td height="30"><cic:CaisisSelect TabIndex=3   FieldLabel="Title"  TABLE="Physicians" FIELD="PhTitle" LookupCode="Title" runat="server" id="PhTitle" /></td>
									        
									         <td><cic:CaisisTextBox TabIndex=10   FieldLabel="City"  TABLE="Physicians" FIELD="PhCity" runat="server" id="PhCity" /></td>
									        
									        <td><cic:CaisisTextBox TabIndex=15   FieldLabel="Email" TABLE="Physicians" FIELD="PhEmail" runat="server" id="PhEmail" /></td>
									    </tr>
									     <tr>
								           <td height="30" nowrap><cic:CaisisTextBox TabIndex=4  FieldLabel="First"  TABLE="Physicians" FIELD="PhFirstName" runat="server" id="PhFirstName" /></td>
									        
									         <td nowrap><cic:CaisisComboBox TabIndex=11   FieldLabel="State"  TABLE="Physicians" FIELD="PhState" LookupCode="State" runat="server" id="PhState" /></td>
									        
									        <td nowrap><cic:CaisisComboBox TabIndex=16   FieldLabel="Institution" TABLE="Physicians" FIELD="PhInstitution" LookupCode="Institution" runat="server" id="PhInstitution" /></td>
									    </tr>
									     <tr>
								           <td height="30"><cic:CaisisTextBox TabIndex=5   FieldLabel="Middle"  TABLE="Physicians" FIELD="PhMiddleName" runat="server" id="PhMiddleName" /></td>
									        
									        <td><cic:CaisisTextBox TabIndex=12   FieldLabel="Postal Code"  TABLE="Physicians" FIELD="PhPostalCode" runat="server" id="PhPostalCode" /></td>
									        
									        <td><cic:CaisisTextBox TabIndex=17   FieldLabel="Do Not Contact" TABLE="Physicians" FIELD="PhDoNotContact" runat="server" id="PhDoNotContact" /></td>
									    </tr>
									     <tr>
								           <td height="30"><cic:CaisisTextBox TabIndex=6   FieldLabel="Last"  TABLE="Physicians" FIELD="PhLastName" Required=true runat="server" id="PhLastName" /></td>
									        
									        <td><cic:CaisisComboBox TabIndex=13   FieldLabel="Country"   TABLE="Physicians" LookupCode="Country" FIELD="PhCountry" runat="server" id="PhCountry" /></td>
									        
									        <td rowspan="2"><cic:CaisisTextArea TabIndex=18   FieldLabel="Additional Notes" TABLE="Physicians" FIELD="PhNotes" runat="server" id="PhNotes" /></td>
									      
									    </tr>
									     <tr>
								           <td height="30"><cic:CaisisTextBox TabIndex=7   FieldLabel="Suffix"  TABLE="Physicians" FIELD="PhSuffix" runat="server" id="PhSuffix" /></td>
									        
									        
									        
									       
									    </tr>
									   
									    <tr>
									        <td colspan="3" align="center" style="padding-top: 28px;">
									            <div id="DataEntryButtons">
									                    
                                                      <asp:ImageButton ID="NewBtn" OnCommand="NewClick" runat="server" 
                                                        ImageUrl="../../Images/DataEntryButtons/Button_New_Off.gif" Height="22px"
                                                        Enabled="False"
                                                        Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                        
                                                     <asp:ImageButton ID="EditBtn" AccessKey="E" OnCommand="EditClick" CommandName="Edit"
                                                        Enabled="True" runat="server" ImageUrl="../../Images/DataEntryButtons/Button_Edit_on.gif"
                                                        Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                  
                                                    <asp:ImageButton ID="SaveBtn" OnCommand="SaveClick" CommandName="Save" runat="server" 
                                                        ImageUrl="../../Images/DataEntryButtons/Button_Save_Off.gif"
                                                        Enabled="False"
                                                        Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                        
                                                     <asp:ImageButton ID="LockBtn" OnCommand="SaveClick" CommandName="Lock"
                                                        Enabled="False" runat="server" 
                                                        ImageUrl="../../Images/DataEntryButtons/Button_Lock_off.gif"
                                                        Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                        
                                                    <asp:ImageButton ID="UnlockBtn" OnCommand="SaveClick" CommandName="Unlock"
                                                        Enabled="False" runat="server" 
                                                        ImageUrl="../../Images/DataEntryButtons/Button_Unlock_off.gif"
                                                        Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                        
                                                    <asp:ImageButton ID="CancelBtn" OnCommand="CancelClick" runat="server" 
                                                        ImageUrl="../../Images/DataEntryButtons/Button_Cancel_Off.gif"
                                                        Enabled="False"
                                                        Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                        
                                                    <asp:ImageButton ID="DeleteBtn" OnCommand="DeleteClick" OnClientClick="if(confirmDelete()==false)return false;" runat="server" 
                                                        ImageUrl="../../Images/DataEntryButtons/Button_Delete_Off.gif"
                                                        Enabled="False"
                                                        Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>
                                                </div>
									        </td>
									    </tr>
									    <tr>
									        <td colspan="3" align="center">
                                               <!-- DATA ENTRY AUDIT LABELS -->
                                                <div id="AuditLabels" >
                                                
                                                <table cellpadding="0" cellspacing="0" border="0" style="margin: auto;">
                                                <tr>
                                                <td class="smallPrint" style="white-space: nowrap;">Entered By:</td>
                                                <td class="smallPrint" style="white-space: nowrap; width: 80%; padding-left: 10px; text-align: left;" ><asp:Label ID="EnteredBy" runat="server" style="margin-right: 10px;" /><asp:Label ID="EnteredTime" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                <td class="smallPrint" style="white-space: nowrap;">Updated By:</td>
                                                <td class="smallPrint" style="white-space: nowrap;padding-left: 10px; text-align: left;" ><asp:Label ID="UpdatedBy" runat="server" style="margin-right: 10px;" /><asp:Label ID="UpdatedTime" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                <td class="smallPrint" style="white-space: nowrap;">Locked By:</td>
                                                <td class="smallPrint" style="white-space: nowrap;padding-left: 10px; text-align: left;"><asp:Label ID="LockedBy" runat="server" style="margin-right: 10px;" /><asp:Label ID="LockedTime" runat="server" /></td>
                                                </tr>
                                                </table>
                                                </div>
									        </td>
									    </tr>
									        
								  </table>
									
								</td>
								<td class="ListManBGTableRightSide">&nbsp;</td>
							</tr>
							<tr>
								<td class="ListManBGTableLeftSide">&nbsp;</td>
								<td colspan="4" class="ListManBGTableBody" align="center" valign="bottom">
									
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
					</td>
				</tr>
			</table>
		</form>
</body>
</html>
