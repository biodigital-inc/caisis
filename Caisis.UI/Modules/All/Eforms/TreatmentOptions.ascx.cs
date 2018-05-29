using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.All.Eforms
{
    public partial class TreatmentOptions : BaseEFormControl
    {
        private string title;

        /// <summary>
        /// Gets or sets the Title
        /// </summary>
        public string Title
        {
            get
            {
                return title;
            }
            set
            {
                title = value;
            }
        }
         
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }


        public virtual void BuildCreateChildRecord(string parentTable, int parentKey, string childTable, string childTableDateField, bool showAdministrationOptions)
        {


            if (showAdministrationOptions)
            {
                ChildRecordCheckBox.SetRecord(parentTable, parentKey.ToString());
                ChildRecordPlaceHolder.Visible = true;
            }
            else { ChildRecordPlaceHolder.Visible = false; }



            DataView childView = BOL.BusinessObject.GetByParentAsDataView(childTable, parentKey);
            childView.Sort = childTableDateField + " ASC";
            DateTime parseDate;
            if (childView.Count > 0 && DateTime.TryParse(childView[childView.Count - 1][childTableDateField].ToString(), out parseDate))
            {
                if (parseDate.Date == DateTime.Today.Date)
                { 
                    LastAdminDate.Text = "Today";
                    ChildRecordPlaceHolder.Visible = false; 
                }
                else { LastAdminDate.Text = parseDate.ToShortDateString(); }
            }


        }

        public virtual void BuildStopDate(string table, string priKey)
        {
            StopNowCheckBox.SetRecord(table, priKey);
            StopNowPlaceHolder.Visible = true;
        }
    }
}