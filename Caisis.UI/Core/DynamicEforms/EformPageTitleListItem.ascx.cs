using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Caisis.UI.Core.DynamicEforms
{
	public partial class EformPageTitleListItem : System.Web.UI.UserControl
	{
		private List<string> sectionNames = new List<string>();

		public string Title
		{
			get;
			set;
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);

			SectionNameLabels.DataSource = sectionNames;
			SectionNameLabels.DataBind();
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			PageTitle.Text = Title;
		}

		public void AddSectionName(string name)
		{
			sectionNames.Add(name);
		}
	}
}
