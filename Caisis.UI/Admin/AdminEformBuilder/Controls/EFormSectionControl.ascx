<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EFormSectionControl.ascx.cs"
    Inherits="Caisis.UI.Admin.EFormSectionControl" %>
<%@ Register TagPrefix="eform" TagName="fields" Src="~/Admin/AdminEformBuilder/Controls/EFormSectionFieldList.ascx" %>
<div class="EformSectionContainer">
<table cellspacing="0" class="eformSection">
    <tr>
        <td class="sectionSortButtonCol">
            <img src="Images/AdminImages/Button_WidgetUP.gif" alt="Move Section Up" class="sectionUpBtn" />
            <img src="Images/AdminImages/Button_WidgetDOWN.gif" alt="Move Section Down" class="sectionDownBtn" />
        </td>
        <td class="sectionTitleCell">
            <div class="sectionButtons">
                <img src="Images/AdminImages/LayoutToggle_List.png" alt="One Column" title="One Column" class="ToggleOneColumnBtn" />
                <img src="Images/AdminImages/LayoutToggle_2ColList.png" alt="Two Columns" title="Two Columns" class="ToggleTwoColumnBtn" />
                <img src="Images/AdminImages/LayoutToggle_Grid.png" alt="Grid" title="Grid" class="ToggleGridBtn" />
                <img src="Images/AdminImages/Button_X.png" alt="Delete This Section" class="deleteSectionButton DeleteSectionBtn">
                <input type="button" class="UndoDeleteSectionBtn" title="Undo" value="Undo" style="display: none;" />
            </div>
            <asp:TextBox runat="server" ID="SectionTitle" CssClass="sectionTitleText sectionTitle" style="margin-right: 6px;"></asp:TextBox>
            <label title="Display Section Title"><input type="checkbox" runat="server" id="ShowTitle" class="ShowSection"  />
                Display Section Title</label>
        </td>
    </tr>
    <tr>
        <td>&nbsp;
            
        </td>
        <td class="sectionContentCell">
            <div class="sectionContents">
                <eform:fields runat="server" ID="Col1" />
                <eform:fields runat="server" ID="Col2" />
            </div>
            <div class="sectionChildContents" style=" display: none;">
                <img src="Images/AdminImages/Button_AddSubsection.png" class="addSubSectionBtn" style="display: <%= false ? "block" : "none" %>;
                    cursor: pointer; margin-left: 10px;" />
                <%--  <button class="addSubSectionBtn" style="display: <%= QueryMethodName == METHOD_GET_SECTION ? "block" : "none" %>;
                            border: 1px solid red;">
                            Add Sub Section</button> --%>
            </div>
        </td>
    </tr>
</table>
</div>