<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryComorbidities" CodeFile="LiverSurgeryComorbidities.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.Comorbidities_LiverHtmlTable = "Comorbidities_LiverHtmlTable";
	   
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="LiverSurgeryComorbidities" /><br/>

<table>
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Underlying Liver Disease"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ComorbRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="ComorbRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>None</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="ComorbAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td><strong> <asp:Label ID="AbsentEventPrefix_1" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_1"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="1" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_1"
                Runat="server" Width="1px" Style="display: none;" /></td>
            <td>(Optional)</td>
       </tr>
    </table>
</div>



<div id="ComorbDiv" runat="server" >
<table width="400" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="Comorbidities_LiverHtmlTable">
  <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
    <%--<td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>--%>
    <td width="50%" class="controlBoxDataGridHeaderFirstCol">Comorbidity</td>
    <td width="25%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="pastComorbidities" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	    <HeaderTemplate>
		    <tr  ><td align="center" colspan="3"><i> <asp:Literal ID="MostRecentMsg" Runat="server" Visible="false" Text="most recent 10" /></i></td></tr>	    
	    </HeaderTemplate>
	    <ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Comorbidities', <%# DataBinder.Eval(Container.DataItem, "ComorbidityId") %>, 'ComorbDateText,ComorbDate,Comorbidity,ComorbNotes','Comorbidities');"> 
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ComorbNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr > 
    <%--<td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="1"  ID="ComorbDateText_1" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="1" Runat="server" ID="ComorbDate_1" Table="Comorbidities" Field="ComorbDate" />	</td>--%>
    <td width="50%"><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_HepatitisB" Value="Hepatitis B" RecordId="1" /> Hepatitis B</td>
    <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <%--<td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="2"  ID="ComorbDateText_2" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="2" Runat="server" ID="ComorbDate_2" Table="Comorbidities" Field="ComorbDate" />	</td>--%>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_HepatitisC" Value="Hepatitis C" RecordId="2" /> Hepatitis C</td>
    <td align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <%--<td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="3"  ID="ComorbDateText_3" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="3" Runat="server" ID="ComorbDate_3" Table="Comorbidities" Field="ComorbDate" />	</td>--%>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_EtOHcirrhosis" Value="EtOH Cirrhosis" RecordId="3" />
      EtOH Cirrhosis</td>
    <td align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <%--<td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="4"  ID="ComorbDateText_4" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="4" Runat="server" ID="ComorbDate_4" Table="Comorbidities" Field="ComorbDate" />	</td>--%>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_HIV" Value="HIV" RecordId="4" />
      HIV</td>
    <td align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <%--<td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="5"  ID="ComorbDateText_5" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="5" Runat="server" ID="ComorbDate_5" Table="Comorbidities" Field="ComorbDate" />	</td>--%>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_ThromboembolicEventsDVT" Value="Diabetes" RecordId="5" />
      Diabetes</td>
    <td align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <%--<td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="11"  ID="ComorbDateText_11" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="11" Runat="server" ID="ComorbDate_11" Table="Comorbidities" Field="ComorbDate" />	</td>--%>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="11" Table="Comorbidities" Runat="server" ID="Comorbidity_11"  /></td>
    <td align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_11"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <%--<td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="12"  ID="ComorbDateText_12" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="12" Runat="server" ID="ComorbDate_12" Table="Comorbidities" Field="ComorbDate" />	</td>--%>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="12" Table="Comorbidities" Runat="server" ID="Comorbidity_12"  /></td>
    <td align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_12"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <%--<td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="13"  ID="ComorbDateText_13" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="13" Runat="server" ID="ComorbDate_13" Table="Comorbidities" Field="ComorbDate" />	</td>--%>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="13" Table="Comorbidities" Runat="server" ID="Comorbidity_13"  /></td>
    <td align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_13"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <%--<td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="14"  ID="ComorbDateText_14" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="14" Runat="server" ID="ComorbDate_14" Table="Comorbidities" Field="ComorbDate" />	</td>--%>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="14" Table="Comorbidities" Runat="server" ID="Comorbidity_14"  /></td>
    <td align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_14"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <%--<td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="15"  ID="ComorbDateText_15" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="15" Runat="server" ID="ComorbDate_15" Table="Comorbidities" Field="ComorbDate" />	</td>--%>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="15" Table="Comorbidities" Runat="server" ID="Comorbidity_15"  /></td>
    <td align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_15"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'Comorbidities_LiverHtmlTable');" />
</div>
<table>
    <tr id="ComorbAbsentRow">
        <td>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="TableName" ID="TableName_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldName" ID="FieldName_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_1"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br /><br />

<table>
    <tr>
        <td>
            <span class="controlBoxTitle">History of Anti-viral Therapy ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="AntiviralRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="AntiviralRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="AntiviralAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td><strong> <asp:Label ID="AbsentEventPrefix_2" runat="server" /></strong></td>
           <td ><strong> Date </strong>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_2"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="2" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_2"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td>(Optional)</td>
        </tr>
    </table>
</div>

<div id="AntiviralDiv" runat="server" style="display: none;">

<table width="450" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="Table1">

  <asp:Repeater ID="antiViralHistory" runat="server" OnItemDataBound="antiViralHistoryEFormRepeaterOnDataBound" > 
	    <HeaderTemplate>
		    <tr  ><td align="center" colspan="4"><i> <asp:Literal ID="MostRecentMsg" Runat="server" Visible="false" Text="most recent 10" /></i></td></tr>	    
	    </HeaderTemplate>
	    <ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxAgent,MedTxStopDateText','MedicalTherapy');"> 
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxDateText")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxAgent")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>

    <tr >
        <td style="white-space:nowrap;" ><strong> Start Date:  </strong>
                                        <euc:EformTextBox  style="width:80px;" RecordId="21" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_21"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                        <euc:EformHidden                       RecordId="21" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_21"         Runat="server" />   
                                        <euc:EformTextBox Width="1px" Style="display: none;"  RecordId="21" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_21"      Runat="server"  /></td>
        <td style="white-space:nowrap;"><strong> Anti-viral Agent: </strong>
            <euc:EformTextBox  style="width:100px;" RecordId="21" TABLE="MedicalTherapy" FIELD="MedTxAgent" ID="MedTxAgent_21" Runat="server"  /></td> 
        <td style="white-space:nowrap;"><strong> Stop Date: </strong>
            <euc:EformTextBox  style="width:80px;" RecordId="21" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_21" Runat="server" ShowCalendar="True" CalcDate="True"  />
            <euc:EformHidden                       RecordId="21" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_21"     Runat="server" />    </td> 
        <td>&nbsp;</td>
    </tr>
</table>
</div>
<table>
    <tr id="AntiviralAbsentRow">
        <td>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="TableName" ID="TableName_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldName" ID="FieldName_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_2"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br/><br/><br/>

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo

    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= AntiviralRecorded.ClientID %>'),$('<%= AntiviralDiv.ClientID %>'),$('<%= AntiviralAbsentDiv.ClientID %>'));

    function addAbsentEvent(comorbRecordedID,comorbDivID,comorbAbsentDivID,antiviralRecordedID,antiviralDivID,antiviralAbsentDivID)
    {  
        $(comorbRecordedID).addEvent('click',curry(ComorbYesNo,comorbRecordedID,comorbDivID,comorbAbsentDivID));
        $(antiviralRecordedID).addEvent('click',curry(AntiviralYesNo,antiviralRecordedID,antiviralDivID,antiviralAbsentDivID));
       
        // check on load as well
       ComorbYesNo(comorbRecordedID,comorbDivID,comorbAbsentDivID);
       AntiviralYesNo(antiviralRecordedID,antiviralDivID,antiviralAbsentDivID);

    }
   
    /* ]]> */
    
   
    function ComorbYesNo(comorbRecordedID,comorbDivID,comorbAbsentDivID)
    {
       var comorbRecordedRef = comorbRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < comorbRecordedRef.length; i++) 
        if (comorbRecordedRef[i].checked) {  
            ComorbRadioClick(comorbRecordedRef[i].value,comorbDivID,comorbAbsentDivID);
            }
    }
    
   
    function ComorbRadioClick(Comorboption_value,ComorbhideDiv,ComorbhideAbsentDiv)
    {
      if (Comorboption_value == "Yes")
      { 
       ComorbhideDiv.style.display='block';
       ComorbhideAbsentDiv.style.display='none';
       

       
        document.getElementById('<%= AbsentDateText_1.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_1.ClientID %>').value='';
        document.getElementById('<%= TableName_1.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_1.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_1.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_1.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_1.ClientID %>').value = '';
        
      } 
      else if (Comorboption_value == "Unknown")
      { 
       ComorbhideDiv.style.display='none';
       ComorbhideAbsentDiv.style.display='none';
       

       
        document.getElementById('<%= AbsentDateText_1.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_1.ClientID %>').value='';
        document.getElementById('<%= TableName_1.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_1.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_1.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_1.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_1.ClientID %>').value = '';
        
      }
      else if (Comorboption_value == "None" || Comorboption_value == "N/A")
      {
        ComorbhideAbsentDiv.style.display='';
        ComorbhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_1.ClientID %>').value = 'Comorbidities';        
        document.getElementById('<%= FieldName_1.ClientID %>').value = 'Comorbidity';
        document.getElementById('<%= FieldValue_1.ClientID %>').value = 'Underlying Liver Disease';
        
        if (Comorboption_value == "None")
            document.getElementById('<%= AbsentReason_1.ClientID %>').value = 'None Recorded';
        else if (Comorboption_value == "N/A")
            document.getElementById('<%= AbsentReason_1.ClientID %>').value = 'Not Applicable';

        document.getElementById('<%= AbsentEventPrefix_1.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_1.ClientID %>').value + ' as of ';
        
        document.getElementById('<%= AbsentQuality_1.ClientID %>').value = 'STD';        
        
        document.getElementById('<%= Comorbidity_HepatitisB.ClientID %>').checked=false;
        document.getElementById('<%= ComorbNotes_1.ClientID %>').value='';

        document.getElementById('<%= Comorbidity_HepatitisC.ClientID %>').checked=false;
        document.getElementById('<%= ComorbNotes_2.ClientID %>').value='';

        document.getElementById('<%= Comorbidity_EtOHcirrhosis.ClientID %>').checked=false;
        document.getElementById('<%= ComorbNotes_3.ClientID %>').value='';

        document.getElementById('<%= Comorbidity_HIV.ClientID %>').checked=false;
        document.getElementById('<%= ComorbNotes_4.ClientID %>').value='';

        document.getElementById('<%= Comorbidity_ThromboembolicEventsDVT.ClientID %>').checked=false;
        document.getElementById('<%= ComorbNotes_5.ClientID %>').value='';

        document.getElementById('<%= Comorbidity_11.ClientID %>').value='';
        document.getElementById('<%= ComorbNotes_11.ClientID %>').value='';

        document.getElementById('<%= Comorbidity_12.ClientID %>').value='';
        document.getElementById('<%= ComorbNotes_12.ClientID %>').value='';        

        document.getElementById('<%= Comorbidity_13.ClientID %>').value='';
        document.getElementById('<%= ComorbNotes_13.ClientID %>').value='';        

        document.getElementById('<%= Comorbidity_14.ClientID %>').value='';
        document.getElementById('<%= ComorbNotes_14.ClientID %>').value='';        

        document.getElementById('<%= Comorbidity_15.ClientID %>').value='';
        document.getElementById('<%= ComorbNotes_15.ClientID %>').value='';                
      }
    }


    function AntiviralYesNo(antiviralRecordedID,antiviralDivID,antiviralAbsentDivID)
    {
       var antiviralRecordedRef = antiviralRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < antiviralRecordedRef.length; i++) 
        if (antiviralRecordedRef[i].checked) {  
            AntiviralRadioClick(antiviralRecordedRef[i].value,antiviralDivID,antiviralAbsentDivID);
            }
    }
    
    function AntiviralRadioClick(Antiviraloption_value,AntiviralhideDiv,AntiviralhideAbsentDiv)
    {
      if (Antiviraloption_value == "Yes")
      { 
       AntiviralhideDiv.style.display='';
       AntiviralhideAbsentDiv.style.display='none';
       

       
        document.getElementById('<%= AbsentDateText_2.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_2.ClientID %>').value='';
        document.getElementById('<%= TableName_2.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_2.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_2.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_2.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_2.ClientID %>').value = '';
        
        document.getElementById('<%= MedTxType_21.ClientID %>').value='Anti-viral History';

        
      } 
      else if (Antiviraloption_value == "Unknown")
      { 
       AntiviralhideDiv.style.display='none';
       AntiviralhideAbsentDiv.style.display='none';
          
        document.getElementById('<%= AbsentDateText_2.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_2.ClientID %>').value='';
        document.getElementById('<%= TableName_2.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_2.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_2.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_2.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_2.ClientID %>').value = '';
        
        
      }
      else if (Antiviraloption_value == "No" || Antiviraloption_value == "N/A")
      {
        AntiviralhideAbsentDiv.style.display='';
        AntiviralhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_2.ClientID %>').value = 'MedicalTherapy';
        document.getElementById('<%= FieldName_2.ClientID %>').value = 'MedTxType';
        document.getElementById('<%= FieldValue_2.ClientID %>').value = 'Anti-viral History';

        if (Antiviraloption_value == "No")
            document.getElementById('<%= AbsentReason_2.ClientID %>').value = 'None Recorded';
        else if (Antiviraloption_value == "N/A")
            document.getElementById('<%= AbsentReason_2.ClientID %>').value = 'Not Applicable';

        document.getElementById('<%= AbsentEventPrefix_2.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_2.ClientID %>').value + ' as of ';

        document.getElementById('<%= AbsentQuality_2.ClientID %>').value = 'STD';        
        
        document.getElementById('<%= MedTxDateText_21.ClientID %>').value='';
        document.getElementById('<%= MedTxDate_21.ClientID %>').value='';
        document.getElementById('<%= MedTxType_21.ClientID %>').value='';
        document.getElementById('<%= MedTxAgent_21.ClientID %>').value='';
         document.getElementById('<%= MedTxStopDateText_21.ClientID %>').value='';
        document.getElementById('<%= MedTxStopDate_21.ClientID %>').value='';
       
      }
    }	
</script>