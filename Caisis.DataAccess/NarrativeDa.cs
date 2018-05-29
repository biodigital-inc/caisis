using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for Narratives.
	/// </summary>
	public class NarrativeDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetNarrativesRecord";
			this._InsertStoredProc = "spInsertNarrativesRecord";
			this._UpdateStoredProc = "spUpdateNarrativesRecord";
			this._DeleteStoredProc = "spDeleteNarrativesRecord";
			this._GetByParentStoredProc = "spGetNarratives";
		}
		
	}
}
