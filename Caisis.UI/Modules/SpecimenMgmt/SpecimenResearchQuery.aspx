<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls"  %>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SpecimenResearchQuery.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.SpecimenResearchQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Specimen Research Query</title>
    
    <meta name="GENERATOR" content="Microsoft Visual Studio 7.0" />
	<meta name="CODE_LANGUAGE" content="C#" />
	<meta name="vs_defaultClientScript" content="JavaScript" />
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
	
	<link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
	
	<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
	<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
	<script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
	
	<script type="text/javascript">
    <!--    
        function isAgeNumber(theid, s)
        {
            obj = document.getElementById(theid);
	        var i;
            for (i = 0; i < s.length; i++){   
                // Check that current character is number.
                var c = s.charAt(i);
                if (((c < "0") || (c > "9"))) 
                {
                    alert('\''+s+'\'  is not a valid age. Age must be a number.');
                    //obj.value = "";
                    //obj.focus();
                    return false;
                }
            }
            // All characters are numbers.
            return true;
        }
    -->
    </script>	
</head>

<body style="margin: 0px;">
    <form id="searchForm" method="post" runat="server" defaultfocus="ageFrom">
        <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f8fafc">
            <tr> 
		        <td height="15" align="center"><img src="../../Images/shim.gif" width="1" height="1"></td>
	        </tr>
    	
	        <tr> 
		        <td align="center"> 
		            <table width="760" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                            <td class="ListManTitle" colspan="6" height="30" valign="bottom" align="left">Breast Specimen Search</td>
                        </tr>

                        <tr> 
                            <td colspan="6"><img src="../../Images/shim.gif" width="10" height="8"></td>
                        </tr>

			            <tr> 
			                <td style="background-color:#F1F7FC;"><img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="10" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="20" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="320" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="400" height="5"></td>
			                <td style="background-color:#F1F7FC;"><img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
			            </tr>
        			    
			            <tr> 
			                <td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			                <td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="8"></td>
			                <td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			            </tr>

			            <tr style="background-color:#F1F7FC;">
			                <td class="ListManBGTableLeftSide" style="width: 6px;">&nbsp;</td>
			                <td colspan="1">&nbsp;</td>
                            <td colspan="3" valign="top">
                                <table>
                                    <tr>
                                        <td style="width:410px; vertical-align:top;">
                                            <div class="DataEntryRow" style="text-align:left;">
                                                <span class="SubFormSectionTitle">Patients</span>
                                                <br />
                                                <div style="padding-left:10px; padding-bottom:15px;">
                                                    Age at diagnosis &nbsp;&nbsp;
                                                    From &nbsp;<cc:CaisisTextBox id="txtAgeFrom" runat="server" tabIndex="1" onblur="isAgeNumber(this.id,this.value)" Width="40" ShowLabel="false" MaxLength="3"></cc:CaisisTextBox>
                                                    &nbsp;&nbsp;
                                                    To &nbsp;<cc:CaisisTextBox id="txtAgeTo" runat="server" tabIndex="2" onblur="isAgeNumber(this.id,this.value)" Width="40" ShowLabel="false" MaxLength="3"></cc:CaisisTextBox>
                                                    <br />
                                                    <asp:label id="validationMessage" runat="server" ForeColor="Red" Visible="false"></asp:label>
                                                </div>
                                                
                                                <span class="SubFormSectionTitle">Diagnosis Pathology</span>
                                                <br />
                                                <div style="padding-left:10px; padding-bottom:10px;">
                                                    <div class="DataEntryRow">
                                                        Primary Historic Diagnosis&nbsp;&nbsp;<cc:CaisisSelect id="ddlPrimaryHistoricDiagnosis" runat="server" tabIndex="5" LookupCode="Specimen_PrimaryHistoricDiagnosis"  Width="175" ShowLabel="False"></cc:CaisisSelect>
                                                    </div>
                                                    <div class="DataEntryRow">
                                                        Histopathological Grade&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cc:CaisisSelect id="ddlHistopathologicalGrade" runat="server" tabIndex="5" LookupCode="Specimen_HistopathologicalGrade"  Width="175" ShowLabel="False"></cc:CaisisSelect>
                                                    </div>
                                                    
                                                    <br />
                                                    
                                                    <div class="DataEntryRow">
                                                        ER &nbsp;<cc:CaisisSelect id="ddlER" runat="server" tabIndex="5" LookupCode="Specimen_ER-PR"  Width="120" ShowLabel="False"></cc:CaisisSelect>
                                                    </div>
                                                    <div class="DataEntryRow">
                                                        PR &nbsp;<cc:CaisisSelect id="ddlPR" runat="server" tabIndex="6" LookupCode="Specimen_ER-PR"  Width="120" ShowLabel="False"></cc:CaisisSelect>
                                                    </div>
                                                    <div class="DataEntryRow">
                                                        HER-2 ICC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cc:CaisisSelect id="ddlHer2ICC" runat="server" tabIndex="7" LookupCode="Specimen_Her2ICC"  Width="120" ShowLabel="False"></cc:CaisisSelect>
                                                    </div>
                                                    <div class="DataEntryRow">
                                                        Node Positive&nbsp;&nbsp;&nbsp;<cc:CaisisSelect id="ddlNodePositive" runat="server" tabIndex="8" LookupCode="Specimen_YesNo" OnDataBinding="SortLookupDescOnDataBind" Width="120" ShowLabel="False"></cc:CaisisSelect>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        
                                        <td style="width:330px; vertical-align:top;">
                                            <div class="DataEntryRow" style="text-align:left;">
                                                <span class="SubFormSectionTitle">Treatment</span>
                                                <br />
                                                <div style="padding-left:10px; padding-bottom:15px;">
                                                    Adjuvent Agent &nbsp;<cc:CaisisSelect id="ddlAdjuventAgent" runat="server" tabIndex="9" LookupCode="Specimen_AdjuventAgent"  Width="140" ShowLabel="False"></cc:CaisisSelect>
                                                </div>
                                                
                                                <span class="SubFormSectionTitle">Outcome</span>
                                                <br />
                                                <div style="padding-left:10px; padding-bottom:15px;">
                                                    Relapse Status (Yes) <cc:CaisisCheckBox id="cbRelapseStatus" runat="server" tabIndex="10" Width="120" ShowLabel="False"></cc:CaisisCheckBox>
                                                </div>
                                            </div>
                                              
                                            <table cellpadding="0" cellspacing="0">
                                                <tr style="text-align:left;">
                                                    <td valign="top">
                                                        <span class="SubFormSectionTitle">Blood Samples</span>
                                                        <br />
                                                        <asp:CheckBoxList runat="server" id="bloodSamplesCheckBoxList" Width="135" CellPadding="1" CellSpacing="2" BorderStyle="Solid" BorderColor="#BBBBBB" BorderWidth="1" Style="margin-left:10px; margin-top:2px;">
                                                            <asp:ListItem Value="Whole Blood"></asp:ListItem>
                                                            <asp:ListItem Value="Serum"></asp:ListItem>
                                                            <asp:ListItem Value="EDTA Plasma"></asp:ListItem>
                                                            <asp:ListItem Value="Buffy Coat"></asp:ListItem>
                                                            <asp:ListItem Value="Guthrie Card"></asp:ListItem>
                                                            <asp:ListItem Value="DNA"></asp:ListItem>
                                                        </asp:CheckBoxList>
                                                    <%--<div style="padding:7px; margin-left:0px; margin-top:2px; text-align:left; border-color:#BBBBBB; border-style:solid; border-width:1px; width:125px; height:120px;">
                                                        <cc:CaisisCheckBox id="bsWholeBlood" runat="server" tabIndex="11" Width="20" ShowLabel="False" CssClass="PDFormBorder"></cc:CaisisCheckBox>
                                                        Whole Blood
                                                        <br />
                                                        <cc:CaisisCheckBox id="bsSerum" runat="server" tabIndex="12" Width="20" ShowLabel="False"></cc:CaisisCheckBox>
                                                        Serum
                                                        <br />
                                                        <cc:CaisisCheckBox id="bsEDTAPlasma" runat="server" tabIndex="13" Width="20" ShowLabel="False"></cc:CaisisCheckBox>
                                                        EDTA Plasma 
                                                        <br />
                                                        <cc:CaisisCheckBox id="bsBuffyCoat" runat="server" tabIndex="14" Width="20" ShowLabel="False"></cc:CaisisCheckBox>
                                                        Buffy Coat 
                                                        <br />
                                                        <cc:CaisisCheckBox id="bsGuthrieCard" runat="server" tabIndex="15" Width="20" ShowLabel="False"></cc:CaisisCheckBox>
                                                        Guthrie Card 
                                                        <br />
                                                        <cc:CaisisCheckBox id="bsDNA" runat="server" tabIndex="16" Width="20" ShowLabel="False"></cc:CaisisCheckBox>
                                                        DNA 
                                                        <br />
                                                    </div>--%>
                                                    </td>
                                                    <td valign="top">
                                                        <span class="SubFormSectionTitle">Tissue Samples</span>
                                                        <br />
                                                        <asp:CheckBoxList runat="server" id="tissueSamplesCheckBoxList" Width="135" CellPadding="1" CellSpacing="2" BorderStyle="Solid" BorderColor="#BBBBBB" BorderWidth="1" Style="margin-left:10px; margin-top:2px;" >
                                                            <asp:ListItem Value="Fresh"></asp:ListItem>
                                                            <asp:ListItem Value="FFPE"></asp:ListItem>
                                                            <asp:ListItem Value="TMA"></asp:ListItem>
                                                         </asp:CheckBoxList>
                                                         
                                                         <div style="margin-left:10px; margin-top:10px;">
                                                             Tissue Type<br />
                                                             <cc:CaisisSelect id="ddlTissueType" runat="server" tabIndex="20" LookupCode="Specimen_TissueType"  Width="140" ShowLabel="False"></cc:CaisisSelect>
                                                         </div>
                                                         <br />
                                                     <%--<div style="padding:7px; margin-left:10px; margin-top:2px; text-align:left; border-color:#BBBBBB; border-style:solid; border-width:1px; width:125px; height:120px;">
                                                            <cc:CaisisCheckBox id="tsFresh" runat="server" tabIndex="17" Width="20" ShowLabel="False" CssClass="PDFormBorder"></cc:CaisisCheckBox>
                                                            Fresh
                                                            <br />
                                                            <cc:CaisisCheckBox id="tsFFPE" runat="server" tabIndex="18" Width="20" ShowLabel="False"></cc:CaisisCheckBox>
                                                            FFPE
                                                            <br />
                                                            <cc:CaisisCheckBox id="tsTMA" runat="server" tabIndex="19" Width="20" ShowLabel="False"></cc:CaisisCheckBox>
                                                            TMA
                                                            <br />
                                                            <br />
                                                            <asp:CheckBoxList runat="server" id="CheckBoxList1" Width="100" CellPadding="0" CellSpacing="0" BackColor="AntiqueWhite" BorderStyle="Dotted" BorderWidth="1" >
                                                                <asp:ListItem Value="Fresh"></asp:ListItem>
                                                                <asp:ListItem Value="FFPE"></asp:ListItem>
                                                                <asp:ListItem Value="TMA"></asp:ListItem>
                                                            </asp:CheckBoxList>
                                                            Tissue Type<br />
                                                            <cc:CaisisSelect id="ddlTissueType" runat="server" tabIndex="20" LookupCode="Specimen_TissueType"  Width="120" ShowLabel="False"></cc:CaisisSelect>
                                                           <br />
                                                    </div>--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
			                <td class="ListManBGTableRightSide" style="width: 6px;">&nbsp;</td>
			            </tr>
			            
			            <tr> 
			                <td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			                <td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="8"></td>
			                <td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			            </tr>
			            
			            <tr style="background-color:#F1F7FC;">
			                <td class="ListManBGTableLeftSide" style="width: 6px;">&nbsp;</td>
			                <td colspan="4" align="center">
			                    <asp:imagebutton id="btnClear" tabIndex="21" runat="server" onClick="btnClear_onClick" ImageUrl="../../images/buttonClear.gif"></asp:imagebutton>
			                    <img src="../../Images/shim.gif" width="20" height="1">
			                    <asp:imagebutton id="btnSearch" tabIndex="22" runat="server" onClick="btnSearch_onClick" ImageUrl="../../images/Search_small.gif"></asp:imagebutton>
			                </td>
			                <td class="ListManBGTableRightSide" style="width: 6px;">&nbsp;</td>
			            </tr>
			            
			            <tr> 
			                <td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			                <td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="7"></td>
			                <td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			            </tr>
			            
			            <tr>
                            <td style="background-color:#F1F7FC; width: 6px;">
                                <img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
                            <td class="ListManagerBGTableBottom">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td class="ListManagerBGTableBottom">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td colspan="2" class="ListManagerBGTableBottom">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td style="background-color:#F1F7FC; width: 6px;">
                                <img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
			            </tr>
		            </table>
		        </td>
	        </tr>
	       
        </table>   
    </form>

</body>
</html>
