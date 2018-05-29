<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.AppointmentBreast" CodeFile="AppointmentBreast.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">

</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<style type="text/css">
#BreastHPITable td
{
}
</style>

<a name="AppointmentBreast" /><span class="controlBoxTitle">Chief Complaint</span> <br/>

<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="BreastApptTable">
  <tr>
		<td  class="controlBoxDataGridTitleColumn">Date</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Chief Complaint</td>
		<td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr>
	 <td><euc:EformTextBox RecordId="1" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Encounters" FIELD="EncDateText" 
	    Runat="server" ID="EncDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_1"/>
	 </td>
	 <td align="center">
        <euc:EformComboBox RecordId="1" TABLE="Encounters" FIELD="EncPhysician" Runat="server" ID="EncPhysician_1" Width="100px"
         LookupCode="ApptPhysician" DropDownWidth="200px"/>
        <euc:EformTextBox RecordId="1" TABLE="Encounters" FIELD="EncInstitution" Runat="server" ID="EncInstitution_1" 
            style=" display:none; width:1px;"/>
        <euc:EformTextBox RecordId="1" TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality_1" 
            style=" display:none; width:1px;"/>    
    </td>
    <td align="center"><euc:EformTextBox RecordId="1" Width="100px" TABLE="Encounters" FIELD="EncType" Runat="server" ID="EncType_1"/></td>
    <td align="center"><euc:EformTextBox RecordId="1" Width="200px" TABLE="Encounters" FIELD="EncChiefComplaint" Runat="server" 
        ID="EncChiefComplaint_1"/></td>    	
	<td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
</table><br /><br />

<table width="650" cellpadding="2" cellspacing="0"  class="eformLargePopulatedTable">
  <tr>
    <td align="left" height="22"><img src="../../Images/shim.gif" border="0" width="4" height="0"><strong>Referring M.D.:</strong> 
              <asp:Repeater ID="ReferringMD" Runat="server" > 
                <ItemTemplate> 
                  <%# DataBinder.Eval(Container.DataItem, "phFirstName") %>
                  <%# DataBinder.Eval(Container.DataItem, "phLastName") %>
                  ( 
                  <%# DataBinder.Eval(Container.DataItem, "phInstitution") %>
                  )</ItemTemplate>
                <SeparatorTemplate>, </SeparatorTemplate>
              </asp:Repeater> <asp:Label ID="blankReferrringMD" Runat="server"></asp:Label></td>
  </tr>
</table><br /><br />

<span class="controlBoxTitle">HPI</span> <br/>
<table id="BreastHPITable" cellspacing="0" cellpadding="0" style="width: auto; border: solid 1px #cccccc; border-bottom: none;">
<tr style="display: none;"><td><table cellspacing="0" cellpadding="0"><tr><td></td><%--this line is just to keep html well formed--%> 
        <asp:Repeater ID="hpi" Runat="server" OnItemDataBound="hpiItemDataBound">
        <%--<asp:Repeater ID="hpi" Runat="server">--%> 
            <ItemTemplate> 
                <asp:Literal ID="hpiStartNormalRow" runat="server" Visible="false" ></tr></table></td></tr><tr><td style="cursor: default; background-color: #EEF1F2; border-bottom: solid 1px #d8d8d8;"><table cellspacing="0" style="width: 100%;"><tr></asp:Literal>
                <asp:Literal ID="hpiStartMultiRow" runat="server" Visible="false"></tr></table></td></tr><tr><td style="cursor: default; background-color: #EEF1F2; border-bottom: solid 1px #d8d8d8;"><table cellspacing="0" ><tr></asp:Literal>
			    <td  class="ClinicalEformPopulatedRow" style="padding-right: 10px;padding-left: 10px; border-right: solid 1px #E1E1E1; font-size: 12px;" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  title="Click to View/Edit <%# DataBinder.Eval(Container.DataItem, "TableName")%> Data" onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "TableName")%>', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, '', '');" > <asp:Literal ID="hpiDate" runat="server" /> <%# DataBinder.Eval(Container.DataItem, "VarSummary")%><asp:Literal id="HpiRowItems" runat="server"/>&nbsp;</td>
            </ItemTemplate>
        </asp:Repeater> 
</tr></table></td></tr>
</table><br />


<script type="text/javascript">

    //Adds events to controls
    function addApptEvents(apptDate,apptCComplaint,apptPhysician,apptType,apptInst,apptQlty)
    { 
        $(apptDate).addEvent('blur',curry(SetApptFields,apptDate,apptCComplaint,apptPhysician,apptType,apptInst,apptQlty));
        $(apptCComplaint).addEvent('blur',curry(SetApptFields,apptDate,apptCComplaint,apptPhysician,apptType,apptInst,apptQlty));
        $(apptPhysician).addEvent('blur',curry(SetApptFields,apptDate,apptCComplaint,apptPhysician,apptType,apptInst,apptQlty));
   }

    addApptEvents($('<%= EncDateText_1.ClientID %>'),$('<%= EncChiefComplaint_1.ClientID %>'),$('<%= EncPhysician_1.ClientID %>'),$('<%= EncType_1.ClientID %>'),$('<%= EncInstitution_1.ClientID %>'),$('<%= EncQuality_1.ClientID %>'));
    
function SetApptFields(apptDate,apptCComplaint,apptPhysician,apptType,apptInst,apptQlty)
{
    if (apptDate.value != '' || apptCComplaint.value != '' || apptPhysician.value != '' )
    {
        apptType.value = 'FR';
        apptInst.value = 'Memorial Sloan Kettering Cancer Center';
        apptQlty.value = 'STD';
    }
    else
    { 
        apptType.value = '';
        apptInst.value = '';
        apptQlty.value = '';
    }
}
</script>