using System;
using System.IO;

using System.Xml;

namespace Caisis.Controller
{
	/// <summary>
	/// Summary description for AccessXmlConverter.
	/// </summary>
	
	public class AccessXmlConverter  
	{		
		protected XmlDocument newSchema;
		//http://www.w3.org/2001/XMLSchema is a newer version but is not backwards compatible with Access 2002
		string xsdNS = "http://www.w3.org/2000/10/XMLSchema";
		string odNS = "urn:schemas-microsoft-com:officedata";
		
		// represents the namespace for XML Namespace, do not change
		string xmlnsNS  = "http://www.w3.org/2000/xmlns/";
		
		public XmlDocument ConvertXml(XmlNode origSchema)  
		{
			newSchema  = new XmlDocument();

			XmlElement schemaRoot = newSchema.CreateElement("xs", "schema", xsdNS);

			// workaround to add the second namespace as an attribute
			XmlAttribute att = newSchema.CreateAttribute("xmlns", "od", xmlnsNS);
			att.Value = this.odNS;
			schemaRoot.Attributes.Append(att);

			/*
			XmlElement elemRoot = newSchema.CreateElement("xs", "element", xsdNS);
			XmlElement complexRoot = newSchema.CreateElement("xs", "complexType", xsdNS);
			XmlElement tableRoot = newSchema.CreateElement("xs", "choice", xsdNS);
			tableRoot.SetAttribute("maxOccurs", "unbounded");
            */

			newSchema.AppendChild(schemaRoot);
			
			/*schemaRoot.AppendChild(elemRoot);
			elemRoot.AppendChild(complexRoot);
			complexRoot.AppendChild(tableRoot);
			
			*/

			
			XmlNode origTableRoot, origTableNode;

			//origTableRoot = origSchema.FirstChild.FirstChild.FirstChild;
			origTableRoot = origSchema;
			if(origTableRoot.HasChildNodes)
			{
				origTableNode = origTableRoot.FirstChild;				
				while(origTableNode!= null)  
				{					
					//tableRoot.AppendChild(this.CreateTableNode(origTableNode));
					schemaRoot.AppendChild(this.CreateTableNode(origTableNode));
					origTableNode = origTableNode.NextSibling;
				}
			}

			return newSchema;
		}



		protected XmlElement CreateTableNode(XmlNode origTable)  
		{
			XmlElement newTable = newSchema.CreateElement("xs", "element", xsdNS);
			newTable.SetAttribute("name", origTable.Attributes["name"].Value);

			XmlElement complexElem = newSchema.CreateElement("xs", "complexType", this.xsdNS);
			XmlElement seqElem = newSchema.CreateElement("xs", "sequence", this.xsdNS);

			newTable.AppendChild(complexElem);
			complexElem.AppendChild(seqElem);

			XmlNode colRoot = origTable.FirstChild.FirstChild;

			XmlNode origCol;
			if (colRoot.HasChildNodes)  
			{
				origCol = colRoot.FirstChild;
				while (origCol != null)  
				{
					seqElem.AppendChild(this.CreateColumnNode(origCol));
					origCol = origCol.NextSibling;
				}
			}
			return newTable;
		}

		protected XmlElement CreateColumnNode(XmlNode origCol)  
		{
			XmlElement newCol = newSchema.CreateElement("xs", "element", xsdNS);
			newCol.SetAttribute("name", origCol.Attributes["name"].Value);
			newCol.SetAttribute("minOccurs", origCol.Attributes["minOccurs"].Value);

			this.AddDataType(origCol, newCol);

			return newCol;
		}

		protected void AddDataType(XmlNode origCol, XmlElement newCol)  
		{			
			string dataType = origCol.Attributes["type"].Value;

			XmlAttribute att = newSchema.CreateAttribute("od", "jetType", this.odNS);
			
			switch (dataType)  
			{
				case "xs:dateTime" :
					att.Value = "datetime";
					break;
				case "xs:string" :
					if (origCol.Attributes["name"].Value.IndexOf("Note") > -1)  
					{
						att.Value = "memo";
					}
					else 
					{
						att.Value = "text";
					}
					break;
				case "xs:int" :
					att.Value = "longinteger";
					break;
				case "xs:boolean" :
					att.Value = "yesno";
					break;

			}

			newCol.Attributes.Append(att);
		}
	}
}
