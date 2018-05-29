<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.PreviousProceduresBreastFU" CodeFile="PreviousProceduresBreastFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="PreviousProceduresBreastFU" /><span class="controlBoxTitle">Previous Procedures</span><br/>
<table  width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="PreviousProceduresBreastFUHdrTbl" > 
    <tr id="NoProcsTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" visible="false" > 
			        <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> 
			            No previous procedures were recorded for this patient.</td>
    </tr>
  <tr runat="server" visible="false" id="PrevProcsHdrTr">
	    <td class="controlBoxDataGridTitleColumn" style="text-align: left; width:100px;"  >Date</td>
        <td class="controlBoxDataGridTitleColumn" style="text-align: center; width:225px;" >Surgery</td>
        <td class="controlBoxDataGridTitleColumn" style="text-align: center; width:175px;" >Site</td>
        <td class="controlBoxDataGridTitleColumn" style="text-align: center; width:100px;" >Side</td>
        <td class="controlBoxDataGridTitleColumn" style="height: 10%; width:50px;" >&nbsp;</td>
  </tr>
</table>

<div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 210px; width:650px ; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
    <table width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="PreviousProceduresBreastFUHtmlTbl" >
    <asp:Repeater ID="rptSurgicalHistory" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
	    
       <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Procedures', <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'ProcDateText,ProcName,ProcSite,ProcSide,ProcQuality', 'Procedures');"> 
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;width:100px;"><%# DataBinder.Eval(Container.DataItem, "ProcDateText")%>&nbsp;</td>
             <td  class="ClinicalEformPopulatedColumn" style="text-align: center;width:225px;"><%# DataBinder.Eval(Container.DataItem, "ProcName")%>&nbsp;</td>
           <td  class="ClinicalEformPopulatedColumn" style="text-align: center;width:175px;"><%# DataBinder.Eval(Container.DataItem, "ProcSite")%>&nbsp;</td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: center;width:100px;"><%# DataBinder.Eval(Container.DataItem, "ProcSide")%>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn" style="width:50px;text-align: center;"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
        </tr> 
	</ItemTemplate>
  </asp:Repeater>         
</table>
</div><br /><br />