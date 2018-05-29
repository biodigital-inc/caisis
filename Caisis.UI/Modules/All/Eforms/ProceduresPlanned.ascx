<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ProceduresPlanned" CodeFile="ProceduresPlanned.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.ProceduresPlannedHtmlTable = "ProceduresPlannedHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="ProceduresPlanned" /><span class="controlBoxTitle">Procedures Planned </span><br>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresPlannedHtmlTable">
  <tr> 
    <td width="18%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">Procedure Type </td>
    <td width="42%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Side</td>
    <td width="42%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="rptPlannedProcedures" runat="server" > 
	<ItemTemplate> 
			<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Procedures', <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'ProcPending,ProcDateText,ProcName,ProcSide,ProcNotes', 'Procedures');"> 
				<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcDateText")%>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcName")%>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcSide")%>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcNotes")%>&nbsp;</td>
				<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="OtherLockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
			</tr>      
	</ItemTemplate>
  </asp:Repeater>
 
  
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="13"  ID="ProcDateText_13" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="13" Runat="server" ID="ProcDate_13" Table="Procedures" Field="ProcDate" />	  
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="13" Runat="server" ID="ProcPending_13" Table="Procedures" Field="ProcPending" />	  	
		</td>
    <td align="center"  style="white-space: nowrap;">&nbsp;   
	<euc:EformComboBox   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="13" Table="Procedures" MaxLength="50"  Runat="server" id="ProcName_13"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformComboBox style="width:65px;"  LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_13"  runat="server" RecordId="13" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="13" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_13"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="14"  ID="ProcDateText_14" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="14" Runat="server" ID="ProcDate_14" Table="Procedures" Field="ProcDate" />	  
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="14" Runat="server" ID="ProcPending_14" Table="Procedures" Field="ProcPending" />	  	
		</td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="14" Table="Procedures" MaxLength="50"  Runat="server" id="ProcName_14"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformComboBox style="width:65px;"  LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_14"  runat="server" RecordId="14" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="14" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_14"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="15"  ID="ProcDateText_15" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="15" Runat="server" ID="ProcDate_15" Table="Procedures" Field="ProcDate" />	  
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="15" Runat="server" ID="ProcPending_15" Table="Procedures" Field="ProcPending" />	  	
    </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="15" Table="Procedures" MaxLength="50"  Runat="server" id="ProcName_15"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformComboBox  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_15"  runat="server" RecordId="15" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="15" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_15"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="16"  ID="ProcDateText_16" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="16" Runat="server" ID="ProcDate_16" Table="Procedures" Field="ProcDate" />	  
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="16" Runat="server" ID="ProcPending_16" Table="Procedures" Field="ProcPending" />	  	
		</td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="16" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_16"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformComboBox  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_16"  runat="server" RecordId="16" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="16" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_16"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="17"  ID="ProcDateText_17" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="17" Runat="server" ID="ProcDate_17" Table="Procedures" Field="ProcDate" />	  
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="17" Runat="server" ID="ProcPending_17" Table="Procedures" Field="ProcPending" />	  	
    </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="17" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_17"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformComboBox  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_17"  runat="server" RecordId="17" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="17" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_17"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="18"  ID="ProcDateText_18" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="18" Runat="server" ID="ProcDate_18" Table="Procedures" Field="ProcDate" />	  
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="18" Runat="server" ID="ProcPending_18" Table="Procedures" Field="ProcPending" />	  	
		</td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="18" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_18"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformComboBox  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_18"  runat="server" RecordId="18" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="18" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_18"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="19"  ID="ProcDateText_19" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="19" Runat="server" ID="ProcDate_19" Table="Procedures" Field="ProcDate" />	  
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="19" Runat="server" ID="ProcPending_19" Table="Procedures" Field="ProcPending" />	  	
		</td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="19" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_19"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformComboBox  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_19"  runat="server" RecordId="19" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="19" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_19"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="20"  ID="ProcDateText_20" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="20" Runat="server" ID="ProcDate_20" Table="Procedures" Field="ProcDate" />	  
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="20" Runat="server" ID="ProcPending_20" Table="Procedures" Field="ProcPending" />	  	
		</td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="20" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_20"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformComboBox  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_20"  runat="server" RecordId="20" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="20" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_20"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="21"  ID="ProcDateText_21" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="21" Runat="server" ID="ProcDate_21" Table="Procedures" Field="ProcDate" />	  
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="21" Runat="server" ID="ProcPending_21" Table="Procedures" Field="ProcPending" />	  	
		</td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="21" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_21"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformComboBox  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_21"  runat="server" RecordId="21" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="21" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_21"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
   <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="22"  ID="ProcDateText_22" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="22" Runat="server" ID="ProcDate_22" Table="Procedures" Field="ProcDate" />	  
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="22" Runat="server" ID="ProcPending_22" Table="Procedures" Field="ProcPending" />	  	
		</td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="22" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_22"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformComboBox  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_22"  runat="server" RecordId="22" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="22" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_22"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProceduresPlannedHtmlTable');"><img src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
<br/>
<br/><br/>

<script type="text/javascript">
    /* <![CDATA[ */
  
    addEvent($('<%= ProcDateText_13.ClientID %>'),$('<%= ProcPending_13.ClientID %>'),$('<%= ProcName_13.ClientID %>'),$('<%= ProcSide_13.ClientID %>'),$('<%= ProcNotes_13.ClientID %>'));
    addEvent($('<%= ProcDateText_14.ClientID %>'),$('<%= ProcPending_14.ClientID %>'),$('<%= ProcName_14.ClientID %>'),$('<%= ProcSide_14.ClientID %>'),$('<%= ProcNotes_14.ClientID %>'));
    addEvent($('<%= ProcDateText_15.ClientID %>'),$('<%= ProcPending_15.ClientID %>'),$('<%= ProcName_15.ClientID %>'),$('<%= ProcSide_15.ClientID %>'),$('<%= ProcNotes_15.ClientID %>'));
    addEvent($('<%= ProcDateText_16.ClientID %>'),$('<%= ProcPending_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcNotes_16.ClientID %>'));
    addEvent($('<%= ProcDateText_17.ClientID %>'),$('<%= ProcPending_17.ClientID %>'),$('<%= ProcName_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'),$('<%= ProcNotes_17.ClientID %>'));
    addEvent($('<%= ProcDateText_18.ClientID %>'),$('<%= ProcPending_18.ClientID %>'),$('<%= ProcName_18.ClientID %>'),$('<%= ProcSide_18.ClientID %>'),$('<%= ProcNotes_18.ClientID %>'));
    addEvent($('<%= ProcDateText_19.ClientID %>'),$('<%= ProcPending_19.ClientID %>'),$('<%= ProcName_19.ClientID %>'),$('<%= ProcSide_19.ClientID %>'),$('<%= ProcNotes_19.ClientID %>'));
    addEvent($('<%= ProcDateText_20.ClientID %>'),$('<%= ProcPending_20.ClientID %>'),$('<%= ProcName_20.ClientID %>'),$('<%= ProcSide_20.ClientID %>'),$('<%= ProcNotes_20.ClientID %>'));
    addEvent($('<%= ProcDateText_21.ClientID %>'),$('<%= ProcPending_21.ClientID %>'),$('<%= ProcName_21.ClientID %>'),$('<%= ProcSide_21.ClientID %>'),$('<%= ProcNotes_21.ClientID %>'));
    addEvent($('<%= ProcDateText_22.ClientID %>'),$('<%= ProcPending_22.ClientID %>'),$('<%= ProcName_22.ClientID %>'),$('<%= ProcSide_22.ClientID %>'),$('<%= ProcNotes_22.ClientID %>'));

    function addEvent(procDateText,procPending,procName,procSide,procNotes)
    {  
        $(procDateText).addEvent('blur',curry(SetHiddenFields,procDateText,procPending,procName,procSide,procNotes));
        $(procName).addEvent('blur',curry(SetHiddenFields,procDateText,procPending,procName,procSide,procNotes));
        $(procSide).addEvent('blur',curry(SetHiddenFields,procDateText,procPending,procName,procSide,procNotes));
        $(procNotes).addEvent('blur',curry(SetHiddenFields,procDateText,procPending,procName,procSide,procNotes));
       
   }
   
    /* ]]> */
    
 	function SetHiddenFields(procDateText,procPending,procName,procSide,procNotes)
	{ 
	    if (procDateText.value != '' || procName.value != '' || procSide.value != '' || procNotes.value != '')
	    {
            procPending.value = "1";
	    }
	    else
	    {
            procPending.value = '';
	    }
	}  
	
</script>