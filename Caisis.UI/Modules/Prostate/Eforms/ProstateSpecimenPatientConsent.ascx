<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSpecimenPatientConsent" CodeFile="ProstateSpecimenPatientConsent.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ProstateSpecimenPatientConsent" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Consent Status"></asp:Label><br/>

<euc:CaisisTextBox Width="1px" style="display: none;" ID="EformName" runat="server"></euc:CaisisTextBox>

    <table cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue" id="ProstateSpecimenPatientConsentHtmlTable">
        
        <tr>
            <td style="white-space: nowrap;" ><strong>Date Prepared: </strong>
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="100px"  Runat="server" RecordId="1" ID="ConsentDateText_1" TABLE="PatientConsent" FIELD="ConsentDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="1" ID="ConsentDate_1" TABLE="PatientConsent" FIELD="ConsentDate" /></td>
       </tr>        
        <tr>
            <td style="white-space: nowrap;" width="200px" ><strong>Initials of individual confirming patient’s consented status: </strong>
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="50px"  Runat="server" RecordId="1" ID="ConsentedBy_1" TABLE="PatientConsent" FIELD="ConsentedBy"  />  		    
            </td>
       </tr>        
        <tr>
            <td style="white-space: nowrap;" ><strong>Name of Individual Preparing CRF: </strong>
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="275px"  Runat="server" RecordId="1" ID="ObtainPerson_1" TABLE="PatientConsent" FIELD="ObtainPerson"  />  		    
            </td>
       </tr>        
        <tr>
            <td style="white-space: nowrap;" ><strong>Protocol: </strong>
            </td>
            <td>
                <euc:EformTextBox Width="275px"  Runat="server" RecordId="1" ID="ConsentProtocol_1" TABLE="PatientConsent" FIELD="ConsentProtocol"  />  		    
            </td>
       </tr>        
        <tr>
            <td style="white-space: nowrap;" ><strong>Version: </strong>
            </td>
            <td>
                <euc:EformTextBox Width="275px"  Runat="server" RecordId="1" ID="ConsentVer_1" TABLE="PatientConsent" FIELD="ConsentVer"  />  
                <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="1" ID="SurveyVersion_1" TABLE="Surveys" FIELD="SurveyVersion"  />  			    
            </td>
       </tr>        

    </table>
<br/><br/><br/>

<script type="text/javascript">
    /* <![CDATA[ */
 
     addAbsentEvent($('<%= ConsentDateText_1.ClientID %>'),$('<%= ConsentDate_1.ClientID %>'),$('<%= ConsentedBy_1.ClientID %>'),$('<%= ObtainPerson_1.ClientID %>'),$('<%= ConsentProtocol_1.ClientID %>'),$('<%= ConsentVer_1.ClientID %>'),$('<%= EformName.ClientID %>'));
   
    function addAbsentEvent(dateText,date,consentedBy,obtainedPerson,protocol,version,eformName)
    {  
        $(dateText).addEvent('blur',curry(SetHiddenFields,dateText,date,consentedBy,obtainedPerson,protocol,version,eformName));
        $(consentedBy).addEvent('blur',curry(SetHiddenFields,dateText,date,consentedBy,obtainedPerson,protocol,version,eformName));
        $(obtainedPerson).addEvent('blur',curry(SetHiddenFields,dateText,date,consentedBy,obtainedPerson,protocol,version,eformName));
    }

   
    /* ]]> */
    
    function SetHiddenFields(dateText,date,consentedBy,obtainedPerson,protocol,version,eformName)
	{
	    if (dateText.value != '' || consentedBy.value != '' || obtainedPerson.value != '')
	    {
	        if (protocol.value == '')
	            protocol.value = 'Caris Prostate Study Protocol BR-SP002-10';

	        if (version.value == '' && (eformName.value.indexOf('Enrollment') > -1 ) )
	        {
	            version.value = 'Version 031610';
	            document.getElementById('<%= SurveyVersion_1.ClientID %>').value = 'Version 031610';
	        }
	        else if (version.value == '' && (eformName.value.indexOf('Control') > -1 ) )
	        {
	         
	            version.value = 'Normal Control Doner Version 042510';
	            document.getElementById('<%= SurveyVersion_1.ClientID %>').value = 'Normal Control Doner Version 042510';
	        }    
	            
	    }

	}
	
</script>
