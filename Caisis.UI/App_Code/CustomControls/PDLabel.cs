using System;
using System.Web.UI; 
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Web;

namespace Caisis.UI.Core.Classes
{
	/// <summary>
	/// Custom label for the Patient Data Section Header Javascript calls for help functionality.
	/// </summary>
	/// 

	[DefaultProperty("Text"), 
		ToolboxData("<{0}:PDLabel runat=server></{0}:PDLabel>")]
	public class PDLabel : System.Web.UI.WebControls.Label
	{
		private string _labelText;
		private string field, required;
	
		[Bindable(true), 
			Category("Appearance"), 
			DefaultValue("")] 
		public string LabelText 
		{
			get
			{
				return _labelText;
			}

			set
			{
				_labelText = value;
			}
		}

		public string Field 
		{
			get
			{
				return field;
			}

			set
			{
				field = value;
			}
		}

		public string Required 
		{
			get
			{
				return required;
			}

			set
			{
				required = value;
			}
		}


		/// <summary> 
		/// Render this control to the output parameter specified.
		/// </summary>
		/// <param name="output"> The HTML writer to write out to </param>
		protected override void Render(HtmlTextWriter output)
		{
			output.Write(LabelText);
			if (required == "Yes")
			{
				this.Attributes.Add("class", "requiredField");
				this.Text = this.Text + "<img name=\""+ this.ClientID.ToString() + "_image\" src=\"../../../Images/requiredFieldMarker.gif\" height=\"7\" width=\"8\" border=\"0\">";
			}
			
			/* Help state toggle removed. Help bubbles are always on 3/29/04
			if(HttpContext.Current.Session[SessionKey.HelpState].ToString().Equals("On"))
			{
				this.Attributes.Add("onMouseOver", "showToolTip('"+field+"')");
				this.Attributes.Add("onMouseOut", "hideToolTip()");
			}*/

			this.Attributes.Add("onMouseOver", "showToolTip('"+field+"')");
			this.Attributes.Add("onMouseOut", "hideToolTip()");

			base.Render(output);
		}
	}
}