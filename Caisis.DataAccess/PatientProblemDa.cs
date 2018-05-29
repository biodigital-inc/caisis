using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for PatientProblemDa.
	/// </summary>
    public class PatientProblemDa : BaseDA
    {
        protected override void SetParams()
        {
            this._GetStoredProc = "spGetPatientProblemsRecord";
            this._InsertStoredProc = "spInsertPatientProblemsRecord";
            this._UpdateStoredProc = "spUpdatePatientProblemsRecord";
            this._DeleteStoredProc = "spDeletePatientProblemsRecord";

            this._GetByParentStoredProc = "spGetPatientProblems";
        }

    }
}
