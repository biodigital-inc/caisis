using System;
using System.Collections.Generic;
using System.Xml;
using System.IO;
using System.Web;
using System.Configuration;
using System.Data;
using System.Xml.Linq;
using System.Linq;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Collections;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;


using Caisis.Security;
using System.Web.UI;
using System.Text.RegularExpressions;
using System.Web.UI.HtmlControls;


namespace Caisis.UI.Core.Classes
{

    public class MergePDF : BasePage
    {
        #region Fields
        private int _fileCount = 0;
        private List<FileInfo> _fileList = new List<FileInfo>();
        FileInfo _fileInformation = new FileInfo();
        #endregion

        #region Properties

        //private bool _enablePdfPrint = true;
        //public Boolean EnablePDFPrint
        //{
        //    get { return _enablePdfPrint; }
        //    set { _enablePdfPrint = value; }
        //}

        //private bool _enablePdfSave = true;
        //public Boolean EnablePDFSave
        //{
        //    get { return _enablePdfSave; }
        //    set { _enablePdfSave = value; }
        //}

        //private bool _enablePdfToolBar = true;
        //public Boolean EnablePDFToolBar
        //{
        //    get { return _enablePdfToolBar; }
        //    set { _enablePdfToolBar = value; }
        //}

        //private bool _enablePdfWindowUI = true;
        //public Boolean EnablePDFWindowUI
        //{
        //    get { return _enablePdfWindowUI; }
        //    set { _enablePdfWindowUI = value; }
        //}

        //private bool _enablePdfMenubar = true;
        //public Boolean EnablePDFMenubar
        //{
        //    get { return _enablePdfMenubar; }
        //    set { _enablePdfMenubar = value; }
        //}

        private bool _printFileOnLoad = false;
        public Boolean EnablePDFAutomaticPrint
        {
            get { return _printFileOnLoad; }
            set { _printFileOnLoad = value; }
        }

        private int _printOnLoadTimeOut = 0;
        /// <summary>
        /// Sets milliseconds to wait to before firing print screen for pdf file
        /// Property EnablePDFPrintOnLoad must be set to true
        /// 1000 ms = 1 second
        /// </summary>
        public int PDFAutomaticPrintWaitTime
        {
            get { return _printOnLoadTimeOut; }
            set { _printOnLoadTimeOut = value; }
        }


        #endregion

        #region Public Methods

        public class FileInfo
        {
            public string FileName { get; set; }
            public string PhysicalFilePath { get; set; }
            public ArrayList PagesToSkip { get; set; }
            public Boolean IsControlPage { get; set; }
            public int ControlPageIndex { get; set; }
        }

        ///
        /// Add a new file, together with a given docname to the fileList and namelist collection
        ///
        ///
        public void AddControlPage(HtmlForm form, BaseLongitudinalControl longitudinalControl)
        {
            form.Controls.Add(longitudinalControl);
            _fileInformation = new FileInfo();
            _fileInformation.IsControlPage = true;
            _fileInformation.ControlPageIndex = form.Controls.Count > 0 ? form.Controls.Count - 1 : 0;
            _fileInformation.FileName = String.Empty;
            _fileInformation.PhysicalFilePath = String.Empty;
            _fileInformation.PagesToSkip = new ArrayList();
            _fileInformation.PagesToSkip.Add(String.Empty);
            _fileList.Add(_fileInformation);
            _fileCount = _fileCount + 1;

        }

        public void AddControlPage(HtmlForm form, BaseSurveyControl surveyControl)
        {
            form.Controls.Add(surveyControl);
            _fileInformation = new FileInfo();
            _fileInformation.IsControlPage = true;
            _fileInformation.ControlPageIndex = form.Controls.Count > 0 ? form.Controls.Count - 1 : 0;
            _fileInformation.FileName = String.Empty;
            _fileInformation.PhysicalFilePath = String.Empty;
            _fileInformation.PagesToSkip = new ArrayList();
            _fileInformation.PagesToSkip.Add(String.Empty);
            _fileList.Add(_fileInformation);
            _fileCount = _fileCount + 1;
        }

        public void AddControlPage(HtmlForm form, Control control)
        {
            form.Controls.Add(control);
            _fileInformation = new FileInfo();
            _fileInformation.IsControlPage = true;
            _fileInformation.ControlPageIndex = form.Controls.Count > 0 ? form.Controls.Count - 1 : 0;
            _fileInformation.FileName = String.Empty;
            _fileInformation.PhysicalFilePath = String.Empty;
            _fileInformation.PagesToSkip = new ArrayList();
            _fileInformation.PagesToSkip.Add(String.Empty);
            _fileList.Add(_fileInformation);
            _fileCount = _fileCount + 1;
        }

        public void AddFile(string fileName, string physicalFilePath)
        {
            _fileInformation = new FileInfo();
            _fileInformation.IsControlPage = false;
            _fileInformation.ControlPageIndex = 0;
            _fileInformation.FileName = fileName;
            _fileInformation.PhysicalFilePath = physicalFilePath;
            _fileInformation.PagesToSkip = new ArrayList();
            _fileInformation.PagesToSkip.Add(String.Empty);
            _fileList.Add(_fileInformation);
            _fileCount = _fileCount + 1;
        }

        public void AddFile(string fileName, string physicalFilePath, string[] pagesToSkip)
        {
            _fileInformation = new FileInfo();
            _fileInformation.IsControlPage = false;
            _fileInformation.ControlPageIndex = 0;
            _fileInformation.FileName = fileName;
            _fileInformation.PhysicalFilePath = physicalFilePath;
            _fileInformation.PagesToSkip = new ArrayList();
            if (pagesToSkip.Length > 0)
            {
                foreach (string pageNum in pagesToSkip)
                    _fileInformation.PagesToSkip.Add(pageNum);
            }
            else
                _fileInformation.PagesToSkip.Add(String.Empty);
            _fileList.Add(_fileInformation);
            _fileCount = _fileCount + 1;
        }

        public int FileCount
        {
            get { return _fileCount; }
        }

        public Boolean SkipPage( List<FileInfo> list, int listIndex, string pageToCheck)
        {
            return list[listIndex].PagesToSkip.Contains(pageToCheck);
            
        }

        ///
        /// Generate the merged PDF
        ///
        public void Execute(HtmlForm form)
        {
           MergeDocs(form);
        }
      
        #endregion

        #region Private Methods

        private void MergeDocs(HtmlForm form)
        {

            //Create a Docuement-Object
            Document document = new Document();
            MemoryStream PDFData = new MemoryStream();
            try
            {
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.ClearContent();
                HttpContext.Current.Response.ClearHeaders();
                HttpContext.Current.Response.ContentType = "application/pdf";
                HttpContext.Current.Response.Charset = String.Empty;
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);

                PdfWriter writer = PdfWriter.GetInstance(document, PDFData);

                SetPDFViewerPropertiesPre(writer);

                //Open the document
                document.Open();

                PdfContentByte cb = writer.DirectContent;
                PdfImportedPage page;

                int n = 0;
                int rotation = 0;
                int arrayIndex = 0;

                //Loops for each file that has been listed
                foreach (FileInfo fileInfo in _fileList)
                {

                    // add control page to be converted to pdf
                    if (fileInfo.IsControlPage)
                        ProcessControlPage(form, writer, PDFData, fileInfo, document);
                    else
                    {
                        //The current file path
                        string filePath = fileInfo.PhysicalFilePath + fileInfo.FileName;
                       
                        // we create a reader for the document
                        PdfReader reader = new PdfReader(filePath);

                        //Gets the number of pages to process
                        n = reader.NumberOfPages;

                        int i = 0;
                        Boolean destinationSet = false;
                        while (i < n)
                        {
                            i++;

                            // if page should not be skipped
                            if (!SkipPage(_fileList, arrayIndex, i.ToString()))
                            {
                                document.SetPageSize(reader.GetPageSizeWithRotation(i));
                                document.NewPage();

                                //Insert to Destination on the first page
                                if (!destinationSet)
                                {
                                    Chunk fileRef = new Chunk(" ");
                                    fileRef.SetLocalDestination(fileInfo.FileName);
                                    document.Add(fileRef);
                                    destinationSet = true;
                                }

                                page = writer.GetImportedPage(reader, i);
                                rotation = reader.GetPageRotation(i);
                                if (rotation == 90 || rotation == 270)
                                {
                                    cb.AddTemplate(page, 0, -1f, 1f, 0, 0, reader.GetPageSizeWithRotation(i).Height);
                                }
                                else
                                {
                                    cb.AddTemplate(page, 1f, 0, 0, 1f, 0, 0);
                                }
                            }
                        }
                        arrayIndex++;
                    }
                }

                SetPDFViewerPropertiesPost(writer);
                document.Close();
                HttpContext.Current.Response.OutputStream.Write(PDFData.GetBuffer(), 0, PDFData.GetBuffer().Length);
                HttpContext.Current.Response.OutputStream.Flush();
                HttpContext.Current.Response.OutputStream.Close();
                HttpContext.Current.Response.End();
                
            }
            catch (Exception e) { throw e; }

        }

        private void ProcessControlPage(HtmlForm form, PdfWriter writer, MemoryStream PDFData, FileInfo fileInfo, Document document)
        {
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            if (fileInfo.ControlPageIndex != null)
            {
                form.Controls[fileInfo.ControlPageIndex].RenderControl(hw);
            }
            ProcessHTML(document, sw);
        }

        private void ProcessHTML(Document document, StringWriter sw)
        {
            document.SetPageSize(PageSize.A4);
            document.NewPage();            
            String htmlText = sw.ToString().Replace(sw.NewLine, string.Empty).Trim();
            iTextSharp.text.html.simpleparser.HTMLWorker htmlparser = new iTextSharp.text.html.simpleparser.HTMLWorker(document);
            htmlparser.Parse(new StringReader(htmlText));

        }

        private void SetPDFViewerPropertiesPre(PdfWriter writer)
        {
            System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();

            //if (EnablePDFPrint)
            //    writer.SetEncryption(null, encoding.GetBytes("12345678"), PdfWriter.ALLOW_PRINTING, PdfWriter.STRENGTH40BITS);
            //if (EnablePDFSave)
            //    writer.SetEncryption(null, encoding.GetBytes("12345678"), PdfWriter.ALLOW_COPY, PdfWriter.STRENGTH40BITS);
            //if (!EnablePDFToolBar)
            //    writer.SetEncryption(null, encoding.GetBytes("12345678"), PdfWriter.HideToolbar, PdfWriter.STRENGTH40BITS);
            //if (!EnablePDFWindowUI)
            //    writer.SetEncryption(null, encoding.GetBytes("12345678"), PdfWriter.HideWindowUI, PdfWriter.STRENGTH40BITS);
            //if (!EnablePDFMenubar)
            //    writer.SetEncryption(null, encoding.GetBytes("12345678"), PdfWriter.HideMenubar, PdfWriter.STRENGTH40BITS);

        }

        private void SetPDFViewerPropertiesPost(PdfWriter writer)
        {
            if (EnablePDFAutomaticPrint)
            {
                string jsText = String.Empty;

                if (PDFAutomaticPrintWaitTime > 0)
                    jsText = "var res = app.setTimeOut('var pp = this.getPrintParams();pp.interactive = pp.constants.interactionLevel.full;this.print(pp);', " + PDFAutomaticPrintWaitTime + ");";
                else
                    jsText = "var pp = this.getPrintParams();pp.interactive = pp.constants.interactionLevel.full;this.print(pp);";
                PdfAction js = PdfAction.JavaScript(jsText, writer);
                writer.AddJavaScript(js);
            }
        }

        #endregion
    }

}