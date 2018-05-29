using System;
using System.Xml;
using System.IO;

using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;


namespace Caisis.Controller
{
	/// <summary>
	/// Migrates eForm XML into database tables. If incurs errors, writes them to migration error log and continues processing(inserting) data.
	/// </summary>
    public class EFormMigrator //: DataEntryController
    {
        //private int _patientId;
        // private XmlDocument _data;
        //private int _encounterId = 0;
        // private string xml;

        public System.Text.StringBuilder migrationErrorLog = new System.Text.StringBuilder(); // make public so UI can display errors

        public EFormMigrator()
        {
            // _data = xmlDoc;
            // xml = xmlString;
        }

        /// <summary>
        /// Starts and the XML root and migrates all nodes to the database that are tables in the DataBase.
        /// </summary>
        /// <param name="data">Data to be imported into database.</param>
        /// <param name="patientId">Patient for whom the data pertains to.</param>
        public void MigrateData(int patientId, string xml)
        {
            // _patientId = patientId;

            // XmlNode tableNode = _data.DocumentElement.FirstChild;

            // first take data from "NoTable" nodes and append to the field as specified in the no table attributes
           //  this.AppendNoTableData();

			string errors;
            XmlServiceSettings settings = new XmlServiceSettings();
            XmlServices.MigrateEformXml(patientId, xml, out errors, settings);

            //while (tableNode != null)
            //{
            //    this.MigrateNode(tableNode, -1);

            //    tableNode = tableNode.NextSibling;
            //}
        }

        /// <summary>
        /// Adds data to the dataRow about to be inserted to the database.
        /// </summary>
        /// <param name="bo">BusinessObject to which the node corresponds to.</param>
        /// <param name="tableNode">Table node to which data needs to be added.</param>
        /// <param name="parentId">Primary Key of the parent Record for this node.</param>
        //private void AddData(BusinessObject bo, XmlNode tableNode, int parentId)
        //{
        //    // v4 REWORK THIS BRANDON
        //    DataTable dt = bo.DataSourceView.Table;
        //    if (dt.Columns.Contains("PatientId"))
        //    {
        //        dt.Rows[0]["PatientId"] = _patientId;
        //    }

        //    if (bo.ParentKeyName != null && parentId != -1)
        //    {
        //        dt.Rows[0][bo.ParentKeyName] = parentId;
        //    }
        //}

        /// <summary>
        /// Retrieves all child Table nodes from an individual TableNode.
        /// </summary>
        /// <param name="tableNode">Table node to retrieve children from.</param>
        /// <returns>An array list containing XML nodes of the child tables.</returns>
        //private ArrayList GetChildNodes(XmlNode tableNode)
        //{
        //    ArrayList childNodes = new ArrayList();
        //    XmlNode fieldNode = tableNode.FirstChild;
        //    while (fieldNode != null)
        //    {
        //        // assumes that all nodes that have childNodes containing text are tables.  
        //        // adds these nodes to the arrayList of nodes.
        //        if (fieldNode.HasChildNodes && !(fieldNode.FirstChild is System.Xml.XmlText))
        //        {
        //            childNodes.Add(fieldNode);
        //        }
        //        fieldNode = fieldNode.NextSibling;
        //    }
        //    return childNodes;
        //}

        /// <summary>
        /// Recursively inserts an individual TableNode and all of its Children Tables Nodes. Continues processing if incurs EB error.
        /// </summary>
        /// <param name="tableNode">Xml NOde to be imported.</param>
        /// <param name="parentId">Primary Key of the parentNode of currentNode.  Used as foreignKey on insert.</param>
        //private void MigrateNode(XmlNode tableNode, int parentId)
        //{
        //    // v4 BRANDON Need to remove references to da and use new BO's
        //    /*
        //    // nodes with the following parameters do not contain data and should not be processed
        //    if (!tableNode.Name.Equals("NoTable") && !tableNode.Name.Equals("eformSection")
        //        && !tableNode.Name.Equals("eform") && tableNode.HasChildNodes)
        //    {
        //        BusinessObjectFactory boFact = new BusinessObjectFactory();
        //        DataAccessFactory daFact = new DataAccessFactory();

        //        BusinessObject bo = boFact.GetBO(tableNode.Name);

        //        //this.MakeSafeXML(tableNode, bo.Tables[0]);
        //        this.RemoveEmptyDateNodesFromXML(tableNode, bo.DataSourceView.Table);

        //        // loads dataset with XML node.  dataset is used to insert into database
        //        StringReader sr = new StringReader(tableNode.OuterXml);

        //        bo.ReadXml(sr, XmlReadMode.IgnoreSchema);

        //        this._da = daFact.GetDataAccess(tableNode.Name);

        //        bool isBlank = this.IsBlank(bo.Tables[0].Rows[0]);

        //        this.AddData(bo, tableNode, parentId);

        //        DataRow dr = bo.Tables[0].Rows[0];

        //        // if (!this.IsBlank(dr)) // if all fields in row are blank do not insert 
        //        if (!isBlank) // see how i moved this above - bas
        //        {
        //            // if whole row is not blank, check that not nullable fields exist
        //            string isValid = NullsValidator.CheckNulls(dr);

        //            if (isValid.Equals("true"))
        //            {
        //                try
        //                {
        //                    int primKey = this._InsertRecord(dr);
        //                }

        //                catch (System.Data.SqlClient.SqlException e)
        //                {
        //                    // catch unique key violations and write to log
        //                    if (e.Message.IndexOf("UNIQUE KEY") > -1)
        //                    {
        //                        migrationErrorLog.Append("\nUnique constraint violation inserting into " + bo.Tables[0].TableName + " table.\n");
        //                        //throw new ClientException("Unique constraint violation inserting into " + bo.Tables[0].TableName + " table." );
        //                    }
        //                    else
        //                    {
        //                        // catch other db violations and write to log
        //                        migrationErrorLog.Append("\nOther error inserting into " + bo.Tables[0].TableName + " table.\n");
        //                        //throw new ClientException("Error inserting into " + bo.Tables[0].TableName + " table.");
        //                    }

        //                    migrationErrorLog.Append("Exception Detail: " + e.Message + "\n");
        //                    migrationErrorLog.Append("Exception caused by node: " + tableNode.OuterXml + "\n");
        //                }
        //            }
        //            else
        //            {
        //                // catch not null violations and write to log
        //                migrationErrorLog.Append("\n" + isValid + " is empty and required by the " + bo.Tables[0].TableName + " table to insert this record.");
        //                //throw new ClientException(isValid + " is empty. Please enter before saving.");
        //            }

        //            //  processes table nodes nested under current node
        //            ArrayList childNodes = this.GetChildNodes(tableNode);
        //            foreach (XmlNode childNode in childNodes)
        //            {

        //                BaseDataAccess da = daFact.GetDataAccess(childNode.Name);
        //                // don't migrate child nodes if parent node did not insert correctly
        //                if (da.ParentKeyName != null && dr[da.ParentKeyName] != null && dr[da.ParentKeyName].ToString().Length > 0)
        //                {
        //                    MigrateNode(childNode, (int)dr[da.ParentKeyName]);
        //                }
        //                else
        //                {
        //                    migrationErrorLog.Append("\n  - Did not attempt to insert " + childNode.Name + " because of a problem inserting the parent record.");
        //                }
        //            }
        //        }
        //    }
        //    */
        //}

        //protected int _InsertRecord(DataRow dr)
        //{
        //    SecurityController sc = new SecurityController();

        //    dr[BusinessObject.EnteredBy] = sc.GetUserName() + " (eform)"; // append (eform) to username
        //    dr[BusinessObject.UpdatedBy] = sc.GetUserName(); //comment out if you do not want an updatedBy username stamped on insert

        //    // if object has DataSource column set value to "EForm"
        //    foreach (System.Data.DataColumn column in dr.Table.Columns)
        //    {
        //        if (column.ColumnName.EndsWith("DataSource"))
        //        {
        //            dr[column] = "EForm";
        //        }
        //    }

        //    // ProblemPlan requires addition of the just inserted encounter id; We hate this table specific logic here and should remove
        //    if (this._encounterId != 0)
        //    {
        //        if (dr.Table.TableName.Equals("ProblemPlan"))
        //        {
        //            dr[ProblemPlan.EncounterId] = this._encounterId.ToString();
        //        }
        //    }


        //    // V4 BRANDON REDO
        //    /*
        //    int newPrimKey = _da.InsertRecord(dr, null);
        //    dr[_da.PrimaryKeyName] = newPrimKey;

        //    // added 12/5/06 to hold id for insert into ProblemPlan table
        //    if (_da.PrimaryKeyName.Equals(Encounter.EncounterId))
        //    {
        //        this._encounterId = newPrimKey;
        //    }
            
        //    return newPrimKey;
        //    */
        //    return -1;
        //}



        /// <summary>
        /// This method removes empty DateTime XML nodes which are not safe for import into DataSet.
        /// </summary>
        /// <param name="tableNode">Node to process.  Processes all first level children of this node.</param>
        /// <param name="dt">DataTable that the node corresponds to.  Used to determine dataType of childNodes in tableNode.</param>
        //private void RemoveEmptyDateNodesFromXML(XmlNode tableNode, DataTable dt)
        //{
        //    XmlNode fieldNode = tableNode.FirstChild;

        //    while (fieldNode != null)
        //    {
        //        // hold next node for loop
        //        XmlNode nextNode = fieldNode.NextSibling;

        //        // looks at all nodes of DataType DateTime
        //        if (dt.Columns[fieldNode.Name] != null)
        //        {
        //            if (dt.Columns[fieldNode.Name].DataType.Equals(typeof(System.DateTime)))
        //            {
        //                string fieldValue = fieldNode.InnerXml;

        //                // null value in a DateTime field will throw error on import into DataSet, must remove date node if its empty
        //                if (fieldValue == null || fieldValue.Equals(""))
        //                {
        //                    // remove from the tree
        //                    tableNode.RemoveChild(fieldNode);
        //                }
        //                // date strings formatted incorrectly will also throw errors, must format before import
        //                else
        //                {
        //                    string dateTime = (DateTime.Parse(fieldValue)).ToString("s");
        //                    fieldNode.InnerText = dateTime;
        //                }

        //            }
        //            // deal with other value types
        //            else if (dt.Columns[fieldNode.Name].DataType.Equals(typeof(System.Byte))
        //                    || dt.Columns[fieldNode.Name].DataType.Equals(typeof(System.Int32)))
        //            {
        //                string fieldValue = fieldNode.InnerXml;

        //                // null value in a DateTime field will throw error on import into DataSet, must remove date node if its empty
        //                if (fieldValue == null || fieldValue.Equals(""))
        //                {
        //                    // remove from the tree
        //                    tableNode.RemoveChild(fieldNode);
        //                }
        //            }
        //        }
        //        fieldNode = nextNode;
        //    }
        //}


        /// <summary>
        /// Appends data from No Table nodes to the table and field specified in the attributes of the NoTable node
        /// </summary>
        /// <param name="tableNode"></param>
        //private void AppendNoTableData()
        //{
        //    // iterate over no table node and create name value pairs 
        //    System.Text.StringBuilder sb = new System.Text.StringBuilder();

        //    XmlNode noTableNode = _data.DocumentElement["NoTable"];

        //    if (noTableNode.Attributes["PutDataInTable"] != null && noTableNode.Attributes["PutDataInField"] != null)
        //    {
        //        // put name value pairs in string

        //        string putInTableName = noTableNode.Attributes["PutDataInTable"].Value;

        //        string putInFieldName = noTableNode.Attributes["PutDataInField"].Value;

        //        XmlNode noTableNodeFirstChild = noTableNode.FirstChild;

        //        while (noTableNodeFirstChild != null)
        //        {
        //            if (noTableNodeFirstChild.InnerText != null && noTableNodeFirstChild.InnerText.Length > 0)
        //            {
        //                sb.Append(" | " + noTableNodeFirstChild.Name + " :: " + noTableNodeFirstChild.InnerText);
        //            }

        //            noTableNodeFirstChild = noTableNodeFirstChild.NextSibling;
        //        }


        //        // now get the specified field and append the data 

        //        XmlNode putInTableNode = _data.DocumentElement[putInTableName].FirstChild;

        //        while (putInTableNode != null)
        //        {
        //            if (putInTableNode.Name.Equals(putInFieldName) && sb.ToString().Length > 0)
        //            {
        //                putInTableNode.InnerText += "OTHER EFORM DATA: " + sb.ToString();
        //            }

        //            putInTableNode = putInTableNode.NextSibling;
        //        }
        //    }
        //}    

    }
}

	
