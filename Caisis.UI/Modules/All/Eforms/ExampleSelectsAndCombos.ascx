<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ExampleSelectsAndCombos" CodeFile="ExampleSelectsAndCombos.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="ExampleSelectsAndCombos" id="ExampleSelectsAndCombos" />

<span class="controlBoxTitle">EFormSelect</span><br/><br/>

<euc:EFormSelect DropDownHeight="auto"  LookupCode="ASA_Score" style="width:35;" DropDownWidth="430" runat="server" TABLE="NoTable" FIELD="Select" ID="Select"/>
<br/><br/><br/><br/>



<span class="controlBoxTitle">EformDropDownList</span><br/><br/>

<euc:EformDropDownList TABLE="NoTable" FIELD="DropDownList" id="DropDownList"  runat="server" >
	<asp:ListItem Value="">-- Select Value --</asp:ListItem>
	<asp:ListItem Value="1">1: Continence (no pads)</asp:ListItem>
	<asp:ListItem Value="2">2: Mild SUI (leaks only during heavy activity)</asp:ListItem>
	<asp:ListItem Value="3">3: Moderate SUI (leaks with moderate activity)</asp:ListItem>
	<asp:ListItem Value="4">4: Severe SUI (leaks during nl activity, dry at night and at rest)</asp:ListItem>
	<asp:ListItem Value="5">5: Total Incontinence (continuous leakage of urine at rest)</asp:ListItem>
</euc:EformDropDownList>
<br/><br/><br/><br/>


<span class="controlBoxTitle">EformComboBox</span><br/><br/>

<euc:EformComboBox LookupDistinct="Appointments;ApptPhysician;ApptPhysician" DropDownWidth="auto" DropDownHeight="auto" id="Combobox" Table="NoTable" Field="Combobox" runat="server" />
<br/><br/><br/><br/>

