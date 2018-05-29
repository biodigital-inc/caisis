using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;

using Caisis.BOL;
using Caisis.Controller;
using Caisis.DataAccess;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.Security;

namespace Caisis.UI.Admin
{
    public partial class Eforms_ViewStatic : AdminBasePage
    {
        protected string EformName
        {
            get
            {
                return Request.QueryString["eform"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!string.IsNullOrEmpty(EformName))
            {
                BuildEformPreview(EformName);
            }
        }

        private void BuildEformPreview(string eformName)
        {
            Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
            string disease = sc.GetViewMode();
            EFormController ec = new EFormController();
            var eFormComponents = GetEformComponents(Page, disease, eformName);

            // DEBUG INFO

            // get all input controls across eform
            var map = from entry in eFormComponents
                      select new
                      {
                          SectionName = entry.Key,
                          Components = from component in entry.Value
                                       let inputs = CICHelper.GetCaisisInputControls(component).OfType<IEformInputField>()
                                       let inputTypes = from i in inputs
                                                        group i by i.GetType().Name into g
                                                        select g.Key + ": " + g.Count()
                                       select new
                                       {
                                           Component = component,
                                           Title = component.Title,
                                           InputControls = inputs,
                                           InputControlsCount = inputs.Count(),
                                           InputControlsStats = string.Join(" | ", inputTypes.ToArray())
                                       }
                      };
            var allEformInputControls = map.SelectMany(a => a.Components.SelectMany(b => b.InputControls));

            foreach (var inputControl in allEformInputControls)
            {
                var debugInfo = new Dictionary<string, string>();
                // add standard debug
                debugInfo.Add("Table", inputControl.Table);
                debugInfo.Add("Field", inputControl.Field);
                debugInfo.Add("Record Id", inputControl.RecordId);
                debugInfo.Add("Parent Record Id", inputControl.ParentRecordId);
                // only show required if field is actually required
                if (inputControl.Required)
                {
                    debugInfo.Add("Required", inputControl.Required.ToString());
                }
                // type info
                debugInfo.Add("Control Type", inputControl.GetType().Name);
                // lookup code fix
                if (inputControl is ICaisisLookupControl)
                {
                    var lkpControl = inputControl as ICaisisLookupControl;
                    string lkpCode = lkpControl.LookupCode;
                    string lkpDistinct = lkpControl.LookupDistinct;
                    debugInfo.Add("Lookup Code", lkpCode);
                    debugInfo.Add("Lookup Distinct", lkpDistinct);
                    // supress @PatientId lookup
                    if ((!string.IsNullOrEmpty(lkpCode) && lkpCode.Contains("@PatientId")) || (!string.IsNullOrEmpty(lkpDistinct) && lkpDistinct.Contains("@PatientId")))
                    {
                        lkpControl.LookupCode = string.Empty;
                        lkpControl.LookupDistinct = string.Empty;
                    }
                }

                // set debug info
                if (inputControl is WebControl)
                {
                    WebControl iWebControl = inputControl as WebControl;
                    // cleanup attributes ( no need to show empty attributes)
                    var tooltipInfo = from info in debugInfo
                                      where !string.IsNullOrEmpty(info.Value)
                                      select string.Format("{0}: {1}", info.Key, info.Value);
                    // set tooltip
                    iWebControl.Attributes["title"] = string.Join(" | ", tooltipInfo.ToArray());
                }
            }

            // build navigation
            EformSectionNaviation.DataSource = map;
            EformSectionNaviation.DataBind();

            // build UI
            EformSectionRptr.DataSource = map;
            EformSectionRptr.DataBind();

            // debug XML
            EformConfig config = EformConfig.GetByName(eformName);

            var elements = from eControl in allEformInputControls
                           let table = eControl.Table + ""
                           let recordId = eControl.RecordId + ""
                           let parentRecordId = eControl.ParentRecordId + ""
                           let depth = BOL.BusinessObjectFactory.CanBuildBusinessObject(table) ? BOL.BusinessObject.GetTableDepth(table) : int.MaxValue
                           group eControl by new { Table = table, RecordId = recordId, ParentRecordId = parentRecordId, Depth = depth } into g
                           let recordSort = !string.IsNullOrEmpty(g.Key.RecordId) ? int.Parse(g.Key.RecordId) : 0
                           orderby g.Key.Depth ascending, g.Key.Table ascending, recordSort ascending
                           select new
                             {
                                 Table = g.Key.Table,
                                 Depth = g.Key.Depth,
                                 RecordId = g.Key.RecordId,
                                 ParentRecordId = g.Key.ParentRecordId,
                                 Fields = (from e in g
                                           orderby e.Field ascending
                                           select new
                                               {
                                                   Field = e.Field.Trim()
                                               }).Distinct()
                             };

            var nodesWithChildren = from child in elements
                                    let childTableName = child.Table
                                    where BusinessObjectFactory.CanBuildBusinessObject(childTableName)
                                    let childParentTableName = BusinessObject.GetParentTablename(childTableName)
                                    join parent in elements on new { table = childParentTableName, b = child.ParentRecordId } equals new { table = parent.Table, b = parent.RecordId } into results
                                    let p = results.FirstOrDefault()
                                    where p != null
                                    select new
                                    {
                                        Parent = p,
                                        Child = child
                                    };
            var nodesWithoutChildren = elements.Except(nodesWithChildren.Select(a => a.Parent));
            // init a list of top level nodes, with those w/o child records
            List<XElement> topLevelNodes = new List<XElement>(from element in nodesWithoutChildren
                                                              select new XElement(element.Table,
                                                                                   new XAttribute("Depth", element.Depth),
                                                                                   new XAttribute("RecordId", element.RecordId),
                                                                                   new XAttribute("ParentRecordId", element.ParentRecordId),
                                                                                       from e in element.Fields
                                                                                       orderby e.Field ascending
                                                                                       select new XElement(e.Field.Trim())
                                                                                   ));
            // create a lookup for finding parent node
            var lookup = new Dictionary<KeyValuePair<string, string>, XElement>();
            foreach (var a in nodesWithChildren)
            {
                var child = a.Child;
                var parent = a.Parent;
                var testKey = new KeyValuePair<string, string>(parent.Table, parent.RecordId);
                var testChildKey = new KeyValuePair<string, string>(child.Table, child.ParentRecordId + "_" + child.RecordId);
                XElement parentNode = null;
                XElement childNode = null;
                if (lookup.ContainsKey(testKey))
                {
                    parentNode = lookup[testKey];
                }
                else
                {
                    parentNode = new XElement(parent.Table,
                                               new XAttribute("Depth", parent.Depth),
                                               new XAttribute("RecordId", parent.RecordId),
                                               new XAttribute("ParentRecordId", parent.ParentRecordId),
                                                   from e in parent.Fields
                                                   orderby e.Field ascending
                                                   select new XElement(e.Field.Trim())
                                               );
                    // add lookup entry
                    lookup.Add(testKey, parentNode);
                    topLevelNodes.Add(parentNode);
                }
                // add child
                if (lookup.ContainsKey(testChildKey))
                {
                    childNode = lookup[testChildKey];
                }
                else
                {
                    childNode = new XElement(child.Table,
                                               new XAttribute("Depth", child.Depth),
                                               new XAttribute("RecordId", child.RecordId),
                                               new XAttribute("ParentRecordId", child.ParentRecordId),
                                                   from e in child.Fields
                                                   orderby e.Field ascending
                                                   select new XElement(e.Field.Trim())
                                               );
                    // add lookup entry
                    lookup.Add(testChildKey, childNode);
                    parentNode.Add(childNode);
                }

            }

            // order all top level nodes
            var orderedContent = from element in topLevelNodes
                                 let recordSort = !string.IsNullOrEmpty(element.Attribute("RecordId").Value) ? int.Parse(element.Attribute("RecordId").Value) : 0
                                 orderby int.Parse(element.Attribute("Depth").Value) ascending, element.Name.LocalName ascending, recordSort ascending
                                 select new XElement(element.Name.LocalName,
                                                     element.Attributes().Where(a => a.Name.LocalName != "Depth" && !string.IsNullOrEmpty(a.Value)),
                                                     element.Descendants());
            // finally build XML document
            var debugXML = new XDocument(
                // declaration            
                                new XDeclaration("1.0", "utf-8", "yes"),
                // root with attributes
                                new XElement("eform",
                                    new XAttribute("name", eformName), new XAttribute("displayName", config.DisplayName),
                // eform content
                                orderedContent)
                            );

            // write to text box (for some reason, no declaration outpout by default)
            var outputWriter = new System.IO.StringWriter();
            debugXML.Save(outputWriter);
            EformDebug.Text = outputWriter.ToString();

            // cleanup
            outputWriter.Flush();
            outputWriter.Close();
        }


        protected void BuildSectionNavigation(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var sectionComponents = DataBinder.Eval(e.Item.DataItem, "Components");
                var sectionNavigation = e.Item.FindControl("EformSectionComponentsNaviation") as Repeater;
                sectionNavigation.DataSource = sectionComponents;
                sectionNavigation.DataBind();
            }
        }

        protected void LoadEformComponents(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var sectionComponents = DataBinder.Eval(e.Item.DataItem, "Components");
                var componentsRptr = e.Item.FindControl("EformComponentsRptr") as Repeater;
                componentsRptr.DataSource = sectionComponents;
                componentsRptr.DataBind();
            }
        }

        protected void LoadEformControl(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var component = DataBinder.Eval(e.Item.DataItem, "Component") as BaseEFormControl;
                var holder = e.Item.FindControl("ComponentHolder");
                holder.Controls.Add(component);
            }
        }


        #region MOVE TO CENTRALIZED LOCATION (controller???)

        public static XDocument GetEformXml(Page page, string eformName)
        {
            EformConfig config = EformConfig.GetByName(eformName);
            string fileName = config.FileName;
            string modFolder = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(fileName, "EForms");
            string eformsXmlFile = "~/Modules/" + modFolder + "/EForms/" + fileName;
            var xDoc = Caisis.UI.Core.Classes.XmlUtil.GetXDoc(eformsXmlFile);
            return xDoc;
        }

        public static Dictionary<string, List<Caisis.UI.Core.Classes.BaseEFormControl>> GetEformComponents(System.Web.UI.Page page, string disease, string eformName)
        {
            var xDoc = GetEformXml(page, eformName);

            var sectionsToComponents = new Dictionary<string, List<Caisis.UI.Core.Classes.BaseEFormControl>>();
            if (xDoc != null)
            {
                var map = from section in xDoc.XPathSelectElements("eform/eformSection")
                          let sectionName = section.Attribute("name").Value
                          let components = section.Descendants("eformItem")
                          select new
                          {
                              SectionName = sectionName,
                              Components = GetEformComponents(page, disease, eformName, section)
                          };
                sectionsToComponents = map.ToDictionary(a => a.SectionName, a => a.Components.ToList());
            }

            return sectionsToComponents;
        }

        public static IEnumerable<Caisis.UI.Core.Classes.BaseEFormControl> GetEformComponents(System.Web.UI.Page page, string disease, string eformName, string eformSectionName)
        {
            var xDoc = GetEformXml(page, eformName);
            if (xDoc != null)
            {
                var sectionNode = xDoc.XPathSelectElement("eform/eformSection[@name='" + eformSectionName + "']");
                if (sectionNode != null)
                {
                    return GetEformComponents(page, disease, eformName, sectionNode);
                }
            }

            return new List<Caisis.UI.Core.Classes.BaseEFormControl>();
        }

        public static IEnumerable<Caisis.UI.Core.Classes.BaseEFormControl> GetEformComponents(System.Web.UI.Page page, string disease, string eformName, XElement eformSectionNode)
        {
            var sectionComponents = from component in eformSectionNode.Descendants("eformItem")
                                    let eComponent = GetEformComponent(page, disease, component)
                                    where eComponent != null
                                    select eComponent;
            return sectionComponents;
        }

        private static BaseEFormControl GetEformComponent(System.Web.UI.Page page, string disease, XElement node)
        {
            string controlName = "";
            string controlTitle = "";
            string overrideLookupCodes = "";
            string associatedEformName = "";
            string associatedEformSectionName = "";

            controlName = node.Attribute("controlName").Value + ".ascx";

            if (node.Attribute("displayName") != null)
            {
                controlTitle = node.Attribute("displayName").Value;
            }

            if (node.Attribute("overrideLookupCodes") != null)
            {
                overrideLookupCodes = node.Attribute("overrideLookupCodes").Value;
            }

            if (node.Attribute("associatedEformName") != null)
            {
                associatedEformName = node.Attribute("associatedEformName").Value;
            }

            if (node.Attribute("associatedEformSectionName") != null)
            {
                associatedEformSectionName = node.Attribute("associatedEformSectionName").Value;
            }

            //System.Web.UI.UserControl eFormControl;
            Caisis.UI.Core.Classes.BaseEFormControl eFormControl;

            // check the current disease view first for the .ascx file
            if (System.IO.File.Exists("~/Modules/" + disease + "/Eforms/" + controlName))
            {
                eFormControl = page.LoadControl("~/Modules/" + disease + "/Eforms/" + controlName) as Caisis.UI.Core.Classes.BaseEFormControl;
            }
            else // check the other modules for the .ascx file
            {
                string folder = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(controlName, "EForms");
                eFormControl = page.LoadControl("~/Modules/" + folder + "/Eforms/" + controlName) as Caisis.UI.Core.Classes.BaseEFormControl;
            }
            if (eFormControl != null)
            {
                // set the control properties
                eFormControl.Title = controlTitle;
                eFormControl.LookupCodes = overrideLookupCodes;
                eFormControl.AssociatedEformName = associatedEformName;
                eFormControl.AssociatedEformSectionName = associatedEformSectionName;
            }

            return eFormControl;
        }

        #endregion
    }
}