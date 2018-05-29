<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandPathology" CodeFile="SalivaryGlandPathology.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="SalivaryGlandPathology" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Surgical Pathology"></asp:Label><br/>
<table  border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="SalivaryGlandPathologyHtmlTable" > 

           <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Accession Number</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Result</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Histology</td>
          </tr>
          <tr>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="100px" RecordId="16" ParentRecordId="16"  TABLE="Pathology" FIELD="PathNum" ID="PathNum_16" Runat="server" ShowCalendar="false" CalcDate="false" /></td>
            <td style="white-space: nowrap;">
                <euc:EformDropDownList  Width="100px" RecordId="16" ParentRecordId="16"  TABLE="Pathology" FIELD="PathResult" ID="PathResult_16"   Runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Positive" Text="Positive"></asp:ListItem>
                    <asp:ListItem Value="Negative" Text="Negative"></asp:ListItem>
                    <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
                </euc:EformDropDownList></td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="220px" RecordId="16" ParentRecordId="16" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_16" Runat="server" ShowEmptyListItem="true" LookupCode="PathHistologyHeadNeckSalivary" /> </td>

          </tr>         
</table>
<br /><br />

<strong>Head and Neck Pathology</strong>
<table  border="0" cellpadding="6" cellspacing="5" class="eformLargePopulatedTable" id="SalivaryGlandPathologyHtmlTable2" > 

    <tr>
        <td align="left" valign="top" ><strong>Invasion Site</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="16" TABLE="HeadNeckPath" FIELD="PathTumorInv" ID="PathTumorInv" LookupCode="DxTarget,Disease,HeadNeck" Runat="server"  /></td>
        
        <td align="left" valign="top" ><strong>Depth of Invasion  </strong><br /> 
            <euc:EformTextBox style="width: 100px;" RecordId="1" ParentRecordId="16" TABLE="HeadNeckPath" FIELD="PathInvasionDepth" ID="PathInvasionDepth" Runat="server"  /></td>

        <td align="left" valign="top" ><strong>Vascular Invasion</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="16"  TABLE="HeadNeckPath" FIELD="PathVascularInv" ID="PathVascularInv" LookupCode="YesNoUnknown" Runat="server"  /></td>

        <td align="left" valign="top" ><strong>Neural Invasion</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="16"  TABLE="HeadNeckPath" FIELD="PathPerineuralInv" ID="PathPerineuralInv" LookupCode="YesNoUnknown" Runat="server"  /></td>

    </tr>
    <tr>
        <td align="left" valign="top" ><strong>Margin Status</strong><br /> 
            <euc:EformDropDownList style="width: 100px;" RecordId="1" ParentRecordId="16"  TABLE="HeadNeckPath" FIELD="PathMargin" ID="PathMargin" Runat="server" ShowEmptyListItem="true"  >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Negative" Text="Negative"></asp:ListItem>
                <asp:ListItem Value="Close" Text="Close"></asp:ListItem>
                <asp:ListItem Value="Microscopic" Text="Microscopic"></asp:ListItem>
                <asp:ListItem Value="Gross" Text="Gross"></asp:ListItem>
                <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
            </euc:EformDropDownList></td>

         <td align="left" valign="top" ><strong>Tumor Max Dim (cm)</strong><br /> 
            <euc:EformTextBox style="width: 100px;" RecordId="1" ParentRecordId="16"  TABLE="HeadNeckPath" FIELD="PathTumorMaxDim" ID="PathTumorMaxDim" Runat="server"   /></td>

        <td align="left" valign="top" ><strong>Extra-Capsular Spread</strong><br /> 
            <euc:EformDropDownList style="width: 100px;" RecordId="1" ParentRecordId="16"  TABLE="HeadNeckPath" FIELD="PathExtension" ID="PathExtension" Runat="server" ShowEmptyListItem="true"  >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="None" Text="None"></asp:ListItem>
                <asp:ListItem Value="Microscopic" Text="Microscopic"></asp:ListItem>
                <asp:ListItem Value="Gross" Text="Gross"></asp:ListItem>
                <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
            </euc:EformDropDownList></td>
 
         <td align="left" valign="top" ><strong>Grade</strong><br /> 
            <euc:EformDropDownList style="width: 100px;" RecordId="1" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade" Runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Low" Text="Low"></asp:ListItem>
                <asp:ListItem Value="Microscopic" Text="Microscopic"></asp:ListItem>
                <asp:ListItem Value="Well to Moderate" Text="Low to Intermediate"></asp:ListItem>
                <asp:ListItem Value="Intermediate" Text="Intermediate"></asp:ListItem>
                <asp:ListItem Value="Moderate to Poor" Text="Intermediate to High"></asp:ListItem>
                <asp:ListItem Value="High" Text="High"></asp:ListItem>
                <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
            </euc:EformDropDownList>
            
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindSite" runat="server" RecordId="1" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindSite"/>             
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindSide" runat="server" RecordId="1" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindSide"/>             
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindSubsite" runat="server" RecordId="1" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindSubsite"/>             
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindHistology" runat="server" RecordId="1" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindHistology"/>             
            	
            	<euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="PathSite_16" TABLE="Pathology" FIELD="PathSite" />  		    
                <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="16" ParentRecordId="16" ID="PathSide_16" TABLE="Pathology" FIELD="PathSide" />
                <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="16" ParentRecordId="16" ID="PathSubsite_16" TABLE="Pathology" FIELD="PathSubsite"  />  		    
            </td>
      
    </tr>

</table>
<br /><br /><br />


<script type="text/javascript">
    /* <![CDATA[ */
 
     addAbsentEvent($('<%= PathHistology_16.ClientID %>'),$('<%= PathFindGrade.ClientID %>'),$('<%= PathFindSite.ClientID %>'),$('<%= PathFindSide.ClientID %>'),$('<%= PathFindSubsite.ClientID %>'),$('<%= PathFindHistology.ClientID %>'),$('<%= PathSite_16.ClientID %>').value,$('<%= PathSide_16.ClientID %>').value,$('<%= PathSubsite_16.ClientID %>').value);
   
    function addAbsentEvent(pathHistology,pathFindGrade,pathFindSiteHidden,pathFindSideHidden,pathFindSubsiteHidden,pathFindHistologyHidden,pathSiteValue,pathSideValue,pathSubsiteValue)
    {  
        $(pathHistology).addEvent('blur',curry(SetHiddenFields,pathHistology,pathFindGrade,pathFindSiteHidden,pathFindSideHidden,pathFindSubsiteHidden,pathFindHistologyHidden,pathSiteValue,pathSideValue,pathSubsiteValue));
        $(pathFindGrade).addEvent('blur',curry(SetHiddenFields,pathHistology,pathFindGrade,pathFindSiteHidden,pathFindSideHidden,pathFindSubsiteHidden,pathFindHistologyHidden,pathSiteValue,pathSideValue,pathSubsiteValue));
    }

   
    /* ]]> */
    
    function SetHiddenFields(pathHistology,pathFindGrade,pathFindSiteHidden,pathFindSideHidden,pathFindSubsiteHidden,pathFindHistologyHidden,pathSiteValue,pathSideValue,pathSubsiteValue)
	{
	    if (pathFindGrade.value != '')
	    {
	        pathFindSiteHidden.value = pathSiteValue;
	        pathFindSideHidden.value = pathSideValue;
	        pathFindSubsiteHidden.value = pathSubsiteValue;
	        pathFindHistologyHidden.value = pathHistology.value;
	    }
	    else
	    {
	        pathFindSiteHidden.value = '';
	        pathFindSideHidden.value = '';
	        pathFindSubsiteHidden.value = '';
	        pathFindHistologyHidden.value = '';	    
	    }

	}
	
</script>