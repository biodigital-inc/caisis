using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;

using Caisis.BOL;
using Caisis.DataAccess;

using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class Dataset_Edit : AdminBasePage
    {
        private static readonly IEnumerable<string> DIMENSION_DROPDOWNS = new string[] { "Diseases", "Institutions", "Protocols", "Categories" };

        private string _pathToXmlDoc = "~/App_Data/DataSets.xml";
        private XmlDocument xDoc = new XmlDocument();

        private string PathToXmlDoc
        {
            get { return Server.MapPath(_pathToXmlDoc); }
        }

        protected string QueryDatasetId
        {
            get
            {
                return Request.QueryString["datasetId"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            xDoc.Load(PathToXmlDoc);

            if (!Page.IsPostBack)
            {
                BuildDimensions();

                int? datasetId = null;
                // edit existing
                if (!string.IsNullOrEmpty(QueryDatasetId))
                {
                    datasetId = int.Parse(QueryDatasetId);
                }
                EditDataset(datasetId);
            }
        }

        #region event handlers

        protected void SaveClick(object sender, EventArgs e)
        {
            int? datasetId = null;
            if (!string.IsNullOrEmpty(DatasetIdField.Value))
            {
                datasetId = int.Parse(DatasetIdField.Value);
            }
            Save(datasetId);
        }

        protected void DeleteClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QueryDatasetId))
            {
                BOL.Dataset biz = new Dataset();
                biz.Delete(int.Parse(QueryDatasetId));
                Response.Redirect("Dataset_List.aspx");
            }
        }

        #endregion

        private void Save(int? datasetId)
        {
            Dataset biz = new Dataset();
            // update, else insert
            if (datasetId.HasValue)
            {
                biz.Get(datasetId.Value);
            }
            // fill with dataset values
            CICHelper.SetBOValues(DatasetEditPanel.Controls, biz, -1);
            // udpate
            biz.Save();
            datasetId = (int)biz[biz.PrimaryKeyName];
            DatasetIdField.Value = datasetId.ToString();

            // update disease mapping
            DiseaseController ct = new DiseaseController();
            if (!string.IsNullOrEmpty(DatasetDiseaseAttributeValueId.Value))
            {
                DiseaseAttributeValue diseaseAttributeValue = new DiseaseAttributeValue();
                diseaseAttributeValue.Get(int.Parse(DatasetDiseaseAttributeValueId.Value));
                // if value empty, delete existing
                if (string.IsNullOrEmpty(Diseases_DropDown.Value))
                {
                    diseaseAttributeValue.Delete(int.Parse(DatasetDiseaseAttributeValueId.Value));

                    // reset key
                    DatasetDiseaseAttributeValueId.Value = string.Empty;
                }
                // other updateing
                else
                {
                    diseaseAttributeValue[DiseaseAttributeValue.DiseaseAttributeValue_Field] = datasetId;
                    diseaseAttributeValue.Save();
                }
            }
            else
            {
                // insert only if disease is selected
                if (!string.IsNullOrEmpty(Diseases_DropDown.Value))
                {
                    int diseaseId = int.Parse(Diseases_DropDown.Value);
                    int? diseaseAttributeId = null;
                    var diseaseAttribute = ct.GetDiseaseAttribute(Dataset.DatasetId);
                    if (diseaseAttribute != null)
                    {
                        diseaseAttributeId = (int)diseaseAttribute[diseaseAttribute.PrimaryKeyName];
                    }
                    else
                    {
                        diseaseAttribute = ct.CreateDiseaseAttribute(Dataset.DatasetId);
                        diseaseAttributeId = (int)diseaseAttribute[diseaseAttribute.PrimaryKeyName];
                    }
                    // insert
                    DiseaseAttributeValue datasetAttributeValue = ct.CreateDiseaseAttributeValue(diseaseId, diseaseAttributeId.Value, datasetId.ToString());
                    // update pri key
                    DatasetDiseaseAttributeValueId.Value = datasetAttributeValue[DiseaseAttributeValue.DiseaseAttributeValueId].ToString();
                }
            }

            // repopulate fields
            EditDataset(datasetId.Value);
        }

        /// <summary>
        /// Builds a list of available datasets
        /// </summary>
        private void EditDataset(int? datasetId)
        {
            // set visibility
            DatasetEditPanel.Visible = true;
            DeleteBtn.Visible = datasetId.HasValue;

            // set hidden field
            DatasetIdField.Value = datasetId.ToString();

            // populate dataset fields
            if (datasetId.HasValue)
            {
                Dataset biz = new Dataset();
                biz.Get(datasetId.Value);
                CICHelper.SetFieldValues(DatasetEditPanel.Controls, biz);
                // manually set dataset id
                DatasetId.Text = biz[Dataset.DatasetId].ToString();

                // set dimensions
                var datasetNode = GetDataSetXmlNode(datasetId.Value.ToString());
                if (datasetNode != null)
                {
                    var lookup = GetDimensionsDropDown();
                    var dimensions = datasetNode.SelectNodes("dimension");
                    foreach (XmlElement dNode in dimensions)
                    {
                        string dimType = dNode.Attributes["type"].Value;
                        string dimValue = dNode.Attributes["value"].Value;
                        string searchType = dimType == "Category" ? "Categories" : dimType + "s";
                        if (lookup.ContainsKey(searchType))
                        {
                            var dropDown = lookup[searchType];
                            dropDown.Value = dimValue;
                        }
                    }
                }
            }

            // poulate dataset diseas attributes
            DiseaseController ct = new DiseaseController();
            DiseaseAttributeValue diseaseAttributeValue = ct.GetDiseaseAttributeValue(Dataset.DatasetId, datasetId.ToString());
            if (diseaseAttributeValue != null)
            {
                CICHelper.SetFieldValues(DatasetEditPanel.Controls, diseaseAttributeValue);
            }

            if (datasetId.HasValue)
            {
                DatasetTitle.Text = DatasetName.Text;
            }
            else
            {
                DatasetTitle.Text = "New Dataset";
            }
        }

        /// <summary>
        /// Builds a list of available dimensions
        /// </summary>
        private void BuildDimensions()
        {
            // dynamically build dimensions (generic)
            var dropDowns = GetDimensionsDropDown();
            foreach (var dropDown in dropDowns)
            {
                string table = dropDown.Key;
                CaisisSelect dimensionDropDown = dropDown.Value;
                // get all items, sort and build drop down
                DataView dimensionsDataSource = BOL.BusinessObject.GetAllAsDataView(table);
                string sortField = dimensionDropDown.DataTextField;
                dimensionsDataSource.Sort = sortField + " ASC";
                // build list of dimension values
                dimensionDropDown.DataSource = dimensionsDataSource;
                dimensionDropDown.DataBind();
            }
        }

        /// <summary>
        /// Returns a list of drop down lists by table name
        /// </summary>
        /// <returns></returns>
        private IDictionary<string, CaisisSelect> GetDimensionsDropDown()
        {
            var lookup = from dimensionTable in DIMENSION_DROPDOWNS
                         let cs = this.FindControl(dimensionTable + "_DropDown") as CaisisSelect
                         where cs != null
                         select new
                         {
                             Dimension = dimensionTable,
                             DropDown = cs
                         };
            return lookup.ToDictionary(a => a.Dimension, a => a.DropDown);
        }

        #region XML

        private XmlNode GetDataSetXmlNode(string id)
        {
            return xDoc.SelectSingleNode("//datasets//dataset[@id='" + id + "']");
        }

        #endregion
    }
}