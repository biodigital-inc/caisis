<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSpecimenAccessionsPathology" CodeFile="ProstateSpecimenAccessionsPathology.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ProstateSpecimenAccessionsPathology" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>


<table cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="ProstateSpecimenAccessionsPathologyHtmlTable">
    
    <tr>
        <td style="white-space: nowrap;" ><span class="controlBoxTitle">Anatomic Site of Primary Tumor: </span>
            <euc:EformComboBox Width="150px"  Runat="server" RecordId="1" ID="PathSite_1" TABLE="Pathology" FIELD="PathSite" LookupCode="BxSite,Disease,Prostate" />  		    
        </td>
   </tr>        
    <tr>
        <td style="white-space: nowrap;" ><span class="controlBoxTitle">Histology of Primary Tumor Site: </span>
            <euc:EformComboBox Width="150px"  Runat="server" RecordId="1" ID="PathHistology_1" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,Prostate" />  		    
        </td>
   </tr>        
</table>

<br /><br /><br />

<span class="controlBoxTitle">Best AJCC Pathological Stage at Initial Diagnosis</span>
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PathStagesHtmlTable">
   
          <tr>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Primary Tumor (T)</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Regional Lymph Nodes (N) </td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Distant Metastasis (M)</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Group</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Grade</td>
				<td height="10%" class="controlBoxDataGridTitleColumn">&nbsp;</td> 
		  </tr>
          <tr>
			
			<td>	
				<euc:EformHidden Enabled="false" RecordId="1" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_1" Runat="server" Value="Prostate"/>			    
                <euc:EformHidden Enabled="false" RecordId="1" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_1" Value="AJCC_02" Runat="server" />

				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="1" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_1" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"  /></td>
		    <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="1" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_1" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="1" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_1" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="1" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_1" LookupCode="PathStageGroup,Disease,Prostate" Runat="server"   EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="1" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_1" LookupCode="PathGrade,Disease,Prostate" Runat="server"   EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
          </tr>   
</table>

<br /><br /><br />

<table cellpadding="5" cellspacing="2" class="eformLargePopulatedTableBlue" >
    <tr>
        <td align="center">
            <span class="controlBoxTitle">Pathological Gleason Score of Primary Tumor ?</span></td>
    </tr>
    <tr>
        <td height="28" align="center">
            <euc:EformRadioButtonList ID="PathGleasonScoreRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="PathGleasonScoreRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>Not Available</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr>
        <td align="center">
            <div id="PathGleasonScoreDiv" runat="server" style="display: none;">
            <table border="0" cellspacing="0" cellpadding="4" class="ClinicalEformTable" id="ProstatectomyPathFindingHtmlTable">
			            <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" align="left">GG1</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="left">GG2</td>
                            <td class="controlBoxDataGridHeaderFirstCol" align="left">GGS</td>
                            <%--<td class="controlBoxDataGridHeaderFirstCol" align="left">Result</td>--%>
                            <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>
                        </tr>
                        <tr >
				            <td style="white-space:nowrap;" valign="baseline" align="center"><euc:EformTextBox Width="35px" RecordId="1" ParentRecordId="1" TABLE="ProstatectomyPath" FIELD="PathGG1" Runat="server" ID="PathFindGG1_1"/></td>
				            <td style="white-space:nowrap;" valign="baseline" align="center"><euc:EformTextBox Width="35px" RecordId="1" ParentRecordId="1" TABLE="ProstatectomyPath" FIELD="PathGG2" Runat="server" ID="PathFindGG2_1"/></td>
				            <td style="white-space:nowrap;" valign="baseline" align="center"><euc:EformTextBox Width="35px" RecordId="1" ParentRecordId="1" TABLE="ProstatectomyPath" FIELD="PathGGS" Runat="server" ID="PathFindGGS_1"/></td>
				            <td style="white-space:nowrap;" valign="baseline" align="center"><%--<euc:EformSelect DropDownWidth="auto"    RecordId="1" ParentRecordId="1" TABLE="ProstatectomyPathFinding" FIELD="PathFindResult" ID="PathFindResult_1" Runat="server" LookupCode="ResultProstate" />--%>
				                                                                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="1" TABLE="Pathology" FIELD="PathResult" ID="PathResult_1" Runat="server" /></td>	
                            <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td> 
                        </tr>

            </table>
            </div>        
        </td>
    </tr>
</table>
<br /><br /><br />


<span class="controlBoxTitle">Biopsy Cores</span>
<table cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="Table1">
    
    <tr>
        <td style="white-space: nowrap;" ><strong>Number of Cores Taken: </strong>
            <euc:EformTextBox RecordId="1" ParentRecordId="1" TABLE="ProstateBiopsyPath" FIELD="PathNumCores" ID="PathNumCores" ShowNumberPad="True" style="width:50;"  Runat="server" />            		    
        </td>
   </tr>        
    <tr>
        <td style="white-space: nowrap;" ><strong>Number of Positive Cores: </strong>
            <euc:EformTextBox RecordId="1" ParentRecordId="1" TABLE="ProstateBiopsyPath" FIELD="PathPosCores" ID="PathPosCores" ShowNumberPad="True"  style="width:50;"  Runat="server" />  		    
        </td>
   </tr>        
</table>


<br/><br/><br/>

<script type="text/javascript">

    addAbsentEvent($('<%= PathGleasonScoreRecorded.ClientID %>'),$('<%= PathGleasonScoreDiv.ClientID %>'),$('<%= PathFindGG1_1.ClientID %>'),$('<%= PathFindGG2_1.ClientID %>'),$('<%= PathFindGGS_1.ClientID %>'),$('<%= PathResult_1.ClientID %>'));

    function addAbsentEvent(pathGleasonScoreRecordedID,pathGleasonScoreDivID,pathFindgg1ID,pathFindgg2ID,pathFindggSID,pathResultID)
    {  
        $(pathGleasonScoreRecordedID).addEvent('click',curry(GleasonYesNo,pathGleasonScoreRecordedID,pathGleasonScoreDivID,pathFindgg1ID,pathFindgg2ID,pathFindggSID,pathResultID));
 
       
        // check on load as well
       GleasonYesNo(pathGleasonScoreRecordedID,pathGleasonScoreDivID,pathFindgg1ID,pathFindgg2ID,pathFindggSID,pathResultID);

    }
    
    function GleasonYesNo(pathGleasonScoreRecordedID,pathGleasonScoreDivID,pathFindgg1ID,pathFindgg2ID,pathFindggSID,pathResultID)
    {
       var pathGleasonScoreRecordedRef = pathGleasonScoreRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < pathGleasonScoreRecordedRef.length; i++) 
        if (pathGleasonScoreRecordedRef[i].checked) {  
            GleasonRadioClick(pathGleasonScoreRecordedRef[i].value,pathGleasonScoreDivID,pathFindgg1ID,pathFindgg2ID,pathFindggSID,pathResultID);
            }
    }
    
   
    function GleasonRadioClick(Gleasonoption_value,GleasonhideDiv,pathFindgg1ID,pathFindgg2ID,pathFindggSID,pathResultID)
    {
      if (Gleasonoption_value == "Yes")
      { 
       GleasonhideDiv.style.display='block';
      } 
      else if (Gleasonoption_value == "Unknown" || Gleasonoption_value == "Not Available")
      {
        GleasonhideDiv.style.display='none';
        
        pathFindgg1ID.value = '';
        pathFindgg2ID.value = '';
        pathFindggSID.value = '';
        pathResultID.value = "Gleason Score " + Gleasonoption_value;
      }      
    }
</script>