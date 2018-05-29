using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.SpecimenMgmt
{
	/// <summary>
	/// Summary description for ResearchSpecimenQuery.
	/// </summary>
	public partial class ResearchSpecimenQuery : SpecimenMgmtBasePage
	{
	
	
		protected override void Page_Load(object sender, System.EventArgs e)
		{
			this.lblMsg.Text="";
			if(!Page.IsPostBack)
			{
				//LoadDDList();
				LoadDefaultForm();
			}
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.enterButton.Click += new System.Web.UI.ImageClickEventHandler(this.onSubmitBtn_Click);
			this.ibtnClear.Click += new System.Web.UI.ImageClickEventHandler(this.ibtnClear_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		public void onSubmitBtn_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			if(!ValidInputs())
				return;
			else
				SaveSessionVariables();
			string ageFrom=txtAgeFrom.Value;
			string ageTo=txtAgeTo.Value;
			string priHistDiag=Request.Form["ddlPriHistoricDiag"];
			string histopaGrade=Request.Form["ddlHistopaGrade"];
			string ER=Request.Form["ddlER"];
			string PR=Request.Form["ddlPR"];
			string Her2ICC=Request.Form["ddlHer"];
			string nodePositive=Request.Form["ddlNodePositive"];
			string adjAgent=Request.Form["ddlAdjuventAgent"];
			string relapseStatus="";
			string bloodSamplesArr="";
			string tissueSamplesArr="";
			string tissueType=Request.Form["ddlTissueType"];
//			if(this.ddlPriHistoricDiag.SelectedIndex!=0)
//				priHistDiag=ddlPriHistoricDiag.SelectedItem.Text;
//			if(this.ddlHistopaGrade.SelectedIndex!=0)
//				histopaGrade=ddlHistopaGrade.SelectedItem.Text;
//
//			if(this.ddlER.SelectedIndex!=0)
//				ER=ddlER.SelectedItem.Text;
//			if(this.ddlPR.SelectedIndex!=0)
//				PR=ddlPR.SelectedItem.Text;
//			if(this.ddlHer.SelectedIndex!=0)
//				Her2ICC=ddlHer.SelectedItem.Text;
//			if(this.ddlNodePositive.SelectedIndex!=0)				
//				nodePositive=ddlNodePositive.SelectedItem.Text;


//			if(this.ddlAdjuventAgent.SelectedIndex!=0)
//				adjAgent=this.ddlAdjuventAgent.SelectedItem.Text;
			if(chkRelapseStatus.Checked)
				relapseStatus="yes";
			else
				relapseStatus="false";
			//fills bloodsample array
			if(this.chkWholeBlood.Checked)
				bloodSamplesArr +=",'Whole Blood'";
			if(this.chkSerum.Checked)
				bloodSamplesArr +=",'Serum'";
			if(this.chkEDTAPlasma.Checked)
				bloodSamplesArr +=",'EDTA Plasma'";
			if(this.chkBuffyCoat.Checked)
				bloodSamplesArr +=",'Buffy Coat'";
			if(this.chkGuthrieCard.Checked)
				bloodSamplesArr +=",'Guthrie Card'";
			if(this.chkDNA.Checked)
				bloodSamplesArr +=",'DNA'";
			if(bloodSamplesArr.Length>0)
				bloodSamplesArr=bloodSamplesArr.Remove(0,1); //removes the first ','

			//fills tissue samples array
			if(this.chkFresh.Checked)
				tissueSamplesArr +=",'Fresh'";
			if(this.chkFFPE.Checked)
				tissueSamplesArr +=",'FFPE'";
			if(this.chkTMA.Checked)
				tissueSamplesArr +=",'TMA'";
			if(tissueSamplesArr.Length>0)
			tissueSamplesArr=tissueSamplesArr.Remove(0,1); //removes the first ','
		
//
//			if(this.ddlTissueType.SelectedIndex!=0)
//				tissueType=ddlTissueType.SelectedItem.Text;
				
			Response.Redirect("SpecimenQueryResults.aspx?QueryType=Research&AgeFrom="+ageFrom+"&AgeTo="+ageTo+
			"&PriHistDiag="+priHistDiag+"&HistopaGrade="+histopaGrade+"&ER="+ER+"&PR="+PR+"&Her2ICC="+Her2ICC+
			"&NodePositive="+nodePositive+"&AdjAgent="+adjAgent+"&RelapseStatus="+relapseStatus+
			"&BloodSamplesArr="+bloodSamplesArr+"&TissueSamplesArr="+tissueSamplesArr+"&TissueType="+tissueType);
		}
		private void SaveSessionVariables()
		{
			base.SaveMySessionVariable("sv_rqTxtAgeFrom",txtAgeFrom.Value);
			base.SaveMySessionVariable("sv_rqTxtAgeTo",txtAgeTo.Value);
			base.SaveMySessionVariable("sv_rqDdlPriHistoricDiag",ddlPriHistoricDiag.SelectedItem.Text);
			base.SaveMySessionVariable("sv_rqDdlHistopaGrade",ddlHistopaGrade.SelectedItem.Text);

			base.SaveMySessionVariable("sv_rqDdlER",ddlER.SelectedItem.Text);
			base.SaveMySessionVariable("sv_rqDdlPR",ddlPR.SelectedItem.Text);
			base.SaveMySessionVariable("sv_rqDdlHer",ddlHer.SelectedItem.Text);
			base.SaveMySessionVariable("sv_rqDdlNodePositive",ddlNodePositive.SelectedItem.Text);

			//base.SaveMySessionVariable("sv_rqDdlAdjuventAgent",ddlAdjuventAgent.SelectedItem.Text);
			base.SaveMySessionVariable("sv_rqChkRelapseStatus",chkRelapseStatus.Checked.ToString());
			
			base.SaveMySessionVariable("sv_rqChkWholeBlood",chkWholeBlood.Checked.ToString());
			base.SaveMySessionVariable("sv_rqChkSerum",chkSerum.Checked.ToString());
			base.SaveMySessionVariable("sv_rqChkEDTAPlasma",chkEDTAPlasma.Checked.ToString());
			base.SaveMySessionVariable("sv_rqChkBuffyCoat",chkBuffyCoat.Checked.ToString());
			base.SaveMySessionVariable("sv_rqChkGuthrieCard",chkGuthrieCard.Checked.ToString());
			base.SaveMySessionVariable("sv_rqChkDNA",chkDNA.Checked.ToString());
			base.SaveMySessionVariable("sv_rqChkFresh",chkFresh.Checked.ToString());
			base.SaveMySessionVariable("sv_rqChkFFPE",chkFFPE.Checked.ToString());
			base.SaveMySessionVariable("sv_rqChkTMA",chkTMA.Checked.ToString());
			base.SaveMySessionVariable("sv_rqDdlTissueType",ddlTissueType.SelectedItem.Text);
			

		}

		private void LoadDefaultForm()
		{
			txtAgeFrom.Value=base.MySessionString("sv_rqTxtAgeFrom");
			txtAgeTo.Value=base.MySessionString("sv_rqTxtAgeTo");

			base.FillDDList(ddlPriHistoricDiag,base.MySessionString("sv_rqDdlPriHistoricDiag"));
			base.FillDDList(ddlHistopaGrade,base.MySessionString("sv_rqDdlHistopaGrade"));
			base.FillDDList(ddlER,base.MySessionString("sv_rqDdlER"));
			base.FillDDList(ddlPR,base.MySessionString("sv_rqDdlPR"));
			base.FillDDList(ddlHer,base.MySessionString("sv_rqDdlHer"));
			base.FillDDList(ddlNodePositive,base.MySessionString("sv_rqDdlNodePositive"));

			//base.FillDDList(ddlAdjuventAgent,base.MySessionString("sv_rqDdlAdjuventAgent"));
			
			switch(base.MySessionString("sv_rqChkRelapseStatus"))
			{
				case "True":
					chkRelapseStatus.Checked=true;
					break;
				default:
					chkRelapseStatus.Checked=false;
					break;
			}

			switch(base.MySessionString("sv_rqChkWholeBlood"))
			{
				case "True":
					chkWholeBlood.Checked=true;
					break;
				default:
					chkWholeBlood.Checked=false;
					break;
			}
			switch(base.MySessionString("sv_rqChkSerum"))
			{
				case "True":
					chkSerum.Checked=true;
					break;
				default:
					chkSerum.Checked=false;
					break;
			}
			switch(base.MySessionString("sv_rqChkEDTAPlasma"))
			{
				case "True":
					chkEDTAPlasma.Checked=true;
					break;
				default:
					chkEDTAPlasma.Checked=false;
					break;
			}
			switch(base.MySessionString("sv_rqChkBuffyCoat"))
			{
				case "True":
					chkBuffyCoat.Checked=true;
					break;
				default:
					chkBuffyCoat.Checked=false;
					break;
			}
			switch(base.MySessionString("sv_rqChkGuthrieCard"))
			{
				case "True":
					chkGuthrieCard.Checked=true;
					break;
				default:
					chkGuthrieCard.Checked=false;
					break;
			}
			switch(base.MySessionString("sv_rqChkDNA"))
			{
				case "True":
					chkDNA.Checked=true;
					break;
				default:
					chkDNA.Checked=false;
					break;
			}
			switch(base.MySessionString("sv_rqChkFresh"))
			{
				case "True":
					chkFresh.Checked=true;
					break;
				default:
					chkFresh.Checked=false;
					break;
			}
			switch(base.MySessionString("sv_rqChkFFPE"))
			{
				case "True":
					chkFFPE.Checked=true;
					break;
				default:
					chkFFPE.Checked=false;
					break;
			}
			switch(base.MySessionString("sv_rqChkTMA"))
			{
				case "True":
					chkTMA.Checked=true;
					break;
				default:
					chkTMA.Checked=false;
					break;
			}
			base.FillDDList(ddlTissueType,base.MySessionString("sv_rqDdlTissueType"));

		}
		private bool ValidInputs()
		{
			string ageFrom=txtAgeFrom.Value;
			string ageTo=txtAgeTo.Value;
			if(ageFrom.Length>0 && !PageUtil.IsInteger(ageFrom))
			{
				this.lblMsg.Text="Age must be a number";
				return false;
			}
			if(ageTo.Length>0 && !PageUtil.IsInteger(ageTo))
			{
				this.lblMsg.Text="Age must be a number";
				return false;
			}
			//if(ageFrom.Length==0)

			return true;
			
		}

		private void ibtnClear_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			this.txtAgeFrom.Value="";
			this.txtAgeTo.Value="";
			this.ddlHistopaGrade.SelectedIndex=0;
			this.ddlPriHistoricDiag.SelectedIndex=0;
			this.ddlER.SelectedIndex=0;
			this.ddlPR.SelectedIndex=0;
			this.ddlHer.SelectedIndex=0;
			this.ddlNodePositive.SelectedIndex=0;

			this.chkRelapseStatus.Checked=false;
			this.chkBuffyCoat.Checked=false;
			this.chkDNA.Checked=false;
			this.chkEDTAPlasma.Checked=false;
			this.chkFFPE.Checked=false;
			this.chkFresh.Checked=false;
			this.chkGuthrieCard.Checked=false;
			this.chkSerum.Checked=false;
			this.chkTMA.Checked=false;
			this.chkWholeBlood.Checked=false;
			
			this.ddlTissueType.SelectedIndex=0;

			ClearSessionVariables();
			
		}
		private  void ClearSessionVariables()
		{

			base.ClearMySessionVariable("sv_rqTxtAgeFrom");
			base.ClearMySessionVariable("sv_rqTxtAgeTo");
			base.ClearMySessionVariable("sv_rqDdlPriHistoricDiag");
			base.ClearMySessionVariable("sv_rqDdlHistopaGrade");

			base.ClearMySessionVariable("sv_rqDdlER");
			base.ClearMySessionVariable("sv_rqDdlPR");
			base.ClearMySessionVariable("sv_rqDdlHer");
			base.ClearMySessionVariable("sv_rqDdlNodePositive");

			//base.SaveMySessionVariable("sv_rqDdlAdjuventAgent",ddlAdjuventAgent.SelectedItem.Text);
			base.ClearMySessionVariable("sv_rqChkRelapseStatus");
			
			base.ClearMySessionVariable("sv_rqChkWholeBlood");
			base.ClearMySessionVariable("sv_rqChkSerum");
			base.ClearMySessionVariable("sv_rqChkEDTAPlasma");
			base.ClearMySessionVariable("sv_rqChkBuffyCoat");
			base.ClearMySessionVariable("sv_rqChkGuthrieCard");
			base.ClearMySessionVariable("sv_rqChkDNA");
			base.ClearMySessionVariable("sv_rqChkFresh");
			base.ClearMySessionVariable("sv_rqChkFFPE");
			base.ClearMySessionVariable("sv_rqChkTMA");
			base.ClearMySessionVariable("sv_rqDdlTissueType");

		}
	}
}
