<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryStatusDiagnosis" CodeFile="LiverSurgeryStatusDiagnosis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script src="../../../ClientScripts/EFormScripts.js" type="text/javascript"></script>

<a name="LiverSurgeryStatusDiagnosis" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Date of Diagnosis"></asp:Label><br/>

<table width="400" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="DiagnosisDateHtmlTable" >
  <tr>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Date</td>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Disease Type</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
      <asp:Repeater ID="DiagnosisHx" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 

	    <HeaderTemplate>
		    <tr  ><td align="center" colspan="3"><i> <asp:Literal ID="MostRecentMsg" Runat="server" Visible="false" Text="most recent 10" /></i></td></tr>	    
	    </HeaderTemplate>	    
	    <ItemTemplate> 
			 <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Status',  <%# DataBinder.Eval(Container.DataItem, "StatusId") %>, 'StatusDateText,StatusDisease','Status');"> 
			   <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "StatusDateText")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "StatusDisease")%></td>
			   <td align="left" class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		    </tr>    	
    
	</ItemTemplate>
  </asp:Repeater>

<tr id="Diagnosis_Date_StatusRow_21" runat="server" >
    <td class="ClinicalEformPopulatedColumn" valign="top" ><asp:Label ID="Diagnosis_Date_DateLabel_21" Runat="server" />
	
		  <euc:EformTextBox Width="1px" style="display: none;" id="Diagnosis_Date_Status_21" runat="server" RecordId="21" Table="Status" FIELD="Status" />
		  <euc:EformTextBox Width="1px" style="display: none;" id="Diagnosis_Date_StatusDate_21" runat="server" RecordId="21" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="21"  FIELD="StatusDateText" Runat="server" ID="Diagnosis_Date_StatusDateText_21" />	</td>

    <td valign="top" >
        <euc:EformExtendedCheckBoxList style="width:80px; white-space: nowrap;" RecordId="21" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_21" LookupCode="NYULiverDisease" Runat="server" ShowOther="true" RepeatDirection="Vertical"  RepeatLayout="Table" >
        </euc:EformExtendedCheckBoxList></td>
        
    <td>&nbsp;</td>

</tr>


</table>
<br/><br/><br />

<script type="text/javascript">

    addEventsDiagnosis($('<%= Diagnosis_Date_Status_21.ClientID %>'), $('<%= Diagnosis_Date_StatusDateText_21.ClientID %>'),$('<%= Diagnosis_Date_StatusDate_21.ClientID %>'),$('<%= StatusDisease_21.ClientID %>'));

    function addEventsDiagnosis(statusID, dateTextID, dateID, diseaseID)
    {
        $(dateTextID).addEvent('blur', curry(SetHiddenFieldsDiagnosis, statusID, dateTextID, dateID, diseaseID));
        $(diseaseID).addEvent('click', curry(SetHiddenFieldsDiagnosis, statusID, dateTextID, dateID, diseaseID));
    }

    function SetHiddenFieldsDiagnosis(statusID, dateTextID, dateID, diseaseID)
    {
         diseseType = RetrieveCheckBoxListSelectedValues(diseaseID,"TABLE")

         if (dateTextID.value != '' || diseseType != '')
         {
            statusID.value = "Diagnosis Date";
         }
         else
             statusID.value = "";
            
    }


</script>  		   