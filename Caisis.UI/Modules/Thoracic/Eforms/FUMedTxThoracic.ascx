<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.FUMedTxThoracic" CodeFile="FUMedTxThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.FUMedTxTbl = "FUMedTxTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="FUMedTxThoracic" /><span class="controlBoxTitle">Medical Therapies</span> <br/>

<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="FUMedTxTbl">
    <tr> 
        <td  class="controlBoxDataGridTitleColumn">Start Date</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Indication</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
	    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    </tr>
        
    <asp:Repeater ID="FUMedTxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	    <ItemTemplate> 
		    <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxDate,MedTxDisease,MedTxAgent,MedTxType,MedTxIndication,', 'MedicalTherapy');"> 
			    <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %>&nbsp;</td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxType") %>&nbsp;</td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxIndication")%>&nbsp;</td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxDisease")%>&nbsp;</td>
			    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		    </tr>      
	    </ItemTemplate>
    </asp:Repeater>
    
    <tr>
        <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="6" TABLE="MedicalTherapy" 
            FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_6"/>
	        <euc:EformHidden RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_6"/>
        </td>
        <td align="center"><euc:EformSelect RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_6" 
            LookupCode="ThoracicMedTxType"/></td>
        <td align="center"><euc:EformTextBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" ID="MedTxIndication_6" 
            Width="100px" ReadOnly="true"/></td>
         <td align="center"><euc:EformTextBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" ID="MedTxDisease_6"  
            width="100px" ReadOnly="true"/>
            <euc:EformTextBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_6" 
                style="display:none;width:1px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    <tr style="display:none;">
        <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="7" TABLE="MedicalTherapy" 
            FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_7"/>
	        <euc:EformHidden RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_7"/>
        </td>
        <td align="center"><euc:EformSelect RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_7" 
            LookupCode="ThoracicMedTxType"/></td>
        <td align="center"><euc:EformTextBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" ID="MedTxIndication_7" 
            Width="100px" ReadOnly="true"/></td>
         <td align="center"><euc:EformTextBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" ID="MedTxDisease_7"  
            width="100px" ReadOnly="true"/>
            <euc:EformTextBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_7" 
                style="display:none;width:1px;"/></td>
        <td><euc:EformDeleteIcon runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    <tr style="display:none;">
        <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="8" TABLE="MedicalTherapy" 
            FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_8"/>
	        <euc:EformHidden RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_8"/>
        </td>
        <td align="center"><euc:EformSelect RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_8" 
            LookupCode="ThoracicMedTxType"/></td>
        <td align="center"><euc:EformTextBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" ID="MedTxIndication_8" 
            Width="100px" ReadOnly="true"/></td>
         <td align="center"><euc:EformTextBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" ID="MedTxDisease_8"  
            width="100px" ReadOnly="true"/>
            <euc:EformTextBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_8" 
                style="display:none;width:1px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    <tr style="display:none;">
        <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="9" TABLE="MedicalTherapy" 
            FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_9"/>
	        <euc:EformHidden RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_9"/>
        </td>
        <td align="center"><euc:EformSelect RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_9" 
            LookupCode="ThoracicMedTxType"/></td>
        <td align="center"><euc:EformTextBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" ID="MedTxIndication_9" 
            Width="100px" ReadOnly="true"/></td>
         <td align="center"><euc:EformTextBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" ID="MedTxDisease_9"  
            width="100px" ReadOnly="true"/>
            <euc:EformTextBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_9" 
                style="display:none;width:1px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    <tr style="display:none;">
        <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="10" TABLE="MedicalTherapy" 
            FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_10"/>
	        <euc:EformHidden RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_10"/>
        </td>
        <td align="center"><euc:EformSelect RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_10" 
            LookupCode="ThoracicMedTxType"/></td>
        <td align="center"><euc:EformTextBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" ID="MedTxIndication_10" 
            Width="100px" ReadOnly="true"/></td>
         <td align="center"><euc:EformTextBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" ID="MedTxDisease_10"  
            width="100px" ReadOnly="true"/>
            <euc:EformTextBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_10" 
                style="display:none;width:1px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'FUMedTxTbl');" /><br /><br /><br />

<script type="text/javascript">
    //updates Med tx autopopulates
    function addEvents(medDate,medType,medIndc,medDis,medqlty)
    { 
        $(medDate).addEvent('blur',curry(AutoPopulates,medDate,medType,medIndc,medDis,medqlty));
    } 
    
    addEvents($('<%= MedTxDateText_6.ClientID %>'),$('<%= MedTxType_6.ClientID %>'),$('<%= MedTxIndication_6.ClientID %>'),$('<%= MedTxDisease_6.ClientID %>'),$('<%= MedTxQuality_6.ClientID %>'));
    addEvents($('<%= MedTxDateText_7.ClientID %>'),$('<%= MedTxType_7.ClientID %>'),$('<%= MedTxIndication_7.ClientID %>'),$('<%= MedTxDisease_7.ClientID %>'),$('<%= MedTxQuality_7.ClientID %>'));
    addEvents($('<%= MedTxDateText_8.ClientID %>'),$('<%= MedTxType_8.ClientID %>'),$('<%= MedTxIndication_8.ClientID %>'),$('<%= MedTxDisease_8.ClientID %>'),$('<%= MedTxQuality_8.ClientID %>'));
    addEvents($('<%= MedTxDateText_9.ClientID %>'),$('<%= MedTxType_9.ClientID %>'),$('<%= MedTxIndication_9.ClientID %>'),$('<%= MedTxDisease_9.ClientID %>'),$('<%= MedTxQuality_9.ClientID %>'));
    addEvents($('<%= MedTxDateText_10.ClientID %>'),$('<%= MedTxType_10.ClientID %>'),$('<%= MedTxIndication_10.ClientID %>'),$('<%= MedTxDisease_10.ClientID %>'),$('<%= MedTxQuality_10.ClientID %>'));

    function AutoPopulates(medDate,medType,medIndc,medDis,medqlty)
    {
       if (medDate.value != '')
        {
           medType.value = 'CHEMO';
           medIndc.value = 'Adjuvant';
           medDis.value = 'Lung Cancer';
           medqlty.value = 'STD';
        }
        else
        {  
            medType.value = '';
            medIndc.value = '';
            medDis.value = '';
            medqlty.value = '';
        }
    }    
</script>