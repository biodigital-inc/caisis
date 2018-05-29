<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.HeadNeckReconstruction" CodeFile="HeadNeckReconstruction.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
    tableArray.ReconstructionHtmlTable = "ReconstructionHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />


<%--Global Default Institution based on web.config --%>
<euc:CaisisTextBox style="display:none;"  Runat="server" ID="GlobalInstitution"   />

<a name="HeadNeckReconstruction" id="HeadNeckReconstruction" /><br/>

<table width="200" cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue">
    <tr>
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Reconstruction Procedure"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ReconstructionRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="ReconstructionRecorded">
                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </euc:EformRadioButtonList>
        </td>
    </tr>
</table>
<br />

<div id="ReconstructionDiv" runat="server" style="display: none;">
    
    <table border="0" cellspacing="1" cellpadding="3"  width="525" class="ClinicalEformTable" id="ReconstructionHtmlTable" >
         <tr>			
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Surgeon</td>            
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Reconstruction</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
        </tr>
        <tr>
            <td><euc:EformComboBox LookupCode="OpSurgeon,Disease,Head & Neck" DropDownWidth="250" Width="180px" ID="ProcSurgeon" TABLE="Procedures" FIELD="ProcSurgeon" runat="server" RecordId="18" />
                
                <euc:EformTextBox id="ProcInstitution" runat="server" RecordId="18" Table="Procedures" Field="ProcInstitution" style="display:none" />
                <euc:EformTextBox id="ProcQuality" runat="server" RecordId="18" Table="Procedures" Field="ProcQuality" style="display:none"/>
                <euc:EformTextBox id="ProcDateText" Table="Procedures" Field="ProcDateText" RecordId="18" runat="server" style="display:none"/>
                <euc:EformTextBox id="ProcDate" Table="Procedures" Field="ProcDate"  RecordId="18" runat="server" style="display:none"/>             
                <euc:EformTextBox id="ProcService" RecordId="18" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>   
            </td>
            <td><euc:EformComboBox  LookupCode="HeadNeckReconProcedures" style="width:200px;" DropDownWidth="200" RecordId="18" Field="ProcName" Table="Procedures" Runat="server" ID="ProcReconstruction"  /></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon" runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td><euc:EformComboBox LookupCode="OpSurgeon,Disease,Head & Neck" DropDownWidth="250" Width="180px" ID="ProcSurgeon_19" RecordId="19" TABLE="Procedures" FIELD="ProcSurgeon" runat="server" />
                
                <euc:EformTextBox id="ProcInstitution_19" runat="server" RecordId="19" Table="Procedures" Field="ProcInstitution" style="display:none" />
                <euc:EformTextBox id="ProcQuality_19" runat="server" RecordId="19" Table="Procedures" Field="ProcQuality" style="display:none"/>
                <euc:EformTextBox id="ProcDateText_19" runat="server" RecordId="19" Table="Procedures" Field="ProcDateText"  style="display:none"/>
                <euc:EformTextBox id="ProcDate_19" runat="server" RecordId="19" Table="Procedures" Field="ProcDate"   style="display:none"/>             
                <euc:EformTextBox id="ProcService_19" runat="server" RecordId="19" Table="Procedures" Field="ProcService" Width="1px" style="display:none"/>   
            </td>
            <td><euc:EformComboBox ID="ProcReconstruction_19" LookupCode="HeadNeckReconProcedures" RecordId="19" style="width:200px;" DropDownWidth="200" Field="ProcName" Table="Procedures" Runat="server"  /></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_19" runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td><euc:EformComboBox LookupCode="OpSurgeon,Disease,Head & Neck" DropDownWidth="250" Width="180px" ID="ProcSurgeon_20" RecordId="20" TABLE="Procedures" FIELD="ProcSurgeon" runat="server" />
                
                <euc:EformTextBox id="ProcInstitution_20" runat="server" RecordId="20" Table="Procedures" Field="ProcInstitution" style="display:none" />
                <euc:EformTextBox id="ProcQuality_20" runat="server" RecordId="20" Table="Procedures" Field="ProcQuality" style="display:none"/>
                <euc:EformTextBox id="ProcDateText_20" runat="server" RecordId="20" Table="Procedures" Field="ProcDateText"  style="display:none"/>
                <euc:EformTextBox id="ProcDate_20" runat="server" RecordId="20" Table="Procedures" Field="ProcDate"   style="display:none"/>             
                <euc:EformTextBox id="ProcService_20" runat="server" RecordId="20" Table="Procedures" Field="ProcService" Width="1px" style="display:none"/>   
            </td>
            <td><euc:EformComboBox ID="ProcReconstruction_20" LookupCode="HeadNeckReconProcedures" RecordId="20" style="width:200px;" DropDownWidth="200" Field="ProcName" Table="Procedures" Runat="server"  /></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_20" runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td><euc:EformComboBox LookupCode="OpSurgeon,Disease,Head & Neck" DropDownWidth="250" Width="180px" ID="ProcSurgeon_21" RecordId="21" TABLE="Procedures" FIELD="ProcSurgeon" runat="server" />
                
                <euc:EformTextBox id="ProcInstitution_21" runat="server" RecordId="21" Table="Procedures" Field="ProcInstitution" style="display:none" />
                <euc:EformTextBox id="ProcQuality_21" runat="server" RecordId="21" Table="Procedures" Field="ProcQuality" style="display:none"/>
                <euc:EformTextBox id="ProcDateText_21" runat="server" RecordId="21" Table="Procedures" Field="ProcDateText"  style="display:none"/>
                <euc:EformTextBox id="ProcDate_21" runat="server" RecordId="21" Table="Procedures" Field="ProcDate"   style="display:none"/>             
                <euc:EformTextBox id="ProcService_21" runat="server" RecordId="21" Table="Procedures" Field="ProcService" Width="1px" style="display:none"/>   
            </td>
            <td><euc:EformComboBox ID="ProcReconstruction_21" LookupCode="HeadNeckReconProcedures" RecordId="21" style="width:200px;" DropDownWidth="200" Field="ProcName" Table="Procedures" Runat="server"  /></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_21" runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td><euc:EformComboBox LookupCode="OpSurgeon,Disease,Head & Neck" DropDownWidth="250" Width="180px" ID="ProcSurgeon_22" RecordId="22" TABLE="Procedures" FIELD="ProcSurgeon" runat="server" />
                
                <euc:EformTextBox id="ProcInstitution_22" runat="server" RecordId="22" Table="Procedures" Field="ProcInstitution" style="display:none" />
                <euc:EformTextBox id="ProcQuality_22" runat="server" RecordId="22" Table="Procedures" Field="ProcQuality" style="display:none"/>
                <euc:EformTextBox id="ProcDateText_22" runat="server" RecordId="22" Table="Procedures" Field="ProcDateText"  style="display:none"/>
                <euc:EformTextBox id="ProcDate_22" runat="server" RecordId="22" Table="Procedures" Field="ProcDate"   style="display:none"/>             
                <euc:EformTextBox id="ProcService_22" runat="server" RecordId="22" Table="Procedures" Field="ProcService" Width="1px" style="display:none"/>   
            </td>
            <td><euc:EformComboBox ID="ProcReconstruction_22" LookupCode="HeadNeckReconProcedures" RecordId="22" style="width:200px;" DropDownWidth="200" Field="ProcName" Table="Procedures" Runat="server"  /></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_22" runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td><euc:EformComboBox LookupCode="OpSurgeon,Disease,Head & Neck" DropDownWidth="250" Width="180px" ID="ProcSurgeon_23" RecordId="23" TABLE="Procedures" FIELD="ProcSurgeon" runat="server" />
                
                <euc:EformTextBox id="ProcInstitution_23" runat="server" RecordId="23" Table="Procedures" Field="ProcInstitution" style="display:none" />
                <euc:EformTextBox id="ProcQuality_23" runat="server" RecordId="23" Table="Procedures" Field="ProcQuality" style="display:none"/>
                <euc:EformTextBox id="ProcDateText_23" runat="server" RecordId="23" Table="Procedures" Field="ProcDateText"  style="display:none"/>
                <euc:EformTextBox id="ProcDate_23" runat="server" RecordId="23" Table="Procedures" Field="ProcDate"   style="display:none"/>             
                <euc:EformTextBox id="ProcService_23" runat="server" RecordId="23" Table="Procedures" Field="ProcService" Width="1px" style="display:none"/>   
            </td>
            <td><euc:EformComboBox ID="ProcReconstruction_23" LookupCode="HeadNeckReconProcedures" RecordId="23" style="width:200px;" DropDownWidth="200" Field="ProcName" Table="Procedures" Runat="server"  /></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_23" runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td><euc:EformComboBox LookupCode="OpSurgeon,Disease,Head & Neck" DropDownWidth="250" Width="180px" ID="ProcSurgeon_24" RecordId="24" TABLE="Procedures" FIELD="ProcSurgeon" runat="server" />
                
                <euc:EformTextBox id="ProcInstitution_24" runat="server" RecordId="24" Table="Procedures" Field="ProcInstitution" style="display:none" />
                <euc:EformTextBox id="ProcQuality_24" runat="server" RecordId="24" Table="Procedures" Field="ProcQuality" style="display:none"/>
                <euc:EformTextBox id="ProcDateText_24" runat="server" RecordId="24" Table="Procedures" Field="ProcDateText"  style="display:none"/>
                <euc:EformTextBox id="ProcDate_24" runat="server" RecordId="24" Table="Procedures" Field="ProcDate"   style="display:none"/>             
                <euc:EformTextBox id="ProcService_24" runat="server" RecordId="24" Table="Procedures" Field="ProcService" Width="1px" style="display:none"/>   
            </td>
            <td><euc:EformComboBox ID="ProcReconstruction_24" LookupCode="HeadNeckReconProcedures" RecordId="24" style="width:200px;" DropDownWidth="200" Field="ProcName" Table="Procedures" Runat="server"  /></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_24" runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td><euc:EformComboBox LookupCode="OpSurgeon,Disease,Head & Neck" DropDownWidth="250" Width="180px" ID="ProcSurgeon_25" RecordId="25" TABLE="Procedures" FIELD="ProcSurgeon" runat="server" />
                
                <euc:EformTextBox id="ProcInstitution_25" runat="server" RecordId="25" Table="Procedures" Field="ProcInstitution" style="display:none" />
                <euc:EformTextBox id="ProcQuality_25" runat="server" RecordId="25" Table="Procedures" Field="ProcQuality" style="display:none"/>
                <euc:EformTextBox id="ProcDateText_25" runat="server" RecordId="25" Table="Procedures" Field="ProcDateText"  style="display:none"/>
                <euc:EformTextBox id="ProcDate_25" runat="server" RecordId="25" Table="Procedures" Field="ProcDate"   style="display:none"/>             
                <euc:EformTextBox id="ProcService_25" runat="server" RecordId="25" Table="Procedures" Field="ProcService" Width="1px" style="display:none"/>   
            </td>
            <td><euc:EformComboBox ID="ProcReconstruction_25" LookupCode="HeadNeckReconProcedures" RecordId="25" style="width:200px;" DropDownWidth="200" Field="ProcName" Table="Procedures" Runat="server"  /></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_25" runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td><euc:EformComboBox LookupCode="OpSurgeon,Disease,Head & Neck" DropDownWidth="250" Width="180px" ID="ProcSurgeon_26" RecordId="26" TABLE="Procedures" FIELD="ProcSurgeon" runat="server" />
                
                <euc:EformTextBox id="ProcInstitution_26" runat="server" RecordId="26" Table="Procedures" Field="ProcInstitution" style="display:none" />
                <euc:EformTextBox id="ProcQuality_26" runat="server" RecordId="26" Table="Procedures" Field="ProcQuality" style="display:none"/>
                <euc:EformTextBox id="ProcDateText_26" runat="server" RecordId="26" Table="Procedures" Field="ProcDateText"  style="display:none"/>
                <euc:EformTextBox id="ProcDate_26" runat="server" RecordId="26" Table="Procedures" Field="ProcDate"   style="display:none"/>             
                <euc:EformTextBox id="ProcService_26" runat="server" RecordId="26" Table="Procedures" Field="ProcService" Width="1px" style="display:none"/>   
            </td>
            <td><euc:EformComboBox ID="ProcReconstruction_26" LookupCode="HeadNeckReconProcedures" RecordId="26" style="width:200px;" DropDownWidth="200" Field="ProcName" Table="Procedures" Runat="server"  /></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_26" runat="server"/></td>
        </tr>
        <tr style="display: none;">
            <td><euc:EformComboBox LookupCode="OpSurgeon,Disease,Head & Neck" DropDownWidth="250" Width="180px" ID="ProcSurgeon_27" RecordId="27" TABLE="Procedures" FIELD="ProcSurgeon" runat="server" />
                
                <euc:EformTextBox id="ProcInstitution_27" runat="server" RecordId="27" Table="Procedures" Field="ProcInstitution" style="display:none" />
                <euc:EformTextBox id="ProcQuality_27" runat="server" RecordId="27" Table="Procedures" Field="ProcQuality" style="display:none"/>
                <euc:EformTextBox id="ProcDateText_27" runat="server" RecordId="27" Table="Procedures" Field="ProcDateText"  style="display:none"/>
                <euc:EformTextBox id="ProcDate_27" runat="server" RecordId="27" Table="Procedures" Field="ProcDate"   style="display:none"/>             
                <euc:EformTextBox id="ProcService_27" runat="server" RecordId="27" Table="Procedures" Field="ProcService" Width="1px" style="display:none"/>   
            </td>
            <td><euc:EformComboBox ID="ProcReconstruction_27" LookupCode="HeadNeckReconProcedures" RecordId="27" style="width:200px;" DropDownWidth="200" Field="ProcName" Table="Procedures" Runat="server"  /></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_27" runat="server"/></td>
        </tr>
    </table>
    <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRowLocal(this,'ReconstructionHtmlTable');" />
    <br /><br />    
</div>
<br/><br/>

<script type="text/javascript">
    
    addEvents($('<%= ReconstructionRecorded.ClientID %>'), $('<%= ReconstructionDiv.ClientID %>'), $('<%= ProcReconstruction.ClientID %>'), $('<%= ProcSurgeon.ClientID %>'), $('<%= ProcInstitution.ClientID %>'), $('<%= ProcQuality.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcService.ClientID %>'), $('<%= GlobalInstitution.ClientID %>').value);
    addEvents($('<%= ReconstructionRecorded.ClientID %>'), $('<%= ReconstructionDiv.ClientID %>'), $('<%= ProcReconstruction_19.ClientID %>'), $('<%= ProcSurgeon_19.ClientID %>'), $('<%= ProcInstitution_19.ClientID %>'), $('<%= ProcQuality_19.ClientID %>'), $('<%= ProcDateText_19.ClientID %>'), $('<%= ProcDate_19.ClientID %>'), $('<%= ProcService_19.ClientID %>'), $('<%= GlobalInstitution.ClientID %>').value);
    addEvents($('<%= ReconstructionRecorded.ClientID %>'), $('<%= ReconstructionDiv.ClientID %>'), $('<%= ProcReconstruction_20.ClientID %>'), $('<%= ProcSurgeon_20.ClientID %>'), $('<%= ProcInstitution_20.ClientID %>'), $('<%= ProcQuality_20.ClientID %>'), $('<%= ProcDateText_20.ClientID %>'), $('<%= ProcDate_20.ClientID %>'), $('<%= ProcService_20.ClientID %>'), $('<%= GlobalInstitution.ClientID %>').value);
    addEvents($('<%= ReconstructionRecorded.ClientID %>'), $('<%= ReconstructionDiv.ClientID %>'), $('<%= ProcReconstruction_21.ClientID %>'), $('<%= ProcSurgeon_21.ClientID %>'), $('<%= ProcInstitution_21.ClientID %>'), $('<%= ProcQuality_21.ClientID %>'), $('<%= ProcDateText_21.ClientID %>'), $('<%= ProcDate_21.ClientID %>'), $('<%= ProcService_21.ClientID %>'), $('<%= GlobalInstitution.ClientID %>').value);
    addEvents($('<%= ReconstructionRecorded.ClientID %>'), $('<%= ReconstructionDiv.ClientID %>'), $('<%= ProcReconstruction_22.ClientID %>'), $('<%= ProcSurgeon_22.ClientID %>'), $('<%= ProcInstitution_22.ClientID %>'), $('<%= ProcQuality_22.ClientID %>'), $('<%= ProcDateText_22.ClientID %>'), $('<%= ProcDate_22.ClientID %>'), $('<%= ProcService_22.ClientID %>'), $('<%= GlobalInstitution.ClientID %>').value);
    addEvents($('<%= ReconstructionRecorded.ClientID %>'), $('<%= ReconstructionDiv.ClientID %>'), $('<%= ProcReconstruction_23.ClientID %>'), $('<%= ProcSurgeon_23.ClientID %>'), $('<%= ProcInstitution_23.ClientID %>'), $('<%= ProcQuality_23.ClientID %>'), $('<%= ProcDateText_23.ClientID %>'), $('<%= ProcDate_23.ClientID %>'), $('<%= ProcService_23.ClientID %>'), $('<%= GlobalInstitution.ClientID %>').value);
    addEvents($('<%= ReconstructionRecorded.ClientID %>'), $('<%= ReconstructionDiv.ClientID %>'), $('<%= ProcReconstruction_24.ClientID %>'), $('<%= ProcSurgeon_24.ClientID %>'), $('<%= ProcInstitution_24.ClientID %>'), $('<%= ProcQuality_24.ClientID %>'), $('<%= ProcDateText_24.ClientID %>'), $('<%= ProcDate_24.ClientID %>'), $('<%= ProcService_24.ClientID %>'), $('<%= GlobalInstitution.ClientID %>').value);
    addEvents($('<%= ReconstructionRecorded.ClientID %>'), $('<%= ReconstructionDiv.ClientID %>'), $('<%= ProcReconstruction_25.ClientID %>'), $('<%= ProcSurgeon_25.ClientID %>'), $('<%= ProcInstitution_25.ClientID %>'), $('<%= ProcQuality_25.ClientID %>'), $('<%= ProcDateText_25.ClientID %>'), $('<%= ProcDate_25.ClientID %>'), $('<%= ProcService_25.ClientID %>'), $('<%= GlobalInstitution.ClientID %>').value);
    addEvents($('<%= ReconstructionRecorded.ClientID %>'), $('<%= ReconstructionDiv.ClientID %>'), $('<%= ProcReconstruction_26.ClientID %>'), $('<%= ProcSurgeon_26.ClientID %>'), $('<%= ProcInstitution_26.ClientID %>'), $('<%= ProcQuality_26.ClientID %>'), $('<%= ProcDateText_26.ClientID %>'), $('<%= ProcDate_26.ClientID %>'), $('<%= ProcService_26.ClientID %>'), $('<%= GlobalInstitution.ClientID %>').value);
    addEvents($('<%= ReconstructionRecorded.ClientID %>'), $('<%= ReconstructionDiv.ClientID %>'), $('<%= ProcReconstruction_27.ClientID %>'), $('<%= ProcSurgeon_27.ClientID %>'), $('<%= ProcInstitution_27.ClientID %>'), $('<%= ProcQuality_27.ClientID %>'), $('<%= ProcDateText_27.ClientID %>'), $('<%= ProcDate_27.ClientID %>'), $('<%= ProcService_27.ClientID %>'), $('<%= GlobalInstitution.ClientID %>').value);
    
    function addEvents(ReconstructionRecorded, ReconstructionDiv, ProcReconstruction, ProcSurgeon, ProcInstitution, ProcQuality, ProcDateText, ProcDate, ProcService, institutionValue) {

        var rbl = ReconstructionRecorded.getElementsByTagName('input');
        for (var j = 0; j < rbl.length; j++) {
            var rblRef = rbl[j];
            if (rblRef.type == 'radio')
                $(rblRef).addEvent('click', curry(SetHideSection, ReconstructionRecorded, ReconstructionDiv, ProcReconstruction, ProcSurgeon, ProcInstitution, ProcQuality, ProcDateText, ProcDate, ProcService, institutionValue));
        }

        $(ProcSurgeon).addEvent('blur', curry(SetHideSection, ReconstructionRecorded, ReconstructionDiv, ProcReconstruction, ProcSurgeon, ProcInstitution, ProcQuality, ProcDateText, ProcDate, ProcService, institutionValue));
        $(ProcReconstruction).addEvent('blur', curry(SetHideSection, ReconstructionRecorded, ReconstructionDiv, ProcReconstruction, ProcSurgeon, ProcInstitution, ProcQuality, ProcDateText, ProcDate, ProcService, institutionValue));

        SetHideSection(ReconstructionRecorded, ReconstructionDiv, ProcReconstruction, ProcSurgeon, ProcInstitution, ProcQuality, ProcDateText, ProcDate, ProcService, institutionValue);
    }

    function SetHideSection(ReconstructionRecorded, ReconstructionDiv, ProcReconstruction, ProcSurgeon, ProcInstitution, ProcQuality, ProcDateText, ProcDate, ProcService, institutionValue) {
        
        var ReconstructionRecordedRef = ReconstructionRecorded.getElementsByTagName('input');
        for (var i = 0; i < ReconstructionRecordedRef.length; i++)
            if (ReconstructionRecordedRef[i].checked) {
                if (ReconstructionRecordedRef[i].value == "Yes") {
                    ReconstructionDiv.style.display = 'block';
                    if (ProcReconstruction.value != '') {                        
                        ProcInstitution.value = institutionValue;
                        ProcQuality.value = 'STD';
                        ProcDateText.value = '';
                        ProcDate.value = '';
                        ProcService.value = 'Head and Heck';
                    }
                }
                else if (ReconstructionRecordedRef[i].value == "No") {
                    ReconstructionDiv.style.display = 'none';
                    ProcSurgeon.value = '';
                    ProcReconstruction.value = '';
                    ProcInstitution.value = '';
                    ProcQuality.value = '';
                    ProcDateText.value = '';
                    ProcDate.value = '';
                    ProcService.value = '';
                }
            }
    }

    function showFirstAdditionalRowLocal(linkReference, tableId) {
        var rowShown = false;
        var hideWidget = true;
        var table = document.getElementById(tableId);
        for (i = 0; i < table.rows.length; i++) {
            var row = table.rows[i];
            if (rowShown == false && row.style['display'] == 'none') {
                row.style['display'] = '';
                rowShown = true;

            } else if (rowShown == true && row.style['display'] == 'none') {
                hideWidget = false;
            }
        }

        if (hideWidget) {
            linkReference.style['display'] = 'none';
        }
        return false;
    }

</script>
