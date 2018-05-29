using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;



namespace Caisis.DataAccess
{
	/// <summary>
    /// Summary description for AppConfigDa.
	/// </summary>
    public class AppConfigDa : BaseDA
	{

        /// <summary>
        /// </summary>
        /// <param name="configType"></param>
        /// <returns></returns>
        public DataSet GetConfig(string configType)
        {
            string sql =
            @"
            SELECT * FROM AppConfig
            WHERE ConfigType = @ConfigType
            ORDER BY ConfigType ASC, ConfigVariable ASC 
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(cmd, "ConfigType", configType);
            return DataAccessHelper.GetList(cmd);
        }

        /// <summary>
        /// </summary>
        /// <param name="configType"></param>
        /// <param name="configVariable"></param>
        /// <returns></returns>
        public DataSet GetConfig(string configType, string configVariable)
        {
            string sql =
            @"
            SELECT * FROM AppConfig
            WHERE ConfigType = @ConfigType AND ConfigVariable = @ConfigVariable
            ORDER BY ConfigType ASC, ConfigVariable ASC 
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(cmd, "ConfigType", configType);
            DataAccessHelper.AddStringInputParam(cmd, "ConfigVariable", configVariable);
            return DataAccessHelper.GetList(cmd);
        }

        /// <summary>
        /// </summary>
        /// <param name="configType"></param>
        /// <param name="configVariable"></param>
        /// <param name="configValue"></param>
        /// <returns></returns>
        public DataSet GetConfig(string configType, string configVariable, string configValue)
        {
            string sql =
            @"
            SELECT * FROM AppConfig
            WHERE ConfigType = @ConfigType AND ConfigVariable = @ConfigVariable AND ConfigValue = @ConfigValue
            ORDER BY ConfigType ASC, ConfigVariable ASC 
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(cmd, "ConfigType", configType);
            DataAccessHelper.AddStringInputParam(cmd, "ConfigVariable", configVariable);
            DataAccessHelper.AddStringInputParam(cmd, "ConfigValue", configValue);
            return DataAccessHelper.GetList(cmd);
        }

        /// <summary>
        /// </summary>
        /// <param name="configType"></param>
        /// <param name="configVariable"></param>
        /// <returns></returns>
        public bool UpdateConfigValue(int appConfigId, string newConfigValue)
        {
            string sql =
            @"
                UPDATE AppConfig
                SET
                   ConfigValue = @ConfigValue
                WHERE AppConfigId = @AppConfigId
            ";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "AppConfigId", appConfigId);
            DataAccessHelper.AddStringInputParam(cmd, "ConfigValue", newConfigValue);
            // execute update
            DataAccessHelper.ExecuteScalar(cmd);
            return true;
        }


	}
}
