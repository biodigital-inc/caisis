<%@ Page Language="c#" Inherits="Caisis.UI.Core.Utilities.AddNewPatients" CodeFile="AddNewPatients.aspx.cs"
    EnableViewState="true" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>

<%@ Register TagPrefix="val" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="val" TagName="ErrorMsg" Src="~/Core//Utilities/ErrorMsg.ascx" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Import Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title></title>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
     <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
    /* <![CDATA[ */
        
    // null unless defined in code behind 
    // This should get assigned a function to execute when new patient in session
    var goToPatient; 
    
    // When user clicks cancel if a goToPatient script was register
    // it will get executed to reflect new patient in session
    // Else it will attemp to hide modal if in one.
    // Returns false to cancel submission of form.
    function onCancelClick(e)
    {
        if(goToPatient) { goToPatient(); return false; } 
        else  if(top.hideModal) { top.hideModal(); return false; }
        else { return true; }
    }

    // when modal closes, load new patient into data entry
    function onModalClose() {
        if(<%= Page.IsPostBack.ToString().ToLower() %>)
        {
            var newURL  ='<%= GetEncryptedPatientUrl() %>';
            if(newURL && newURL!= '')
            {
                window.top.location = newURL;
            }
        }
    }    
   
    /* ]]> */
    </script>
</head>
<body id="addAPatientBody" runat="server" style="background-color: #ffffff; margin: 0px 0px 0px 0px;">
    <form id="dataForm" method="post" runat="server">
        <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="27" align="middle">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" valign="top">
                    <table id="MainTable" width="760" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td colspan="6" class="ListManTitle">
                                Add a New Patient</td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <img src="../../Images/shim.gif" width="10" height="8"></td>
                        </tr>
                        <tr>
                            <td bgcolor="#f1f7fc">
                                <img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
                            <td class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="10" height="5"></td>
                            <td class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="20" height="5"></td>
                            <td class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="420" height="5"></td>
                            <td class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="300" height="5"></td>
                            <td bgcolor="#f1f7fc">
                                <img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
                        </tr>
                        <tr>
                            <td class="ListManBGTableLeftSide">
                                <img src="../../Images/shim.gif" width="1" height="1"></td>
                            <td colspan="4" class="ListManBGTableBody">
                                <img src="../../Images/shim.gif" width="10" height="8"></td>
                            <td class="ListManBGTableRightSide">
                                <img src="../../Images/shim.gif" width="1" height="1"></td>
                        </tr>
                        <tr>
                            <td class="ListManBGTableLeftSide" valign="top">
                                &nbsp;
                                <div id="patientAddedAlertLayer" style="border-right: #000000 1px; border-top: #000000 1px;
                                    z-index: -7; visibility: hidden; border-left: #000000 1px; background-color: #f1f7fc;
                                    border-bottom: #000000 1px; position: absolute;" runat="server">
                                    <table width="730" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="30">
                                                &nbsp;
                                            </td>
                                            <td valign="top">
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <strong>The patient has been added to the database. To add additional information on
                                                    this patient, you may do so at any time in the
                                                    <asp:HyperLink NavigateUrl="#" ID="PatientDataLink" runat="server">Patient Data</asp:HyperLink>
                                                    section.</strong>
                                                <br />
                                                <img src="../../Images/shim.gif" width="1" height="116">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td align="center">
                                                <a href="AddNewPatients.aspx">
                                                    <asp:Image runat="server" ImageUrl="~/Images/AddAnotherPatient.gif" AlternateText="Add Another Patient" ToolTip="Add Another Patient" /> 
                                                    <%--<asp:ImageButton OnCommand="AddAnotherPatient" runat="server" ID="addAnotherPatientButton" ImageUrl="~/Images/AddAnotherPatient.gif"
                                                        BorderWidth="0" AlternateText="Add Another Patient" />--%></a>
                                                <br />
                                                <img src="../../Images/shim.gif" width="1" height="110" align="middle">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                            <td colspan="2" class="ListManBGTableBody">
                                &nbsp;</td>
                            <td class="ListManBGTableBody" colspan="2">
                                <br />
                                <asp:Label ID="UserMessage" runat="server" Text="Please enter all available information for this patient. Fields named in <span class=requiredField>red</span> are required." /></td>
                            <td class="ListManBGTableRightSide">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="ListManBGTableLeftSide">
                                <img src="../../Images/shim.gif" width="1" height="1"></td>
                            <td colspan="4" class="ListManBGTableBody">
                                <img src="../../Images/shim.gif" width="10" height="8"></td>
                            <td class="ListManBGTableRightSide">
                                <img src="../../Images/shim.gif" width="1" height="1"></td>
                        </tr>
                        <tr>
                            <td class="ListManBGTableLeftSide">
                                &nbsp;</td>
                            <td colspan="2" bgcolor="f1f7fc">
                                &nbsp;</td>
                            <td colspan="2" valign="top" height="210" bgcolor="f1f7fc">
                                <div class="PDFormDiv">
                                    <!-- begin patient form -->
                                    <div class="PDFormCol" style="float: left;">
                                        <div class="DataEntryRow">
                                            <cic:CaisisTextBox FieldLabel="First" Table="Patient" Field="PtFirstName" runat="server"
                                                ID="PtFirstName" TabIndex="1" NAME="PtFirstName" />
                                        </div>
                                         <div class="DataEntryRow">
                                            <cic:CaisisTextBox FieldLabel="Middle" Table="Patient" Field="PtMiddleName" runat="server"
                                                ID="PtMiddleName" TabIndex="2" NAME="PtMiddleName" />
                                        </div>
                                        <div class="DataEntryRow">
                                            <cic:CaisisTextBox FieldLabel="Last" Required="true" Table="Patient" Field="PtLastName"
                                                runat="server" ID="PtLastName" name="ptLastName" TabIndex="3" />
                                        </div>
                                        <div class="DataEntryRow">
                                            <cic:CaisisTextBox Table="Patient" Field="PtMrn" Required="true" FieldLabel="MRN"
                                                runat="server" ID="PtMRN" NAME="PtMRN" TabIndex="4" />
                                        </div>
                                         <div class="DataEntryRow">
                                            <cic:CaisisTextBox Table="Patient" Field="PtBirthDateText" Required="false" ShowCalendar="true" CalcDate="true" FieldLabel="DOB"
                                                runat="server" ID="PtBirthDateText" NAME="PtBirthDateText" TabIndex="5" />
                                                 <cic:CaisisHidden Table="Patient" Field="PtBirthDate" Required="false" FieldLabel="DOB"
                                                runat="server" ID="PtBirthDate" NAME="PtBirthDate" TabIndex="" />
                                        </div>
                                          <div class="DataEntryRow">
                                            <cic:CaisisSelect LookupCode="PtGender" Table="Patient" Field="PtGender" Required="false" FieldLabel="Gender"
                                                runat="server" ID="PtGender" NAME="PtGender" TabIndex="5" />
                                        </div>
                                          <div class="DataEntryRow">
                                            <cic:CaisisSelect LookupCode="PtRace" Table="Patient" Field="PtRace" Required="false" FieldLabel="Race"
                                                runat="server" ID="PtRace" NAME="PtRace" TabIndex="6" />
                                        </div>
                                        <div class="DataEntryRow">
                                            <cic:CaisisSelect LookupCode="PtContactStatus" Table="Patient" Field="PtContactStatus" Required="false" FieldLabel="Contact Status"
                                                runat="server" ID="PtContactStatus" NAME="PtContactStatus" TabIndex="6" />
                                        </div>
                                      
                                    </div>
                                </div>
                                <div class="PDFormCol" style="float: right;">
                                    <div class="DataEntryRow">
                                        <cic:CaisisTextBox FieldLabel="Address 1" Table="Patient" Field="PtAddress1" runat="server"
                                            ID="PtAddress1" TabIndex="7" NAME="PtAddress1" />
                                    </div>
                                    <div class="DataEntryRow">
                                        <cic:CaisisTextBox FieldLabel="Address 2" Table="Patient" Field="PtAddress2" runat="server"
                                            ID="PtAddress2" TabIndex="8" NAME="PtAddress2" />
                                    </div>
                                    <div class="DataEntryRow">
                                        <cic:CaisisTextBox Table="Patient" Field="PtCity" FieldLabel="City" runat="server"
                                            ID="PtCity" NAME="PtCity" TabIndex="9" />
                                    </div>
                                    <div class="DataEntryRow">
                                        <cic:CaisisComboBox FieldLabel="State" ID="PtState" Table="Patient" Field="PtState"
                                            LookupCode="State" Style="width: 135" RefBy="PtState" TabIndex="10" runat="server" /></div>
                                    <div class="DataEntryRow">
                                        <cic:CaisisTextBox Table="Patient" Field="PtPostalCode" FieldLabel="Postal Code" runat="server"
                                            ID="PtPostalCode" TabIndex="11" NAME="PtPostalCode" /></div>
                                    <div class="DataEntryRow">
                                        <cic:CaisisComboBox FieldLabel="Country" ID="PtCountry" Table="Patient" Field="PtCountry"
                                            Style="width: 135" LookupCode="Country" TabIndex="12" runat="server" /></div>
                                    
                                      <div class="DataEntryRow">
                                            <cic:CaisisTextArea Table="Patients" Field="PtNotes" FieldLabel="Notes" ID="PtNotes"
                                                MaxLength="253" Columns="16" Rows="3" class="inputFieldFlat" runat="server" NAME="ptNotes"
                                                TabIndex="13" /></div>
                                    <!-- need this vertical space in combination with onblur scroll function above to display country combo box -->
                                    <!-- end form -->
                                </div>
                                <asp:PlaceHolder runat="server" ID="DatasetDimensionsPlaceHolder" Visible="false">
                                    <asp:Label runat="server" Text="Required Patient Attributes" CssClass="requiredField" ID="DatasetDimensionsLabel"></asp:Label>
                                    <asp:CheckBoxList runat="server" ID="DatasetDimensionsRptr" DataTextField="Text"
                                        DataValueField="Value" RepeatColumns="4" RepeatDirection="Horizontal" RepeatLayout="Table">
                                    </asp:CheckBoxList>
                                </asp:PlaceHolder>
                            </td>
                            <td class="ListManBGTableRightSide">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="ListManBGTableLeftSide" height="70">
                                &nbsp;</td>
                            <td colspan="4" class="ListManBGTableBody" align="center" valign="bottom">
                                <asp:Panel runat="server" ID="DataEntryButtons">
                                    <asp:Label ID="PermissionsMsg" runat="server"></asp:Label>
                                    <asp:ImageButton runat="server" ID="cancelBtn" ImageUrl="~/Images/buttonCancel_lowercase.png"
                                        OnClientClick="return onCancelClick(event);" Style="margin-right: 100px;" />
                                    <asp:ImageButton ID="saveBtn" Enabled="false" TabIndex="11" OnClick="AddPatientToDatabase"
                                        runat="server" ImageUrl="~/Images/addThisPatientToTheDatabase_off.gif" Height="22px"
                                        Width="200px" CssClass="PDButtonOff"></asp:ImageButton>
                                   <!-- button to move patients between datasets -->
                                    <asp:ImageButton ID="moveBtn" Enabled="false" Visible="false" TabIndex="12" OnCommand="MovePatientToCurrentDataset" EnableViewState="False"
                                        runat="server" ImageUrl="../../Images/addThisPatientToThisDataset.png" Height="22px" />
                               </asp:Panel>
                                    </td>
                            <td class="ListManBGTableRightSide">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td bgcolor="#f1f7fc">
                                <img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
                            <td class="ListManagerBGTableBottom">
                                <img src="../../Images/shim.gif" width="10" height="5"></td>
                            <td class="ListManagerBGTableBottom">
                                <img src="../../Images/shim.gif" width="20" height="5"></td>
                            <td colspan="2" class="ListManagerBGTableBottom">
                                <img src="../../Images/shim.gif" width="1" height="1"></td>
                            <td bgcolor="#f1f7fc">
                                <img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
