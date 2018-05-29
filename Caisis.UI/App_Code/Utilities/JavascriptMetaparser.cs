using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for JavascriptMetaparser
/// </summary>
public class JavascriptMetaparser
{
    // F($x, 'a') -> Meta(this, function(x,y) { return F(x,y); }, '$x', '\'a\'');

    public static List<string> Parse(string s)
    {
        List<string> list = new List<string>();

        foreach (string p in s.Split(new char[] { ';' }))
        {
            string parsed = _Parse(p);
            if (parsed != null && parsed != "")
            {
                list.Add(parsed);
            }
        }

        return list;
    }

    private static string _Parse(string s)
    {
        int startIdx = s.IndexOf('(');
        int endIdx = s.LastIndexOf(')');

        if (startIdx == -1 || endIdx == -1)
        {
            return null;
        }

        StringBuilder functionBuilder = new StringBuilder();
        StringBuilder anonymousBuilder = new StringBuilder();
        StringBuilder wrappedBuilder = new StringBuilder();
        string anonymousParams = "";
        string wrappedParams = "";

        // grab the function name
        string functionName = s.Substring(0, startIdx).Trim();
        List<string> parameters;

        // split the params
        if (endIdx - startIdx > 1)
        {
            parameters = new List<string>(s.Substring(startIdx + 1, endIdx - startIdx - 1).Trim().Split(new char[] { ',' }));
        }
        else
        {
            parameters = new List<string>();
        }

        if (parameters.Count > 0)
        {
            for (int i = 0; i < parameters.Count; i++)
            {
                if (i > 0)
                {
                    anonymousBuilder.Append(",");
                    wrappedBuilder.Append(",");
                }

                anonymousBuilder.Append("x");
                anonymousBuilder.Append(i.ToString());

                wrappedBuilder.Append("'");

                // we need to escape any single qoutes
                wrappedBuilder.Append(parameters[i].Trim().Replace("'", @"\'"));

                wrappedBuilder.Append("'");
            }

            anonymousParams = anonymousBuilder.ToString();
            wrappedParams = wrappedBuilder.ToString();
        }

        // rewrite the function as an anonymous function
        functionBuilder.Append("Meta(this,function(");
        functionBuilder.Append(anonymousParams);
        functionBuilder.Append(") { ");
        functionBuilder.Append(functionName);
        functionBuilder.Append("(");
        functionBuilder.Append(anonymousParams);
        functionBuilder.Append("); }");

        if (wrappedParams.Length > 0)
        {
            functionBuilder.Append(",");
            functionBuilder.Append(wrappedParams);
        }

        functionBuilder.Append(");");

        return functionBuilder.ToString();
    }
}
