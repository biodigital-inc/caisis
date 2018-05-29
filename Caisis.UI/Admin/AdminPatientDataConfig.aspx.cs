using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;

using Caisis.UI.Admin;
using Caisis.UI.Core.Classes;


public partial class AdminPatientDataConfig : AdminBasePage
{

    /// <summary>
    /// Gets of Sets the XPath of the currently selected TreeNode
    /// </summary>
    /// 
    public string CurrentXPath
    {
        get
        {
            return XPathHidden.Value;
        }
        set
        {
            XPathHidden.Value = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// Renders tree with all nodes closed except current node.
    /// </summary>
    /// <param name="writer"></param>
    protected override void Render(HtmlTextWriter writer)
    {
        SetCollapseExpandState();
        base.Render(writer);
    }

    /// <summary>
    /// Sets the current node's xpath in order to later access node in XmlDocument
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void SetSelectedNodeXPath(object sender, EventArgs e)
    {
        TreeView tree = (TreeView)sender;
        if (tree.SelectedNode != null)
        {
            CurrentXPath = tree.SelectedNode.DataPath;
            PopulateEditor();
        }
    }

    /// <summary>
    /// Used to populate Attributes Editor with atrributes/values from current selected node.
    /// </summary>
    /// <param name="xPath">location of node used to populate editor</param>
    protected void PopulateEditor()
    {
        XmlNode currentNode = GetCurrentXmlNode();
        if (currentNode != null)
        {
            CurrentNodeLabel.Text = currentNode.Attributes["menuTitle"].Value;
            foreach (Control con in AttributesEditor.Controls)
            {
                if (currentNode.Attributes[con.ID] != null && (con is TextBox || con is DropDownList))
                {
                    string val = currentNode.Attributes[con.ID].Value;
                    if (!string.IsNullOrEmpty(val))
                    {
                        SetControlValue(con, val);
                    }
                }
            }
        }
    }


    /// <summary>
    /// When save is clicked, update current node with values form Atrributes Editor and save XML document.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void SaveAttributes(object sender, EventArgs e)
    {
        string XmlSavePath = Server.MapPath(XmlDS.DataFile);
        try
        {
            XmlDocument xDoc = GetXmlConfigDoc();
            if (xDoc != null)
            {
                XmlNode currentNode = xDoc.SelectSingleNode(CurrentXPath);
                if (currentNode != null)
                {
                    foreach (Control con in AttributesEditor.Controls)
                    {
                        // Updates XML Attributes which have changed and which exist
                        if (currentNode.Attributes[con.ID] != null && (con is TextBox || con is DropDownList))
                        {
                            string oldVal = currentNode.Attributes[con.ID].Value;
                            string newVal = GetControlValue(con);
                            if (oldVal != newVal)
                            {
                                // Empty for these are allowed
                                if (string.IsNullOrEmpty(newVal) && con.ID == "displayWithChild" || con.ID == "fileName")
                                {
                                    currentNode.Attributes[con.ID].Value = newVal;
                                }
                                else
                                {
                                    // TEMP FIX - top level items currently have a title attribute
                                    // which set the top level titles , where it should be menu titles
                                    // as child menus, need to fix in CustomMenuControl
                                    if (con.ID == "menuTitle" && currentNode.ParentNode.Name == "menus")
                                    {
                                        currentNode.Attributes["title"].Value = newVal;
                                    }
                                    else
                                    {
                                        currentNode.Attributes[con.ID].Value = newVal;
                                    }
                                }
                            }
                        }
                        // Comment Out the following section to add attributes to nodes
                        // to Xml Document when user sets and atrribute not defined in the XML
                        else
                        {
                            string newVal = GetControlValue(con);
                            if (!string.IsNullOrEmpty(newVal))
                            {
                                XmlAttribute newAtt = xDoc.CreateAttribute(con.ID);
                                newAtt.Value = newVal;
                                currentNode.Attributes.Append(newAtt);
                            }
                        }

                    }
                }
                xDoc.Save(XmlSavePath);
            }
        }
        catch (Exception ex)
        {
            Response.Write("<span style=\"color: #cc3300;\">There was an error saving the XML file, please ensure that you have write permissions to the App_Data directory.</span>");
            Page_Load(sender, e);
        }
    }

    #region HELPER METHODS

    /// <summary>
    /// Close all tree node and only expand current node.
    /// </summary>
    private void SetCollapseExpandState()
    {
        // Closes all tree node, only top level nodes visible
        foreach (TreeNode leaf in this.XmlConfigTree.Nodes)
        {
            leaf.CollapseAll();
        }
        // If a current node is selected, expand that node (also parent).
        if (this.XmlConfigTree.SelectedNode != null)
        {
            TreeNode selectedParent = this.XmlConfigTree.SelectedNode;
            XmlNode currentNode = GetCurrentXmlNode();
            if (currentNode != null)
            {
                CurrentNodeLabel.Text = currentNode.Attributes["menuTitle"].Value;
                selectedParent.Text = currentNode.Attributes["menuTitle"].Value;
            }

            while ((selectedParent = selectedParent.Parent) != null)
            {
                selectedParent.Expand();
            }
        }
    }

    private XmlDocument GetXmlConfigDoc()
    {
        return XmlDS.GetXmlDocument();
    }

    /// <summary>
    /// Gets the XmlNode which correspons to the selected TreeNode in the Tree.
    /// </summary>
    /// <returns>XmlNode </returns>
    private XmlNode GetCurrentXmlNode()
    {
        XmlDocument xDoc = XmlDS.GetXmlDocument();
        if (xDoc != null && !string.IsNullOrEmpty(CurrentXPath))
        {
            return xDoc.SelectSingleNode(CurrentXPath);
        }
        else
        {
            return null;
        }
    }

    private string GetControlValue(Control con)
    {
        if (con is TextBox)
        {
            return ((TextBox)con).Text;
        }
        else if (con is DropDownList)
        {
            return ((DropDownList)con).SelectedValue;
        }
        else
        {
            return "";
        }
    }

    private void SetControlValue(Control con, string value)
    {
        if (con is TextBox)
        {
            ((TextBox)con).Text = value;
        }
        else if (con is DropDownList)
        {
            ((DropDownList)con).SelectedIndex = value == "true" ? 1 : 2;
        }
    }

    #endregion

}
