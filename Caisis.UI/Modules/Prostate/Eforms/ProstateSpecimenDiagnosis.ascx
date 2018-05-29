<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSpecimenDiagnosis" CodeFile="ProstateSpecimenDiagnosis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ProstateSpecimenDiagnosis" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>


    <table cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue" id="ProstateSpecimenDiagnosisHtmlTable">
        
        <tr>
            <td style="white-space: nowrap;" ><span class="controlBoxTitle">Diagnosis: </span>
                <euc:EformTextBox Width="200px"  Runat="server" RecordId="2" ParentRecordId="1" ID="SurveyItemResult_2" TABLE="SurveyItems" FIELD="SurveyItemResult" />  		    
                
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="1" ID="SurveyItem_2" TABLE="SurveyItems" FIELD="SurveyItem" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ID="SurveyType_1" TABLE="Surveys" FIELD="SurveyType" />
                
                <%--fields used in ProstateSpecimenDiagnosis control--%>
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="1" ID="SurveyItemResult_1" TABLE="SurveyItems" FIELD="SurveyItemResult" />
                </td>
       </tr>        
    </table>
<br/><br/><br/>
<script type="text/javascript">
        
    //Adds events to controls 
    addEvents1($('<%= SurveyItemResult_2.ClientID %>'), $('<%= SurveyItem_2.ClientID %>'), $('<%= SurveyType_1.ClientID %>'), $('<%= SurveyItemResult_1.ClientID %>'));

    function addEvents1(itemResultDiagnosis,itemDiagnosisHidden,typeDiagnosisHidden,itemResultAgeHidden)
    { 
        $(itemResultDiagnosis).addEvent('blur',curry(SetHiddenFields, itemResultDiagnosis,itemDiagnosisHidden,typeDiagnosisHidden,itemResultAgeHidden));
    }

    function SetHiddenFields(itemResultDiagnosis,itemDiagnosisHidden,typeDiagnosisHidden,itemResultAgeHidden) 
    {        
        if (itemResultDiagnosis.value != '' )
        {
            itemDiagnosisHidden.value = 'Diagnosis';
            typeDiagnosisHidden.value = 'Prostate Specimen Collection';
        }
        else
        {
            itemDiagnosisHidden.value = '';
            
            if (itemResultAgeHidden.value == '')
                typeDiagnosisHidden.value = '';            
        }
        
    }
</script>

