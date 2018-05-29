using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.Security;

namespace Caisis.UI.Modules.FollowUp
{

    public partial class Modules_FollowUp_BatchPrintContainer : FollowUpBasePage
    {
        /// <summary>
        /// value is "PrintForms.aspx"
        /// </summary>
        protected const string _printFormsPage = "PrintForms.aspx";

        /// <summary>
        /// value is "PrintLabels.aspx"
        /// </summary>
        protected const string _printLabelsPage = "PrintLabels.aspx";

        protected int maxFormsPerPrintJob = 30; // gets set in GetmaxFormsPerPrintJob (30 by default from config; if numPatients < 30, then set to numPatients)
        protected DataTable formBatchesTable;
        protected int currentBatch = 1;
        protected int currentForm; 
        protected int startSurveyNum;
        protected int endSurveyNum;
        private string _isSurvey = "";
        private string _processDate = "";
        int lengthQS;
        int totalNumberOfPatients;

        // comma separated list of patient Ids to pass in qs when printing labels
        protected string printLabelsPageUrlvVars = String.Empty;

        protected override void Page_Load(object sender, EventArgs e)
        {
            _isSurvey = Request.QueryString["isSurvey"];
            _processDate = Request.QueryString["processDate"];

            // caluclate the # of patients to print forms for
            lengthQS = Request.QueryString.Count;
            totalNumberOfPatients = lengthQS - 4; // minus the isSurvey=true/false, batchprint=true, proc=procName, processDate=date

            if (!Page.IsPostBack)
            {
                RbPrintTypeSurveys.Checked = true;
                RbPrintTypeLabels.Checked = false;

                LoadContentFrameWithSurveys();
               

                OnRbPrintTypeLabelsCheckChange(sender, e);
               
            }

            SetBatchLinks();           
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnRbPrintTypeLabelsCheckChange(object sender, EventArgs e)
        {
            // if 'Labels' selected, we have to load labels preview in the iform
            if (RbPrintTypeLabels.Checked)
            {
                LoadContentFrameWithLabels();
                BatchPrintLinks.Visible = false;
            }
            else // if 'Surveys selected' we load first page of surveys 
            {
                LoadContentFrameWithSurveys();
                BatchPrintLinks.Visible = true;
            }
        }

        /// <summary>
        /// Load the preview iframe with the Labels pages to print and hide the paging.
        /// Note that labels will print in one job.
        /// </summary>
        protected void LoadContentFrameWithLabels()
        {
            // if this is going to be a batch print
            if (Request.QueryString["batchPrint"] != null)
            {
                //this.batchMessage.Visible = false; //hide batch links (used for surveys)

                string PrintLabelsBaseUrl = _printLabelsPage + printLabelsPageUrlvVars;
                FormsContent.Attributes["src"] = PrintLabelsBaseUrl;

            }
        }


        /// <summary>
        /// Load the preview iframe with the first group of Survey pages to print.
        /// </summary>
        protected void LoadContentFrameWithSurveys()
        {
            // if this is going to be a batch print
            if (Request.QueryString["batchPrint"] != null)
            {

                string urlVars = "?batchPrint=true&proc=" + Request.QueryString["proc"];
                string urlVarWithMonth = "";

                // handle paging
                maxFormsPerPrintJob = GetmaxFormsPerPrintJob();

                int numSurveysToPrint = 0;

                // patient id and survey pairs start at index 2
                for (int i = 0; i < maxFormsPerPrintJob; i++)
                {
                    int j = i + 4; //index in QS
                    string patientId = Request.QueryString.GetKey(j);
                    urlVars += "&" + patientId + "=" + surveyURLUtil(Request[patientId]);
                    urlVarWithMonth += "&" + patientId + "=" + Request[patientId];
                    numSurveysToPrint++;
                }

                string BatchPrintBaseUrl = _printFormsPage + urlVars;
                URLHolder.Value = urlVarWithMonth;

                if (!bool.Parse(_isSurvey))
                    URLHolder.Value += "&isSurvey=false";
                else
                    URLHolder.Value += "&isSurvey=true";

                if(!String.IsNullOrEmpty(_processDate))
                    URLHolder.Value += "&processDate=" + _processDate;

                FormsContent.Attributes["src"] = BatchPrintBaseUrl;

            }
        }

        /// <summary>
        /// Set url for each batch print link page
        /// </summary>
        protected void SetBatchLinks()
        {
            if (Request.QueryString["batchPrint"] != null)
            {
                // initialize batchLink, urlVarWithMonth, & patientIds for constucting links to seperate the batches
                string batchLink = "?batchPrint=true&proc=" + Request.QueryString["proc"].ToString();
                string urlVarWithMonth = "";
                string patientId, patientIds = "", patientIdsLBL = ""; 
                string link = "";
                int currentPatientNumber;

                // tracks the # of forms that are currently being processed for current batch
                double formsThisBatch = 0;

                // get the max forms allowed per batch
                maxFormsPerPrintJob = GetmaxFormsPerPrintJob();
                               
                // calculate total # of batches that need to print 
                double totalBatches = Math.Ceiling((totalNumberOfPatients / (double)maxFormsPerPrintJob));
               
                // initialize the  frist and last form numbers for first batch
                startSurveyNum = 1;
                endSurveyNum = maxFormsPerPrintJob;

                for (int i = 4; i < lengthQS; i++) // patients start at index 3 in QS
                {
                    // track the current patient
                    currentPatientNumber = i - 3;
                    currentForm = currentPatientNumber;
   
                    // increment the # of forms that are being processed for current batch               
                    formsThisBatch++;

                    // if the limit for the # of forms per batch has been reached
                    if ((formsThisBatch > maxFormsPerPrintJob)  )
                    { 
                        // initialize a new batch link for the next batch of forms
                        patientIds = "";
                        batchLink = "?batchPrint=true&proc=" + Request.QueryString["proc"].ToString();
                        urlVarWithMonth = "";
                        formsThisBatch = 1;
                    }
                    
                    // add to comma separated list of patient ids to print labels
                    patientId = Request.QueryString.GetKey(i);                        
                    patientIds += patientId + ",";

                    // Construct seperate querystring for the Labels (eg. BatchPrintLabelContainer.aspx?pIds=1,2,3")
                    patientIdsLBL += patientId + ",";

                    // add curent patient to current batch link parameters
                    batchLink += "&" + patientId + "=" + Request[patientId];
                    urlVarWithMonth += "&" + patientId + "=" + Request[patientId];

                    // startSurveyNum signifies first form in current batch.  
                    // if '(currentForm MODULUS maxFormsPerPrintJob) == 1', currentForm is the first form in current batch
                    // OR, if maxFormsPerPrintJob == 1, currentForm is the first (and last) form in current batch
                    if ((currentForm % maxFormsPerPrintJob) == 1 || (maxFormsPerPrintJob == 1))
                    {
                        startSurveyNum = currentForm;
                    }

                    // endSurveyNum signifies last form in current batch.  
                    // if '(currentForm MODULUS maxFormsPerPrintJob) == 0', currentForm is the last form in current batch
                    if ((currentForm % maxFormsPerPrintJob) == 0)
                    {
                        endSurveyNum = currentBatch * maxFormsPerPrintJob; 
                        
                        // add parameters for all forms in current batch for the batch link
                        link += "<a target=\"FormsContent\" onclick=\"setURLHolder('" + urlVarWithMonth + "', '" + startSurveyNum + "', '" + endSurveyNum + "')\" href=\"" + _printFormsPage + batchLink + "\">[" + currentBatch + "]</a>&nbsp;&nbsp;";
                        
                        // increment to next batch
                        currentBatch++; 
                    }

                    // if last patient has been reached, but current batch is not full
                    else if (currentPatientNumber == totalNumberOfPatients)
                    {
                        endSurveyNum = totalNumberOfPatients;

                        // add parameters for all forms in current batch for the batch link
                        link += "<a target=\"FormsContent\" onclick=\"setURLHolder('" + urlVarWithMonth + "', '" + startSurveyNum + "', '" + endSurveyNum + "')\" href=\"" + _printFormsPage + batchLink + "\">[" + currentBatch + "]</a>&nbsp;&nbsp;";
                        
                        // increment to next batch
                        currentBatch++;
                    }                    
                }

                // show the link to print batches if there is more than one
                string updateScript;

                if (totalBatches > 1)
                {
                    updateScript = "ShowFormContent(" + bool.FalseString.ToLower() + ")";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowFormContent", updateScript, true);

                    BatchPrintLinks.Text = totalNumberOfPatients + " forms have been split into " + totalBatches + " batches of (at most) " + maxFormsPerPrintJob + " for printing.  Select batch to print:&nbsp;&nbsp;" + link;

                }
                else
                {
                    updateScript = "ShowFormContent(" + bool.TrueString.ToLower() + ")";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowFormContent", updateScript, true);

                    BatchPrintLinks.Text = "";
                }

                // For the LABELS; the string patientIds is a comma separated values of patient ids
                if (patientIdsLBL.EndsWith(","))
                {
                    patientIdsLBL = patientIdsLBL.Remove(patientIdsLBL.Length - 1); //remove last comma ","
                }

                // construct the querystring for labels (eg. BatchPrintLabelContainer.aspx?pIds=1,2,3";)
                printLabelsPageUrlvVars += "?pIds=" + CustomCryptoHelper.Encrypt(patientIdsLBL); //encrypt first
            }
        }

        protected void LogPrintJob(object sender, ImageClickEventArgs e)
        {
            if (!bool.Parse(_isSurvey))
                URLHolder.Value = URLHolder.Value + "&isSurvey=false";
            else
                URLHolder.Value = URLHolder.Value + "&isSurvey=true";

            DateTime processDate;
            if (!String.IsNullOrEmpty(_processDate))
                processDate = DateTime.Parse(_processDate);
            else
                processDate = DateTime.Now;

            // need to parse query string and log actions ("PrintForms.aspx?batchPrint=true&8113=EVUQOLPostEarlyTx&7523=EVUQOLPostEarlyTx")
            string printFrameUrl = URLHolder.Value;

            int index;
            if (printFrameUrl.Contains("&isSurvey=false"))
            {
                _isSurvey = "false";
                index = printFrameUrl.IndexOf("&isSurvey=false");
                printFrameUrl = printFrameUrl.Remove(index);
            }
            else if (printFrameUrl.Contains("&isSurvey=true"))
            {
                _isSurvey = "true";
                index = printFrameUrl.IndexOf("&isSurvey=true");
                printFrameUrl = printFrameUrl.Remove(index);
            }

            if (printFrameUrl.Contains("&processDate="))
            {
                index = printFrameUrl.IndexOf("&processDate=");
                printFrameUrl = printFrameUrl.Remove(index);
            }

            printFrameUrl = printFrameUrl.Remove(0, 1);//remove the first &
            string[] surveyArray = printFrameUrl.Split('&');

            foreach (string s in surveyArray)
            {
                // parse p to get patient id and survey name
                string[] patientArray = s.Split('=');
                string patientId = patientArray[0];
                string[] surveyNameAndMonth = patientArray[1].Split('_'); //split the month and survey name
                string surveyName = surveyNameAndMonth[1];
                string month = surveyNameAndMonth[0];

                //  Save Action Item
                Caisis.BOL.Action a = new Caisis.BOL.Action();
                a[Caisis.BOL.Action.ActionDate] = processDate;
                a[Caisis.BOL.Action.ActionDateText] = processDate.ToShortDateString();
                a[Caisis.BOL.Action.ActionItem] = FollowUpUtil.GetActionItemToLog(int.Parse(patientId), month, surveyName, bool.Parse(_isSurvey));
                a[Caisis.BOL.Action.PatientId] = patientId;

                if (!string.IsNullOrEmpty(a[Caisis.BOL.Action.ActionItem].ToString()))
                {
                    a.Save();
                }
            }
        }

        // parses month and underscore out of url variable leaving just the survey name
        private string surveyURLUtil(string surveyMonthAndName)
        {
            // no longer stripping out month number
            return surveyMonthAndName;
            //int splitIndex = surveyMonthAndName.IndexOf("_") + 1;
            //string surveyName = surveyMonthAndName.Substring(splitIndex, (surveyMonthAndName.Length - splitIndex));
            //return surveyName;
        }

        private int GetmaxFormsPerPrintJob()
        {
            if (ConfigurationSettings.AppSettings["maxFormsPerPrintJob"] != null && ConfigurationSettings.AppSettings["maxFormsPerPrintJob"].Length > 0)
            {
                maxFormsPerPrintJob = Convert.ToInt32(ConfigurationSettings.AppSettings["maxFormsPerPrintJob"]);
            }

            if (totalNumberOfPatients <= maxFormsPerPrintJob)
            {
                maxFormsPerPrintJob = totalNumberOfPatients;
            }
            return maxFormsPerPrintJob;
        }
    }
}
