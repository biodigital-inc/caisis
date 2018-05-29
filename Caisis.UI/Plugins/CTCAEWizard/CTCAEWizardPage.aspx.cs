using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Controller;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core.Classes;
using Caisis.Security;
using Caisis.UI;

namespace Caisis.UI.Plugins.CTCAEWizard
{
    public partial class CTCAEWizardPage : BasePage
    {
        /* uncomment to use metadata label
        private PatientDataEntryController pdec = new PatientDataEntryController();
        */

        /// <summary>
        /// ClientId of field in parent page invoking wizard
        /// </summary>
        protected string ClientToxNameKey
        {
            get
            {
                return Request.QueryString["key"];
            }
        }

        private string MethodName
        {
            get
            {
                return Request.Form["method"];
            }
        }

        public CTCAEWizardPage()
            : base()
        {
            // on pre render set values required for scripts
            this.PreRender += (o, e) => SetFieldValues();
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateAEVersions();
                BuildAdverseClientEventDataSource();
                if (!string.IsNullOrEmpty(MethodName))
                {
                    Build();
                }
            }
        }

        /// <summary>
        /// Returns the field label based on metadata, else default field label
        /// </summary>
        /// <param name="fieldName"></param>
        /// <param name="defaultFieldName"></param>
        /// <returns></returns>
        protected string GetToxFieldLabel(string fieldName, string defaultFieldLabel)
        {
            /* uncomment to use metadata label
            string fieldLabel = pdec.GetFieldLabel("Toxicities", fieldName);
            return !string.IsNullOrEmpty(fieldLabel) ? fieldLabel : defaultFieldLabel;
            */
            return defaultFieldLabel;
        }

        private void Build()
        {
            int saeId = int.Parse(Request.Form["saeId"]);
            CTCAEDa ae = new CTCAEDa();
            DataView dv = ae.GetToxAdverseEventGrades(saeId).Tables[0].DefaultView;

            GradeRptr.DataSource = dv;
            GradeRptr.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        private void BuildAdverseClientEventDataSource()
        {
            if (!string.IsNullOrEmpty(Versions.Value))
            {
                int? currentCatId = null;
                if(!string.IsNullOrEmpty(Categories.Value))
                {
                    currentCatId = int.Parse(Categories.Value);
                }
                CTCAEDa da = new CTCAEDa();
                int termId = int.Parse(Versions.Value);
                DataTable dt = da.DoToxAdverseEventSearch(termId, "");
                var data = from row in dt.AsEnumerable()
                           let catId = (int)row["AE_CategoryID"]
                           let sae = PageUtil.EscapeSingleQuotes(row["ToxDesc"].ToString())
                           let saeId = (int)row["CTC_AE_Toxicity_TermID"]
                           let filter = currentCatId.HasValue ? currentCatId == catId : true
                           where filter
                           select "{ value: '" + sae + "', value: '" + sae + "', saeId: '" + saeId + "', catId: '" + catId + "'}";
                // create CSV, list of json objects
                string SAE_DATA = "var SAE_DATA = [" + string.Join(",", data.ToArray()) + "];";
                // register client data source
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "SAE_DATA", SAE_DATA, true);
            }
        }

        #region BUILD LISTS

        /// <summary>
        /// Build a list of Versions
        /// </summary>
        private void PopulateAEVersions()
        {
            CTCAEDa ae = new CTCAEDa();
            DataView view = ae.GetCTCAETerminlogyVersions().Tables[0].DefaultView;

            Versions.DataSource = view;
            Versions.DataBind();

            // determine default version id
            UserController uc = new UserController();
            string defaultToxId = uc.GetUserAttributeValue("AE_TerminologyID");
            if (!string.IsNullOrEmpty(defaultToxId))
            {
                Versions.Value = defaultToxId;
            }

            // hide next steps
            //CategoryTable.Visible = false;
            //ToxicityTable.Visible = false;
            //GradeTable.Visible = false;

            PopulateAECategories();
            BuildAdverseClientEventDataSource();
        }

        /// <summary>
        /// Build a list of categories based on selected version
        /// </summary>
        private void PopulateAECategories()
        {
            string verId = Versions.Value;

            if (!string.IsNullOrEmpty(verId))
            {
                int versionId = int.Parse(verId);
                CTCAEDa ae = new CTCAEDa();
                DataView view = ae.GetToxCategories(versionId).Tables[0].DefaultView;

                Categories.DataSource = view;
                Categories.DataBind();

                //CategoryTable.Visible = true;

                // update default version id
                UserController uc = new UserController();
                if (!string.IsNullOrEmpty(verId))
                {
                    uc.UpdateUserAttribute("AE_TerminologyID", verId, "Default Terminology ID");
                }
            }
            else
            {
                Categories.Items.Clear();
                //CategoryTable.Visible = false;
            }

            // hide next steps
            //ToxicityTable.Visible = false;
            //GradeTable.Visible = false;
        }

        /// <summary>
        /// Build a list of Adverse Events based on selected version
        /// </summary>
        private void PopulateAEs()
        {
            string catId = Categories.Value;
            if (!string.IsNullOrEmpty(catId))
            {
                int categoryId = int.Parse(catId);

                CTCAEDa ae = new CTCAEDa();
                DataView view = ae.GetToxCategoryAdverseEvents(categoryId).Tables[0].DefaultView;

                //SAESelect.DataSource = view;
                //SAESelect.DataBind();

                //ToxicityTable.Visible = true;
            }
            else
            {
                //SAESelect.Items.Clear();

                //ToxicityTable.Visible = false;
            }

            // hide next step
            //GradeTable.Visible = false;
        }

        /// <summary>
        /// Build a list of grades based on selected SAE
        /// </summary>
        private void PopulateGrades()
        {
            //string saeId = SAESelect.Value;
            //if (!string.IsNullOrEmpty(saeId))
            //{
            //    int adverseEventId = int.Parse(saeId);
            //    CTCAEDa ae = new CTCAEDa();
            //    DataView dv = ae.GetToxAdverseEventGrades(adverseEventId).Tables[0].DefaultView;
            //    GradeGrid.DataSource = dv;
            //    GradeGrid.DataBind();

            //    if (dv.Count > 0)
            //    {
            //        //GradeTable.Visible = true;
            //    }
            //    else
            //    {
            //        //GradeTable.Visible = false;
            //    }
            //}
            //else
            //{
            //    //GradeTable.Visible = false;
            //}

            //// reset selected item
            //GradeGrid.SelectedIndex = -1;
            //// clean active grade
            //ToxGradeValue.Value = string.Empty;
        }

        #endregion

        #region EVENT HANDLERS

        protected void SetGradeSelection(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // add on click
                string grade = DataBinder.Eval(e.Row.DataItem, "AE_Grade").ToString();
                e.Row.Attributes["onclick"] = "setGradeAndLoad('" + PageUtil.EscapeSingleQuotes(grade) + "');";
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SelectedScaleChange(object sender, EventArgs e)
        {
            PopulateAECategories();
            BuildAdverseClientEventDataSource();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SelectedCategoryChange(object sender, EventArgs e)
        {
            PopulateAEs();
            BuildAdverseClientEventDataSource();
            SAESearch.Value = string.Empty;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SelectedAdverseEventChange(object sender, EventArgs e)
        {
            PopulateGrades();
            BuildAdverseClientEventDataSource();
        }

        #endregion       

        /// <summary>
        /// Sets the hidden field values for populating source form
        /// </summary>
        private void SetFieldValues()
        {
            //// SET FIELDS VALUES based on visible cascading controls
            //// set version
            ToxScaleValue.Value = Versions.SelectedItem != null ? Versions.SelectedItem.Text : string.Empty;
            //// set category
            //ToxCategoryValue.Value = CategoryTable.Visible && Categories.SelectedItem != null ? Categories.SelectedItem.Text : string.Empty;
            //// set tox name
            //ToxNameValue.Value = ToxicityTable.Visible && SAESelect.SelectedItem != null ? SAESelect.SelectedItem.Text : string.Empty;
            //// set grade (selected row of grade grid indicates active grade, use datakey AE_Grade)
            //ToxGradeValue.Value = GradeTable.Visible && GradeGrid.SelectedDataKey != null ? GradeGrid.SelectedDataKey.Value.ToString() : string.Empty;
        }
    }
}