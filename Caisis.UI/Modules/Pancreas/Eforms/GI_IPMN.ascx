<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.GI_IPMN" CodeFile="GI_IPMN.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl"%>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<style type="text/css">
table.GI_HTMLTable
{
}
table.GI_HTMLTable td
{
    padding: 8px 4px 4px 8px;
}
td.PancreasRadioButtonCellContainer label
{
    margin-right: 10px;
}
</style>

<a name="GI_IPMN" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Radiology"></asp:Label><br/>

<table border="0" cellspacing="0" class="eformLargePopulatedTable GI_HTMLTable" >
    <tr>
        <td  title="Imaging w/o constrast, e.g. invasive endoscopic ultrasound">Image Type</td>
        <td><euc:EformDropDownList  Runat="server" RecordId="2"  table="Diagnostics"  ID="DxType" field="DxType"  LookupCode="DxType" ShowEmptyListItem="true" Width="200" /></td>
    </tr>
    <tr>
        <td >Date</td>
        <td><euc:EformTextBox Runat="server" RecordId="2"  ID="DxDateText_2" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
		<euc:EformHidden RecordId="2" Runat="server" ID="DxDate_2" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    </tr>
</table>
<br/><br/><br/>
<asp:Label ID="ComponentTitle1" runat="server" CssClass="controlBoxTitle" Text="Tumor(s)"></asp:Label><br/>
<table border="0" cellspacing="0" class="eformLargePopulatedTable GI_HTMLTable"  >
    <tr>
        <td title="Largest dimension of largest cyst with plane (cm)">Cyst Max Dim</td>
        <td><euc:EformTextBox Runat="server" RecordId="2"  ID="ImgCystMaxDim" TABLE="DxImagePancreas" FIELD="ImgCystMaxDim" style="width:40px;" /> cm</td>
    </tr>
    <tr>
        <td title="Location of largest cyst" style="vertical-align: top; padding-top: 10px;">Location(s)</td>
        <%--<td title="Location of largest cyst">Location</td> --%>
	<td>
	
	    <euc:EformCheckBoxList  Runat="server" RecordId="2"  table="Diagnostics"  ID="DxTarget" field="DxTarget" ShowOther="false" RepeatDirection="Vertical" RepeatColumns="1" RepeatLayout="Flow" >
	        <asp:ListItem Value="Head">Head</asp:ListItem>
	        <asp:ListItem Value="Neck">Neck</asp:ListItem>
	        <asp:ListItem Value="Body">Body</asp:ListItem>
	        <asp:ListItem Value="Tail">Tail</asp:ListItem>
	        <asp:ListItem Value="Uncinate">Uncinate</asp:ListItem>
	    </euc:EformCheckBoxList>
<%-- 	    <euc:EformDropDownList  Runat="server" RecordId="2"  table="Diagnostics"  ID="DxTarget" field="DxTarget"  ShowEmptyListItem="true" >
	        <asp:ListItem Value="">&nbsp;</asp:ListItem>
	        <asp:ListItem Value="Head">Head</asp:ListItem>
	        <asp:ListItem Value="Neck">Neck</asp:ListItem>
	        <asp:ListItem Value="Body">Body</asp:ListItem>
	        <asp:ListItem Value="Tail">Tail</asp:ListItem>
	        <asp:ListItem Value="Uncinate">Uncinate</asp:ListItem>
	    </euc:EformDropDownList>
--%>
		</td>
    </tr>
    <tr>
        <td>Multiple Tumors?</td>
        <td id="NumTumorsRowToggleContainer_GI" class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="2" TABLE="DxImagePancreas" FIELD="ImgMultiplicity"  id="ImgMultiplicity" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Uncheckable="true" >
	        <asp:ListItem Value="Yes">Yes</asp:ListItem>
	        <asp:ListItem Value="No">No</asp:ListItem>
        </euc:EformRadioButtonList>
        </td>
    </tr>
    <tr id="NumTumorsRow_GI" style="display: none;">
        <td>Number of Tumors</td>
        <td><euc:EformTextBox Runat="server" RecordId="2"  ID="DxTotalNumTumors" TABLE="Diagnostics" FIELD="DxTotalNumTumors" style="width:40px;" /></td>
    </tr>
    <tr>
        <td title="Impression" style="vertical-align: top; padding-top: 10px;">Impression</td>
        <td >
        <euc:EformRadioButtonList RecordId="2" TABLE="Diagnostics" FIELD="DxNotes"  id="DxNotes" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Vertical" runat="server" Uncheckable="true" ShowOther="true" >
	        <asp:ListItem Value="Serous">Serous</asp:ListItem>
	        <asp:ListItem Value="Mucinous">Mucinous</asp:ListItem>
	        <asp:ListItem Value="Pseudocyst">Pseudocyst</asp:ListItem>
	        <asp:ListItem Value="Solid/Pseudopapillary">Solid/Pseudopapillary</asp:ListItem>
	        <asp:ListItem Value="NET">NET</asp:ListItem>
        </euc:EformRadioButtonList>
        </td>
    </tr>
</table>
<br/><br/><br/>



<asp:Label ID="ComponentTitle2" runat="server" CssClass="controlBoxTitle" Text="Duct Dilation"></asp:Label><br/>
<table border="0" cellspacing="0" class="eformLargePopulatedTable GI_HTMLTable" >
    <tr>
        <td title="Maximal diameter of main duct (cm)">Maximum Main Duct Diameter</td>
        <td><euc:EformTextBox Runat="server" RecordId="2"  ID="ImgMaxMainDuctDiam" TABLE="DxImagePancreas" FIELD="ImgMaxMainDuctDiam" style="width:40px;" /> cm</td>
    </tr>
    <tr>
        <td title="Maximal diameter of uncinate duct (cm)">Maximum Uncinate Duct Diameter</td>
        <td><euc:EformTextBox Runat="server" RecordId="2"  ID="ImgMaxUncinateDuctDiam" TABLE="DxImagePancreas" FIELD="ImgMaxUncinateDuctDiam" style="width:40px;" /> cm</td>
    </tr>

</table>
<br/><br/><br/>




<asp:Label ID="ComponentTitle3" runat="server" CssClass="controlBoxTitle" Text="Other Details"></asp:Label><br/>
<table border="0" cellspacing="0" class="eformLargePopulatedTable GI_HTMLTable" >
    <tr>
        <td>Enhancing Nodules</td>
        <td id="EnhancingNodulesToggleContainer_GI" class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="2" TABLE="DxImagePancreas" FIELD="ImgEnhancingNodules" LookupCode="YesNoUnknown" id="ImgEnhancingNodules" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />
        </td>
    </tr>
    <tr id="EnhancingNodulesSizeRow_GI" style="display: none;">
        <td>Enhancing Nodule Size</td>
        <td><euc:EformTextBox Runat="server" RecordId="2"  ID="ImgEnhancingNoduleSize" TABLE="DxImagePancreas" FIELD="ImgEnhancingNoduleSize" style="width:40px;" /> cm</td>
    </tr>
    <tr>
        <td title="Presence of solid pancreatic mass (independent of mural nodules)">Presence of Solid Pancreatic Mass</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="2" TABLE="DxImagePancreas" FIELD="ImgPancreaticMass" LookupCode="YesNoUnknown" id="ImgPancreaticMass" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />
        </td>
    </tr>
    <tr>
        <td>Presence of Thick Enhancing Septa</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="2" TABLE="DxImagePancreas" FIELD="ImgThickEnhancingSepta" LookupCode="YesNoUnknown" id="ImgThickEnhancingSepta" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />
        </td>
    </tr>
    <tr>
        <td>Borders</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="2" TABLE="DxImagePancreas" FIELD="ImgBorders" id="ImgBorders" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" >
            <asp:ListItem Value="Circumscribed">Circumscribed</asp:ListItem>
            <asp:ListItem Value="Ill-defined">Ill-defined</asp:ListItem>
        </euc:EformRadioButtonList>
        </td>
    </tr>
    <tr>
        <td>Arterial Proximity to Presurgical Lesion</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="2" TABLE="DxImagePancreas" FIELD="ImgArterialProximityToLesion" id="ImgArterialProximityToLesion" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" >
            <asp:ListItem Value="Not involved">Not involved</asp:ListItem>
            <asp:ListItem Value="Abutment">Abutment</asp:ListItem>
            <asp:ListItem Value="Encasement">Encasement</asp:ListItem>
        </euc:EformRadioButtonList>
        </td>
    </tr>
    <tr>
        <td>Venous Proximity to Presurgical Lesion</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="2" TABLE="DxImagePancreas" FIELD="ImgVenousProximityToLesion" id="ImgVenousProximityToLesion" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" >
            <asp:ListItem Value="Not involved">Not involved</asp:ListItem>
            <asp:ListItem Value="Abutment">Abutment</asp:ListItem>
            <asp:ListItem Value="Encasement">Encasement</asp:ListItem>
        </euc:EformRadioButtonList>
        </td>
    </tr>
    <%--
    <tr>
        <td>Vascular Proximity to Presurgical Lesion</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="2" TABLE="DxImagePancreas" FIELD="ImgVascularProximityToLesion" id="ImgVascularProximityToLesion" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" >
            <asp:ListItem Value="Not involved">Not involved</asp:ListItem>
            <asp:ListItem Value="Abutment">Abutment</asp:ListItem>
            <asp:ListItem Value="Encasement">Encasement</asp:ListItem>
        </euc:EformRadioButtonList>
        </td>
    </tr>
     --%>
    <tr>
        <td style="vertical-align: top; padding-top: 10px;">Morphology</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="2" TABLE="DxImagePancreas" FIELD="ImgCystMorphology" id="ImgCystMorphology" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Vertical" runat="server" >
            <asp:ListItem Value="Unilocular">Unilocular</asp:ListItem>
            <asp:ListItem Value="Microcystic">Microcystic</asp:ListItem>
            <asp:ListItem Value="Macrocystic">Macrocystic</asp:ListItem>
            <asp:ListItem Value="Oligocystic">Oligocystic</asp:ListItem>
            <asp:ListItem Value="Solid-cystic">Solid-cystic</asp:ListItem>
        </euc:EformRadioButtonList>
        </td>
    </tr>
</table>
<br/><br/><br/>


<asp:Label ID="ComponentTitle4" runat="server" CssClass="controlBoxTitle" Text="Cytology"></asp:Label><br/>
<table border="0" cellspacing="0" class="eformLargePopulatedTable GI_HTMLTable" >
    <tr>
        <td >Cyst Fluid CEA</td>
        <td><euc:EformTextBox Runat="server" RecordId="1" ParentRecordId="2" ID="PathFindResult_1" TABLE="PathologyFinding" FIELD="PathFindResult" style="width:40px;" /></td>
    </tr>
    <tr>
        <td >Cyst Fluid Quality</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="2" ParentRecordId="2" ID="PathFindResult_2" TABLE="PathologyFinding" FIELD="PathFindResult"  CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" >
            <asp:ListItem Value="Thin">Thin</asp:ListItem>
            <asp:ListItem Value="Thick">Thick</asp:ListItem>
        </euc:EformRadioButtonList>
        </td>
    </tr>
    <tr>
        <td >Cytology</td>
        <td><euc:EformDropDownList  Runat="server" RecordId="3" ParentRecordId="2" ID="PathFindResult_3" TABLE="PathologyFinding" FIELD="PathFindResult" ShowEmptyListItem="true">
            <asp:ListItem Value=""> </asp:ListItem>
            <asp:ListItem Value="Nondiagnostic">Nondiagnostic</asp:ListItem>
            <asp:ListItem Value="Atypical">Atypical</asp:ListItem>
            <asp:ListItem Value="Suspicious">Suspicious</asp:ListItem>
            <asp:ListItem Value="Positive">Positive</asp:ListItem>
        </euc:EformDropDownList></td>
    </tr>
</table>
<br/><br/><br/>


<script type="text/javascript">
    showHideBasedOnRadioToggle($('NumTumorsRowToggleContainer_GI'), $('NumTumorsRow_GI'), 'Yes');
    showHideBasedOnRadioToggle($('EnhancingNodulesToggleContainer_GI'), $('EnhancingNodulesSizeRow_GI'), 'Yes');
</script>
