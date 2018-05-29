<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.Recurrence" CodeFile="Recurrence.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.DiseaseRecurTable = "DiseaseRecurTable";
	
	function updateRecurDetails(diseaseId, qltyId)
	{
	    document.getElementById(diseaseId).value='Thyroid Cancer';
	    document.getElementById(qltyId).value='STD';	    
	}
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Recurrence" />
  
<span class="controlBoxTitle">Disease Recurrence</span> <br/>

<table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DiseaseRecurTable">     
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Status</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" colspan="2">Location</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <!--Start of prepopulating existing data -->
  <asp:Repeater ID="StatusRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Status', <%# DataBinder.Eval(Container.DataItem, "StatusId") %>, 'StatusDateText,StatusDate,Status,StatusNotes', 'Status');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Status")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "StatusDateText")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn" colspan="3"><%# DataBinder.Eval(Container.DataItem, "StatusNotes")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  <!--End of prepopulating existing data -->
  
  <!--Start of Local Recurrence-->
  <tr>    
    <td height="28" class="ClinicalEformPopulatedColumn" >Local Recurrence</td>
    <td align="center" height="28" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Runat="server" RecordId="6"  ID="StatusDateText_6" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="Status_6,StatusDisease_6,StatusQuality_6" TabIndex="56" />
        <euc:EformHidden RecordId="6" Runat="server" ID="StatusDate_6" Table="Status" Field="StatusDate" /></td>
        <euc:EformHidden RecordId="6" TABLE="Status" FIELD="Status" Runat="server" ID="Status_6" Value="Local Recurrence"/>
        <euc:EformHidden Runat="server" RecordId="6"  ID="StatusDisease_6" TABLE="Status" FIELD="StatusDisease" Value="Thyroid Cancer" />
        <euc:EformHidden Runat="server" RecordId="6"  ID="StatusQuality_6" TABLE="Status" FIELD="StatusQuality" Value="STD" />
    <td align="center" height="28" class="ClinicalEformPopulatedColumn" colspan="2">&nbsp;</td>
    <td align="center" height="28" class="ClinicalEformPopulatedColumn">&nbsp;</td>
    
    <td align="center" class="ClinicalEformPopulatedColumn"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/>
    </td> 
  </tr>   
  <!--End of Local Recurrence-->
  
  <!--Start of Neck Recurrence-->
  <tr>    
    <td height="28" class="ClinicalEformPopulatedColumn" >Neck Recurrence</td>
    <td align="center" height="28" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Runat="server" RecordId="7"  ID="StatusDateText_7" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="Status_7,StatusDisease_7,StatusQuality_7" TabIndex="57" />
        <euc:EformHidden RecordId="7" Runat="server" ID="StatusDate_7" Table="Status" Field="StatusDate" /></td>
        <euc:EformHidden RecordId="7" TABLE="Status" FIELD="Status" Runat="server" ID="Status_7" Value="Neck Recurrence" />
        <euc:EformHidden Runat="server" RecordId="7"  ID="StatusDisease_7" TABLE="Status" FIELD="StatusDisease" Value="Thyroid Cancer" />
        <euc:EformHidden Runat="server" RecordId="7"  ID="StatusQuality_7" TABLE="Status" FIELD="StatusQuality" Value="STD" />
    <td height="28" class="ClinicalEformPopulatedColumn" align="right" >Level</td>
    <td align="center" height="28" class="ClinicalEformPopulatedColumn"><euc:EformExtendedCheckBoxList Field="NeckRecurSite" Table="NoTable" Runat="server" id="StatusNotes_7" TabIndex="58" RepeatDirection="Horizontal" RepeatLayout="table" ShowOther="false" OtherFieldStyle="display:none">
        <asp:ListItem Text="1" Value="1"></asp:ListItem>
        <asp:ListItem Text="2" Value="2"></asp:ListItem>
        <asp:ListItem Text="3" Value="3"></asp:ListItem>
        <asp:ListItem Text="4" Value="4"></asp:ListItem>
        <asp:ListItem Text="5" Value="5"></asp:ListItem>
        <asp:ListItem Text="6" Value="6"></asp:ListItem>
        <asp:ListItem Text="7" Value="7"></asp:ListItem>
        <asp:ListItem Text="Unknown" Value="Unknown"></asp:ListItem>
    </euc:EformExtendedCheckBoxList></td>
    <td align="center" height="28" class="ClinicalEformPopulatedColumn"><euc:EformDropDownList TABLE="NoTable" FIELD="NeckRecurSide" ID="NeckRecurSide_1" LookupCode="NodeSide" Runat="server" TabIndex="59" />
    <euc:EformTextBox Runat="server" RecordId="7" ID="NeckRecurLocSide" TABLE="Status" FIELD="StatusNotes" Width="1px" style="display:none;" />
    </td>
    
    <td align="center" class="ClinicalEformPopulatedColumn"><euc:EformDeleteIcon runat="server"/>
    </td>
  </tr>  
  <!--End of Neck Recurrence-->
  
  <!-- Start of Distant Mets-->
  <tr>    
    <td height="28" class="ClinicalEformPopulatedColumn" >Distant Metastasis</td>
    <td align="center" height="28" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Runat="server" RecordId="8"  ID="StatusDateText_8" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="Status_8,StatusDisease_8,StatusQuality_8" TabIndex="60"  />
        <euc:EformHidden RecordId="8" Runat="server" ID="StatusDate_8" Table="Status" Field="StatusDate" /></td>
        <euc:EformHidden RecordId="8" TABLE="Status" FIELD="Status" Runat="server" ID="Status_8" Value="Distant Metastasis"/>
        <euc:EformHidden Runat="server" RecordId="8"  ID="StatusDisease_8" TABLE="Status" FIELD="StatusDisease" Value="Thyroid Cancer" />
        <euc:EformHidden Runat="server" RecordId="8"  ID="StatusQuality_8" TABLE="Status" FIELD="StatusQuality" Value="STD" />
    <td align="center" height="28" class="ClinicalEformPopulatedColumn" colspan="2" >
        <euc:EformExtendedCheckBoxList Field="StatusNotes" RecordId="8" Table="Status" Runat="server" id="StatusLocation_8" LookupCode="DxTarget,Disease,Thyroid" TabIndex="61" RepeatDirection="Horizontal" RepeatLayout="table" /></td>
    <td align="center" height="28" class="ClinicalEformPopulatedColumn">&nbsp;</td>
    
    <td align="center" class="ClinicalEformPopulatedColumn"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/>
    </td>
  </tr>  
  <!-- End of Distant Mets-->
  
  <!-- Start of Additional rows-->
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformPopulatedColumn" >
        <euc:EformComboBox style="width:125px;" Field="Status" RecordId="9" Table="Status" Runat="server" id="Status_9" LookupCode="Status,Disease,Thyroid" DropDownHeight="auto" DropDownWidth="250px" />
        <euc:EformTextBox Runat="server" RecordId="9"  ID="StatusDisease_9" TABLE="Status" FIELD="StatusDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox Runat="server" RecordId="9"  ID="StatusQuality_9" TABLE="Status" FIELD="StatusQuality" Width="1px" style="display:none;" />
    </td>
    <td height="28" align="center" class="ClinicalEformPopulatedColumn"><euc:EformTextBox Runat="server" RecordId="9"  ID="StatusDateText_9" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" /><euc:EformHidden RecordId="9" Runat="server" ID="StatusDate_9" Table="Status" Field="StatusDate" /></td> 
    <td align="center" height="28" class="ClinicalEformPopulatedColumn" colspan="2">&nbsp;</td>
    <td align="center" height="28" class="ClinicalEformPopulatedColumn">&nbsp;</td>
    
    <td align="center" class="ClinicalEformPopulatedColumn"><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformPopulatedColumn" >
        <euc:EformComboBox style="width:125px;" Field="Status" RecordId="10" Table="Status" Runat="server" id="Status_10" LookupCode="Status,Disease,Thyroid" DropDownHeight="auto" DropDownWidth="250px" />
        <euc:EformTextBox Runat="server" RecordId="10"  ID="StatusDisease_10" TABLE="Status" FIELD="StatusDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox Runat="server" RecordId="10"  ID="StatusQuality_10" TABLE="Status" FIELD="StatusQuality" Width="1px" style="display:none;" />
        </td>
    <td height="28" align="center" class="ClinicalEformPopulatedColumn"><euc:EformTextBox Runat="server" RecordId="10"  ID="StatusDateText_10" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="52" /><euc:EformHidden RecordId="10" Runat="server" ID="StatusDate_10" Table="Status" Field="StatusDate" /></td> 
    <td align="center" height="28" class="ClinicalEformPopulatedColumn" colspan="2">&nbsp;</td>
    <td align="center" height="28" class="ClinicalEformPopulatedColumn">&nbsp;</td>
    
    <td align="center" class="ClinicalEformPopulatedColumn"><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
  </tr>  
  
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformPopulatedColumn" >
        <euc:EformComboBox style="width:125px;" Field="Status" RecordId="11" Table="Status" Runat="server" id="Status_11" LookupCode="Status,Disease,Thyroid" DropDownHeight="auto" DropDownWidth="250px" />
        <euc:EformTextBox Runat="server" RecordId="11"  ID="StatusDisease_11" TABLE="Status" FIELD="StatusDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox Runat="server" RecordId="11"  ID="StatusQuality_11" TABLE="Status" FIELD="StatusQuality" Width="1px" style="display:none;" />
        </td>
    <td height="28" align="center" class="ClinicalEformPopulatedColumn"><euc:EformTextBox Runat="server" RecordId="11"  ID="StatusDateText_11" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="53"/><euc:EformHidden RecordId="11" Runat="server" ID="StatusDate_11" Table="Status" Field="StatusDate" /></td> 
    <td align="center" height="28" class="ClinicalEformPopulatedColumn" colspan="2">&nbsp;</td>
    <td align="center" height="28" class="ClinicalEformPopulatedColumn">&nbsp;</td>
    
    <td align="center" class="ClinicalEformPopulatedColumn"><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformPopulatedColumn" >
        <euc:EformComboBox style="width:125px;" Field="Status" RecordId="12" Table="Status" Runat="server" id="Status_12" LookupCode="Status,Disease,Thyroid" DropDownHeight="auto" DropDownWidth="250px" />
        <euc:EformTextBox Runat="server" RecordId="12"  ID="StatusDisease_12" TABLE="Status" FIELD="StatusDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox Runat="server" RecordId="12"  ID="StatusQuality_12" TABLE="Status" FIELD="StatusQuality" Width="1px" style="display:none;" />
        </td>
    <td height="28" align="center" class="ClinicalEformPopulatedColumn"><euc:EformTextBox Runat="server" RecordId="12"  ID="StatusDateText_12" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="54"/><euc:EformHidden RecordId="13" Runat="server" ID="StatusDate_12" Table="Status" Field="StatusDate" /></td> 
    <td align="center" height="28" class="ClinicalEformPopulatedColumn" colspan="2">&nbsp;</td>
    <td align="center" height="28" class="ClinicalEformPopulatedColumn">&nbsp;</td>
    
    <td align="center" class="ClinicalEformPopulatedColumn"><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformPopulatedColumn" >
        <euc:EformComboBox style="width:125px;" Field="Status" RecordId="13" Table="Status" Runat="server" id="Status_13" LookupCode="Status,Disease,Thyroid" DropDownHeight="auto" DropDownWidth="250px" />
        <euc:EformTextBox Runat="server" RecordId="13"  ID="StatusDisease_13" TABLE="Status" FIELD="StatusDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox Runat="server" RecordId="13"  ID="StatusQuality_13" TABLE="Status" FIELD="StatusQuality" Width="1px" style="display:none;" />
        </td>
    <td height="28" align="center" class="ClinicalEformPopulatedColumn"><euc:EformTextBox Runat="server" RecordId="13"  ID="StatusDateText_13" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="55"/><euc:EformHidden RecordId="13" Runat="server" ID="StatusDate_13" Table="Status" Field="StatusDate" /></td> 
    <td align="center" height="28" class="ClinicalEformPopulatedColumn" colspan="2">&nbsp;</td>
    <td align="center" height="28" class="ClinicalEformPopulatedColumn">&nbsp;</td>
    
    <td align="center" class="ClinicalEformPopulatedColumn"><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformPopulatedColumn" >
        <euc:EformComboBox style="width:125px;" Field="Status" RecordId="14" Table="Status" Runat="server" id="Status_14" LookupCode="Status,Disease,Thyroid" DropDownHeight="auto" DropDownWidth="250px" />
        <euc:EformTextBox Runat="server" RecordId="14"  ID="StatusDisease_14" TABLE="Status" FIELD="StatusDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox Runat="server" RecordId="14"  ID="StatusQuality_14" TABLE="Status" FIELD="StatusQuality" Width="1px" style="display:none;" />
        </td>
    <td height="28" align="center" class="ClinicalEformPopulatedColumn"><euc:EformTextBox Runat="server" RecordId="14"  ID="StatusDateText_14" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="56"/><euc:EformHidden RecordId="14" Runat="server" ID="StatusDate_14" Table="Status" Field="StatusDate" /></td> 
    <td align="center" height="28" class="ClinicalEformPopulatedColumn" colspan="2">&nbsp;</td>
    <td align="center" height="28" class="ClinicalEformPopulatedColumn">&nbsp;</td>
    
    <td align="center" class="ClinicalEformPopulatedColumn"><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server"/></td>
  </tr>
  
  <!-- End of Additional rows--> 
  
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DiseaseRecurTable');" />
<br/><br/>