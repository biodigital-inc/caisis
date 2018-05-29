<%@ Control Language="C#" Inherits="Caisis.UI.Modules.HeadNeck.EForms.SalivaryGlandRadiationTx2" CodeFile="SalivaryGlandRadiationTx2.ascx.cs"  CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.SalivaryGlandRadiationTx2HtmlTable = "SalivaryGlandRadiationTx2HtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="SalivaryGlandRadiationTx2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>

<table width="200" cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue">
    <tr>
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle">Radiation Therapy ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="RadTxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="RadTxRecorded">
                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </euc:EformRadioButtonList>
        </td>
    </tr>
</table>

<br />

<div id="RadTxDiv" runat="server" style="display: none;">
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SalivaryGlandRadiationTx2HtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Start Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Stop Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Target</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Schedule of Treatment</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; ">Dose to Primary (cGy)</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; ">Dose to Neck (cGy)<br />(if applicable)</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Data Quality</td>
    <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="XRT" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxStopDateText,RadTxStopDate,RadTxDisease,RadTxType,RadTxTarget,RadTxTotalDose,RadTxDosePerFraction,RadTxUnits,RadTxSchedule,RadTxQuality', 'RadiationTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxStopDateText")%></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxType")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxTarget")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxSchedule")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxDosePerFraction")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxQuality")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater> 
  
    <%--Fields that should already be populated from  SalivaryGlandProcedurePrimary control--%>
    <euc:EformTextBox Width="1px" style="display: none;" RecordId="16" ParentRecordId="16"  ID="ProcSite" TABLE="Procedures" FIELD="ProcSite" Runat="server" />
    <euc:EformTextBox Width="1px" style="display: none;" RecordId="16" ParentRecordId="16"  ID="ProcSubsite" TABLE="Procedures" FIELD="ProcSubsite" Runat="server" />

  <tr >
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_11" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="11" TABLE="RadiationTherapy" Field="RadTxDate" ID="RadTxDate_11" Runat="server" />    

        <euc:EformTextBox Width="1px" style="display: none;" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_11" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxUnits" ID="RadTxUnits_11" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxTarget" ID="RadTxTarget_11" Runat="server" /></td> 

    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_11" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="11" TABLE="RadiationTherapy" Field="RadTxStopDate" ID="RadTxStopDate_11" Runat="server" /></td>    
        
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_11" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Cobalt" Text="Cobalt"></asp:ListItem>
            <asp:ListItem Value="Photons" Text="Photons"></asp:ListItem>
            <asp:ListItem Value="Electrons" Text="Electrons"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " TABLE="NoTable" FIELD="RadTxTargetText_11" ID="RadTxTargetText_11" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Primary" Text="Primary"></asp:ListItem>
            <asp:ListItem Value="Neck" Text="Neck"></asp:ListItem>
            <asp:ListItem Value="Primary and Neck" Text="Primary and Neck"></asp:ListItem>
        </euc:EformDropDownList></td>

    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxSchedule" ID="RadTxSchedule_11" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Fractionation" Text="Fractionation"></asp:ListItem>
            <asp:ListItem Value="Hyperaccelerated" Text="Hyperaccelerated"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" ID="RadTxTotalDose_11" Runat="server"  /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxDosePerFraction" ID="RadTxDosePerFraction_11" Runat="server"   /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_11" LookupCode="DataQuality"  Runat="server"   /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_11"  runat="server" /></td>

  </tr>

  <tr style="display: none;" >
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_12" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="12" TABLE="RadiationTherapy" Field="RadTxDate" ID="RadTxDate_12" Runat="server" />    

        <euc:EformTextBox Width="1px" style="display: none;" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_12" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxUnits" ID="RadTxUnits_12" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxTarget" ID="RadTxTarget_12" Runat="server" /></td>

    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_12" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="12" TABLE="RadiationTherapy" Field="RadTxStopDate" ID="RadTxStopDate_12" Runat="server" />   </td> 
    
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_12" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Cobalt" Text="Cobalt"></asp:ListItem>
            <asp:ListItem Value="Photons" Text="Photons"></asp:ListItem>
            <asp:ListItem Value="Electrons" Text="Electrons"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " TABLE="NoTable" FIELD="RadTxTargetText_12" ID="RadTxTargetText_12" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Primary" Text="Primary"></asp:ListItem>
            <asp:ListItem Value="Neck" Text="Neck"></asp:ListItem>
            <asp:ListItem Value="Primary and Neck" Text="Primary and Neck"></asp:ListItem>
        </euc:EformDropDownList></td>

    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxSchedule" ID="RadTxSchedule_12" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Fractionation" Text="Fractionation"></asp:ListItem>
            <asp:ListItem Value="Hyperaccelerated" Text="Hyperaccelerated"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" ID="RadTxTotalDose_12" Runat="server"  /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxDosePerFraction" ID="RadTxDosePerFraction_12" Runat="server"   /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_12" LookupCode="DataQuality"  Runat="server"   /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_12"  runat="server" /></td>

  </tr>

  <tr style="display: none;" >
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_13" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="13" TABLE="RadiationTherapy" Field="RadTxDate" ID="RadTxDate_13" Runat="server" />    

        <euc:EformTextBox Width="1px" style="display: none;" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_13" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxUnits" ID="RadTxUnits_13" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxTarget" ID="RadTxTarget_13" Runat="server" /></td>

    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_13" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="13" TABLE="RadiationTherapy" Field="RadTxStopDate" ID="RadTxStopDate_13" Runat="server" /> </td>   
    
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_13" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Cobalt" Text="Cobalt"></asp:ListItem>
            <asp:ListItem Value="Photons" Text="Photons"></asp:ListItem>
            <asp:ListItem Value="Electrons" Text="Electrons"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " TABLE="NoTable" FIELD="RadTxTargetText_13" ID="RadTxTargetText_13" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Primary" Text="Primary"></asp:ListItem>
            <asp:ListItem Value="Neck" Text="Neck"></asp:ListItem>
            <asp:ListItem Value="Primary and Neck" Text="Primary and Neck"></asp:ListItem>
        </euc:EformDropDownList></td>

    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxSchedule" ID="RadTxSchedule_13" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Fractionation" Text="Fractionation"></asp:ListItem>
            <asp:ListItem Value="Hyperaccelerated" Text="Hyperaccelerated"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" ID="RadTxTotalDose_13" Runat="server"  /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxDosePerFraction" ID="RadTxDosePerFraction_13" Runat="server"   /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_13" LookupCode="DataQuality"  Runat="server"   /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_13"  runat="server" /></td>

  </tr>

  <tr style="display: none;" >
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_14" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="14" TABLE="RadiationTherapy" Field="RadTxDate" ID="RadTxDate_14" Runat="server" />    

        <euc:EformTextBox Width="1px" style="display: none;" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_14" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxUnits" ID="RadTxUnits_14" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxTarget" ID="RadTxTarget_14" Runat="server" /></td>

    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_14" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="14" TABLE="RadiationTherapy" Field="RadTxStopDate" ID="RadTxStopDate_14" Runat="server" />    </td>
    
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_14" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Cobalt" Text="Cobalt"></asp:ListItem>
            <asp:ListItem Value="Photons" Text="Photons"></asp:ListItem>
            <asp:ListItem Value="Electrons" Text="Electrons"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " TABLE="NoTable" FIELD="RadTxTargetText_14" ID="RadTxTargetText_14" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Primary" Text="Primary"></asp:ListItem>
            <asp:ListItem Value="Neck" Text="Neck"></asp:ListItem>
            <asp:ListItem Value="Primary and Neck" Text="Primary and Neck"></asp:ListItem>
        </euc:EformDropDownList></td>

    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxSchedule" ID="RadTxSchedule_14" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Fractionation" Text="Fractionation"></asp:ListItem>
            <asp:ListItem Value="Hyperaccelerated" Text="Hyperaccelerated"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" ID="RadTxTotalDose_14" Runat="server"  /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxDosePerFraction" ID="RadTxDosePerFraction_14" Runat="server"   /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_14" LookupCode="DataQuality"  Runat="server"   /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_14"  runat="server" /></td>

  </tr>

  <tr style="display: none;" >
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_15" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="15" TABLE="RadiationTherapy" Field="RadTxDate" ID="RadTxDate_15" Runat="server" />    

        <euc:EformTextBox Width="1px" style="display: none;" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_15" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxUnits" ID="RadTxUnits_15" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxTarget" ID="RadTxTarget_15" Runat="server" /></td>

    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_15" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="15" TABLE="RadiationTherapy" Field="RadTxStopDate" ID="RadTxStopDate_15" Runat="server" />    </td>
    
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_15" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Cobalt" Text="Cobalt"></asp:ListItem>
            <asp:ListItem Value="Photons" Text="Photons"></asp:ListItem>
            <asp:ListItem Value="Electrons" Text="Electrons"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " TABLE="NoTable" FIELD="RadTxTargetText_15" ID="RadTxTargetText_15" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Primary" Text="Primary"></asp:ListItem>
            <asp:ListItem Value="Neck" Text="Neck"></asp:ListItem>
            <asp:ListItem Value="Primary and Neck" Text="Primary and Neck"></asp:ListItem>
        </euc:EformDropDownList></td>

    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxSchedule" ID="RadTxSchedule_15" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Fractionation" Text="Fractionation"></asp:ListItem>
            <asp:ListItem Value="Hyperaccelerated" Text="Hyperaccelerated"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" ID="RadTxTotalDose_15" Runat="server"  /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxDosePerFraction" ID="RadTxDosePerFraction_15" Runat="server"   /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_15" LookupCode="DataQuality"  Runat="server"   /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_15"  runat="server" /></td>

  </tr>

  <tr style="display: none;" >
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_16" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="16" TABLE="RadiationTherapy" Field="RadTxDate" ID="RadTxDate_16" Runat="server" />    

        <euc:EformTextBox Width="1px" style="display: none;" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_16" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxUnits" ID="RadTxUnits_16" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxTarget" ID="RadTxTarget_16" Runat="server" /></td>

    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_16" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="16" TABLE="RadiationTherapy" Field="RadTxStopDate" ID="RadTxStopDate_16" Runat="server" />    </td>
    
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_16" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Cobalt" Text="Cobalt"></asp:ListItem>
            <asp:ListItem Value="Photons" Text="Photons"></asp:ListItem>
            <asp:ListItem Value="Electrons" Text="Electrons"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " TABLE="NoTable" FIELD="RadTxTargetText_16" ID="RadTxTargetText_16" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Primary" Text="Primary"></asp:ListItem>
            <asp:ListItem Value="Neck" Text="Neck"></asp:ListItem>
            <asp:ListItem Value="Primary and Neck" Text="Primary and Neck"></asp:ListItem>
        </euc:EformDropDownList></td>

    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxSchedule" ID="RadTxSchedule_16" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Fractionation" Text="Fractionation"></asp:ListItem>
            <asp:ListItem Value="Hyperaccelerated" Text="Hyperaccelerated"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" ID="RadTxTotalDose_16" Runat="server"  /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxDosePerFraction" ID="RadTxDosePerFraction_16" Runat="server"   /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_16" LookupCode="DataQuality"  Runat="server"   /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_16"  runat="server" /></td>

  </tr>

  <tr style="display: none;" >
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_17" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="17" TABLE="RadiationTherapy" Field="RadTxDate" ID="RadTxDate_17" Runat="server" />    

        <euc:EformTextBox Width="1px" style="display: none;" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_17" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxUnits" ID="RadTxUnits_17" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxTarget" ID="RadTxTarget_17" Runat="server" /></td>
 
     <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_17" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="17" TABLE="RadiationTherapy" Field="RadTxStopDate" ID="RadTxStopDate_17" Runat="server" />    </td>
   
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_17" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Cobalt" Text="Cobalt"></asp:ListItem>
            <asp:ListItem Value="Photons" Text="Photons"></asp:ListItem>
            <asp:ListItem Value="Electrons" Text="Electrons"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " TABLE="NoTable" FIELD="RadTxTargetText_17" ID="RadTxTargetText_17" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Primary" Text="Primary"></asp:ListItem>
            <asp:ListItem Value="Neck" Text="Neck"></asp:ListItem>
            <asp:ListItem Value="Primary and Neck" Text="Primary and Neck"></asp:ListItem>
        </euc:EformDropDownList></td>

    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxSchedule" ID="RadTxSchedule_17" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Fractionation" Text="Fractionation"></asp:ListItem>
            <asp:ListItem Value="Hyperaccelerated" Text="Hyperaccelerated"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" ID="RadTxTotalDose_17" Runat="server"  /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxDosePerFraction" ID="RadTxDosePerFraction_17" Runat="server"   /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_17" LookupCode="DataQuality"  Runat="server"   /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_17"  runat="server" /></td>

  </tr>

  <tr style="display: none;" >
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_18" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="18" TABLE="RadiationTherapy" Field="RadTxDate" ID="RadTxDate_18" Runat="server" />    

        <euc:EformTextBox Width="1px" style="display: none;" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_18" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxUnits" ID="RadTxUnits_18" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxTarget" ID="RadTxTarget_18" Runat="server" /></td>

    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_18" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="18" TABLE="RadiationTherapy" Field="RadTxStopDate" ID="RadTxStopDate_18" Runat="server" />    </td>
    
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_18" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Cobalt" Text="Cobalt"></asp:ListItem>
            <asp:ListItem Value="Photons" Text="Photons"></asp:ListItem>
            <asp:ListItem Value="Electrons" Text="Electrons"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " TABLE="NoTable" FIELD="RadTxTargetText_18" ID="RadTxTargetText_18" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Primary" Text="Primary"></asp:ListItem>
            <asp:ListItem Value="Neck" Text="Neck"></asp:ListItem>
            <asp:ListItem Value="Primary and Neck" Text="Primary and Neck"></asp:ListItem>
        </euc:EformDropDownList></td>

    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxSchedule" ID="RadTxSchedule_18" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Fractionation" Text="Fractionation"></asp:ListItem>
            <asp:ListItem Value="Hyperaccelerated" Text="Hyperaccelerated"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" ID="RadTxTotalDose_18" Runat="server"  /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxDosePerFraction" ID="RadTxDosePerFraction_18" Runat="server"   /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_18" LookupCode="DataQuality"  Runat="server"   /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_18"  runat="server" /></td>

  </tr>

  <tr style="display: none;" >
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_19" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="19" TABLE="RadiationTherapy" Field="RadTxDate" ID="RadTxDate_19" Runat="server" />    

        <euc:EformTextBox Width="1px" style="display: none;" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_19" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxUnits" ID="RadTxUnits_19" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxTarget" ID="RadTxTarget_19" Runat="server" /></td>
 
     <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_19" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="19" TABLE="RadiationTherapy" Field="RadTxStopDate" ID="RadTxStopDate_19" Runat="server" />    </td>
   
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_19" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Cobalt" Text="Cobalt"></asp:ListItem>
            <asp:ListItem Value="Photons" Text="Photons"></asp:ListItem>
            <asp:ListItem Value="Electrons" Text="Electrons"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " TABLE="NoTable" FIELD="RadTxTargetText_19" ID="RadTxTargetText_19" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Primary" Text="Primary"></asp:ListItem>
            <asp:ListItem Value="Neck" Text="Neck"></asp:ListItem>
            <asp:ListItem Value="Primary and Neck" Text="Primary and Neck"></asp:ListItem>
        </euc:EformDropDownList></td>

    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxSchedule" ID="RadTxSchedule_19" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Fractionation" Text="Fractionation"></asp:ListItem>
            <asp:ListItem Value="Hyperaccelerated" Text="Hyperaccelerated"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" ID="RadTxTotalDose_19" Runat="server"  /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxDosePerFraction" ID="RadTxDosePerFraction_19" Runat="server"   /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_19" LookupCode="DataQuality"  Runat="server"   /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_19"  runat="server" /></td>

  </tr>

  <tr style="display: none;" >
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_20" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="20" TABLE="RadiationTherapy" Field="RadTxDate" ID="RadTxDate_20" Runat="server" />    

        <euc:EformTextBox Width="1px" style="display: none;" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_20" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxUnits" ID="RadTxUnits_20" Runat="server" />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxTarget" ID="RadTxTarget_20" Runat="server" /></td>
 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_20" Runat="server"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden               RecordId="20" TABLE="RadiationTherapy" Field="RadTxStopDate" ID="RadTxStopDate_20" Runat="server" />    </td>
    
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_20" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Cobalt" Text="Cobalt"></asp:ListItem>
            <asp:ListItem Value="Photons" Text="Photons"></asp:ListItem>
            <asp:ListItem Value="Electrons" Text="Electrons"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " TABLE="NoTable" FIELD="RadTxTargetText_20" ID="RadTxTargetText_20" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Primary" Text="Primary"></asp:ListItem>
            <asp:ListItem Value="Neck" Text="Neck"></asp:ListItem>
            <asp:ListItem Value="Primary and Neck" Text="Primary and Neck"></asp:ListItem>
        </euc:EformDropDownList></td>

    <td align="left" style="white-space: nowrap;">
        <euc:EformDropDownList Width="100px " RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxSchedule" ID="RadTxSchedule_20" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Fractionation" Text="Fractionation"></asp:ListItem>
            <asp:ListItem Value="Hyperaccelerated" Text="Hyperaccelerated"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" ID="RadTxTotalDose_20" Runat="server"  /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformTextBox Width="100px" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxDosePerFraction" ID="RadTxDosePerFraction_20" Runat="server"   /></td>
    <td align="left" style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_20" LookupCode="DataQuality"  Runat="server"   /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_110"  runat="server" /></td>

  </tr>
  
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'SalivaryGlandRadiationTx2HtmlTable');" />
</div>
<br/><br /><br />

<script type="text/javascript" language="javascript">

     /* <![CDATA[ */ 
 
   /* ****************************************************************************************  */ 
   /* ****************************************************************************************  */ 
   /* ****************************************************************************************  */ 

    addEvents($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxDateText_11.ClientID %>'),$('<%= RadTxDate_11.ClientID %>'),$('<%= RadTxStopDateText_11.ClientID %>'),$('<%= RadTxStopDate_11.ClientID %>'),$('<%= RadTxDisease_11.ClientID %>'),$('<%= RadTxUnits_11.ClientID %>'),$('<%= RadTxTarget_11.ClientID %>'),$('<%= ProcSite.ClientID %>').value,$('<%= ProcSubsite.ClientID %>').value,$('<%= RadTxType_11.ClientID %>'),$('<%= RadTxTargetText_11.ClientID %>'),$('<%= RadTxSchedule_11.ClientID %>'),$('<%= RadTxTotalDose_11.ClientID %>'),$('<%= RadTxDosePerFraction_11.ClientID %>'),$('<%= RadTxQuality_11.ClientID %>'));
    addEvents($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxDateText_12.ClientID %>'),$('<%= RadTxDate_12.ClientID %>'),$('<%= RadTxStopDateText_12.ClientID %>'),$('<%= RadTxStopDate_12.ClientID %>'),$('<%= RadTxDisease_12.ClientID %>'),$('<%= RadTxUnits_12.ClientID %>'),$('<%= RadTxTarget_12.ClientID %>'),$('<%= ProcSite.ClientID %>').value,$('<%= ProcSubsite.ClientID %>').value,$('<%= RadTxType_12.ClientID %>'),$('<%= RadTxTargetText_12.ClientID %>'),$('<%= RadTxSchedule_12.ClientID %>'),$('<%= RadTxTotalDose_12.ClientID %>'),$('<%= RadTxDosePerFraction_12.ClientID %>'),$('<%= RadTxQuality_12.ClientID %>'));
    addEvents($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxDateText_13.ClientID %>'),$('<%= RadTxDate_13.ClientID %>'),$('<%= RadTxStopDateText_13.ClientID %>'),$('<%= RadTxStopDate_13.ClientID %>'),$('<%= RadTxDisease_13.ClientID %>'),$('<%= RadTxUnits_13.ClientID %>'),$('<%= RadTxTarget_13.ClientID %>'),$('<%= ProcSite.ClientID %>').value,$('<%= ProcSubsite.ClientID %>').value,$('<%= RadTxType_13.ClientID %>'),$('<%= RadTxTargetText_13.ClientID %>'),$('<%= RadTxSchedule_13.ClientID %>'),$('<%= RadTxTotalDose_13.ClientID %>'),$('<%= RadTxDosePerFraction_13.ClientID %>'),$('<%= RadTxQuality_13.ClientID %>'));
    addEvents($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxDateText_14.ClientID %>'),$('<%= RadTxDate_14.ClientID %>'),$('<%= RadTxStopDateText_14.ClientID %>'),$('<%= RadTxStopDate_14.ClientID %>'),$('<%= RadTxDisease_14.ClientID %>'),$('<%= RadTxUnits_14.ClientID %>'),$('<%= RadTxTarget_14.ClientID %>'),$('<%= ProcSite.ClientID %>').value,$('<%= ProcSubsite.ClientID %>').value,$('<%= RadTxType_14.ClientID %>'),$('<%= RadTxTargetText_14.ClientID %>'),$('<%= RadTxSchedule_14.ClientID %>'),$('<%= RadTxTotalDose_14.ClientID %>'),$('<%= RadTxDosePerFraction_14.ClientID %>'),$('<%= RadTxQuality_14.ClientID %>'));
    addEvents($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxDateText_15.ClientID %>'),$('<%= RadTxDate_15.ClientID %>'),$('<%= RadTxStopDateText_15.ClientID %>'),$('<%= RadTxStopDate_15.ClientID %>'),$('<%= RadTxDisease_15.ClientID %>'),$('<%= RadTxUnits_15.ClientID %>'),$('<%= RadTxTarget_15.ClientID %>'),$('<%= ProcSite.ClientID %>').value,$('<%= ProcSubsite.ClientID %>').value,$('<%= RadTxType_15.ClientID %>'),$('<%= RadTxTargetText_15.ClientID %>'),$('<%= RadTxSchedule_15.ClientID %>'),$('<%= RadTxTotalDose_15.ClientID %>'),$('<%= RadTxDosePerFraction_15.ClientID %>'),$('<%= RadTxQuality_15.ClientID %>'));
    addEvents($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxDateText_16.ClientID %>'),$('<%= RadTxDate_16.ClientID %>'),$('<%= RadTxStopDateText_16.ClientID %>'),$('<%= RadTxStopDate_16.ClientID %>'),$('<%= RadTxDisease_16.ClientID %>'),$('<%= RadTxUnits_16.ClientID %>'),$('<%= RadTxTarget_16.ClientID %>'),$('<%= ProcSite.ClientID %>').value,$('<%= ProcSubsite.ClientID %>').value,$('<%= RadTxType_16.ClientID %>'),$('<%= RadTxTargetText_16.ClientID %>'),$('<%= RadTxSchedule_16.ClientID %>'),$('<%= RadTxTotalDose_16.ClientID %>'),$('<%= RadTxDosePerFraction_16.ClientID %>'),$('<%= RadTxQuality_16.ClientID %>'));
    addEvents($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxDateText_17.ClientID %>'),$('<%= RadTxDate_17.ClientID %>'),$('<%= RadTxStopDateText_17.ClientID %>'),$('<%= RadTxStopDate_17.ClientID %>'),$('<%= RadTxDisease_17.ClientID %>'),$('<%= RadTxUnits_17.ClientID %>'),$('<%= RadTxTarget_17.ClientID %>'),$('<%= ProcSite.ClientID %>').value,$('<%= ProcSubsite.ClientID %>').value,$('<%= RadTxType_17.ClientID %>'),$('<%= RadTxTargetText_17.ClientID %>'),$('<%= RadTxSchedule_17.ClientID %>'),$('<%= RadTxTotalDose_17.ClientID %>'),$('<%= RadTxDosePerFraction_17.ClientID %>'),$('<%= RadTxQuality_17.ClientID %>'));
    addEvents($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxDateText_18.ClientID %>'),$('<%= RadTxDate_18.ClientID %>'),$('<%= RadTxStopDateText_18.ClientID %>'),$('<%= RadTxStopDate_18.ClientID %>'),$('<%= RadTxDisease_18.ClientID %>'),$('<%= RadTxUnits_18.ClientID %>'),$('<%= RadTxTarget_18.ClientID %>'),$('<%= ProcSite.ClientID %>').value,$('<%= ProcSubsite.ClientID %>').value,$('<%= RadTxType_18.ClientID %>'),$('<%= RadTxTargetText_18.ClientID %>'),$('<%= RadTxSchedule_18.ClientID %>'),$('<%= RadTxTotalDose_18.ClientID %>'),$('<%= RadTxDosePerFraction_18.ClientID %>'),$('<%= RadTxQuality_18.ClientID %>'));
    addEvents($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxDateText_19.ClientID %>'),$('<%= RadTxDate_19.ClientID %>'),$('<%= RadTxStopDateText_19.ClientID %>'),$('<%= RadTxStopDate_19.ClientID %>'),$('<%= RadTxDisease_19.ClientID %>'),$('<%= RadTxUnits_19.ClientID %>'),$('<%= RadTxTarget_19.ClientID %>'),$('<%= ProcSite.ClientID %>').value,$('<%= ProcSubsite.ClientID %>').value,$('<%= RadTxType_19.ClientID %>'),$('<%= RadTxTargetText_19.ClientID %>'),$('<%= RadTxSchedule_19.ClientID %>'),$('<%= RadTxTotalDose_19.ClientID %>'),$('<%= RadTxDosePerFraction_19.ClientID %>'),$('<%= RadTxQuality_19.ClientID %>'));
    addEvents($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxDateText_20.ClientID %>'),$('<%= RadTxDate_20.ClientID %>'),$('<%= RadTxStopDateText_20.ClientID %>'),$('<%= RadTxStopDate_20.ClientID %>'),$('<%= RadTxDisease_20.ClientID %>'),$('<%= RadTxUnits_20.ClientID %>'),$('<%= RadTxTarget_20.ClientID %>'),$('<%= ProcSite.ClientID %>').value,$('<%= ProcSubsite.ClientID %>').value,$('<%= RadTxType_20.ClientID %>'),$('<%= RadTxTargetText_20.ClientID %>'),$('<%= RadTxSchedule_20.ClientID %>'),$('<%= RadTxTotalDose_20.ClientID %>'),$('<%= RadTxDosePerFraction_20.ClientID %>'),$('<%= RadTxQuality_20.ClientID %>'));
    
    function addEvents(radTxRecorded,radTxDiv,dateText,date,stopDateText,stopDate,disease,units,targetHidden,procSiteValue,procSubSiteValue,type,target,schedule,doseTotal,doseFraction,quality)
    { 
        $(dateText).addEvent('blur',curry(SetHiddenFields,radTxRecorded,radTxDiv,dateText,date,stopDateText,stopDate,disease,units,targetHidden,procSiteValue,procSubSiteValue,type,target,schedule,doseTotal,doseFraction,quality));
        $(type).addEvent('blur',curry(SetHiddenFields,radTxRecorded,radTxDiv,dateText,date,stopDateText,stopDate,disease,units,targetHidden,procSiteValue,procSubSiteValue,type,target,schedule,doseTotal,doseFraction,quality));
        $(target).addEvent('blur',curry(SetHiddenFields,radTxRecorded,radTxDiv,dateText,date,stopDateText,stopDate,disease,units,targetHidden,procSiteValue,procSubSiteValue,type,target,schedule,doseTotal,doseFraction,quality));
        $(schedule).addEvent('blur',curry(SetHiddenFields,radTxRecorded,radTxDiv,dateText,date,stopDateText,stopDate,disease,units,targetHidden,procSiteValue,procSubSiteValue,type,target,schedule,doseTotal,doseFraction,quality));
        $(doseTotal).addEvent('blur',curry(SetHiddenFields,radTxRecorded,radTxDiv,dateText,date,stopDateText,stopDate,disease,units,targetHidden,procSiteValue,procSubSiteValue,type,target,schedule,doseTotal,doseFraction,quality));
        $(doseFraction).addEvent('blur',curry(SetHiddenFields,radTxRecorded,radTxDiv,dateText,date,stopDateText,stopDate,disease,units,targetHidden,procSiteValue,procSubSiteValue,type,target,schedule,doseTotal,doseFraction,quality));
        $(quality).addEvent('blur',curry(SetHiddenFields,radTxRecorded,radTxDiv,dateText,date,stopDateText,stopDate,disease,units,targetHidden,procSiteValue,procSubSiteValue,type,target,schedule,doseTotal,doseFraction,quality));
 
        $(radTxRecorded).addEvent('click',curry(SetHiddenFields,radTxRecorded,radTxDiv,dateText,date,stopDateText,stopDate,disease,units,targetHidden,procSiteValue,procSubSiteValue,type,target,schedule,doseTotal,doseFraction,quality));
   
        // show on load
        SetHiddenFields(radTxRecorded,radTxDiv,dateText,date,stopDateText,stopDate,disease,units,targetHidden,procSiteValue,procSubSiteValue,type,target,schedule,doseTotal,doseFraction,quality);
    }

    function SetHiddenFields(radTxRecorded,radTxDiv,dateText,date,stopDateText,stopDate,disease,units,targetHidden,procSiteValue,procSubSiteValue,type,target,schedule,doseTotal,doseFraction,quality)
    { 
        var radTxRecordedRef = radTxRecorded.getElementsByTagName('input');
        for (var i = 0; i < radTxRecordedRef.length; i++) 
            if (radTxRecordedRef[i].checked) 
            { 
                  if (radTxRecordedRef[i].value == "Yes" )
                   radTxDiv.style.display='block';
                  else if (radTxRecordedRef[i].value == "No")
                  {
                    radTxDiv.style.display='none';
                    dateText.value = '';
                    date.value = '';
                    stopDateText.value = '';
                    stopDate.value = '';
                    target.value = '';
                    type.value = ''; 
                    schedule.value = ''; 
                    doseTotal.value = '';
                    doseFraction.value = '';
                    quality.value = '';
                  }
            }
            
        if (dateText.value != '' || stopDateText.value != '' || target.value != '' || type.value != '' || schedule.value != '' || doseTotal.value != '' || doseFraction.value != '' || quality.value != '')
        {
            
             if (procSiteValue == '')
                alert('Radiation Therapy Warning 1:  This record uses the site specified in the Primary Procedure.  Please specify the site of the Primary Procedure in the \'Surgical Treatment\' section, then re-enter the record here.');
           
            disease.value  = procSiteValue + " Cancer";
            units.value = 'cGy';

            if (target.value == 'Primary')
            {
                if (procSubSiteValue == '')
                    alert('Radiation Therapy Warning 2:  The target field uses the subsite specified in the Primary Procedure.  Please specify the subsite of the Primary Procedure in the \'Surgical Treatment\' section, then re-enter the target here.');
                targetHidden.value = procSubSiteValue;
            }
            else if (target.value == 'Neck')
            {
                targetHidden.value = target.value;               
            }
            else if (target.value == 'Primary and Neck')
            {
                if (procSubSiteValue == '')
                    alert('Radiation Therapy Warning 2:  The target field uses the subsite specified in the Primary Procedure. Please specify the subsite of the Primary Procedure in the \'Surgical Treatment\' section, then re-enter the target here.');

                targetHidden.value = procSubSiteValue + " and Neck";                 
            }
        }
        else 
        {
            disease.value  = '';
            units.value = '';
            targetHidden.value  = '';
        }
    }
</script>    