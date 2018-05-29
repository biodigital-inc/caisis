<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryProceduresBiopsy" CodeFile="LiverSurgeryProceduresBiopsy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.ProceduresBiopsyLiverHtmlTable = "ProceduresBiopsyLiverHtmlTable";
	
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="LiverSurgeryProceduresBiopsy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Biopsy Performed"></asp:Label><br/>
<table  width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="ProceduresBiopsyLiverHtmlTable" > 


          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Date </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Type</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Pathology Report</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          
            <asp:Repeater ID="BiopsyHx" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 
                <HeaderTemplate>
		            <tr  ><td align="center" colspan="4"><i> <asp:Literal ID="MostRecentMsg" Runat="server" Visible="false" Text="most recent 10" /></i></td></tr>	    
	            </HeaderTemplate>	    
	            <ItemTemplate> 
			         <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Procedures',  <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'ProcDateText,ProcDate,ProcName,ProcApproach,ProcNotes', 'Procedures');"> 
			           <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcDateText")%></td>
		               <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcApproach")%></td>
		               <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcNotes")%></td>
			           <td align="left" class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		            </tr>    	
            
	        </ItemTemplate>
          </asp:Repeater>
          
          <tr>
            <td valign="top" >
                <euc:EformTextBox  Width="100px" RecordId="16"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" EnableHiddenOnUIEvent="ProcName" />
				<euc:EformHidden                RecordId="16"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate"     Runat="server"/>
                <euc:EformHidden RecordId="16"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName"     Value="Biopsy" Runat="server" TabIndex="2"  /></td>

             <td align="left" style="white-space: nowrap;" valign="top" >
                    <euc:EformExtendedCheckBoxList RecordId="16" TABLE="Procedures" FIELD="ProcApproach" Runat="server" ID="ProcApproach" LookupCode="NYULiverProcApproach3" RepeatDirection="Vertical" ShowOther="true" EnableHiddenOnUIEvent="ProcName" /></td>
		            
            <td valign="top" >
                <euc:EformTextBox  Width="100px" RecordId="16"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcName"/></td>

          </tr>
 

</table>
<br /><br /><br />


