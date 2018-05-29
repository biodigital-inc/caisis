using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.Prostate
{

    /// <summary>
    /// Class containing various utility functions and Prostate constants
    /// </summary>
    public class ProstateUtil
    {
        #region CONSTANTS

        #endregion



        public static string ActiveSurveillanceDate(int patientID)
        {
            string ASDateStr = "";

            if (patientID != 0)
            {




                DateTime ASStatusDate = new DateTime();
                string ASStatusDateText = "";
                bool PatientHasASStatusRecord = false;

                // check for Previous AS Status----------------------------------
                StatusDa sDa = new StatusDa();
                DataSet sDs = sDa.GetStatus(patientID, "Prostate%");

                if (sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
                {
                    DataView sDv = new DataView(sDs.Tables[0]);
                    sDv.RowFilter = BOL.Status.Status_Field + " IN ('Active Surveillance', 'Watchful Waiting') and " + BOL.Status.StatusDate + " IS NOT NULL";
                    sDv.Sort = "StatusDate ASC";

                    if (sDv.Count > 0)
                    {
                        ASStatusDate = (DateTime)sDv[0][BOL.Status.StatusDate];
                        ASStatusDateText = sDv[0][BOL.Status.StatusDateText].ToString();
                        PatientHasASStatusRecord = true;
                    }
                }
                //-------------------------------------------------------------------

                if (PatientHasASStatusRecord)
                {
                    DateTime ASDate = new DateTime();
                    string ASDateText = "";

                    DataTable ProstateBiopsies;
                    BiopsyDa bDa = new BiopsyDa();
                    ProstateBiopsies = bDa.GetProstateBiopsies(patientID);

                    // make sure patient has biopsies
                    if (ProstateBiopsies.Rows.Count > 0)
                    {
                        // check for GGS > 0
                        DataView PVView = new DataView(ProstateBiopsies);
                        PVView.RowFilter = BOL.Procedure.ProcDate + " IS NOT NULL and (" + BOL.BiopsyProstatePathology.PathGG1 + " > 0 or " + BOL.BiopsyProstatePathology.PathGG2 + " > 0 or " + BOL.BiopsyProstatePathology.PathGGS + " > 0)";
                        if (PVView.Count > 0)
                        {
                            PVView.Sort = BOL.Procedure.ProcDate + " ASC";


                            // info on first positive biopsy--------------
                            DateTime FirstPosBiopsyDate = ((DateTime)PVView[0][BOL.Procedure.ProcDate]);
                            string FirstPosBiopsyDateText = PVView[0][BOL.Procedure.ProcDateText].ToString();
                            bool FirstPosBiopsyIsSTD = PVView[0][BOL.Procedure.ProcQuality].ToString().Equals("STD");



                            // info on first positive MSK biopsy (might be the same as above)--------------
                            DateTime FirstMSKPosBiopsyDate = new DateTime();
                            string FirstMSKPosBiopsyDateText = "";

                            DataView MSKPosBiopies = new DataView(PVView.ToTable());
                            MSKPosBiopies.RowFilter = BOL.Procedure.ProcQuality + " = 'STD'";







                            if (FirstPosBiopsyIsSTD)
                            {
                                FirstMSKPosBiopsyDate = FirstPosBiopsyDate;
                                FirstMSKPosBiopsyDateText = FirstPosBiopsyDateText;
                            }
                            else
                            {
                                if (MSKPosBiopies.Count > 0)
                                {
                                    FirstMSKPosBiopsyDate = ((DateTime)MSKPosBiopies[0][BOL.Procedure.ProcDate]);
                                    FirstMSKPosBiopsyDateText = MSKPosBiopies[0][BOL.Procedure.ProcDateText].ToString();
                                }
                            }




                            //all MSK Biopsies
                            DataView MSKAllBiopsies = new DataView(ProstateBiopsies);
                            MSKAllBiopsies.RowFilter = BOL.Procedure.ProcQuality + " = 'STD'";
                            DateTime FirstMSKBiopsyDate = new DateTime();
                            string FirstMSKBiopsyDateText = "";
                            DateTime LastMSKBiopsyDate = new DateTime();
                            string LastMSKBiopsyDateText = "";
                            if (MSKAllBiopsies.Count > 0)
                            {
                                FirstMSKBiopsyDate = ((DateTime)MSKAllBiopsies[0][BOL.Procedure.ProcDate]);
                                FirstMSKBiopsyDateText = MSKAllBiopsies[0][BOL.Procedure.ProcDate].ToString();
                                LastMSKBiopsyDate = ((DateTime)MSKAllBiopsies[MSKAllBiopsies.Count - 1][BOL.Procedure.ProcDate]);
                                LastMSKBiopsyDateText = MSKAllBiopsies[MSKAllBiopsies.Count - 1][BOL.Procedure.ProcDate].ToString();
                            }









                            if (FirstMSKBiopsyDate > DateTime.MinValue && ASStatusDate < FirstMSKBiopsyDate)  // patient has an MSK Pos biopsy and AS Record is earlier
                            {

                                if (!FirstPosBiopsyIsSTD && (FirstMSKBiopsyDate - FirstPosBiopsyDate).TotalDays > 365)
                                {
                                    // AS Date is set
                                    ASDate = ASStatusDate;
                                    ASDateText = ASStatusDateText;

                                }
                                else
                                {
                                    // AS Date is set
                                    ASDate = FirstMSKBiopsyDate;
                                    ASDateText = FirstMSKBiopsyDateText;
                                }

                            }



                            if (ASDate.Equals(DateTime.MinValue)) // AS Date is not set yet
                            {
                                if (FirstPosBiopsyIsSTD)
                                {
                                    if (MSKPosBiopies.Count > 1 && ((DateTime)MSKPosBiopies[1][BOL.Procedure.ProcDate] - FirstMSKPosBiopsyDate).TotalDays <= 365)
                                    {
                                        ASDate = (DateTime)MSKPosBiopies[1][BOL.Procedure.ProcDate];
                                        ASDateText = MSKPosBiopies[1][BOL.Procedure.ProcDateText].ToString();
                                    }
                                    else
                                    {
                                        ASDate = FirstPosBiopsyDate; // same value as FirstMSKPosBiopsyDate;
                                        ASDateText = FirstPosBiopsyDateText; // same value as FirstMSKPosBiopsyDateText;
                                    }
                                }
                                else // first pos biopsy is outside
                                {

                                    int FirstBiopsyGG1 = 0;
                                    int FirstBiopsyGG2 = 0;
                                    int FirstBiopsyGGS = 0;

                                    if (PVView[0][BOL.BiopsyProstatePathology.PathGGS].ToString().Length > 0)
                                    {
                                        // if first biopsy has GGS = 6 AND has subsequent MSK biopsy         //not necessary anymore--> (msk biopsy is 1 yr or more later)
                                        // if the last MSK biopsy is after the first pos biopsy, there is a subsequent MSK biopsy
                                        if (MSKAllBiopsies.Count > 0 && (LastMSKBiopsyDate > FirstPosBiopsyDate)) //FirstBiopsyGGS == 6 && 
                                        {
                                            // get first MSK biopsy after first pos biopsy
                                            DataRowView ASMSKBiopsy = FirstBiopsyAfterDate(MSKAllBiopsies.ToTable(), FirstPosBiopsyDate);
                                            if (ASMSKBiopsy != null)
                                            {
                                                ASDate = (DateTime)ASMSKBiopsy[BOL.Procedure.ProcDate];
                                                ASDateText = ASMSKBiopsy[BOL.Procedure.ProcDateText].ToString();
                                            }
                                        }
                                        else
                                        {
                                            ASDate = ASStatusDate;
                                            ASDateText = ASStatusDateText;
                                        }
                                    }
                                    else if (int.TryParse(PVView[0][BOL.BiopsyProstatePathology.PathGG1].ToString(), out FirstBiopsyGG1) && int.TryParse(PVView[0][BOL.BiopsyProstatePathology.PathGG2].ToString(), out FirstBiopsyGG2))
                                    {
                                        //                                    FirstBiopsyGGS = FirstBiopsyGG1 + FirstBiopsyGG2;
                                        // if first biopsy has GGS = 6 AND has subsequent MSK biopsy         //not necessary anymore--> (msk biopsy is 1 yr or more later)
                                        // if the last MSK biopsy is after the first pos biopsy, there is a subsequent MSK biopsy
                                        if (MSKAllBiopsies.Count > 0 && (LastMSKBiopsyDate > FirstPosBiopsyDate)) //FirstBiopsyGGS == 6 && 
                                        {
                                            // get first MSK biopsy after first pos biopsy
                                            DataRowView ASMSKBiopsy = FirstBiopsyAfterDate(MSKAllBiopsies.ToTable(), FirstPosBiopsyDate);
                                            if (ASMSKBiopsy != null)
                                            {
                                                ASDate = (DateTime)ASMSKBiopsy[BOL.Procedure.ProcDate];
                                                ASDateText = ASMSKBiopsy[BOL.Procedure.ProcDateText].ToString();
                                            }
                                        }
                                        else
                                        {
                                            ASDate = ASStatusDate;
                                            ASDateText = ASStatusDateText;
                                        }
                                    }
                                    else
                                    {
                                        ASDate = ASStatusDate;
                                        ASDateText = ASStatusDateText;
                                    }






                                }

                            }




                            // if ASDate has been set, display ASDateText
                            if (ASDate > DateTime.MinValue) ASDateStr = ASDateText;





                        }
                        //else leave blank
                    }

                }
            }

            return ASDateStr;

        }





        public static DateTime? ActiveSurveillanceDate(DateTime? FirstASStatusDate, DateTime? FirstPosBiopsyDate, DateTime? FirstMSKBiopsyDate, DateTime? FirstPosMSKBiopsyDate, DateTime? FirstMSKBiopsyDateAfterFirstPosBiopsy)
        {
            DateTime? ASDate = null;

            // A
            if (!FirstASStatusDate.Equals(null))
            {
                // B
                if (!FirstPosBiopsyDate.Equals(null))
                {

                    // C
                    if (!FirstPosMSKBiopsyDate.Equals(null) && FirstASStatusDate < FirstMSKBiopsyDate)  // patient has an MSK Pos biopsy and AS Record is earlier than all MSK biopsies
                    {
                        if ((FirstPosBiopsyDate < FirstPosMSKBiopsyDate) && ((DateTime)FirstMSKBiopsyDate - (DateTime)FirstPosBiopsyDate).TotalDays > 365)
                        {
                            ASDate = FirstASStatusDate;
                        }
                        else
                        {
                            ASDate = FirstMSKBiopsyDate;
                        }

                    }
                    else // D
                    {

                        // E
                        if (FirstPosBiopsyDate.Equals(FirstPosMSKBiopsyDate)) //FirstPosBiopsyIsSTD
                        {
                            if (!FirstMSKBiopsyDateAfterFirstPosBiopsy.Equals(null) && ((DateTime)FirstMSKBiopsyDateAfterFirstPosBiopsy - (DateTime)FirstPosMSKBiopsyDate).TotalDays <= 365)
                            {
                                ASDate = FirstMSKBiopsyDateAfterFirstPosBiopsy;
                            }
                            else
                            {
                                ASDate = FirstPosMSKBiopsyDate;
                            }
                        }
                        else // F        first pos biopsy is outside
                        {

                            if (!FirstMSKBiopsyDateAfterFirstPosBiopsy.Equals(null)) //FirstBiopsyGGS == 6 && 
                            {
                                ASDate = FirstMSKBiopsyDateAfterFirstPosBiopsy;
                            }
                            else
                            {
                                ASDate = FirstASStatusDate;
                            }

                        }

                    }

                }
            }
            return ASDate;
        }


        public static DataRowView FirstBiopsyAfterDate(DataTable biopsies, DateTime date)
        {
            DataView biopsiesAfterDate = new DataView(biopsies);
            biopsiesAfterDate.RowFilter = BOL.Procedure.ProcDate + " IS NOT NULL and " + BOL.Procedure.ProcDate + " > #" + date.ToShortDateString() + "#";
            biopsiesAfterDate.Sort = BOL.Procedure.ProcDate + " ASC";

            if (biopsiesAfterDate.Count > 0) return biopsiesAfterDate[0];
            else return null;
        }

    }
}