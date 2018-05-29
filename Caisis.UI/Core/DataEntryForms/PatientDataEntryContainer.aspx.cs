using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;


//using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core.DataEntry;
using Caisis.Security;
using Caisis.Controller;



namespace Caisis.UI.Core
{
    public partial class PatientDataEntryContainer : BasePage
    {

    
        #region ---------------- Private Members -------------------------------

        private int _primaryKeyValue;
        private int _parentKeyValue;
        private bool _isNewRecord;
        private bool _hasSiblings;
        private bool _isRecordLocked;
        private bool _isFormEnabled;
        private string _tableName;
        private bool _isLockable;
		private bool _deletedPatient;

        private BasePatientDataControl _dataEntryForm = null;
        private TabDataEntry _dataEntryTab = null;
        private IBusinessObject _parentBizo;                            // the bizo object that is the parent of all the others if theys exist
        //List<IBusinessObject> _bizos = new List<IBusinessObject>();   // names of biz objects represented on this interface
		List<List<IBusinessObject>> _bizosList = new List<List<IBusinessObject>>();
		List<string> _tableNames = new List<string>();                  // names of tables represented by input elements on this interface
        List<string> _plugins = new List<string>();
        List<ICaisisInputControl> _requiredFields = new List<ICaisisInputControl>();
        List<ICaisisInputControl> _dirtyFields = new List<ICaisisInputControl>();

        Dictionary<string,Control> _sections = new Dictionary<string,Control>();
        Dictionary<string, HtmlGenericControl> _tabLabels = new Dictionary<string, HtmlGenericControl>();
        

        // data entry controller for getting table properties
        PatientDataEntryController _dataEntryController = new PatientDataEntryController();

        #endregion

        #region ---------------- Public Properties -----------------------------

        /// <summary>
        /// Name of table mapped to parent form
        /// </summary>
        public string TableName
        {
            get
            {
                // set inital table name
                if (string.IsNullOrEmpty(this._tableName))
                {
                    // get from query string
                    if (Request.QueryString["tableName"] != null && Request.QueryString["tableName"].Length > 0)
                    {
                        this._tableName = Request.QueryString["tableName"];
                    }
                    // get from metadata
                    else
                    {
                        this._tableName = _dataEntryController.GetDefaultTableName();
                    }
                }
                //else if (_formNode != null && _formNode.Attributes["tableName"] != null)
                //{
                //    // this will return the table name attributed with the "loadByDefault" attribute in the config file
                //    this._tableName = _formNode.Attributes["tableName"].Value;
                //}
                return this._tableName;
            }
        }

        /// <summary>
        /// Value of primary key of record. 
        /// If fields representing multiple tables present, always the primary key value of the parent form.
        /// </summary>
        public int PrimaryKey
        {
            get
            {
				string firstPrimaryKeyName = null;

				if (_tableNames.Count > 0)
				{
					string firstTablename = _tableNames[0];
					firstPrimaryKeyName = BOL.BusinessObject.GetPrimaryKeyName(firstTablename);
				}

                if (Request.QueryString["primKey"] != null && Request.QueryString["primKey"].Length > 0)
                {
                    this._primaryKeyValue = Convert.ToInt32(Request.QueryString["primKey"]);
                }
                //else if (this.TableName.Equals("Patients")) // when demographics interface loaded primary key is always patient id
                //else if (_parentBizo != null && _parentBizo.PrimaryKeyName != null && _parentBizo.PrimaryKeyName.Equals(Patient.PatientId))
				else if (Patient.PatientId == firstPrimaryKeyName)
                {
                    this._primaryKeyValue = int.Parse(Session[SessionKey.PatientId].ToString());
                }
                else if (Request.Form["PagePrimaryKey"] != null && Request.Form["PagePrimaryKey"] != "") // we need this hidden var for forms that are newly saved then updated (prim key in url does not exist)
                {
                    this._primaryKeyValue = int.Parse(Request.Form["PagePrimaryKey"].ToString());
                }

                return _primaryKeyValue;
            }
            set
            {
                PagePrimaryKey.Value = value.ToString();
                _primaryKeyValue = value;
            }
        }

        /// <summary>
        /// Value of primary key of the parent record(foreign key value). If many forms present, always the parent key value of the parent form.
        /// </summary>
        public int ParentKey
        {
            get
            {
				string firstParentKeyName = null;

				if (_tableNames.Count > 0)
				{
					string firstTablename = _tableNames[0];
					firstParentKeyName = BOL.BusinessObject.GetParentKeyName(firstTablename);
				}

                if (Request.QueryString["parentKey"] != null && Request.QueryString["parentKey"].Length > 0)
                {
                    this._parentKeyValue = Convert.ToInt32(Request.QueryString["parentKey"]);
                }
                //else if (_parentBizo != null && _parentBizo.ParentKeyName != null && _parentBizo.ParentKeyName.Equals(Patient.PatientId))
				else if (Patient.PatientId == firstParentKeyName)
                {
                    this._parentKeyValue = int.Parse(Session[SessionKey.PatientId].ToString());
                }
                else if (_parentBizo != null && _parentBizo.TableName == "Patients") // Patients table is unique case: only table with no parent
                {
                    this._parentKeyValue = int.Parse(Session[SessionKey.PatientId].ToString());
                }
                return _parentKeyValue;
            }
        }

        /// <summary>
        /// Is record many to one with parent record 
        /// </summary>
        private bool HasSiblings
        {
            get
            {
                _hasSiblings = true;
                if (_parentBizo != null)
                {
                    _hasSiblings = _parentBizo.HasSiblings;
                }
                return _hasSiblings;
            }
        }

        /// <summary>
        /// Does the record allow locking
        /// </summary>
        private bool IsLockable
        {
            get
            {
                _isLockable = true;
                if (_parentBizo != null)
                {
                    _isLockable = _parentBizo.IsLockable;
                }
                return _isLockable;
            }
        }

        /// <summary>
        /// Is the record locked by a user
        /// </summary>
        private bool IsRecordLocked
        {
            get
            {
                _isRecordLocked = false;

				//if (IsLockable && _parentBizo != null && _parentBizo.RecordCount > 0)
				//{
				//    if (_parentBizo.DataSourceView.Table.Rows[0][BusinessObject.BusinessObject.LockedBy] != null && _parentBizo.DataSourceView.Table.Rows[0][BusinessObject.BusinessObject.LockedBy].ToString().Length > 0)
				//    {
				//        _isRecordLocked = true;
				//    }
				//}

				if (IsLockable && _parentBizo != null && _parentBizo.IsLocked)
				{
					_isRecordLocked = true;
				}

                return _isRecordLocked;
            }
        }

        /// <summary>
        /// Is the form enabled for entering data (true/false)
        /// </summary>
        private bool IsFormEnabled
        {
            get
            {
                return _isFormEnabled;
            }
            set
            {
                _isFormEnabled = value;

                CICHelper.EnableFields(_dataEntryForm.Controls, _isFormEnabled);
            }
        }

        # endregion

        #region ---------------- Initialize Page -------------------------------

        protected override void OnInit(EventArgs e)
        {
            // if no patient in session get the user out of this section!
            if (Session[SessionKey.PatientId] == null || Session[SessionKey.PatientId].ToString().Equals(""))
            {
                string redirectPath = Page.ResolveUrl("~/Core/Utilities/ClientSideRedirect.aspx?from=PatientData");
                Response.Redirect(redirectPath);
            }

            //_formNode = _dataEntryController.GetPageConfigNode(this.TableName);
            //_config = _dataEntryController.GetPageConfigurationNode(this.TableName);

            if (!string.IsNullOrEmpty(TableName) && !TableName.Equals("Summary")) // Summary page is output only. 
            {
                this.BuildTableNameList();
                // this.BuildBusinessObjectList();
				this.BuildBusinessObjects();
                this.BuildPluginList();
                // this.PopulateBizos();
            }
            base.OnInit(e);

            // late bound checks
            this.PreRender += (a, b) =>
            {
                RegisterDoSaveScript();
                HandleNextSessionPatient();
                RegisterPatientDeleteValidation();
                SetActiveTabIndex();
            };


        }

        override protected void Page_Load(object sender, EventArgs e)
        {
            base.RedirectOnTimeout();
            base.Page_Load(sender, e);
            this.EnableViewState = true; // REQUIRED FOR PATIENT DATA SECTION
            InitializeContainer();

            # region WORKFLOWS : will be added back in point release if requested
            //if (Page.IsPostBack && Request.Form["WorkFlowFlag"] != null && Request.Form["WorkFlowFlag"].Equals("true"))
            //{
            //    CommandEventArgs args = new CommandEventArgs("Save", "NA");
            //    this.DataEntryButtonClick(sender, args);
            //}
            # endregion
        }

        protected override void Page_Unload(object sender, EventArgs e)
        {
            base.Page_Unload(sender, e);
        }

        private void InitializeContainer()
        {
            if (!string.IsNullOrEmpty(TableName))//_formNode != null)
            {
                // Load the static or dynamic form into this file
                this.LoadDataEntryForm();

                UserMessage.Text = "";

                if (!Page.IsPostBack)
                {
                    //v4.0 //if (PrimaryKey != 0 && ParentKey != 0)
                    if (_parentBizo != null && _parentBizo.IsEmpty == false)
                    {
                        this.IsFormEnabled = false;
                    }
                    string isEditQuery = Request.QueryString["edit"];
                    //v6.0 (edit mode via query string)
                    if (!string.IsNullOrEmpty(isEditQuery) && isEditQuery.Equals(true.ToString(), StringComparison.OrdinalIgnoreCase))
                    {
                        this.IsFormEnabled = true;
                    }

                    this.SetTitleAndBreadCrumbTrail();
                    this.SetSubFormMenu();
                    this.SetEnteredUpdatedLockedInfo();
                    this.SetButtons();
                    SessionHandler sh = new SessionHandler(Session);
                    sh.PutCurrentPageInSession(this.TableName);

                    // prompt user to populate proc, path, op details fields based on other fields
                    //Page.RegisterStartupScript("xyzx", "<script language=javascript>alert('');</script>");
                }
            }
 
            if (Request.QueryString["reloadChronList"] != null)
            {
                this.RefreshChronologicalList();
            }


        }

        /// <summary>
        /// Builds plugins for the existing table
        /// </summary>
        private void BuildPluginList()
        {
            // get a list of plugins
            List<string> tablePlugins = _dataEntryController.GetPlugins(TableName);
            _plugins.AddRange(tablePlugins);
            // build plugins
            DynamicPlugins.LoadPlugins(_plugins);
        }

        // build list of tables who have input elements on this page
        private void BuildTableNameList()
        {
            //// the ORDER the list of table names is created matters! 
            //_tableNames = _dataEntryController.AddParentTableBasedOnChild(_tableNames, _formNode);
            //_tableNames.Add(_formNode.Attributes["tableName"].Value);  // always add the parent table          
            //// AddChildTablesBasedOnParentAndChildRecordCount method was added to load all child forms that HAVE data on click of parent record in chron list
            //_tableNames = _dataEntryController.AddChildTablesBasedOnParentAndChildRecordCount(_tableNames, _formNode, PrimaryKey);
            //_tableNames = _dataEntryController.AddChildTablesBasedOnParent(_tableNames, _formNode);

            // build ordered list of tables from configuration
            List<string> orderedTableNames = _dataEntryController.EnumerateTableNames(TableName, PrimaryKey);
            // add optional tables from query string
            string qsTables = Request.QueryString["tableNames"];
            if (!string.IsNullOrEmpty(qsTables))
            {
                var queryStringTables = qsTables.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries).Except(orderedTableNames);
                orderedTableNames.AddRange(queryStringTables);
            }
            // validate list is distinct
            this._tableNames = orderedTableNames;
        }

		private void BuildBusinessObjects()
		{
            this._tableNames = this._tableNames.Distinct().ToList();
            
            // re-init list
            _bizosList.Clear();

			bool populate = PrimaryKey != 0 || ParentKey != 0;
			int i = 0; // index for determining whether table is displayed as grid

			// map tablenames to bizo lists (for retreiving parent bizo during tablename traversal)
			Dictionary<string, List<IBusinessObject>> map = 
				new Dictionary<string, List<IBusinessObject>>();

			foreach (string tablename in _tableNames)
			{
				List<IBusinessObject> sublist = new List<IBusinessObject>(); // contains 1 BO or many in case of grid
				map[tablename] = sublist;

				if (populate)
				{
					if (IsGridView(i))
					{
						// handle forms displayed as grids (e.g. 1 to many child tables, standalone grids)
						// for grids we need a sequence of business objects (retrieved via primary or parent key)
						IEnumerable<IBusinessObject> bos = null;
						string parentTablename = BOL.BusinessObject.GetParentTablename(tablename);

						Func<string, int, Dictionary<string, int>> pair = 
							(f, v) => new Dictionary<string, int>() { { f, v } };

						if (_tableNames.Count == 1)
						{
							if (parentTablename == TableName)
								bos = BOL.BusinessObject.GetByParent(tablename, PrimaryKey);
							else
								bos = BOL.BusinessObject.GetByParent(tablename, ParentKey);
						}
						else
						{
							if (map.ContainsKey(parentTablename))
							{
								List<IBusinessObject> parentList = map[parentTablename];

								if (parentList.Count > 0)
								{
									IBusinessObject parentBusinessObject = parentList[0];
									string parentKeyName = BOL.BusinessObject.GetParentKeyName(tablename);

									if (!parentBusinessObject.IsNull(parentKeyName))
										bos = BOL.BusinessObject.GetByParent(tablename, (int) parentBusinessObject[parentKeyName]);
								}
							}
						}

						if (bos != null && bos.Count() > 0)
							sublist.AddRange(bos);
						else
							sublist.Add(BusinessObjectFactory.BuildBusinessObject(tablename)); // if no results, add an empty BO
					}
					else
					{
						// handle forms displayed as lists (e.g. parent tables, 1 to 1 tables)
						IBusinessObject bo = BusinessObjectFactory.BuildBusinessObject(tablename);

                        // OLD
                        //if (i == 0 && IsNewChildRecord())
                        //    bo.Get(ParentKey);
                        //else
                        //    bo.Get(PrimaryKey);

                        // NEW
                        if (i == 0 && IsNewChildRecord())
                        {
                            bo.Get(ParentKey);
                        }
                        else
                        {
                            string TableName_PriKeyName = BOL.BusinessObject.GetPrimaryKeyName(TableName);                           
                            // get child record by parent key
                            if (BOL.BusinessObject.HasParentTable(tablename) &&
                                bo.ParentTableName == TableName &&
                                bo.ParentKeyName == TableName_PriKeyName &&
                                bo.PrimaryKeyName != TableName_PriKeyName)
                            {
                                IEnumerable<IBusinessObject> childBizos = BusinessObject.GetByParent(bo.TableName, PrimaryKey);
                                if (childBizos.Count() > 0)
                                    bo = childBizos.First();
                            }
                            // get record by pri key
                            else
                            {
                                bo.Get(PrimaryKey);
                            }
                        }

						sublist.Add(bo);
					}
				}
				else
				{
					// just add an empty bizo to the sublist; grids will use this as a prototype for new rows
					IBusinessObject bo = BusinessObjectFactory.BuildBusinessObject(tablename);
					sublist.Add(bo);
				}

				// handle _parentBizo (always first form on the page)
				if (i == 0 && sublist.Count > 0)
					_parentBizo = sublist[0];

				_bizosList.Add(sublist);
				i++;
			}
        }

		#region old code
		// list of BIZ Objects represented on the page is based on the list of table names
		//private void BuildBusinessObjectList()
		//{
		//    //foreach (string tableName in _tableNames)
		//    //{
		//    //    _bizos.Add(BusinessObjectFactory.BuildBusinessObject(tableName));
		//    //}
		//    //if (_bizos.Count > 0)
		//    //{
		//    //    // parent bizo is always the first form on the page
		//    //    _parentBizo = _bizos[0];
		//    //}

		//    foreach (string tableName in _tableNames)
		//    {
		//        // TODO: we know which tables will be show as grids
		//        // TODO: build a list of Action<int> which can call Get(...) or GetByField(...) based on grid status?
		//        // TODO: we could also consolidate BuildBusinessObjectList() and PopulateBizos() into one method

		//        // a list of lists accommodates both single-record forms and datagrids
		//        IBusinessObject bo = BusinessObjectFactory.BuildBusinessObject(tableName);
		//        List<IBusinessObject> list = new List<IBusinessObject>();
		//        list.Add(bo);

		//        // set the parent business object to be associated with the first form on the page
		//        if (_parentBizo == null)
		//            _parentBizo = bo;

		//        _bizosList.Add(list);
		//    }
		//}

		//private void PopulateBizos()
		//{
		//    if (PrimaryKey != 0 || ParentKey != 0) // then some bizo may need filling
		//    {
		//        for (int i = 0; i < _bizos.Count; i++)
		//        {
		//            IBusinessObject bizo = _bizos[i];

		//            if (IsGridView(i))
		//            {
		//                if (_bizos.Count == 1)
		//                {
		//                    if (bizo.ParentTablename.Equals(TableName)) // occurs when gridview embedded on same page as parent form
		//                    {
		//                        bizo.GetByParent(PrimaryKey);
		//                    }
		//                    else
		//                    {
		//                        bizo.GetByParent(ParentKey);
		//                    }
		//                }
		//                else
		//                {
		//                    // we should check the list of bizos to get our parent bizo, and then ask it for our parent key
		//                    IBusinessObject pb = null;

		//                    foreach (IBusinessObject ib in _bizos)
		//                    {
		//                        if (ib.Tablename == bizo.ParentTablename)
		//                        {
		//                            pb = ib;
		//                        }
		//                    }

		//                    object oParentKey = pb[bizo.ParentKeyName];

		//                    if (oParentKey != DBNull.Value && oParentKey != null)
		//                    {
		//                        bizo.GetByParent((int)pb[bizo.ParentKeyName]);
		//                    }
		//                }
		//            }
		//            else
		//            {
		//                if (_bizos.Count > 0 && i == 0 && this.IsNewChildRecord())
		//                {
		//                    bizo.Get(ParentKey);
		//                }
		//                else
		//                {
		//                    bizo.Get(PrimaryKey);
		//                }
		//            }
		//        }
		//    }

		//    // we may want to use this again to load Operating Room Details etc. when optional FK exists in referring form
		//    // this is a new form, see if anything the biz object should be prepopulated based on optional fk values passed in (i.e. Procedures/ORDetails/Pathology scenario)
		//    //if (PrimaryKey == 0 && !Page.IsPostBack && Request.QueryString["brotherTableName"] != null && Request.QueryString["brotherFKValue"] != null)
		//    //{
		//    //    PatientDataEntryController pedc = new PatientDataEntryController();
		//    //    pedc.SetFieldsBasedOnBrotherTable(_bizos[0], Request.QueryString["brotherTableName"].ToString(), int.Parse(Request.QueryString["brotherFKValue"].ToString()));
		//    //}

		//}
		#endregion

		#endregion

		# region  ---------------- Set Page Titles, Menus, & Audit Info   --------

		private void SetTitleAndBreadCrumbTrail()
        {
            SessionHandler sh = new SessionHandler(Session);

            //string ptName = sh.GetPatientName();
            PatientController pc = new PatientController();
            Patient ptBiz = new Patient();
            ptBiz.Get(sh.GetPatientId());
            string ptName = pc.GetPatientName(ptBiz, true);

            //string parentUrl = "";
            string tableLabel = "";
            string parentKeyValue = "";
            string parentTableName = "";
            string parentTabelLabel = "";

            // reset trail titles
            PageTitle.Text = "";
            ParentNavigationLink.Text = "";
            ParentNavigationLink.Visible = false;

            // set breadcrumb back to parent form
            if (!string.IsNullOrEmpty(TableName))///_formNode.ParentNode.Attributes["tableName"] != null && _formNode.ParentNode.Attributes["tableName"].Value != "")
            {
                if (_dataEntryController.IsTable(TableName))
                {
                    tableLabel = _dataEntryController.GetTableLabel(TableName);
                    if (Request.QueryString["parentKey"] != null && Request.QueryString["parentKey"].Length > 0)
                    {
                        parentKeyValue = Request.QueryString["parentKey"];
                    }
                    // else if (_bizos.Count > 1 && this.PrimaryKey != 0)
                    else if (_bizosList.Count > 1 && this.PrimaryKey != 0)
                    {
                        parentKeyValue = this.PrimaryKey.ToString();
                    }

                    //if (parentKeyValue != "")
                    {
                        parentTableName = _dataEntryController.GetParentTableName(TableName);
                        // for tables with Parent table, excluding Patients, etc... and parent is data entry form
                        if (!string.IsNullOrEmpty(parentTableName) && !parentTableName.Equals("Patients", StringComparison.OrdinalIgnoreCase) && _dataEntryController.IsDataEntryForm(parentTableName))
                        {
                            parentTabelLabel = _dataEntryController.GetTableLabel(parentTableName);

                            //parentUrl = "<a href=PatientDataEntryContainer.aspx?tableName=" + _formNode.ParentNode.Attributes["tableName"].Value + "&primKey=" + parentKeyValue + ">";
                            //parentUrl = "<a href=PatientDataEntryContainer.aspx?tableName=" + parentTableName + "&primKey=" + parentKeyValue + ">" + parentTabelLabel + "</a> -> ";

                            // activate parent trail
                            ParentNavigationLink.Visible = true;
                            ParentNavigationLink.Text = parentTabelLabel;
                            if (!string.IsNullOrEmpty(parentKeyValue))
                            {
                                ParentNavigationLink.NavigateUrl = "PatientDataEntryContainer.aspx?tableName=" + parentTableName + "&primKey=" + parentKeyValue;
                            }
                            else
                            {
                                ParentNavigationLink.NavigateUrl = "#";
                                ParentNavigationLink.Style["cursor"] = "none";
                            }
                        }
                    }
                }
                // non-table forms
                else
                {
                    tableLabel = TableName;
                    //parentUrl = TableName;
                }
                //if (!string.IsNullOrEmpty(parentTabelLabel))//_formNode.ParentNode.Attributes["menuTitle"] != null && _formNode.ParentNode.Attributes["menuTitle"].Value != "")
                //{
                //    //parentUrl += _formNode.ParentNode.Attributes["menuTitle"].Value + "</a> -> ";
                //    parentUrl += parentTabelLabel + "</a> -> ";                    
                //}
                //if (_formNode.ParentNode.Attributes["tableName"] != null && _formNode.ParentNode.Attributes["tableName"].Value != "")
                //{
                //    parentTableName = _formNode.ParentNode.Attributes["tableName"].Value;
                //}
            }

            //PageTitle.Text += parentUrl + _formNode.Attributes["pageTitle"].Value + " for " + ptName;
           
            // set main label (account for parent navigation)
            if (ParentNavigationLink.Visible)
            {
                PageTitleArrow.Visible = true;
            }
            else
            {
                PageTitleArrow.Visible = false;
            }
            PageTitle.Text = tableLabel + " for " + ptName;

            // set icon (validate)
            string iconTable = !string.IsNullOrEmpty(parentTableName) && !string.IsNullOrEmpty(parentTabelLabel) ? parentTableName : TableName;
            string iconPath = _dataEntryController.GetTableIcon(iconTable, true);
            if (!string.IsNullOrEmpty(iconPath))
            {
                PageTitleIcon.Visible = true;
                PageTitleIcon.Src = iconPath;
                PageTitleIcon.Alt = tableLabel;
                string tableDescription = _dataEntryController.GetTableDescription(iconTable);
                if (!string.IsNullOrEmpty(iconTable))
                {
                    PageTitleIcon.Attributes["title"] = tableDescription;
                    //PageTitleIcon.Attributes["onmouseover"] = "showToolTipMessage('" + PageUtil.EscapeSingleQuotes(tableDescription) + "');";
                    //PageTitleIcon.Attributes["onmouseout"] = "hideToolTip();";
                }
            }
            else
            {
                //PageTitleIcon.Visible = false;
            }
            //if (!string.IsNullOrEmpty(parentTableName))
            //{
            //    PageTitleIcon.Src = "~/Images/Icon_" + parentTableName + ".gif";
            //}
            //else
            //{
            //    PageTitleIcon.Src = "~/Images/Icon_" + TableName + ".gif";
            //}
        }

        private void SetSubFormMenu()
        {
            //var _formNode = _dataEntryController.GetPageConfigNode(TableName);
            if (!TableName.Equals("Summary"))
            {
                SubFormMenu.Show(TableName, PrimaryKey, ParentKey, IsRecordLocked);
            }
        }

        protected void SetEnteredUpdatedLockedInfo()
		{
			#region old code
			//if (_parentBizo != null && _parentBizo.RecordCount > 0)
			//{
			//    DataRow row = _parentBizo.DataSourceView.Table.Rows[0];

			//    if (row[BusinessObject.BusinessObject.EnteredBy] != null && row[BusinessObject.BusinessObject.EnteredBy].ToString().Length > 0)
			//    {
			//        EnteredBy.Text = row[BusinessObject.BusinessObject.EnteredBy].ToString();
			//        EnteredTime.Text = " @ " + row[BusinessObject.BusinessObject.EnteredTime].ToString();
			//    }

			//    if (row[BusinessObject.BusinessObject.UpdatedBy] != null && row[BusinessObject.BusinessObject.UpdatedBy].ToString().Length > 0)
			//    {
			//        UpdatedBy.Text = row[BusinessObject.BusinessObject.UpdatedBy].ToString();
			//        UpdatedTime.Text = " @ " + row[BusinessObject.BusinessObject.UpdatedTime].ToString();
			//    }

			//    if (IsLockable && row[BusinessObject.BusinessObject.LockedBy] != null && row[BusinessObject.BusinessObject.LockedBy].ToString().Length > 0)
			//    {
			//        LockedBy.Text = row[BusinessObject.BusinessObject.LockedBy].ToString();
			//        LockedTime.Text = " @ " + row[BusinessObject.BusinessObject.LockedTime].ToString() + "<IMG onclick=\"javascript:popupEmailUser('" + row[BusinessObject.BusinessObject.LockedBy].ToString() + "');\" alt=\"Email user that locked this record\" title=\"Email user that locked this record\" id=\"EmailLockedByIcon\" border=\"0\" style=\"cursor:hand;\" runat=\"server\" hspace=\"5\" height=\"7\" src=\"../../Images/EmailLockedByUser.gif\" width=\"11\" />";

			//    }
			//    else
			//    {
			//        LockedBy.Text = "";
			//        LockedTime.Text = "";
			//    }
			//}
			#endregion

			if (_parentBizo != null)
			{
				// DataRow row = _parentBizo.DataSourceView.Table.Rows[0];

				if (_parentBizo[BOL.BusinessObject.EnteredBy] != null && _parentBizo[BOL.BusinessObject.EnteredBy].ToString().Length > 0)
				{
					EnteredBy.Text = _parentBizo[BOL.BusinessObject.EnteredBy].ToString();
					EnteredTime.Text = " @ " + _parentBizo[BOL.BusinessObject.EnteredTime].ToString();
				}

				if (_parentBizo[BOL.BusinessObject.UpdatedBy] != null && _parentBizo[BOL.BusinessObject.UpdatedBy].ToString().Length > 0)
				{
					UpdatedBy.Text = _parentBizo[BOL.BusinessObject.UpdatedBy].ToString();
					UpdatedTime.Text = " @ " + _parentBizo[BOL.BusinessObject.UpdatedTime].ToString();
				}

				if (IsLockable && _parentBizo[BOL.BusinessObject.LockedBy] != null && _parentBizo[BOL.BusinessObject.LockedBy].ToString().Length > 0)
				{
					LockedBy.Text = _parentBizo[BOL.BusinessObject.LockedBy].ToString();
					LockedTime.Text = " @ " + _parentBizo[BOL.BusinessObject.LockedTime].ToString() + "<IMG onclick=\"javascript:popupEmailUser('" + _parentBizo[BOL.BusinessObject.LockedBy].ToString() + "');\" alt=\"Email user that locked this record\" title=\"Email user that locked this record\" id=\"EmailLockedByIcon\" border=\"0\" style=\"cursor:hand;\" runat=\"server\" hspace=\"5\" height=\"7\" src=\"../../Images/EmailLockedByUser.gif\" width=\"11\" />";

				}
				else
				{
					LockedBy.Text = "";
					LockedTime.Text = "";
				}
			}
        }

        # endregion

        #region  ---------------- Load Data Entry Form into Container  ----------

        /// <summary>
        /// Load special forms which are not table related
        /// </summary>
        /// <param name="tableName"></param>
        private void LoadNonTableForm(string tableName)
        {
            XmlNode configNode = _dataEntryController.GetConfigurationNode(tableName);
            if (configNode != null)
            {
                string staticFileName = XmlUtil.GetAttributeValue(configNode, "fileName", false);
                if (!string.IsNullOrEmpty(staticFileName))
                {
                    this.LoadStaticForm(staticFileName);
                }
            }
        }

        private void LoadDataEntryForm()
        {
            if (_dataEntryController.IsTable(TableName))
            {
                string staticFileName = _dataEntryController.GetStaticFileName(TableName);
                // if filename is defined load the static form
                if (!string.IsNullOrEmpty(staticFileName))
                {
                    this.LoadStaticForm(staticFileName);
                }
                // else load dynamic form
                else
                {
                    this.LoadDynamicForm();
                }
            }
            else
            {
                LoadNonTableForm(TableName);
            }
            // track dirty fields
            _dirtyFields.Clear();
            var inputs = CICHelper.GetCaisisInputControls(_dataEntryForm);
            inputs.ForEach(input => input.ValueChanged += MarkDirtyInputField);
        }

        // load dynamic form
        private void LoadDynamicForm()
        {

            _dataEntryForm = (BasePatientDataControl)this.LoadControl("DynamicDataEntryForm.ascx");
            this.formHolder.Controls.Add(_dataEntryForm);

            // reset dirty fields
            _dirtyFields.Clear();

            //int i = 0;
            //while (_bizos != null && i < _bizos.Count)
			for (int i = 0; i < _bizosList.Count; i++)
            {
                // IBusinessObject bizo = _bizos[i];

				List<IBusinessObject> sublist = _bizosList[i];
				IBusinessObject bizo = sublist[0];
                string tableName = _tableNames[i];
                bool isGridView = IsGridView(i);

                // add required tabbing
                if (i > 0 || isGridView)
                {
                    // add data entry tab control
                    AddDataEntryTabs(this._dataEntryForm);
                }

                if (isGridView) // display as a grid
                {
                    Control section = GetSectionContainer(tableName);
                    // create friendly title, omit record count on new 
                    string title = GetTabDisplayLabel(sublist, tableName);

                    var gridContainer = (BasePatientDataControl)this.LoadControl("DynamicDataEntryForm.ascx");
                    section.Controls.Add(gridContainer);
                    HtmlGenericControl tabLabel = _dataEntryTab.AddTab(title, section);
                    if (!_tabLabels.ContainsKey(tableName))
                    {
                        _tabLabels.Add(tableName, tabLabel);
                    }

                    var container = this.AddFormSeparator(tableName);
                    var grid = CICHelper.AddGridViewByTableName(gridContainer, sublist, _tableNames[i]);
                    var addBtn = gridContainer.FindControl(bizo.TableName + "_CGV_NewRow");
                    // attach new row click event
                    AttachAddNewGridRowClickEvent(gridContainer, bizo.TableName);

                    // track section
                    _sections.Add(tableName, section);
                }
                else
                {
                    List<ICaisisInputControl> cicList = CICHelper.GetCaisisInputControlsByTableName(_tableNames[i]);
                    this.FormatPageSection(cicList, _tableNames[i], !bizo.IsEmpty);                    
                }

				// this is never called for grids
                this.SetInputFieldValues(bizo);

                //i++;
            }
            if (_bizosList.Count == 1)
            {
                // add data entry tab control
                AddDataEntryTabs(this._dataEntryForm);
            }
        }

        // load static form 
        private void LoadStaticForm(string fileName)
        {
            string module = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(fileName, "DataEntryForms");
            string fullModulePath = Page.ResolveUrl("~/Modules/" + module + "/DataEntryForms/" + fileName);
            _dataEntryForm = (BasePatientDataControl)this.LoadControl(fullModulePath);

			#region old code
			//int i = 0;
			//while (_bizos != null && i < _bizos.Count)
			//{
			//    CICHelper.SetStaticFieldAttributes(_dataEntryForm.Controls, _tableNames[i]);

			//    i++;
			//}
			#endregion

            // for each table, set field attributes via metadata
            for (int i = 0; i < _bizosList.Count; i++)
            {
                string tableName = _tableNames[i];
                List<ICaisisInputControl> inputFields = CICHelper.GetCaisisInputControls(_dataEntryForm);
                foreach (ICaisisInputControl input in inputFields)
                {
                    if (!string.IsNullOrEmpty(input.Table) && !string.IsNullOrEmpty(input.Field))
                    {
                        var fieldMetadata = _dataEntryController.GetFieldMetadata(input.Table, input.Field);
                        CICHelper.SetCICAttributes(input, fieldMetadata);
                    }
                }
                //CICHelper.SetStaticFieldAttributes(_dataEntryForm.Controls,);
            }

            this.formHolder.Controls.Add(_dataEntryForm);

			#region old code
			//foreach (IBusinessObject bizo in _bizos)
			//{
			//    this.SetInputFieldValues(bizo);
			//}
			#endregion

			_bizosList.ForEach(x => SetInputFieldValues(x[0]));

            // dyanamically add grids to static forms if needed
            for (int i = 0; i < _bizosList.Count; i++)
            {
                List<IBusinessObject> sublist = _bizosList[i];
                IBusinessObject bizo = sublist[0];
                if (IsGridView(i))
                {
                    this.AddFormSeparator(_tableNames[i]);
                    CICHelper.AddGridViewByTableName(_dataEntryForm, sublist, _tableNames[i]);
                    // attach new row click event
                    AttachAddNewGridRowClickEvent(_dataEntryForm, bizo.TableName);
                }
            }
        }

        /// <summary>
        /// Attach an event handler to a grid's add new row button to update form, and add new rows
        /// </summary>
        /// <param name="container"></param>
        /// <param name="tableName"></param>
        private void AttachAddNewGridRowClickEvent(Control container, string tableName)
        {
            // locate grid button (if applicable)
            object addRowBtn = container.FindControl(tableName + "_CGV_NewRow");
            if (addRowBtn != null && addRowBtn is ImageButton)
            {
                ((ImageButton)addRowBtn).Click += new ImageClickEventHandler(HandleNewRowClicked);
            }
        }

        private void SetInputFieldValues(IBusinessObject bizo)
        {
            if (!Page.IsPostBack && bizo.IsEmpty == false)
            {
                CICHelper.SetFieldValues(_dataEntryForm.Controls, bizo);
            }
        }

        /// <summary>
        /// Handles saving of grid on new record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void HandleNewRowClicked(object sender, ImageClickEventArgs e)
        {
            if (this._primaryKeyValue == 0)
            {
                this.Save(false);
            }
        }

        # endregion

        # region ----------------- Formatting of Dynamic Output -----------------

        /// <summary>
        /// Gets a container for containing a table's controls
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        private Control GetSectionContainer(string tableName)
        {
            Panel section = new Panel();
            section.ID = tableName + "SectionHolder";
            section.CssClass = "PDSectionHolder";

            return section;
        }

        private Control AddFormSeparator(string tableName)
        {
            //if (tableName != _bizos[0].Tablename && _bizos.Count > 1)
			if (IsSubForm(tableName))
            {
                //Panel SectionLabelHolder = new Panel();
                //SectionLabelHolder.CssClass = "PDSectionHeader";
                //this._dataEntryForm.Controls.Add(SectionLabelHolder);

                //Image plusMinusImage = new Image();
                //plusMinusImage.ID = tableName + "PlusMinusImage";
                //plusMinusImage.ImageUrl = "~/Images/icon_minus.gif";
                //plusMinusImage.AlternateText = "Open SubForm Section";
                //plusMinusImage.Style.Add("padding", "2px");
                //plusMinusImage.Style.Add("cursor", "pointer");
                //SectionLabelHolder.Controls.Add(plusMinusImage);

                //Label SectionLabel = new Label();
                //SectionLabel.Text = _formNode.SelectSingleNode("//menuItem[@tableName='" + tableName + "']").Attributes["pageTitle"].Value;
                //SectionLabel.CssClass = "SubFormSectionTitle";
                //SectionLabelHolder.Controls.Add(SectionLabel);

                //// v6            
                //string tableLabel = CacheManager.GetTableLabel(tableName);
                //string tabTitle = !string.IsNullOrEmpty(tableLabel) ? tableLabel : tableName;

                //Tabs.AddTab(tabTitle, new Panel());
                return this._dataEntryForm;
            }
            return this._dataEntryForm;
        }

        /// <summary>
        /// Adds a column data entry layout for specificed controls
        /// </summary>
        /// <param name="controlList"></param>
        /// <param name="tableName"></param>
        /// <param name="hasRecord"></param>
        private void FormatPageSection(List<ICaisisInputControl> controlList, string tableName, bool hasRecord)
        {
            //int numOfColumns = 1;
            //string xpathExp = "//menuItem[@tableName='" + tableName + "']";
            //XmlNode n = _formNode.SelectSingleNode(xpathExp);
            //if (n != null && n.Attributes["numDisplayColumns"] != null && n.Attributes["numDisplayColumns"].Value != "")
            //{
            //    numOfColumns = int.Parse(n.Attributes["numDisplayColumns"].Value);
            //}
            this.AddFormSeparator(tableName);

            
            //Panel holder = new Panel();
            //p.Controls.Add(holder);

            //int TOTALCONTROLS = controlList.Count;
            //int ROWSPERCOLUMN = (TOTALCONTROLS / numOfColumns);// +1;

            //holder.CssClass = "PDFormCol";

            //holder.Style.Add("float", "left");

            //if (numOfColumns < 2)
            //{

            //    holder.Style.Remove("float");

            //}
            //int count = 0;
            //bool stop = true;
            // build interface

            // collect required fields

            //foreach (ICaisisInputControl cic in controlList)
            //{
            //    if (cic.Required)
            //    {
            //        _requiredFields.Add(cic);
            //    }
            //    if (count > ROWSPERCOLUMN && stop)
            //    {
            //        stop = false;
            //        holder = new Panel();
            //        holder.CssClass = "PDFormCol";

            //        holder.Style.Add("float", "right");
            //        p.Controls.Add(holder);
            //        count = 1;
            //    }

            //    Panel dRow = new Panel();
            //    dRow.CssClass = "DataEntryRow";
            //    dRow.Controls.Add((Control)cic);
            //    holder.Controls.Add(dRow);
            //    count++;
            //}

            // v6

            int numOfColumns = _dataEntryController.GetNumDisplayColumns(tableName);
            var commonDataElemnts = _dataEntryController.GetCommonDataElements(tableName);
            // create section container
            Control section = GetSectionContainer(tableName);
            // load and build column layout
            ColumnDataEntry colData = LoadControl("DataEntryControls/ColumnDataEntry.ascx") as ColumnDataEntry;
            colData.BuildLayout(controlList, numOfColumns, commonDataElemnts);
            // add data entry to section
            section.Controls.Add(colData);
            // add to container
            if (IsSubForm(tableName))
            {
                // add data entry tab control
                AddDataEntryTabs(this._dataEntryForm);
                // display friendly title, indicating table
                string title = _dataEntryController.GetTableLabel(tableName) + (hasRecord ? "(1)" : "");
                // add section to tab
                HtmlGenericControl tabLabel = _dataEntryTab.AddTab(title, section);
                if (!_tabLabels.ContainsKey(tableName))
                {
                    _tabLabels.Add(tableName, tabLabel);
                }
            }
            else
            {
                // add section to main data entry
                this._dataEntryForm.Controls.Add(section);
            }
            // track section
            _sections.Add(tableName, section);

            // track required fields
            _requiredFields.AddRange(controlList.Where(c => c.Required));           
        }

        /// <summary>
        /// Marks the input field as "dirty"
        /// </summary>
        /// <param name="input"></param>
        /// <param name="e"></param>
        protected void MarkDirtyInputField(ICaisisInputControl input, EventArgs e)
        {
            if (!_dirtyFields.Contains(input))
            {
                _dirtyFields.Add(input);
            }
        }

        /// <summary>
        /// Returns the formatted title to display on tabs
        /// </summary>
        /// <param name="bizos"></param>
        /// <param name="tableName"></param>
        /// <returns></returns>
        protected string GetTabDisplayLabel(IEnumerable<IBusinessObject> bizos, string tableName)
        {
            int recordCount = bizos.Where(b => !b.IsEmpty).Count();
            string tabTitle = _dataEntryController.GetTableLabel(tableName) + (recordCount > 0 ? " (" + recordCount + ")" : "");
            return tabTitle;
        }

        /// <summary>
        /// Adds a DataEntry Tab control for holding child forms
        /// </summary>
        private TabDataEntry AddDataEntryTabs(Control container)
        {
            if (container != null && _dataEntryTab == null)
            {
                _dataEntryTab = this.LoadControl("DataEntryControls/TabDataEntry.ascx") as TabDataEntry;
                
                Panel tabHolder = new Panel();
                tabHolder.Style["margin"] = "8px";
                tabHolder.Controls.Add(_dataEntryTab);
                container.Controls.Add(tabHolder);

                // get relevant forms (excluding current forms)
                if (_tableName.Equals("Patients"))
                {
                    return _dataEntryTab;
                }
                // get more table names, else use parent
                var moreTableNames =  _dataEntryController.GetChildDataEntryForms(_tableName).Except(_tableNames); ;
                if (moreTableNames.Count() == 0)
                {
                    string parentTableName = _tableNames.First();
                    if (!parentTableName.Equals("Patients") && parentTableName == _dataEntryController.GetParentTableName(_tableName))
                    {
                        moreTableNames = _dataEntryController.GetChildDataEntryForms(parentTableName).Except(_tableNames);
                    }
                }
                // no more tabs
                if (moreTableNames.Count() == 0)
                {
                    return _dataEntryTab;
                }

                // order by nane
                var moreTables = from table in moreTableNames
                                 let tableLabel = _dataEntryController.GetTableLabel(table)
                                 orderby tableLabel
                                 select new
                                 {
                                     TableName = table,
                                     TableLabel = tableLabel
                                 };
                // START STAGGERING tabs into columns left: 1st half sorted, right: 2nd half sorted
                int tableCount = moreTables.Count();
                int leftCount = tableCount / 2 + (tableCount % 2);
                var left = moreTables.Skip(0).Take(leftCount);
                var right = moreTables.Except(left);
                var staggeredTables = from index in Enumerable.Range(0, leftCount)
                                      // select 1 value from each list by index
                                      select left.Where((c, i) => i == index).Concat(right.Where((c, i) => i == index));
                moreTables = staggeredTables.SelectMany(t => t).Distinct();
                // END STAGGERING

                // for each sub table, build more tab
                foreach (var moreTable in moreTables)
                {
                    string table = moreTable.TableName;
                    string tableLabel = moreTable.TableLabel;

                    LinkButton moreLink = new LinkButton();
                    // add client script
                    moreLink.OnClientClick = "return loadNextTabClick();";
                    moreLink.Text = tableLabel;
                    // add more tab
                    _dataEntryTab.AddMoreTab(moreLink);
                    // add click handler to redirect to the location
                    moreLink.Click += (o, e) =>
                        {
                            string formDoSave = Request.Form["nextTabSave"];
                            bool doSave = SaveBtn.Enabled && !string.IsNullOrEmpty(formDoSave) && bool.Parse(formDoSave);
                            // save current form
                            if (doSave)
                            {
                                Save(false);
                            }
                            // append to current list of tables
                            var tableNames = _tableNames.Concat(new string[] { table }).Distinct().ToArray();
                            // modify (copy) query params
                            Dictionary<string, string> queryParams = Request.QueryString.Keys.Cast<string>().ToDictionary(a => a, a => Request.QueryString[a]);
                            string queryTableNames = string.Join(",", tableNames);
                            queryParams["tableNames"] = queryTableNames;
                            // build new url (focus on tab)
                            string tabId = _dataEntryTab.ClientID;
                            int tabIndex = tableNames.Count() - 2;
                            // pass along edit mode ???
                            queryParams["edit"] = SaveBtn.Enabled.ToString();

                            // determine if working with a valid record
                            IBusinessObject b = _bizosList[0][0];
                            if (!b.IsNull(b.PrimaryKeyName) && (int)b[b.PrimaryKeyName] == this.PrimaryKey)
                            {
                                queryParams["primKey"] = this.PrimaryKey.ToString();
                            }
                            // add tab
                            queryParams["tabIndex"]= tabIndex.ToString();

                            // redirect with new tab added
                            string redirectURL = "PatientDataEntryContainer.aspx?" + PageUtil.CreateUrlPairs(queryParams) + "#tabId=" + tabId + "&tabIndex=" + tabIndex;
                            Response.Redirect(redirectURL);
                        };
                }

            }
            return _dataEntryTab;
        }      

        /// <summary>
        /// Overriden in order to register client side events with
        /// available ClientID's
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
			if (!_deletedPatient)
			{
				List<string> sectionIds = AddClientOpenCloseScript();
				RegisterClientSideValidation(sectionIds);
				SetPatientInHeader();
				SetAuditLink();                
			}

            base.Render(writer);
        }

        /// <summary>
        /// Updates the User In Session as well as in the header (parent page). Handles just the Demographics form when 
        /// a user updates the patient name or death date.
        /// </summary>
        private void SetPatientInHeader()
		{
			#region old code
			//foreach (BusinessObject biz in _bizos)
			//{
			//    if (biz is Patient)
			//    {
			//        PatientController ptController = new PatientController();
			//        ptController.PutPatientInSession(Page, biz as Patient);
			//    }
			//}
			#endregion

			foreach (List<IBusinessObject> list in _bizosList)
			{
				Patient patient = list[0] as Patient;
				if (patient != null)
				{
					PatientController ptController = new PatientController();
					ptController.PutPatientInSession(Page, patient);
				}
			}
		}

        /// <summary>
        /// Enables viewing of record audit when record has been updated at least once.
        /// </summary>
        private void SetAuditLink()
        {
            if (!string.IsNullOrEmpty(UpdatedBy.Text))
            {
                string tableArray = "";
                foreach (string table in this._tableNames)
                {
                    tableArray += table + ",";
                }
                AuditLink.Visible = true;
                string enteredBy = EnteredBy.Text;
                if (enteredBy.Contains("datafeed"))
                {
                    AuditLinkImage.Src = "~/Images/AuditIcon_DataFeed.png";
                }
                else
                {
                    AuditLinkImage.Src = "~/Images/ViewAuditLogIcon.gif";
                }
                tableArray = tableArray.Remove(tableArray.Length - 1);
                // Open in a new window
                //AuditLink.Target = "_blank";
                //AuditLink.NavigateUrl = "../Utilities/ViewRecordAudit.aspx?tableNames=" + tableArray + "&tablePriKey=" + Caisis.Security.CustomCryptoHelper.Encrypt(this.PrimaryKey.ToString());
                // Open in a Modal Window
                AuditLink.Attributes.Add("onclick", "top.showModal('../Utilities/ViewRecordAudit.aspx?tableNames=" + tableArray + "&tablePriKey=" + Caisis.Security.CustomCryptoHelper.Encrypt(this.PrimaryKey.ToString()) + "'); return false;");
                AuditLink.NavigateUrl = "javascript:;";
            }
            else
            {
                AuditLink.Visible = false;
                AuditLinkImage.Src = string.Empty;
            }
        }

        /// <summary>
        /// If there are sub forms in the page, an onclick event will
        /// fire on the client to open close the sub section
        /// </summary>
        private List<string> AddClientOpenCloseScript()
        {
            return _sections.Select(s => s.Value.ClientID).ToList();
            //List<string> sectionIds = new List<string>();

            //foreach (string table in _tableNames)
            //{
            //    WebControl section = this._dataEntryForm.FindControl(table + "SectionHolder") as WebControl;
            //    Image plusMinusImage = this._dataEntryForm.FindControl(table + "PlusMinusImage") as Image;
            //    if (section != null)
            //    {
            //        sectionIds.Add(section.ClientID);

            //        if (plusMinusImage != null)
            //        {
            //            ((Image)plusMinusImage).Attributes.Add("onclick", "showHideSubForm('" + section.ClientID + "',this);");
            //            // default layer to open?
            //            string xpathExp = "//menuItem[@tableName='" + table + "']";
            //            XmlNode n = _formNode.SelectSingleNode(xpathExp);
            //            if (n != null && n.Attributes["displayOpened"] != null)
            //            {
            //                bool displayOpened = bool.Parse(n.Attributes["displayOpened"].Value);
            //                // collapse if not displayed open
            //                if (!displayOpened)
            //                {
            //                    // hide sub section
            //                    section.Style["display"] = "none";
            //                    // adjust plus/minus icon
            //                    plusMinusImage.ImageUrl = "~/Images/icon_plus.gif";
            //                }
            //            }
            //        }
            //    }
            //}

            //return sectionIds;
        }

        private string BuildJsSectionArray(List<string> sectionIds)
        {
            if (sectionIds.Count() > 0)
            {
                return "'" + string.Join("','", sectionIds.ToArray()) + "'";
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Registers validation array on page render
        /// </summary>
        private void RegisterClientSideValidation(List<string> sectionIds)
        {
            string sectionArray = BuildJsSectionArray(sectionIds);

            // If Required Fields existm build JS array used for client side validation
            if (_requiredFields.Count > 0)
            {
                string js = "";
                foreach (Control c in _requiredFields)
                {
                    js += "['" + c.ClientID + "','" + ((ICaisisInputControl)c).Field + "','" + ((ICaisisInputControl)c).Table + "'],";
                }
                js = js.Remove(js.Length - 1); // Remove last "," from array declration
                string oldSaveBtnClick = SaveBtn.OnClientClick;
                string oldLockBtnClick = LockBtn.OnClientClick;

                SaveBtn.OnClientClick = "if (checkAndValidateSections()) { " + oldSaveBtnClick + " } else { return false; }";
                LockBtn.OnClientClick = "if (checkAndValidateSections()) { " + oldLockBtnClick + " } else { return false; }";

                // Register Startup Array for Required Fields
                Page.ClientScript.RegisterArrayDeclaration("requiredFields", js);
            }
            else
            {
                Page.ClientScript.RegisterArrayDeclaration("requiredFields", "");
                string oldSaveBtnClick = SaveBtn.OnClientClick;
                string oldLockBtnClick = LockBtn.OnClientClick;

                SaveBtn.OnClientClick = "if (checkSections()) { " + oldSaveBtnClick + " } else { return false; }";
                LockBtn.OnClientClick = "if (checkSections()) { " + oldLockBtnClick + " } else { return false; }";
            }

            // Register Startup Array for Sections
            Page.ClientScript.RegisterArrayDeclaration("sectionIdList", sectionArray);
        }
        # endregion

        # region  ---------------- Handle Button Events   ------------------------

        protected void DataEntryButtonClick(object sender, CommandEventArgs e)
        {
            string button = e.CommandName;

            switch (button)
            {
                case "New":
                    LoadNewForm();
                    break;

                case "Edit":
                    IsFormEnabled = true;
                    SetEnteredUpdatedLockedInfo();
                    SetButtons();
                    break;

                case "Save":
                    if (Save(false)) { break; }
                    IsFormEnabled = false;
                    SetButtons();
                    SetEnteredUpdatedLockedInfo();
                    SetTitleAndBreadCrumbTrail();
                    RefreshChronologicalList();
                    SetSubFormMenu();
                    break;

                case "Lock":
                    if (Save(true)) { break; }
                    IsFormEnabled = false;
                    SetButtons();
                    SetEnteredUpdatedLockedInfo();
                    SetTitleAndBreadCrumbTrail();
                    RefreshChronologicalList();
                    SetSubFormMenu();
                    break;

                case "Unlock":
                    // enable save validation
					//_bizos[0].EnableSaveValidation(new SessionHandler(Page).GetPatientId());
					//_bizos[0].Unlock();
					_bizosList[0][0].EnableSaveValidation(new SessionHandler(Page).GetPatientId());
					_bizosList[0][0].Unlock();
                    IsFormEnabled = true;
                    SetButtons();
                    SetEnteredUpdatedLockedInfo();
                    SetSubFormMenu(); // more menu options may be available after unlocking
                    break;

                case "Cancel":
                    ReloadForm();
                    break;

                case "Delete":
                    Delete();
                    break;
            }
        }


        /// <summary>
        /// Insert or update the record(s) contained in Business Object
        /// </summary>
        /// <param name="lockIt">lock the record on save</param>
        /// <returns>were errors thrown: true/false</returns>
        private bool Save(bool lockIt)
        {
            try
            {
                // validation will be moved to middle tier when rules engine built
                CICHelper.ValidFieldValues(_dataEntryForm.Controls);
				int parentKeyValue = ParentKey;
				IBusinessObject bizo;

                //for (int i = 0; i < _bizos.Count; i++)
				for (int i = 0; i < _bizosList.Count; i++)
                {

                    // enable save validation
                    //_bizos[i].EnableSaveValidation(new SessionHandler(Page).GetPatientId());
					int sessionPatientId = new SessionHandler(Page).GetPatientId();
					_bizosList[i].ForEach(b => b.EnableSaveValidation(sessionPatientId));
					bizo = _bizosList[i][0]; // used to get tablenames and various info that should be the same for all items in _bizosList[i]
					string tablename = bizo.TableName;

					//int parentKeyValue = ParentKey;
					//if (i > 0)
					//{
					//    // for child forms (i>0), parent key is the primary key of the parent form(_bizo[0]).
					//    parentKeyValue = (int)_bizos[0][_bizos[0].PrimaryKeyName];
					//}
					
					// move this to the bottom, after saving

                    // save the grid
                    //if (IsGridView(_bizos[i].Tablename))

					bool grid = IsGridView(tablename);

					if (grid)
                    {
                        // If its a new grid record, we need to set the parent key before saving it
						//if (_bizos[i][_bizos[i].PrimaryKeyName].ToString() == "")
						//{
						//    _bizos[i][_bizos[i].ParentKeyName] = parentKeyValue;
						//}
						if (!bizo.PrimaryKeyHasValue)
							bizo[bizo.ParentKeyName] = parentKeyValue;

                        // locate grid
                        CaisisGridView cgv = null;
                        if (_sections.ContainsKey(tablename))
                        {
                            cgv = PageUtil.DeepFindControl(_sections[tablename], tablename + "_CGV") as CaisisGridView;
                        }
                        else
                        {
                            cgv = PageUtil.DeepFindControl(_dataEntryForm, tablename + "_CGV") as CaisisGridView;
                        }                        
                        if (cgv != null)
                        {
                            cgv.Save();
                        }
                    }
                    // save the form
                    else
                    {
                        // CICHelper.SetBOValues(_dataEntryForm.Controls, _bizos[i], parentKeyValue);
						//if (lockIt && _bizos[i].IsLockable)
						//    _bizos[i].Lock();
						//else
						//    _bizos[i].Save();

                        foreach (IBusinessObject b in _bizosList[i])
                        {
                            bool doSave = true;
                            // for new records, validate fields have been modified
                            if (!b.PrimaryKeyHasValue)
                            {
                                // validate that there are fields which have a value before saving
                                var validInputs = from input in CICHelper.GetCaisisInputControls(_dataEntryForm)
                                                  where input.Table == b.TableName
                                                  where (input is CheckBox) ? (input as CheckBox).Checked : !string.IsNullOrEmpty(input.Value)
                                                  select input;
                                doSave = validInputs.Count() > 0;
                            }
                            if (doSave)
                            {
                                CICHelper.SetBOValues(_dataEntryForm.Controls, b, parentKeyValue);
                                if (lockIt && b.IsLockable)
                                    b.Lock();
                                else
                                    b.Save();
                            }
                        }

                        if (i == 0)
                        {
							////if (_bizos[i].RecordCount == 0)
							////{
							////    UserMessage.Text = "You must enter data in the parent section.";
							////    return true;
							////}
							////else
							////{
							//// if multiple forms on the page PrimaryKey is always the value of the parent form: must happen after saving so new primary keys exist after insert
							//this.PrimaryKey = (int)_bizos[0][_bizos[0].PrimaryKeyName];
							////}
                            if (!bizo.IsNull(bizo.PrimaryKeyName))
                                this.PrimaryKey = (int)bizo[bizo.PrimaryKeyName];
                        }
                    }

					// set the parent key for subsequent saves
					// skip for top-level grids
                    if (i == 0 && !grid && !bizo.IsNull(bizo.PrimaryKeyName))
						parentKeyValue = (int) bizo[bizo.PrimaryKeyName];
                    
                }
                // !important, refresh biz list to get accurate count
                BuildBusinessObjects();

                // adjust tab labels after save
                foreach (var bList in _bizosList)
                {
                    string tableName = bList[0].TableName;
                    if (_tabLabels.ContainsKey(tableName))
                    {
                        HtmlGenericControl tabLabel = _tabLabels[tableName];
                        string tabTitle = GetTabDisplayLabel(bList, tableName);
                        tabLabel.InnerText = tabTitle;
                    }
                }
            }
            catch (RequiredValueException e)
            {
                UserMessage.Text = "Fields denoted below are required.";
                return true;
            }
            catch (NoNullAllowedException e)
            {
                UserMessage.Text = e.Message;
                return true;
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                // TODO: Parse error message for display

                // TODO: handle
                // Disallowed implicit conversion from data type ntext to data type varchar, table 'DUROPmsk.dbo.Status', column 'StatusNotes'. Use the CONVERT function to run this query. 
                // String or binary data would be truncated. The statement has been terminated.

                try
                {
                    if (e.Message.Contains("truncated"))
                    {
                        UserMessage.Text = "Too much data was entered into one of the fields on the page. Please review your data entry.";
                    }
                    else if (e.Message.StartsWith("Disallowed implicit conversion") && e.Message.Contains("column"))
                    {
                        int start = e.Message.IndexOf("column");
                        int firstquote = e.Message.IndexOf('\'', start);
                        int nextquote = e.Message.IndexOf('\'', firstquote + 1);
                        string field = e.Message.Substring(firstquote + 1, nextquote - firstquote - 1);
                        UserMessage.Text = String.Format("Too much data was entered into the {0} field.", field);
                    }
                    else
                    {
                        UserMessage.Text = e.Message;
                    }
                }
                catch
                {
                    UserMessage.Text = e.Message;
                }


                return true;
            }
            catch (UniqueKeyConstraintException e)
            {
                UserMessage.Text = "Constraint violation. Please confirm that this record<br>has not already been entered for this patient.";
                return true;
            }
            // catch other exception thrown from Middle Tier

            return false;
        }

        private void Delete()
        {
            try
            {
                // enable save validation
				//_bizos[0].EnableSaveValidation(new SessionHandler(Page).GetPatientId());

				//_bizos[0].Delete();

                // validate user has delete data permission
                if (PermissionManager.HasPermission(PermissionManager.DeleteData))
                {
                    int sessionPatientId = new SessionHandler(Page).GetPatientId();

                    foreach (IBusinessObject b in _bizosList[0])
                    {
                        // if deleting patient record, verify permission, otherwise has delete data permission
                        bool canDelete = b is Patient ? PermissionManager.HasPermission(PermissionManager.DeletePatient) : true;

                        if (canDelete)
                        {
                            b.EnableSaveValidation(sessionPatientId);
                            b.Delete();
                        }
                        else
                        {
                            // throw exception ???
                        }
                    }

                    //if (_bizos[0] is Patient)
                    if (_bizosList[0][0] is Patient)
                    {
                        SessionHandler sh = new SessionHandler(Page);
                        sh.ClearCurrentPatient();
                        // redirect to Dashboard
                        string splashPagePath = Page.ResolveUrl("~/Core/Utilities/Dashboard.aspx");
                        string msg = @"alert('The patient and associated data have been removed from the database.'); window.top.location = '" + splashPagePath + "';";

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "deletePatientMessage", msg, true);

                        _deletedPatient = true;
                    }
                    else
                    {
                        LoadNewForm();
                    }
                }
                else
                {
                    //throw exception ??
                }
            }
            catch (ChildDataPreventsDeleteException cde)
            {
                IsFormEnabled = true;
                SetEnteredUpdatedLockedInfo();
                SetButtons();
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "validationMessage", "alert('" + cde.Message.Replace("\n", "\\n") + "');", true);
            }
        }

        private void SetButtons()
        {

            bool isOneToMany = this.HasSiblings;
            bool isFormEnabled = this.IsFormEnabled;
            bool isLocked = this.IsRecordLocked;
            bool isNew = true;

            // v4.1
            if (_parentBizo != null && _parentBizo.IsEmpty == false)
            {
                isNew = false;
            }
            // v4.0 // if (PrimaryKey > 0) { isNew = false; };

            // Default to all buttons disabled
            // SetButtonStates(false, false, false, false, false, false, false);
            // SetButtonVisibility(true, true, true, true, false, true, true);

            // buttons can be in any of the following configurations:
            if (_parentBizo == null) // zero position bizo is always the parent
            {
                // hide all buttons
                SetButtonStates(false, false, false, false, false, false, false);

                return;
            }

            if (isOneToMany)
            {
                if (isNew)
                {
                    // New One to Many Form 
                    SetButtonVisibility(true, true, true, true, false, true, true);
                    SetButtonStates(false, false, true, true, false, true, false);

                }
                else
                {
                    if (isLocked)
                    {
                        // Populated One to Many Disabled Locked Form
                        SetButtonVisibility(true, true, true, false, true, true, true);
                        SetButtonStates(true, false, false, false, true, false, false);
                    }
                    else
                    {

                        if (isFormEnabled)
                        {
                            // Populated One to Many Enabled Unlocked Form
                            SetButtonVisibility(true, true, true, true, false, true, true);
                            SetButtonStates(false, false, true, true, false, true, true);
                        }
                        else
                        {
                            // Populated One to Many Disabled Unlocked Form
                            SetButtonVisibility(true, true, true, true, false, true, true);
                            SetButtonStates(true, true, false, false, false, false, false);
                        }
                    }
                }
            }
            else
            {
                if (isNew)
                {
                    // New One to One Form
                    SetButtonVisibility(false, true, true, true, false, true, true);
                    SetButtonStates(false, false, true, true, false, true, false);

                }
                else
                {
                    if (isLocked)
                    {

                        // Populated One to One Disabled Locked Form
                        SetButtonVisibility(false, true, true, false, true, true, true);
                        SetButtonStates(false, false, false, false, true, false, false);

                    }
                    else
                    {
                        if (isFormEnabled)
                        {
                            // Populated One to One Enabled Unlocked Form
                            SetButtonVisibility(false, true, true, true, false, true, true);
                            SetButtonStates(false, false, true, true, false, true, true);

                        }
                        else
                        {
                            // Populated One to One Disabled Unlocked Form
                            SetButtonVisibility(false, true, true, true, false, true, true);
                            SetButtonStates(false, true, false, false, false, false, false);

                        }
                    }
                }
            }
        }

        private void SetButtonStates(bool enableNewBtn, bool enableEditBtn, bool enableSaveBtn, bool enableLockBtn, bool enableUnlockBtn, bool enableCancelBtn, bool enableDeleteBtn)
        {
            bool canUnlockRecords = false;
            bool canDeleteRecords = false;
            bool canAddEditRecords = false;

            if (PermissionManager.HasPermission(PermissionManager.UnlockData)) canUnlockRecords = true;
            if (PermissionManager.HasPermission(PermissionManager.DeleteData)) canDeleteRecords = true;
            if (PermissionManager.HasPermission(PermissionManager.EditData)) canAddEditRecords = true;

            bool userLockedRecord = IsCurrentUserTheOneWhoLockedTheRecord();
            bool canUserDeletePatient = IsCurrentUserAllowedToDeletePatientRecord();
            bool editingPatient = IsEditingPatientRecord();

            // new
            if (enableNewBtn && canAddEditRecords) { NewBtn.Enabled = true; NewBtn.ImageUrl = "~/Images/DataEntryButtons/Button_New_On.gif"; NewBtn.CssClass = "PDButtonOn"; } else { NewBtn.Enabled = false; NewBtn.ImageUrl = "~/Images/DataEntryButtons/Button_New_Off.gif"; NewBtn.CssClass = "PDButtonOff"; }

            // edit
            if (enableEditBtn && canAddEditRecords) { EditBtn.Enabled = true; EditBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Edit_On.gif"; EditBtn.CssClass = "PDButtonOn"; } else { EditBtn.Enabled = false; EditBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Edit_Off.gif"; EditBtn.CssClass = "PDButtonOff"; }

            // save
            if (enableSaveBtn && canAddEditRecords) { SaveBtn.Enabled = true; SaveBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Save_On.gif"; SaveBtn.CssClass = "PDButtonOn"; } else { SaveBtn.Enabled = false; SaveBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Save_Off.gif"; SaveBtn.CssClass = "PDButtonOff"; }

            // cancel
            if (enableCancelBtn) { CancelBtn.Enabled = true; CancelBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Cancel_On.gif"; CancelBtn.CssClass = "PDButtonOn"; } else { CancelBtn.Enabled = false; CancelBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Cancel_Off.gif"; CancelBtn.CssClass = "PDButtonOff"; };

            // lock
            if (enableLockBtn && canAddEditRecords) { LockBtn.Enabled = true; LockBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Lock_On.gif"; LockBtn.CssClass = "PDButtonOn"; } else { LockBtn.Enabled = false; LockBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Lock_Off.gif"; LockBtn.CssClass = "PDButtonOff"; }

            // unlock
            if (enableUnlockBtn && (canUnlockRecords || userLockedRecord)) { UnlockBtn.Enabled = true; UnlockBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Unlock_On.gif"; UnlockBtn.CssClass = "PDButtonOn"; }
            else
            {
                UnlockBtn.Enabled = false;
                UnlockBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Unlock_Off.gif";
                UnlockBtn.CssClass = "PDButtonOff";
            }

            // delete
            if (enableDeleteBtn && canDeleteRecords && (!editingPatient || canUserDeletePatient)) { DeleteBtn.Enabled = true; DeleteBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Delete_On.gif"; DeleteBtn.CssClass = "PDButtonOn"; }
            else
            {
                DeleteBtn.Enabled = false;
                DeleteBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Delete_Off.gif";
                DeleteBtn.CssClass = "PDButtonOff";
            }
        }

        private void SetButtonVisibility(bool showNewBtn, bool showEditBtn, bool showSaveBtn, bool showLockBtn, bool showUnlockBtn, bool showCancelBtn, bool showDeleteBtn)
        {
            NewBtn.Visible = showNewBtn;
            EditBtn.Visible = showEditBtn;
            SaveBtn.Visible = showSaveBtn;
            LockBtn.Visible = showLockBtn;
            UnlockBtn.Visible = showUnlockBtn;
            CancelBtn.Visible = showCancelBtn;
            DeleteBtn.Visible = showDeleteBtn;
        }

        # endregion

        # region  ---------------- Helper Methods   ------------------------------

        /// <summary>
        /// Registers a client script for invoking save click.
        /// </summary>
        private void RegisterDoSaveScript()
        {
            // register a special script for invoking save click client side
            if (SaveBtn.Enabled)
            {
                PageUtil.RegitserControlPostBackScript(SaveBtn, "_doSaveClick");
            }
            
        }

        /// <summary>
        /// 
        /// </summary>
        private void HandleNextSessionPatient()
        {
            string nextPatientId = Request.Form != null ? Request.Form["nextEPID"] : null;

            // if a new patient was set, load
            if (!string.IsNullOrEmpty(nextPatientId))
            {
                string loadNewPatientScript = "if(top.navigateToPatient) { top.navigateToPatient('" + nextPatientId + "'); }";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "loadNewPatientScript", loadNewPatientScript, true);
            }
        }

        /// <summary>
        /// Registers a client script for updating the chron list
        /// </summary>
        private void RefreshChronologicalList()
        {
            string refreshChronScript = "parent.refreshChronList();";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "REFRESHSCRIPT", refreshChronScript, true);
            
            //string strJScript = "<SCRIPT LANGUAGE=javascript>";
            //strJScript += "parent.refreshChronList()";
            //strJScript += "</SCRIPT>";
            //RegisterStartupScript("REFRESHSCRIPT", strJScript);
        }

        /// <summary>
        /// Returns if the table (specified by index) should be displayed as a grid (tabular data entry)
        /// </summary>
        /// <param name="listPosition"></param>
        /// <returns></returns>
        private bool IsGridView(int listPosition)
        {
            string tableName = _tableNames[listPosition];
            return IsGridView(tableName);
        }

        /// <summary>
        /// Returns if the table should be displayed as a grid (tabular data entry)
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        private bool IsGridView(string tableName)
        {
            return _dataEntryController.IsGridView(tableName);
        }

        private bool IsSubForm(string tableName)
        {
            return tableName != _bizosList[0][0].TableName && _bizosList.Count > 1;
        }

        private bool IsCurrentUserTheOneWhoLockedTheRecord()
        {
            string lockedBy = "";
			//if (_parentBizo != null && _parentBizo.RecordCount > 0 && _parentBizo.IsLockable && _parentBizo.DataSourceView.Table.Rows[0][BusinessObject.BusinessObject.LockedBy] != null)
			//{
			//    lockedBy = _parentBizo.DataSourceView.Table.Rows[0][BusinessObject.BusinessObject.LockedBy].ToString();
			//}

			if (_parentBizo != null && _parentBizo.IsLocked)
				lockedBy = _parentBizo[BOL.BusinessObject.LockedBy].ToString();

            SecurityController sc = new SecurityController();
            if (lockedBy.Equals(sc.GetUserName()))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Returns if the current User has permission to delete Patient.
        /// </summary>
        /// <returns></returns>
        private bool IsCurrentUserAllowedToDeletePatientRecord()
        {
            return PermissionManager.HasPermission(PermissionManager.DeletePatient);
        }

        /// <summary>
        /// Returns if one of the current tables being edited is the Patient table record.
        /// </summary>
        /// <returns></returns>
        private bool IsEditingPatientRecord()
        {
            // flatten list to include only Patient bizo
            var patientBizos = _bizosList.SelectMany(bl => bl.OfType<BOL.Patient>());
            // if there are Patient bizo, editing Patient
            bool editingPatient = patientBizos.Count() > 0;
            return editingPatient;
        }

        private void RegisterPatientDeleteValidation()
        {
            // when editing Patient's (Demographics) form, restricted tables must be deleted first
            if (IsEditingPatientRecord() && DeleteBtn.Enabled)
            {
                int patientId = new SessionHandler(Page).GetPatientId();
                PatientController pc = new PatientController();
                DataTable dt = pc.ValidatePatientDeleteConstraints(patientId);
                // only need special message when restrictions exists
                if (dt.Rows.Count > 0)
                {
                    List<string> tableMessages = new List<string>();
                    foreach (DataRow row in dt.Rows)
                    {
                        string tableName = row["TableName"].ToString();
                        string friendlyTableName = _dataEntryController.GetTableLabel(tableName);
                        string tableCount = row["TableCount"].ToString();
                        string safeDeleteMessage = string.Format("{0}: {1} Record(s)", PageUtil.EscapeSingleQuotes(friendlyTableName), tableCount);

                        tableMessages.Add(safeDeleteMessage);
                    }
                    string clientTableListing = string.Join("\\n", tableMessages.ToArray());
                    string fullClientMessage = "alert('You must delete the following records manually before deleting this patient\\n\\n" + clientTableListing + "');";
                    DeleteBtn.OnClientClick = fullClientMessage + " return false;";
                }

            }
            else
            {
                //DeleteBtn.OnClientClick = "";
            }
            
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "PatientChildTableDeleteDependency", fullClientMessage, true);
        }

        /// <summary>
        /// Sets the currently active tab if applicable
        /// </summary>
        private void SetActiveTabIndex()
        {
            if (_dataEntryTab != null)
            {
                int? prevIndex = _dataEntryTab.GetPersistedTabIndex();
                string tabIndex = Request.QueryString["tabIndex"];
                if (prevIndex.HasValue)
                {
                    _dataEntryTab.ActiveTabIndex = prevIndex.Value;
                    _dataEntryTab.ActiveTabFocused = !Page.IsPostBack;
                }
                else if (!string.IsNullOrEmpty(tabIndex) && PageUtil.IsInteger(tabIndex))
                {
                    _dataEntryTab.ActiveTabIndex = int.Parse(tabIndex);
                    _dataEntryTab.ActiveTabFocused = !Page.IsPostBack;
                }                 
            }
        }

        // should the parent form be populated?  url variable set in sub form menu so we know parent form should be populated
        private bool IsNewChildRecord()
        {
            if (Request.QueryString["newChildRecord"] != null && Request.QueryString["newChildRecord"].Equals("true"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void LoadNewForm()
        {
            Response.Redirect(Request.Path + "?tableName=" + TableName + "&reloadChronList=true");
        }

        private void ReloadForm()
        {
            Response.Redirect(Request.Url.PathAndQuery);
        }

        # endregion
    }
}
