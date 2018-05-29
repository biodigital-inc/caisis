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

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class PrintableCollection : SpecimenMgmtBasePage
    {
        protected override void Page_Load(object sender, System.EventArgs e)
        {
            LoadExistingCollection(41);
        }

        private void LoadExistingCollection(int id)
        {
            SpecimenCollection collection = new SpecimenCollection();
            collection.Get(id);
            CICHelper.SetFieldValues(Page.Controls, collection);

            this.CollectionName.Text = collection[SpecimenCollection.CollectionName].ToString();
            this.CollectionAssignDate.Text = collection[SpecimenCollection.CollectionAssignDate].ToString();
            this.CollectionType.Text = collection[SpecimenCollection.CollectionType].ToString();
            this.CollectionStatus.Text = collection[SpecimenCollection.CollectionStatus].ToString();

            this.CollectionProjectCode.Text = collection[SpecimenCollection.CollectionProjectCode].ToString();
            this.CollectionAssignNotes.Text = collection[SpecimenCollection.CollectionAssignNotes].ToString();
            
            //this.CollectionAssignDate.Value = GetValidDisplayDate(this.CollectionAssignDate.Value);
            //LoadAuditData(collection);

            this.pageTitle.Text = collection[SpecimenCollection.CollectionName].ToString();
           // BindSpecimensGrid();

            
        }

    }
}
