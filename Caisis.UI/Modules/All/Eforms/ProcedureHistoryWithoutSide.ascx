<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ProcedureHistoryWithoutSide" CodeFile="ProcedureHistoryWithoutSide.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.ProceduresHtmlTable = "ProceduresHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ProcedureHistoryWithoutSide" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Procedure History "></asp:Label><br/>
<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SurgeriesHtmlTable">
  <tr> 
    <td width="18%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">Surgery Type </td>
    <td width="42%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="rptSurgicalHistory" Runat="server"  OnItemDataBound="ChronListItemDataBound"> 
	<ItemTemplate> 
		<tr id="SurgicalHistoryRow" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<asp:Literal ID="ChronListDateField" Runat="server" /></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "varName") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "varValue") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		    <td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		    <td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr id="NoSurgicalHistoryMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> No prior surgical procedures have been recorded for this patient.</td>
  </tr> 
  
  
</table>
<br/>



<a name="SurgicalHistory" /><span class="controlBoxTitle" style="font-size: 11px;">Add Procedure</span><br/>
<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresHtmlTable">
  <tr> 
    <td width="18%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">Procedure Type </td>
    <td width="42%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>

<tr> 
    <td height="18" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox  Runat="server"   RecordId="1"  ID="ProcDateText_1" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		                                                     <euc:EformHidden   Runat="server"   RecordId="1"  ID="ProcDate_1"     Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">
                                      &nbsp;<euc:EformComboBox DropDownWidth="auto" Runat="server"   RecordId="1"  ID="ProcName_1"     Table="Procedures" Field="ProcName"    LookupCode="ProcName" RefBy="ProcName" style="width:150;"  MaxLength="50"    />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  Runat="server"   RecordId="1"  ID="ProcNotes_1"    TABLE="Procedures" FIELD="ProcNotes"   ShowCalendar="False" CalcDate="False" style="width:190px;"  /></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr> 
    <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="2"  ID="ProcDateText_2" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="2" Runat="server"   ID="ProcDate_2" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="2" Table="Procedures" MaxLength="50"  Runat="server"   id="ProcName_2"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="2" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_2"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="3"  ID="ProcDateText_3" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="3" Runat="server"   ID="ProcDate_3" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox  DropDownWidth="auto"  LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="3" Table="Procedures" MaxLength="50"  Runat="server"   id="ProcName_3"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="3" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_3"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="4"  ID="ProcDateText_4" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="4" Runat="server"   ID="ProcDate_4" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="4" Table="Procedures" MaxLength="50"  Runat="server"   id="ProcName_4"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="4" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_4"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="5"  ID="ProcDateText_5" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="5" Runat="server"   ID="ProcDate_5" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="5" Table="Procedures" MaxLength="50" Runat="server"   id="ProcName_5"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="5" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_5"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="6"  ID="ProcDateText_6" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="6" Runat="server"   ID="ProcDate_6" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="6" Table="Procedures" MaxLength="50" Runat="server"   id="ProcName_6"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="6" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_6"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="7"  ID="ProcDateText_7" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="7" Runat="server"   ID="ProcDate_7" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox  DropDownWidth="auto"  LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="7" Table="Procedures" MaxLength="50" Runat="server"   id="ProcName_7"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="7" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_7"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="8"  ID="ProcDateText_8" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="8" Runat="server"   ID="ProcDate_8" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="8" Table="Procedures" MaxLength="50" Runat="server"   id="ProcName_8"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="8" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_8"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="9"  ID="ProcDateText_9" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="9" Runat="server"   ID="ProcDate_9" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="9" Table="Procedures" MaxLength="50" Runat="server"   id="ProcName_9"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="9" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_9"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server"   RecordId="10"  ID="ProcDateText_10" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="10" Runat="server"   ID="ProcDate_10" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="10" Table="Procedures" MaxLength="50" Runat="server"   id="ProcName_10"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="10" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server"   ID="ProcNotes_10"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
</table>
<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProceduresHtmlTable');"><img alt="" src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"/></a>
<br/>
<br/><br/>
