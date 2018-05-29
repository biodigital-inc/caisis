<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.RadTxThoracic" CodeFile="RadTxThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.thoracicRadTxTbl = "thoracicRadTxTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="RadTxThoracic" /><span class="controlBoxTitle">Radiation Therapies</span> <br/>

<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="thoracicRadTxTbl">
        <tr> 
            <td  class="controlBoxDataGridTitleColumn">Start Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Stop Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Total Dose</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Units</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Indication</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Intent</td>
		    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
        </tr>
        
        <asp:Repeater ID="ThoracicRadTxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxStopDateText,RadTxStopDate,RadTxDisease,RadTxType,RadTxTotalDose,RadTxUnits,RadTxTarget,RadTxIndication,RadTxIntent,RadTxQuality', 'RadiationTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxStopDateText")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxType") %>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose") %>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxUnits")%>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxIndication")%>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxIntent")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr>
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="1" TABLE="RadiationTherapy" 
        FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_1"/>
    <euc:EformHidden RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_1"/>
    </td>
    <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="1" TABLE="RadiationTherapy" 
            FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_1"/>
        <euc:EformHidden RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_1"/>
    </td>    
    <td align="center"><euc:EformTextBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_1" 
        Width="90px" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_1" 
        ShowNumberPad="true" Width="60px" /></td>
    <td align="center"><euc:EformDropDownList RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_1" 
        LookupCode="RadTxUnits"/></td>
    <td><euc:EformTextBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_1" Width="70px" 
        ReadOnly="true"/></td>
    <td align="center"><euc:EformDropDownList RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxIntent" Runat="server" 
            ID="RadTxIntent_1" LookupCode="TxIntent,Disease,Thoracic"/>
        
        <euc:EformTextBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_1" 
            style="display:none;width:1px;"/>
        <euc:EformTextBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_1" 
            style="display:none;width:1px;"/>
        <euc:EformTextBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_1" 
            style="display:none;width:1px;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="2" TABLE="RadiationTherapy" 
        FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_2"/>
    <euc:EformHidden RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_2"/>
    </td>
    <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="2" TABLE="RadiationTherapy" 
            FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_2"/>
        <euc:EformHidden RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_2"/>
    </td>    
    <td align="center"><euc:EformTextBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_2" 
        Width="90px" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_2" 
        ShowNumberPad="true" Width="60px" /></td>
    <td align="center"><euc:EformDropDownList RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_2" 
        LookupCode="RadTxUnits"/></td>
    <td><euc:EformTextBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_2" Width="70px" 
        ReadOnly="true"/></td>
    <td align="center"><euc:EformDropDownList RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxIntent" Runat="server" 
            ID="RadTxIntent_2" LookupCode="TxIntent,Disease,Thoracic"/>
        
        <euc:EformTextBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_2" 
            style="display:none;width:1px;"/>
        <euc:EformTextBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_2" 
            style="display:none;width:1px;"/>
        <euc:EformTextBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_2" 
            style="display:none;width:1px;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="3" TABLE="RadiationTherapy" 
        FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_3"/>
    <euc:EformHidden RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_3"/>
    </td>
    <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="3" TABLE="RadiationTherapy" 
            FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_3"/>
        <euc:EformHidden RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_3"/>
    </td>    
    <td align="center"><euc:EformTextBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_3" 
        Width="90px" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_3" 
        ShowNumberPad="true" Width="60px" /></td>
    <td align="center"><euc:EformDropDownList RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_3" 
        LookupCode="RadTxUnits"/></td>
    <td><euc:EformTextBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_3" Width="70px" 
        ReadOnly="true"/></td>
    <td align="center"><euc:EformDropDownList RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxIntent" Runat="server" 
            ID="RadTxIntent_3" LookupCode="TxIntent,Disease,Thoracic"/>
        
        <euc:EformTextBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_3" 
            style="display:none;width:1px;"/>
        <euc:EformTextBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_3" 
            style="display:none;width:1px;"/>
        <euc:EformTextBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_3" 
            style="display:none;width:1px;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="4" TABLE="RadiationTherapy" 
        FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_4"/>
    <euc:EformHidden RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_4"/>
    </td>
    <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="4" TABLE="RadiationTherapy" 
            FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_4"/>
        <euc:EformHidden RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_4"/>
    </td>    
    <td align="center"><euc:EformTextBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_4" 
        Width="90px" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_4" 
        ShowNumberPad="true" Width="60px" /></td>
    <td align="center"><euc:EformDropDownList RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_4" 
        LookupCode="RadTxUnits"/></td>
    <td><euc:EformTextBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_4" Width="70px" 
        ReadOnly="true"/></td>
    <td align="center"><euc:EformDropDownList RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxIntent" Runat="server" 
            ID="RadTxIntent_4" LookupCode="TxIntent,Disease,Thoracic"/>
        
        <euc:EformTextBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_4" 
            style="display:none;width:1px;"/>
        <euc:EformTextBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_4" 
            style="display:none;width:1px;"/>
        <euc:EformTextBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_4" 
            style="display:none;width:1px;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="5" TABLE="RadiationTherapy" 
        FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_5"/>
    <euc:EformHidden RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_5"/>
    </td>
    <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="5" TABLE="RadiationTherapy" 
            FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_5"/>
        <euc:EformHidden RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_5"/>
    </td>    
    <td align="center"><euc:EformTextBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_5" 
        Width="90px" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_5" 
        ShowNumberPad="true" Width="60px" /></td>
    <td align="center"><euc:EformDropDownList RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_5" 
        LookupCode="RadTxUnits"/></td>
    <td><euc:EformTextBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxIndication" Runat="server" ID="RadTxIndication_5" Width="70px" 
        ReadOnly="true"/></td>
    <td align="center"><euc:EformDropDownList RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxIntent" Runat="server" 
            ID="RadTxIntent_5" LookupCode="TxIntent,Disease,Thoracic"/>
        
        <euc:EformTextBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_5" 
            style="display:none;width:1px;"/>
        <euc:EformTextBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_5" 
            style="display:none;width:1px;"/>
        <euc:EformTextBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_5" 
            style="display:none;width:1px;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>

</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'thoracicRadTxTbl');" /><br /><br /><br />


<script type="text/javascript">
    //updates RadTx autopopulates
    function addEvents(radDate,radStopDt,radType,radTDose,radUnits,radDis,radTarget,radIndc,radqlty)
    { 
        $(radDate).addEvent('blur',curry(AutoPopulates,radDate,radStopDt,radType,radTDose,radUnits,radDis,radTarget,radIndc,radqlty));
        $(radStopDt).addEvent('blur',curry(AutoPopulates,radDate,radStopDt,radType,radTDose,radUnits,radDis,radTarget,radIndc,radqlty));
        $(radTDose).addEvent('blur',curry(AutoPopulates,radDate,radStopDt,radType,radTDose,radUnits,radDis,radTarget,radIndc,radqlty));
    } 
    
    addEvents($('<%= RadTxDateText_1.ClientID %>'),$('<%= RadTxStopDateText_1.ClientID %>'),$('<%= RadTxType_1.ClientID %>'),$('<%= RadTxTotalDose_1.ClientID %>'),$('<%= RadTxUnits_1.ClientID %>'),$('<%= RadTxDisease_1.ClientID %>'),$('<%= RadTxTarget_1.ClientID %>'),$('<%= RadTxIndication_1.ClientID %>'),$('<%= RadTxQuality_1.ClientID %>'));
    
    addEvents($('<%= RadTxDateText_2.ClientID %>'),$('<%= RadTxStopDateText_2.ClientID %>'),$('<%= RadTxType_2.ClientID %>'),$('<%= RadTxTotalDose_2.ClientID %>'),$('<%= RadTxUnits_2.ClientID %>'),$('<%= RadTxDisease_2.ClientID %>'),$('<%= RadTxTarget_2.ClientID %>'),$('<%= RadTxIndication_2.ClientID %>'),$('<%= RadTxQuality_2.ClientID %>'));
    
    addEvents($('<%= RadTxDateText_3.ClientID %>'),$('<%= RadTxStopDateText_3.ClientID %>'),$('<%= RadTxType_3.ClientID %>'),$('<%= RadTxTotalDose_3.ClientID %>'),$('<%= RadTxUnits_3.ClientID %>'),$('<%= RadTxDisease_3.ClientID %>'),$('<%= RadTxTarget_3.ClientID %>'),$('<%= RadTxIndication_3.ClientID %>'),$('<%= RadTxQuality_3.ClientID %>'));
    
    addEvents($('<%= RadTxDateText_4.ClientID %>'),$('<%= RadTxStopDateText_4.ClientID %>'),$('<%= RadTxType_4.ClientID %>'),$('<%= RadTxTotalDose_4.ClientID %>'),$('<%= RadTxUnits_4.ClientID %>'),$('<%= RadTxDisease_4.ClientID %>'),$('<%= RadTxTarget_4.ClientID %>'),$('<%= RadTxIndication_4.ClientID %>'),$('<%= RadTxQuality_4.ClientID %>'));
    
    addEvents($('<%= RadTxDateText_5.ClientID %>'),$('<%= RadTxStopDateText_5.ClientID %>'),$('<%= RadTxType_5.ClientID %>'),$('<%= RadTxTotalDose_5.ClientID %>'),$('<%= RadTxUnits_5.ClientID %>'),$('<%= RadTxDisease_5.ClientID %>'),$('<%= RadTxTarget_5.ClientID %>'),$('<%= RadTxIndication_5.ClientID %>'),$('<%= RadTxQuality_5.ClientID %>'));

    function AutoPopulates(radDate,radStopDt,radType,radTDose,radUnits,radDis,radTarget,radIndc,radqlty)
    {
       if (radDate.value != '' || radStopDt.value != '' || radTDose.value != '')
        {
           radType.value = 'External Beam';
           radUnits.value = 'cGy';
           radDis.value = 'Lung Cancer';
           radTarget.value = 'Chest';
           radIndc.value = 'Induction';
           radqlty.value = 'STD';
        }
        else
        {  
           radType.value = '';
           radUnits.value = '';
           radDis.value = '';
           radTarget.value = '';
           radIndc.value = '';
           radqlty.value = '';
        }
    }    
</script>