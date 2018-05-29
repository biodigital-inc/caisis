using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;

using System.IO;
using System.IO.Compression;
using System.Configuration; 

using Caisis.BOL;

using Caisis.Security;
using Caisis.UI;

using Caisis.UI.Core.Classes;
//using Caisis.UI.Core.Utilities;


namespace Caisis.UI.Core.DataAnalysis.Export
{
	/// <summary>
	/// Summary description for DataExportForm.
	/// </summary>
	public partial class DataExport : BasePage
	{
        protected string disease;
		bool skipRender = false;

		protected override void Page_Load(object sender, EventArgs e)
		{

			if (!IsPostBack)  
			{
				this.SetCheckBoxList();
                this.CheckExportPermission();
			}
			
			if(IsPostBack)
			{
				if (Request.Form["submitBool"].Equals("true"))
				{
					CommandEventArgs ce = new CommandEventArgs("", e);
					this.onSubmitBtnCommand(sender, ce);
					//SendXmlFile();
				}
				else 
				{
					this.SetParams();					
				}
			}
		}

        private void CheckExportPermission()
        {
            if(PermissionManager.HasPermission(PermissionManager.ExportData))
            {
                ExportBtn.Visible = true;
            }
            else
            {
                InvalidPermissionMsg.Text = "Sorry your user group does not have permission to export data.";
            }
        }

		protected void SetParams()  
		{
			this.SetCheckBoxList();
			switch (Request.Form["diseaseRadio"])  
			{
				case "Prostate":
					this.diseaseProstate.Checked = true;
					break;
				case "Bladder":
					this.diseaseBladder.Checked = true;
					break;
                case "Kidney":
                    this.diseaseKidney.Checked = true;
                    break;
                case "Testis":
                    this.diseaseTestis.Checked = true;
                    break;
                case "Pancreas":
                    this.diseasePancreas.Checked = true;
                    break;
                case "Thyroid":
                    this.diseaseThyroid.Checked = true;
                    break;
                case "Colorectal":
                    this.diseaseColorectal.Checked = true;
                    break;
                case "Gastric":
                    this.diseaseGastric.Checked = true;
                    break;
                case "Breast":
                    this.diseaseBreast.Checked = true;
                    break;
				case "All":
					this.diseaseAll.Checked = true;
					break;
			}

			switch (Request.Form["privacyRadio"])  
			{
				case "Identified":
					this.privacyIdentified.Checked = true;
					break;
				case "Deidentified":
					this.privacyDeidentified.Checked = true;
					break;
				case "Limited":
					this.privacyLimited.Checked = true;
					break;
			}
            
		}

        // TODO: should we enumerate diseases here?
		protected void SetCheckBoxList()  
		{			
			// fill the disease specific table CheckBoxList
			DataTable dt = new DataTable();
			dt.Columns.Add(new DataColumn("tableName", typeof(System.String)));
			if (Request.Form["diseaseRadio"] != null)  
			{
				disease = Request.Form["diseaseRadio"];
				if (Request.Form["diseaseRadio"].Equals("All"))  
				{
					this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Prostate"), dt);
                    this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Bladder"), dt);
                    this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Kidney"), dt);
                    this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Testis"), dt);
                    this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Pancreas"), dt);
                    this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Thyroid"), dt);
                    this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Gastric"), dt);
                    this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Colorectal"), dt);
                    this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Breast"), dt);
                    //this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Bile Duct"), dt);
                    //this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Duodenum"), dt);
                    //this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Ampulla"), dt);
				}
				else 
				{
					this.AddToDataTable(BusinessObject.GetTableNamesForDisease(Request.Form["diseaseRadio"]), dt);
				}
			}
			else 
			{
				disease = "Prostate";
				this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Prostate"), dt);
			}						
						
			diseaseTables.DataSource = dt;
			
			diseaseTables.DataTextField = "tableName";
			diseaseTables.DataBind();

			//added 10/4 fs
			for(int i=0; i<= (diseaseTables.Items.Count - 1); i++)
			{
				diseaseTables.Items[i].Selected = true;
			}

			// fill the base tables CheckBoxList
			DataTable bt = new DataTable();
			bt.Columns.Add(new DataColumn("tableName", typeof(System.String)));

			this.AddToDataTable(BusinessObject.GetTableNamesForDisease("All"), bt);
			if (Request.Form["privacyRadio"] != null && ((string)Request.Form["privacyRadio"]).Equals("Identified"))  
			{
				this.AddToDataTable(BusinessObject.GetTableNamesForDisease("Identified"), bt);
			}
				
			baseTables.DataSource = bt;
			baseTables.DataTextField = "tableName";
			baseTables.DataBind();

			//added 10/4 fs
			for(int i=0; i<=(baseTables.Items.Count - 1); i++)
			{
				baseTables.Items[i].Selected = true;
			}
		}

        private void AppendFilenameHeader(int userExportId)
        {
            SecurityController sc = new SecurityController();
            StringBuilder b = new StringBuilder("attachment; filename=Export_");
            b.Append(sc.GetUserName());
            b.Append("_");
            b.Append(userExportId.ToString());
            b.Append(".xml");

            Response.AppendHeader("content-disposition", b.ToString());
            Response.Flush();
        }

		private string GetClientCompression()
		{
			string acceptEncoding = Request.Headers["Accept-Encoding"];

			if (!string.IsNullOrEmpty(acceptEncoding))
			{
				acceptEncoding = acceptEncoding.ToUpperInvariant();

				if (acceptEncoding.Contains("DEFLATE") && 
					!acceptEncoding.Contains("DEFLATE;Q=0"))
				{
					return "deflate";
				}
				else if (acceptEncoding.Contains("GZIP") && 
					!acceptEncoding.Contains("GZIP;Q=0"))
				{
					return "gzip";
				}
			}

			return null;
		}

		//private System.Action EnableResponseCompression()
		//{
		//    string acceptEncoding = Request.Headers["Accept-Encoding"];

		//    if (!string.IsNullOrEmpty(acceptEncoding))
		//    {
		//        acceptEncoding = acceptEncoding.ToUpperInvariant();

		//        if (acceptEncoding.Contains("DEFLATE") && !acceptEncoding.Contains("DEFLATE;Q=0"))
		//        {
		//            DeflateStream deflateStream = new DeflateStream(Response.Filter, CompressionMode.Compress, false);
		//            Response.Filter = deflateStream;
		//            Response.AppendHeader("Content-Encoding", "deflate");

		//            return () =>
		//                {
		//                    deflateStream.Close();
		//                };
		//        }
		//        else if (acceptEncoding.Contains("GZIP") && !acceptEncoding.Contains("GZIP;Q=0"))
		//        {
		//            GZipStream gzStream = new GZipStream(Response.Filter, CompressionMode.Compress, false);
		//            Response.Filter = gzStream;
		//            Response.AppendHeader("Content-Encoding", "gzip");

		//            return () => 
		//                { 
		//                    gzStream.Close();
		//                };
		//        }
		//    }

		//    Response.ContentEncoding = Encoding.UTF8;
		//    return () => { };
		//}

		protected void onSubmitBtnCommand(object source, CommandEventArgs e)
		{
			Response.Clear();
			Response.ContentType = "text/xml";

			Response.BufferOutput = false;

			XmlWriterSettings settings = new XmlWriterSettings();
			settings.Indent = true;
			settings.IndentChars = "\t";

			using (XmlWriter xmlWriter = XmlWriter.Create(Response.Output, settings))
			{
				try
				{
					Export(xmlWriter);
				}
				catch (Exception ex)
				{
					ExceptionHandler.Publish(ex);
				}
			}

			Response.End(); // prevents fallthrough to the Render event handler, which would add aspx markup to the stream
		}

		protected void SendXmlFile()
		{
			Response.Clear();
			Response.BufferOutput = false;
			Response.ContentType = "text/xml";

			Stream outputStream = null;

			string compressionType = GetClientCompression();

			if (compressionType == "deflate")
			{
				outputStream = new DeflateStream(Response.OutputStream, CompressionMode.Compress);
				Response.AppendHeader("Content-Encoding", compressionType);
			}
			else if (compressionType == "gzip")
			{
				outputStream = new GZipStream(Response.OutputStream, CompressionMode.Compress);
				Response.AppendHeader("Content-Encoding", compressionType);
			}
			else
			{
				outputStream = Response.OutputStream;
			}

			XmlWriterSettings settings = new XmlWriterSettings();
			settings.Encoding = new UTF8Encoding(false); // eliminate BOM (xEF xBB xBF)

			using (XmlWriter xmlWriter = XmlWriter.Create(outputStream, settings))
			{
				try
				{
					Export(xmlWriter);
				}
				catch (Exception ex)
				{
					ExceptionHandler.Publish(ex);
				}
			}

			outputStream.Close(); // needs to be explicit to flush compression streams (foo.Flush() does nothing)
			Response.End();
		}

		//protected void onSubmitBtnCommand(object source, CommandEventArgs e)
		//{
		//    Response.Clear();
		//    Response.BufferOutput = false;
		//    Response.ContentType = "text/xml";

		//    string compressionType = GetClientCompression();

		//    System.Action completeResponse =
		//        () =>
		//        {
		//            using (XmlWriter xmlWriter = XmlWriter.Create(Response.Output))
		//            {
		//                try
		//                {
		//                    Export(xmlWriter);
		//                }
		//                catch (Exception ex)
		//                {
		//                    ExceptionHandler.Publish(ex);
		//                }
		//            }
		//        };

		//    try
		//    {
		//        if (compressionType == null)
		//        {
		//            Response.ContentEncoding = Encoding.UTF8;
		//            completeResponse();
		//        }
		//        else
		//        {
		//            System.Action<Stream> compressResponse =
		//                (stream) =>
		//                {
		//                    // Response.Filter = stream;
		//                    Response.AppendHeader("Content-Encoding", compressionType);
		//                    completeResponse();
		//                };

		//            if (compressionType == "deflate")
		//            {
		//                using (DeflateStream deflateStream =
		//                    new DeflateStream(Response.Filter, CompressionMode.Compress, true))
		//                {
		//                    compressResponse(deflateStream);
		//                }
		//            }
		//            else
		//            {
		//                using (GZipStream gzStream =
		//                    new GZipStream(Response.Filter, CompressionMode.Compress, true))
		//                {
		//                    compressResponse(gzStream);
		//                }
		//            }
		//        }
		//    }
		//    finally
		//    {
		//        Response.End();
		//    }
		//}

		//protected override void Render(HtmlTextWriter writer)
		//{
		//    if (!skipRender)
		//        base.Render(writer);
		//}

        private void Export(XmlWriter writer)
        {
            ExportServices es = new ExportServices();

            es.ExceptionHandler = ExceptionHandler.Publish;
            es.DatasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            es.DiseaseType = Request.Form["diseaseRadio"];
            es.PrivacyLevel = Request.Form["privacyRadio"];

            DateTime approvalDate;
            if (DateTime.TryParse(Request.Form["approvalDate"], out approvalDate))
            {
                es.IrbApprovalDate = approvalDate;
            }

            es.IrbApprovalType = Request.Form["approvalTypeRadio"];
            es.Purpose = Request.Form["purposeRadio"];
            es.UserLoginId = (int) Session[SessionKey.LoginId];

            es.AppendFilenameHeaderCallback = AppendFilenameHeader;

            es.Export(writer, GetSelectedTables());
        }

        private void FilterSelectedItems(CheckBoxList checkboxes, List<string> tables)
        {
            foreach (ListItem item in checkboxes.Items)
            {
                if (item.Selected)
                {
                    tables.Add(item.Text);
                }
            }
        }

        protected List<string> GetSelectedTables()
        {
            List<string> selected = new List<string>();

            FilterSelectedItems(baseTables, selected);
            FilterSelectedItems(diseaseTables, selected);
  
            return selected;
        }

		protected BusinessObject GetParams()  
		{			
			UserExport biz = new UserExport();
            
            biz[UserExport.DiseaseType] = Request.Form["diseaseRadio"];
            biz[UserExport.PrivacyLevel] = Request.Form["privacyRadio"];
            biz[UserExport.IRB_ApprovalDate] = PageUtil.ObjToDateTime(Request.Form["approvalDate"]);
            biz[UserExport.IRB_ApprovalType] = Request.Form["approvalTypeRadio"];
            biz[UserExport.Purpose] = Request.Form["purposeRadio"];
            biz[UserExport.UserLoginId] = (int)Session[SessionKey.LoginId];
            biz[UserExport.ExportDate] = DateTime.Now;

            biz.Save();

			return biz;
		}

        protected void AddToDataTable(IEnumerable<string> tables, DataTable dt)
        {
            foreach (string t in tables)
            {
                if (t != "Patients" && BusinessObject.TableIsExportable(t))
                {
                    dt.Rows.Add(new object[] { t });
                }
            }
        }
	}
}
