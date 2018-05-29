<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls"  %>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdvancedProstateSpecimenQuery.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.AdvancedProstateSpecimenQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Advanced Prostate Specimen Query</title>
    
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
	<script src="../../ClientScripts/EFormScripts.js" type="text/javascript"></script>	
	
		<style type="text/css">
    div.CheckBoxBoxGroupBox
    {
        border-top:solid 1px #dddddd; 
        border-left:solid 1px #dddddd; 
        border-right:solid 1px #cccccc; 
        border-bottom:solid 1px #cccccc;
        
        width: 110px;
        height: 30px;
        padding-bottom:5px;
        margin-right:5px;
        margin-bottom:0px;
    }
    
    div.CheckBoxGroupBoxTitle
    {
        padding-top:2px;
        padding-bottom:2px;
        color: #333333;
        font-size: 11px;
    }
    div.inputRow
    {
        margin-left:10px;
        margin-bottom:5px;
    }
    .label
    {
        text-align:right; 
        vertical-align:top;
        padding-right:2px;
        padding-top:5px;
        width:200px;
        color: #000000;
    }
    .blueSubTitle
    {
        color: #3D556D;
        font-weight: bold;
    }
	.redFont
	{
	    color: #ff3366;
	}
	td.leftLabel
	{
	    text-align: right;
	    width: 110px;
	    vertical-align:middle;
	}
	</style>

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
                            <td class="ListManTitle" colspan="6" height="30" valign="bottom" align="left">Prostate Specimen Search</td>
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
                                    <tr >
                                        <td colspan="2" align="left" ><span class="SubFormSectionTitle">Search Specimens by: </span></td>
                                        <td colspan="1" align="left" >
                                            <cc:CaisisRadioButtonList ID="ProsSpecQueryTypeRBL" runat="server" 
                                                RepeatDirection="Horizontal" 
                                                RepeatLayout="Table" 
                                                onselectedindexchanged="ProsSpecQueryTypeRBL_SelectedIndexChanged">
                                                <asp:ListItem Value="Histology" Text="Histology" Selected="True" />
                                                <asp:ListItem Value="Reference Number" Text="Reference Number" />
                                            </cc:CaisisRadioButtonList>
                                            <asp:RequiredFieldValidator ID="ProsSpecQueryTypeValidator" runat="server" ControlToValidate="ProsSpecQueryTypeRBL" 
                                                                        Display="Dynamic" ErrorMessage="Please select a query type" 
                                                                        ValidationGroup="RequiredFields" EnableClientScript="true"  >*</asp:RequiredFieldValidator>
                                       </td>
                                       <td><asp:ValidationSummary ID="ProsSpecQueryValidationSummary" runat="server" DisplayMode="List" /></td>
                                   </tr>
                                </table>

                                <%--Fields for Histology search--%>
                                <div ID="ProsSpecQueryHistologyDIV" runat="server" style="text-align: left; padding-top: 20px; padding-bottom: 20px; display: none; ">
                                
                                    <div class="DataEntryRow" style="text-align: center; ">
                                        <cc:CaisisTextBox Width="200px" ID="histologySearchHistology" runat="server" ShowLabel="true" FieldLabel="Histology" LabelClass="WideLabel" />&nbsp;<span class="redFont">*</span>
                                        <span style="padding-left: 40px; ">&nbsp;</span>
                                        <cc:CaisisCheckBox id="histologySearchShowAvailableOnly" runat="server" ShowLabel="False" Checked="true" />Show Available Only
                                    </div>
                                                                      
                                </div>
 
                                 <%--Fields for Reference # search--%>
                                <div ID="ProsSpecQueryRefNumDIV" runat="server" style="text-align: left; padding-top: 20px; padding-bottom: 20px; display: none; ">
                                
                                    <div class="DataEntryRow" style="text-align: center; ">
                                        <cc:CaisisTextBox Width="200px" ID="refNumSearchRefNum" runat="server" ShowLabel="true" FieldLabel="Reference Number" LabelClass="WideLabel" />&nbsp;<span class="redFont">*</span>
                                        <span style="padding-left: 40px; ">&nbsp;</span>
                                        <cc:CaisisCheckBox id="refNumSearchShowAvailableOnly" runat="server" ShowLabel="False" Checked="true" />Show Available Only
                                    </div>                                    
                                </div>

                                <span style="color: #ff3366">*</span> <span style="color: #00668D;">Allows wildcard search</span>
                            </td>
			                <td class="ListManBGTableRightSide" style="width: 6px;">&nbsp;</td>
			            </tr>
			            
			            <tr> 
			                <td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			                <td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="15"></td>
			                <td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			            </tr>
			            
			            <tr style="background-color:#F1F7FC;">
			                <td class="ListManBGTableLeftSide" style="width: 6px;">&nbsp;</td>
			                <td colspan="4" align="center">
			                    <img src="../../images/buttonClear.gif" onclick="clearInputFields();" style="vertical-align:bottom; cursor:pointer; margin-right:25px;" 
			                        alt="Clear Fields" title="Clear Fields" />
			                    <!-- spacing between is given by first button's right margin -->
			                    <asp:imagebutton id="btnSearch" tabIndex="18" runat="server" onClick="btnSearch_onClick" ImageUrl="../../images/Search_small.gif" 
			                         tooltip="Submit Search" CausesValidation="true" ValidationGroup="RequriedFields" >
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
                            <td style="background-color:#F1F7FC; width:6px;">
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

	<script type="text/javascript">

    /* <![CDATA[ */
    addEvents($('<%= ProsSpecQueryTypeRBL.ClientID %>'),$('<%= ProsSpecQueryHistologyDIV.ClientID %>'),$('<%= ProsSpecQueryRefNumDIV.ClientID %>'));

    //Adds events to controls
    function addEvents(queryTypeRBL,histologyDIV,refNumDIV)
    { 
        var rbl = queryTypeRBL.getElementsByTagName('input');
        for (var j = 0; j < rbl.length; j++)
        {
            var rblRef = rbl[j];
            if (rblRef.type == 'radio')
                  $(rblRef).addEvent('click',curry(ChooseSearchPane,queryTypeRBL,histologyDIV,refNumDIV));
        } 
   }

 
    /* ]]> */
    
    function ChooseSearchPane(queryTypeRBL,histologyDIV,refNumDIV)
    {
        var chosenSearch = RetrieveRadioBtnListSelectedValues(queryTypeRBL,"TABLE");
        
        if ( chosenSearch == 'Histology' )    
        {
            histologyDIV.style.display = '';
            refNumDIV.style.display = 'none';
            ClearRefNumSearchFields();
        }
        else if ( chosenSearch == 'Reference Number' )    
        {
            histologyDIV.style.display = 'none';
            refNumDIV.style.display = '';
            ClearHistorySearchFields()
        }
        else
        {
            histologyDIV.style.display = 'none';
            refNumDIV.style.display = 'none';        
            ClearRefNumSearchFields();
            ClearHistorySearchFields()
       }
    }
    
    function ClearHistorySearchFields()
    {
        document.getElementById('<%= histologySearchHistology.ClientID %>').value = '';
        document.getElementById('<%= histologySearchShowAvailableOnly.ClientID %>').checked = false;
        
    }
    function ClearRefNumSearchFields()
    {
        document.getElementById('<%= refNumSearchRefNum.ClientID %>').value = '';
        document.getElementById('<%= refNumSearchShowAvailableOnly.ClientID %>').checked = false;
    }
    
</script>
