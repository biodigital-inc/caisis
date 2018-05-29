<%@ Page Language="c#" Inherits="Caisis.UI.Core.PaperForms.BatchPrint" CodeFile="BatchPrint.aspx.cs"
    CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<%@ Register  TagPrefix="paper" TagName="PaperFormList" Src="~/Core/Utilities/ConfigDropDown.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>BatchPrint</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link type="text/css" href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script type="text/javascript">
 //   Browser.ResizeElement( { nodeId: 'ListManDataTable', heightOffset: 325 } );
    
	function SetAllForms(seledtedFormIndex)
	{
		var numFormElements = document.forms[0].length;
		
		for( i=0; i<numFormElements; i++ )
		{
			if (document.formList.elements[i].selectedIndex != null)
			{
				document.formList.elements[i].selectedIndex = seledtedFormIndex;
			}
		}
		
	}
    </script>

    <style type="text/css">
	select
	{
	    font-size: 10pt;
	}
	#ListManDataTable
	{
        overflow: auto;
        width: 757px;
        min-height: 250px;
        height: 80%;
        *max-height: 290px;
	}
	table.ListManDataTableOuterBorder
	{
	    cursor: default; 
	    width: 757px
	}
	#BatchPrintListManagerContentContainer
	{
	    position: relative;
	    top: 0px;
	    height: 94%;
        background-image: url(../../Images/ListManBG2_TopRight.png);
        background-repeat: no-repeat;
        background-position: right top;
        padding-right: 6px;
        padding-left: 80px;
        overflow: hidden;
	}
	#BatchPrintListManagerContent
	{
	    height: 100%;
	    max-height: 100%;
	    min-height: 350px;
        background-image: url(../../Images/ListManBG2_TopLeft.png);
        background-repeat: no-repeat;
        padding: 20px 14px 14px 20px;
	}
	
	#BatchPrintListManagerBottomContainer
	{
        background-image: url(../../Images/ListManBG2_BottomRight.png);
        background-repeat: no-repeat;
        background-position: right bottom;
        padding-right: 6px;
        padding-left: 80px;
        font-size: 1px;
        line-height: 1px;
	    height: 6px;
	    min-height: 6px;
	    max-height: 6px;
	    z-index: 500;
	}
	#BatchPrintListManagerBottom
	{
	    height: 6px;
	    min-height: 6px;
	    max-height: 6px;
        background-image: url(../../Images/ListManBG2_BottomLeft.png);
        background-repeat: no-repeat;
        background-position: left bottom;
        font-size: 1px;
        line-height: 1px;
	    z-index: 500;
	}
	
	
	</style>
</head>
<body onload="top.showMenus(false);" style="min-height: 900px;">
    <form id="formList" name="formList" method="post" action="FormsContainer.aspx">
        <input type="hidden" value="true" id="batchPrint" name="batchPrint" />
        
        
        <div style="position: absolute; top: 0px; bottom: 40px; width: 99%; overflow: hidden;">
        
        <div id="BatchPrintListManagerContentContainer">
        <div id="BatchPrintListManagerContent">
        </div>
        </div>
        <div id="BatchPrintListManagerBottomContainer">
        <div id="BatchPrintListManagerBottom">&nbsp;</div>
        </div>
        </div>
        <a href="FormsSplash.aspx" style="position: fixed; top: 0px; left: 0px;"><img border="0" src="../../Images/GoToFormsStartPage.gif"></a>
        <input id="createBatchButton" runat="server" value="submit" type="image" src="../../Images/createPopulatedFormsForThisList.gif" border="0" style="position: absolute; bottom: 1px; right: 100px; z-index: 20000;" />
        
        
        
        
        <div style="position: absolute; top: 20px; bottom: 60px; left: 120px;">
                            
                            
                            
                                <div style="margin-bottom: 15px;">
                                    <asp:Label ID="batchPrintMessage" runat="server">Please select the proper form for each patient.</asp:Label>
                                    <img src="../../Images/shim.gif" width="135" height="1" />
                                    All Patients:&nbsp;
                                    <paper:PaperFormList runat="server" FormClientId="SelectForAllPatients" FormClientName="SelectForAllPatients"
                                        ConfigTypeName="PaperFormConfig" FilterByDiseaseView="false" OnClientChange="SetAllForms(this.selectedIndex);" />
                                </div>
                                <table id="clinicListTitleTable" border="0" cellpadding="4" cellspacing="0" class="ListManDataTableOuterBorder"
                                    runat="server">
                                    <tr>
                                        <td class="ListManDataTableTop" width="100" style="text-align: left">
                                            &nbsp;&nbsp;<a href="BatchPrint.aspx?sortColumn=ApptTime">Time</a></td>
                                        <td class="ListManDataTableTop" width="175" style="text-align: left">
                                            <a href="BatchPrint.aspx?sortColumn=ApptLastName">Name</a></td>
                                        <td class="ListManDataTableTop" width="85">
                                            <a href="BatchPrint.aspx?sortColumn=ApptMRN">MRN</a></td>
                                        <td class="ListManDataTableTop" width="100">
                                            <a href="BatchPrint.aspx?sortColumn=ApptVisitType">Visit Type</a></td>
                                        <td class="ListManDataTableTop" width="175">
                                            Form Type</td>
                                        <td class="ListManDataTableTop" width="122">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                                <table id="inPatientListTitleTable" border="0" cellpadding="4" cellspacing="0" class="ListManDataTableOuterBorder"
                                    runat="server">
                                    <tr>
                                        <td class="ListManDataTableTop" width="100" style="text-align: left">
                                            &nbsp;&nbsp;Admit Date</td>
                                        <td class="ListManDataTableTop" width="175" style="text-align: left">
                                            Name</td>
                                        <td class="ListManDataTableTop" width="85">
                                            MRN</td>
                                        <td class="ListManDataTableTop" width="100">
                                            Bed #</td>
                                        <td class="ListManDataTableTop" width="175">
                                            Form Type</td>
                                        <td class="ListManDataTableTop" width="122">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                                <table id="patientListTitleTable" border="0" cellpadding="4" cellspacing="0" class="ListManDataTableOuterBorder"
                                    runat="server">
                                    <tr>
                                        <td class="ListManDataTableTop" width="80">
                                            &nbsp;</td>
                                        <td class="ListManDataTableTop" width="210" style="text-align: left">
                                            <a href="BatchPrint.aspx?sortColumn=ptLastName">Name</a></td>
                                        <td class="ListManDataTableTop" width="150" style="text-align: left">
                                            <a href="BatchPrint.aspx?sortColumn=ptMRN">MRN</a></td>
                                        <td class="ListManDataTableTop" width="257">
                                            Form Type</td>
                                        <td class="ListManDataTableTop" width="60">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                                <div id="ListManDataTable">
                                    <table class="BatchPrintTable" border="0" cellpadding="4"
                                        cellspacing="0">
                                        <asp:Repeater ID="rptFormList" runat="server">
                                            <ItemTemplate>
                                                <tr class="ListManDataTableRow" valign="middle">
                                                    <td width="60">
                                                        &nbsp;</td>
                                                    <td width="200">
                                                        <%# Eval("ptLastName") %>
                                                        ,
                                                        <%# Eval("ptFirstName") %>
                                                    </td>
                                                    <td width="185" align="left">
                                                        <img src="../../Images/shim.gif" width="20" height="1"><%# Eval("ptMRN") %></td>
                                                    <td width="299" align="left">
                                                        <paper:PaperFormList runat="server" FormClientId='<%# "id" + Eval("patientID") %>' FormClientName='<%# Eval("patientID") %>'
                                                            ConfigTypeName="PaperFormConfig" FilterByDiseaseView="false" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
<%--                                            <SeparatorTemplate>
                                                <tr>
                                                    <td height="1" colspan="5" class="ListManDataTableDottedLine">
                                                        <img src="../../Images/shim.gif" width="1" height="1"></td>
                                                </tr>
                                            </SeparatorTemplate>--%>
                                        </asp:Repeater>
                                        <asp:Repeater ID="rptClinicFormList" runat="server">
                                            <ItemTemplate>
                                                <tr class="ListManDataTableRow" valign="middle">
                                                    <td width="90">
                                                        <%# Eval("ApptTime", "{0:t}") %>
                                                    </td>
                                                    <td width="200">
                                                        <%# Eval("ApptLastName") %>
                                                        ,
                                                        <%# Eval("ApptFirstName") %>
                                                    </td>
                                                    <td width="75" align="center">
                                                        <%# Eval("ApptMRN") %>
                                                    </td>
                                                    <td width="120" align="left">
                                                        <img src="../../Images/shim.gif" width="40" height="1"><%# Eval("ApptVisitType") %></td>
                                                    <td width="259" align="left">
                                                        <paper:PaperFormList runat="server" FormClientId='<%# Eval("StringApptPatientId") %>'
                                                            FormClientName='<%# Eval("StringApptPatientId") %>' ConfigTypeName="PaperFormConfig"
                                                            FilterByDiseaseView="false" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
<%--                                            <SeparatorTemplate>
                                                <tr>
                                                    <td height="1" colspan="6" class="ListManDataTableDottedLine">
                                                        <img src="../../Images/shim.gif" width="1" height="1"></td>
                                                </tr>
                                            </SeparatorTemplate>--%>
                                        </asp:Repeater>
                                        <asp:Repeater ID="rptInPatientFormList" runat="server">
                                            <ItemTemplate>
                                                <tr class="ListManDataTableRow" valign="middle">
                                                    <td width="90">
                                                        <%# Eval("InPatientId") %>
                                                        <%# Eval("InPtAdmitDate", "{0:d}") %>
                                                    </td>
                                                    <td width="200">
                                                        <%# Eval("PtLastName") %>
                                                        ,
                                                        <%# Eval("PtFirstName") %>
                                                    </td>
                                                    <td width="75" align="left">
                                                        <%# Eval("InPtMRN") %>
                                                    </td>
                                                    <td width="100" align="left">
                                                        <img src="../Images/shim.gif" width="20" height="1"><%# Eval("InPtBedNum") %></td>
                                                    <td width="279" align="left">
                                                        <paper:PaperFormList runat="server" FormClientId='<%# Eval("StringInPatientPatientId") %>'
                                                            FormClientName='<%# Eval("StringInPatientPatientId") %>' ConfigTypeName="PaperFormConfig"
                                                            FilterByDiseaseView="false" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
<%--                                            <SeparatorTemplate>
                                                <tr>
                                                    <td height="1" colspan="6" class="ListManDataTableDottedLine">
                                                        <img src="../Images/shim.gif" width="1" height="1"></td>
                                                </tr>
                                            </SeparatorTemplate>--%>
                                        </asp:Repeater>
                                    </table>
                                </div>
                                
                                
                                
        </div>
        
        
        
    </form>
</body>
</html>
