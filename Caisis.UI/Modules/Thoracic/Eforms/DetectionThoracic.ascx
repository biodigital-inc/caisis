<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.DetectionThoracic" CodeFile="DetectionThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="DetectionThoracic" /><span class="controlBoxTitle">Detection</span> <br/>

<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DetectionTbl">
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
     <td><euc:EformTextBox RecordId="1" ShowCalendar="True" CalcDate="True" Width="100px" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_1"/></td>
    <td align="center"><euc:EformComboBox RecordId="1" Width="100px" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_1" 
        LookupCode="DxType,Disease,Thoracic" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformTextBox RecordId="1" Width="100px" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_1" 
        ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="1" Width="150px" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_1" 
        ReadOnly="true"/>
        <euc:EformTextBox RecordId="1" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_1"/>
    
    <%--PathNotes is updated Prior lung resection and cancer details from previous page in this Eformsection--%>  
        <euc:EformTextBox Table="NoTable" Field="PriorLungResection" Runat="server" id="PriorLungResection" Width="1px" style="display:none;"/>
        <euc:EformTextBox TABLE="NoTable" FIELD="PriorLungCancer" Runat="server" ID="PriorLungCancer" Width="1px" style="display:none;"/>            
        <euc:EformTextBox id="PathNotes_1" RecordId="1" Table="Pathology" Field="PathNotes" runat="server" Width="1px" style="display:none;"/>
    <%--END--%>
    </td>
    <td><euc:EformDeleteIcon runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table><br /><br />
  
<script type="text/javascript">
    //Adds events to controls
    function addEvents(dxDate,dxType,dxResult,dxTarget,dxQlty)
    { 
        $(dxDate).addEvent('blur',curry(AutoPopulates,dxDate,dxType,dxResult,dxTarget,dxQlty));
        $(dxType).addEvent('blur',curry(AutoPopulates,dxDate,dxType,dxResult,dxTarget,dxQlty));
    }
 
    addEvents($('<%= DxDateText_1.ClientID %>'),$('<%= DxType_1.ClientID %>'),$('<%= DxResult_1.ClientID %>'),$('<%= DxTarget_1.ClientID %>'),$('<%= DxQuality_1.ClientID %>'));


    function AutoPopulates(dxDate,dxType,dxResult,dxTarget,dxQlty)
    {
       if (dxDate.value != '' || dxType.value != '')
        {
           dxResult.value = 'Suspicious - Detection';
           dxTarget.value = 'Chest';
           dxQlty.value = 'STD';
        }
        else
        {
            dxResult.value = '';
            dxTarget.value = '';
            dxQlty.value = '';
        }
    }
</script>