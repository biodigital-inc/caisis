using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class CollectionPrintView : SpecimenMgmtBasePage
    {
        int colId;
        
        protected override void Page_Load(object sender, System.EventArgs e)
        {
            string colIdQS = getQS("CollectionId");
            if (!string.IsNullOrEmpty(colIdQS))
            {
                colId = int.Parse(colIdQS);
                LoadCollection();
            }
        }

        private void LoadCollection()
        {
            SpecimenCollection collection = new SpecimenCollection();
            collection.Get(colId);
            CICHelper.SetFieldValues(Page.Controls, collection);

            this.CollectionName.Text = collection[SpecimenCollection.CollectionName].ToString();
            this.CollectionAssignDate.Text = collection[SpecimenCollection.CollectionAssignDate].ToString();
            this.CollectionAssignDate.Text = GetValidDisplayDate(this.CollectionAssignDate.Text);

            this.CollectionType.Text = collection[SpecimenCollection.CollectionType].ToString();
            this.CollectionStatus.Text = collection[SpecimenCollection.CollectionStatus].ToString();

            this.CollectionProjectCode.Text = collection[SpecimenCollection.CollectionProjectCode].ToString();
            this.CollectionAssignNotes.Text = collection[SpecimenCollection.CollectionAssignNotes].ToString();
            
            this.pageTitle.Text = collection[SpecimenCollection.CollectionName].ToString();

            SecurityController sc = new SecurityController();
            string user = sc.GetUserName();
            this.printedBy.Text = user;
            this.printedDate.Text = DateTime.Now.ToString();

            BindSpecimensGrid();
        }

        private void BindSpecimensGrid()
        {
            SpecimenManagerDa da = new SpecimenManagerDa();
            string _identifierType = CaisisConfiguration.GetWebConfigValue("SpecimenModuleDefaultId");
            DataTable dt = da.GetSpecimensInCollectionForPrint(colId, _identifierType);
            this.totalSpecimens.Text = dt.Rows.Count.ToString();

            this.SpecimenGridView.DataSource = dt;
            this.SpecimenGridView.DataBind();
        }
    }
}
