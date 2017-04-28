using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace BloomsandBlossomsCL
{
    public static class ErrorLog
    {
        public static void LogErrorMessageToDB(string pageName, string className, string eventName, string errorMessage, ECGroupConnection _ecGroupConnection)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase(_ecGroupConnection.DatabaseName);
                string sqlCommand = "spAddLogErrorMessageToDB";
                DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
                db.AddInParameter(dbCommand, "PageName", DbType.String, pageName);
                db.AddInParameter(dbCommand, "ClassName", DbType.String, className);
                db.AddInParameter(dbCommand, "EventName", DbType.String, eventName);
                db.AddInParameter(dbCommand, "ErrorMessage", DbType.String,errorMessage);
                db.ExecuteNonQuery(dbCommand);
            }
            catch { }

        }
    }
}
