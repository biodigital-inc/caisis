<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChronList.aspx.cs" Inherits="Core_PatientDataEntry_ChronList" %>
<%@ Register TagPrefix="plugin" TagName="PSAGraph" Src="~/Plugins/PSAGraph/BCMPSAGraphPlugin.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Chronological List</title>
    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/headerJS.js"></script>
	<link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">
	    function loadChronlist(type) { window.location = '<%= Page.ResolveUrl("ChronList.aspx") %>?ChronListType=' + type; }

	    function showChronListMenu() { MM_showHideLayers('chronlistMenu','','show'); }
	    
	    function DeselectAllChronListRows()
	    {
	        var chron = $('chronListTable');
	        for (i=0;i<chron.rows.length;i++) { chron.rows[i].className = 'chronList'; }
	    }
	    var activeRow;
	    function HighlightSelectedRow(row)
	    {
	        if (activeRow) { activeRow.className = 'chronList'; }
	        activeRow = row;
	        activeRow.className = 'chronListClicked';
	    }
	    // Custom resizing function will resize main div, accounting for Lab Test Filter (if present)
	    var customSizerFunction = function(w,h)
	    {
	        var o = 210;
	        var type = $('ListTypeDisplay');
	        var chron = $('ChronListSizeDiv');
	        var filter = $('LabFilterCheckBoxTD');
	        if(type && filter && type.innerHTML=="Lab Tests") { chron.setHeight(h - filter.offsetHeight - o); }
	        else { chron.setHeight(h-o); }
	    }
	    // Resize frame when loaded and browser resizes
	    Browser.ResizeFrame({ heightOffset: 125 });
	    // Resize main div when browser is resized and page loads
        Browser.ResizeElement({ customResizer: customSizerFunction });	
	</script>
	<style type="text/css">
	.PDForm
	{
	 background-color: #FCFCFC;
	}
	
	#chronlistMenu tr:hover td
	{
	    background-color: #efefef;
	    color: #000000;
	}
	#chronListTable
	{
	    width: 330px;
	    table-layout:fixed;
	}
	tr.chronList td
	{
	    white-space: normal;
	    word-wrap: break-word;
	}
	.chronListClicked
	{
	    white-space: normal;
	    word-wrap: break-word;
	}
	</style>
</head>
<body>
<form runat="server">
    <table class="dataEntryBox" width="340" border="0" align="center" cellspacing="0" style="margin-top: 18px;">
  <tr bgcolor="#f1f7fc"> 
    <td > 
      <table class="PDForm" width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
        <tr align="left"> 
			
            <td >
            
            
            
            <span style="float: right;"><plugin:PSAGraph ID="psagraphLoader" runat="server"/></span>
           
            <div style="border: solid 1px #cccccc;" id="chronlistMenu" onmouseout="if ( isMouseLeave(this,event) ) { MM_showHideLayers('chronlistMenu','','hide'); }" >
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
					
					<tr style="height: 15px;">
						<td style="padding-left: 3px; background-color: #efefef;" colspan="2"><img src="../../Images/Header/SmallCloseButton.gif" width="11" height="11" hspace="4" vspace="4" border="0" align="right" onclick="MM_showHideLayers('chronlistMenu','','hide')" style="cursor: pointer;"><span  class="chronListTitle">Change View:</span></td>
				    </tr>
					
					<asp:Repeater ID="ViewTypeRpt" runat="server" OnItemDataBound="ViewTypeSelectorItemCreate">
					<ItemTemplate>
					<tr style="cursor: pointer; height: 16px;" onclick="loadChronlist('<%# DataBinder.Eval(Container.DataItem, "ChronListValue") %>');"  >
						<td style="padding-left: 3px; text-align: right; width: 30px;"><img id="SecondaryImage" runat="server" src="../../Images/shim.gif" border="0" width="11" height="11" align="absmiddle" style="padding-right: 3px;" /><img id="PrimaryImage" runat="server"  border="0" width="11" height="11" align="absmiddle" /></td>
						<td style="padding-left: 3px;"><%# DataBinder.Eval(Container.DataItem, "ChronListDisplayText")%></td>
				    </tr>
				    </ItemTemplate>
				    </asp:Repeater>
					</table>
				
				</div>
            <table cellpadding="0" cellspacing="0" border="0">
					<tr style="height: 15px;" >
						<td onclick="showChronListMenu()" style="padding-left: 3px; padding-right: 3px; background-color: #ffffff; white-space: nowrap; width: 198px; border: solid 1px #dddddd; cursor: pointer;"><img src="../../Images/RedDownWidget.gif" width="13" height="13" align="right" style="margin-top: 1px;" />
                        <span  class="chronListTitle">View: </span>&nbsp;&nbsp;&nbsp;<asp:Label ID="ListTypeDisplay" runat="server" labelass="chronListTitle" />
			              
						</td>
						<td id="HideShowLabsBtnTd" runat="server" visible="false" style="padding-left: 4px;"><asp:ImageButton ImageUrl="../../Images/Button_IncludeLabsOn.png" ID="HideShowLabsBtn" runat="server" OnCommand="OnHideShowLabBtnCommand" ToolTip="Include/Exclude Lab Tests" /></td>
				    </tr>
		    </table>
				
				
			  
			  
         </td>      
        </tr>
        <tr> 
          <td >
          
          <div style="width:340px; padding-right: 20px; overflow: auto; overflow-x: hidden;">
          <table style="width: 98%;" cellpadding="2" cellspacing="0" border="0">
				 <tr id="Tr1"> 
					<td class="boldText" style="text-align: center; width: 20%;">Date</td>
					<td class="boldText" style="text-align: center; width: 34%;">Variable</td>
					<td class="boldText" style="text-align: center; width: 32%;">Value</td>
					<td class="boldText" style="text-align: center; width: 14%;">Quality</td>
				</tr>
            </table>
            </div>
            <!-- heights set on page load based on user browser size -->
            <div id="ChronListSizeDiv" style="width:340px; height: 360px; padding-right: 0px; overflow: auto; overflow-x: hidden;">
              <table id="chronListTable" cellpadding="2" cellspacing="0">
                    <asp:Repeater ID="rptChrono" runat="server" OnItemDataBound="ChronListItemDataBound">
						<ItemTemplate>
							<tr id="<%# DataBinder.Eval(Container.DataItem, "primaryKey")%>" class="chronList" onClick="parent.loadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "tableName") %>','<%# DataBinder.Eval(Container.DataItem, "primaryKey") %>','<%# DataBinder.Eval(Container.DataItem, "parentKey") %>'); HighlightSelectedRow(this);" >
								<td align="left" style="width: 20%; white-space:nowrap;"><asp:Literal ID="ChronListDateField" Runat="server" />&nbsp;</td>
								<td align="left" style="width: 34%; padding-left: 16px;"><img src="../../Images/icon_<%# DataBinder.Eval(Container.DataItem, "tableName") %>.png" border="0" title="<%# DataBinder.Eval(Container.DataItem, "tableName") %>" style="width:11px; height: 11px; margin-left: -14px; margin-right: 3px;"><%# DataBinder.Eval(Container.DataItem, "varName") %>&nbsp;</td>
								<td align="left" style="width: 32%; "><%# DataBinder.Eval(Container.DataItem, "varValue") %>&nbsp;</td>
								<td align="left" style="width: 14%; border-right: solid 1px #cccccc; padding-right: 2px;"><%# DataBinder.Eval(Container.DataItem, "Quality") %><asp:Image Visible="false" ImageUrl="../../Images/icon_note.gif" ID="NoteIcon" runat=server Height="11" Width="11" BorderWidth="0" ImageAlign="Middle" />&nbsp;</td>
							</tr>
                      </ItemTemplate>
                    </asp:Repeater>
                  <% if(recordCount==0) {%>
                  <tr bgcolor="#E8E8E8" > 
                    <td colspan="4">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td bgcolor="#FFFFff" colspan="4" align="center">&nbsp;No <%= selectedOption %> records for this patient</td>
                  </tr>
                  <tr bgcolor="#E8E8E8" > 
                    <td colspan="4">&nbsp;</td>
                  </tr>
                  <% } %>
              </table>
            </div>
            </td>
        </tr>
        <tr>
        <td id="LabFilterCheckBoxTD">
         <!-- LabTest Filter -->
              <table width="312" cellpadding="2" cellspacing="1" border="0" runat="server" id="LabTestFilter" visible="false">
					<tr>
						<td colspan="4"><strong><br/>Filter Lab Tests:</strong><br/>
							<asp:CheckBoxList Width="320"  RepeatColumns="4" id="LabCheckList" CssClass="LabFilters" CellSpacing="0" CellPadding="0" runat="server"></asp:CheckBoxList></td>
					</tr>     	
					<tr>
	        			<td colspan="4" align="center" >
	        				<asp:ImageButton ID="LabFilterImageButton" runat="server" AlternateText="Filter Lab Tests" ToolTip="Filter Lab Tests" OnClick="CreateLabFilter" ImageUrl="~/Images/buttonFilter.gif"  Height="22" Width="45" />
	        				<img height="1" src="../../Images/shim.gif" width="25">
	        				<asp:ImageButton ID="LabClearImageButton" runat="server" AlternateText="Show All Lab Tests" ToolTip="Show All Lab Tests" OnClick="ClearLabFilter" ImageUrl="~/Images/buttonShowAll.gif" Height="22" Width="62"  />
	        			</td>	
					</tr>
				</table>
		 <!--End LabTest Filter -->	
        </td>
        </tr>
      </table>
      </td>
  </tr>
</table>
</form>
</body>
</html>