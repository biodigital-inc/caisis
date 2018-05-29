<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateUltrasound" CodeFile="BiopsyOfProstateUltrasound.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<%-- 
<!-- example table array populator -->
<script type="text/javascript">
	tableArray.UltrasoundHtmlTable = 'UltrasoundHtmlTable';
</script>
--%>
<style type="text/css">
table#UltrasoundHtmlTable td.no-records
{
    padding: 30px;
    text-align: center;
    font-weight: bold;
}
</style>

<a name="BiopsyOfProstateUltrasound" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Ultrasound" style="margin-right: 40px;"></asp:Label><br/>
<table width="675" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="UltrasoundHtmlTable">
  <tr> 
    <td width="12%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Study</td>
    <td width="15%" class="controlBoxDataGridHeaderFirstCol">Volume</td>
    <td class="controlBoxDataGridHeaderFirstCol">Impression</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr id="NoImagesMsg" runat="server">
  <td class="no-records" colspan="5">No TRUS or MRUS Records found.</td>
  </tr>
  
  
  <asp:Repeater ID="images" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'DxDateText,DxDate,DxType,DxResult,DxNotes', 'Imaging', 'DxImageProstate');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></td>
		  <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<asp:Literal ID="Volume" runat="server" /></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxNotes") %></td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>

</table>  
  
<%--

  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="vertical-align: top;">
		<euc:EformTextBox Runat="server" RecordId="1"  ID="DxDateText_1" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="1" Runat="server" ID="DxDate_1" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap; font-weight: bold;vertical-align: top;" id="MRIToggleContainer"><euc:EformCheckBox runat="server"  RecordId="1"  ID="DxType_1" TABLE="Diagnostics" FIELD="DxType" Value="MRI" />MRI</td>
    <td align="left" style="white-space: nowrap;vertical-align: top;">
		<euc:EformComboBox DropDownWidth="140" DropDownHeight="auto"  LookupCode="DxResult_MRI" style="width:140px;" Field="DxResult" RecordId="1" Table="Diagnostics" Runat="server" id="DxResult_1"  />
	</td>
    <td align="center" style="vertical-align: top;">
		<euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_1"/><br />
		<table cellspacing="0" id="MRIDetailsTable" style="display: none;">
		    <tr>
		        <td>MRI Urethra Length</td>
		        <td><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;"  TABLE="NoTable" FIELD="Imaging_MRIUrethLength" Runat="server" ID="Imaging_MRIUrethLength"/></td>
		    </tr>
		    <tr>
		        <td>MRI Veins</td>
		        <td><euc:EformDropDownList TABLE="NoTable" FIELD="Imaging_MRIVeins" Runat="server" ID="Imaging_MRIVeins" style="width: 40px;">
		                <asp:ListItem Value="" Text=" " />
		                <asp:ListItem>0</asp:ListItem>
		                <asp:ListItem>1</asp:ListItem>
		                <asp:ListItem>2</asp:ListItem>
		                <asp:ListItem>3</asp:ListItem>
		                <asp:ListItem>4+</asp:ListItem>
		        </euc:EformDropDownList>
		        </td>
		    </tr>
		    <tr>
		        <td>Prostate Volume (cc)</td>
		        <td><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;"  TABLE="NoTable" FIELD="Imaging_ProstateVolumeCC" Runat="server" ID="Imaging_ProstateVolumeCC"/></td>
		    </tr>
		</table>
	</td>
    <td style="vertical-align: top;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="2"  ID="DxDateText_2" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="DxDate_2" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap; font-weight: bold;"><euc:EformCheckBox runat="server"  RecordId="2"  ID="DxType_2" TABLE="Diagnostics" FIELD="DxType" Value="Bone Scan" />Bone Scan</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:140;" Field="DxResult" RecordId="2" Table="Diagnostics" Runat="server" id="DxResult_2"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_2"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="3"  ID="DxDateText_3" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="DxDate_3" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap; font-weight: bold;"><euc:EformCheckBox runat="server"  RecordId="3"  ID="DxType_3" TABLE="Diagnostics" FIELD="DxType" Value="CT A/P" />CT A/P</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:140;" Field="DxResult" RecordId="3" Table="Diagnostics" Runat="server" id="DxResult_3"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_3"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="4"  ID="DxDateText_4" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="4" Runat="server" ID="DxDate_4" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="4" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_4"/>
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:140;" Field="DxResult" RecordId="4" Table="Diagnostics" Runat="server" id="DxResult_4"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_4"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="5"  ID="DxDateText_5" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="5" Runat="server" ID="DxDate_5" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="5" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_5"/>
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:140;" Field="DxResult" RecordId="5" Table="Diagnostics" Runat="server" id="DxResult_5"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_5"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="6"  ID="DxDateText_6" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="6" Runat="server" ID="DxDate_6" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="6" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_6"/>
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:140;" Field="DxResult" RecordId="6" Table="Diagnostics" Runat="server" id="DxResult_6"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_6"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="7"  ID="DxDateText_7" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="7" Runat="server" ID="DxDate_7" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="7" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_7"/>
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:140;" Field="DxResult" RecordId="7" Table="Diagnostics" Runat="server" id="DxResult_7"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_7"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="8"  ID="DxDateText_8" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="8" Runat="server" ID="DxDate_8" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="8" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_8"/>
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:140;" Field="DxResult" RecordId="8" Table="Diagnostics" Runat="server" id="DxResult_8"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_8"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="9"  ID="DxDateText_9" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="9" Runat="server" ID="DxDate_9" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="9" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_9"/>
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxResult" style="width:140;" Field="DxResult" RecordId="9" Table="Diagnostics" Runat="server" id="DxResult_9"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_9"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="10"  ID="DxDateText_10" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="10" Runat="server" ID="DxDate_10" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="10" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_10"/>
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:140;" Field="DxResult" RecordId="10" Table="Diagnostics" Runat="server" id="DxResult_10"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_10"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>


</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'UltrasoundHtmlTable');" />
 --%>
<br/><br/>