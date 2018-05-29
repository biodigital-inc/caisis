<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.RadiationTherapy_ProstateNP" CodeFile="RadiationTherapy_ProstateNP.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.RadiationTherapyHtmlTable = "RadiationTherapyHtmlTable";
</script>

<a name="RadiationTherapy_ProstateNP" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Radiation Therapy"></asp:Label><br/>
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="RadiationTherapyHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Start Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="">Stop Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol">Target</td>
    <td class="controlBoxDataGridHeaderFirstCol">Total Dose</td>
    <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="XRT" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxInstitution,RadTxNotes', 'RadiationTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxStopDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %>&nbsp;</td>
		  <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxInstitution") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="RadTxDateText_1" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="1" Runat="server" ID="RadTxDate_1" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="RadTxStopDateText_1" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="1" Runat="server" ID="RadTxStopDate_1" Table="RadiationTherapy" Field="RadTxStopDate" />
    </td>
    <td><euc:EformDropDownList RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_1" LookupCode="RadTxType" /></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget,EForm_Prostate,True"  style="width:80px;" Field="RadTxTarget" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxTarget_1" /></td>
    <td><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_1"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_1"  /></td>
    <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes"  ShowTextEditor="true" Runat="server" ID="RadTxNotes_1"/></td>
    <td><img src="../../Images/EFormDeleteRow.gif" width="22" height="14"></td>
  </tr>
    <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="RadTxDateText_2" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="RadTxDate_2" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="RadTxStopDateText_2" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="RadTxStopDate_2" Table="RadiationTherapy" Field="RadTxStopDate" />
    </td>
    <td><euc:EformDropDownList RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_2" LookupCode="RadTxType" /></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget,EForm_Prostate,True"  style="width:80px;" Field="RadTxTarget" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxTarget_2"  /></td>
    <td><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_2"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_2"  /></td>
    <td align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes"  ShowTextEditor="true" Runat="server" ID="RadTxNotes_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="RadTxDateText_3" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="RadTxDate_3" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="RadTxStopDateText_3" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="RadTxStopDate_3" Table="RadiationTherapy" Field="RadTxStopDate" />
    </td>
    <td><euc:EformDropDownList RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_3" LookupCode="RadTxType" /></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget,EForm_Prostate,True"  style="width:80px;" Field="RadTxTarget" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxTarget_3"  /></td>
    <td><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_3"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_3"  /></td>
    <td align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes"  ShowTextEditor="true" Runat="server" ID="RadTxNotes_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="4"  ID="RadTxDateText_4" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="4" Runat="server" ID="RadTxDate_4" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="4"  ID="RadTxStopDateText_4" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="4" Runat="server" ID="RadTxStopDate_4" Table="RadiationTherapy" Field="RadTxStopDate" />
    </td>
    <td><euc:EformDropDownList RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_4" LookupCode="RadTxType" /></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget,EForm_Prostate,True"  style="width:80px;" Field="RadTxTarget" RecordId="4" Table="RadiationTherapy" Runat="server" id="RadTxTarget_4"  /></td>
    <td><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_4"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="4" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_4"  /></td>
    <td align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes"  ShowTextEditor="true" Runat="server" ID="RadTxNotes_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="5"  ID="RadTxDateText_5" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="5" Runat="server" ID="RadTxDate_5" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="5"  ID="RadTxStopDateText_5" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="5" Runat="server" ID="RadTxStopDate_5" Table="RadiationTherapy" Field="RadTxStopDate" />
    </td>
    <td><euc:EformDropDownList RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_5" LookupCode="RadTxType" /></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget,EForm_Prostate,True"  style="width:80px;" Field="RadTxTarget" RecordId="5" Table="RadiationTherapy" Runat="server" id="RadTxTarget_5"  /></td>
    <td><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_5"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="5" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_5"  /></td>
    <td align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes"  ShowTextEditor="true" Runat="server" ID="RadTxNotes_5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="6"  ID="RadTxDateText_6" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="6" Runat="server" ID="RadTxDate_6" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="6"  ID="RadTxStopDateText_6" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="6" Runat="server" ID="RadTxStopDate_6" Table="RadiationTherapy" Field="RadTxStopDate" />
    </td>
    <td><euc:EformDropDownList RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_6" LookupCode="RadTxType" /></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget,EForm_Prostate,True"  style="width:80px;" Field="RadTxTarget" RecordId="6" Table="RadiationTherapy" Runat="server" id="RadTxTarget_6"  /></td>
    <td><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_6"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="6" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_6"  /></td>
    <td align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes"  ShowTextEditor="true" Runat="server" ID="RadTxNotes_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="7"  ID="RadTxDateText_7" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="7" Runat="server" ID="RadTxDate_7" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="7"  ID="RadTxStopDateText_7" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="7" Runat="server" ID="RadTxStopDate_7" Table="RadiationTherapy" Field="RadTxStopDate" />
    </td>
    <td><euc:EformDropDownList RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_7" LookupCode="RadTxType" /></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget,EForm_Prostate,True"  style="width:80px;" Field="RadTxTarget" RecordId="7" Table="RadiationTherapy" Runat="server" id="RadTxTarget_7"  /></td>
    <td><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_7"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="7" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_7"  /></td>
    <td align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes"  ShowTextEditor="true" Runat="server" ID="RadTxNotes_7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="8"  ID="RadTxDateText_8" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="8" Runat="server" ID="RadTxDate_8" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="8"  ID="RadTxStopDateText_8" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="8" Runat="server" ID="RadTxStopDate_8" Table="RadiationTherapy" Field="RadTxStopDate" />
    </td>
    <td><euc:EformDropDownList RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_8" LookupCode="RadTxType" /></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget,EForm_Prostate,True"  style="width:80px;" Field="RadTxTarget" RecordId="8" Table="RadiationTherapy" Runat="server" id="RadTxTarget_8"  /></td>
    <td><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_8"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="8" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_8"  /></td>
    <td align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes"  ShowTextEditor="true" Runat="server" ID="RadTxNotes_8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="9"  ID="RadTxDateText_9" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="9" Runat="server" ID="RadTxDate_9" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="9"  ID="RadTxStopDateText_9" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="9" Runat="server" ID="RadTxStopDate_9" Table="RadiationTherapy" Field="RadTxStopDate" />
    </td>
    <td><euc:EformDropDownList RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_9" LookupCode="RadTxType" /></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget,EForm_Prostate,True"  style="width:80px;" Field="RadTxTarget" RecordId="9" Table="RadiationTherapy" Runat="server" id="RadTxTarget_9"  /></td>
    <td><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_9"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="9" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_9"  /></td>
    <td align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes"  ShowTextEditor="true" Runat="server" ID="RadTxNotes_9"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="10"  ID="RadTxDateText_10" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="10" Runat="server" ID="RadTxDate_10" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="10"  ID="RadTxStopDateText_10" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:74px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="10" Runat="server" ID="RadTxStopDate_10" Table="RadiationTherapy" Field="RadTxStopDate" />
    </td>
    <td><euc:EformDropDownList RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_10" LookupCode="RadTxType" /></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget,EForm_Prostate,True"  style="width:80px;" Field="RadTxTarget" RecordId="10" Table="RadiationTherapy" Runat="server" id="RadTxTarget_10"  /></td>
    <td><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_10"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="10" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_10"  /></td>
    <td align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes"  ShowTextEditor="true" Runat="server" ID="RadTxNotes_10"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'RadiationTherapyHtmlTable');" />
<br/><br/>
<br/>
