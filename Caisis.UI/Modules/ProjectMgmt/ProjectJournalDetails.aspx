<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectJournalDetails.aspx.cs" Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectJournalDetails" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="Custom" Namespace="Caisis.UI.Core.Classes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Journal Details</title>
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
        function getAllJournals(selectedId)
        {
            var nSize = $('JournalSelect').length;
            var JournalNames = Array(nSize-1);
            var JournalIDs = Array(nSize-1);

            JournalIDs[0] = -1;
            JournalNames[0] = "";

            for(i = 2; i < nSize; i++)
            {
                JournalIDs[i-1] = $('JournalSelect').options[i].value;
                JournalNames[i-1] = $('JournalSelect').options[i].text;
            }
            
            parent.reloadJournalList(JournalIDs, JournalNames, selectedId);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="PanelJournalInfo" runat="server" Width="90%">
            <asp:Label ID="UserMessage" runat="server">To add a new Journal, enter the information below.  To edit an existing Journal, select the Journal above.</asp:Label>
            <cic:CaisisHidden Field="JournalId" Table="ProjectJournal" id="JournalId" runat="server"/>
            <table id="TableJournalInfo" >
                <tr>
                    <td>
                        <asp:DropDownList AutoPostBack="true" ID="JournalSelect" runat="server" OnSelectedIndexChanged="JournalSelect_SelectedIndexChanged" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <cic:CaisisTextBox ID="JournalName" runat="server" FieldLabel="Journal Name" ShowLabel="true" Table="ProjectJournal" Field="JournalName" MaxLength="255" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <cic:CaisisTextBox ID="ShortName" runat="server" FieldLabel="Short Name" ShowLabel="true" Table="ProjectJournal" Field="ShortName" MaxLength="50" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <cic:CaisisTextArea ID="JournalNotes" runat="server" FieldLabel="Notes" ShowLabel="true" Table="ProjectJournal" Field="Notes" MaxLength="1000" />
                    </td>
                </tr>
                <tr>
                    <td>
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
                                Height="22px" Width="61px" CssClass="PDButtonOff"></asp:ImageButton>&nbsp;
                                
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
            </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
