using System;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections;

using System.Data.SqlClient;
using System.Collections.Specialized;


using Caisis.DataAccess;
using Caisis.BOL;

using Caisis.UI.Core.Classes;


namespace Caisis.UI.Core.PaperForms
{

	/// <summary>
	///		Summary description for SelectAForm.
	/// </summary>
	public partial class SelectAForm : BasePaperFormControl
	{



		override protected void SetFormInfo()  
		{
			this._formName = "SelectAForm";
			this._formTitle = "Caisis";
		}



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
		///		Required method for Designer support - do not modify
		///		the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
		}
		#endregion
	}
}
