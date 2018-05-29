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
using System.Linq;

using Caisis.UI.Core.Classes;
using Caisis.Security;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class Collection : System.Web.UI.Page
    {
        private string _identifierType = CaisisConfiguration.GetWebConfigValue("SpecimenModuleDefaultId");
        private int numOfSpecimens; //number of total specimens in collection (including just added ones)
        private int numOfSpecimensAdded;

        /// <summary>
        /// Gets the Collection Id from the Query String
        /// </summary>
        private int QueryCollectionId
        {
            get
            {
                string sId = Request.QueryString["colId"];
                ColId.Value = sId;
                if (!string.IsNullOrEmpty(sId))
                {
                    return int.Parse(sId);
                }
                else
                {
                    return 0; // since CollectionId seed in database is 1
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string addType = Request.QueryString["addTo"];

                if (QueryCollectionId > 0 && string.IsNullOrEmpty(addType))
                {
                    this.pageTitle.Text = "Edit Collection";
                    LoadExistingCollection(QueryCollectionId, false);
                }
                else
                {
                    if (addType.Equals("New"))
                    {
                        this.collectionDetailsPage.Visible = false;
                        this.collectionNamePage.Visible = true; //prompt to enter name for collection
                    }
                    else if (addType.Equals("Existing"))
                    {
                        AddSpecimensToCollection(int.Parse(Request.QueryString["colId"]), Request.QueryString["specimenIds"], false);
                        this.pageTitle.Text = "Added  <span style=\"color:#00668d;\">" + this.numOfSpecimensAdded.ToString() + " Specimen(s)</span> to " + addType + " Collection";
                    }
                }
                ShowBackToSearchResults();
            }
            else
            {
             
                BindSpecimensGrid();
            }
        }

        private void AddSpecimensToCollection(int colId, string specimenIds, bool isNewCollection)
        {
            if (!string.IsNullOrEmpty(specimenIds))
            {
                char[] delimiters = { ',' };
                string[] ids = specimenIds.Split(new char[] { ',' });
                this.numOfSpecimensAdded = ids.GetLength(0);         

                //get each specimen by id and set its collectionId
                foreach (string sId in ids)
                {                    
                    Specimen biz = new Specimen();
                    Specimen_SpecimenCollections bizcol = new Specimen_SpecimenCollections();
                    
                    biz.Get(int.Parse(sId));
                    //biz[Specimen.CollectionId] = colId;                    
                    //biz[Specimen.SpecimenStatus] = "Unavailable: Reserved"; //bug fix
                    //biz.Save();

                    if (!SpecimenCollectionExists(int.Parse(sId), colId))
                    {
                        bizcol[Specimen_SpecimenCollections.SpecimenId] = sId;
                        bizcol[Specimen_SpecimenCollections.CollectionId] = colId;
                        bizcol.Save();
                    }
                    BindSpecimensGrid();
                }

                LoadExistingCollection(colId, isNewCollection);
            }
        }

        protected Boolean SpecimenCollectionExists(int specimenId, int collectionId)
        {
            System.Collections.Generic.Dictionary<string, object> check = new System.Collections.Generic.Dictionary<string, object>();
            check.Add(Specimen_SpecimenCollections.SpecimenId, specimenId);
            check.Add(Specimen_SpecimenCollections.CollectionId, collectionId);
            bool exists = Specimen_SpecimenCollections.GetByFields<Specimen_SpecimenCollections>(check).Count()>0;
            return exists;
        }

        protected void LoadExistingCollection(int colId, bool isNewCollection)
        {
            // set title of column header from web config value
            IdentifierColumnTitle.Text = CaisisConfiguration.GetWebConfigValue("SpecimenModuleDefaultId");
            
            SpecimenCollection collection = new SpecimenCollection();
            collection.Get(colId);
            CICHelper.SetFieldValues(Page.Controls, collection);
            this.CollectionAssignDate.Value = GetValidDisplayDate(this.CollectionAssignDate.Value);
            LoadAuditData(collection);

            //write the colId to javascript variable so we can pass it into querystring for printing
            ClientScript.RegisterClientScriptBlock(Page.GetType(), "x1", "<script language=\"javascript\">colId=\"" + colId.ToString() + "\";</script>");

            // default the status if the collection was newly created
            if (isNewCollection)
            {
                this.CollectionStatus.Value = "Available";
            }

            BindSpecimensGrid();
        }
       
        private void BindSpecimensGrid()
        {
            
            int colId;
            if (!string.IsNullOrEmpty(this.CollectionId.Text))
            {
                colId = int.Parse(this.CollectionId.Text);
                
                SpecimenManagerDa da = new SpecimenManagerDa();
                DataTable dt = da.GetSpecimensInCollection(colId, this._identifierType);
                rptSpecimenResults.DataSource = dt;
                rptSpecimenResults.DataBind();

                this.numOfSpecimens = dt.Rows.Count;
                this.lblTotalSpecimens.Text = this.numOfSpecimens.ToString() + " specimen(s) in collection";
                ShowHideSpecimenGrid();
                ShowHidePrintIcon();
            }
        }

        protected void RemoveFromCollection(object sender, CommandEventArgs e)
        {
            int priKey = int.Parse(e.CommandArgument.ToString());

            Specimen biz = new Specimen();
            biz.Get(priKey);
            //biz[Specimen.CollectionId] = DBNull.Value;
            //biz[Specimen.SpecimenStatus] = "Available";
            //biz.Save();
            
            SpecimenManagerDa da = new SpecimenManagerDa();
            int specColId = da.GetPrimKeybySpecId(priKey);
            Specimen_SpecimenCollections bizcol = new Specimen_SpecimenCollections();

            bizcol.Delete(specColId);

            BindSpecimensGrid();
        }

        protected void btnSave_onClick(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            if (ValidateCollectionName(this.CollectionName.Value))
            {
                SpecimenCollection collection = new SpecimenCollection();
                CICHelper.SetBOValues(Page.Controls, collection, 1);

				//DataTable dt = new DataTable();
				//dt = collection.GetTable();

                collection[SpecimenCollection.EnteredBy] = this.EnteredBy.Text;
                collection[SpecimenCollection.EnteredTime] = this.EnteredTime.Text;

                SecurityController sc = new SecurityController();
                string user = sc.GetUserName();
                collection[SpecimenCollection.UpdatedBy] = user;
                collection[SpecimenCollection.UpdatedTime] = DateTime.Now.ToString();

                collection[SpecimenCollection.LockedBy] = this.LockedBy.Text;
                collection[SpecimenCollection.LockedTime] = this.LockedTime.Text;

                collection.Save();

				//dt = new DataTable();
				//dt = collection.GetTable();
                //this.CollectionId.Text = dt.Rows[0][SpecimenCollection.CollectionId].ToString();
				this.CollectionId.Text = collection[SpecimenCollection.CollectionId].ToString();

                LoadAuditData(collection);
                this.errorMessage.Text = "";
            }
            else
            {
                //collection name in use already; don't save
                this.errorMessage.Text = "Name is already in use. &nbsp;Please try again.";
            }

            ShowHideSpecimenGrid();
        }

        protected void btnDelete_onClick(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            SpecimenCollection collection = new SpecimenCollection();
            int colId = int.Parse(this.CollectionId.Text);
            collection.Delete(colId);

            Response.Redirect("SearchForCollection.aspx?menu=viewAll");
        }
        
        protected void btnSubmit_onClick(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            if(ValidateCollectionName(this.newCollectionName.Value))
            {
                this.colNameError.Text = "";
                SpecimenCollection collection = new SpecimenCollection();
                collection[SpecimenCollection.CollectionName] = this.newCollectionName.Value;
                collection[SpecimenCollection.CollectionStatus] = "Available"; //bug fix
                collection[SpecimenCollection.CollectionAssignDate] = DateTime.Now.ToString(); //enhancement
                collection.Save();
                AddSpecimensToCollection(int.Parse(collection[SpecimenCollection.CollectionId].ToString()), Request.QueryString["specimenIds"], true);

                this.collectionNamePage.Visible = false;
                this.collectionDetailsPage.Visible = true;

                this.pageTitle.Text = "Added  <span style=\"color:#00668d;\">" + this.numOfSpecimensAdded.ToString() + " Specimen(s)</span> to New Collection";
            }
            else
            {
                this.colNameError.Text = "Name is already in use. &nbsp;Please try again.";
            }
        }

        protected void GoToSearch(object sender, CommandEventArgs e)
        {
            Response.Redirect("SearchForCollection.aspx?" + Request.QueryString);
        }

        private bool ValidateCollectionName(string colName)
        {
            SpecimenManagerDa da = new SpecimenManagerDa();
            DataTable dt = da.GetCollectionByName(colName);
            if (dt.Rows.Count == 0)
            {
                return true;
            }
            else
            {
                if (!string.IsNullOrEmpty(this.CollectionId.Value))
                {
                    if (dt.Rows[0][SpecimenCollection.CollectionId].ToString().Equals(this.CollectionId.Value))
                    {
                        return true;
                    }
                }
                return false;
            }
        }

        private void LoadAuditData(SpecimenCollection scollection)
        {
			//DataTable dt = new DataTable();
			//dt = scollection.GetTable();

			//this.EnteredBy.Text = dt.Rows[0][SpecimenCollection.EnteredBy].ToString();
			//this.EnteredTime.Text = GetValidDisplayDate(dt.Rows[0][SpecimenCollection.EnteredTime].ToString());

			//this.UpdatedBy.Text = dt.Rows[0][SpecimenCollection.UpdatedBy].ToString();
			//this.UpdatedTime.Text = GetValidDisplayDate(dt.Rows[0][SpecimenCollection.UpdatedTime].ToString());

			//this.LockedBy.Text = dt.Rows[0][SpecimenCollection.LockedBy].ToString();
			//this.LockedTime.Text = GetValidDisplayDate(dt.Rows[0][SpecimenCollection.LockedTime].ToString());

			this.EnteredBy.Text = scollection[SpecimenCollection.EnteredBy].ToString();
			this.EnteredTime.Text = GetValidDisplayDate(scollection[SpecimenCollection.EnteredTime].ToString());

			this.UpdatedBy.Text = scollection[SpecimenCollection.UpdatedBy].ToString();
			this.UpdatedTime.Text = GetValidDisplayDate(scollection[SpecimenCollection.UpdatedTime].ToString());

			this.LockedBy.Text = scollection[SpecimenCollection.LockedBy].ToString();
			this.LockedTime.Text = GetValidDisplayDate(scollection[SpecimenCollection.LockedTime].ToString());
        }

        private void ShowHideSpecimenGrid()
        {
            if (this.numOfSpecimens > 0)
            {
                this.specimensPanel.Visible = true;
            }
            else
            {
                this.specimensPanel.Visible = false;
            }
        }

        private void ShowHidePrintIcon()
        {
            if (this.numOfSpecimens > 0)
            {
                this.printIcon.Visible = true;
            }
            else
            {
                this.printIcon.Visible = false;
            }
        }

        private void ShowBackToSearchResults()
        {
            if (Request.QueryString["showAsLayer"] != null)
            {
                this.backToSearchIcon.Visible = false;
            }
            else
            {
                this.backToSearchIcon.Visible = true;
            }
        }


        // need to move to base class
        private string GetValidDisplayDate(string s)
        {
            if (s != "" && s.Length > 0)
            {
                s = DateTime.Parse(s).ToShortDateString();
            }

            return s;
        }

        //used to update specimen status on deleting collection 
        private void UpdateSpecimenStatus(int specId, string status)
        {
            Specimen bizSpec = new Specimen();
            bizSpec.Get(specId);

            bizSpec[Specimen.SpecimenStatus] = status;
            bizSpec.Save();
        }

    }
}
