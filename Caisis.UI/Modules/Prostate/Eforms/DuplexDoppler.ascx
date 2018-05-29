<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.DuplexDoppler" CodeFile="DuplexDoppler.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<style type="text/css">
table#DuplexDopplerHTMLTable
{
    width: 700px;
    border-collapse: collapse;
}
table#DuplexDopplerHTMLTable th
{
    border: solid 1px #cccccc;
    font-weight: bold;
    padding: 3px;
    text-align: center;
    font-size: 11px;
    font-weight: bold;
    color: #1f1f1f;
    background-color: #dfdfdf;
}
table#DuplexDopplerHTMLTable td
{
    border: solid 1px #cccccc;
    padding: 8px 3px;
    text-align: left;
}
table#DuplexDopplerHTMLTable table
{
    border-collapse: collapse;
}
table#DopplerMeasurements
{
    width: 100%;
}
table#DopplerMeasurements td
{
    text-align: center;
}
table#deformityTable
{
    width: 100%;
}
table#deformityTable td
{
    border-right: none;
    border-left: none;
}
table#DuplexDopplerDiagnosisHTMLTable
{
}
table#DuplexDopplerDiagnosisHTMLTable td
{
    padding:10px 5px 10px 10px;
    vertical-align: top;
}
</style>


<a name="DuplexDoppler" /><span class="controlBoxTitle" style="margin-right: 30px;">Duplex Doppler Ultrasonography</span>
Clinician Performing Review:
<euc:EformRadioButtonList RepeatLayout="Flow" CellSpacing="4" RepeatDirection="Horizontal" TABLE="SurveyItems" RecordId="61" FIELD="SurveyItemResult" id="SurveyItemResult_61"  runat="server" >
		    <asp:ListItem  Value="PA/NP">NP/PA</asp:ListItem>
			<asp:ListItem  Value="Fellow">Fellow</asp:ListItem>
			<asp:ListItem  Value="Attending">Attending</asp:ListItem>
</euc:EformRadioButtonList>
<br />
			<table id="DuplexDopplerHTMLTable" class="eformXLargePopulatedTable" cellspacing="0">
				<tr>
					<td height="30" align="left" ><strong>Indications</strong>:
					<euc:EformComboBox RecordId="62" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_62" runat="server" Width="450px" LookupCode="Indication" DropDownWidth="450" />
					</td>
				</tr>
				<tr>
					<td align="left" ><strong>Procedure</strong>: Patient Consented
					<euc:EformRadioButtonList RepeatLayout="Flow" CellSpacing="4" RepeatDirection="Horizontal" TABLE="SurveyItems" RecordId="63" FIELD="SurveyItemResult" id="SurveyItemResult_63"  runat="server" Uncheckable="true" >
		                <asp:ListItem  Value="Yes">Yes</asp:ListItem>
			            <asp:ListItem  Value="No">No</asp:ListItem>
                    </euc:EformRadioButtonList>
					</td>
				</tr>
				<tr>
					<td style="padding: 0px 0px; border: 0px;">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="50%" style="width: 50%;" >Agent
								<euc:EformComboBox RecordId="64" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_64" runat="server" Width="200px" LookupCode="Medication" DropDownWidth="200" />
								</td>
								<td ># Doses
								<euc:EformTextBox RecordId="65" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_65" Width="40px" />
								</td>
							</tr>
						</table>				  </td>
				</tr>
				<tr>
					<td style="padding: 0px 0px; border: 0px;">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="25%" height="20" align="left" valign="top" >BQE
								<euc:EformTextBox RecordId="66" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_66" Width="90px" />
								</td>
								<td width="40%" align="left" valign="top" >Oral Agent Response
								<euc:EformTextBox RecordId="67" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_67" Width="130px" />
								</td>
								<td width="35%" align="left" valign="top" >ICI Response
								<euc:EformTextBox RecordId="68" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_68" Width="130px" />
								</td>
						  </tr>
						</table>					</td>
				</tr>
				<tr>
					<td style="border-width: 6px 0px 6px 0px; padding: 0px 0px;">
						<table id="DopplerMeasurements" cellspacing="0">
							<tr>
								<td >Dose</td>
								<td >Right PSV</td>
								<td >Left PSV</td>
								<td >Right EDV</td>
								<td >Left EDV</td>
								<td >Right RI</td>
								<td >Left RI</td>
								<td >&nbsp;</td>
							</tr>
							<tr>
								<td height="30"  align="center" valign="middle">Dose 1</td>
								<td ><euc:EformTextBox RecordId="69" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_69" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="70" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_70" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="71" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_71" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="72" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_72" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="73" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_73" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="74" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_74" Width="70px" /></td>
								<td><euc:EformDeleteIcon runat="server" /></td>
							</tr>
							<tr>
								<td height="30"  align="center" valign="middle">Dose 2</td>
								<td ><euc:EformTextBox RecordId="75" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_75" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="76" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_76" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="77" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_77" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="78" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_78" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="79" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_79" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="80" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_80" Width="70px" /></td>
								<td><euc:EformDeleteIcon runat="server" /></td>
							</tr>
							<tr>
								<td height="30"  align="center" valign="middle">Dose 3</td>
								<td ><euc:EformTextBox RecordId="81" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_81" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="82" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_82" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="83" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_83" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="84" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_84" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="85" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_85" Width="70px" /></td>
								<td ><euc:EformTextBox RecordId="86" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_86" Width="70px" /></td>
								<td><euc:EformDeleteIcon runat="server" /></td>
							</tr>
					  </table>					</td>
				</tr>
				<tr>
					<td style="border: none; padding: 0px 0px;">
						<table  id="deformityTable" cellspacing="0">
							<tr>
								<td height="30" align="left" valign="top" >Curvature
								<euc:EformTextBox RecordId="87" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_87" Width="160px" />
								</td>
								<td align="left" valign="top" >Location
								<euc:EformTextBox RecordId="88" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_88" Width="140px" /></td>
								<td align="left" valign="top" >Degree
								<euc:EformTextBox RecordId="89" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_89" Width="120px" /></td>
							</tr>
							<tr>
								<td height="30" align="left" valign="top" >Other Deformity
								<euc:EformTextBox RecordId="90" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_90" Width="120px" /></td>
								<td align="left" valign="top" >Location
								<euc:EformTextBox RecordId="91" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_91" Width="120px" /></td>
								<td align="left" valign="top" >Magnitude
								<euc:EformTextBox RecordId="92" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_92" Width="120px" /></td>
							</tr>
							<tr>
								<td height="30" align="left" valign="top" >Stretched Flaccid Length (cm)
								<euc:EformTextBox RecordId="93" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_93" Width="50px" /></td>
								<td colspan="2" align="left" valign="top" >Erect Length (cm)
								<euc:EformTextBox RecordId="94" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_94" Width="50px" /></td>
							</tr>
							<tr>
								<td colspan="2" height="30" align="left" valign="top" >Neo-Synephrine Administration
								<euc:EformTextBox RecordId="95" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_95" Width="250px" /></td>
								<td align="left" valign="top" >Dose
								<euc:EformTextBox RecordId="96" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_96" Width="50px" /></td>
							</tr>
						</table>				  </td>
				</tr>
			</table><br /><br />
			
			
<span class="controlBoxTitle" style="margin-right: 30px;">Duplex Doppler Ultrasonography Diagnosis</span>
			<table id="DuplexDopplerDiagnosisHTMLTable" class="eformXLargePopulatedTable" cellspacing="0">
				<tr>
					<td align="left" ><strong>1</strong></td>
					<td>
					<euc:EformTextArea RecordId="97" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_97" runat="server" style="width: 600px; height: 50px;" />
					</td>
					<td><euc:EformDeleteIcon runat="server" /></td>
				</tr>
				<tr>
					<td align="left" ><strong>2</strong></td>
					<td>
					<euc:EformTextArea RecordId="98" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_98" runat="server" style="width: 600px; height: 50px;" />
					</td>
					<td><euc:EformDeleteIcon runat="server" /></td>
				</tr>
				<tr>
					<td align="left" ><strong>3</strong></td>
					<td>
					<euc:EformTextArea RecordId="99" Table="SurveyItems" Field="SurveyItemResult" ID="SurveyItemResult_99" runat="server" style="width: 600px; height: 50px;" />
					</td>
					<td><euc:EformDeleteIcon runat="server" /></td>
				</tr>
			</table><br /><br /><br />