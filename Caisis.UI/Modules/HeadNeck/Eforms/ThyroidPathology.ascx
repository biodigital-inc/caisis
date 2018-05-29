<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.ThyroidPathology" CodeFile="ThyroidPathology.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.ThyroidPathologyHtmlTable = "ThyroidPathologyHtmlTable";
	
	function tumorLocCheck(chkboxId, chkValue, txtbox_id)
    {
        if (chkboxId.checked == true)
	    {
		    document.getElementById(txtbox_id).value = chkValue;
	    }
	    else
	    {
	        document.getElementById(txtbox_id).value = 'No';
        }
    }
    
    function updatePathDetails()
    {
        document.getElementById('<%= PathInstitution.ClientID %>').value='Memorial Sloan Kettering Cancer Center';
	    document.getElementById('<%= PathSite.ClientID %>').value='Thyroid';
	    document.getElementById('<%= PathQuality.ClientID %>').value='STD';	
    }
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="ThyroidPathology" /><span class="controlBoxTitle">Pathology</span><br/>
<table  width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="ThyroidPathologyHtmlTable" > 
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Histology</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
  </tr>
  
  <tr>
    <td height="28"><euc:EformTextBox  Width="90px" TABLE="Pathology" RecordId="1" FIELD="PathDateText" ID="PathDateText" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" AppendToOnChange="updatePathDetails();" />
    <euc:EformHidden TABLE="Pathology" FIELD="PathDate" RecordId="1" ID="PathDate" Runat="server"/>
	<euc:EformTextBox id="PathInstitution" RecordId="1" Table="Pathology" Field="PathInstitution" runat="server" Width="1px" style="display:none"/>	
	<euc:EformTextBox id="PathSite" RecordId="1" Table="Pathology" Field="PathSite" runat="server" Width="1px" style="display:none"/>
	<euc:EformTextBox id="PathQuality" RecordId="1" Table="Pathology" Field="PathQuality" runat="server" Width="1px" style="display:none"/>
    </td> 
    <td align="center"><euc:EformComboBox Width="125px" TABLE="Pathology" FIELD="PathHistology"  RecordId="1"   ID="PathHistology"     LookupCode="PathHistology" Runat="server" TabIndex="2" />
    </td>    
    <td align="center"><euc:EformDropDownList Width="80px" RecordId="1"  TABLE="Pathology" FIELD="PathSide" ID="PathSide_1" LookupCode="NodeSide" Runat="server" TabIndex="3" /> </td>
 <td align="center">
    <euc:EformDropDownList Width="80px" TABLE="Pathology" FIELD="PathResult" RecordId="1" ID="PathResult_1" Runat="server" TabIndex="4">
        <asp:ListItem Text="" Value=""></asp:ListItem>
        <asp:ListItem Text="Positive" Value="Positive"></asp:ListItem>
        <asp:ListItem Text="Negative" Value="Negative"></asp:ListItem>
        <asp:ListItem Text="Unknown" Value="Unknown"></asp:ListItem>
    </euc:EformDropDownList></td>
 
  </tr> 
</table><br />

<span class="controlBoxTitle">Thyroid Path</span><br/>
<table  width="650" border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="ProcFindingsHtmlTable" >     
  <tr>  
    <td style="padding-top: 10px;" >
        <strong>Size</strong>
        <euc:EformTextBox Width="70px" TABLE="ThyroidPath" FIELD="PathTumorMaxDim" RecordId="1" ID="PathTumorMaxDim" Runat="server" TabIndex="5" />
    </td>
    <td style="padding-top: 10px;" colspan="3">
        <strong>Extra Thyroid Extension</strong>
        <euc:EformRadioButtonList Table="ThyroidPath" Field="PathExtension" RecordId="1" ID="PathExtension" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" TabIndex="6" >
     <asp:ListItem>Unknown</asp:ListItem>   
     <asp:ListItem>None</asp:ListItem>
     <asp:ListItem>Microscopic</asp:ListItem>
     <asp:ListItem>Gross</asp:ListItem>
    </euc:EformRadioButtonList>
    </td>
  </tr>
  <tr>
    <td colspan="4" style="padding-top: 5px;">
        <strong>Positive Tumor Location</strong>
        <euc:EformCheckBox TABLE="NoTable" FIELD="PathLobe_Right" Runat="server" ID="PathLobe_Right" Value="Yes" Text="Right Lobe" TabIndex="7" />
        <euc:EformTextBox TABLE="ThyroidPath" FIELD="PathR_Lobe" Runat="server" ID="PathR_Lobe" Width="1px" style="display:none;" />
        
        <euc:EformCheckBox TABLE="NoTable" FIELD="PathLobe_Left" Runat="server" ID="PathLobe_Left" Value="Yes" Text="Left Lobe" TabIndex="8"/>
        <euc:EformTextBox TABLE="ThyroidPath" FIELD="PathL_Lobe" Runat="server" ID="PathL_Lobe" Width="1px" style="display:none;"/>
        
        <euc:EformCheckBox TABLE="NoTable" FIELD="PathLobe_Isthmus" Runat="server" ID="PathLobe_Isthmus" Value="Yes" Text="Isthmus" TabIndex="9"/>
        <euc:EformTextBox TABLE="ThyroidPath" FIELD="PathIsthmus" Runat="server" ID="PathIsthmus" Width="1px" style="display:none;"/>

        <euc:EformCheckBox TABLE="NoTable" FIELD="Path_MultiCentricity" Runat="server" ID="Path_MultiCentricity" Value="Yes" Text="Multi-Centricity" TabIndex="10"/>
        <euc:EformTextBox TABLE="ThyroidPath" FIELD="PathMultiCentricity" Runat="server" ID="PathMultiCentricity" Width="1px" style="display:none;"/>
    </td>
  </tr>
  <tr>
    <td style="padding-top: 10px;" >
        <strong>Vascular Inv Location</strong>
    </td>
    <td style="padding-top: 10px;" >
        <euc:EformComboBox Width="125px" TABLE="ThyroidPath" FIELD="PathVascularInvLocation"  RecordId="1" ID="PathVascularInvLocation" LookupCode="ThyroidVascularInvasion" Runat="server" TabIndex="11" />
    </td>
    <td style="padding-top: 10px;" nowrap="nowrap">
        <strong>Tumor Infiltration</strong>
    </td>
    <td style="padding-top: 10px;" >
         <euc:EformComboBox Width="125px" TABLE="ThyroidPath" FIELD="PathInfiltrative"  RecordId="1" ID="PathInfiltrative" LookupCode="ThyroidInfiltration" Runat="server" TabIndex="18" />      
    </td>    
  </tr>
  <tr>
    <td style="padding-top: 10px;" nowrap="nowrap">
        <strong>Margin Status</strong>
    </td>
    <td style="padding-top: 10px;" >
         <euc:EformComboBox Width="125px" TABLE="ThyroidPath" FIELD="PathMargin"  RecordId="1" ID="PathMargin" LookupCode="ThyroidMargins" Runat="server" TabIndex="12" />      
    </td>
    <td style="padding-top: 10px;" nowrap="nowrap">
        <strong>Extension Sites</strong>
    </td>
    <td style="padding-top: 10px;" >
         <euc:EformComboBox Width="125px" TABLE="ThyroidPath" FIELD="PathExtensionSites"  RecordId="1" ID="PathExtensionSites" LookupCode="ThyroidExtrathyroidSite" Runat="server"  DropDownWidth="200px" TabIndex="19" />      
    </td>
  </tr>
  <tr>
    <td style="padding-top: 10px;"><strong>Mitotic activity</strong></td>
    <td style="padding-top: 10px;">
        <euc:EformComboBox Width="125px" TABLE="ThyroidPath" FIELD="PathMitoticActivity"  RecordId="1" ID="PathMitoticActivity" LookupCode="ThyroidMitotic" Runat="server"  DropDownWidth="270px" TabIndex="13" />      
    </td>
    <td style="padding-top: 10px;" nowrap="nowrap">
        <strong>Margin Sites</strong>
    </td>
    <td style="padding-top: 10px;" >
        <euc:EformComboBox Width="125px" TABLE="ThyroidPath" FIELD="PathMarginSites"  RecordId="1" ID="PathMarginSites" LookupCode="ThyroidPositiveMarginSites" Runat="server" TabIndex="20" /> 
    </td>
  </tr>
  <tr>
    <td style="padding-top: 10px;" nowrap="nowrap">
        <strong>Necrosis</strong>
    </td>
    <td style="padding-top: 10px;" >
         <euc:EformComboBox Width="125px" TABLE="ThyroidPath" FIELD="PathNecrosis"  RecordId="1" ID="PathNecrosis" LookupCode="ThyroidNecrosis" Runat="server" TabIndex="14" />      
    </td>
    <td style="padding-top: 10px;" nowrap="nowrap">
        <strong>Microcarcinoma</strong>
    </td>
    <td style="padding-top: 10px;" >
         <euc:EformComboBox Width="125px" TABLE="ThyroidPath" FIELD="PathMicrocarcinoma"  RecordId="1" ID="PathMicrocarcinoma" LookupCode="YesNoUnknown" Runat="server" TabIndex="21" />      
    </td>    
  </tr>
  <tr>
    <td style="padding-top: 10px;" nowrap="nowrap">
        <strong>Encapsulation</strong>
    </td>
    <td style="padding-top: 10px;" >
         <euc:EformComboBox Width="125px" TABLE="ThyroidPath" FIELD="PathTumorEncapsulation"  RecordId="1" ID="PathTumorEncapsulation" LookupCode="ThyroidTumorEncapsulation" Runat="server"  DropDownWidth="200px" TabIndex="15" />      
    </td>
     <td style="padding-top: 10px;" nowrap="nowrap">
        <strong>Non-Neoplastic</strong>
    </td>
    <td style="padding-top: 10px;" colspan="3">
        <euc:EformComboBox Width="125px" TABLE="ThyroidPath" FIELD="PathNonNeoplastic"  RecordId="1" ID="PathNonNeoplastic" LookupCode="ThyroidNonneoplastic" Runat="server" TabIndex="22" /> 
    </td>
  </tr>
  <tr>
    <td style="padding-top: 10px;" nowrap="nowrap">
        <strong># Foci capsular invasion</strong>
    </td>
    <td style="padding-top: 10px;" >
        <euc:EformTextBox TABLE="ThyroidPath" FIELD="PathNumFociCapsularInv" Runat="server" RecordId="1" ID="PathNumFociCapsularInv" TabIndex="16"/>
    </td>
    <td style="padding-top: 10px;" nowrap="nowrap">
        <strong>Parathyroid Glands</strong>
    </td>
    <td style="padding-top: 10px;" >
         <euc:EformComboBox Width="125px" TABLE="ThyroidPath" FIELD="PathParathyroidGlands"  RecordId="1" ID="PathParathyroidGlands" LookupCode="ThyroidParathyroid" Runat="server" TabIndex="23" />      
    </td>
  </tr>
  <tr>
    <td style="padding-top: 10px;" nowrap="nowrap">
        <strong># Foci vascular invasion</strong>
    </td>
    <td style="padding-top: 10px;" colspan="3">
        <euc:EformTextBox TABLE="ThyroidPath" FIELD="PathNumFociVascularInv" Runat="server" RecordId="1" ID="PathNumFociVascularInv" TabIndex="17"/>
    </td>    
  </tr>  
 </table><br />