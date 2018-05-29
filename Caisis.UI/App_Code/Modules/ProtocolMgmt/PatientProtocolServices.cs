using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text;
using System.IO;

// XML
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;
using System.Xml.Linq;

using System.Reflection;
using System.ComponentModel;
using System.CodeDom;
using System.CodeDom.Compiler;
using Microsoft.CSharp;

using Caisis.BOL;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public static class PatientProtocolServices
    {
        public static XDocument Serialize<T>(T objectInstance)
        {
            XmlSerializer xmlSerializer = new XmlSerializer(typeof(T));
            XDocument serializedObject = new XDocument();
            using (var writer = serializedObject.CreateWriter())
            {
                xmlSerializer.Serialize(writer, objectInstance);
            }
            return serializedObject;
        }

        public static T Deserialize<T>(XDocument xObject)
        {
            XmlSerializer xmlSerializer = new XmlSerializer(typeof(T));
            using (var xmlReader = xObject.Root.CreateReader())
            {
                return (T)xmlSerializer.Deserialize(xmlReader);
            }
        }

    }
}
