<%@ Control Language="C#" Inherits="Caisis.UI.Modules.HeadNeck.EForms.SalivaryGlandRadiationTx" CodeFile="SalivaryGlandRadiationTx.ascx.cs"  CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.RadiationTherapyHtmlTable = "RadiationTherapyHtmlTable";
	
	function updateRadTxTarget(targetId, QltyId)
	{
	    document.getElementById(targetId).value='Head/ Neck';
	    document.getElementById(QltyId).value='STD';
	    
	}
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="SalivaryGlandRadiationTx" /><span class="controlBoxTitle">Previous Radiation Therapy </span><br />
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="RadiationTherapyHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Disease</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol">Target</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="XRT" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxDisease,RadTxType,RadTxTarget', 'RadiationTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDisease")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater> 
  

  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="RadTxDateText_1" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="54" />
        <euc:EformHidden RecordId="1" Runat="server" ID="RadTxDate_1" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="1" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_1" TabIndex="55"/></td>
    <td align="center" ><euc:EformDropDownList RecordId="1" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_1" TabIndex="56"/></td>
    <td align="center"><euc:EformTextBox  style="width:80px;" Field="RadTxTarget" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxTarget_1" TabIndex="57" /></td>
    <td align="center"><euc:EformComboBox DropDownWidth="300px" Width="80px" TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="1" ID="RadTxQuality_1" Runat="server"  /></td>    
    <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
    <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="RadTxDateText_2" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="58"/>
        <euc:EformHidden RecordId="2" Runat="server" ID="RadTxDate_2" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="2" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_2" TabIndex="59"/></td>
    <td align="center"><euc:EformDropDownList RecordId="2" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_2" TabIndex="60"/></td>
    <td align="center"><euc:EformTextBox  style="width:80px;" Field="RadTxTarget" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxTarget_2"  TabIndex="61"/></td>
    <td align="center"><euc:EformComboBox DropDownWidth="300px" Width="80px" TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="2" ID="RadTxQuality_2" Runat="server" /></td>    
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="RadTxDateText_3" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="62" />
        <euc:EformHidden RecordId="3" Runat="server" ID="RadTxDate_3" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="3" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_3" TabIndex="63"/></td>
    <td align="center"><euc:EformDropDownList RecordId="3" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_3" TabIndex="64"/></td>
    <td align="center"><euc:EformTextBox  style="width:80px;" Field="RadTxTarget" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxTarget_3" TabIndex="65"/></td>
    <td align="center"><euc:EformComboBox DropDownWidth="300px" Width="80px" TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="3" ID="RadTxQuality_3" Runat="server"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="4"  ID="RadTxDateText_4" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="66" />
        <euc:EformHidden RecordId="4" Runat="server" ID="RadTxDate_4" Table="RadiationTherapy" Field="RadTxDate" />    </td>
    <td align="center" ><euc:EformDropDownList RecordId="4" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_4" TabIndex="67"/></td> 
    <td align="center"><euc:EformDropDownList RecordId="4" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_4" TabIndex="68" /></td>
    <td align="center"><euc:EformTextBox  style="width:80px;" Field="RadTxTarget" RecordId="4" Table="RadiationTherapy" Runat="server" id="RadTxTarget_4" TabIndex="69"/></td>
    <td align="center"><euc:EformComboBox DropDownWidth="300px" Width="80px" TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="4" ID="RadTxQuality_4" Runat="server" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="5"  ID="RadTxDateText_5" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="70" />
        <euc:EformHidden RecordId="5" Runat="server" ID="RadTxDate_5" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="5" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_5" TabIndex="71"/></td>
    <td align="center"><euc:EformDropDownList RecordId="5" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_5" TabIndex="72"/></td>
    <td align="center"><euc:EformTextBox  style="width:80px;" Field="RadTxTarget" RecordId="5" Table="RadiationTherapy" Runat="server" id="RadTxTarget_5" TabIndex="73"/></td>
    <td align="center"><euc:EformComboBox DropDownWidth="300px" Width="80px" TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="5" ID="RadTxQuality_5" Runat="server"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="6"  ID="RadTxDateText_6" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="74" />
        <euc:EformHidden RecordId="6" Runat="server" ID="RadTxDate_6" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="6" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_6" TabIndex="75"/></td>
    <td align="center"><euc:EformDropDownList RecordId="6" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_6" TabIndex="76"/></td>
    <td align="center"><euc:EformTextBox  style="width:80px;" Field="RadTxTarget" RecordId="6" Table="RadiationTherapy" Runat="server" id="RadTxTarget_6" TabIndex="77"/></td>
    <td align="center"><euc:EformComboBox DropDownWidth="300px" Width="80px" TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="6" ID="RadTxQuality_6" Runat="server" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="7"  ID="RadTxDateText_7" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="78"/>
        <euc:EformHidden RecordId="7" Runat="server" ID="RadTxDate_7" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="7" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_7" TabIndex="79"/></td>
    <td align="center"><euc:EformDropDownList RecordId="7" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_7" TabIndex="80"/></td>
    <td align="center"><euc:EformTextBox  style="width:80px;" Field="RadTxTarget" RecordId="7" Table="RadiationTherapy" Runat="server" id="RadTxTarget_7" TabIndex="81"/></td>
    <td align="center"><euc:EformComboBox DropDownWidth="300px" Width="80px" TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="7" ID="RadTxQuality_7" Runat="server"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="8"  ID="RadTxDateText_8" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="82"/>
        <euc:EformHidden RecordId="8" Runat="server" ID="RadTxDate_8" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="8" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_8" TabIndex="83"/></td>
    <td align="center"><euc:EformDropDownList RecordId="8" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_8" TabIndex="84"/></td>
    <td align="center"><euc:EformTextBox  style="width:80px;" Field="RadTxTarget" RecordId="8" Table="RadiationTherapy" Runat="server" id="RadTxTarget_8" TabIndex="85"/></td>
    <td align="center"><euc:EformComboBox DropDownWidth="300px" Width="80px" TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="8" ID="RadTxQuality_8" Runat="server" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="9"  ID="RadTxDateText_9" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="86" />
        <euc:EformHidden RecordId="9" Runat="server" ID="RadTxDate_9" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="9" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_9" TabIndex="87"/></td>
    <td align="center"><euc:EformDropDownList RecordId="9" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_9" TabIndex="88"/></td>
    <td align="center"><euc:EformTextBox  style="width:80px;" Field="RadTxTarget" RecordId="9" Table="RadiationTherapy" Runat="server" id="RadTxTarget_9" TabIndex="89"/></td>
    <td align="center"><euc:EformComboBox DropDownWidth="300px" Width="80px" TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="9" ID="RadTxQuality_9" Runat="server"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="10"  ID="RadTxDateText_10" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="90" />
        <euc:EformHidden RecordId="10" Runat="server" ID="RadTxDate_10" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="10" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_10" TabIndex="91"/></td>
    <td align="center"><euc:EformDropDownList RecordId="10" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_10" TabIndex="92"/></td>
    <td align="center"><euc:EformTextBox  style="width:80px;" Field="RadTxTarget" RecordId="10" Table="RadiationTherapy" Runat="server" id="RadTxTarget_10" TabIndex="93"/></td>
    <td align="center"><euc:EformComboBox DropDownWidth="300px" Width="80px" TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="10" ID="RadTxQuality_10" Runat="server" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'RadiationTherapyHtmlTable');" />
<br/><br/><br/>