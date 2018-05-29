<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.RadiationTherapyBreast" CodeFile="RadiationTherapyBreast.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.RadiationTherapyHtmlTable = "RadiationTherapyHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="RadiationTherapyBreast" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Radiation Therapy"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="RadiationTherapyHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Target</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Disease</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Intent</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="XRT" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxNotes,RadTxDisease,RadTxIntent,RadTxQuality', 'RadiationTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %>&nbsp;</td>
		  <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxNotes")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxDisease")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxIntent")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr >
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox  style="width:80px;" RecordId="1"  TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_1"    Runat="server" ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="1"  TABLE="RadiationTherapy" FIELD="RadTxDate" ID="RadTxDate_1" Runat="server" />    </td> 
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;" RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_1" LookupCode="RadTxType" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="1" Table="RadiationTherapy" Field="RadTxTarget" ID="RadTxTarget_1" LookupCode="RadTxTarget" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:60px;" RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxNotes" ID="RadTxNotes_1" Runat="server" LookupCode="OpSide" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="1" Table="RadiationTherapy" Field="RadTxDisease" ID="RadTxDisease_1" LookupCode="Disease" Runat="server"  /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="1" Table="RadiationTherapy" Field="RadTxIntent" ID="RadTxIntent_1" LookupCode="TxIntent" Runat="server"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="1" Table="RadiationTherapy" Field="RadTxQuality" ID="RadTxQuality_1"   Runat="server"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_1" runat="server"/></td> 
  </tr>
   <tr >
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox  style="width:80px;" RecordId="2"  TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_2"    Runat="server" ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden                       RecordId="2"  TABLE="RadiationTherapy" FIELD="RadTxDate" ID="RadTxDate_2" Runat="server" />    </td> 
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_2" LookupCode="RadTxType" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="2" Table="RadiationTherapy" Field="RadTxTarget" ID="RadTxTarget_2" LookupCode="RadTxTarget" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:60px;" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxNotes" ID="RadTxNotes_2" Runat="server" LookupCode="OpSide" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="2" Table="RadiationTherapy" Field="RadTxDisease" ID="RadTxDisease_2" LookupCode="Disease" Runat="server"  /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="2" Table="RadiationTherapy" Field="RadTxIntent" ID="RadTxIntent_2" LookupCode="TxIntent" Runat="server"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2" Table="RadiationTherapy" Field="RadTxQuality" ID="RadTxQuality_2"   Runat="server"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_2" runat="server"/></td>
  </tr>
  <tr style="display: none;" >
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox  style="width:80px;" RecordId="3"  TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_3"    Runat="server" ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden                       RecordId="3"  TABLE="RadiationTherapy" FIELD="RadTxDate" ID="RadTxDate_3" Runat="server" />    </td> 
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_3" LookupCode="RadTxType" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="3" Table="RadiationTherapy" Field="RadTxTarget" ID="RadTxTarget_3" LookupCode="RadTxTarget" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:60px;" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxNotes" ID="RadTxNotes_3" Runat="server" LookupCode="OpSide" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="3" Table="RadiationTherapy" Field="RadTxDisease" ID="RadTxDisease_3" LookupCode="Disease" Runat="server"  /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="3" Table="RadiationTherapy" Field="RadTxIntent" ID="RadTxIntent_3" LookupCode="TxIntent" Runat="server"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3" Table="RadiationTherapy" Field="RadTxQuality" ID="RadTxQuality_3"   Runat="server"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_3" runat="server"/></td>
  </tr>
  <tr style="display: none;">
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox  style="width:80px;" RecordId="4"  TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_4"    Runat="server" ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden                       RecordId="4"  TABLE="RadiationTherapy" FIELD="RadTxDate" ID="RadTxDate_4" Runat="server" />    </td> 
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_4" LookupCode="RadTxType" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="4" Table="RadiationTherapy" Field="RadTxTarget" ID="RadTxTarget_4" LookupCode="RadTxTarget" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:60px;" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxNotes" ID="RadTxNotes_4" Runat="server" LookupCode="OpSide" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="4" Table="RadiationTherapy" Field="RadTxDisease" ID="RadTxDisease_4" LookupCode="Disease" Runat="server"  /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="4" Table="RadiationTherapy" Field="RadTxIntent" ID="RadTxIntent_4" LookupCode="TxIntent" Runat="server"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" Table="RadiationTherapy" Field="RadTxQuality" ID="RadTxQuality_4"   Runat="server"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_4" runat="server"/></td>
  </tr>
  <tr style="display: none;">
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox  style="width:80px;" RecordId="5"  TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_5"    Runat="server" ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden                       RecordId="5"  TABLE="RadiationTherapy" FIELD="RadTxDate" ID="RadTxDate_5" Runat="server" />    </td> 
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_5" LookupCode="RadTxType" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="5" Table="RadiationTherapy" Field="RadTxTarget" ID="RadTxTarget_5" LookupCode="RadTxTarget" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:60px;" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxNotes" ID="RadTxNotes_5" Runat="server" LookupCode="OpSide" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="5" Table="RadiationTherapy" Field="RadTxDisease" ID="RadTxDisease_5" LookupCode="Disease" Runat="server"  /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="5" Table="RadiationTherapy" Field="RadTxIntent" ID="RadTxIntent_5" LookupCode="TxIntent" Runat="server"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" Table="RadiationTherapy" Field="RadTxQuality" ID="RadTxQuality_5"   Runat="server"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_5" runat="server"/></td>
  </tr>
  <tr style="display: none;">
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox  style="width:80px;" RecordId="6"  TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_6"    Runat="server" ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden                       RecordId="6"  TABLE="RadiationTherapy" FIELD="RadTxDate" ID="RadTxDate_6" Runat="server" />    </td> 
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;" RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_6" LookupCode="RadTxType" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="6" Table="RadiationTherapy" Field="RadTxTarget" ID="RadTxTarget_6" LookupCode="RadTxTarget" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:60px;" RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxNotes" ID="RadTxNotes_6" Runat="server" LookupCode="OpSide" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="6" Table="RadiationTherapy" Field="RadTxDisease" ID="RadTxDisease_6" LookupCode="Disease" Runat="server"  /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="6" Table="RadiationTherapy" Field="RadTxIntent" ID="RadTxIntent_6" LookupCode="TxIntent" Runat="server"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="6" Table="RadiationTherapy" Field="RadTxQuality" ID="RadTxQuality_6"   Runat="server"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_6" runat="server"/></td>
  </tr>
  <tr style="display: none;">
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox  style="width:80px;" RecordId="7"  TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_7"    Runat="server" ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden                       RecordId="7"  TABLE="RadiationTherapy" FIELD="RadTxDate" ID="RadTxDate_7" Runat="server" />    </td> 
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;" RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_7" LookupCode="RadTxType" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="7" Table="RadiationTherapy" Field="RadTxTarget" ID="RadTxTarget_7" LookupCode="RadTxTarget" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:60px;" RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxNotes" ID="RadTxNotes_7" Runat="server" LookupCode="OpSide" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="7" Table="RadiationTherapy" Field="RadTxDisease" ID="RadTxDisease_7" LookupCode="Disease" Runat="server"  /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="7" Table="RadiationTherapy" Field="RadTxIntent" ID="RadTxIntent_7" LookupCode="TxIntent" Runat="server"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="7" Table="RadiationTherapy" Field="RadTxQuality" ID="RadTxQuality_7"   Runat="server"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_7" runat="server"/></td>
  </tr>
  <tr style="display: none;">
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
        <euc:EformTextBox  style="width:80px;" RecordId="8"  TABLE="RadiationTherapy" FIELD="RadTxDateText" ID="RadTxDateText_8"    Runat="server" ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden                       RecordId="8"  TABLE="RadiationTherapy" FIELD="RadTxDate" ID="RadTxDate_8" Runat="server" />    </td> 
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;" RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxType" ID="RadTxType_8" LookupCode="RadTxType" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="8" Table="RadiationTherapy" Field="RadTxTarget" ID="RadTxTarget_8" LookupCode="RadTxTarget" Runat="server" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:60px;" RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxNotes" ID="RadTxNotes_8" Runat="server" LookupCode="OpSide" /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="8" Table="RadiationTherapy" Field="RadTxDisease" ID="RadTxDisease_8" LookupCode="Disease" Runat="server"  /></td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="auto"  style="width:80px;" RecordId="8" Table="RadiationTherapy" Field="RadTxIntent" ID="RadTxIntent_8" LookupCode="TxIntent" Runat="server"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="8" Table="RadiationTherapy" Field="RadTxQuality" ID="RadTxQuality_8"   Runat="server"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_8" runat="server"/></td>
  </tr>
 
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'RadiationTherapyHtmlTable');" />
<br/><br/><br/>


<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls
    function addEvents(radTxDateTextID,radTxTypeID,radTxTargetID,radTxDiseaseID,radTxQualityID)
    { 
        $(radTxDateTextID).addEvent('blur',curry(SetHiddenFields,radTxDateTextID,radTxTypeID,radTxTargetID,radTxDiseaseID,radTxQualityID));
        $(radTxTypeID).addEvent('blur',curry(SetHiddenFields,radTxDateTextID,radTxTypeID,radTxTargetID,radTxDiseaseID,radTxQualityID));
   }

    addEvents($('<%= RadTxDateText_1.ClientID %>'),$('<%= RadTxType_1.ClientID %>'),$('<%= RadTxTarget_1.ClientID %>'),$('<%= RadTxDisease_1.ClientID %>'),$('<%= RadTxQuality_1.ClientID %>'));
    addEvents($('<%= RadTxDateText_2.ClientID %>'),$('<%= RadTxType_2.ClientID %>'),$('<%= RadTxTarget_2.ClientID %>'),$('<%= RadTxDisease_2.ClientID %>'),$('<%= RadTxQuality_2.ClientID %>'));
    addEvents($('<%= RadTxDateText_3.ClientID %>'),$('<%= RadTxType_3.ClientID %>'),$('<%= RadTxTarget_3.ClientID %>'),$('<%= RadTxDisease_3.ClientID %>'),$('<%= RadTxQuality_3.ClientID %>'));
    addEvents($('<%= RadTxDateText_4.ClientID %>'),$('<%= RadTxType_4.ClientID %>'),$('<%= RadTxTarget_4.ClientID %>'),$('<%= RadTxDisease_4.ClientID %>'),$('<%= RadTxQuality_4.ClientID %>'));
    addEvents($('<%= RadTxDateText_5.ClientID %>'),$('<%= RadTxType_5.ClientID %>'),$('<%= RadTxTarget_5.ClientID %>'),$('<%= RadTxDisease_5.ClientID %>'),$('<%= RadTxQuality_5.ClientID %>'));
    addEvents($('<%= RadTxDateText_6.ClientID %>'),$('<%= RadTxType_6.ClientID %>'),$('<%= RadTxTarget_6.ClientID %>'),$('<%= RadTxDisease_6.ClientID %>'),$('<%= RadTxQuality_6.ClientID %>'));
    addEvents($('<%= RadTxDateText_7.ClientID %>'),$('<%= RadTxType_7.ClientID %>'),$('<%= RadTxTarget_7.ClientID %>'),$('<%= RadTxDisease_7.ClientID %>'),$('<%= RadTxQuality_7.ClientID %>'));
    addEvents($('<%= RadTxDateText_8.ClientID %>'),$('<%= RadTxType_8.ClientID %>'),$('<%= RadTxTarget_8.ClientID %>'),$('<%= RadTxDisease_8.ClientID %>'),$('<%= RadTxQuality_8.ClientID %>'));
 
    /* ]]> */
    
function SetHiddenFields(radTxDateTextID,radTxTypeID,radTxTargetID,radTxDiseaseID,radTxQualityID)
{
  
    if (radTxDateTextID.value != '' || radTxTypeID.value != '')
    {
        radTxQualityID.value = 'STD';
        radTxTargetID.value = 'Breast';
        radTxDiseaseID.value = 'Breast Cancer';
        
    }
    else
    {
        radTxQualityID.value = ''; 
        radTxTargetID.value = '';
        radTxDiseaseID.value = '';   
    }
}
</script>