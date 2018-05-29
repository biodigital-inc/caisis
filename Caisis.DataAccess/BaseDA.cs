using System;
using System.Collections.Generic;
using System.Text;

namespace Caisis.DataAccess
{
    public enum ExtendedProperty
    {
        Suppress,
        RowCount
    }   

    abstract public class BaseDA
    {
        [Obsolete("Do not reference. Starting with v4.0 dynamic Sql replaced all the standard get, update, insert, and delete stored procedures.", false)]
        protected virtual void SetParams(){}

        protected string _InsertStoredProc;
        protected string _UpdateStoredProc;
        protected string _DeleteStoredProc;
        protected string _GetStoredProc;
        protected string _GetByParentStoredProc;
    }

    
}
