<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SelectHeadNeckEncounter" CodeFile="SelectHeadNeckEncounter.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<style type="text/css">
table#SelectHeadNeckEncounterHTMLTable
{
    border-collapse: collapse;
    border-spacing: 0px;
}
table#SelectHeadNeckEncounterHTMLTable td
{
    border-top: solid 1px #cccccc;
    padding: 20px;
}
div#SelectEncounterMessage
{
    width: 400px;
    border: solid 1px #cccccc;
    background-color: #efefef;
    color: #666666;
    font-size: 14px;
    padding: 20px;
}
</style>
<a name="SelectHeadNeckEncounter" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Select Encounter"></asp:Label>
<table cellspacing="0" class="eformLargePopulatedTable" id="SelectHeadNeckEncounterHTMLTable" style="margin-bottom: 44px;" >
<tr>
<td  style="font-weight: bold;">Encounter Date</td>
<td><euc:EformDropDownList TABLE="NoTable" FIELD="ExistingEncounterId" Runat="server" ID="ExistingEncounterId" LookupDistinct="Encounters;EncounterId;COALESCE(EncDateText,'') + ' : ' + COALESCE(EncPhysician,'');PatientId = @PatientId;EncounterId DESC" Width="350px" onchange="showHidePerineuralEFormSections();" /></td>
</tr>
</table>
<div id="SelectEncounterMessage">Select an Encounter above to Continue</div>
<script type="text/javascript">
    var ExistingEncounterIdField = $('<% = ExistingEncounterId.ClientID %>');


    if (ExistingEncounterIdField.options.length == 0) {
        $('<% = ComponentTitle.ClientID %>').innerHTML = 'No Encounters';
        SelectEncounterMessage.innerHTML = 'This patient has no Encounter records.  Please enter an encounter record before initiating this EForm.';
        $('SelectHeadNeckEncounterHTMLTable').style.display = 'none';
    }


    function showHidePerineuralEFormSections() {
        
        var showPNISections = (jQuery(ExistingEncounterIdField).val().length > 0);

        if (typeof CranialNerveExam_HTMLContainer != 'undefined') {
            if (showPNISections) { CranialNerveExam_HTMLContainer.style.display = 'block'; }
            else { CranialNerveExam_HTMLContainer.style.display = 'none'; }
        }

        if (typeof ReviewOfSystemsPNI_HTMLContainer != 'undefined') {
            if (showPNISections) { ReviewOfSystemsPNI_HTMLContainer.style.display = 'block'; }
            else { ReviewOfSystemsPNI_HTMLContainer.style.display = 'none'; }
        }

        if (showPNISections) { SelectEncounterMessage.style.display = 'none'; }
        else { SelectEncounterMessage.style.display = 'block'; }

    }
</script>