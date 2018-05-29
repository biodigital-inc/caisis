using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.All.Eforms
{
    /// <summary>
    /// For the specificed table and key POSTed to form, set stop date as Today for record.
    /// </summary>
    public partial class StopRecord : System.Web.UI.Page
    {
        /// <summary>
        /// A white list of tables and stop date fields
        /// </summary>
        private static readonly Dictionary<string, string> TABLE_MAPPINGS = new Dictionary<string, string>
        {
            { new BOL.Medication().TableName, BOL.Medication.MedStopDate },
            { new BOL.MedicalTherapy().TableName, BOL.MedicalTherapy.MedTxStopDate },
            { new BOL.RadiationTherapy().TableName,  BOL.RadiationTherapy.RadTxStopDate },
            { new BOL.BrachyTherapy().TableName, BOL.BrachyTherapy.BrachyDate }
        };

        /// <summary>
        /// Gets the posted table name
        /// </summary>
        private string Table
        {
            get
            {
                return Request.Form["table"];
            }
        }

        /// <summary>
        /// Gets the POSTed pri key
        /// </summary>
        private int? PriKey
        {
            get
            {
                int? key = null;
                string encKey = Request.Form["key"];
                if (!string.IsNullOrEmpty(encKey))
                {
                    key = int.Parse(Caisis.Security.CustomCryptoHelper.Decrypt(encKey));
                }
                return key;
            }
        }

        /// <summary>
        /// Gets the optional date passed in the query string
        /// </summary>
        private DateTime? QueryDate
        {
            get
            {

                string date = Request.Form["date"];
                if (!string.IsNullOrEmpty(date))
                {
                    DateTime parseDate;
                    if (DateTime.TryParse(date, out parseDate))
                    {
                        return parseDate;
                    }
                }
                return null;
            }
        }

        private bool Checked
        {
            get
            {
                string isCheckedQS = Request.Form["checked"];
                bool isChecked = !string.IsNullOrEmpty(isCheckedQS) && isCheckedQS.Equals(bool.TrueString, StringComparison.CurrentCultureIgnoreCase);
                return isChecked;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateStopDateAndReturn();
        }

        /// <summary>
        /// Writes the inserted date value to the client.
        /// </summary>
        private void UpdateStopDateAndReturn()
        {
            string newDate = string.Empty;
            // validate required mappings
            if (TABLE_MAPPINGS.ContainsKey(Table) && BusinessObjectFactory.CanBuildBusinessObject(Table) && PriKey.HasValue)
            {
                int patientId = int.Parse(Session[SessionKey.PatientId].ToString());

                // create instance
                IBusinessObject biz = BusinessObjectFactory.BuildBusinessObject(Table);
                // load record and validate
                biz.Get(PriKey.Value);
                if (!biz.IsEmpty)
                {
                    // turn on validation of patient
                    biz.EnableSaveValidation(patientId);

                    // the date field representing the stop date
                    string dateField = TABLE_MAPPINGS[Table];
                    // check for date text field
                    string dateTextField = dateField + "Text";
                    if (biz.HasField(dateField))
                    {
                        // determine if updating stop date of nullifying
                        bool doStop = Checked;
                        if (doStop)
                        {
                            // set date fields
                            DateTime date = QueryDate.HasValue ? QueryDate.Value : DateTime.Today; // ?? use DateTime.Today for normalization
                            biz[dateField] = date;
                            if (biz.HasField(dateTextField))
                            {
                                biz[dateTextField] = date.ToShortDateString();
                            }
                            // set short date
                            newDate = date.ToShortDateString();
                        }
                        // nullify stop date fields
                        else
                        {
                            biz[dateField] = null;
                            if (biz.HasField(dateTextField))
                            {
                                biz[dateTextField] = null;
                            }
                            newDate = string.Empty;
                        }
                    }
                    // update
                    biz.Save();
                }

            }
            else
            {
                newDate = string.Empty;
            }
            // write the new short stop date
            Response.Write(newDate);
        }
    }
}