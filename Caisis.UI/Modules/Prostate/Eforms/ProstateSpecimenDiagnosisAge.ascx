<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSpecimenDiagnosisAge" CodeFile="ProstateSpecimenDiagnosisAge.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ProstateSpecimenDiagnosisAge" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>


    <table cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue" id="ProstateSpecimenDiagnosisAgeHtmlTable">
        
        <tr>
            <td style="white-space: nowrap;" ><span class="controlBoxTitle">Age at Diagnosis: </span>
                <euc:EformTextBox Width="50px"  Runat="server" RecordId="1" ParentRecordId="1" ID="SurveyItemResult_1" TABLE="SurveyItems" FIELD="SurveyItemResult" />  		    
                
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="1" ID="SurveyItem_1" TABLE="SurveyItems" FIELD="SurveyItem" />
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ID="SurveyType_1" TABLE="Surveys" FIELD="SurveyType" />
                
                <%--fields used in ProstateSpecimenDiagnosis control--%>
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="1" ID="SurveyItemResult_2" TABLE="SurveyItems" FIELD="SurveyItemResult" />
                </td>
       </tr>        
    </table>
<br/><br/><br/>
<script type="text/javascript">
        
    //Adds events to controls 
    addEvents1($('<%= SurveyItemResult_1.ClientID %>'), $('<%= SurveyItem_1.ClientID %>'), $('<%= SurveyType_1.ClientID %>'), $('<%= SurveyItemResult_2.ClientID %>'));

    function addEvents1(itemResultAge,itemAgeHidden,typeAgeHidden,itemResultDiagnosisHidden)
    { 
        $(itemResultAge).addEvent('blur',curry(SetHiddenFields, itemResultAge,itemAgeHidden,typeAgeHidden,itemResultDiagnosisHidden));
    }

    function SetHiddenFields(itemResultAge,itemAgeHidden,typeAgeHidden,itemResultDiagnosisHidden) 
    {        
        if (itemResultAge.value != '' )
        {
            itemAgeHidden.value = 'Age at Diagnosis';
            typeAgeHidden.value = 'Prostate Specimen Collection';
        }
        else
        {
            itemAgeHidden.value = '';
            
            if (itemResultDiagnosisHidden.value == '')
                typeAgeHidden.value = '';            
        }
        
    }
</script>

