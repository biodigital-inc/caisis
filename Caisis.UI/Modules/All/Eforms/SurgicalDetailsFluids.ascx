<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.SurgicalDetailsFluids" CodeFile="SurgicalDetailsFluids.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


  <!-- BEGIN Surgical Details / Fluids -->

<a name="SurgicalDetailsFluids" />
<span class="controlBoxTitle">&nbsp;&nbsp;Surgical Details / Fluids</span><br />
  <table width="520" border="0" cellpadding="0" cellspacing="0" class="controlBox">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="516">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td><table width="516" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="230" height="18" align="right" class="controlBoxFieldTitle">Operating Time (Skin to Skin) &nbsp; </td>
            <td class="controlBoxFieldOption">  
				 <euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpDuration" ID="SurgOperatingTime" runat="server"  ShowNumberPad="true"  class="InputText" ></euc:EFormTextBox>(min)  
             </td>
          </tr>
          <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">Anesthesia Time &nbsp; </td>
            <td class="controlBoxFieldOption">
				<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpAnesthesiaDuration" ID="SurgAnesthesiaTime" runat="server"  ShowNumberPad="true"  class="InputText" ></euc:EFormTextBox>(min)
			</td>
          </tr>
          <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">Estimated Blood Loss &nbsp; </td>
            <td class="controlBoxFieldOption">
				<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpEstBloodLoss" ID="SurgEstBloodLoss" ShowNumberPad="true" runat="server"  class="InputText" ></euc:EFormTextBox> cc </td>
          </tr>
        </table></td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
  </table><br/>
  
  
  <table width="320" border="0" cellpadding="0" cellspacing="0" class="controlBox">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="316">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td><table width="316" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="130" height="18" align="right" class="controlBoxFieldTitle">Crystalloid&nbsp; 
            </td>
            <td class="controlBoxFieldOption"> <label> 
              <euc:EformTextBox ID="Crystalloid" TABLE="OperatingRoomDetails" FIELD="OpCrystalloid" ShowNumberPad="true" class="InputText" size="10" runat="server"/>
              cc</label></td>
          </tr>
          <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">Hespan&nbsp; 
            </td>
            <td class="controlBoxFieldOption"> <label> 
               <euc:EformTextBox ID="OpFluidHespan" TABLE="OperatingRoomDetails" FIELD="OpFluidHespan" ShowNumberPad="true" class="InputText" size="10" runat="server"/>
              cc</label></td>
          </tr>          
          <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">Albumin&nbsp; 
            </td>
            <td class="controlBoxFieldOption"> <label> 
               <euc:EformTextBox ID="OpFluidAlbumin" TABLE="OperatingRoomDetails" FIELD="OpFluidAlbumin" ShowNumberPad="true" class="InputText" size="10" runat="server"/>
              cc</label></td>
          </tr>          
          <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">Total Colloid&nbsp; 
            </td>
            <td class="controlBoxFieldOption"> <label> 
               <euc:EformTextBox ID="Colloid" TABLE="OperatingRoomDetails" FIELD="OpColloid" ShowNumberPad="true" class="InputText" size="10" runat="server"/>
              cc</label></td>
          </tr>
        </table></td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
  </table>
<br/>
        <table width="600" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable">
          <tr> 
            <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
            <td  width="150" height="25" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            <td class="controlBoxDataGridHeader">Auto</td>
            <td class="controlBoxDataGridHeader">PRBC</td>
            <td class="controlBoxDataGridHeader">FFP</td>
            <td class="controlBoxDataGridHeader">Cellsaver</td>
            <td width="2" align="right" valign="top" class="controlBox"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
          </tr>
          <tr> 
            <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
            <td height="35" class="controlBoxDataGridTitleColumn" nowrap>&nbsp;&nbsp;Units Available</td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpAutoAvailable" ID="SurgAutoAvailable" ShowNumberPad="true" runat="server"  size="10" class="InputText" /></td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpRBC_Available" ID="SurgRBC_Available" ShowNumberPad="true" runat="server"  size="10" class="InputText" /></td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpFFP_Available" ID="SurgFFP_Available" ShowNumberPad="true" class="InputText" size="10" runat="server" /></td>
            <td align="center" style="font-size: 11px; font-weight: 600;">n/a<%-- <euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpHD_Available" ID="OpHD_Available" ShowNumberPad="true" class="InputText" size="10" runat="server" />--%></td>
            <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
          </tr>
          <!--Removed per Eastham because values are not available at the time of suregery-->
          <%--<tr> 
            <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
            <td height="35" class="controlBoxDataGridTitleColumn" nowrap>&nbsp;&nbsp;Units Transfused </td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpAutoTransfused"  ID="SurgAutoTransfused" runat="server" ShowNumberPad="true"  size="10" class="InputText" /></td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpRBC_Transfused" ID="SurgRBC_Transfused" runat="server"  ShowNumberPad="true" size="10" class="InputText" /></td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpFFP_Transfused" ID="SurgFFP_Transfused" runat="server"  ShowNumberPad="true" size="10" class="InputText" /></td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="NoTable" Field="SurgCellsaver_Transfused" ID="SurgCellsaver_Transfused"	   ShowNumberPad="true" runat="server" class="InputText" size="10" /></td>
            <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
          </tr>--%>
          <tr> 
            <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
            <td height="35" class="controlBoxDataGridTitleColumn" nowrap>&nbsp;&nbsp;Intraoperative </td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpAutoIntraOp" ID="SurgAuto_IntraOp" ShowNumberPad="true" class="InputText" size="10" runat="server"/></td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpRBC_IntraOp" ID="SurgRBC_IntraOp" runat="server"  ShowNumberPad="true" size="10" class="InputText" runat="server"/></td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpFFP_IntraOp" ID="SurgFFP_IntraOp" class="InputText" ShowNumberPad="true" size="10" runat="server" /></td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpHD_IntraOp" ID="SurgCellsaver_IntraOp" ShowNumberPad="true" class="InputText" size="10" runat="server"/></td>
            <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
          </tr>
          <%--Removed per Eastham because values are not available at the time of suregery--%>
          <%--<tr> 
            <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
            <td height="35" class="controlBoxDataGridTitleColumn" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PACU / PostOp </td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="NoTable" Field="SurgAuto_PostOp" ID="SurgAuto_PostOp" ShowNumberPad="true" class="InputText" size="10" runat="server"/></td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpRBC_PostOp" ID="SurgRBC_PostOp"  size="10" ShowNumberPad="true" class="InputText" runat="server"/></td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="NoTable" Field="SurgFFP_PostOp" ID="SurgFFP_PostOp" ShowNumberPad="true" class="InputText" size="10" runat="server"/></td>
            <td align="center">&nbsp;&nbsp;&nbsp;<euc:EformTextBox TABLE="NoTable" Field="SurgCellsaver_PostOp" ID="SurgCellsaver_PostOp" ShowNumberPad="true" class="InputText" size="10" runat="server"/></td>
            <td>&nbsp;</td>
          </tr>--%>
          <tr> 
            <td valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
            <td align="right" valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
          </tr>
        </table><br/>
        <table width="300" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable">
          <tr> 
            <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
            <td  width="90" height="25" class="controlBoxDataGridHeaderFirstCol">Date</td>
            <td width="60" class="controlBoxDataGridHeader">Var</td>
            <td class="controlBoxDataGridHeader">Value</td>
            <td width="2" align="right" valign="top" class="controlBox"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
          </tr>
          <tr> 
            <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
            <td height="35" class="controlBoxDataGridTitleColumn">&nbsp;&nbsp;Admission</td>
            <td align="center" class="controlBoxFieldOption">HGB
            </td>
            <td align="center"> <euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpHGB_Admit" ID="SurgHGB_Admit" runat="server"  size="10" class="InputText"  ShowNumberPad="true"  /></td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
            <td height="35" class="controlBoxDataGridTitleColumn">&nbsp;&nbsp;Admission</td>
            <td align="center" class="controlBoxFieldOption">HCT
            </td>
            <td align="center"> <euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpHCT_Admit" ID="SurgHCT_Admit" runat="server"  size="10" class="InputText"  ShowNumberPad="true"  /></td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
            <td height="35" class="controlBoxDataGridTitleColumn">&nbsp;&nbsp;IntraOp</td>
            <td align="center" class="controlBoxFieldOption">HGB
            </td>
            <td align="center"> <euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpHGB_IntraOp" ID="SurgHGB_IntraOp" runat="server"  size="10" class="InputText"  ShowNumberPad="true"  /></td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td class="controlBoxDataGridFirstColumn">&nbsp;</td>
            <td height="35" class="controlBoxDataGridTitleColumn">&nbsp;&nbsp;IntraOp</td>
            <td align="center" class="controlBoxFieldOption">HCT 
            </td>
            <td align="center"> <euc:EformTextBox TABLE="OperatingRoomDetails" Field="OpHCT_IntraOp" ID="SurgHCT_IntraOp" runat="server"  size="10" class="InputText"  ShowNumberPad="true"  /></td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
            <td align="right" valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>  <br/><br/><br/>


  <!-- END Surgical Details / Fluids -->
