using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.DataEntryForms
{
	/// <summary>
	/// Summary description for DynamicForm.
	/// </summary>
	public partial class DynamicForm : DynamicPage
	{
		#region protected members

        //2.0 protected Literal DateMapInitializer; // "renders" the date maps when the Page is finished w/ everything else
		
		
		#endregion

		#region private members
        private Dictionary<string, Control> dateControlMap = new Dictionary<string, Control>();
        private Dictionary<string, Control> dateTextControlMap = new Dictionary<string, Control>();
		#endregion

		#region overrides
		protected override void Page_Load(object sender, EventArgs e)
		{
			base.MainContainer = MainRepeater;
			base.HiddenContainer = HiddenRepeater;
			base.Page_Load(sender, e);

			NullsScript.Visible = false;
			GenericErrorScript.Visible = false;

			if (recordIsLocked) // must succeed base.Page_Load(...) or will always be false
			{
				AlertScript.Visible = true;
			}

			if (!CaughtErrors())
			{
				RefreshParentIfSaved();
			}
			SetPageTitle();
		}

		protected override void OnPreRender(EventArgs e)
		{
			DateMapInitializer.Text = BuildJavaScriptDateMap();
			base.OnPreRender (e);
		}
		#endregion

		#region protected methods
		protected void FillMainRepeater(object sender, RepeaterItemEventArgs e)
		{
			FillRepeater("Main", e);
		}

		protected void FillHiddenRepeater(object sender, RepeaterItemEventArgs e)
		{
			FillRepeater("Hidden", e);
		}

		protected void SetPageTitle()
		{
			if (Request.QueryString["tablename"] != null && Request.QueryString["tablename"].Length > 0)
			{
                string tableName = Request.QueryString["tablename"];
                FormTitleLabel.Text = BOL.BusinessObject.HasTableLabel(tableName) ? BOL.BusinessObject.GetTableLabel(tableName) : tableName;
			}
			else
			{
				FormTitleLabel.Text = "Existing";
			}
		}

		protected bool CaughtErrors()
		{
			string error = Request.QueryString["error"];
			if (error != null)
			{
				if (error != "_default")
				{
					NullsScript.Text = "<script>showNullsMsg('" + error + "');</script>";
					NullsScript.Visible = true;
				}
				else
				{
					GenericErrorScript.Visible = true;
				}
				return true;
			}
			return false;
		}

		protected void RefreshParentIfSaved()
		{
			if (Request.QueryString["saved"] != null && Request.QueryString["saved"].ToUpper() == "TRUE")
			{
				AlertScript.Visible = false;
				DynamicFormBody.Attributes.Add("onload", "SaveAndClose();");
			}
		}
		#endregion

		#region private methods, or the nitty-gritty details
		private void FillRepeater(string prefix, RepeaterItemEventArgs e)
		{
			Label label = (Label) e.Item.FindControl(prefix + "LabelStub");
			PlaceHolder ctl = (PlaceHolder) e.Item.FindControl(prefix + "ControlStub");
			// need cast SOMETHING to ICaisisInputControl
			ICaisisInputControl ic = (ICaisisInputControl) e.Item.DataItem;
			label.Text = ic.FieldLabel;
			
			Control _ctl = (Control) e.Item.DataItem;
			ctl.Controls.Add(_ctl);

            // set label helper
            label.AssociatedControlID = _ctl.ID;

            // add entry for date fields
            if (ic.Field.EndsWith("Date"))
            {
                // create unique key
                string key = string.Format("{0}_{1}Text", ic.Table, ic.Field);
                if (!dateControlMap.ContainsKey(key))
                    dateControlMap.Add(key, _ctl);
            }
            // add entry for date text fields
            else if (ic.Field.EndsWith("DateText"))
            {
                string key = string.Format("{0}_{1}", ic.Table, ic.Field);
                if (!dateTextControlMap.ContainsKey(key))
                    dateTextControlMap.Add(key, _ctl);
            }
			
			//if (ic.Field.EndsWith("LockedBy"))
			//{
			//    if (((CaisisHidden) _ctl).Value.Length > 0)
			//    {
			//        AlertScript.Visible = true;
			//    }
			//}
		}

		private string BuildJavaScriptDateMap()
		{
            StringBuilder sb = new StringBuilder("");

            foreach (string dateTextKey in dateTextControlMap.Keys)
            {
                Control dateTextField = dateTextControlMap[dateTextKey];
                string dateTextClientId = dateTextField.ClientID;
                if (dateControlMap.ContainsKey(dateTextKey))
                {
                    Control dateField = dateControlMap[dateTextKey];
                    string dateClientId = dateField.ClientID;
                    sb.AppendLine("dateMap['" + dateTextClientId + "'] = '" + dateClientId + "';");
                }
            }

            return sb.ToString();
        }
		#endregion

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
		}
		#endregion
	}
}
