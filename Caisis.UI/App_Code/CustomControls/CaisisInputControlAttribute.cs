using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Caisis.UI.Core.Classes.CustomControls;

using System.Reflection;
using System.Reflection.Emit;

namespace Caisis.UI.Core.Classes
{
    /// <summary>
    /// An attribute specifying a Property set via MetaData
    /// </summary>
    [AttributeUsage(AttributeTargets.Property, Inherited = true)]
    public class CaisisMetaDataField : Attribute
    {

    }

    /// <summary>
    /// An attribute specifying an ICaisisInputControl which can by
    /// dynamically invoked, through reflection, at runtime.
    /// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Class, Inherited = false)]
    public class CaisisInvokeableControl : Attribute
    {
    }
}