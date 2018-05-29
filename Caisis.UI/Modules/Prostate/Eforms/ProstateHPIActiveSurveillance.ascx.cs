namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using System.Text;
    using System.Collections;
    using System.Collections.Generic;


	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 using Caisis.UI.Modules.Prostate.PaperForms;
    using Caisis.DataAccess;
    using Caisis.Controller;


	/// <summary>
    ///		Summary description for ProstateHPIActiveSurveillance.
	/// </summary>
    public partial class ProstateHPIActiveSurveillance : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildHPI();
            BuildActiveSurveillanceDate();
        }

		protected void BuildHPI()
		{
                try
                {
					PatientDa hpiDa = new PatientDa();
					DataSet hpiDs = hpiDa.GetPatientHPIForEForm(this._patientId, 0, 0, 1);

					if (hpiDs.Tables[0].Rows.Count > 0)
					{
						hpi.DataSource = hpiDs.Tables[0].DefaultView;
						hpi.DataBind();
					}
					else
					{
						NoHPIMsg.Visible = true;
					}




					if (hpiDs.Tables[1].Rows[0]["DxBiopsyId"] != null && hpiDs.Tables[1].Rows[0]["DxBiopsyId"].ToString().Length > 0)
					{
						hpiBiopsyId = (int)hpiDs.Tables[1].Rows[0]["DxBiopsyId"];
                        ShowDxBiopsy(hpiBiopsyId);
					}





                }
                catch (Exception ex)
                {
                    hpi.Visible = false;
                    //Caisis.UI.Other.EmailError.SendErrorEmail( "Clinic Form: " + this._formTitle, "error creating hpi output");
                    ExceptionHandler.Publish(ex);
                }



                PopulateHPIPreTxPotency();



                BuildHpiProstatectomies(this._patientId, this._eformName, "Dynamic");
                BuildHpiProtocols(this._patientId, this._eformName, "Dynamic");
                BuildHpiBiopsies(this._patientId, this._eformName, "Dynamic", hpiBiopsyId);
                BuildHPINerveStatus();
			


		}


        protected void SetHpiItem(Object Sender, RepeaterItemEventArgs e)
		{
			
			Literal HpiRowItems;
			HpiRowItems = (Literal) e.Item.FindControl("HpiRowItems");

			HtmlTableRow HpiRow;
			HpiRow = (HtmlTableRow) e.Item.FindControl("HpiRow");

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				char[] sep1 = {'|'};
		
				char[] sep2 = {','};
		
				string[] tableNames = ((DataRowView) e.Item.DataItem )["TableNames"].ToString().Split(sep2);

				string[] primaryKeys = ((DataRowView) e.Item.DataItem )["PrimaryKeys"].ToString().Split(sep2);

				string[] hpiItems = ((DataRowView) e.Item.DataItem )["patientHPIDelimited"].ToString().Split(sep1);

			    int numberOfHpiItems = primaryKeys.Length;
				
				string s = "";


				if (numberOfHpiItems > 0)
				{
					if (numberOfHpiItems > 1)
					{
						
						HpiRow.Attributes["class"] = "ClinicalEformPopulatedRowNonClickable";
						HpiRow.Attributes.Remove("onmouseover");
						HpiRow.Attributes.Remove("onmouseout");

						for(int i = 0; i < numberOfHpiItems; i++)
						{
							try
							{
								if(hpiItems[i] != "" && primaryKeys.Length > i && tableNames.Length > i )
								{
									string hpiItem = hpiItems[i].Replace("__", "&nbsp;");


									if (primaryKeys[i].Length > 0 && tableNames[i].Length > 0)
									{
										s += "<span class=\"ClinicalEformPopulatedSpan\" onMouseOver=\"this.className='ClinicalEformHighlightedSpan';\" onMouseOut=\"this.className='ClinicalEformPopulatedSpan';\" onclick=\"LoadDataEntryForm('" + tableNames[i] + "', '" + primaryKeys[i] + "', '');\">" + hpiItem + "&nbsp;</span>&nbsp;&nbsp;&nbsp;";
									}
									else
									{
										s += "<span style=\"padding: 2px;\" >" + hpiItem + "&nbsp;</span>&nbsp;&nbsp;&nbsp;";
									}
									
									
/*
									if (i>0)
									{
										s += "<span class=\"ClinicalEformPopulatedSpan\" onMouseOver=\"this.className='ClinicalEformHighlightedSpan'; document.getElementById('" + HpiRow.ClientID + "').className='ClinicalEformPopulatedRow';\" onMouseOut=\"this.className='ClinicalEformPopulatedSpan';\" onclick=\"LoadDataEntryForm('" + tableNames[i] + "', '" + primaryKeys[i] + "', '');\">" + hpiItem + "&nbsp;</span>&nbsp;&nbsp;&nbsp;";
									}
									else
									{
										HpiRow.Attributes.Add("onclick", "LoadDataEntryForm('" + tableNames[0] + "', '" + primaryKeys[0] + "', '');");
										s += hpiItem + "&nbsp;&nbsp;&nbsp;";
									}
*/


								}
							}
							catch (Exception ex)
							{
								s+= "<b>error: " + ex.Message + "</b>";
							}
						}
						
						
					}
					else
					{
						HpiRow.Attributes.Add("onclick", "LoadDataEntryForm('" + tableNames[0] + "', '" + primaryKeys[0] + "', '');");
						string hpiItem = hpiItems[0].Replace("__", "&nbsp;");
						s = hpiItem;
					}

					HpiRowItems.Text = s;

				}


			}	
		}






		protected void PopulateHPIPreTxPotency()
		{
			SurveyDa potencyDa = new SurveyDa();
			Hashtable ht = potencyDa.FormGetPotencyStatusValues(this._patientId, this._eformName, "Dynamic");

			if (ht["PreTxPot"] != null && ht["PreTxPot"].ToString().Length > 0)
			{
				PreTxPot.Text = ht["PreTxPot"].ToString();
				PreTxPotencyTr.Visible = true;
			}
			else
			{
				PreTxPotencyTr.Visible = false;
			}

		}



		protected virtual void BuildHPINerveStatus()
		{
				ProstatectomyDa pDa = new ProstatectomyDa();
				Hashtable ht = pDa.FormGetNerveStatus(this._patientId, this._eformName, "Dynamic");

				NvbRightTr.Visible = false;
				NvbLeftTr.Visible = false;

				if (ht["NVB_Left"] != null && ht["NVB_Left"].ToString() != "")
				{
					NVB_Left.Text = ht["NVB_Left"].ToString();
					NvbLeftTr.Visible = true;
				}
				if (ht["NVB_Right"] != null && ht["NVB_Right"].ToString() != "")
				{
					NVB_Right.Text = ht["NVB_Right"].ToString();
					NvbRightTr.Visible = true;
				}


		}

        protected void ShowDxBiopsy(int DxBiopsyId)
        {


            BusinessObject biz = BusinessObjectFactory.BuildBusinessObject("Procedures");
            biz.Get(DxBiopsyId);

            DiagnosisDateText.Text = biz[BOL.Procedure.ProcDateText].ToString();


        }




        protected void BuildActiveSurveillanceDate()
        {

            populatedDiagnosisTable.Visible = false;
            NewDiagnosisTable.Visible = false;

            // AS Date is the earlier of the following: a) first MSK Biopsy or b) first status record of 'Active Surveillance' or 'watchful waiting'

            if (ActiveSurveillanceDateText.Text.Length < 1)  // user may elect to overwrite this value, if so, do not change it
            {
                string ASDateText = ProstateUtil.ActiveSurveillanceDate(this._patientId);
                if (ASDateText.Length > 0) ActiveSurveillanceDateText.Text = ASDateText;
            }


        }

	}
}
