<%@ Page Language="c#" Inherits="Caisis.UI.Core.DataAnalysis.Export.DataExport" CodeFile="DataExport.aspx.cs"
    CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>DataExportForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">

    <script language="javascript">
        var imgDir = '../../../Images/Calendar/';
    </script>

    <script src="../../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <script language="javascript">
        var valAdjX = -25;
	    var valAdjY = - 48;
    </script>

    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../../ClientScripts/headerJS.js" type="text/javascript"></script>

    <script language="javascript">
		function setRadios(radioSet, radioNum)
		{
			document.getElementById('radioSet1').className = 'formTabOff';
			document.getElementById('radioSet2').className = 'formTabOff';
			document.getElementById('radioSet3').className = 'formTabOff';
			document.getElementById('radioSet4').className = 'formTabOff';
			document.getElementById('radioSet5').className = 'formTabOff';
			
			document.getElementById(radioSet).className = 'formTabOn';
		}
		function swapVisibleTables()
		{
			document.getElementById('exportWaitIcon').style.display = 'block';
			document.getElementById('exportFields').style.display = 'none';
		}
		//
		//Validates that combination of radios selected is appropriate for export. Validation also 
		//implemented server side in case clients script fails.
		//
		var toggleView = 0;
		function toggleExportView()
		{
			if (toggleView == 0)
			{
				MM_showHideLayers('ExportDiv','','show');
				MM_swapImage('toggleButton','','../../../images/ExportReturn.gif',1)
				toggleView = 1;
			}
			else
			{
				MM_showHideLayers('ExportDiv','','hide');
				MM_swapImage('toggleButton','','../../../images/SelectTablesForExport.gif',1)
				toggleView = 0;
			}
		}
		
		function validate() 
		{
		    var validated = false;
		    var dateField = document.getElementById('approvalDate').value;
		    
		    if (checkEmptyTables()) 
			{ 
				alert("Please select at least 1 table item for export.");
			}
			
		    else if(document.getElementById('privacyDeidentified').checked)
		    {
		        validated = true;
		    }
		    else if (document.getElementById('privacyLimited').checked)
		    {
		        if (document.getElementById('purpose4').checked)
		        {
		            validated = true;
		        }
		        else
		        {
		            if (dateField == '')
		            {
		                alert("Unable to export. Approval date required to export limited datasets.");
		            }
		            else
		            {
		                if (document.getElementById('approvalType1').checked || 
		                    document.getElementById('approvalType2').checked ||
		                    document.getElementById('approvalType3').checked ||
		                    document.getElementById('approvalType4').checked)
		                {
		                    validated = true;
		                }
		                else
		                {
		                    alert("Unable to export. Limited dataset requires Research Authorization, Waiver of Authorization, Data Review Preparatory To Research or Data Use Agreement from IRB.\n\nPlease resubmit when appropriate authathorization has been granted.");
		                }
		            }
		        }
		    }
		    else if (document.getElementById('privacyIdentified').checked)
		    {
		        if (document.getElementById('purpose4').checked)
		        {
		            validated = true;
		        }
		        else
		        {
		            if (dateField == '')
		            {
		                alert("Unable to export. Approval date required to export identified datasets.");
		            }
		            else
		            {
		                if (document.getElementById('approvalType1').checked || 
		                    document.getElementById('approvalType2').checked ||
		                    document.getElementById('approvalType3').checked)
		                {
		                    validated = true;
		                }
		                else
		                {
		                    alert("Unable to export. You may not export an identified dataset with the selected approval type.");
		                }
		            }
		        }
		    }
		    
		    return validated;
		}

        function validate_old()
		{
			var errors = 'false';
var dateField = document.getElementById('approvalDate').value;
			
			if(document.getElementById('privacyLimited').checked)//Limited data
			{
			    
			    // Limited data set should be exported with IRB approval type of Research Authorization,
			    // Waiver of Authorization, Data Review Preparatory To Research or Data Use Agreement
			    // AND with a valid Date
			    if(document.getElementById('purpose4').checked)
			    {
			        if( document.getElementById('approvalType5').checked )
			        {
			            errors = "true";
			            alert("Unable to export. Limited dataset requires Research Authorization, Waiver of Authorization, Data Review Preparatory To Research or Data Use Agreement from IRB.\n\nPlease resubmit when appropriate authathorization has been granted.");
			        }
			        else if (dateField == '')
			        {
			            errors = "true";
			            alert("Unable to export. Approval date required to export identified datasets.");
			        }
			    }
			    
			}
			
			// Identified data set should be exported with IRB approval type of Research Authorization,
			// Waiver of Authorization, Data Review Preparatory To Research or Data Use Agreement
			// AND with a valid Date
			else if(document.getElementById('privacyIdentified').checked)//Identified data
			{
				if(document.getElementById('approvalType4').checked || document.getElementById('approvalType5').checked)//none or data user agreeement
				{
					errors = 'true';
					alert("Unable to export. You may not export an identified dataset with the selected approval type.");
				}
				else if(dateField == '')
				{
					errors = 'true';
					alert("Unable to export. Approval date required to export identified datasets.");	
				}
			}

			if (checkEmptyTables()) 
			{ 
				errors = 'true';
				alert("Please select at least 1 table item for export.");
			}
			
			if(errors == 'false')
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		
		function confirmExport()
		{
			if(validate())
			{
			
				//var exportFormat = document.forms[0].exportMethod.options[document.forms[0].exportMethod.options.selectedIndex].text;
				//var submit = confirm('You are exporting all patients to ' + exportFormat + '. This process may take up to ten minutes. Would you like to continue?') 
				var submit = confirm('You are exporting all patients to an XML file. This process may take up to ten minutes. Would you like to continue?') 
				
				if(submit)
				{
					swapVisibleTables();
					document.forms[0].submitBool.value = true;
					document.forms[0].submit();
					
				}
				else
				{
					return false;
				}
			}
		}
		
		// Sets checkboxes in table
		function setCheckState(tableId,doCheck)
		{
		    var table = document.getElementById(tableId);
		    var rows = table.rows;
		    for(var row=0; row < rows.length; row++)
		    {
		        var cells = rows[row].cells;
		        for(var cell=0;cell<cells.length;cell++)
		        {
		            var controls = cells[cell].childNodes;
		            for(var c=0;c<controls.length;c++)
		            {
		                var node = controls[c];
	                    if (node.type == "checkbox")
	                    {
	                        node.checked = doCheck;
	                    }
		            }
		        }
		    }
		}
		
		// check page for empty checkboxes
		function checkEmptyTables() 
		{
			var myForm = document.forms[0];
			var inputField;
			for (var i=0;i<myForm.elements.length;i++)
			{
				inputField = myForm.elements[i];
				if (inputField.type == "checkbox" && inputField.checked)
				{
						// Return false when at least 1 item selected
						return false;
				}
			}
			// No checked items
			return true;
		}
    </script>

</head>
<%-- onblur="MM_swapImage('exportingImage','','../images/ExportingStatic.gif',1)" --%>
<body>
    <table width="100%">
        <tr>
            <td align="center">
                <form id="ExportForm" method="post" runat="server">
                    <!--  action="DataExportSubmit.aspx"><!-- target="NewWindow" -->
                    <input type="hidden" name="submitBool" value="false">
                    <div id="exportFields" style="overflow: auto;">
                        <img src="../../../images/shim.gif" height="1" width="1" border="0" />
                        <br />
                        <br />
                        <table width="850" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td colspan="4" class="ListManTitle">
                                    Select Parameters for Data Export</td>
                                <td valign="bottom" align="right">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <img src="../../../images/shim.gif" width="10" height="8"></td>
                            </tr>
                            <tr>
                                <td bgcolor="#f1f7fc">
                                    <img src="../../../images/ListManCornerTopLeft.gif" width="5" height="5"></td>
                                <td class="ListManagerBGTableTop">
                                    <img src="../../../images/shim.gif" width="10" height="5"></td>
                                <td class="ListManagerBGTableTop">
                                    <img src="../../../images/shim.gif" width="20" height="5"></td>
                                <td class="ListManagerBGTableTop">
                                    <img src="../../../images/shim.gif" width="430" height="5"></td>
                                <td class="ListManagerBGTableTop">
                                    <img src="../../../images/shim.gif" width="360" height="5"></td>
                                <td bgcolor="#f1f7fc">
                                    <img src="../../../images/ListManCornerTopRight.gif" width="5" height="5"></td>
                            </tr>
                            <tr>
                                <td class="ListManBGTableLeftSide">
                                    <img src="../../../images/shim.gif" width="1" height="1"></td>
                                <td colspan="4" class="ListManBGTableBody">
                                    <img src="../../../images/shim.gif" width="10" height="8"></td>
                                <td class="ListManBGTableRightSide">
                                    <img src="../../../images/shim.gif" width="1" height="1"></td>
                            </tr>
                            <tr>
                                <td class="ListManBGTableLeftSide">
                                    <img src="../../../images/shim.gif" width="1" height="1"></td>
                                <td colspan="4" class="ListManBGTableBody">
                                    <img src="../../../images/shim.gif" width="10" height="8"></td>
                                <td class="ListManBGTableRightSide">
                                    <img src="../../../images/shim.gif" width="1" height="1"></td>
                            </tr>
                            <tr>
                                <td height="300" class="ListManBGTableLeftSide">
                                    &nbsp;</td>
                                <td colspan="2" class="ListManBGTableBody">
                                    &nbsp;</td>
                                <td colspan="2" valign="top" class="ListManBGTableBody">
                                    <div class="patientDataFormDiv" id="ExportDiv" style="border-right: #000000 1px;
                                        border-top: #000000 1px; z-index: 1; visibility: hidden; overflow: auto; border-left: #000000 1px;
                                        width: 800px; border-bottom: #000000 1px; position: absolute; height: 360px;
                                        background-color: #f1f7fc; layer-background-color: #f1f7fc">
                                        <%-- <div id="exportTablesOn" style="DISPLAY: none"> --%>
                                        <table>
                                            <tr>
                                                <td colspan="6">
                                                    <span style="font-weight: bold; display: block;">
                                                        <%= disease%>
                                                        Tables</span>
                                                    <div class="checkUncheckDiv">
                                                        <a onclick="setCheckState('diseaseTables',true);" style="font-size: 1em; cursor: pointer;
                                                            color: #8d282c;">+Check All</a><a onclick="setCheckState('diseaseTables',false);"
                                                                style="padding-left: 1em; font-size: 1em; cursor: pointer; color: #8d282c;">-Uncheck
                                                                All</a></div>
                                                    <asp:CheckBoxList RepeatColumns="5" ID="diseaseTables" runat="server">
                                                    </asp:CheckBoxList>
                                                    <div class="checkUncheckDiv">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <span style="font-weight: bold; display: block;">Common Tables</span>
                                                    <div class="checkUncheckDiv">
                                                        <a onclick="setCheckState('baseTables',true);" style="font-size: 1em; cursor: pointer;
                                                            color: #8d282c;">+Check All</a><a onclick="setCheckState('baseTables',false);" style="padding-left: 1em;
                                                                font-size: 1em; cursor: pointer; color: #8d282c;">-Uncheck All</a>
                                                    </div>
                                                    <asp:CheckBoxList RepeatColumns="6" ID="baseTables" runat="server">
                                                    </asp:CheckBoxList>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <table width="810" cellspacing="0" cellpadding="8" border="0">
                                        <tr>
                                            <td style="border-right: solid 1px #e8e8e8" id="radioSet1" width="140" valign="top"
                                                class="formTabOn">
                                                <strong>Disease Type<br>
                                                    <br>
                                                    <br>
                                                </strong>
                                                <input id="diseaseAll" name="diseaseRadio" type="radio" runat="server" onclick="document.forms[0].submit()"
                                                    value="All" />
                                                All<br />
                                                <input id="diseaseBladder" name="diseaseRadio" type="radio" onclick="document.forms[0].submit()"
                                                    runat="server" value="Bladder" />
                                                Bladder<br>
                                                <input id="diseaseBreast" name="diseaseRadio" type="radio" onclick="document.forms[0].submit()"
                                                    runat="server" value="Breast">
                                                Breast<br>
                                                <input id="diseaseColorectal" name="diseaseRadio" type="radio" onclick="document.forms[0].submit()"
                                                    runat="server" value="Colorectal">
                                                Colorectal<br>
                                                <input id="diseaseGastric" name="diseaseRadio" type="radio" onclick="document.forms[0].submit()"
                                                    runat="server" value="Gastric">
                                                Gastric<br>
                                                <input id="diseaseKidney" name="diseaseRadio" type="radio" onclick="document.forms[0].submit()"
                                                    runat="server" value="Kidney" />
                                                Kidney<br>
                                                <input id="diseasePancreas" name="diseaseRadio" type="radio" onclick="document.forms[0].submit()"
                                                    runat="server" value="Pancreas">
                                                Pancreas<br>
                                                <input id="diseaseProstate" name="diseaseRadio" type="radio" value="Prostate" runat="server"
                                                    onclick="document.forms[0].submit()" checked />
                                                Prostate<br>  
                                                <input id="diseaseTestis" name="diseaseRadio" type="radio" onclick="document.forms[0].submit()"
                                                    runat="server" value="Testis" />
                                                Testis<br>
                                                <input id="diseaseThyroid" name="diseaseRadio" type="radio" onclick="document.forms[0].submit()"
                                                    runat="server" value="Thyroid">
                                                Thyroid
                                            </td>
                                            <td style="border-right: solid 1px #e8e8e8;" id="radioSet2" width="140" valign="top"
                                                class="formTabOn">
                                                <strong>Dataset Privacy Level<br>
                                                    <br>
                                                    <br>
                                                </strong>
                                                <input id="privacyDeidentified" name="privacyRadio" runat="server" type="radio" onclick="document.forms[0].submit()"
                                                    value="Deidentified" checked>
                                                De-Identified<br>
                                                <input id="privacyLimited" name="privacyRadio" runat="server" type="radio" onclick="document.forms[0].submit()"
                                                    value="Limited">
                                                Limited<br>
                                                <input id="privacyIdentified" name="privacyRadio" runat="server" type="radio" onclick="document.forms[0].submit()"
                                                    value="Identified">
                                                Identified<br>
                                            </td>
                                            <td style="border-right: solid 1px #e8e8e8;" id="radioSet3" width="240" valign="top"
                                                class="formTabOn">
                                                <strong>Dataset Purpose<br>
                                                    <br>
                                                    <br>
                                                </strong>
                                                <input id="purpose1" name="purposeRadio" runat="server" type="radio" value="Data Exploration"
                                                    checked>
                                                Data Exploration<br>
                                                <input id="purpose2" name="purposeRadio" runat="server" type="radio" value="Data Review Preparatory To Research">
                                                Data Review Preparatory To Research<br>
                                                <input id="purpose3" name="purposeRadio" runat="server" type="radio" value="Research Data Analysis">
                                                Research Data Analysis<br>
                                                <input id="purpose4" name="purposeRadio" runat="server" type="radio" value="Operations Data Analysis">
                                                Operations Data Analysis<br>
                                            </td>
                                            <td id="radioSet4" width="240" valign="top" class="formTabOn">
                                                <strong>Institution Review Board<br>
                                                    Approval Type<br>
                                                    <br>
                                                </strong>
                                                <input id="approvalType1" name="approvalTypeRadio" runat="server" type="radio" value="Research Authorization"
                                                    checked>
                                                Research Authorization<br>
                                                <input id="approvalType2" name="approvalTypeRadio" runat="server" type="radio" value="Waiver of Authorization">
                                                Waiver of Authorization<br>
                                                <input id="approvalType3" name="approvalTypeRadio" runat="server" type="radio" value="Data Review Preparatory To Research">
                                                Data Review Preparatory To Research<br>
                                                <input id="approvalType4" name="approvalTypeRadio" runat="server" type="radio" value="Data Use Agreement">
                                                Data Use Agreement<br>
                                                <input id="approvalType5" name="approvalTypeRadio" runat="server" type="radio" value="None">
                                                None<br>
                                                <br>
                                                <img src="../../../images/shim.gif" width="15">IRB approval date:<br>
                                                <img src="../../../images/shim.gif" width="17"><input type="text" runat="server"
                                                    style="width: 80" onblur="isDate(this.value);" id="approvalDate" name="approvalDate">
                                                <img src="../../../Images/calendar/cal.gif" id="calendarGif" align="absMiddle" hspace="3"
                                                    width="16" height="16" onclick="showCal(this, document.getElementById('approvalDate'));" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="privacyRules" colspan="4">
                                                <strong>Data Export Privacy Rules</strong>
                                                <ul style="list-style-type: disc; margin-top: 0px">
                                                    <li>"De-Identified" and "Operations Data Analysis" datasets are always allowed. </li>
                                                    <li>"Limited" datasets are allowed with a "Data Use Agreement" and "IRB Approval Date"
                                                        and under the following rules for "Identified" datasets. </li>
                                                    <li>"Identified" datasets that are not for "Operations Data Analysis" purpose are only
                                                        allowed with a "Research Authorization", "Waiver of Authorization" or "Data Review
                                                        Preparatory To Research" authorization and "IRB Approval Date".</li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                </td>
                                <td class="ListManBGTableRightSide">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td bgcolor="#f1f7fc">
                                    <img src="../../../images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
                                <td class="ListManagerBGTableBottom">
                                    <img src="../../../images/shim.gif" width="10" height="5"></td>
                                <td class="ListManagerBGTableBottom">
                                    <img src="../../../images/shim.gif" width="20" height="5"></td>
                                <td colspan="2" class="ListManagerBGTableBottom">
                                    <img src="../../../images/shim.gif" width="1" height="1"></td>
                                <td bgcolor="#f1f7fc">
                                    <img src="../../../images/ListManCornerBottomRight.gif" width="5" height="5"></td>
                            </tr>
                            <tr>
                                <td colspan="4" valign="bottom">
                                    <img src="../../../images/shim.gif" width="40" height="1">
                                    <a onclick="toggleExportView();">
                                        <img id="toggleButton" name="toggleButton" src="../../../images/SelectTablesForExport.gif"
                                            width="153" height="22" align="absbottom" style="cursor: pointer;"></a>
                                </td>
                                <!--<option value="access">Access Database</option>-->
                                <td colspan="2" align="right" height="20" valign="top">
                                    <%-- %>Export Format:
                                    <select id="exportMethod" runat="server" name="exportMethod">
                                        <option value="xmlWithSchema">XML for Access</option>
                                        <option value="xmlOnly" selected>XML (without schema)</option>
                                    </select> --%>
                                    <img src="../../../images/shim.gif" width="10">
                                    <%--<asp:Button ID="submitBtn" OnCommand="onSubmitBtnCommand" Runat=server Text="Run Export"></asp:Button>--%>
                                    <span style="color:#8d2a2c; font-weight:bold"><asp:Label ID="InvalidPermissionMsg" runat="server"></asp:Label></span>
                                    <img src="../../../images/RunExport.gif" visible="false" id="ExportBtn" runat="server" align="absbottom" width="85" height="22"
                                        onclick="confirmExport();" style="cursor: pointer;">
                                    <!--<input type="button" onclick="confirmExport();" Value="Run Export">-->
                                    <img src="../../../images/shim.gif" width="40">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="exportWaitIcon" style="display: none">
                        <table width="90%">
                            <tr>
                                <%---	<td colspan="2" align=center><img id="exportingImage" name="exportingImage" src="../../../images/Exporting.gif" height="112" width="284" vspace="50"></td> ---%>
                                <td width="18%">
                                    &nbsp;</td>
                                <td>
                                    <img id="exportingImage" name="exportingImage" src="../../../images/ExportingStatic.gif"
                                        height="112" width="284"><br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td width="18%">
                                    &nbsp;</td>
                                <td style="font-size: 12px">
                                    <br>
                                    <br>
                                    <strong>To complete your download:</strong><br>
                                    1) When the dialogue box pops up, click "Save" the file to disk. Do NOT "Open" the
                                    file directly or the export will fail.<br>
                                    2) Save the .xml file to your local drive.<br>
                                    3) When download is complete, if another dialogue box appears, either click "Close"
                                    or "Open Folder" - do NOT click "Open".<br>
                                    <br>
                                    <br>
                                    <strong>To import the XML to Microsoft Access 2007:</strong>
                                    <br>
                                    1) Open Access
                                    <br>
                                    2) Create a new database
                                    <br>
                                    3) In Access 2007: From the External Data Tab, choose "XML File"
                                    from the Import section of the Ribbon.
                                    <br>
                                    4) Find the .xml file you just downloaded and click "Import" or "OK"
                                    <br>
                                    5) Click "Okay" to accept the defaults
                                    <br>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </td>
        </tr>
</body>
</html>
