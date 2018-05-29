using System;
using System.Collections.Generic;
using System.Collections;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for CSV
/// </summary>

namespace Caisis.DataAnalysis
{
    // reader/writer for CSV data
    public class CSV
    {
        static readonly char delim = GetDelimiter();

        /// <summary>
        /// Consume a csv file line-by-line.
        /// </summary>
        /// <param name="consumer">
        /// consumer should return true to continue reading,
        /// false to terminate consumption
        /// </param>
        public static void Consume(string filename, Func<IDictionary<string, string>, bool> consumer)
        {
            Consume(new StreamReader(filename), consumer);
        }

        public static void Consume(StreamReader sr, Func<IDictionary<string, string>, bool> consumer)
        {
            string line;
            List<string> headers = null;

            while ((line = sr.ReadLine()) != null)
            {
                string[] tokens = line.Split(delim);

                if (headers == null)
                {
                    headers = new List<string>(tokens.Select(s => HandleSimpleEscape(s)));
                }
                else
                {
                    Dictionary<string, string> fv = new Dictionary<string, string>();

                    for (int i = 0; i < tokens.Length; i++)
                        fv[headers[i]] = HandleSimpleEscape(tokens[i]);

                    if (!consumer(fv))
                        break;
                }
            }
        }

        public static DataTable Read(string filename)
        {
            return Read(new StreamReader(filename));
        }

        public static DataTable Read(StreamReader reader)
        {
            DataTable t = new DataTable();
            bool headersHandled = false;

            Func<IDictionary<string, string>, bool> f =
                record =>
                {
                    if (!headersHandled)
                    {
                        foreach (string k in record.Keys)
                            t.Columns.Add(k);

                        headersHandled = true;
                    }

                    DataRow r = t.NewRow();
                    foreach (string k in record.Keys)
                        r[k] = record[k];

                    t.Rows.Add(r);
                    return true;
                };

            Consume(reader, f);

            return t;
        }

        // return s[1:-1] if quoted, s otherwise
        private static string HandleSimpleEscape(string s)
        {
            int len = s.Length;

            if (len == 0 || !(s[0] == '"' && s[len - 1] == '"'))
                return s;
            else
                return s.Substring(1, len - 2);
        }

        // for writing, what kind of generic, enumerable interface can we accept?
        // the core function is a record-converter: ADO.Net "record" -> csv line

        public static void Write(IEnumerable datasource, string filename, IEnumerable<string> headers)
        {
            using (StreamWriter sw = new StreamWriter(filename))
            {
                if (headers != null && headers.Count() > 0)
                    sw.WriteLine(AsCSV(headers));

                foreach (object record in datasource)
                {
                    IEnumerable fields = record as IEnumerable;

                    if (fields == null)
                        continue;

                    sw.WriteLine(AsCSV(fields.Cast<object>().Select(x => x.ToString())));
                }
            }
        }

        public static void Write(IEnumerable datasource, IEnumerable<string> headers, TextWriter writer)
        {
            if (headers != null && headers.Count() > 0)
                writer.WriteLine(AsCSV(headers));

            foreach (object record in datasource)
            {
                IEnumerable fields = record as IEnumerable;

                if (fields == null)
                    continue;

                writer.WriteLine(AsCSV(fields.Cast<object>().Select(x => x.ToString())));
            }
        }

        public static void Write(DataTable data, TextWriter writer)
        {
            // headers
            var headers =
                from DataColumn c in data.Columns
                select c.ColumnName;

            if (headers.Count() > 0)
                writer.WriteLine(AsCSV(headers));

            // records
            foreach (var row in data.AsEnumerable())
            {
                writer.WriteLine(AsCSV(row.ItemArray.Select(x => x.ToString())));
            }
        }

        public static void Write(DataTable data, string filename)
        {
            using (StreamWriter sw = new StreamWriter(filename))
            {
                Write(data, sw);
            }
        }

        protected static string AsCSV(IEnumerable<string> fields)
        {
            // WARNING: we have to "escape" double-quotes, commas, and newlines!
            // QUESTION: can we use the locale to determine whether to use commas or semicolons?
            return string.Join(delim.ToString(), fields.Select(x => ProcessField(x)).ToArray());
        }

        protected static string ProcessField(string field)
        {
            #region reference, from http://en.wikipedia.org/wiki/Comma-separated_values
            /*
            CSV is a delimited data format that has fields/columns separated by 
            the comma character and records/rows terminated by newlines. 
            Fields that contain a special character (comma, newline, or double quote), must be enclosed in double quotes. 
            If a line contains a single entry which is the empty string, it may be enclosed in double quotes. 
            If a field's value contains a double quote character it is escaped by placing another double quote character next to it. 
            The CSV file format does not require a specific character encoding, byte order, or line terminator format.

            Each record is one line terminated by a line feed (ASCII/LF=0x0A) or a carriage return and line feed pair (ASCII/CRLF=0x0D 0x0A), however, line-breaks can be embedded.
            Fields are separated by commas. (In locales where the comma is used as a decimal separator, the semicolon is used instead as a delimiter. 
            The different delimiters cause problems when CSV files are exchanged, for example, between France and USA.)
            */
            #endregion

            StringBuilder b = new StringBuilder();
            bool escape = false;
            bool testnl = false;

            for (int i = 0; i < field.Length; i++)
            {
                char c = field[i];

                if (c == '"')
                {
                    b.Append('"');
                    escape = true;
                }
                else if (c == '\r')
                {
                    testnl = true;
                }
                else if ((testnl && c == '\n') || c == delim)
                {
                    escape = true;
                }

                b.Append(c);
            }

            // CLR BUG: new StringBuilder('"') will be initially empty
            if (escape)
                return new StringBuilder().Append('"').Append(b).Append('"').ToString();
            else
                return b.ToString();
        }

        private static char GetDelimiter()
        {
            if (CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator == ",")
                return ';';
            else
                return ',';
        }
    }
}
