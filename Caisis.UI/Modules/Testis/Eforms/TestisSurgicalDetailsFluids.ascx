<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Testis.Eforms.TestisSurgicalDetailsFluids" CodeFile="TestisSurgicalDetailsFluids.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


  <!-- BEGIN Surgical Details / Fluids -->
<style type="text/css">
#unitsTransfusedTable td
{
	padding: 3px 6px 3px 6px;
	text-align: center;
	font-size: 12px;
	font-weight: bold;
	border-left: solid 1px #cccccc;
	border-top: solid 1px #dddddd;
}
#OperatingTimeTable
{
	width: 370px;
}
#OperatingTimeTable td
{
	padding: 10px 6px 10px 6px;
	font-size: 12px;
	font-weight: bold;
	border-top: solid 1px #dddddd;
	color: #222222;
}
#TestSurgDetailsTable
{
	width: 370px;
}
#TestSurgDetailsTable td
{
	padding: 5px;
	font-size: 13px;
	border-bottom: solid 1px #dddddd;
	color: #222222;
}
#DischargeDateTable
{
	width: 370px;
}
#DischargeDateTable td
{
	padding: 10px;
	font-size: 13px;
	color: #222222;
	font-weight: bold;
}
</style>



<a name="TestisSurgicalDetailsFluids" />
<table id="TestSurgDetailsTable" border="0" cellpadding="0" cellspacing="0" class="eformLargePopulatedTable">
 <tr>
   <td><strong>Pneumatics</strong></td>
 <td><euc:EformRadioButtonList TABLE="OperatingRoomDetails" FIELD="OpPneumatics" LookupCode="YesNoUnknown" id="OpPneumatics" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" /></td>
</tr>
 <tr>
   <td><strong>NG Tube</strong></td>
 <td><euc:EformRadioButtonList TABLE="OperatingRoomDetails" FIELD="OpNG_Tube" LookupCode="YesNoUnknown" id="OpNG_Tube" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" /></td>
</tr>
 <tr>
   <td><strong>Antibiotics Given</strong> <span style="font-size: 12px;">(PreOp)</span>    <%--PreOp--%></td>
   <td><euc:EformRadioButtonList TABLE="OperatingRoomDetails" FIELD="OpPreOpAntibiotics" LookupCode="YesNoUnknown" id="OpPreOpAntibiotics" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" /></td>
 </tr>
<%--  <tr>
   <td>Antibiotics Given IntraOp</td>
   <td><euc:EformRadioButtonList TABLE="OperatingRoomDetails" FIELD="OpIntraOpAntibiotics" LookupCode="YesNoUnknown" id="OpIntraOpAntibiotics" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" /></td>
 </tr>
 <tr>
   <td>Antibiotics Given PostOp</td>
   <td><euc:EformRadioButtonList TABLE="OperatingRoomDetails" FIELD="OpPostOpAntibiotics" LookupCode="YesNoUnknown" id="OpPostOpAntibiotics" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" /></td>
 </tr>
--%>
</table>
<br/>
  <br/>
  <table id="OperatingTimeTable" border="0" cellpadding="0" cellspacing="0" class="eformLargePopulatedTable">
 <tr> 
            <td width="230" height="18"  >Operating Time (Skin to Skin)</td>
            <td >  
				 <euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpDuration" ID="SurgOperatingTime" runat="server"  ShowNumberPad="true"  class="InputText" style="width: 50px;" ></euc:EFormTextBox> min</td>
  </tr>
          <tr> 
            <td height="18"  >Anesthesia Time</td>
            <td >
				<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpAnesthesiaDuration" ID="SurgAnesthesiaTime" runat="server"  ShowNumberPad="true"  class="InputText" style="width: 50px;"></euc:EFormTextBox> min</td>
          </tr>
          <tr>
            <td height="18" >Estimated Blood Loss</td>
            <td ><euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpEstBloodLoss" ID="SurgEstBloodLoss" ShowNumberPad="true" runat="server"  class="InputText" style="width: 50px;" ></euc:EFormTextBox>
              cc </td>
          </tr>
          <tr> 
            <td height="18"  >Fluids</td>
            <td ><euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpFluids" ID="OpFluids" ShowNumberPad="true" runat="server"  class="InputText" style="width: 50px;" ></euc:EFormTextBox> cc </td>
          </tr>
</table>
  <br/>
  <br/>
  <table id="DischargeDateTable" border="0" cellpadding="0" cellspacing="0" class="eformLargePopulatedTable">
	 <tr> 
            <td style="width: 130px;" >Discharge Date</td>
            <td >  
				<euc:EformTextBox id="OpDischargeDateText" Table="OperatingRoomDetails" Field="OpDischargeDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="76px"/>
				<euc:EformHidden id="OpDischargeDate" Table="OperatingRoomDetails" Field="OpDischargeDate"  runat="server"/>

			</td>
  </tr>
</table>
  <br/>
  <br/>
<table id="unitsTransfusedTable" border="0" cellpadding="0" cellspacing="0" class="eformLargePopulatedTable">
          <tr> 
            <td >&nbsp;</td>
            <td>PRBC</td>
            <td >FFP</td>
            <td >Platelets</td>
          </tr>
          <tr> 
            <td height="35" >Units Transfused</td>
            <td style="background-color: #efefef;"><euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpRBC_Transfused" ID="OpRBC_Transfused" runat="server"  ShowNumberPad="true" size="10" class="InputText" runat="server"/></td>
            <td style="background-color: #efefef;" ><euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpFFP_Transfused" ID="OpFFP_Transfused" class="InputText" ShowNumberPad="true" size="10" runat="server" /></td>
            <td style="background-color: #efefef;" ><euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpPlateletsTransfused" ID="OpPlateletsTransfused" ShowNumberPad="true" class="InputText" size="10" runat="server"/></td>
          </tr>

      </table>
        <br/>
        <br/>


  <!-- END Surgical Details / Fluids -->
