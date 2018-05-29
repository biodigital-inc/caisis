<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusSurgeryLabTests" CodeFile="EsophagusSurgeryLabTests.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.OtherLabTestsHtmlTable = "OtherLabTestsHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="EsophagusSurgeryLabTests" /><br/>

<table class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Lab History"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="LabHxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="LabHxRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="LabHxAbsentDiv" runat="server" style="display: none;" >
<br /><br /> 
    <table class="eformLargePopulatedTable">
        <tr>
           <td><strong> <asp:Label ID="LabHxAbsentEventPrefix" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_14"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="14" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_14"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td>(Optional)</td>
        </tr>
</table>

</div>
                 
<div id="LabHxDiv" runat="server" style="display: none;">
<br />

    <asp:Repeater ID="OtherLabTests" runat="server" OnItemDataBound="EFormRepeaterOnDataBoundForOther">
        <HeaderTemplate>
            <br /><strong>Lab Test History</strong>
            <table width="650" cellpadding="10" cellspacing="0" class="ClinicalEformTable" id="Table1">
		        <tr><td align="center" colspan="5"><i><asp:Literal ID="MostRecentMsg" Runat="server" Visible="false" Text="(most recent distinct labs)" /></i></td></tr>	    
        </HeaderTemplate>        
      <ItemTemplate>
        <tr >
		    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: left; display: none; ">Quality</td>
        </tr>
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'labDateText,labDate,labTest,labResult,labUnits,labQuality,labNotes,risingFalling,userNotes,LabUnits,LabQuality', 'LabTests');"> 
				<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
				<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;</td>
				<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
				<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabUnits") %>&nbsp;</td>
				<td class="ClinicalEformPopulatedColumn" style="display: none; " ><%# DataBinder.Eval(Container.DataItem, "LabQuality") %>&nbsp;</td>
        </tr>
        
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'labDateText,labDate,labTest,labResult,labUnits,labQuality,labNotes,risingFalling,userNotes,LabUnits,LabQuality', 'LabTests');"> 
            <td colspan="5" class="ClinicalEformPopulatedColumn">
                Notes:&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabNotes")%>
            </td>
        </tr>
    </ItemTemplate>
         <SeparatorTemplate>
            <tr><td colspan="5" height="20">&nbsp;</td></tr>
         </SeparatorTemplate>
        <FooterTemplate>
              </table>
        </FooterTemplate>
    </asp:Repeater>

<br /><strong>Add Lab Tests</strong>
<table cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OtherLabTestsHtmlTable">

         <tr >
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_1" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_1" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;   ">Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="1"  ID="LabDateText_1" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="1"  ID="LabDate_1"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="1"  ID="LabTest_1"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="1"  ID="LabResult_1"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="1"  ID="LabUnits_1"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td style="white-space: nowrap;   ">
                                            <euc:EformComboBox   style="width: 80px;" RecordId="1"  ID="LabQuality_1"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_1a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="1"  ID="LabNotes_1"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_1b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; "  >
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_2" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_2" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="2"  ID="LabDateText_2" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="2"  ID="LabDate_2"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="2"  ID="LabTest_2"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="2"  ID="LabResult_2"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="2"  ID="LabUnits_2"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td   >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="2"  ID="LabQuality_2"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_2a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">

                                            <euc:EformTextBox Width="600px" RecordId="2"  ID="LabNotes_2"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_2b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; " >
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_3" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_3" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="3"  ID="LabDateText_3" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="3"  ID="LabDate_3"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="3"  ID="LabTest_3"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="3"  ID="LabResult_3"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="3"  ID="LabUnits_3"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="3"  ID="LabQuality_3"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_3a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="3"  ID="LabNotes_3"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_3b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_4" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_4" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="4"  ID="LabDateText_4" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="4"  ID="LabDate_4"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="4"  ID="LabTest_4"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="4"  ID="LabResult_4"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="4"  ID="LabUnits_4"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="4"  ID="LabQuality_4"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_4a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="4"  ID="LabNotes_4"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_4b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_5" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_5" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="5"  ID="LabDateText_5" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="5"  ID="LabDate_5"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="5"  ID="LabTest_5"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="5"  ID="LabResult_5"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="5"  ID="LabUnits_5"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="5"  ID="LabQuality_5"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_5a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="5"  ID="LabNotes_5"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_5b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_6" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_6" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="6"  ID="LabDateText_6" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="6"  ID="LabDate_6"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="6"  ID="LabTest_6"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="6"  ID="LabResult_6"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="6"  ID="LabUnits_6"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="6"  ID="LabQuality_6"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_6a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="6"  ID="LabNotes_6"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_6b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_7" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_7" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="7"  ID="LabDateText_7" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="7"  ID="LabDate_7"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="7"  ID="LabTest_7"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="7"  ID="LabResult_7"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="7"  ID="LabUnits_7"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="7"  ID="LabQuality_7"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_7a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="7"  ID="LabNotes_7"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_7b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_8" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_8" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="8"  ID="LabDateText_8" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="8"  ID="LabDate_8"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="8"  ID="LabTest_8"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="8"  ID="LabResult_8"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="8"  ID="LabUnits_8"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="8"  ID="LabQuality_8"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_8a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="8"  ID="LabNotes_8"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_8b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_9" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_9" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="9"  ID="LabDateText_9" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="9"  ID="LabDate_9"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="9"  ID="LabTest_9"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="9"  ID="LabResult_9"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="9"  ID="LabUnits_9"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="9"  ID="LabQuality_9"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_9a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="9"  ID="LabNotes_9"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_9b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_10" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_10" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="10"  ID="LabDateText_10" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="10"  ID="LabDate_10"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="10"  ID="LabTest_10"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="10"  ID="LabResult_10"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="10"  ID="LabUnits_10"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="10"  ID="LabQuality_10"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_10a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="10"  ID="LabNotes_10"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_10b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_11" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_11" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="11"  ID="LabDateText_11" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="11"  ID="LabDate_11"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="11"  ID="LabTest_11"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="11"  ID="LabResult_11"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="11"  ID="LabUnits_11"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="11"  ID="LabQuality_11"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_11a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="11"  ID="LabNotes_11"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_11b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_12" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_12" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="12"  ID="LabDateText_12" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="12"  ID="LabDate_12"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="12"  ID="LabTest_12"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="12"  ID="LabResult_12"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="12"  ID="LabUnits_12"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="12"  ID="LabQuality_12"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_12a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="12"  ID="LabNotes_12"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_12b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_13" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_13" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="13"  ID="LabDateText_13" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="13"  ID="LabDate_13"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="13"  ID="LabTest_13"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="13"  ID="LabResult_13"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="13"  ID="LabUnits_13"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="13"  ID="LabQuality_13"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_13a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="13"  ID="LabNotes_13"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_13b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_14" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_14" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="14"  ID="LabDateText_14" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="14"  ID="LabDate_14"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="14"  ID="LabTest_14"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="14"  ID="LabResult_14"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="14"  ID="LabUnits_14"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="14"  ID="LabQuality_14"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_14a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="14"  ID="LabNotes_14"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_14b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_15" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_15" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="15"  ID="LabDateText_15" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="15"  ID="LabDate_15"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="15"  ID="LabTest_15"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="15"  ID="LabResult_15"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="15"  ID="LabUnits_15"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="15"  ID="LabQuality_15"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_15a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="15"  ID="LabNotes_15"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_15b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_16" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_16" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="16"  ID="LabDateText_16" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="16"  ID="LabDate_16"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="16"  ID="LabTest_16"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="16"  ID="LabResult_16"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="16"  ID="LabUnits_16"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="16"  ID="LabQuality_16"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_16a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="16"  ID="LabNotes_16"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_16b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_17" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_17" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="17"  ID="LabDateText_17" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="17"  ID="LabDate_17"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="17"  ID="LabTest_17"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="17"  ID="LabResult_17"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="17"  ID="LabUnits_17"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="17"  ID="LabQuality_17"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_17a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="17"  ID="LabNotes_17"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_17b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_18" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_18" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="18"  ID="LabDateText_18" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="18"  ID="LabDate_18"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="18"  ID="LabTest_18"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="18"  ID="LabResult_18"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="18"  ID="LabUnits_18"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="18"  ID="LabQuality_18"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_18a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="18"  ID="LabNotes_18"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_18b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_19" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_19" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="19"  ID="LabDateText_19" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="19"  ID="LabDate_19"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="19"  ID="LabTest_19"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="19"  ID="LabResult_19"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="19"  ID="LabUnits_19"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="19"  ID="LabQuality_19"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_19a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="19"  ID="LabNotes_19"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_19b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_20" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_20" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="20"  ID="LabDateText_20" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="20"  ID="LabDate_20"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="20"  ID="LabTest_20"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="20"  ID="LabResult_20"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="20"  ID="LabUnits_20"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td sstyle="display: none; ">
                                            <euc:EformComboBox   style="width: 80px;" RecordId="20"  ID="LabQuality_20"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_20a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="20"  ID="LabNotes_20"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_20b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_21" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_21" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="21"  ID="LabDateText_21" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="21"  ID="LabDate_21"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="21"  ID="LabTest_21"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="21"  ID="LabResult_21"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="21"  ID="LabUnits_21"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="21"  ID="LabQuality_21"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_21a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="21"  ID="LabNotes_21"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_21b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_22" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_22" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="22"  ID="LabDateText_22" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="22"  ID="LabDate_22"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="22"  ID="LabTest_22"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="22"  ID="LabResult_22"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="22"  ID="LabUnits_22"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="22"  ID="LabQuality_22"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_22a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="22"  ID="LabNotes_22"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_22b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_23" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_23" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="23"  ID="LabDateText_23" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="23"  ID="LabDate_23"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="23"  ID="LabTest_23"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="23"  ID="LabResult_23"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="23"  ID="LabUnits_23"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="23"  ID="LabQuality_23"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_23a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="23"  ID="LabNotes_23"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_23b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_24" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_24" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="24"  ID="LabDateText_24" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="24"  ID="LabDate_24"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="24"  ID="LabTest_24"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="24"  ID="LabResult_24"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="24"  ID="LabUnits_24"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="24"  ID="LabQuality_24"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_24a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="24"  ID="LabNotes_24"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_24b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_25" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_25" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="25"  ID="LabDateText_25" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="25"  ID="LabDate_25"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="25"  ID="LabTest_25"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="25"  ID="LabResult_25"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="25"  ID="LabUnits_25"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="25"  ID="LabQuality_25"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_25a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="25"  ID="LabNotes_25"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_25b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_26" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_26" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="26"  ID="LabDateText_26" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="26"  ID="LabDate_26"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="26"  ID="LabTest_26"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="26"  ID="LabResult_26"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="26"  ID="LabUnits_26"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="26"  ID="LabQuality_26"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_26a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="26"  ID="LabNotes_26"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_26b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_27" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_27" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="27"  ID="LabDateText_27" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="27"  ID="LabDate_27"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="27"  ID="LabTest_27"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="27"  ID="LabResult_27"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="27"  ID="LabUnits_27"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="27"  ID="LabQuality_27"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_27a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="27"  ID="LabNotes_27"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_27b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_28" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_28" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="28"  ID="LabDateText_28" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="28"  ID="LabDate_28"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="28"  ID="LabTest_28"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="28"  ID="LabResult_28"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="28"  ID="LabUnits_28"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="28"  ID="LabQuality_28"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_28a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="28"  ID="LabNotes_28"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_28b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_29" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_29" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="29"  ID="LabDateText_29" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="29"  ID="LabDate_29"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="29"  ID="LabTest_29"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="29"  ID="LabResult_29"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="29"  ID="LabUnits_29"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="29"  ID="LabQuality_29"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_29a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="29"  ID="LabNotes_29"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_29b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>

         <tr style="display: none; ">
            <td style="padding-bottom: 20px;">
                <table id="LabTestHtmlTable_30" class="LabTestTable" >
                    <tr>
                        <td>
                            <table width="680" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="LabTestChildHTMLTable_30" style="margin-top: 5px;">

	                            <tr> 
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
		                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Units</td>
		                            <td class="controlBoxDataGridHeaderFirstCol"   >Quality</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr > 
                                    <td height="28" class="ClinicalEformGridColumnOne">
			                                <euc:EformTextBox  style="width:80px;"  RecordId="30"  ID="LabDateText_30" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			                                <euc:EformHidden   style="width:80px;"  RecordId="30"  ID="LabDate_30"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox DropDownWidth="auto" style="width:80px;"  RecordId="30"  ID="LabTest_30"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest,Disease,GI" Runat="server" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformTextBox  style="width:80px;"  RecordId="30"  ID="LabResult_30"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
                                    <td style="white-space: nowrap;">
                                            <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="30"  ID="LabUnits_30"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
                                    <td  >
                                            <euc:EformComboBox   style="width: 80px;" RecordId="30"  ID="LabQuality_30"  TABLE="LabTests" FIELD="LabQuality"  LookupCode="DataQuality" DropDownWidth="auto"   Runat="server" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_30a" runat="server" /></td>
                              </tr>
	                            <tr> 
		                            
		                            <td colspan="5"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
		                            <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	                            </tr>
  	                            <tr> 
                                     <td colspan="5" style="white-space: nowrap;">
                                            <euc:EformTextBox Width="600px" RecordId="30"  ID="LabNotes_30"  TABLE="LabTests" FIELD="LabNotes"  Runat="server" ShowTextEditor="true" /></td>
                                   <td><euc:EformDeleteIcon ID="EformDeleteIcon_30b" runat="server" /></td>
                               </tr>

                            </table>
                        </td>
                    </tr>
                </table>               
            </td>
        </tr>


</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OtherLabTestsHtmlTable');" />
</div>
<br/><br/><br/>
<table>
    <tr id="LabHxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="TableName" ID="TableName_14"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="FieldName" ID="FieldName_14"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_14"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_14"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_14"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
  <script type="text/javascript">

    //Adds blur event to combo
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_1.ClientID %>'), $('<%= LabDate_1.ClientID %>'), $('<%= LabTest_1.ClientID %>'), $('<%= LabResult_1.ClientID %>'), $('<%= LabQuality_1.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_2.ClientID %>'), $('<%= LabDate_2.ClientID %>'), $('<%= LabTest_2.ClientID %>'), $('<%= LabResult_2.ClientID %>'), $('<%= LabQuality_2.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_3.ClientID %>'), $('<%= LabDate_3.ClientID %>'), $('<%= LabTest_3.ClientID %>'), $('<%= LabResult_3.ClientID %>'), $('<%= LabQuality_3.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_4.ClientID %>'), $('<%= LabDate_4.ClientID %>'), $('<%= LabTest_4.ClientID %>'), $('<%= LabResult_4.ClientID %>'), $('<%= LabQuality_4.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_5.ClientID %>'), $('<%= LabDate_5.ClientID %>'), $('<%= LabTest_5.ClientID %>'), $('<%= LabResult_5.ClientID %>'), $('<%= LabQuality_5.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_6.ClientID %>'), $('<%= LabDate_6.ClientID %>'), $('<%= LabTest_6.ClientID %>'), $('<%= LabResult_6.ClientID %>'), $('<%= LabQuality_6.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_7.ClientID %>'), $('<%= LabDate_7.ClientID %>'), $('<%= LabTest_7.ClientID %>'), $('<%= LabResult_7.ClientID %>'), $('<%= LabQuality_7.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_8.ClientID %>'), $('<%= LabDate_8.ClientID %>'), $('<%= LabTest_8.ClientID %>'), $('<%= LabResult_8.ClientID %>'), $('<%= LabQuality_8.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_9.ClientID %>'), $('<%= LabDate_9.ClientID %>'), $('<%= LabTest_9.ClientID %>'), $('<%= LabResult_9.ClientID %>'), $('<%= LabQuality_9.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_10.ClientID %>'), $('<%= LabDate_10.ClientID %>'), $('<%= LabTest_10.ClientID %>'), $('<%= LabResult_10.ClientID %>'), $('<%= LabQuality_10.ClientID %>'));

      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_11.ClientID %>'), $('<%= LabDate_11.ClientID %>'), $('<%= LabTest_11.ClientID %>'), $('<%= LabResult_11.ClientID %>'), $('<%= LabQuality_11.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_12.ClientID %>'), $('<%= LabDate_12.ClientID %>'), $('<%= LabTest_12.ClientID %>'), $('<%= LabResult_12.ClientID %>'), $('<%= LabQuality_12.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_13.ClientID %>'), $('<%= LabDate_13.ClientID %>'), $('<%= LabTest_13.ClientID %>'), $('<%= LabResult_13.ClientID %>'), $('<%= LabQuality_13.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_14.ClientID %>'), $('<%= LabDate_14.ClientID %>'), $('<%= LabTest_14.ClientID %>'), $('<%= LabResult_14.ClientID %>'), $('<%= LabQuality_14.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_15.ClientID %>'), $('<%= LabDate_15.ClientID %>'), $('<%= LabTest_15.ClientID %>'), $('<%= LabResult_15.ClientID %>'), $('<%= LabQuality_15.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_16.ClientID %>'), $('<%= LabDate_16.ClientID %>'), $('<%= LabTest_16.ClientID %>'), $('<%= LabResult_16.ClientID %>'), $('<%= LabQuality_16.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_17.ClientID %>'), $('<%= LabDate_17.ClientID %>'), $('<%= LabTest_17.ClientID %>'), $('<%= LabResult_17.ClientID %>'), $('<%= LabQuality_17.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_18.ClientID %>'), $('<%= LabDate_18.ClientID %>'), $('<%= LabTest_18.ClientID %>'), $('<%= LabResult_18.ClientID %>'), $('<%= LabQuality_18.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_19.ClientID %>'), $('<%= LabDate_19.ClientID %>'), $('<%= LabTest_19.ClientID %>'), $('<%= LabResult_19.ClientID %>'), $('<%= LabQuality_19.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_20.ClientID %>'), $('<%= LabDate_20.ClientID %>'), $('<%= LabTest_20.ClientID %>'), $('<%= LabResult_20.ClientID %>'), $('<%= LabQuality_20.ClientID %>'));

      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_21.ClientID %>'), $('<%= LabDate_21.ClientID %>'), $('<%= LabTest_21.ClientID %>'), $('<%= LabResult_21.ClientID %>'), $('<%= LabQuality_21.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_22.ClientID %>'), $('<%= LabDate_22.ClientID %>'), $('<%= LabTest_22.ClientID %>'), $('<%= LabResult_22.ClientID %>'), $('<%= LabQuality_22.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_23.ClientID %>'), $('<%= LabDate_23.ClientID %>'), $('<%= LabTest_23.ClientID %>'), $('<%= LabResult_23.ClientID %>'), $('<%= LabQuality_23.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_24.ClientID %>'), $('<%= LabDate_24.ClientID %>'), $('<%= LabTest_24.ClientID %>'), $('<%= LabResult_24.ClientID %>'), $('<%= LabQuality_24.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_25.ClientID %>'), $('<%= LabDate_25.ClientID %>'), $('<%= LabTest_25.ClientID %>'), $('<%= LabResult_25.ClientID %>'), $('<%= LabQuality_25.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_26.ClientID %>'), $('<%= LabDate_26.ClientID %>'), $('<%= LabTest_26.ClientID %>'), $('<%= LabResult_26.ClientID %>'), $('<%= LabQuality_26.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_27.ClientID %>'), $('<%= LabDate_27.ClientID %>'), $('<%= LabTest_27.ClientID %>'), $('<%= LabResult_27.ClientID %>'), $('<%= LabQuality_27.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_28.ClientID %>'), $('<%= LabDate_28.ClientID %>'), $('<%= LabTest_28.ClientID %>'), $('<%= LabResult_28.ClientID %>'), $('<%= LabQuality_28.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_29.ClientID %>'), $('<%= LabDate_29.ClientID %>'), $('<%= LabTest_29.ClientID %>'), $('<%= LabResult_29.ClientID %>'), $('<%= LabQuality_29.ClientID %>'));
      addEventLabHx($('<%= LabHxRecorded.ClientID %>'), $('<%= LabHxDiv.ClientID %>'), $('<%= LabHxAbsentDiv.ClientID %>'), $('<%= LabDateText_30.ClientID %>'), $('<%= LabDate_30.ClientID %>'), $('<%= LabTest_30.ClientID %>'), $('<%= LabResult_30.ClientID %>'), $('<%= LabQuality_30.ClientID %>'));

    function addEventLabHx(LabHxRecordedID, LabHxDivID, LabHxAbsentDivID,labDateText, labDate,labTest,labResult,labQuality)
    {
        $(LabHxRecordedID).addEvent('click', curry(LabHxYesNo1, LabHxRecordedID, LabHxDivID, LabHxAbsentDivID, labDateText, labDate, labTest, labResult, labQuality));
        $(labDateText).addEvent('blur', curry(LabHxYesNo1, LabHxRecordedID, LabHxDivID, LabHxAbsentDivID, labDateText, labDate, labTest, labResult));
        $(labTest).addEvent('blur', curry(LabHxYesNo1, LabHxRecordedID, LabHxDivID, LabHxAbsentDivID, labDateText, labDate, labTest, labResult));
        $(labResult).addEvent('blur', curry(LabHxYesNo1, LabHxRecordedID, LabHxDivID, LabHxAbsentDivID, labDateText, labDate, labTest, labResult));

        // check on load as well
        LabHxYesNo1(LabHxRecordedID, LabHxDivID, LabHxAbsentDivID, labDateText, labDate,labTest,labResult,labQuality);

   }

   function LabHxYesNo1(LabHxRecordedID, LabHxDivID, LabHxAbsentDivID, labDateText, labDate,labTest,labResult,labQuality) {
       var LabHxRecordedRef = LabHxRecordedID.getElementsByTagName('input');
       for (var i = 0; i < LabHxRecordedRef.length; i++)
           if (LabHxRecordedRef[i].checked) {
           LabHxRadioClick1(LabHxRecordedRef[i].value, LabHxDivID, LabHxAbsentDivID, labDateText, labDate,labTest,labResult,labQuality);
       }
   }

   function LabHxRadioClick1(LabHxoption_value, LabHxhideDiv, LabHxhideAbsentDiv, labDateText, labDate,labTest,labResult,labQuality) {
       if (LabHxoption_value == "Yes") {
           LabHxhideDiv.style.display = 'block';
           LabHxhideAbsentDiv.style.display = 'none';

           document.getElementById('<%= AbsentDateText_14.ClientID %>').value = '';
           document.getElementById('<%= AbsentDate_14.ClientID %>').value = '';
           document.getElementById('<%= TableName_14.ClientID %>').value = '';
           document.getElementById('<%= FieldName_14.ClientID %>').value = '';
           document.getElementById('<%= FieldValue_14.ClientID %>').value = '';
           document.getElementById('<%= AbsentReason_14.ClientID %>').value = '';
           document.getElementById('<%= AbsentQuality_14.ClientID %>').value = '';

       }
       else if (LabHxoption_value == "No" || LabHxoption_value == "Unknown" || LabHxoption_value == "N/A") {
           LabHxhideAbsentDiv.style.display = 'block';
           LabHxhideDiv.style.display = 'none';

           document.getElementById('<%= TableName_14.ClientID %>').value = 'LabTests';
           document.getElementById('<%= FieldName_14.ClientID %>').value = 'LabTest';
           document.getElementById('<%= FieldValue_14.ClientID %>').value = document.getElementById('<%= ComponentTitle.ClientID %>').innerHTML;

           if (LabHxoption_value == "No")
               document.getElementById('<%= AbsentReason_14.ClientID %>').value = 'None Recorded';
           else if (LabHxoption_value == "Unknown")
               document.getElementById('<%= AbsentReason_14.ClientID %>').value = 'Unknown';
           else if (LabHxoption_value == "N/A")
               document.getElementById('<%= AbsentReason_14.ClientID %>').value = 'Not Applicable';

           document.getElementById('<%= LabHxAbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_14.ClientID %>').value + ' as of ';

           document.getElementById('<%= AbsentQuality_14.ClientID %>').value = 'OUT';

           labDateText.value = '';
           labDate.value = '';
           labTest.value = '';
           labResult.value = '';
           labQuality.value = '';

       }
   }

</script> 