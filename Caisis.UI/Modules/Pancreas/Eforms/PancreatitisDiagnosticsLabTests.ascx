<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreatitisDiagnosticsLabTests" CodeFile="PancreatitisDiagnosticsLabTests.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.PancreatitisLabTestsHtmlTable = "PancreatitisLabTestsHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">
    /* time app styles */.headerCell
    {
        color: #ffffff;
        text-align: left;
        width: 40px;
    }

</style>
<a name="PancreatitisDiagnosticsLabTests" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Lab Tests"></asp:Label><br/>

<euc:CaisisTextBox Width="1px" style="display: none;" ID="CultureIsUS" runat="server" />

<table width="250" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PancreatitisLabTestsHtmlTable">
	<tr> 
		<td class="controlBoxDataGridHeaderFirstCol" style="white-space: nowrap; " align="left">Date</td>
		<td class="controlBoxDataGridHeaderFirstCol" style="white-space: nowrap; " align="left">Time</td>		
		<td class="controlBoxDataGridHeaderFirstCol" style="white-space: nowrap; " align="left">&nbsp;Test</td>
		<td class="controlBoxDataGridHeaderFirstCol" style="white-space: nowrap; text-align: left; ">Result</td>
		<td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	</tr>
	<asp:Repeater ID="OtherLabTests" runat="server" OnItemDataBound="EFormRepeaterOnDataBoundForOther"> 
		<ItemTemplate> 
			<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'LabTest,LabResult,LabUnits,LabDateText,LabDate,LabTime', 'LabTests');"> 
				<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabTime")%>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "LabUnits") %></td>
				<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="OtherLockImage" runat="server" title="This record has been locked.">&nbsp;</td>
			</tr>      
		</ItemTemplate>
	</asp:Repeater>
	<tr> 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="21"  ID="LabDateText_21" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="21"  ID="LabDate_21"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_21.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="21"  ID="LabTime_21"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_21" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_21" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_21" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_21" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_21" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_21" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_21" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_21" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="21"  ID="LabTest_21"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_21" ID="LabTestPrefix_21" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_21"   TABLE="NoTable" Field="LabTestName_21"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="21"  ID="LabResult_21"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="21"  ID="LabUnits_21"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_21" runat="server" /></td>
  </tr>

	<tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="22"  ID="LabDateText_22" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="22"  ID="LabDate_22"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_22.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="22"  ID="LabTime_22"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_22" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_22" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_22" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_22" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_22" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_22" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_22" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_22" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="22"  ID="LabTest_22"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_22" ID="LabTestPrefix_22" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_22"   TABLE="NoTable" Field="LabTestName_22"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="22"  ID="LabResult_22"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="22"  ID="LabUnits_22"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_22" runat="server" /></td>
  </tr>

	<tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="23"  ID="LabDateText_23" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="23"  ID="LabDate_23"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_23.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="23"  ID="LabTime_23"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_23" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_23" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_23" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_23" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_23" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_23" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_23" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_23" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="23"  ID="LabTest_23"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_23" ID="LabTestPrefix_23" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_23"   TABLE="NoTable" Field="LabTestName_23"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="23"  ID="LabResult_23"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="23"  ID="LabUnits_23"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_23" runat="server" /></td>
  </tr>

	<tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="24"  ID="LabDateText_24" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="24"  ID="LabDate_24"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_24.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="24"  ID="LabTime_24"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_24" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_24" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_24" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_24" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_24" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_24" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_24" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_24" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="24"  ID="LabTest_24"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_24" ID="LabTestPrefix_24" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_24"   TABLE="NoTable" Field="LabTestName_24"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="24"  ID="LabResult_24"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="24"  ID="LabUnits_24"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_24" runat="server" /></td>
  </tr>

	<tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="25"  ID="LabDateText_25" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="25"  ID="LabDate_25"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_25.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="25"  ID="LabTime_25"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_25" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_25" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_25" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_25" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_25" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_25" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_25" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_25" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="25"  ID="LabTest_25"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_25" ID="LabTestPrefix_25" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_25"   TABLE="NoTable" Field="LabTestName_25"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="25"  ID="LabResult_25"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="25"  ID="LabUnits_25"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_25" runat="server" /></td>
  </tr>

	<tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="26"  ID="LabDateText_26" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="26"  ID="LabDate_26"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_26.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="26"  ID="LabTime_26"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_26" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_26" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_26" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_26" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_26" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_26" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_26" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_26" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="26"  ID="LabTest_26"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_26" ID="LabTestPrefix_26" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_26"   TABLE="NoTable" Field="LabTestName_26"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="26"  ID="LabResult_26"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="26"  ID="LabUnits_26"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_26" runat="server" /></td>
  </tr>

	<tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="27"  ID="LabDateText_27" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="27"  ID="LabDate_27"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_27.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="27"  ID="LabTime_27"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_27" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_27" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_27" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_27" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_27" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_27" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_27" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_27" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="27"  ID="LabTest_27"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_27" ID="LabTestPrefix_27" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_27"   TABLE="NoTable" Field="LabTestName_27"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="27"  ID="LabResult_27"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="27"  ID="LabUnits_27"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_27" runat="server" /></td>
  </tr>

	<tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="28"  ID="LabDateText_28" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="28"  ID="LabDate_28"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_28.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="28"  ID="LabTime_28"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_28" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_28" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_28" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_28" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_28" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_28" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_28" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_28" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="28"  ID="LabTest_28"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_28" ID="LabTestPrefix_28" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_28"   TABLE="NoTable" Field="LabTestName_28"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="28"  ID="LabResult_28"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="28"  ID="LabUnits_28"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_28" runat="server" /></td>
  </tr>

	<tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="29"  ID="LabDateText_29" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="29"  ID="LabDate_29"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_29.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="29"  ID="LabTime_29"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_29" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_29" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_29" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_29" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_29" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_29" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_29" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_29" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="29"  ID="LabTest_29"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_29" ID="LabTestPrefix_29" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_29"   TABLE="NoTable" Field="LabTestName_29"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="29"  ID="LabResult_29"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="29"  ID="LabUnits_29"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_29" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="30"  ID="LabDateText_30" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="30"  ID="LabDate_30"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_30.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="30"  ID="LabTime_30"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_30" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_30" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_30" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_30" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_30" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_30" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_30" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_30" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="30"  ID="LabTest_30"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_30" ID="LabTestPrefix_30" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_30"   TABLE="NoTable" Field="LabTestName_30"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="30"  ID="LabResult_30"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="30"  ID="LabUnits_30"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_30" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="31"  ID="LabDateText_31" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="31"  ID="LabDate_31"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_31.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="31"  ID="LabTime_31"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_31" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_31" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_31" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_31" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_31" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_31" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_31" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_31" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="31"  ID="LabTest_31"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_31" ID="LabTestPrefix_31" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_31"   TABLE="NoTable" Field="LabTestName_31"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="31"  ID="LabResult_31"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="31"  ID="LabUnits_31"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_31" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="32"  ID="LabDateText_32" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="32"  ID="LabDate_32"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_32.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="32"  ID="LabTime_32"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_32" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_32" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_32" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_32" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_32" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_32" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_32" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_32" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="32"  ID="LabTest_32"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_32" ID="LabTestPrefix_32" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_32"   TABLE="NoTable" Field="LabTestName_32"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="32"  ID="LabResult_32"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="32"  ID="LabUnits_32"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_32" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="33"  ID="LabDateText_33" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="33"  ID="LabDate_33"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_33.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="33"  ID="LabTime_33"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_33" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_33" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_33" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_33" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_33" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_33" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_33" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_33" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="33"  ID="LabTest_33"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_33" ID="LabTestPrefix_33" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_33"   TABLE="NoTable" Field="LabTestName_33"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="33"  ID="LabResult_33"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="33"  ID="LabUnits_33"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_33" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="34"  ID="LabDateText_34" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="34"  ID="LabDate_34"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_34.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="34"  ID="LabTime_34"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_34" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_34" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_34" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_34" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_34" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_34" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_34" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_34" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="34"  ID="LabTest_34"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_34" ID="LabTestPrefix_34" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_34"   TABLE="NoTable" Field="LabTestName_34"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="34"  ID="LabResult_34"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="34"  ID="LabUnits_34"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_34" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="35"  ID="LabDateText_35" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="35"  ID="LabDate_35"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_35.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="35"  ID="LabTime_35"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_35" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_35" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_35" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_35" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_35" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_35" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_35" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_35" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="35"  ID="LabTest_35"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_35" ID="LabTestPrefix_35" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_35"   TABLE="NoTable" Field="LabTestName_35"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="35"  ID="LabResult_35"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="35"  ID="LabUnits_35"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_35" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="36"  ID="LabDateText_36" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="36"  ID="LabDate_36"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_36.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="36"  ID="LabTime_36"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_36" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_36" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_36" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_36" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_36" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_36" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_36" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_36" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="36"  ID="LabTest_36"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_36" ID="LabTestPrefix_36" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_36"   TABLE="NoTable" Field="LabTestName_36"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="36"  ID="LabResult_36"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="36"  ID="LabUnits_36"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_36" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="37"  ID="LabDateText_37" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="37"  ID="LabDate_37"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_37.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="37"  ID="LabTime_37"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_37" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_37" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_37" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_37" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_37" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_37" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_37" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_37" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="37"  ID="LabTest_37"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_37" ID="LabTestPrefix_37" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_37"   TABLE="NoTable" Field="LabTestName_37"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="37"  ID="LabResult_37"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="37"  ID="LabUnits_37"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_37" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="38"  ID="LabDateText_38" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="38"  ID="LabDate_38"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_38.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="38"  ID="LabTime_38"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_38" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_38" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_38" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_38" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_38" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_38" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_38" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_38" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="38"  ID="LabTest_38"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_38" ID="LabTestPrefix_38" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_38"   TABLE="NoTable" Field="LabTestName_38"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="38"  ID="LabResult_38"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="38"  ID="LabUnits_38"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_38" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="39"  ID="LabDateText_39" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="39"  ID="LabDate_39"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_39.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="39"  ID="LabTime_39"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_39" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_39" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_39" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_39" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_39" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_39" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_39" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_39" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="39"  ID="LabTest_39"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_39" ID="LabTestPrefix_39" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_39"   TABLE="NoTable" Field="LabTestName_39"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="39"  ID="LabResult_39"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="39"  ID="LabUnits_39"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_39" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="40"  ID="LabDateText_40" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="40"  ID="LabDate_40"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_40.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="40"  ID="LabTime_40"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_40" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_40" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_40" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_40" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_40" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_40" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_40" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_40" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="40"  ID="LabTest_40"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_40" ID="LabTestPrefix_40" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_40"   TABLE="NoTable" Field="LabTestName_40"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="40"  ID="LabResult_40"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="40"  ID="LabUnits_40"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_40" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="41"  ID="LabDateText_41" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="41"  ID="LabDate_41"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_41.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="41"  ID="LabTime_41"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_41" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_41" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_41" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_41" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_41" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_41" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_41" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_41" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="41"  ID="LabTest_41"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_41" ID="LabTestPrefix_41" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_41"   TABLE="NoTable" Field="LabTestName_41"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="41"  ID="LabResult_41"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="41"  ID="LabUnits_41"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_41" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="42"  ID="LabDateText_42" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="42"  ID="LabDate_42"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_42.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="42"  ID="LabTime_42"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_42" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_42" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_42" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_42" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_42" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_42" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_42" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_42" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="42"  ID="LabTest_42"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_42" ID="LabTestPrefix_42" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_42"   TABLE="NoTable" Field="LabTestName_42"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="42"  ID="LabResult_42"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="42"  ID="LabUnits_42"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_42" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="43"  ID="LabDateText_43" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="43"  ID="LabDate_43"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_43.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="43"  ID="LabTime_43"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_43" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_43" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_43" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_43" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_43" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_43" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_43" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_43" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="43"  ID="LabTest_43"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_43" ID="LabTestPrefix_43" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_43"   TABLE="NoTable" Field="LabTestName_43"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="43"  ID="LabResult_43"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="43"  ID="LabUnits_43"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_43" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="44"  ID="LabDateText_44" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="44"  ID="LabDate_44"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_44.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="44"  ID="LabTime_44"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_44" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_44" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_44" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_44" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_44" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_44" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_44" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_44" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="44"  ID="LabTest_44"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_44" ID="LabTestPrefix_44" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_44"   TABLE="NoTable" Field="LabTestName_44"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="44"  ID="LabResult_44"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="44"  ID="LabUnits_44"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_44" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="45"  ID="LabDateText_45" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="45"  ID="LabDate_45"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_45.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="45"  ID="LabTime_45"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_45" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_45" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_45" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_45" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_45" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_45" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_45" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_45" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="45"  ID="LabTest_45"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_45" ID="LabTestPrefix_45" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_45"   TABLE="NoTable" Field="LabTestName_45"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="45"  ID="LabResult_45"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="45"  ID="LabUnits_45"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_45" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="46"  ID="LabDateText_46" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="46"  ID="LabDate_46"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_46.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="46"  ID="LabTime_46"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_46" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_46" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_46" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_46" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_46" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_46" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_46" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_46" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="46"  ID="LabTest_46"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_46" ID="LabTestPrefix_46" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_46"   TABLE="NoTable" Field="LabTestName_46"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="46"  ID="LabResult_46"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="46"  ID="LabUnits_46"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_46" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="47"  ID="LabDateText_47" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="47"  ID="LabDate_47"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_47.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="47"  ID="LabTime_47"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_47" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_47" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_47" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_47" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_47" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_47" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_47" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_47" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="47"  ID="LabTest_47"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_47" ID="LabTestPrefix_47" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_47"   TABLE="NoTable" Field="LabTestName_47"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="47"  ID="LabResult_47"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="47"  ID="LabUnits_47"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_47" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="48"  ID="LabDateText_48" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="48"  ID="LabDate_48"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_48.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="48"  ID="LabTime_48"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_48" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_48" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_48" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_48" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_48" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_48" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_48" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_48" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="48"  ID="LabTest_48"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_48" ID="LabTestPrefix_48" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_48"   TABLE="NoTable" Field="LabTestName_48"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="48"  ID="LabResult_48"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="48"  ID="LabUnits_48"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_48" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="49"  ID="LabDateText_49" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="49"  ID="LabDate_49"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_49.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="49"  ID="LabTime_49"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_49" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_49" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_49" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_49" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_49" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_49" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_49" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_49" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="49"  ID="LabTest_49"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_49" ID="LabTestPrefix_49" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_49"   TABLE="NoTable" Field="LabTestName_49"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="49"  ID="LabResult_49"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="49"  ID="LabUnits_49"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_49" runat="server" /></td>
  </tr>

  <tr style="display: none; " > 
        <td height="28" class="ClinicalEformGridColumnOne" >
			    <euc:EformTextBox  style="width:80px;"  RecordId="50"  ID="LabDateText_50" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformHidden   style="width:80px;"  RecordId="50"  ID="LabDate_50"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformHidden>			</td>
        <td style="white-space: nowrap;" >
                
                <table>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="OpenApptTimeWindow(<%= TimeInterface_50.ClientID %>);">
                        <td><euc:EformTextBox  Width="80px" RecordId="50"  ID="LabTime_50"  TABLE="LabTests" FIELD="LabTime" Runat="server" /></td>
                    </tr>
                </table>                
                
                <div id="TimeInterface_50" runat="server" style="position: absolute; z-index: 1000;background-color: #e0eaf0; border: 1px solid #979797; display: none;" class="ClinicalEformTable"   >                                   
                        <table border="0" cellpadding="3" cellspacing="0" style="color: #ffffff;">
                            <tr style="background-color: #166D8F; color: #ffffff;">
                                <td class="headerCell">
                                    &nbsp;&nbsp;Hour
                                </td>
                                <td style="width: 5px;">
                                    &nbsp;
                                </td>
                                <td class="headerCell">
                                    &nbsp;Minute
                                </td>
                                <td class="headerCell">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <img alt="Close" id="CloseTime_50" runat="server" src="~/Images/popupclose.gif" style="cursor: pointer;
                                        padding-right: 2px;" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    &nbsp;<euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Hour_50" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top" style="text-align: center;">
                                    <b>:</b>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="Minute_50" runat="server"
                                        ShowEmptyListItem="true" ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                </td>
                                <td valign="top">
                                    <euc:CaisisSelect DropDownWidth="auto" Width="40px" ID="AmPm_50" runat="server" ShowEmptyListItem="true"
                                        ShowLabel="false">
                                        <asp:ListItem></asp:ListItem>
                                    </euc:CaisisSelect>
                                    &nbsp;
                                </td>
                                <td valign="top">
                                    <img alt="Insert" id="InsertTime_50" runat="server" src="~/Images/button_insert.gif"
                                        style="cursor: pointer;" />
                                </td>
                                <td valign="top">
                                    <img alt="Clear" id="ClearTime_50" runat="server" src="~/Images/button_clear.gif"
                                        style="cursor: pointer;" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="ErroMsg_50" runat="server" ForeColor="Red" Style="border-style: none;" />
                                </td>
                            </tr>
                        </table>
                </div>  
                </td>
        <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="1px" style="display: none; "  RecordId="50"  ID="LabTest_50"     TABLE="LabTests" Field="LabTest" Runat="server" />
                
                <euc:EformDropDownList Width="80px" Table="NoTable" Field="LabTestPrefix_50" ID="LabTestPrefix_50" runat="server" ShowEmptyListItem="true">
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Admission" Text="Admission" />
                    <asp:ListItem Value="48h high" Text="48h high" />
                    <asp:ListItem Value="48h low" Text="48h low" />                
                </euc:EformDropDownList>
                
                 <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="LabTestName_50"   TABLE="NoTable" Field="LabTestName_50"   LookupCode="LabTest,Disease,@DiseaseView" Runat="server" />
               
                </td>
        <td style="white-space: nowrap;" align="center">
                <euc:EformTextBox  style="width:50px;"  RecordId="50"  ID="LabResult_50"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" />
                <euc:EformComboBox  DropDownWidth="auto"  style="width:80px;"  RecordId="50"  ID="LabUnits_50"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits,Disease,@DiseaseView" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_50" runat="server" /></td>
  </tr>

</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PancreatitisLabTestsHtmlTable');" />
<br/><br/><br />

  <script type="text/javascript">

    addAbsentEventTime($('<%= LabTestPrefix_21.ClientID %>'),$('<%= LabTestName_21.ClientID %>'),$('<%= LabTest_21.ClientID %>'),$('<%= LabResult_21.ClientID %>'),$('<%= LabUnits_21.ClientID %>'),$('<%= LabDateText_21.ClientID %>'),$('<%= LabDate_21.ClientID %>'),$('<%= LabTime_21.ClientID %>'),$('<%= TimeInterface_21.ClientID %>'),$('<%= InsertTime_21.ClientID %>'),$('<%= Hour_21.ClientID %>'),$('<%= Minute_21.ClientID %>'),$('<%= AmPm_21.ClientID %>'),$('<%= ErroMsg_21.ClientID %>'),$('<%= CloseTime_21.ClientID %>'),$('<%= ClearTime_21.ClientID %>'),$('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_22.ClientID %>'),$('<%= LabTestName_22.ClientID %>'),$('<%= LabTest_22.ClientID %>'),$('<%= LabResult_22.ClientID %>'),$('<%= LabUnits_22.ClientID %>'),$('<%= LabDateText_22.ClientID %>'),$('<%= LabDate_22.ClientID %>'),$('<%= LabTime_22.ClientID %>'),$('<%= TimeInterface_22.ClientID %>'),$('<%= InsertTime_22.ClientID %>'),$('<%= Hour_22.ClientID %>'),$('<%= Minute_22.ClientID %>'),$('<%= AmPm_22.ClientID %>'),$('<%= ErroMsg_22.ClientID %>'),$('<%= CloseTime_22.ClientID %>'),$('<%= ClearTime_22.ClientID %>'),$('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_23.ClientID %>'),$('<%= LabTestName_23.ClientID %>'),$('<%= LabTest_23.ClientID %>'),$('<%= LabResult_23.ClientID %>'),$('<%= LabUnits_23.ClientID %>'),$('<%= LabDateText_23.ClientID %>'),$('<%= LabDate_23.ClientID %>'),$('<%= LabTime_23.ClientID %>'),$('<%= TimeInterface_23.ClientID %>'),$('<%= InsertTime_23.ClientID %>'),$('<%= Hour_23.ClientID %>'),$('<%= Minute_23.ClientID %>'),$('<%= AmPm_23.ClientID %>'),$('<%= ErroMsg_23.ClientID %>'),$('<%= CloseTime_23.ClientID %>'),$('<%= ClearTime_23.ClientID %>'),$('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_24.ClientID %>'),$('<%= LabTestName_24.ClientID %>'),$('<%= LabTest_24.ClientID %>'),$('<%= LabResult_24.ClientID %>'),$('<%= LabUnits_24.ClientID %>'),$('<%= LabDateText_24.ClientID %>'),$('<%= LabDate_24.ClientID %>'),$('<%= LabTime_24.ClientID %>'),$('<%= TimeInterface_24.ClientID %>'),$('<%= InsertTime_24.ClientID %>'),$('<%= Hour_24.ClientID %>'),$('<%= Minute_24.ClientID %>'),$('<%= AmPm_24.ClientID %>'),$('<%= ErroMsg_24.ClientID %>'),$('<%= CloseTime_24.ClientID %>'),$('<%= ClearTime_24.ClientID %>'),$('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_25.ClientID %>'),$('<%= LabTestName_25.ClientID %>'),$('<%= LabTest_25.ClientID %>'),$('<%= LabResult_25.ClientID %>'),$('<%= LabUnits_25.ClientID %>'),$('<%= LabDateText_25.ClientID %>'),$('<%= LabDate_25.ClientID %>'),$('<%= LabTime_25.ClientID %>'),$('<%= TimeInterface_25.ClientID %>'),$('<%= InsertTime_25.ClientID %>'),$('<%= Hour_25.ClientID %>'),$('<%= Minute_25.ClientID %>'),$('<%= AmPm_25.ClientID %>'),$('<%= ErroMsg_25.ClientID %>'),$('<%= CloseTime_25.ClientID %>'),$('<%= ClearTime_25.ClientID %>'),$('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_26.ClientID %>'),$('<%= LabTestName_26.ClientID %>'),$('<%= LabTest_26.ClientID %>'),$('<%= LabResult_26.ClientID %>'),$('<%= LabUnits_26.ClientID %>'),$('<%= LabDateText_26.ClientID %>'),$('<%= LabDate_26.ClientID %>'),$('<%= LabTime_26.ClientID %>'),$('<%= TimeInterface_26.ClientID %>'),$('<%= InsertTime_26.ClientID %>'),$('<%= Hour_26.ClientID %>'),$('<%= Minute_26.ClientID %>'),$('<%= AmPm_26.ClientID %>'),$('<%= ErroMsg_26.ClientID %>'),$('<%= CloseTime_26.ClientID %>'),$('<%= ClearTime_26.ClientID %>'),$('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_27.ClientID %>'),$('<%= LabTestName_27.ClientID %>'),$('<%= LabTest_27.ClientID %>'),$('<%= LabResult_27.ClientID %>'),$('<%= LabUnits_27.ClientID %>'),$('<%= LabDateText_27.ClientID %>'),$('<%= LabDate_27.ClientID %>'),$('<%= LabTime_27.ClientID %>'),$('<%= TimeInterface_27.ClientID %>'),$('<%= InsertTime_27.ClientID %>'),$('<%= Hour_27.ClientID %>'),$('<%= Minute_27.ClientID %>'),$('<%= AmPm_27.ClientID %>'),$('<%= ErroMsg_27.ClientID %>'),$('<%= CloseTime_27.ClientID %>'),$('<%= ClearTime_27.ClientID %>'),$('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_28.ClientID %>'),$('<%= LabTestName_28.ClientID %>'),$('<%= LabTest_28.ClientID %>'),$('<%= LabResult_28.ClientID %>'),$('<%= LabUnits_28.ClientID %>'),$('<%= LabDateText_28.ClientID %>'),$('<%= LabDate_28.ClientID %>'),$('<%= LabTime_28.ClientID %>'),$('<%= TimeInterface_28.ClientID %>'),$('<%= InsertTime_28.ClientID %>'),$('<%= Hour_28.ClientID %>'),$('<%= Minute_28.ClientID %>'),$('<%= AmPm_28.ClientID %>'),$('<%= ErroMsg_28.ClientID %>'),$('<%= CloseTime_28.ClientID %>'),$('<%= ClearTime_28.ClientID %>'),$('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_29.ClientID %>'),$('<%= LabTestName_29.ClientID %>'),$('<%= LabTest_29.ClientID %>'),$('<%= LabResult_29.ClientID %>'),$('<%= LabUnits_29.ClientID %>'),$('<%= LabDateText_29.ClientID %>'),$('<%= LabDate_29.ClientID %>'),$('<%= LabTime_29.ClientID %>'),$('<%= TimeInterface_29.ClientID %>'),$('<%= InsertTime_29.ClientID %>'),$('<%= Hour_29.ClientID %>'),$('<%= Minute_29.ClientID %>'),$('<%= AmPm_29.ClientID %>'),$('<%= ErroMsg_29.ClientID %>'),$('<%= CloseTime_29.ClientID %>'),$('<%= ClearTime_29.ClientID %>'),$('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_30.ClientID %>'),$('<%= LabTestName_30.ClientID %>'),$('<%= LabTest_30.ClientID %>'),$('<%= LabResult_30.ClientID %>'),$('<%= LabUnits_30.ClientID %>'),$('<%= LabDateText_30.ClientID %>'),$('<%= LabDate_30.ClientID %>'),$('<%= LabTime_30.ClientID %>'),$('<%= TimeInterface_30.ClientID %>'),$('<%= InsertTime_30.ClientID %>'),$('<%= Hour_30.ClientID %>'),$('<%= Minute_30.ClientID %>'),$('<%= AmPm_30.ClientID %>'),$('<%= ErroMsg_30.ClientID %>'),$('<%= CloseTime_30.ClientID %>'),$('<%= ClearTime_30.ClientID %>'),$('<%= CultureIsUS.ClientID %>').value);

    addAbsentEventTime($('<%= LabTestPrefix_31.ClientID %>'), $('<%= LabTestName_31.ClientID %>'), $('<%= LabTest_31.ClientID %>'), $('<%= LabResult_31.ClientID %>'), $('<%= LabUnits_31.ClientID %>'), $('<%= LabDateText_31.ClientID %>'), $('<%= LabDate_31.ClientID %>'), $('<%= LabTime_31.ClientID %>'), $('<%= TimeInterface_31.ClientID %>'), $('<%= InsertTime_31.ClientID %>'), $('<%= Hour_31.ClientID %>'), $('<%= Minute_31.ClientID %>'), $('<%= AmPm_31.ClientID %>'), $('<%= ErroMsg_31.ClientID %>'), $('<%= CloseTime_31.ClientID %>'), $('<%= ClearTime_31.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_32.ClientID %>'), $('<%= LabTestName_32.ClientID %>'), $('<%= LabTest_32.ClientID %>'), $('<%= LabResult_32.ClientID %>'), $('<%= LabUnits_32.ClientID %>'), $('<%= LabDateText_32.ClientID %>'), $('<%= LabDate_32.ClientID %>'), $('<%= LabTime_32.ClientID %>'), $('<%= TimeInterface_32.ClientID %>'), $('<%= InsertTime_32.ClientID %>'), $('<%= Hour_32.ClientID %>'), $('<%= Minute_32.ClientID %>'), $('<%= AmPm_32.ClientID %>'), $('<%= ErroMsg_32.ClientID %>'), $('<%= CloseTime_32.ClientID %>'), $('<%= ClearTime_32.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_33.ClientID %>'), $('<%= LabTestName_33.ClientID %>'), $('<%= LabTest_33.ClientID %>'), $('<%= LabResult_33.ClientID %>'), $('<%= LabUnits_33.ClientID %>'), $('<%= LabDateText_33.ClientID %>'), $('<%= LabDate_33.ClientID %>'), $('<%= LabTime_33.ClientID %>'), $('<%= TimeInterface_33.ClientID %>'), $('<%= InsertTime_33.ClientID %>'), $('<%= Hour_33.ClientID %>'), $('<%= Minute_33.ClientID %>'), $('<%= AmPm_33.ClientID %>'), $('<%= ErroMsg_33.ClientID %>'), $('<%= CloseTime_33.ClientID %>'), $('<%= ClearTime_33.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_34.ClientID %>'), $('<%= LabTestName_34.ClientID %>'), $('<%= LabTest_34.ClientID %>'), $('<%= LabResult_34.ClientID %>'), $('<%= LabUnits_34.ClientID %>'), $('<%= LabDateText_34.ClientID %>'), $('<%= LabDate_34.ClientID %>'), $('<%= LabTime_34.ClientID %>'), $('<%= TimeInterface_34.ClientID %>'), $('<%= InsertTime_34.ClientID %>'), $('<%= Hour_34.ClientID %>'), $('<%= Minute_34.ClientID %>'), $('<%= AmPm_34.ClientID %>'), $('<%= ErroMsg_34.ClientID %>'), $('<%= CloseTime_34.ClientID %>'), $('<%= ClearTime_34.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_35.ClientID %>'), $('<%= LabTestName_35.ClientID %>'), $('<%= LabTest_35.ClientID %>'), $('<%= LabResult_35.ClientID %>'), $('<%= LabUnits_35.ClientID %>'), $('<%= LabDateText_35.ClientID %>'), $('<%= LabDate_35.ClientID %>'), $('<%= LabTime_35.ClientID %>'), $('<%= TimeInterface_35.ClientID %>'), $('<%= InsertTime_35.ClientID %>'), $('<%= Hour_35.ClientID %>'), $('<%= Minute_35.ClientID %>'), $('<%= AmPm_35.ClientID %>'), $('<%= ErroMsg_35.ClientID %>'), $('<%= CloseTime_35.ClientID %>'), $('<%= ClearTime_35.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_36.ClientID %>'), $('<%= LabTestName_36.ClientID %>'), $('<%= LabTest_36.ClientID %>'), $('<%= LabResult_36.ClientID %>'), $('<%= LabUnits_36.ClientID %>'), $('<%= LabDateText_36.ClientID %>'), $('<%= LabDate_36.ClientID %>'), $('<%= LabTime_36.ClientID %>'), $('<%= TimeInterface_36.ClientID %>'), $('<%= InsertTime_36.ClientID %>'), $('<%= Hour_36.ClientID %>'), $('<%= Minute_36.ClientID %>'), $('<%= AmPm_36.ClientID %>'), $('<%= ErroMsg_36.ClientID %>'), $('<%= CloseTime_36.ClientID %>'), $('<%= ClearTime_36.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_37.ClientID %>'), $('<%= LabTestName_37.ClientID %>'), $('<%= LabTest_37.ClientID %>'), $('<%= LabResult_37.ClientID %>'), $('<%= LabUnits_37.ClientID %>'), $('<%= LabDateText_37.ClientID %>'), $('<%= LabDate_37.ClientID %>'), $('<%= LabTime_37.ClientID %>'), $('<%= TimeInterface_37.ClientID %>'), $('<%= InsertTime_37.ClientID %>'), $('<%= Hour_37.ClientID %>'), $('<%= Minute_37.ClientID %>'), $('<%= AmPm_37.ClientID %>'), $('<%= ErroMsg_37.ClientID %>'), $('<%= CloseTime_37.ClientID %>'), $('<%= ClearTime_37.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_38.ClientID %>'), $('<%= LabTestName_38.ClientID %>'), $('<%= LabTest_38.ClientID %>'), $('<%= LabResult_38.ClientID %>'), $('<%= LabUnits_38.ClientID %>'), $('<%= LabDateText_38.ClientID %>'), $('<%= LabDate_38.ClientID %>'), $('<%= LabTime_38.ClientID %>'), $('<%= TimeInterface_38.ClientID %>'), $('<%= InsertTime_38.ClientID %>'), $('<%= Hour_38.ClientID %>'), $('<%= Minute_38.ClientID %>'), $('<%= AmPm_38.ClientID %>'), $('<%= ErroMsg_38.ClientID %>'), $('<%= CloseTime_38.ClientID %>'), $('<%= ClearTime_38.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_39.ClientID %>'), $('<%= LabTestName_39.ClientID %>'), $('<%= LabTest_39.ClientID %>'), $('<%= LabResult_39.ClientID %>'), $('<%= LabUnits_39.ClientID %>'), $('<%= LabDateText_39.ClientID %>'), $('<%= LabDate_39.ClientID %>'), $('<%= LabTime_39.ClientID %>'), $('<%= TimeInterface_39.ClientID %>'), $('<%= InsertTime_39.ClientID %>'), $('<%= Hour_39.ClientID %>'), $('<%= Minute_39.ClientID %>'), $('<%= AmPm_39.ClientID %>'), $('<%= ErroMsg_39.ClientID %>'), $('<%= CloseTime_39.ClientID %>'), $('<%= ClearTime_39.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_40.ClientID %>'), $('<%= LabTestName_40.ClientID %>'), $('<%= LabTest_40.ClientID %>'), $('<%= LabResult_40.ClientID %>'), $('<%= LabUnits_40.ClientID %>'), $('<%= LabDateText_40.ClientID %>'), $('<%= LabDate_40.ClientID %>'), $('<%= LabTime_40.ClientID %>'), $('<%= TimeInterface_40.ClientID %>'), $('<%= InsertTime_40.ClientID %>'), $('<%= Hour_40.ClientID %>'), $('<%= Minute_40.ClientID %>'), $('<%= AmPm_40.ClientID %>'), $('<%= ErroMsg_40.ClientID %>'), $('<%= CloseTime_40.ClientID %>'), $('<%= ClearTime_40.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);

    addAbsentEventTime($('<%= LabTestPrefix_41.ClientID %>'), $('<%= LabTestName_41.ClientID %>'), $('<%= LabTest_41.ClientID %>'), $('<%= LabResult_41.ClientID %>'), $('<%= LabUnits_41.ClientID %>'), $('<%= LabDateText_41.ClientID %>'), $('<%= LabDate_41.ClientID %>'), $('<%= LabTime_41.ClientID %>'), $('<%= TimeInterface_41.ClientID %>'), $('<%= InsertTime_41.ClientID %>'), $('<%= Hour_41.ClientID %>'), $('<%= Minute_41.ClientID %>'), $('<%= AmPm_41.ClientID %>'), $('<%= ErroMsg_41.ClientID %>'), $('<%= CloseTime_41.ClientID %>'), $('<%= ClearTime_41.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_42.ClientID %>'), $('<%= LabTestName_42.ClientID %>'), $('<%= LabTest_42.ClientID %>'), $('<%= LabResult_42.ClientID %>'), $('<%= LabUnits_42.ClientID %>'), $('<%= LabDateText_42.ClientID %>'), $('<%= LabDate_42.ClientID %>'), $('<%= LabTime_42.ClientID %>'), $('<%= TimeInterface_42.ClientID %>'), $('<%= InsertTime_42.ClientID %>'), $('<%= Hour_42.ClientID %>'), $('<%= Minute_42.ClientID %>'), $('<%= AmPm_42.ClientID %>'), $('<%= ErroMsg_42.ClientID %>'), $('<%= CloseTime_42.ClientID %>'), $('<%= ClearTime_42.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_43.ClientID %>'), $('<%= LabTestName_43.ClientID %>'), $('<%= LabTest_43.ClientID %>'), $('<%= LabResult_43.ClientID %>'), $('<%= LabUnits_43.ClientID %>'), $('<%= LabDateText_43.ClientID %>'), $('<%= LabDate_43.ClientID %>'), $('<%= LabTime_43.ClientID %>'), $('<%= TimeInterface_43.ClientID %>'), $('<%= InsertTime_43.ClientID %>'), $('<%= Hour_43.ClientID %>'), $('<%= Minute_43.ClientID %>'), $('<%= AmPm_43.ClientID %>'), $('<%= ErroMsg_43.ClientID %>'), $('<%= CloseTime_43.ClientID %>'), $('<%= ClearTime_43.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_44.ClientID %>'), $('<%= LabTestName_44.ClientID %>'), $('<%= LabTest_44.ClientID %>'), $('<%= LabResult_44.ClientID %>'), $('<%= LabUnits_44.ClientID %>'), $('<%= LabDateText_44.ClientID %>'), $('<%= LabDate_44.ClientID %>'), $('<%= LabTime_44.ClientID %>'), $('<%= TimeInterface_44.ClientID %>'), $('<%= InsertTime_44.ClientID %>'), $('<%= Hour_44.ClientID %>'), $('<%= Minute_44.ClientID %>'), $('<%= AmPm_44.ClientID %>'), $('<%= ErroMsg_44.ClientID %>'), $('<%= CloseTime_44.ClientID %>'), $('<%= ClearTime_44.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_45.ClientID %>'), $('<%= LabTestName_45.ClientID %>'), $('<%= LabTest_45.ClientID %>'), $('<%= LabResult_45.ClientID %>'), $('<%= LabUnits_45.ClientID %>'), $('<%= LabDateText_45.ClientID %>'), $('<%= LabDate_45.ClientID %>'), $('<%= LabTime_45.ClientID %>'), $('<%= TimeInterface_45.ClientID %>'), $('<%= InsertTime_45.ClientID %>'), $('<%= Hour_45.ClientID %>'), $('<%= Minute_45.ClientID %>'), $('<%= AmPm_45.ClientID %>'), $('<%= ErroMsg_45.ClientID %>'), $('<%= CloseTime_45.ClientID %>'), $('<%= ClearTime_45.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_46.ClientID %>'), $('<%= LabTestName_46.ClientID %>'), $('<%= LabTest_46.ClientID %>'), $('<%= LabResult_46.ClientID %>'), $('<%= LabUnits_46.ClientID %>'), $('<%= LabDateText_46.ClientID %>'), $('<%= LabDate_46.ClientID %>'), $('<%= LabTime_46.ClientID %>'), $('<%= TimeInterface_46.ClientID %>'), $('<%= InsertTime_46.ClientID %>'), $('<%= Hour_46.ClientID %>'), $('<%= Minute_46.ClientID %>'), $('<%= AmPm_46.ClientID %>'), $('<%= ErroMsg_46.ClientID %>'), $('<%= CloseTime_46.ClientID %>'), $('<%= ClearTime_46.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_47.ClientID %>'), $('<%= LabTestName_47.ClientID %>'), $('<%= LabTest_47.ClientID %>'), $('<%= LabResult_47.ClientID %>'), $('<%= LabUnits_47.ClientID %>'), $('<%= LabDateText_47.ClientID %>'), $('<%= LabDate_47.ClientID %>'), $('<%= LabTime_47.ClientID %>'), $('<%= TimeInterface_47.ClientID %>'), $('<%= InsertTime_47.ClientID %>'), $('<%= Hour_47.ClientID %>'), $('<%= Minute_47.ClientID %>'), $('<%= AmPm_47.ClientID %>'), $('<%= ErroMsg_47.ClientID %>'), $('<%= CloseTime_47.ClientID %>'), $('<%= ClearTime_47.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_48.ClientID %>'), $('<%= LabTestName_48.ClientID %>'), $('<%= LabTest_48.ClientID %>'), $('<%= LabResult_48.ClientID %>'), $('<%= LabUnits_48.ClientID %>'), $('<%= LabDateText_48.ClientID %>'), $('<%= LabDate_48.ClientID %>'), $('<%= LabTime_48.ClientID %>'), $('<%= TimeInterface_48.ClientID %>'), $('<%= InsertTime_48.ClientID %>'), $('<%= Hour_48.ClientID %>'), $('<%= Minute_48.ClientID %>'), $('<%= AmPm_48.ClientID %>'), $('<%= ErroMsg_48.ClientID %>'), $('<%= CloseTime_48.ClientID %>'), $('<%= ClearTime_48.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_49.ClientID %>'), $('<%= LabTestName_49.ClientID %>'), $('<%= LabTest_49.ClientID %>'), $('<%= LabResult_49.ClientID %>'), $('<%= LabUnits_49.ClientID %>'), $('<%= LabDateText_49.ClientID %>'), $('<%= LabDate_49.ClientID %>'), $('<%= LabTime_49.ClientID %>'), $('<%= TimeInterface_49.ClientID %>'), $('<%= InsertTime_49.ClientID %>'), $('<%= Hour_49.ClientID %>'), $('<%= Minute_49.ClientID %>'), $('<%= AmPm_49.ClientID %>'), $('<%= ErroMsg_49.ClientID %>'), $('<%= CloseTime_49.ClientID %>'), $('<%= ClearTime_49.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
    addAbsentEventTime($('<%= LabTestPrefix_50.ClientID %>'), $('<%= LabTestName_50.ClientID %>'), $('<%= LabTest_50.ClientID %>'), $('<%= LabResult_50.ClientID %>'), $('<%= LabUnits_50.ClientID %>'), $('<%= LabDateText_50.ClientID %>'), $('<%= LabDate_50.ClientID %>'), $('<%= LabTime_50.ClientID %>'), $('<%= TimeInterface_50.ClientID %>'), $('<%= InsertTime_50.ClientID %>'), $('<%= Hour_50.ClientID %>'), $('<%= Minute_50.ClientID %>'), $('<%= AmPm_50.ClientID %>'), $('<%= ErroMsg_50.ClientID %>'), $('<%= CloseTime_50.ClientID %>'), $('<%= ClearTime_50.ClientID %>'), $('<%= CultureIsUS.ClientID %>').value);
   
    function addAbsentEventTime(labTestPrefix,labTestName,labTestHidden,labResult,labUnits,labDateText,labDate,labTime,window,insertBtn,hour,minute,amPm,errorMsg,closeBtn,clearBtn,cultureIsUS)
    {
        // if culture is not set for 12hr time, hide amPm drop down
        if (cultureIsUS == 'false')
        {
            amPm.style.display = 'none';
        }
        $(insertBtn).addEvent('click',curry(ParseApptTime,labTime,window,insertBtn,hour,minute,amPm,errorMsg,closeBtn,cultureIsUS));
        $(closeBtn).addEvent('click',curry(CloseApptTimeWindow,window,insertBtn,hour,minute,amPm,errorMsg,closeBtn));
        $(clearBtn).addEvent('click',curry(ClearApptTime,labTime,window,insertBtn,hour,minute,amPm,errorMsg,closeBtn));
 
        $(labTestPrefix).addEvent('focus',curry(CloseApptTimeWindow,window,insertBtn,hour,minute,amPm,errorMsg,closeBtn));  
        $(labTestName).addEvent('focus',curry(CloseApptTimeWindow,window,insertBtn,hour,minute,amPm,errorMsg,closeBtn));  
        $(labResult).addEvent('focus',curry(CloseApptTimeWindow,window,insertBtn,hour,minute,amPm,errorMsg,closeBtn));  
        $(labUnits).addEvent('focus',curry(CloseApptTimeWindow,window,insertBtn,hour,minute,amPm,errorMsg,closeBtn));  
        $(labDateText).addEvent('focus',curry(CloseApptTimeWindow,window,insertBtn,hour,minute,amPm,errorMsg,closeBtn));  
              
        $(labTestPrefix).addEvent('blur',curry(SetHiddenFields,labTestPrefix,labTestName,labTestHidden,labResult,labUnits,labDateText,labDate,labTime));  
        $(labTestName).addEvent('blur',curry(SetHiddenFields,labTestPrefix,labTestName,labTestHidden,labResult,labUnits,labDateText,labDate,labTime));  
        $(labResult).addEvent('blur',curry(SetHiddenFields,labTestPrefix,labTestName,labTestHidden,labResult,labUnits,labDateText,labDate,labTime));  
        $(labUnits).addEvent('blur',curry(SetHiddenFields,labTestPrefix,labTestName,labTestHidden,labResult,labUnits,labDateText,labDate,labTime));  
        $(labDateText).addEvent('blur',curry(SetHiddenFields,labTestPrefix,labTestName,labTestHidden,labResult,labUnits,labDateText,labDate,labTime));  

    }
    
    function ParseApptTime(apptTime,window,insertBtn,hour,minute,amPm,errorMsg,closeBtn,cultureIsUS)
    {
        // close window
              
        var msg = '';
        if (cultureIsUS == 'true')
        {
            if (hour.value == '' || minute.value == '' || amPm.value == '' )
            {
                msg = "Specify Hour, Minutes, and am/pm"; 
            }
        }
        else
        {
            if (hour.value == '' || minute.value == '')
            {
                msg = "Specify Hour and Minutes"; 
            }
        
        }
         
        if (msg != '')
        {
            errorMsg.innerText = msg;
        }
        else
        {
            //combine and insert into time field
            if (cultureIsUS == 'true')
                apptTime.value = hour.value + ":" + minute.value + amPm.value;
            else
                apptTime.value = hour.value + ":" + minute.value;
            
            
            CloseApptTimeWindow(window,insertBtn,hour,minute,amPm,errorMsg,closeBtn);
            apptTime.focus();
        }
    }
    
    function CloseApptTimeWindow(window,insertBtn,hour,minute,amPm,errorMsg,closeBtn)
    {
        // clear values
        hour.value = '';
        minute.value = '';
        amPm.value = '';
        errorMsg.innerText = '';
        
        // close window
        window.style.display = 'none';
    }
    
    function OpenApptTimeWindow(window)
    {
        // open time window
        window.style.display = 'block';
    }
    
    function ClearApptTime(apptTime,window,insertBtn,hour,minute,amPm,errorMsg,closeBtn)
    {
        // clear time entry
        apptTime.value = '';
        // close time window
        CloseApptTimeWindow(window,insertBtn,hour,minute,amPm,errorMsg,closeBtn);
    }
    
     function SetHiddenFields(labTestPrefix,labTestName,labTestHidden,labResult,labUnits,labDateText,labDate,labTime)
    { 
        if (labTestPrefix.value != '' || labTestName.value != '' || labResult.value != '' || labUnits.value != '' || labDateText.value != '' || labTime.value != '' )
        { 
            if (labTestPrefix.value != '' && labTestName.value != '')
            {
                labTestHidden.value = labTestName.value + " - " + labTestPrefix.value;
            }
            else
            {
                labTestHidden.value = labTestName.value;
            }
        }
        else
        {
            labTestHidden.value = '';
        }            
    }	

    
           
    /*****************************************************/
    /*****************************************************/
    /*****************************************************/
    
 </script>