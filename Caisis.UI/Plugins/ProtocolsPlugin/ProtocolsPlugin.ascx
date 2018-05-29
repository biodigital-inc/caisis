<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProtocolsPlugin.ascx.cs"
    Inherits="Caisis.UI.Plugins.ProtocolsPlugin.ProtocolsPlugin" %>

<script type="text/javascript">
var pro;
var protocolsCallBackPath = '<%= Caisis.UI.Core.Classes.PageUtil.GetBasePath(Request) + "/Plugins/ProtocolsPlugin/ProtocolsCallBack.aspx" %>'
// Handler which fires when control fires onchange event
function protocolsChangeHandler(n)
{
    return function(e)
    {
        if(n.options.length>0)
        {
            var protocolNum = getValue(n);
            var p = new Param();
            p.add('protocolNumber',protocolNum);
            var fun = function(t,x) 
            { 
                var d = document.getElementsByTagName('div');
                var xe;
                var xx =0;
                for(var i=0;i<d.length;i++)
                {
                    var y = d[i]; if(y.className=='PDSectionHolder') {  if(xx==0) { xe = y; break; } xx++; }
                }
                var nodeInXml = x.getElementsByTagName('table')[0];
                var protocolTable = getImportedXmlNode(nodeInXml,document.body.ownerDocument)
                var l = getLeftPos(n);
                var t = getTopPos(n);
                var div = Node.Create('DIV',{position: 'relative',left: '0px',top: '0px', maxHeight: '150px',overflow: 'auto', width:'90%', margin: 'auto auto auto auto'});
                div.appendChild(protocolTable);
                if(pro) 
                { 
                    pro.parentNode.removeChild(pro);
                    pro = null;
                }
                Node.InsertAfter(div,xe);
                pro = div;
            }
            AjaxManager.MakeRequest('POST',protocolsCallBackPath,p,fun,true);
        }
    }
}
    
// Wires up ProtocolId field to call back to server to get protocol UI helper
function wireEventToProtocolsField()
{
    if(protocolIdRef) // Gets register on page load by server
    { 
        // Get Function pointer to handle change event for protocolid control
        
        var protocolId = document.getElementById(protocolIdRef);
        var fp = protocolsChangeHandler(protocolId);
        // Wire event to control
        Event.Register('change',protocolId,fp,false);
        // Invoke function to force call on page load
        fp();
    }
}
// When pages loads, run protocols check
Event.Register('load',window,wireEventToProtocolsField,false);
</script>

