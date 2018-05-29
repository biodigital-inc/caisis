<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.ComorbiditiesGTD" CodeFile="ComorbiditiesGTD.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.ComorbiditiesHtmlTable = "ComorbiditiesHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="ComorbiditiesGTD" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Comorbidities"></asp:Label><br/>


<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ComorbiditiesHtmlTable">
  <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Comorbidity</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Duration</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="comorbidities" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Comorbidities', <%# DataBinder.Eval(Container.DataItem, "ComorbidityId") %>, 'ComorbDateText,Comorbidity,ComorbQuality','Comorbidities');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %></td>
			<td align="left" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>&nbsp;</td>
			<td align="left" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ComorbDuration") %>&nbsp;</td>
			<td align="left" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ComorbNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
   <tr> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="1"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_1" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="1"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_1" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="1" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_1"  /> </td>
    <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="1" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_1"  />   
    </td><td><euc:EformTextBox style="width:150px;" RecordId="1" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_1" Runat="server" ShowTextEditor="True"  />
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_1"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_1" runat="server"/></td> 
  </tr>
   <tr> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="2"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_2" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="2"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_2" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="2" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_2"  />  </td>
     <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="2" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_2"  />   
     </td><td><euc:EformTextBox style="width:150px;" RecordId="2" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_2" Runat="server" ShowTextEditor="True"  />
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_2"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_2" runat="server"/></td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="3"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_3" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="3"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_3" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="3" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_3"  /> </td>
    <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="3" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_3"  />   </td>
    <td><euc:EformTextBox  style="width:150px;" RecordId="3" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_3" Runat="server" ShowTextEditor="True"  />
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_3"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_3" runat="server"/></td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="4"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_4" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="4"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_4" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="4" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_4"  />  </td>
     <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="4" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_4"  />    </td>
    <td><euc:EformTextBox  style="width:150px;" RecordId="4" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_4" Runat="server" ShowTextEditor="True"  />
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="4" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_4"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_4" runat="server"/></td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="5"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_5" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="5"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_5" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="5" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_5"  /> </td>  
     <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="5" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_5"  />   </td>
    <td><euc:EformTextBox  style="width:150px;" RecordId="5" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_5" Runat="server" ShowTextEditor="True"  /> 
    
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="5" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_5"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_5" runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="6"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_6" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="6"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_6" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="6" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_6"  /> </td> 
     <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="6" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_6"  />    </td>
    <td><euc:EformTextBox style="width:150px;" RecordId="6" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_63" Runat="server" ShowTextEditor="True"  />
    
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="6" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_6"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_6" runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="7"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_7" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="7"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_7" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="7" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_7"  /> </td>  
     <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="7" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_7"  />  </td>
    <td><euc:EformTextBox style="width:150px;" RecordId="7" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_7" Runat="server" ShowTextEditor="True"  />  
    
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="7" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_7"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_7" runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="8"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_8" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="8"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_8" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="8" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_8"  /> </td>  
     <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="8" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_8"  />   </td>
    <td><euc:EformTextBox style="width:150px;" RecordId="8" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_8" Runat="server" ShowTextEditor="True"  /> 
    
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="8" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_8"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_8" runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="9"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_9" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="9"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_9" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="9" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_9"  />  </td>
     <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="9" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_9"  />  </td>
    <td><euc:EformTextBox style="width:150px;" RecordId="9" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_9" Runat="server" ShowTextEditor="True"  />  
    
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="9" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_9"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_9" runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="10"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_10" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="10"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_10" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="10" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_10"  />  </td>
     <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="10" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_10"  />  </td>
    <td><euc:EformTextBox style="width:150px;" RecordId="10" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_10" Runat="server" ShowTextEditor="True"  />  
    
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="10" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_10"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_10" runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="11"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_11" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="11"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_11" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="11" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_11"  />  </td>
     <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="11" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_11"  />  </td>
    <td><euc:EformTextBox style="width:150px;" RecordId="11" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_11" Runat="server" ShowTextEditor="True"  />  
    
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="11" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_11"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_11" runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="12"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_12" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="12"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_12" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="12" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_12"  />  </td>
     <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="12" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_12"  />   </td>
    <td><euc:EformTextBox style="width:150px;" RecordId="12" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_12" Runat="server" ShowTextEditor="True"  /> 
    
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="12" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_12"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_12" runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="13"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_13" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="13"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_13" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="13" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_13"  /> </td> 
     <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="13" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_13"  /> </td>
    <td><euc:EformTextBox style="width:150px;" RecordId="13" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_13" Runat="server" ShowTextEditor="True"  />   
    
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="13" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_13"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_13" runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="14"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_14" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="14"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_14" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="14" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_14"  />  
     <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="14" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_14"  />  </td>
    <td><euc:EformTextBox style="width:150px;" RecordId="14" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_14" Runat="server" ShowTextEditor="True"  />  
    
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_14"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_14" runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">
	    <euc:EformTextBox  style="width:80px;"  RecordId="15"  TABLE="Comorbidities" FIELD="ComorbDateText"  ID="ComorbDateText_15" Runat="server" ShowCalendar="True" CalcDate="True"   />
	    <euc:EformHidden                        RecordId="15"  TABLE="Comorbidities" FIELD="ComorbDate" ID="ComorbDate_15" Runat="server" />	</td>
    <td style="white-space: nowrap;">
        <euc:EformComboBox DropDownWidth="400"  style="width:160px;" RecordId="15" Table="Comorbidities" Field="Comorbidity" LookupCode="Comorbidity,PercentUsage,Top80" Runat="server" ID="Comorbidity_15"  />  
    <td style="white-space: nowrap;">    
        <euc:EformComboBox DropDownWidth="140" DropDownHeight="auto" style="width:100px;" RecordId="15" Table="Comorbidities" Field="ComorbDuration" LookupCode="ComorbDuration" Runat="server" ID="ComorbDuration_15"  />   </td>
    <td><euc:EformTextBox style="width:150px;" RecordId="15" Table="Comorbidities" Field="ComorbNotes" ID="ComorbNotes_15" Runat="server" ShowTextEditor="True"  /> 
    
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" TABLE="Comorbidities" FIELD="ComorbQuality"  ID="ComorbQuality_15"   Runat="server"  ShowCalendar="False" CalcDate="False" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_15" runat="server"/></td>
  </tr>

</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesHtmlTable');" />


<br/><br/><br/>


<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls
    function addEvents(comorbDateTextID,comorbidityID,comorbQualityID)
    { 
        $(comorbDateTextID).addEvent('blur',curry(SetHiddenFields,comorbDateTextID,comorbidityID,comorbQualityID));
        $(comorbidityID).addEvent('blur',curry(SetHiddenFields,comorbDateTextID,comorbidityID,comorbQualityID));
   }

    addEvents($('<%= ComorbDateText_1.ClientID %>'),$('<%= Comorbidity_1.ClientID %>'),$('<%= ComorbQuality_1.ClientID %>'));
    addEvents($('<%= ComorbDateText_2.ClientID %>'),$('<%= Comorbidity_2.ClientID %>'),$('<%= ComorbQuality_2.ClientID %>'));
    addEvents($('<%= ComorbDateText_3.ClientID %>'),$('<%= Comorbidity_3.ClientID %>'),$('<%= ComorbQuality_3.ClientID %>'));
    addEvents($('<%= ComorbDateText_4.ClientID %>'),$('<%= Comorbidity_4.ClientID %>'),$('<%= ComorbQuality_4.ClientID %>'));
    addEvents($('<%= ComorbDateText_5.ClientID %>'),$('<%= Comorbidity_5.ClientID %>'),$('<%= ComorbQuality_5.ClientID %>'));
    addEvents($('<%= ComorbDateText_6.ClientID %>'),$('<%= Comorbidity_6.ClientID %>'),$('<%= ComorbQuality_6.ClientID %>'));
    addEvents($('<%= ComorbDateText_7.ClientID %>'),$('<%= Comorbidity_7.ClientID %>'),$('<%= ComorbQuality_7.ClientID %>'));
    addEvents($('<%= ComorbDateText_8.ClientID %>'),$('<%= Comorbidity_8.ClientID %>'),$('<%= ComorbQuality_8.ClientID %>'));
    addEvents($('<%= ComorbDateText_9.ClientID %>'),$('<%= Comorbidity_9.ClientID %>'),$('<%= ComorbQuality_9.ClientID %>'));
    addEvents($('<%= ComorbDateText_10.ClientID %>'),$('<%= Comorbidity_10.ClientID %>'),$('<%= ComorbQuality_10.ClientID %>'));
    addEvents($('<%= ComorbDateText_11.ClientID %>'),$('<%= Comorbidity_11.ClientID %>'),$('<%= ComorbQuality_11.ClientID %>'));
    addEvents($('<%= ComorbDateText_12.ClientID %>'),$('<%= Comorbidity_12.ClientID %>'),$('<%= ComorbQuality_12.ClientID %>'));
    addEvents($('<%= ComorbDateText_13.ClientID %>'),$('<%= Comorbidity_13.ClientID %>'),$('<%= ComorbQuality_13.ClientID %>'));
    addEvents($('<%= ComorbDateText_14.ClientID %>'),$('<%= Comorbidity_14.ClientID %>'),$('<%= ComorbQuality_14.ClientID %>'));
    addEvents($('<%= ComorbDateText_15.ClientID %>'),$('<%= Comorbidity_15.ClientID %>'),$('<%= ComorbQuality_15.ClientID %>'));
 
    /* ]]> */
    
function SetHiddenFields(comorbDateTextID,comorbidityID,comorbQualityID)
{
    if (comorbDateTextID.value != '' || comorbidityID.value != '' )
    {
        comorbQualityID.value = 'STD';
    }
    else
    {
        comorbQualityID.value = '';    
    }
}


</script>