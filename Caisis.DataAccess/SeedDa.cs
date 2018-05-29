using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for Seed Da.
	/// </summary>
	public class SeedDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetSeedsRecord";
			this._InsertStoredProc = "spInsertSeedsRecord";
			this._UpdateStoredProc = "spUpdateSeedsRecord";
			this._DeleteStoredProc = "spDeleteSeedsRecord";
			this._GetByParentStoredProc = null;
		}

		

		public DataSet GetRecords()
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetSeeds");
			return DataAccessHelper.GetRecord(com);
		}

		public DataSet ListSeedInventory(string listName)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spListSeedInventory");
			DataAccessHelper.AddStringInputParam(com, "listName", listName);
			return DataAccessHelper.GetRecord(com);
		}

		/// <summary>
		/// Available inventory determined by isotope, number of seeds greater than zero, and implant activity greater than cuttoff activity
		/// </summary>
		/// <param name="prescribedIsotope"></param>
		/// <returns></returns>
		public DataSet ListSeedInventoryByIsotope(string prescribedIsotope)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetSeedsByIsotope");
			DataAccessHelper.AddStringInputParam(com, "SeedIsotope", prescribedIsotope);
			return DataAccessHelper.GetRecord(com);
		}

		public bool UpdateSeedCurrentActivity(int seedId, string seedAct)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spUpdateSeedsSeedCurrentActivity");
			DataAccessHelper.AddIntInputParam(com, "SeedId", seedId);
			DataAccessHelper.AddStringInputParam(com, "SeedCurrentActivity", seedAct);
			DataAccessHelper.ExecuteScalar(com);
			return true;
		}
		public bool UpdateSeedsSeedNum(int seedId, string seedNum, string updatedBy)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spUpdateSeedsSeedNum");
			DataAccessHelper.AddIntInputParam(com, "SeedId", seedId);
			DataAccessHelper.AddStringInputParam(com, "SeedNum", seedNum);
			DataAccessHelper.AddStringInputParam(com, "UpdatedBy", updatedBy);
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
			DataAccessHelper.ExecuteScalar(com);
			return true;
		}

		public int GetMaxShipmentNumber()  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetSeedShipmentNumMax");
			DataAccessHelper.AddIntOutputParam(com, "MaxNum");
			Hashtable ht = DataAccessHelper.ExecuteScalar(com);

			if(ht["MaxNum"] != null && !ht["MaxNum"].ToString().Equals(""))
			{
				return (int)ht["MaxNum"];
			}
			else
			{
				return 0;
			}
		}

		public int GetMaxPackageNumber(int shipmentNum)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetSeedPackageNumMax");
			DataAccessHelper.AddIntInputParam(com, "SeedShipmentNum", shipmentNum);
			DataAccessHelper.AddIntOutputParam(com, "MaxNum");
			Hashtable ht = DataAccessHelper.ExecuteScalar(com);

			if(ht["MaxNum"] != null && !ht["MaxNum"].ToString().Equals(""))
			{
				return (int)ht["MaxNum"];
			}
			else
			{
				return 0;
			}
		}

		public int GetMaxVialNumber(int shipmentNum, int packageNum)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetSeedVialNumMax");
			DataAccessHelper.AddIntInputParam(com, "SeedShipmentNum", shipmentNum);
			DataAccessHelper.AddIntInputParam(com, "SeedPackageNum", packageNum);
			DataAccessHelper.AddIntOutputParam(com, "MaxNum");
			Hashtable ht = DataAccessHelper.ExecuteScalar(com);

			if(ht["MaxNum"] != null && !ht["MaxNum"].ToString().Equals(""))
			{
				return (int)ht["MaxNum"];
			}
			else
			{
				return 0;
			}
		}


	}
}