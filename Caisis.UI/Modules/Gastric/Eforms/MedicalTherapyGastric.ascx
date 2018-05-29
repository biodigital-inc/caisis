<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.MedicalTherapyGastric" CodeFile="MedicalTherapyGastric.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.MedicalTherapyHtmlTable = "MedicalTherapyHtmlTable";
</script>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="MedicalTherapyGastric" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medical Therapies"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicalTherapyHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;white-space:nowrap;">&nbsp;Date</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Agent</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Intent</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Disease</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Institution</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Quality</td>
    <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <asp:Repeater ID="MedicalTherapies" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxDate,MedTxType,MedTxAgent,MedTxIntent,MedTxDisease,MedTxNotes,MedTxInstitution,MedTxQuality', 'MedicalTherapyGastric');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxType") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxIntent") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxDisease") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxNotes")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxInstitution") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxQuality") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr onclick="setMedTxDefaults()">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="MedTxDateText_1" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setMedTxDefaults()"  />
        <euc:EformHidden RecordId="1" Runat="server" ID="MedTxDate_1" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="440"  LookupCode="MedTxAgent" style="width:140;" Field="MedTxAgent" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxAgent_1"   /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="1" LookupCode="MedTxType" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_1" style="width: 51px;"  AppendToOnChange="setMedTxDefaults()"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="auto"  LookupCode="TxIntent"  style="width:70;" Field="MedTxIntent" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxIntent_1"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="200"  LookupCode="Disease"  style="width:70;" Field="MedTxDisease" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxDisease_1"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_1"  AppendToOnChange="setMedTxDefaults()" /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="260" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="MedTxInstitution" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_1"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="1" LookupCode="DataQuality" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_1" style="width: 35px;"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;" onclick="setMedTxDefaults()">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="MedTxDateText_2" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setMedTxDefaults()"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="MedTxDate_2" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="440"  LookupCode="MedTxAgent" style="width:140;" Field="MedTxAgent" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxAgent_2"   /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="2" LookupCode="MedTxType" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_2" style="width: 51px;"  AppendToOnChange="setMedTxDefaults()"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="auto"  LookupCode="TxIntent"  style="width:70;" Field="MedTxIntent" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxIntent_2"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="200"  LookupCode="Disease"  style="width:70;" Field="MedTxDisease" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxDisease_2"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_2"  AppendToOnChange="setMedTxDefaults()" /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="260" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="MedTxInstitution" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_2"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="2" LookupCode="DataQuality" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_2" style="width: 35px;"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
  <tr style="display: none;" onclick="setMedTxDefaults()">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="MedTxDateText_3" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setMedTxDefaults()"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="MedTxDate_3" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="440"  LookupCode="MedTxAgent" style="width:140;" Field="MedTxAgent" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxAgent_3"   /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="3" LookupCode="MedTxType" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_3" style="width: 51px;"  AppendToOnChange="setMedTxDefaults()"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="auto"  LookupCode="TxIntent"  style="width:70;" Field="MedTxIntent" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxIntent_3"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="200"  LookupCode="Disease"  style="width:70;" Field="MedTxDisease" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxDisease_3"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_3"  AppendToOnChange="setMedTxDefaults()" /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="260" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="MedTxInstitution" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_3"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="3" LookupCode="DataQuality" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_3" style="width: 35px;"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MedicalTherapyHtmlTable');" />
<br/><br/>
<br/>

<script type="text/javascript">


function setMedTxDefaults()
{
    defaultMedTxFields($('<% =MedTxDateText_1.ClientID %>'),$('<% =MedTxAgent_1.ClientID %>'),$('<% =MedTxType_1.ClientID %>'),$('<% =MedTxIntent_1.ClientID %>'),$('<% =MedTxDisease_1.ClientID %>'),$('<% =MedTxNotes_1.ClientID %>'),$('<% =MedTxInstitution_1.ClientID %>'),$('<% =MedTxQuality_1.ClientID %>'))
    defaultMedTxFields($('<% =MedTxDateText_2.ClientID %>'),$('<% =MedTxAgent_2.ClientID %>'),$('<% =MedTxType_2.ClientID %>'),$('<% =MedTxIntent_2.ClientID %>'),$('<% =MedTxDisease_2.ClientID %>'),$('<% =MedTxNotes_2.ClientID %>'),$('<% =MedTxInstitution_2.ClientID %>'),$('<% =MedTxQuality_2.ClientID %>'))
    defaultMedTxFields($('<% =MedTxDateText_3.ClientID %>'),$('<% =MedTxAgent_3.ClientID %>'),$('<% =MedTxType_3.ClientID %>'),$('<% =MedTxIntent_3.ClientID %>'),$('<% =MedTxDisease_3.ClientID %>'),$('<% =MedTxNotes_3.ClientID %>'),$('<% =MedTxInstitution_3.ClientID %>'),$('<% =MedTxQuality_3.ClientID %>'))
}


function defaultMedTxFields(DateTextField,AgentField,TypeField,IntentField,DiseaseField,NotesField,InstitutionField,QualityField)
{
    if (DateTextField.value != '' || AgentField.value != '' || IntentField.value != '' || NotesField.value != '')
    {
        defaultMedTxField(TypeField, 'CHEMO');
        defaultMedTxField(InstitutionField, 'Memorial Sloan Kettering Cancer Center');
        defaultMedTxField(QualityField, 'STD');
        defaultMedTxField(DiseaseField, 'Gastric Cancer – Adenocarcinoma');
    }
    else
    {
//        TypeField.value = '';
//        InstitutionField.value = '';
//        QualityField.value = '';
//        DiseaseField.value = '';
    }
}

function defaultMedTxField(field, defaultVal)
{
    if (field.value.length == 0) field.value = defaultVal;
}


</script>