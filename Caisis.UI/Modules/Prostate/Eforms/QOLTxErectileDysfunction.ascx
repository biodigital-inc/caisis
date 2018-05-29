<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.QOLTxErectileDysfunction" CodeFile="QOLTxErectileDysfunction.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript">


</script>

<a name="QOLTxErectileDysfunction" /><span class="controlBoxTitle">TX for Erectile Dysfunction (that apply)</span><br/>


    
    <table width="80%" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SexualQOLHtmlTable">
  <tr> 
    <td width="50%"  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Treatment</td>
    <td class="controlBoxDataGridHeaderFirstCol">Start Date</td>
    <td  class="controlBoxDataGridHeaderFirstCol">Stop Date</td>
    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <asp:Repeater ID="QolTherapy" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('QOL_Therapy', <%# DataBinder.Eval(Container.DataItem, "QOL_TherapyId") %>, 'QOL_TxDateText,QOL_TxIndication,QOL_Therapy,QOL_TxStopDateText', 'ShortQOLSexual');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "QOL_Therapy") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "QOL_TxDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "QOL_TxStopDateText") %></td>
		    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>

  
  

  <tr>
    <td height="28" class="ClinicalEformGridColumnOne" >
		&nbsp;&nbsp;&nbsp;Vacuum Erection Device
		<euc:EformHidden id="QOL_TxIndication" runat="server" RecordId="1" Table="QOL_Therapy" Field="QOL_TxIndication" Value="Erectile Dysfunction"/>
		<euc:EformHidden id="QOL_Therapy" runat="server" RecordId="1" Table="QOL_Therapy" Field="QOL_Therapy" Value="Vacuum Erectile Device (VED)"/>    </td>
    <td style="white-space: nowrap;">&nbsp;<euc:EformTextBox Runat="server" RecordId="1"  ID="QOL_TxTherapyDateText" TABLE="QOL_Therapy" FIELD="QOL_TxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="QOL_TxIndication,QOL_Therapy"/>
		<euc:EformHidden RecordId="1" Runat="server" ID="QOL_TxTherapyDate" Table="QOL_Therapy" FIELD="QOL_TxDate" />	</td>
    <td style="white-space: nowrap;">&nbsp;<euc:EformTextBox Runat="server" RecordId="1"  ID="QOL_TxTherapyStopDateText" TABLE="QOL_Therapy" FIELD="QOL_TxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="QOL_TxIndication,QOL_Therapy" />
		<euc:EformHidden RecordId="1" Runat="server" ID="QOL_TxTherapyStopDate" Table="QOL_Therapy" FIELD="QOL_TxStopDate" />    </td>
    <td>&nbsp;</td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne" >
		&nbsp;&nbsp;&nbsp;Intracorp. Injection (ICI)
		<euc:EformHidden id="MedicationErectileInjection" runat="server" RecordId="22" Table="Medications" Field="Medication" Value="Intracavernosal Injection"/>
		<euc:EformHidden id="MedRouteErectileInjection" runat="server" RecordId="22" Table="Medications" Field="MedRoute" Value="Intracavernosal"/>
		<euc:EformHidden id="MedIndicationErectileInjection" runat="server" RecordId="22" Table="Medications" Field="MedIndication" Value="Erectile Dysfunction"/>    </td>
    <td style="white-space: nowrap;">
    
    &nbsp;<euc:EformTextBox Runat="server" RecordId="22"  ID="ErectileInjectionMedDateText" TABLE="Medications" FIELD="MedDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="MedicationErectileInjection,MedIndicationErectileInjection,MedRouteErectileInjection" />
    <euc:EformHidden RecordId="22" Runat="server" ID="ErectileInjectionMedDate" Table="Medications" Field="MedDate" />    </td>
    <td style="white-space: nowrap;">&nbsp;
        <euc:EformTextBox Runat="server" RecordId="22"  ID="ErectileInjectionMedStopDateText" TABLE="Medications" FIELD="MedStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="MedicationErectileInjection,MedIndicationErectileInjection,MedRouteErectileInjection" />
        <euc:EformHidden RecordId="22" Runat="server" ID="ErectileInjectionMedStopDate" Table="Medications" Field="MedStopDate" />    </td>
    <td>&nbsp;</td>
  </tr>
  
  
   <tr >
    <td height="28" class="ClinicalEformGridColumnOne" >
		&nbsp;&nbsp;&nbsp;MUSE
		<euc:EformHidden id="MedicationMUSE" runat="server" RecordId="21" Table="Medications" Field="Medication" Value="MUSE"/>
		<euc:EformHidden id="MedIndicationMUSE" runat="server" RecordId="21" Table="Medications" Field="MedIndication" Value="Erectile Dysfunction"/>    </td>
    <td style="white-space: nowrap;">
    
    &nbsp;<euc:EformTextBox Runat="server" RecordId="21"  ID="MUSEMedDateText" TABLE="Medications" FIELD="MedDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="MedicationMUSE,MedIndicationMUSE" />
    <euc:EformHidden RecordId="21" Runat="server" ID="MUSEMedDate" Table="Medications" Field="MedDate" />    </td>
    <td style="white-space: nowrap;">&nbsp;
        <euc:EformTextBox Runat="server" RecordId="21"  ID="MUSEMedStopDateText" TABLE="Medications" FIELD="MedStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="MedicationMUSE,MedIndicationMUSE" />
        <euc:EformHidden RecordId="21" Runat="server" ID="MUSEMedStopDate" Table="Medications" Field="MedStopDate" />    </td>
    <td>&nbsp;</td>
  </tr>
  
  
   <tr>
    <td height="28" class="ClinicalEformGridColumnOne" >
		&nbsp;&nbsp;&nbsp;Penile Prosthesis
		<euc:EformHidden id="OpNamePenileProsthesis" runat="server" RecordId="12" Table="Procedures" Field="ProcName" Value="Penile Prosthesis"/>
		<euc:EformHidden id="OpIndicationPenileProsthesis" runat="server" RecordId="12" Table="Procedures" Field="ProcIndication" Value="Erectile Dysfunction"/>    </td>
    <td style="white-space: nowrap;">&nbsp;<euc:EformTextBox Runat="server" RecordId="12"  ID="PenileProsthesisOpDateText" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="OpNamePenileProsthesis,OpIndicationPenileProsthesis" />
		<euc:EformHidden RecordId="12" Runat="server" ID="PenileProsthesisOpDate" Table="Procedures" Field="ProcDate" />    </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To enter  other Medications, please see the Medications section. 

<br/>
<br/>
<br/>

