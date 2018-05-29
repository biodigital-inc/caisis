<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.ClinicalStageGTD" CodeFile="ClinicalStageGTD.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script language="javascript">
	tableArray.ClinicalStagesHtmlTable = "ClinicalStagesHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="ClinicalStageGTD" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Diagnostics"></asp:Label><br/>
<table  cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ClinicalStagesHtmlTable">
  <tr> 
    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Stage</td>
    <td class="controlBoxDataGridHeaderFirstCol">Disease</td>
    <td class="controlBoxDataGridHeaderFirstCol">Quality</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="clinicalStages" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('ClinicalStages', <%# DataBinder.Eval(Container.DataItem, "ClinicalStageId") %>, 'ClinStageDateText,ClinStageDate,ClinStageDisease,ClinStageSystem,ClinStageGroup,ClinStageGroup,ClinStageQuality', 'ClinicalStageGTD');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageDateText")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageGroup")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageDisease")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageQuality")%></td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="1"  ID="ClinStageDateText_1" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setClinStageDefaults()"   />
		<euc:EformHidden RecordId="1" Runat="server" ID="ClinStageDate_1" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setClinStageDefaults()">
    <euc:EformSelect DropDownWidth="550" DropDownHeight="auto" style="width: 60px;"  RecordId="1" LookupCode="StageClin_GTD_FIGO" TABLE="ClinicalStages" FIELD="ClinStageGroup" Runat="server" ID="ClinStageGroup_1"/>
    </td>
    <td><euc:EformComboBox LookupCode="Disease" id="ClinStageDisease_1" Table="ClinicalStages" RecordId="1" Field="ClinStageDisease" runat="server" Width="210" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="1"  FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_1" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="1"  FIELD="ClinStageT" Runat="server" ID="ClinStageT_1" />
    </td>
    <td><euc:EformSelect RecordId="1" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_1" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="2"  ID="ClinStageDateText_2" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setClinStageDefaults()"   />
		<euc:EformHidden RecordId="2" Runat="server" ID="ClinStageDate_2" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setClinStageDefaults()">
    <euc:EformSelect DropDownWidth="550" DropDownHeight="auto" style="width: 60px;"  RecordId="2" LookupCode="StageClin_GTD_FIGO" TABLE="ClinicalStages" FIELD="ClinStageGroup" Runat="server" ID="ClinStageGroup_2"/>
    </td>
    <td><euc:EformComboBox LookupCode="Disease" id="ClinStageDisease_2" Table="ClinicalStages" RecordId="2" Field="ClinStageDisease" runat="server" Width="210" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="2"  FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_2" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="2"  FIELD="ClinStageT" Runat="server" ID="ClinStageT_2" />
    </td>
    <td><euc:EformSelect RecordId="2" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_2" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
    <tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="3"  ID="ClinStageDateText_3" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setClinStageDefaults()"   />
		<euc:EformHidden RecordId="3" Runat="server" ID="ClinStageDate_3" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setClinStageDefaults()">
    <euc:EformSelect DropDownWidth="550" DropDownHeight="auto" style="width: 60px;"  RecordId="3" LookupCode="StageClin_GTD_FIGO" TABLE="ClinicalStages" FIELD="ClinStageGroup" Runat="server" ID="ClinStageGroup_3"/>
    </td>
    <td><euc:EformComboBox LookupCode="Disease" id="ClinStageDisease_3" Table="ClinicalStages" RecordId="3" Field="ClinStageDisease" runat="server" Width="210" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="3"  FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_3" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="3"  FIELD="ClinStageT" Runat="server" ID="ClinStageT_3" />
    </td>
    <td><euc:EformSelect RecordId="3" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_3" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
  </tr>
    <tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="4"  ID="ClinStageDateText_4" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setClinStageDefaults()"   />
		<euc:EformHidden RecordId="4" Runat="server" ID="ClinStageDate_4" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setClinStageDefaults()">
    <euc:EformSelect DropDownWidth="550" DropDownHeight="auto" style="width: 60px;"  RecordId="4" LookupCode="StageClin_GTD_FIGO" TABLE="ClinicalStages" FIELD="ClinStageGroup" Runat="server" ID="ClinStageGroup_4"/>
    </td>
    <td><euc:EformComboBox LookupCode="Disease" id="ClinStageDisease_4" Table="ClinicalStages" RecordId="4" Field="ClinStageDisease" runat="server" Width="210" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="4"  FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_4" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="4"  FIELD="ClinStageT" Runat="server" ID="ClinStageT_4" />
    </td>
    <td><euc:EformSelect RecordId="4" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_4" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
  </tr>

  <tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="5"  ID="ClinStageDateText_5" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setClinStageDefaults()"   />
		<euc:EformHidden RecordId="5" Runat="server" ID="ClinStageDate_5" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setClinStageDefaults()">
    <euc:EformSelect DropDownWidth="550" DropDownHeight="auto" style="width: 60px;"  RecordId="5" LookupCode="StageClin_GTD_FIGO" TABLE="ClinicalStages" FIELD="ClinStageGroup" Runat="server" ID="ClinStageGroup_5"/>
    </td>
    <td><euc:EformComboBox LookupCode="Disease" id="ClinStageDisease_5" Table="ClinicalStages" RecordId="5" Field="ClinStageDisease" runat="server" Width="210" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="5"  FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_5" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="5"  FIELD="ClinStageT" Runat="server" ID="ClinStageT_5" />
    </td>
    <td><euc:EformSelect RecordId="5" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_5" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
  </tr>
    <tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="6"  ID="ClinStageDateText_6" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setClinStageDefaults()"   />
		<euc:EformHidden RecordId="6" Runat="server" ID="ClinStageDate_6" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setClinStageDefaults()">
    <euc:EformSelect DropDownWidth="550" DropDownHeight="auto" style="width: 60px;"  RecordId="6" LookupCode="StageClin_GTD_FIGO" TABLE="ClinicalStages" FIELD="ClinStageGroup" Runat="server" ID="ClinStageGroup_6"/>
    </td>
    <td><euc:EformComboBox LookupCode="Disease" id="ClinStageDisease_6" Table="ClinicalStages" RecordId="6" Field="ClinStageDisease" runat="server" Width="210" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="6"  FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_6" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="6"  FIELD="ClinStageT" Runat="server" ID="ClinStageT_6" />
    </td>
    <td><euc:EformSelect RecordId="6" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_6" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
  </tr>
    <tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="7"  ID="ClinStageDateText_7" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setClinStageDefaults()"   />
		<euc:EformHidden RecordId="7" Runat="server" ID="ClinStageDate_7" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setClinStageDefaults()">
    <euc:EformSelect DropDownWidth="550" DropDownHeight="auto" style="width: 60px;"  RecordId="7" LookupCode="StageClin_GTD_FIGO" TABLE="ClinicalStages" FIELD="ClinStageGroup" Runat="server" ID="ClinStageGroup_7"/>
    </td>
    <td><euc:EformComboBox LookupCode="Disease" id="ClinStageDisease_7" Table="ClinicalStages" RecordId="7" Field="ClinStageDisease" runat="server" Width="210" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="7"  FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_7" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="7"  FIELD="ClinStageT" Runat="server" ID="ClinStageT_7" />
    </td>
    <td><euc:EformSelect RecordId="7" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_7" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
  </tr>
    <tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="8"  ID="ClinStageDateText_8" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setClinStageDefaults()"   />
		<euc:EformHidden RecordId="8" Runat="server" ID="ClinStageDate_8" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setClinStageDefaults()">
    <euc:EformSelect DropDownWidth="550" DropDownHeight="auto" style="width: 60px;"  RecordId="8" LookupCode="StageClin_GTD_FIGO" TABLE="ClinicalStages" FIELD="ClinStageGroup" Runat="server" ID="ClinStageGroup_8"/>
    </td>
    <td><euc:EformComboBox LookupCode="Disease" id="ClinStageDisease_8" Table="ClinicalStages" RecordId="8" Field="ClinStageDisease" runat="server" Width="210" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="8"  FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_8" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="8"  FIELD="ClinStageT" Runat="server" ID="ClinStageT_8" />
    </td>
    <td><euc:EformSelect RecordId="8" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_8" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
  </tr>
 

</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ClinicalStagesHtmlTable');" />
<br/><br/>
<br/>

<script type="text/javascript">


function setClinStageDefaults()
{
    defaultClinStageFields($('<% =ClinStageDateText_1.ClientID %>'),$('<% =ClinStageGroup_1.ClientID %>'),$('<% =ClinStageDisease_1.ClientID %>'),$('<% =ClinStageQuality_1.ClientID %>'),$('<% =ClinStageSystem_1.ClientID %>'),$('<% =ClinStageT_1.ClientID %>'));
    defaultClinStageFields($('<% =ClinStageDateText_2.ClientID %>'),$('<% =ClinStageGroup_2.ClientID %>'),$('<% =ClinStageDisease_2.ClientID %>'),$('<% =ClinStageQuality_2.ClientID %>'),$('<% =ClinStageSystem_2.ClientID %>'),$('<% =ClinStageT_2.ClientID %>'));
    defaultClinStageFields($('<% =ClinStageDateText_3.ClientID %>'),$('<% =ClinStageGroup_3.ClientID %>'),$('<% =ClinStageDisease_3.ClientID %>'),$('<% =ClinStageQuality_3.ClientID %>'),$('<% =ClinStageSystem_3.ClientID %>'),$('<% =ClinStageT_3.ClientID %>'));
    defaultClinStageFields($('<% =ClinStageDateText_4.ClientID %>'),$('<% =ClinStageGroup_4.ClientID %>'),$('<% =ClinStageDisease_4.ClientID %>'),$('<% =ClinStageQuality_4.ClientID %>'),$('<% =ClinStageSystem_4.ClientID %>'),$('<% =ClinStageT_4.ClientID %>'));
    defaultClinStageFields($('<% =ClinStageDateText_5.ClientID %>'),$('<% =ClinStageGroup_5.ClientID %>'),$('<% =ClinStageDisease_5.ClientID %>'),$('<% =ClinStageQuality_5.ClientID %>'),$('<% =ClinStageSystem_5.ClientID %>'),$('<% =ClinStageT_5.ClientID %>'));
    defaultClinStageFields($('<% =ClinStageDateText_6.ClientID %>'),$('<% =ClinStageGroup_6.ClientID %>'),$('<% =ClinStageDisease_6.ClientID %>'),$('<% =ClinStageQuality_6.ClientID %>'),$('<% =ClinStageSystem_6.ClientID %>'),$('<% =ClinStageT_6.ClientID %>'));
    defaultClinStageFields($('<% =ClinStageDateText_7.ClientID %>'),$('<% =ClinStageGroup_7.ClientID %>'),$('<% =ClinStageDisease_7.ClientID %>'),$('<% =ClinStageQuality_7.ClientID %>'),$('<% =ClinStageSystem_7.ClientID %>'),$('<% =ClinStageT_7.ClientID %>'));
    defaultClinStageFields($('<% =ClinStageDateText_8.ClientID %>'),$('<% =ClinStageGroup_8.ClientID %>'),$('<% =ClinStageDisease_8.ClientID %>'),$('<% =ClinStageQuality_8.ClientID %>'),$('<% =ClinStageSystem_8.ClientID %>'),$('<% =ClinStageT_8.ClientID %>'));
}


function defaultClinStageFields(DateTextField,GroupField,DiseaseField,QualityField,SystemField,TField)
{
    if (DateTextField.value != '' || GroupField.value != '' || DiseaseField.value != '')
    {
        defaultDxField(QualityField, 'STD');
        defaultDxField(DiseaseField, 'Gestational Trophoblastic Disease');
        SystemField.value = 'FIGO';
        TField.value = 'N/A';
    }
    else
    {
        SystemField.value = '';
        TField.value = '';
    }
}

function defaultDxField(field, defaultVal)
{
    if (field.value.length == 0) field.value = defaultVal;
}


</script>