using System;

namespace Caisis.UI.Core.Classes
{
	/// <summary>
	/// Used to keep track of the names of the variables stored in the UserAttributes table.
	/// </summary>
	public class UserAttributeName
	{
        /// <summary>
        /// UserAttrbuteType="Default Dataset"; UserAttributeValue="Dataset Id"
        /// </summary>
        public const string DatasetId = "Dataset Id";

        /// <summary>
        /// UserAttrbuteType="Chron List Preference"; UserAttributeName="Exclude Labs"; UserAttributeValue = [true/false]
        /// </summary>
        public const string ExcludeLabs = "Exclude Labs";
       
        
    }

    /// <summary>
    /// Used to keep track of the Type of the variables stored in the UserAttributes table.
    /// </summary>
    public class UserAttributeType
    {
        /// <summary>
        /// UserAttrbuteType="Default Dataset"; UserAttributeValue="Dataset Id"
        /// </summary>
        public const string DefaultDataset = "Default Dataset";

        /// <summary>
        /// UserAttrbuteType="Chron List Preference"; UserAttributeName="Exclude Labs"; UserAttributeValue = [true/false]
        /// </summary>
        public const string ChronListPreference = "Chron List Preference";

    }
}
