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
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;


	/// <summary>
    ///		Summary description for ProstateNomograms.
	/// </summary>
    public partial class ProstateNomograms : BaseEFormControl
	{
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            BuildNomograms();
		}

        protected void BuildNomograms()
        {


            NomogramDa nda = new NomogramDa();

            string PreRP5Error = null;
            string PreRP10Error = null;
            string PreXRTError = null;
            string PreBrachyError = null;
            string PostRP7Error = null;
            string PostRP10Error = null;


            try
            {
                preRP10Nomo.Text = ((int)Math.Round(nda.GetPreRPResult(this._patientId, 10), 0)).ToString();
            }
            catch (NomogramDataException e2)
            {
                PreRP10Error = e2.Message;
            }

            try
            {
                preXRTNomo.Text = ((int)Math.Round(nda.GetPreXRTResult(this._patientId), 0)).ToString();
            }
            catch (NomogramDataException e3)
            {
                PreXRTError = e3.Message;
            }

            try
            {
                preBrachyNomo.Text = ((int)Math.Round(nda.GetPreBrachyResult(this._patientId), 0)).ToString();
            }
            catch (NomogramDataException e4)
            {
                PreBrachyError = e4.Message;
            }


            try
            {
                postRP10yrNomo.Text = ((int)Math.Round(nda.GetPostRPResult(this._patientId, 10), 0)).ToString();
            }
            catch (NomogramDataException e6)
            {
                PostRP10Error = e6.Message;
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
                    preXRTNomo.Text += "<img src=\"../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">&nbsp;" + PreXRTError;
                }

            }

            if (PreBrachyError != null && PreBrachyError.Length > 0)
            {
                preBrachyNomo.Text += "<img src=\"../../Images/NomogramAlert.gif\" width=\"9\" height=\"9\">&nbsp;" + PreBrachyError;
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
	}
}
