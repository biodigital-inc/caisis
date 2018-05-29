<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.TissueDxThoracic" CodeFile="TissueDxThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    function tissueDxDates()
	 {
	    var procDt = $('<%= ProcDateText_3.ClientID %>').value;
	    if(procDt != '')
	    {
	        $('<%= PathDateText_3.ClientID %>').value = procDt;
	        $('<%= PathDate_3.ClientID %>').value = $('<%= ProcDate_3.ClientID %>').value;
	        $('<%= PathQuality_3.ClientID %>').value='STD';
	    }
	    else
	    {
	        $('<%= PathDateText_3.ClientID %>').value = '';
	        $('<%= PathDate_3.ClientID %>').value = '';
	        $('<%= PathQuality_3.ClientID %>').value='';
	    }
	 }
	 
	function tissueDxProcDetails()
	{
	    if($('<%= ProcName_3.ClientID %>').value != '')
	    {
	        $('<%= ProcQuality_3.ClientID %>').value='STD';
	        $('<%= ProcIndication_3.ClientID %>').value='Tissue Diagnosis';
	    }
	    else
	    {
	        $('<%= ProcQuality_3.ClientID %>').value='';
	        $('<%= ProcIndication_3.ClientID %>').value='';
	    }
	}
	
	function tissueDxPathDetails()
	{
	    if($('<%= PathHistology_3.ClientID %>').value != '')
	    {
	        $('<%= PathQuality_3.ClientID %>').value='STD';
	    }
	    else
	    {
	        $('<%= PathQuality_3.ClientID %>').value='';
	    }
	}    
	
	function tissueDxDates1()
	 {
	    var procDt = $('<%= ProcDateText_4.ClientID %>').value;
	    if(procDt != '')
	    {
	        $('<%= PathDateText_4.ClientID %>').value = procDt;
	        $('<%= PathDate_4.ClientID %>').value = $('<%= ProcDate_4.ClientID %>').value;
	        $('<%= PathQuality_4.ClientID %>').value='STD';
	    }
	    else
	    {
	        $('<%= PathDateText_4.ClientID %>').value = '';
	        $('<%= PathDate_4.ClientID %>').value = '';
	        $('<%= PathQuality_4.ClientID %>').value='';
	    }
	 }
	 
	function tissueDxProcDetails1()
	{
	    if($('<%= ProcName_4.ClientID %>').value != '')
	    {
	        $('<%= ProcQuality_4.ClientID %>').value='STD';
	        $('<%= ProcIndication_4.ClientID %>').value='Tissue Diagnosis';
	    }
	    else
	    {
	        $('<%= ProcQuality_4.ClientID %>').value='';
	        $('<%= ProcIndication_4.ClientID %>').value='';
	    }
	}
	
	function tissueDxPathDetails1()
	{
	    if($('<%= PathHistology_4.ClientID %>').value != '')
	    {
	        $('<%= PathQuality_4.ClientID %>').value='STD';
	    }
	    else
	    {
	        $('<%= PathQuality_4.ClientID %>').value='';
	    }
	}    
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="TissueDxThoracic" /><span class="controlBoxTitle">Tissue Diagnosis</span> <br/>

<table width="550" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="TissueDxProcTbl">
    <tr>
        <td>        
            <span class="controlBoxDataGridHeader">Procedure</span> <br/>
            <table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProcHtmlTable">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Indication</td>
                <%--<td class="controlBoxDataGridHeaderFirstCol">Approach</td>--%>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>  
              <tr>
                <td><euc:EformTextBox  Width="80px" RecordId="3"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_3" Runat="server" 
                    ShowCalendar="true" CalcDate="true"  AppendToOnChange="UpdateAssociatedDate(this); tissueDxDates();" />
	                <euc:EformHidden  RecordId="3"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_3"     Runat="server"/></td>
	            <td align="center"><euc:EformComboBox Width="150px" RecordId="3"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_3" 
	                LookupCode="ProcName,Disease,Thoracic" DropDownHeight="auto" Runat="server" onblur="tissueDxProcDetails();" />
	                <euc:EformTextBox id="ProcQuality_3" RecordId="3" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" 
	                    style="display:none"/></td>
                <td align="center"><euc:EformTextBox id="ProcIndication_3" RecordId="3" Table="Procedures" Field="ProcIndication" runat="server" 
                    Width="100px" ReadOnly="true"/></td>
                <%--<td align="center"><euc:EformComboBox Width="100px" RecordId="3"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_3" 
	                LookupCode="OpApproach" DropDownHeight="auto" Runat="server"/></td>--%>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
            </table><br />

            <span class="controlBoxDataGridHeader">Pathology</span> <br/>
            <table width="400" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="TissueDxPathTbl">
              <tr> 
                 <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Histology</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr>
                <td><euc:EformTextBox RecordId="3" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_3" Runat="server" Width="80px" 
                    ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden  RecordId="3" TABLE="Pathology" FIELD="PathDate" ID="PathDate_3" Runat="server" />
                </td>
                <td align="center"><euc:EformComboBox Width="150px" RecordId="3"  TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_3" 
	                LookupCode="PathHistology,Disease,Thoracic" Runat="server" onblur="tissueDxPathDetails();" DropDownHeight="auto" />
	                <euc:EformTextBox id="PathQuality_3" RecordId="3" Table="Pathology" Field="PathQuality" runat="server" Width="1px" 
	                    style="display:none"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              </table>
        </td>
    </tr>
    
    <tr><td height="15"></td></tr>
    
    <tr>
        <td>
            <span class="controlBoxDataGridHeader">Additional Procedure</span> <br/>
            <table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="AdditionalProcHtmlTable">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Indication</td>
                <%--<td class="controlBoxDataGridHeaderFirstCol">Approach</td>--%>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr>
                <td><euc:EformTextBox  Width="80px" RecordId="4"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_4" Runat="server" 
                    ShowCalendar="true" CalcDate="true"  AppendToOnChange="UpdateAssociatedDate(this); tissueDxDates1();" />
	                <euc:EformHidden  RecordId="4"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_4"     Runat="server"/></td>
	            <td align="center"><euc:EformComboBox Width="150px" RecordId="4"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_4" 
	                LookupCode="ProcName,Disease,Thoracic" DropDownHeight="auto" Runat="server" onblur="tissueDxProcDetails1();" />
	                <euc:EformTextBox id="ProcQuality_4" RecordId="4" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" 
	                    style="display:none"/></td>
                <td align="center"><euc:EformTextBox id="ProcIndication_4" RecordId="4" Table="Procedures" Field="ProcIndication" runat="server" 
                    Width="100px" ReadOnly="true"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
            </table><br />

            <span class="controlBoxDataGridHeader">Pathology</span> <br/>
            <table width="400" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="TissueDxAddPathTbl">
              <tr> 
                 <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
                 <td class="controlBoxDataGridHeaderFirstCol" align="center">Histology</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr>
                <td><euc:EformTextBox RecordId="4" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_4" Runat="server" Width="80px" 
                    ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden  RecordId="4" TABLE="Pathology" FIELD="PathDate" ID="PathDate_4" Runat="server" />
                </td>
                <td align="center"><euc:EformComboBox Width="150px" RecordId="4"  TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_4" 
	                LookupCode="PathHistology,Disease,Thoracic" Runat="server" onblur="tissueDxPathDetails1();" DropDownHeight="auto" />
	                <euc:EformTextBox id="PathQuality_4" RecordId="4" Table="Pathology" Field="PathQuality" runat="server" Width="1px" 
	                    style="display:none"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              </table>
        </td>
    </tr>
</table>
<br /><br />