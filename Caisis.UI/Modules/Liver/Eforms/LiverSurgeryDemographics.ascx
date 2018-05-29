<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryDemographics" CodeFile="LiverSurgeryDemographics.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script language="javascript" type="text/javascript">
	tableArray.DemographicsHtmlTable = "DemographicsHtmlTable";
</script>

<a name="LiverSurgeryDemographics" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Demographics"></asp:Label><br/>


<br />
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DemographicsHtmlTable" >
    
      <tr id="DemographicsxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable"  > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> The demographics recorded for this patient has been populated below.  Click to edit.</td>            
    </tr>    


  <asp:Repeater ID="PtDemoGx" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
    <tr> 
		<td style="white-space: nowrap; "  align="left"  class="controlBoxDataGridTitleColumn"  width="250px">&nbsp;MRN&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;First&nbsp;</td>
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Last&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Gender&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >&nbsp;&nbsp;</td>
	</tr>
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtMRN,PtGender,PtBirthDateText,PtRace,PtFirstName,PtLastName,PtCountry,PtBirthPlace,PtLanguage', 'Patients');"> 
			<td id="rptr_PtMRN" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtMRN")%>&nbsp;</td>
			<td id="rptr_PtFirstName" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtFirstName")%>&nbsp;</td>
			<td id="rptr_PtLastName" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtLastName")%>&nbsp;</td>
			<td id="rptr_PtGender" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtGender")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
	</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <asp:Repeater ID="PtDemoGx2" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
    <tr> 
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Birth Date&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Country of Birth&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Race&nbsp;</td>
		<td style="white-space: nowrap; width: 80px;" align="left"  class="controlBoxDataGridTitleColumn">&nbsp;Language&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >&nbsp;&nbsp;</td>
	</tr>
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtMRN,PtGender,PtBirthDateText,PtRace,PtFirstName,PtLastName,PtBirthPlace,PtLanguage', 'Patients');"> 
			<td id="rptr_PtBirthDateText" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtBirthDateText")%>&nbsp;</td>
			<td id="rptr_PtTitle" class="ClinicalEformPopulatedColumn" >&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtBirthPlace")%>&nbsp;</td>  
			<td id="rptr_PtFirstName" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtRace")%>&nbsp;</td>
			<td id="rptr_PtSuffix" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtLanguage")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
	</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
 	
  </table>
  
    <br /><strong>Additional Demographics</strong>
<table width="200" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="Table1" >
	<tr  > 
		<td align="center" valign="top" width="100px" style="white-space: nowrap; width: 120px;" ><strong>Age&nbsp;<br /></strong>    
		    <asp:Label style="white-space: nowrap;"  runat="server" ID="Age" /></td>
 
        <td  style="white-space: nowrap;" align="center"><strong>Social Security Number&nbsp;<br /></strong>            
                              
               <asp:Repeater ID="rowHasHx1" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound2" > 
                <ItemTemplate>
	                <div align="center" class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Identifiers',  <%# DataBinder.Eval(Container.DataItem, "IdentifierId") %>, 'Identifier', 'Identifiers');"> 
		                <%# DataBinder.Eval(Container.DataItem, "Identifier")%>
	                </div>    
	                </ItemTemplate>
	           </asp:Repeater>
	                
                <div ID="rowNoHx1" runat="server">
                    <euc:EformRadioButtonList id="EnterSsnRBL" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" Table="NoTable" Field="EnterSsnRBL">
                       <asp:ListItem Value="N/A" Text="N/A"  Selected="True" />
                      <asp:ListItem Value="Yes" Text="Yes"  />
                    </euc:EformRadioButtonList>
                    <div id="EnterSsnDIV" runat="server">
                        <euc:EformTextBox style="width: 80px;" MaxLength="9"  Runat="server" RecordId="3" TABLE="Identifiers" FIELD="Identifier"  ID="SSN_Identifier" />
                         <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="3" TABLE="Identifiers" FIELD="IdType"  ID="SSN_IdType" />
                    </div>
                </div>            
        </td>
        <td  style="white-space: nowrap;"  align="center" valign="top"><strong>Legal Resident of US&nbsp;<br /></strong>              
            <euc:EformTextBox  Width="1px" style="display: none;" Runat="server" RecordId="2"  TABLE="Surveys" FIELD="SurveyType"  ID="SurveyType"  />            
            
            <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="2" ParentRecordId="2"  TABLE="SurveyItems" FIELD="SurveyItem"  ID="SurveyItem_LRUS" />
        
            <euc:EformDropDownList style="width: 80px;" Runat="server" RecordId="2" ParentRecordId="2"  TABLE="SurveyItems" FIELD="SurveyItemResult"  ID="SurveyItemResult_LRUS" LookupCode="YesNoUnknown"  >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </euc:EformDropDownList></td>

        <td  style="white-space: nowrap;"  align="center" valign="top"><strong>Year Immigrated to US&nbsp;<br /></strong>              
            <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="3" ParentRecordId="2"  TABLE="SurveyItems" FIELD="SurveyItem"  ID="SurveyItem_YIUS" />
        
            <euc:EformTextBox style="width: 80px;" MaxLength="4" Runat="server" RecordId="3" ParentRecordId="2"  TABLE="SurveyItems" FIELD="SurveyItemResult"  ID="SurveyItemResult_YIUS"  /></td>

        <td><euc:EformDeleteIcon ID="EformDeleteIcon_1" runat="server"/></td>

	</tr>  
</table>
<br/><br /><br />

<script type="text/javascript">
    //Adds events to controls
    addEvents($('<%= SurveyType.ClientID %>'), $('<%= SurveyItem_LRUS.ClientID %>'), $('<%= SurveyItemResult_LRUS.ClientID %>'), 'Legal Resident of US');
    addEvents($('<%= SurveyType.ClientID %>'), $('<%= SurveyItem_YIUS.ClientID %>'), $('<%= SurveyItemResult_YIUS.ClientID %>'), 'Year Immigrated to US');

    function addEvents(surveyTypeID, surveyItemID, surveyItemResultID, itemValue)
    {
        $(surveyItemResultID).addEvent('blur', curry(SetHiddenFields1, surveyTypeID, surveyItemID, surveyItemResultID, itemValue));
   }

    function SetHiddenFields1(surveyTypeID,surveyItemID,surveyItemResultID,itemValue)
    {
   
           if (surveyItemResultID.value != '')
            {
               surveyTypeID.value = "Residency Status";
               surveyItemID.value = itemValue;
            }
            else
            {
               surveyTypeID.value = '';
               surveyItemID.value = '';               
            }
             
             
    }


    addEvents2($('<%= SSN_Identifier.ClientID %>'), $('<%= SSN_IdType.ClientID %>'),$('<%= EnterSsnRBL.ClientID %>'), $('<%= EnterSsnDIV.ClientID %>'));

    function addEvents2(identifier, idtype, enterSsnRBL, enterSsnDiv) {
    
        $(identifier).addEvent('blur', curry(SetHiddenFields2, identifier, idtype));

        var rbl = enterSsnRBL.getElementsByTagName('input');
        for (var j = 0; j < rbl.length; j++) {
            var rblRef = rbl[j];
            if (rblRef.type == 'radio')
                $(rblRef).addEvent('click', curry(SetSSN, identifier, idtype, enterSsnRBL, enterSsnDiv));
            else if (rblRef.type == 'text')
                $(rblRef).addEvent('blur', curry(SetSSN, identifier, idtype, enterSsnRBL, enterSsnDiv));
        }

        SetSSN(identifier, idtype, enterSsnRBL, enterSsnDiv);
    }

    function SetHiddenFields2(identifier, idtype) {


        if (identifier.value != '') {
            if (IsNumeric(identifier.value) && identifier.value.length == 9)
                idtype.value = "Social Security Number";
            else {
                alert("Social Security Number must be a 9-digit number.  Please correct before continuing.");
                identifier.focus();
            }
        }
        else {
            idtype.value = '';
        }
    }

    function SetSSN(identifier, idtype, enterSsnRBL, enterSsnDiv) {

        var rblResponse = RetrieveRadioBtnListSelectedValues(enterSsnRBL, "TABLE");

        if (rblResponse != 'Yes') {
            enterSsnDiv.style.display = 'none';
            identifier.value = '';
            idtype.value = '';
        }
        else {
            enterSsnDiv.style.display = '';
            identifier.focus();
        }
    }

    function IsNumeric(strString)
    //  check for valid numeric strings  
    {
        var strValidChars = "0123456789";
        var strChar;
        var blnResult = true;

        if (strString.length == 0) return false;

        //  test strString consists of valid characters listed above
        for (i = 0; i < strString.length && blnResult == true; i++) {
            strChar = strString.charAt(i);
            if (strValidChars.indexOf(strChar) == -1) {
                blnResult = false;
            }
        }
        return blnResult;
    }

</script>
 