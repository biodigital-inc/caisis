
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for ErrorMsg.
	/// </summary>
    /// 
namespace Caisis.UI.Core.Utilities
{
	public partial class ErrorMsg : BaseControl
	{
		protected string _errMsg;

		protected override void Page_Load(object sender, System.EventArgs e)
		{


		}

		public string Message
		{
			get
			{
				return _errMsg;
			}

			set 
			{
				_errMsg = value;
			}
		}
	}

}
