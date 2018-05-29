<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.ThyroidPostSurgicalTx" CodeFile="ThyroidPostSurgicalTx.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.PostSurgicalHtmlTable = "PostSurgicalHtmlTable";
</script>
<script type="text/javascript">

    function updateSalvageDates()
	 {	    
	    $('<%= OpDateText_2.ClientID %>').value = $('<%= ProcDateText_8.ClientID %>').value;
	    $('<%= OpDate_2.ClientID %>').value = $('<%= ProcDate_8.ClientID %>').value;
	    $('<%= OpCaseSurgeon_2.ClientID %>').value = $('<%= ProcSurgeon_1.ClientID %>').value;
	    $('<%= OpQuality_2.ClientID %>').value='STD';
	 }
	 
    function SurgeryRadioClick(option_value,div_id,dateTextFieldId, shortdate, dateFieldId, date, tableId, value1, fieldId, value2, fieldValue, value3, reasonId, value4, qltyId, value5)
    {
      var hideDiv = document.getElementById(div_id);
      if (option_value == "Yes")
      {
        hideDiv.style.display='block'; 
        
        //clears absent event data
        clearElementsInParentRow(document.getElementById('PostSurgicalAbsentRow'));
      } 
      else if (option_value == "No")
      {        
        hideDiv.style.display='none';
        
        //clears all rows data
        clearElementsInParentRow(document.getElementById('PostSurgicalHtmlRow1'));
        clearElementsInParentRow(document.getElementById('PostSurgicalHtmlRow2'));
        clearElementsInParentRow(document.getElementById('PostSurgicalHtmlRow3'));
        clearElementsInParentRow(document.getElementById('PostSurgicalHtmlRow4'));
        clearElementsInParentRow(document.getElementById('PostSurgicalHtmlRow5')); 
        
        //assign values to absent record
        document.getElementById(dateTextFieldId).value = shortdate;
        document.getElementById(dateFieldId).value = date;
        document.getElementById(tableId).value = value1;        
        document.getElementById(fieldId).value = value2;
        document.getElementById(fieldValue).value = value3;
        document.getElementById(reasonId).value = value4;
        document.getElementById(qltyId).value = value5;
      }
    }
    
    function updateSurgeon(salSurg, salInstId, salSerId, salSiteId, salIndicationId, salQltyId)
    {
        document.getElementById(salSurg).value = document.getElementById('<%= ProcSurgeon_1.ClientID %>').value;
        document.getElementById(salInstId).value='Memorial Sloan Kettering Cancer Center';
	    document.getElementById(salSerId).value='Head and Neck';
	    document.getElementById(salSiteId).value='Thyroid';
	    document.getElementById(salIndicationId).value='Salvage';
	    document.getElementById(salQltyId).value='STD';
    }
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
<script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>

<a name="ThyroidPostSurgicalTx" />  
<table>
    <tr>
        <td>
            <span class="controlBoxTitle">Salvage Surgery Done ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="SalvageSurgeryDone" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="62" Table="NoTable" Field="SalvageSurgeryDone">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>
  
<div id="ProcDiv" runat="server" style="display:none;">
<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PostSurgicalHtmlTable">
    <tr> 
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Procedure</td>
        <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    </tr>
    <tr id="PostSurgicalHtmlRow1">
        <td height="28" ><euc:EformTextBox Runat="server" RecordId="8"  ID="ProcDateText_8" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="63" AppendToOnChange="UpdateAssociatedDate(this); updateSalvageDates();" />
        <euc:EformHidden RecordId="8" Runat="server" ID="ProcDate_8" Table="Procedures" Field="ProcDate" /></td>
        <td align="center"><euc:EformDropDownList Table="Procedures" Field="ProcName" RecordId="8" LookupCode="ThyroidPostProc" Runat="server" id="ProcName_8" TabIndex="64" />
        <euc:EformTextBox id="ProcSurgeon_1" RecordId="1" Table="Procedures" Field="ProcSurgeon" runat="server" Width="1px" style="display:none;"/>
        <euc:EformTextBox id="ProcSurgeon_8" RecordId="8" Table="Procedures" Field="ProcSurgeon" runat="server" Width="1px" style="display:none;"/>
        <euc:EformTextBox id="ProcInstitution_8" RecordId="8" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcService_8" RecordId="8" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcSite_8" RecordId="8" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcIndication_8" RecordId="8" Table="Procedures" Field="ProcIndication" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcQuality_8" RecordId="8" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" style="display:none"/>
        
        <%--updating OR details--%>
        <euc:EformTextBox RecordId="2" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_2" Runat="server" style="display:none;width:1px;"/>
	    <euc:EformHidden  RecordId="2" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_2" Runat="server" />
	    <euc:EformTextBox id="OpQuality_2" RecordId="2" Table="OperatingRoomDetails" Field="OpQuality" runat="server" Width="1px" style="display:none"/>
	    <euc:EformTextBox id="OpCaseSurgeon_2" RecordId="2" Table="OperatingRoomDetails" Field="OpCaseSurgeon" runat="server" Width="1px" style="display:none"/>  
	  </td>
        <td><euc:EformDeleteIcon runat="server" /></td>         
    </tr>  
    
    <tr id="PostSurgicalHtmlRow2" style="display: none">
        <td height="28" ><euc:EformTextBox Runat="server" RecordId="9"  ID="ProcDateText_9" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="65"  /><euc:EformHidden RecordId="9" Runat="server" ID="ProcDate_9" Table="Procedures" Field="ProcDate" /></td>
        <td align="center"><euc:EformDropDownList Table="Procedures" Field="ProcName" RecordId="9" LookupCode="ThyroidPostProc" Runat="server" id="ProcName_9" TabIndex="66"/>
        <euc:EformTextBox id="ProcSurgeon_9" RecordId="9" Table="Procedures" Field="ProcSurgeon" runat="server" Width="1px" style="display:none;"/>
        <euc:EformTextBox id="ProcInstitution_9" RecordId="9" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcService_9" RecordId="9" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcSite_9" RecordId="9" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcIndication_9" RecordId="9" Table="Procedures" Field="ProcIndication" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcQuality_9" RecordId="9" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" style="display:none"/>
        </td>
        <td><euc:EformDeleteIcon runat="server" /></td>         
    </tr> 
    
    <tr id="PostSurgicalHtmlRow3" style="display: none">
        <td height="28" ><euc:EformTextBox Runat="server" RecordId="10"  ID="ProcDateText_10" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="67"  /><euc:EformHidden RecordId="10" Runat="server" ID="ProcDate_10" Table="Procedures" Field="ProcDate" TabIndex="68"/></td>
        <td align="center"><euc:EformDropDownList Table="Procedures" Field="ProcName" RecordId="10" LookupCode="ThyroidPostProc" Runat="server" id="ProcName_10" />
        <euc:EformTextBox id="ProcSurgeon_10" RecordId="10" Table="Procedures" Field="ProcSurgeon" runat="server" Width="1px" style="display:none;"/>
        <euc:EformTextBox id="ProcInstitution_10" RecordId="10" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcService_10" RecordId="10" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcSite_10" RecordId="10" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcIndication_10" RecordId="10" Table="Procedures" Field="ProcIndication" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcQuality_10" RecordId="10" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" style="display:none"/>
        </td>
        <td><euc:EformDeleteIcon runat="server" /></td>         
    </tr> 
    
    <tr id="PostSurgicalHtmlRow4" style="display: none">
        <td height="28" ><euc:EformTextBox Runat="server" RecordId="11"  ID="ProcDateText_11" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="69"  /><euc:EformHidden RecordId="11" Runat="server" ID="ProcDate_11" Table="Procedures" Field="ProcDate" /></td>
        <td align="center"><euc:EformDropDownList Table="Procedures" Field="ProcName" RecordId="11" LookupCode="ThyroidPostProc" Runat="server" id="ProcName_11" TabIndex="70"/>
        <euc:EformTextBox id="ProcSurgeon_11" RecordId="11" Table="Procedures" Field="ProcSurgeon" runat="server" Width="1px" style="display:none;"/>
        <euc:EformTextBox id="ProcInstitution_11" RecordId="11" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcService_11" RecordId="11" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcSite_11" RecordId="11" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcIndication_11" RecordId="11" Table="Procedures" Field="ProcIndication" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcQuality_11" RecordId="11" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" style="display:none"/>
        </td>
        <td><euc:EformDeleteIcon runat="server" /></td>         
    </tr> 
    
    <tr id="PostSurgicalHtmlRow5" style="display: none">
        <td height="28" ><euc:EformTextBox Runat="server" RecordId="12"  ID="ProcDateText_12" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="71"  /><euc:EformHidden RecordId="12" Runat="server" ID="ProcDate_12" Table="Procedures" Field="ProcDate" /></td>
        <td align="center"><euc:EformDropDownList Table="Procedures" Field="ProcName" RecordId="12" LookupCode="ThyroidPostProc" Runat="server" id="ProcName_12" TabIndex="72"/>
        <euc:EformTextBox id="ProcSurgeon_12" RecordId="12" Table="Procedures" Field="ProcSurgeon" runat="server" Width="1px" style="display:none;"/>
        <euc:EformTextBox id="ProcInstitution_12" RecordId="12" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcService_12" RecordId="12" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcSite_12" RecordId="12" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcIndication_12" RecordId="12" Table="Procedures" Field="ProcIndication" runat="server" Width="1px" style="display:none"/>
        <euc:EformTextBox id="ProcQuality_12" RecordId="12" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" style="display:none"/>
        </td>
        <td><euc:EformDeleteIcon runat="server" /></td>         
    </tr>   
</table>
<img alt="row" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'PostSurgicalHtmlTable');" />
</div><br/><br/>

<table>
    <tr id="PostSurgicalAbsentRow">
        <td>
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_5"
                Runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="TableName" ID="TableName_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="FieldName" ID="FieldName_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_5"
                runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>