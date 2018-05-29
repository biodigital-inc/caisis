<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryEncountersAssessment" CodeFile="LiverSurgeryEncountersAssessment.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="LiverSurgeryEncountersAssessment" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Assessment"></asp:Label><br/>

<table width="650" border="0" cellspacing="0" cellpadding="10" style="border: solid 1px #cccccc;">
    <asp:Repeater ID="EncounterHx" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 

	    <HeaderTemplate>
            <tr class="controlBoxDataGridTitleColumn" >
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Date</td>
	            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"  >&nbsp;ECOG</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >KPS</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;</td>
            </tr>
		    <tr  ><td align="center" colspan="6"><i> <asp:Literal ID="MostRecentMsg" Runat="server" Visible="false" Text="most recent 10" /></i></td></tr>	    
	    </HeaderTemplate>	    
	    <ItemTemplate> 
			 <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Encounters',  <%# DataBinder.Eval(Container.DataItem, "EncounterId") %>, 'EncECOG_Score,EncKPS', 'Encounters');"> 
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "EncDateText")%></td>
			   <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "EncECOG_Score")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "EncKPS")%></td>
			   <td align="left" class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		    </tr>    	
    
	</ItemTemplate>
  </asp:Repeater>
  <tr>
    <td width="50" align="right" class="ClinicalEformGridColumnTwo"><strong>ECOG </strong></td>
    <td width="100" class="ClinicalEformGridColumnTwo"><euc:EformComboBox style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncECOG_Score" Runat="server" ID="EncECOG_Score" LookupCode="EncECOG_Score" DropDownWidth="575px"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnOne"><strong>KPS</strong></td>
    <td width="100" class="ClinicalEformGridColumnOne"><euc:EformComboBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncKPS" LookupCode="EncKPS_Score" Runat="server" ID="KPS" DropDownWidth="575px" /></td>
  </tr>
</table>
<br/>
<br/>
<br/>
