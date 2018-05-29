using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Web;

using System.IO;
using System.Xml;
using System.Xml.Serialization;

namespace Caisis.UI.ClientScript.JSON
{
    /// <summary>
    /// A static serialization class used to serialize and de-serialize objects marked with [DataControl] attribute.
    /// </summary>
    public static class ObjectSerializer
    {
        private static IEnumerable<Type> SerilizationTypeList = new List<Type>() { typeof(int), typeof(string), typeof(bool) };

        /// <summary>
        /// Returns an instace of T based on it's JSON representation.
        /// </summary>
        /// <typeparam name="T">The type of object to deserialize</typeparam>
        /// <param name="json">The JSON string from which the object will be deserialized</param>
        /// <returns></returns>
        public static T InstanceFromJSON<T>(string json)
        {
            T objInstance = Activator.CreateInstance<T>();
            MemoryStream ms = new MemoryStream(System.Text.Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(objInstance.GetType());
            objInstance = (T)serializer.ReadObject(ms);
            ms.Close();
            ms.Dispose();
            return objInstance;
        }

        /// <summary>
        /// Returns a serialized object in its JSON representation
        /// </summary>
        /// <param name="instance"></param>
        /// <returns></returns>
        public static string ObjectToJSON(object objectToSerialize)
        {
            MemoryStream ms = new MemoryStream();
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(objectToSerialize.GetType());
            serializer.WriteObject(ms, objectToSerialize);
            ms.Close();
            ms.Dispose();
            string serializedObj = System.Text.Encoding.UTF8.GetString(ms.ToArray());
            return serializedObj;
        }

        /// <summary>
        /// Returns a serializeable object as an XML Document
        /// </summary>
        /// <param name="objectToSerialize"></param>
        /// <returns></returns>
        public static XmlDocument ObjectToXML(object objectToSerialize)
        {
            MemoryStream ms = new MemoryStream();
            XmlSerializer serializer = new XmlSerializer(objectToSerialize.GetType());
            XmlTextWriter xmlTextWriter = new XmlTextWriter(ms, System.Text.Encoding.UTF8);
            serializer.Serialize(xmlTextWriter, objectToSerialize);
            ms = (MemoryStream)xmlTextWriter.BaseStream;
            string rawXML = System.Text.Encoding.UTF8.GetString(ms.ToArray());
            XmlDocument xDoc = new XmlDocument();
            xDoc.LoadXml(rawXML.Trim());
            return xDoc;
        }
    }

    /// <summary>
    /// The base class for all simple serializeable objects.
    /// </summary>
    [DataContract]
    public abstract class BaseSerializable
    {
        /// <summary>
        /// Returns a JSON serialized string of this object
        /// </summary>
        /// <returns></returns>
        public string ToJSON()
        {
            return ObjectSerializer.ObjectToJSON(this);
        }

        /// <summary>
        /// Returns a serialized XmlDocument of this object
        /// </summary>
        /// <returns></returns>
        public XmlDocument ToXml()
        {
            return ObjectSerializer.ObjectToXML(this);
        }
    }

    [DataContract]
    public class Eform : BaseSerializable
    {
        private string name;

        [DataMember]
        public string Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }

        private string disease;

        [DataMember]
        public string Disease
        {
            get
            {
                return disease;
            }
            set
            {
                disease = value;
            }
        }

        private string versionNumber;
        [DataMember]
        public string VersionNumber
        {
            get
            {
                return versionNumber;
            }
            set
            {
                versionNumber = value;
            }
        }

        private List<EformPage> _pages = new List<EformPage>();

        [DataMember]
        public EformPage[] Pages
        {
            get
            {
                return _pages.ToArray();
            }
            set
            {
                _pages = new List<EformPage>(value);
            }
        }

        public Eform()
        {
        }

        public Eform(string name)
            : this()
        {
            this.name = name;
        }

        public void AddPage(EformPage page)
        {
            this._pages.Add(page);
        }
    }

    [DataContract]
    public class EformPage : BaseSerializable
    {
        private string title;
        [DataMember]
        public string Title
        {
            get
            {
                return title;
            }
            set
            {
                title = value;
            }
        }

        private int pageNumber;

        [DataMember]
        public int PageNumber
        {
            get
            {
                return pageNumber;
            }
            set
            {
                pageNumber = value;
            }
        }

        private string versionNumber;
        [DataMember]
        public string VersionNumber
        {
            get
            {
                return versionNumber;
            }
            set
            {
                versionNumber = value;
            }
        }

        private List<EformSection> _sections = new List<EformSection>();

        [DataMember]
        public EformSection[] Sections
        {
            get
            {
                return _sections.ToArray();
            }
            set
            {
                _sections = new List<EformSection>(value);
            }
        }

        public EformPage()
        {
        }

        public EformPage(string title)
            : this()
        {
            this.title = title;
        }

        public void AddSection(EformSection section)
        {
            this._sections.Add(section);
        }
    }

    [DataContract]
    public class EformSection : BaseSerializable
    {
        private string title;
        [DataMember]
        public string Title
        {
            get
            {
                return title;
            }
            set
            {
                title = value;
            }
        }

        private bool showTitle;

        [DataMember]
        public bool ShowTitle
        {
            get
            {
                return showTitle;
            }
            set
            {
                showTitle = value;
            }
        }

        private bool isGrid;

        [DataMember]
        public bool IsGrid
        {
            get
            {
                return isGrid;
            }
            set
            {
                isGrid = value;
            }
        }

        private EformSection[] childSections = new EformSection[0];

        [DataMember]
        public EformSection[] ChildSections
        {
            get
            {
                return childSections;
            }
            set
            {
                childSections = value;
            }
        }

        private List<EformField> _fields = new List<EformField>();

        [DataMember]
        public EformField[] Fields
        {
            get
            {
                return _fields.ToArray();
            }
            set
            {
                _fields = new List<EformField>(value);
            }
        }

        public EformSection()
        {
            this.showTitle = true;
        }

        public EformSection(string title)
            : this()
        {
            this.title = title;
        }

        public void AddField(EformField field)
        {
            _fields.Add(field);
        }
    }

    [DataContract]
    public class EformField : BaseSerializable
    {
        private string table;

        [DataMember]
        public string Table
        {
            get
            {
                return table;
            }
            set
            {
                table = value;
            }
        }

        private string field;

        [DataMember]
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

        private string controlType;
        [DataMember]
        public string ControlType
        {
            get
            {
                return controlType;
            }
            set
            {
                controlType = value;
            }
        }

        private int rowIndex;
        [DataMember]
        public int RowIndex
        {
            get
            {
                return rowIndex;
            }
            set
            {
                rowIndex = value;
            }
        }

        private int colIndex;
        [DataMember]
        public int ColIndex
        {
            get
            {
                return colIndex;
            }
            set
            {
                colIndex = value;
            }
        }

        public EformField()
        {
        }

        public EformField(string table, string field, string controlType)
            : this()
        {
            this.table = table;
            this.field = field;
            this.controlType = controlType;
        }
    }
}
