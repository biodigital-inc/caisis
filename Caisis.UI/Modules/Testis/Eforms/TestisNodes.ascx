<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Testis.Eforms.TestisNodes" CodeFile="TestisNodes.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<style type="text/css">
#TestisNodesTable
{
    border: solid 1px #cccccc;
    border-right: none;
    border-bottom: none;
	width: 700px;
	background-color: #fefefe;
}
#TestisNodesTable td
{
    border-right: solid 1px #cccccc;
    border-bottom: solid 1px #cccccc;
	text-align: center;
}
#TestisNodesTable td.topCol
{
	background-color: #f4f4f4;
	font-weight: bold;
}
#TestisNodesTable td.leftCol
{
	text-align: right;
	padding-right: 6px;
	width: 140px;
	background-color: #f4f4f4;
}
</style>
<a name="TestisNodes" />
<span class="controlBoxTitle">Nodes</span><br />
<table id="TestisNodesTable" border="0" cellspacing="0" cellpadding="4" style="width: 700px;">
 <tr >
 <td class="topCol" >&nbsp;</td>
 <td class="topCol" >Negative</td>
 <td class="topCol" >Positive</td>
 <td class="topCol" >Extension</td>
 <td class="topCol" ># Pos. Nodes </td>
 <td class="topCol" >Total #  Nodes </td>
 <td class="topCol" style="font-size: 11px;">Clear /<br/>Not Taken</td>
 </tr>
 <tr >
   <td class="leftCol" >R Suprahilar
   <euc:EformHidden id="PathFindSide_1" Table="NodePathFinding" Field="PathFindSide" RecordId="1" ParentRecordId="1"  runat="server" Value="Right" />
   <euc:EformHidden id="PathFindSite_1" Table="NodePathFinding" Field="PathFindSite" RecordId="1" ParentRecordId="1"  runat="server" Value="Suprahilar" />
   <euc:EformHidden id="PathologyFindSide_1" Table="PathologyFinding" Field="PathFindSide" RecordId="1" ParentRecordId="1"  runat="server" Value="Right" />
   <euc:EformHidden id="PathologyFindSite_1" Table="PathologyFinding" Field="PathFindSite" RecordId="1" ParentRecordId="1"  runat="server" Value="Suprahilar" />   </td>
   <td >
   <euc:EformRadioButtonGroup Table="PathologyFinding" Field="PathFindResult" id="PathFindResult_RightSuprahilar" RecordId="1" ParentRecordId="1" GroupName="RightSuprahilar" runat="server"
			Field1="PathFindSide" Value1="Right"
			Field2="PathFindSite" Value2="Suprahilar">
			<euc:EformRadioButton Id="RightSuprahilarNegative" Value="Negative" runat="server"/>   </td>
   <td ><euc:EformRadioButton Id="RightSuprahilarPositive" Value="Positive" runat="server"/></euc:EformRadioButtonGroup></td>
   <td ><euc:EformCheckbox id="PathFindExtension_1" Table="NodePathFinding" Field="PathFindExtension" RecordId="1" ParentRecordId="1"  runat="server" Value="Yes"  EnableHiddenOnUIEvent="PathFindSide_1,PathFindSite_1" /></td>
   <td ><euc:EformTextbox  id="PathFindPosNodes_1" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindPosNodes"  RecordId="1" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_1,PathFindSite_1" /></td>
   <td ><euc:EformTextbox  id="PathFindNumNodes_1" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindNumNodes"  RecordId="1" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_1,PathFindSite_1" /></td>
   <td ><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon1" NAME="Eformdeleteicon1" /></td>
 </tr>
 <tr >
   <td class="leftCol" >L Suprahilar
   <euc:EformHidden id="PathFindSide_2" Table="NodePathFinding" Field="PathFindSide" RecordId="2" ParentRecordId="1"  runat="server" Value="Left" />
   <euc:EformHidden id="PathFindSite_2" Table="NodePathFinding" Field="PathFindSite" RecordId="2" ParentRecordId="1"  runat="server" Value="Suprahilar" />   </td>
   <td ><euc:EformRadioButtonGroup Table="PathologyFinding" Field="PathFindResult" id="PathFindResult_LeftSuprahilar" RecordId="2" ParentRecordId="1" GroupName="LeftSuprahilar" runat="server"
			Field1="PathFindSide" Value1="Left"
			Field2="PathFindSite" Value2="Suprahilar">
       <euc:EformRadioButton Id="LeftSuprahilarNegative" Value="Negative" runat="server"/>   </td>
   <td ><euc:EformRadioButton Id="LeftSuprahilarPositive" Value="Positive" runat="server"/>
       </euc:EformRadioButtonGroup></td>
   <td ><euc:EformCheckbox id="PathFindExtension_2" Table="NodePathFinding" Field="PathFindExtension" RecordId="2" ParentRecordId="1"  runat="server" Value="Yes"  EnableHiddenOnUIEvent="PathFindSide_2,PathFindSite_2" /></td>
   <td ><euc:EformTextbox  id="PathFindPosNodes_2" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindPosNodes"  RecordId="2" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_2,PathFindSite_2" /></td>
   <td ><euc:EformTextbox  id="PathFindNumNodes_2" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindNumNodes"  RecordId="2" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_2,PathFindSite_2" /></td>
   <td ><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon2" NAME="Eformdeleteicon2" /></td>
 </tr>
 <tr >
   <td class="leftCol" >Paracaval
   <euc:EformHidden id="PathFindSite_3" Table="NodePathFinding" Field="PathFindSite" RecordId="3" ParentRecordId="1"  runat="server" Value="Paracaval" />   </td>
   <td ><euc:EformRadioButtonGroup Table="PathologyFinding" Field="PathFindResult" id="PathFindResult_Paracaval" RecordId="3" ParentRecordId="1" GroupName="Paracaval" runat="server"
			Field1="PathFindSite" Value1="Paracaval">
       <euc:EformRadioButton Id="ParacavalNegative" Value="Negative" runat="server"/>   </td>
   <td ><euc:EformRadioButton Id="ParacavalPositive" Value="Positive" runat="server"/>
       </euc:EformRadioButtonGroup></td>
   <td ><euc:EformCheckbox id="PathFindExtension_3" Table="NodePathFinding" Field="PathFindExtension" RecordId="3" ParentRecordId="1"  runat="server" Value="Yes"  EnableHiddenOnUIEvent="PathFindSite_3" /></td>
   <td ><euc:EformTextbox  id="PathFindPosNodes_3" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindPosNodes"  RecordId="3" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_3,PathFindSite_3" /></td>
   <td ><euc:EformTextbox  id="PathFindNumNodes_3" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindNumNodes"  RecordId="3" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_3,PathFindSite_3" /></td>
   <td ><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon3" NAME="Eformdeleteicon3" /></td>
 </tr>
 <tr >
   <td class="leftCol" >Precaval
   <euc:EformHidden id="PathFindSite_4" Table="NodePathFinding" Field="PathFindSite" RecordId="4" ParentRecordId="1"  runat="server" Value="Precaval" />   </td>
   <td ><euc:EformRadioButtonGroup Table="PathologyFinding" Field="PathFindResult" id="PathFindResult_Precaval" RecordId="4" ParentRecordId="1" GroupName="Precaval" runat="server"
			Field1="PathFindSite" Value1="Precaval">
       <euc:EformRadioButton Id="PrecavalNegative" Value="Negative" runat="server"/>   </td>
   <td ><euc:EformRadioButton Id="PrecavalPositive" Value="Positive" runat="server"/>
       </euc:EformRadioButtonGroup></td>
   <td ><euc:EformCheckbox id="PathFindExtension_4" Table="NodePathFinding" Field="PathFindExtension" RecordId="4" ParentRecordId="1"  runat="server" Value="Yes"  EnableHiddenOnUIEvent="PathFindSite_4" /></td>
   <td ><euc:EformTextbox  id="PathFindPosNodes_4" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindPosNodes"  RecordId="4" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_4,PathFindSite_4" /></td>
   <td ><euc:EformTextbox  id="PathFindNumNodes_4" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindNumNodes"  RecordId="4" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_4,PathFindSite_4" /></td>
   <td ><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon4" NAME="Eformdeleteicon4" /></td>
 </tr>
 <tr >
   <td class="leftCol" >Para-aortic
   <euc:EformHidden id="PathFindSite_5" Table="NodePathFinding" Field="PathFindSite" RecordId="5" ParentRecordId="1"  runat="server" Value="Para-aortic" />   </td>
   <td ><euc:EformRadioButtonGroup Table="PathologyFinding" Field="PathFindResult" id="PathFindResult_ParaAortic" RecordId="5" ParentRecordId="1" GroupName="ParaAortic" runat="server"
			Field1="PathFindSite" Value1="Para-aortic">
       <euc:EformRadioButton Id="ParaAorticNegative" Value="Negative" runat="server"/>   </td>
   <td ><euc:EformRadioButton Id="ParaAorticPositive" Value="Positive" runat="server"/>
       </euc:EformRadioButtonGroup></td>
   <td ><euc:EformCheckbox id="PathFindExtension_5" Table="NodePathFinding" Field="PathFindExtension" RecordId="5" ParentRecordId="1"  runat="server" Value="Yes"  EnableHiddenOnUIEvent="PathFindSite_5" /></td>
   <td ><euc:EformTextbox  id="PathFindPosNodes_5" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindPosNodes"  RecordId="5" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_5,PathFindSite_5" /></td>
   <td ><euc:EformTextbox  id="PathFindNumNodes_5" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindNumNodes"  RecordId="5" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_5,PathFindSite_5" /></td>
   <td ><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon5" NAME="Eformdeleteicon5" /></td>
 </tr>
 <tr >
   <td class="leftCol" >Preaortic
   <euc:EformHidden id="PathFindSite_6" Table="NodePathFinding" Field="PathFindSite" RecordId="6" ParentRecordId="1"  runat="server" Value="Preaortic" />   </td>
   <td ><euc:EformRadioButtonGroup Table="PathologyFinding" Field="PathFindResult" id="PathFindResult_Preaortic" RecordId="6" ParentRecordId="1" GroupName="Preaortic" runat="server"
			Field1="PathFindSite" Value1="Preaortic">
       <euc:EformRadioButton Id="PreaorticNegative" Value="Negative" runat="server"/>   </td>
   <td ><euc:EformRadioButton Id="PreaorticPositive" Value="Positive" runat="server"/>
       </euc:EformRadioButtonGroup></td>
   <td ><euc:EformCheckbox id="PathFindExtension_6" Table="NodePathFinding" Field="PathFindExtension" RecordId="6" ParentRecordId="1"  runat="server" Value="Yes"  EnableHiddenOnUIEvent="PathFindSite_6" /></td>
   <td ><euc:EformTextbox  id="PathFindPosNodes_6" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindPosNodes"  RecordId="6" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_6,PathFindSite_6" /></td>
   <td ><euc:EformTextbox  id="PathFindNumNodes_6" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindNumNodes"  RecordId="6" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_6,PathFindSite_6" /></td>
   <td ><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon6" NAME="Eformdeleteicon6" /></td>
 </tr>
 <tr >
   <td class="leftCol" >Interaortocaval
   <euc:EformHidden id="PathFindSite_7" Table="NodePathFinding" Field="PathFindSite" RecordId="7" ParentRecordId="1"  runat="server" Value="Interaortocaval" />   </td>
   <td ><euc:EformRadioButtonGroup Table="PathologyFinding" Field="PathFindResult" id="PathFindResult_Interaortocaval" RecordId="7" ParentRecordId="1" GroupName="Interaortocaval" runat="server"
			Field1="PathFindSite" Value1="Interaortocaval">
       <euc:EformRadioButton Id="InteraortocavalNegative" Value="Negative" runat="server"/>   </td>
   <td ><euc:EformRadioButton Id="InteraortocavalPositive" Value="Positive" runat="server"/>
       </euc:EformRadioButtonGroup></td>
   <td ><euc:EformCheckbox id="PathFindExtension_7" Table="NodePathFinding" Field="PathFindExtension" RecordId="7" ParentRecordId="1"  runat="server" Value="Yes"  EnableHiddenOnUIEvent="PathFindSite_7" /></td>
   <td ><euc:EformTextbox  id="PathFindPosNodes_7" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindPosNodes"  RecordId="7" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_7,PathFindSite_7" /></td>
   <td ><euc:EformTextbox  id="PathFindNumNodes_7" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindNumNodes"  RecordId="7" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_7,PathFindSite_7" /></td>
   <td ><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon7" NAME="Eformdeleteicon7" /></td>
 </tr>
 <tr >
   <td class="leftCol" >R Retrocrural
   <euc:EformHidden id="PathFindSide_8" Table="NodePathFinding" Field="PathFindSide" RecordId="8" ParentRecordId="1"  runat="server" Value="Right" />
   <euc:EformHidden id="PathFindSite_8" Table="NodePathFinding" Field="PathFindSite" RecordId="8" ParentRecordId="1"  runat="server" Value="Retrocrural" />   </td>
   <td ><euc:EformRadioButtonGroup Table="PathologyFinding" Field="PathFindResult" id="PathFindResult_RightRetrocrural" RecordId="8" ParentRecordId="1" GroupName="RightRetrocrural" runat="server"
			Field1="PathFindSide" Value1="Right"
			Field2="PathFindSite" Value2="Retrocrural">
       <euc:EformRadioButton Id="RightRetrocruralNegative" Value="Negative" runat="server"/>   </td>
   <td ><euc:EformRadioButton Id="RightRetrocruralPositive" Value="Positive" runat="server"/>
       </euc:EformRadioButtonGroup></td>
   <td ><euc:EformCheckbox id="PathFindExtension_8" Table="NodePathFinding" Field="PathFindExtension" RecordId="8" ParentRecordId="1"  runat="server" Value="Yes"  EnableHiddenOnUIEvent="PathFindSide_8,PathFindSite_8" /></td>
   <td ><euc:EformTextbox  id="PathFindPosNodes_8" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindPosNodes"  RecordId="8" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_8,PathFindSite_8" /></td>
   <td ><euc:EformTextbox  id="PathFindNumNodes_8" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindNumNodes"  RecordId="8" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_8,PathFindSite_8" /></td>
   <td ><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon8" NAME="Eformdeleteicon8" /></td>
 </tr>
 <tr >
   <td class="leftCol" >L Retrocrural
   <euc:EformHidden id="PathFindSide_9" Table="NodePathFinding" Field="PathFindSide" RecordId="9" ParentRecordId="1"  runat="server" Value="Left" />
   <euc:EformHidden id="PathFindSite_9" Table="NodePathFinding" Field="PathFindSite" RecordId="9" ParentRecordId="1"  runat="server" Value="Retrocrural" />   </td>
   <td ><euc:EformRadioButtonGroup Table="PathologyFinding" Field="PathFindResult" id="PathFindResult_LeftRetrocrural" RecordId="9" ParentRecordId="1" GroupName="LeftRetrocrural" runat="server"
			Field1="PathFindSide" Value1="Left"
			Field2="PathFindSite" Value2="Retrocrural">
       <euc:EformRadioButton Id="LeftRetrocruralNegative" Value="Negative" runat="server"/>   </td>
   <td ><euc:EformRadioButton Id="LeftRetrocruralPositive" Value="Positive" runat="server"/>
       </euc:EformRadioButtonGroup></td>
   <td ><euc:EformCheckbox id="PathFindExtension_9" Table="NodePathFinding" Field="PathFindExtension" RecordId="9" ParentRecordId="1"  runat="server" Value="Yes"  EnableHiddenOnUIEvent="PathFindSide_9,PathFindSite_9" /></td>
   <td ><euc:EformTextbox  id="PathFindPosNodes_9" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindPosNodes"  RecordId="9" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_9,PathFindSite_9" /></td>
   <td ><euc:EformTextbox  id="PathFindNumNodes_9" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindNumNodes"  RecordId="9" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_9,PathFindSite_9" /></td>
   <td ><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon9" NAME="Eformdeleteicon9" /></td>
 </tr>
 <tr >
   <td class="leftCol" >Gonadal Vein
   <euc:EformHidden id="PathFindSite_10" Table="NodePathFinding" Field="PathFindSite" RecordId="10" ParentRecordId="1"  runat="server" Value="Gonadal Vein" />   </td>
   <td ><euc:EformRadioButtonGroup Table="PathologyFinding" Field="PathFindResult" id="PathFindResult_GonadalVein" RecordId="10" ParentRecordId="1" GroupName="GonadalVein" runat="server"
			Field1="PathFindSite" Value1="Gonadal Vein">
       <euc:EformRadioButton Id="GonadalVeinNegative" Value="Negative" runat="server"/>   </td>
   <td ><euc:EformRadioButton Id="GonadalVeinPositive" Value="Positive" runat="server"/>
       </euc:EformRadioButtonGroup></td>
   <td ><euc:EformCheckbox id="PathFindExtension_10" Table="NodePathFinding" Field="PathFindExtension" RecordId="10" ParentRecordId="1"  runat="server" Value="Yes"  EnableHiddenOnUIEvent="PathFindSite_10" /></td>
   <td ><euc:EformTextbox  id="PathFindPosNodes_10" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindPosNodes"  RecordId="10" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_10,PathFindSite_10" /></td>
   <td ><euc:EformTextbox  id="PathFindNumNodes_10" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindNumNodes"  RecordId="10" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_10,PathFindSite_10" /></td>
   <td ><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon10" NAME="Eformdeleteicon10" /></td>
 </tr>
 <tr >
   <td class="leftCol" >Interilliac / Presacral
   <euc:EformHidden id="PathFindSite_11" Table="NodePathFinding" Field="PathFindSite" RecordId="11" ParentRecordId="1"  runat="server" Value="Interilliac / Presacral" />   </td>
   <td ><euc:EformRadioButtonGroup Table="PathologyFinding" Field="PathFindResult" id="PathFindResult_InterilliacPresacral" RecordId="11" ParentRecordId="1" GroupName="InterilliacPresacral" runat="server"
			Field1="PathFindSite" Value1="Interilliac / Presacral">
       <euc:EformRadioButton Id="InterilliacPresacralNegative" Value="Negative" runat="server"/>   </td>
   <td ><euc:EformRadioButton Id="InterilliacPresacralPositive" Value="Positive" runat="server"/>
       </euc:EformRadioButtonGroup></td>
   <td ><euc:EformCheckbox id="PathFindExtension_11" Table="NodePathFinding" Field="PathFindExtension" RecordId="11" ParentRecordId="1"  runat="server" Value="Yes"  EnableHiddenOnUIEvent="PathFindSite_11" /></td>
   <td ><euc:EformTextbox  id="PathFindPosNodes_11" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindPosNodes"  RecordId="11" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_11,PathFindSite_11" /></td>
   <td ><euc:EformTextbox  id="PathFindNumNodes_11" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindNumNodes"  RecordId="11" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_11,PathFindSite_11" /></td>
   <td ><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon11" NAME="Eformdeleteicon11" /></td>
 </tr>
 <tr >
   <td class="leftCol" >R Iliac
   <euc:EformHidden id="PathFindSide_12" Table="NodePathFinding" Field="PathFindSide" RecordId="12" ParentRecordId="1"  runat="server" Value="Right" />
   <euc:EformHidden id="PathFindSite_12" Table="NodePathFinding" Field="PathFindSite" RecordId="12" ParentRecordId="1"  runat="server" Value="Iliac" />   </td>
   <td ><euc:EformRadioButtonGroup Table="PathologyFinding" Field="PathFindResult" id="PathFindResult_RightIliac" RecordId="12" ParentRecordId="1" GroupName="RightIliac" runat="server"
			Field1="PathFindSide" Value1="Right"
			Field2="PathFindSite" Value2="Iliac">
       <euc:EformRadioButton Id="RightIliacNegative" Value="Negative" runat="server"/>
   </td>
   <td ><euc:EformRadioButton Id="RightIliacPositive" Value="Positive" runat="server"/>
       </euc:EformRadioButtonGroup></td>
   <td ><euc:EformCheckbox id="PathFindExtension_12" Table="NodePathFinding" Field="PathFindExtension" RecordId="12" ParentRecordId="1"  runat="server" Value="Yes"  EnableHiddenOnUIEvent="PathFindSide_12,PathFindSite_12" /></td>
   <td ><euc:EformTextbox  id="PathFindPosNodes_12" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindPosNodes"  RecordId="12" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_12,PathFindSite_12" /></td>
   <td ><euc:EformTextbox  id="PathFindNumNodes_12" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindNumNodes"  RecordId="12" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_12,PathFindSite_12" /></td>
   <td ><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon12" NAME="Eformdeleteicon12" /></td>
 </tr>
 <tr >
   <td class="leftCol" >L Iliac
   <euc:EformHidden id="PathFindSide_13" Table="NodePathFinding" Field="PathFindSide" RecordId="13" ParentRecordId="1"  runat="server" Value="Left" />
   <euc:EformHidden id="PathFindSite_13" Table="NodePathFinding" Field="PathFindSite" RecordId="13" ParentRecordId="1"  runat="server" Value="Iliac" />   </td>
   <td ><euc:EformRadioButtonGroup Table="PathologyFinding" Field="PathFindResult" id="PathFindResult_LeftIliac" RecordId="13" ParentRecordId="1" GroupName="LeftIliac" runat="server"
			Field1="PathFindSide" Value1="Left"
			Field2="PathFindSite" Value2="Iliac">
       <euc:EformRadioButton Id="LeftIliacNegative" Value="Negative" runat="server"/>
   </td>
   <td ><euc:EformRadioButton Id="LeftIliacPositive" Value="Positive" runat="server"/>
       </euc:EformRadioButtonGroup></td>
   <td ><euc:EformCheckbox id="PathFindExtension_13" Table="NodePathFinding" Field="PathFindExtension" RecordId="13" ParentRecordId="1"  runat="server" Value="Yes"  EnableHiddenOnUIEvent="PathFindSide_13,PathFindSite_13" /></td>
   <td ><euc:EformTextbox  id="PathFindPosNodes_13" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindPosNodes"  RecordId="13" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_13,PathFindSite_13" /></td>
   <td ><euc:EformTextbox  id="PathFindNumNodes_13" runat="server" style="width:30px;" TABLE="NodePathFinding" FIELD="PathFindNumNodes"  RecordId="13" ParentRecordId="1"  EnableHiddenOnUIEvent="PathFindSide_13,PathFindSite_13" /></td>
   <td ><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon13" NAME="Eformdeleteicon13" /></td>
 </tr>
</table>
<br/><br/>