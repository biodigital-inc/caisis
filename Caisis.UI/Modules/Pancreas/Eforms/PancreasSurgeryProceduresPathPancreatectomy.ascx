<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasSurgeryProceduresPathPancreatectomy" CodeFile="PancreasSurgeryProceduresPathPancreatectomy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.Pathology = "Pathology";
	tableArray.PancreasPathology = "PancreasPathology";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="PancreasSurgeryProceduresPathPancreatectomy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Report"></asp:Label><br/>
<table  width="700" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="Pathology" > 

          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Path Report Date</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Path #</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Pathologist </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Primary Histology</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          <tr>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox  Width="100px" RecordId="11" ParentRecord="11"   TABLE="Pathology" FIELD="PathDateText" ID="PathDateText" Runat="server" ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="11" ParentRecord="11"   TABLE="Pathology" FIELD="PathDate"     ID="PathDate"     Runat="server"/></td>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox  Width="100px" RecordId="11" ParentRecord="11"   TABLE="Pathology" FIELD="PathNum" ID="PathNum" Runat="server" ShowCalendar="false" CalcDate="false"  /></td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="11" ParentRecord="11"  TABLE="Pathology" FIELD="Pathologist" ID="Pathologist"   LookupCode="Pathologist,Disease,@DiseaseView"   Runat="server" /> </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox Width="100px" RecordId="11" ParentRecord="11"  TABLE="Pathology" FIELD="PathHistology" ID="PathHistology"   LookupCode="PathHistology,Disease,@DiseaseView"   Runat="server" TabIndex="4" DropDownWidth="600px"   /> </td>

          </tr>
 
</table>
<br />

<span class="controlBoxTitle">Pancreas Pathology</span><br/>
<table  width="700" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="PancreasPathology" > 


          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Perineural Inv</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Vascular Inv </td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;Lymphatic Invasion</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Pancreatic Margin </td>
          </tr>
          <tr>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"   Width="80px" RecordId="1" ParentRecordId="11"  TABLE="PancreasPath" FIELD="PathPerineuralInv" ID="PathPerineuralInv" LookupCode="YesNoUnknown" Runat="server"  /></td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"   Width="80px" RecordId="1" ParentRecordId="11"  TABLE="PancreasPath" FIELD="PathVascularInv" ID="PathVascularInv" LookupCode="YesNoUnknown" Runat="server"  /></td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox  Width="80px" RecordId="1" ParentRecord="11" TABLE="PancreasPath" FIELD="PathLymphaticInv" ID="PathLymphaticInv" LookupCode="YesNoUnknown"  Runat="server"  /></td>
                <%--<euc:EformComboBox  Width="80px" TABLE="NoTable" FIELD="PathLymphaticInv" ID="PathLymphaticInv" LookupCode="YesNoUnknown"  Runat="server"   /></td>--%>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"   Width="80px" RecordId="1" ParentRecordId="11"  TABLE="PancreasPath" FIELD="PathPancreaticMargin" ID="EformComboBox5" LookupCode="PancreasSurgMargins" Runat="server"  /></td>
          </tr>
        

</table>
<br />

<table  width="700" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="Table2" >

      <tr>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Posterior Margin</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Anterior Peritoneal Margin</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Bile Duct Margin </td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Duodenal Margin  </td>
     </tr>
      <tr>
        <td style="white-space: nowrap;" >
            <euc:EformComboBox DropDownWidth="auto"   Width="80px" RecordId="1" ParentRecordId="11"  TABLE="PancreasPath" FIELD="PathPosteriorMargin" ID="EformComboBox6" LookupCode="PancreasSurgMargins" Runat="server"  /></td>
        <td style="white-space: nowrap;" >
            <euc:EformComboBox DropDownWidth="auto"   Width="80px" RecordId="1" ParentRecordId="11"  TABLE="PancreasPath" FIELD="PathAnteriorPeritonealInv" ID="EformComboBox4" LookupCode="PancreasSurgMargins" Runat="server"  /></td>
        <td style="white-space: nowrap;" >
            <euc:EformComboBox DropDownWidth="auto"   Width="80px" RecordId="1" ParentRecordId="11"  TABLE="PancreasPath" FIELD="PathBileDuctMargin" ID="EformComboBox1" LookupCode="PancreasSurgMargins" Runat="server" /></td>
        <td style="white-space: nowrap;" >
            <euc:EformComboBox DropDownWidth="auto"   Width="80px" RecordId="1" ParentRecordId="11"  TABLE="PancreasPath" FIELD="PathDuodenalMargin" ID="EformComboBox2" LookupCode="PancreasSurgMargins" Runat="server"  /></td>
     </tr>
      <tr>
                <td colspan="4" class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Gastric Margin </td>
      </tr>
      <tr>
            <td colspan="4" style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"   Width="80px" RecordId="1" ParentRecordId="11"  TABLE="PancreasPath" FIELD="PathGastricMargin" ID="EformComboBox3" LookupCode="PancreasSurgMargins" Runat="server"  /></td>
     </tr>

</table>

<br />

<table  width="700" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="Table3" >

      <tr>
		    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Pancreatitis  </td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Fibrosis  </td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;PanIN </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Extra Parenchymal<br /> Invasion  </td>
     </tr>
      <tr>
        <td style="white-space: nowrap;" >
            <euc:EformComboBox DropDownWidth="auto"   Width="80px" RecordId="1" ParentRecordId="11"  TABLE="PancreasPath" FIELD="PathPancreatitis" ID="PathPancreatitis" LookupCode="PancreasPancreatitis" Runat="server" /></td>
        <td style="white-space: nowrap;" >
            <euc:EformComboBox DropDownWidth="auto"   Width="80px" RecordId="1" ParentRecordId="11"  TABLE="PancreasPath" FIELD="PathFibrosis" ID="PathFibrosis" LookupCode="YesNoUnknown" Runat="server"  /></td>
        <td style="white-space: nowrap;" >
            <euc:EformComboBox DropDownWidth="auto"   Width="80px" RecordId="1" ParentRecordId="11"  TABLE="PancreasPath" FIELD="PathPanIn" ID="PathPanIn" LookupCode="PancreasPanIN" Runat="server" /></td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"   Width="80px" RecordId="1" ParentRecordId="11"  TABLE="PancreasPath" FIELD="PathExtraParenchymalInv" ID="PathExtraParenchymalInv" LookupCode="YesNoUnknown" Runat="server"  /></td>
      </tr>
 
       <tr>
             <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;IPMN</td>
             <td colspan="4" class="controlBoxDataGridTitleColumn" style="height: 10%;" >Other Organ Invasion</td>
     </tr>
      <tr>
        <td style="white-space: nowrap;" >
            <euc:EformComboBox  Width="80px" RecordId="1" ParentRecord="11" TABLE="PancreasPath" FIELD="PathIPMN" ID="EformComboBox10" LookupCode="YesNoUnknown"  Runat="server"   /></td>
        <td style="white-space: nowrap;" >
            <euc:EformComboBox  Width="80px" RecordId="1" ParentRecord="11" TABLE="PancreasPath" FIELD="PathOtherOrganInv" ID="PathOtherOrganInv" LookupCode="YesNoUnknown"  Runat="server"   /></td>
            <%--<euc:EformComboBox  Width="80px" TABLE="NoTable" FIELD="PathOtherOrganInv" ID="PathOtherOrganInv" LookupCode="YesNoUnknown"  Runat="server"   /></td>--%>
      </tr>
     
</table>
<br />

<table  width="700" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="Table1" > 

          <tr>
            <td style="white-space: nowrap;" ><strong>Notes: </strong></td>
            <td >
                <euc:EformTextArea  Width="600px" Rows="4" RecordId="11" ParentRecord="11"   TABLE="Pathology" FIELD="PathNotes" ID="PathNotes" Runat="server" ShowCalendar="false" CalcDate="false" ShowTextEditor="true"  /></td>

          </tr>
 
</table>
<br /><br /><br />


