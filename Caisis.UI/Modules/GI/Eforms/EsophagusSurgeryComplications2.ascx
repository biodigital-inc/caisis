<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusSurgeryComplications2" CodeFile="EsophagusSurgeryComplications2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
    tableArray.ComplicationsHtmlTable = "ComplicationsHtmlTable";
    tableArray.ComplicationsNSQIPWoundHtmlTable = "ComplicationsNSQIPWoundHtmlTable";
    tableArray.ComplicationsNSQIPRespiratoryHtmlTable = "ComplicationsNSQIPRespiratoryHtmlTable";
    tableArray.ComplicationsNSQIPUrinaryTractHtmlTable = "ComplicationsNSQIPUrinaryTractHtmlTable";
    tableArray.ComplicationsNSQIPCNSOccurrencesHtmlTable = "ComplicationsNSQIPCNSOccurrencesHtmlTable";
    tableArray.ComplicationsNSQIPCardiacOccurrencesHtmlTable = "ComplicationsNSQIPCardiacOccurrencesHtmlTable";
    tableArray.ComplicationsNSQIPGIAbdominalHtmlTable = "ComplicationsNSQIPGIAbdominalHtmlTable";
    tableArray.ComplicationsNSQIPOtherOccurrencesHtmlTable = "ComplicationsNSQIPOtherOccurrencesHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="EsophagusSurgeryComplications2" /><br/>


<table class="eformLargePopulatedTable">
    <tr>
        <td >
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Post-op Complications"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="PostOpCompRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="PostOpCompRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="PostOpCompAbsentDiv" runat="server" style="display: none;" >
 <br /><br />  
    <table class="eformLargePopulatedTable">
        <tr>
           <td valign="top" style="white-space: nowrap; "><strong> <asp:Label ID="AbsentEventPrefix" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_6"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="6" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_6"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td valign="top" style="white-space: nowrap; ">(Optional)</td>
        </tr>
</table>
<br />
</div>
                
<div id="PostOpCompDiv" runat="server" style="display: none;">
 <br /><br />  
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ComplicationsHtmlTable">
  
    <tr>
    <td width="100%" >
        <table width="100%" id="Table1">
        
              <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
                <td width="100px" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; " >&nbsp;Date</td>
                <td width="250px" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; ">Complication</td>
                <td width="110px" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; ">Morbidity Grade</td>
                <td width="210px" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; ">Notes</td>
                <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              
              <asp:Repeater ID="Toxicities" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	            <ItemTemplate> 
		            <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Toxicities', <%# DataBinder.Eval(Container.DataItem, "ToxicityId") %>, 'ToxDateText,ToxDate,ToxName,ToxGrade,ToxNotes','Toxicities');"> 
			            <td class="ClinicalEformPopulatedColumn" style="text-align: left; ">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ToxDateText")%></td>
			            <td class="ClinicalEformPopulatedColumn" style="text-align: left; "><%# DataBinder.Eval(Container.DataItem, "ToxName")%>&nbsp;</td>
			            <td class="ClinicalEformPopulatedColumn" style="text-align: left; "><%# DataBinder.Eval(Container.DataItem, "ToxGrade")%>&nbsp;</td>
			            <td class="ClinicalEformPopulatedColumn" style="text-align: left; "><%# DataBinder.Eval(Container.DataItem, "ToxNotes")%>&nbsp;</td>
			            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater>
         </table>
     </td>
     </tr>
  

  <tr>
    <td width="100%" >
        <strong>Wound occurrences</strong>
        <table width="100%" id="ComplicationsNSQIPWoundHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="9"  ID="ToxDateText_9" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="9" Runat="server" ID="ToxDate_9" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="9"  ID="ToxCategory_9" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Wound occurrences"  Field="ToxName" ParentRecordId="11" RecordId="9" Table="Toxicities" Runat="server" ID="ToxName_9"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="9" Table="Toxicities" Runat="server" id="ToxGrade_9"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="9" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_9"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_9" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="10"  ID="ToxDateText_10" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="10" Runat="server" ID="ToxDate_10" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="10"  ID="ToxCategory_10" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Wound occurrences"    Field="ToxName" ParentRecordId="11" RecordId="10" Table="Toxicities" Runat="server" ID="ToxName_10"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="10" Table="Toxicities" Runat="server" id="ToxGrade_10"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="10" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_10"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_10" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="11"  ID="ToxDateText_11" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="11" Runat="server" ID="ToxDate_11" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="11"  ID="ToxCategory_11" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Wound occurrences"    Field="ToxName" ParentRecordId="11" RecordId="11" Table="Toxicities" Runat="server" ID="ToxName_11"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="11" Table="Toxicities" Runat="server" id="ToxGrade_11"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="11" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_11"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_11" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="12"  ID="ToxDateText_12" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="12" Runat="server" ID="ToxDate_12" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="12"  ID="ToxCategory_12" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Wound occurrences"    Field="ToxName" ParentRecordId="11" RecordId="12" Table="Toxicities" Runat="server" ID="ToxName_12"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="12" Table="Toxicities" Runat="server" id="ToxGrade_12"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="12" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_12"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_12" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="13"  ID="ToxDateText_13" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="13" Runat="server" ID="ToxDate_13" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="13"  ID="ToxCategory_13" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Wound occurrences"    Field="ToxName" ParentRecordId="11" RecordId="13" Table="Toxicities" Runat="server" ID="ToxName_13"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="13" Table="Toxicities" Runat="server" id="ToxGrade_13"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="13" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_13"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_13" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="14"  ID="ToxDateText_14" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="14" Runat="server" ID="ToxDate_14" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="14"  ID="ToxCategory_14" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Wound occurrences"    Field="ToxName" ParentRecordId="11" RecordId="14" Table="Toxicities" Runat="server" ID="ToxName_14"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="14" Table="Toxicities" Runat="server" id="ToxGrade_14"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="14" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_14"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_14" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="15"  ID="ToxDateText_15" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="15" Runat="server" ID="ToxDate_15" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="15"  ID="ToxCategory_15" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Wound occurrences"    Field="ToxName" ParentRecordId="11" RecordId="15" Table="Toxicities" Runat="server" ID="ToxName_15"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="15" Table="Toxicities" Runat="server" id="ToxGrade_15"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="15" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_15"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_15" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="16"  ID="ToxDateText_16" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="16" Runat="server" ID="ToxDate_16" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="16"  ID="ToxCategory_16" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Wound occurrences"    Field="ToxName" ParentRecordId="11" RecordId="16" Table="Toxicities" Runat="server" ID="ToxName_16"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="16" Table="Toxicities" Runat="server" id="ToxGrade_16"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="16" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_16"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_16" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComplicationsNSQIPWoundHtmlTable');" />

    </td>
  </tr>

  <tr>
    <td width="100%" >
        <strong>Respiratory Occurrences</strong>
        <table width="100%" id="ComplicationsNSQIPRespiratoryHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="17"  ID="ToxDateText_17" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="17" Runat="server" ID="ToxDate_17" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="17"  ID="ToxCategory_17" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Respiratory Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="17" Table="Toxicities" Runat="server" ID="ToxName_17"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="17" Table="Toxicities" Runat="server" id="ToxGrade_17"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="17" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_17"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_17" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="18"  ID="ToxDateText_18" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="18" Runat="server" ID="ToxDate_18" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="18"  ID="ToxCategory_18" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Respiratory Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="18" Table="Toxicities" Runat="server" ID="ToxName_18"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="18" Table="Toxicities" Runat="server" id="ToxGrade_18"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="18" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_18"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_18" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="19"  ID="ToxDateText_19" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="19" Runat="server" ID="ToxDate_19" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="19"  ID="ToxCategory_19" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Respiratory Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="19" Table="Toxicities" Runat="server" ID="ToxName_19"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="19" Table="Toxicities" Runat="server" id="ToxGrade_19"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="19" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_19"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_19" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="20"  ID="ToxDateText_20" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="20" Runat="server" ID="ToxDate_20" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="20"  ID="ToxCategory_20" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Respiratory Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="20" Table="Toxicities" Runat="server" ID="ToxName_20"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="20" Table="Toxicities" Runat="server" id="ToxGrade_20"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="20" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_20"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_20" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="21"  ID="ToxDateText_21" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="21" Runat="server" ID="ToxDate_21" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="21"  ID="ToxCategory_21" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Respiratory Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="21" Table="Toxicities" Runat="server" ID="ToxName_21"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="21" Table="Toxicities" Runat="server" id="ToxGrade_21"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="21" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_21"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_21" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="22"  ID="ToxDateText_22" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="22" Runat="server" ID="ToxDate_22" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="22"  ID="ToxCategory_22" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Respiratory Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="22" Table="Toxicities" Runat="server" ID="ToxName_22"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="22" Table="Toxicities" Runat="server" id="ToxGrade_22"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="22" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_22"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_22" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="23"  ID="ToxDateText_23" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="23" Runat="server" ID="ToxDate_23" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="23"  ID="ToxCategory_23" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Respiratory Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="23" Table="Toxicities" Runat="server" ID="ToxName_23"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="23" Table="Toxicities" Runat="server" id="ToxGrade_23"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="23" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_23"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_23" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="24"  ID="ToxDateText_24" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="24" Runat="server" ID="ToxDate_24" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="24"  ID="ToxCategory_24" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Respiratory Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="24" Table="Toxicities" Runat="server" ID="ToxName_24"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="24" Table="Toxicities" Runat="server" id="ToxGrade_24"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="24" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_24"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_24" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComplicationsNSQIPRespiratoryHtmlTable');" />

    </td>
  </tr>

  <tr>
    <td width="100%" >
        <strong>Urinary Tract</strong>
        <table width="100%" id="ComplicationsNSQIPUrinaryTractHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="25"  ID="ToxDateText_25" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="25" Runat="server" ID="ToxDate_25" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="25"  ID="ToxCategory_25" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Urinary Tract"    Field="ToxName" ParentRecordId="11" RecordId="25" Table="Toxicities" Runat="server" ID="ToxName_25"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="25" Table="Toxicities" Runat="server" id="ToxGrade_25"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="25" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_25"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_25" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="26"  ID="ToxDateText_26" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="26" Runat="server" ID="ToxDate_26" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="26"  ID="ToxCategory_26" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Urinary Tract"    Field="ToxName" ParentRecordId="11" RecordId="26" Table="Toxicities" Runat="server" ID="ToxName_26"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="26" Table="Toxicities" Runat="server" id="ToxGrade_26"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="26" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_26"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_26" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="27"  ID="ToxDateText_27" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="27" Runat="server" ID="ToxDate_27" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="27"  ID="ToxCategory_27" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Urinary Tract"    Field="ToxName" ParentRecordId="11" RecordId="27" Table="Toxicities" Runat="server" ID="ToxName_27"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="28" Table="Toxicities" Runat="server" id="ToxGrade_27"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="27" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_27"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_27" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="28"  ID="ToxDateText_28" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="28" Runat="server" ID="ToxDate_28" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="28"  ID="ToxCategory_28" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Urinary Tract"    Field="ToxName" ParentRecordId="11" RecordId="28" Table="Toxicities" Runat="server" ID="ToxName_28"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="28" Table="Toxicities" Runat="server" id="ToxGrade_28"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="28" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_28"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_28" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="29"  ID="ToxDateText_29" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="29" Runat="server" ID="ToxDate_29" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="29"  ID="ToxCategory_29" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Urinary Tract"    Field="ToxName" ParentRecordId="11" RecordId="29" Table="Toxicities" Runat="server" ID="ToxName_29"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="29" Table="Toxicities" Runat="server" id="ToxGrade_29"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="29" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_29"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_29" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="30"  ID="ToxDateText_30" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="30" Runat="server" ID="ToxDate_30" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="30"  ID="ToxCategory_30" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Urinary Tract"    Field="ToxName" ParentRecordId="11" RecordId="30" Table="Toxicities" Runat="server" ID="ToxName_30"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="30" Table="Toxicities" Runat="server" id="ToxGrade_30"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="30" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_30"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_30" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="31"  ID="ToxDateText_31" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="31" Runat="server" ID="ToxDate_31" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="31"  ID="ToxCategory_31" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Urinary Tract"    Field="ToxName" ParentRecordId="11" RecordId="31" Table="Toxicities" Runat="server" ID="ToxName_31"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="31" Table="Toxicities" Runat="server" id="ToxGrade_31"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="31" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_31"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_31" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="32"  ID="ToxDateText_32" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="32" Runat="server" ID="ToxDate_32" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="32"  ID="ToxCategory_32" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Urinary Tract"    Field="ToxName" ParentRecordId="11" RecordId="32" Table="Toxicities" Runat="server" ID="ToxName_32"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="32" Table="Toxicities" Runat="server" id="ToxGrade_32"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="32" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_32"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_32" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComplicationsNSQIPUrinaryTractHtmlTable');" />

    </td>
  </tr>

  <tr>
    <td width="100%" >
        <strong>CNS Occurrences</strong>
        <table width="100%" id="ComplicationsNSQIPCNSOccurrencesHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="33"  ID="ToxDateText_33" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="33" Runat="server" ID="ToxDate_33" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="33"  ID="ToxCategory_33" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,CNS Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="33" Table="Toxicities" Runat="server" ID="ToxName_33"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="33" Table="Toxicities" Runat="server" id="ToxGrade_33"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="33" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_33"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_33" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="34"  ID="ToxDateText_34" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="34" Runat="server" ID="ToxDate_34" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="34"  ID="ToxCategory_34" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,CNS Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="34" Table="Toxicities" Runat="server" ID="ToxName_34"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="34" Table="Toxicities" Runat="server" id="ToxGrade_34"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="34" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_34"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_34" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="35"  ID="ToxDateText_35" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="35" Runat="server" ID="ToxDate_35" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="35"  ID="ToxCategory_35" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,CNS Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="35" Table="Toxicities" Runat="server" ID="ToxName_35"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="35" Table="Toxicities" Runat="server" id="ToxGrade_35"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="35" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_35"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_35" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="36"  ID="ToxDateText_36" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="36" Runat="server" ID="ToxDate_36" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="36"  ID="ToxCategory_36" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,CNS Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="36" Table="Toxicities" Runat="server" ID="ToxName_36"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="36" Table="Toxicities" Runat="server" id="ToxGrade_36"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="36" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_36"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_36" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="37"  ID="ToxDateText_37" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="37" Runat="server" ID="ToxDate_37" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="37"  ID="ToxCategory_37" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,CNS Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="37" Table="Toxicities" Runat="server" ID="ToxName_37"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="37" Table="Toxicities" Runat="server" id="ToxGrade_37"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="37" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_37"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_37" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="38"  ID="ToxDateText_38" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="38" Runat="server" ID="ToxDate_38" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="38"  ID="ToxCategory_38" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,CNS Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="38" Table="Toxicities" Runat="server" ID="ToxName_38"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="38" Table="Toxicities" Runat="server" id="ToxGrade_38"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="38" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_38"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_38" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="39"  ID="ToxDateText_39" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="39" Runat="server" ID="ToxDate_39" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="39"  ID="ToxCategory_39" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,CNS Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="39" Table="Toxicities" Runat="server" ID="ToxName_39"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="39" Table="Toxicities" Runat="server" id="ToxGrade_39"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="39" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_39"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_39" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="40"  ID="ToxDateText_40" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="40" Runat="server" ID="ToxDate_40" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="40"  ID="ToxCategory_40" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,CNS Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="40" Table="Toxicities" Runat="server" ID="ToxName_40"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="40" Table="Toxicities" Runat="server" id="ToxGrade_40"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="40" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_40"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_40" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComplicationsNSQIPCNSOccurrencesHtmlTable');" />

    </td>
  </tr>

  <tr>
    <td width="100%" >
        <strong>Cardiac Occurrences</strong>
        <table width="100%" id="ComplicationsNSQIPCardiacOccurrencesHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="41"  ID="ToxDateText_41" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="41" Runat="server" ID="ToxDate_41" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="41"  ID="ToxCategory_41" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Cardiac Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="41" Table="Toxicities" Runat="server" ID="ToxName_41"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="41" Table="Toxicities" Runat="server" id="ToxGrade_41"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="41" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_41"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_41" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="42"  ID="ToxDateText_42" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="42" Runat="server" ID="ToxDate_42" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="42"  ID="ToxCategory_42" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Cardiac Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="42" Table="Toxicities" Runat="server" ID="ToxName_42"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="42" Table="Toxicities" Runat="server" id="ToxGrade_42"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="42" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_42"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_42" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="43"  ID="ToxDateText_43" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="43" Runat="server" ID="ToxDate_43" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="43"  ID="ToxCategory_43" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Cardiac Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="43" Table="Toxicities" Runat="server" ID="ToxName_43"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="43" Table="Toxicities" Runat="server" id="ToxGrade_43"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="43" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_43"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_43" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="44"  ID="ToxDateText_44" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="44" Runat="server" ID="ToxDate_44" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="44"  ID="ToxCategory_44" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Cardiac Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="44" Table="Toxicities" Runat="server" ID="ToxName_44"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="44" Table="Toxicities" Runat="server" id="ToxGrade_44"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="44" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_44"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_44" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="45"  ID="ToxDateText_45" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="45" Runat="server" ID="ToxDate_45" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="45"  ID="ToxCategory_45" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Cardiac Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="45" Table="Toxicities" Runat="server" ID="ToxName_45"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="45" Table="Toxicities" Runat="server" id="ToxGrade_45"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="45" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_45"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_45" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="46"  ID="ToxDateText_46" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="46" Runat="server" ID="ToxDate_46" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="46"  ID="ToxCategory_46" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Cardiac Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="46" Table="Toxicities" Runat="server" ID="ToxName_46"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="46" Table="Toxicities" Runat="server" id="ToxGrade_46"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="46" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_46"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_46" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="47"  ID="ToxDateText_47" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="47" Runat="server" ID="ToxDate_47" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="47"  ID="ToxCategory_47" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Cardiac Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="47" Table="Toxicities" Runat="server" ID="ToxName_47"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="47" Table="Toxicities" Runat="server" id="ToxGrade_47"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="47" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_47"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_47" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="48"  ID="ToxDateText_48" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="48" Runat="server" ID="ToxDate_48" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="48"  ID="ToxCategory_48" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,Cardiac Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="48" Table="Toxicities" Runat="server" ID="ToxName_48"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="48" Table="Toxicities" Runat="server" id="ToxGrade_48"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="48" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_48"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_48" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComplicationsNSQIPCardiacOccurrencesHtmlTable');" />

    </td>
  </tr>

  <tr>
    <td width="100%" >
        <strong>GI/Abdominal Occurrences</strong>
        <table width="100%" id="ComplicationsNSQIPGIAbdominalHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="49"  ID="ToxDateText_49" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="49" Runat="server" ID="ToxDate_49" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="49"  ID="ToxCategory_49" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,GI/Abdominal Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="49" Table="Toxicities" Runat="server" ID="ToxName_49"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="49" Table="Toxicities" Runat="server" id="ToxGrade_49"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="49" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_49"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_49" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="50"  ID="ToxDateText_50" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="50" Runat="server" ID="ToxDate_50" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="50"  ID="ToxCategory_50" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,GI/Abdominal Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="50" Table="Toxicities" Runat="server" ID="ToxName_50"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="50" Table="Toxicities" Runat="server" id="ToxGrade_50"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="50" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_50"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_50" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="51"  ID="ToxDateText_51" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="51" Runat="server" ID="ToxDate_51" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="51"  ID="ToxCategory_51" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,GI/Abdominal Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="51" Table="Toxicities" Runat="server" ID="ToxName_51"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="51" Table="Toxicities" Runat="server" id="ToxGrade_51"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="51" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_51"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_51" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="52"  ID="ToxDateText_52" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="52" Runat="server" ID="ToxDate_52" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="52"  ID="ToxCategory_52" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,GI/Abdominal Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="52" Table="Toxicities" Runat="server" ID="ToxName_52"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="52" Table="Toxicities" Runat="server" id="ToxGrade_52"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="52" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_52"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_52" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="53"  ID="ToxDateText_53" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="53" Runat="server" ID="ToxDate_53" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="53"  ID="ToxCategory_53" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,GI/Abdominal Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="53" Table="Toxicities" Runat="server" ID="ToxName_53"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="54" Table="Toxicities" Runat="server" id="ToxGrade_53"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="53" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_53"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_53" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="54"  ID="ToxDateText_54" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="54" Runat="server" ID="ToxDate_54" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="54"  ID="ToxCategory_54" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,GI/Abdominal Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="54" Table="Toxicities" Runat="server" ID="ToxName_54"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="54" Table="Toxicities" Runat="server" id="ToxGrade_54"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="54" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_54"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_54" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="55"  ID="ToxDateText_55" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="55" Runat="server" ID="ToxDate_55" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="55"  ID="ToxCategory_55" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,GI/Abdominal Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="55" Table="Toxicities" Runat="server" ID="ToxName_55"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="55" Table="Toxicities" Runat="server" id="ToxGrade_55"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="55" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_55"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_55" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="56"  ID="ToxDateText_56" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="56" Runat="server" ID="ToxDate_56" Table="Toxicities" Field="ToxDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" ParentRecordId="11" RecordId="56"  ID="ToxCategory_56" TABLE="Toxicities" FIELD="ToxCategory" />                
                </td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDropDownList Width="250px"   LookupCode="ToxName_Complication,NSQIP,GI/Abdominal Occurrences"    Field="ToxName" ParentRecordId="11" RecordId="56" Table="Toxicities" Runat="server" ID="ToxName_56"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="56" Table="Toxicities" Runat="server" id="ToxGrade_56"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="56" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_56"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_56" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComplicationsNSQIPGIAbdominalHtmlTable');" />

    </td>
  </tr>

  <tr>
    <td width="100%" >
        <strong>Other Occurrences</strong>
        <table width="100%" id="ComplicationsNSQIPOtherOccurrencesHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="57"  ID="ToxDateText_57" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="57" Runat="server" ID="ToxDate_57" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="57"  ID="ToxCategory_57" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="57" Table="Toxicities" Runat="server" ID="ToxName_57"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="57" Table="Toxicities" Runat="server" id="ToxGrade_57"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="57" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_57"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_57" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="58"  ID="ToxDateText_58" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="58" Runat="server" ID="ToxDate_58" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="58"  ID="ToxCategory_58" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="58" Table="Toxicities" Runat="server" ID="ToxName_58"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="58" Table="Toxicities" Runat="server" id="ToxGrade_58"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="58" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_58"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_58" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="59"  ID="ToxDateText_59" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="59" Runat="server" ID="ToxDate_59" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="59"  ID="ToxCategory_59" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="59" Table="Toxicities" Runat="server" ID="ToxName_59"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="59" Table="Toxicities" Runat="server" id="ToxGrade_59"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="59" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_59"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_59" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="60"  ID="ToxDateText_60" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="60" Runat="server" ID="ToxDate_60" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="60"  ID="ToxCategory_60" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="60" Table="Toxicities" Runat="server" ID="ToxName_60"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="60" Table="Toxicities" Runat="server" id="ToxGrade_60"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="60" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_60"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_60" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="61"  ID="ToxDateText_61" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="61" Runat="server" ID="ToxDate_61" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="61"  ID="ToxCategory_61" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="61" Table="Toxicities" Runat="server" ID="ToxName_61"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="62" Table="Toxicities" Runat="server" id="ToxGrade_61"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="61" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_61"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_61" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="62"  ID="ToxDateText_62" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="62" Runat="server" ID="ToxDate_62" Table="Toxicities" Field="ToxDate" />	           
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="62"  ID="ToxCategory_62" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="62" Table="Toxicities" Runat="server" ID="ToxName_62"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="62" Table="Toxicities" Runat="server" id="ToxGrade_62"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="62" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_62"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_62" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="63"  ID="ToxDateText_63" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="63" Runat="server" ID="ToxDate_63" Table="Toxicities" Field="ToxDate" />	             
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="63"  ID="ToxCategory_63" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="63" Table="Toxicities" Runat="server" ID="ToxName_63"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="64" Table="Toxicities" Runat="server" id="ToxGrade_63"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="63" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_63"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_63" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="64"  ID="ToxDateText_64" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="64" Runat="server" ID="ToxDate_64" Table="Toxicities" Field="ToxDate" />	            
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="64"  ID="ToxCategory_64" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="64" Table="Toxicities" Runat="server" ID="ToxName_64"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="64" Table="Toxicities" Runat="server" id="ToxGrade_64"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="64" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_64"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_64" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="65"  ID="ToxDateText_65" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="65" Runat="server" ID="ToxDate_65" Table="Toxicities" Field="ToxDate" />	            
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="65"  ID="ToxCategory_65" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="65" Table="Toxicities" Runat="server" ID="ToxName_65"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="65" Table="Toxicities" Runat="server" id="ToxGrade_65"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="65" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_65"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_65" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="66"  ID="ToxDateText_66" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="66" Runat="server" ID="ToxDate_66" Table="Toxicities" Field="ToxDate" />	           
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="66"  ID="ToxCategory_66" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="66" Table="Toxicities" Runat="server" ID="ToxName_66"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="66" Table="Toxicities" Runat="server" id="ToxGrade_66"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="66" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_66"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_66" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="67"  ID="ToxDateText_67" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="67" Runat="server" ID="ToxDate_67" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="67"  ID="ToxCategory_67" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="67" Table="Toxicities" Runat="server" ID="ToxName_67"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="67" Table="Toxicities" Runat="server" id="ToxGrade_67"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="67" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_67"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_67" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="68"  ID="ToxDateText_68" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="68" Runat="server" ID="ToxDate_68" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="68"  ID="ToxCategory_68" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="68" Table="Toxicities" Runat="server" ID="ToxName_68"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="68" Table="Toxicities" Runat="server" id="ToxGrade_68"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="68" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_68"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_68" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="69"  ID="ToxDateText_69" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="69" Runat="server" ID="ToxDate_69" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="69"  ID="ToxCategory_69" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="69" Table="Toxicities" Runat="server" ID="ToxName_69"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="69" Table="Toxicities" Runat="server" id="ToxGrade_69"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="69" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_69"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_69" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="70"  ID="ToxDateText_70" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="70" Runat="server" ID="ToxDate_70" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="70"  ID="ToxCategory_70" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="70" Table="Toxicities" Runat="server" ID="ToxName_70"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="70" Table="Toxicities" Runat="server" id="ToxGrade_70"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="70" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_70"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_70" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="71"  ID="ToxDateText_71" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="71" Runat="server" ID="ToxDate_71" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="71"  ID="ToxCategory_71" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="71" Table="Toxicities" Runat="server" ID="ToxName_71"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="71" Table="Toxicities" Runat="server" id="ToxGrade_71"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="71" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_71"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_71" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="72"  ID="ToxDateText_72" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="72" Runat="server" ID="ToxDate_72" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="72"  ID="ToxCategory_72" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="72" Table="Toxicities" Runat="server" ID="ToxName_72"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="72" Table="Toxicities" Runat="server" id="ToxGrade_72"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="72" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_72"/></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformDeleteIcon ID="EformDeleteIcon_72" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="73"  ID="ToxDateText_73" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="73" Runat="server" ID="ToxDate_73" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="73"  ID="ToxCategory_73" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="73" Table="Toxicities" Runat="server" ID="ToxName_73"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="73" Table="Toxicities" Runat="server" id="ToxGrade_73"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="73" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_73"/></td>
                <td valign="top" style="white-space: nowrap; "> <euc:EformDeleteIcon ID="EformDeleteIcon_73" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="74"  ID="ToxDateText_74" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="74" Runat="server" ID="ToxDate_74" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="74"  ID="ToxCategory_74" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="74" Table="Toxicities" Runat="server" ID="ToxName_74"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="74" Table="Toxicities" Runat="server" id="ToxGrade_74"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="74" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_74"/></td>
                <td valign="top" style="white-space: nowrap; "> <euc:EformDeleteIcon ID="EformDeleteIcon_74" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="75"  ID="ToxDateText_75" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="75" Runat="server" ID="ToxDate_75" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="75"  ID="ToxCategory_75" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="75" Table="Toxicities" Runat="server" ID="ToxName_75"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="75" Table="Toxicities" Runat="server" id="ToxGrade_75"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="75" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_75"/></td>
                <td valign="top" style="white-space: nowrap; "> <euc:EformDeleteIcon ID="EformDeleteIcon_75" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="76"  ID="ToxDateText_76" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="76" Runat="server" ID="ToxDate_76" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="76"  ID="ToxCategory_76" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="76" Table="Toxicities" Runat="server" ID="ToxName_76"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="76" Table="Toxicities" Runat="server" id="ToxGrade_76"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="76" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_76"/></td>
                <td valign="top" style="white-space: nowrap; "> <euc:EformDeleteIcon ID="EformDeleteIcon_76" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="77"  ID="ToxDateText_77" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="77" Runat="server" ID="ToxDate_77" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="77"  ID="ToxCategory_77" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="77" Table="Toxicities" Runat="server" ID="ToxName_77"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="77" Table="Toxicities" Runat="server" id="ToxGrade_77"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="77" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_77"/></td>
                <td valign="top" style="white-space: nowrap; "> <euc:EformDeleteIcon ID="EformDeleteIcon_77" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="78"  ID="ToxDateText_78" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="78" Runat="server" ID="ToxDate_78" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="78"  ID="ToxCategory_78" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="78" Table="Toxicities" Runat="server" ID="ToxName_78"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="78" Table="Toxicities" Runat="server" id="ToxGrade_78"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="78" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_78"/></td>
                <td valign="top" style="white-space: nowrap; "> <euc:EformDeleteIcon ID="EformDeleteIcon_78" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="79"  ID="ToxDateText_79" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="79" Runat="server" ID="ToxDate_79" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="79"  ID="ToxCategory_79" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="79" Table="Toxicities" Runat="server" ID="ToxName_79"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="79" Table="Toxicities" Runat="server" id="ToxGrade_79"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="79" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_79"/></td>
                <td valign="top" style="white-space: nowrap; "> <euc:EformDeleteIcon ID="EformDeleteIcon_79" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="80"  ID="ToxDateText_80" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden ParentRecordId="11" RecordId="80" Runat="server" ID="ToxDate_80" Table="Toxicities" Field="ToxDate" />	
                </td>
                <td valign="top" style="white-space: nowrap; ">
                    Category:<span style="width: 28px; ">&nbsp;</span><euc:EformComboBox DropDownWidth="300px" Width="140px" Runat="server" ParentRecordId="11" RecordId="80"  ID="ToxCategory_80" TABLE="Toxicities" FIELD="ToxCategory" LookupCode="ToxCategory,NSQIP,All" />                                
                    <br />
                    Complication:  <euc:EformComboBox DropDownWidth="300px" Width="140px"   LookupCode="ToxName_Complication,NSQIP,All"    Field="ToxName" ParentRecordId="11" RecordId="80" Table="Toxicities" Runat="server" ID="ToxName_80"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxGrade,Disease,@DiseaseView"    style="width:80px;" Field="ToxGrade" ParentRecordId="11" RecordId="80" Table="Toxicities" Runat="server" id="ToxGrade_80"  /></td>
                <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="80" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_80"/></td>
                <td valign="top" style="white-space: nowrap; "> <euc:EformDeleteIcon ID="EformDeleteIcon_80" runat="server"/></td>
            </tr>

         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComplicationsNSQIPOtherOccurrencesHtmlTable');" />

    </td>
  </tr>

</table>

<br /><br />

<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="Table2">

      <tr> 
        <td valign="middle"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space: nowrap; " >&nbsp;Highest Morbidity Grade:</td>
        <td valign="middle" style="white-space: nowrap; ">
            <euc:EformTextBox Width="100px"   Field="ToxGrade" ParentRecordId="11" RecordId="81" Table="Toxicities" Runat="server" id="ToxGrade_81"  />
            <euc:EformTextBox Width="1px" style="display: none; "    Field="ToxName" ParentRecordId="11" RecordId="81" Table="Toxicities" Runat="server" ID="ToxName_81"  />
            <euc:EformTextBox Width="1px" style="display: none; " Runat="server" ParentRecordId="11" RecordId="81"  ID="ToxCategory_81" TABLE="Toxicities" FIELD="ToxCategory"   />
        </td>
        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: left; " >
            <table width="100%">
                <tr>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: left; " >&nbsp;Date:</td>
                    <td >
                        <euc:EformTextBox Runat="server" ParentRecordId="11" RecordId="81"  ID="ToxDateText_81" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"    />
                        <euc:EformHidden ParentRecordId="11" RecordId="81" Runat="server" ID="ToxDate_81" Table="Toxicities" Field="ToxDate" /> </td>                  
                </tr>
                <tr>
                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: left; " >&nbsp;Notes:</td>
                    <td valign="top" style="white-space: nowrap; "><euc:EformTextBox ParentRecordId="11" RecordId="81" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ShowTextEditor="true" ID="ToxNotes_81"/></td>               
                </tr>
            </table>
        </td>


      </tr>

</table>
</div>
 <br /><br />  <br />
<table >
    <tr id="ComorbAbsentRow">
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="TableName" ID="TableName_6"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="FieldName" ID="FieldName_6"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_6"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_6"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_6"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>


<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_9.ClientID %>'), $('<%= ToxDate_9.ClientID %>'), $('<%= ToxName_9.ClientID %>'), $('<%= ToxGrade_9.ClientID %>'), $('<%= ToxNotes_9.ClientID %>'), $('<%= ToxCategory_9.ClientID %>'), 'Wound occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_10.ClientID %>'), $('<%= ToxDate_10.ClientID %>'), $('<%= ToxName_10.ClientID %>'), $('<%= ToxGrade_10.ClientID %>'), $('<%= ToxNotes_10.ClientID %>'), $('<%= ToxCategory_10.ClientID %>'), 'Wound occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_11.ClientID %>'), $('<%= ToxDate_11.ClientID %>'), $('<%= ToxName_11.ClientID %>'), $('<%= ToxGrade_11.ClientID %>'), $('<%= ToxNotes_11.ClientID %>'), $('<%= ToxCategory_11.ClientID %>'), 'Wound occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_12.ClientID %>'), $('<%= ToxDate_12.ClientID %>'), $('<%= ToxName_12.ClientID %>'), $('<%= ToxGrade_12.ClientID %>'), $('<%= ToxNotes_12.ClientID %>'), $('<%= ToxCategory_12.ClientID %>'), 'Wound occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_13.ClientID %>'), $('<%= ToxDate_13.ClientID %>'), $('<%= ToxName_13.ClientID %>'), $('<%= ToxGrade_13.ClientID %>'), $('<%= ToxNotes_13.ClientID %>'), $('<%= ToxCategory_13.ClientID %>'), 'Wound occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_14.ClientID %>'), $('<%= ToxDate_14.ClientID %>'), $('<%= ToxName_14.ClientID %>'), $('<%= ToxGrade_14.ClientID %>'), $('<%= ToxNotes_14.ClientID %>'), $('<%= ToxCategory_14.ClientID %>'), 'Wound occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_15.ClientID %>'), $('<%= ToxDate_15.ClientID %>'), $('<%= ToxName_15.ClientID %>'), $('<%= ToxGrade_15.ClientID %>'), $('<%= ToxNotes_15.ClientID %>'), $('<%= ToxCategory_15.ClientID %>'), 'Wound occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_16.ClientID %>'), $('<%= ToxDate_16.ClientID %>'), $('<%= ToxName_16.ClientID %>'), $('<%= ToxGrade_16.ClientID %>'), $('<%= ToxNotes_16.ClientID %>'), $('<%= ToxCategory_16.ClientID %>'), 'Wound occurrences');

    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_17.ClientID %>'), $('<%= ToxDate_17.ClientID %>'), $('<%= ToxName_17.ClientID %>'), $('<%= ToxGrade_17.ClientID %>'), $('<%= ToxNotes_17.ClientID %>'), $('<%= ToxCategory_17.ClientID %>'), 'Respiratory Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_18.ClientID %>'), $('<%= ToxDate_18.ClientID %>'), $('<%= ToxName_18.ClientID %>'), $('<%= ToxGrade_18.ClientID %>'), $('<%= ToxNotes_18.ClientID %>'), $('<%= ToxCategory_18.ClientID %>'), 'Respiratory Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_19.ClientID %>'), $('<%= ToxDate_19.ClientID %>'), $('<%= ToxName_19.ClientID %>'), $('<%= ToxGrade_19.ClientID %>'), $('<%= ToxNotes_19.ClientID %>'), $('<%= ToxCategory_19.ClientID %>'), 'Respiratory Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_20.ClientID %>'), $('<%= ToxDate_20.ClientID %>'), $('<%= ToxName_20.ClientID %>'), $('<%= ToxGrade_20.ClientID %>'), $('<%= ToxNotes_20.ClientID %>'), $('<%= ToxCategory_20.ClientID %>'), 'Respiratory Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_21.ClientID %>'), $('<%= ToxDate_21.ClientID %>'), $('<%= ToxName_21.ClientID %>'), $('<%= ToxGrade_21.ClientID %>'), $('<%= ToxNotes_21.ClientID %>'), $('<%= ToxCategory_21.ClientID %>'), 'Respiratory Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_22.ClientID %>'), $('<%= ToxDate_22.ClientID %>'), $('<%= ToxName_22.ClientID %>'), $('<%= ToxGrade_22.ClientID %>'), $('<%= ToxNotes_22.ClientID %>'), $('<%= ToxCategory_22.ClientID %>'), 'Respiratory Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_23.ClientID %>'), $('<%= ToxDate_23.ClientID %>'), $('<%= ToxName_23.ClientID %>'), $('<%= ToxGrade_23.ClientID %>'), $('<%= ToxNotes_23.ClientID %>'), $('<%= ToxCategory_23.ClientID %>'), 'Respiratory Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_24.ClientID %>'), $('<%= ToxDate_24.ClientID %>'), $('<%= ToxName_24.ClientID %>'), $('<%= ToxGrade_24.ClientID %>'), $('<%= ToxNotes_24.ClientID %>'), $('<%= ToxCategory_24.ClientID %>'), 'Respiratory Occurrences');

    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_25.ClientID %>'), $('<%= ToxDate_25.ClientID %>'), $('<%= ToxName_25.ClientID %>'), $('<%= ToxGrade_25.ClientID %>'), $('<%= ToxNotes_25.ClientID %>'), $('<%= ToxCategory_25.ClientID %>'), 'Urinary Tract');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_26.ClientID %>'), $('<%= ToxDate_26.ClientID %>'), $('<%= ToxName_26.ClientID %>'), $('<%= ToxGrade_26.ClientID %>'), $('<%= ToxNotes_26.ClientID %>'), $('<%= ToxCategory_26.ClientID %>'), 'Urinary Tract');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_27.ClientID %>'), $('<%= ToxDate_27.ClientID %>'), $('<%= ToxName_27.ClientID %>'), $('<%= ToxGrade_27.ClientID %>'), $('<%= ToxNotes_27.ClientID %>'), $('<%= ToxCategory_27.ClientID %>'), 'Urinary Tract');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_28.ClientID %>'), $('<%= ToxDate_28.ClientID %>'), $('<%= ToxName_28.ClientID %>'), $('<%= ToxGrade_28.ClientID %>'), $('<%= ToxNotes_28.ClientID %>'), $('<%= ToxCategory_28.ClientID %>'), 'Urinary Tract');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_29.ClientID %>'), $('<%= ToxDate_29.ClientID %>'), $('<%= ToxName_29.ClientID %>'), $('<%= ToxGrade_29.ClientID %>'), $('<%= ToxNotes_29.ClientID %>'), $('<%= ToxCategory_29.ClientID %>'), 'Urinary Tract');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_30.ClientID %>'), $('<%= ToxDate_30.ClientID %>'), $('<%= ToxName_30.ClientID %>'), $('<%= ToxGrade_30.ClientID %>'), $('<%= ToxNotes_30.ClientID %>'), $('<%= ToxCategory_30.ClientID %>'), 'Urinary Tract');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_31.ClientID %>'), $('<%= ToxDate_31.ClientID %>'), $('<%= ToxName_31.ClientID %>'), $('<%= ToxGrade_31.ClientID %>'), $('<%= ToxNotes_31.ClientID %>'), $('<%= ToxCategory_31.ClientID %>'), 'Urinary Tract');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_32.ClientID %>'), $('<%= ToxDate_32.ClientID %>'), $('<%= ToxName_32.ClientID %>'), $('<%= ToxGrade_32.ClientID %>'), $('<%= ToxNotes_32.ClientID %>'), $('<%= ToxCategory_32.ClientID %>'), 'Urinary Tract');

    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_33.ClientID %>'), $('<%= ToxDate_33.ClientID %>'), $('<%= ToxName_33.ClientID %>'), $('<%= ToxGrade_33.ClientID %>'), $('<%= ToxNotes_33.ClientID %>'), $('<%= ToxCategory_33.ClientID %>'), 'CNS Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_34.ClientID %>'), $('<%= ToxDate_34.ClientID %>'), $('<%= ToxName_34.ClientID %>'), $('<%= ToxGrade_34.ClientID %>'), $('<%= ToxNotes_34.ClientID %>'), $('<%= ToxCategory_34.ClientID %>'), 'CNS Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_35.ClientID %>'), $('<%= ToxDate_35.ClientID %>'), $('<%= ToxName_35.ClientID %>'), $('<%= ToxGrade_35.ClientID %>'), $('<%= ToxNotes_35.ClientID %>'), $('<%= ToxCategory_35.ClientID %>'), 'CNS Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_36.ClientID %>'), $('<%= ToxDate_36.ClientID %>'), $('<%= ToxName_36.ClientID %>'), $('<%= ToxGrade_36.ClientID %>'), $('<%= ToxNotes_36.ClientID %>'), $('<%= ToxCategory_36.ClientID %>'), 'CNS Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_37.ClientID %>'), $('<%= ToxDate_37.ClientID %>'), $('<%= ToxName_37.ClientID %>'), $('<%= ToxGrade_37.ClientID %>'), $('<%= ToxNotes_37.ClientID %>'), $('<%= ToxCategory_37.ClientID %>'), 'CNS Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_38.ClientID %>'), $('<%= ToxDate_38.ClientID %>'), $('<%= ToxName_38.ClientID %>'), $('<%= ToxGrade_38.ClientID %>'), $('<%= ToxNotes_38.ClientID %>'), $('<%= ToxCategory_38.ClientID %>'), 'CNS Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_39.ClientID %>'), $('<%= ToxDate_39.ClientID %>'), $('<%= ToxName_39.ClientID %>'), $('<%= ToxGrade_39.ClientID %>'), $('<%= ToxNotes_39.ClientID %>'), $('<%= ToxCategory_39.ClientID %>'), 'CNS Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_40.ClientID %>'), $('<%= ToxDate_40.ClientID %>'), $('<%= ToxName_40.ClientID %>'), $('<%= ToxGrade_40.ClientID %>'), $('<%= ToxNotes_40.ClientID %>'), $('<%= ToxCategory_40.ClientID %>'), 'CNS Occurrences');

    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_41.ClientID %>'), $('<%= ToxDate_41.ClientID %>'), $('<%= ToxName_41.ClientID %>'), $('<%= ToxGrade_41.ClientID %>'), $('<%= ToxNotes_41.ClientID %>'), $('<%= ToxCategory_41.ClientID %>'), 'Cardiac Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_42.ClientID %>'), $('<%= ToxDate_42.ClientID %>'), $('<%= ToxName_42.ClientID %>'), $('<%= ToxGrade_42.ClientID %>'), $('<%= ToxNotes_42.ClientID %>'), $('<%= ToxCategory_42.ClientID %>'), 'Cardiac Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_43.ClientID %>'), $('<%= ToxDate_43.ClientID %>'), $('<%= ToxName_43.ClientID %>'), $('<%= ToxGrade_43.ClientID %>'), $('<%= ToxNotes_43.ClientID %>'), $('<%= ToxCategory_43.ClientID %>'), 'Cardiac Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_44.ClientID %>'), $('<%= ToxDate_44.ClientID %>'), $('<%= ToxName_44.ClientID %>'), $('<%= ToxGrade_44.ClientID %>'), $('<%= ToxNotes_44.ClientID %>'), $('<%= ToxCategory_44.ClientID %>'), 'Cardiac Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_45.ClientID %>'), $('<%= ToxDate_45.ClientID %>'), $('<%= ToxName_45.ClientID %>'), $('<%= ToxGrade_45.ClientID %>'), $('<%= ToxNotes_45.ClientID %>'), $('<%= ToxCategory_45.ClientID %>'), 'Cardiac Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_46.ClientID %>'), $('<%= ToxDate_46.ClientID %>'), $('<%= ToxName_46.ClientID %>'), $('<%= ToxGrade_46.ClientID %>'), $('<%= ToxNotes_46.ClientID %>'), $('<%= ToxCategory_46.ClientID %>'), 'Cardiac Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_47.ClientID %>'), $('<%= ToxDate_47.ClientID %>'), $('<%= ToxName_47.ClientID %>'), $('<%= ToxGrade_47.ClientID %>'), $('<%= ToxNotes_47.ClientID %>'), $('<%= ToxCategory_47.ClientID %>'), 'Cardiac Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_48.ClientID %>'), $('<%= ToxDate_48.ClientID %>'), $('<%= ToxName_48.ClientID %>'), $('<%= ToxGrade_48.ClientID %>'), $('<%= ToxNotes_48.ClientID %>'), $('<%= ToxCategory_48.ClientID %>'), 'Cardiac Occurrences');

    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_49.ClientID %>'), $('<%= ToxDate_49.ClientID %>'), $('<%= ToxName_49.ClientID %>'), $('<%= ToxGrade_49.ClientID %>'), $('<%= ToxNotes_49.ClientID %>'), $('<%= ToxCategory_49.ClientID %>'), 'GI/Abdominal Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_50.ClientID %>'), $('<%= ToxDate_50.ClientID %>'), $('<%= ToxName_50.ClientID %>'), $('<%= ToxGrade_50.ClientID %>'), $('<%= ToxNotes_50.ClientID %>'), $('<%= ToxCategory_50.ClientID %>'), 'GI/Abdominal Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_51.ClientID %>'), $('<%= ToxDate_51.ClientID %>'), $('<%= ToxName_51.ClientID %>'), $('<%= ToxGrade_51.ClientID %>'), $('<%= ToxNotes_51.ClientID %>'), $('<%= ToxCategory_51.ClientID %>'), 'GI/Abdominal Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_52.ClientID %>'), $('<%= ToxDate_52.ClientID %>'), $('<%= ToxName_52.ClientID %>'), $('<%= ToxGrade_52.ClientID %>'), $('<%= ToxNotes_52.ClientID %>'), $('<%= ToxCategory_52.ClientID %>'), 'GI/Abdominal Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_53.ClientID %>'), $('<%= ToxDate_53.ClientID %>'), $('<%= ToxName_53.ClientID %>'), $('<%= ToxGrade_53.ClientID %>'), $('<%= ToxNotes_53.ClientID %>'), $('<%= ToxCategory_53.ClientID %>'), 'GI/Abdominal Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_54.ClientID %>'), $('<%= ToxDate_54.ClientID %>'), $('<%= ToxName_54.ClientID %>'), $('<%= ToxGrade_54.ClientID %>'), $('<%= ToxNotes_54.ClientID %>'), $('<%= ToxCategory_54.ClientID %>'), 'GI/Abdominal Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_55.ClientID %>'), $('<%= ToxDate_55.ClientID %>'), $('<%= ToxName_55.ClientID %>'), $('<%= ToxGrade_55.ClientID %>'), $('<%= ToxNotes_55.ClientID %>'), $('<%= ToxCategory_55.ClientID %>'), 'GI/Abdominal Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_56.ClientID %>'), $('<%= ToxDate_56.ClientID %>'), $('<%= ToxName_56.ClientID %>'), $('<%= ToxGrade_56.ClientID %>'), $('<%= ToxNotes_56.ClientID %>'), $('<%= ToxCategory_56.ClientID %>'), 'GI/Abdominal Occurrences');

    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_57.ClientID %>'), $('<%= ToxDate_57.ClientID %>'), $('<%= ToxName_57.ClientID %>'), $('<%= ToxGrade_57.ClientID %>'), $('<%= ToxNotes_57.ClientID %>'), $('<%= ToxCategory_57.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_58.ClientID %>'), $('<%= ToxDate_58.ClientID %>'), $('<%= ToxName_58.ClientID %>'), $('<%= ToxGrade_58.ClientID %>'), $('<%= ToxNotes_58.ClientID %>'), $('<%= ToxCategory_58.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_59.ClientID %>'), $('<%= ToxDate_59.ClientID %>'), $('<%= ToxName_59.ClientID %>'), $('<%= ToxGrade_59.ClientID %>'), $('<%= ToxNotes_59.ClientID %>'), $('<%= ToxCategory_59.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_60.ClientID %>'), $('<%= ToxDate_60.ClientID %>'), $('<%= ToxName_60.ClientID %>'), $('<%= ToxGrade_60.ClientID %>'), $('<%= ToxNotes_60.ClientID %>'), $('<%= ToxCategory_60.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_61.ClientID %>'), $('<%= ToxDate_61.ClientID %>'), $('<%= ToxName_61.ClientID %>'), $('<%= ToxGrade_61.ClientID %>'), $('<%= ToxNotes_61.ClientID %>'), $('<%= ToxCategory_61.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_62.ClientID %>'), $('<%= ToxDate_62.ClientID %>'), $('<%= ToxName_62.ClientID %>'), $('<%= ToxGrade_62.ClientID %>'), $('<%= ToxNotes_62.ClientID %>'), $('<%= ToxCategory_62.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_63.ClientID %>'), $('<%= ToxDate_63.ClientID %>'), $('<%= ToxName_63.ClientID %>'), $('<%= ToxGrade_63.ClientID %>'), $('<%= ToxNotes_63.ClientID %>'), $('<%= ToxCategory_63.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_64.ClientID %>'), $('<%= ToxDate_64.ClientID %>'), $('<%= ToxName_64.ClientID %>'), $('<%= ToxGrade_64.ClientID %>'), $('<%= ToxNotes_64.ClientID %>'), $('<%= ToxCategory_64.ClientID %>'), 'Other Occurrences');

    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_65.ClientID %>'), $('<%= ToxDate_65.ClientID %>'), $('<%= ToxName_65.ClientID %>'), $('<%= ToxGrade_65.ClientID %>'), $('<%= ToxNotes_65.ClientID %>'), $('<%= ToxCategory_65.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_66.ClientID %>'), $('<%= ToxDate_66.ClientID %>'), $('<%= ToxName_66.ClientID %>'), $('<%= ToxGrade_66.ClientID %>'), $('<%= ToxNotes_66.ClientID %>'), $('<%= ToxCategory_66.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_67.ClientID %>'), $('<%= ToxDate_67.ClientID %>'), $('<%= ToxName_67.ClientID %>'), $('<%= ToxGrade_67.ClientID %>'), $('<%= ToxNotes_67.ClientID %>'), $('<%= ToxCategory_67.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_68.ClientID %>'), $('<%= ToxDate_68.ClientID %>'), $('<%= ToxName_68.ClientID %>'), $('<%= ToxGrade_68.ClientID %>'), $('<%= ToxNotes_68.ClientID %>'), $('<%= ToxCategory_68.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_69.ClientID %>'), $('<%= ToxDate_69.ClientID %>'), $('<%= ToxName_69.ClientID %>'), $('<%= ToxGrade_69.ClientID %>'), $('<%= ToxNotes_69.ClientID %>'), $('<%= ToxCategory_69.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_70.ClientID %>'), $('<%= ToxDate_70.ClientID %>'), $('<%= ToxName_70.ClientID %>'), $('<%= ToxGrade_70.ClientID %>'), $('<%= ToxNotes_70.ClientID %>'), $('<%= ToxCategory_70.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_71.ClientID %>'), $('<%= ToxDate_71.ClientID %>'), $('<%= ToxName_71.ClientID %>'), $('<%= ToxGrade_71.ClientID %>'), $('<%= ToxNotes_71.ClientID %>'), $('<%= ToxCategory_71.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_72.ClientID %>'), $('<%= ToxDate_72.ClientID %>'), $('<%= ToxName_72.ClientID %>'), $('<%= ToxGrade_72.ClientID %>'), $('<%= ToxNotes_72.ClientID %>'), $('<%= ToxCategory_72.ClientID %>'), 'Other Occurrences');

    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_73.ClientID %>'), $('<%= ToxDate_73.ClientID %>'), $('<%= ToxName_73.ClientID %>'), $('<%= ToxGrade_73.ClientID %>'), $('<%= ToxNotes_73.ClientID %>'), $('<%= ToxCategory_73.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_74.ClientID %>'), $('<%= ToxDate_74.ClientID %>'), $('<%= ToxName_74.ClientID %>'), $('<%= ToxGrade_74.ClientID %>'), $('<%= ToxNotes_74.ClientID %>'), $('<%= ToxCategory_74.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_75.ClientID %>'), $('<%= ToxDate_75.ClientID %>'), $('<%= ToxName_75.ClientID %>'), $('<%= ToxGrade_75.ClientID %>'), $('<%= ToxNotes_75.ClientID %>'), $('<%= ToxCategory_75.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_76.ClientID %>'), $('<%= ToxDate_76.ClientID %>'), $('<%= ToxName_76.ClientID %>'), $('<%= ToxGrade_76.ClientID %>'), $('<%= ToxNotes_76.ClientID %>'), $('<%= ToxCategory_76.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_77.ClientID %>'), $('<%= ToxDate_77.ClientID %>'), $('<%= ToxName_77.ClientID %>'), $('<%= ToxGrade_77.ClientID %>'), $('<%= ToxNotes_77.ClientID %>'), $('<%= ToxCategory_77.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_78.ClientID %>'), $('<%= ToxDate_78.ClientID %>'), $('<%= ToxName_78.ClientID %>'), $('<%= ToxGrade_78.ClientID %>'), $('<%= ToxNotes_78.ClientID %>'), $('<%= ToxCategory_78.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_79.ClientID %>'), $('<%= ToxDate_79.ClientID %>'), $('<%= ToxName_79.ClientID %>'), $('<%= ToxGrade_79.ClientID %>'), $('<%= ToxNotes_79.ClientID %>'), $('<%= ToxCategory_79.ClientID %>'), 'Other Occurrences');
    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_80.ClientID %>'), $('<%= ToxDate_80.ClientID %>'), $('<%= ToxName_80.ClientID %>'), $('<%= ToxGrade_80.ClientID %>'), $('<%= ToxNotes_80.ClientID %>'), $('<%= ToxCategory_80.ClientID %>'), 'Other Occurrences');

    addAbsentEvent($('<%= PostOpCompRecorded.ClientID %>'), $('<%= PostOpCompDiv.ClientID %>'), $('<%= PostOpCompAbsentDiv.ClientID %>'), $('<%= ToxDateText_81.ClientID %>'), $('<%= ToxDate_81.ClientID %>'), $('<%= ToxName_81.ClientID %>'), $('<%= ToxGrade_81.ClientID %>'), $('<%= ToxNotes_81.ClientID %>'), $('<%= ToxCategory_81.ClientID %>'), 'Other Occurrences');

    function addAbsentEvent(toxRecordedID,toxDivID,toxAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID,toxCategoryID,categoryValue)
    {  
        $(toxRecordedID).addEvent('click',curry(ToxYesNo,toxRecordedID,toxDivID,toxAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID,toxCategoryID,categoryValue));
        $(toxDateTextID).addEvent('blur',curry(ToxYesNo,toxRecordedID,toxDivID,toxAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID,toxCategoryID,categoryValue));
        $(toxNameID).addEvent('blur',curry(ToxYesNo,toxRecordedID,toxDivID,toxAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID,toxCategoryID,categoryValue));
        $(toxGradeID).addEvent('blur', curry(ToxYesNo, toxRecordedID, toxDivID, toxAbsentDivID, toxDateTextID, toxDateID, toxNameID, toxGradeID, toxNotesID, toxCategoryID, categoryValue));
        $(toxCategoryID).addEvent('blur', curry(ToxYesNo, toxRecordedID, toxDivID, toxAbsentDivID, toxDateTextID, toxDateID, toxNameID, toxGradeID, toxNotesID, toxCategoryID, categoryValue));
        $(toxNotesID).addEvent('blur', curry(ToxYesNo, toxRecordedID, toxDivID, toxAbsentDivID, toxDateTextID, toxDateID, toxNameID, toxGradeID, toxNotesID, toxCategoryID, categoryValue));

        // check on load as well
        ToxYesNo(toxRecordedID,toxDivID,toxAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID,toxCategoryID,categoryValue);
    }
   
    /* ]]> */
   
    function ToxYesNo(toxRecordedID,toxDivID,toxAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID,toxCategoryID,categoryValue)
    {
       var comorbRecordedRef = toxRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < comorbRecordedRef.length; i++) 
        if (comorbRecordedRef[i].checked) {  
            ToxRadioClick(comorbRecordedRef[i].value,toxDivID,toxAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID,toxCategoryID,categoryValue);
            }
    }
    
    function ToxRadioClick(Toxoption_value,ToxhideDiv,ToxhideAbsentDiv,toxDateTextID,toxDateID,toxNameID,toxGradeID,toxNotesID,toxCategoryID,categoryValue)
    {
      if (Toxoption_value == "Yes")
      { 
        ToxhideDiv.style.display='block';
        ToxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_6.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_6.ClientID %>').value='';
        document.getElementById('<%= TableName_6.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_6.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_6.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_6.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_6.ClientID %>').value = '';
        
        if (categoryValue != 'Other Occurrences')
        {
            if (toxDateTextID.value != '' || toxNameID.value != '' || toxNotesID.value != '')
                toxCategoryID.value = categoryValue;
            else
                toxCategoryID.value = '';
        }
        if ((toxGradeID.value != '' && toxGradeID.id.indexOf('_81') > -1) ||
            (toxDateTextID.value != '' && toxDateTextID.id.indexOf('_81') > -1) ||
            (toxNotesID.value != '' && toxNotesID.id.indexOf('_81') > -1)
           ) {
            toxNameID.value = 'Highest Morbidity Grade';
        }
        else if ((toxGradeID.value == '' && toxGradeID.id.indexOf('_81') > -1) &&
            (toxDateTextID.value == '' && toxDateTextID.id.indexOf('_81') > -1) &&
            (toxNotesID.value == '' && toxNotesID.id.indexOf('_81') > -1)
           )
            toxNameID.value = '';
            
      }
      else if (Toxoption_value == "No" || Toxoption_value == "Unknown" || Toxoption_value == "N/A")
      {
        ToxhideAbsentDiv.style.display='block';
        ToxhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_6.ClientID %>').value = 'Toxicities';        
        document.getElementById('<%= FieldName_6.ClientID %>').value = 'ToxName';        
        document.getElementById('<%= FieldValue_6.ClientID %>').value = 'Toxicities'; 
        
        if (Toxoption_value == "No")       
            document.getElementById('<%= AbsentReason_6.ClientID %>').value = 'None Recorded';        
        else if (Toxoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_6.ClientID %>').value = 'Unknown';
        else if (Toxoption_value == "N/A")
            document.getElementById('<%= AbsentReason_6.ClientID %>').value = 'Not Applicable';

        document.getElementById('<%= AbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_6.ClientID %>').value +  ' as of ';
           
        document.getElementById('<%= AbsentQuality_6.ClientID %>').value = 'OUT';        

        toxDateTextID.value = '';
        toxDateID.value = '';
        toxNameID.value = '';
        toxNotesID.value = '';
        toxCategoryID.value = '';
        toxGradeID.value = '';
     }
    }

</script>