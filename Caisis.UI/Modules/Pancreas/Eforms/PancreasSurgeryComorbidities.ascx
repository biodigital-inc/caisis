<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasSurgeryComorbidities" CodeFile="PancreasSurgeryComorbidities.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
    tableArray.ComorbiditiesHtmlTable = "ComorbiditiesHtmlTable";
    tableArray.ComorbiditiesNSQIPGeneralHtmlTable = "ComorbiditiesNSQIPGeneralHtmlTable";
    tableArray.ComorbiditiesNSQIPPulmonaryHtmlTable = "ComorbiditiesNSQIPPulmonaryHtmlTable";
    tableArray.ComorbiditiesNSQIPHepatobiliaryHtmlTable = "ComorbiditiesNSQIPHepatobiliaryHtmlTable";
    tableArray.ComorbiditiesNSQIPGastroIntestinalHtmlTable = "ComorbiditiesNSQIPGastroIntestinalHtmlTable";
    tableArray.ComorbiditiesNSQIPCardiacHtmlTable = "ComorbiditiesNSQIPCardiacHtmlTable";
    tableArray.ComorbiditiesNSQIPVascularHtmlTable = "ComorbiditiesNSQIPVascularHtmlTable";
    tableArray.ComorbiditiesNSQIPRenalHtmlTable = "ComorbiditiesNSQIPRenalHtmlTable";
    tableArray.ComorbiditiesNSQIPCNSHtmlTable = "ComorbiditiesNSQIPCNSHtmlTable";
    tableArray.ComorbiditiesNSQIPFENHtmlTable = "ComorbiditiesNSQIPFENHtmlTable";
    tableArray.ComorbiditiesNSQIPOtherHtmlTable = "ComorbiditiesNSQIPOtherHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="PancreasSurgeryComorbidities" /><br/>


<table class="eformLargePopulatedTable">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Comorbidities"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ComorbRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="ComorbRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="ComorbAbsentDiv" runat="server" style="display: none;" >
 <br /><br />  
    <table class="eformLargePopulatedTable">
        <tr>
           <td><strong> <asp:Label ID="AbsentEventPrefix" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_1"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="1" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_1"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td>(Optional)</td>
        </tr>
</table>
<br />
</div>
                
<div id="ComorbDiv" runat="server" style="display: none;">
 <br /><br />  
<table width="650" cellpadding="0" cellspacing="0" class="ClinicalEformTable" id="ComorbiditiesHtmlTable">
  
    <tr>
    <td width="100%" >
        <table width="100%" id="Table1">
        
              <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
                <td width="110px" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; " >&nbsp;Date</td>
                <td width="260px" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; ">Comorbidity</td>
                <td width="210px" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; ">Notes</td>
                <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              
              <asp:Repeater ID="comorbidities" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	            <ItemTemplate> 
		            <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Comorbidities', <%# DataBinder.Eval(Container.DataItem, "ComorbidityId") %>, 'ComorbDateText,ComorbDate,Comorbidity,ComorbSystem,ComorbNotes','Comorbidities');"> 
			            <td class="ClinicalEformPopulatedColumn" style="text-align: left; ">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %></td>
			            <td class="ClinicalEformPopulatedColumn" style="text-align: left; "><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>&nbsp;</td>
			            <td class="ClinicalEformPopulatedColumn" style="text-align: left; "><%# DataBinder.Eval(Container.DataItem, "ComorbNotes") %>&nbsp;</td>
			            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater>
         </table>
     </td>
     </tr>
  
  <tr>
    <td width="100%" >
        <strong>General</strong>
        <table width="100%" id="ComorbiditiesNSQIPGeneralHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="1"  ID="ComorbDateText_1" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="1" Runat="server" ID="ComorbDate_1" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1"  ID="ComorbSystem_1" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,General"    Field="Comorbidity" RecordId="1" Table="Comorbidities" Runat="server" ID="Comorbidity_1"  /></td>
                <td ><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_1"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_1" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="2"  ID="ComorbDateText_2" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="2" Runat="server" ID="ComorbDate_2" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2"  ID="ComorbSystem_2" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,General"    Field="Comorbidity" RecordId="2" Table="Comorbidities" Runat="server" ID="Comorbidity_2"  /></td>
                <td ><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_2"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_2" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="3"  ID="ComorbDateText_3" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="3" Runat="server" ID="ComorbDate_3" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3"  ID="ComorbSystem_3" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,General"    Field="Comorbidity" RecordId="3" Table="Comorbidities" Runat="server" ID="Comorbidity_3"  /></td>
                <td ><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_3"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_3" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="4"  ID="ComorbDateText_4" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="4" Runat="server" ID="ComorbDate_4" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4"  ID="ComorbSystem_4" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,General"    Field="Comorbidity" RecordId="4" Table="Comorbidities" Runat="server" ID="Comorbidity_4"  /></td>
                <td ><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_4"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_4" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="5"  ID="ComorbDateText_5" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="5" Runat="server" ID="ComorbDate_5" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5"  ID="ComorbSystem_5" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,General"    Field="Comorbidity" RecordId="5" Table="Comorbidities" Runat="server" ID="Comorbidity_5"  /></td>
                <td ><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_5"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_5" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="6"  ID="ComorbDateText_6" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="6" Runat="server" ID="ComorbDate_6" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6"  ID="ComorbSystem_6" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,General"    Field="Comorbidity" RecordId="6" Table="Comorbidities" Runat="server" ID="Comorbidity_6"  /></td>
                <td ><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_6"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_6" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="7"  ID="ComorbDateText_7" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="7" Runat="server" ID="ComorbDate_7" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7"  ID="ComorbSystem_7" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,General"    Field="Comorbidity" RecordId="7" Table="Comorbidities" Runat="server" ID="Comorbidity_7"  /></td>
                <td ><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_7"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_7" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="8"  ID="ComorbDateText_8" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="8" Runat="server" ID="ComorbDate_8" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8"  ID="ComorbSystem_8" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,General"    Field="Comorbidity" RecordId="8" Table="Comorbidities" Runat="server" ID="Comorbidity_8"  /></td>
                <td ><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_8"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_8" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesNSQIPGeneralHtmlTable');" />

    </td>
  </tr>
  
  <tr>
    <td width="100%" colspan="3">
        <strong>Pulmonary</strong>
        <table width="100%" id="ComorbiditiesNSQIPPulmonaryHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="9"  ID="ComorbDateText_9" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="9" Runat="server" ID="ComorbDate_9" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9"  ID="ComorbSystem_9" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Pulmonary"    Field="Comorbidity" RecordId="9" Table="Comorbidities" Runat="server" ID="Comorbidity_9"  /></td>
                <td ><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_9"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_9" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="10"  ID="ComorbDateText_10" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="10" Runat="server" ID="ComorbDate_10" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10"  ID="ComorbSystem_10" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Pulmonary"    Field="Comorbidity" RecordId="10" Table="Comorbidities" Runat="server" ID="Comorbidity_10"  /></td>
                <td ><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_10"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_10" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="11"  ID="ComorbDateText_11" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="11" Runat="server" ID="ComorbDate_11" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="11"  ID="ComorbSystem_11" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Pulmonary"    Field="Comorbidity" RecordId="11" Table="Comorbidities" Runat="server" ID="Comorbidity_11"  /></td>
                <td ><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_11"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_11" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="12"  ID="ComorbDateText_12" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="12" Runat="server" ID="ComorbDate_12" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="12"  ID="ComorbSystem_12" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Pulmonary"    Field="Comorbidity" RecordId="12" Table="Comorbidities" Runat="server" ID="Comorbidity_12"  /></td>
                <td ><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_12"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_12" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="13"  ID="ComorbDateText_13" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="13" Runat="server" ID="ComorbDate_13" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="13"  ID="ComorbSystem_13" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Pulmonary"    Field="Comorbidity" RecordId="13" Table="Comorbidities" Runat="server" ID="Comorbidity_13"  /></td>
                <td ><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_13"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_13" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="14"  ID="ComorbDateText_14" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="14" Runat="server" ID="ComorbDate_14" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="14"  ID="ComorbSystem_14" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Pulmonary"    Field="Comorbidity" RecordId="14" Table="Comorbidities" Runat="server" ID="Comorbidity_14"  /></td>
                <td ><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_14"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_14" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="15"  ID="ComorbDateText_15" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="15" Runat="server" ID="ComorbDate_15" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="15"  ID="ComorbSystem_15" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Pulmonary"    Field="Comorbidity" RecordId="15" Table="Comorbidities" Runat="server" ID="Comorbidity_15"  /></td>
                <td ><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_15"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_15" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="16"  ID="ComorbDateText_16" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="16" Runat="server" ID="ComorbDate_16" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16"  ID="ComorbSystem_16" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Pulmonary"    Field="Comorbidity" RecordId="16" Table="Comorbidities" Runat="server" ID="Comorbidity_16"  /></td>
                <td ><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_16"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_16" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesNSQIPPulmonaryHtmlTable');" />

    </td>
  </tr>

  <tr>
    <td width="100%" >
        <strong>Hepatobiliary</strong>
        <table width="100%" id="ComorbiditiesNSQIPHepatobiliaryHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="17"  ID="ComorbDateText_17" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="17" Runat="server" ID="ComorbDate_17" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17"  ID="ComorbSystem_17" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Hepatobiliary"    Field="Comorbidity" RecordId="17" Table="Comorbidities" Runat="server" ID="Comorbidity_17"  /></td>
                <td ><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_17"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_17" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="18"  ID="ComorbDateText_18" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="18" Runat="server" ID="ComorbDate_18" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="18"  ID="ComorbSystem_18" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Hepatobiliary"    Field="Comorbidity" RecordId="18" Table="Comorbidities" Runat="server" ID="Comorbidity_18"  /></td>
                <td ><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_18"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_18" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="19"  ID="ComorbDateText_19" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="19" Runat="server" ID="ComorbDate_19" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19"  ID="ComorbSystem_19" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Hepatobiliary"    Field="Comorbidity" RecordId="19" Table="Comorbidities" Runat="server" ID="Comorbidity_19"  /></td>
                <td ><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_19"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_19" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="20"  ID="ComorbDateText_20" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="20" Runat="server" ID="ComorbDate_20" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="20"  ID="ComorbSystem_20" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Hepatobiliary"    Field="Comorbidity" RecordId="20" Table="Comorbidities" Runat="server" ID="Comorbidity_20"  /></td>
                <td ><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_20"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_20" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="21"  ID="ComorbDateText_21" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="21" Runat="server" ID="ComorbDate_21" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="21"  ID="ComorbSystem_21" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Hepatobiliary"    Field="Comorbidity" RecordId="21" Table="Comorbidities" Runat="server" ID="Comorbidity_21"  /></td>
                <td ><euc:EformTextBox RecordId="21" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_21"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_21" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="22"  ID="ComorbDateText_22" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="22" Runat="server" ID="ComorbDate_22" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="22"  ID="ComorbSystem_22" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Hepatobiliary"    Field="Comorbidity" RecordId="22" Table="Comorbidities" Runat="server" ID="Comorbidity_22"  /></td>
                <td ><euc:EformTextBox RecordId="22" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_22"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_22" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="23"  ID="ComorbDateText_23" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="23" Runat="server" ID="ComorbDate_23" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="23"  ID="ComorbSystem_23" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Hepatobiliary"    Field="Comorbidity" RecordId="23" Table="Comorbidities" Runat="server" ID="Comorbidity_23"  /></td>
                <td ><euc:EformTextBox RecordId="23" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_23"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_23" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="24"  ID="ComorbDateText_24" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="24" Runat="server" ID="ComorbDate_24" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="24"  ID="ComorbSystem_24" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Hepatobiliary"    Field="Comorbidity" RecordId="24" Table="Comorbidities" Runat="server" ID="Comorbidity_24"  /></td>
                <td ><euc:EformTextBox RecordId="24" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_24"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_24" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesNSQIPHepatobiliaryHtmlTable');" />

    </td>
  </tr>

  <tr>
    <td width="100%" >
        <strong>Gastrointestinal</strong>
        <table width="100%" id="ComorbiditiesNSQIPGastroIntestinalHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="25"  ID="ComorbDateText_25" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="25" Runat="server" ID="ComorbDate_25" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="25"  ID="ComorbSystem_25" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Gastrointestinal"    Field="Comorbidity" RecordId="25" Table="Comorbidities" Runat="server" ID="Comorbidity_25"  /></td>
                <td ><euc:EformTextBox RecordId="25" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_25"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_25" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="26"  ID="ComorbDateText_26" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="26" Runat="server" ID="ComorbDate_26" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="26"  ID="ComorbSystem_26" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Gastrointestinal"    Field="Comorbidity" RecordId="26" Table="Comorbidities" Runat="server" ID="Comorbidity_26"  /></td>
                <td ><euc:EformTextBox RecordId="26" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_26"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_26" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="27"  ID="ComorbDateText_27" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="27" Runat="server" ID="ComorbDate_27" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="27"  ID="ComorbSystem_27" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Gastrointestinal"    Field="Comorbidity" RecordId="27" Table="Comorbidities" Runat="server" ID="Comorbidity_27"  /></td>
                <td ><euc:EformTextBox RecordId="27" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_27"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_27" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="28"  ID="ComorbDateText_28" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="28" Runat="server" ID="ComorbDate_28" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="28"  ID="ComorbSystem_28" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Gastrointestinal"    Field="Comorbidity" RecordId="28" Table="Comorbidities" Runat="server" ID="Comorbidity_28"  /></td>
                <td ><euc:EformTextBox RecordId="28" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_28"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_28" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="29"  ID="ComorbDateText_29" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="29" Runat="server" ID="ComorbDate_29" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="29"  ID="ComorbSystem_29" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Gastrointestinal"    Field="Comorbidity" RecordId="29" Table="Comorbidities" Runat="server" ID="Comorbidity_29"  /></td>
                <td ><euc:EformTextBox RecordId="29" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_29"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_29" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="30"  ID="ComorbDateText_30" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="30" Runat="server" ID="ComorbDate_30" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="30"  ID="ComorbSystem_30" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Gastrointestinal"    Field="Comorbidity" RecordId="30" Table="Comorbidities" Runat="server" ID="Comorbidity_30"  /></td>
                <td ><euc:EformTextBox RecordId="30" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_30"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_30" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="31"  ID="ComorbDateText_31" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="31" Runat="server" ID="ComorbDate_31" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31"  ID="ComorbSystem_31" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Gastrointestinal"    Field="Comorbidity" RecordId="31" Table="Comorbidities" Runat="server" ID="Comorbidity_31"  /></td>
                <td ><euc:EformTextBox RecordId="31" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_31"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_31" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="32"  ID="ComorbDateText_32" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="32" Runat="server" ID="ComorbDate_32" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32"  ID="ComorbSystem_32" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,GastroIntestinal"    Field="Comorbidity" RecordId="32" Table="Comorbidities" Runat="server" ID="Comorbidity_32"  /></td>
                <td ><euc:EformTextBox RecordId="32" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_32"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_32" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesNSQIPGastroIntestinalHtmlTable');" />

    </td>
  </tr>

  <tr>
    <td width="100%" >
        <strong>Cardiac</strong>
        <table width="100%" id="ComorbiditiesNSQIPCardiacHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="33"  ID="ComorbDateText_33" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="33" Runat="server" ID="ComorbDate_33" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33"  ID="ComorbSystem_33" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Cardiac"    Field="Comorbidity" RecordId="33" Table="Comorbidities" Runat="server" ID="Comorbidity_33"  /></td>
                <td ><euc:EformTextBox RecordId="33" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_33"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_33" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="34"  ID="ComorbDateText_34" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="34" Runat="server" ID="ComorbDate_34" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34"  ID="ComorbSystem_34" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Cardiac"    Field="Comorbidity" RecordId="34" Table="Comorbidities" Runat="server" ID="Comorbidity_34"  /></td>
                <td ><euc:EformTextBox RecordId="34" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_34"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_34" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="35"  ID="ComorbDateText_35" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="35" Runat="server" ID="ComorbDate_35" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35"  ID="ComorbSystem_35" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Cardiac"    Field="Comorbidity" RecordId="35" Table="Comorbidities" Runat="server" ID="Comorbidity_35"  /></td>
                <td ><euc:EformTextBox RecordId="35" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_35"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_35" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="36"  ID="ComorbDateText_36" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="36" Runat="server" ID="ComorbDate_36" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="36"  ID="ComorbSystem_36" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Cardiac"    Field="Comorbidity" RecordId="36" Table="Comorbidities" Runat="server" ID="Comorbidity_36"  /></td>
                <td ><euc:EformTextBox RecordId="36" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_36"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_36" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="37"  ID="ComorbDateText_37" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="37" Runat="server" ID="ComorbDate_37" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="37"  ID="ComorbSystem_37" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Cardiac"    Field="Comorbidity" RecordId="37" Table="Comorbidities" Runat="server" ID="Comorbidity_37"  /></td>
                <td ><euc:EformTextBox RecordId="37" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_37"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_37" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="38"  ID="ComorbDateText_38" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="38" Runat="server" ID="ComorbDate_38" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="38"  ID="ComorbSystem_38" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Cardiac"    Field="Comorbidity" RecordId="38" Table="Comorbidities" Runat="server" ID="Comorbidity_38"  /></td>
                <td ><euc:EformTextBox RecordId="38" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_38"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_38" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="39"  ID="ComorbDateText_39" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="39" Runat="server" ID="ComorbDate_39" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="39"  ID="ComorbSystem_39" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Cardiac"    Field="Comorbidity" RecordId="39" Table="Comorbidities" Runat="server" ID="Comorbidity_39"  /></td>
                <td ><euc:EformTextBox RecordId="39" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_39"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_39" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="40"  ID="ComorbDateText_40" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="40" Runat="server" ID="ComorbDate_40" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="40"  ID="ComorbSystem_40" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Cardiac"    Field="Comorbidity" RecordId="40" Table="Comorbidities" Runat="server" ID="Comorbidity_40"  /></td>
                <td ><euc:EformTextBox RecordId="40" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_40"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_40" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesNSQIPCardiacHtmlTable');" />

    </td>
  </tr>

  <tr>
    <td width="100%" >
        <strong>Vascular</strong>
        <table width="100%" id="ComorbiditiesNSQIPVascularHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="41"  ID="ComorbDateText_41" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="41" Runat="server" ID="ComorbDate_41" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="41"  ID="ComorbSystem_41" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Vascular"    Field="Comorbidity" RecordId="41" Table="Comorbidities" Runat="server" ID="Comorbidity_41"  /></td>
                <td ><euc:EformTextBox RecordId="41" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_41"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_41" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="42"  ID="ComorbDateText_42" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="42" Runat="server" ID="ComorbDate_42" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="42"  ID="ComorbSystem_42" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Vascular"    Field="Comorbidity" RecordId="42" Table="Comorbidities" Runat="server" ID="Comorbidity_42"  /></td>
                <td ><euc:EformTextBox RecordId="42" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_42"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_42" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="43"  ID="ComorbDateText_43" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="43" Runat="server" ID="ComorbDate_43" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="43"  ID="ComorbSystem_43" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Vascular"    Field="Comorbidity" RecordId="43" Table="Comorbidities" Runat="server" ID="Comorbidity_43"  /></td>
                <td ><euc:EformTextBox RecordId="43" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_43"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_43" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="44"  ID="ComorbDateText_44" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="44" Runat="server" ID="ComorbDate_44" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="44"  ID="ComorbSystem_44" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Vascular"    Field="Comorbidity" RecordId="44" Table="Comorbidities" Runat="server" ID="Comorbidity_44"  /></td>
                <td ><euc:EformTextBox RecordId="44" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_44"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_44" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="45"  ID="ComorbDateText_45" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="45" Runat="server" ID="ComorbDate_45" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="45"  ID="ComorbSystem_45" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Vascular"    Field="Comorbidity" RecordId="45" Table="Comorbidities" Runat="server" ID="Comorbidity_45"  /></td>
                <td ><euc:EformTextBox RecordId="45" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_45"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_45" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="46"  ID="ComorbDateText_46" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="46" Runat="server" ID="ComorbDate_46" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="46"  ID="ComorbSystem_46" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Vascular"    Field="Comorbidity" RecordId="46" Table="Comorbidities" Runat="server" ID="Comorbidity_46"  /></td>
                <td ><euc:EformTextBox RecordId="46" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_46"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_46" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="47"  ID="ComorbDateText_47" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="47" Runat="server" ID="ComorbDate_47" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="47"  ID="ComorbSystem_47" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Vascular"    Field="Comorbidity" RecordId="47" Table="Comorbidities" Runat="server" ID="Comorbidity_47"  /></td>
                <td ><euc:EformTextBox RecordId="47" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_47"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_47" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="48"  ID="ComorbDateText_48" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="48" Runat="server" ID="ComorbDate_48" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="48"  ID="ComorbSystem_48" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Vascular"    Field="Comorbidity" RecordId="48" Table="Comorbidities" Runat="server" ID="Comorbidity_48"  /></td>
                <td ><euc:EformTextBox RecordId="48" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_48"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_48" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesNSQIPVascularHtmlTable');" />

    </td>
  </tr>

  <tr>
    <td width="100%" >
        <strong>Renal</strong>
        <table width="100%" id="ComorbiditiesNSQIPRenalHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="49"  ID="ComorbDateText_49" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="49" Runat="server" ID="ComorbDate_49" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="49"  ID="ComorbSystem_49" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Renal"    Field="Comorbidity" RecordId="49" Table="Comorbidities" Runat="server" ID="Comorbidity_49"  /></td>
                <td ><euc:EformTextBox RecordId="49" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_49"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_49" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="50"  ID="ComorbDateText_50" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="50" Runat="server" ID="ComorbDate_50" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="50"  ID="ComorbSystem_50" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Renal"    Field="Comorbidity" RecordId="50" Table="Comorbidities" Runat="server" ID="Comorbidity_50"  /></td>
                <td ><euc:EformTextBox RecordId="50" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_50"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_50" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="51"  ID="ComorbDateText_51" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="51" Runat="server" ID="ComorbDate_51" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="51"  ID="ComorbSystem_51" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Renal"    Field="Comorbidity" RecordId="51" Table="Comorbidities" Runat="server" ID="Comorbidity_51"  /></td>
                <td ><euc:EformTextBox RecordId="51" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_51"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_51" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="52"  ID="ComorbDateText_52" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="52" Runat="server" ID="ComorbDate_52" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="52"  ID="ComorbSystem_52" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Renal"    Field="Comorbidity" RecordId="52" Table="Comorbidities" Runat="server" ID="Comorbidity_52"  /></td>
                <td ><euc:EformTextBox RecordId="52" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_52"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_52" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="53"  ID="ComorbDateText_53" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="53" Runat="server" ID="ComorbDate_53" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="53"  ID="ComorbSystem_53" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Renal"    Field="Comorbidity" RecordId="53" Table="Comorbidities" Runat="server" ID="Comorbidity_53"  /></td>
                <td ><euc:EformTextBox RecordId="53" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_53"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_53" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="54"  ID="ComorbDateText_54" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="54" Runat="server" ID="ComorbDate_54" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="54"  ID="ComorbSystem_54" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Renal"    Field="Comorbidity" RecordId="54" Table="Comorbidities" Runat="server" ID="Comorbidity_54"  /></td>
                <td ><euc:EformTextBox RecordId="54" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_54"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_54" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="55"  ID="ComorbDateText_55" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="55" Runat="server" ID="ComorbDate_55" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="55"  ID="ComorbSystem_55" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Renal"    Field="Comorbidity" RecordId="55" Table="Comorbidities" Runat="server" ID="Comorbidity_55"  /></td>
                <td ><euc:EformTextBox RecordId="55" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_55"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_55" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="56"  ID="ComorbDateText_56" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="56" Runat="server" ID="ComorbDate_56" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="56"  ID="ComorbSystem_56" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,Renal"    Field="Comorbidity" RecordId="56" Table="Comorbidities" Runat="server" ID="Comorbidity_56"  /></td>
                <td ><euc:EformTextBox RecordId="56" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_56"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_56" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesNSQIPRenalHtmlTable');" />

    </td>
  </tr>

  <tr>
    <td width="100%" >
        <strong>CNS</strong>
        <table width="100%" id="ComorbiditiesNSQIPCNSHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="57"  ID="ComorbDateText_57" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="57" Runat="server" ID="ComorbDate_57" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="57"  ID="ComorbSystem_57" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,CNS"    Field="Comorbidity" RecordId="57" Table="Comorbidities" Runat="server" ID="Comorbidity_57"  /></td>
                <td ><euc:EformTextBox RecordId="57" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_57"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_57" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="58"  ID="ComorbDateText_58" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="58" Runat="server" ID="ComorbDate_58" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="58"  ID="ComorbSystem_58" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,CNS"    Field="Comorbidity" RecordId="58" Table="Comorbidities" Runat="server" ID="Comorbidity_58"  /></td>
                <td ><euc:EformTextBox RecordId="58" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_58"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_58" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="59"  ID="ComorbDateText_59" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="59" Runat="server" ID="ComorbDate_59" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="59"  ID="ComorbSystem_59" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,CNS"    Field="Comorbidity" RecordId="59" Table="Comorbidities" Runat="server" ID="Comorbidity_59"  /></td>
                <td ><euc:EformTextBox RecordId="59" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_59"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_59" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="60"  ID="ComorbDateText_60" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="60" Runat="server" ID="ComorbDate_60" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="60"  ID="ComorbSystem_60" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,CNS"    Field="Comorbidity" RecordId="60" Table="Comorbidities" Runat="server" ID="Comorbidity_60"  /></td>
                <td ><euc:EformTextBox RecordId="60" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_60"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_60" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="61"  ID="ComorbDateText_61" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="61" Runat="server" ID="ComorbDate_61" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="61"  ID="ComorbSystem_61" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,CNS"    Field="Comorbidity" RecordId="61" Table="Comorbidities" Runat="server" ID="Comorbidity_61"  /></td>
                <td ><euc:EformTextBox RecordId="61" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_61"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_61" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="62"  ID="ComorbDateText_62" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="62" Runat="server" ID="ComorbDate_62" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="62"  ID="ComorbSystem_62" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,CNS"    Field="Comorbidity" RecordId="62" Table="Comorbidities" Runat="server" ID="Comorbidity_62"  /></td>
                <td ><euc:EformTextBox RecordId="62" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_62"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_62" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="63"  ID="ComorbDateText_63" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="63" Runat="server" ID="ComorbDate_63" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="63"  ID="ComorbSystem_63" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,CNS"    Field="Comorbidity" RecordId="63" Table="Comorbidities" Runat="server" ID="Comorbidity_63"  /></td>
                <td ><euc:EformTextBox RecordId="63" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_63"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_63" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="64"  ID="ComorbDateText_64" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="64" Runat="server" ID="ComorbDate_64" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="64"  ID="ComorbSystem_64" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,CNS"    Field="Comorbidity" RecordId="64" Table="Comorbidities" Runat="server" ID="Comorbidity_64"  /></td>
                <td ><euc:EformTextBox RecordId="64" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_64"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_64" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesNSQIPCNSHtmlTable');" />

    </td>
  </tr>

  <tr>
    <td width="100%" >
        <strong>FEN</strong>
        <table width="100%" id="ComorbiditiesNSQIPFENHtmlTable">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="65"  ID="ComorbDateText_65" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="65" Runat="server" ID="ComorbDate_65" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="65"  ID="ComorbSystem_65" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,FEN"    Field="Comorbidity" RecordId="65" Table="Comorbidities" Runat="server" ID="Comorbidity_65"  /></td>
                <td ><euc:EformTextBox RecordId="65" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_65"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_65" runat="server"/></td>
            </tr>
             <tr > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="66"  ID="ComorbDateText_66" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="66" Runat="server" ID="ComorbDate_66" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="66"  ID="ComorbSystem_66" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,FEN"    Field="Comorbidity" RecordId="66" Table="Comorbidities" Runat="server" ID="Comorbidity_66"  /></td>
                <td ><euc:EformTextBox RecordId="66" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_66"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_66" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="67"  ID="ComorbDateText_67" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="67" Runat="server" ID="ComorbDate_67" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="67"  ID="ComorbSystem_67" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,FEN"    Field="Comorbidity" RecordId="67" Table="Comorbidities" Runat="server" ID="Comorbidity_67"  /></td>
                <td ><euc:EformTextBox RecordId="67" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_67"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_67" runat="server"/></td>
            </tr>
             <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="68"  ID="ComorbDateText_68" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="68" Runat="server" ID="ComorbDate_68" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="68"  ID="ComorbSystem_68" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,FEN"    Field="Comorbidity" RecordId="68" Table="Comorbidities" Runat="server" ID="Comorbidity_68"  /></td>
                <td ><euc:EformTextBox RecordId="68" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_68"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_68" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="69"  ID="ComorbDateText_69" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="69" Runat="server" ID="ComorbDate_69" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="69"  ID="ComorbSystem_69" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,FEN"    Field="Comorbidity" RecordId="69" Table="Comorbidities" Runat="server" ID="Comorbidity_69"  /></td>
                <td ><euc:EformTextBox RecordId="69" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_69"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_69" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="70"  ID="ComorbDateText_70" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="70" Runat="server" ID="ComorbDate_70" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="70"  ID="ComorbSystem_70" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,FEN"    Field="Comorbidity" RecordId="70" Table="Comorbidities" Runat="server" ID="Comorbidity_70"  /></td>
                <td ><euc:EformTextBox RecordId="70" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_70"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_70" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="71"  ID="ComorbDateText_71" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="71" Runat="server" ID="ComorbDate_71" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="71"  ID="ComorbSystem_71" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,FEN"    Field="Comorbidity" RecordId="71" Table="Comorbidities" Runat="server" ID="Comorbidity_71"  /></td>
                <td ><euc:EformTextBox RecordId="71" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_71"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_71" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Runat="server" RecordId="72"  ID="ComorbDateText_72" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="72" Runat="server" ID="ComorbDate_72" Table="Comorbidities" Field="ComorbDate" />	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="72"  ID="ComorbSystem_72" TABLE="Comorbidities" FIELD="ComorbSystem" />                
                </td>
                <td><euc:EformDropDownList Width="250px"   LookupCode="Comorbidity,NSQIP,FEN"    Field="Comorbidity" RecordId="72" Table="Comorbidities" Runat="server" ID="Comorbidity_72"  /></td>
                <td ><euc:EformTextBox RecordId="72" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_72"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_72" runat="server"/></td>
            </tr>
         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesNSQIPFENHtmlTable');" />

    </td>
  </tr>
  
    <tr>
    <td width="100%" >
        <strong>Other</strong>
        <table width="100%" id="ComorbiditiesNSQIPOtherHtmlTable" cellpadding="2">
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" RecordId="73"  ID="ComorbDateText_73" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="73" Runat="server" ID="ComorbDate_73" Table="Comorbidities" Field="ComorbDate" />	
                </td>
                <td valign="top">
                    System:  <euc:EformComboBox DropDownWidth="300px" Width="185px" Runat="server" RecordId="73"  ID="ComorbSystem_73" TABLE="Comorbidities" FIELD="ComorbSystem" LookupCode="ComorbSystem,NSQIP,All" />                                
                    <br />
                    Comorb:  <euc:EformComboBox DropDownWidth="300px" Width="185px"   LookupCode="Comorbidity,NSQIP,All"    Field="Comorbidity" RecordId="73" Table="Comorbidities" Runat="server" ID="Comorbidity_73"  /></td>
                <td valign="top"><euc:EformTextBox RecordId="73" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_73"/></td>
                <td valign="top"> <euc:EformDeleteIcon ID="EformDeleteIcon_73" runat="server"/></td>
            </tr>
            <tr > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" RecordId="74"  ID="ComorbDateText_74" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="74" Runat="server" ID="ComorbDate_74" Table="Comorbidities" Field="ComorbDate" />	
                </td>
                <td valign="top">
                    System:  <euc:EformComboBox DropDownWidth="300px" Width="185px" Runat="server" RecordId="74"  ID="ComorbSystem_74" TABLE="Comorbidities" FIELD="ComorbSystem" LookupCode="ComorbSystem,NSQIP,All" />                                
                    <br />
                    Comorb:  <euc:EformComboBox DropDownWidth="300px" Width="185px"   LookupCode="Comorbidity,NSQIP,All"    Field="Comorbidity" RecordId="74" Table="Comorbidities" Runat="server" ID="Comorbidity_74"  /></td>
                <td valign="top"><euc:EformTextBox RecordId="74" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_74"/></td>
                <td valign="top"> <euc:EformDeleteIcon ID="EformDeleteIcon_74" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" RecordId="75"  ID="ComorbDateText_75" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="75" Runat="server" ID="ComorbDate_75" Table="Comorbidities" Field="ComorbDate" />	
                </td>
                <td valign="top">
                    System:  <euc:EformComboBox DropDownWidth="300px" Width="185px" Runat="server" RecordId="75"  ID="ComorbSystem_75" TABLE="Comorbidities" FIELD="ComorbSystem" LookupCode="ComorbSystem,NSQIP,All" />                                
                    <br />
                    Comorb:  <euc:EformComboBox DropDownWidth="300px" Width="185px"   LookupCode="Comorbidity,NSQIP,All"    Field="Comorbidity" RecordId="75" Table="Comorbidities" Runat="server" ID="Comorbidity_75"  /></td>
                <td valign="top"><euc:EformTextBox RecordId="75" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_75"/></td>
                <td valign="top"> <euc:EformDeleteIcon ID="EformDeleteIcon_75" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" RecordId="76"  ID="ComorbDateText_76" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="76" Runat="server" ID="ComorbDate_76" Table="Comorbidities" Field="ComorbDate" />	
                </td>
                <td valign="top">
                    System:  <euc:EformComboBox DropDownWidth="300px" Width="185px" Runat="server" RecordId="76"  ID="ComorbSystem_76" TABLE="Comorbidities" FIELD="ComorbSystem" LookupCode="ComorbSystem,NSQIP,All" />                                
                    <br />
                    Comorb:  <euc:EformComboBox DropDownWidth="300px" Width="185px"   LookupCode="Comorbidity,NSQIP,All"    Field="Comorbidity" RecordId="76" Table="Comorbidities" Runat="server" ID="Comorbidity_76"  /></td>
                <td valign="top"><euc:EformTextBox RecordId="76" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_76"/></td>
                <td valign="top"> <euc:EformDeleteIcon ID="EformDeleteIcon_76" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" RecordId="77"  ID="ComorbDateText_77" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="77" Runat="server" ID="ComorbDate_77" Table="Comorbidities" Field="ComorbDate" />	
                </td>
                <td valign="top">
                    System:  <euc:EformComboBox DropDownWidth="300px" Width="185px" Runat="server" RecordId="77"  ID="ComorbSystem_77" TABLE="Comorbidities" FIELD="ComorbSystem" LookupCode="ComorbSystem,NSQIP,All" />                                
                    <br />
                    Comorb:  <euc:EformComboBox DropDownWidth="300px" Width="185px"   LookupCode="Comorbidity,NSQIP,All"    Field="Comorbidity" RecordId="77" Table="Comorbidities" Runat="server" ID="Comorbidity_77"  /></td>
                <td valign="top"><euc:EformTextBox RecordId="77" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_77"/></td>
                <td valign="top"> <euc:EformDeleteIcon ID="EformDeleteIcon_77" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" RecordId="78"  ID="ComorbDateText_78" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="78" Runat="server" ID="ComorbDate_78" Table="Comorbidities" Field="ComorbDate" />	
                </td>
                <td valign="top">
                    System:  <euc:EformComboBox DropDownWidth="300px" Width="185px" Runat="server" RecordId="78"  ID="ComorbSystem_78" TABLE="Comorbidities" FIELD="ComorbSystem" LookupCode="ComorbSystem,NSQIP,All" />                                
                    <br />
                    Comorb:  <euc:EformComboBox DropDownWidth="300px" Width="185px"   LookupCode="Comorbidity,NSQIP,All"    Field="Comorbidity" RecordId="78" Table="Comorbidities" Runat="server" ID="Comorbidity_78"  /></td>
                <td valign="top"><euc:EformTextBox RecordId="78" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_78"/></td>
                <td valign="top"> <euc:EformDeleteIcon ID="EformDeleteIcon_78" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" RecordId="79"  ID="ComorbDateText_79" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="79" Runat="server" ID="ComorbDate_79" Table="Comorbidities" Field="ComorbDate" />	
                </td>
                <td valign="top">
                    System:  <euc:EformComboBox DropDownWidth="300px" Width="185px" Runat="server" RecordId="79"  ID="ComorbSystem_79" TABLE="Comorbidities" FIELD="ComorbSystem" LookupCode="ComorbSystem,NSQIP,All" />                                
                    <br />
                    Comorb:  <euc:EformComboBox DropDownWidth="300px" Width="185px"   LookupCode="Comorbidity,NSQIP,All"    Field="Comorbidity" RecordId="79" Table="Comorbidities" Runat="server" ID="Comorbidity_79"  /></td>
                <td valign="top"><euc:EformTextBox RecordId="79" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_79"/></td>
                <td valign="top"> <euc:EformDeleteIcon ID="EformDeleteIcon_79" runat="server"/></td>
            </tr>
            <tr style="display: none; " > 
                <td height="28" class="ClinicalEformGridColumnOne" valign="top">
                <euc:EformTextBox Runat="server" RecordId="80"  ID="ComorbDateText_80" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
                <euc:EformHidden RecordId="80" Runat="server" ID="ComorbDate_80" Table="Comorbidities" Field="ComorbDate" />	
                </td>
                <td valign="top">
                    System:  <euc:EformComboBox DropDownWidth="300px" Width="185px" Runat="server" RecordId="80"  ID="ComorbSystem_80" TABLE="Comorbidities" FIELD="ComorbSystem" LookupCode="ComorbSystem,NSQIP,All" />                                
                    <br />
                    Comorb:  <euc:EformComboBox DropDownWidth="300px" Width="185px"   LookupCode="Comorbidity,NSQIP,All"    Field="Comorbidity" RecordId="80" Table="Comorbidities" Runat="server" ID="Comorbidity_80"  /></td>
                <td valign="top"><euc:EformTextBox RecordId="80" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_80"/></td>
                <td valign="top"> <euc:EformDeleteIcon ID="EformDeleteIcon_80" runat="server"/></td>
            </tr>

         
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesNSQIPOtherHtmlTable');" />

    </td>
  </tr>

</table>

</div>
 <br /><br />  <br />
<table >
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


<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_1.ClientID %>'), $('<%= ComorbDate_1.ClientID %>'), $('<%= Comorbidity_1.ClientID %>'), $('<%= ComorbNotes_1.ClientID %>'), $('<%= ComorbSystem_1.ClientID %>'),'General');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_2.ClientID %>'), $('<%= ComorbDate_2.ClientID %>'), $('<%= Comorbidity_2.ClientID %>'), $('<%= ComorbNotes_2.ClientID %>'), $('<%= ComorbSystem_2.ClientID %>'),'General');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_3.ClientID %>'), $('<%= ComorbDate_3.ClientID %>'), $('<%= Comorbidity_3.ClientID %>'), $('<%= ComorbNotes_3.ClientID %>'), $('<%= ComorbSystem_3.ClientID %>'),'General');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_4.ClientID %>'), $('<%= ComorbDate_4.ClientID %>'), $('<%= Comorbidity_4.ClientID %>'), $('<%= ComorbNotes_4.ClientID %>'), $('<%= ComorbSystem_4.ClientID %>'),'General');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_5.ClientID %>'), $('<%= ComorbDate_5.ClientID %>'), $('<%= Comorbidity_5.ClientID %>'), $('<%= ComorbNotes_5.ClientID %>'), $('<%= ComorbSystem_5.ClientID %>'),'General');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_6.ClientID %>'), $('<%= ComorbDate_6.ClientID %>'), $('<%= Comorbidity_6.ClientID %>'), $('<%= ComorbNotes_6.ClientID %>'), $('<%= ComorbSystem_6.ClientID %>'),'General');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_7.ClientID %>'), $('<%= ComorbDate_7.ClientID %>'), $('<%= Comorbidity_7.ClientID %>'), $('<%= ComorbNotes_7.ClientID %>'), $('<%= ComorbSystem_7.ClientID %>'),'General');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_8.ClientID %>'), $('<%= ComorbDate_8.ClientID %>'), $('<%= Comorbidity_8.ClientID %>'), $('<%= ComorbNotes_8.ClientID %>'), $('<%= ComorbSystem_8.ClientID %>'),'General');

    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_9.ClientID %>'), $('<%= ComorbDate_9.ClientID %>'), $('<%= Comorbidity_9.ClientID %>'), $('<%= ComorbNotes_9.ClientID %>'), $('<%= ComorbSystem_9.ClientID %>'), 'Pulmonary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_10.ClientID %>'), $('<%= ComorbDate_10.ClientID %>'), $('<%= Comorbidity_10.ClientID %>'), $('<%= ComorbNotes_10.ClientID %>'), $('<%= ComorbSystem_10.ClientID %>'), 'Pulmonary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_11.ClientID %>'), $('<%= ComorbDate_11.ClientID %>'), $('<%= Comorbidity_11.ClientID %>'), $('<%= ComorbNotes_11.ClientID %>'), $('<%= ComorbSystem_11.ClientID %>'), 'Pulmonary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_12.ClientID %>'), $('<%= ComorbDate_12.ClientID %>'), $('<%= Comorbidity_12.ClientID %>'), $('<%= ComorbNotes_12.ClientID %>'), $('<%= ComorbSystem_12.ClientID %>'), 'Pulmonary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_13.ClientID %>'), $('<%= ComorbDate_13.ClientID %>'), $('<%= Comorbidity_13.ClientID %>'), $('<%= ComorbNotes_13.ClientID %>'), $('<%= ComorbSystem_13.ClientID %>'), 'Pulmonary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_14.ClientID %>'), $('<%= ComorbDate_14.ClientID %>'), $('<%= Comorbidity_14.ClientID %>'), $('<%= ComorbNotes_14.ClientID %>'), $('<%= ComorbSystem_14.ClientID %>'), 'Pulmonary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_15.ClientID %>'), $('<%= ComorbDate_15.ClientID %>'), $('<%= Comorbidity_15.ClientID %>'), $('<%= ComorbNotes_15.ClientID %>'), $('<%= ComorbSystem_15.ClientID %>'), 'Pulmonary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_16.ClientID %>'), $('<%= ComorbDate_16.ClientID %>'), $('<%= Comorbidity_16.ClientID %>'), $('<%= ComorbNotes_16.ClientID %>'), $('<%= ComorbSystem_16.ClientID %>'), 'Pulmonary');

    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_17.ClientID %>'), $('<%= ComorbDate_17.ClientID %>'), $('<%= Comorbidity_17.ClientID %>'), $('<%= ComorbNotes_17.ClientID %>'), $('<%= ComorbSystem_17.ClientID %>'), 'Hepatobiliary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_18.ClientID %>'), $('<%= ComorbDate_18.ClientID %>'), $('<%= Comorbidity_18.ClientID %>'), $('<%= ComorbNotes_18.ClientID %>'), $('<%= ComorbSystem_18.ClientID %>'), 'Hepatobiliary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_19.ClientID %>'), $('<%= ComorbDate_19.ClientID %>'), $('<%= Comorbidity_19.ClientID %>'), $('<%= ComorbNotes_19.ClientID %>'), $('<%= ComorbSystem_19.ClientID %>'), 'Hepatobiliary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_20.ClientID %>'), $('<%= ComorbDate_20.ClientID %>'), $('<%= Comorbidity_20.ClientID %>'), $('<%= ComorbNotes_20.ClientID %>'), $('<%= ComorbSystem_20.ClientID %>'), 'Hepatobiliary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_21.ClientID %>'), $('<%= ComorbDate_21.ClientID %>'), $('<%= Comorbidity_21.ClientID %>'), $('<%= ComorbNotes_21.ClientID %>'), $('<%= ComorbSystem_21.ClientID %>'), 'Hepatobiliary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_22.ClientID %>'), $('<%= ComorbDate_22.ClientID %>'), $('<%= Comorbidity_22.ClientID %>'), $('<%= ComorbNotes_22.ClientID %>'), $('<%= ComorbSystem_22.ClientID %>'), 'Hepatobiliary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_23.ClientID %>'), $('<%= ComorbDate_23.ClientID %>'), $('<%= Comorbidity_23.ClientID %>'), $('<%= ComorbNotes_23.ClientID %>'), $('<%= ComorbSystem_23.ClientID %>'), 'Hepatobiliary');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_20.ClientID %>'), $('<%= ComorbDate_20.ClientID %>'), $('<%= Comorbidity_20.ClientID %>'), $('<%= ComorbNotes_20.ClientID %>'), $('<%= ComorbSystem_24.ClientID %>'), 'Hepatobiliary');

    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_25.ClientID %>'), $('<%= ComorbDate_25.ClientID %>'), $('<%= Comorbidity_25.ClientID %>'), $('<%= ComorbNotes_25.ClientID %>'), $('<%= ComorbSystem_25.ClientID %>'), 'Gastrointestinal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_26.ClientID %>'), $('<%= ComorbDate_26.ClientID %>'), $('<%= Comorbidity_26.ClientID %>'), $('<%= ComorbNotes_26.ClientID %>'), $('<%= ComorbSystem_26.ClientID %>'), 'Gastrointestinal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_27.ClientID %>'), $('<%= ComorbDate_27.ClientID %>'), $('<%= Comorbidity_27.ClientID %>'), $('<%= ComorbNotes_27.ClientID %>'), $('<%= ComorbSystem_27.ClientID %>'), 'Gastrointestinal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_28.ClientID %>'), $('<%= ComorbDate_28.ClientID %>'), $('<%= Comorbidity_28.ClientID %>'), $('<%= ComorbNotes_28.ClientID %>'), $('<%= ComorbSystem_28.ClientID %>'), 'Gastrointestinal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_29.ClientID %>'), $('<%= ComorbDate_29.ClientID %>'), $('<%= Comorbidity_29.ClientID %>'), $('<%= ComorbNotes_29.ClientID %>'), $('<%= ComorbSystem_29.ClientID %>'), 'Gastrointestinal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_30.ClientID %>'), $('<%= ComorbDate_30.ClientID %>'), $('<%= Comorbidity_30.ClientID %>'), $('<%= ComorbNotes_30.ClientID %>'), $('<%= ComorbSystem_30.ClientID %>'), 'Gastrointestinal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_31.ClientID %>'), $('<%= ComorbDate_31.ClientID %>'), $('<%= Comorbidity_31.ClientID %>'), $('<%= ComorbNotes_31.ClientID %>'), $('<%= ComorbSystem_31.ClientID %>'), 'Gastrointestinal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_32.ClientID %>'), $('<%= ComorbDate_32.ClientID %>'), $('<%= Comorbidity_32.ClientID %>'), $('<%= ComorbNotes_32.ClientID %>'), $('<%= ComorbSystem_32.ClientID %>'), 'Gastrointestinal');

    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_33.ClientID %>'), $('<%= ComorbDate_33.ClientID %>'), $('<%= Comorbidity_33.ClientID %>'), $('<%= ComorbNotes_33.ClientID %>'), $('<%= ComorbSystem_33.ClientID %>'), 'Cardiac');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_34.ClientID %>'), $('<%= ComorbDate_34.ClientID %>'), $('<%= Comorbidity_34.ClientID %>'), $('<%= ComorbNotes_34.ClientID %>'), $('<%= ComorbSystem_34.ClientID %>'), 'Cardiac');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_35.ClientID %>'), $('<%= ComorbDate_35.ClientID %>'), $('<%= Comorbidity_35.ClientID %>'), $('<%= ComorbNotes_35.ClientID %>'), $('<%= ComorbSystem_35.ClientID %>'), 'Cardiac');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_36.ClientID %>'), $('<%= ComorbDate_36.ClientID %>'), $('<%= Comorbidity_36.ClientID %>'), $('<%= ComorbNotes_36.ClientID %>'), $('<%= ComorbSystem_36.ClientID %>'), 'Cardiac');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_37.ClientID %>'), $('<%= ComorbDate_37.ClientID %>'), $('<%= Comorbidity_37.ClientID %>'), $('<%= ComorbNotes_37.ClientID %>'), $('<%= ComorbSystem_37.ClientID %>'), 'Cardiac');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_38.ClientID %>'), $('<%= ComorbDate_38.ClientID %>'), $('<%= Comorbidity_38.ClientID %>'), $('<%= ComorbNotes_38.ClientID %>'), $('<%= ComorbSystem_38.ClientID %>'), 'Cardiac');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_39.ClientID %>'), $('<%= ComorbDate_39.ClientID %>'), $('<%= Comorbidity_39.ClientID %>'), $('<%= ComorbNotes_39.ClientID %>'), $('<%= ComorbSystem_39.ClientID %>'), 'Cardiac');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_40.ClientID %>'), $('<%= ComorbDate_40.ClientID %>'), $('<%= Comorbidity_40.ClientID %>'), $('<%= ComorbNotes_40.ClientID %>'), $('<%= ComorbSystem_40.ClientID %>'), 'Cardiac');

    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_41.ClientID %>'), $('<%= ComorbDate_41.ClientID %>'), $('<%= Comorbidity_41.ClientID %>'), $('<%= ComorbNotes_41.ClientID %>'), $('<%= ComorbSystem_41.ClientID %>'), 'Vascular');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_42.ClientID %>'), $('<%= ComorbDate_42.ClientID %>'), $('<%= Comorbidity_42.ClientID %>'), $('<%= ComorbNotes_42.ClientID %>'), $('<%= ComorbSystem_42.ClientID %>'), 'Vascular');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_43.ClientID %>'), $('<%= ComorbDate_43.ClientID %>'), $('<%= Comorbidity_43.ClientID %>'), $('<%= ComorbNotes_43.ClientID %>'), $('<%= ComorbSystem_43.ClientID %>'), 'Vascular');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_44.ClientID %>'), $('<%= ComorbDate_44.ClientID %>'), $('<%= Comorbidity_44.ClientID %>'), $('<%= ComorbNotes_44.ClientID %>'), $('<%= ComorbSystem_44.ClientID %>'), 'Vascular');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_45.ClientID %>'), $('<%= ComorbDate_45.ClientID %>'), $('<%= Comorbidity_45.ClientID %>'), $('<%= ComorbNotes_45.ClientID %>'), $('<%= ComorbSystem_45.ClientID %>'), 'Vascular');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_46.ClientID %>'), $('<%= ComorbDate_46.ClientID %>'), $('<%= Comorbidity_46.ClientID %>'), $('<%= ComorbNotes_46.ClientID %>'), $('<%= ComorbSystem_46.ClientID %>'), 'Vascular');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_47.ClientID %>'), $('<%= ComorbDate_47.ClientID %>'), $('<%= Comorbidity_47.ClientID %>'), $('<%= ComorbNotes_47.ClientID %>'), $('<%= ComorbSystem_47.ClientID %>'), 'Vascular');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_48.ClientID %>'), $('<%= ComorbDate_48.ClientID %>'), $('<%= Comorbidity_48.ClientID %>'), $('<%= ComorbNotes_48.ClientID %>'), $('<%= ComorbSystem_48.ClientID %>'), 'Vascular');

    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_49.ClientID %>'), $('<%= ComorbDate_49.ClientID %>'), $('<%= Comorbidity_49.ClientID %>'), $('<%= ComorbNotes_49.ClientID %>'), $('<%= ComorbSystem_49.ClientID %>'), 'Renal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_50.ClientID %>'), $('<%= ComorbDate_50.ClientID %>'), $('<%= Comorbidity_50.ClientID %>'), $('<%= ComorbNotes_50.ClientID %>'), $('<%= ComorbSystem_50.ClientID %>'), 'Renal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_51.ClientID %>'), $('<%= ComorbDate_51.ClientID %>'), $('<%= Comorbidity_51.ClientID %>'), $('<%= ComorbNotes_51.ClientID %>'), $('<%= ComorbSystem_51.ClientID %>'), 'Renal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_52.ClientID %>'), $('<%= ComorbDate_52.ClientID %>'), $('<%= Comorbidity_52.ClientID %>'), $('<%= ComorbNotes_52.ClientID %>'), $('<%= ComorbSystem_52.ClientID %>'), 'Renal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_53.ClientID %>'), $('<%= ComorbDate_53.ClientID %>'), $('<%= Comorbidity_53.ClientID %>'), $('<%= ComorbNotes_53.ClientID %>'), $('<%= ComorbSystem_53.ClientID %>'), 'Renal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_54.ClientID %>'), $('<%= ComorbDate_54.ClientID %>'), $('<%= Comorbidity_54.ClientID %>'), $('<%= ComorbNotes_54.ClientID %>'), $('<%= ComorbSystem_54.ClientID %>'), 'Renal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_55.ClientID %>'), $('<%= ComorbDate_55.ClientID %>'), $('<%= Comorbidity_55.ClientID %>'), $('<%= ComorbNotes_55.ClientID %>'), $('<%= ComorbSystem_55.ClientID %>'), 'Renal');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_56.ClientID %>'), $('<%= ComorbDate_56.ClientID %>'), $('<%= Comorbidity_56.ClientID %>'), $('<%= ComorbNotes_56.ClientID %>'), $('<%= ComorbSystem_56.ClientID %>'), 'Renal');

    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_57.ClientID %>'), $('<%= ComorbDate_57.ClientID %>'), $('<%= Comorbidity_57.ClientID %>'), $('<%= ComorbNotes_57.ClientID %>'), $('<%= ComorbSystem_57.ClientID %>'), 'CNS');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_58.ClientID %>'), $('<%= ComorbDate_58.ClientID %>'), $('<%= Comorbidity_58.ClientID %>'), $('<%= ComorbNotes_58.ClientID %>'), $('<%= ComorbSystem_58.ClientID %>'), 'CNS');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_59.ClientID %>'), $('<%= ComorbDate_59.ClientID %>'), $('<%= Comorbidity_59.ClientID %>'), $('<%= ComorbNotes_59.ClientID %>'), $('<%= ComorbSystem_59.ClientID %>'), 'CNS');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_60.ClientID %>'), $('<%= ComorbDate_60.ClientID %>'), $('<%= Comorbidity_60.ClientID %>'), $('<%= ComorbNotes_60.ClientID %>'), $('<%= ComorbSystem_60.ClientID %>'), 'CNS');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_61.ClientID %>'), $('<%= ComorbDate_61.ClientID %>'), $('<%= Comorbidity_61.ClientID %>'), $('<%= ComorbNotes_61.ClientID %>'), $('<%= ComorbSystem_61.ClientID %>'), 'CNS');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_62.ClientID %>'), $('<%= ComorbDate_62.ClientID %>'), $('<%= Comorbidity_62.ClientID %>'), $('<%= ComorbNotes_62.ClientID %>'), $('<%= ComorbSystem_62.ClientID %>'), 'CNS');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_63.ClientID %>'), $('<%= ComorbDate_63.ClientID %>'), $('<%= Comorbidity_63.ClientID %>'), $('<%= ComorbNotes_63.ClientID %>'), $('<%= ComorbSystem_63.ClientID %>'), 'CNS');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_64.ClientID %>'), $('<%= ComorbDate_64.ClientID %>'), $('<%= Comorbidity_64.ClientID %>'), $('<%= ComorbNotes_64.ClientID %>'), $('<%= ComorbSystem_64.ClientID %>'), 'CNS');

    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_65.ClientID %>'), $('<%= ComorbDate_65.ClientID %>'), $('<%= Comorbidity_65.ClientID %>'), $('<%= ComorbNotes_65.ClientID %>'), $('<%= ComorbSystem_65.ClientID %>'), 'FEN');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_66.ClientID %>'), $('<%= ComorbDate_66.ClientID %>'), $('<%= Comorbidity_66.ClientID %>'), $('<%= ComorbNotes_66.ClientID %>'), $('<%= ComorbSystem_66.ClientID %>'), 'FEN');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_67.ClientID %>'), $('<%= ComorbDate_67.ClientID %>'), $('<%= Comorbidity_67.ClientID %>'), $('<%= ComorbNotes_67.ClientID %>'), $('<%= ComorbSystem_67.ClientID %>'), 'FEN');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_68.ClientID %>'), $('<%= ComorbDate_68.ClientID %>'), $('<%= Comorbidity_68.ClientID %>'), $('<%= ComorbNotes_68.ClientID %>'), $('<%= ComorbSystem_68.ClientID %>'), 'FEN');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_69.ClientID %>'), $('<%= ComorbDate_69.ClientID %>'), $('<%= Comorbidity_69.ClientID %>'), $('<%= ComorbNotes_69.ClientID %>'), $('<%= ComorbSystem_69.ClientID %>'), 'FEN');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_70.ClientID %>'), $('<%= ComorbDate_70.ClientID %>'), $('<%= Comorbidity_70.ClientID %>'), $('<%= ComorbNotes_70.ClientID %>'), $('<%= ComorbSystem_70.ClientID %>'), 'FEN');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_71.ClientID %>'), $('<%= ComorbDate_71.ClientID %>'), $('<%= Comorbidity_71.ClientID %>'), $('<%= ComorbNotes_71.ClientID %>'), $('<%= ComorbSystem_71.ClientID %>'), 'FEN');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_72.ClientID %>'), $('<%= ComorbDate_72.ClientID %>'), $('<%= Comorbidity_72.ClientID %>'), $('<%= ComorbNotes_72.ClientID %>'), $('<%= ComorbSystem_72.ClientID %>'), 'FEN');

    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_73.ClientID %>'), $('<%= ComorbDate_73.ClientID %>'), $('<%= Comorbidity_73.ClientID %>'), $('<%= ComorbNotes_73.ClientID %>'), $('<%= ComorbSystem_73.ClientID %>'), 'Other');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_74.ClientID %>'), $('<%= ComorbDate_74.ClientID %>'), $('<%= Comorbidity_74.ClientID %>'), $('<%= ComorbNotes_74.ClientID %>'), $('<%= ComorbSystem_74.ClientID %>'), 'Other');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_75.ClientID %>'), $('<%= ComorbDate_75.ClientID %>'), $('<%= Comorbidity_75.ClientID %>'), $('<%= ComorbNotes_75.ClientID %>'), $('<%= ComorbSystem_75.ClientID %>'), 'Other');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_76.ClientID %>'), $('<%= ComorbDate_76.ClientID %>'), $('<%= Comorbidity_76.ClientID %>'), $('<%= ComorbNotes_76.ClientID %>'), $('<%= ComorbSystem_76.ClientID %>'), 'Other');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_77.ClientID %>'), $('<%= ComorbDate_77.ClientID %>'), $('<%= Comorbidity_77.ClientID %>'), $('<%= ComorbNotes_77.ClientID %>'), $('<%= ComorbSystem_77.ClientID %>'), 'Other');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_78.ClientID %>'), $('<%= ComorbDate_78.ClientID %>'), $('<%= Comorbidity_78.ClientID %>'), $('<%= ComorbNotes_78.ClientID %>'), $('<%= ComorbSystem_78.ClientID %>'), 'Other');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_79.ClientID %>'), $('<%= ComorbDate_79.ClientID %>'), $('<%= Comorbidity_79.ClientID %>'), $('<%= ComorbNotes_79.ClientID %>'), $('<%= ComorbSystem_79.ClientID %>'), 'Other');
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'), $('<%= ComorbDiv.ClientID %>'), $('<%= ComorbAbsentDiv.ClientID %>'), $('<%= ComorbDateText_80.ClientID %>'), $('<%= ComorbDate_80.ClientID %>'), $('<%= Comorbidity_80.ClientID %>'), $('<%= ComorbNotes_80.ClientID %>'), $('<%= ComorbSystem_80.ClientID %>'), 'Other');
 

    function addAbsentEvent(comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID,comorbSystem,systemValue)
    {  
        $(comorbRecordedID).addEvent('click',curry(ComorbYesNo,comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID,comorbSystem,systemValue));
        $(comorbDateTextID).addEvent('blur',curry(ComorbYesNo,comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID,comorbSystem,systemValue));
        $(comorbidityID).addEvent('blur',curry(ComorbYesNo,comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID,comorbSystem,systemValue));
        $(comorbNotesID).addEvent('blur',curry(ComorbYesNo,comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID,comorbSystem,systemValue));

        // check on load as well
        ComorbYesNo(comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID,comorbSystem,systemValue);
    }
   
    /* ]]> */
   
    function ComorbYesNo(comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID,comorbSystem,systemValue)
    {
       var comorbRecordedRef = comorbRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < comorbRecordedRef.length; i++) 
        if (comorbRecordedRef[i].checked) {  
            ComorbRadioClick(comorbRecordedRef[i].value,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID,comorbSystem,systemValue);
            }
    }
    
    function ComorbRadioClick(Comorboption_value,ComorbhideDiv,ComorbhideAbsentDiv,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID,comorbSystem,systemValue)
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
        
        if (systemValue != 'Other')
        {
            if (comorbDateTextID.value != '' || comorbidityID.value != '' || comorbNotesID.value != '')
                comorbSystem.value = systemValue;
            else
                comorbSystem.value = '';
        }
            
      }
      else if (Comorboption_value == "No" || Comorboption_value == "Unknown" || Comorboption_value == "N/A")
      {
        ComorbhideAbsentDiv.style.display='block';
        ComorbhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_1.ClientID %>').value = 'Comorbidities';        
        document.getElementById('<%= FieldName_1.ClientID %>').value = 'Comorbidity';        
        document.getElementById('<%= FieldValue_1.ClientID %>').value = 'Comorbidities'; 
        
        if (Comorboption_value == "No")       
            document.getElementById('<%= AbsentReason_1.ClientID %>').value = 'None Recorded';        
        else if (Comorboption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_1.ClientID %>').value = 'Unknown';
        else if (Comorboption_value == "N/A")
            document.getElementById('<%= AbsentReason_1.ClientID %>').value = 'Not Applicable';

        document.getElementById('<%= AbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_1.ClientID %>').value +  ' as of ';
           
        document.getElementById('<%= AbsentQuality_1.ClientID %>').value = 'OUT';        

        comorbDateTextID.value = '';
        comorbDateID.value = '';
        comorbidityID.value = '';
        comorbNotesID.value = '';   
        comorbSystem.value = '';
     }
    }

</script>