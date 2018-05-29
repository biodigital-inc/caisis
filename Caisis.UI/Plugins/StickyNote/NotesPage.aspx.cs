using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

using Caisis.UI.Core;
using Caisis.UI.Core.Classes;
using Caisis.Security;
using Caisis.BOL;
using Caisis.DataAccess;


namespace Caisis.UI.Plugins
{
    public partial class Plugins_StickyNote_NotesPage : System.Web.UI.Page
    {
        private int _patientId;
        private int _recordId;
        private int _userId;
        private string _tableName;
        private int _defaultNoteId;

        protected void Page_Load(object sender, EventArgs e)
        {
            SetLocalsFromUrlVariables();

            if (!Page.IsPostBack)
            {
                LoadNotifyUserDropDownItems();
                GetStickies();
            }
        }

        protected void LoadNotifyUserDropDownItems()
        {
            // call in BO next release
            UserDa da = new UserDa();
            DataTable dt = da.GetActiveUsersInDataset((int)Session[SessionKey.DatasetId]);

            NotifyWho.DataSource = dt.DefaultView;
            NotifyWho.DataTextField = "UserLastCommaFirst";
            NotifyWho.DataValueField = "UserId";
            NotifyWho.DataBind();
        }

        // get all notes and default to note passed in on url
        protected void GetStickies()
        {
			//Notifications notes = new Notifications(); 
			//// return all the stickies for this patient
			//notes.GetByParent(_patientId);

			IEnumerable<Notifications> notes = BusinessObject.GetByParent<Notifications>(_patientId);

            if (_defaultNoteId != 0)
            {
                // display default record; passed in from parent page
                //DataRow[] dr = notes.GetTable().Select("NotificationId = " + _defaultNoteId + "");
				DataRow[] dr = notes.AsDataView().Table.Select("NotificationId = " + _defaultNoteId + "");
                this.SetStickyData(dr[0]);
            }
            else
            {
                // set defaults for new note 
                this.SetNewNoteDefaults();
            }

            this.SetNotesPaging(notes);
        }
        
        // if more than one note for the patient allow user to view them
        private void SetNotesPaging(IEnumerable<Notifications> notes)
        {
            // allow user to navigate through notes
            string previousRecordId = "0";
            string nextRecordId = "0";
            string currentRecordId = "0";
            int currentRecordIndex = 1;
            int nextRecordIndex = 1;

			int count = notes.Count();

            if (count > 0)
            {
                StickyNotePageTitle.Text = "Sticky Note #";
                NewBtn.Visible = true;

                if (_defaultNoteId == 0) // empty note being displayed
                {

                    // add one to the last count i.e. 5/5 
                    currentRecordIndex = count + 1;
                    nextRecordIndex = count + 1;

                    // first position is oldest record
                    nextRecordId = notes.ElementAt(0)[Notifications.NotificationId].ToString();

                    // going back will take to most recent record (last row in datatable)
                    previousRecordId = notes.ElementAt(count - 1)[Notifications.NotificationId].ToString();
                }
                else
                {
                    for (int i = 0; i < count; i++)
                    {
                        currentRecordId = notes.ElementAt(i)[Notifications.NotificationId].ToString();

                        if (currentRecordId.Equals(_defaultNoteId.ToString()))
                        {
                            // set previous button
                            if (i > 0)
                            {
                                previousRecordId = notes.ElementAt(i - 1)[Notifications.NotificationId].ToString();
                            }
                            else // before 1st record, go to last record
                            {
                                previousRecordId = notes.ElementAt(count - 1)[Notifications.NotificationId].ToString();
                            }

                            // set next button 
                            if (i < count - 1)
                            {
                                nextRecordId = notes.ElementAt(i + 1)[Notifications.NotificationId].ToString();
                            }
                            else // go back to the first record
                            {
                                nextRecordId = notes.ElementAt(0)[Notifications.NotificationId].ToString();
                            }

                            currentRecordIndex = i + 1;
                            nextRecordIndex = count;

                            break; // these are the values we want to set the navigation
                        }
                    }
                }

                previousBtn.Visible = true;
                nextBtn.Visible = true;
                previousBtn.Attributes.Add("onclick", "window.location = \"NotesPage.aspx?defaultNoteId=" + previousRecordId + "\"");
                nextBtn.Attributes.Add("onclick", "window.location = \"NotesPage.aspx?defaultNoteId=" + nextRecordId + "\"");
                NotesPaging.Text = currentRecordIndex.ToString() + " of " + nextRecordIndex.ToString();
            }
            

            string urlString = "?tableName=" + _tableName + "&primKey=" + _recordId + "&uid=" + _userId;
            NewBtn.Attributes.Add("onclick","window.location = 'NotesPage.aspx" + urlString + "'");
        }
        
        // set default note
        private void SetStickyData(DataRow note)
        {
            NotificationId.Value = note[Notifications.NotificationId].ToString();
            NotifyWho.Value = note[Notifications.AssignedUserId].ToString();
            StickyNoteTextArea.Value = note[Notifications.Notification].ToString();
            Reason.Text = note[Notifications.Reason].ToString();
            Response.Text = note[Notifications.Response].ToString();
            NotedBy.Text = note[Notifications.EnteredBy].ToString() + " " + note[Notifications.EnteredTime].ToString();
            UpdatedBy.Text = note[Notifications.UpdatedBy].ToString() + " " + note[Notifications.UpdatedTime].ToString();

            if(!string.IsNullOrEmpty(note[Notifications.TablePrimaryKey].ToString()) )
                this.SetReferencedRecord(note[Notifications.TableName].ToString(), (int)note[Notifications.TablePrimaryKey], false);

        }

        // set literal that displays the record note is associated with
        private void SetReferencedRecord(string tableName, int tableRecordId, bool showReferencesCheckbox)
        {
            // display information about the reference record if exists
            if (tableRecordId != null && tableRecordId > 0)
            {
                string recordInfo = "";
                string date = "";
                
                // get Table Label from Meta Data
                // TODO: THIS LOGIC SHOULD BE BUILT INTO THE MIDDLE TIER, i.e. BusinessObject.GetTableMetaLabel()
                MetadataDa da = new MetadataDa();
                DataTable dt = new DataTable();
                dt = da.GetTableMetaDataByTableName(tableName);
                if (dt.Rows.Count == 1)
                {
                    recordInfo = "This note references " + dt.Rows[0][MetadataTable.TableLabel_Field].ToString();
                }

                // instiantiate an biz object by table name and if there is a date text value, show it
                BusinessObject bo = BusinessObjectFactory.BuildBusinessObject(tableName);
                bo.Get(tableRecordId);
                IEnumerable<string> columnNames = bo.FieldNames;
                foreach (string column in columnNames)
                {
                    if (column.ToLower().Contains("datetext") && !column.ToLower().Contains("stop"))
                    {
                        date = bo[column].ToString();
                        // check for date length and make sure "stop" is not part of column name
                        if (date.Length > 0)
                        {
                            recordInfo += " dated " + date + ".";
                        }
                    }
                }

                RecordReferencedTitle.Text = recordInfo;

                if (showReferencesCheckbox)
                {
                    RecordReferenced.Visible = true;
                    RecordReferenced.Checked = true;
//                    RecordReferencedRow.Visible = true;
                }

            }
        }

        // set defaults for new note
        private void SetNewNoteDefaults()
        {
            Reason.SelectedValue = "None";
            Response.SelectedValue = "None";
            NotifyBy.Checked = true;

            this.SetReferencedRecord(_tableName, _recordId, true);
        }

        // save data
        protected void SaveSticky(object sender, EventArgs e)
        {  
            Notifications note = new Notifications();
            if (!string.IsNullOrEmpty(NotificationId.Value))
            {
                note.Get(int.Parse(NotificationId.Value));
            }
            else
            {
                note[Notifications.PatientId] = _patientId;

                if (RecordReferenced.Checked) // associate note with a particular record
                {
                    note[Notifications.TableName] = _tableName;
                    note[Notifications.TablePrimaryKey] = _recordId;
                }
            }
           
            note[Notifications.AssignedUserId] = NotifyWho.SelectedValue;
            note[Notifications.Notification] = StickyNoteTextArea.Value;
            note[Notifications.Reason] = Reason.Text;
            note[Notifications.Response] = Response.Text;

            note.Save();

            this.NotifyUser();
        }

        // send assigned user an email with patient mrn, form and record date
        private void NotifyUser()
        {
            if (!string.IsNullOrEmpty(NotifyWho.Value) && NotifyBy.Checked)
            {
                MailManager mm = new MailManager();
                User currentUser = new User();
                User assignedUser = new User();
                
                // get patient info
                string mrn = "";
                if (_patientId > 0)
                {
                    Patient patient = new Patient();
                    patient.Get(_patientId);
                    mrn = " regarding patient MRN " + patient[Patient.PtMRN];
                }

                // get assigned user info
                assignedUser.Get(int.Parse(NotifyWho.Value));
                string assignedEmail = assignedUser[Caisis.BOL.User.UserEmail].ToString();

                // get current user info
                currentUser.Get(_userId);
                string logggedInUser = currentUser[Caisis.BOL.User.UserFirstName].ToString() + " " + currentUser[Caisis.BOL.User.UserLastName].ToString();

                string bodyText = "\nA note has been posted to the Caisis system" + mrn + " by " + logggedInUser + " which requires your attention.";
                if (RecordReferencedTitle.Text.Length > 0)
                {
                    bodyText += "\n\n" + RecordReferencedTitle.Text;
                }
                // add information about which record? At least patient MRN

                mm.SendEmailFromAdmin(assignedEmail, "", "Caisis Notifcation", bodyText);
            }
        }

        // set local variables from values found in URL
        private void SetLocalsFromUrlVariables()
        {
            SessionHandler sh = new SessionHandler(Session);
            _patientId = sh.GetPatientId();

            if (!String.IsNullOrEmpty(Request.QueryString["defaultNoteId"]))
            {
                _defaultNoteId = int.Parse(Request.QueryString["defaultNoteId"]);
            }
            if (!String.IsNullOrEmpty(Request.QueryString["primKey"]))
            {
                _recordId = int.Parse(Request.QueryString["primKey"]);
            }
            if (!String.IsNullOrEmpty(Request.QueryString["tableName"]))
            {
                _tableName = Request.QueryString["tableName"];
            }
            if (!String.IsNullOrEmpty(Request.QueryString["uid"]))
            {
                _userId = int.Parse(Request.QueryString["uid"]);
            }
        }
    }
}
