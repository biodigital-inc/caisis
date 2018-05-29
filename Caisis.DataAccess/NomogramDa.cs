using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

using Caisis.Nomogram.Prostate;

namespace Caisis.DataAccess
{
    public class NomogramDataException : Exception
    {
        public NomogramDataException(string message) : base(message) { }
    }

    public class NomogramDa
    {
        private static readonly float DAYS_PER_MONTH = 30.43685f;

        int preTxPatientId = -1;
        int postTxPatientId = -1;
        bool preTxHasData;
        bool postTxHasData;

        float? preTxPSA;
        string preTxTStage92;
        string preTxTStage97;
        int? preTxPosCores;
        int? preTxNegCores;
        int? preTxGG1;
        int? preTxGG2;
        int? preTxGGS;
        float? preTxXRTDose;
        bool preTxNaHorm;
        bool preTxNaXRT;

        float? postTxPSA;
        DateTime? postTxRPDate;
        int? postTxGG1;
        int? postTxGG2;
        bool postTxMargin;
        bool postTxECE;
        bool postTxSVI;
        bool postTxLNI;
        bool postTxNaHorm;
        bool postTxNaXRT;
        
        // private DataRow preTxData;
        // private DataRow postTxData;

        private void ExtractPreTreatmentData(DataRow row)
        {
            float psa;
            string tstage;
            string system;
            int posCores;
            int totalCores;
            int gg1;
            int gg2;
            float xrtdose;
            DateTime rpdate;
            DateTime hormdate;
            DateTime xrtdate;

            if (Single.TryParse(row["PSA"].ToString(), out psa))
            {
                preTxPSA = psa;
            }

            system = row["ClinStageSystem"].ToString();

            if (system == "UICC_92" || system == "UICC_02")
            {
                preTxTStage92 = row["ClinStageT"].ToString();
                preTxTStage97 = Convert92To97TStage(preTxTStage92);
            }
            else if (system == "UICC_97")
            {
                preTxTStage97 = row["ClinStageT"].ToString();
                preTxTStage92 = Convert97To92TStage(preTxTStage97);
            }

            if (Int32.TryParse(row["BxPosCores"].ToString(), out posCores) && 
                Int32.TryParse(row["BxTotalCores"].ToString(), out totalCores))
            {
                preTxPosCores = posCores;
                preTxNegCores = totalCores - posCores;
            }

            if (Int32.TryParse(row["BxGG1"].ToString(), out gg1))
            {
                preTxGG1 = gg1;
            }

            if (Int32.TryParse(row["BxGG2"].ToString(), out gg2))
            {
                preTxGG2 = gg2;
            }

            if (preTxGG1.HasValue && preTxGG2.HasValue)
            {
                preTxGGS = preTxGG1 + preTxGG2;
            }

            if (Single.TryParse(row["RadTxTotalDose"].ToString(), out xrtdose))
            {
                preTxXRTDose = xrtdose;
            }

            // compare rp date to horm, xrt dates to determine nahorm, naxrt
            if (DateTime.TryParse(row["RPDate"].ToString(), out rpdate))
            {
                if (DateTime.TryParse(row["FirstHormDate"].ToString(), out hormdate))
                {
                    preTxNaHorm = hormdate < rpdate;
                }
                
                if (DateTime.TryParse(row["FirstXRTDate"].ToString(), out xrtdate))
                {
                    preTxNaXRT = xrtdate < rpdate;
                }
            }
            else
            {
                DateTime today = DateTime.Today;

                if (DateTime.TryParse(row["FirstHormDate"].ToString(), out hormdate))
                {
                    preTxNaHorm = hormdate < today;
                }

                if (DateTime.TryParse(row["FirstXRTDate"].ToString(), out xrtdate))
                {
                    preTxNaXRT = xrtdate < today;
                }
            }
        }

        private void ExtractPostTreatmentData(DataRow row)
        {
            float psa;
            DateTime rpdate;
            int gg1;
            int gg2;
            string ece;
            string lni;
            string margin;
            string svi;
            DateTime hormdate;
            DateTime xrtdate;

            if (Single.TryParse(row["PSA"].ToString(), out psa))
            {
                postTxPSA = psa;
            }

            if (Int32.TryParse(row["PathGG1"].ToString(), out gg1))
            {
                postTxGG1 = gg1;
            }

            if (Int32.TryParse(row["PathGG2"].ToString(), out gg2))
            {
                postTxGG2 = gg2;
            }

            // margin, svi, ece, lni (see mappings in excel exports) ...

            if (DateTime.TryParse(row["RPDate"].ToString(), out rpdate))
            {
                postTxRPDate = rpdate;

                if (DateTime.TryParse(row["FirstHormDate"].ToString(), out hormdate))
                {
                    postTxNaHorm = hormdate < postTxRPDate;
                }

                if (DateTime.TryParse(row["FirstXRTDate"].ToString(), out xrtdate))
                {
                    postTxNaXRT = xrtdate < postTxRPDate;
                }
            }
            
            ece = row["ECE"].ToString().ToUpper().TrimStart();
            lni = row["LNI"].ToString().ToUpper().TrimStart();
            margin = row["Margin"].ToString().ToUpper().TrimStart();
            svi = row["SVI"].ToString().ToUpper().TrimStart();

            //postTxECE = ece.StartsWith("POS") || ece.StartsWith("INV") || ece.StartsWith("EST") || ece.StartsWith("FOCAL");
			postTxECE = ece.StartsWith("POS") || ece.StartsWith("EST") || ece.StartsWith("FOCAL");
            postTxLNI = lni.StartsWith("MOD") || lni.StartsWith("POS");
            postTxMargin = margin.StartsWith("POS");
            postTxSVI = svi.StartsWith("POS");
        }

        public double GetPreRPResult(int patientId, int years)
        {
            PopulatePreTreatmentData(patientId);

            if (preTxHasData)
            {
                try
                {
                    ProstatePreRPNew rp = new ProstatePreRPNew();

                    rp.RequireBiopsyCores = false;

                    if (preTxPSA.HasValue)
                    {
                        rp.PSA = preTxPSA.Value;
                    }

                    if (preTxGG1.HasValue)
                    {
                        rp.PrimaryGleason = preTxGG1.Value;
                    }

                    if (preTxGG2.HasValue)
                    {
                        rp.SecondaryGleason = preTxGG2.Value;
                    }

                    if (preTxPosCores.HasValue)
                    {
                        rp.PositiveCores = preTxPosCores.Value;
                    }

                    if (preTxNegCores.HasValue)
                    {
                        rp.NegativeCores = preTxNegCores.Value;
                    }

                    rp.TStage = preTxTStage92;
                    rp.NAHormones = preTxNaHorm;
                    rp.NAXRT = preTxNaXRT;
                    rp.PredMonths = years * 12;

                    rp.RPYear = 2003;

                    return rp.Calculate();
                }
                catch (Caisis.Nomogram.NomogramDataValidationException e)
                {
                    throw new NomogramDataException(e.Message);
                }
            }
            else
            {
                throw new NomogramDataException("No biopsy noted.");
            }
        }

        public double GetPreBrachyResult(int patientId)
        {
            PopulatePreTreatmentData(patientId);

            if (preTxHasData)
            {
                try
                {
                    ProstatePreBrachy pb = new ProstatePreBrachy();

                    if (preTxPSA.HasValue)
                    {
                        pb.PSA = preTxPSA.Value;
                    }

                    pb.TStage = preTxTStage97;

                    if (preTxGGS.HasValue)
                    {
                        pb.GleasonSum = preTxGGS.Value;
                    }

                    pb.NAHormones = preTxNaHorm;
                    pb.NAXRT = preTxNaXRT;

                    return pb.Calculate();
                }
                catch (Caisis.Nomogram.NomogramDataValidationException e)
                {
                    throw new NomogramDataException(e.Message);
                }
            }
            else
            {
                throw new NomogramDataException("No biopsy noted.");
            }
        }

        public double GetPreXRTResult(int patientId)
        {
            PopulatePreTreatmentData(patientId);

            if (preTxHasData)
            {
                try
                {
                    ProstatePreXRT xrt = new ProstatePreXRT();

                    if (preTxPSA.HasValue)
                    {
                        xrt.PSA = preTxPSA.Value;
                    }

                    xrt.TStage = preTxTStage92;

                    if (preTxGGS.HasValue)
                    {
                        xrt.GleasonSum = preTxGGS.Value;
                    }

                    if (preTxXRTDose.HasValue)
                    {
                        xrt.XRTDose = preTxXRTDose.Value;
                    }
                    else
                    {
                        throw new NomogramDataException("No XRT noted.");
                    }

                    xrt.NAHormones = preTxNaHorm;

                    return xrt.Calculate();
                }
                catch (Caisis.Nomogram.NomogramDataValidationException e)
                {
                    throw new NomogramDataException(e.Message);
                }
            }
            else
            {
                throw new NomogramDataException("No biopsy noted.");
            }
        }

        public double GetPostRPResult(int patientId, int years)
        {
            PopulatePostTreatmentData(patientId);

            if (postTxHasData)
            {
                try
                {
                    ProstatePostRP prp = new ProstatePostRP();

                    if (postTxPSA.HasValue)
                    {
                        prp.PSA = postTxPSA.Value;
                    }

                    if (postTxGG1.HasValue)
                    {
                        prp.PrimaryGleason = postTxGG1.Value;
                    }

                    if (postTxGG2.HasValue)
                    {
                        prp.SecondaryGleason = postTxGG2.Value;
                    }

                    prp.ECE = postTxECE;
                    prp.LNI = postTxLNI;
                    prp.PositiveMargin = postTxMargin;
                    prp.SVI = postTxSVI;

                    if (postTxRPDate.HasValue)
                    {
                        prp.RPYear = postTxRPDate.Value.Year;
                        prp.MonthsAgoRP = DateTime.Today.Subtract(postTxRPDate.Value).Days / DAYS_PER_MONTH;
                    }

                    prp.PredMonths = 12 * years;

                    return prp.Calculate();
                }
                catch (Caisis.Nomogram.NomogramDataValidationException e)
                {
                    throw new NomogramDataException(e.Message);
                }
            }
            else
            {
                throw new NomogramDataException("No radical prostatectomy noted.");
            }
        }

		/// <summary>
		/// Get the PSA Doubling Time for a patient's last few (ideally 3) PSAs.
		/// </summary>
		/// <remarks>
		/// Internally, this method will fetch the n (ideally 3) most recent PSAs to compute doubling time, where n >= 2
		/// and at least 2 of the PSAs differ by date. If n > 3, then at least 2 of the PSAs used have
		/// the same date.
		/// </remarks>
		/// <param name="patientId">The PatientId</param>
		/// <returns>
		/// The PSA Doubling Time in months.
		/// <br/>
		/// If calculated using fewer than two positive (i.e. > 0) PSAs that differ by date, returns <bold>Single.PositiveInfinity</bold>.
		/// User interface developers may choose to display this as null or empty.
		/// </returns>
		public float GetPSADoublingTime(int patientId)
		{
			/***
			 * Return all a patient's PSAs, in reverse (i.e. descending) date order,
			 * and accumulate PSAs into a collection until 3 PSAs in the collection differ by date.
			 * This accounts for multiple PSAs on the same date (unlikely but possible).
			 ***/

			// NOTE: there are some bogons the LabResult field (e.g. ",0.1"). Database-side filtering
			// of commas would be unfriendly to cultures that use the comma as a decimal separator.

			string sql = @"
				SELECT LabDate, LabResult
				FROM LabTests
				WHERE PatientId = @PatientId
				And LabTest = 'PSA'
				And LabDate IS NOT NULL
				And ISNUMERIC(LabResult) = 1
				ORDER BY LabDate DESC";

			SqlCommand cmd = new SqlCommand(sql);
			cmd.Parameters.Add(new SqlParameter("@PatientId", patientId));

			PSADoublingTime dtCalculator = new PSADoublingTime();

			DateTime? previousDate = null;
			int labDateIndex = 0; // based the above query string
			int labResultIndex = 1; // ditto
			int dateDiffs = 0;
			int psaCount = 0;
			
			Connectivity.RecordConsumerDelegate consumerDelegate =
				delegate(IDataRecord record)
				{
					if (!previousDate.HasValue)
					{
						previousDate = record.GetDateTime(labDateIndex);
					}

					DateTime psaDate = record.GetDateTime(labDateIndex);
					float psaValue;

					if (!float.TryParse(record.GetString(labResultIndex), out psaValue) || psaValue <= 0)
					{
						// the PSA we read was invalid or non-positive, so ignore it and continue reading PSAs
						return true;
					}

					dtCalculator.AddPSA(psaValue, psaDate);

					// update our states
					if (psaDate != previousDate)
					{
						dateDiffs++;
					}

					psaCount++;
					previousDate = psaDate;

					if (psaCount >= 3 && dateDiffs >= 2)
					{
						// we've satisfied our conditions, so terminate reading
						return false;
					}
					else
					{
						// continue reading PSAs
						return true;
					}
				};

			Connectivity.ConsumeRecord(cmd, consumerDelegate);

			if (psaCount < 2 || dateDiffs < 1)
			{
				return float.PositiveInfinity;
			}

			try
			{
				PSADoublingTimeResults results = dtCalculator.CalculateVelocity();
				return results.doublingTimeMonth;
			}
			catch (NomogramDataException e)
			{
				return float.PositiveInfinity;
			}
		}

        private void PopulatePreTreatmentData(int patientId)
        {
            if (patientId != preTxPatientId)
            {
                DataRow row = GetTreatmentData("spNomogramPreTxData", patientId);

                if (row != null)
                {
                    ExtractPreTreatmentData(row);
                    preTxHasData = true;
                }
                else
                {
                    preTxHasData = false;
                }
                
                preTxPatientId = patientId;
            }
        }

        private void PopulatePostTreatmentData(int patientId)
        {
            if (patientId != postTxPatientId)
            {
                DataRow row = GetTreatmentData("spNomogramPostTxData", patientId);

                if (row != null)
                {
                    ExtractPostTreatmentData(row);
                    postTxHasData = true;
                }
                else
                {
                    postTxHasData = false;
                }

                postTxPatientId = patientId;
            }
        }

        private DataRow GetTreatmentData(string sql, int patientId)
        {
            DataTable table = new DataTable();
            SqlCommand cmd = DataAccessHelper.CreateCommand(sql);

            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            DataAccessHelper.GetRecord(cmd, table);

            if (table.Rows.Count > 0)
            {
                return table.Rows[0];
            }
            else
            {
                return null;
            }
        }

        public static string Convert92To97TStage(string tstage92)
        {
            switch (tstage92)
            {
                case "T2b":
                    return "T2a";
                case "T2c":
                    return "T2b";
                case "T3b":
                    return "T3a";
                case "T3c":
                    return "T3b";
                default:
                    return tstage92;
            }
        }

        public static string Convert97To92TStage(string tstage97)
        {
            switch (tstage97)
            {
                case "T2b":
                    return "T2c";
                case "T3b":
                    return "T3c";
                default:
                    return tstage97;
            }
        }
    }
}
