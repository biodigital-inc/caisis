<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ExampleTextboxes" CodeFile="ExampleTextboxes.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="ExampleTextboxes" id="ExampleTextboxes" />

<span class="controlBoxTitle">Simple EformTextBox</span><br/><br/>

<euc:EformTextBox Runat="server" ID="TextboxSimple" Table="NoTable" FIELD="TextboxSimple" style="width:200px;"  ShowCalendar="false" CalcDate="false" class="InputText"  />

<br/><br/><br/><br/>



<span class="controlBoxTitle">EformTextBox with Calendar</span> (ShowCalendar="True")<br/><br/>

<euc:EformTextBox Runat="server" ID="TextboxDateText" Table="NoTable" FIELD="TextboxDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
<euc:EformHidden  Runat="server" ID="TextboxDate" Table="NoTable" Field="TextboxDate" />

<br/><br/><br/><br/>


<span class="controlBoxTitle">EformTextBox with Number pad</span> (ShowNumberPad="true")<br/><br/>

<euc:EformTextBox Runat="server" ID="TextboxNumPad" Table="NoTable" FIELD="TextboxNumPad" style="width:100px;" ShowNumberPad="true"  class="InputText"  />

<br/><br/><br/><br/>


<span class="controlBoxTitle">EformTextBox with Large Text popup</span> (ShowTextEditor="true")<br/><br/>

<euc:EformTextBox Runat="server" ID="TextboxNotes" Table="NoTable" FIELD="TextboxNotes" style="width:150px;" ShowTextEditor="true"  class="InputText"  />

<br/><br/><br/><br/>