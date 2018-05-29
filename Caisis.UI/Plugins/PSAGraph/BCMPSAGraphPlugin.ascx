<%@ Control AutoEventWireup="false" Language="c#" Inherits="Caisis.UI.Plugins.PSAGraph.BCMPSAGraphPlugin"
    CodeFile="BCMPSAGraphPlugin.ascx.cs" %>


<a visible="false" runat="server" title="PSA Graph" href="~/Plugins/PSAGraph/BCMPSAGraphForm.aspx" target="_blank"
    id="psaOpenGraph" onclick="var graphWin = window.open(this.href,'PSAGraph', 'toolbars=no,resize=yes,scrollbars=no,width=900,height=400,left=80,top=200'); graphWin.focus(); return false;"><img id="psaGraphBtn" runat="server" alt="PSA Graph" title="PSA Graph" src="~/Images/PSAGraph.png" style="border-style: none; text-align: right; margin-right: 5px;" /></a>

<a visible="false" runat="server" title="Lab Graph" href="~/Plugins/PSAGraph/PatientChart.aspx" target="_blank" id="labOpenGraph" onclick="var chartWin = window.open(this.href,'PSAGraph', 'toolbars=no,resize=yes,scrollbars=no,width=960,height=500,left=80,top=200'); chartWin.focus(); return false;" ><img id="labGraphBtn" runat="server" alt="Lab Graph" title="Lab Graph" src="~/Images/LABSGraph.png" style="border: none; text-align: right; margin-right: 0px;" /></a>