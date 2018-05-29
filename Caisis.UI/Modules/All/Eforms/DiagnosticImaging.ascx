<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.DiagnosticImaging" CodeFile="DiagnosticImaging.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<br>
<a name="DiagnosticImaging">
	<table width="380" border="0" cellpadding="0" cellspacing="0" class="controlBox">
		<tr>
			<td><img src="../Images/shim.gif" width="1" height="1"></td>
			<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="4">
					<tr>
						<td colspan="3" height="18" align="left" class="controlBoxTitle">Imaging&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td class="controlBoxDataGridTitleColumn"></td>
						<td class="controlBoxDataGridTitleColumn">Target</td>
						<td class="controlBoxDataGridTitleColumn">Result</td>
						<td class="controlBoxDataGridTitleColumn">Date</td>
					</tr>
					<tr>
						<td class="controlBoxDataGridTitleColumn" nowrap>
							<euc:EformCheckBox Text="MRI"  RecordId="1" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_1" />
							
						</td>
						<td>
							<euc:EformSelect RecordId="1" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server"
								ID="DxTarget_1" /></td>
						<td>
							<euc:EformSelect RecordId="1" LookupCode="DxResult" TABLE="Diagnostics" FIELD="DxResult" Runat="server"
								ID="DxResult_1" /></td>
						<td>
							<euc:EformHidden RecordId="1" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_1" />
							<euc:EformTextBox RecordId="1" style="WIDTH:100px" TABLE="Diagnostics" FIELD="DxDateText" 
								ShowCalendar="True"
								CalcDate="True"  Runat="server"
								ID="DxDateText_1" /></td>
					</tr>
					<tr>
						<td class="controlBoxDataGridTitleColumn" nowrap>
							<euc:EformCheckBox Text="CT" RecordId="2" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_2" />
							
						</td>
						<td>
							<euc:EformSelect RecordId="2" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server"
								ID="DxTarget_2" /></td>
						<td>
							<euc:EformSelect RecordId="2" LookupCode="DxResult" TABLE="Diagnostics" FIELD="DxResult" Runat="server"
								ID="DxResult_2" /></td>
						<td>
							<euc:EformHidden RecordId="2" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_2" />
							<euc:EformTextBox 
								RecordId="2" style="WIDTH:100px" 
								TABLE="Diagnostics" 
								FIELD="DxDateText" Runat="server"
								ShowCalendar="True"
								CalcDate="True"
								ID="DxDateText_2" /></td>
					</tr>
					<tr>
						<td class="controlBoxDataGridTitleColumn" nowrap>
							<euc:EformCheckBox Text="Bone Scan" RecordId="3" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_3" />
						
						</td>
						<td>
							<euc:EformSelect RecordId="3" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server"
								ID="DxTarget_3" /></td>
						<td>
							<euc:EformSelect RecordId="3" LookupCode="DxResult" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_3" /></td>
						<td>
							<euc:EformHidden RecordId="3" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_3" />
							<euc:EformTextBox RecordId="3" style="WIDTH:100px" 
								TABLE="Diagnostics" 
								FIELD="DxDateText" Runat="server"
								ShowCalendar="True"
								CalcDate="True"
								ID="DxDateText_3" /></td>
					</tr>
					
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
					
					<tr class="controlBoxDataGridTitleColumn">
								<td>
									<euc:EformCheckBox  Text="Ultrasound" RecordId="4" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_4" />
								</td>
								<td>
									<euc:EformSelect RecordId="4" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_4" /></td>
								<td>
									<euc:EformSelect RecordId="4" LookupCode="DxResult" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_4" /></td>
								<td>
									<euc:EformHidden RecordId="4" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_4" />
									<euc:EformTextBox RecordId="4" style="WIDTH:100px" 
										TABLE="Diagnostics" 
										FIELD="DxDateText" Runat="server"
										ShowCalendar="True"
										CalcDate="True" 
										ID="DxDateText_4" /></td>
					</tr>
					
					
					<tr>
						<td colspan="4">
						
						<table class="controlBoxDataGridTitleColumn">
							
							<tr>
								<td></td>
								<td class="controlBoxDataGridTitleColumn">Height</td>
								<td class="controlBoxDataGridTitleColumn">Width</td>
								<td class="controlBoxDataGridTitleColumn">Length</td>
								<td class="controlBoxDataGridTitleColumn">Avg Dim</td>
								<td class="controlBoxDataGridTitleColumn">Volume</td>
							</tr>
							<tr>
								<td nowrap>
								<euc:EformCheckBox Text="1" TABLE="DxImageProstate" FIELD="ImgUseForDosimetry" Runat="server" ID="ImgUseForDosimetry" />
									Use For Dosimetry
								</td>
								<td>
									<euc:EformTextBox TABLE="DxImageProstate" FIELD="ImgProsHeight" Runat="server" ID="ImgProsHeight" style="WIDTH:100px" /></td>
								<td>
									<euc:EformTextBox TABLE="DxImageProstate" FIELD="ImgProsWidth" Runat="server" ID="ImgProsWidth" style="WIDTH:100px" /></td>
								<td>
									<euc:EformTextBox TABLE="DxImageProstate" FIELD="ImgProsLength" Runat="server" ID="ImgProsLength" style="WIDTH:100px" /></td>
								<td>
									<euc:EformTextBox TABLE="DxImageProstate" FIELD="ImgAvgDim" Runat="server" ID="ImgAvgDim" style="WIDTH:100px" /></td>
								<td>
									<euc:EformTextBox TABLE="DxImageProstate" FIELD="ImgProsVolume" Runat="server" ID="ImgProsVolume" style="WIDTH:100px" /></td>
							
							</tr>
						</table>
						
						</td>
					</tr>
				</table>
			</td>
		<tr>
			<td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2"></td>
			<td>&nbsp;</td>
			<td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2"></td>
		</tr>
	</table>
</a>
