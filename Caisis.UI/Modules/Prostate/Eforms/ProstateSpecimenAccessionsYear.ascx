<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSpecimenAccessionsYear" CodeFile="ProstateSpecimenAccessionsYear.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ProstateSpecimenAccessionsYear" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>


    <table cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="ProstateSpecimenAccessionsYearHtmlTable">
        
        <tr>
            <td style="white-space: nowrap;" >
                <span class="controlBoxTitle">Year Specimen Collected: </span>
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="100px"  Runat="server" RecordId="1" ID="PathDateText_1" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="1" ID="PathDate_1" TABLE="Pathology" FIELD="PathDate" /></td>
       </tr>        
         <tr>
            <td style="white-space: nowrap;" >
                <span class="controlBoxTitle">Sample Type: </span>
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformComboBox Width="100px"  Runat="server" RecordId="1" ID="PathSpecimenType_1" TABLE="Pathology" FIELD="PathSpecimenType" LookupCode="PathSpecimenType"  />  		                        
            </td>
       </tr>        
          <tr>
            <td style="white-space: nowrap;" >
                <span class="controlBoxTitle">Specimen Reference #: </span>
            </td>
            <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="200px"  Runat="server" ID="PathNumWithAccessDate" TABLE="Pathology" FIELD="PathNum"   /> 
                <span id="NoAccessionsSPAN" runat="server" class="ClinicalEformPopulatedColumn" > No Specimen Accessions exist for this patient.</span>             	

            </td>
       </tr>        
  </table>
   
<br/><br/><br/>

<script type="text/javascript">
        
        
        
    //Adds events to controls 
    addEvents1($('<%= PathDateText_1.ClientID %>'), $('<%= PathSpecimenType_1.ClientID %>'));

    function addEvents1(pathDateText,pathSpecimentType)
    { 
        $(pathDateText).addEvent('blur',curry(SetHiddenFields,pathDateText,pathSpecimentType)); 
    }

    function SetHiddenFields(pathDateText,pathSpecimentType) 
    {        
        if (pathDateText.value != '' && pathSpecimentType.value == '' )
            pathSpecimentType.value = 'Plasma';
    }
       
</script>