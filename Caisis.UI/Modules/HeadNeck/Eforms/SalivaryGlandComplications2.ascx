<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandComplications2" CodeFile="SalivaryGlandComplications2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script language="javascript" type="text/javascript">
    tableArray.SalivaryGlandComplications2HtmlTable = "SalivaryGlandComplications2HtmlTable";
</script>

<a name="SalivaryGlandComplications2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=" "></asp:Label><br/>
<table cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle">Complications ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="Complication2Recorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="Complication2Recorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>
<br /><br />
<div id="ComplicationDiv" runat="server" style="display: none;">
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SalivaryGlandComplications2HtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Complication</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Related to</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Data Quality</td>
    <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>
   </tr>

  <asp:Repeater ID="ComplicationsRptr" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Toxicities', <%# DataBinder.Eval(Container.DataItem, "ToxicityId") %>, 'ToxDateText,ToxDate,ToxName,ToxRelatedTo,ToxQuality','Toxicities');"> 
			<td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ToxDateText")%></td>
			<td align="left" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ToxName")%>&nbsp;</td>
			<td align="left" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ToxRelatedTo")%>&nbsp;</td>
			<td align="left" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ToxQuality")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr >
    <td style="white-space:nowrap;">              
        <euc:EformTextBox Width="80px" RecordId="15" ID="ToxDateText_15" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ShowCalendar="true" CalcDate="true" />
        <euc:EformHidden               RecordId="15"   ID="ToxDate_15" Table="Toxicities" Field="ToxDate" Runat="server" /></td>
    <td style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="150px"   RecordId="15"   ID="ToxName_15" TABLE="Toxicities" FIELD="ToxName" LookupCode="ToxName_Complication,Disease,HeadNeck" Runat="server"  /></td>
    <td style="white-space:nowrap;">
        <euc:EformDropDownList Width="100px"   RecordId="15"   ID="ToxRelatedTo_15" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Chemo" Text="Chemo"></asp:ListItem>
            <asp:ListItem Value="Radiation" Text="Radiation"></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px"   RecordId="15"   ID="ToxQuality_15" TABLE="Toxicities" FIELD="ToxQuality" LookupCode="DataQuality" Runat="server" /></td>
    <td><euc:EformDeleteIcon ID="Delete_15" runat="server"/></td>
 </tr>
  <tr style="display: none;" >
    <td style="white-space:nowrap;">              
        <euc:EformTextBox Width="80px" RecordId="16" ID="ToxDateText_16" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ShowCalendar="true" CalcDate="true" />
        <euc:EformHidden               RecordId="16"   ID="ToxDate_16" Table="Toxicities" Field="ToxDate" Runat="server" /></td>
    <td style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="150px"   RecordId="16"   ID="ToxName_16" TABLE="Toxicities" FIELD="ToxName" LookupCode="ToxName_Complication,Disease,HeadNeck" Runat="server"  /></td>
    <td style="white-space:nowrap;">
        <euc:EformDropDownList Width="100px"   RecordId="16"   ID="ToxRelatedTo_16" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Chemo" Text="Chemo"></asp:ListItem>
            <asp:ListItem Value="Radiation" Text="Radiation"></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px"   RecordId="16"   ID="ToxQuality_16" TABLE="Toxicities" FIELD="ToxQuality" LookupCode="DataQuality" Runat="server" /></td>
    <td><euc:EformDeleteIcon ID="Delete_16" runat="server"/></td>
 </tr>
  <tr style="display: none;" >
    <td style="white-space:nowrap;">              
        <euc:EformTextBox Width="80px" RecordId="17" ID="ToxDateText_17" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ShowCalendar="true" CalcDate="true" />
        <euc:EformHidden               RecordId="17"   ID="ToxDate_17" Table="Toxicities" Field="ToxDate" Runat="server" /></td>
    <td style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="150px"   RecordId="17"   ID="ToxName_17" TABLE="Toxicities" FIELD="ToxName" LookupCode="ToxName_Complication,Disease,HeadNeck" Runat="server"  /></td>
    <td style="white-space:nowrap;">
        <euc:EformDropDownList Width="100px"   RecordId="17"   ID="ToxRelatedTo_17" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Chemo" Text="Chemo"></asp:ListItem>
            <asp:ListItem Value="Radiation" Text="Radiation"></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px"   RecordId="17"   ID="ToxQuality_17" TABLE="Toxicities" FIELD="ToxQuality" LookupCode="DataQuality" Runat="server" /></td>
    <td><euc:EformDeleteIcon ID="Delete_17" runat="server"/></td>
 </tr>
  <tr style="display: none;" >
    <td style="white-space:nowrap;">              
        <euc:EformTextBox Width="80px" RecordId="18" ID="ToxDateText_18" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ShowCalendar="true" CalcDate="true" />
        <euc:EformHidden               RecordId="18"   ID="ToxDate_18" Table="Toxicities" Field="ToxDate" Runat="server" /></td>
    <td style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="150px"   RecordId="18"   ID="ToxName_18" TABLE="Toxicities" FIELD="ToxName" LookupCode="ToxName_Complication,Disease,HeadNeck" Runat="server"  /></td>
    <td style="white-space:nowrap;">
        <euc:EformDropDownList Width="100px"   RecordId="18"   ID="ToxRelatedTo_18" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Chemo" Text="Chemo"></asp:ListItem>
            <asp:ListItem Value="Radiation" Text="Radiation"></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px"   RecordId="18"   ID="ToxQuality_18" TABLE="Toxicities" FIELD="ToxQuality" LookupCode="DataQuality" Runat="server" /></td>
    <td><euc:EformDeleteIcon ID="Delete_18" runat="server"/></td>
 </tr>
  <tr style="display: none;" >
    <td style="white-space:nowrap;">              
        <euc:EformTextBox Width="80px" RecordId="19" ID="ToxDateText_19" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ShowCalendar="true" CalcDate="true" />
        <euc:EformHidden               RecordId="19"   ID="ToxDate_19" Table="Toxicities" Field="ToxDate" Runat="server" /></td>
    <td style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="150px"   RecordId="19"   ID="ToxName_19" TABLE="Toxicities" FIELD="ToxName" LookupCode="ToxName_Complication,Disease,HeadNeck" Runat="server"  /></td>
    <td style="white-space:nowrap;">
        <euc:EformDropDownList Width="100px"   RecordId="19"   ID="ToxRelatedTo_19" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Chemo" Text="Chemo"></asp:ListItem>
            <asp:ListItem Value="Radiation" Text="Radiation"></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT"></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="250px" Width="100px"   RecordId="19"   ID="ToxQuality_19" TABLE="Toxicities" FIELD="ToxQuality" LookupCode="DataQuality" Runat="server" /></td>
    <td><euc:EformDeleteIcon ID="Delete_19" runat="server"/></td>
 </tr>

</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'SalivaryGlandComplications2HtmlTable');" />
</div>
<br /><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo

    addAbsentEvent($('<%= Complication2Recorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ToxDateText_15.ClientID %>'),$('<%= ToxDate_15.ClientID %>'),$('<%= ToxName_15.ClientID %>'),$('<%= ToxRelatedTo_15.ClientID %>'),$('<%= ToxQuality_15.ClientID %>'));
    addAbsentEvent($('<%= Complication2Recorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ToxDateText_16.ClientID %>'),$('<%= ToxDate_16.ClientID %>'),$('<%= ToxName_16.ClientID %>'),$('<%= ToxRelatedTo_16.ClientID %>'),$('<%= ToxQuality_16.ClientID %>'));
    addAbsentEvent($('<%= Complication2Recorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ToxDateText_17.ClientID %>'),$('<%= ToxDate_17.ClientID %>'),$('<%= ToxName_17.ClientID %>'),$('<%= ToxRelatedTo_17.ClientID %>'),$('<%= ToxQuality_17.ClientID %>'));
    addAbsentEvent($('<%= Complication2Recorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ToxDateText_18.ClientID %>'),$('<%= ToxDate_18.ClientID %>'),$('<%= ToxName_18.ClientID %>'),$('<%= ToxRelatedTo_18.ClientID %>'),$('<%= ToxQuality_18.ClientID %>'));
    addAbsentEvent($('<%= Complication2Recorded.ClientID %>'),$('<%= ComplicationDiv.ClientID %>'),$('<%= ToxDateText_19.ClientID %>'),$('<%= ToxDate_19.ClientID %>'),$('<%= ToxName_19.ClientID %>'),$('<%= ToxRelatedTo_19.ClientID %>'),$('<%= ToxQuality_19.ClientID %>'));
   

    function addAbsentEvent(complicationRecordedID,complicationDivID,dateText,date,toxName,ToxRelatedTo,toxQuality)
    {  
        $(complicationRecordedID).addEvent('click',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,dateText,date,toxName,ToxRelatedTo,toxQuality));
        $(dateText).addEvent('blur',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,dateText,date,toxName,ToxRelatedTo,toxQuality));
        $(toxName).addEvent('blur',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,dateText,date,toxName,ToxRelatedTo,toxQuality));
        $(ToxRelatedTo).addEvent('blur',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,dateText,date,toxName,ToxRelatedTo,toxQuality));
        $(toxQuality).addEvent('blur',curry(ComplicationYesNo,complicationRecordedID,complicationDivID,dateText,date,toxName,ToxRelatedTo,toxQuality));
      
        // check on load as well
       ComplicationYesNo(complicationRecordedID,complicationDivID,dateText,date,toxName,ToxRelatedTo,toxQuality);

    }
   
    /* ]]> */
   
    function ComplicationYesNo(complicationRecordedID,complicationDivID,dateText,date,toxName,ToxRelatedTo,toxQuality)
    {
       var complicationRecordedRef = complicationRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < complicationRecordedRef.length; i++) 
        if (complicationRecordedRef[i].checked) {  
            ComplicationRadioClick(complicationRecordedRef[i].value,complicationDivID,dateText,date,toxName,ToxRelatedTo,toxQuality);
            }
    }    
   
    function ComplicationRadioClick(Complicationoption_value,ComplicationhideDiv,dateText,date,toxName,ToxRelatedTo,toxQuality)
    {
        
      if (Complicationoption_value == "Yes")
      { 
       ComplicationhideDiv.style.display='block';
      } 
      else if (Complicationoption_value == "No")
      {
        ComplicationhideDiv.style.display='none';
        
        dateText.value = '';
        date.value = '';
        toxName.value = '';
        ToxRelatedTo.value = '';
        toxQuality.value = '';     
        
      }
  }
</script>

