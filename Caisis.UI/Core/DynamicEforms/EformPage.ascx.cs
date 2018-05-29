using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Caisis.UI.Core.DynamicEforms
{
	public partial class EformPage : System.Web.UI.UserControl
	{
		private List<EformSection> eformSections = new List<EformSection>();

		private string title;

		private bool initialized = false;

		public string Title
		{
			get { return title; }
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);

			initialized = true;

			foreach (EformSection section in eformSections)
			{
				// TODO: separator
				Sections.Controls.Add(section);
			}
		}

		protected void Page_Load(object sender, EventArgs e)
		{

		}

		// TODO: at what point in the lifecycle do we add sections to the section container?
		// or do we enforce by convention that folks must add sections before adding the page to a container

		// TODO: how about a repeater that binds to a list of sections?

		public void AddSection(EformSection section)
		{
			if (initialized)
				throw new InvalidOperationException("Sections cannot be added to the page after initialization. Add sections before adding page to a container.");

			eformSections.Add(section);
		}

		public void AddControlToSection(Control control, int sectionIndex, int row, int column)
		{
			if (initialized)
				throw new InvalidOperationException("Controls cannot be added to sections after initialization");

			eformSections[sectionIndex].InsertControl(control, row, column);
		}
	}
}
