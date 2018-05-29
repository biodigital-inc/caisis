using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;
using Caisis.BOL;

/// <summary>
/// Summary description for BaseLongitudinalControl
/// </summary>
public class BaseLongitudinalControl: BaseControl
{
    private int _patientId;
    private int _physicianId;
    private DateTime _coversheetDate;
    private string _coversheetTo;
    private string _coversheetToTitle;
    private string _coversheetToFirstName;
    private string _coversheetToLastName;
    private string _coversheetToFax;
    private string _coversheetToAddress1;
    private string _coversheetToAddress2;
    private string _coversheetToCity;
    private string _coversheetToState;
    private string _coversheetToPostalCode;
    private string _coversheetFrom;
    private string _coversheetFromPhone;
    private string _coversheetFromFax;
    private string _coversheetFromAddress;


    private string _coversheetFaxPages;
    private string _coversheetFaxRE;
    private string _coversheetFaxMemo;

    private string _coversheetLetterBody;
    private string _coversheetLetterSalutation;
    private string _coversheetLetterClosure1;
    private string _coversheetLetterClosure2;
    private string _coversheetLetterClosure3;
    private string _coversheetLetterClosure4;

    private string _coverletterxml;
    private string _addressLabelPatientIds;

    public int PatientId
    {
        get
        {
            return _patientId;
        }

        set
        {
            _patientId = value;
        }
    }

    public int PhysicianId
    {
        get
        {
            return _physicianId;
        }

        set
        {
            _physicianId = value;
        }
    }

    public DateTime CoversheetDate
    {
        get
        {
            return _coversheetDate;
        }

        set
        {
            _coversheetDate = value;
        }
    }

    public string CoversheetTo
    {
        get
        {
            return _coversheetTo;
        }

        set
        {
            _coversheetTo = value;
        }
    }

    public string CoversheetToTitle
    {
        get
        {
            return _coversheetToTitle;
        }

        set
        {
            _coversheetToTitle = value;
        }
    }

    public string CoversheetToFirstName
    {
        get
        {
            return _coversheetToFirstName;
        }

        set
        {
            _coversheetToFirstName = value;
        }
    }

    public string CoversheetToLastName
    {
        get
        {
            return _coversheetToLastName;
        }

        set
        {
            _coversheetToLastName = value;
        }
    }

    public string CoversheetToFax
    {
        get
        {
            return _coversheetToFax;
        }

        set
        {
            _coversheetToFax = value;
        }
    }

    
    public string CoversheetToAddress1
    {
        get
        {
            return _coversheetToAddress1;
        }

        set
        {
            _coversheetToAddress1 = value;
        }
    }

    public string CoversheetToAddress2
    {
        get
        {
            return _coversheetToAddress2;
        }

        set
        {
            _coversheetToAddress2 = value;
        }
    }

    public string CoversheetToCity
    {
        get
        {
            return _coversheetToCity;
        }

        set
        {
            _coversheetToCity = value;
        }
    }

    public string CoversheetToState
    {
        get
        {
            return _coversheetToState;
        }

        set
        {
            _coversheetToState = value;
        }
    }

    public string CoversheetToPostalCode
    {
        get
        {
            return _coversheetToPostalCode;
        }

        set
        {
            _coversheetToPostalCode = value;
        }
    }


    public string CoversheetFrom
    {
        get
        {
            return _coversheetFrom;
        }

        set
        {
            _coversheetFrom = value;
        }
    }

    public string CoversheetFromPhone
    {
        get
        {
            return _coversheetFromPhone;
        }

        set
        {
            _coversheetFromPhone = value;
        }
    }

    public string CoversheetFromFax
    {
        get
        {
            return _coversheetFromFax;
        }

        set
        {
            _coversheetFromFax = value;
        }
    }

    public string CoversheetFromAddress
    {
        get
        {
            return _coversheetFromAddress;
        }

        set
        {
            _coversheetFromAddress = value;
        }
    }


    public string CoversheetFaxPages
    {
        get
        {
            return _coversheetFaxPages;
        }

        set
        {
            _coversheetFaxPages = value;
        }
    }

    public string CoversheetFaxRE
    {
        get
        {
            return _coversheetFaxRE;
        }

        set
        {
            _coversheetFaxRE = value;
        }
    }

    public string CoversheetFaxMemo
    {
        get
        {
            return _coversheetFaxMemo;
        }

        set
        {
            _coversheetFaxMemo = value;
        }
    }

    public string CoversheetLetterBody
    {
        get
        {
            return _coversheetLetterBody;
        }

        set
        {
            _coversheetLetterBody = value;
        }
    }

    public string CoversheetLetterSalutation
    {
        get
        {
            return _coversheetLetterSalutation;
        }

        set
        {
            _coversheetLetterSalutation = value;
        }
    }

    public string CoversheetLetterClosure1
    {
        get
        {
            return _coversheetLetterClosure1;
        }

        set
        {
            _coversheetLetterClosure1 = value;
        }
    }

    public string CoversheetLetterClosure2
    {
        get
        {
            return _coversheetLetterClosure2;
        }

        set
        {
            _coversheetLetterClosure2 = value;
        }
    }

    public string CoversheetLetterClosure3
    {
        get
        {
            return _coversheetLetterClosure3;
        }

        set
        {
            _coversheetLetterClosure3 = value;
        }
    }

    public string CoversheetLetterClosure4
    {
        get
        {
            return _coversheetLetterClosure4;
        }

        set
        {
            _coversheetLetterClosure4 = value;
        }
    }


    public string CoverLetterXmlFileName
    {
        get
        {
            return _coverletterxml;
        }

        set
        {
            _coverletterxml = value;
        }
    }

    public string AddressLabelPatientIds
    {
        get { return _addressLabelPatientIds; }
        set { _addressLabelPatientIds = value; }
    }


    public BaseLongitudinalControl()
    {
        //
        // TODO: Add constructor logic here
        //
    }

}
