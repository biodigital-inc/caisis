using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Xml;
using System.Xml.Linq;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;

using System.Web.Services.Protocols;

using Caisis.DataAccess;
using Caisis.Security;
using Caisis.UI;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Plugins.PSAGraph
{
    /// <summary>
    /// Summary description for NomoSvc3.
    /// </summary>
    [WebService(Namespace = "http://www.caisis.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class BCMPSAGraph : System.Web.Services.WebService
    {
        public BCMPSAGraph()
        {
        }

        [DataContract]
        public class TimePoint
        {
            [DataMember]
            public String date;
            [DataMember]
            public String testType;
            [DataMember]
            public String psa;
        }

        [DataContract]
        public class PatStatObj
        {
            [DataMember]
            public TimePoint[] patTimePt;
            [DataMember]
            public Biopsies[] patBx;
            [DataMember]
            public String primaryTx;
            [DataMember]
            public String BCR;
            [DataMember]
            public String hormoneTx;
            [DataMember]
            public String XRT;
            [DataMember]
            public String mets;
            [DataMember]
            public String death;
            [DataMember]
            public int nTimePoints;
            [DataMember]
            public int nBx;
            [DataMember]
            public int patientId;
            [DataMember]
            public String patientName;
            [DataMember]
            public String pathSummary;
        }

        [DataContract]
        public class DTVelocityObj
        {
            [DataMember]
            public String DT;
            [DataMember]
            public String PSAVelocity;
            //public String n;
        }

        [DataContract]
        public class Biopsies
        {
            [DataMember]
            public String date;
            [DataMember]
            public String bxResult;
            [DataMember]
            public String bxPositive;
        }


        [WebMethod]
        public PatStatObj PtGraph(int patientId)
        {
            // SqlCommand cmd;


            PatStatObj a = new PatStatObj();

            //conn.Open();

            try
            {
                /* Lab Tests */
                DataSet ds = BCMPSAGraphDA.GetAllPSAs(patientId);
                //SqlCommand cmd = new SqlCommand("select * from LabTests where patientID = " + patientId + " and (LabTest = 'PSA' or LabTest = 'uPSA') and LabDate is not null order by LabDate;",conn);
                //rdr = cmd.ExecuteReader();
                ArrayList aout = new ArrayList();
                TimePoint thisTimePoint;
                foreach (DataRow dr in ds.Tables[0].Rows) 
                {
                    thisTimePoint = new TimePoint();
                    thisTimePoint.date = dr["LabDate"].ToString();
                    thisTimePoint.testType = dr["LabTest"].ToString();
                    thisTimePoint.psa = dr["LabResult"].ToString();
                    aout.Add(thisTimePoint);
                }
                a.patTimePt = (TimePoint[]) aout.ToArray(typeof (TimePoint));
                a.nTimePoints = a.patTimePt.Length;

                /* Operation Date */

                Hashtable ht = BCMPSAGraphDA.GetProstSurgeryRecord(patientId);
                if (ht["RP_Date"] != null && ht["RP_Date"].ToString() != "")
                {
                    a.primaryTx = a.primaryTx = ht["RP_Date"].ToString();
                }
                else 
                {
                    a.primaryTx = "";
                }

                /* Biopsies */
                ds = BCMPSAGraphDA.GetAllBiopsiesFlash(patientId);
                aout = new ArrayList();
                Biopsies thisBx;
                foreach (DataRow dr in ds.Tables[0].Rows) 
                {
                    thisBx = new Biopsies();
                    thisBx.date = dr["BxDate"].ToString();
                    thisBx.bxResult = dr["BxResult"].ToString();
                    thisBx.bxPositive = dr["BxPositive"].ToString();
                    aout.Add(thisBx);
                }
                a.patBx = (Biopsies[]) aout.ToArray(typeof (Biopsies));
                a.nBx = a.patBx.Length;

               


                /* Get various status entries (METS, Death and Recurrence) */
                ds = BCMPSAGraphDA.GetChronoListStatusEntries(patientId);
                a.mets = "";
                a.death = "";
                if (ds.Tables[0].Rows.Count > 0) 
                {
                    foreach (DataRow dr in ds.Tables[0].Rows) 
                    {
                        if (dr["VarValue"].ToString() == "DOD") 
                        {
                            a.death = dr["VarDate"].ToString();
                        } 
                        else if (dr["VarValue"].ToString() == "METS") 
                        {
                            a.mets = dr["VarDate"].ToString();
                        }
                    }
                }

                ds = BCMPSAGraphDA.GetRecurredDate(patientId);
                if (ds.Tables[0].Rows.Count > 0) 
                {
                    a.BCR = ds.Tables[0].Rows[0]["RecurredDate"].ToString();
                } 
                else 
                { 
                    a.BCR = ""; 
                }

				/* Patient Name */
				string ptName = BCMPSAGraphDA.GetPtFullName(patientId);
				if (ptName.Length > 0) 
				{
					a.patientName = ptName;
				} 
				else 
				{
					a.patientName = "";
				}

                /* Path Summary */
                ds = BCMPSAGraphDA.GetPathSummaryFlash(patientId);
                if (ds.Tables[0].Rows.Count > 0) 
                {
					// use calculated column instead to match value in chron list, updated fs 7/7/05
                   // a.pathSummary = ds.Tables[0].Rows[0]["PathSummary"].ToString();
				    a.pathSummary = ds.Tables[0].Rows[0]["CalcPathSummary"].ToString();
                } 
                else 
                {
                    a.pathSummary = "";
                }

             

				/* Hormone Therapy (only returns the first date.  Can expand later if needed) */
				// DEPENDENCY: sp looks on for MedTxType IN ('AA','AA/LHRH','HORM','LHRH','ADT', '5_ALPHA')
				ds = BCMPSAGraphDA.GetFirstHormoneTherapy(patientId);
				if (ds.Tables[0].Rows.Count > 0) 
				{
					a.hormoneTx = ds.Tables[0].Rows[0]["MedTxDate"].ToString();
				} 
				else 
				{
					a.hormoneTx = "";
				}


				/* Radiation Therapy (only returns the first date.  Can expand later if needed) */
				// DEPENDENCY: sp looks only for type IN ('Rad Tx','Conventional', 'Conformal','XRT')
				ds = BCMPSAGraphDA.GetFirstRadiationTherapy(patientId);
				if (ds.Tables[0].Rows.Count > 0) 
				{
					a.XRT = ds.Tables[0].Rows[0]["RadTxDate"].ToString();
				} 
				else 
				{
					a.XRT = "";
				}
            }
            catch (Exception ex)
            {
                // updated 7/7/05 fs
				ExceptionHandler.Publish(ex);
				//System.Diagnostics.EventLog.WriteEntry("PSAGraph",ex.Message,EventLogEntryType.Error);
            }
            return a;

        }


        [WebMethod]
        public DTVelocityObj PtDTVelocity(int patientId, DateTime startDate, DateTime endDate, string threshold)
        {
            DTVelocityObj dtv = new DTVelocityObj();

            DataSet ds = BCMPSAGraphDA.GetPSADTVelocity(patientId, startDate, endDate, threshold);
            if (ds.Tables[0].Rows.Count > 0) 
            {
                DataRow dr = ds.Tables[0].Rows[0];
                dtv.PSAVelocity = dr["Velocity"].ToString();
                dtv.DT = dr["DoubleTime"].ToString();
            } 
            else 
            {
                dtv = null;
            }

            return dtv;

        }

    }
}