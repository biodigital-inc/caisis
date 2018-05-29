<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.Imaging_Kidney" CodeFile="Imaging_Kidney.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script language="javascript">
	tableArray.DiagnosticsHtmlTable = "DiagnosticsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Imaging_Kidney" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Imaging" style="margin-right: 40px;"></asp:Label>


<euc:EformCheckBoxList RepeatLayout="Flow"  RepeatDirection="Horizontal" TABLE="NoTable" FIELD="Imaging_Notes" id="Imaging_Notes"  runat="server"  ShowOther="false">
			<asp:ListItem Value="Films Reviewed">Films Reviewed&nbsp;&nbsp;&nbsp;</asp:ListItem>
		    <asp:ListItem  Value="Compared to Past">Compared to Past&nbsp;&nbsp;&nbsp;</asp:ListItem>
		    <asp:ListItem  Value="Reviewed with Radiologist">Reviewed with Radiologist&nbsp;&nbsp;&nbsp;</asp:ListItem>
		    <asp:ListItem  Value="Digitized">Digitized</asp:ListItem>
</euc:EformCheckBoxList>


<br/>
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsHtmlTable">
  <tr> 
            <td height="20" align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Date</td>
            <td align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Study</td>
            <td align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Target</td>
            <td align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Largest<br/>Dimension </td>
            <td  align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Side<br/><span style="font-size: 10px;">(of largest lesion)</span></td>
            <td align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol"># Tumors</td>
            <td  align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Tumor Type</td>
            <td  align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Notes</td>
            <td align="center"  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <asp:Repeater ID="images" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate>
		
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'DxDateText,DxDate,DxType,DxResult,DxNotes', 'Imaging');"> 
            <td height="34" class="ClinicalEformPopulatedColumn" align="center">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "DxDateText") %></strong></td>
            <td class="ClinicalEformPopulatedColumn" style="padding-left: 4px;"><strong><%# DataBinder.Eval(Container.DataItem, "DxType") %></strong>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "DxTarget") %>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: center;">&nbsp;<strong><asp:Literal id="MaxDim" runat="server" /></strong> <asp:Label id="MaxDimMsg" runat="server" Font-Size="10px" Visible="false" Text="(note: one or more measurements was not in the correct format)" /></td>
            <td class="ClinicalEformPopulatedColumn" style="white-space: nowrap;text-align: center;"><strong><asp:Literal id="ImgFindSide" runat="server" />&nbsp;</strong></td>
            <td class="ClinicalEformPopulatedColumn" style="white-space: nowrap;"><asp:Label id="NumTumors" runat="server" style="font-weight: bold;"  >&nbsp;</asp:Label></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: center;"><strong><asp:Literal id="TumorType" runat="server"  ></asp:Literal></strong>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn"><strong><%# DataBinder.Eval(Container.DataItem, "DxNotes") %></strong>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="1"  ID="DxDateText_1" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="1" Runat="server" ID="DxDate_1" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="1" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_1"/>	</td>
    <td align="left" style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="1" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_1"/></td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="DxImageFindingsKidney" FIELD="ImgFindLength" Runat="server" ID="ImgFindLength_1"/></td>
    <td align="center">
		<euc:CaisisSelect DropDownWidth="90" DropDownHeight="auto"  LookupCode="FindSide"  style="width:90px;" Field="ImgFindSide" RecordId="1" Table="DxImageFindingsKidney" Runat="server" id="ImgFindSide_1"  />	</td>
    <td><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="Diagnostics" FIELD="DxTotalNumTumors" Runat="server" ID="DxTotalNumTumors_1"/></td>	
    <td><euc:EformComboBox DropDownWidth="70" DropDownHeight="auto"  LookupCode="ImgFindTumorType"  style="width:70px;" Field="ImgFindTumorType" RecordId="1" Table="DxImageFindingsKidney" Runat="server" id="ImgFindTumorType_1"  /></td>	
    <td><euc:EformTextBox RecordId="1"  ShowTextEditor="true" style="width:140px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_1"/></td>	
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="2"  ID="DxDateText_2" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="2" Runat="server" ID="DxDate_2" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="2" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_2"/>	</td>
    <td align="left" style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="2" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_2"/></td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="DxImageFindingsKidney" FIELD="ImgFindLength" Runat="server" ID="ImgFindLength_2"/></td>
    <td align="center">
		<euc:CaisisSelect DropDownWidth="90" DropDownHeight="auto"  LookupCode="FindSide"  style="width:90px;" Field="ImgFindSide" RecordId="2" Table="DxImageFindingsKidney" Runat="server" id="ImgFindSide_2"  />	</td>
    <td><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="Diagnostics" FIELD="DxTotalNumTumors" Runat="server" ID="DxTotalNumTumors_2"/></td>	
    <td><euc:EformComboBox DropDownWidth="70" DropDownHeight="auto"  LookupCode="ImgFindTumorType"  style="width:70px;" Field="ImgFindTumorType" RecordId="2" Table="DxImageFindingsKidney" Runat="server" id="ImgFindTumorType_2"  /></td>	
    <td><euc:EformTextBox RecordId="2"  ShowTextEditor="true" style="width:140px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_2"/></td>	
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="3"  ID="DxDateText_3" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="3" Runat="server" ID="DxDate_3" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="3" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_3"/>	</td>
    <td align="left" style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="3" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_3"/></td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="DxImageFindingsKidney" FIELD="ImgFindLength" Runat="server" ID="ImgFindLength_3"/></td>
    <td align="center">
		<euc:CaisisSelect DropDownWidth="90" DropDownHeight="auto"  LookupCode="FindSide"  style="width:90px;" Field="ImgFindSide" RecordId="3" Table="DxImageFindingsKidney" Runat="server" id="ImgFindSide_3"  />	</td>
    <td><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="Diagnostics" FIELD="DxTotalNumTumors" Runat="server" ID="DxTotalNumTumors_3"/></td>	
    <td><euc:EformComboBox DropDownWidth="70" DropDownHeight="auto"  LookupCode="ImgFindTumorType"  style="width:70px;" Field="ImgFindTumorType" RecordId="3" Table="DxImageFindingsKidney" Runat="server" id="ImgFindTumorType_3"  /></td>	
    <td><euc:EformTextBox RecordId="3"  ShowTextEditor="true" style="width:140px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_3"/></td>	
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="4"  ID="DxDateText_4" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="4" Runat="server" ID="DxDate_4" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="4" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_4"/>	</td>
    <td align="left" style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="4" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_4"/></td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="DxImageFindingsKidney" FIELD="ImgFindLength" Runat="server" ID="ImgFindLength_4"/></td>
    <td align="center">
		<euc:CaisisSelect DropDownWidth="90" DropDownHeight="auto"  LookupCode="FindSide"  style="width:90px;" Field="ImgFindSide" RecordId="4" Table="DxImageFindingsKidney" Runat="server" id="ImgFindSide_4"  />	</td>
    <td><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="Diagnostics" FIELD="DxTotalNumTumors" Runat="server" ID="DxTotalNumTumors_4"/></td>	
    <td><euc:EformComboBox DropDownWidth="70" DropDownHeight="auto"  LookupCode="ImgFindTumorType"  style="width:70px;" Field="ImgFindTumorType" RecordId="4" Table="DxImageFindingsKidney" Runat="server" id="ImgFindTumorType_4"  /></td>	
    <td><euc:EformTextBox RecordId="4"  ShowTextEditor="true" style="width:140px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_4"/></td>	
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="5"  ID="DxDateText_5" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="5" Runat="server" ID="DxDate_5" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="5" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_5"/>	</td>
    <td align="left" style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="5" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_5"/></td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="DxImageFindingsKidney" FIELD="ImgFindLength" Runat="server" ID="ImgFindLength_5"/></td>
    <td align="center">
		<euc:CaisisSelect DropDownWidth="90" DropDownHeight="auto"  LookupCode="FindSide"  style="width:90px;" Field="ImgFindSide" RecordId="5" Table="DxImageFindingsKidney" Runat="server" id="ImgFindSide_5"  />	</td>
    <td><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="Diagnostics" FIELD="DxTotalNumTumors" Runat="server" ID="DxTotalNumTumors_5"/></td>	
    <td><euc:EformComboBox DropDownWidth="70" DropDownHeight="auto"  LookupCode="ImgFindTumorType"  style="width:70px;" Field="ImgFindTumorType" RecordId="5" Table="DxImageFindingsKidney" Runat="server" id="ImgFindTumorType_5"  /></td>	
    <td><euc:EformTextBox RecordId="5"  ShowTextEditor="true" style="width:140px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_5"/></td>	
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="6"  ID="DxDateText_6" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="6" Runat="server" ID="DxDate_6" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="6" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_6"/>	</td>
    <td align="left" style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="6" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_6"/></td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="DxImageFindingsKidney" FIELD="ImgFindLength" Runat="server" ID="ImgFindLength_6"/></td>
    <td align="center">
		<euc:CaisisSelect DropDownWidth="90" DropDownHeight="auto"  LookupCode="FindSide"  style="width:90px;" Field="ImgFindSide" RecordId="6" Table="DxImageFindingsKidney" Runat="server" id="ImgFindSide_6"  />	</td>
    <td><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="Diagnostics" FIELD="DxTotalNumTumors" Runat="server" ID="DxTotalNumTumors_6"/></td>	
    <td><euc:EformComboBox DropDownWidth="70" DropDownHeight="auto"  LookupCode="ImgFindTumorType"  style="width:70px;" Field="ImgFindTumorType" RecordId="6" Table="DxImageFindingsKidney" Runat="server" id="ImgFindTumorType_6"  /></td>	
    <td><euc:EformTextBox RecordId="6"  ShowTextEditor="true" style="width:140px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_6"/></td>	
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="7"  ID="DxDateText_7" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="7" Runat="server" ID="DxDate_7" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="7" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_7"/>	</td>
    <td align="left" style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="7" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_7"/></td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="DxImageFindingsKidney" FIELD="ImgFindLength" Runat="server" ID="ImgFindLength_7"/></td>
    <td align="center">
		<euc:CaisisSelect DropDownWidth="90" DropDownHeight="auto"  LookupCode="FindSide"  style="width:90px;" Field="ImgFindSide" RecordId="7" Table="DxImageFindingsKidney" Runat="server" id="ImgFindSide_7"  />	</td>
    <td><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="Diagnostics" FIELD="DxTotalNumTumors" Runat="server" ID="DxTotalNumTumors_7"/></td>	
    <td><euc:EformComboBox DropDownWidth="70" DropDownHeight="auto"  LookupCode="ImgFindTumorType"  style="width:70px;" Field="ImgFindTumorType" RecordId="7" Table="DxImageFindingsKidney" Runat="server" id="ImgFindTumorType_7"  /></td>	
    <td><euc:EformTextBox RecordId="7"  ShowTextEditor="true" style="width:140px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_7"/></td>	
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="8"  ID="DxDateText_8" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="8" Runat="server" ID="DxDate_8" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="8" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_8"/>	</td>
    <td align="left" style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="400px" style="width: 80px;"  RecordId="8" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_8"/></td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="DxImageFindingsKidney" FIELD="ImgFindLength" Runat="server" ID="ImgFindLength_8"/></td>
    <td align="center">
		<euc:CaisisSelect DropDownWidth="90" DropDownHeight="auto"  LookupCode="FindSide"  style="width:90px;" Field="ImgFindSide" RecordId="8" Table="DxImageFindingsKidney" Runat="server" id="ImgFindSide_8"  />	</td>
    <td><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="Diagnostics" FIELD="DxTotalNumTumors" Runat="server" ID="DxTotalNumTumors_8"/></td>	
    <td><euc:EformComboBox DropDownWidth="70" DropDownHeight="auto"  LookupCode="ImgFindTumorType"  style="width:70px;" Field="ImgFindTumorType" RecordId="8" Table="DxImageFindingsKidney" Runat="server" id="ImgFindTumorType_8"  /></td>	
    <td><euc:EformTextBox RecordId="8"  ShowTextEditor="true" style="width:140px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_8"/></td>	
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DiagnosticsHtmlTable');" />
<br/><br/>
<br/>
