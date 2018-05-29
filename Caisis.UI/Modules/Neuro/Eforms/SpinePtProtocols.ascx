<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.SpinePtProtocols" CodeFile="SpinePtProtocols.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript"></script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="SpinePriorRadTx" /><span class="controlBoxTitle">Patient Protocols</span><br />  
<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <table width="650" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="SpinePtProtocolsTable">
                <tr id="NoSpinePtProtocolsMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No protocols were recorded for this patient.
                    </td>
                </tr>
          </table>
             
             <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 200px; width:850; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
             <table width="850" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="SpinePtProtocolsRptTable">
        <asp:Repeater ID="SpinePtProtocolsRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
        <HeaderTemplate>
            <tr runat="server" id="SpinePtProtocolsRptHdr">  
                <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Protocol</td>
                <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Date</td>
                <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Status</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Reason</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align:center;">Notes</td>
	            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
        </HeaderTemplate>
	    <ItemTemplate> 
		    <tr class="ClinicalEformPopulatedRowNonClickable" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('PatientProtocolStatus', <%# DataBinder.Eval(Container.DataItem, "PatientProtocolStatusId") %>, 'PtProtocolStatusDateText,PtProtocolStatus,PtProtocolStatusReason,PtProtocolStatusNotes', 'PatientProtocolStatus');"> 
		        <td class="ClinicalEformPopulatedColumn"><%# Eval("ProtocolNum").ToString() + ": " + Eval("ProtocolTitle").ToString()%></td>
			    <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("PtProtocolStatusDateText")%></td>
			    <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("PtProtocolStatus")%></td>
			    <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("PtProtocolStatusReason")%></td>
			    <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("PtProtocolStatusNotes")%></td>
			    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."></td>
		    </tr>      
	    </ItemTemplate>
      </asp:Repeater> 
      </table></div>
      </td></tr></table>