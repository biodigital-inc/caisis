using System;

using System.Data.SqlClient;
using System.Collections;
using System.Data;

namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for SurgeryDa.
	/// </summary>
	public class ToxicityDa : BaseDA
	{
		
		public DataSet FormListToxicities(int PatientId, string FormName, string FormType, string Modifier)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormListToxicities");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataAccessHelper.AddStringInputParam(com, "Modifier", Modifier);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}

        public DataSet FormGetComplicationsByORDetailId(int OperatingRoomDetailId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT * ";
                sql += "FROM Toxicities ";
                sql += "WHERE (OperatingRoomDetailId = @OperatingRoomDetailId ) ";
                sql += "ORDER BY ToxDate ASC";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "OperatingRoomDetailId", OperatingRoomDetailId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }





	}
}