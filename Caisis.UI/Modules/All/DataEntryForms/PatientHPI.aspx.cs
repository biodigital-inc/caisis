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

using System.Data.SqlClient;

using Caisis.Security;	

using Caisis.DataAccess;
using Caisis.BOL;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.All.DataEntryForms
{
	/// <summary>
	/// Summary description for PatientOverviewReport.
	/// </summary>
	
	public partial class PatientHPI : BasePage
	{
		//Constant set to determine when to start the next HPI column based on the number of rows KR
		protected int recordCount;
        private int patientID;
        private int RowsAllowed;
		
		override protected void Page_Load(object sender, System.EventArgs e)
		{
            patientID = int.Parse(Session[SessionKey.PatientId].ToString());

            if (patientID != null && patientID > 0)
            {
                this.BuildHPI();
                this.ShowNomograms();
            }
        }

        protected void ShowNomograms()
        {
           Caisis.Controller.DiseaseController dc = new Caisis.Controller.DiseaseController();
           string currentDisease = dc.GetDiseaseView();

            // only show nomograms when in prostate mode
            if (currentDisease.ToUpper().Equals("PROSTATE"))
            {
                nomogramPanel.Visible = true;
                
                NomogramDa nda = new NomogramDa();

                string PreRPError = null;
                string PreXRTError = null;
                string PreBrachyError = null;
                string PostRPError = null;

                try
                {
                    preRP5Nomo.Text = ((int)Math.Round(nda.GetPreRPResult(patientID, 5), 0)).ToString();
                }
                catch (Exception e1)
                {
                    PreRPError = e1.Message;
                }

                try
                {
                    preRP10Nomo.Text = ((int)Math.Round(nda.GetPreRPResult(patientID, 10), 0)).ToString();
                }
                catch (Exception e1)
                {
                    PreRPError = e1.Message;
                }

                try
                {
                    preXRTNomo.Text = ((int)Math.Round(nda.GetPreXRTResult(patientID), 0)).ToString();
                }
                catch (Exception e2)
                {
                    PreXRTError = e2.Message;
                }

                try
                {
                    preBrachyNomo.Text = ((int)Math.Round(nda.GetPreBrachyResult(patientID), 0)).ToString();
                }
                catch (Exception e3)
                {
                    PreBrachyError = e3.Message;
                }

                try
                {
                    postRP2yrNomo.Text = ((int)Math.Round(nda.GetPostRPResult(patientID, 2), 0)).ToString();
                    postRP5yrNomo.Text = ((int)Math.Round(nda.GetPostRPResult(patientID, 5), 0)).ToString();
                    postRP7yrNomo.Text = ((int)Math.Round(nda.GetPostRPResult(patientID, 7), 0)).ToString();
                    postRP10yrNomo.Text = ((int)Math.Round(nda.GetPostRPResult(patientID, 10), 0)).ToString();
                }
                catch (Exception e4)
                {
                    PostRPError = e4.Message;
                }

                if (PreRPError != null && PreRPError.Length > 0)
                {
                    if (PreRPError == "No biopsy noted.")
                    {
                        preRP5Nomo.Text = "No Biopsy";
                        preRP10Nomo.Text = "No Biopsy";
                    }
                    else
                    {
                        preRP5Nomo.ToolTip = PreRPError;
                        preRP10Nomo.ToolTip = PreRPError;
                        preRP5Nomo.Attributes.Add("style", "cursor:hand;");
                        preRP10Nomo.Attributes.Add("style", "cursor:hand;");
                        preRP5Nomo.Text += "&nbsp;<img src=\"../../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">";
                        preRP10Nomo.Text += "&nbsp;<img src=\"../../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">";
                        // old:with error displayed all the time
                        //NomogramError.Text += "<strong>* Cannot calculate PreRP:</strong>&nbsp;&nbsp;" + PreRPError + "<br/>";
                        //preRPNomo.Text += "*";
                    }
                }
                if (PreXRTError != null && PreXRTError.Length > 0)
                {
                    if (PreXRTError == "No biopsy noted.")
                    {
                        preXRTNomo.Text = "No Biopsy";
                    }
                    else if (PreXRTError == "No XRT noted.")
                    {
                        preXRTNomo.Text = "No XRT";
                    }
                    else
                    {
                        preXRTNomo.ToolTip = PreXRTError;
                        preXRTNomo.Attributes.Add("style", "cursor:hand;");
                        preXRTNomo.Text += "&nbsp;<img src=\"../../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">";
                        // old:with error displayed all the time
                        //NomogramError.Text += "<strong>** Cannot calculate PreXRT:</strong>&nbsp;&nbsp;" + PreXRTError + "<br/>";
                        //preXRTNomo.Text += "**";

                    }

                }
                if (PreBrachyError != null && PreBrachyError.Length > 0)
                {
                    if (PreBrachyError == "No biopsy noted.")
                    {
                        preBrachyNomo.Text = "No Biopsy";
                    }
                    else
                    {
                        preBrachyNomo.ToolTip = PreBrachyError;
                        preBrachyNomo.Attributes.Add("style", "cursor:hand;");
                        preBrachyNomo.Text += "&nbsp;<img src=\"../../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">";
                        // old:with error displayed all the time
                        //NomogramError.Text += "<strong>*** Cannot calculate PreBrachy:</strong>&nbsp;&nbsp;" + PreBrachyError + "<br/>";
                        //preBrachyNomo.Text += "***";
                    }
                }
                if (PostRPError != null && PostRPError.Length > 0)
                {
                    if (PostRPError == "No radical prostatectomy noted.")
                    {
                        postRP2yrNomo.Text = "No RP";
                        postRP5yrNomo.Text = "No RP";
                        postRP7yrNomo.Text = "No RP";
                        postRP10yrNomo.Text = "No RP";
                    }
                    else
                    {
                        postRP2yrNomo.ToolTip = PostRPError;
                        postRP2yrNomo.Attributes.Add("style", "cursor:hand;");
                        postRP2yrNomo.Text += "&nbsp;<img src=\"../../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">";

                        postRP5yrNomo.ToolTip = PostRPError;
                        postRP5yrNomo.Attributes.Add("style", "cursor:hand;");
                        postRP5yrNomo.Text += "&nbsp;<img src=\"../../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">";

                        postRP7yrNomo.ToolTip = PostRPError;
                        postRP7yrNomo.Attributes.Add("style", "cursor:hand;");
                        postRP7yrNomo.Text += "&nbsp;<img src=\"../../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">";

                        postRP10yrNomo.ToolTip = PostRPError;
                        postRP10yrNomo.Attributes.Add("style", "cursor:hand;");
                        postRP10yrNomo.Text += "&nbsp;<img src=\"../../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">";

                        // old:with error displayed all the time
                        //NomogramError.Text += "<strong>**** Cannot calculate PostRP:</strong>&nbsp;&nbsp;" + PostRPError;
                        //postRP2yrNomo.Text += "****";
                        //postRP5yrNomo.Text += "****";
                        //postRP7yrNomo.Text += "****";
                    }
                }

                if (NomogramError.Text.Length < 1)
                {
                    NomogramErrorTableRow.Visible = false;
                }
            }
        }


        //Get HPI data; formatted OnItemBound
        protected void BuildHPI()
        {
            try
            {
                    DataSet hpiDs = new DataSet();

                    Caisis.Controller.DiseaseController dc = new Caisis.Controller.DiseaseController();
                    string currentDisease = dc.GetDiseaseView();

                    
                    PatientDa pDa = new PatientDa();


                    //  show most relevant HPI
                    if (currentDisease.ToUpper().Contains("BREAST"))
                    {
                        hpiDs = pDa.GetPatientHPIBreast(this.patientID);
                        HpiTypeDisplay.Text = " (" + currentDisease + ")";
                    }
                    else if (currentDisease.ToUpper().Contains("BLADDER"))
                    {
                        hpiDs = pDa.GetPatientHPIBladder(this.patientID);
                        HpiTypeDisplay.Text = " (" + currentDisease + ")";
                    }
                    else if (currentDisease.ToUpper().Contains("KIDNEY"))
                    {
                        hpiDs = pDa.GetPatientHPIKidney(this.patientID);
                        HpiTypeDisplay.Text = " (" + currentDisease + ")";
                    }
                    else if (currentDisease.ToUpper().Contains("TESTIS"))
                    {
                        hpiDs = pDa.GetPatientHPITestis(this.patientID);
                        HpiTypeDisplay.Text = " (" + currentDisease + ")";
                    }
                    else
                    {
                        hpiDs = pDa.GetPatientHPI(this.patientID, 0, 0);
                    }

                int HpiRecordCount = hpiDs.Tables[0].Rows.Count;
                    if (HpiRecordCount > 6)
                    {
                        double rowsPerColumn = HpiRecordCount / 2;
                        RowsAllowed = ((int)Math.Round(rowsPerColumn)) - 1;
                    }
                    else
                    {
                        RowsAllowed = HpiRecordCount;
                    }


                
                    if (currentDisease.ToUpper().Contains("BREAST"))
                    {
                        hpiBreast.DataSource = hpiDs.Tables[0].DefaultView;
                        hpiBreast.DataBind();
                    }
                    else
                    {
                        hpi.DataSource = hpiDs.Tables[0].DefaultView;
                        hpi.DataBind();
                    }
                    

                
            }
            catch (Exception ex)
            {
                HPIerrorMsg.Visible = true;
                HPIerrorMsg.Text = "Error creating the hpi. The administrator has been notified.";
                ExceptionHandler.Publish(ex);
            }

        }

        protected void hpiItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            Literal StartNextHpiColumn;
            StartNextHpiColumn = (Literal)e.Item.FindControl("StartNextHpiColumn");

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int rowNumber = e.Item.ItemIndex;

                if (rowNumber == RowsAllowed)
                {
                    StartNextHpiColumn.Text = "</td><td width=\"1\" height=\"95%\"><br><img src=\"../images/shimGray.gif\" width=\"1\" height=\"95%\" border=0></td><td class=\"HPITextExtraColumns\" valign=\"top\"><br>";
                }
                else
                {
                    StartNextHpiColumn.Visible = false;
                }
            }
        }



	}

}

	
