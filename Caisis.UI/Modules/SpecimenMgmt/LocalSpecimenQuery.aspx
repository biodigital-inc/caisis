<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls"  %>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LocalSpecimenQuery.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.LocalSpecimenQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Basic Specimen Query</title>
    
    <meta name="GENERATOR" content="Microsoft Visual Studio 7.0" />
	<meta name="CODE_LANGUAGE" content="C#" />
	<meta name="vs_defaultClientScript" content="JavaScript" />
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
	
	<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
	<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
	<script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
	
	<link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
    #Wrapper
    {
        height: 400px;
        overflow: auto;
    }
    div.CheckBoxBoxGroupBox
    {
        border-top:solid 1px #dddddd; 
        border-left:solid 1px #dddddd; 
        border-right:solid 1px #cccccc; 
        border-bottom:solid 1px #cccccc;
        
        width: 135px;
        height:160px;
        padding-bottom:5px;
        margin-right:5px;
        margin-bottom:0px;
        
        /*background-color: #FEFEFE;*/
    }
    
    div.CheckBoxGroupBoxTitle
    {
        /*background-color: #cccccc;*/
        padding-top:2px;
        padding-bottom:2px;
        color: #333333;
        font-size: 11px;
        
        /*border-top:solid 1px #bbbbbb; 
        border-left:solid 1px #cccccc; 
        border-right:solid 1px #bbbbbb; 
        border-bottom:solid 1px #cccccc;*/ 
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
	    width: 85px;
	    vertical-align:center;
	}
	</style>
	
	<script type="text/javascript">
	    function onWindowResize() {
	        var wHeight = getHeight(window);
	        $('Wrapper').style.height = Math.max(400, wHeight - 100) + 'px';
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
     <form id="searchForm" method="post" runat="server" defaultfocus="dateCollectionFrom">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color:#f8fafc; padding-top:10px; ">
                  <tr>
                  <td align="center" >
                  <div style=" width:820px;">
                  <table width="820" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                            <td class="ListManTitle" colspan="6" height="25" valign="bottom" align="left">Basic Specimen Search</td>
                        </tr>
                       <tr> 
                            <td colspan="6"><img alt="" src="../../Images/shim.gif" width="10" height="5"></td>
                        </tr>

			            <tr> 
			                <td style="background-color:#F1F7FC;"><img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="1" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="20" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="320" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="400" height="5"></td>
			                <td style="background-color:#F1F7FC;"><img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
			            </tr>
        			    
			            <tr> 
			                <td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			                <td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="1" height="1"></td>
			                <td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			            </tr>

			            <tr style="background-color:#F1F7FC;">
			                <td class="ListManBGTableLeftSide" style="width: 6px;">&nbsp;</td>
                            <td colspan="4" valign="top" align="left">
                            <!-- Contents  -->
                                <div id="Wrapper">
                                    <table cellpadding="2" width="100%">
                                    <!-- Search Date -->
                                    <tr>
                                        <td class="leftLabel" style="font-weight:bold; width: 83px;">
                                            Search Date
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="leftLabel" style="width: 83px">
                                             From
                                        </td>
                                        <td colspan="4">
                                            <cc:CaisisTextBox ID="dateCollectionFrom" TabIndex="1" ShowLabel="false" onblur="isDateAndNotEmpty(this.id, this.value);"
                                                runat="server" Style="width: 100px;" ShowCalendar="true"></cc:CaisisTextBox>
                                            <span style="padding-left:10px;">To</span>
                                            <cc:CaisisTextBox ID="dateCollectionTo" TabIndex="2" ShowLabel="false" onBlur="isDateAndNotEmpty(this.id, this.value);"
                                                runat="server" Style="width: 100px;" ShowCalendar="true"></cc:CaisisTextBox>
                                             
                                             <img src="../../Images/shim.gif" width="40" height="1"><cc:CaisisCheckBox id="showAvailableOnly" runat="server" tabIndex="5"  ShowLabel="False" Checked="true"></cc:CaisisCheckBox> Show Only Available Specimens
                                  
                                          </td>
                                    </tr>
                                    <!-- Specimens -->
                                    <tr>
                                        <td class="leftLabel" style="font-weight:bold; width: 83px;">
                                            Specimens
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width: 83px;" valign="top" >
                                            <div style="padding-top:4px; padding-bottom:10px;">
                                                Type
                                            </div>
                                            <div>
                                                SubType
                                            </div>
                                        </td>
                                        <td valign="top" colspan="4">
                                            <!-- Dynamic Lookup SubType CheckBoxes -->
                                            <asp:Repeater ID="SpecimenTypeRptr" runat="server" DataSourceID="SpecimenTypeDataSource"
                                                OnItemDataBound="BindSpecimenSubTypesCheckBoxes">
                                                <ItemTemplate>
                                                    <div style="float: left;">
                                                        <div class="CheckBoxGroupBoxTitle">
                                                            <asp:CheckBox runat="server" ID="SpecimenTypeCheckBox" Text='<%# Eval("LkpCode") %>'
                                                                TabIndex="3" />
                                                        </div>
                                                        <div class="CheckBoxBoxGroupBox">
                                                            <asp:CheckBoxList runat="server" ID="SubTypeCheckBoxList" TabIndex="4">
                                                            </asp:CheckBoxList>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <!-- DataSource for SpecimenType LookupCodes -->
                                            <asp:ObjectDataSource runat="server" ID="SpecimenTypeDataSource" TypeName="Caisis.UI.Core.Classes.CacheManager"
                                                SelectMethod="GetLookupCodeList">
                                                <SelectParameters>
                                                    <asp:Parameter Name="key" Type="string" DefaultValue="Specimen_Type" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                   
                                    <!-- Sample Status -->
                                    <tr>
                                        <td class="leftLabel" style="width: 83px">
                                            Sample Status
                                        </td>
                                        <td>
                                            <cc:CaisisSelect ID="ddlSampleStatus" FieldLabel="Sample Status" LabelClass="label"
                                                TabIndex="7" ShowLabel="False" runat="server" Width="160px" LookupCode="Specimen_Status">
                                            </cc:CaisisSelect>&nbsp;
                                        </td>
                                        <!-- Box Name -->
                                        <td style="text-align: right">
                                            Box Name</td>
                                        <td>
                                            <cc:CaisisTextBox ID="txtBoxName" FieldLabel="Box Name" LabelClass="label" TabIndex="8"
                                                ShowLabel="False" Width="151px" MaxLength="50" runat="server" /><span class="redFont">
                                                    *</span>&nbsp;<cc:CaisisCheckBox ID="wildSrh" runat="server" Checked="true" ShowLabel="false" /> Use BoxName
                                            wildcard search&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
                                        </td>
                                    </tr>
                                    
                                     <!-- Reference Number / Vial Number -->
                                     <tr>
                                        <td class="leftLabel" style="width: 83px">
                                              Reference/Vial #
                                         </td>
                                         <td>
                                              <cc:CaisisTextBox ID="txtRefNum" FieldLabel="" LabelClass="label" TabIndex="8"
                                                ShowLabel="False" Width="153px" MaxLength="50" runat="server" />&nbsp;<span class="redFont">*</span>
                                             &nbsp;&nbsp;
                                         </td>
                                         <!-- Patient Identifier -->
                                         <td style="text-align: right">
                                             <asp:Literal ID="IdentifierType" runat="server"></asp:Literal></td>
                                         <!-- Allows Wildcard Search notes -->    
                                         <td>
                                             <cc:CaisisTextBox ID="txtIdentifier" TabIndex="7" ShowLabel="False" Width="151px" MaxLength="50" runat="server"/>&nbsp;<span class="redFont">*</span>
                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                            &nbsp;&nbsp; <span style="color: #ff3366">*</span> <span
                                                style="color: #00668D;">Allows wildcard search</span></td>
                                     </tr>
                                    
                                    <tr>
                                        <td colspan="4">
                                        </td>
                                    </tr>
                                    <!-- Buttons -->
                                    <tr>
                                        <td colspan="4" style="text-align:center;">
                                            <img src="../../images/buttonClear.gif" onclick="clearInputFields();" TabIndex="9"
                                                style="vertical-align: bottom; cursor: pointer; margin-right: 25px;" alt="Clear Fields"
                                                title="Clear Fields" />
                                            <!-- spacing between is given by first button's right margin -->
                                            <asp:ImageButton ID="btnSearch" TabIndex="10" runat="server" OnClick="btnSearch_onClick"
                                                ImageUrl="../../images/Search_small.gif" Style="vertical-align: top" ToolTip="Submit Search">
                                            </asp:ImageButton>
                                        </td>
                                    </tr>
                                </table>
                                </div>
                            </td>
			                <td class="ListManBGTableRightSide" style="width: 6px;">&nbsp;</td>
			            </tr>
			            
			            <tr> 
			                <td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			                <td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="15" height="5"></td>
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
		          </div> 
		        </td>
	        </tr>
	       
        </table>   
    </form>

</body>
</html>
