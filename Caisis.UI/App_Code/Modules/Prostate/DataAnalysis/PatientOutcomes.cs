using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

using Caisis.DataAccess;

namespace Caisis.UI.Modules.Prostate.DataAnalysis
{
    // encapsulates patient model instance; returns results for particular patients
    public class PatientOutcomes
    {
        PatientModel _model;

        public PatientOutcomes(string modelFilename, string knotFilename, string imputationFilename)
        {
            _model = new PatientModel(modelFilename, knotFilename, imputationFilename);
        }

        // where do we get our sql?
        // how do we encapsulate a PatientModel instance

        public double? CalculateOutcome(int patientId, string modelId)
        {
            Dictionary<string, double?> outcomes = new Dictionary<string, double?>();

            PatientOutcomesDa db = new PatientOutcomesDa();
            DataTable dt = db.GetCombinedResults(patientId);

            if (dt.Rows.Count > 1)
                return null;

            return CalculateOutcome(dt.Rows[0], modelId);
        }

        public IDictionary<string, double?> CalculateOutcomes(int patientId)
        {
            Dictionary<string, double?> outcomes = new Dictionary<string, double?>();

            PatientOutcomesDa db = new PatientOutcomesDa();
            DataTable dt = db.GetCombinedResults(patientId);

            int rowCount = dt.Rows.Count;

            if (rowCount != 1)
                return outcomes; // imprecise data -> no results (don't we want stubs for all the models?)

            IEnumerable<string> modelids = _model.ModelIds;

            foreach (string id in modelids)
            {
                outcomes[id] = CalculateOutcome(dt.Rows[0], id);
            }

            return outcomes;
        }

        private double? CalculateOutcome(DataRow data, string modelId)
        {
            // get the inputs
            IEnumerable<string> inputNames = _model.GetInputs(modelId).Where(x => !x.StartsWith("sp"));

            // if the inputs are sufficient, run the model, else return null for the result
            // TODO: filter splines from input names (see below)
            if (inputNames.All(x => !data.IsNull(x)))
            {
                // create dictionary of inputs
                Dictionary<string, double> inputs = new Dictionary<string, double>();
                foreach (string inputName in inputNames)
                {
                    inputs[inputName] = double.Parse(data[inputName].ToString());
                }

                // hack for P.BCR.CGEN
                if (modelId.StartsWith("P.BCR.CGEN") && data.Table.Columns.Contains("ttbcr"))
                {
                    // patients with no (numeric) post-surgery PSA will have NULL ttbcr, so handle
                    double ttbcr;
                    if ((!data.IsNull("ttbcr")) && double.TryParse(data["ttbcr"].ToString(), out ttbcr))
                    {
                        inputs["ttbcr"] = ttbcr;
                    }
                    // inputs["ttbcr"] = double.Parse(data["ttbcr"].ToString());
                }

                double d = _model.Calculate(modelId, inputs);

                // limit results to [1, 99]
                //if (modelId == "P.BCR.CGEN" || modelId.Contains("P1Y"))
                // bas: support for 5/10 nomo
                if (modelId.StartsWith("P.BCR.CGEN") || modelId.Contains("P1Y"))
                {
                    return Math.Max(Math.Min(100 * d, 99), 1);
                }
                else
                {
                    return d;
                }
            }
            else
            {
                return null;
            }
        }
    }
}
