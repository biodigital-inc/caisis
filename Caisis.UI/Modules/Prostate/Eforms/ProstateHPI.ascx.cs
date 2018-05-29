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


	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;


	/// <summary>
	///		Summary description for ProstateHPI.
	/// </summary>
	public partial class ProstateHPI : BaseEFormControl
	{




		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildHPI();

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



					//nomograms are in a second result set
					
                    //preRPNomo.Text = hpiDs.Tables[1].Rows[0]["preRPNomo"].ToString();
                    //preXRTNomo.Text = hpiDs.Tables[1].Rows[0]["preXRTNomo"].ToString();
                    //preBrachyNomo.Text = hpiDs.Tables[1].Rows[0]["preBrachyNomo"].ToString();
                    //postRP7yrNomo.Text = hpiDs.Tables[1].Rows[0]["postRP7yrNomo"].ToString();

                    NomogramDa nda = new NomogramDa();

                    string PreRP5Error = null;
                    string PreRP10Error = null;
                    string PreXRTError = null;
                    string PreBrachyError = null;
                    string PostRP7Error = null;
                    string PostRP10Error = null;

                    try
                    {
                        preRP5Nomo.Text = ((int) Math.Round(nda.GetPreRPResult(this._patientId, 5), 0)).ToString();
                    }
                    catch (NomogramDataException e1)
                    {
                        PreRP5Error = e1.Message;
                    }

                    try
                    {
                        preRP10Nomo.Text = ((int) Math.Round(nda.GetPreRPResult(this._patientId, 10), 0)).ToString();
                    }
                    catch (NomogramDataException e2)
                    {
                        PreRP10Error = e2.Message;
                    }

                    try
                    {
                        preXRTNomo.Text = ((int) Math.Round(nda.GetPreXRTResult(this._patientId), 0)).ToString();
                    }
                    catch (NomogramDataException e3)
                    {
                        PreXRTError = e3.Message;
                    }

                    try
                    {
                        preBrachyNomo.Text = ((int) Math.Round(nda.GetPreBrachyResult(this._patientId), 0)).ToString();
                    }
                    catch (NomogramDataException e4)
                    {
                        PreBrachyError = e4.Message;
                    }

                    try
                    {
                        postRP7yrNomo.Text = ((int) Math.Round(nda.GetPostRPResult(this._patientId, 7), 0)).ToString();
                    }
                    catch (NomogramDataException e5)
                    {
                        PostRP7Error = e5.Message;
                    }

                    try
                    {
                        postRP10yrNomo.Text = ((int) Math.Round(nda.GetPostRPResult(this._patientId, 10), 0)).ToString();
                    }
                    catch (NomogramDataException e6)
                    {
                        PostRP10Error = e6.Message;
                    }

					if (hpiDs.Tables[1].Rows[0]["DxBiopsyId"] != null && hpiDs.Tables[1].Rows[0]["DxBiopsyId"].ToString().Length > 0)
					{
						hpiBiopsyId = (int)hpiDs.Tables[1].Rows[0]["DxBiopsyId"];
					}




					

                    //PreRPError = hpiDs.Tables[1].Rows[0]["PreRPError"].ToString();
                    //PreXRTError = hpiDs.Tables[1].Rows[0]["PreXRTError"].ToString();
                    //PreBrachyError = hpiDs.Tables[1].Rows[0]["PreBrachyError"].ToString();
                    //PostRPError = hpiDs.Tables[1].Rows[0]["PostRPError"].ToString();

					 
					if (PreRP5Error != null && PreRP5Error.Length > 0)
					{
//						preRPNomo.ToolTip = PreRPError;
//						preRPNomo.Attributes.Add("style", "cursor:hand;");
						preRP5Nomo.Text += "<img src=\"../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">&nbsp;" + PreRP5Error;
						// old:with error displayed all the time
						//NomogramError.Text += "<strong>* Cannot calculate PreRP:</strong>&nbsp;&nbsp;" + PreRPError + "<br/>";
						//preRPNomo.Text += "*";
					}

                    if (PostRP10Error != null && PostRP10Error.Length > 0)
                    {
                        preRP10Nomo.Text += "<img src=\"../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">&nbsp;" + PreRP10Error;
                    }

					if (PreXRTError != null && PreXRTError.Length > 0)
					{
						if (PreXRTError == "No XRT noted.")
						{
							preXRTNomo.Text = "No XRT";
						}
						else
						{
//							preXRTNomo.ToolTip = PreXRTError;
//							preXRTNomo.Attributes.Add("style", "cursor:hand;");
							preXRTNomo.Text += "<img src=\"../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">&nbsp;" + PreXRTError;
							// old:with error displayed all the time
							//NomogramError.Text += "<strong>** Cannot calculate PreXRT:</strong>&nbsp;&nbsp;" + PreXRTError + "<br/>";
							//preXRTNomo.Text += "**";

						}

					}
					if (PreBrachyError != null && PreBrachyError.Length > 0)
					{
//						preBrachyNomo.ToolTip = PreBrachyError;
//						preBrachyNomo.Attributes.Add("style", "cursor:hand;");
						preBrachyNomo.Text += "<img src=\"../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">&nbsp;" + PreBrachyError;
						// old:with error displayed all the time
						//NomogramError.Text += "<strong>*** Cannot calculate PreBrachy:</strong>&nbsp;&nbsp;" + PreBrachyError + "<br/>";
						//preBrachyNomo.Text += "***";
					}
					if (PostRP7Error != null && PostRP7Error.Length > 0)
					{
						if (PostRP7Error == "No radical prostatectomy noted.")
						{
							postRP7yrNomo.Text = "No RP";
						}
						else
						{
//							postRP7yrNomo.ToolTip = PostRPError;
//							postRP7yrNomo.Attributes.Add("style", "cursor:hand;");
							postRP7yrNomo.Text += "<img src=\"../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">&nbsp;" + PostRP7Error;

							// old:with error displayed all the time
							//NomogramError.Text += "<strong>**** Cannot calculate PostRP:</strong>&nbsp;&nbsp;" + PostRPError;
							//postRP2yrNomo.Text += "****";
							//postRP5yrNomo.Text += "****";
							//postRP7yrNomo.Text += "****";
						}
					}

                    if (PostRP10Error != null && PostRP10Error.Length > 0)
                    {
                        if (PostRP10Error == "No radical prostatectomy noted.")
                        {
                            postRP10yrNomo.Text = "No RP";
                        }
                        else
                        {
                            postRP10yrNomo.Text += "<img src=\"../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">&nbsp;" + PostRP10Error;
                        }
                    }

				}
				catch (Exception ex)
				{
					hpi.Visible = false;
					//Caisis.UI.Other.EmailError.SendErrorEmail( "Clinic Form: " + this._formTitle, "error creating hpi output");
					ExceptionHandler.Publish(ex);
				}



                PopulateHPIPreTxPotency();



// this condition doesn't work, since this.EFormName doesn't always have a value
// so at the moment, on a GU form we are showing many things that don't need to be there.  - jf
//			if (this._eformName != null && this._eformName.IndexOf("GU") < 0)
//			{
                BuildHpiProstatectomies(this._patientId, this._eformName, "Dynamic");
                BuildHpiProtocols(this._patientId, this._eformName, "Dynamic");
                BuildHpiBiopsies(this._patientId, this._eformName, "Dynamic", hpiBiopsyId);
                BuildHPINerveStatus();

//			}
			


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


	}
}
