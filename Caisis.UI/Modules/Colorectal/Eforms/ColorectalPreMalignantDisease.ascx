<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.ColorectalPreMalignantDisease" CodeFile="ColorectalPreMalignantDisease.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<style type="text/css">
.disabledPreMalignantDisease
{
    color: #666666;
}
#ColorectalPreMalignantDiseaseTable input[type='text']
{   
    /*background-color: #cccccc;*/
    /*visibility: hidden;*/
}
</style>

<a name="ColorectalPreMalignantDisease" />
<span class="controlBoxTitle">Pre-Malignant Disease </span>
<euc:EformCheckBox ID="PreMalignantDisease" Table="NoTable" Field="PreMalignantDisease" runat="server" Value="None" Text="None" onclick="setPreMalignantDisease();" style="margin-left: 40px;" />
<br />

<table id="ColorectalPreMalignantDiseaseTable" border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">
<tr><td><table cellpadding="0" cellspacing="12" ><tr>
	        <td colspan="2" title="approximate date of diagnosis of pre-malignant neoplasm""><span style="font-weight: bold;" title="Date of Biopsy/Diagnosis">Date</span>&nbsp;&nbsp;&nbsp;<euc:EformTextBox id="PathDateText_4" Table="Pathology" RecordId="4" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/>
		        <euc:EformHidden id="PathDate_4" Table="Pathology" RecordId="4" Field="PathDate" Runat="server"/>
		        <euc:EformTextBox id="PathResult_4" Table="Pathology" RecordId="4" Field="PathResult" Runat="server" style="display: none;" />
		    </td>
	        </tr>
	        <tr>
	        <td style="font-weight: bold;" title="anatomic site of recurrence">Location of Pre-Malignant Neoplasm</td>
	        <td><euc:EformComboBox ID="PathSite_4" Table="Pathology" RecordId="4" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
	        </tr>
	        <tr>
	        <td style="font-weight: bold;" title="histology of pre-malignant neoplasm">Histology</td>
	        <td><euc:EformComboBox ID="PathHistology_4" Table="Pathology" RecordId="4" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200" /></td>
	        </tr>
</table></td></tr>
  </table>
<script type="text/javascript">
function setPreMalignantDisease()
{
    var ColorectalPreMalignantDiseaseTable = $('ColorectalPreMalignantDiseaseTable');
    if ($('<% = PreMalignantDisease.ClientID %>').checked)
    {
        clearAndDisableAllElementsContainedInNode(ColorectalPreMalignantDiseaseTable);
        ColorectalPreMalignantDiseaseTable.style.opacity = '0.6';
        ColorectalPreMalignantDiseaseTable.style.filter = 'alpha(opacity=60)';
    }
    else
    {
        enableAllElementsContainedInNode(ColorectalPreMalignantDiseaseTable);
        ColorectalPreMalignantDiseaseTable.style.opacity = '1.0';
        ColorectalPreMalignantDiseaseTable.style.filter = 'alpha(opacity=100)';
        
        $('<% = PathResult_4.ClientID %>').value = 'Neoplastic';
    }
}


function setInitialPreMalignantDiseaseView()
{
    if ($('<% = PreMalignantDisease.ClientID %>').checked == false)
    {
        var PreMalignantDiseaseValueExists = false;

        var ColorectalPreMalignantDiseaseTable = $('ColorectalPreMalignantDiseaseTable');
        
        var inputs = ColorectalPreMalignantDiseaseTable.getElementsByTagName('input');
	    for (var i=0;i<inputs.length;i++)
	    {
		    type = inputs[i].getAttribute('type');
		    if (type == 'checkbox' || type == 'radio') {
			    if (inputs[i].checked == true) PreMalignantDiseaseValueExists = true;
		    } else if (inputs[i].value != '')  {
			    PreMalignantDiseaseValueExists = true; }
   	    }
    	
	    var selects = ColorectalPreMalignantDiseaseTable.getElementsByTagName('select');
	    for (var j=0;j<selects.length;j++)
	    {
	        if (selects[j].selectedIndex > 0)  {
			    PreMalignantDiseaseValueExists = true; }
	    }
    	
	    var textareas = ColorectalPreMalignantDiseaseTable.getElementsByTagName('textarea');
	    for (var k=0;k<textareas.length;k++)
	    {
	        if (textareas[k].value != '')  {
			PreMalignantDiseaseValueExists = true; }
	    }
    }
    
    if (!PreMalignantDiseaseValueExists) $('<% = PreMalignantDisease.ClientID %>').checked = true;
    
    setPreMalignantDisease();
}
setInitialPreMalignantDiseaseView();
//setPreMalignantDisease();
</script>

<br/><br/>