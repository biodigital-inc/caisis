<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.FUDxThoracic" CodeFile="FUDxThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.FUDxTbl = "FUDxTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="FUDxThoracic" /><span class="controlBoxTitle">Diagnostics</span> <br/>


<table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="FUDxTbl">
  <tr>
    <td  class="controlBoxDataGridTitleColumn">Date</td>
    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Indication</td>
    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Target</td>
    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Result</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>

  <tr>
     <td><euc:EformTextBox RecordId="7" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Diagnostics" FIELD="DxDateText" 
        Runat="server" ID="DxDateText_7"/>
            <euc:EformHidden RecordId="7" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_7"/></td>
    <td align="center"><euc:EformDropDownList RecordId="7" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_7" 
        LookupCode="ThoracicDxType" Width="100px"/></td>
    <td align="center"><euc:EformTextBox RecordId="7" Width="100px" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" 
        ID="DxIndication_7" ReadOnly="true"/></td>
    <td align="center"><euc:EformComboBox RecordId="7" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_7" 
        LookupCode="DxTarget" Width="100px"/></td>
    <td align="center"><euc:EformTextBox RecordId="7" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_7" Width="120px"/>  
        <euc:EformTextBox RecordId="7" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" 
            ID="DxQuality_7"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
</tr>

<tr style="display:none;">
     <td><euc:EformTextBox RecordId="8" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Diagnostics" FIELD="DxDateText" 
        Runat="server" ID="DxDateText_8"/>
            <euc:EformHidden RecordId="8" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_8"/></td>
    <td align="center"><euc:EformDropDownList RecordId="8" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_8" 
        LookupCode="ThoracicDxType" Width="100px"/></td>
    <td align="center"><euc:EformTextBox RecordId="8" Width="100px" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" 
        ID="DxIndication_8" ReadOnly="true"/></td>
    <td align="center"><euc:EformComboBox RecordId="8" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_8" 
        LookupCode="DxTarget" Width="100px"/></td>
    <td align="center"><euc:EformTextBox RecordId="8" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_8" Width="120px"/>
        <euc:EformTextBox RecordId="8" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" 
            ID="DxQuality_8"/></td>
    <td><euc:EformDeleteIcon runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
</tr>

<tr style="display:none;">
     <td><euc:EformTextBox RecordId="9" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Diagnostics" FIELD="DxDateText" 
        Runat="server" ID="DxDateText_9"/>
            <euc:EformHidden RecordId="9" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_9"/></td>
    <td align="center"><euc:EformDropDownList RecordId="9" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_9" 
        LookupCode="ThoracicDxType" Width="100px"/></td>
    <td align="center"><euc:EformTextBox RecordId="9" Width="100px" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" 
        ID="DxIndication_9" ReadOnly="true"/></td>
    <td align="center"><euc:EformComboBox RecordId="9" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_9" 
        LookupCode="DxTarget" Width="100px"/></td>
    <td align="center"><euc:EformTextBox RecordId="9" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_9" Width="120px"/>
        <euc:EformTextBox RecordId="9" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" 
            ID="DxQuality_9"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
</tr>

<tr style="display:none;">
     <td><euc:EformTextBox RecordId="10" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Diagnostics" FIELD="DxDateText" 
        Runat="server" ID="DxDateText_10"/>
            <euc:EformHidden RecordId="10" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_10"/></td>
    <td align="center"><euc:EformDropDownList RecordId="10" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_10" 
        LookupCode="ThoracicDxType" Width="100px"/></td>
    <td align="center"><euc:EformTextBox RecordId="10" Width="100px" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" 
        ID="DxIndication_10" ReadOnly="true"/></td>
    <td align="center"><euc:EformComboBox RecordId="10" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_10" 
        LookupCode="DxTarget" Width="100px"/></td>
    <td align="center"><euc:EformTextBox RecordId="10" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_10" Width="120px"/>
        <euc:EformTextBox RecordId="10" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" 
            ID="DxQuality_10"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
</tr>

<tr style="display:none;">
     <td><euc:EformTextBox RecordId="11" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Diagnostics" FIELD="DxDateText" 
        Runat="server" ID="DxDateText_11"/>
            <euc:EformHidden RecordId="11" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_11"/></td>
    <td align="center"><euc:EformDropDownList RecordId="11" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_11" 
        LookupCode="ThoracicDxType" Width="100px"/></td>
    <td align="center"><euc:EformTextBox RecordId="11" Width="100px" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" 
        ID="DxIndication_11" ReadOnly="true"/></td>
    <td align="center"><euc:EformComboBox RecordId="11" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_11" 
        LookupCode="DxTarget" Width="100px"/></td>
    <td align="center"><euc:EformTextBox RecordId="11" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_11" Width="120px"/>
        <euc:EformTextBox RecordId="11" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" 
            ID="DxQuality_11"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
</tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'FUDxTbl');" /><br />

<script type="text/javascript">
    function addEvnt(dxDate,dxType,dxIndc,dxTarget,dxResult)
    { 
        $(dxDate).addEvent('blur',curry(FUDxUpdates,dxDate,dxType,dxIndc,dxTarget,dxResult));
        $(dxType).addEvent('blur',curry(FUDxUpdates,dxDate,dxType,dxIndc,dxTarget,dxResult));
    } 
    addEvnt($('<%= DxDateText_7.ClientID %>'),$('<%= DxType_7.ClientID %>'),$('<%= DxIndication_7.ClientID %>'),$('<%= DxTarget_7.ClientID %>'),$('<%= DxResult_7.ClientID %>'));
    addEvnt($('<%= DxDateText_8.ClientID %>'),$('<%= DxType_8.ClientID %>'),$('<%= DxIndication_8.ClientID %>'),$('<%= DxTarget_8.ClientID %>'),$('<%= DxResult_8.ClientID %>'));
    addEvnt($('<%= DxDateText_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxIndication_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'));
    addEvnt($('<%= DxDateText_10.ClientID %>'),$('<%= DxType_10.ClientID %>'),$('<%= DxIndication_10.ClientID %>'),$('<%= DxTarget_10.ClientID %>'),$('<%= DxResult_10.ClientID %>'));
    addEvnt($('<%= DxDateText_11.ClientID %>'),$('<%= DxType_11.ClientID %>'),$('<%= DxIndication_11.ClientID %>'),$('<%= DxTarget_11.ClientID %>'),$('<%= DxResult_11.ClientID %>'));

    function FUDxUpdates(dxDate,dxType,dxIndc,dxTarget,dxResult)
    {
       if (dxDate.value != '' || dxType.value != '')
        {
           dxIndc.value = 'Follow Up';
           dxTarget.value = 'Chest';
           dxResult.value = 'Abnormal/Malignant';
        }
        else
        {
            dxIndc.value = '';
            dxTarget.value = '';
            dxResult.value = '';
        }
    }
    
</script>