<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.ManitolDetails" CodeFile="ManitolDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="ManitolDetails" />


<euc:EformTextBox TABLE="NephrectomyProc" style="display: none;" FIELD="ProcInfusionType" Runat="server" ID="ProcInfusionType" />
<euc:EformTextBox TABLE="NephrectomyProc" style="display: none;" FIELD="ProcInfusionToRenalVeinClampingTime" Runat="server" ID="ProcInfusionToRenalVeinClampingTime" />
<span class="controlBoxTitle">Renoprotective Agent (e.g. Mannitol)</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;" id="ManitolToggleContainer" onclick="showHideManitolFields();">
		
		<strong>Was a renoprotective agent infused within 30 minutes of partial nephrectomy?</strong>
		<span style="display: block; text-align: center; padding: 10px 50px 0px 0px;"><euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcInfusionBeforeClamping" LookupCode="YesNoUnknown" id="ProcInfusionBeforeClamping" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server"></euc:EformRadioButtonList></span>
        
	</td>
</tr>
<tr id="manitolDetailsRow" style="display: none;">
	
	<td  style="padding-top: 5px;">
		<strong>If No, details:</strong><br />

						<euc:EformTextArea TextMode="MultiLine" TABLE="NephrectomyProc"  FIELD="ProcInfusionDetails" Rows="8" style="width: 550px;" Runat="server" ID="ProcInfusionDetails"/>


	</td>	
  </tr>
  
</table>

<script type="text/javascript">
function showHideManitolFields()
{
    var container = $('ManitolToggleContainer');
    var inputs = container.getElementsByTagName('input');
    for (var i=0;i<inputs.length;i++)
    {
	    var inputType = inputs[i].getAttribute('type');
	    
	    if (inputType == 'radio')
	    {
             inputs[i].onclick = function() {toggleManitolDisplay(this)};
	    } 
    }
}

showHideManitolFields();

function toggleManitolDisplay(toggleRadio)
{
    var manitolDetailsRow = $('manitolDetailsRow');
    var ProcInfusionType = $('<% = ProcInfusionType.ClientID %>');
    var manitolDetailsInput = $('<% = ProcInfusionDetails.ClientID %>');
    var ProcInfusionToRenalVeinClampingTime = $('<% = ProcInfusionToRenalVeinClampingTime.ClientID %>');
    var ProcInfusionDetailsTextArea = $('<% = ProcInfusionDetails.ClientID %>');
    
    if (toggleRadio.checked == true && toggleRadio.value.toUpperCase().indexOf('YES') > -1)
    {
       manitolDetailsRow.style.display = 'none';
       ProcInfusionType.value = ''; //Mannitol
       ProcInfusionToRenalVeinClampingTime.value = '<30 minutes';
       ProcInfusionDetailsTextArea.value = '';
    }
    else
    {
       manitolDetailsRow.style.display = '';
       ProcInfusionType.value = '';
       ProcInfusionToRenalVeinClampingTime.value = '';
    }
}

function defaultManitolDisplay()
{
    var container = $('ManitolToggleContainer');
    var inputs = container.getElementsByTagName('input');
    
    for (var i=0;i<inputs.length;i++)
    {
	    var inputType = inputs[i].getAttribute('type');
	    
	    if (inputType == 'radio' && inputs[i].checked ==  true && inputs[i].value.toUpperCase().indexOf('YES') < 0)
	    {
            var manitolDetailsRow = $('manitolDetailsRow');
            manitolDetailsRow.style.display = '';
	    } 
    }
}
defaultManitolDisplay();
</script>




<br/><br/>








