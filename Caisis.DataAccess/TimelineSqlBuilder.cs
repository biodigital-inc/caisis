using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Caisis.DataAccess
{
    /// <summary>
    /// Abstracts data access (sql) from TimelineServices, its client in Caisis.BusinessObject
    /// </summary>
    public class TimelineSqlBuilder
    {
        private StringBuilder buf = new StringBuilder();

        #region api
        public void DeclareDate(string name)
        {
            DeclareDate(name, buf);
        }

        public void DeclareInt(string name)
        {
            DeclareInt(name, buf);
        }

        public void DeclareString(string name)
        {
            DeclareString(name, buf);
        }

        public void DeclareBit(string name)
        {
            DeclareBit(name, buf);
        }

        public void Insert(string tablename, IEnumerable<string> columns)
        {
            buf.AppendLine(SqlBuilder.BuildParameterizedInsertStatement(tablename, columns, false, null));
            NewLine();
        }

        public void SetCurrentDate(string name)
        {
            SetVariable(name, "GETDATE()");
        }

        public void SetVariable(string name, object val)
        {
            SetVariable(name, val.ToString(), buf);
        }

        public void SetString(string name, string val)
        {
            SetVariable(name, string.Format("'{0}'", val), buf);
        }

        public void SetVariableToReturnedKey(string name)
        {
            SetVariableToReturnedKey(name, buf);
        }

        public void BuildCleanUpScript()
        {
            CleanUpRelatedRecords(buf);
        }

        public void Execute()
        {
            Connectivity.InsertBatch(new SqlCommand(buf.ToString()));
        }
        #endregion

        #region utilities, primitives
        // the following may belong in DataAccess.SqlBuilder

        private void CleanUpRelatedRecords(StringBuilder b)
        {
            b.AppendLine();
            b.Append(@" -- cleanup existing dependencies
            DELETE FROM  RelatedRecords
            WHERE RelatedRecordId IN
                (SELECT
	                rr.RelatedRecordId
                FROM ProtocolMgr_Timeline pt
                RIGHT OUTER JOIN RelatedRecords rr
                ON rr.SrcPrimaryKey = pt.TimelineId
                   AND rr.SrcTableName = 'ProtocolMgr_Timeline'
                   AND rr.DestTableName = 'ProtocolMgr_ItemTimeline'
                LEFT OUTER JOIN ProtocolMgr_ItemTimeline pit
                ON pit.ItemTimelineId = rr.DestPrimaryKey 
                WHERE
                    pt.ProtocolSchemaId = @ProtocolSchemaId
                    AND RelatedRecordId IS NOT NULL)");
            b.AppendLine();
        }

        private void DeclareVariable(string name, string type, StringBuilder b)
        {
            // DECLARE @[name] [type]
            b.Append("DECLARE @");
            b.Append(name);
            b.Append(" ");
            b.Append(type);
            b.AppendLine();
        }

        private void DeclareDate(string name, StringBuilder b)
        {
            DeclareVariable(name, "datetime", b);
        }

        private void DeclareInt(string name, StringBuilder b)
        {
            DeclareVariable(name, "int", b);
        }

        private void DeclareString(string name, StringBuilder b)
        {
            DeclareVariable(name, "varchar(50)", b);
        }

        private void DeclareBit(string name, StringBuilder b)
        {
            DeclareVariable(name, "bit", b);
        }

        private string SqlParam(string name)
        {
            return string.Format("@{0}", name);
        }

        private void NewLine()
        {
            buf.AppendLine();
        }

        private void SetVariable(string name, string val, StringBuilder b)
        {
            b.Append("SET @");
            b.Append(name);
            b.Append(" = ");
            b.Append(val);
            b.AppendLine();
        }

        private void SetVariableToReturnedKey(string name, StringBuilder b)
        {
            SetVariable(name, "CAST(scope_identity() AS int)", b);
        }
        #endregion
    }
}
