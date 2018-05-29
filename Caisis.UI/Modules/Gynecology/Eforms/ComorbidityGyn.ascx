<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.ComorbidityGyn" CodeFile="ComorbidityGyn.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
 tableArray.GynComorsTbl="GynComorsTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ComorbidityGyn" /><span class="controlBoxTitle">Comorbidities</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <span class="controlBoxTitle" style="font-size: 12px;">Previous Comorbidities</span><br/>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PreviousComorbsTbl">
                <tr id="NoGynComorbsMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Comorbidities were recorded for this patient.
                    </td>
                </tr>
                <tr runat="server" id="PrevGynComorbsRptHdr"> 
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">Comorbidity</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                    <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Quality</td>
                    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                  </tr> 
  
                  <asp:Repeater ID="GynComorbsRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	                <ItemTemplate>                   
		                <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Comorbidities', <%# DataBinder.Eval(Container.DataItem, "ComorbidityId") %>, 'ComorbDateText,ComorbDate,Comorbidity,ComorbDataSource,ComorbQuality','Comorbidities');"> 
			                <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %></td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>&nbsp;</td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ComorbDataSource")%>&nbsp;</td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ComorbQuality")%>&nbsp;</td>
			                <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		                </tr>      
	                </ItemTemplate>
                  </asp:Repeater>
                </table><br /><br />

            <span class="controlBoxTitle" style="font-size: 12px;">Add new Comorbidities</span><br/>  
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="GynComorsTbl">
              <tr id="ComorbHdrRow" runat="server"> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Comorbidity</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Quality</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
  
              <tr> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="1"  ID="ComorbDateText_1" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="1" Runat="server" ID="ComorbDate_1" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformCheckBox  TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                    ID="Comorbidity_1" RecordId="1" Value="Hypertension" />Hypertension</td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="1" 
                    ID="ComorbDataSource_1" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="1" 
                    ID="ComorbQuality_1" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="2"  ID="ComorbDateText_2" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="2" Runat="server" ID="ComorbDate_2" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_2" 
                    RecordId="2" Value="Pulmonary (Smoking History)" />Pulmonary (Smoking History)</td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="2" 
                    ID="ComorbDataSource_2" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="2" 
                    ID="ComorbQuality_2" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
                            
              <tr> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="3"  ID="ComorbDateText_3" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="3" Runat="server" ID="ComorbDate_3" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_3" 
                    RecordId="3" Value="Uterine Fibroids" />Uterine Fibroids</td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="3" 
                    ID="ComorbDataSource_3" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="3" 
                    ID="ComorbQuality_3" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="4"  ID="ComorbDateText_4" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="4" Runat="server" ID="ComorbDate_4" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_4" 
                    RecordId="4" Value="Hypercholesterolemia"/>Hypercholesterolemia</td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="4" 
                    ID="ComorbDataSource_4" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="4" 
                    ID="ComorbQuality_4" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="5"  ID="ComorbDateText_5" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="5" Runat="server" ID="ComorbDate_5" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_5" 
                    RecordId="5" Value="Hypothyroidism" />Hypothyroidism</td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="5" 
                    ID="ComorbDataSource_5" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="5" 
                    ID="ComorbQuality_5" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="6"  ID="ComorbDateText_6" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="6" Runat="server" ID="ComorbDate_6" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_6" 
                    RecordId="6" Value="Obesity" />Obesity</td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="6" 
                    ID="ComorbDataSource_6" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="6" 
                    ID="ComorbQuality_6" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="7"  ID="ComorbDateText_7" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="7" Runat="server" ID="ComorbDate_7" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_7" 
                    RecordId="7" Value="Depression" />Depression</td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="7" 
                    ID="ComorbDataSource_7" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="7" 
                    ID="ComorbQuality_7" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="8"  ID="ComorbDateText_8" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="8" Runat="server" ID="ComorbDate_8" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_8" 
                    RecordId="8" Value="Breast Cancer" />Breast Cancer</td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="8" 
                    ID="ComorbDataSource_8" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="8" 
                    ID="ComorbQuality_8" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="9"  ID="ComorbDateText_9" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="9" Runat="server" ID="ComorbDate_9" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_9" 
                    RecordId="9" Value="Abnormal Pap Smear" />Abnormal Pap Smear</td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="9" 
                    ID="ComorbDataSource_9" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="9" 
                    ID="ComorbQuality_9" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="10"  ID="ComorbDateText_10" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="10" Runat="server" ID="ComorbDate_10" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_10" 
                    RecordId="10" Value="Ovarian Cyst" />Ovarian Cyst</td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="10" 
                    ID="ComorbDataSource_10" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="10" 
                    ID="ComorbQuality_10" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="11"  ID="ComorbDateText_11" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="11" Runat="server" ID="ComorbDate_11" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformComboBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_11" 
                    RecordId="11" LookupCode="Comorbidity,Disease,Gynecology" /></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="11" 
                    ID="ComorbDataSource_11" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="11" 
                    ID="ComorbQuality_11" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr style="display:none;"> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="12"  ID="ComorbDateText_12" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="12" Runat="server" ID="ComorbDate_12" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformComboBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_12" 
                    RecordId="12" LookupCode="Comorbidity,Disease,Gynecology" /></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="12" 
                    ID="ComorbDataSource_12" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="12" 
                    ID="ComorbQuality_12" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr style="display:none;"> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="13"  ID="ComorbDateText_13" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="13" Runat="server" ID="ComorbDate_13" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformComboBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_13" 
                    RecordId="13" LookupCode="Comorbidity,Disease,Gynecology" /></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="13" 
                    ID="ComorbDataSource_13" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="13" 
                    ID="ComorbQuality_13" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr style="display:none;"> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="14"  ID="ComorbDateText_14" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="14" Runat="server" ID="ComorbDate_14" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformComboBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_14" 
                    RecordId="14" LookupCode="Comorbidity,Disease,Gynecology" /></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="14" 
                    ID="ComorbDataSource_14" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="14" 
                    ID="ComorbQuality_14" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr style="display:none;"> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="15"  ID="ComorbDateText_15" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="15" Runat="server" ID="ComorbDate_15" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformComboBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_15" 
                    RecordId="15" LookupCode="Comorbidity,Disease,Gynecology" /></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="15" 
                    ID="ComorbDataSource_15" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="15" 
                    ID="ComorbQuality_15" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <!-- added five more rows on 7/19/11 -->
              <tr style="display:none;"> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="16"  ID="ComorbDateText_16" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="16" Runat="server" ID="ComorbDate_16" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformComboBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_16" 
                    RecordId="16" LookupCode="Comorbidity,Disease,Gynecology" /></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="16" 
                    ID="ComorbDataSource_16" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="16" 
                    ID="ComorbQuality_16" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
               <tr style="display:none;"> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="17"  ID="ComorbDateText_17" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="17" Runat="server" ID="ComorbDate_17" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformComboBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_17" 
                    RecordId="17" LookupCode="Comorbidity,Disease,Gynecology" /></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="17" 
                    ID="ComorbDataSource_17" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="17" 
                    ID="ComorbQuality_17" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
               <tr style="display:none;"> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="18"  ID="ComorbDateText_18" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="18" Runat="server" ID="ComorbDate_18" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformComboBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_18" 
                    RecordId="18" LookupCode="Comorbidity,Disease,Gynecology" /></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="18" 
                    ID="ComorbDataSource_18" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="18" 
                    ID="ComorbQuality_18" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
               <tr style="display:none;"> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="19"  ID="ComorbDateText_19" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="19" Runat="server" ID="ComorbDate_19" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformComboBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_19" 
                    RecordId="19" LookupCode="Comorbidity,Disease,Gynecology" /></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="19" 
                    ID="ComorbDataSource_19" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="19" 
                    ID="ComorbQuality_19" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
               <tr style="display:none;"> 
                <td height="28" class="ClinicalEformGridColumnOne">	
                <euc:EformTextBox Runat="server" RecordId="20"  ID="ComorbDateText_20" TABLE="Comorbidities" FIELD="ComorbDateText" 
	                style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
	            <euc:EformHidden RecordId="20" Runat="server" ID="ComorbDate_20" Table="Comorbidities" Field="ComorbDate" /></td>
                <td align="left"><euc:EformComboBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_20" 
                    RecordId="20" LookupCode="Comorbidity,Disease,Gynecology" /></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbDataSource" RecordId="20" 
                    ID="ComorbDataSource_20" Runat="server" LookupCode="DataSource"/></td>
                <td align="center"><euc:EformDropDownList TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="20" 
                    ID="ComorbQuality_20" Runat="server" LookupCode="DataQuality" Width="100px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
            </table>
            <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" 
            onclick="return showFirstAdditionalRow(this,'GynComorsTbl');" /><br /><br />
        </td>
    </tr>
</table><br /><br />




<script type="text/javascript">
    //Adds events to controls
    function addGynComorbEvents(GynComorb,GynComorbSource,GynComorbQlty)
    { 
        $(GynComorb).addEvent('blur',curry(GynComorbAutoPopulates,GynComorb,GynComorbSource,GynComorbQlty));
        $(GynComorb).addEvent('click',curry(GynComorbAutoPopulates,GynComorb,GynComorbSource,GynComorbQlty));
   }

    addGynComorbEvents($('<%= Comorbidity_1.ClientID %>'),$('<%= ComorbDataSource_1.ClientID %>'),$('<%= ComorbQuality_1.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_2.ClientID %>'),$('<%= ComorbDataSource_2.ClientID %>'),$('<%= ComorbQuality_2.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_3.ClientID %>'),$('<%= ComorbDataSource_3.ClientID %>'),$('<%= ComorbQuality_3.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_4.ClientID %>'),$('<%= ComorbDataSource_4.ClientID %>'),$('<%= ComorbQuality_4.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_5.ClientID %>'),$('<%= ComorbDataSource_5.ClientID %>'),$('<%= ComorbQuality_5.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_6.ClientID %>'),$('<%= ComorbDataSource_6.ClientID %>'),$('<%= ComorbQuality_6.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_7.ClientID %>'),$('<%= ComorbDataSource_7.ClientID %>'),$('<%= ComorbQuality_7.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_8.ClientID %>'),$('<%= ComorbDataSource_8.ClientID %>'),$('<%= ComorbQuality_8.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_9.ClientID %>'),$('<%= ComorbDataSource_9.ClientID %>'),$('<%= ComorbQuality_9.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_10.ClientID %>'),$('<%= ComorbDataSource_10.ClientID %>'),$('<%= ComorbQuality_10.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_11.ClientID %>'),$('<%= ComorbDataSource_11.ClientID %>'),$('<%= ComorbQuality_11.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_12.ClientID %>'),$('<%= ComorbDataSource_12.ClientID %>'),$('<%= ComorbQuality_12.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_13.ClientID %>'),$('<%= ComorbDataSource_13.ClientID %>'),$('<%= ComorbQuality_13.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_14.ClientID %>'),$('<%= ComorbDataSource_14.ClientID %>'),$('<%= ComorbQuality_14.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_15.ClientID %>'),$('<%= ComorbDataSource_15.ClientID %>'),$('<%= ComorbQuality_15.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_16.ClientID %>'), $('<%= ComorbDataSource_16.ClientID %>'), $('<%= ComorbQuality_16.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_17.ClientID %>'), $('<%= ComorbDataSource_17.ClientID %>'), $('<%= ComorbQuality_17.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_18.ClientID %>'), $('<%= ComorbDataSource_18.ClientID %>'), $('<%= ComorbQuality_18.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_19.ClientID %>'), $('<%= ComorbDataSource_19.ClientID %>'), $('<%= ComorbQuality_19.ClientID %>'));
    addGynComorbEvents($('<%= Comorbidity_20.ClientID %>'), $('<%= ComorbDataSource_20.ClientID %>'), $('<%= ComorbQuality_20.ClientID %>'));
    
    
    function GynComorbAutoPopulates(GynComorb,GynComorbSource,GynComorbQlty)
    {
        if (GynComorb.value != '')
        {
            GynComorbSource.value = 'Medical Record';
            GynComorbQlty.value = 'STD';
        }
        else
        { 
            GynComorbSource.value = '';
            GynComorbQlty.value = '';
        }
    }
</script>