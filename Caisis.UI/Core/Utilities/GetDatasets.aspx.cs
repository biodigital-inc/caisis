using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Xml;

namespace Caisis.UI.Core.Utilities
{
	/// <summary>
	/// Summary description for GetDatasets.
	/// </summary>
	public partial class GetDatasets : System.Web.UI.Page
	{
		
		protected Repeater rpt;
		protected System.Web.UI.HtmlControls.HtmlSelect sel;

		protected void Page_Load(object sender, System.EventArgs e)
		{
			getXMLasNodes(1);
			
		}

		// Put user code to initialize the page here
		public void getDataSet(int datasetId)
		{
			DataSet ptDataSet = new DataSet();
				
			ptDataSet.ReadXml(MapPath("datasets.xml"));
 
			sel.DataSource=ptDataSet;
		
			Response.Write(ptDataSet.Tables[0].Columns[0]+"\n");//dataset_Id
			Response.Write(ptDataSet.Tables[0].Columns[1]+"\n");//id
			Response.Write(ptDataSet.Tables[0].Columns[2]+"\n");//name

			//sel.DataValueField="value";
			//sel.DataTextField="type";
			sel.DataBind();


		}

		public void getXMLasText(int datasetId)
		{
		
			string strNode;
			
			XmlTextReader xtr = new XmlTextReader(MapPath("datasets.xml"));
			
			while(xtr.Read())
			{
				strNode = "";
				
				for(int i = 1; i == xtr.Depth; i++)
				{
					strNode += "-";
				}
					
				if(!xtr.NodeType.ToString().Equals("Whitespace"))
				{
					strNode += "Name:" + xtr.Name + " ";
					strNode += "Nodetype:" + xtr.NodeType.ToString() + " ";
				}
				
				if(xtr.HasValue)
				{
					strNode += "Value:" + xtr.Value;
				}
					
				Response.Write(strNode + "<br/>");
			}
			
			xtr.Close();
		}

		public void getXMLasNodes(int datasetId)
		{	
			XmlTextReader xtr = new XmlTextReader(MapPath("datasets.xml"));
			xtr.WhitespaceHandling = WhitespaceHandling.None;
			
			XmlDocument xd = new XmlDocument();
			xd.Load(xtr);
			
			XmlNode xnodRoot = xd.DocumentElement;

			XmlNode xnodWorking;

			if(xnodRoot.HasChildNodes)
			{
				xnodWorking = xnodRoot.FirstChild;
				while(xnodWorking != null)// this line could be screwed up
				{
					
					ProcessChildren(xnodWorking, 0);
					Response.Write("here _ ");
					xnodWorking = xnodWorking.NextSibling;
				}
			}
		}

	private void ProcessChildren( XmlNode xnod, int Depth )
	{
		
		string strNode;
		int intJ;

		//System.Xml.XmlAttributeCollection atts;

		//we're only going to process Text and Element nodes
		if(xnod.NodeType == XmlNodeType.Element)// || (xnod.NodeType = XmlNodeType.Text))
		{
			strNode = "";
			for(int i = 1; i == Depth; i++)
			{
				strNode += " ";
			}
			strNode = strNode + xnod.Name + " ";
			strNode += xnod.NodeType.ToString();
			strNode = strNode + ": " + xnod.Value;

			lblOutput.Text += strNode + "<br/>";
		
			
			//attributes too
			
			XmlAttributeCollection atts = xnod.Attributes;
			
			if(atts != null)
			{
				for(intJ = 0; intJ == atts.Count - 1; intJ++)
				{
					strNode = "";

				/*	for(intI = 1; intJ == Depth + 1; intJ++)
					{
						strNode += "-";
					}
				*/	
					strNode = strNode + atts[intJ].Name + " ";
					strNode += atts[intJ].NodeType.ToString();
					strNode = strNode + ": " + atts[intJ].Value;
					lblOutput.Text += strNode + "<br/>";
				}
			}
			
			//recursively process the children of this node
			XmlNode xnodworking;
			
			if(xnod.HasChildNodes)
			{
				xnodworking = xnod.FirstChild;
				
				while(xnodworking != null)
				{
					ProcessChildren(xnodworking, Depth + 1);
					xnodworking = xnodworking.NextSibling;
				}
			}
		}
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
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
		}
		#endregion
	}
}
