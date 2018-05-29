using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;

using Caisis.DataAccess;
using Caisis.BOL;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
    /// <summary>
    /// Summary description for AdminDatasets.
    /// </summary>
    public partial class AdminDatasets : AdminBasePage
    {
        private string _pathToXmlDoc = "~/App_Data/DataSets.xml";
        private XmlDocument xDoc = new XmlDocument();
        private string[] listOfDropDownNames = new string[] { "All", "Institution", "Physician", "Protocol", "Disease" };

        private static readonly string AUTO_GENERATED_DATASET_TEXT = "auto-generated";

        /// <summary>
        /// Gets the path to the DataSet xml document
        /// </summary>
        private string PathToXmlDoc
        {
            get { return Server.MapPath(_pathToXmlDoc); }
        }

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            xDoc.Load(PathToXmlDoc);
            if (Request.QueryString["delete"] != null && Request.QueryString["delete"].Equals("yes"))
            {
                DeleteDataSet(Request.QueryString["datasetId"].ToString());
            }
            ShowDatasetList();
        }

        protected bool ValidateDataset(string id)
        {
            return GetDataSetXmlNode(id) != null;
        }

        #region CLICK EVENTS

        protected void AddNewRecordClick(object sender, CommandEventArgs e)
        {
            SetCurrentDropDown("All", "");
            DatasetId.Value = AUTO_GENERATED_DATASET_TEXT;
            DatasetName.Value = string.Empty;
            ShowAddRecordTable();
        }

        protected void AddButtonClick(object sender, CommandEventArgs e)
        {
            HandleInsertUpdateClick(sender, e);
        }

        protected void UpdateButtonClick(object sender, CommandEventArgs e)
        {
            HandleInsertUpdateClick(sender, e);
        }

        private void HandleInsertUpdateClick(object sender, CommandEventArgs e)
        {
            string dsId = DatasetId.Value;
            string dsName = DatasetName.Value;
            string dimType = DimensionTypeDrownDown.Items[DimensionTypeDrownDown.SelectedIndex].Value;
            DropDownList selectedDropDown = (DropDownList)this.Page.FindControl(dimType + "DropDown");
            string dimValue = selectedDropDown.SelectedValue;
            byte isActive = (byte)(DatasetActive.Checked ? 1 : 0);

            int keyOnSave = SaveDataSet(dsId, dsName, isActive, dimType, dimValue);

            if (keyOnSave != -1)
            {
                string xmlBlock = Server.HtmlEncode("<dataset id=\"" + keyOnSave + "\" name=\"" + dsName + "\">") + "<br />";
                if (dimType == "Physician")
                {
                    string[] phyNames = selectedDropDown.SelectedItem.Text.Split(",".ToCharArray());
                    string fName = phyNames[1];
                    string lName = phyNames[0];
                    xmlBlock = xmlBlock + Server.HtmlEncode(" <dimension type=\"" + dimType + "\" value=\"" + lName + "\" value2=\"" + fName + "\" />") + "<br />";
                }
                else
                {
                    xmlBlock = xmlBlock + Server.HtmlEncode(" <dimension type=\"" + dimType + "\" value=\"" + dimValue + "\" />") + "<br />";
                }
                xmlBlock = xmlBlock + Server.HtmlEncode("</dataset>");
                XMLBlock.Text = xmlBlock;

                ShowXmlPanel();

                //this.ShowDatasetList();
            }
            else
            {
                ShowAddRecordTable();
                ErrorMessage.InnerText = "Please verify that you entered a value for all fields.";
            }
        }

        protected void EditButtonClick(object sender, CommandEventArgs e)
        {
            ShowAddRecordTable();

            int dsId = int.Parse(e.CommandArgument.ToString());

            Dataset biz = new Dataset();
            biz.Get(dsId);

            //if (biz.RecordCount > 0)
			if (!biz.IsEmpty)
            {
                DatasetId.Value = dsId.ToString();
                DatasetName.Value = biz[Dataset.DatasetName].ToString();

                string isActiveString = biz[Dataset.DatasetActive].ToString();
                byte isDSActive;
                if (byte.TryParse(isActiveString, out isDSActive))
                {
                    DatasetActive.Checked = isDSActive != byte.MinValue;
                }
                else
                {
                    DatasetActive.Checked = false;
                }

                XmlNode currentNode = GetDataSetXmlNode(dsId.ToString());
                if (currentNode != null)
                {
                    currentNode = currentNode.SelectSingleNode("dimension");
                    string dimType = currentNode.Attributes["type"].Value;
                    string dimValue = currentNode.Attributes["value"].Value;
                    SetCurrentDropDown(dimType, dimValue);
                }
            }
        }

        protected void DeleteButtonClick(object sender, CommandEventArgs e)
        {
            RepeaterDiv.Visible = false;

            GroupDatasetDa groupDatasetDa = new GroupDatasetDa();
            int datasetId = int.Parse(e.CommandArgument.ToString());
            DataSet ds = groupDatasetDa.GetGroupsInDataset(datasetId);
            string numberOfGroups = "";

            if (ds.Tables[0].Rows.Count > 0)
            {
                numberOfGroups = ds.Tables[0].Rows[0]["GroupCount"].ToString();

                valMsg.Text = "There are " + numberOfGroups + " user group(s) associated with this dataset. By deleting it you are removing all the associations with these groups, and therefore users within those groups will no longer be able to access this set of patients.<br><br>Are you sure you want to delete it?";
            }
            else
            {
                valMsg.Text = "There are currently no groups associated with this dataset.  Confirm delete?";
            }
            valMsg.Text += "<br><br><a href=\"AdminDatasets.aspx?delete=yes&datasetId=" + datasetId + "\">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"AdminDatasets.aspx\">No</a>";
        }

        #endregion

        #region CRUD Operations

        /// <summary>
        /// Handles inserting and updating of Datasets in DB and in xml
        /// </summary>
        /// <param name="newId"></param>
        /// <param name="datasetName"></param>
        /// <param name="isActive"></param>
        /// <param name="dimensionType"></param>
        /// <param name="dimensionValue"></param>
        /// <returns></returns>
        private int SaveDataSet(string dsId, string datasetName, byte isActive, string dimensionType, string dimensionValue)
        {
            Dataset biz = new Dataset();
            // Determine if updating
            if (!dsId.Equals(AUTO_GENERATED_DATASET_TEXT))
            {
                biz.Get(int.Parse(dsId));
            }

            biz[Dataset.DatasetName] = datasetName;
            biz[Dataset.DatasetActive] = isActive;
            biz.Save();

            int insertedKey = int.Parse(biz[Dataset.DatasetId].ToString());
            return insertedKey;
        }

        private void DeleteDataSet(string dsId)
        {
            Dataset pds = new Dataset();
            pds.Delete(int.Parse(dsId));
            DeleteFromXml(dsId);
        }

        #endregion

        #region UI Helpers

        protected void ShowAddRecordTable()
        {
            RepeaterDiv.Visible = false;
            AddDatasetsTable.Visible = true;
            UpdateBtn.Visible = false;
            AddBtn.Visible = true;
            XmlPanel.Visible = false;
        }

        protected void ShowDatasetList()
        {
            RepeaterDiv.Visible = true;
            AddDatasetsTable.Visible = false;
            XmlPanel.Visible = false;

            DataSetDa da = new DataSetDa();
            DataSet ds = da.GetDatasets();
            rptDatasets.DataSource = ds.Tables[0].DefaultView;
            rptDatasets.DataBind();
        }

        protected void ShowXmlPanel()
        {
            RepeaterDiv.Visible = false;
            AddDatasetsTable.Visible = false;
            XmlPanel.Visible = true;
        }

        private void SetCurrentDropDown(string type, string value)
        {
            DropDownList list = (DropDownList)Page.FindControl(type + "DropDown");
            foreach (string s in listOfDropDownNames)
            {
                DropDownList tmp = (DropDownList)Page.FindControl(s + "DropDown");
                if (tmp == list)
                {
                    PageUtil.SelectDropDownItem(DimensionTypeDrownDown, type);
                    tmp.DataBind();
                    PageUtil.SelectDropDownItem(list, value);
                    tmp.Style["display"] = "block";
                }
                else
                {
                    tmp.Style["display"] = "none";
                }
            }
        }

        protected void FormatPhysicianName(object sender, EventArgs e)
        {
            foreach (ListItem item in (sender as DropDownList).Items)
            {
                string first = item.Text;
                string last = item.Value;
                item.Text = last + "," + first;
            }
        }
        #endregion

        #region XML Helpers

        private XmlNode GetDataSetXmlNode(string id)
        {
            return xDoc.SelectSingleNode("//datasets//dataset[@id='" + id + "']");
        }

        private void UpdateXmlValues(string oldDataSetId, string newDataSetId, string dataSetName, string dimensionType, string dimensionValue)
        {
            if (!string.IsNullOrEmpty(newDataSetId))
            {
                XmlNode dataSetNode = GetDataSetXmlNode(oldDataSetId);
                if (dataSetNode != null)
                {
                    if (!string.IsNullOrEmpty(newDataSetId) && !string.IsNullOrEmpty(dataSetName))
                    {
                        dataSetNode.Attributes["id"].Value = newDataSetId;
                        dataSetNode.Attributes["name"].Value = dataSetName;
                        XmlNode dimensionNode = dataSetNode.SelectSingleNode("dimension");
                        if (dimensionNode != null && !string.IsNullOrEmpty(dimensionType) && !string.IsNullOrEmpty(dimensionValue))
                        {
                            dimensionNode.Attributes["type"].Value = dimensionType;
                            dimensionNode.Attributes["value"].Value = dimensionValue;
                        }
                    }
                }
                else
                {
                    XmlNode newDataSetNode = xDoc.CreateElement("dataset");
                    XmlNode newDimensionNode = xDoc.CreateElement("dimension");
                    XmlNode root = xDoc.SelectSingleNode("//datasets");
                    if (root != null)
                    {
                        root.AppendChild(newDataSetNode);
                        newDataSetNode.AppendChild(newDimensionNode);

                        XmlAttribute dataSetAttId = xDoc.CreateAttribute("id");
                        dataSetAttId.Value = newDataSetId;
                        XmlAttribute dataSetAttName = xDoc.CreateAttribute("name");
                        dataSetAttName.Value = dataSetName;
                        newDataSetNode.Attributes.Append(dataSetAttId);
                        newDataSetNode.Attributes.Append(dataSetAttName);

                        XmlAttribute dimensionAttType = xDoc.CreateAttribute("type");
                        dimensionAttType.Value = dimensionType;
                        XmlAttribute dimensionAttVal = xDoc.CreateAttribute("value");
                        dimensionAttVal.Value = dimensionValue;
                        newDimensionNode.Attributes.Append(dimensionAttType);
                        newDimensionNode.Attributes.Append(dimensionAttVal);
                    }
                }
                SaveXmlDoc();
            }
        }

        private void DeleteFromXml(string dataSetId)
        {
            XmlNode nodeToRemove = GetDataSetXmlNode(dataSetId);
            if (nodeToRemove != null)
            {
                nodeToRemove.ParentNode.RemoveChild(nodeToRemove);
                SaveXmlDoc();
            }
        }

        private bool SaveXmlDoc()
        {
            // As of 4.1, supress saving to xml, as issues with write permissions
            return true;
            try
            {
                xDoc.Save(PathToXmlDoc);
                return true;
            }
            catch (Exception ex)
            {
                Response.Write("There was an error in saving the xml file, please update manually.");
                return false;
            }
        }

        #endregion

    }

}
