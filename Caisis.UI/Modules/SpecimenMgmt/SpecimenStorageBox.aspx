<%@ Page EnableViewState="true" Language="c#" CodeFile="SpecimenStorageBox.aspx.cs" AutoEventWireup="true"
    Inherits="Caisis.UI.Modules.SpecimenMgmt.SpecimenStorageBox" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Specimen Storage Box</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script type="text/javascript">	
    
    var filledPositionsArray = [];
    var filledSpecimenPositionArray = [];
    //Refreshes the parent window "StorageManger.aspx" after any changes on Box
    function refreshStorageManger(siteId,storageId,containerId,boxId,isDelete)
    {
        var modWin = top.frames['ModuleWindow'];
        if(modWin && modWin.frames['MainWindow'])
        {
            var storageManagerWindow = modWin.frames['MainWindow'];
            var url = 'StorageManager.aspx?siteId=' + siteId + '&storageId=' + storageId + '&containerId=' + containerId;
            //checks for if box is deleted or not & then passes boxId in url
            if(!isDelete)
            {
                url+= '&boxId=' + boxId;
            }
            storageManagerWindow.location = url;
        }
    }
    
    function setNodeText(n,t)
{
    if(n.firstChild) { Node.SetText(n,t); }
    else { n.appendChild(Node.CreateText(t)); }
}

var lastBuildRequest;
//restriction for # of Box positions is removed
//var maxDim = 200;

function delaybuildMatrix()
{
    if(lastBuildRequest)
    {
        clearTimeout(lastBuildRequest);
        lastBuildRequest = null;
    }
    lastBuildRequest = setTimeout(buildBoxMatrix,200);
}

function buildBoxMatrix()
{
    var matrix = document.getElementById('BoxMatrix');
    var rows = document.getElementById('<%= NoOfRows.ClientID %>').value;
    var cols = document.getElementById('<%= NoOfColumns.ClientID %>').value;
    var current = document.getElementById('<%= CurrentPosition.ClientID %>').value;
    var max = document.getElementById('<%= MaxPosition.ClientID %>').value;
    if(rows!='' && cols!='')
    {
        var dim = rows*cols;
//        if(dim<=maxDim)
//        {
            current = current!=''?current:(dim +1);
            max = max!=''?max:(dim+1);
            buildMatrix(rows,cols,current,max);
//        }
//        else
//        {
//            clearChildren(matrix);
//            alert('The current box is restricted to ' + maxDim + ' positions.');
//        }
    }
    else
    {
        clearChildren(matrix);
    }
}
 
 function getSpecimenIdFromArray(pos)
 {
    for(var i=0;i<filledSpecimenPositionArray.length;i++)
    {
        var posToSpec = filledSpecimenPositionArray[i]; // [pos,specid]
        var position = posToSpec[0];
        var specimenId = posToSpec[1];
        if(position==pos)
        {
            return specimenId;
        }
    }
 }
 
  function buildMatrix(r,c,p,m)
  {
        var nIndex=1;
        
        var matrix = document.getElementById('BoxMatrix');
        
        clearChildren(matrix);
        var tBody = document.createElement('TBODY');
        matrix.appendChild(tBody);
        var helper = new HelperArray(filledPositionsArray);
      for(var i=0;i<r;i++)
        {
            var row = tBody.insertRow(i);
            for(var j=0;j<c;j++,nIndex++)
            {
                var cell = row.insertCell(j);
                cell.position = nIndex;
                                                
                //setNodeText(cell,' ');
                // Set CSS classes to help identify cells
                if(helper.contains(nIndex)) 
                { 
                    cell.className = 'FilledPosition';
                    var specimenId = getSpecimenIdFromArray(cell.position);
                    var onCellClick  = function(id) { return function(e) { showSpecimenInfo(id);} };
                    cell.onclick = onCellClick(specimenId);
                }
                //else if(nIndex==p) { setMatrixActiveCell(cell); }
                else if(nIndex>m) { cell.className = 'UnavailablePosition'; }
                else { cell.className = 'AvailablePosition'; }
                var fp = function(c) 
                { 
                    return function() 
                    {
                        if(c.className=='FilledPosition')
                        {
                            alert('The position at ' + c.position + ' is currenly filled.');
                        }
                        else if(c.className=='UnavailablePosition')
                        {
                            alert('The position at ' + c.position + ' is currenly unavailable.');
                        }
                        else
                        {
                            setMatrixActiveCell(c);
                        }
                    } 
                }(cell);
                      
                // Set Node Number
                setNodeText(cell,cell.position);
            }
        }
    }
    
    function _cme(c,f,c1,c2) { return function(e) { if(f(c,e)) { if(c.className==c1) { c.className=c2; } } } }
    function cellMouseOver(c) { return _cme(c,isMouseEnter,'AvailablePosition','AvailablePositionHover'); }
    function cellMouseOut(c) { return _cme(c,isMouseLeave,'AvailablePositionHover','AvailablePosition'); }
    function _cmt(c,f,t) { return function(e) { if(f(c,e)&&c.className!='CurrentPosition') { setNodeText(c,t); } } }
    function cellMouseOverSetText(c) { return _cmt(c,isMouseEnter,c.position); }
    function cellMouseOutSetText(c) { return _cmt(c,isMouseLeave,' '); }
    function setMatrixActiveCell(c) 
    {
        var m = document.getElementById('BoxMatrix');
        if(m.currentPositionCell) 
        { 
            m.currentPositionCell.className = 'AvailablePosition'; 
            m.currentPositionCell.refClass = 'AvailablePosition';
            setNodeText(m.currentPositionCell,' ');
        }
        m.currentPositionCell.className = 'CurrentPosition';
        m.currentPositionCell = c;
        setNodeText(m.currentPositionCell,m.currentPositionCell.position);
        
        document.getElementById('<%= CurrentPosition.ClientID %>').value = m.currentPositionCell.position;
    }
     
    Event.Register('load',window,buildBoxMatrix,false);
   
       
    function showSpecimenInfo(id)
    {   
        document.getElementById('SpecimenDataFrame').style.display = '';
        document.getElementById('cellclk').style.display = 'none';   
        var page = "EditSpecimens.aspx?specimenId=" + id;
        document.getElementById("SpecimenDataFrame").src = page;
        top.showRefrshIcon = getRefreshHelper();
    }
    
    function getRefreshHelper()
    {
        var refreshIcon = document.getElementById('RefreshLayer');
        return function()
        {
            refreshIcon.style.display = '';
        }
    }    


    function gotoMoveBox()
    {
        var baseURL = '<%= Caisis.UI.Core.Classes.PageUtil.GetAbsoluteUrl(Page, "RelocateSpecimens.aspx") %>';
        var id=document.getElementById('BoxId').value;
        var name=document.getElementById('BoxName').value;
        
        var url = baseURL + '?Id=' + id + '&Name='+ name ;        
        var title = 'Move Box';
        
        top.showModal(url,title);
    }
   </script>

    <style type="text/css">
    .CurrentPosition {  background-color: #8d2a2c;  color: #ffffff; font-weight: bold; }
    .FilledPosition { background-color: #999999; cursor:pointer;  border: solid 2px #999999; border-collapse: separate;  color: #000000;}
    .UnavailablePosition { background-color: #666666; cursor: text;  }
    .AvailablePosition { background-color: #e4e4e4; border: solid 2px #e4e4e4; border-collapse: separate; }
    .AvailablePositionHover { background-color: #e4e4e4; border: solid 2px #8d2a2c; border-collapse: separate; color: #8d2a2c;}
    .ActivePosition { background-color: #0066cc; }
    .BoxMatrix { border: 1px solid #666666; }
    .BoxMatrix td
    {
        text-align: center;
        vertical-align: middle;
        font-size:11px;     
    }
    
        td.leftL
        {
            text-align:right; font-size:11px; 
        }
        td.leftR
        {
            text-align:left; font-size:11px;
        }
        td.left
        {
            padding-top:8px; vertical-align:top;
        }
        
    </style>
</head>
<body style="margin: 0px; width: 100%; background-color: #f8fafc;">
    <form id="dataForm" method="post" runat="server" defaultfocus="Name">
        <asp:HiddenField ID="BoxId" runat="server" />
         <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2">
                    <asp:Label id="PageTitle" runat="server" class="ListManTitle"></asp:Label>
                    <asp:HiddenField ID="BoxName" runat="server" />
                </td>
                <td></td>
            </tr>
            
            <!-- Box Info Input Controls -->
            <tr runat="server" id="inputControlsRow">
                <%--Left Info Input Controls --%>
                <td class="left" style="width: 400px" align="center">
                    <table cellpadding="0" border="0" style=" text-align:right;">
                        <tr>
                            <td class="leftL" style="color:Maroon;">
                                Name 
                            </td>
                            <td class="leftR">
                                <cc:CaisisTextBox FieldLabel="Name " runat="server" ID="Name"
                                    Table="SpecimenBoxes" Field="BoxName" TabIndex="1" MaxLength="50"
                                    Width="70" ShowLabel="false" />
                                <asp:RequiredFieldValidator ID="NameRfv" ControlToValidate="Name" runat="server" ErrorMessage="Please enter Name!"/>
                            </td>
                            <td class="leftL">
                                # of Columns
                            </td>
                            <td class="leftR" >
                               <cc:CaisisTextBox FieldLabel="Number of Columns " runat="server" ID="NoOfColumns" onkeyup="buildBoxMatrix();"
                                    Table="SpecimenBoxes" Field="NoOfColumns" TabIndex="4" MaxLength="50"
                                     Width="70" ShowLabel="false" />
                            </td>
                        </tr>   
                        <tr>
                            <td class="leftL" style="color:Maroon;">
                                Type
                            </td>
                            <td class="leftR">
                                <cc:CaisisSelect FieldLabel="Type " runat="server" ID="Type" Table="SpecimenBoxes" Field="BoxType" 
                                    TabIndex="2" Width="75" ShowLabel="false" LookupCode="Specimen_BoxType" >
                                </cc:CaisisSelect>
                                <asp:RequiredFieldValidator ID="typerfv" ControlToValidate="Type" runat="server" ErrorMessage="Please select Type!" />
                            </td>
                            <td class="leftL">
                                # of Rows
                            </td>
                            <td class="leftR">
                               <cc:CaisisTextBox FieldLabel="Number of Rows " runat="server" ID="NoOfRows" onkeyup="buildBoxMatrix();"
                                    Table="SpecimenBoxes" Field="NoOfRows" TabIndex="5" MaxLength="50"
                                    Width="70" ShowLabel="false" />
                            </td>
                        </tr>
                        <tr>
                            <td class="leftL">
                                Status
                            </td>
                            <td class="leftR">
                               <cc:CaisisTextBox FieldLabel="Status " runat="server" ID="Status"
                                    Table="SpecimenBoxes" Field="BoxStatus" TabIndex="3" MaxLength="50"
                                    Width="70" ShowLabel="false" />
                            </td>
                            <td class="leftL">
                                Max Position #
                            </td>
                            <td class="leftR">
                               <cc:CaisisTextBox FieldLabel="Maximum Position Number " runat="server" ID="MaxPosition" onkeyup="buildBoxMatrix();"
                                    Table="SpecimenBoxes" Field="MaxPositionNo" TabIndex="6" MaxLength="50"
                                     Width="70" ShowLabel="false" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td class="leftL">
                                Curr Position #
                            </td>
                            <td class="leftR">
                               <cc:CaisisTextBox FieldLabel="Current Position Number " runat="server" ID="CurrentPosition" 
                                    Table="SpecimenBoxes" Field="CurPositionNo" TabIndex="7" MaxLength="50"
                                    Width="70" ShowLabel="false" />
                            </td>
                        </tr>
                    </table>
                </td>
               <%--iframe to show Specimen Details by clicking on the box positions--%>
                <td align="center" rowspan="3">
                    <asp:Label runat="server" id="cellclk" style="font-weight:bolder; color:Maroon; "></asp:Label>
                    <div id="iframediv">
                        <iframe id="SpecimenDataFrame" runat="server" frameborder="0" class="BoxMatrix"
                            style="width: 98%; height: 420px; display: none; border-collapse: separate;">
                        </iframe>
                    </div>                       
                    
                </td>
            </tr>
            <tr>
                <td style="width: 400px">
                    <div id="Specdiv" style="text-align: center; margin-bottom: 0px; margin-top: 10px; font-size: 12px; color: #0066cc;"><span style="font-weight: bold;">Total Specimens In Box: </span>
                    <asp:Label runat="server" ID="TotalSpecimens"></asp:Label>
                    <span id="RefreshLayer" style="display:none; margin-left: 30px;"><b>Changes were made</b><img style="vertical-align: middle;
                                        margin-left: 10px; cursor: pointer;" src="../../Images/icon_refresh_small.gif" alt="Refresh Results"
                                        onclick="window.location = window.location;" /></span>
                    </div>
                    <asp:Label ID="SpecimensList" runat="server" BorderWidth="1" Font-Names="Verdana" Font-Size="9" 
                        style="TEXT-DECORATION:none;width: 400px; height:285px; text-align:justify; word-spacing:2px; line-height:20px; display:none; overflow-y:auto;" ForeColor = "#000000"></asp:Label>
                    <table id="BoxMatrix" runat="server" class="BoxMatrix" cellpadding="0" cellspacing="1" style="table-layout: fixed; width: 400px; margin: 2px auto 15px auto; border-collapse: separate; color: #ffffff;">
                    </table>
                </td>
            </tr>
                       
            <!-- Buttons: Cancel, Save&Close, Delete Box , Move Entire Box-->
            <tr>
                <td align="center" style="vertical-align: top; padding-bottom: 5px; text-align: center;">
                    <!-- Buttons should be like this for formatting reasons-->
                    &nbsp; &nbsp; &nbsp;
                    <asp:ImageButton ID="SaveBtn" OnCommand="Save_Click" runat="server" ImageUrl="~/Images/SaveAndClose.gif"
                        Style="margin-right: 10px; cursor: pointer;" ToolTip="Save Changes"
                        TabIndex="8" /><img id="CancelBtn" onclick="dataForm.reset();" src="..\..\Images\buttonCancelChanges.gif"
                        style="vertical-align: bottom; cursor: pointer; margin-right: 10px;" alt="Cancel Changes"
                        title="Cancel Changes" tabindex="9" /><asp:ImageButton ID="DeleteBtn" OnCommand="Delete_Click" OnClientClick="return confirm('Are you SURE you want to permanently delete this box ? \nAny Specimens present in this box will lose their location !');"
                        runat="server" ImageUrl="~/Images/buttonDeleteAndClose.gif" Style="margin-right: 10px;
                        cursor: pointer;" ToolTip="Delete Box" TabIndex="10" /></td>
            </tr>
            <tr>
                <td style="text-align: left; height: 3px; padding-left:150px;">
                    <img id="MoveBoxBtn" src="../../Images/MoveEntireBox.gif" onclick="gotoMoveBox();" alt="Move Entire Box" tabindex="11"  
                        style="cursor: pointer; "/>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
