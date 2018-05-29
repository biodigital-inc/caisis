using System;

namespace Caisis.DataAccess
{
    public enum DeidentifyOptions
    {
        None = 0,
        Omit,
        MaskDate,
        Randomize
    }

    public enum LimitIdentificationOptions
    {
        None = 0,
        Omit,
        Randomize
    }
}
