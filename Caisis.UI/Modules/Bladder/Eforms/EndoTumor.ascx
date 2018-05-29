<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.EndoTumor" CodeFile="EndoTumor.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="EndoTumor" id="EndoTumor" />
<span class="controlBoxTitle">Tumor</span><br/>


<table width="650" border="0" cellspacing="0" cellpadding="5" style="border: solid 1px #cccccc;">
  <tr>
    <td width="17%" height="36" class="ControlBoxRowAlternatingRowsA">Number</td>
    <td class="ControlBoxRowAlternatingRowsA"  >
        <euc:EformRadioButtonGroup Table="NoTable" Field="Tumor_Number" id="Tumor_Number" GroupName="Tumor_Number_Group" runat="server">
			<euc:EformRadioButton Id="Tumor_Number_1" Value="1" runat="server" Text="1" />
			<euc:EformRadioButton Id="Tumor_Number_2" Value="2" runat="server" Text="2" />
			<euc:EformRadioButton Id="Tumor_Number_3" Value="3" runat="server" Text="3" />
			<euc:EformRadioButton Id="Tumor_Number_4" Value="4" runat="server" Text="4" />
			<euc:EformRadioButton Id="Tumor_Number_5" Value="5" runat="server" Text="5" />
			<euc:EformRadioButton Id="Tumor_Number_Other" Value="Other" runat="server" Text="Other" />
		
		</euc:EformRadioButtonGroup> 
	</td>
  </tr>
  <tr>
    <td height="36" class="ControlBoxRowAlternatingRowsB">Largest Size (cm) </td>
    <td class="ControlBoxRowAlternatingRowsB">
          <euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;"  TABLE="NoTable" FIELD="Tumor_SizeLargest"  Runat="server" ID="Tumor_SizeLargest" ShowNumberPad="true"/></td>
  </tr>
  <tr>
    <td height="36" class="ControlBoxRowAlternatingRowsA">Size Range </td>
    <td class="ControlBoxRowAlternatingRowsA"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;"  TABLE="NoTable" FIELD="Tumor_SizeRange_Min"  Runat="server" ID="Tumor_SizeRange_Min" ShowNumberPad="true"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;"  TABLE="NoTable" FIELD="Tumor_SizeRange_Max"  Runat="server" ID="Tumor_SizeRange_Max" ShowNumberPad="true"/></td>
  </tr>
    <tr>
    <td height="36" class="ControlBoxRowAlternatingRowsB">Total area of Tumors Resected </td>
    <td class="ControlBoxRowAlternatingRowsB">
	
	<euc:EformRadioButtonGroup Table="NoTable" Field="Tumor_TotalAreaResected" id="Tumor_TotalAreaResected" GroupName="Tumor_TotalAreaResected_Group" runat="server">
			<euc:EformRadioButton Id="Tumor_TotalAreaResected_1" Value="<2 cm" runat="server" Text="<2cm" />
			<euc:EformRadioButton Id="Tumor_TotalAreaResected_2" Value="2-5 cm" runat="server" Text="2-5 cm" />
			<euc:EformRadioButton Id="Tumor_TotalAreaResected_3" Value="&#8805;5 cm" runat="server" Text="&#8805;5 cm" />

		
		</euc:EformRadioButtonGroup> 
	
	</td>
    </tr>
  <tr>
    <td height="36" class="ControlBoxRowAlternatingRowsA">Morphology</td>
    <td class="ControlBoxRowAlternatingRowsA">
	
	<euc:EformRadioButtonGroup Table="NoTable" Field="Tumor_Morphology" id="Tumor_Morphology" GroupName="Tumor_Morphology_Group" runat="server">
			<euc:EformRadioButton Id="Tumor_Morphology_1" Value="Scar" runat="server" Text="Scar" />
			<euc:EformRadioButton Id="Tumor_Morphology_2" Value="Solid / Nodular" runat="server" Text="Solid / Nodular" />
			<euc:EformRadioButton Id="Tumor_Morphology_3" Value="TIS" runat="server" Text="TIS" />
			<euc:EformRadioButton Id="Tumor_Morphology_4" Value="Paillary" runat="server" Text="Paillary" />
		
		</euc:EformRadioButtonGroup> 
	
	
	</td>
  </tr>

    <tr>
    <td height="36" class="ControlBoxRowAlternatingRowsB">Margins</td>
    <td class="ControlBoxRowAlternatingRowsB">
	
	<euc:EformRadioButtonGroup Table="NoTable" Field="Tumor_Margins" id="Tumor_Margins" GroupName="Tumor_Margins_Group" runat="server">
			<euc:EformRadioButton Id="Tumor_Margins_1" Value="Well-Circumscribed" runat="server" Text="Well-Circumscribed" />
			<euc:EformRadioButton Id="Tumor_Margins_2" Value="Ill-Defined" runat="server" Text="Ill-Defined" />
		</euc:EformRadioButtonGroup> 
	
	</td>
    </tr>
  <tr>
    <td height="36" class="ControlBoxRowAlternatingRowsA">Completely Resected </td>
    <td class="ControlBoxRowAlternatingRowsA">
	
	<euc:EformRadioButtonGroup Table="NoTable" Field="Tumor_CompletelyResected" id="Tumor_CompletelyResected" GroupName="Tumor_CompletelyResected_Group" runat="server">
			<euc:EformRadioButton Id="Tumor_CompletelyResected_1" Value="Yes" runat="server" Text="Yes" />
			<euc:EformRadioButton Id="Tumor_CompletelyResected_2" Value="No" runat="server" Text="No" />
    </euc:EformRadioButtonGroup> 
	
	</td>
  </tr></table>
<br/><br/><br/>