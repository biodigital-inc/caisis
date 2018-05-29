using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using System.Web.Security;
using System.Linq;
using System.Xml.Linq;

using System.Web.Caching;
using Caisis.DataAccess;
using Caisis.Extensions;
using Caisis.BOL;
using Caisis.Controller;

namespace Caisis.UI.Core.Classes
{
    /// <summary>
    /// Provides caching logic for frequently used application related objects, menus, data, etc...
    /// </summary>
    public class CacheManager
    {
        /// <summary>
        /// Used for setting the Cache dependency for the LookupTables
        /// </summary>
        public const string LOOKUP_REFRESH_TIME = "LookupRefreshTime";

        /// <summary>
        /// Used for setting the Cache dependency for the Dataset Cache 
        /// </summary>
        public const string DATASET_SQL_REFRESH_TIME = "DatasetSqlRefreshTime";

        /// <summary>
        /// The string used for specially formatted disease based lookup codes
        /// </summary>
        public const string DISEASE_VIEW_LOOKUP_FORMAT = "@DiseaseView";

        /// <summary>
        /// The CACHE key used for storing Patient Data Entry configurations (xml, metadata, etc...)
        /// </summary>
        public const string PATIENT_DATA_LIST_CACHE = "PatientDataEntryConfig";

        // Application Cache
        private static Cache appCache = HttpRuntime.Cache;

        public CacheManager()
        {

        }

        /// <summary>
        /// Refreshes ALL items in the application cahche.
        /// </summary>
        public static void RefreshApplicationCache()
        {
            foreach (DictionaryEntry entry in appCache)
            {
                appCache.Remove(entry.Key.ToString());
            }
        }

        /// <summary>
        /// Refreshes the tabs list.
        /// </summary>
        public static void RefreshTabListCache()
        {
            appCache.Remove("tabslist");
        }

        /// <summary>
        /// Refreshes the cached dataset sql
        /// </summary>
        public static void ResetDatasetSqlCache()
        {
            ResetCacheVariable(DATASET_SQL_REFRESH_TIME);
        }

        /// <summary>
        /// Refreshes all cached lookup codes in cache.
        /// </summary>
        public static void ResetLookupCodeCache()
        {
            ResetCacheVariable(LOOKUP_REFRESH_TIME);
        }

        protected static void ResetCacheVariable(string cacheKey)
        {
            Cache c = HttpContext.Current.Cache;
            c[cacheKey] = DateTime.Now;
        }

        /// <summary>
        /// Creates cache object with file or variable dependencies.
        /// </summary>
        /// <param name="cacheKey">Key name of object to be created.</param>
        /// <param name="cacheObj">Object to be cached.</param>
        /// <param name="varName">Name of the cache variable which the new cache object will be dependent on.</param>
        /// <param name="fileName">Name of the file which the new cache object will be dependent on.  If this variable is null
        /// no file dependency is created.</param>
        /// <returns></returns>
        public static CacheDependency CreateCacheDependency(string cacheKey, object cacheObj, string varName, string fileName)
        {
            Cache c = HttpContext.Current.Cache;

            if (c.Get(varName) == null)
            {
                c.Insert(varName, DateTime.Now);
            }

            CacheDependency dep;
            if (fileName != null)
            {
                dep = new CacheDependency(new string[] { fileName }, new string[] { varName });
            }
            else
            {
                dep = new CacheDependency(new string[] { }, new string[] { varName });
            }

            c.Insert(cacheKey, cacheObj, dep);

            return dep;
        }


        /// <summary>
        /// Retrieves the list of lookup codes for a specified category.
        /// </summary>
        /// <param name="key">LookupCode category to be retrieved.</param>
        /// <returns>DataTable containing list of lookupcodes belonging to the category specified.</returns>
        public static DataTable GetLookupCodeList(String key)
        {
            string viewMode = null;
            // handle @Disease lookup codes
            //if (key.IndexOf(DiseaseViewLookupFormat, 0, StringComparison.CurrentCultureIgnoreCase) > -1)
            //{
            //    Caisis.Controller.DiseaseController dc = new Caisis.Controller.DiseaseController();
            //    viewMode = dc.GetDiseaseView();
            //}
            // v6 always filter by disease
            Caisis.Controller.DiseaseController dc = new Caisis.Controller.DiseaseController();
            viewMode = dc.GetDiseaseView();
           
            return GetLookupCodeList(key, viewMode);
        }

        public static DataTable GetLookupCodeList(String key, string viewMode)
        {
            string lkpField = key;
            // handle @Disease lookup codes
            if (!string.IsNullOrEmpty(viewMode) && viewMode != "All")
            {
                // normalize view mode to single word
                viewMode = viewMode.Replace(" ", "");
                if (lkpField.Contains(DISEASE_VIEW_LOOKUP_FORMAT))
                {
                    lkpField = System.Text.RegularExpressions.Regex.Replace(lkpField, DISEASE_VIEW_LOOKUP_FORMAT, viewMode, System.Text.RegularExpressions.RegexOptions.IgnoreCase);
                }
                else
                {
                    string newLkpFieldName = string.Format("{0},Disease," + DISEASE_VIEW_LOOKUP_FORMAT, lkpField);
                    // replace special @disease view string with real view mode
                    lkpField = System.Text.RegularExpressions.Regex.Replace(newLkpFieldName, DISEASE_VIEW_LOOKUP_FORMAT, viewMode, System.Text.RegularExpressions.RegexOptions.IgnoreCase);
                }
            }
            Cache c = HttpContext.Current.Cache;
            DataTable dt = (DataTable)c.Get(lkpField);
            if (null == dt)
            {
                Caisis.DataAccess.LookupCodeDa lkp = new Caisis.DataAccess.LookupCodeDa();
                dt = lkp.GetLookupCodes(lkpField);

                CreateCacheDependency(lkpField, dt, LOOKUP_REFRESH_TIME, null);
            }
            return dt;
        }


        /// <summary>
        /// Returns the SQL string required to retrieve the patient records defined in a patient dataset.  The SQL is only
        /// created on the first attempt, after this the SQL string is stored in cache.
        /// </summary>
        /// <param name="dsId">DataSetId identifying the dataset for which sql is to be retrieved.</param>
        /// <returns>SQL string.</returns>
        public static string GetDatasetSQL(object dsId)
        {
            int datasetId = 0;

            datasetId = (int)dsId;

            string key = "dataset" + datasetId.ToString();
            Cache c = HttpContext.Current.Cache;
            object dsSQL = c.Get(key);
            if (dsSQL != null)
            {
                return (string)dsSQL;
            }
            else
            {
                DataSetController ct = new DataSetController();
                dsSQL = ct.GetDatasetSQL(datasetId);

                string pathToXMLFile = AppDomain.CurrentDomain.BaseDirectory.Replace("/", "\\") + "App_Data\\Datasets.xml";

                CreateCacheDependency(key, dsSQL, DATASET_SQL_REFRESH_TIME, pathToXMLFile);

                return (string)dsSQL;
            }

        }


        // CACHE HELPERS

        /// <summary>
        /// Checks to see if the item is in the Cache
        /// </summary>
        /// <param name="item">Item name in cache</param>
        /// <returns></returns>
        public static bool IsInCache(string key)
        {
            return (GetFromCache(key) != null);
        }

        /// <summary>
        /// Inset Item into Cache. Replace existing item if it is in cache.
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <param name="minutes">Life of item in Cache (minutes), from when it is inserted.</param>
        /// <returns></returns>
        public static bool InsertIntoCache(string key, Object value, int minutes)
        {
            appCache.Insert(key, value, null, DateTime.Now.Add(TimeSpan.FromMinutes(minutes)), Cache.NoSlidingExpiration);
            return (appCache.Get(key) != null);
        }

        /// <summary>
        /// Inserts the Patient Data Entry configuration into cache for specified disease
        /// </summary>
        /// <param name="disease"></param>
        /// <param name="pde"></param>
        /// <param name="minutes"></param>
        /// <returns></returns>
        public static bool InsertPatientDataCache(string disease, Object pde, int minutes)
        {
            string cacheKey = GetPatientDataCacheKey(disease);
            return InsertIntoCache(cacheKey, pde, minutes);
        }

        /// <summary>
        /// Gets the Patient Data Entry configuration from cache for specified disease
        /// </summary>
        /// <param name="disease"></param>
        /// <returns></returns>
        public static object GetPatientDataCache(string disease)
        {
            string cacheKey = GetPatientDataCacheKey(disease);
            return GetFromCache(cacheKey);
        }
        
        /// <summary>
        /// Refreshes the Patient Data Entry cache for all diseases
        /// </summary>
        public static void RefreshPatientDataCache()
        {
            // for each patient data cache, refresh
            foreach (DictionaryEntry entry in appCache)
            {
                string cacheKey = entry.Key.ToString();
                if (cacheKey.StartsWith(PATIENT_DATA_LIST_CACHE))
                {
                    appCache.Remove(cacheKey);
                }
            }
        }

        /// <summary>
        /// Refreshes the Patient Data Entry cache for specified disease
        /// </summary>
        /// <param name="disease"></param>
        public static void RefreshPatientDataCache(string disease)
        {
            string cacheKey = GetPatientDataCacheKey(disease);
            ResetCacheVariable(cacheKey);             
        }

        /// <summary>
        /// Gets a normalized disease specific PDE cache key
        /// </summary>
        /// <param name="disease"></param>
        /// <returns></returns>
        private static string GetPatientDataCacheKey(string disease)
        {
            disease = !string.IsNullOrEmpty(disease) ? disease : "All";
            // return specially formatted cache key
            string cacheKey = PATIENT_DATA_LIST_CACHE + "_" + disease;
            return cacheKey;
        }

        /// <summary>
        /// Gets Object from Cache
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static Object GetFromCache(string key)
        {
            return appCache.Get(key);
        }

        /// <summary>
        /// Returns current Application Cache
        /// </summary>
        /// <returns></returns>
        public static Cache GetApplicationCache()
        {
            return appCache;
        }
    }
}
