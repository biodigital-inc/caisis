<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateSize" CodeFile="BiopsyOfProstateSize.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<script type="text/javascript">
function calcPSADensity(PSADensityInput, VolumeInput)
{
    if (lastPSA != null && lastPSA > 0)
    {
        var lastPSAValue = parseInt(lastPSA);
        var VolumeInputValue = parseInt(VolumeInput.value);
        
        if (!isNaN(VolumeInputValue) && !isNaN(lastPSAValue))
        {
            PSADensityInput.value = Number((lastPSAValue / VolumeInputValue).toFixed(3));
        }
        else { PSADensityInput.value = ''; }
        
    }
}

function calcProstateSizeValues(type)
{
    var inputHeight;
    var inputWidth;
    var inputLength;
    var inputVolume;
    var inputPSADensity;

    if (type == 'prostate')
    {
        inputHeight = $('<% =ImgProstateHeight.ClientID %>');
        inputWidth = $('<% =ImgProstateWidth.ClientID %>');
        inputLength = $('<% =ImgProstateLength.ClientID %>');
        inputVolume = $('<% =ImgProstateVolume.ClientID %>');
        inputPSADensity = $('<% =ProstatePSADensity.ClientID %>');
    }
    else
    {
        inputHeight = $('<% =ImgTZ_Height.ClientID %>');
        inputWidth = $('<% =ImgTZ_Width.ClientID %>');
        inputLength = $('<% =ImgTZ_Length.ClientID %>');
        inputVolume = $('<% =ImgTZ_Volume.ClientID %>');
        inputPSADensity = $('<% =TZPSADensity.ClientID %>');
    }
    
    inputVolume.value = calcProstateVolume(inputLength.value, inputWidth.value, inputHeight.value);
    calcPSADensity(inputPSADensity, inputVolume);

}

</script>



<a name="ProstateSize" />
<span class="controlBoxTitle">&nbsp;Prostate Size</span><br />
<table width="650" cellpadding="5" cellspacing="1" class="ClinicalEformTable" id="ProstateSizeTable">
   <tr>
     <td width="15%" class="controlBoxDataGridHeaderFirstCol"></td>
     <td width="12%" class="controlBoxDataGridHeaderFirstCol">Height(cm)</td>
     <td width="12%" class="controlBoxDataGridHeaderFirstCol">Width(cm)</td>
     <td width="12%" class="controlBoxDataGridHeaderFirstCol">Length(cm)</td>
     <td width="15%" class="controlBoxDataGridHeaderFirstCol">&nbsp;&nbsp;</td>
     <td height="12%" class="controlBoxDataGridHeaderFirstCol">Volume(cc)</td>
     <td height="10%" class="controlBoxDataGridHeaderFirstCol">PSA density</td>
     <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
   </tr>
   
   <tr onmouseout="calcProstateSizeValues('prostate');" onmouseover="calcProstateSizeValues('prostate');">
     <td valign="top" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb; border-right: solid 1px #bbbbbb;">Prostate</td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60px" ID="ImgProstateHeight"  TABLE="DxImageProstate" FIELD="ImgProstateHeight" class="InputText"  ShowNumberPad="true"  runat="server" /></td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60px" ID="ImgProstateWidth"  TABLE="DxImageProstate" FIELD="ImgProstateWidth" class="InputText"  ShowNumberPad="true"  runat="server" /></td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60px" ID="ImgProstateLength"  TABLE="DxImageProstate" FIELD="ImgProstateLength" class="InputText"  ShowNumberPad="true"  runat="server" /></td>
     <td valign="top" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb; border-right: solid 1px #bbbbbb;"> x 0.52 =</td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60px" ID="ImgProstateVolume"  TABLE="DxImageProstate" FIELD="ImgProstateVolume" class="InputText"  ShowNumberPad="true"  runat="server" /></td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60px" ID="ProstatePSADensity"  TABLE="NoTable" FIELD="ProstatePSADensity" class="InputText"  ShowNumberPad="true"  runat="server" /></td>
     <td><euc:EformDeleteIcon runat="server"/></td> 
   </tr>
   
   <tr onmouseout="calcProstateSizeValues('tz');" onmouseover="calcProstateSizeValues('tz');">
     <td valign="top" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb; border-right: solid 1px #bbbbbb;">Transition Zone</td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60px" ID="ImgTZ_Height"  TABLE="DxImageProstate" FIELD="ImgTZ_Height" class="InputText"  ShowNumberPad="true"  runat="server" /></td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60px" ID="ImgTZ_Width"  TABLE="DxImageProstate" FIELD="ImgTZ_Width" class="InputText"  ShowNumberPad="true"  runat="server" /></td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60px" ID="ImgTZ_Length"  TABLE="DxImageProstate" FIELD="ImgTZ_Length" class="InputText"  ShowNumberPad="true"  runat="server" /></td>
     <td valign="top" class="ClinicalEformGridColumnOne"  style="border-bottom: solid 1px #bbbbbb; border-right: solid 1px #bbbbbb;"> x 0.52 =</td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60px" ID="ImgTZ_Volume"  TABLE="DxImageProstate" FIELD="ImgTZ_Volume" class="InputText"  ShowNumberPad="true"  runat="server" /></td>
     <td align="center" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox style="width:60px" ID="TZPSADensity"  TABLE="NoTable" FIELD="TZPSADensity" class="InputText"  ShowNumberPad="true"  runat="server" /></td>
     <td><euc:EformDeleteIcon runat="server"/></td> 
   </tr>
   
  </table>
 <span onmouseover="calcProstateSizeValues('prostate');calcProstateSizeValues('tz');" style="display: block; background-color: #000000; font-size: 1px; line-height: 1px; height: 4px; margin: 50px 0px 60px 0px;">&nbsp;</span>