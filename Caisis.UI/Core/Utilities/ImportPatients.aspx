<%@ Page Language="c#" Inherits="Caisis.UI.Core.Utilities.ImportPatients" CodeFile="ImportPatients.aspx.cs" EnableViewState="true"
    CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>

<%@ Register TagPrefix="val" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="val" TagName="ErrorMsg" Src="../Utilities/ErrorMsg.ascx" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Import Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title></title>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
</head>
<body id="addAPatientBody" runat="server" bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="dataForm" method="post" runat="server">
        <table align="center" width="800" height="80%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f8fafc">
            <tr>
                <td height="25">&nbsp;</td>
            </tr>
            <tr>
                <td height="25" class="ListManTitle">Import Patients </td>
            </tr>
            <tr>
                <td align="center" valign="top">
                    
                    <table style="" width="760" border="0" cellspacing="0" cellpadding="0">
                       
                        
                        <tr>
                            <td><img src="../../Images/shim.gif" width="10" height="8"></td>
                        </tr>
                     
                        <tr>
                            <td style="padding-left:15px" valign="top">
                                 <strong style="color:#8d2a2c">
                                    <asp:Label ID="UserMessage" runat="server" Text="To import a patient, please choose a site and MRN." />
                                </strong>
                            </td>
                        </tr>
                        
                        <!-- Section Displayed After Patient Added -->
                        <tr>
                            <td valign="top">
                                <div id="patientAddedAlertLayer" style="z-index: -7; visibility: hidden; background-color: #f1f7fc; position: absolute;" runat="server">
                                    <table style="border: 1px solid #c8c8c8; background-color:#f1f7fc" height="400" width="730" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="30">
                                                &nbsp;
                                            </td>
                                            <td valign="top">
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <strong>
                                                    <asp:Literal ID="PatientAddedMsg" runat=server></asp:Literal> 
                                                    To add additional information on this patient, you may do so at any time in the
                                                    <asp:HyperLink NavigateUrl="#" ID="PatientDataLink" runat="server">Patient Data Section</asp:HyperLink>
                                                </strong>
                                                <br />
                                                <img src="../../Images/shim.gif" width="1" height="116">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="center">
                                                <a href="AddNewPatients.aspx">
                                                    <asp:ImageButton OnCommand="AddAnotherPatient" runat="server" ID="addAnotherPatientButton" ImageUrl="../../Images/AddAnotherPatient.gif"
                                                        BorderWidth="0" AlternateText="Add Another Patient" /></a>
                                                <br />
                                                <img src="../../Images/shim.gif" width="1" height="90" align="middle">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                           
                    
                        <!-- IMPORT BY MRN -->
                         <tr>
                            <td  valign="top" align="center">
                                <div id="importByMRNLayer" runat="server">
                                    <table style="border: 1px solid #c8c8c8; background-color:#f1f7fc" width="730" height="400" border="0" cellspacing="0" cellpadding="0">
                                        
                                        <tr>
                                            <td width="30">   
                                                <img src="../../Images/shim.gif" width="1" height="50">
                                            </td>
                                            <td align=center nowrap> 
                                            <br />
                                            <br />                        
                                                <span style="padding-left:10;">Site: <asp:DropDownList TabIndex="1" ID="Sites" runat=server>
                                                    <asp:ListItem Value="RVH">RVH</asp:ListItem>
                                                    <asp:ListItem Value="MGH">MGH</asp:ListItem>
                                                    <asp:ListItem Value="MCH">MCH</asp:ListItem> 
                                                    </asp:DropDownList></span>
                                                <span style="padding-left:30;">MRN: <cic:CaisisTextBox TabIndex="2" ID="SiteMRN" ShowLabel="false" runat=server ShowNumberPad="true"/></span>
                                                <br />
                                                <br />
                                                <asp:ImageButton TabIndex="3" OnCommand="RetrievePatientFromExternalSource" ImageUrl="~/Images/ButtonFindPatient.gif" ID="ImportPatientBtn" runat=server />
                                         
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="center">
                                                <!-- this shim controls the covering of the other interface elements; not not adjust -->
                                                <img src="../../Images/shim.gif" width="1" height="215" align="middle">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <!--- END Import Code -->
                        
                        <!--  -->
                        
                        <!-- Show Patient Fields -->
                        <tr>
                            <td valign="top">
                                <div id="addPatientLayer"  style="z-index: -7; visibility: hidden;  position: absolute;" runat="server">
                                            <table style="border: 1px solid #c8c8c8; background-color:#f1f7fc;" width="730" cellpadding="5" cellspacing="5" align="center">
                                                <tr>
                                                
                                                    <td width="200">
                                                         <!-- begin patient form -->
                                                   
                                                        <div class="DataEntryRow">
                                                            
                                                            First: <asp:Label ID="lblPtFirstName" runat=server/><asp:HiddenField runat="server" ID="PtFirstName" />
                                                        </div>
                                                        <div class="DataEntryRow">
                                                            Last: <strong><asp:Label ID="lblPtLastName" runat=server/></strong><asp:HiddenField runat="server" ID="PtLastName" />
                                                        </div>
                                                        <div class="DataEntryRow">
                                                            Gender: <asp:Label ID="lblPtGender" runat=server/><asp:HiddenField runat="server" ID="PtGender"/>  
                                                        </div> 
                                                          <div class="DataEntryRow">
                                                          Date of Birth: <asp:Label ID="lblPtBirthDateText" runat=server/>
                                                          <asp:HiddenField runat="server" ID="PtBirthDateText"  />
                                                          <asp:HiddenField runat="server" ID="PtBirthDate"  />
                                                        </div>
                                                         <div class="DataEntryRow">
                                                          Language: <asp:Label ID="lblPtLanguage" runat=server/><asp:HiddenField runat="server" ID="PtLanguage"/>
                                                        </div>
                                                        <div class="DataEntryRow">
                                                          Phone: <asp:Label ID="lblPtContactPhone" runat=server/><asp:HiddenField runat="server" ID="PtContactPhone" />
                                                       </div>
                                                    </td>
                                               
                                                    <td width="200">     
                                                        <div class="DataEntryRow">
                                                            Address 1: <asp:Label ID="lblPtAddress1" runat=server/><asp:HiddenField  runat="server" ID="PtAddress1"  />
                                                        </div>
                                                        <div class="DataEntryRow">
                                                             Address 2: <asp:Label ID="lblPtAddress2" runat=server/><asp:HiddenField  runat="server" ID="PtAddress2"  />
                                                        </div>
                                                        <div class="DataEntryRow">
                                                             City: <asp:Label ID="lblPtCity" runat=server/><asp:HiddenField runat="server" ID="PtCity"  />
                                                        </div>
                                                        <div class="DataEntryRow">
                                                            State: <asp:Label ID="lblPtState" runat=server/><asp:HiddenField ID="PtState" runat="server" /></div>
                                                        <div class="DataEntryRow">
                                                            Postal Code: <asp:Label ID="lblPtPostalCode" runat=server/><asp:HiddenField  runat="server" ID="PtPostalCode" /></div>
                                                        <div class="DataEntryRow">
                                                            Country: <asp:Label ID="lblPtCountry" runat=server/><asp:HiddenField ID="PtCountry" runat="server" /></div>
                                                        
                                                    </td>
                                                    
                                                    <td width="200" valign="top">
                                                              <strong style="padding-left:20px">Identifiers</strong> <asp:Label runat="server" ID="Identifiers" />
                                                                    <div class="DataEntryRow" style="padding-left:30px">
                                                                        <%= IDTYPE_RVHMRN %>: <asp:Label ID="RVH_MRN" runat=server/></asp:Label><asp:HiddenField ID="hRVH_MRN" runat=server /><asp:HiddenField ID="rvhExists" runat=server /><br />
                                                                        <%= IDTYPE_MCHMRN %>: <asp:Label ID="MCH_MRN" runat=server/></asp:Label><asp:HiddenField ID="hMCH_MRN" runat=server /><asp:HiddenField ID="mchExists" runat=server /><br />
                                                                        <%= IDTYPE_MGHMRN %>: <asp:Label ID="MGH_MRN" runat=server/><asp:HiddenField ID="hMGH_MRN" runat=server /><asp:HiddenField ID="mghExists" runat=server /><br />
                                                                        <%= IDTYPE_HEALTHINSNUM %>: <asp:Label ID="Health_Ins_Num" runat=server/><asp:HiddenField ID="hHealth_Ins_Num" runat=server /><asp:HiddenField ID="healthInsNumExists" runat=server /><br />
                                                                    </div>
                                                       
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td align="right"> Additional Notes:</td>
                                                    <td colspan="2" style="vertical-align:top; padding-left:0px;">
                                                   
                                                                <cic:CaisisTextArea Table="Patients" Field="PtNotes" ShowLabel=false ID="PtNotes"
                                                                    MaxLength="253"  Columns="24" Rows="1"  runat="server" NAME="ptNotes"
                                                                    TabIndex="1" />
                                                    </td>
                                                </tr>
                                               <tr>
                                                    <td colspan="3" align="center">
                                                        <br />
                                                        <asp:Label ID="PermissionsMsg" runat="server"></asp:Label>
                                                        <asp:ImageButton ID="saveBtn" Enabled="false" TabIndex="11" OnCommand="AddPatientToDatabase" EnableViewState="False" runat="server" ImageUrl="../../Images/addThisPatientToTheDatabase_off.gif" CssClass="PDButtonOff"></asp:ImageButton>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:ImageButton runat="server" ID="cancelBtn" ImageUrl="../../Images/CancelOnWhite.gif" Height="22px" OnClientClick="top.hideModal();"/>
                                                    </td>
                                                </tr> 
                                            </table>     
                                        </div>
                            </td>
                        </tr>
                                                 
                        <!-- buttons -->
                        
                       
                    </table>
                 </td>
            </tr>
        </table>
    </form>
</body>
</html>
