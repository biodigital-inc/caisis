using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Xml.Xsl;

using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Core.Classes
{
    /// <summary>
    /// A generic view of an Eform used to get HTML output for sending emails/text output
    /// </summary>
    public class GenericEFormViewer
    {
        private static readonly string GENERIC_XSL_PATH = "~/Core/Eforms/EFormGenericView.xsl";
        private string _htmlOutput = string.Empty;
        private EForm biz;
        private XmlDocument xDoc = new XmlDocument();
        private MetadataDa da = new MetadataDa();
        private Dictionary<string, XmlAttribute> tableToTableLabelAttributeHash = new Dictionary<string, XmlAttribute>();
        private Dictionary<string, XmlAttribute> fieldToFieldLabelAttributeHash = new Dictionary<string, XmlAttribute>();

        private Dictionary<string, string> tableNameHash = new Dictionary<string, string>();

        private List<string> tablesWithoutRecords = new List<string>();
        private Dictionary<string, string> tableToMetaTableList = new Dictionary<string, string>();
        private Dictionary<string, Dictionary<string, string>> fieldToMetaFieldList = new Dictionary<string, Dictionary<string, string>>();
        private MetadataDa metaDataAccess = new MetadataDa();

        /// <summary>
        /// Create a new instance of a GenericEFormViewer 
        /// </summary>
        /// <param name="eformId">The Eform Id to create a generic eform view</param>
        public GenericEFormViewer(int eformId)
        {
            biz = new EForm();
            biz.Get(eformId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="bizObj">The Eform Biz Object to create a generic eform view</param>
        public GenericEFormViewer(EForm bizObj)
        {
            biz = bizObj;
        }

        /// <summary>
        /// Returns a generic HTML view of an eform
        /// </summary>
        /// <returns></returns>
        public string GetGenericEformHTML()
        {
            if (string.IsNullOrEmpty(_htmlOutput))
            {
                //if (biz.RecordCount > 0)
				if (!biz.IsEmpty)
                {
                    string rawXml = biz[EForm.EFormXML].ToString();
                    xDoc.LoadXml(rawXml);
                    this.BuildTableFieldMetaData();

                    XslTransform transformer = new XslTransform();
                    transformer.Load(HttpContext.Current.Server.MapPath(GENERIC_XSL_PATH));
                    StringWriter messageWriter = new System.IO.StringWriter();
                    transformer.Transform(xDoc, null, messageWriter);
                    _htmlOutput = messageWriter.ToString();
                }
            }
            return _htmlOutput;
        }

        // get label for table name
        private string GetTableLabelByTableName(string tableName)
        {
            DataTable dt = da.GetFieldsByTableName(tableName);
            if (dt.Rows.Count > 0 && dt.Rows[0][MetadataTable.TableLabel_Field].ToString() != "")
                return dt.Rows[0][MetadataTable.TableLabel_Field].ToString();
            else
                return tableName;
        }

        // get meta data for the node name
        private DataTable GetMetaDataForTable(string tableName)
        {
            MetadataDa mda = new MetadataDa();

            DataTable dt = mda.GetFieldMetadataByTableName(tableName);

            return dt;
        }


        // returns the Label for the given field
        private string GetFieldLabel(DataTable metaDataTable, string fieldName)
        {
            string strExpr = String.Format("FieldName = '{0}'", fieldName);

            DataRow[] rows = metaDataTable.Select(strExpr);

            if (rows.Length > 0)
                return rows[0]["FieldName"].ToString();
            else
                return "NL " + fieldName;
        }

        /// <summary>
        /// REAL WORK
        /// </summary>
        private void BuildTableFieldMetaData()
        {
            // Get a List of Distinc Top Level Tables
            XmlNode parentNode = xDoc.SelectSingleNode("eform");
            XmlNodeList distinctTableNodes = parentNode.SelectNodes("*[name()!='eformSection' and name()!='NoTable' and name()!=name(preceding-sibling::*[1])]");
            RecursivelyFillTables(parentNode, distinctTableNodes);
        }

        private void RecursivelyFillTables(XmlNode parentNode, XmlNodeList distinctTableNodes)
        {
            // Look through each distinct table names
            foreach (XmlNode table in distinctTableNodes)
            {
                // db/xml table name
                string tableName = table.Name;
                // meta data table name/label
                string metaDataTableName = GetTableLabelByTableName(tableName);

                // Get mata data table for Table's fields
                DataTable fieldsMetaTable = da.GetFieldMetadataByTableName(tableName);

                // Get a complete list of tables named by tableName
                XmlNodeList listOfTableRecords = parentNode.SelectNodes(tableName);

                // Create Table Label Attribute
                XmlAttribute tableLabelAttribute = xDoc.CreateAttribute("tableLabel");
                tableLabelAttribute.Value = string.Empty;

                bool tableNameSet = false;
                foreach (XmlNode record in listOfTableRecords)
                {
                    // Check if a table has data (i.e., if any field has data)
                    // If table contains fields with data, then the table has data
                    if (TableHasFieldsWithData(record))
                    {
                        // Set TableLable attribute for this record, as it has data
                        XmlAttribute clonedTableLabelAttribute = tableLabelAttribute.Clone() as XmlAttribute;
                        if (!tableNameSet)
                        {
                            clonedTableLabelAttribute.Value = metaDataTableName;
                            tableNameSet = true;
                        }
                        record.Attributes.Append(clonedTableLabelAttribute);

                        // Get a list of Fields for a Table
                        XmlNodeList tableFields = GetTableFields(record);

                        XmlAttribute hasDataAttribute = xDoc.CreateAttribute("hasData");
                        hasDataAttribute.Value = Boolean.TrueString.ToLower();
                        record.Attributes.Append(hasDataAttribute);


                        this.BuildFieldList(record, fieldsMetaTable);

                        XmlNodeList distinctChildTables = GetDistinctChildTables(record);
                        if (distinctChildTables.Count > 0)
                        {
                            RecursivelyFillTables(record, distinctChildTables);
                        }
                    }
                    else
                    {
                        if (!tablesWithoutRecords.Contains(tableName))
                        {
                            tablesWithoutRecords.Add(tableName);
                            XmlAttribute a = xDoc.CreateAttribute("noData");
                            a.Value = string.Empty;
                            record.Attributes.Append(a);
                        }
                    }
                }
            }
        }


        private void BuildFieldList(XmlNode record, DataTable metaTable)
        {
            XmlAttribute fieldLabelAttribute = xDoc.CreateAttribute("fieldLabel");
            XmlNodeList listOfFields = GetTableFields(record);
            foreach (XmlNode fieldNode in listOfFields)
            {
                string fieldName = fieldNode.Name;
                string fieldMetaName = CICHelper.GetFieldAttributeValue(metaTable, fieldName, "FieldLabel");
                XmlAttribute fieldAttribute = fieldLabelAttribute.Clone() as XmlAttribute;
                fieldAttribute.Value = fieldMetaName;
                fieldNode.Attributes.Append(fieldAttribute);
            }
        }

        private XmlNodeList GetDistinctParentTables(XmlDocument xmlDoc)
        {
            XmlNodeList distinctParentTables = xmlDoc.SelectNodes("/eform/*[name()!='eformSection' and name()!='NoTable' and name()!=name(preceding-sibling::*[1])]");
            return distinctParentTables;
        }

        private XmlNodeList GetDistinctChildTables(XmlNode parent)
        {
            XmlNodeList distinctChildren = parent.SelectNodes("*[count(child::*)>0 and name()!=name(preceding-sibling::*[1])]");
            return distinctChildren;
        }

        private bool TableHasFieldsWithData(XmlNode record)
        {
            XmlNodeList fieldsWithData = record.SelectNodes("*[not(*) and string-length(node())!=0]");
            return fieldsWithData.Count > 0;
        }

        private XmlNodeList GetTableFields(XmlNode record)
        {
            XmlNodeList fieldList = record.SelectNodes("*[not(*)]");
            return fieldList;
        }
    }
}