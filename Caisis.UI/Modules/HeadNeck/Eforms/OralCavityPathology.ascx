<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OralCavityPathology" CodeFile="OralCavityPathology.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="OralCavityPathology" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Primary Tumor"></asp:Label><br/>
<table  border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="OralCavityPathologyHtmlTable" > 

           <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Accession Number</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Result</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Received</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;</td>
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
                <euc:EformRadioButtonList RecordId="16" ParentRecordId="16" TABLE="Pathology" FIELD="PathSpecimenCollection" ID="PathSpecimenCollection_16" Runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" >
                    <asp:ListItem Value="Fresh" Text="Fresh"></asp:ListItem>
                    <asp:ListItem Value="Formalin" Text="Formalin"></asp:ListItem>
                    <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
                </euc:EformRadioButtonList> </td>
          </tr>         
           <tr>
			    <td colspan="2" class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Primary Histology</td>
                <td colspan="2" class="controlBoxDataGridTitleColumn" style="text-align: left;" >Secondary Histology</td>
          </tr>
          <tr>
            <td colspan="2" valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="220px" RecordId="16" ParentRecordId="16" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_16" Runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Squamous Cell Carcinoma" Text="Squamous Cell Carcinoma"></asp:ListItem>
                    <asp:ListItem Value="Basal Cell Carcinoma" Text="Basal Cell Carcinoma"></asp:ListItem>
                    <asp:ListItem Value="Malignant Melanoma" Text="Malignant Melanoma"></asp:ListItem>
                    <asp:ListItem Value="Adenoid Cystic Carcinoma" Text="Adenoid Cystic Carcinoma"></asp:ListItem>
                    <asp:ListItem Value="Acinic Cell Carcinoma" Text="Acinic Cell Carcinoma"></asp:ListItem>
                    <asp:ListItem Value="Sarcoma" Text="Sarcoma"></asp:ListItem>
                    <asp:ListItem Value="Lymphoma" Text="Lymphoma"></asp:ListItem>
                </euc:EformDropDownList> </td>
            <td colspan="2" valign="top" style="white-space: nowrap;">
                <euc:EformDropDownList Width="220px" RecordId="16" ParentRecordId="16" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_16" Runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Squamous Cell Carcinoma" Text="Squamous Cell Carcinoma"></asp:ListItem>
                    <asp:ListItem Value="Basal Cell Carcinoma" Text="Basal Cell Carcinoma"></asp:ListItem>
                    <asp:ListItem Value="Malignant Melanoma" Text="Malignant Melanoma"></asp:ListItem>
                    <asp:ListItem Value="Adenoid Cystic Carcinoma" Text="Adenoid Cystic Carcinoma"></asp:ListItem>
                    <asp:ListItem Value="Acinic Cell Carcinoma" Text="Acinic Cell Carcinoma"></asp:ListItem>
                    <asp:ListItem Value="Sarcoma" Text="Sarcoma"></asp:ListItem>
                    <asp:ListItem Value="Lymphoma" Text="Lymphoma"></asp:ListItem>
                </euc:EformDropDownList> </td>

          </tr> 
</table>
<br /><br />

<strong>Head and Neck Pathology</strong>
<table  border="0" cellpadding="6" cellspacing="5" class="eformLargePopulatedTable" id="OralCavityPathologyHtmlTable2" > 

    <tr>
        <td align="left" valign="top" ><strong>Structures Invaded</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="16" TABLE="HeadNeckPath" FIELD="PathTumorInv" ID="PathTumorInv" LookupCode="DxTarget,Disease,HeadNeck" Runat="server"  /></td>
        
        <td align="left" valign="top" ><strong>Depth of Invasion</strong><br />
            <euc:EformTextBox style="width: 100px;" RecordId="1" ParentRecordId="16" TABLE="HeadNeckPath" FIELD="PathInvasionDepth" ID="PathInvasionDepth" Runat="server" /></td>
        

        <td align="left" valign="top" ><strong>Vascular Invasion</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="16"  TABLE="HeadNeckPath" FIELD="PathVascularInv" ID="PathVascularInv" LookupCode="YesNoUnknown" Runat="server"  /></td>

        <td align="left" valign="top" ><strong>Neural Invasion</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="16"  TABLE="HeadNeckPath" FIELD="PathPerineuralInv" ID="PathPerineuralInv" LookupCode="YesNoUnknown" Runat="server"  /></td>

    </tr>
    <tr>
        <td align="left" valign="top" ><strong>Bone Invasion</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="16"  TABLE="HeadNeckPath" FIELD="PathBoneInv" ID="PathBoneInv" LookupCode="YesNoUnknown" Runat="server"  /></td>

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

        <%--<td align="left" valign="top" ><strong>Extra-Capsular Spread</strong><br /> 
            <euc:EformDropDownList style="width: 100px;" RecordId="1" ParentRecordId="16"  TABLE="HeadNeckPath" FIELD="PathExtension" ID="PathExtension" Runat="server" ShowEmptyListItem="true"  >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="None" Text="None"></asp:ListItem>
                <asp:ListItem Value="Microscopic" Text="Microscopic"></asp:ListItem>
                <asp:ListItem Value="Gross" Text="Gross"></asp:ListItem>
                <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
            </euc:EformDropDownList></td>--%>
 
      
    </tr> 
    
    <tr>
  
    </tr>

</table>

<br />
<br />

<strong>Description of Tumor</strong>
<table  border="0" cellpadding="6" cellspacing="5" class="eformLargePopulatedTable" id="Table1" >

    <tr>
           <td align="left" valign="top" ><strong>Grade</strong><br /> 
            <euc:EformDropDownList Width="200px" RecordId="1" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_1" Runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Poorly Differentiated" Text="Poorly Differentiated"></asp:ListItem>
                <asp:ListItem Value="Poorly to Moderately Differentiated" Text="Poorly to Moderately Differentiated"></asp:ListItem>
                <asp:ListItem Value="Moderately Differentiated" Text="Moderately Differentiated"></asp:ListItem>
                <asp:ListItem Value="Intermediate" Text="Intermediate"></asp:ListItem>
                <asp:ListItem Value="Moderately to Well Differentiated" Text="Moderately to Well Differentiated"></asp:ListItem>
                <asp:ListItem Value="Well Differentiated" Text="Well Differentiated"></asp:ListItem>
                <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
            </euc:EformDropDownList>
            
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindSite_1" runat="server" RecordId="1" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindSite"/>             
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindSide_1" runat="server" RecordId="1" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindSide"/>             
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindSubsite_1" runat="server" RecordId="1" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindSubsite"/>             
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindHistology_1" runat="server" RecordId="1" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindHistology"/>             
            	
            	<euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="PathSite_16" TABLE="Pathology" FIELD="PathSite" />  		    
                <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="16" ParentRecordId="16" ID="PathSide_16" TABLE="Pathology" FIELD="PathSide" />
                <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="16" ParentRecordId="16" ID="PathSubsite_16" TABLE="Pathology" FIELD="PathSubsite"  />  		    
            </td>
           <td align="left" valign="top" ><strong>Height (cm)</strong><br /> 
                <euc:EformTextBox Width="50px" RecordId="1" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindHeight" ID="PathFindHeight_1" Runat="server"  />
            </td>
           <td align="left" valign="top" ><strong>Length (cm)</strong><br /> 
                <euc:EformTextBox Width="50px" RecordId="1" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindLength" ID="PathFindLength_1" Runat="server"  /></td>
           <td align="left" valign="top" ><strong>Width (cm)</strong><br /> 
                <euc:EformTextBox Width="50px" RecordId="1" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindWidth" ID="PathFindWidth_1" Runat="server"  /></td>
  
    </tr>

</table>

<br /><br />

<strong>Description of Gross Specimen </strong>
<table  border="0" cellpadding="6" cellspacing="5" class="eformLargePopulatedTable" id="Table3" >

    <tr>
           <td align="left" valign="top" ><strong>Grade</strong><br /> 
            <euc:EformDropDownList Width="200px" RecordId="3" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_3" Runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Poorly Differentiated" Text="Poorly Differentiated"></asp:ListItem>
                <asp:ListItem Value="Poorly to Moderately Differentiated" Text="Poorly to Moderately Differentiated"></asp:ListItem>
                <asp:ListItem Value="Moderately Differentiated" Text="Moderately Differentiated"></asp:ListItem>
                <asp:ListItem Value="Intermediate" Text="Intermediate"></asp:ListItem>
                <asp:ListItem Value="Moderately to Well Differentiated" Text="Moderately to Well Differentiated"></asp:ListItem>
                <asp:ListItem Value="Well Differentiated" Text="Well Differentiated"></asp:ListItem>
                <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
            </euc:EformDropDownList>
            
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindSite_3" runat="server" RecordId="3" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindSite"/>             
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindSide_3" runat="server" RecordId="3" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindSide"/>             
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindSubsite_3" runat="server" RecordId="3" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindSubsite"/>             
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindHistology_3" runat="server" RecordId="3" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindHistology"/>             
            	
            	<euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="PathSite_36" TABLE="Pathology" FIELD="PathSite" />  		    
                <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="16" ParentRecordId="16" ID="PathSide_36" TABLE="Pathology" FIELD="PathSide" />
                <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="16" ParentRecordId="16" ID="PathSubsite_36" TABLE="Pathology" FIELD="PathSubsite"  />  		    
            </td>
           <td align="left" valign="top" ><strong>Height (cm)</strong><br /> 
                <euc:EformTextBox Width="50px" RecordId="3" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindHeight" ID="PathFindHeight_3" Runat="server"  />
            </td>
           <td align="left" valign="top" ><strong>Length (cm)</strong><br /> 
                <euc:EformTextBox Width="50px" RecordId="3" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindLength" ID="PathFindLength_3" Runat="server"  /></td>
           <td align="left" valign="top" ><strong>Width (cm)</strong><br /> 
                <euc:EformTextBox Width="50px" RecordId="3" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindWidth" ID="PathFindWidth_3" Runat="server"  /></td>
  
    </tr>

</table>

<br /><br />

<strong>Closest Gross Margin</strong>
<table  border="0" cellpadding="6" cellspacing="5" class="eformLargePopulatedTableBlue" id="Table2" >

    <tr >
           <td align="left" valign="top" ><strong>Site</strong><br /> 
                <euc:EformTextBox Width="150px" RecordId="2" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindSubsite" ID="PathFindSubsite_2" Runat="server"  />
                
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindSite_2" runat="server" RecordId="2" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindSite"/>             
                <euc:EformTextBox Width="1px" style="display: none;" ID="PathFindSide_2" runat="server" RecordId="2" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindSide"/>             
            </td>
           <td align="left" valign="top" ><strong>Distance (cm)</strong><br /> 
                <euc:EformTextBox Width="50px" RecordId="2" ParentRecordId="16"  TABLE="PathologyFinding" FIELD="PathFindHeight" ID="PathFindHeight_2" Runat="server"  /></td>
  
    </tr>

</table>


<br /><br /><br />


<script type="text/javascript">
    /* <![CDATA[ */
 
 /*****************************************************/	
/***************************************************  DESCRIPTION OF TUMOR **/	
/*****************************************************/

     addAbsentEvent($('<%= PathHistology_16.ClientID %>'),$('<%= PathFindGrade_1.ClientID %>'),$('<%= PathFindSite_1.ClientID %>'),$('<%= PathFindSide_1.ClientID %>'),$('<%= PathFindSubsite_1.ClientID %>'),$('<%= PathFindHistology_1.ClientID %>'),$('<%= PathFindHeight_1.ClientID %>'),$('<%= PathFindLength_1.ClientID %>'),$('<%= PathFindWidth_1.ClientID %>'),$('<%= PathSite_16.ClientID %>').value,$('<%= PathSide_16.ClientID %>').value,$('<%= PathSubsite_16.ClientID %>').value);
   
    function addAbsentEvent(pathHistology,pathFindGrade,pathFindSiteHidden,pathFindSideHidden,pathFindSubsiteHidden,pathFindHistologyHidden,pathFindHeight,pathFindLength,pathFindWidth,pathSiteValue,pathSideValue,pathSubsiteValue)
    {  
        $(pathHistology).addEvent('blur',curry(SetHiddenFields,pathHistology,pathFindGrade,pathFindSiteHidden,pathFindSideHidden,pathFindSubsiteHidden,pathFindHistologyHidden,pathFindHeight,pathFindLength,pathFindWidth,pathSiteValue,pathSideValue,pathSubsiteValue));
        $(pathFindGrade).addEvent('blur',curry(SetHiddenFields,pathHistology,pathFindGrade,pathFindSiteHidden,pathFindSideHidden,pathFindSubsiteHidden,pathFindHistologyHidden,pathFindHeight,pathFindLength,pathFindWidth,pathSiteValue,pathSideValue,pathSubsiteValue));
    }

   
    /* ]]> */
    
    function SetHiddenFields(pathHistology,pathFindGrade,pathFindSiteHidden,pathFindSideHidden,pathFindSubsiteHidden,pathFindHistologyHidden,pathFindHeight,pathFindLength,pathFindWidth,pathSiteValue,pathSideValue,pathSubsiteValue)
	{
	    if (pathFindGrade.value != '' || pathFindHeight.value != '' || pathFindLength.value != '' || pathFindWidth.value != '' )
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



/*****************************************************/	
/***************************************************  Closest Gross Margin **/	
/*****************************************************/


     addAbsentEvent3($('<%= PathFindHeight_2.ClientID %>'),$('<%= PathFindSite_2.ClientID %>'),$('<%= PathFindSide_2.ClientID %>'),$('<%= PathFindSubsite_2.ClientID %>'),'Closest Gross Margin',$('<%= PathSide_16.ClientID %>').value);

    function addAbsentEvent3(pathFindHeight,pathFindSiteHidden,pathFindSideHidden,pathFindSubsiteHidden,pathSiteValue,pathSideValue)
    {  
        $(pathFindHeight).addEvent('blur',curry(SetHiddenFields3,pathFindHeight,pathFindSiteHidden,pathFindSideHidden,pathFindSubsiteHidden,pathSiteValue,pathSideValue));
        $(pathFindSubsiteHidden).addEvent('blur',curry(SetHiddenFields3,pathFindHeight,pathFindSiteHidden,pathFindSideHidden,pathFindSubsiteHidden,pathSiteValue,pathSideValue));
    }

   
    /* ]]> */
    
    function SetHiddenFields3(pathFindHeight,pathFindSiteHidden,pathFindSideHidden,pathFindSubsiteHidden,pathSiteValue,pathSideValue)
	{
	    if (pathFindHeight.value != '' || pathFindSubsiteHidden.value != '' )
	    {
	        pathFindSiteHidden.value = pathSiteValue;
	        pathFindSideHidden.value = pathSideValue;
	    }
	    else
	    {
	        pathFindSiteHidden.value = '';
	        pathFindSideHidden.value = '';
	    }

	}

	/*****************************************************/
	/***************************************************  DESCRIPTION OF TUMOR **/
	/*****************************************************/

	addAbsentEvent4($('<%= PathHistology_16.ClientID %>'), $('<%= PathFindGrade_3.ClientID %>'), $('<%= PathFindSite_3.ClientID %>'), $('<%= PathFindSide_3.ClientID %>'), $('<%= PathFindSubsite_3.ClientID %>'), $('<%= PathFindHistology_3.ClientID %>'), $('<%= PathFindHeight_3.ClientID %>'), $('<%= PathFindLength_3.ClientID %>'), $('<%= PathFindWidth_3.ClientID %>'), $('<%= PathSite_36.ClientID %>').value, $('<%= PathSide_36.ClientID %>').value, $('<%= PathSubsite_36.ClientID %>').value);

	function addAbsentEvent4(pathHistology, pathFindGrade, pathFindSiteHidden, pathFindSideHidden, pathFindSubsiteHidden, pathFindHistologyHidden, pathFindHeight, pathFindLength, pathFindWidth, pathSiteValue, pathSideValue, pathSubsiteValue) {
	    $(pathHistology).addEvent('blur', curry(SetHiddenFields4, pathHistology, pathFindGrade, pathFindSiteHidden, pathFindSideHidden, pathFindSubsiteHidden, pathFindHistologyHidden, pathFindHeight, pathFindLength, pathFindWidth, pathSiteValue, pathSideValue, pathSubsiteValue));
	    $(pathFindGrade).addEvent('blur', curry(SetHiddenFields4, pathHistology, pathFindGrade, pathFindSiteHidden, pathFindSideHidden, pathFindSubsiteHidden, pathFindHistologyHidden, pathFindHeight, pathFindLength, pathFindWidth, pathSiteValue, pathSideValue, pathSubsiteValue));
	}


	/* ]]> */

	function SetHiddenFields4(pathHistology, pathFindGrade, pathFindSiteHidden, pathFindSideHidden, pathFindSubsiteHidden, pathFindHistologyHidden, pathFindHeight, pathFindLength, pathFindWidth, pathSiteValue, pathSideValue, pathSubsiteValue) {
	    if (pathFindGrade.value != '' || pathFindHeight.value != '' || pathFindLength.value != '' || pathFindWidth.value != '') {
	        pathFindSiteHidden.value = pathSiteValue;
	        pathFindSideHidden.value = pathSideValue;
	        pathFindSubsiteHidden.value = 'Gross Specimen';
	        pathFindHistologyHidden.value = pathHistology.value;
	    }
	    else {
	        pathFindSiteHidden.value = '';
	        pathFindSideHidden.value = '';
	        pathFindSubsiteHidden.value = '';
	        pathFindHistologyHidden.value = '';
	    }

	}

</script>