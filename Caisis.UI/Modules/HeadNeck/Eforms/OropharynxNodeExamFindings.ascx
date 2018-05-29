<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxNodeExamFindings" CodeFile="OropharynxNodeExamFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="OropharynxNodeExamFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=" "></asp:Label><br/>

<table width="648" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width: 301px; vertical-align: top;">
		<span class="controlBoxTitle">Left Node</span>
		<table border="0" cellspacing="0" cellpadding="0" width="200" >
		<tr>
		    <td>
		    <table border="0" cellspacing="0" cellpadding="16" width="200" class="eformLargePopulatedTableBlue">
		
		 <tr >
			<td  style="padding-top: 20px;"><strong>Max Dimension (cm)</strong><br />
		        <euc:EformTextBox Width="100px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="1" Field="ExamFindMaxDim" id="ExamFindMaxDim_L" runat="server" /></td>
 		    
        </tr>
        
        <tr>
         		    <td><strong>Result</strong><br />
	            <euc:EformDropDownList Width="100px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="1" Field="ExamFindResult" id="ExamFindResult_L" runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                <asp:ListItem Value="Single" Text="Single"></asp:ListItem>
	                <asp:ListItem Value="Multiple" Text="Multiple"></asp:ListItem>
	            </euc:EformDropDownList></td>
        </tr>
        <tr>
			<td  >
		        <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="1" Field="ExamFindSide" id="ExamFindSide_L" runat="server" />
				
		        <strong>Site</strong><br />
		        <euc:EformExtendedCheckBoxList LookupCode="NodeSite,Disease,HeadNeck" Table="EncNodeExamFinding" ShowOther="true" ParentRecordId="1"  RecordId="1" Field="ExamFindSite" id="ExamFindSite_L" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
		        </euc:EformExtendedCheckBoxList></td>	        
		</tr>

		</table>
		    </td>
		    <%--<td style="width: 11px; background-color: #3D556D; padding: 2px;"><img src="../../Images/VerticalSideMarker_Left.gif" /><br /><img src="../../Images/VerticalSideMarker_Left.gif" style="margin-top: 300px;" /></td>--%>
		</tr>
		</table>

		
		
	</td>
    <td style="width: 36px;">&nbsp;</td>
    <td style="width: 311px; vertical-align: top;">
	
	
	
		<span class="controlBoxTitle">Right Node</span>
<table border="0" cellspacing="0" cellpadding="0" width="200">
		<tr>
		    <%--<td style="width: 11px; background-color: #666666; padding: 2px;"><img src="../../Images/VerticalSideMarker_Right.gif" /><br /><img src="../../Images/VerticalSideMarker_Right.gif" style="margin-top: 300px;" /></td>--%>
		    <td>
		    <table border="0" cellspacing="0" cellpadding="16" width="200" class="eformLargePopulatedTable">

		 <tr >
			<td  style="padding-top: 20px;"><strong>Max Dimension (cm)</strong><br />
		        <euc:EformTextBox Width="100px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="2" Field="ExamFindMaxDim" id="ExamFindMaxDim_R" runat="server" /></td>
        </tr>
        
        <tr>
 		    <td><strong>Result</strong><br />
	            <euc:EformDropDownList Width="100px" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="2" Field="ExamFindResult" id="ExamFindResult_R" runat="server"  ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                <asp:ListItem Value="Single" Text="Single"></asp:ListItem>
	                <asp:ListItem Value="Multiple" Text="Multiple"></asp:ListItem>
	            </euc:EformDropDownList></td>
        </tr>
		
		 <tr >
		 
			
            <td  >
	            <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="2" Field="ExamFindSide" id="ExamFindSide_R" runat="server" />
    			
	            <strong>Site</strong><br />
	            <euc:EformExtendedCheckBoxList LookupCode="NodeSite,Disease,HeadNeck" Table="EncNodeExamFinding" ShowOther="true" ParentRecordId="1"  RecordId="2" Field="ExamFindSite" id="ExamFindSite_R" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
	            </euc:EformExtendedCheckBoxList>


            </td>
		</tr>

		</table>
		    </td>
		</tr>
    </table>
	</td>
  </tr>
</table>
<br/><br/><br/>


<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls
    function addEvents(maxDim, nodeSiteID, nodeSideID, nodeResultID,sideValue)
    { 
        $(maxDim).addEvent('blur',curry(SetNodeFindings, maxDim, nodeSiteID, nodeSideID, nodeResultID,sideValue));
       $(nodeSiteID).addEvent('click',curry(SetNodeFindings, maxDim, nodeSiteID, nodeSideID, nodeResultID,sideValue));
        $(nodeResultID).addEvent('blur',curry(SetNodeFindings ,maxDim, nodeSiteID, nodeSideID, nodeResultID,sideValue));
   }

    addEvents($('<%= ExamFindMaxDim_L.ClientID %>'),$('<%= ExamFindSite_L.ClientID %>'),$('<%= ExamFindSide_L.ClientID %>'),$('<%= ExamFindResult_L.ClientID %>'),'Left');
    addEvents($('<%= ExamFindMaxDim_R.ClientID %>'),$('<%= ExamFindSite_R.ClientID %>'),$('<%= ExamFindSide_R.ClientID %>'),$('<%= ExamFindResult_R.ClientID %>'),'Right');
 
    /* ]]> */
    
function SetNodeFindings(maxDim, nodeSiteID, nodeSideID, nodeResultID,sideValue)
{
    var cbl = nodeSiteID.getElementsByTagName('input');

    nodeSideID.value = '';
     for(i=0; i< cbl.length; i++)  
     {
        if (cbl[i].checked)
        {
            nodeSideID.value = sideValue;
            break;
        }
     }

}
</script>