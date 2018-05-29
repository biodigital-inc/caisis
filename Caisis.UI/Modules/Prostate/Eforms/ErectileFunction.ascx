<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ErectileFunction" CodeFile="ErectileFunction.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
	tableArray.ErectileFuncTbl = "ErectileFuncTbl";
</script>
<style type="text/css">
table#CurentErectileFunctionHTMLTable
{
	border-collapse: collapse;
}
table#CurentErectileFunctionHTMLTable td
{
	border: solid 1px #cccccc;
	text-align: center;
	font-weight: bold;
	padding: 6px 4x 6px 4px;
}
</style>

<a name="ErectileFunction" /><span class="controlBoxTitle">Erectile Function</span><br />
<table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ErectileFuncTbl">
    <tr> 
        <td  class="controlBoxDataGridTitleColumn">Date</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Duration<br />Post Tx</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Spont<br />EF%</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Spont<br />EFD</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Oral Agent</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Dose</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Resp<br />(%)</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Oral<br />EFD</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">ICI Agent</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Dose</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Peak<br />Resp%</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Pen Rig<br />Duration</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">ICI<br />EFD</td>
	    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    </tr>
    
    <asp:Repeater ID="erectileFunction" runat="server"> 
        <ItemTemplate> 
	        <tr  style="border-bottom: solid 1px #D7DCE1;" class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"> 
		        <td class="ClinicalEformPopulatedColumn" align="left"><%# DataBinder.Eval(Container.DataItem, "Date")%></td>
		        <td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "Duration Post TX") %></td>
				<td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "Spontaneous Erectile Function %") %></td>
				<td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "Spontaneous Erectile Function Domain") %></td>
				<td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "Oral Agent") %></td>
				<td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "Oral Dose") %></td>
				<td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "Response %") %></td>
				<td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "Oral Erectile Function Domain") %></td>
				<td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "ICI Agent") %></td>
				<td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "ICI Dose") %></td>
				<td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "Peak Response %") %></td>
				<td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "Penile Rigidity Duration") %></td>
				<td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "ICI Erectile Function Domain") %></td>
		        <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
	        </tr>      
        </ItemTemplate>
    </asp:Repeater>
    
    <tr style="display:none;">
        <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="NoTable" FIELD="MediDateText" Runat="server" ID="MediDateText"/>
            <euc:EformHidden TABLE="NoTable" FIELD="MediDate" Runat="server" ID="MediDate"/>
        </td>
        <td align="center"><euc:EformTextBox RecordId="1" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_1" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="2" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_2" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="3" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_3" Width="40px"  /></td>
        <td align="center"><euc:EformComboBox RecordId="6" TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_6" LookupCode="Medication" Width="70px"/></td>
        <td align="center"><euc:EformTextBox RecordId="6" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_6" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="4" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_4" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="5" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_5" Width="40px" /></td>
        <td align="center"><euc:EformComboBox RecordId="7" TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_7" LookupCode="Medication" Width="70px"/></td>
        <td align="center"><euc:EformTextBox RecordId="7" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_7" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="6" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_6" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="7" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_7" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="8" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_8" Width="40px" /></td>
		<td><euc:EformDeleteIcon runat="server" /></td>
    </tr>
    <tr style="display:none;">
        <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="NoTable" FIELD="MediDateText1" Runat="server" ID="MediDateText1"/>
            <euc:EformHidden TABLE="NoTable" FIELD="MediDate1" Runat="server" ID="MediDate1"/>
        </td>
        <td align="center"><euc:EformTextBox RecordId="14" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_14" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="15" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_15" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="16" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_16" Width="40px"  /></td>
        <td align="center"><euc:EformComboBox RecordId="8" TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_8" LookupCode="Medication" Width="70px"/></td>
        <td align="center"><euc:EformTextBox RecordId="8" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_8" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="17" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_17" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="18" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_18" Width="40px" /></td>
        <td align="center"><euc:EformComboBox RecordId="9" TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_9" LookupCode="Medication" Width="70px"/></td>
        <td align="center"><euc:EformTextBox RecordId="9" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_9" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="19" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_19" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="20" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_20" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="21" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_21" Width="40px" /></td>
		<td><euc:EformDeleteIcon runat="server" /></td>
    </tr>
    <tr >
        <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="NoTable" FIELD="MediDateText2" Runat="server" ID="MediDateText2"/>
            <euc:EformHidden TABLE="NoTable" FIELD="MediDate2" Runat="server" ID="MediDate2"/>
        </td>
        <td align="center"><euc:EformTextBox RecordId="27" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_27" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="28" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_28" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="29" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_29" Width="40px"  /></td>
        <td align="center"><euc:EformComboBox RecordId="10" TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_10" LookupCode="Medication" Width="70px"/></td>
        <td align="center"><euc:EformTextBox RecordId="10" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_10" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="30" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_30" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="31" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_31" Width="40px" /></td>
        <td align="center"><euc:EformComboBox RecordId="11" TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_11" LookupCode="Medication" Width="70px"/></td>
        <td align="center"><euc:EformTextBox RecordId="11" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_11" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="32" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_32" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="33" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_33" Width="40px" /></td>
        <td align="center"><euc:EformTextBox RecordId="34" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_34" Width="40px" /></td>
		<td><euc:EformDeleteIcon runat="server" /></td>
    </tr>
</table><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ErectileFuncTbl');" />
<br /><br />


			<table id="CurentErectileFunctionHTMLTable" border="0" cellspacing="0" cellpadding="2" width="700"  class="eformLargePopulatedTable">
				<tr>
					<td align="center" rowspan="2">Nocturnal erections
					<euc:EformRadioButtonList RecordId="35" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_35" RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 10px;">
							<asp:ListItem>Yes</asp:ListItem>
							<asp:ListItem>No</asp:ListItem>
						</euc:EformRadioButtonList>
					</td>
					<td ><euc:EformTextBox RecordId="36" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_36" Width="30px" /> / 10</td>
					<td align="center" >First noted <euc:EformTextBox RecordId="37" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_37" Width="30px" /> months postop</td>
				</tr>
                <tr><td >ICI / Week = <euc:EformTextBox RecordId="38" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_38" Width="30px" /></td>
					<td ># Erections / Week = <euc:EformTextBox RecordId="39" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_39" Width="30px" /></td>
               	</tr>
			</table>

<br /><br /><br />