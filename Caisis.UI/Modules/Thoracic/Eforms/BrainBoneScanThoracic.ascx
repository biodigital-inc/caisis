<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.BrainBoneScanThoracic" CodeFile="BrainBoneScanThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="BrainBoneScanThoracic" /><span class="controlBoxTitle">Brain/Bone Scan</span> <br/>

<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="BrainBoneScanTbl">
  <tr>
		<td  class="controlBoxDataGridTitleColumn">Date</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Scan Type</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Target</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Result</td>
		<td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <asp:Repeater ID="DxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'DxDateText,DxDate,DxType,DxResult,DxTarget,DxQuality', 'Diagnostics');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxType")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxTarget")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxResult")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr>
     <td><euc:EformTextBox RecordId="4" ShowCalendar="True" CalcDate="True" Width="100px" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_4"/>
		    <euc:EformHidden RecordId="4" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_4"/></td>
    <td align="center"><euc:EformDropDownList RecordId="4" Width="100px" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_4">
            <asp:ListItem Text="" Value=""></asp:ListItem>
            <asp:ListItem Text="Brain Scan" Value="Brain Scan"></asp:ListItem>
            <asp:ListItem Text="Bone Scan" Value="Bone Scan"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="center"><euc:EformTextBox RecordId="4" Width="100px" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_4" 
        ReadOnly="true" /></td>
    <td align="center"><euc:EformDropDownList RecordId="4" Width="150px" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_4">
            <asp:ListItem Text="" Value=""></asp:ListItem>
            <asp:ListItem Text="Abnormal Malignant" Value="Abnormal Malignant"></asp:ListItem>
            <asp:ListItem Text="Normal" Value="Normal"></asp:ListItem>
        </euc:EformDropDownList>
        <euc:EformTextBox RecordId="4" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_4"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr>
     <td><euc:EformTextBox RecordId="12" ShowCalendar="True" CalcDate="True" Width="100px" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_12"/>
		    <euc:EformHidden RecordId="12" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_12"/></td>
    <td align="center"><euc:EformDropDownList RecordId="12" Width="100px" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_12">
            <asp:ListItem Text="" Value=""></asp:ListItem>
            <asp:ListItem Text="Brain Scan" Value="Brain Scan"></asp:ListItem>
            <asp:ListItem Text="Bone Scan" Value="Bone Scan"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="center"><euc:EformTextBox RecordId="12" Width="100px" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_12" 
        ReadOnly="true" /></td>
    <td align="center"><euc:EformDropDownList RecordId="12" Width="150px" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_12">
            <asp:ListItem Text="" Value=""></asp:ListItem>
            <asp:ListItem Text="Abnormal Malignant" Value="Abnormal Malignant"></asp:ListItem>
            <asp:ListItem Text="Normal" Value="Normal"></asp:ListItem>
        </euc:EformDropDownList>
        <euc:EformTextBox RecordId="12" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_12"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table><br /><br />
  
<script type="text/javascript">
    //updates Brain/Bone scan details
    function addBBEvents(dxType,dxTarget,dxQlty)
    { 
        $(dxType).addEvent('blur',curry(BBScanAutoPopulates,dxType,dxTarget,dxQlty));
    } 
    addBBEvents($('<%= DxType_4.ClientID %>'),$('<%= DxTarget_4.ClientID %>'),$('<%= DxQuality_4.ClientID %>'));
    addBBEvents($('<%= DxType_12.ClientID %>'),$('<%= DxTarget_12.ClientID %>'),$('<%= DxQuality_12.ClientID %>'));

    function BBScanAutoPopulates(dxType,dxTarget,dxQlty)
    {
       if (dxType.value == 'Brain Scan')
        {
           dxTarget.value = 'Brain';
           dxQlty.value = 'STD';
        }
        else if (dxType.value == 'Bone Scan')
        {
           dxTarget.value = 'Bone';
           dxQlty.value = 'STD';
        }
        else if(dxType.value == '')
        {
            dxTarget.value = '';
            dxQlty.value = '';
        }
    }
</script>
