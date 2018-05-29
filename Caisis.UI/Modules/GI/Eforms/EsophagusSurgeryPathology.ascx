<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusSurgeryPathology" CodeFile="EsophagusSurgeryPathology.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.Pathology = "Pathology";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="EsophagusSurgeryPathology" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Report"></asp:Label><br/>
<table  width="700" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="Pathology" > 

          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Path Report Date</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Path #</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Pathologist </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Primary Histology</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;Secondary Histology</td>
          </tr>
          <tr>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox  Width="100px" RecordId="11" ParentRecord="11"   TABLE="Pathology" FIELD="PathDateText" ID="PathDateText" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="11" ParentRecord="11"   TABLE="Pathology" FIELD="PathDate"     ID="PathDate"     Runat="server"/></td>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox  Width="100px" RecordId="11" ParentRecord="11"   TABLE="Pathology" FIELD="PathNum" ID="PathNum" Runat="server" TabIndex="2"  ShowCalendar="false" CalcDate="false"  /></td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="11" ParentRecord="11"  TABLE="Pathology" FIELD="Pathologist" ID="Pathologist"   LookupCode="Pathologist,Disease,@DiseaseView"   Runat="server" TabIndex="3"  /> </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox Width="100px" RecordId="11" ParentRecord="11"  TABLE="Pathology" FIELD="PathHistology" ID="PathHistology"   LookupCode="PathHistology,Disease,@DiseaseView"   Runat="server" TabIndex="3" DropDownWidth="600px"   /> </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox Width="100px" RecordId="11" ParentRecord="11"  TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2"   LookupCode="PathHistology,Disease,@DiseaseView"   Runat="server" TabIndex="3" DropDownWidth="600px"   /> </td>

          </tr>
 
</table>

<br />

<table  width="700" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="Table1" > 

          <tr>
            <td style="white-space: nowrap;" ><strong>Notes: </strong></td>
            <td >
                <euc:EformTextArea  Width="600px" Rows="4" RecordId="11" ParentRecord="11"   TABLE="Pathology" FIELD="PathNotes" ID="PathNotes" Runat="server" TabIndex="2"  ShowCalendar="false" CalcDate="false" ShowTextEditor="true"  /></td>

          </tr>
 
</table>

<br /><br />

<strong>Margin Status</strong>
<table  border="0" cellpadding="6" cellspacing="0" class="eformlargepopulatedtable" id="Table2" > 

          <tr>
            <td style="white-space: nowrap;" ><strong>Negative margins</strong><br />
                <euc:EformDropDownList Width="100px" RecordId="11" ParentRecord="11"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_11"   Runat="server" LookupCode="YesNoUnknown" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="11" ParentRecord="11"  TABLE="PathologyFinding" FIELD="PathFinding" ID="PathFinding_11"   Runat="server"  /></td>

            <td style="white-space: nowrap;" ><strong>Positive proximal margin</strong><br />
                <euc:EformDropDownList Width="100px" RecordId="12" ParentRecord="11"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_12"   Runat="server" LookupCode="YesNoUnknown" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="12" ParentRecord="11"  TABLE="PathologyFinding" FIELD="PathFinding" ID="PathFinding_12"   Runat="server"  /></td>

            <td style="white-space: nowrap;" ><strong>Positive distal margin</strong><br />
                <euc:EformDropDownList Width="100px" RecordId="13" ParentRecord="11"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_13"   Runat="server" LookupCode="YesNoUnknown" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="13" ParentRecord="11"  TABLE="PathologyFinding" FIELD="PathFinding" ID="PathFinding_13"   Runat="server"  /></td>

            <td style="white-space: nowrap;" ><strong>Positive radial margin</strong><br />
                <euc:EformDropDownList Width="100px" RecordId="14" ParentRecord="11"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_14"   Runat="server" LookupCode="YesNoUnknown" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="14" ParentRecord="11"  TABLE="PathologyFinding" FIELD="PathFinding" ID="PathFinding_14"   Runat="server"  /></td>

          </tr>
          <tr>
            <td colspan="2" style="white-space: nowrap;" ><strong>Positive Barrett's Esophagus at margin - low grade</strong><br />
                <euc:EformDropDownList Width="100px" RecordId="15" ParentRecord="11"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_15"   Runat="server" LookupCode="YesNoUnknown" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="15" ParentRecord="11"  TABLE="PathologyFinding" FIELD="PathFinding" ID="PathFinding_15"   Runat="server"  /></td>

            <td colspan="2" style="white-space: nowrap;" ><strong>Positive Barrett's Esophagus at margin - high grade</strong><br />
                <euc:EformDropDownList Width="100px" RecordId="16" ParentRecord="11"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_16"   Runat="server" LookupCode="YesNoUnknown" />
                <euc:EformTextBox Width="1px" style="display: none; " RecordId="16" ParentRecord="11"  TABLE="PathologyFinding" FIELD="PathFinding" ID="PathFinding_16"   Runat="server"  /></td>

          </tr>
 
</table>

<br /><br />

<strong>Invasions</strong>
<table  border="0" cellpadding="6" cellspacing="0" class="eformlargepopulatedtableblue" id="Table3" > 

          <tr>
            <td style="white-space: nowrap;" ><strong>Lymphatic vessel invasion</strong><br />
                <euc:EformDropDownList Width="220px" RecordId="11" ParentRecord="11"  TABLE="Pathology" FIELD="PathLymphaticInv" ID="PathLymphaticInv_11"   Runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="L0 - No vascular invasion noted" Text="L0 - No vascular invasion noted" />
                    <asp:ListItem Value="L1 - Microscopic vascular invasion" Text="L1 - Microscopic vascular invasion" />
                    <asp:ListItem Value="L2 - Macroscopic vascular invasion" Text="L2 - Macroscopic vascular invasion" />
                </euc:EformDropDownList> </td>
            <td style="white-space: nowrap;" ><strong>Venous invasion</strong><br />
                <euc:EformDropDownList Width="220px" RecordId="11" ParentRecord="11"  TABLE="Pathology" FIELD="PathVascularInv" ID="PathVascularInv_11"   Runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="V0 - No vascular invasion noted" Text="V0 - No vascular invasion noted" />
                    <asp:ListItem Value="V1 - Microscopic vascular invasion" Text="V1 - Microscopic vascular invasion" />
                    <asp:ListItem Value="V2 - Macroscopic vascular invasion" Text="V2 - Macroscopic vascular invasion" />
                </euc:EformDropDownList> </td>
            <td style="white-space: nowrap;" ><strong>Neural invasion</strong><br />
                <euc:EformDropDownList Width="220px" RecordId="11" ParentRecord="11"  TABLE="Pathology" FIELD="PathPerineuralInv" ID="PathPerineuralInv_11"   Runat="server" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="PN0 - No perineural invasion noted" Text="PN0 - No perineural invasion noted" />
                    <asp:ListItem Value="PN1 - Microscopic perineural invasion" Text="PN1 - Microscopic perineural invasion" />
                    <asp:ListItem Value="PN2 - Macroscopic neural invasion" Text="PN2 - Macroscopic neural invasion" />
                </euc:EformDropDownList> </td>

</table>

<br /><br /><br />


<script type="text/javascript">
    /* <![CDATA[ */

    addEventPathMargins($('<%= PathFindResult_11.ClientID %>'), $('<%= PathFinding_11.ClientID %>'), 'Negative margins' );
    addEventPathMargins($('<%= PathFindResult_12.ClientID %>'), $('<%= PathFinding_12.ClientID %>'), 'Positive proximal margin' );
    addEventPathMargins($('<%= PathFindResult_13.ClientID %>'), $('<%= PathFinding_13.ClientID %>'), 'Positive distal margin' );
    addEventPathMargins($('<%= PathFindResult_14.ClientID %>'), $('<%= PathFinding_14.ClientID %>'), 'Positive radial margin' );
    addEventPathMargins($('<%= PathFindResult_15.ClientID %>'), $('<%= PathFinding_15.ClientID %>'), 'Positive Barrett’s Esophagus at margin – low grade' );
    addEventPathMargins($('<%= PathFindResult_16.ClientID %>'), $('<%= PathFinding_16.ClientID %>'), 'Positive Barrett’s Esophagus at margin – high grade' );


    function addEventPathMargins(pathFindResultID, pathFindingID, findingValue) {

        $(pathFindResultID).addEvent('blur', curry(SetFieldsPathMargins, pathFindResultID, pathFindingID, findingValue));
    }

    /* ]]> */

    function SetFieldsPathMargins(pathFindResultID, pathFindingID, findingValue) {

        if (pathFindResultID.value != '')
            pathFindingID.value = findingValue;
       else
            pathFindingID.value = '';
    }
</script>