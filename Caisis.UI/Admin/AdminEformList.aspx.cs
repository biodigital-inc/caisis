using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using Caisis.BOL;

namespace Caisis.UI.Admin
{
    public partial class AdminEformList : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BuildEformList(sender, e);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        protected void BuildEformList(object sender, EventArgs e)
        {
            //var staticEForms = from eform in CaisisConfiguration.GetEformsConfigList()
            //                   let eformName = eform.Name
            //                   orderby eformName ascending
            //                   select new
            //                   {
            //                       Name = eformName,
            //                       Disease = eform.Disease,
            //                       EFormType = "static",
            //                       EFormId = ""
            //                   };
            var dynamicEForms = from eform in MetadataEForm.GetAll<MetadataEForm>()
                                let eformName = eform[MetadataEForm.EFormName].ToString()
                                let eformVersionNum = eform[MetadataEForm.EFormVersionNum].ToString()
                                orderby eformName ascending
                                select new
                                {
                                    Name = eformName,
                                    Disease = eform[MetadataEForm.EFormDisease].ToString(),
                                    EFormType = "dynamic",
                                    EFormId = eform[MetadataEForm.MetadataEFormId].ToString(),
                                    Active = eformVersionNum != "0"
                                };
            //var allEForms = from eform in staticEForms.Concat(dynamicEForms)
            //                orderby eform.Name ascending
            //                select eform;

            EFormsRptr.DataSource = dynamicEForms;
            EFormsRptr.DataBind();
        }

        /// <summary>
        /// Updates MetadataEform active bit
        /// </summary>
        protected void UpdateEformActiveBit(object sender, EventArgs e)
        {
            CheckBox activeEformCheckBox = sender as CheckBox;
            HiddenField idField = activeEformCheckBox.NamingContainer.FindControl("MetaEformId") as HiddenField;
            MetadataEForm biz = new MetadataEForm();
            biz.Get(int.Parse(idField.Value));

            // ?? using version number field until true db bit field
            // mark as active
            if (activeEformCheckBox.Checked)
            {
                biz[MetadataEForm.EFormVersionNum] = 1;
            }
            // mark as inactive
            else
            {
                biz[MetadataEForm.EFormVersionNum] = 0;
            }
            biz.Save();
        }
    }
}