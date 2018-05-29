using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for DietaryIntakeItemDa
	/// </summary>
	public class DietaryIntakeItemDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetDietaryIntakeItemsRecord";
			this._InsertStoredProc = "spInsertDietaryIntakeItemsRecord";
			this._UpdateStoredProc = "spUpdateDietaryIntakeItemsRecord";
			this._DeleteStoredProc = "spDeleteDietaryIntakeItemsRecord";
			//if parent id is the same as primkey then know its one to one
			this._GetByParentStoredProc = "spGetDietaryIntakeItems";
		}

		//returns records for datagrid

	}
}