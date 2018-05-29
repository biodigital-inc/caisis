<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls"  %>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BTCSpecimenQuery.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.BTCSpecimenQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Brain Specimen Query</title>
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
    div.CheckBoxBoxGroupBox
    {
        border-top:solid 1px #dddddd; 
        border-left:solid 1px #dddddd; 
        border-right:solid 1px #cccccc; 
        border-bottom:solid 1px #cccccc;
        
        width: 110px;
        height: auto;
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
	    .style1
        {
            width: 117px;
        }
        .style2
        {
            width: 190px;
        }
	    .style3
        {
            text-align: right;
        }
	</style>
	
	<script type="text/javascript">
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
                  <div style=" width:825px; height:430px; position:relative;">
                  <table width="825" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                            <td class="ListManTitle" colspan="6" height="25" valign="bottom" align="left">Brain Specimen Search</td>
                        </tr>
                        <tr> 
                            <td colspan="6"><img alt="" src="../../Images/shim.gif" width="10" height="8"></td>
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
			                <td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="1"></td>
			                <td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			            </tr>

			            <tr style="background-color:#F1F7FC;">
			                <td class="ListManBGTableLeftSide" style="width: 6px;">&nbsp;</td>
                            <td colspan="4" valign="top" align="left">
                            <!-- Contents  -->
                                <table>
                                    <tr>
                                        <td style="width:50%; vertical-align:top;">
                                            <table cellpadding="2">
                                    <!-- Search Date -->
                                                <tr id="ShowAllFieldsRow" runat="server" visible="false">
                                                    <td colspan="4" style="text-align: left;">
                                                    <cc:CaisisCheckBox id="ShowAllFields" runat="server" tabIndex="1"  ShowLabel="False" Checked="false"></cc:CaisisCheckBox><strong><span style="color: #8d282c">Show All fields</span></strong></td>
                                                </tr>
                                    <tr>
                                        <td class="leftLabel" style="font-weight:bold; vertical-align:top;">Accession Date</td>
                                        <td colspan="3">
                                             From <cc:CaisisTextBox ID="dateCollectionFrom" TabIndex="3" ShowLabel="false" onblur="isDateAndNotEmpty(this.id, this.value);"
                                                runat="server" ShowCalendar="true" Width="80px"></cc:CaisisTextBox><span style="padding-left:10px;">To </span><cc:CaisisTextBox ID="dateCollectionTo" TabIndex="4" ShowLabel="false" onBlur="isDateAndNotEmpty(this.id, this.value);"
                                                runat="server" ShowCalendar="true" Width="80px"></cc:CaisisTextBox></td>
                                    </tr>
                                    <tr style="text-align:left;">
                                                    <td class="leftLabel" style="font-weight:bold; vertical-align:top;">Specimens</td>
                                                    <!-- Tumor Subtypes list -->
                                                    <td valign="top">
                                                        <div>
                                                            <div class="CheckBoxGroupBoxTitle">
                                                                <input onclick="checkSubType(this, 'TissueSamplesCheckBoxList');"  type="checkbox" checked="checked" value="Tissue" id="cbTissue" runat="server" tabindex="5" />
                                                                <span style="padding-left: 2px;">Tissue</span>
                                                            </div>
                                                            <div class="CheckBoxBoxGroupBox">
                                                                <asp:CheckBoxList ID="TissueSamplesCheckBoxList" runat="server" TabIndex="6" Width="100px" CellPadding="1" CellSpacing="2" Style="margin-left: 10px; margin-top: 2px;">
                                                                <asp:ListItem Text="Tumor" Selected="True" Value="Tumor"></asp:ListItem>
                                                                <asp:ListItem Text="DNA" Selected="True" Value="DNA"></asp:ListItem>
                                                                <asp:ListItem Text="RNA" Selected="True" Value="RNA"></asp:ListItem>
                                                                </asp:CheckBoxList> 
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <!-- Blood Subtypes list -->
                                        <td valign="top" colspan="2">
                                        <div>
                                                            <div class="CheckBoxGroupBoxTitle">
                                                                <input onclick="checkSubType(this, 'BloodSamplesCheckBoxList');" type="checkbox" checked="checked" value="Blood" id="cbBlood" runat="server" tabindex="7" />
                                                                <span style="padding-left: 2px;">Blood</span>
                                                            </div>
                                                            <div class="CheckBoxBoxGroupBox">
                                                                <asp:CheckBoxList ID="BloodSamplesCheckBoxList" runat="server" TabIndex="8" Width="100px" CellPadding="1" CellSpacing="2" Style="margin-left: 10px; margin-top: 2px;">
                                                                <asp:ListItem Text="Whole Blood" Selected="True" Value="Whole Blood"></asp:ListItem>
                                                                <asp:ListItem Text="DNA" Selected="True" Value="DNA"></asp:ListItem>
                                                                </asp:CheckBoxList>
                                                            </div>
                                                            </div>
                                        </td>
                                                </tr>
                                   
                                    <!-- Sample Status -->
                                    <tr>
                                        <td class="leftLabel">Status</td>
                                        <td>
                                            <cc:CaisisComboBox ID="ddlSampleStatus" FieldLabel="Sample Status" LabelClass="label"
                                                TabIndex="9" ShowLabel="False" runat="server" Width="86px" LookupCode="Specimen_Status" />
                                            </td>
                                        <!-- Box Name -->
                                        <td style="text-align: right; ">Contact/ Purpose</td>
                                        <td><cc:CaisisSelect FieldLabel="Contact" runat="server" ID="ddlContact" Table="Specimens" 
                                            Field="ContactId" TabIndex="10" Width="95px" ShowLabel="False" DataTextField="Name" 
                                            DataValueField="ContactId" />
                                        </td>
                                    </tr>                                    
                                    <!-- Reference Number / Vial Number -->
                                                <tr>
                                                    <td style=" text-align: right;width: 110px; vertical-align:middle;">Original Quantity</td>
                                                    <td valign="bottom" colspan="3">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; Value &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Units<br />
                                                        <cc:CaisisSelect id="ddlOptr" runat="server" tabIndex="11" Width="55px" ShowLabel="false">
                                                            <asp:ListItem title="greater than or equal to" Text=">=" Value=">="></asp:ListItem>
                                                            <asp:ListItem title="less than or equal to" Text="<=" Value="<=" ></asp:ListItem>
                                                            <asp:ListItem title="equal to" Text="=" Value="=" ></asp:ListItem>
                                                            <asp:ListItem title="greater than" Text=">" Value=">" ></asp:ListItem>
                                                            <asp:ListItem title="less than" Text="<" Value="<" ></asp:ListItem>                  
                                                            <asp:ListItem title="not equal to" Text="!=" Value="<>" ></asp:ListItem>
                                                        </cc:CaisisSelect>&nbsp;
                                                        <cc:CaisisTextBox ID="OrgQtytxt" TabIndex="12" ShowLabel="False" Width="55px" 
                                                            MaxLength="50" runat="server"/>&nbsp;
                                                        <cc:CaisisComboBox runat="server" ID="ddlUnits" TabIndex="13" LookupCode="Specimen_Units"
                                                            Width="55px" ShowLabel="False" />&nbsp;<br />
                                                        <asp:CompareValidator runat="server" ID="orgQtyValidator" ControlToValidate="OrgQtytxt" Type="Double" Operator="DataTypeCheck" ErrorMessage="Enter valid numerical values!" /></td>
                                                </tr>
                                                <tr>
                                                    <td style=" text-align: right;width: 110px; vertical-align:top;">Remaining Quantity</td>
                                                    <td valign="bottom" colspan="3">
                                                        <cc:CaisisSelect id="ddlRemQtyOptr" runat="server" tabIndex="14" Width="55px" 
                                                            ShowLabel="false">
                                                            <asp:ListItem title="greater than or equal to" Text=">=" Value=">="></asp:ListItem>
                                                            <asp:ListItem title="less than or equal to" Text="<=" Value="<=" ></asp:ListItem>
                                                            <asp:ListItem title="equal to" Text="=" Value="=" ></asp:ListItem>
                                                            <asp:ListItem title="greater than" Text=">" Value=">" ></asp:ListItem>
                                                            <asp:ListItem title="less than" Text="<" Value="<" ></asp:ListItem>                  
                                                            <asp:ListItem title="not equal to" Text="!=" Value="<>" ></asp:ListItem>
                                                        </cc:CaisisSelect>&nbsp;
                                                        <cc:CaisisTextBox ID="RemQtytxt" TabIndex="15" ShowLabel="False" Width="55px" 
                                                            MaxLength="50" runat="server"/>&nbsp;
                                                        <cc:CaisisComboBox runat="server" ID="ddlRemQtyUnits" TabIndex="16" LookupCode="Specimen_Units"
                                                            Width="55px" ShowLabel="False" />&nbsp;<br />
                                                        <asp:CompareValidator runat="server" ID="RemQtyValidator" 
                                                            ControlToValidate="RemQtytxt" Type="Double" Operator="DataTypeCheck" 
                                                            ErrorMessage="Enter valid numerical values!" /></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">Reference #</td>
                                                    <td><cc:CaisisTextBox ID="txtRefNum" FieldLabel="" LabelClass="label" TabIndex="17" Width="85px"
                                                            ShowLabel="False" MaxLength="50" runat="server"/>&nbsp;<span class="redFont">*</span>
                                                    </td>
                                                    <td style="text-align: right; " id="MrnLbl" runat="server" visible="false">MRN</td>
                                                    <td id="MrnControl" runat="server" visible="false">
                                                        <cc:CaisisTextBox ID="txtMRN" FieldLabel="" LabelClass="label" TabIndex="18" 
                                                        Width="85px" ShowLabel="False" MaxLength="50" runat="server"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="leftLabel">
                                            Box Name</td>
                                                    <td colspan="3">
                                            <cc:CaisisTextBox ID="txtBoxName" FieldLabel="Box Name" LabelClass="label" TabIndex="19"
                                                ShowLabel="False" Width="85px" MaxLength="50" runat="server" /><span class="redFont">
                                                    *</span>&nbsp;<cc:CaisisCheckBox ID="wildSrh" runat="server" Checked="true" ShowLabel="false" 
                                                        TabIndex="20" />Use BoxName wildcard search</td>
                                                </tr>
                                                </table>
                                        <span style="color: #ff3366">*</span> <span
                                                style="color: #00668D;">Allows wildcard search</span></td>
                                        <td style="width:50%; vertical-align:top;">
                                            <table cellpadding="2">
                                    <!-- Search Date -->
                                                <tr>
                                                    <td class="leftLabel" colspan="4" style="text-align: left">
                                                    <cc:CaisisCheckBox id="showAvailableOnly" runat="server" tabIndex="2"  ShowLabel="False" Checked="false" /><span style="white-space:nowrap;">Hide Reserved Specimens</span></td>
                                                </tr>
                                    <tr>
                                        <td class="leftLabel" 
                                            style="font-weight:bold; vertical-align:top; width: 190px;">Pathology</td>
                                        <td colspan="3">
                                            <cc:CaisisExtendedCheckBoxList id="histologyCheckList" runat="server" LookupCode="Specimen_BTCPathHistology" LabelClass="WideLabel" FieldLabel="Histology" />
                                            <%--<asp:CheckBoxList LabelClass="WideLabel" FieldLabel="Histology" id="histologyCheckList" runat="server" tabIndex="21" ShowLabel="false" RepeatLayout="Table" RepeatDirection="Vertical">
                                                <asp:ListItem>Glioblastoma</asp:ListItem>
                                                <asp:ListItem>Astrocytoma</asp:ListItem>
                                                <asp:ListItem>Oligodendroglioma</asp:ListItem>
                                                <asp:ListItem>Meningioma</asp:ListItem>
                                            </asp:CheckBoxList>--%>
                                            Other&nbsp;
                                            <cc:CaisisComboBox id="OtherHistology" runat="server" tabIndex="22" LookupCode="PathHistologyNeuro"  Width="164px" ShowLabel="false"></cc:CaisisComboBox>&nbsp;<span class="redFont">*</span></td>
                                    </tr>
                                    <!-- Specimens -->
                                    <tr>
                                        <td class="leftLabel" style="width: 190px">Grade</td>
                                        <td class="style1"><cc:CaisisSelect id="ddlHistopathologicalGrade" runat="server" tabIndex="23" LookupCode="PathGrade,Disease,Neuro"  Width="85px" ShowLabel="false"></cc:CaisisSelect></td>
                                        <td class="leftLabel">Surgeon</td>
                                        <td><cc:CaisisComboBox ID="ddlSurgeon" runat="server" LookupCode="OpSurgeon,Disease,Neuro" Width="70px" 
                                            TabIndex="24" ShowLabel="False" /></td>
                                    </tr>
                                    <tr style="text-align:left;">
                                        <td valign="top" style="text-align: right" class="style2">
                                            Vital Status</td>
                                        <td valign="top" class="style1"><cc:CaisisSelect id="ddlVitalStatus" runat="server" tabIndex="25" Width="85px" ShowLabel="false">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Alive" Value="Alive"></asp:ListItem>
                                            <asp:ListItem Text="Dead" Value="Death"></asp:ListItem>
                                        </cc:CaisisSelect>
                                        </td>
                                        <td valign="top" style="text-align: right;">
                                            Test Type</td>
                                        <td><cc:CaisisSelect ID="ddlEvtTest" runat="server" LookupCode="Specimen_EventTest" Width="90px" 
                                            TabIndex="26" ShowLabel="False" /></td>
                                    </tr>
                                    <tr style="text-align:left;">
                                        <td valign="top" style="text-align: right;" class="style2">
                                             <asp:Literal ID="IdentifierType" runat="server"></asp:Literal></td>
                                        <td valign="top">
                                             <cc:CaisisTextBox ID="txtIdentifier" TabIndex="27" ShowLabel="False" Width="80px" 
                                                MaxLength="50" runat="server"/>&nbsp;<span class="redFont">*</span></td>
                                        <td valign="top" style="text-align: right;">
                                             Test Result</td>
                                        <td><cc:CaisisTextBox ID="txtEvtResult" TabIndex="28" Width="83px" ShowLabel="False" 
                                                MaxLength="50" runat="server"/>&nbsp;<span class="redFont">*</span></td>
                                    </tr>
                                </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
			                <td class="ListManBGTableRightSide" style="width: 6px;">&nbsp;</td>
			            </tr>
			            
			            <tr style="background-color:#F1F7FC;">
			                <td class="ListManBGTableLeftSide" style="width: 6px;">&nbsp;</td>
			                <td colspan="4" align="center">
			                    <img src="../../images/buttonClear.gif" onclick="clearInputFields();" TabIndex="29"
                                                style="vertical-align: bottom; cursor: pointer; margin-right: 25px;" alt="Clear Fields"
                                                title="Clear Fields" />
                                            <!-- spacing between is given by first button's right margin -->
                                            <asp:ImageButton ID="ImageButton1" TabIndex="30" runat="server" OnClick="btnSearch_onClick"
                                                ImageUrl="../../images/Search_small.gif" Style="vertical-align: top" ToolTip="Submit Search" 
                                                Height="21px"></asp:ImageButton>
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