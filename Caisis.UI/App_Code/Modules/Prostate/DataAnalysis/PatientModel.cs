using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

using Caisis.DataAnalysis;

namespace Caisis.UI.Modules.Prostate.DataAnalysis
{
    // missing var -> { { set of avail. inputs } -> imputation function }
    using ImputedMap = Dictionary<string, Dictionary<HashSet<string>, Func<IDictionary<string, double>, double>>>;

    public class PatientModel
    {
        private ImputedMap _imputedMap;
        private Dictionary<string, Dictionary<string, double>> _knotMap;
        private Dictionary<string, Func<IDictionary<string, double>, double>> _modelMap;
        private Dictionary<string, List<string>> _inputMap;

        public PatientModel(string patientModelFilename,
                            string knotFilename,
                            string imputationFilename)
        {
            // TODO: improve
            _inputMap = new Dictionary<string, List<string>>();
            _modelMap = ParseModelResults(patientModelFilename, _inputMap);

            _knotMap = ParseSplines(knotFilename);
            _imputedMap = ParseImputedValues(imputationFilename);
        }

        public IEnumerable<string> ModelIds
        {
            get { return _modelMap.Keys.AsQueryable(); }
        }

        public IEnumerable<string> GetInputs(string modelId)
        {
            return _inputMap[modelId].AsQueryable();
        }

        // TODO: use me
        public bool InputsAreSufficient(string modelId, IEnumerable<string> nonEmptyInputs)
        {
            // do we find a match in the imputed map?
            return _imputedMap[modelId].ContainsKey(new HashSet<string>(nonEmptyInputs));
        }

        #region math
        private static double Linear(IDictionary<string, double> coefficients, 
                                     IDictionary<string, double> values)
        {
            var q =
                from kvp in coefficients
                let name = kvp.Key.Substring("covariate.".Length)
                where 
                    kvp.Key.StartsWith("covariate.") &&
                    values.ContainsKey(name)
                select new
                {
                    Name = name,
                    Coefficient = kvp.Value
                };

            double intercept = coefficients["(Intercept)"];
            return intercept + q.Select(x => x.Coefficient * values[x.Name]).Sum();
        }

        private static double Logistic(IDictionary<string, double> coefficients, 
                                       IDictionary<string, double> values)
        {
            double exbeta = Linear(coefficients, values);
            return 1 / (1 + Math.Exp(-exbeta));
        }

        private static double Survival(IDictionary<string, double> coefficients, 
                                       IDictionary<string, double> values, 
                                       double yearsFree, double predictionYears)
        {
            double exp = Math.Exp(0 - Linear(coefficients, values));
            double gamma = coefficients["parameter.gamma"];
            double invgamma = 1 / gamma;
            return
                (1 + Math.Pow(exp * yearsFree, invgamma)) /
                (1 + Math.Pow(exp * predictionYears, invgamma));
        }

        // sp1var = Spline(x, knot1, knot3, knot4);
        // sp2var = Spline(x, knot2, knot3, knot4);
        private static double Spline(double val, double k, double knot3, double knot4)
        {
            double k43 = knot4 - knot3;

            return
                pm3(val, k) -
                pm3(val, knot3) * ((knot4 - k) / k43) +
                pm3(val, knot4) * ((knot3 - k) / k43);
        }

        private static Func<double, double, double> pm3 = (v, k) => Math.Pow(Math.Max(v - k, 0), 3);
        #endregion

        #region calculation

        // f(modelid, inputs) -> double
        // e.g. what is a patient's chance of recurrence, given this data (inputs)?

        // we will abstract this later; here to demonstrate the algorithm...
        public double Calculate(string modelId, IDictionary<string, double> inputs)
        {
            double prediction = _modelMap[modelId](inputs);
            return prediction;
        }

        private Dictionary<string, Func<IDictionary<string, double>, double>> 
            ParseModelResults(string filename, Dictionary<string, List<string>> inputMap)
        {
            DataTable dt = CSV.Read(filename);

            var query =
                from row in dt.AsEnumerable()
                let modelId = row["model.id"].ToString()
                let modelType = row["model.type"].ToString()
                group row by new { ModelId = modelId, ModelType = modelType } into coefficients
                select new
                {
                    ModelId = coefficients.Key.ModelId,
                    ModelType = coefficients.Key.ModelType,
                    Variables =
                        from c in coefficients
                        let varname = c["coefficient.varname"].ToString()
                        let coefficient = double.Parse(c["value"].ToString())
                        where 
                            varname == "(Intercept)" ||
                            varname.StartsWith("covariate.") ||
                            varname.StartsWith("parameter.")
                        select new
                        {
                            Name = varname,
                            Coefficient = coefficient
                        }
                };

            // so now we have coefficients categorized by modelid (type is 1-1 to modelid)
            // build functions!

            // modelid -> Func<IDictionary<string, double>, double>
            Dictionary<string, Func<IDictionary<string, double>, double>> modelMap =
                new Dictionary<string, Func<IDictionary<string, double>, double>>();

            foreach (var model in query)
            {
                string modelId = model.ModelId;
                string modelType = model.ModelType;

                // ? what variables are missing? we need to impute each one with
                // the (originally) available variables

                ImputedMap imputedMap = null; // TODO: fixme
                //Dictionary<string, Dictionary<string, double>> knotMap = null;

                var requiredInputQuery =
                    from c in model.Variables
                    where c.Name.StartsWith("covariate.")
                    select c.Name.Substring("covariate.".Length);

                HashSet<string> requiredInputs = new HashSet<string>(requiredInputQuery);

                if (modelId.StartsWith("P.BCR.CGEN"))
                {
                    inputMap[modelId + ".0"] = new List<string>(requiredInputs);
                    inputMap[modelId + ".2"] = new List<string>(requiredInputs);
                    inputMap[modelId + ".5"] = new List<string>(requiredInputs);
                    inputMap[modelId + ".7"] = new List<string>(requiredInputs);
                    inputMap[modelId + ".10"] = new List<string>(requiredInputs);
                }
                else
                {
                    inputMap[modelId] = new List<string>(requiredInputs);
                }

                Func<IDictionary<string, double>, IDictionary<string, double>> frontend =
                    originalInputs => ProcessInputs(requiredInputs, originalInputs, imputedMap, _knotMap);

                // TODO: cleanup, coiterate with requiredInputQuery...
                Dictionary<string, double> coeffs = new Dictionary<string, double>();
                foreach (var v in model.Variables)
                {
                    coeffs[v.Name] = v.Coefficient;
                }

                // -> model type routing
                if (modelType == "LINEAR")
                {
                    modelMap[modelId] = inputs => Linear(coeffs, frontend(inputs));
                }
                else if (modelType == "LOGISTIC")
                {
                    modelMap[modelId] = inputs => Logistic(coeffs, frontend(inputs));
                }
                else if (modelType == "SURVIVAL")
                {
                    // 0 = defaulting to baseline (0 months free)
                    if (modelId.StartsWith("P.BCR.CGEN"))
                    {
                        Func<IDictionary<string, double>, double> getYearsFree =
                            m =>
                            {
                                if (m.ContainsKey("ttbcr"))
                                {
                                    // ttbcr is in years
                                    // return m["ttbcr"] * 365.25 / 30.44;
                                    return m["ttbcr"];
                                }
                                else
                                {
                                    return 0;
                                }
                            };

                        modelMap[modelId + ".0"] = inputs => Survival(coeffs, frontend(inputs), 0, 5);
                        modelMap[modelId + ".2"] = inputs => Survival(coeffs, frontend(inputs), getYearsFree(inputs), 2);
                        modelMap[modelId + ".5"] = inputs => Survival(coeffs, frontend(inputs), getYearsFree(inputs), 5);
                        modelMap[modelId + ".7"] = inputs => Survival(coeffs, frontend(inputs), getYearsFree(inputs), 7);
                        modelMap[modelId + ".10"] = inputs => Survival(coeffs, frontend(inputs), getYearsFree(inputs), 10);
                    }
                    else
                    {
                        modelMap[modelId] = inputs => Survival(coeffs, frontend(inputs), 0, 5);
                    }
                }
            }

            // TODO: do something with model map in the future
            return modelMap;
        }

        // strip "covariate." before calling
        // impute, spline, or pass through
        private static IDictionary<string, double> 
            ProcessInputs(HashSet<string> requiredInputs,
                          IDictionary<string, double> availableInputs,
                          ImputedMap imputedMap,
                          Dictionary<string, Dictionary<string, double>> knotMap)
        {
            Dictionary<string, double> enhancedInputs = new Dictionary<string, double>();

            foreach (string s in requiredInputs)
            {
                if (s.StartsWith("sp1") || s.StartsWith("sp2"))
                {
                    // spline. find x in availableInputs given sp1x, and calc sp1x, sp2x
                    // add sp1x, sp2x to enhanced
                    string basename = s.Substring(3);

                    // TODO: clean me up!
                    if (s.StartsWith("sp1"))
                        enhancedInputs[s] = Spline1(basename, availableInputs[basename], knotMap);
                    else
                        enhancedInputs[s] = Spline2(basename, availableInputs[basename], knotMap);
                }
                else if (!availableInputs.ContainsKey(s))
                {
                    // impute
                    enhancedInputs[s] = Impute(s, availableInputs, imputedMap);
                }
                else
                {
                    // pass through
                    enhancedInputs[s] = availableInputs[s];
                }
            }

            return enhancedInputs;
        }

        private static double Spline1(string varname, double value, 
                                      Dictionary<string, Dictionary<string, double>> knotmap)
        {
            return S(varname, "knot1", value, knotmap);
        }

        private static double Spline2(string varname, double value,
                                      Dictionary<string, Dictionary<string, double>> knotmap)
        {
            return S(varname, "knot2", value, knotmap);
        }

        private static double S(string varname,
                                string k,
                                double value,
                                Dictionary<string, Dictionary<string, double>> knotmap)
        {
            Dictionary<string, double> map = knotmap[varname];
            double kv = map[k];
            double knot3 = map["knot3"];
            double knot4 = map["knot4"];

            return Spline(value, kv, knot3, knot4);
        }

        private static Dictionary<string, Dictionary<string, double>> ParseSplines(string filename)
        {
            DataTable dt = CSV.Read(filename);

            var query =
                from row in dt.AsEnumerable()
                let covariate = row["covariate"].ToString()
                group row by covariate into covariates
                select new
                {
                    Covariate = covariates.Key,
                    Knots =
                        from r in covariates
                        select new
                        {
                            KnotName = r["knot"].ToString(),
                            KnotValue = double.Parse(r["knot.value"].ToString())
                        }   
                };

            Dictionary<string, Dictionary<string, double>> knotmap =
                new Dictionary<string,Dictionary<string,double>>();

            foreach (var c in query)
            {
                Dictionary<string, double> knots = new Dictionary<string, double>();

                foreach (var k in c.Knots)
                    knots[k.KnotName] = k.KnotValue;

                knotmap[c.Covariate] = knots;
            }

            // TODO: do something with the knotmap
            return knotmap;
        }

        #endregion

        #region imputation
        // TODO: test! does the equality comparer work in .Net!
        private static double Impute(string missingVariableName, 
                                     IDictionary<string, double> inputs,
                                     ImputedMap map)
        {
            return map[missingVariableName][new HashSet<string>(inputs.Keys)](inputs);
        }

        // public for testing
        public static ImputedMap ParseImputedValues(string filename)
        {
            DataTable dt = CSV.Read(filename);

            // todo: what about model type (function needs this)
            var query =
                from row in dt.AsEnumerable()
                let modelName = GetModelName(row["model.id"].ToString())
                let modelType = row["model.type"].ToString()
                group row by new { ModelName = modelName, ModelType = modelType } into imputedvars
                select new
                {
                    ModelName = imputedvars.Key.ModelName,
                    ModelType = imputedvars.Key.ModelType,
                    ImputedFunctions =
                        from r in imputedvars
                        let id = r["model.id"].ToString()
                        group r by id into g
                        select new
                        {
                            ModelId = g.Key,
                            Coefficients =
                                from c in g
                                let varname = c["coefficient.varname"].ToString()
                                let val = double.Parse(c["value"].ToString())
                                select new
                                {
                                    VarName = varname,
                                    Value = val
                                }
                        }
                };

            // modelName -> { varnames } -> { varname: coefficient }
            // print things out

            #region debugging
            //foreach (var missingVariable in query)
            //{
            //    string varname = missingVariable.ModelName;
            //    string modeltype = missingVariable.ModelType;
            //    Console.Out.WriteLine("New Missing Variable: {0} ({1})", varname, modeltype);

            //    foreach (var imputedFunction in missingVariable.ImputedFunctions)
            //    {
            //        string modelid = imputedFunction.ModelId;
            //        Console.Out.WriteLine("New Model Id for {0}: {1}", varname, modelid);

            //        foreach (var coeff in imputedFunction.Coefficients)
            //        {
            //            Console.Out.WriteLine("{0}: {1} = {2}", modelid, coeff.VarName, coeff.Value);
            //        }

            //        Console.Out.WriteLine();
            //    }

            //    Console.Out.WriteLine();
            //}
            #endregion

            // build our map
            // missing var -> { { set of avail. inputs } -> imputation function }
            ImputedMap i = new ImputedMap();

            foreach (var missingVariable in query)
            {
                string varname = missingVariable.ModelName;
                string modeltype = missingVariable.ModelType;

                // YOU MUST OVERRIDE THE DEFAULT COMPARATOR
                Dictionary<HashSet<string>, Func<IDictionary<string, double>, double>> models =
                    new Dictionary<HashSet<string>, Func<IDictionary<string, double>, double>>(HashSet<string>.CreateSetComparer());

                i[varname] = models;

                foreach (var imputedFunction in missingVariable.ImputedFunctions)
                {
                    HashSet<string> varset = new HashSet<string>();
                    Dictionary<string, double> coefficients = new Dictionary<string, double>();

                    foreach (var c in imputedFunction.Coefficients)
                    {
                        string name = c.VarName;
                        coefficients[name] = c.Value;
                        if (name.StartsWith("covariate."))
                            varset.Add(name.Substring("covariate.".Length));
                    }

                    // models[{set of non-empty varnames}] = f(x)
                    if (modeltype == "LINEAR")
                    {
                        models[varset] = x => Linear(coefficients, x);
                    }
                    else if (modeltype == "LOGISTIC")
                    {
                        models[varset] = x => Logistic(coefficients, x);
                    }
                }
            }

            return i;
        }

        private static string GetModelName(string id)
        {
            if (id.Contains("PSA"))
                return "psa";
            else if (id.Contains("ECE"))
                return "ece";
            else if (id.Contains("SVI"))
                return "svi";
            else
                throw new ArgumentException(string.Format("model.id {0} not currently supported", id));
        }

        #endregion
    }
}
