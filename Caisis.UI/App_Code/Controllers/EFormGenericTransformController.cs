using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Text;
using System.Collections;
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.Controller
{
    /// <summary>
    /// Summary description for EFormGenericTransformController
    /// </summary>
    public class EFormGenericTransformController
    {

        private StringBuilder _sb = new StringBuilder();
        private ArrayList _emptyRecordsList = new ArrayList();
        private ArrayList _fullRecordsList = new ArrayList();
        private bool _enableForEditing = false;

        public EFormGenericTransformController()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public string GetGenericTransform(int eformId, bool enableForEditing)
        {
            _enableForEditing = enableForEditing;

            // start output of data
            XmlDocument eformXml = GetXmlRecord(eformId);
            string genericOutputString = "generic transform failed"; //default

            if (eformXml != null && eformXml.HasChildNodes)
            {
                // take data from xml and make it legible
                ParseEFormData(eformXml);

                // return the formatted html string
                genericOutputString = this.GetOutputStrings();
            }
            return genericOutputString;
        }

        // get eform xml
        private XmlDocument GetXmlRecord(int eformId)
        {
            string eformXml = "";

            EFormController ctr = new EFormController();

            DataSet ds = ctr.GetRecord(eformId);

            if (ds.Tables[0].Rows.Count > 0)
            {
                eformXml = ds.Tables[0].Rows[0][EForm.EFormXML].ToString();
            }

            XmlDocument xDoc = new XmlDocument();

            xDoc.LoadXml(eformXml);

            return xDoc;
        }


        // loop over nodes
        private void ParseEFormData(XmlDocument xDoc)
        {
            XmlNodeList eformNodes = xDoc.SelectNodes("//*");

            foreach (XmlNode parentNode in eformNodes)
            {
                if (parentNode.Name != "eform" && parentNode.Name != "eformSection")
                {
                    // find out if a node is a parent node by checking that it has children and the children are elements- not TEXT!  
                    if (parentNode.HasChildNodes && parentNode.ChildNodes.Count > 0 && parentNode.FirstChild.NodeType.Equals(XmlNodeType.Element))
                    {
                        GetNodes(parentNode);
                    }

                }
            }
        }


        // combine string of table names and values with string of no record message
        private string GetOutputStrings()
        {
            BuildNoRecordOutputString();

            return _sb.ToString();
        }


        // get parent and child nodes with values
        private void GetNodes(XmlNode parentNode)
        {
            // we only want to display parent and child nodes if the child nodes have at least one value

            if (parentNode.InnerText != "")
            {
                BuildOpeningTags();

                AppendParentNodeName(parentNode);

                AppendChildNodesOfParent(parentNode);

                BuildClosingTags();
            }
            else
            {
                this.AddRecordToEmptyList(parentNode.Name);
            }
        }


        // create list of records that are empty
        private void AddRecordToEmptyList(string tableName)
        {
            // only add distinct table names to this list
            if (!_emptyRecordsList.Contains(tableName))
            {
                _emptyRecordsList.Add(tableName);
            }
        }


        // create list of records that are have at least one value
        private void AddRecordToFullList(string tableName)
        {
            // only add distinct table names to this list
            if (!_fullRecordsList.Contains(tableName))
            {
                _fullRecordsList.Add(tableName);
            }
        }


        // append the labels of the parent nodes
        private void AppendParentNodeName(XmlNode parentNode)
        {
            string tableRecordNum = "";

            if (parentNode.Attributes["RecordId"] != null)
            {
                tableRecordNum = parentNode.Attributes["RecordId"].Value;
            }

            string tableLabel = GetTableLabelByTableName(parentNode.Name);

            this.AddRecordToFullList(parentNode.Name);

            this.BuildParentOutputString(tableLabel, tableRecordNum);
        }


        // append the labels of the child nodes and their values
        private void AppendChildNodesOfParent(XmlNode parentNode)
        {

            MetadataDa mda = new MetadataDa();
            DataTable dt = mda.GetFieldMetadataByTableName(parentNode.Name);

            bool isEvenChildRow = false;  // using this to simulate style options available in a repeater - jf

            foreach (XmlNode childNode in parentNode)
            {
                // we want to display ONLY child nodes where at least one node within the record has a value ( xml considers a value within an element a child node)

                if (childNode.HasChildNodes.Equals(false) || (childNode.Value != "" && !childNode.FirstChild.NodeType.Equals(XmlNodeType.Element)))// && childNode.ChildNodes.Count > 0 && childNode.FirstChild.NodeType.Equals(XmlNodeType.Element) ) //ChildNodes.Count > 1) // NEED TO ADD CLAUSE HERE TO FIND OUT IF CHILD NODE IS A VALUE
                {
                    string s = GetFieldLabel(dt, childNode.Name);

                    string[] labelAndDescription = s.Split(new Char[] { '|' });

                    string label = labelAndDescription[0];

                    string description = "";

                    if (labelAndDescription.Length == 2)
                        description = labelAndDescription[1];

                    string recordId = "";

                    if (childNode.ParentNode.Attributes["RecordId"] != null)
                    {
                        recordId = parentNode.Attributes["RecordId"].Value;
                    }

                    // write string
                    this.BuildChildOutputString(label, description, childNode.Name, childNode.InnerText, recordId, isEvenChildRow);

                    isEvenChildRow = !isEvenChildRow;

                }
            }
        }

        // get label for table name
        private string GetTableLabelByTableName(string tableName)
        {
            MetadataDa mda = new MetadataDa();
            DataTable dt = mda.GetFieldsByTableName(tableName);
            if (dt.Rows.Count > 0 && dt.Rows[0][MetadataTable.TableLabel_Field].ToString() != "")
                return dt.Rows[0][MetadataTable.TableLabel_Field].ToString();
            else
                return tableName;
        }

        // get the label and field description for the given column name
        private string GetFieldLabel(DataTable metaDataTable, string fieldName)
        {
            string fieldLabel = CICHelper.GetFieldAttributeValue(metaDataTable, fieldName, "FieldLabel");
            return fieldLabel;
        }

       
        # region FORMATTING OF OUTPUT

        // format opening tags of current table record
        private void BuildOpeningTags()
        {
            _sb.Append("<table width=\"420\">");
        }

        // format closing tags of current table record
        private void BuildClosingTags()
        {
            _sb.Append("</table></td></tr></table>");
        }

        // display message for records that have no values, AND have no siblings with VALUES
        private void BuildNoRecordOutputString()
        {
            BuildOpeningTags();

            _sb.Append("<tr><td><br/><br/><br/><span class=\"EFormVerifySectionTitle\">No data was recorded for the following:</span></td></tr>");

            foreach (object o in _emptyRecordsList)
            {
                if (!_fullRecordsList.Contains(o))
                {
                    _sb.Append("<tr height=\"22\" class=\"eformVerifyTableRow1\"><td>" + o.ToString() + "</td></tr>");
                }
            }

            BuildClosingTags();
        }


        // add formatted parent values to output string
        private void BuildParentOutputString(string tableLabel, string recordId)
        {

            if (recordId.Length > 0 && int.Parse(recordId) > 1)
            {
                _sb.Append("<tr><td><table width=\"100%\" cellpadding=\"4\" cellspacing=\"0\" style=\"border: solid 1px #cccccc;\"> ");
            }
            else
            {
                _sb.Append("<tr><td><br/><br/><span class=\"EFormVerifySectionTitle\">" + tableLabel + "</span><br/><table width=\"100%\" cellpadding=\"4\" cellspacing=\"0\" style=\"border: solid 1px #cccccc;\"> ");
            }

        }

        // TODO: we probably need to add table name (parentNode.Name) and then call the LoadComponentByTableAndField function
        // add formatted child values to output string
        private void BuildChildOutputString(string fieldLabel, string fieldDesc, string nodeName, string nodeValue, string recordId, bool isEvenChildRow)
        {
            // LoadComponentByField js function in ReviewEFormContainer.aspx takes the name of the field/node, an anchor tag which doesn't apply here, and a recordid if one exists for the parent of this node
            string className = "";
            if (isEvenChildRow)
            {
                className = "eformVerifyTableRow1";
            }
            else
            {
                className = "eformVerifyTableRow2";
            }

            string jsEvents = "";
            if (_enableForEditing)
            {
                jsEvents = "onClick=\"parent.LoadComponentByField('" + nodeName + "', '', '" + recordId + "')\" onMouseOver=\"this.className='eformVerifyTableCellHighlight';\"  onMouseOut=\"this.className='" + className + "';\"";
            }
            _sb.Append("<tr class=\"" + className + "\" " + jsEvents + "> <td width=\"50%\" valign=\"top\" title=\"" + fieldDesc + "\"><strong>" + fieldLabel + "</strong></td><td width=\"50%\"><span >" + nodeValue + "</span></td></tr>");
        }
    }
        # endregion
}