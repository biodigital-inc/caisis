<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccessionSearchByIdentifiers.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.AccessionSearchByIdentifiers" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls"  %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Accessions Search</title>
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
	
	<script type="text/javascript">
    
    Browser.ResizeElement( { nodeId: 'PDFormDiv', heightOffset: 390 } );
    
    function isRowClick(evt)
    {   
        var n = evt.srcElement||evt.target;
        return n.nodeName=='INPUT'?false:true;
    }
    
    function showAccessions(row, patientId)
    {
        window.location.href = "AccessionsContainer.aspx?patientId=" + patientId + "&specimenaccessionId=0";
    }
    
    function onclear()
    {
        clearInputFields();
        document.getElementById('PDFormDiv').style.display='none';
    }
    </script>
    
	<style type="text/css">
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
	    vertical-align:middle;
	}
	
	td.ListManDataTableCell
    {
        text-align:center;
    }
    td.ListManDataTableCellBordered
    {
        border: 1px dotted #00668D;
        text-align:center;
    }
    td.ListManDataTableCellBorderedOn
    {
        border: 1px solid #00668D;
        text-align:center;
    }
	</style>	
	
</head>

<body style="margin: 0px;">
     <form id="searchForm" method="post" runat="server">
        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="background-color:#f8fafc; padding-top:10px; ">
                  <tr style="text-align:center;">
                  <td align="center" >
                  <table width="550px" border="0" cellspacing="0" cellpadding="0" style="text-align:center; ">
                        <tr> 
                            <td class="ListManTitle" colspan="4" height="25" valign="bottom" align="left">Specimen Accessions Search</td>
                        </tr>
                       <tr> 
                            <td colspan="4"><img alt="" src="../../Images/shim.gif" width="10" height="5"></td>
                        </tr>

			            <tr> 
			                <td style="background-color:#F1F7FC;"><img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="100" height="5"></td>
			                <td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="400" height="5"></td>
			                <td style="background-color:#F1F7FC;"><img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
			            </tr>
        			    
			            <tr> 
			                <td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			                <td colspan="2" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="1" height="1"></td>
			                <td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			            </tr>

			            <tr style="background-color:#F1F7FC;">
			                <td class="ListManBGTableLeftSide" style="width: 6px;">&nbsp;</td>
                            <td colspan="2" valign="top" align="left">
                            <!-- Contents  -->
                                <table cellpadding="2" width="525px" border="0">    
                                    <tr>
                                        <td style=" width:135px; height:40px;" valign="top" nowrap>
                                            <input type="radio" id="LastNameMRNOption" name="SearchTypeValue" value="LastNameMRN" runat="server"
                                                title="Last Name or MRN" visible="false" tabindex="1" />
                                            <asp:Label ID="LastNameMRNLbl" runat="server" visible="false" Text="Last Name or MRN" /><br />
                                             <input type="radio" id="IdentifierType" name="SearchTypeValue" runat="server"/>
                                            <asp:Label id="IdentifierLbl" runat="server" /><br /><br />
                                            <asp:ImageButton ID="btnSearch" runat="server" OnCommand="btnSearch_Click"
                                                ImageUrl="../../images/Search_small.gif" Style="vertical-align:bottom; margin-left: 100px; 
                                                padding-top:4px;" ToolTip="Submit Search" TabIndex="3" />
                                        </td>
                                        <td valign="top" style=" width:150px;height:40px;">
                                            <cc:CaisisTextBox ID="searchTxtBox" ShowLabel="False" Width="150px" MaxLength="50" 
                                            runat="server" style=" padding-bottom:7px;" TabIndex="2"/><br /><br /><br />
                                            <img src="../../images/buttonClear.gif" onclick="onclear();" alt="Clear Fields" title="Clear Fields"
                                                style="vertical-align: bottom; cursor: pointer;" tabindex="4" />
                                            
                                        </td>
                                        <td valign="top" style=" width:250px;" rowspan="2">
                                           
                                                
                                            <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 350px; border:solid 1px #999999; background-color:#ffffff;width:250px; display:none; text-align:center;" runat="server">
                                        <table id="PatientsTable" cellspacing="0" cellpadding="1" border="0" width="230px">
                                            <asp:Repeater ID="PatientResults" runat="server" OnItemDataBound="rptItemCreated">
                                               <ItemTemplate>
                                                    <tr id="listRow" class="ListManDataTableRow" 
                                                             style="vertical-align: middle;cursor: pointer;" onclick="if(isRowClick(event)) { showAccessions(this,'<%#  EncryptPatientId(Eval("PatientId").ToString()) %>'); }" onmouseover="this.className='ListManDataTableRowOver';" onmouseout="this.className='ListManDataTableRow';" >              
                                                        
                                                        <td id="dataName" class="ListManDataTableCell" runat="server" 
                                                            style=" text-align:left; visibility:hidden;">
                                                            <asp:Label ID="dataNameLbl" runat="server">
                                                                <%# Eval("PtLastName")%>, <%# Eval("PtFirstName")%></asp:Label>
                                                        </td>
                                                        <td id="dataDOB" class="ListManDataTableCell" style="visibility:hidden;" runat="server">
                                                            <asp:Label ID="dataDOBLbl" runat="server"><%# Eval("PtBirthDateText")%></asp:Label>
                                                        </td>
                                                        <td class="ListManDataTableCell" style="text-align: center;">
                                                            <asp:Label ID="dataID" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <SeparatorTemplate>
                                                    <tr>
                                                        <td colspan="3" class="ListManDataTableDottedLine" style="cursor: default; height: 5px;">
                                                        </td>
                                                    </tr>
                                                </SeparatorTemplate>
                                            </asp:Repeater>                                            
                                        </table>
                                    </div>
                                            <asp:Label ID="noRecordsFound" runat="server" Visible="false"><b>No Records Matched Your Search Criteria</b></asp:Label>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td colspan="2" style="text-align:center;" valign="top"></td>
                                    </tr>
                                    </table>
                            </td>
			                <td class="ListManBGTableRightSide" style="width: 6px;">&nbsp;</td>
			            </tr>
			            
			            <tr> 
			                <td class="ListManBGTableLeftSide" style="height: 5px"><img src="../../Images/shim.gif" width="1" height="1"></td>
			                <td colspan="2" class="ListManBGTableBody" style="height: 5px"><img src="../../Images/shim.gif" width="15" height="5"></td>
			                <td class="ListManBGTableRightSide" style="height: 5px"><img src="../../Images/shim.gif" width="1" height="1"></td>
			            </tr>
			            
			            <tr>
                            <td style="background-color:#F1F7FC; width:6px;">
                                <img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
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