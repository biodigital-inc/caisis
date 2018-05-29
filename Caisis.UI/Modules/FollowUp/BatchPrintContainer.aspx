<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BatchPrintContainer.aspx.cs" Inherits="Caisis.UI.Modules.FollowUp.Modules_FollowUp_BatchPrintContainer" %>

<%@ Reference Page="~/Core/PaperForms/FormsContent.aspx" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="~/Core/Help/helpToolTip.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 
<html>
<head>
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="follow-up_surveys.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
	<script src="../../ClientScripts/Help.js" type="text/javascript"></script>
	<script type="text/javascript">
		var helpArray = new Array();
		helpArray.PrintForm="<b>Reminder:</b><br>For accurate printing results, please eliminate the header and footer and set all margins to 0.25 inches (or less) in the Page Setup Dialog Box of your browser.";
	</script>
    <script type="text/javascript">  
    /* <![CDATA[ */
    function setFormTitle(title){
	    document.getElementById('formTitleSectionName').innerHTML = title;
    }

    function CheckIsIE() 
    { 
        if  (navigator.appName.toUpperCase() == 'MICROSOFT INTERNET EXPLORER')
		    { return true;} 
        else { return false; } 
    } 


    function printForm() 
    { 
        window.frames['FormsContent'].focus(); 
      
        window.frames['FormsContent'].print(); 
        
        //document.getElementById('FormsContent').contentWindow.showPrintConfirmLayer();
        
        // only show if printing surveys; not when printing labels
        if(document.getElementById('<%= RbPrintTypeLabels.ClientID %>').checked == false)
        {
            showPrintConfirmLayer();
        }
    } 

    function showPrintConfirmLayer()
    {
            //alert('fs');
            // use utilities to hide/show, center and format layer
            var div = $('confirmPrintedDiv');
            div.show();
            div.center();
    }
    function hidePrintConfirmLayer()
    {
            var div = $('confirmPrintedDiv');
            div.hide();
    }
        
    function highlightFormBatch(highlightNumber) 
    {
	    /*for( i = 1; i <= <% =currentBatch %>; i++ )
        {
		    if (highlightNumber == i)
		    {
			    document.getElementById('BatchNumber' + i.toString()).className = 'BatchPrintLinkOn';
		    }
		    else
		    {
			    document.getElementById('BatchNumber' + i.toString()).className = 'BatchPrintLinkOff';
		    }
        }*/
    } 
    
    var startNum = '<%= startSurveyNum %>';
    var endNum = '<%= endSurveyNum %>';
    function setURLHolder(urlVar, start, end)
    {
        startNum = start;
        endNum = end;
        document.getElementById('URLHolder').value = urlVar;  
//        alert("document.getElementById('URLHolder').value : " + document.getElementById('URLHolder').value );
//        alert(startNum + " and " + endNum);
        
        if (startNum == endNum)
        {
            document.getElementById('printConfirmMsg').innerText = "Did form " + startNum + " print correctly?" 
            document.getElementById('<%= SurveysRangeMessage.ClientID %>').innerText  = "Displaying form " + startNum;           
        }
        else
        {
            document.getElementById('printConfirmMsg').innerText = "Did forms " + startNum + " through " + endNum + " print correctly?" 
            document.getElementById('<%= SurveysRangeMessage.ClientID %>').innerText  = "Displaying forms " + startNum + " through " + endNum;       
        }    
        
        document.getElementById('FormsContentTR').style.display = '';
        document.getElementById('SpecifyBatchTR').style.display = 'none'; 
    }


  function ShowFormContent(show)
 {                         
    var printLabelsRB = document.getElementById('RbPrintTypeLabels');
    
    if (!printLabelsRB.checked)
    {      
        if (show)  
        {
            document.getElementById('FormsContentTR').style.display = '';
            document.getElementById('SpecifyBatchTR').style.display = 'none'; 
        }
        else
        {
            document.getElementById('FormsContentTR').style.display = 'none';
            document.getElementById('SpecifyBatchTR').style.display = ''; 
        }
    }
    
        
 }
 
    Browser.ResizeFrame( { heightOffset: 150 } );
    Browser.ResizeElement({ nodeId: 'FormsContent', heightOffset: 220 }
    );
    /* ]]> */
    </script>
  </head>
  <body>
  
  <form runat="server">

  
  <asp:HiddenField ID="URLHolder" runat="server" />
  
     <div id="confirmPrintedDiv" class="popUpConfirmationBox" style="display:none;"> 
      <div class="popUpConfirmationBoxTitle">Message</div>
      
      <br /><br />
      <span id="printConfirmMsg">Did surveys <%= startSurveyNum %> through <%= endSurveyNum %> print correctly?</span>
      <br /><br /><br />
      
      <asp:ImageButton ID="PrintedTrueBtn" runat=server ImageUrl="~/Images/YESbutton.gif" OnClick="LogPrintJob" ToolTip="Yes"/>
      &nbsp; &nbsp;
      <asp:ImageButton ID="ImageButton1" runat=server ImageUrl="~/Images/NObutton.gif" OnClientClick="hidePrintConfirmLayer()" ToolTip="No"/>
      
    </div>
     
  <uc1:helpToolTip id="HelpToolTipLayer" runat="server" />
	<table width="940" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	    <td>&nbsp;</td>
	</tr>
	<tr>
	<td width="57" valign="top"><a href="FollowUpSplash.aspx"><img border="0" src="../../Images/GoToFormsStartPage.gif" width="57" height="45" vspace="3"></a>
	</td>
  	<td>
	<table width="820" border="0" cellspacing="0" cellpadding="0" >
		<tr>
			<td colspan="4" class="ListManTitle" style="text-align:left;">Print Follow Up Material</td>
			<td valign="bottom" style="text-align:right;">
			    View:
                <custom:CaisisRadioButton runat="server" ID="RbPrintTypeSurveys" Text="Surveys/Letters" LabelClass="LabelName" Checked="True" Value="Survey" GroupName="PrintFormTypes" AutoPostBack="True" OnCheckedChanged="OnRbPrintTypeLabelsCheckChange" />
                <custom:CaisisRadioButton runat="server" ID="RbPrintTypeLabels" Text="Labels" LabelClass="LabelName" Value="Label" GroupName="PrintFormTypes" AutoPostBack="True" OnCheckedChanged="OnRbPrintTypeLabelsCheckChange" />
			    <a href="javascript:printForm();" >
			        <img id="printFormButton" src="../../Images/FormImages/Print.gif" width="60" height="23" border="0" hspace="30" onMouseOver="showToolTip('PrintForm')" onMouseOut="hideToolTip()" runat="server"/>
			    </a>
			</td>
		</tr>
        <tr>
            <td colspan="4" valign="bottom" height="17" align="left" style="white-space: nowrap;"><!-- why does this remain aligned center? -->
                    <br /><br /><asp:Label ID="BatchPrintLinks" runat="server" style="font-size: 10pt; font-weight: bold; "></asp:Label>
            </td>
            <td valign="bottom" height="17" align="left" style="white-space: nowrap; color: #00668d; " >
                    <br /><br /><asp:Label ID="SurveysRangeMessage" runat="server" style="font-size: 10pt; font-weight: bold; "></asp:Label>
            </td>
		</tr>
		<tr>
			<td colspan="6"><img src="../../Images/shim.gif" width="10" height="8"></td>
		</tr>
		<tr>
			<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
			<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="10" height="5"></td>
			<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="20" height="5"></td>
			<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="420" height="5"></td>
			<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="360" height="5"></td>
			<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
		</tr>
		<tr>
			<td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			<td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="8"></td>
			<td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
		</tr>
		<tr>
			<td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
			<td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="8"></td>
			<td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
		</tr>
		
	    <tr id="FormsContentTR" runat="server" >
	        
		        <td height="400" class="ListManBGTableLeftSide">&nbsp;</td>
		        <td colspan="4" class="ListManBGTableBody" >
		        <iframe id="FormsContent" name="FormsContent" src="PrintForms.aspx" width="850" height="350" scrolling="auto" frameborder="0" runat="server"  >
		        </iframe>
		        </td>
		        <td class="ListManBGTableRightSide">&nbsp;</td>
		    
	    </tr>
	
	
	    <tr id="SpecifyBatchTR" runat="server" style="display: none;">
	        
	            <td height="400" class="ListManBGTableLeftSide">&nbsp;</td>
	            <td colspan="4" class="ListManBGTableBody">
	                <span><asp:Label ID="SpecifyBatchLBL" runat="server" style="font-size: 10pt; font-weight: bold; " Text="Please select a batch to print above"></asp:Label>
                    </span>
                </td>
	            <td class="ListManBGTableRightSide">&nbsp;</td>
	    </tr>
		
		<tr>
			<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
			<td class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="10" height="5"></td>
			<td class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="20" height="5"></td>
			<td colspan="2" class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="1" height="1"></td>
			<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
		</tr>
	</table>
	</td></tr></table>
	<!--- don't delete this div - needed for the help functionality --->
	<div class="patientDataFormDiv" id="PDFormDiv" style="visibility: hidden;"></div>
	</form>
  </body>
</html>

