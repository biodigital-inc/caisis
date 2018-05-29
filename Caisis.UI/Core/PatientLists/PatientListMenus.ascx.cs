using System;
using System.Data;
using System.Drawing;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.PatientLists
{

    /// <summary>
    ///	Populates Patient Lists page drop down menus with options.
    /// </summary>
    public partial class PatientListMenus : BaseControl
    {

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            AppointmentDa aptDa = new AppointmentDa();

            //populate clinic list Physicians from look up codes
            //rptClinicPhysicians.DataSource = CacheManager.GetLookupCodeList("apptPhysician");
            //updated 9/22 fs
            rptClinicPhysicians.DataSource = aptDa.GetDistinctAppointmentPhysicians().Tables[0].DefaultView;
            rptClinicPhysicians.DataBind();


            //append inpatient services to the bottom of the clinic list drop down
            //added 12/06/04 to allow form printing of inpatients
            InPatientDa ipda = new InPatientDa();
            rptInPatientServices.DataSource = ipda.GetInPatientServices();
            rptInPatientServices.DataBind();

            //populate contact status from distinct values- status also present in look up codes
            PatientDa patDa = new PatientDa();
            //count of patients in each contact status should be based on dataset user is logged into
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            DataSet contactStatusDs = patDa.GetDistinctContactStatus(datasetSql);
            rptStatus.DataSource = contactStatusDs;
            rptStatus.DataBind();

            //populate categories from distinct values, takes username to display private
            SecurityController ct = new SecurityController();
            string userName = ct.GetUserName();

            CategoryDa catDa = new CategoryDa();
            DataSet catDs = catDa.GetDistinctCategories(userName);
            rptCategories.DataSource = catDs;
            rptCategories.DataBind();

            //v5.1: count of patients by action items
            ActionDa actionDa = new ActionDa();
            DataTable actionDt = actionDa.GetDistinctPatientActions(datasetSql);
            rptActions.DataSource = actionDt;
            rptActions.DataBind();

        }

        /// <summary>
        /// Appends the category type(public or private) to each category menu item.
        /// </summary>
        /// <param name="Sender"></param>
        /// <param name="e"></param>
        protected void rptCategoriesOnItemBound(object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal categoryType = e.Item.FindControl("CategoryType") as Literal;
                string rptCatType = DataBinder.Eval(e.Item.DataItem, Category.CategoryType).ToString();
                if (rptCatType.ToUpper() != "PUBLIC")
                {
                    categoryType.Text = "(" + rptCatType + ")";
                }
                else
                {
                    categoryType.Visible = false;
                }
            }
        }
    }
}
