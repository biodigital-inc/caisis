using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for EncBimanualExamDa.
	/// </summary>
	public class EncBimanualExamDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetEncBimanualExamsRecord";
			this._InsertStoredProc = "spInsertEncBimanualExamsRecord";
			this._UpdateStoredProc = "spUpdateEncBimanualExamsRecord";
			this._DeleteStoredProc = "spDeleteEncBimanualExamsRecord";
			this._GetByParentStoredProc = "spGetEncBimanualExams";
		}
	}
}
