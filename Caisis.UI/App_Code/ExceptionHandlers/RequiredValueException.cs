using System;

namespace Caisis.UI.Core.Classes
{
    /// <summary>
    /// RequiredValueException
    /// </summary>
    public class RequiredValueException : ClientException
    {

        public RequiredValueException() : base() { }

        public RequiredValueException(string message) : base(message) { }


    }
}
