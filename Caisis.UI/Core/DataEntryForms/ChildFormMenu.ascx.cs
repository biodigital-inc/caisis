using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Text;
using System.Collections.Generic;
using System.Data;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.Controller;

public partial class Core_DataEntryForms_ChildFormMenu : BaseControl
{
    /*
     * What goes on here? Display of sub form menu options depends on menu attributes in PatientDataEntyConfig.xml
     * By default names of child forms are displayed based on nesting in xml.
     * Some forms also have "more Relevant" forms with optional foreign keys. Links to these relevant forms are displayed above a horizontal rule (ie Operating Room Details & Pathology & Procedures). 
     * Some forms should always show links to child forms, and others, should not show links to child forms when one child already has data (ie Procedures -> ProstatectomuOp)
    */
    private XmlNode _currentNode;
    private string _currentTableName;
    private int _primaryKeyValue;
    private int _parentKeyValue;
    private bool _isParentRecordLocked;
    protected bool _childRecordsExist = false;
    StringBuilder _sbRelevantLinks = new StringBuilder();
    StringBuilder _sbOtherLinks = new StringBuilder();
    private List<string> _relevantTableNames = new List<string>();
    private List<string> _otherTableNames = new List<string>();

    private const string subMenuTitle = "<u>Sub Forms</u><br/>";
    private const string relevantMenuTitle = "<u>Relevant Forms</u><br/>";

    PatientDataEntryController _dataEntryController = new PatientDataEntryController();

    /// <summary>
    /// Controls display of menu containing links to child forms. Menu links driven by PatientDataEntryConfig.xml file. 
    /// </summary>
    /// <param name="formNode">XmlNode containing meta data on current form</param>
    /// <param name="primaryKeyValue">Integer with current record id if it exists</param>
    public void Show(string tableName, int primaryKeyValue, int parentKeyValue, bool isParentRecordLocked)//, List<String> tableNames)
    {
        
        //_currentNode = menuNode;
        _currentTableName = GetActiveTableName(tableName);
        _primaryKeyValue = primaryKeyValue;
        _parentKeyValue  = parentKeyValue;
        _isParentRecordLocked = isParentRecordLocked;
        
        // the sequence in which these methods fire is important!
        GetRelevantTableNames();
        GetOtherTableNames();
//        SetOtherLinks();
        SetRelevantLinks();
        

        if (subFormNavigation.Text != "" || relevantFormNavigation.Text != "")
        {
            this.Visible = true;
            
            //if (_childRecordsExist)
            //{   // show populated icon
            //    SubDataIcon.Src = "../../Images/icon_hasDetails.gif";
            //}
        }

        // show related records
        RelatedRecordController rc = new RelatedRecordController();
        var relatableTables = rc.GetRelatedRecordUtilityTables();
        if (relatableTables.Contains(tableName) && _primaryKeyValue > 0)
        {
            this.Visible = true;
            ShowRelatedRecords(tableName, primaryKeyValue, parentKeyValue, isParentRecordLocked);
        }
    }

    /// <summary>
    /// For the given table, show a list of related records as well as available tables to relate
    /// </summary>
    /// <param name="tableName"></param>
    /// <param name="primaryKeyValue"></param>
    /// <param name="parentKeyValue"></param>
    /// <param name="isParentRecordLocked"></param>
    protected void ShowRelatedRecords(string tableName, int primaryKeyValue, int parentKeyValue, bool isParentRecordLocked)
    {
        if (primaryKeyValue > 0)
        {
            // set url
            RelatedRecordsFrame.Attributes["src"] = "RelatedRecords.aspx?destTableName=" + tableName + "&destTablePrimaryKey=" + primaryKeyValue;
            // build existing related records
            DataView relatedRecords = RelatedRecordController.GetRelatedRecords(tableName, primaryKeyValue).AsDataView<RelatedRecord>();

            RelatedRecordsRptr.DataSource = relatedRecords;
            RelatedRecordsRptr.DataBind();

            // show related records container
            RelatedRecordsContainer.Visible = true;
            RelatedRecordsPopup.Visible = true;
        }
        else
        {
            RelatedRecordsContainer.Visible = false;
            RelatedRecordsPopup.Visible = false;
        }
    }

    // when a child form has been selected, menu items are based on the parent
    private string GetActiveTableName(string tableName)
    {
        //string currentTableName;
        //if (_currentNode.ChildNodes.Count == 0 && _currentNode.ParentNode.Name != "menu")        
        //{
        //    // this form has no children, so show it's siblings if they share the same parent
        //    currentTableName = _currentNode.ParentNode.Attributes["tableName"].Value;
        //}
        //else
        //{
        //    // show links to the child forms
        //    currentTableName = _currentNode.Attributes["tableName"].Value;
        //}
        //return currentTableName;

        string parentTableName = _dataEntryController.GetParentTableName(tableName);
        IEnumerable<string> childTableNames = _dataEntryController.GetChildDataEntryForms(tableName);
        if (childTableNames.Count() == 0 && !string.IsNullOrEmpty(parentTableName))
        {
            return parentTableName;
        }
        else
        {
            return tableName;
        }
    }

    // returns list of tables based on the mostRelevant atribute for the current node
    private void GetRelevantTableNames()
    {
        var tableNameList = _dataEntryController.GetRelevantTableNames(_currentTableName);
        _relevantTableNames.AddRange(tableNameList);
    }

    /// <summary>
    /// Creates list of table names that are either children or siblings of the current xml node
    /// </summary>
    private void GetOtherTableNames()
    {
        //XmlNodeList nodeList;
        //if (_currentNode.ChildNodes.Count == 0 && _currentNode.ParentNode.Name != "menu")
        //{
        //    // current form is already a child so show my sibling forms
        //    nodeList = _currentNode.ParentNode.ChildNodes;
        //}
        //else
        //{
        //    nodeList = _currentNode.ChildNodes; //show the child forms
        //}

        //foreach (XmlNode n in nodeList)
        //{
        //    if (_dataEntryController.IsDisplayInSubMenu(n) && _dataEntryController.IsDisplayInView(n) == true)
        //    {
        //        string tableName = n.Attributes["tableName"].Value;
        //        _otherTableNames.Add(tableName.Trim());
        //    }
        //}

        var childTableNames = _dataEntryController.GetChildDataEntryForms(_currentTableName);
        var siblingTableNames = _dataEntryController.GetSiblingTableNames(_currentTableName);

        var otherTableNames = childTableNames.Count() > 0 ? childTableNames : siblingTableNames;
        _otherTableNames.AddRange(otherTableNames);
    }

     private void SetOtherLinks()
    {
        StringBuilder sb = new StringBuilder();
        //otherTables.ForEach(.....); // could use predicate instead of foreach
        
        foreach (string tableName in _otherTableNames)
        {
            // do not display link if it is the form being displayed or in the list of relevant forms
            if (_relevantTableNames.Contains(tableName) == false)
            {
                //TODO: we need to compare PK and PARENT KEY BEFORE GETTING COUNT

                // verify that the PK of the current table is the FK of the child table
                bool isValidKeyValue = Caisis.BOL.BusinessObject.IsPrimaryKeyForeignKey(_currentTableName, tableName);

                if (isValidKeyValue)
                {
                    int recordCount = _dataEntryController.GetSubFormRecordCount(tableName, _primaryKeyValue);

                    if (recordCount > 0) // if the child or sibling form HAS records then display it with the relevant forms
                    {
                        _childRecordsExist = true;
                        AppendLinkToRelevantForm(tableName.Trim(), _primaryKeyValue, recordCount, true);
                    }
                    else
                    {
                        AppendLinkToOtherForm(tableName.Trim(), _primaryKeyValue, recordCount, true);
                    }
                }
                // the primary key is NOT the foreign key of the other table so... 
                //else
                //{
                 //   SetLinksBasedOnTableRelationship(currentTableName, tableName, _primaryKeyValue);
                //}
            }
        }

        if (_sbOtherLinks.Length > 0) _sbOtherLinks.Insert(0, subMenuTitle);
        subFormNavigation.Text = _sbOtherLinks.ToString();

    }

    private void SetRelevantLinks()
    { 
        string[] validTablesUsedInMapping = new string[] { "Procedures", "Pathology", "OperatingRoomDetails" };
        foreach (string tableName in _relevantTableNames)
        {
              //verify the PK of the current table is the PARENT KEY BEFORE GETTING COUNT and SETTING LINK
              bool isValidKeyValue = Caisis.BOL.BusinessObject.IsPrimaryKeyForeignKey(_currentTableName, tableName);

              if (isValidKeyValue)
              {
                  int recordCount = _dataEntryController.GetSubFormRecordCount(tableName, _primaryKeyValue);
                  AppendLinkToRelevantForm(tableName, _primaryKeyValue, recordCount, true);
                  if (recordCount > 0)
                  {
                      _childRecordsExist = true;
                  }
              }
              else if(validTablesUsedInMapping.Contains(tableName, StringComparer.OrdinalIgnoreCase))
              {
                  SetLinksBasedOnTableRelationship(_currentTableName, tableName, _primaryKeyValue);
              }
        }

        relevantFormNavigation.Text = _sbRelevantLinks.ToString();

       
    }

   
    // define mapping of tables that have OPTIONAL KEYS: 
    // - Procedures to Pathology
    // - Procedures to OperatingRoomDetails
    // - Pathology to OperatingRoomDetails
    private void SetLinksBasedOnTableRelationship(string currentTableName, string tableName, int currentTablePrimaryKeyValue)
    {
        bool isChildForm = false; // none of the forms in this mapping are children of the current table
       

        if (currentTablePrimaryKeyValue == 0) // key value not defined on new forms- just display an active link to relevant forms
        {
            AppendLinkToRelevantForm(tableName, 0, 0, 0, isChildForm);
            return;
        }
        
        Procedure procedure = new Procedure();
        Pathology pathology = new Pathology();
        OperatingRoomDetail orDetail = new OperatingRoomDetail();
        string procedureTableName = procedure.TableName;
        string pathologyTableName = pathology.TableName;
        string orDetailsTableName = orDetail.TableName;

       
        switch (currentTableName)
        {
            case "Procedures":
                // see if this procedure record has an ORDetailId
                if (tableName.Equals(orDetailsTableName))
                {
                    // procedure.Find(Procedure.ProcedureId, currentTablePrimaryKeyValue); // ?
					procedure.Get(currentTablePrimaryKeyValue);
                    int orDetailId = 0;
                    if(procedure[Procedure.OperatingRoomDetailId] != System.DBNull.Value)
                    {
                        orDetailId = (int)procedure[Procedure.OperatingRoomDetailId];
                    }
                    int recordCount  = 0;
                    if(orDetailId > 0)
                    {
                        recordCount = 1; // a procedure can be associated with at most one OperatingRoomDetail record
                    }
                    AppendLinkToRelevantForm(orDetailsTableName, orDetailId, 0, recordCount, isChildForm);
                }

                // see if the pathology table has any record with this procedureId
                else if (tableName.Equals(pathologyTableName))
                {
					//pathology.Find(Pathology.ProcedureId, currentTablePrimaryKeyValue);
					//int recordCount = pathology.RecordCount;
					var conditions = new Dictionary<string, object>(){ { Pathology.ProcedureId, currentTablePrimaryKeyValue } };
					IEnumerable<Pathology> paths = BusinessObject.GetByFields<Pathology>(conditions);
					int recordCount = paths.Count();
                    int recordIndex = 0;
                    if (recordCount > 0) // could be multiple path records all with the same procedure id
                    {
                        for (int i = 0; i < recordCount; i++)
                        {
                            if (recordCount > 1) recordIndex = i + 1;
                          
							//DataRow dr = pathology.DataSourceView.Table.Rows[i];
							//AppendLinkToRelevantForm(pathologyTableName, (int)dr[Pathology.PathologyId], recordIndex, recordCount, isChildForm);

							Pathology p = paths.ElementAt(i);
							AppendLinkToRelevantForm(pathologyTableName, (int) p[Pathology.PathologyId], recordIndex, recordCount, isChildForm);
                        }
                    }
                    else
                    {
                        AppendLinkToRelevantForm(pathology.TableName, recordIndex, recordCount, isChildForm);
                    }
                }
                
                break;

            case "Pathology": 
                // see if this Pathogy Record has an ORDetailID OR a Procedure Id
                if (tableName.Equals(orDetailsTableName))
                {
                    pathology.Get(currentTablePrimaryKeyValue);
                    int orDetailId = 0;
                    if (pathology[Pathology.OperatingRoomDetailId] != System.DBNull.Value)
                    {
                        orDetailId = (int)pathology[Pathology.OperatingRoomDetailId];
                    }
                    int recordCount = 0;
                    if (orDetailId > 0)
                    {
                        recordCount = 1; // a pathology can be associated with at most one OperatingRoomDetail record
                    }
                    AppendLinkToRelevantForm(orDetailsTableName, orDetailId, 0, recordCount, isChildForm);
                }
                
                else if (tableName.Equals(procedureTableName))
                {
                    pathology.Get(currentTablePrimaryKeyValue);
                    int procedureId = 0;
                    if (pathology[Pathology.ProcedureId] != System.DBNull.Value)
                    {
                        procedureId = (int)pathology[Pathology.ProcedureId];
                    }
                    int recordCount = 0;
                    if (procedureId > 0)
                    {
                        recordCount = 1; // a pathology can be associated with at most one pathology record
                    }
                    AppendLinkToRelevantForm(procedureTableName, procedureId, 0, recordCount, isChildForm);
                }

                break;

            case "OperatingRoomDetails": 
            // see if the Procedures table and the Pathology table have records with this ORDetailId
                if (tableName.Equals(pathologyTableName))
                {
					//pathology.Find(Pathology.OperatingRoomDetailId, currentTablePrimaryKeyValue);
					//int recordCount = pathology.RecordCount;
					var conditions = new Dictionary<string, object>() { { Pathology.OperatingRoomDetailId, currentTablePrimaryKeyValue } };
					IEnumerable<Pathology> paths = BusinessObject.GetByFields<Pathology>(conditions);
					int recordCount = paths.Count();
                    int recordIndex = 0;
                    if (recordCount > 0) // could be multiple path records all with the same procedure id
                    {               
                        for (int i = 0; i < recordCount; i++)
                        {
                            if (recordCount > 1) recordIndex = i + 1;
							//DataRow dr = pathology.DataSourceView.Table.Rows[i];
							//AppendLinkToRelevantForm(pathologyTableName, (int)dr[Pathology.PathologyId], recordIndex, recordCount, isChildForm);
							Pathology p = paths.ElementAt(i);
							AppendLinkToRelevantForm(pathologyTableName, (int) p[Pathology.PathologyId], recordIndex, recordCount, isChildForm);
                        }
                    }
                    else
                    {
                        AppendLinkToRelevantForm(pathologyTableName, recordIndex, recordCount, isChildForm);
                    }
                }
                else if (tableName.Equals(procedureTableName))
                {
					//procedure.Find(Procedure.OperatingRoomDetailId, currentTablePrimaryKeyValue);
					//int recordCount = procedure.RecordCount;
					var conditions = new Dictionary<string, object>() { { Procedure.OperatingRoomDetailId, currentTablePrimaryKeyValue } };
					IEnumerable<Procedure> procs = BusinessObject.GetByFields<Procedure>(conditions);
					int recordCount = procs.Count();
                    int recordIndex = 0;
                    if (recordCount > 0) // could be multiple path records all with the same procedure id
                    {
                        
                        for (int i = 0; i < recordCount; i++)
                        {
                            if (recordCount > 1) recordIndex = i + 1;
							//DataRow dr = procedure.DataSourceView.Table.Rows[i];
							//AppendLinkToRelevantForm(procedureTableName, (int)dr[Procedure.ProcedureId], recordIndex, recordCount, isChildForm);
							Procedure p = procs.ElementAt(i);
							AppendLinkToRelevantForm(procedureTableName, (int) p[Procedure.ProcedureId], recordIndex, recordCount, isChildForm);
                        }
                    }
                    else
                    {
                        AppendLinkToRelevantForm(procedureTableName, recordIndex, recordCount, isChildForm);
                    }
                }

                break;

            default:
                break;

        }


        // use switch
    }

    private void AppendLinkToOtherForm(string tableName, int parentPrimaryKey, int recordCount, bool isChildForm)
    {
        AppendLink(_sbOtherLinks, tableName, parentPrimaryKey, 0, recordCount, isChildForm);
    }

    private void AppendLinkToRelevantForm(string tableName, int primaryKeyValue, int recordCount, bool isChildForm)
    {
        AppendLink(_sbRelevantLinks, tableName, primaryKeyValue, 0, recordCount, isChildForm);
    }

    private void AppendLinkToRelevantForm(string tableName, int primaryKeyValue, int recordNumber, int recordCount, bool isChildForm)
    {
        AppendLink(_sbRelevantLinks, tableName, primaryKeyValue, recordNumber, recordCount, isChildForm);
    }

    private void AppendLink(StringBuilder sb, string tableName, int primaryKeyValue, int recordNumber, int recordCount, bool isChildForm)
    {
        string menuName = ConvertTableNameToMenuName(tableName);
        string displayText = menuName;
        string url = "";
        string link = "<a class=\"RelatedRecordStrength0\">" + displayText + "</a>";

        if (_isParentRecordLocked && recordCount == 0)
        {
            link = "<a class=\"RelatedRecordStrength0\" onclick=\"alert('Sorry, the parent record is locked so edits to child forms are not permitted.')\">" + displayText + "</a>";
        }
        else if (isChildForm == false && recordCount == 0) // this is the case where you want a link to a relevant form that is not a child of the current form (so the link should always be active)
        {
            url = "?tableName=" + tableName;
            link = "<a class=\"RelatedRecordStrength0\" href=\"" + url + "\">" + displayText + "</a>";
        }
        if (primaryKeyValue > 0) // assemble url variables
        {
            url = "?tableName=" + tableName;

            if (isChildForm)
            {
                url += "&parentKey=" + primaryKeyValue;
            }

            if (recordCount > 0)
            {
                url += "&primKey=" + primaryKeyValue;
                
                if (recordNumber > 0) // is some situation when multiple records exist they are output line by line (like one procedure could be associated with multiple pathology records that would be listed separately)
                {
                    displayText += " (" + recordNumber + " of " + recordCount + ")";
                }
                else
                {
                    displayText += " (" + recordCount + ")";
                }
                _childRecordsExist = true;
            }
            else if (isChildForm)
            {
                url += "&newChildRecord=true";
                // if we wanted to default values (like procedure id on the or detail record) this is where we would set the url var using the primary key value
            }

            link = "<a class=\"RelatedRecordStrength5\" href=\"" + url + "\">" + displayText + "</a>";
        }
        sb.Append(link);
    }

    private string ConvertTableNameToMenuName(string tableName)
    {
        //XmlNode node = _currentNode.ParentNode.SelectSingleNode("//menuItem[@tableName='" + tableName.Trim() + "']");
        //string menuName = "";
        //if(node != null)
        //{
        //    menuName = node.Attributes["menuTitle"].Value;
        //}
        //return menuName;
        return _dataEntryController.GetTableLabel(tableName);
    }

    /*
    private string GetMostRelevantFormNames(XmlNode currentNode, int primaryKeyValue)
    {
        StringBuilder sb = new StringBuilder();
        if (currentNode.Attributes["mostRelevantTables"] != null && currentNode.Attributes["mostRelevantTables"].Value != "")
        {
            char[] splitter = { ',' };
            string val = currentNode.Attributes["mostRelevantTables"].Value;
            //val = val.Replace(" ", ""); // no spaces
            string[] tableNameList = val.Split(splitter);

            string referringTableName = currentNode.Attributes["tableName"].Value;
            string referringFKValue = primaryKeyValue.ToString();
            foreach (string tableName in tableNameList)
            {

                // look at top node and get the tablename from the menu name
                XmlNode node = currentNode.ParentNode.SelectSingleNode("//menuItem[@tableName='" + tableName.Trim() + "']");
                string nenuName = node.Attributes["menuTitle"].Value;
                //sb.Append("<a class=\"PDSublinkTextWData\" href=\"PatientDataEntryContainer.aspx?tableName=" + tableName + "&referringTableName=" + referringTableName + "&referringFKValue=" + referringFKValue + "\">&bull;&nbsp;" + nenuName + "</a><br/>");
                sb.Append("<a class=\"PDSublinkTextWData\" href=\"PatientDataEntryContainer.aspx?tableName=" + tableName.Trim() + "\">&bull;&nbsp;" + nenuName + "</a><br/>");
            }
            sb.Append("<hr classDataEntryLine>");

        }
        return sb.ToString();

    }
    */

    /* private string GetSiblingFormNames(XmlNode currentNode, string parentKeyValue)
     {
         StringBuilder sb = new StringBuilder();
         if (currentNode.Attributes["siblingTables"] != null && currentNode.Attributes["siblingTables"].Value != "")
         {
             char[] splitter = { ',' };
             string val = currentNode.Attributes["siblingTables"].Value;
             string[] tableNameList = val.Split(splitter);

             foreach (string tableName in tableNameList)
             {
                 // look at top node and get the tablename from the menu name
                 XmlNode node = currentNode.ParentNode.SelectSingleNode("//menuItem[@tableName='" + tableName.Trim() + "']");
                 string menuName = node.Attributes["menuTitle"].Value;
                 sb.Append("<a class=\"PDSublinkTextWData\" href=\"PatientDataEntryContainer.aspx?tableName=" + tableName.Trim() + "\">&bull;&nbsp;" + menuName + "</a><br/>");
             }
         }
         return sb.ToString();
     }*/

    /*
    private string GetBrotherFormNames(XmlNode parentNode, int primaryKeyValue)
    {
        StringBuilder sb = new StringBuilder();
        if (parentNode.Attributes["showSiblingSubMenus"] != null && parentNode.Attributes["showSiblingSubMenus"].Value != "")
        {
            char[] splitter = { ',' };
            string val = parentNode.Attributes["showSiblingSubMenus"].Value;
            //val = val.Replace(" ", ""); // no spaces
            string[] formNameList = val.Split(splitter);

            string brotherTableName = parentNode.Attributes["tableName"].Value;
            string brotherFKValue = primaryKeyValue.ToString();
            foreach (string menuName in formNameList)
            {
                
                // look at top node and get the tablename from the menu name
                XmlNode tableNode = parentNode.SelectSingleNode("//menuItem[@menuTitle='" + menuName.Trim() + "']");
                string tableName = tableNode.Attributes["tableName"].Value;
                sb.Append("<a class=\"PDSublinkTextWData\" href=\"PatientDataEntryContainer.aspx?tableName=" + tableName + "&brotherTableName=" + brotherTableName + "&brotherFKValue=" + brotherFKValue + "\">&bull;&nbsp;" + menuName + "</a><br/>");
            }
            sb.Append("<hr classDataEntryLine>");
       
        }
        return sb.ToString();
         
    }
    */

}
