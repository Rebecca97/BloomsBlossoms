using BloomsandBlossomsCL;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;

namespace BloomsandBlossomsDL
{
    public class HotelDL
    {
        private ECGroupConnection _myConnection = new ECGroupConnection();

        #region constructor
        public HotelDL()
        {

        }
        #endregion
        public DataSet GetHotelArrangements(string categoryname, string subcategoryname)

        {
            DataSet ds = new DataSet();
            try
            {
                Database db = DatabaseFactory.CreateDatabase(_myConnection.DatabaseName);
                DbCommand dbCommand = db.GetStoredProcCommand("spGetArrangementInfo");
                dbCommand.Parameters.Clear();
                db.AddInParameter(dbCommand, "ArrangementCategoryDesc", DbType.String, categoryname);
                db.AddInParameter(dbCommand, "ArrangementSubCategoryDesc", DbType.String, subcategoryname);
                dbCommand.CommandTimeout = 300;
                ds = db.ExecuteDataSet(dbCommand);
            }
            catch (Exception ex)
            {
                ErrorLog.LogErrorMessageToDB("", "HotelDL.cs", "GetHotelArrangements", ex.Message.ToString(), _myConnection);
                throw;
            }
            return ds;
        }
    }
}
