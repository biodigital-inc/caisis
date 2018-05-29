using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.Security;

namespace Caisis.UI.Plugins
{
    public partial class Plugins_StickyNote_StickyNote : System.Web.UI.UserControl
    {   
        private int _recordId;
        private int _patientId;
        private int _userId;
        private string _tableName;
        private int _defaultNoteId;

        public int RecordId
        {
            get
            {
                if (_recordId == 0 && !String.IsNullOrEmpty(Request.QueryString["primKey"]))
                {
                    _recordId = int.Parse(Request.QueryString["primKey"]);
                }
                return _recordId;
            }
        }

        public string TableName
        {
            get
            {
                if (!String.IsNullOrEmpty(Request.QueryString["tableName"]))
                {
                    _tableName = Request.QueryString["tableName"];
                }
                return _tableName;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            SessionHandler sh = new SessionHandler(Session);
            _patientId = sh.GetPatientId();

            SecurityController sc = new SecurityController();
            UserDa da = new UserDa();
            _userId = da.GetUserId(sc.GetUserName());

            CheckForNotes();

            string urlString = "?tableName=" + TableName + "&primKey=" + RecordId.ToString() + "&uid=" + _userId + "&defaultNoteId=" + _defaultNoteId + "";
            Page.RegisterClientScriptBlock("xyz", "<script type=\"text/javascript\">var urlString = '" + urlString + "'</script>");
        }

        protected void CheckForNotes()
        {
            string iconType = "Icon_PostIt_Empty.gif"; // can be default, primary, or secondary

			//Notifications notes = new Notifications();

			//// return all the stickies for this patient
			//notes.GetByParent(_patientId);

			DataView notes = BusinessObject.GetByParentAsDataView<Notifications>(_patientId);

            // What is order of operations? 
            // 1. does a note exist for the active record?
            // 2. if no, is it assigned to the active user? (2nd degree icon, default record)
            // 3. if not assigned to the current user, but no response (1st degree icon, default record) 
            // 4. if no record exists for this record, does any exist for this patient?
            // 5. if yes, are any unresponded to and assigned to active user? (1st degree icon, default record
            // 6. if yes unresponded, but none to active user, then (2nd degree icon)

            // SO default icon, 1st degree if unresponded and assigned to current user, 2nd degree if unresponded and not active user


            if (notes.Count > 0)
            {
                foreach (DataRow noteRow in notes.Table.Rows)
                {
                    // do any records exist that have not been responded to?
                    if (String.IsNullOrEmpty(noteRow[Notifications.Response].ToString()) || noteRow[Notifications.Response].ToString().Equals("None"))
                    {
                        iconType = "Icon_PostIt_Full.gif";
                        _defaultNoteId = (int)noteRow[Notifications.NotificationId]; // will default to the last row without a response

                        // is the record that has not been responded to assigned to the current user?
                        if (noteRow[Notifications.AssignedUserId].ToString().Equals(_userId.ToString()))
                        {
                            _defaultNoteId = (int)noteRow[Notifications.NotificationId]; // if you get multiple matches, its going to default to the oldest record for this user without a response
                            iconType = "Icon_PostIt_Alert.gif";
                            break;
                        }
                    }
                }
            }

            StickyNoteIcon.ImageUrl = "../../Images/" + iconType;
        }
    }
}