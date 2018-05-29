<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.Pathology_IPMN" CodeFile="Pathology_IPMN.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<style type="text/css">
table#Pathology_IPMN_HTMLTable
{
}
table#Pathology_IPMN_HTMLTable td
{
    padding-top: 12px;
}
td.PancreasRadioButtonCellContainer label
{
    margin-right: 10px;
}
td.Pathology_IPMN_LabelCol
{
    font-weight: bold;
}
</style>

<a name="Pathology_IPMN" id="Pathology_IPMN" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" class="eformXLargePopulatedTable" id="Pathology_IPMN_HTMLTable">
<tbody>
 <tr >
	<td class="Pathology_IPMN_LabelCol" style="padding-top: 20px;">IPMN gross size</td>
	<td style="padding-top: 20px;">
	<euc:EformTextBox Runat="server" RecordId="1"  table="PancreasPath"  ID="PathIPMN" field="PathIPMN" style="width:40px;" /> cm
	</td>
</tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">Type of Epithelium (predominant)</td>
	<td>
	    <euc:EformDropDownList  Runat="server" RecordId="1"  table="PancreasPath"  ID="PathEpitheliumType" field="PathEpitheliumType"  ShowEmptyListItem="true" >
	        <asp:ListItem Value=""> </asp:ListItem>
	        <asp:ListItem Value="Gastric">Gastric</asp:ListItem>
	        <asp:ListItem Value="Intestinal">Intestinal</asp:ListItem>
	        <asp:ListItem Value="Pancreatobiliary">Pancreatobiliary</asp:ListItem>
	        <asp:ListItem Value="Oncocytic (IOPN)">Oncocytic (IOPN)</asp:ListItem>
	        <asp:ListItem Value="Mixed">Mixed</asp:ListItem>
	    </euc:EformDropDownList>
	</td>	
  </tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">Grade of Dysplasia</td>
	<td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="PancreasPath" FIELD="PathDysplasia" id="PathDysplasia" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Uncheckable="true" >
            <asp:ListItem Value="Low">Low</asp:ListItem>
            <asp:ListItem Value="Intermediate">Intermediate</asp:ListItem>
            <asp:ListItem Value="High">High</asp:ListItem>
        </euc:EformRadioButtonList>
	</td>	
</tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">Invasive Carcinoma</td>
	<td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="PancreasPath" LookupCode="YesNoUnknown" FIELD="PathCarcinoma" id="PathCarcinoma" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Uncheckable="true" >
        </euc:EformRadioButtonList>
	</td>	
</tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">Type of Invasive Carcinoma</td>
	<td>
	    <euc:EformDropDownList  Runat="server" RecordId="1"  table="PancreasPath"  ID="PathCarcinomaType" field="PathCarcinomaType"  ShowEmptyListItem="true" >
	        <asp:ListItem Value=""> </asp:ListItem>
	        <asp:ListItem Value="Tubular Adenocarcinoma (Conventional)">Tubular Adenocarcinoma (Conventional)</asp:ListItem>
	        <asp:ListItem Value="Colloid Carcinoma">Colloid Carcinoma</asp:ListItem>
	    </euc:EformDropDownList>
	</td>	
</tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">Extent of Invasive Carcinoma (stage)</td>
	<td>
	    <euc:EformDropDownList  Runat="server" RecordId="1"  table="PathologyStageGrade"  ID="PathStageT" field="PathStageT" LookupCode="StagePath_IPMN_02_T"  ShowEmptyListItem="true" >
	    </euc:EformDropDownList>
	</td>	
</tr>

 <tr >
	<td class="Pathology_IPMN_LabelCol" title="% of tumor composed of invasive carcinoma" >% Carcinoma</td>
	<td >
	<euc:EformTextBox Runat="server" RecordId="1"  table="PancreasPath"  ID="PathPercCarcinoma" field="PathPercCarcinoma" style="width:40px;" /> %
	</td>
</tr>
 <tr >
	<td class="Pathology_IPMN_LabelCol" title="Size of the largest focus of invasive carcinoma" >Carcinoma Size</td>
	<td >
	<euc:EformTextBox Runat="server" RecordId="1"  table="PancreasPath"  ID="PathCarcinomaMaxDim" field="PathCarcinomaMaxDim" style="width:40px;" /> cm
	</td>
</tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">Vascular Invasion</td>
	<td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="PancreasPath" LookupCode="YesNoUnknown" FIELD="PathVascularInv" id="PathVascularInv" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Uncheckable="true" >
        </euc:EformRadioButtonList>
	</td>	
</tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">Perineural Invasion</td>
	<td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="PancreasPath" LookupCode="YesNoUnknown" FIELD="PathPerineuralInv" id="PathPerineuralInv" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Uncheckable="true" >
        </euc:EformRadioButtonList>
	</td>	
</tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">PanIN</td>
	<td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="PancreasPath" FIELD="PathPanIn" id="PathPanIn" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Uncheckable="true" >
	        <asp:ListItem Value="PanIN 1">PanIN 1</asp:ListItem>
	        <asp:ListItem Value="PanIN 2">PanIN 2</asp:ListItem>
	        <asp:ListItem Value="PanIN 3">PanIN 3</asp:ListItem>
        </euc:EformRadioButtonList>
	</td>	
</tr>

<tr>
	<td class="Pathology_IPMN_LabelCol">Nonneoplastic Pancreas</td>
	<td>
	    <euc:EformDropDownList  Runat="server" RecordId="1"  table="PancreasPath"  ID="PathNonneoplastic" field="PathNonneoplastic"  ShowEmptyListItem="true" >
	        <asp:ListItem Value=""> </asp:ListItem>
	        <asp:ListItem Value="Focal Chronic Pancreatitis">Focal Chronic Pancreatitis</asp:ListItem>
	        <asp:ListItem Value="Diffuse Chronic Pancreatitis">Diffuse Chronic Pancreatitis</asp:ListItem>
	        <asp:ListItem Value="Unremarkable">Unremarkable</asp:ListItem>
	    </euc:EformDropDownList>
	</td>	
</tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">Pancreatic Margins</td>
	<td>
	    <euc:EformDropDownList  Runat="server" RecordId="1"  table="PancreasPath"  ID="PathPancreaticMargin" field="PathPancreaticMargin" LookupCode="PancreasSurgMargins"  ShowEmptyListItem="true" >
	    </euc:EformDropDownList>
	</td>	
</tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">Bile Duct Margin</td>
	<td>
	    <euc:EformDropDownList  Runat="server" RecordId="1"  table="PancreasPath"  ID="PathBileDuctMargin" field="PathBileDuctMargin" LookupCode="PancreasSurgMargins"  ShowEmptyListItem="true" >
	    </euc:EformDropDownList>
	</td>	
</tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">Soft Tissue Margin</td>
	<td>
	    <euc:EformDropDownList  Runat="server" RecordId="1"  table="PancreasPath"  ID="PathAddTissueMargin" field="PathAddTissueMargin" LookupCode="PancreasSurgMargins"  ShowEmptyListItem="true" >
	    </euc:EformDropDownList>
	</td>	
</tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">Proximal Margin</td>
	<td>
	    <euc:EformDropDownList  Runat="server" RecordId="1"  table="PancreasPath"  ID="PathProximalMargin" field="PathProximalMargin" LookupCode="PancreasSurgMargins"  ShowEmptyListItem="true" >
	    </euc:EformDropDownList>
	</td>	
</tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">Distal Margin</td>
	<td>
	    <euc:EformDropDownList  Runat="server" RecordId="1"  table="PancreasPath"  ID="PathDistalMargin" field="PathDistalMargin" LookupCode="PancreasSurgMargins"  ShowEmptyListItem="true" >
	    </euc:EformDropDownList>
	</td>	
</tr>
<tr>
	<td class="Pathology_IPMN_LabelCol">Lymph Nodes</td>
	<td id="IPMNLymphNodeToggleContainer" class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="Pathology" LookupCode="YesNoUnknown" FIELD="PathLymphaticInv" id="PathLymphaticInv" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Uncheckable="true" >
        </euc:EformRadioButtonList>
	</td>	
</tr>
</tbody>
<tbody id="IPMNNodePathFindingsContainer" style="display: none;">
 <tr >
	<td class="Pathology_IPMN_LabelCol" >Positive Nodes</td>
	<td >
	<euc:EformTextBox Runat="server" RecordId="1"  table="NodePathFinding"  ID="PathFindPosNodes" field="PathFindPosNodes" style="width:40px;" />
	</td>
</tr>
 <tr >
	<td class="Pathology_IPMN_LabelCol" >Total Nodes</td>
	<td >
	<euc:EformTextBox Runat="server" RecordId="1"  table="NodePathFinding"  ID="PathFindNumNodes" field="PathFindNumNodes" style="width:40px;" />
	</td>
</tr>
</tbody>
<tbody>
 <tr >
	<td class="Pathology_IPMN_LabelCol" style="vertical-align: top;">Notes</td>
	<td >
	<euc:EformTextArea TextMode="MultiLine" TABLE="Pathology" FIELD="PathNotes" RecordId="1" style="width: 200px; height: 140px;"  Runat="server" ID="PathNotes"/>
	
	
	</td>
</tr>
</tbody>
</table>
<br/><br/><br/>

<script type="text/javascript">
    showHideBasedOnRadioToggle($('IPMNLymphNodeToggleContainer'), $('IPMNNodePathFindingsContainer'), 'Yes');
</script>

 