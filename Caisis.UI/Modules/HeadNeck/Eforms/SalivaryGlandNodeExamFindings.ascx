<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandNodeExamFindings" CodeFile="SalivaryGlandNodeExamFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="SalivaryGlandNodeExamFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=" "></asp:Label><br/>

<table border="0" cellspacing="1" cellpadding="3" border="0" class="ClinicalEformTable">
    <tr>
        <td class="controlBoxDataGridTitleColumn"></td>
        <td align="center" colspan="2" class="eformLargePopulatedTableBlue"><span class="controlBoxTitle">Left</span></td>
        <td align="center" colspan="2" class="eformLargePopulatedTable"><span class="controlBoxTitle">Right</span></td>
        <td class="controlBoxDataGridTitleColumn"></td>
    </tr>
    <tr>
        <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >Site</td>
        <td class="eformLargePopulatedTableBlue" style="text-align: center;" ><strong># Palpable<br />Nodes</strong></td>
        <td class="eformLargePopulatedTableBlue" style="text-align: center;"><strong>Max<br />Dimension</strong></td>
        <%--<td class="eformLargePopulatedTableBlue" style="text-align: center;"><strong>ECS</strong></td>--%>
        <td class="eformLargePopulatedTable" style="text-align: center"><strong># Palpable<br />Nodes</strong></td>
        <td class="eformLargePopulatedTable" style="text-align: center"><strong>Max<br />Dimension</strong></td>
        <%--<td class="eformLargePopulatedTable" style="text-align: center" ><strong>ECS</strong></td>--%>
        <td class="controlBoxDataGridTitleColumn">&nbsp;</td>    
    </tr>
    <tr>
        <td style="text-align: left; white-space: nowrap;"  >Level 1 </td>        
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="1" Field="ExamFindResult" id="ExamFindResult_L1" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="1" Field="ExamFindSite" id="ExamFindSite_L1" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="1" Field="ExamFindSide" id="ExamFindSide_L1" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;"  class="eformLargePopulatedTableBlue" >
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="1" Field="ExamFindMaxDim" id="ExamFindMaxDim_L1" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;"  class="eformLargePopulatedTableBlue" >
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="1" Field="ExamFindExtension" id="ExamFindExtension_L1" LookupCode="YesNoUnknown" runat="server"  /></td>
 
 
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="2" Field="ExamFindResult" id="ExamFindResult_R2" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="2" Field="ExamFindSite" id="ExamFindSite_R2" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="2" Field="ExamFindSide" id="ExamFindSide_R2" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="2" Field="ExamFindMaxDim" id="ExamFindMaxDim_R2" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;" class="eformLargePopulatedTable">
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="2" Field="ExamFindExtension" id="ExamFindExtension_R2" LookupCode="YesNoUnknown" runat="server"  /></td>
        <td class="controlBoxDataGridTitleColumn"><euc:EformDeleteIcon ID="EformDeleteIcon_1" runat="server"/></td>
    </tr>
    <tr>
        <td style="text-align: left; white-space: nowrap;" >Level 2</td>        
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="3" Field="ExamFindResult" id="ExamFindResult_L3" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="3" Field="ExamFindSite" id="ExamFindSite_L3" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="3" Field="ExamFindSide" id="ExamFindSide_L3" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;"  class="eformLargePopulatedTableBlue" >
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="3" Field="ExamFindMaxDim" id="ExamFindMaxDim_L3" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;"  class="eformLargePopulatedTableBlue" >
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="3" Field="ExamFindExtension" id="ExamFindExtension_L3" LookupCode="YesNoUnknown" runat="server"  /></td>
 
 
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="4" Field="ExamFindResult" id="ExamFindResult_R4" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="4" Field="ExamFindSite" id="ExamFindSite_R4" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="4" Field="ExamFindSide" id="ExamFindSide_R4" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="4" Field="ExamFindMaxDim" id="ExamFindMaxDim_R4" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;" class="eformLargePopulatedTable">
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="4" Field="ExamFindExtension" id="ExamFindExtension_R4" LookupCode="YesNoUnknown" runat="server"  /></td>
        <td class="controlBoxDataGridTitleColumn"><euc:EformDeleteIcon ID="EformDeleteIcon_2" runat="server"/></td>
    </tr>
    <tr>
        <td style="text-align: left; white-space: nowrap;" >Level 3</td>        
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="5" Field="ExamFindResult" id="ExamFindResult_L5" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="5" Field="ExamFindSite" id="ExamFindSite_L5" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="5" Field="ExamFindSide" id="ExamFindSide_L5" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;"  class="eformLargePopulatedTableBlue" >
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="5" Field="ExamFindMaxDim" id="ExamFindMaxDim_L5" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;"  class="eformLargePopulatedTableBlue" >
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="5" Field="ExamFindExtension" id="ExamFindExtension_L5" LookupCode="YesNoUnknown" runat="server"  /></td>
 
 
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="6" Field="ExamFindResult" id="ExamFindResult_R6" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="6" Field="ExamFindSite" id="ExamFindSite_R6" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="6" Field="ExamFindSide" id="ExamFindSide_R6" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="6" Field="ExamFindMaxDim" id="ExamFindMaxDim_R6" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;" class="eformLargePopulatedTable">
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="6" Field="ExamFindExtension" id="ExamFindExtension_R6" LookupCode="YesNoUnknown" runat="server"  /></td>
        <td class="controlBoxDataGridTitleColumn"><euc:EformDeleteIcon ID="EformDeleteIcon_3" runat="server"/></td>
    </tr>
    <tr>
        <td style="text-align: left; white-space: nowrap;" >Level 4</td>        
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="7" Field="ExamFindResult" id="ExamFindResult_L7" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="7" Field="ExamFindSite" id="ExamFindSite_L7" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="7" Field="ExamFindSide" id="ExamFindSide_L7" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;"  class="eformLargePopulatedTableBlue" >
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="7" Field="ExamFindMaxDim" id="ExamFindMaxDim_L7" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;"  class="eformLargePopulatedTableBlue" >
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="7" Field="ExamFindExtension" id="ExamFindExtension_L7" LookupCode="YesNoUnknown" runat="server"  /></td>
 
 
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="8" Field="ExamFindResult" id="ExamFindResult_R8" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="8" Field="ExamFindSite" id="ExamFindSite_R8" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="8" Field="ExamFindSide" id="ExamFindSide_R8" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="8" Field="ExamFindMaxDim" id="ExamFindMaxDim_R8" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;" class="eformLargePopulatedTable">
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="8" Field="ExamFindExtension" id="ExamFindExtension_R8" LookupCode="YesNoUnknown" runat="server"  /></td>
        <td class="controlBoxDataGridTitleColumn"><euc:EformDeleteIcon ID="EformDeleteIcon_4" runat="server"/></td>
    </tr>
    <tr>
        <td style="text-align: left; white-space: nowrap;" >Level 5</td>        
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="9" Field="ExamFindResult" id="ExamFindResult_L9" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="9" Field="ExamFindSite" id="ExamFindSite_L9" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="9" Field="ExamFindSide" id="ExamFindSide_L9" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;"  class="eformLargePopulatedTableBlue" >
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="9" Field="ExamFindMaxDim" id="ExamFindMaxDim_L9" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;"  class="eformLargePopulatedTableBlue" >
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="9" Field="ExamFindExtension" id="ExamFindExtension_L9" LookupCode="YesNoUnknown" runat="server"  /></td>
 
 
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="10" Field="ExamFindResult" id="ExamFindResult_R10" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="10" Field="ExamFindSite" id="ExamFindSite_R10" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="10" Field="ExamFindSide" id="ExamFindSide_R10" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="10" Field="ExamFindMaxDim" id="ExamFindMaxDim_R10" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;" class="eformLargePopulatedTable">
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="10" Field="ExamFindExtension" id="ExamFindExtension_R10" LookupCode="YesNoUnknown" runat="server"  /></td>
        <td class="controlBoxDataGridTitleColumn"><euc:EformDeleteIcon ID="EformDeleteIcon_5" runat="server"/></td>
    </tr>
    <tr>
        <td style="text-align: left; white-space: nowrap;" >Level 6</td>        
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="11" Field="ExamFindResult" id="ExamFindResult_L11" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="11" Field="ExamFindSite" id="ExamFindSite_L11" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="11" Field="ExamFindSide" id="ExamFindSide_L11" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;"  class="eformLargePopulatedTableBlue" >
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="11" Field="ExamFindMaxDim" id="ExamFindMaxDim_L11" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;"  class="eformLargePopulatedTableBlue" >
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="11" Field="ExamFindExtension" id="ExamFindExtension_L11" LookupCode="YesNoUnknown" runat="server"  /></td>
 
 
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="12" Field="ExamFindResult" id="ExamFindResult_R12" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="12" Field="ExamFindSite" id="ExamFindSite_R12" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="12" Field="ExamFindSide" id="ExamFindSide_R12" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="12" Field="ExamFindMaxDim" id="ExamFindMaxDim_R12" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;" class="eformLargePopulatedTable">
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="12" Field="ExamFindExtension" id="ExamFindExtension_R12" LookupCode="YesNoUnknown" runat="server"  /></td>
        <td class="controlBoxDataGridTitleColumn"><euc:EformDeleteIcon ID="EformDeleteIcon_6" runat="server"/></td>
    </tr>
    <tr>
        <td style="text-align: left; white-space: nowrap;" >Level 7</td>        
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="13" Field="ExamFindResult" id="ExamFindResult_L13" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="13" Field="ExamFindSite" id="ExamFindSite_L13" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="13" Field="ExamFindSide" id="ExamFindSide_L13" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;"  class="eformLargePopulatedTableBlue" >
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="13" Field="ExamFindMaxDim" id="ExamFindMaxDim_L13" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;"  class="eformLargePopulatedTableBlue" >
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="13" Field="ExamFindExtension" id="ExamFindExtension_L13" LookupCode="YesNoUnknown" runat="server"  /></td>
 
 
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="14" Field="ExamFindResult" id="ExamFindResult_R14" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="14" Field="ExamFindSite" id="ExamFindSite_R14" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="14" Field="ExamFindSide" id="ExamFindSide_R14" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="14" Field="ExamFindMaxDim" id="ExamFindMaxDim_R14" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;" class="eformLargePopulatedTable">
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="14" Field="ExamFindExtension" id="ExamFindExtension_R14" LookupCode="YesNoUnknown" runat="server"  /></td>
        <td class="controlBoxDataGridTitleColumn"><euc:EformDeleteIcon ID="EformDeleteIcon_7" runat="server"/></td>
    </tr>
        <tr>
        <td style="text-align: left; white-space: nowrap;" >Levels:<br />
                <euc:EformExtendedCheckBoxList style="white-space: nowrap;" Table="NoTable" Field="ExamFindSiteCBL" ID="ExamFindSiteCBL_L15" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="1" Text="1" />
                    <asp:ListItem Value="2" Text="2" />
                    <asp:ListItem Value="3" Text="3" />
                    <asp:ListItem Value="4" Text="4" />
                    <asp:ListItem Value="5" Text="5" />
                    <asp:ListItem Value="6" Text="6" />
                    <asp:ListItem Value="7" Text="7" />           
                </euc:EformExtendedCheckBoxList>
        </td>        
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="15" Field="ExamFindResult" id="ExamFindResult_L15" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="15" Field="ExamFindSite" id="ExamFindSite_L15" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="15" Field="ExamFindSide" id="ExamFindSide_L15" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;"  class="eformLargePopulatedTableBlue" >
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="15" Field="ExamFindMaxDim" id="ExamFindMaxDim_L15" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;"  class="eformLargePopulatedTableBlue" >
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="15" Field="ExamFindExtension" id="ExamFindExtension_L15" LookupCode="YesNoUnknown" runat="server"  /></td>
 
 
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformDropDownList Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="16" Field="ExamFindResult" id="ExamFindResult_R16" runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Single" Text="Single" />
                <asp:ListItem Value="Multiple" Text="Multiple" />
                <asp:ListItem Value="Unknown" Text="Unknown" />
           </euc:EformDropDownList>
           
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="16" Field="ExamFindSite" id="ExamFindSite_R16" runat="server" />
           <euc:EformTextBox Width="1px" style="display: none;" Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="16" Field="ExamFindSide" id="ExamFindSide_R16" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
            <euc:EformTextBox Width="60px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="16" Field="ExamFindMaxDim" id="ExamFindMaxDim_R16" runat="server" /></td>
        <td style="text-align: center; white-space: nowrap; DISPLAY: none;" class="eformLargePopulatedTable">
            <euc:EformComboBox DropDownWidth="auto" Width="80px"  Table="EncNodeExamFinding" ParentRecordId="1"  RecordId="16" Field="ExamFindExtension" id="ExamFindExtension_R16" LookupCode="YesNoUnknown" runat="server"  /></td>
        <td class="controlBoxDataGridTitleColumn"><euc:EformDeleteIcon ID="EformDeleteIcon_8" runat="server"/></td>

</table>
<br/><br/><br/>

<script type="text/javascript">

    /* <![CDATA[ */
    addEvents($('<%= ExamFindResult_L1.ClientID %>'),$('<%= ExamFindSide_L1.ClientID %>'),$('<%= ExamFindSite_L1.ClientID %>'),$('<%= ExamFindMaxDim_L1.ClientID %>'),$('<%= ExamFindExtension_L1.ClientID %>'),'Left','Level 1');
    addEvents($('<%= ExamFindResult_R2.ClientID %>'),$('<%= ExamFindSide_R2.ClientID %>'),$('<%= ExamFindSite_R2.ClientID %>'),$('<%= ExamFindMaxDim_R2.ClientID %>'),$('<%= ExamFindExtension_R2.ClientID %>'),'Right','Level 1');

    addEvents($('<%= ExamFindResult_L3.ClientID %>'),$('<%= ExamFindSide_L3.ClientID %>'),$('<%= ExamFindSite_L3.ClientID %>'),$('<%= ExamFindMaxDim_L3.ClientID %>'),$('<%= ExamFindExtension_L3.ClientID %>'),'Left','Level 2');
    addEvents($('<%= ExamFindResult_R4.ClientID %>'),$('<%= ExamFindSide_R4.ClientID %>'),$('<%= ExamFindSite_R4.ClientID %>'),$('<%= ExamFindMaxDim_R4.ClientID %>'),$('<%= ExamFindExtension_R4.ClientID %>'),'Right','Level 2');

    addEvents($('<%= ExamFindResult_L5.ClientID %>'),$('<%= ExamFindSide_L5.ClientID %>'),$('<%= ExamFindSite_L5.ClientID %>'),$('<%= ExamFindMaxDim_L5.ClientID %>'),$('<%= ExamFindExtension_L5.ClientID %>'),'Left','Level 3');
    addEvents($('<%= ExamFindResult_R6.ClientID %>'),$('<%= ExamFindSide_R6.ClientID %>'),$('<%= ExamFindSite_R6.ClientID %>'),$('<%= ExamFindMaxDim_R6.ClientID %>'),$('<%= ExamFindExtension_R6.ClientID %>'),'Right','Level 3');

    addEvents($('<%= ExamFindResult_L7.ClientID %>'),$('<%= ExamFindSide_L7.ClientID %>'),$('<%= ExamFindSite_L7.ClientID %>'),$('<%= ExamFindMaxDim_L7.ClientID %>'),$('<%= ExamFindExtension_L7.ClientID %>'),'Left','Level 4');
    addEvents($('<%= ExamFindResult_R8.ClientID %>'),$('<%= ExamFindSide_R8.ClientID %>'),$('<%= ExamFindSite_R8.ClientID %>'),$('<%= ExamFindMaxDim_R8.ClientID %>'),$('<%= ExamFindExtension_R8.ClientID %>'),'Right','Level 4');

    addEvents($('<%= ExamFindResult_L9.ClientID %>'),$('<%= ExamFindSide_L9.ClientID %>'),$('<%= ExamFindSite_L9.ClientID %>'),$('<%= ExamFindMaxDim_L9.ClientID %>'),$('<%= ExamFindExtension_L9.ClientID %>'),'Left','Level 5');
    addEvents($('<%= ExamFindResult_R10.ClientID %>'),$('<%= ExamFindSide_R10.ClientID %>'),$('<%= ExamFindSite_R10.ClientID %>'),$('<%= ExamFindMaxDim_R10.ClientID %>'),$('<%= ExamFindExtension_R10.ClientID %>'),'Right','Level 5');
   
    addEvents($('<%= ExamFindResult_L11.ClientID %>'),$('<%= ExamFindSide_L11.ClientID %>'),$('<%= ExamFindSite_L11.ClientID %>'),$('<%= ExamFindMaxDim_L11.ClientID %>'),$('<%= ExamFindExtension_L11.ClientID %>'),'Left','Level 6');
    addEvents($('<%= ExamFindResult_R12.ClientID %>'),$('<%= ExamFindSide_R12.ClientID %>'),$('<%= ExamFindSite_R12.ClientID %>'),$('<%= ExamFindMaxDim_R12.ClientID %>'),$('<%= ExamFindExtension_R12.ClientID %>'),'Right','Level 6');
   
    addEvents($('<%= ExamFindResult_L13.ClientID %>'),$('<%= ExamFindSide_L13.ClientID %>'),$('<%= ExamFindSite_L13.ClientID %>'),$('<%= ExamFindMaxDim_L13.ClientID %>'),$('<%= ExamFindExtension_L13.ClientID %>'),'Left','Level 7');
    addEvents($('<%= ExamFindResult_R14.ClientID %>'),$('<%= ExamFindSide_R14.ClientID %>'),$('<%= ExamFindSite_R14.ClientID %>'),$('<%= ExamFindMaxDim_R14.ClientID %>'),$('<%= ExamFindExtension_R14.ClientID %>'),'Right','Level 7');
      
    addEvents($('<%= ExamFindResult_L15.ClientID %>'),$('<%= ExamFindSide_L15.ClientID %>'),$('<%= ExamFindSite_L15.ClientID %>'),$('<%= ExamFindMaxDim_L15.ClientID %>'),$('<%= ExamFindExtension_L15.ClientID %>'),'Left','Multiple Levels');
    addEvents($('<%= ExamFindResult_R16.ClientID %>'),$('<%= ExamFindSide_R16.ClientID %>'),$('<%= ExamFindSite_R16.ClientID %>'),$('<%= ExamFindMaxDim_R16.ClientID %>'),$('<%= ExamFindExtension_R16.ClientID %>'),'Right','Multiple Levels');

    //Adds events to controls
    function addEvents(result,side,site,maxDim,extension,sideValue,siteValue)
    { 
        $(result).addEvent('blur',curry(SetHiddenFields,result,side,site,maxDim,extension,sideValue,siteValue));
        $(maxDim).addEvent('blur',curry(SetHiddenFields,result,side,site,maxDim,extension,sideValue,siteValue));
        $(extension).addEvent('blur',curry(SetHiddenFields,result,side,site,maxDim,extension,sideValue,siteValue));
   }

 
    /* ]]> */
    
function SetHiddenFields(result,side,site,maxDim,extension,sideValue,siteValue)
{
    if (result.value != '' || maxDim.value != '' || extension.value != '' )    
    {
        side.value = sideValue;        
        
        if (siteValue == 'Level Unknown: Central')
            site.value = 'Level 6,7';
        else if (siteValue == 'Level Unknown: Lateral')
            site.value = 'Level 1,2,3,4,5';
        else if (siteValue == 'Level Unknown')
            site.value = 'Level 1,2,3,4,5,6,7';
        else if (siteValue == 'Multiple Levels')
        {
            var siteLevelId = document.getElementById('<%= ExamFindSiteCBL_L15.ClientID  %>'); 
            var levelsString =  RetrieveCheckBoxListSelectedValues (siteLevelId,"FLOW");
            site.value = "Level " + levelsString;
        }
        else
            site.value = siteValue;
    }
    else
    {
        side.value = '';
        site.value = '';
    }
}
</script>