<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.NephIntraOpUS" CodeFile="NephIntraOpUS.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="NephIntraOpUS" />
<span class="controlBoxTitle">IntraOp Ultrasound</span><br />

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
	
	            <strong>IntraOp US Performed</strong>&nbsp;&nbsp;
				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcIntraOpUS" LookupCode="YesNoUnknown" id="ProcIntraOpUS" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				</euc:EformRadioButtonList>
	</td>
  </tr>
 <tr >
	<td style="padding-top: 0px;">
	
	            <strong>Additional lesions identified</strong>&nbsp;&nbsp;
				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcIntraOpUS_Lesions" LookupCode="YesNoUnknown" id="ProcIntraOpUSLesions" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				</euc:EformRadioButtonList>
	</td>
  </tr>  
  
</table>
<br/><br/>
