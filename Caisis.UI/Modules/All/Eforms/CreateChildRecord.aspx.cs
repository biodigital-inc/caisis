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
    public partial class CreateChildRecord : System.Web.UI.Page
    {
        private static readonly IDictionary<string, string> TABLE_MAPPINGS = new Dictionary<string, string>
            {
                { new BOL.MedicalTherapy().TableName, new BOL.MedTxAdministration().TableName },
                { new BOL.RadiationTherapy().TableName, new BOL.RadTxAdministration().TableName }
            };

        private static readonly IEnumerable<string> COPY_FIELDS =
            new string[] 
            {
                "Agent",
                "Type",
                "Dose",
                "TotalDose",
                "Units",
                "Route",
                "Schedule"
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

        protected void Page_Load(object sender, EventArgs e)
        {
            WriteChildRecordResponse();
        }

        private void WriteChildRecordResponse()
        {
            string response = "";
            if (TABLE_MAPPINGS.ContainsKey(Table) && BusinessObjectFactory.CanBuildBusinessObject(Table) && PriKey.HasValue)
            {
                string childTable = TABLE_MAPPINGS[Table];
                if (BusinessObjectFactory.CanBuildBusinessObject(childTable))
                {
                    int patientId = int.Parse(Session[SessionKey.PatientId].ToString());

                    // load parent
                    BusinessObject parent = BusinessObjectFactory.BuildBusinessObject(Table);
                    parent.Get(PriKey.Value);
                    if (!parent.IsEmpty)
                    {
                        // get prefix (i.e. "MedTx", "RadTx")
                        string prefix = childTable.Substring(0, childTable.IndexOf("Tx") + 2);
                        // turn on validation of patient
                        parent.EnableSaveValidation(patientId);

                        // create child instance
                        BusinessObject child = BusinessObjectFactory.BuildBusinessObject(childTable);
                        child.EnableSaveValidation(patientId);

                        // set foreign key
                        child[child.ParentKeyName] = parent[parent.PrimaryKeyName];

                        // set fields
                        foreach (string field in COPY_FIELDS )
                        {
                            string parentField = prefix + field;
                            string childField = prefix + "Admin" + field;
                            if (parent.FieldNames.Contains(parentField) && child.FieldNames.Contains(childField))
                            {
                                child[childField] = parent[parentField];
                            }
                        }
                        // sepcial date fields
                        DateTime date = QueryDate.HasValue ? QueryDate.Value : DateTime.Today;
                        child[prefix + "AdminStartDateText"] = date.ToShortDateString();
                        child[prefix + "AdminStartDate"] = date;

                        // insert
                        child.Save();

                        response = "- Administered " +  (DateTime.Today.Date==date.Date ? "Today" : date.ToShortDateString()) + " -";
                    }
                }
            }
            Response.Write(response);
        }
    }
}