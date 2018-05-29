<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxDistantMets" CodeFile="OropharynxDistantMets.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.OropharynxDistantMetsHTMLTble = "OropharynxDistantMetsHTMLTble";
	
	function updateStatusOnDate(dateId, locationId, statusId, diseaseId, qId)
	{   
	    var date = document.getElementById(dateId);
	    var location = document.getElementById(locationId);
	
	    if (date.value != '' || location.value != '')
	    {           
	        document.getElementById(statusId).value='Distant Metastasis';
	        document.getElementById(diseaseId).value = 'Oropharyngeal Cancer';
	        document.getElementById(qId).value='STD';	    
	    }
	    else
	    {
	    	document.getElementById(statusId).value='';
	        document.getElementById(diseaseId).value = '';
	        document.getElementById(qId).value='';
	    }
	}
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="OropharynxDistantMets" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Distant Metastasis"></asp:Label><br/>

<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OropharynxDistantMetsHTMLTble">     
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Status</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Location</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <asp:Repeater ID="StatusRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Status', <%# DataBinder.Eval(Container.DataItem, "StatusId") %>, 'StatusDateText,StatusDate,Status,StatusNotes', 'Status');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "StatusDateText")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Status")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "StatusNotes")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  <tr>    
    <td height="28" class="ClinicalEformGridColumnOne" >
        <euc:EformTextBox Runat="server" RecordId="1"  ID="StatusDateText_1" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="1" Runat="server" ID="StatusDate_1" Table="Status" Field="StatusDate" />
        <euc:EformTextBox Runat="server" RecordId="1"  ID="StatusDisease_1" TABLE="Status" FIELD="StatusDisease" Width="1px" style="display:none;"/>
        <euc:EformTextBox Runat="server" RecordId="1"  ID="StatusQuality_1" TABLE="Status" FIELD="StatusQuality" Width="1px" style="display:none;"/>
    </td>
    <td align="center"><euc:EformTextBox RecordId="1" TABLE="Status" FIELD="Status" Runat="server" ID="Status_1" /></td>
    <td align="center"><euc:EformComboBox style="width:80px;" Field="StatusNotes" RecordId="1" Table="Status" Runat="server" id="StatusLocation_1" LookupCode="DxTarget,Disease,HeadNeck" DropDownWidth="200px"  />
    </td>
    <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  
  <tr style="DISPLAY: none">    
    <td height="28" class="ClinicalEformGridColumnOne" >
        <euc:EformTextBox Runat="server" RecordId="2"  ID="StatusDateText_2" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="StatusDate_2" Table="Status" Field="StatusDate" />
        <euc:EformTextBox Runat="server" RecordId="2"  ID="StatusDisease_2" TABLE="Status" FIELD="StatusDisease" Width="1px" style="display:none;"/>
        <euc:EformTextBox Runat="server" RecordId="2"  ID="StatusQuality_2" TABLE="Status" FIELD="StatusQuality" Width="1px" style="display:none;"/>
    </td>
    <td align="center"><euc:EformTextBox RecordId="2" TABLE="Status" FIELD="Status" Runat="server" ID="Status_2" /></td>
    <td align="center"><euc:EformComboBox  style="width:80px;" Field="StatusNotes" RecordId="2" Table="Status" Runat="server" id="StatusLocation_2" LookupCode="DxTarget,Disease,HeadNeck" DropDownWidth="200px"  />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">    
    <td height="28" class="ClinicalEformGridColumnOne" >
        <euc:EformTextBox Runat="server" RecordId="3"  ID="StatusDateText_3" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="StatusDate_3" Table="Status" Field="StatusDate" />
        <euc:EformTextBox Runat="server" RecordId="3"  ID="StatusDisease_3" TABLE="Status" FIELD="StatusDisease" Width="1px" style="display:none;"/>
        <euc:EformTextBox Runat="server" RecordId="3"  ID="StatusQuality_3" TABLE="Status" FIELD="StatusQuality" Width="1px" style="display:none;"/>
    </td>
    <td align="center"><euc:EformTextBox RecordId="3" TABLE="Status" FIELD="Status" Runat="server" ID="Status_3" /></td>
    <td align="center"><euc:EformComboBox  style="width:80px;" Field="StatusNotes" RecordId="3" Table="Status" Runat="server" id="StatusLocation_3" LookupCode="DxTarget,Disease,HeadNeck" DropDownWidth="200px"  />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">    
    <td height="28" class="ClinicalEformGridColumnOne" >
        <euc:EformTextBox Runat="server" RecordId="4"  ID="StatusDateText_4" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
        <euc:EformHidden RecordId="4" Runat="server" ID="StatusDate_4" Table="Status" Field="StatusDate" />
        <euc:EformTextBox Runat="server" RecordId="4"  ID="StatusDisease_4" TABLE="Status" FIELD="StatusDisease" Width="1px" style="display:none;"/>
        <euc:EformTextBox Runat="server" RecordId="4"  ID="StatusQuality_4" TABLE="Status" FIELD="StatusQuality" Width="1px" style="display:none;"/>
    </td>
    <td align="center"><euc:EformTextBox RecordId="4" TABLE="Status" FIELD="Status" Runat="server" ID="Status_4" /></td>
    <td align="center"><euc:EformComboBox  style="width:80px;" Field="StatusNotes" RecordId="4" Table="Status" Runat="server" id="StatusLocation_4" LookupCode="DxTarget,Disease,HeadNeck" DropDownWidth="200px"  />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">    
    <td height="28" class="ClinicalEformGridColumnOne" >
        <euc:EformTextBox Runat="server" RecordId="5"  ID="StatusDateText_5" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
        <euc:EformHidden RecordId="5" Runat="server" ID="StatusDate_5" Table="Status" Field="StatusDate" />
        <euc:EformTextBox Runat="server" RecordId="5"  ID="StatusDisease_5" TABLE="Status" FIELD="StatusDisease" Width="1px" style="display:none;"/>
        <euc:EformTextBox Runat="server" RecordId="5"  ID="StatusQuality_5" TABLE="Status" FIELD="StatusQuality" Width="1px" style="display:none;"/>
    </td>
    <td align="center"><euc:EformTextBox RecordId="5" TABLE="Status" FIELD="Status" Runat="server" ID="Status_5" /></td>
    <td align="center"><euc:EformComboBox  style="width:80px;" Field="StatusNotes" RecordId="5" Table="Status" Runat="server" id="StatusLocation_5" LookupCode="DxTarget,Disease,HeadNeck" DropDownWidth="200px"  />
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxDistantMetsHTMLTble');" />
<br /><br /><br />