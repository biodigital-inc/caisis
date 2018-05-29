<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.Radiology_IPMN" CodeFile="Radiology_IPMN.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl"%>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<style type="text/css">
table.RadiologyHTMLTable
{
}
table.RadiologyHTMLTable td
{
    padding: 8px 4px 4px 8px;
}
td.PancreasRadioButtonCellContainer label
{
    margin-right: 10px;
}
</style>

<a name="Radiology_IPMN" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Radiology"></asp:Label><br/>
<table border="0" cellspacing="0" class="eformLargePopulatedTable RadiologyHTMLTable" >
    <tr>
        <td title="Imaging with constrast, e.g. CT scan">Image Type</td>
        <td><euc:EformDropDownList  Runat="server" RecordId="1"  table="Diagnostics"  ID="DxType" field="DxType"  LookupCode="DxType" ShowEmptyListItem="true" Width="200" /></td>
    </tr>
    <tr>
        <td >Date</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="DxDateText_1" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
		<euc:EformHidden RecordId="1" Runat="server" ID="DxDate_1" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    </tr>
</table>
<br/><br/><br/>
<asp:Label ID="ComponentTitle1" runat="server" CssClass="controlBoxTitle" Text="Cyst(s)"></asp:Label>
<table border="0" cellspacing="0" class="eformLargePopulatedTable RadiologyHTMLTable" >
    <tr>
        <td title="Largest dimension of largest cyst with plane (cm)">Cyst Max Dim</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="ImgCystMaxDim" TABLE="DxImagePancreas" FIELD="ImgCystMaxDim" style="width:40px;" /> cm</td>
    </tr>
    <tr>
        <td title="Location of largest cyst" style="vertical-align: top; padding-top: 10px;">Location(s)</td>
        <%--<td title="Location of largest cyst">Location</td> --%>
	<td>
	
	    <euc:EformCheckBoxList  Runat="server" RecordId="1"  table="Diagnostics"  ID="DxTarget" field="DxTarget" ShowOther="false" RepeatDirection="Vertical" RepeatColumns="1" RepeatLayout="Flow" >
	        <asp:ListItem Value="Head">Head</asp:ListItem>
	        <asp:ListItem Value="Neck">Neck</asp:ListItem>
	        <asp:ListItem Value="Body">Body</asp:ListItem>
	        <asp:ListItem Value="Tail">Tail</asp:ListItem>
	        <asp:ListItem Value="Uncinate">Uncinate</asp:ListItem>
	    </euc:EformCheckBoxList>
	
<%--	    <euc:EformDropDownList  Runat="server" RecordId="1"  table="Diagnostics"  ID="DxTarget" field="DxTarget"  ShowEmptyListItem="true" >
	        <asp:ListItem Value="">&nbsp;</asp:ListItem>
	        <asp:ListItem Value="Head">Head</asp:ListItem>
	        <asp:ListItem Value="Neck">Neck</asp:ListItem>
	        <asp:ListItem Value="Body">Body</asp:ListItem>
	        <asp:ListItem Value="Tail">Tail</asp:ListItem>
	        <asp:ListItem Value="Uncinate">Uncinate</asp:ListItem>
	    </euc:EformDropDownList> --%>
	</td>	
    </tr>
    <tr>
        <td>Multiple Cysts?</td>
        <td id="NumTumorsRowToggleContainer" class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="DxImagePancreas" FIELD="ImgMultiplicity" id="ImgMultiplicity" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Uncheckable="true" >
	        <asp:ListItem Value="Yes">Yes</asp:ListItem>
	        <asp:ListItem Value="No">No</asp:ListItem>
        </euc:EformRadioButtonList>
        </td>
    </tr>
    <tr id="NumTumorsRow" style="display: none;">
        <td>Number of Cysts</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="DxTotalNumTumors" TABLE="Diagnostics" FIELD="DxTotalNumTumors" style="width:40px;" /></td>
    </tr>
</table>
<br/><br/><br/>



<asp:Label ID="ComponentTitle2" runat="server" CssClass="controlBoxTitle" Text="Duct Dilation"></asp:Label><br/>
<table border="0" cellspacing="0" class="eformLargePopulatedTable RadiologyHTMLTable" >
    <tr>
        <td title="Maximal diameter of main duct (cm)">Maximum Main Duct Diameter</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="ImgMaxMainDuctDiam" TABLE="DxImagePancreas" FIELD="ImgMaxMainDuctDiam" style="width:40px;" /> cm</td>
    </tr>
    <tr>
        <td title="Maximal diameter of uncinate duct (cm)">Maximum Uncinate Duct Diameter</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="ImgMaxUncinateDuctDiam" TABLE="DxImagePancreas" FIELD="ImgMaxUncinateDuctDiam" style="width:40px;" /> cm</td>
    </tr>

</table>
<br/><br/><br/>




<asp:Label ID="ComponentTitle3" runat="server" CssClass="controlBoxTitle" Text="Other Details"></asp:Label><br/>
<table border="0" cellspacing="0" class="eformLargePopulatedTable  RadiologyHTMLTable" >
 <%--    <tr>
        <td>Side Branch Mouth Size</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="DxImagePancreas" FIELD="ImgSideBranchMouthSize" id="ImgSideBranchMouthSize" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" >
            <asp:ListItem Value="< 1 cm">&lt;1 cm</asp:ListItem>
            <asp:ListItem Value=">= 1 cm">&gt;= 1 cm</asp:ListItem>
        </euc:EformRadioButtonList>
        </td>
    </tr>--%>
    <tr>
        <td>Solid Enhancing Component</td>
        <td id="EnhancingNodulesToggleContainer" class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="DxImagePancreas" FIELD="ImgEnhancingNodules" LookupCode="YesNoUnknown" id="ImgEnhancingNodules" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />
        </td>
    </tr>
    <tr id="EnhancingNodulesSizeRow" style="display: none;">
        <td>Enhancing Component Size</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="ImgEnhancingNoduleSize" TABLE="DxImagePancreas" FIELD="ImgEnhancingNoduleSize" style="width:40px;" /> cm</td>
    </tr>
    <tr>
        <td>Presence of Thick Enhancing Septa</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="DxImagePancreas" FIELD="ImgThickEnhancingSepta" LookupCode="YesNoUnknown" id="ImgThickEnhancingSepta" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />
        </td>
    </tr>
    <tr>
        <td>Borders</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="DxImagePancreas" FIELD="ImgBorders" id="ImgBorders" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" >
            <asp:ListItem Value="Circumscribed">Circumscribed</asp:ListItem>
            <asp:ListItem Value="Ill-defined">Ill-defined</asp:ListItem>
        </euc:EformRadioButtonList>
        </td>
    </tr>
    <tr>
        <td>Arterial Proximity to Presurgical Lesion</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="DxImagePancreas" FIELD="ImgArterialProximityToLesion" id="ImgArterialProximityToLesion" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" >
            <asp:ListItem Value="Not involved">Not involved</asp:ListItem>
            <asp:ListItem Value="Abutment">Abutment</asp:ListItem>
            <asp:ListItem Value="Encasement">Encasement</asp:ListItem>
        </euc:EformRadioButtonList>
        </td>
    </tr>
    <tr>
        <td>Venous Proximity to Presurgical Lesion</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="DxImagePancreas" FIELD="ImgVenousProximityToLesion" id="ImgVenousProximityToLesion" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" >
            <asp:ListItem Value="Not involved">Not involved</asp:ListItem>
            <asp:ListItem Value="Abutment">Abutment</asp:ListItem>
            <asp:ListItem Value="Encasement">Encasement</asp:ListItem>
        </euc:EformRadioButtonList>
        </td>
    </tr>
    <tr>
        <td>Calcifications?</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="DxImagePancreas" FIELD="ImgCalcifications" LookupCode="YesNoUnknown" id="ImgCalcifications" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />
        </td>
    </tr>

</table>
<br/><br/><br/>

<script type="text/javascript">
    showHideBasedOnRadioToggle($('NumTumorsRowToggleContainer'), $('NumTumorsRow'), 'Yes');
    showHideBasedOnRadioToggle($('EnhancingNodulesToggleContainer'), $('EnhancingNodulesSizeRow'), 'Yes');
</script>
