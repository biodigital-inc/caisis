using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.Controller
{
    /// <summary>
    /// Defines a controller which manages disease/view related tasks
    /// </summary>
    public class DiseaseController : BaseController
    {
        public DiseaseController()
            : base()
        {
        }


        /// <summary>
        /// Get the active disease view the user is working within
        /// </summary>
        /// <returns></returns>
        public string GetDiseaseView()
        {
            Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
            string currentDiseaseView = sc.GetViewMode();
            return currentDiseaseView;
        }

        /// <summary>
        /// Gets a list of disease views
        /// </summary>
        /// <returns></returns>
        public DataTable GetDiseaseViews()
        {
            Caisis.DataAccess.DiseaseDa da = new Caisis.DataAccess.DiseaseDa();
            var diseases = da.GetDiseaseViews();
            return diseases;
        }
        
        /// <summary>
        /// Returns the DiseaseAttribute biz object for attribute, else NULL
        /// </summary>
        /// <param name="diseaseAttributeName">The disease attribute name</param>
        /// <returns></returns>
        public DiseaseAttribute_Table GetDiseaseAttribute(string diseaseAttributeName)
        {
            return GetByFields<DiseaseAttribute_Table>(new Dictionary<string, object>
            {
                { DiseaseAttribute_Table.DiseaseAttributeName, diseaseAttributeName }
            });
        }

        /// <summary>
        /// Create a new diseae attribute
        /// </summary>
        /// <param name="diseaseAttributeName"></param>
        /// <returns></returns>
        public DiseaseAttribute_Table CreateDiseaseAttribute(string diseaseAttributeName)
        {
            DiseaseAttribute_Table biz = new DiseaseAttribute_Table();
            biz[DiseaseAttribute_Table.DiseaseAttributeName] = diseaseAttributeName;
            biz.Save();

            return biz;
        }

        /// <summary>
        /// Returns the Disease Attribute Value record for the specified attrubute and value
        /// </summary>
        /// <param name="diseaseAttributeName"></param>
        /// <param name="diseaseAttributeValue"></param>
        /// <returns></returns>
        public DiseaseAttributeValue GetDiseaseAttributeValue(string diseaseAttributeName, string diseaseAttributeValue)
        {
            // get diseaseAttributeId
            int? diseaseAttributeId = null;
            var diseaseAttribute = GetDiseaseAttribute(diseaseAttributeName);
            if (diseaseAttribute != null)
            {
                diseaseAttributeId = (int)diseaseAttribute[DiseaseAttributeValue.DiseaseAttributeId];
            }
            if (diseaseAttributeId.HasValue)
            {
                return GetByFields<DiseaseAttributeValue>(new Dictionary<string, object>
                { 
                    { DiseaseAttributeValue.DiseaseAttributeId, diseaseAttributeId  },
                    { DiseaseAttributeValue.DiseaseAttributeValue_Field, diseaseAttributeValue }
                });
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Creates a new 
        /// </summary>
        /// <param name="diseaseId"></param>
        /// <param name="diseaseAttributeName"></param>
        /// <param name="diseaseAttributeValue"></param>
        /// <returns></returns>
        public DiseaseAttributeValue CreateDiseaseAttributeValue(int diseaseId, string diseaseAttributeName, string diseaseAttributeValue)
        {
            var diseaseAttribute = GetDiseaseAttribute(diseaseAttributeName);
            if (diseaseAttribute == null)
            {
                diseaseAttribute = CreateDiseaseAttribute(diseaseAttributeName);
            }
            return CreateDiseaseAttributeValue(diseaseId, (int)diseaseAttribute[DiseaseAttribute_Table.DiseaseAttributeId], diseaseAttributeValue);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="diseaseId"></param>
        /// <param name="diseaseAttributeId"></param>
        /// <param name="diseaseAttributeValue"></param>
        /// <returns></returns>
        public DiseaseAttributeValue CreateDiseaseAttributeValue(int diseaseId, int diseaseAttributeId, string diseaseAttributeValue)
        {
            DiseaseAttributeValue biz = new DiseaseAttributeValue();
            biz[DiseaseAttributeValue.DiseaseId] = diseaseId;
            biz[DiseaseAttributeValue.DiseaseAttributeId] = diseaseAttributeId;
            biz[DiseaseAttributeValue.DiseaseAttributeValue_Field] = diseaseAttributeValue;
            biz.Save();

            return biz;
        }

        public DataTable GetTableRecordsByDisease(int diseaseId, string table)
        {
            // get a list of all table records
            var allRecordsTable = BOL.BusinessObject.GetAllAsDataView(table).Table;
            string priKeyName = BOL.BusinessObject.GetPrimaryKeyName(table);

            // get a list of disease associated to table
            DiseaseDa da = new DiseaseDa();
            var priKeyEntries = da.GetDiseasesByAttribute(diseaseId, priKeyName, null);
            // create a lookup of table entries in disease attribute values
            int tablePriKey = int.MinValue;
            var lookup = (from row in priKeyEntries.AsEnumerable()
                          where !row.IsNull(DiseaseAttributeValue.DiseaseAttributeValueId)
                          where int.TryParse(row[DiseaseAttributeValue.DiseaseAttributeValue_Field].ToString(), out tablePriKey) && tablePriKey != int.MinValue
                          select new
                          {
                              PriKey = tablePriKey,
                              Data = row
                          }).ToDictionary(a => a.PriKey, a => a.Data);

            // create normalized columns
            var diseaseColumns = new string[] { BOL.DiseaseAttributeValue.DiseaseId, BOL.DiseaseAttributeValue.DiseaseAttributeId, BOL.DiseaseAttributeValue.DiseaseAttributeValueId, BOL.DiseaseAttributeValue.DiseaseAttributeValue_Field };
            allRecordsTable.Columns.AddRange(diseaseColumns.Select(a => new DataColumn(a)).ToArray());
            if (lookup.Count > 0)
            {
                // for each row,copy disease attribute values
                foreach (DataRow row in allRecordsTable.Rows)
                {
                    int priKey = (int)row[priKeyName];
                    // check if record has disease association, copy values to new columns
                    if (lookup.ContainsKey(priKey))
                    {
                        var diseaseData = lookup[priKey];
                        foreach (string column in diseaseColumns)
                        {
                            row[column] = diseaseData[column];
                        }
                    }
                }
            }
            return allRecordsTable;
        }

        private static T GetByFields<T>(Dictionary<string, object> paramaters)
            where T : BusinessObject, IBusinessObject, new()
        {
            var found = BOL.BusinessObject.GetByFields<T>(paramaters);
            return found.FirstOrDefault() as T;
        }
    }
}
