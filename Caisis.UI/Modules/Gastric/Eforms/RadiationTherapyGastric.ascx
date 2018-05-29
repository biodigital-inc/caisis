<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.RadiationTherapyGastric" CodeFile="RadiationTherapyGastric.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.RadiationTherapyHtmlTable = "RadiationTherapyHtmlTable";
</script>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="RadiationTherapyGastric" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Radiation Therapy"></asp:Label><br/>
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="RadiationTherapyHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;white-space:nowrap;">&nbsp;Date</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Disease</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Intent</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Stop Date</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Institution</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Quality</td>
    <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <asp:Repeater ID="XRT" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxType,RadTxDisease,RadTxNotes,RadTxInstitution,RadTxQuality', 'RadiationTherapyGastric');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDisease") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxIntent") %>&nbsp;</td>
            <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxStopDate") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxNotes") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxInstitution") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxQuality") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr onclick="setRadTxDefaults()">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="RadTxDateText_1" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setRadTxDefaults()"  />
        <euc:EformHidden RecordId="1" Runat="server" ID="RadTxDate_1" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EFormComboBox RecordId="1" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_1" style="width: 190px;"  DropDownWidth="350" AppendToOnChange="setRadTxDefaults()"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="320"  LookupCode="Disease"  style="width:70px;" Field="RadTxDisease" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxDisease_1"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="320"  LookupCode="TxIntent"  style="width:70px;" Field="RadTxIntent" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxIntent_1"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox Runat="server" RecordId="1"  ID="RadTxStopDateText_1" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setRadTxDefaults()"  />
                                    <euc:EformHidden RecordId="1" Runat="server" ID="RadTxStopDate_1" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:130px;" TABLE="RadiationTherapy" FIELD="RadTxNotes" ShowTextEditor="true"  Runat="server" ID="RadTxNotes_1"  AppendToOnChange="setRadTxDefaults()" /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:120;" Field="RadTxInstitution" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_1"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="1" LookupCode="DataQuality" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_1" style="width: 35px;"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;" onclick="setRadTxDefaults()">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="RadTxDateText_2" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setRadTxDefaults()"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="RadTxDate_2" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EFormComboBox RecordId="2" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_2" style="width: 190px;"  DropDownWidth="350" AppendToOnChange="setRadTxDefaults()"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="320"  LookupCode="Disease"  style="width:70px;" Field="RadTxDisease" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxDisease_2"  /></td>
    
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="320"  LookupCode="TxIntent"  style="width:70px;" Field="RadTxIntent" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxIntent_2"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox Runat="server" RecordId="2"  ID="RadTxStopDateText_2" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setRadTxDefaults()"  />
                                    <euc:EformHidden RecordId="2" Runat="server" ID="RadTxStopDate_2" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
  
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:130px;" TABLE="RadiationTherapy" FIELD="RadTxNotes" ShowTextEditor="true"  Runat="server" ID="RadTxNotes_2"  AppendToOnChange="setRadTxDefaults()" /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:120;" Field="RadTxInstitution" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_2"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="2" LookupCode="DataQuality" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_2" style="width: 35px;"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
  <tr style="display: none;" onclick="setRadTxDefaults()">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="RadTxDateText_3" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setRadTxDefaults()"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="RadTxDate_3" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EFormComboBox RecordId="3" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_3" style="width: 190px;"  DropDownWidth="350" AppendToOnChange="setRadTxDefaults()"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="320"  LookupCode="Disease"  style="width:70px;" Field="RadTxDisease" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxDisease_3"  /></td>
    
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="320"  LookupCode="TxIntent"  style="width:70px;" Field="RadTxIntent" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxIntent_3"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox Runat="server" RecordId="3"  ID="RadTxStopDateText_3" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setRadTxDefaults()"  />
                                    <euc:EformHidden RecordId="3" Runat="server" ID="RadTxStopDate_3" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
  
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:130px;" TABLE="RadiationTherapy" FIELD="RadTxNotes" ShowTextEditor="true"  Runat="server" ID="RadTxNotes_3"  AppendToOnChange="setRadTxDefaults()" /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:120;" Field="RadTxInstitution" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_3"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="3" LookupCode="DataQuality" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_3" style="width: 35px;"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
  </tr>
  
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'RadiationTherapyHtmlTable');" />
<br/><br/>
<br/>

<script type="text/javascript">


function setRadTxDefaults()
{
    defaultRadTxFields($('<% =RadTxDateText_1.ClientID %>'),$('<% =RadTxType_1.ClientID %>'),$('<% =RadTxDisease_1.ClientID %>'),$('<% =RadTxNotes_1.ClientID %>'),$('<% =RadTxInstitution_1.ClientID %>'),$('<% =RadTxQuality_1.ClientID %>'))
    defaultRadTxFields($('<% =RadTxDateText_2.ClientID %>'),$('<% =RadTxType_2.ClientID %>'),$('<% =RadTxDisease_2.ClientID %>'),$('<% =RadTxNotes_2.ClientID %>'),$('<% =RadTxInstitution_2.ClientID %>'),$('<% =RadTxQuality_2.ClientID %>'))
    defaultRadTxFields($('<% =RadTxDateText_3.ClientID %>'),$('<% =RadTxType_3.ClientID %>'),$('<% =RadTxDisease_3.ClientID %>'),$('<% =RadTxNotes_3.ClientID %>'),$('<% =RadTxInstitution_3.ClientID %>'),$('<% =RadTxQuality_3.ClientID %>'))
}


function defaultRadTxFields(DateTextField,TypeField,DiseaseField,NotesField,InstitutionField,QualityField)
{
    if (DateTextField.value != '' || TypeField.value != '' || NotesField.value != '')
    {
        defaultRadTxField(InstitutionField, 'Memorial Sloan Kettering Cancer Center');
        defaultRadTxField(QualityField, 'STD');
        defaultRadTxField(DiseaseField, 'Gastric Cancer – Adenocarcinoma');
    }
    else
    {
//        InstitutionField.value = '';
//        QualityField.value = '';
    }
}

function defaultRadTxField(field, defaultVal)
{
    if (field.value.length == 0) field.value = defaultVal;
}


</script>