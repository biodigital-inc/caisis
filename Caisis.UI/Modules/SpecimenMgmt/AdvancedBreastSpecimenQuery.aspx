<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls"  %>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdvancedBreastSpecimenQuery.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.AdvancedBreastSpecimenQuery" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Advanced Breast Specimen Query</title>
    
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
	<style type="text/css">
	.WideLabel
	{
	    width: 135px;
	    display: block;
	    float: left;
	    text-align: right;
	}
	.DataEntryRow select
    {
        width: 59px;
    }
    div.CheckBoxBoxGroupBox
    {
        border-top:solid 1px #dddddd; 
        border-left:solid 1px #dddddd; 
        border-right:solid 1px #cccccc; 
        border-bottom:solid 1px #cccccc; 
        
        padding-bottom:10px;
        margin-top:1px;
        margin-right:5px;
        margin-left:10px;
        margin-bottom:5px;
        
        /*background-color: #FEFEFE;*/
    }
    div.CheckBoxGroupBoxTitle
    {
        /*background-color: #cccccc;*/
        padding-top:2px;
        padding-left:7px;
    }
    .SubFormSectionTitleWhite
    {
        color: #333333;
        font-size: 11px;
        font-weight: bold;
        padding-left: 10px;
    }

	</style>
	<script type="text/javascript">    
        function isAgeNumber(theid, s)
        {
            obj = document.getElementById(theid);
	        var i;
            for (i = 0; i < s.length; i++)
            {   
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
        function closeLayer()
        {
            parent.hideSpecimenInfo();
        }
                 
        function checkSubType(cbControl, cbListId)
        {
            var chkState=cbControl.checked;	

            if (chkState == false) //uncheck all subtypes for this type
            {
                var cbl = document.getElementById(cbListId);
                var checkboxes = cbl.getElementsByTagName('input');
                
                for(i=0;i< checkboxes.length;i++)								
                {				
                    e=checkboxes[i];									
                    if(e.disabled==false)
                    {   
                        e.checked=chkState;	
                    }
                }
            }
        }

        function checkType(typeId)
        {   
            document.getElementById(typeId).checked = true;
        }
    </script>	
</head>

<body style="margin: 0px;">
    <form id="searchForm" method="post" runat="server" defaultfocus="ageFrom">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color:#f8fafc; padding-top:10px;">
	        <tr> 
		        <td align="center"> 
		            <table width="760" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                            <td class="ListManTitle" colspan="6" height="25" valign="bottom" align="left">Breast Specimen Search (in development)</td>
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
                                        <td style="width:50%; vertical-align:top;">
                                            <div class="DataEntryRow" style="text-align:left;">
                                                <span class="SubFormSectionTitle">Patients</span>
                                                <br />
                                                <div style="padding-left:10px; padding-bottom:10px;">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Age at diagnosis&nbsp;&nbsp
                                                    From &nbsp;<cc:CaisisTextBox id="txtAgeFrom" runat="server" tabIndex="1" onblur="isAgeNumber(this.id,this.value)" Width="50" ShowLabel="false" MaxLength="3"></cc:CaisisTextBox>
                                                    &nbsp;&nbsp;&nbsp;
                                                    To &nbsp;<cc:CaisisTextBox id="txtAgeTo" runat="server" tabIndex="2" onblur="isAgeNumber(this.id,this.value)" Width="50" ShowLabel="false" MaxLength="3"></cc:CaisisTextBox>
                                                    <br />
                                                    <asp:label id="validationMessage" runat="server" ForeColor="Red" Visible="false"></asp:label>
                                                </div>
                                                
                                                <span class="SubFormSectionTitle">Diagnosis Pathology</span>
                                                <br />
                                                <div style="padding-left:10px; padding-bottom:10px;">
                                                    <div class="DataEntryRow">
                                                        <cc:CaisisSelect LabelClass="WideLabel" FieldLabel="Histopathological Diagnosis" id="ddlPrimaryHistoricDiagnosis" runat="server" tabIndex="5" LookupCode="Specimen_PrimaryHistoricDiagnosis"  Width="180" ShowLabel="True"></cc:CaisisSelect>
                                                    </div>
                                                    <div class="DataEntryRow">
                                                        <cc:CaisisSelect LabelClass="WideLabel"  FieldLabel="Histopathological Grade" id="ddlHistopathologicalGrade" runat="server" tabIndex="5" LookupCode="Specimen_HistopathologicalGrade"  Width="180" ShowLabel="True"></cc:CaisisSelect>
                                                    </div>
                                                </div>
                                                    
                                                <span class="SubFormSectionTitle">Receptor Status</span>
                                                <br />
                                                <div style="padding-left:10px; padding-bottom:10px;">
                                                    <div class="DataEntryRow">
                                                        <cc:CaisisSelect LabelClass="WideLabel" FieldLabel="ER&nbsp;" id="ddlER" runat="server" tabIndex="5" LookupCode="Specimen_ER-PR"  Width="180" ShowLabel="True"></cc:CaisisSelect>
                                                    </div>
                                                    <div class="DataEntryRow">
                                                        <cc:CaisisSelect LabelClass="WideLabel" FieldLabel="PR&nbsp;" id="ddlPR" runat="server" tabIndex="6" LookupCode="Specimen_ER-PR"  Width="180" ShowLabel="True"></cc:CaisisSelect>
                                                    </div>
                                                    <div class="DataEntryRow">
                                                        <cc:CaisisSelect LabelClass="WideLabel" FieldLabel="HER-2 ICC&nbsp;" id="ddlHer2ICC" runat="server" tabIndex="7" LookupCode="Specimen_Her2ICC"  Width="180" ShowLabel="True"></cc:CaisisSelect>
                                                    </div>
                                                    <div class="DataEntryRow">
                                                       <cc:CaisisSelect  LabelClass="WideLabel" FieldLabel=" Node Positive&nbsp;" id="ddlNodePositive" runat="server" tabIndex="8" LookupCode="Specimen_YesNo" OnDataBinding="SortLookupDescOnDataBind" Width="180" ShowLabel="True"></cc:CaisisSelect>
                                                    </div>
                                                </div>
                                                
                                                <span class="SubFormSectionTitle">Treatment</span>
                                                <br />
                                                <div style="padding-left:10px; padding-bottom:10px;">
                                                    <cc:CaisisSelect LabelClass="WideLabel" FieldLabel="Adjuvent Agent" id="ddlAdjuventAgent" runat="server" tabIndex="9" LookupCode="Specimen_AdjuventAgent"  Width="180" ShowLabel="True"></cc:CaisisSelect>
                                                </div>
                                            </div>
                                        </td>
                                        
                                        <td style="width:45%; vertical-align:top; text-align:left;">
                                            <div class="DataEntryRow">
                                                <span class="SubFormSectionTitle">Outcome</span>
                                                <br />
                                                <div style="padding-left:35px; padding-bottom:3px;">
                                                    Relapse Status (Yes) <cc:CaisisCheckBox id="cbRelapseStatus" runat="server" tabIndex="10" Width="120" ShowLabel="False"></cc:CaisisCheckBox>
                                                </div>
                                            </div>
                                            
                                            <table cellpadding="0" cellspacing="0" width="330">
                                                <tr>
                                                    <td colspan="2">
                                                        <span class="SubFormSectionTitle">Specimens</span>
                                                    </td>
                                                </tr>
                                                <tr style="text-align:left;">
                                                    <td valign="top">
                                                        <div>
                                                             <div class="CheckBoxGroupBoxTitle">
                                                                <input onclick="checkSubType(this, 'BloodSamplesCheckBoxList');" type="checkbox" checked="checked" value="Blood" id="cbBlood" runat="server" tabindex="11" />
                                                                <span style="padding-left: 2px;">Blood Samples</span>
                                                             </div>
                                                            <div class="CheckBoxBoxGroupBox">
                                                                <asp:CheckBoxList ID="BloodSamplesCheckBoxList" runat="server" DataSourceID="BloodSubTypeDataSource" DataTextField="LkpCode" DataValueField="LkpCode" TabIndex="12" Width="125"
                                                                    CellPadding="1" CellSpacing="2" Style="margin-left: 10px; margin-top: 2px;">
                                                                </asp:CheckBoxList>
                                                            </div>
                                                            <!-- DataSource for Breast Blood SubType LookupCodes -->
                                                            <asp:ObjectDataSource runat="server" ID="BloodSubTypeDataSource" TypeName="Caisis.UI.Core.Classes.CacheManager"
                                                                SelectMethod="GetLookupCodeList">
                                                                <SelectParameters>
                                                                    <asp:Parameter Name="key" Type="string" DefaultValue="Specimen_SubType_BreastBlood" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                        </div>
                                                    </td>
                                                    <td valign="top">
                                                        <div>
                                                            <div class="CheckBoxGroupBoxTitle">
                                                                <input onclick="checkSubType(this, 'TissueSamplesCheckBoxList');"  type="checkbox" checked="checked" value="Tissue" id="cbTissue" runat="server" tabindex="13" />
                                                                <span style="padding-left: 2px;">Tissue Samples</span>
                                                            </div>
                                                            <div class="CheckBoxBoxGroupBox">
                                                                <asp:CheckBoxList ID="TissueSamplesCheckBoxList" runat="server" DataSourceID="TissueSubTypeDataSource" DataTextField="LkpCode" DataValueField="LkpCode" TabIndex="14" Width="125"
                                                                    CellPadding="1" CellSpacing="2" Style="margin-left: 10px; margin-top: 2px;">
                                                                </asp:CheckBoxList> 
                                                            </div>
                                                            <!-- DataSource for Breast Tissue SubType LookupCodes -->
                                                            <asp:ObjectDataSource runat="server" ID="TissueSubTypeDataSource" TypeName="Caisis.UI.Core.Classes.CacheManager"
                                                                SelectMethod="GetLookupCodeList">
                                                                <SelectParameters>
                                                                    <asp:Parameter Name="key" Type="string" DefaultValue="Specimen_SubType_BreastTissue" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div class="DataEntryRow">
                                                <div style="padding-left:10px;">
                                                    <cc:CaisisSelect LabelClass="WideLabel" FieldLabel="Preservation Type" id="ddlPreservationType" runat="server" TabIndex="15" LookupCode="Specimen_TissueType" Width="180" ShowLabel="True" />
                                                </div>
                                            </div>
                                            <div class="DataEntryRow">
                                                <div style="padding-left:40px;">
                                                    Show Available Only<cc:CaisisCheckBox id="showAvailableOnly" runat="server" tabIndex="16" Width="120" ShowLabel="False" Checked="true"></cc:CaisisCheckBox>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
			                <td class="ListManBGTableRightSide" style="width: 6px;">&nbsp;</td>
			            </tr>
			            
			            <tr style="background-color:#F1F7FC;">
			                <td class="ListManBGTableLeftSide" style="width: 6px;">&nbsp;</td>
			                <td colspan="4" align="center">
			                    <img src="../../images/buttonClear.gif" onclick="clearInputFields();" tabIndex="17" style="vertical-align:bottom; cursor:pointer; margin-right:25px;" 
			                        alt="Clear Fields" title="Clear Fields" />
			                    <!-- spacing between is given by first button's right margin -->
			                    <asp:imagebutton id="btnSearch" tabIndex="18" runat="server" onClick="btnSearch_onClick" ImageUrl="../../images/Search_small.gif" 
			                         tooltip="Submit Search">
			                    </asp:imagebutton>
			                </td>
			                <td class="ListManBGTableRightSide" style="width: 6px;">&nbsp;</td>
			            </tr>
			            
			            <tr> 
			                <td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			                <td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="10"></td>
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
