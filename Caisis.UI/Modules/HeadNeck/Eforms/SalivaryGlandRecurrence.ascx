<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandRecurrence" CodeFile="SalivaryGlandRecurrence.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.DiseaseRecurTable = "DiseaseRecurTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="SalivaryGlandRecurrence" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Disease Recurrence"></asp:Label><br/>
  

<table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DiseaseRecurTable">     
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Status</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Location</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Treatment</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  

  <asp:Repeater ID="StatusRptr" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Status', <%# DataBinder.Eval(Container.DataItem, "StatusId") %>, 'StatusDateText,StatusDate,Status,StatusNotes,StatusProbability', 'Status');"> 
			<td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Status")%></td>
			<td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "StatusDateText")%></td>
			<td align="left" class="ClinicalEformPopulatedColumn" colspan="2"><%# DataBinder.Eval(Container.DataItem, "StatusNotes")%>&nbsp;</td>
			<td align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "StatusProbability")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>

  
  <tr>    
    <td height="28" class="ClinicalEformPopulatedColumn" >Local Recurrence</td>
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Width="80px" RecordId="2"  ID="StatusDateText_2" TABLE="Status" FIELD="StatusDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="2"  ID="StatusDate_2" Table="Status" Field="StatusDate" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2" TABLE="Status" FIELD="Status" Runat="server" ID="Status_2"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_2"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_2"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_2"  /></td>
        
    <td align="left" style="white-space: nowrap;" >
        <euc:EformTextBox Width="150px" TABLE="NoTable" FIELD="StatusLocation_2"  ID="StatusLocation_2" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" TABLE="NoTable" FIELD="StatusSide_2"  ID="StatusSide_2" LookupCode="NodeSide" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" RecordId="2" TABLE="Status" FIELD="StatusProbability"  ID="StatusProbability_2" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="None" Text="None" ></asp:ListItem>
            <asp:ListItem Value="Surgery" Text="Surgery" ></asp:ListItem>
            <asp:ListItem Value="RT" Text="RT" ></asp:ListItem>
            <asp:ListItem Value="SurgeryRT" Text="SurgeryRT" ></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT" ></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown" ></asp:ListItem>
        </euc:EformDropDownList></td>
            
    <td align="left" style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_2" runat="server"/>
    </td> 
  </tr>   
  <tr>    
    <td height="28" class="ClinicalEformPopulatedColumn" >Neck Recurrence</td>
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Width="80px" RecordId="3"  ID="StatusDateText_3" TABLE="Status" FIELD="StatusDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="3"  ID="StatusDate_3" Table="Status" Field="StatusDate" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3" TABLE="Status" FIELD="Status" Runat="server" ID="Status_3"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_3"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_3"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_3"  /></td>
        
    <td align="left" style="white-space: nowrap;" >
        <euc:EformExtendedCheckBoxList TABLE="NoTable" FIELD="StatusLocation_3"  ID="StatusLocation_3" Runat="server" RepeatDirection="Horizontal" RepeatColumns="5" RepeatLayout="Flow" >
            <asp:ListItem Text="1" Value="1"></asp:ListItem>
            <asp:ListItem Text="2" Value="2"></asp:ListItem>
            <asp:ListItem Text="3" Value="3"></asp:ListItem>
            <asp:ListItem Text="4" Value="4"></asp:ListItem>
            <asp:ListItem Text="5" Value="5"></asp:ListItem>
            <asp:ListItem Text="6" Value="6"></asp:ListItem>
            <asp:ListItem Text="7" Value="7"></asp:ListItem>
            <asp:ListItem Text="Unknown" Value="Unknown"></asp:ListItem>       
        </euc:EformExtendedCheckBoxList></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" TABLE="NoTable" FIELD="StatusSide_3"  ID="StatusSide_3" LookupCode="NodeSide" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" RecordId="3" TABLE="Status" FIELD="StatusProbability"  ID="StatusProbability_3" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="None" Text="None" ></asp:ListItem>
            <asp:ListItem Value="Surgery" Text="Surgery" ></asp:ListItem>
            <asp:ListItem Value="RT" Text="RT" ></asp:ListItem>
            <asp:ListItem Value="SurgeryRT" Text="SurgeryRT" ></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT" ></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown" ></asp:ListItem>
        </euc:EformDropDownList></td>
            
    <td align="left" style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_3" runat="server"/>
    </td> 
  </tr>   
  <tr>    
    <td height="28" class="ClinicalEformPopulatedColumn" valign="top" >Distant Metastasis</td>
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" valign="top">        
        <euc:EformTextBox Width="80px" RecordId="4"  ID="StatusDateText_4" TABLE="Status" FIELD="StatusDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="4"  ID="StatusDate_4" Table="Status" Field="StatusDate" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" TABLE="Status" FIELD="Status" Runat="server" ID="Status_4"  />
        <%--<euc:EformTextBox Width="1px" style="display: none;" RecordId="4" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_4"  />--%>
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_4"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_4"  /></td>
        
    <td align="left" style="white-space: nowrap;" colspan="2" valign="top">
        <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="260px" style="white-space: nowrap;" RecordId="4" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_4"  Runat="server" LookupCode="DxTarget,Disease,SalivaryCancer" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table" /></td>
    <%--<td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" TABLE="NoTable" FIELD="StatusSide_4"  ID="StatusSide_4" LookupCode="NodeSide" Runat="server" /></td>--%>
    <td align="left" style="white-space: nowrap;" valign="top">
        <euc:EformDropDownList Width="100px" RecordId="4" TABLE="Status" FIELD="StatusProbability"  ID="StatusProbability_4" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="None" Text="None" ></asp:ListItem>
            <asp:ListItem Value="Surgery" Text="Surgery" ></asp:ListItem>
            <asp:ListItem Value="RT" Text="RT" ></asp:ListItem>
            <asp:ListItem Value="SurgeryRT" Text="SurgeryRT" ></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT" ></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown" ></asp:ListItem>
        </euc:EformDropDownList></td>
            
    <td align="left" style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_4" runat="server"/>
    </td> 
  </tr>  
   
   <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Other</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr >    
    <td height="28" class="ClinicalEformPopulatedColumn" >
        <euc:EformComboBox DropDownWidth="350px" Width="120px"  RecordId="5" TABLE="Status" FIELD="Status" Runat="server" ID="Status_5" LookupCode="Status"  /></td>
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Width="80px" RecordId="5"  ID="StatusDateText_5" TABLE="Status" FIELD="StatusDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="5"  ID="StatusDate_5" Table="Status" Field="StatusDate" Runat="server" />
        
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_5"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_5"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_5"  /></td>
        
    <td align="left" style="white-space: nowrap;" >
        <euc:EformTextBox Width="150px" TABLE="NoTable" FIELD="StatusLocation_5"  ID="StatusLocation_5" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" TABLE="NoTable" FIELD="StatusSide_5"  ID="StatusSide_5" LookupCode="NodeSide" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" RecordId="5" TABLE="Status" FIELD="StatusProbability"  ID="StatusProbability_5" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="None" Text="None" ></asp:ListItem>
            <asp:ListItem Value="Surgery" Text="Surgery" ></asp:ListItem>
            <asp:ListItem Value="RT" Text="RT" ></asp:ListItem>
            <asp:ListItem Value="SurgeryRT" Text="SurgeryRT" ></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT" ></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown" ></asp:ListItem>
        </euc:EformDropDownList></td>
            
    <td align="left" style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_5" runat="server"/>
    </td> 
  </tr> 
  <tr style="display: none;">    
    <td height="28" class="ClinicalEformPopulatedColumn" >
        <euc:EformComboBox DropDownWidth="350px" Width="120px"  RecordId="6" TABLE="Status" FIELD="Status" Runat="server" ID="Status_6" LookupCode="Status"  /></td>
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Width="80px" RecordId="6"  ID="StatusDateText_6" TABLE="Status" FIELD="StatusDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="6"  ID="StatusDate_6" Table="Status" Field="StatusDate" Runat="server" />
        
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="6" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_6"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="6" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_6"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="6" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_6"  /></td>
        
    <td align="left" style="white-space: nowrap;" >
        <euc:EformTextBox Width="150px" TABLE="NoTable" FIELD="StatusLocation_6"  ID="StatusLocation_6" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" TABLE="NoTable" FIELD="StatusSide_6"  ID="StatusSide_6" LookupCode="NodeSide" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" RecordId="6" TABLE="Status" FIELD="StatusProbability"  ID="StatusProbability_6" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="None" Text="None" ></asp:ListItem>
            <asp:ListItem Value="Surgery" Text="Surgery" ></asp:ListItem>
            <asp:ListItem Value="RT" Text="RT" ></asp:ListItem>
            <asp:ListItem Value="SurgeryRT" Text="SurgeryRT" ></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT" ></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown" ></asp:ListItem>
        </euc:EformDropDownList></td>
            
    <td align="left" style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_6" runat="server"/>
    </td> 
  </tr> 
  <tr style="display: none;">    
    <td height="28" class="ClinicalEformPopulatedColumn" >
        <euc:EformComboBox DropDownWidth="350px" Width="120px"  RecordId="7" TABLE="Status" FIELD="Status" Runat="server" ID="Status_7" LookupCode="Status"  /></td>
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Width="80px" RecordId="7"  ID="StatusDateText_7" TABLE="Status" FIELD="StatusDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="7"  ID="StatusDate_7" Table="Status" Field="StatusDate" Runat="server" />
        
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="7" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_7"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="7" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_7"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="7" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_7"  /></td>
        
    <td align="left" style="white-space: nowrap;" >
        <euc:EformTextBox Width="150px" TABLE="NoTable" FIELD="StatusLocation_7"  ID="StatusLocation_7" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" TABLE="NoTable" FIELD="StatusSide_7"  ID="StatusSide_7" LookupCode="NodeSide" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" RecordId="7" TABLE="Status" FIELD="StatusProbability"  ID="StatusProbability_7" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="None" Text="None" ></asp:ListItem>
            <asp:ListItem Value="Surgery" Text="Surgery" ></asp:ListItem>
            <asp:ListItem Value="RT" Text="RT" ></asp:ListItem>
            <asp:ListItem Value="SurgeryRT" Text="SurgeryRT" ></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT" ></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown" ></asp:ListItem>
        </euc:EformDropDownList></td>
            
    <td align="left" style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_7" runat="server"/>
    </td> 
  </tr> 
  <tr style="display: none;">    
    <td height="28" class="ClinicalEformPopulatedColumn" >
        <euc:EformComboBox DropDownWidth="350px" Width="120px"  RecordId="8" TABLE="Status" FIELD="Status" Runat="server" ID="Status_8" LookupCode="Status"  /></td>
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Width="80px" RecordId="8"  ID="StatusDateText_8" TABLE="Status" FIELD="StatusDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="8"  ID="StatusDate_8" Table="Status" Field="StatusDate" Runat="server" />
        
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="8" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_8"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="8" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_8"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="8" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_8"  /></td>
        
    <td align="left" style="white-space: nowrap;" >
        <euc:EformTextBox Width="150px" TABLE="NoTable" FIELD="StatusLocation_8"  ID="StatusLocation_8" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" TABLE="NoTable" FIELD="StatusSide_8"  ID="StatusSide_8" LookupCode="NodeSide" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" RecordId="8" TABLE="Status" FIELD="StatusProbability"  ID="StatusProbability_8" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="None" Text="None" ></asp:ListItem>
            <asp:ListItem Value="Surgery" Text="Surgery" ></asp:ListItem>
            <asp:ListItem Value="RT" Text="RT" ></asp:ListItem>
            <asp:ListItem Value="SurgeryRT" Text="SurgeryRT" ></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT" ></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown" ></asp:ListItem>
        </euc:EformDropDownList></td>
            
    <td align="left" style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_8" runat="server"/>
    </td> 
  </tr> 
  <tr style="display: none;">    
    <td height="28" class="ClinicalEformPopulatedColumn" >
        <euc:EformComboBox DropDownWidth="350px" Width="120px"  RecordId="9" TABLE="Status" FIELD="Status" Runat="server" ID="Status_9" LookupCode="Status"  /></td>
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Width="80px" RecordId="9"  ID="StatusDateText_9" TABLE="Status" FIELD="StatusDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="9"  ID="StatusDate_9" Table="Status" Field="StatusDate" Runat="server" />
        
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="9" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_9"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="9" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_9"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="9" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_9"  /></td>
        
    <td align="left" style="white-space: nowrap;" >
        <euc:EformTextBox Width="150px" TABLE="NoTable" FIELD="StatusLocation_9"  ID="StatusLocation_9" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" TABLE="NoTable" FIELD="StatusSide_9"  ID="StatusSide_9" LookupCode="NodeSide" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" RecordId="9" TABLE="Status" FIELD="StatusProbability"  ID="StatusProbability_9" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="None" Text="None" ></asp:ListItem>
            <asp:ListItem Value="Surgery" Text="Surgery" ></asp:ListItem>
            <asp:ListItem Value="RT" Text="RT" ></asp:ListItem>
            <asp:ListItem Value="SurgeryRT" Text="SurgeryRT" ></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT" ></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown" ></asp:ListItem>
        </euc:EformDropDownList></td>
            
    <td align="left" style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_9" runat="server"/>
    </td> 
  </tr> 
  <tr style="display: none;">    
    <td height="28" class="ClinicalEformPopulatedColumn" >
        <euc:EformComboBox DropDownWidth="350px" Width="120px"  RecordId="10" TABLE="Status" FIELD="Status" Runat="server" ID="Status_10" LookupCode="Status"  /></td>
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Width="80px" RecordId="10"  ID="StatusDateText_10" TABLE="Status" FIELD="StatusDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="10"  ID="StatusDate_10" Table="Status" Field="StatusDate" Runat="server" />
        
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="10" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_10"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="10" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_10"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="10" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_10"  /></td>
        
    <td align="left" style="white-space: nowrap;" >
        <euc:EformTextBox Width="150px" TABLE="NoTable" FIELD="StatusLocation_10"  ID="StatusLocation_10" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" TABLE="NoTable" FIELD="StatusSide_10"  ID="StatusSide_10" LookupCode="NodeSide" Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="100px" RecordId="10" TABLE="Status" FIELD="StatusProbability"  ID="StatusProbability_10" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="None" Text="None" ></asp:ListItem>
            <asp:ListItem Value="Surgery" Text="Surgery" ></asp:ListItem>
            <asp:ListItem Value="RT" Text="RT" ></asp:ListItem>
            <asp:ListItem Value="SurgeryRT" Text="SurgeryRT" ></asp:ListItem>
            <asp:ListItem Value="ChemoRT" Text="ChemoRT" ></asp:ListItem>
            <asp:ListItem Value="Unknown" Text="Unknown" ></asp:ListItem>
        </euc:EformDropDownList></td>
            
    <td align="left" style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_10" runat="server"/>
    </td> 
  </tr> 
  
  
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DiseaseRecurTable');" />
<br/><br/><br />

<script type="text/javascript">
    /* <![CDATA[ */
 
    addAbsentEventLocalRecurrence($('<%= StatusDateText_2.ClientID %>'),$('<%= StatusDate_2.ClientID %>'),$('<%= Status_2.ClientID %>'),$('<%= StatusNotes_2.ClientID %>'),$('<%= StatusDisease_2.ClientID %>'),$('<%= StatusQuality_2.ClientID %>'),$('<%= StatusLocation_2.ClientID %>'),$('<%= StatusSide_2.ClientID %>'),$('<%= StatusProbability_2.ClientID %>'));
   
    function addAbsentEventLocalRecurrence(dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability)
    {  
        $(dateText).addEvent('blur',curry(SetHiddenFieldsLocalR,dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
        $(location).addEvent('blur',curry(SetHiddenFieldsLocalR,dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
        $(side).addEvent('blur',curry(SetHiddenFieldsLocalR,dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
        $(probability).addEvent('blur',curry(SetHiddenFieldsLocalR,dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
    }

   
    /* ]]> */
    
    function SetHiddenFieldsLocalR(dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability)
	{
	    if (dateText.value != '' || location.value != ''  || side.value != ''  || probability.value != '' )
	    {
	        statusHidden.value = 'Local Recurrence';
	        diseaseHidden.value = 'Salivary Cancer';
	        qualityHidden.value = 'STD';
	        
	        statusNotesHidden.value = '';
	        
	        if (location.value != '')
	           statusNotesHidden.value =  statusNotesHidden.value + "Location: " + location.value + " ||| ";
	        if (side.value != '')
	           statusNotesHidden.value =  statusNotesHidden.value + "Side: " + side.value + " ||| ";
	    }
	    else
	    {
	        statusHidden.value = '';
	        diseaseHidden.value = '';
	        qualityHidden.value = '';    
	        statusNotesHidden.value = '';
	    }
	}
	
	/********************************************************************************/
	/********************************************************************************/
	/********************************************************************************/

    addAbsentEventNeckRecurrence($('<%= StatusDateText_3.ClientID %>'),$('<%= StatusDate_3.ClientID %>'),$('<%= Status_3.ClientID %>'),$('<%= StatusNotes_3.ClientID %>'),$('<%= StatusDisease_3.ClientID %>'),$('<%= StatusQuality_3.ClientID %>'),$('<%= StatusLocation_3.ClientID %>'),$('<%= StatusSide_3.ClientID %>'),$('<%= StatusProbability_3.ClientID %>'));
   
    function addAbsentEventNeckRecurrence(dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability)
    {  
        $(dateText).addEvent('blur',curry(SetHiddenFieldsNeckR,dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
        
        var cbl = location.getElementsByTagName('input');
        for (var j = 0; j < cbl.length; j++)
        {
            var cblRef = cbl[j];
            if (cblRef.type == 'checkbox')
                  $(cblRef).addEvent('click',curry(SetHiddenFieldsNeckR,dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
            else if (cblRef.type == 'text')
                  $(cblRef).addEvent('blur',curry(SetHiddenFieldsNeckR,dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
        } 
        
        $(side).addEvent('blur',curry(SetHiddenFieldsNeckR,dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
        $(probability).addEvent('blur',curry(SetHiddenFieldsNeckR,dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
    }

   
    /* ]]> */
    
    function SetHiddenFieldsNeckR(dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability)
	{
	    var locationString = RetrieveCheckBoxListSelectedValues (location,"FLOW");
	    
	    if (dateText.value != '' || locationString != ''  || side.value != ''  || probability.value != '' )
	    {
	        statusHidden.value = 'Neck Recurrence';
	        diseaseHidden.value = 'Salivary Cancer';
	        qualityHidden.value = 'STD';
	        
	        statusNotesHidden.value = '';
	        
	        if (location.value != '')
	           statusNotesHidden.value =  statusNotesHidden.value + "Location: Level " + locationString + " ||| ";
	        if (side.value != '')
	           statusNotesHidden.value =  statusNotesHidden.value + "Side: " + side.value + " ||| ";
	    }
	    else
	    {
	        statusHidden.value = '';
	        diseaseHidden.value = '';
	        qualityHidden.value = '';    
	        statusNotesHidden.value = '';
	    }
	}

	/********************************************************************************/
	/********************************************************************************/
	/********************************************************************************/

    addAbsentEventDistantMets($('<%= StatusDateText_4.ClientID %>'),$('<%= StatusDate_4.ClientID %>'),$('<%= Status_4.ClientID %>'),$('<%= StatusNotes_4.ClientID %>'),$('<%= StatusDisease_4.ClientID %>'),$('<%= StatusQuality_4.ClientID %>'),$('<%= StatusProbability_4.ClientID %>'));
   
    function addAbsentEventDistantMets(dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,probability)
    {  
        $(dateText).addEvent('blur',curry(SetHiddenFieldsNeckR,dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,probability));
        $(probability).addEvent('blur',curry(SetHiddenFieldsNeckR,dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,probability));
    }

   
    /* ]]> */
    
    function SetHiddenFieldsNeckR(dateText,date,statusHidden,statusNotesHidden,diseaseHidden,qualityHidden,probability)
	{   
	    if (dateText.value != '' || probability.value != '' )
	    {
	        statusHidden.value = 'Distant Metastasis';
	        diseaseHidden.value = 'Salivary Cancer';
	        qualityHidden.value = 'STD';
	    }
	    else
	    {
	        statusHidden.value = '';
	        diseaseHidden.value = '';
	        qualityHidden.value = '';    
	    }
	}	
	
	/********************************************************************************/
	/********************************************************************************/
	/********************************************************************************/

    addAbsentEventOtherRecurrence($('<%= StatusDateText_5.ClientID %>'),$('<%= StatusDate_5.ClientID %>'),$('<%= Status_5.ClientID %>'),$('<%= StatusNotes_5.ClientID %>'),$('<%= StatusDisease_5.ClientID %>'),$('<%= StatusQuality_5.ClientID %>'),$('<%= StatusLocation_5.ClientID %>'),$('<%= StatusSide_5.ClientID %>'),$('<%= StatusProbability_5.ClientID %>'));
    addAbsentEventOtherRecurrence($('<%= StatusDateText_6.ClientID %>'),$('<%= StatusDate_6.ClientID %>'),$('<%= Status_6.ClientID %>'),$('<%= StatusNotes_6.ClientID %>'),$('<%= StatusDisease_6.ClientID %>'),$('<%= StatusQuality_6.ClientID %>'),$('<%= StatusLocation_6.ClientID %>'),$('<%= StatusSide_6.ClientID %>'),$('<%= StatusProbability_6.ClientID %>'));
    addAbsentEventOtherRecurrence($('<%= StatusDateText_7.ClientID %>'),$('<%= StatusDate_7.ClientID %>'),$('<%= Status_7.ClientID %>'),$('<%= StatusNotes_7.ClientID %>'),$('<%= StatusDisease_7.ClientID %>'),$('<%= StatusQuality_7.ClientID %>'),$('<%= StatusLocation_7.ClientID %>'),$('<%= StatusSide_7.ClientID %>'),$('<%= StatusProbability_7.ClientID %>'));
    addAbsentEventOtherRecurrence($('<%= StatusDateText_8.ClientID %>'),$('<%= StatusDate_8.ClientID %>'),$('<%= Status_8.ClientID %>'),$('<%= StatusNotes_8.ClientID %>'),$('<%= StatusDisease_8.ClientID %>'),$('<%= StatusQuality_8.ClientID %>'),$('<%= StatusLocation_8.ClientID %>'),$('<%= StatusSide_8.ClientID %>'),$('<%= StatusProbability_8.ClientID %>'));
    addAbsentEventOtherRecurrence($('<%= StatusDateText_9.ClientID %>'),$('<%= StatusDate_9.ClientID %>'),$('<%= Status_9.ClientID %>'),$('<%= StatusNotes_9.ClientID %>'),$('<%= StatusDisease_9.ClientID %>'),$('<%= StatusQuality_9.ClientID %>'),$('<%= StatusLocation_9.ClientID %>'),$('<%= StatusSide_9.ClientID %>'),$('<%= StatusProbability_9.ClientID %>'));
    addAbsentEventOtherRecurrence($('<%= StatusDateText_10.ClientID %>'),$('<%= StatusDate_10.ClientID %>'),$('<%= Status_10.ClientID %>'),$('<%= StatusNotes_10.ClientID %>'),$('<%= StatusDisease_10.ClientID %>'),$('<%= StatusQuality_10.ClientID %>'),$('<%= StatusLocation_10.ClientID %>'),$('<%= StatusSide_10.ClientID %>'),$('<%= StatusProbability_10.ClientID %>'));
   
    function addAbsentEventOtherRecurrence(dateText,date,status,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability)
    {  
        $(status).addEvent('blur',curry(SetHiddenFieldsOtherR,dateText,date,status,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
        $(dateText).addEvent('blur',curry(SetHiddenFieldsOtherR,dateText,date,status,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
        $(location).addEvent('blur',curry(SetHiddenFieldsOtherR,dateText,date,status,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
        $(side).addEvent('blur',curry(SetHiddenFieldsOtherR,dateText,date,status,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
        $(probability).addEvent('blur',curry(SetHiddenFieldsOtherR,dateText,date,status,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability));
    }

   
    /* ]]> */
    
    function SetHiddenFieldsOtherR(dateText,date,status,statusNotesHidden,diseaseHidden,qualityHidden,location,side,probability)
	{
	    if (status.value != '' || dateText.value != '' || location.value != ''  || side.value != ''  || probability.value != '' )
	    {
	        diseaseHidden.value = 'Salivary Cancer';
	        qualityHidden.value = 'STD';
	        
	        statusNotesHidden.value = '';
	        
	        if (location.value != '')
	           statusNotesHidden.value =  statusNotesHidden.value + "Location: " + location.value + " ||| ";
	        if (side.value != '')
	           statusNotesHidden.value =  statusNotesHidden.value + "Side: " + side.value + " ||| ";
	    }
	    else
	    {
	        diseaseHidden.value = '';
	        qualityHidden.value = '';    
	        statusNotesHidden.value = '';
	    }
	}

</script>