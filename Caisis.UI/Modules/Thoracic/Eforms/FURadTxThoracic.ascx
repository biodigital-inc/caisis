<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.FURadTxThoracic" CodeFile="FURadTxThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.FURadTxTbl = "FURadTxTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="FURadTxThoracic" /><span class="controlBoxTitle">Radiation Therapies</span> <br/>

<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="FURadTxTbl">
        <tr> 
            <td  class="controlBoxDataGridTitleColumn">Start Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Indication</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
		    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
        </tr>
        
        <asp:Repeater ID="FURadTxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxDisease,RadTxType,RadTxIndication,RadTxQuality', 'RadiationTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxType") %>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxIndication")%>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxDisease")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr>
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="6" TABLE="RadiationTherapy" 
        FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_6"/>
    <euc:EformHidden RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_6"/>
    </td>  
    <td align="center"><euc:EformTextBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_6" Width="120px" 
        ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_6" 
        Width="100px" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_6" 
        Width="100px" ReadOnly="true"/>
        <euc:EformTextBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_6" 
            style="display:none;width:1px;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="7" TABLE="RadiationTherapy" 
        FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_7"/>
    <euc:EformHidden RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_7"/>
    </td>  
    <td align="center"><euc:EformTextBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_7" Width="120px" 
         ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_7" 
        Width="100px" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_7" 
        Width="100px" ReadOnly="true"/>
        <euc:EformTextBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_7" 
            style="display:none;width:1px;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="8" TABLE="RadiationTherapy" 
        FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_8"/>
    <euc:EformHidden RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_8"/>
    </td>  
    <td align="center"><euc:EformTextBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_8" Width="120px" 
         ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_8" 
        Width="100px" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_8" 
        Width="100px" ReadOnly="true"/>
        <euc:EformTextBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_8" 
            style="display:none;width:1px;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="9" TABLE="RadiationTherapy" 
        FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_9"/>
    <euc:EformHidden RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_9"/>
    </td>  
    <td align="center"><euc:EformTextBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_9" Width="120px" 
         ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_9" 
        Width="100px" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_9" 
        Width="100px" ReadOnly="true"/>
        <euc:EformTextBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_9" 
            style="display:none;width:1px;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="10" TABLE="RadiationTherapy" 
        FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_10"/>
    <euc:EformHidden RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_10"/>
    </td>  
    <td align="center"><euc:EformTextBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_10" Width="120px" 
         ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_10" 
        Width="100px" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_10" 
        Width="100px" ReadOnly="true"/>
        <euc:EformTextBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_10" 
            style="display:none;width:1px;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'FURadTxTbl');" /><br /><br /><br />

<script type="text/javascript">
    //updates RadTx autopopulates
    function addEvents(radDate,radType,radDis,radIndc,radqlty)
    { 
        $(radDate).addEvent('blur',curry(AutoPopulates,radDate,radType,radDis,radIndc,radqlty));
    } 
    
    addEvents($('<%= RadTxDateText_6.ClientID %>'),$('<%= RadTxType_6.ClientID %>'),$('<%= RadTxDisease_6.ClientID %>'),$('<%= RadTxIndication_6.ClientID %>'),$('<%= RadTxQuality_6.ClientID %>'));
    addEvents($('<%= RadTxDateText_7.ClientID %>'),$('<%= RadTxType_7.ClientID %>'),$('<%= RadTxDisease_7.ClientID %>'),$('<%= RadTxIndication_7.ClientID %>'),$('<%= RadTxQuality_7.ClientID %>'));
    addEvents($('<%= RadTxDateText_8.ClientID %>'),$('<%= RadTxType_8.ClientID %>'),$('<%= RadTxDisease_8.ClientID %>'),$('<%= RadTxIndication_8.ClientID %>'),$('<%= RadTxQuality_8.ClientID %>'));
    addEvents($('<%= RadTxDateText_9.ClientID %>'),$('<%= RadTxType_9.ClientID %>'),$('<%= RadTxDisease_9.ClientID %>'),$('<%= RadTxIndication_9.ClientID %>'),$('<%= RadTxQuality_9.ClientID %>'));
    addEvents($('<%= RadTxDateText_10.ClientID %>'),$('<%= RadTxType_10.ClientID %>'),$('<%= RadTxDisease_10.ClientID %>'),$('<%= RadTxIndication_10.ClientID %>'),$('<%= RadTxQuality_10.ClientID %>'));

    function AutoPopulates(radDate,radType,radDis,radIndc,radqlty)
    {
       if (radDate.value != '')
        {
           radType.value = 'External Beam';
           radDis.value = 'Lung Cancer';
           radIndc.value = 'Adjuvant';
           radqlty.value = 'STD';
        }
        else
        {  
           radType.value = '';
           radDis.value = '';
           radIndc.value = '';
           radqlty.value = '';
        }
    }    
</script>