<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.MedTxThoracic" CodeFile="MedTxThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.ThoracicMedTxTbl = "ThoracicMedTxTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="MedTxThoracic" /><span class="controlBoxTitle">Medical Therapies</span> <br/>

<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ThoracicMedTxTbl">
    <tr> 
        <td  class="controlBoxDataGridTitleColumn">Start Date</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Stop Date</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Agent</td>
	    <%--<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Intent</td>--%>
	    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Indication</td>
	    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    </tr>
        
    <asp:Repeater ID="ThoracicMedTxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	    <ItemTemplate> 
		    <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxDate,MedTxStopDateText,MedTxStopDate,MedTxDisease,MedTxAgent,MedTxType,MedTxIntent,MedTxIndication,MedTxTotalDose,MedTxUnits,MedTxInstitution,MedTxNotes,MedTxQuality', 'MedicalTherapy');"> 
			    <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %>&nbsp;</td>
			    <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText")%>&nbsp;</td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxType") %>&nbsp;</td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %>&nbsp;</td>
			    <%--<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxIntent")%>&nbsp;</td>--%>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxIndication")%>&nbsp;</td>
			    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		    </tr>      
	    </ItemTemplate>
    </asp:Repeater>
    
    <tr>
        <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="1" TABLE="MedicalTherapy" 
            FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_1"/>
	        <euc:EformHidden RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_1"/>
        </td>
        <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="1" TABLE="MedicalTherapy" 
                FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_1"/>
	        <euc:EformHidden RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_1"/>
        </td> 
        <td align="center"><euc:EformDropDownList RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_1" 
            LookupCode="MedTxType,Disease,Thoracic"/></td>          
        <td align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_1" 
            LookupCode="ThoracicMedTxAgent" Width="100px"/></td>
        <%--<td align="center"><euc:EformDropDownList RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxIntent" Runat="server" 
            ID="MedTxIntent_1" LookupCode="TxIntent,Disease,Thoracic"/></td>--%>            
        <td><euc:EformTextBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" ID="MedTxIndication_1" 
            Width="70px" ReadOnly="true"/>
            
            <euc:EformTextBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" ID="MedTxDisease_1"  
            style="display:none;width:1px;"/>
            <euc:EformTextBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_1" 
                style="display:none;width:1px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    
    <tr style="display:none;">
        <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="2" TABLE="MedicalTherapy" 
            FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_2"/>
	        <euc:EformHidden RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_2"/>
        </td>
        <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="2" TABLE="MedicalTherapy" 
                FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_2"/>
	        <euc:EformHidden RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_2"/>
        </td> 
        <td align="center"><euc:EformDropDownList RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_2" 
            LookupCode="MedTxType,Disease,Thoracic"/></td>          
        <td align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_2" 
            LookupCode="ThoracicMedTxAgent" Width="100px"/></td>
        <%--<td align="center"><euc:EformDropDownList RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxIntent" Runat="server" 
            ID="MedTxIntent_2" LookupCode="TxIntent,Disease,Thoracic"/></td>--%>            
        <td><euc:EformTextBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" ID="MedTxIndication_2" 
            Width="70px" ReadOnly="true"/>
            
            <euc:EformTextBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" ID="MedTxDisease_2"  
            style="display:none;width:1px;"/>
            <euc:EformTextBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_2" 
                style="display:none;width:1px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    
    <tr style="display:none;">
        <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="3" TABLE="MedicalTherapy" 
            FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_3"/>
	        <euc:EformHidden RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_3"/>
        </td>
        <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="3" TABLE="MedicalTherapy" 
                FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_3"/>
	        <euc:EformHidden RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_3"/>
        </td> 
        <td align="center"><euc:EformDropDownList RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_3" 
            LookupCode="MedTxType,Disease,Thoracic"/></td>          
        <td align="center"><euc:EformComboBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_3" 
            LookupCode="ThoracicMedTxAgent" Width="100px"/></td>
        <%--<td align="center"><euc:EformDropDownList RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxIntent" Runat="server" 
            ID="MedTxIntent_3" LookupCode="TxIntent,Disease,Thoracic"/></td>--%>            
        <td><euc:EformTextBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" ID="MedTxIndication_3" 
            Width="70px" ReadOnly="true"/>
            
            <euc:EformTextBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" ID="MedTxDisease_3"  
            style="display:none;width:1px;"/>
            <euc:EformTextBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_3" 
                style="display:none;width:1px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    
    <tr style="display:none;">
        <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="4" TABLE="MedicalTherapy" 
            FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_4"/>
	        <euc:EformHidden RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_4"/>
        </td>
        <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="4" TABLE="MedicalTherapy" 
                FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_4"/>
	        <euc:EformHidden RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_4"/>
        </td> 
        <td align="center"><euc:EformDropDownList RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_4" 
            LookupCode="MedTxType,Disease,Thoracic"/></td>          
        <td align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_4" 
            LookupCode="ThoracicMedTxAgent" Width="100px"/></td>
        <%--<td align="center"><euc:EformDropDownList RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxIntent" Runat="server" 
            ID="MedTxIntent_4" LookupCode="TxIntent,Disease,Thoracic"/></td>--%>            
        <td><euc:EformTextBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" ID="MedTxIndication_4" 
            Width="70px" ReadOnly="true"/>
            
            <euc:EformTextBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" ID="MedTxDisease_4"  
            style="display:none;width:1px;"/>
            <euc:EformTextBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_4" 
                style="display:none;width:1px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    
    <tr style="display:none;">
        <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="5" TABLE="MedicalTherapy" 
            FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_5"/>
	        <euc:EformHidden RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_5"/>
        </td>
        <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="5" TABLE="MedicalTherapy" 
                FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_5"/>
	        <euc:EformHidden RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_5"/>
        </td> 
        <td align="center"><euc:EformDropDownList RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_5" 
            LookupCode="MedTxType,Disease,Thoracic"/></td>          
        <td align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_5" 
            LookupCode="ThoracicMedTxAgent" Width="100px"/></td>
        <%--<td align="center"><euc:EformDropDownList RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxIntent" Runat="server" 
            ID="MedTxIntent_5" LookupCode="TxIntent,Disease,Thoracic"/></td>--%>            
        <td><euc:EformTextBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxIndication" Runat="server" ID="MedTxIndication_5" 
            Width="70px" ReadOnly="true"/>
            
            <euc:EformTextBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" ID="MedTxDisease_5"  
            style="display:none;width:1px;"/>
            <euc:EformTextBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_5" 
                style="display:none;width:1px;"/></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ThoracicMedTxTbl');" /><br /><br /><br />

<script type="text/javascript">
    //updates Med tx autopopulates
    function addEvents(medDate,medStopDt,medType,medIndc,medDis,medqlty)
    { 
        $(medDate).addEvent('blur',curry(AutoPopulates,medDate,medStopDt,medType,medIndc,medDis,medqlty));
        $(medStopDt).addEvent('blur',curry(AutoPopulates,medDate,medStopDt,medType,medIndc,medDis,medqlty));
        $(medType).addEvent('blur',curry(AutoPopulates,medDate,medStopDt,medType,medIndc,medDis,medqlty));
    } 
    
    addEvents($('<%= MedTxDateText_1.ClientID %>'),$('<%= MedTxStopDateText_1.ClientID %>'),$('<%= MedTxType_1.ClientID %>'),$('<%= MedTxIndication_1.ClientID %>'),$('<%= MedTxDisease_1.ClientID %>'),$('<%= MedTxQuality_1.ClientID %>'));
    addEvents($('<%= MedTxDateText_2.ClientID %>'),$('<%= MedTxStopDateText_2.ClientID %>'),$('<%= MedTxType_2.ClientID %>'),$('<%= MedTxIndication_2.ClientID %>'),$('<%= MedTxDisease_2.ClientID %>'),$('<%= MedTxQuality_2.ClientID %>'));
    addEvents($('<%= MedTxDateText_3.ClientID %>'),$('<%= MedTxStopDateText_3.ClientID %>'),$('<%= MedTxType_3.ClientID %>'),$('<%= MedTxIndication_3.ClientID %>'),$('<%= MedTxDisease_3.ClientID %>'),$('<%= MedTxQuality_3.ClientID %>'));
    addEvents($('<%= MedTxDateText_4.ClientID %>'),$('<%= MedTxStopDateText_4.ClientID %>'),$('<%= MedTxType_4.ClientID %>'),$('<%= MedTxIndication_4.ClientID %>'),$('<%= MedTxDisease_4.ClientID %>'),$('<%= MedTxQuality_4.ClientID %>'));
    addEvents($('<%= MedTxDateText_5.ClientID %>'),$('<%= MedTxStopDateText_5.ClientID %>'),$('<%= MedTxType_5.ClientID %>'),$('<%= MedTxIndication_5.ClientID %>'),$('<%= MedTxDisease_5.ClientID %>'),$('<%= MedTxQuality_5.ClientID %>'));

    function AutoPopulates(medDate,medStopDt,medType,medIndc,medDis,medqlty)
    {
       if (medDate.value != '' || medStopDt.value != '' || medType.value != '')
        {
           medIndc.value = 'Induction';
           medDis.value = 'Lung Cancer';
           medqlty.value = 'STD';
        }
        else
        {  
            medIndc.value = '';
            medDis.value = '';
            medqlty.value = '';
        }
    }    
</script>